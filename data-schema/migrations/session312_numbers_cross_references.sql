-- =====================================================================
-- Session 312 — Numbers FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /Users/mtm/Desktop/App/data-schema/migrations/session312_numbers_cross_references.sql
-- =====================================================================

\echo 'session312 — Numbers cross-references starting...'
BEGIN;

-- ----- fragment: minion_numbers_1.sql (Numbers 1) -----
-- Book: Numbers   Chapter: 1   (the first census in the wilderness of Sinai)
-- Session prefix: s312   Tag: num01   Temp view: _s312_num01_lookup
-- Sort band base: 23500  step 3  (23500, 23503, 23506)
--
-- FRAMING: Numbers 1 is the census chapter — Yahuah commands Moses to take the
-- sum of the men of war from twenty years old by their tribes, "all that are
-- able to go forth to war in Yashar'el" (1:3). This is the army of Yahuah
-- ordered tribe by tribe, the two-house people mustered as a host. Two
-- framework threads are warranted (census of the men of war + the Levites set
-- apart from the war-roll for the sanctuary); a third numbering thread weaves
-- the ransom/no-plague law and the second census. We do NOT thread every tribe.
--
-- Numbers 1 coverage:
--   v.1-19  NT:     Revelation 7:4-8 (the sealed of the twelve tribes numbered) — threaded
--           Extras: none warranted (Jubilees tribe-order lists carry apparatus noise; skip)
--           Tanakh: Exodus 30:12 (ransom when thou takest the sum), Numbers 26:2 (second census) — threaded
--   v.20-46 NT:     Revelation 7:4 (folded into the census thread)
--           Extras: none warranted
--           Tanakh: Numbers 26 (the second census, folded above)
--   v.47-54 NT:     none warranted (Levitical guard has no single NT census echo; Heb 7 is priesthood not census)
--           Extras: none warranted
--           Tanakh: Numbers 3:9 (Levites wholly given to Aaron), Numbers 8:19 (Levites a gift, no plague) — threaded
--
-- THREADS:
--   numbers-1-take-the-sum-of-all-that-are-able-to-go-forth-to-war  (1:2-46)
--       libs: Tanakh (Exodus 30:12, Numbers 26:2) + NT (Revelation 7:4)   tier=free
--   numbers-1-the-numbering-a-ransom-that-there-be-no-plague        (1:2-3)
--       libs: Tanakh (Exodus 30:12) + Tanakh (Numbers 8:19)               tier=free
--   numbers-1-the-levites-not-numbered-set-over-the-tabernacle      (1:47-53)
--       libs: Tanakh (Numbers 3:9, Numbers 8:19)                          tier=free

-- A. Temp view
CREATE TEMP VIEW _s312_num01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- B. cross_references
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: take the sum of the men of war
    ('canon','numbers',1,2,'canon','exodus',30,12,'free',
      E'*When thou takest the sum of the children of Yashar''el (Israel) after their number, then shall they give every man a ransom for his soul unto Yahuah (LORD), when thou numberest them; that there be no plague among them, when thou numberest them.* (Exodus 30:12). The command of Numbers 1, *Take ye the sum of all the congregation of the children of Yashar''el (Israel)* (Numbers 1:2), is the carrying-out of the numbering-law Yahuah gave at Sinai — the sum is taken under the ransom, the soul ransomed so the muster brings no plague upon the host.'),
    ('canon','numbers',1,3,'canon','numbers',26,2,'free',
      E'*Take the sum of all the congregation of the children of Yashar''el (Israel), from twenty years old and upward, throughout their fathers'' house, all that are able to go to war in Yashar''el (Israel).* (Numbers 26:2). The first census, *From twenty years old and upward, all that are able to go forth to war in Yashar''el (Israel)* (Numbers 1:3), is matched word for word by the second census after the plague — the generation that fell in the wilderness numbered out, the next generation numbered in, the army of Yahuah counted again at the door of the land.'),
    ('canon','numbers',1,3,'canon','revelation',7,4,'free',
      E'*And I heard the number of them which were sealed: and there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel).* (Revelation 7:4). The wilderness muster — every able man numbered *by their tribes* (Numbers 1:3-16) — runs forward to the last numbering, the sealed of the twelve tribes counted twelve thousand by twelve thousand (Revelation 7:5-8). The army of Yahuah ordered tribe by tribe at Sinai is the same two-house people sealed in the foreheads at the end; the census is no dead arithmetic but the LORD knowing His host by name.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 2: the numbering, a ransom, that there be no plague
    ('canon','numbers',1,2,'canon','exodus',30,12,'free',
      E'*When thou takest the sum of the children of Yashar''el (Israel) after their number, then shall they give every man a ransom for his soul unto Yahuah (LORD), when thou numberest them; that there be no plague among them, when thou numberest them.* (Exodus 30:12). To number the people is a holy and a dangerous thing: the head counted must be a head ransomed. *Take ye the sum of all the congregation* (Numbers 1:2) is obeyed under this standing law — the half-shekel of the sanctuary atoning for the soul lest wrath break out in the very act of the count.'),
    ('canon','numbers',1,3,'canon','numbers',8,19,'free',
      E'*And I have given the Levites as a gift to Aaron and to his sons from among the children of Yashar''el (Israel), to do the service of the children of Yashar''el (Israel) in the tabernacle of the congregation, and to make an atonement for the children of Yashar''el (Israel): that there be no plague among the children of Yashar''el (Israel), when the children of Yashar''el (Israel) come nigh unto the sanctuary.* (Numbers 8:19). The same fear that guards the census — *that there be no plague* — guards the approach to the Presence: the men of war are ransomed in the numbering, and the Levites are given to stand between the host and the holy lest wrath fall when Yashar''el comes nigh.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 3: the Levites not numbered, set over the tabernacle
    ('canon','numbers',1,50,'canon','numbers',3,9,'free',
      E'*And thou shalt give the Levites unto Aaron and to his sons: they are wholly given unto him out of the children of Yashar''el (Israel).* (Numbers 3:9). The Levites are kept off the war-roll and put to the sanctuary instead: *thou shalt appoint the Levites over the tabernacle of testimony... they shall bear the tabernacle... and shall encamp round about the tabernacle* (Numbers 1:50). They are wholly given to Aaron to keep the charge of the holy things — a tribe set apart for the Presence, not for the battle line.'),
    ('canon','numbers',1,53,'canon','numbers',8,19,'free',
      E'*And I have given the Levites as a gift to Aaron and to his sons from among the children of Yashar''el (Israel)... to make an atonement for the children of Yashar''el (Israel): that there be no plague among the children of Yashar''el (Israel), when the children of Yashar''el (Israel) come nigh unto the sanctuary.* (Numbers 8:19). The reason the Levites *shall pitch round about the tabernacle of testimony* is named in 1:53: *that there be no wrath upon the congregation of the children of Yashar''el (Israel)*. The Levitical ring is the priestly guard around the Glory — the buffer of mercy that keeps the camp alive in the presence of the holy.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- C. threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-1-take-the-sum-of-all-that-are-able-to-go-forth-to-war',
       E'Take ye the sum — all that are able to go forth to war in Yashar''el',
       E'Yahuah commands Moses in the wilderness of Sinai: *Take ye the sum of all the congregation of the children of Yashar''el (Israel), after their families, by the house of their fathers, with the number of their names, every male by their polls* (Numbers 1:2), *From twenty years old and upward, all that are able to go forth to war in Yashar''el (Israel)* (Numbers 1:3). This is no bare headcount — it is the mustering of the army of Yahuah, the two-house people ordered tribe by tribe, each tribe with its named prince (Numbers 1:5-16), the whole host *six hundred thousand and three thousand and five hundred and fifty* (Numbers 1:46).\n\nThe census is taken under the standing numbering-law of Sinai: *When thou takest the sum of the children of Yashar''el (Israel) after their number, then shall they give every man a ransom for his soul unto Yahuah (LORD), when thou numberest them; that there be no plague among them* (Exodus 30:12) — every head counted is a head ransomed. And it is the first of two musters: the same words, *all that are able to go to war in Yashar''el (Israel)* (Numbers 26:2), count the next generation at the edge of the land after the wilderness generation has fallen.\n\nThe muster runs forward to the last numbering. *And I heard the number of them which were sealed: and there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel)* (Revelation 7:4) — counted twelve thousand by twelve thousand, tribe by tribe (Revelation 7:5-8). The army ordered at Sinai is the same people sealed in the foreheads at the end. Yahuah numbers His host because He knows His own by name.',
       sv.verse_id, ev.verse_id, 'free', 23500
  FROM _s312_num01_lookup sv, _s312_num01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=1 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-1-the-numbering-a-ransom-that-there-be-no-plague',
       E'The numbering — a ransom, that there be no plague',
       E'To number the people is a holy and a perilous act. When Moses is told *Take ye the sum of all the congregation* (Numbers 1:2) and to count *all that are able to go forth to war* (Numbers 1:3), it is done under the law given at Sinai: *When thou takest the sum of the children of Yashar''el (Israel) after their number, then shall they give every man a ransom for his soul unto Yahuah (LORD), when thou numberest them; that there be no plague among them, when thou numberest them* (Exodus 30:12). The half-shekel of the sanctuary atones for the soul of every man counted — the head numbered must be a head ransomed, lest wrath break out in the very act of the count.\n\nThe same fear runs through the chapter. The Levites are given to the sanctuary for exactly this reason: *to make an atonement for the children of Yashar''el (Israel): that there be no plague among the children of Yashar''el (Israel), when the children of Yashar''el (Israel) come nigh unto the sanctuary* (Numbers 8:19). The census and the camp alike are kept alive by atonement — Yahuah is holy, and to draw near Him, whether to be counted or to come nigh the Presence, costs a ransom.',
       sv.verse_id, ev.verse_id, 'free', 23503
  FROM _s312_num01_lookup sv, _s312_num01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-1-the-levites-not-numbered-set-over-the-tabernacle',
       E'The Levites not numbered for war — set over the tabernacle',
       E'When the army is mustered, one tribe is deliberately left off the war-roll: *But the Levites after the tribe of their fathers were not numbered among them* (Numbers 1:47). Yahuah says, *Only thou shalt not number the tribe of Levi, neither take the sum of them among the children of Yashar''el (Israel)* (Numbers 1:49). Instead they are given a different charge: *But thou shalt appoint the Levites over the tabernacle of testimony, and over all the vessels thereof... they shall bear the tabernacle... and shall encamp round about the tabernacle* (Numbers 1:50).\n\nThis is the tribe wholly given to the Presence rather than to the battle: *And thou shalt give the Levites unto Aaron and to his sons: they are wholly given unto him out of the children of Yashar''el (Israel)* (Numbers 3:9). And the purpose of their ring around the tent is named: *But the Levites shall pitch round about the tabernacle of testimony, that there be no wrath upon the congregation of the children of Yashar''el (Israel)* (Numbers 1:53) — *to make an atonement for the children of Yashar''el (Israel): that there be no plague among the children of Yashar''el (Israel), when the children of Yashar''el (Israel) come nigh unto the sanctuary* (Numbers 8:19). The Levitical guard is the buffer of mercy around the Glory, keeping the camp of Yashar''el alive in the presence of the holy.',
       sv.verse_id, ev.verse_id, 'free', 23506
  FROM _s312_num01_lookup sv, _s312_num01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=47
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=1 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

-- D. thread_members
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When thou takest the sum of the children of Yashar''el (Israel)... then shall they give every man a ransom for his soul unto Yahuah (LORD)... that there be no plague among them* (Exodus 30:12) — the census of 1:2 obeyed under the Sinai numbering-law, every head counted a head ransomed.'
  FROM cross_reference_threads t
  JOIN _s312_num01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s312_num01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-1-take-the-sum-of-all-that-are-able-to-go-forth-to-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Take the sum of all the congregation of the children of Yashar''el (Israel), from twenty years old and upward... all that are able to go to war* (Numbers 26:2) — the second census matches 1:3 word for word: the fallen generation numbered out, the next numbered in.'
  FROM cross_reference_threads t
  JOIN _s312_num01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s312_num01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-1-take-the-sum-of-all-that-are-able-to-go-forth-to-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And I heard the number of them which were sealed: and there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel)* (Revelation 7:4) — the wilderness muster by tribes runs forward to the last numbering, the two-house people sealed twelve thousand by twelve thousand.'
  FROM cross_reference_threads t
  JOIN _s312_num01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s312_num01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-1-take-the-sum-of-all-that-are-able-to-go-forth-to-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When thou takest the sum of the children of Yashar''el (Israel)... then shall they give every man a ransom for his soul unto Yahuah (LORD)... that there be no plague among them* (Exodus 30:12) — the head counted must be a head ransomed; the half-shekel atones for the soul in the very act of the count.'
  FROM cross_reference_threads t
  JOIN _s312_num01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s312_num01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-1-the-numbering-a-ransom-that-there-be-no-plague'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...to make an atonement for the children of Yashar''el (Israel): that there be no plague... when the children of Yashar''el (Israel) come nigh unto the sanctuary* (Numbers 8:19) — the same dread that guards the census guards the approach to the Presence; atonement keeps the host alive.'
  FROM cross_reference_threads t
  JOIN _s312_num01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s312_num01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=8 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-1-the-numbering-a-ransom-that-there-be-no-plague'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And thou shalt give the Levites unto Aaron and to his sons: they are wholly given unto him out of the children of Yashar''el (Israel)* (Numbers 3:9) — the tribe kept off the war-roll (1:50) and wholly given to the sanctuary instead.'
  FROM cross_reference_threads t
  JOIN _s312_num01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=50
  JOIN _s312_num01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-1-the-levites-not-numbered-set-over-the-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...to make an atonement for the children of Yashar''el (Israel): that there be no plague... when the children of Yashar''el (Israel) come nigh unto the sanctuary* (Numbers 8:19) — names the purpose of the Levites pitching round about (1:53): *that there be no wrath upon the congregation*. The priestly guard around the Glory.'
  FROM cross_reference_threads t
  JOIN _s312_num01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=1 AND sv.verse_number=53
  JOIN _s312_num01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=8 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-1-the-levites-not-numbered-set-over-the-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_2.sql (Numbers 2) -----
-- Book: Numbers  Chapter: 2 (the camp arrangement — every tribe by its standard around the tabernacle)
-- Tag: num02   Session prefix: s312   Sort band: 23525 (step 3 per thread)
-- Temp view: _s312_num02_lookup
--
-- Numbers 2 coverage:
--   v.1-2 (every man by his own standard, the ensign of his father's house, far off about the tabernacle):
--        NT:     Revelation 21:12, 21:13 (the twelve gates, three on each side, named for the twelve tribes) — woven
--        Extras: none warranted (the canon two-house witnesses carry it)
--        Tanakh: Numbers 24:2, 24:5 (Balaam sees Yashar'el abiding in tents according to their tribes, "How goodly are thy tents") — woven
--   v.3-31 (the four camps by standard — Yahudah east and first, Reuben south, Ephraim west, Dan north, the tabernacle in the midst):
--        NT:     Revelation 5:5 (the Lion of the tribe of Yahudah hath prevailed) — woven
--        Extras: none warranted
--        Tanakh: Genesis 49:10 (the sceptre shall not depart from Yahudah), Numbers 10:14 (Yahudah first in the march) — woven
--   v.17 (the tabernacle with the Levites in the MIDST of the camp):
--        NT:     Revelation 21:3 (the tabernacle of Elohim is with men, he will dwell with them) — woven
--        Extras: none warranted
--        Tanakh: Exodus 25:8 (let them make me a sanctuary, that I may dwell among them), Ezekiel 48:35 (Yahuah Shammah, The LORD is there) — woven
--
-- Threads:
--   numbers-2-every-man-by-his-own-standard-the-ordered-camp-around-the-tabernacle   (free) [Tanakh + NT]  band 23525
--   numbers-2-yahudah-leads-on-the-east-the-sceptre-tribe-before-the-presence        (free) [Tanakh + NT]  band 23528
--   numbers-2-the-tabernacle-in-the-midst-yahuah-dwelling-among-his-people           (free) [Tanakh + NT]  band 23531
--
-- Framework notes: 2:1-2 the ordered camp = the covenant people pitched by tribe and father's house
--   around the Presence — the shape Balaam blesses (Num 24) and the New Jerusalem keeps (Rev 21 gates by
--   the twelve tribes), never replaced. 2:3-31 Yahudah leads east and first = the sceptre tribe before the
--   Presence (Gen 49:10, Num 10:14, the Lion of Yahudah Rev 5:5). 2:17 the tabernacle in the MIDST =
--   Yahuah dwelling in the centre of his people, the trajectory from Exod 25:8 ("that I may dwell among them")
--   through Ezek 48:35 (Yahuah Shammah) to Rev 21:3 (the tabernacle of Elohim is with men) — the Formed Son
--   in the centre of the ordered tribes.

CREATE TEMP VIEW _s312_num02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================= cross_references =============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: every man by his own standard, the ordered camp (2:1-2)
    ('canon','numbers',2,2,'canon','numbers',24,2,'free',
      E'*And Balaam lifted up his eyes, and he saw Yashar''el (Israel) abiding in his tents according to their tribes; and the spirit of Elohim (God) came upon him.* (Numbers 24:2). What Yahuah commands here — *Every man of the children of Yashar''el (Israel) shall pitch by his own standard, with the ensign of their father''s house* (Numbers 2:2) — is exactly what Balaam later beholds from the heights: the people set out *according to their tribes*, an order so beautiful that even the hired prophet cannot curse it.'),
    ('canon','numbers',2,2,'canon','numbers',24,5,'free',
      E'*How goodly are thy tents, O Jacob, and thy tabernacles, O Yashar''el (Israel)!* (Numbers 24:5). The blessing falls on the very arrangement decreed in this chapter — each tribe *by his own standard... far off about the tabernacle of the congregation* (Numbers 2:2); the ordered camp around the Presence is what makes the tents *goodly* in the sight of the seer who came to curse.'),
    ('canon','numbers',2,2,'canon','revelation',21,12,'free',
      E'*And had a wall great and high, and had twelve gates, and at the gates twelve angels, and names written thereon, which are the names of the twelve tribes of the children of Yashar''el (Israel):* (Revelation 21:12). The pattern of the wilderness camp — the twelve tribes ranged each by its *standard, with the ensign of their father''s house* (Numbers 2:2) — is carried all the way to the New Jerusalem, whose very gates bear the names of the twelve tribes; the ordered people around the dwelling of Elohim, never replaced.'),
    ('canon','numbers',2,2,'canon','revelation',21,13,'free',
      E'*On the east three gates; on the north three gates; on the south three gates; and on the west three gates.* (Revelation 21:13). The four sides of the wilderness camp — Yahudah east, Reuben south, Ephraim west, Dan north, each *by his own standard* (Numbers 2:2) — become the four-square city with three gates to a side; the same twelve-tribe ensign laid out around the Presence at the consummation.'),

    -- THREAD 2: Yahudah leads on the east, the sceptre tribe (2:3-9, 2:31)
    ('canon','numbers',2,3,'canon','genesis',49,10,'free',
      E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10). Jacob''s dying word is why Yahudah is set first — *on the east side toward the rising of the sun shall they of the standard of the camp of Yahudah (Judah) pitch* (Numbers 2:3); the sceptre-tribe takes the place of precedence, leading the camp toward the sunrise.'),
    ('canon','numbers',2,9,'canon','numbers',10,14,'free',
      E'*In the first place went the standard of the camp of the children of Yahudah (Judah) according to their armies: and over his host was Nahshon the son of Amminadab.* (Numbers 10:14). The order decreed here — *All that were numbered in the camp of Yahudah (Judah)... These shall first set forth* (Numbers 2:9) — is exactly what comes to pass when the cloud lifts: Yahudah, under Nahshon, marches at the head of all the tribes.'),
    ('canon','numbers',2,3,'canon','revelation',5,5,'free',
      E'*And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* (Revelation 5:5). The tribe set first toward the rising sun — *the standard of the camp of Yahudah (Judah)* (Numbers 2:3) — brings forth the Lion of the tribe of Yahudah himself; the precedence given the sceptre-tribe in the camp is fulfilled in the One who prevails, the Formed Son who is the Root of David.'),

    -- THREAD 3: the tabernacle in the midst, Yahuah dwelling among his people (2:17)
    ('canon','numbers',2,17,'canon','exodus',25,8,'free',
      E'*And let them make me a sanctuary; that I may dwell among them.* (Exodus 25:8). The whole reason the tabernacle is borne *in the midst of the camp* (Numbers 2:17) is given here: Yahuah purposed to dwell among his people. The ordered tribes are arrayed around a centre, and the centre is the dwelling of Elohim.'),
    ('canon','numbers',2,17,'canon','ezekiel',48,35,'free',
      E'*It was round about eighteen thousand measures: and the name of the city from that day shall be, Yahuah Shammah (The LORD is there).* (Ezekiel 48:35). The pattern of the wilderness — the tabernacle *in the midst of the camp* (Numbers 2:17), the tribes ranged about it — reaches its end in the restored city whose very name is "Yahuah is there"; the Presence in the centre of the tribes, from the desert to the consummation.'),
    ('canon','numbers',2,17,'canon','revelation',21,3,'free',
      E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* (Revelation 21:3). The tabernacle set *in the midst of the camp* (Numbers 2:17) is the seed of the final word of the canon: Elohim dwelling in the midst of his people. The wilderness arrangement is the type; "the tabernacle of Elohim is with men" is the fulfilment.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================= threads =============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-2-every-man-by-his-own-standard-the-ordered-camp-around-the-tabernacle',
  E'Every Man by His Own Standard — the Ordered Camp Around the Tabernacle',
  E'Yahuah does not leave the wilderness people a formless multitude. *Every man of the children of Yashar''el (Israel) shall pitch by his own standard, with the ensign of their father''s house: far off about the tabernacle of the congregation shall they pitch* (Numbers 2:2). Each tribe takes its appointed station, under its own banner, around the dwelling of Elohim — the covenant people given a shape, ranged by father''s house about the Presence. This is the very order Balaam later sees from the heights and cannot curse: *Balaam lifted up his eyes, and he saw Yashar''el (Israel) abiding in his tents according to their tribes* (Numbers 24:2), and the word breaks from him, *How goodly are thy tents, O Jacob, and thy tabernacles, O Yashar''el (Israel)!* (Numbers 24:5). The beauty he blesses is the tribe-by-tribe arrangement decreed here. And the pattern is not buried in the desert: it is carried to the consummation, where the holy city has *twelve gates... names written thereon, which are the names of the twelve tribes of the children of Yashar''el (Israel)* (Revelation 21:12), laid four-square — *On the east three gates; on the north three gates; on the south three gates; and on the west three gates* (Revelation 21:13) — the same twelve-tribe ensign on four sides around the dwelling of Elohim. The camp is the city in seed. The whole people, both houses, ordered around the Presence — never replaced, only gathered home.',
  sv.verse_id, ev.verse_id, 'free', 23525
  FROM _s312_num02_lookup sv, _s312_num02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-2-yahudah-leads-on-the-east-the-sceptre-tribe-before-the-presence',
  E'Yahudah Leads on the East — the Sceptre Tribe Before the Presence',
  E'When the four camps are set, the place of precedence falls to Yahudah (Judah): *on the east side toward the rising of the sun shall they of the standard of the camp of Yahudah (Judah) pitch throughout their armies* (Numbers 2:3), and of his great camp it is written, *These shall first set forth* (Numbers 2:9). Reuben pitches south, Ephraim west, Dan north — but Yahudah goes first, toward the sunrise. This is no accident of arrangement; it is Jacob''s dying word taking flesh in the camp: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The sceptre-tribe leads. And when the cloud lifts the order holds exactly: *In the first place went the standard of the camp of the children of Yahudah (Judah) according to their armies: and over his host was Nahshon the son of Amminadab* (Numbers 10:14). The precedence given Yahudah in the wilderness runs all the way to the throne-room of heaven, where the elder declares, *behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book* (Revelation 5:5). The tribe set first toward the rising sun brings forth the One who prevails — the Formed Son, the Lion of Yahudah, before whom the gathering of the people is.',
  sv.verse_id, ev.verse_id, 'free', 23528
  FROM _s312_num02_lookup sv, _s312_num02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=2 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-2-the-tabernacle-in-the-midst-yahuah-dwelling-among-his-people',
  E'The Tabernacle in the Midst — Yahuah Dwelling Among His People',
  E'At the centre of the ordered camp stands the dwelling of Elohim: *Then the tabernacle of the congregation shall set forward with the camp of the Levites in the midst of the camp: as they encamp, so shall they set forward, every man in his place by their standards* (Numbers 2:17). The tribes are not arranged around an empty centre — they are arranged around the Presence. This is the purpose Yahuah named when the tabernacle was first commanded: *And let them make me a sanctuary; that I may dwell among them* (Exodus 25:8). The whole point of the camp is the One in its midst. And that centre is the trajectory of the entire canon. It runs forward to the restored city whose name is the promise itself — *the name of the city from that day shall be, Yahuah Shammah (The LORD is there)* (Ezekiel 48:35) — and it reaches its consummation in the final vision: *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The Levites bearing the tent in the midst of the desert camp are the first picture of Elohim dwelling among his people; the New Jerusalem is the last. From the wilderness to the end, Yahuah in the centre of the ordered tribes.',
  sv.verse_id, ev.verse_id, 'free', 23531
  FROM _s312_num02_lookup sv, _s312_num02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ============================= thread_members =============================
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Balaam... saw Yashar''el (Israel) abiding in his tents according to their tribes* (Numbers 24:2) — the very tribe-order decreed here is what the seer beholds and cannot curse.'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-every-man-by-his-own-standard-the-ordered-camp-around-the-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*How goodly are thy tents, O Jacob, and thy tabernacles, O Yashar''el (Israel)!* (Numbers 24:5) — the blessing falls on the ordered camp around the Presence decreed in this chapter.'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-every-man-by-his-own-standard-the-ordered-camp-around-the-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*twelve gates... names written thereon, which are the names of the twelve tribes of the children of Yashar''el (Israel)* (Revelation 21:12) — the wilderness ensign carried to the New Jerusalem, never replaced.'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-every-man-by-his-own-standard-the-ordered-camp-around-the-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*On the east three gates; on the north three gates; on the south three gates; and on the west three gates* (Revelation 21:13) — the four sides of the camp become the four-square city, three gates a side.'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-every-man-by-his-own-standard-the-ordered-camp-around-the-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The sceptre shall not depart from Yahudah (Judah)... until Shiloh come* (Genesis 49:10) — Jacob''s dying word is why the sceptre-tribe pitches first, toward the sunrise.'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-yahudah-leads-on-the-east-the-sceptre-tribe-before-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*In the first place went the standard of the camp of the children of Yahudah (Judah)... Nahshon the son of Amminadab* (Numbers 10:14) — the order decreed here comes to pass when the cloud lifts: Yahudah marches at the head.'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-yahudah-leads-on-the-east-the-sceptre-tribe-before-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*behold, the Lion of the tribe of Juda, the Root of David, hath prevailed* (Revelation 5:5) — the tribe set first toward the rising sun brings forth the One who prevails, the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-yahudah-leads-on-the-east-the-sceptre-tribe-before-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And let them make me a sanctuary; that I may dwell among them* (Exodus 25:8) — the purpose of the tabernacle borne in the midst of the camp: Yahuah dwelling among his people.'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-the-tabernacle-in-the-midst-yahuah-dwelling-among-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the name of the city from that day shall be, Yahuah Shammah (The LORD is there)* (Ezekiel 48:35) — the Presence in the midst of the camp reaches its end in the city whose name is "Yahuah is there".'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=48 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-the-tabernacle-in-the-midst-yahuah-dwelling-among-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them* (Revelation 21:3) — the tabernacle in the midst of the camp is the seed of the canon''s final word: Elohim dwelling among his people.'
  FROM cross_reference_threads t
  JOIN _s312_num02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s312_num02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-2-the-tabernacle-in-the-midst-yahuah-dwelling-among-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_3.sql (Numbers 3) -----
-- Book: Numbers  Chapter: 3  Tag: num03  Session: s312
-- Sort band base: 23550  step: 3  (23550, 23553, 23556, 23559)
-- Temp view: _s312_num03_lookup
--
-- THEME OF THE CHAPTER: The Levites set apart for the service of the tabernacle and
-- taken INSTEAD OF the firstborn of Yashar'el; the firstborn belong to Yahuah (hallowed
-- since the night the firstborn of Egypt were smitten), and the surplus firstborn are
-- redeemed with five shekels each. The ordered priesthood, the guarded sanctuary,
-- the substitution and redemption of the firstborn.
--
-- Numbers 3 coverage:
--   v.1-4   (sons of Aaron; Nadab and Abihu died offering strange fire)
--           NT:     none warranted (Lev 10 narrative is the immediate referent)
--           Extras: none warranted
--           Tanakh: Leviticus 10:1-2 (the strange fire that devoured them) -> THREAD 1
--   v.5-10  (the tribe of Levi given to Aaron for the service; the stranger that cometh nigh dies)
--           NT:     Hebrews 5:4 (no man taketh this honour but he that is called of Elohim, as was Aaron) -> THREAD 2
--           Extras: Jubilees 32:1-3 (Levi ordained priest of the Most High; falls to the portion of Yahuah) -> THREAD 2
--           Tanakh: Numbers 18:6-7 (the Levites given as a gift; the priest's office a service of gift) -> THREAD 2
--   v.11-13 (the Levites taken INSTEAD OF all the firstborn; all the firstborn are mine since Egypt)
--   v.45    (take the Levites instead of all the firstborn; the Levites shall be mine)
--           NT:     Luke 2:23 (every male that openeth the womb shall be called holy); Hebrews 12:23 (the assembly of the firstborn written in heaven) -> THREAD 3
--           Extras: none warranted
--           Tanakh: Exodus 13:2,12,15 (sanctify all the firstborn; the firstborn slain in Egypt) -> THREAD 3
--   v.14-39 (the Levite families Gershon, Kohath, Merari and their charges around the tabernacle)
--           NT:     none warranted
--           Extras: none warranted
--           Tanakh: Numbers 4 (the ordered service and burdens of each family) -> THREAD 2 (member, 3:38) framed there; chiefly narrative census
--   v.40-51 (number the firstborn; redeem the 273 surplus with five shekels apiece)
--           NT:     Luke 2:24 (a pair of turtledoves, the offering of redemption presented) -> THREAD 4
--           Extras: none warranted
--           Tanakh: Exodus 13:13 (the firstborn of man shalt thou redeem); Numbers 18:15-16 (the firstborn redeemed for five shekels) -> THREAD 4
--
-- THREADS:
--   1. numbers-3-strange-fire-nadab-and-abihu               (free)  -> Leviticus 10:1-2
--   2. numbers-3-the-tribe-of-levi-given-to-the-priesthood  (extras)-> Numbers 18:6-7 + Numbers 4:4 + Hebrews 5:4 + Jubilees 32:1,3
--   3. numbers-3-the-levites-instead-of-the-firstborn        (free)  -> Exodus 13:2,12,15 + Luke 2:23 + Hebrews 12:23
--   4. numbers-3-the-redemption-of-the-firstborn             (free)  -> Exodus 13:13 + Numbers 18:15,16 + Luke 2:24
--
-- Framework-load-bearing: 3:12-13 the substitution of the Levites for the firstborn read FORWARD
-- to Luke 2:23 (the firstborn Messiah presented as holy to Yahuah) and Hebrews 12:23 (the
-- assembly of the firstborn) -- the firstborn that belong to Yahuah, redeemed. Hebrews 5:4 keeps
-- the priesthood a CALLED office (as was Aaron), never self-taken; Jubilees 32 carries the same
-- election of Levi to Yahuah's portion. Torah-affirmed throughout: the redemption price stands
-- (Exod 13 / Num 18), the calendar of the priesthood stands.

CREATE TEMP VIEW _s312_num03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: strange fire (3:4 -> Leviticus 10:1-2)
    ('canon','numbers',3,4,'canon','leviticus',10,1,'free',
     E'*And Nadab and Abihu, the sons of Aaron, took either of them his censer, and put fire therein, and put incense thereon, and offered strange fire before Yahuah (LORD), which he commanded them not.* (Leviticus 10:1). Numbers 3 names the dead at the head of the priestly roll -- *And Nadab and Abihu died before Yahuah (LORD), when they offered strange fire before Yahuah (LORD)* (Numbers 3:4); the lateral pulls the account itself, the worship that Yahuah *commanded them not*.'),
    ('canon','numbers',3,4,'canon','leviticus',10,2,'free',
     E'*And there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD).* (Leviticus 10:2). This is the death recorded in Numbers 3:4, *Nadab and Abihu died before Yahuah (LORD)... in the wilderness of Sinai, and they had no children*; the priesthood is guarded by fire, and the line passes to *Eleazar and Ithamar* who ministered in their stead.'),
    -- THREAD 2: the tribe of Levi given to the priesthood (3:9 / 3:7 / 3:38 -> Num 18, Num 4, Heb 5, Jub 32)
    ('canon','numbers',3,9,'canon','numbers',18,6,'free',
     E'*And I, behold, I have taken your brethren the Levites from among the children of Yashar''el (Israel): to you they are given as a gift for Yahuah (LORD), to do the service of the tabernacle of the congregation.* (Numbers 18:6). The gift named in Numbers 3:9 -- *thou shalt give the Levites unto Aaron and to his sons: they are wholly given unto him out of the children of Yashar''el (Israel)* -- is sealed in chapter 18: the Levites a gift FOR Yahuah, for the service of the tabernacle.'),
    ('canon','numbers',3,10,'canon','numbers',18,7,'free',
     E'*Therefore thou and thy sons with thee shall keep your priest''s office for every thing of the altar, and within the vail; and ye shall serve: I have given your priest''s office unto you as a service of gift: and the stranger that cometh nigh shall be put to death.* (Numbers 18:7). Word for word the guard of Numbers 3:10 -- *thou shalt appoint Aaron and his sons, and they shall wait on their priest''s office: and the stranger that cometh nigh shall be put to death* -- the priesthood a gift, and the holy place guarded against the unconsecrated.'),
    ('canon','numbers',3,38,'canon','numbers',4,4,'free',
     E'*This shall be the service of the sons of Kohath in the tabernacle of the congregation, about the most holy things:* (Numbers 4:4). Numbers 3 stations the families and sets *Moses, and Aaron and his sons, keeping the charge of the sanctuary* toward the east (Numbers 3:38); chapter 4 details the burdens of each house, the ordered service that the census of chapter 3 enrolls.'),
    ('canon','numbers',3,10,'canon','hebrews',5,4,'free',
     E'*And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron.* (Hebrews 5:4). The priesthood appointed in Numbers 3:10 -- *thou shalt appoint Aaron and his sons, and they shall wait on their priest''s office* -- is never self-taken; Hebrews reaches back to *Aaron* as the pattern: the office is a calling of Elohim, which is why the stranger that cometh nigh is put to death.'),
    ('canon','numbers',3,6,'jubilees','jubilees',32,1,'extras',
     E'*And he abode that night at Bethel, and Levi dreamed that they had ordained and made him the priest of the El Elyon (Most High) Elohim (God), him and his sons for ever; and he awoke from his sleep and blessed Yahuah (God).* (Jubilees 32:1). Before Sinai ever set the tribe apart, the restored witness shows Levi himself ordained priest of the Most High *for ever*; Numbers 3:6 only brings near what was already given -- *Bring the tribe of Levi near, and present them before Aaron the priest, that they may minister unto him.*'),
    ('canon','numbers',3,9,'jubilees','jubilees',32,3,'extras',
     E'*And Jacob counted his sons from him upwards and Levi fell to the portion of Yahuah (God), and his father clothed him in the garments of the priesthood and filled his hands.* (Jubilees 32:3). *Levi fell to the portion of Yahuah* -- the same wholly-given separation of Numbers 3:9, *they are wholly given unto him out of the children of Yashar''el (Israel)*: Levi is Yahuah''s portion, clothed and consecrated for the sanctuary.'),
    -- THREAD 3: the Levites instead of the firstborn (3:13 / 3:12 / 3:45 -> Exod 13, Luke 2, Heb 12)
    ('canon','numbers',3,13,'canon','exodus',13,2,'free',
     E'*Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Yashar''el (Israel), both of man and of beast: it is mine.* (Exodus 13:2). The claim Numbers 3:13 grounds -- *all the firstborn are mine... mine shall they be: I am Yahuah (LORD)* -- was spoken the moment Yahuah brought them out: every firstborn that openeth the womb belongs to him.'),
    ('canon','numbers',3,12,'canon','exodus',13,12,'free',
     E'*That thou shalt set apart unto Yahuah (LORD) all that openeth the matrix, and every firstling that cometh of a beast which thou hast; the males shall be the LORD''S.* (Exodus 13:12). Numbers 3:12 substitutes the Levites *instead of all the firstborn that openeth the matrix among the children of Yashar''el (Israel)*; the very phrase of Exodus -- *all that openeth the matrix* -- is the claim the Levites now answer for.'),
    ('canon','numbers',3,13,'canon','exodus',13,15,'free',
     E'*And it came to pass, when Pharaoh would hardly let us go, that Yahuah (LORD) slew all the firstborn in the land of Egypt, both the firstborn of man, and the firstborn of beast: therefore I sacrifice to Yahuah (LORD) all that openeth the matrix, being males; but all the firstborn of my children I redeem.* (Exodus 13:15). Numbers 3:13 names this very night -- *on the day that I smote all the firstborn in the land of Egypt I hallowed unto me all the firstborn in Yashar''el (Israel)*: the firstborn of Yashar''el are Yahuah''s because his judgment passed over them.'),
    ('canon','numbers',3,13,'canon','luke',2,23,'free',
     E'*(As it is written in the law of Yahuah (Lord), Every male that openeth the womb shall be called holy to Yahuah (Lord);)* (Luke 2:23). The firstborn Messiah is brought up to be presented as the law of this chapter requires -- *all the firstborn are mine* (Numbers 3:13); the Formed Son himself, the firstborn that openeth the womb, is called holy to Yahuah.'),
    ('canon','numbers',3,12,'canon','hebrews',12,23,'free',
     E'*To the general assembly and church of the firstborn, which are written in heaven, and to Elohim (God) the Judge of all, and to the spirits of just men made perfect,* (Hebrews 12:23). The Levites taken *instead of all the firstborn* (Numbers 3:12) foreshadow the gathered *assembly... of the firstborn* -- the redeemed people who belong wholly to Yahuah, set apart out of all the rest.'),
    ('canon','numbers',3,45,'canon','exodus',13,2,'free',
     E'*Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Yashar''el (Israel), both of man and of beast: it is mine.* (Exodus 13:2). Numbers 3:45 enacts the exchange -- *Take the Levites instead of all the firstborn among the children of Yashar''el (Israel)... and the Levites shall be mine: I am Yahuah (LORD)*; the firstborn claimed in Exodus are now answered for by the tribe given in their place.'),
    -- THREAD 4: the redemption of the firstborn (3:46-51 -> Exod 13, Num 18, Luke 2)
    ('canon','numbers',3,46,'canon','exodus',13,13,'free',
     E'*And every firstling of an ass thou shalt redeem with a lamb; and if thou wilt not redeem it, then thou shalt break his neck: and all the firstborn of man among thy children shalt thou redeem.* (Exodus 13:13). The surplus firstborn of Numbers 3:46 -- *those that are to be redeemed of the two hundred and threescore and thirteen of the firstborn* -- are redeemed under the very statute of Exodus: *all the firstborn of man... shalt thou redeem.*'),
    ('canon','numbers',3,47,'canon','numbers',18,16,'free',
     E'*And those that are to be redeemed from a month old shalt thou redeem, according to thine estimation, for the money of five shekels, after the shekel of the sanctuary, which is twenty gerahs.* (Numbers 18:16). The price set in Numbers 3:47 -- *Thou shalt even take five shekels apiece by the poll, after the shekel of the sanctuary* -- is fixed as standing law in chapter 18: five shekels, the redemption of every firstborn.'),
    ('canon','numbers',3,47,'canon','numbers',18,15,'free',
     E'*Every thing that openeth the matrix in all flesh, which they bring unto Yahuah (LORD), whether it be of men or beasts, shall be thine: nevertheless the firstborn of man shalt thou surely redeem, and the firstling of unclean beasts shalt thou redeem.* (Numbers 18:15). The redemption money of Numbers 3:47-48 belongs to the priests; chapter 18 confirms the ordinance -- *the firstborn of man shalt thou surely redeem* -- a debt never abolished but discharged.'),
    ('canon','numbers',3,48,'canon','luke',2,24,'free',
     E'*And to offer a sacrifice according to that which is said in the law of Yahuah (Lord), A pair of turtledoves, or two young pigeons.* (Luke 2:24). The redemption money of Numbers 3:48 -- *thou shalt give the money... unto Aaron and to his sons* -- is the same act of presentation Mary and Joseph fulfill, bringing the firstborn and the offering *according to that which is said in the law of Yahuah (Lord)*: the Torah of the firstborn kept, not set aside.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-3-strange-fire-nadab-and-abihu', E'Strange Fire: Nadab and Abihu',
       E'The priestly roll of Numbers 3 opens over two graves: *And Nadab and Abihu died before Yahuah (LORD), when they offered strange fire before Yahuah (LORD), in the wilderness of Sinai, and they had no children: and Eleazar and Ithamar ministered in the priest''s office in the sight of Aaron their father* (Numbers 3:4). The chapter assumes the account that Leviticus tells in full -- *Nadab and Abihu, the sons of Aaron, took either of them his censer... and offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1), and *there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD)* (Leviticus 10:2). The priesthood is no casual office; it is guarded by holy fire, and the worship Yahuah *commanded them not* is death. The line does not fail -- it passes to Eleazar and Ithamar, who minister still.',
       sv.verse_id, ev.verse_id, 'free', 23550
  FROM _s312_num03_lookup sv, _s312_num03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-3-the-tribe-of-levi-given-to-the-priesthood', E'The Tribe of Levi Given to the Service',
       E'*Bring the tribe of Levi near, and present them before Aaron the priest, that they may minister unto him* (Numbers 3:6); *thou shalt give the Levites unto Aaron and to his sons: they are wholly given unto him out of the children of Yashar''el (Israel)* (Numbers 3:9). The Levites are the gift for the service of the sanctuary, and the priesthood is guarded: *thou shalt appoint Aaron and his sons, and they shall wait on their priest''s office: and the stranger that cometh nigh shall be put to death* (Numbers 3:10). Numbers 18 seals the gift -- *to you they are given as a gift for Yahuah (LORD), to do the service of the tabernacle* (Numbers 18:6) -- and names the office itself *a service of gift* (Numbers 18:7), with the families'' burdens set out in chapter 4: *This shall be the service of the sons of Kohath... about the most holy things* (Numbers 4:4). The New Testament keeps the office a calling, never self-taken: *no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4). And the restored witness shows the election runs back to Levi himself -- *Levi dreamed that they had ordained and made him the priest of the El Elyon (Most High) Elohim (God), him and his sons for ever* (Jubilees 32:1), and *Levi fell to the portion of Yahuah (God), and his father clothed him in the garments of the priesthood* (Jubilees 32:3). Levi is Yahuah''s portion, given for the guarded service.',
       sv.verse_id, ev.verse_id, 'extras', 23553
  FROM _s312_num03_lookup sv, _s312_num03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-3-the-levites-instead-of-the-firstborn', E'The Levites Instead of the Firstborn',
       E'*And I, behold, I have taken the Levites from among the children of Yashar''el (Israel) instead of all the firstborn that openeth the matrix among the children of Yashar''el (Israel): therefore the Levites shall be mine* (Numbers 3:12). The reason is the night of the exodus: *Because all the firstborn are mine; for on the day that I smote all the firstborn in the land of Egypt I hallowed unto me all the firstborn in Yashar''el (Israel), both man and beast: mine shall they be: I am Yahuah (LORD)* (Numbers 3:13), repeated in the exchange -- *Take the Levites instead of all the firstborn... and the Levites shall be mine: I am Yahuah (LORD)* (Numbers 3:45). The claim was spoken at the very start: *Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Yashar''el (Israel)... it is mine* (Exodus 13:2); *all that openeth the matrix... the males shall be the LORD''S* (Exodus 13:12); *Yahuah slew all the firstborn in the land of Egypt... therefore I sacrifice to Yahuah all that openeth the matrix* (Exodus 13:15). This is why the firstborn Messiah is brought up holy: *Every male that openeth the womb shall be called holy to Yahuah (Lord)* (Luke 2:23) -- and why the redeemed are *the general assembly and church of the firstborn, which are written in heaven* (Hebrews 12:23). The firstborn belong to Yahuah, and a substitute is given in their place.',
       sv.verse_id, ev.verse_id, 'free', 23556
  FROM _s312_num03_lookup sv, _s312_num03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-3-the-redemption-of-the-firstborn', E'The Redemption of the Firstborn',
       E'When the firstborn outnumber the Levites, the surplus must be bought back: *for those that are to be redeemed of the two hundred and threescore and thirteen of the firstborn of the children of Yashar''el (Israel), which are more than the Levites; Thou shalt even take five shekels apiece by the poll, after the shekel of the sanctuary* (Numbers 3:46-47), and *thou shalt give the money, wherewith the odd number of them is to be redeemed, unto Aaron and to his sons* (Numbers 3:48). The price is the standing law of the Torah: *all the firstborn of man among thy children shalt thou redeem* (Exodus 13:13); *the firstborn of man shalt thou surely redeem* (Numbers 18:15); *those that are to be redeemed from a month old shalt thou redeem... for the money of five shekels, after the shekel of the sanctuary, which is twenty gerahs* (Numbers 18:16). The debt is never abolished -- it is discharged. So Mary and Joseph bring the firstborn and *offer a sacrifice according to that which is said in the law of Yahuah (Lord), A pair of turtledoves, or two young pigeons* (Luke 2:24): the redemption of the firstborn kept to the letter.',
       sv.verse_id, ev.verse_id, 'free', 23559
  FROM _s312_num03_lookup sv, _s312_num03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=40
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=3 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1) -- the account of the death named in Numbers 3:4.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-strange-fire-nadab-and-abihu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*there went out fire from Yahuah (LORD), and devoured them, and they died* (Leviticus 10:2) -- the priesthood guarded by holy fire.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-strange-fire-nadab-and-abihu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*to you they are given as a gift for Yahuah (LORD), to do the service of the tabernacle* (Numbers 18:6) -- the gift of Numbers 3:9 sealed.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-tribe-of-levi-given-to-the-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the stranger that cometh nigh shall be put to death* (Numbers 18:7) -- the guard of Numbers 3:10 word for word, the office a service of gift.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-tribe-of-levi-given-to-the-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*This shall be the service of the sons of Kohath... about the most holy things* (Numbers 4:4) -- the burdens of the families enrolled in Numbers 3.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=38
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-tribe-of-levi-given-to-the-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4) -- the appointed priesthood of Numbers 3:10 is a calling.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-tribe-of-levi-given-to-the-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Levi... ordained and made him the priest of the El Elyon (Most High) Elohim (God), him and his sons for ever* (Jubilees 32:1) -- the election of Levi behind Numbers 3:6.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s312_num03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=32 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-tribe-of-levi-given-to-the-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Levi fell to the portion of Yahuah (God), and his father clothed him in the garments of the priesthood* (Jubilees 32:3) -- the wholly-given separation of Numbers 3:9.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s312_num03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=32 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-tribe-of-levi-given-to-the-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Sanctify unto me all the firstborn... it is mine* (Exodus 13:2) -- the claim Numbers 3:13 grounds in the exodus.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-levites-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all that openeth the matrix... the males shall be the LORD''S* (Exodus 13:12) -- the very phrase the Levites answer for in Numbers 3:12.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-levites-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah slew all the firstborn in the land of Egypt... therefore I sacrifice to Yahuah all that openeth the matrix* (Exodus 13:15) -- the night Numbers 3:13 names.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-levites-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Take the Levites instead of all the firstborn... the Levites shall be mine: I am Yahuah (LORD)* (Numbers 3:45) re-grounded in *Sanctify unto me all the firstborn* (Exodus 13:2).'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=45
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-levites-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Every male that openeth the womb shall be called holy to Yahuah (Lord)* (Luke 2:23) -- the firstborn Messiah presented under this very law.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-levites-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the general assembly and church of the firstborn, which are written in heaven* (Hebrews 12:23) -- the firstborn people the Levites foreshadow.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-levites-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*all the firstborn of man among thy children shalt thou redeem* (Exodus 13:13) -- the statute the surplus of Numbers 3:46 is redeemed under.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=46
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-redemption-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the firstborn of man shalt thou surely redeem* (Numbers 18:15) -- the redemption price of Numbers 3:47 confirmed as standing law.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=47
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-redemption-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*for the money of five shekels, after the shekel of the sanctuary, which is twenty gerahs* (Numbers 18:16) -- the exact price set in Numbers 3:47.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=47
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-redemption-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*offer a sacrifice according to that which is said in the law of Yahuah (Lord)* (Luke 2:24) -- the redemption of the firstborn kept to the letter.'
  FROM cross_reference_threads t
  JOIN _s312_num03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=3 AND sv.verse_number=48
  JOIN _s312_num03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-3-the-redemption-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_4.sql (Numbers 4) -----
-- Chapter: Numbers 4 — the Levites' service of the holy things
-- Tag: num04  |  session prefix: s312  |  temp view: _s312_num04_lookup
-- Sort band base: 23575 step 3  ->  23575, 23578, 23581
--
-- Numbers 4 coverage:
--   v.1-20 (Kohathites bear the most holy things; Aaron covers ark/vessels first; touch not lest ye die):
--        NT:     Hebrews 12:28-29 (serve with reverence and godly fear; consuming fire)
--        Extras: none warranted
--        Tanakh: Exodus 25:14-15 (ark borne by staves, never removed); 2 Samuel 6:6-7 (Uzzah struck for touching the ark); 1 Chronicles 15:2,15 (none but the Levites carry the ark, upon their shoulders with the staves)
--   v.21-33 (Gershonites bear curtains/hangings; Merarites bear boards/bars/pillars — ordered burden):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 3:25-26 (Gershon's charge — the tent, coverings, hangings); Numbers 3:36 (Merari's charge — boards, bars, pillars, sockets)
--   v.34-49 (numbering of the Levites 30 to 50 years old for the service — appointed term):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 8:24-26 (Levite term — in from twenty-five, cease at fifty); 1 Chronicles 23:24,26-27 (David re-numbers from twenty — they shall no more carry the tabernacle)
--
-- Threads (slug -> target libraries):
--   numbers-4-the-holy-things-borne-not-touched-lest-they-die  [canon Tanakh + NT]  (Exod 25:14-15; 2 Sam 6:6-7; 1 Chr 15:2,15; Heb 12:28-29)
--   numbers-4-the-ordered-burden-of-the-sanctuary-gershon-and-merari  [canon Tanakh]  (Num 3:25-26,36)
--   numbers-4-the-appointed-term-of-the-levites-service  [canon Tanakh]  (Num 8:24-26; 1 Chr 23:24,26-27)
--
-- Framework note: the holy things are covered, borne on staves, and never touched — the
-- reverence the sanctuary commands (Heb 12:28-29 carries it forward: serve Elohim acceptably
-- with reverence and godly fear, for our Elohim is a consuming fire). Uzzah (2 Sam 6:6-7) and
-- David's correction (1 Chr 15) show the ordinance of Numbers 4 standing, not lapsing.

CREATE TEMP VIEW _s312_num04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the holy things borne, not touched
    ('canon','numbers',4,6,'canon','exodus',25,14,'free',
     E'*And thou shalt put the staves into the rings by the sides of the ark, that the ark may be borne with them.* (Exodus 25:14) The covering vail goes over the ark and *they shall put in the staves thereof* (Numbers 4:6) — the holy thing is moved only as Yahuah (LORD) commanded, lifted by the staves, never handled directly.'),
    ('canon','numbers',4,6,'canon','exodus',25,15,'free',
     E'*The staves shall be in the rings of the ark: they shall not be taken from it.* (Exodus 25:15) The staves stay fixed in the ark precisely so that the Kohathites can *bear it* without touching it — *they shall not touch any holy thing, lest they die* (Numbers 4:15).'),
    ('canon','numbers',4,15,'canon','2-samuel',6,6,'free',
     E'*And when they came to Nachon''s threshingfloor, Uzzah put forth his hand to the ark of Elohim (God), and took hold of it; for the oxen shook it.* (2 Samuel 6:6) The cart and the bare hand violate the very burden-law of Numbers 4 — the ark was to be borne on the staves by the sons of Kohath, who *shall not touch any holy thing, lest they die* (Numbers 4:15).'),
    ('canon','numbers',4,15,'canon','2-samuel',6,7,'free',
     E'*And the anger of Yahuah (LORD) was kindled against Uzzah; and Elohim (God) smote him there for his error; and there he died by the ark of Elohim (God).* (2 Samuel 6:7) The warning of *lest they die* (Numbers 4:15) falls exactly as written when the holy thing is touched — the ordinance had not lapsed; it was simply not kept after the due order.'),
    ('canon','numbers',4,15,'canon','1-chronicles',15,2,'free',
     E'*Then David said, None ought to carry the ark of Elohim (God) but the Levites: for them hath Yahuah (LORD) chosen to carry the ark of Elohim (God), and to minister unto him for ever.* (1 Chronicles 15:2) After Uzzah, David returns to the law of Numbers 4 — only the Levites, the sons of Kohath, *shall come to bear it* (Numbers 4:15).'),
    ('canon','numbers',4,15,'canon','1-chronicles',15,15,'free',
     E'*And the children of the Levites bare the ark of Elohim (God) upon their shoulders with the staves thereon, as Moses commanded according to the word of Yahuah (LORD).* (1 Chronicles 15:15) Borne *upon their shoulders with the staves thereon* — the second time it is done as Numbers 4 prescribed, and *they shall not touch any holy thing, lest they die* (Numbers 4:15) is honoured.'),
    ('canon','numbers',4,20,'canon','hebrews',12,28,'free',
     E'*Wherefore we receiving a kingdom which cannot be moved, let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28) The terror of *they shall not go in to see when the holy things are covered, lest they die* (Numbers 4:20) is the same reverence the new covenant carries forward — to serve Elohim acceptably is to come near with godly fear, not casual hands.'),
    ('canon','numbers',4,20,'canon','hebrews',12,29,'free',
     E'*For our Elohim (God) is a consuming fire.* (Hebrews 12:29) The death-warning around the most holy things — *lest they die* (Numbers 4:20) — is grounded in who Yahuah (LORD) is; the holiness that struck at the ark is the consuming fire still, and the reverence Numbers 4 commands is never abolished.'),

    -- Thread 2: the ordered burden of the sanctuary (Gershon and Merari)
    ('canon','numbers',4,25,'canon','numbers',3,25,'free',
     E'*And the charge of the sons of Gershon in the tabernacle of the congregation shall be the tabernacle, and the tent, the covering thereof, and the hanging for the door of the tabernacle of the congregation* (Numbers 3:25) The earlier muster names Gershon''s charge; chapter 4 now sets it to the march — *they shall bear the curtains of the tabernacle... his covering... and the hanging for the door* (Numbers 4:25).'),
    ('canon','numbers',4,26,'canon','numbers',3,26,'free',
     E'*And the hangings of the court, and the curtain for the door of the court, which is by the tabernacle, and by the altar round about, and the cords of it for all the service thereof.* (Numbers 3:26) The same hangings and cords assigned to Gershon at the census are the very burden borne in the march — *the hangings of the court, and the hanging for the door of the gate of the court... and their cords* (Numbers 4:26).'),
    ('canon','numbers',4,31,'canon','numbers',3,36,'free',
     E'*And under the custody and charge of the sons of Merari shall be the boards of the tabernacle, and the bars thereof, and the pillars thereof, and the sockets thereof, and all the vessels thereof, and all that serveth thereto* (Numbers 3:36) Merari''s charge of the heavy frame, named at the census, is now their burden on the march — *the boards of the tabernacle, and the bars thereof, and the pillars thereof, and sockets thereof* (Numbers 4:31). Each house its own ordered load.'),

    -- Thread 3: the appointed term of the Levites' service
    ('canon','numbers',4,3,'canon','numbers',8,24,'free',
     E'*This is it that belongeth unto the Levites: from twenty and five years old and upward they shall go in to wait upon the service of the tabernacle of the congregation* (Numbers 8:24) Numbers 4 numbers the host for the heavy carrying *from thirty years old and upward even until fifty years old* (Numbers 4:3); chapter 8 sets the wider attendance from twenty-five — the same service, two thresholds for two burdens.'),
    ('canon','numbers',4,3,'canon','numbers',8,25,'free',
     E'*And from the age of fifty years they shall cease waiting upon the service thereof, and shall serve no more* (Numbers 8:25) The upper bound matches exactly — *even until fifty years old* (Numbers 4:3); at fifty the burden of the host is laid down, the appointed term complete.'),
    ('canon','numbers',4,47,'canon','numbers',8,26,'free',
     E'*But shall minister with their brethren in the tabernacle of the congregation, to keep the charge, and shall do no service. Thus shalt thou do unto the Levites touching their charge.* (Numbers 8:26) Those numbered *to do the service of the ministry, and the service of the burden* (Numbers 4:47) are released from the burden at fifty yet still keep the charge — service ordered by age, not cast off.'),
    ('canon','numbers',4,47,'canon','1-chronicles',23,24,'free',
     E'*These were the sons of Levi after the house of their fathers... that did the work for the service of the house of Yahuah (LORD), from the age of twenty years and upward.* (1 Chronicles 23:24) When the ark has rest in Jerusalem, David adjusts the threshold — the wilderness term *from thirty years old and upward* (Numbers 4:47) gives way to twenty, because the burden has changed.'),
    ('canon','numbers',4,47,'canon','1-chronicles',23,26,'free',
     E'*And also unto the Levites; they shall no more carry the tabernacle, nor any vessels of it for the service thereof.* (1 Chronicles 23:26) The heavy carrying that defined *the service of the burden in the tabernacle of the congregation* (Numbers 4:47) ends once the house is built — the law fulfilled its season, the Levites now keep the charge in a settled place.'),
    ('canon','numbers',4,47,'canon','1-chronicles',23,27,'free',
     E'*For by the last words of David the Levites were numbered from twenty years old and above* (1 Chronicles 23:27) David''s last-word reckoning revises the wilderness muster of *from thirty years old and upward* (Numbers 4:47) — the term of service bends to the work appointed, ordered service through every age of the people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-4-the-holy-things-borne-not-touched-lest-they-die',
       E'The Holy Things Borne, Not Touched, Lest They Die',
       E'The most holy things move only as Yahuah (LORD) appointed. Aaron and his sons go in FIRST to cover the ark and the holy vessels — *they shall take down the covering vail, and cover the ark of testimony with it* (Numbers 4:5) — wrapping each in the blue cloth and the badgers'' skins, *and shall put in the staves thereof* (Numbers 4:6). Only then do the sons of Kohath come to bear the burden: *they shall not touch any holy thing, lest they die* (Numbers 4:15), and *they shall not go in to see when the holy things are covered, lest they die* (Numbers 4:20). The staves are the whole point — *thou shalt put the staves into the rings by the sides of the ark, that the ark may be borne with them* (Exodus 25:14), and *they shall not be taken from it* (Exodus 25:15) — the holy thing is lifted, never handled. The cost of forgetting this is written in Uzzah: *Uzzah put forth his hand to the ark of Elohim (God), and took hold of it* (2 Samuel 6:6), and *Elohim (God) smote him there for his error; and there he died* (2 Samuel 6:7) — *lest they die* fulfilled to the letter, because the ark went up on a cart, not on the shoulders of Kohath. David learns and returns to Numbers 4: *None ought to carry the ark of Elohim (God) but the Levites* (1 Chronicles 15:2), and the second time *the children of the Levites bare the ark of Elohim (God) upon their shoulders with the staves thereon, as Moses commanded* (1 Chronicles 15:15). The reverence never lapses — it is carried forward whole: *let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28), *for our Elohim (God) is a consuming fire* (Hebrews 12:29). The holy things are covered and borne — not touched.',
       sv.verse_id, ev.verse_id, 'free', 23575
  FROM _s312_num04_lookup sv, _s312_num04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=4 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-4-the-ordered-burden-of-the-sanctuary-gershon-and-merari',
       E'The Ordered Burden of the Sanctuary — Gershon and Merari',
       E'Every house of Levi has its own appointed load. The Gershonites bear the soft furnishings: *they shall bear the curtains of the tabernacle, and the tabernacle of the congregation, his covering... and the hanging for the door of the tabernacle of the congregation* (Numbers 4:25), with *the hangings of the court, and the hanging for the door of the gate of the court... and their cords* (Numbers 4:26). This is the same charge named at the census: *the charge of the sons of Gershon... shall be the tabernacle, and the tent, the covering thereof, and the hanging for the door* (Numbers 3:25), *and the hangings of the court, and the curtain for the door of the court... and the cords of it* (Numbers 3:26). The Merarites bear the heavy frame: *the boards of the tabernacle, and the bars thereof, and the pillars thereof, and sockets thereof* (Numbers 4:31) — exactly their muster-charge, *the boards of the tabernacle, and the bars thereof, and the pillars thereof, and the sockets thereof, and all the vessels thereof* (Numbers 3:36). The sanctuary is taken down and carried with nothing left to chance — each man knows his burden, *and by name ye shall reckon the instruments of the charge of their burden* (Numbers 4:32). Order, not improvisation, in the things of Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 23578
  FROM _s312_num04_lookup sv, _s312_num04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=4 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-4-the-appointed-term-of-the-levites-service',
       E'The Appointed Term of the Levites'' Service',
       E'The Levites are numbered for the heavy carrying *from thirty years old and upward even until fifty years old, all that enter into the host, to do the work in the tabernacle of the congregation* (Numbers 4:3), and the whole muster of the burden-bearers comes to *eight thousand and five hundred and fourscore* (Numbers 4:48), each *according to his service, and according to his burden... as Yahuah (LORD) commanded Moses* (Numbers 4:49). The term is precise and it is layered: chapter 8 sets the wider attendance earlier — *from twenty and five years old and upward they shall go in to wait upon the service* (Numbers 8:24) — while the upper bound holds exactly: *from the age of fifty years they shall cease waiting upon the service thereof, and shall serve no more* (Numbers 8:25), yet even then *shall minister with their brethren... to keep the charge* (Numbers 8:26). Service is bounded by age, never cast off. When the ark finds rest in Jerusalem and the burden changes, David revises the threshold: the Levites *did the work for the service of the house of Yahuah (LORD), from the age of twenty years and upward* (1 Chronicles 23:24), *for... they shall no more carry the tabernacle, nor any vessels of it* (1 Chronicles 23:26), and *by the last words of David the Levites were numbered from twenty years old and above* (1 Chronicles 23:27). The term bends to the work appointed — ordered service through every age of the people.',
       sv.verse_id, ev.verse_id, 'free', 23581
  FROM _s312_num04_lookup sv, _s312_num04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=4 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*that the ark may be borne with them* (Exodus 25:14) — the staves were made for carrying, so the ark need never be touched.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-holy-things-borne-not-touched-lest-they-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they shall not be taken from it* (Exodus 25:15) — the staves stay fixed in the ark so the Kohathites bear without handling.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-holy-things-borne-not-touched-lest-they-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Uzzah put forth his hand to the ark* (2 Samuel 6:6) — the cart and the bare hand break the burden-law of Numbers 4.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-holy-things-borne-not-touched-lest-they-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*there he died by the ark of Elohim (God)* (2 Samuel 6:7) — *lest they die* fulfilled exactly when the holy thing is touched.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-holy-things-borne-not-touched-lest-they-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*None ought to carry the ark... but the Levites* (1 Chronicles 15:2) — David returns to the law of Numbers 4 after Uzzah.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=15 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-holy-things-borne-not-touched-lest-they-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*bare the ark... upon their shoulders with the staves thereon* (1 Chronicles 15:15) — done a second time as Numbers 4 prescribed.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=15 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-holy-things-borne-not-touched-lest-they-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28) — the awe of Numbers 4:20 carried forward whole.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-holy-things-borne-not-touched-lest-they-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29) — the holiness that struck at the ark is the same fire still.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-holy-things-borne-not-touched-lest-they-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the charge of the sons of Gershon... the tabernacle, and the tent, the covering thereof* (Numbers 3:25) — the census-charge now set to the march.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-ordered-burden-of-the-sanctuary-gershon-and-merari'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the hangings of the court... and the cords of it* (Numbers 3:26) — the same hangings and cords are Gershon''s burden in the march.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=26
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-ordered-burden-of-the-sanctuary-gershon-and-merari'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the boards of the tabernacle, and the bars thereof, and the pillars thereof* (Numbers 3:36) — Merari''s heavy frame, named at census, now their march-burden.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=31
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-ordered-burden-of-the-sanctuary-gershon-and-merari'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*from twenty and five years old and upward they shall go in to wait upon the service* (Numbers 8:24) — the wider attendance threshold beneath the burden-host of thirty.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=8 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-appointed-term-of-the-levites-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*from the age of fifty years they shall cease... and shall serve no more* (Numbers 8:25) — the upper bound matches Numbers 4:3 exactly.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=8 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-appointed-term-of-the-levites-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*shall minister with their brethren... to keep the charge, and shall do no service* (Numbers 8:26) — released from the burden at fifty, never cast off.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=47
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=8 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-appointed-term-of-the-levites-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*from the age of twenty years and upward* (1 Chronicles 23:24) — David lowers the threshold when the burden changes.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=47
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=23 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-appointed-term-of-the-levites-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*they shall no more carry the tabernacle, nor any vessels of it* (1 Chronicles 23:26) — the heavy carrying of Numbers 4:47 ends once the house is built.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=47
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=23 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-appointed-term-of-the-levites-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the Levites were numbered from twenty years old and above* (1 Chronicles 23:27) — David''s last-word reckoning revises the wilderness muster of thirty.'
  FROM cross_reference_threads t
  JOIN _s312_num04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=4 AND sv.verse_number=47
  JOIN _s312_num04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=23 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-4-the-appointed-term-of-the-levites-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_5.sql (Numbers 5) -----
-- Book: Numbers   Chapter: 5   Tag: num05   Session prefix: s312
-- Sort band: base 23600, step 3  (23600, 23603, 23606)
-- Temp view: _s312_num05_lookup
--
-- THREADS (3):
--   numbers-5-put-out-the-unclean-the-camp-where-i-dwell   [free]
--       targets: canon Leviticus 13:46 (lateral); canon Hebrews 13:11-13, Revelation 21:27 (forward)
--   numbers-5-confess-the-sin-and-restore-the-trespass     [free]
--       targets: canon Leviticus 6:1-7 (lateral); canon 1 John 1:9, Luke 19:8, Matthew 5:23-24 (forward)
--   numbers-5-the-searcher-of-hearts-clears-the-innocent   [free]
--       targets: canon Psalm 7:9, Jeremiah 17:10 (lateral); canon Hebrews 4:12-13, 1 Corinthians 4:5 (forward)
--
-- Numbers 5 coverage:
--   v.1-4  the unclean put out of the camp "in the midst whereof I dwell"
--          NT:     Hebrews 13:11-13 (suffered without the gate), Revelation 21:27 (nothing defiled enters) — threaded
--          Extras: none warranted (camp-holiness fully carried by Torah + NT here)
--          Tanakh: Leviticus 13:46 (the leper dwells without the camp) — threaded
--   v.5-10 confess the sin, recompense + add the fifth part
--          NT:     1 John 1:9 (confess our sins), Luke 19:8 (Zacchaeus restores), Matthew 5:23-24 (be reconciled first) — threaded
--          Extras: none warranted
--          Tanakh: Leviticus 6:1-7 (the trespass offering, restore + fifth part) — threaded
--   v.11-31 the trial of jealousy — the bitter water exposes hidden sin, clears the innocent
--          NT:     Hebrews 4:12-13 (discerner of thoughts, all naked and opened), 1 Corinthians 4:5 (bring to light the hidden things) — threaded
--          Extras: none warranted (handled soberly: the law protects the innocent wife; searcher-of-hearts frame, victims-not-enemies)
--          Tanakh: Psalm 7:9 (Elohim trieth the hearts and reins), Jeremiah 17:10 (I Yahuah search the heart) — threaded

CREATE TEMP VIEW _s312_num05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== CROSS_REFERENCES ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: put out the unclean — the camp where I dwell
    ('canon','numbers',5,3,'canon','leviticus',13,46,'free',
     E'*All the days wherein the plague shall be in him he shall be defiled; he is unclean: he shall dwell alone; without the camp shall his habitation be.* (Leviticus 13:46). The same camp-holiness Yahuah (LORD) names in Numbers: *Both male and female shall ye put out, without the camp shall ye put them; that they defile not their camps, in the midst whereof I dwell* (Numbers 5:3). The leper dwells without the camp because the camp is where Yahuah dwells — uncleanness is barred not as cruelty but to keep the dwelling-place holy.'),
    ('canon','numbers',5,3,'canon','hebrews',13,12,'free',
     E'*Wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). The Formed Son is sent to the very place of the unclean — *without the camp* (Numbers 5:3) — taking the reproach of the cast-out so the people are sanctified. The camp that put out defilement is cleansed from outside it.'),
    ('canon','numbers',5,3,'canon','hebrews',13,13,'free',
     E'*Let us go forth therefore unto him without the camp, bearing his reproach* (Hebrews 13:13). Numbers put the defiled *without the camp* (Numbers 5:3); the writer calls the people to go out to the One who bore that place willingly. The holiness of the dwelling and the love that goes to the cast-out meet in him.'),
    ('canon','numbers',5,3,'canon','revelation',21,27,'free',
     E'*And there shall in no wise enter into it any thing that defileth, neither whatsoever worketh abomination, or maketh a lie: but they which are written in the Lamb''s book of life* (Revelation 21:27). The camp kept holy *in the midst whereof I dwell* (Numbers 5:3) is the seed of the New Jerusalem: where Yahuah dwells, nothing defiled enters — the same law of the dwelling-place, brought to its consummation.'),

    -- THREAD 2: confess the sin and restore the trespass
    ('canon','numbers',5,7,'canon','leviticus',6,5,'free',
     E'*Or all that about which he hath sworn falsely; he shall even restore it in the principal, and shall add the fifth part more thereto, and give it unto him to whom it appertaineth, in the day of his trespass offering* (Leviticus 6:5). This is the matching trespass-law: Numbers commands *he shall recompense his trespass with the principal thereof, and add unto it the fifth part thereof* (Numbers 5:7). Confession is never bare words — Torah binds it to making the wronged neighbour whole, principal plus a fifth.'),
    ('canon','numbers',5,7,'canon','leviticus',6,7,'free',
     E'*And the priest shall make an atonement for him before Yahuah (LORD): and it shall be forgiven him for any thing of all that he hath done in trespassing therein* (Leviticus 6:7). The restitution Numbers requires — *give it unto him against whom he hath trespassed* (Numbers 5:7) — stands beside atonement before Yahuah; the debt to the neighbour and the standing before Yahuah are both addressed.'),
    ('canon','numbers',5,7,'canon','1-john',1,9,'free',
     E'*If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). The Torah pattern is unchanged: *Then they shall confess their sin which they have done* (Numbers 5:7). Confession before Yahuah is the doorway to forgiveness — the apostle quotes the same covenant order Numbers lays down.'),
    ('canon','numbers',5,7,'canon','luke',19,8,'free',
     E'*And Zacchæus stood, and said unto Yahuah (Lord); Behold, Yahuah (Lord), the half of my goods I give to the poor; and if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8). Zacchaeus does exactly what Numbers commands — *he shall recompense his trespass... and add unto it the fifth part* (Numbers 5:7) — and more; repentance bears Torah-fruit in restitution, not in words alone.'),
    ('canon','numbers',5,7,'canon','matthew',5,24,'free',
     E'*Leave there thy gift before the altar, and go thy way; first be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24). The Master keeps the Numbers order: recompense the wronged before the offering — *give it unto him against whom he hath trespassed* (Numbers 5:7). Right standing with the neighbour comes before the altar, the same law of confession-and-restitution.'),

    -- THREAD 3: the searcher of hearts clears the innocent
    ('canon','numbers',5,16,'canon','psalms',7,9,'free',
     E'*Oh let the wickedness of the wicked come to an end; but establish the just: for the righteous Elohim (God) trieth the hearts and reins* (Psalm 7:9). The trial of jealousy sets the woman *before Yahuah (LORD)* (Numbers 5:16) because hidden sin is His to judge — *the righteous Elohim trieth the hearts*. The rite takes the matter out of a husband''s suspicion and the mob''s tongue and lays it before the One who tries the heart.'),
    ('canon','numbers',5,16,'canon','jeremiah',17,10,'free',
     E'*I Yahuah (LORD) search the heart, I try the reins, even to give every man according to his ways, and according to the fruit of his doings* (Jeremiah 17:10). What no witness could see — *it be hid from the eyes of her husband, and be kept close* (Numbers 5:13) — Yahuah searches out. The woman set *before Yahuah* (Numbers 5:16) stands before the Searcher who alone judges what is hidden.'),
    ('canon','numbers',5,16,'canon','hebrews',4,12,'free',
     E'*For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). The bitter water that exposes the hidden is the shadow; the Word itself is the discerner. The woman *before Yahuah (LORD)* (Numbers 5:16) and every soul stand before the One who reads the thoughts.'),
    ('canon','numbers',5,16,'canon','hebrews',4,13,'free',
     E'*Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The rite uncovers what was *kept close* (Numbers 5:13) because before Yahuah nothing is hidden. Set *before Yahuah (LORD)* (Numbers 5:16) is to be naked and open before His eyes — and so the innocent are cleared as surely as the guilty are exposed.'),
    ('canon','numbers',5,16,'canon','1-corinthians',4,5,'free',
     E'*Therefore judge nothing before the time, until Yahuah (Lord) come, who both will bring to light the hidden things of darkness, and will make manifest the counsels of the hearts: and then shall every man have praise of Elohim (God)* (1 Corinthians 4:5). The same restraint the trial teaches: leave the hidden thing to Yahuah, who brings it to light. The woman set *before Yahuah (LORD)* (Numbers 5:16) is judged by the One who alone manifests the counsels of the hearts.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== THREADS ==============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-5-put-out-the-unclean-the-camp-where-i-dwell',
       E'Put Out the Unclean: the Camp Where I Dwell',
       E'Yahuah (LORD) commands the unclean be removed from the camp — *Command the children of Yashar''el (Israel), that they put out of the camp every leper, and every one that hath an issue, and whosoever is defiled by the dead* (Numbers 5:2) — and gives the reason: *that they defile not their camps, in the midst whereof I dwell* (Numbers 5:3). The camp is holy because Yahuah dwells in its midst. The leper''s portion was already named in Torah — *he shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46). Yet the place of the cast-out is exactly where the Formed Son goes: *Wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12), and the people are called after him — *Let us go forth therefore unto him without the camp, bearing his reproach* (Hebrews 13:13). The law of the dwelling-place reaches its end in the city where Yahuah dwells forever: *there shall in no wise enter into it any thing that defileth... but they which are written in the Lamb''s book of life* (Revelation 21:27). The camp kept holy, the reproach borne from outside, the city cleansed at the last — one thread.',
       sv.verse_id, ev.verse_id, 'free', 23600
  FROM _s312_num05_lookup sv, _s312_num05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-5-confess-the-sin-and-restore-the-trespass',
       E'Confess the Sin and Restore the Trespass',
       E'Torah binds confession to restitution. *When a man or woman shall commit any sin that men commit, to do a trespass against Yahuah (LORD), and that person be guilty; Then they shall confess their sin which they have done: and he shall recompense his trespass with the principal thereof, and add unto it the fifth part thereof, and give it unto him against whom he hath trespassed* (Numbers 5:6-7). It is the trespass-law of Leviticus repeated — *he shall even restore it in the principal, and shall add the fifth part more thereto, and give it unto him to whom it appertaineth* (Leviticus 6:5) — atonement before Yahuah set beside repayment to the neighbour (Leviticus 6:7). The covenant pattern never changes: *If we confess our sins, he is faithful and just to forgive us our sins* (1 John 1:9). And confession bears Torah-fruit — Zacchaeus rises to do exactly this: *the half of my goods I give to the poor; and if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8); and the Master keeps the same order, *first be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24). Confession, restitution, atonement — the one unbroken law.',
       sv.verse_id, ev.verse_id, 'free', 23603
  FROM _s312_num05_lookup sv, _s312_num05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-5-the-searcher-of-hearts-clears-the-innocent',
       E'The Searcher of Hearts Clears the Innocent',
       E'The trial of jealousy takes a matter no witness can settle — *it be hid from the eyes of her husband, and be kept close, and she be defiled, and there be no witness against her* (Numbers 5:13) — and lifts it out of a husband''s suspicion and the people''s tongues by setting the woman *before Yahuah (LORD)* (Numbers 5:16). The point is not the rite''s strangeness but its mercy: the hidden thing is given to the only righteous Judge, and *if the woman be not defiled, but be clean; then she shall be free, and shall conceive seed* (Numbers 5:28) — the innocent are cleared, not left to the mob. Yahuah alone tries the inward parts: *the righteous Elohim (God) trieth the hearts and reins* (Psalm 7:9); *I Yahuah (LORD) search the heart, I try the reins* (Jeremiah 17:10). The shadow points to the living Word — *a discerner of the thoughts and intents of the heart* (Hebrews 4:12), before whom *all things are naked and opened* (Hebrews 4:13) — and to the counsel: *judge nothing before the time, until Yahuah (Lord) come, who... will make manifest the counsels of the hearts* (1 Corinthians 4:5). Leave the hidden to the Searcher; He exposes the guilty and clears the innocent.',
       sv.verse_id, ev.verse_id, 'free', 23606
  FROM _s312_num05_lookup sv, _s312_num05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=5 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ============================== THREAD MEMBERS ==============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 13:46 (lateral) — the leper *shall dwell alone; without the camp shall his habitation be*: the camp-holiness Numbers 5:3 enforces.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=13 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-put-out-the-unclean-the-camp-where-i-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 13:12 (forward) — Yahusha (Jesus) *suffered without the gate*: the Formed Son goes to the place of the cast-out to sanctify the people.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-put-out-the-unclean-the-camp-where-i-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 13:13 (forward) — *Let us go forth therefore unto him without the camp, bearing his reproach*: the people called out to the One who bore that place.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-put-out-the-unclean-the-camp-where-i-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Revelation 21:27 (forward) — *there shall in no wise enter into it any thing that defileth*: the camp-holiness consummated in the city where Yahuah dwells.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-put-out-the-unclean-the-camp-where-i-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 6:5 (lateral) — *restore it in the principal, and shall add the fifth part more thereto*: the matching trespass-law of restitution.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-confess-the-sin-and-restore-the-trespass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 6:7 (lateral) — *the priest shall make an atonement for him*: atonement before Yahuah set beside repayment to the neighbour.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-confess-the-sin-and-restore-the-trespass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 John 1:9 (forward) — *If we confess our sins, he is faithful and just to forgive us*: the same covenant order Numbers lays down.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-confess-the-sin-and-restore-the-trespass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Luke 19:8 (forward) — Zacchaeus *restore him fourfold*: repentance bearing the Torah-fruit of restitution.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-confess-the-sin-and-restore-the-trespass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Matthew 5:24 (forward) — *first be reconciled to thy brother, and then come and offer thy gift*: the Numbers order, neighbour before altar.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-confess-the-sin-and-restore-the-trespass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 7:9 (lateral) — *the righteous Elohim (God) trieth the hearts and reins*: the matter is given to the Judge of the inward parts.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-the-searcher-of-hearts-clears-the-innocent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jeremiah 17:10 (lateral) — *I Yahuah (LORD) search the heart, I try the reins*: what was kept close is searched out by Yahuah.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-the-searcher-of-hearts-clears-the-innocent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 4:12 (forward) — the Word *a discerner of the thoughts and intents of the heart*: the bitter water was the shadow of Him.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-the-searcher-of-hearts-clears-the-innocent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 4:13 (forward) — *all things are naked and opened unto the eyes of him*: nothing hidden before the One the woman is set before.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-the-searcher-of-hearts-clears-the-innocent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Corinthians 4:5 (forward) — *judge nothing before the time... will make manifest the counsels of the hearts*: leave the hidden to the Searcher.'
  FROM cross_reference_threads t
  JOIN _s312_num05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s312_num05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-5-the-searcher-of-hearts-clears-the-innocent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_6.sql (Numbers 6) -----
--
-- BOOK: Numbers (slug 'numbers')  CHAPTER: 6  TAG: num06
-- SESSION PREFIX: s312   TEMP VIEW: _s312_num06_lookup
-- SORT BAND: base 23625 step 3  ->  23625, 23628, 23631, 23634, 23637
--
-- KEYSTONE chapter: the Nazarite vow of separation, and the Aaronic (priestly)
-- blessing / the Name of Yahuah set upon the children of Yashar'el.
--
-- LENS APPLIED: the separated-holy life "unto Yahuah" (Torah consecration, never the
-- curse); the Formed Son who lifts up his hands to bless; the Father's Name placed on
-- the two-house people, sealed at last in their foreheads. Forward-weave to the NT
-- fulfilment, lateral-weave to the Psalms and Judges/Samuel, out-weave to 1 Maccabees.
--
-- ===== PER-CHAPTER COVERAGE CHECKLIST =====
-- v.1-8  (the Nazarite vow of separation, holy unto Yahuah):
--        NT:     Luke 1:15 (John drinks neither wine nor strong drink, filled with the Ruach)  [USED]
--        Extras: 1 Maccabees 3:49 (the Nazarites who had accomplished their days)  [USED]
--        Tanakh: Judges 13:5, 13:7 (Samson a Nazarite from the womb); 1 Samuel 1:11 (Samuel, no razor)  [USED]
-- v.9-12 (the defiled Nazarite cleansed and re-consecrated):
--        NT:     Acts 18:18 (Paul having shorn his head, for he had a vow)  [USED in fulfilment thread]
--        Extras: none warranted
--        Tanakh: folded into the fulfilment/offerings thread
-- v.13-21 (the offerings at the fulfilment of the vow, the hair burnt on the altar):
--        NT:     Acts 18:18; Acts 21:23, 21:24, 21:26 (Paul and the four men purify themselves, keep the law)  [USED]
--        Extras: 1 Maccabees 3:49 (Nazarites who had accomplished their days) [placed on vow thread]
--        Tanakh: none additional warranted
-- v.22-23 (the charge to bless the children of Yashar'el):
--        NT:     Luke 24:50 (Yahusha lifted up his hands and blessed them)  [USED]
--        Extras: none warranted
--        Tanakh: none additional warranted
-- v.24-26 (THE AARONIC BLESSING, the shining face, peace):
--        NT:     Philippians 4:7 (the peace of Elohim); John 14:27 (my peace I give unto you)  [USED]
--        Extras: 2 Cor 13:14 considered but DROPPED (trailing colophon apparatus inside the parsed verse)
--        Tanakh: Psalm 67:1; Psalm 4:6; Psalm 80:3, 80:7, 80:19 (cause thy face to shine)  [USED]
-- v.27  (they shall put MY NAME upon the children of Yashar'el):
--        NT:     Revelation 22:4; Revelation 14:1 (the Father's name in their foreheads); John 17:11 (keep through thine own name)  [USED]
--        Extras: none warranted
--        Tanakh: Deuteronomy 28:10 (called by the name of Yahuah); Isaiah 43:7 (called by my name)  [USED]
--
-- ===== THREADS (5) =====
--  1. numbers-6-the-nazarite-vow-of-separation-holy-unto-yahuah  (6:1-8)   [EXTRAS]
--        Judges 13:5, 13:7, 1 Sam 1:11 (Tanakh) + Luke 1:15 (NT) + 1 Macc 3:49 (extras)
--  2. numbers-6-the-completed-vow-and-pauls-torah-keeping-in-acts (6:9-21) [FREE]
--        Acts 18:18, Acts 21:23, 21:24, 21:26 (NT)
--  3. numbers-6-the-priestly-office-of-blessing                   (6:22-23)[FREE]
--        Luke 24:50 (NT)
--  4. numbers-6-the-aaronic-blessing-of-the-shining-face          (6:24-26)[FREE]
--        Psalm 67:1, 4:6, 80:3, 80:7, 80:19 (Tanakh) + Phil 4:7, John 14:27 (NT)
--  5. numbers-6-they-shall-put-my-name-upon-the-children-of-yasharel (6:27)[FREE]
--        Deut 28:10, Isa 43:7 (Tanakh) + Rev 22:4, Rev 14:1, John 17:11 (NT)
--

CREATE TEMP VIEW _s312_num06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =========================================================================
-- B. CROSS_REFERENCES
-- =========================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Nazarite vow (6:1-8)
    ('canon','numbers',6,5,'canon','judges',13,5,'free',
     E'*For, lo, thou shalt conceive, and bear a son; and no razor shall come on his head: for the child shall be a Nazarite unto Elohim (God) from the womb: and he shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines* (Judges 13:5). The law given here, *there shall no razor come upon his head... he shall be holy* (Numbers 6:5), is lived out in Samson, set apart from the womb by the angel of Yahuah.'),
    ('canon','numbers',6,3,'canon','judges',13,7,'free',
     E'*But he said unto me, Behold, thou shalt conceive, and bear a son; and now drink no wine nor strong drink, neither eat any unclean thing: for the child shall be a Nazarite to Elohim (God) from the womb to the day of his death* (Judges 13:7). The first mark of the Nazarite, *He shall separate himself from wine and strong drink* (Numbers 6:3), is laid upon Samson''s mother before his birth.'),
    ('canon','numbers',6,5,'canon','1-samuel',1,11,'free',
     E'*And she vowed a vow, and said, O Yahuah Tseva''ot (LORD of hosts)... then I will give him unto Yahuah (LORD) all the days of his life, and there shall no razor come upon his head* (1 Samuel 1:11). Hannah binds her unborn son Samuel with the very sign of Numbers 6, *there shall no razor come upon his head* (Numbers 6:5) — a life-long separation unto Yahuah.'),
    ('canon','numbers',6,3,'canon','luke',1,15,'free',
     E'*For he shall be great in the sight of Yahuah (Lord), and shall drink neither wine nor strong drink; and he shall be filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb* (Luke 1:15). John the Baptist is the Nazarite consummated: the abstaining of *wine and strong drink* (Numbers 6:3) joined to the filling of the Spirit, the separated one who prepares the way.'),
    ('canon','numbers',6,8,'apocrypha','1-maccabees',3,49,'extras',
     E'*They brought also the priests'' garments, and the firstfruits, and the tithes: and the Nazarites they stirred up, who had accomplished their days* (1 Maccabees 3:49). Centuries after Numbers, the Nazarite vow is still being kept and fulfilled in Yashar''el — the living testimony that *all the days of his separation he is holy unto Yahuah (LORD)* (Numbers 6:8) was never a dead letter.'),

    -- THREAD 2: the completed vow and Paul's Torah-keeping in Acts (6:9-21)
    ('canon','numbers',6,18,'canon','acts',18,18,'free',
     E'*And Paul after this tarried there yet a good while, and then took his leave of the brethren, and sailed thence into Syria... having shorn his head in Cenchrea: for he had a vow* (Acts 18:18). The Torah''s appointed close of the vow, *the Nazarite shall shave the head of his separation* (Numbers 6:18), is kept by Paul himself — the apostle walking in the law, not against it.'),
    ('canon','numbers',6,18,'canon','acts',21,23,'free',
     E'*Do therefore this that we say to thee: We have four men which have a vow on them* (Acts 21:23). In Yerushalayim the Nazarite vow of Numbers 6 is still being performed; Paul is asked to join them, that all may know the charge against him is false.'),
    ('canon','numbers',6,13,'canon','acts',21,24,'free',
     E'*Them take, and purify thyself with them, and be at charges with them, that they may shave their heads: and all may know... that thou thyself also walkest orderly, and keepest the law* (Acts 21:24). The law of the Nazarite, *when the days of his separation are fulfilled: he shall be brought unto the door of the tabernacle* (Numbers 6:13), is the very proof that Paul *keepest the law* — Torah affirmed, never abolished.'),
    ('canon','numbers',6,14,'canon','acts',21,26,'free',
     E'*Then Paul took the men, and the next day purifying himself with them entered into the temple, to signify the accomplishment of the days of purification, until that an offering should be offered for every one of them* (Acts 21:26). The required offerings, *he shall offer his offering unto Yahuah (LORD)* (Numbers 6:14), are brought by Paul for the Nazarites — the apostle keeping the Torah of separation in full.'),

    -- THREAD 3: the priestly office of blessing (6:22-23)
    ('canon','numbers',6,23,'canon','luke',24,50,'free',
     E'*And he led them out as far as to Bethany, and he lifted up his hands, and blessed them* (Luke 24:50). The priestly charge, *On this wise ye shall bless the children of Yashar''el (Israel)* (Numbers 6:23), finds its highest fulfilment as Yahusha the Formed Son, ascending, lifts up his hands and pronounces the blessing over his people.'),

    -- THREAD 4: the Aaronic blessing of the shining face (6:24-26)
    ('canon','numbers',6,25,'canon','psalms',67,1,'free',
     E'*Elohim (God) be merciful unto us, and bless us; and cause his face to shine upon us; Selah* (Psalm 67:1). The Aaronic word, *Yahuah (LORD) make his face shine upon thee, and be gracious unto thee* (Numbers 6:25), becomes the prayer of all Yashar''el — the shining face and the mercy sought together.'),
    ('canon','numbers',6,25,'canon','psalms',4,6,'free',
     E'*There be many that say, Who will shew us any good? Yahuah (LORD), lift thou up the light of thy countenance upon us* (Psalm 4:6). David takes up the priestly blessing as petition: the lifted *light of thy countenance* answering *Yahuah (LORD) make his face shine upon thee* (Numbers 6:25).'),
    ('canon','numbers',6,25,'canon','psalms',80,3,'free',
     E'*Turn us again, O Elohim (God), and cause thy face to shine; and we shall be saved* (Psalm 80:3). The refrain of the scattered flock pleads the very blessing of Numbers 6 — *cause thy face to shine* echoing *Yahuah (LORD) make his face shine upon thee* (Numbers 6:25) — and binds the shining face to salvation and to the regathering.'),
    ('canon','numbers',6,25,'canon','psalms',80,7,'free',
     E'*Turn us again, O Elohim (God) of hosts, and cause thy face to shine; and we shall be saved* (Psalm 80:7). The blessing is repeated as the cry of the two-house people: the shining of the face of Yahuah is their restoration, the priestly word made the hope of the exiled.'),
    ('canon','numbers',6,25,'canon','psalms',80,19,'free',
     E'*Turn us again, O Yahuah Elohim (LORD God) of hosts, cause thy face to shine; and we shall be saved* (Psalm 80:19). The third and climactic refrain names Yahuah Elohim and asks for the shining face of Numbers 6:25 — the blessing of Aaron prayed back as the gathering and saving of Yashar''el.'),
    ('canon','numbers',6,26,'canon','philippians',4,7,'free',
     E'*And the peace of Elohim (God), which passeth all understanding, shall keep your hearts and minds through HaMashiach Yahusha (Christ Jesus)* (Philippians 4:7). The crown of the Aaronic blessing, *Yahuah (LORD) lift up his countenance upon thee, and give thee peace* (Numbers 6:26), is the peace that guards the heart — the shalom of Yahuah given through the Formed Son.'),
    ('canon','numbers',6,26,'canon','john',14,27,'free',
     E'*Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you. Let not your heart be troubled, neither let it be afraid* (John 14:27). The final gift of the priestly blessing, *and give thee peace* (Numbers 6:26), is spoken from the mouth of Yahusha himself — the very peace of Yahuah bestowed on his own.'),

    -- THREAD 5: they shall put my name upon the children of Yashar'el (6:27)
    ('canon','numbers',6,27,'canon','deuteronomy',28,10,'free',
     E'*And all people of the earth shall see that thou art called by the name of Yahuah (LORD); and they shall be afraid of thee* (Deuteronomy 28:10). The promise that *they shall put my name upon the children of Yashar''el (Israel)* (Numbers 6:27) becomes covenant identity: the people who bear the Name are known by it before all the earth.'),
    ('canon','numbers',6,27,'canon','isaiah',43,7,'free',
     E'*Even every one that is called by my name: for I have created him for my glory, I have formed him; yea, I have made him* (Isaiah 43:7). The Name set upon Yashar''el in Numbers 6:27 is the mark of those *called by my name*, created and formed by Yahuah for his glory — the gathered remnant of the two houses.'),
    ('canon','numbers',6,27,'canon','revelation',22,4,'free',
     E'*And they shall see his face; and his name shall be in their foreheads* (Revelation 22:4). The blessing that joins the shining face to the Name set upon the people reaches its consummation: the redeemed *see his face* (the blessing of Numbers 6:25) and bear *his name* (Numbers 6:27) in their foreheads forever.'),
    ('canon','numbers',6,27,'canon','revelation',14,1,'free',
     E'*And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads* (Revelation 14:1). The Name placed upon the children of Yashar''el — *they shall put my name upon the children of Yashar''el (Israel)* (Numbers 6:27) — is sealed at the last on the foreheads of the gathered, the Father''s own Name.'),
    ('canon','numbers',6,27,'canon','john',17,11,'free',
     E'*Holy Father, keep through thine own name those whom thou hast given me, that they may be one, as we are* (John 17:11). The Son prays the heart of Numbers 6:27 — *they shall put my name upon the children of Yashar''el (Israel); and I will bless them* — asking the Father to keep his people through that very Name, and to make the two houses one.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =========================================================================
-- C. THREADS
-- =========================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-6-the-nazarite-vow-of-separation-holy-unto-yahuah',
       E'The Nazarite Vow of Separation — Holy unto Yahuah',
       E'When *either man or woman shall separate themselves to vow a vow of a Nazarite, to separate themselves unto Yahuah (LORD)* (Numbers 6:2), three signs mark the consecration: *He shall separate himself from wine and strong drink* (Numbers 6:3), *there shall no razor come upon his head* (Numbers 6:5), and he *shall come at no dead body* (Numbers 6:6) — *all the days of his separation he is holy unto Yahuah (LORD)* (Numbers 6:8). This is the lens of set-apart holiness running through the whole canon. Samson is a Nazarite *from the womb* (Judges 13:5; 13:7); Hannah binds Samuel with *there shall no razor come upon his head* (1 Samuel 1:11). The vow lives on in Yashar''el centuries later — *the Nazarites they stirred up, who had accomplished their days* (1 Maccabees 3:49). And it is consummated in John the Baptist, who shall *drink neither wine nor strong drink; and he shall be filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb* (Luke 1:15) — the separated one who prepares the way of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 23625
  FROM _s312_num06_lookup sv, _s312_num06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-6-the-completed-vow-and-pauls-torah-keeping-in-acts',
       E'The Completed Vow — and Paul''s Torah-Keeping in Acts',
       E'When *the days of his separation are fulfilled* the Nazarite *shall be brought unto the door of the tabernacle of the congregation* (Numbers 6:13) to bring his offerings — *he shall offer his offering unto Yahuah (LORD)* (Numbers 6:14) — and *the Nazarite shall shave the head of his separation... and put it in the fire which is under the sacrifice of the peace offerings* (Numbers 6:18). This law of the completed vow was no relic of a bygone age. Paul himself keeps it: *having shorn his head in Cenchrea: for he had a vow* (Acts 18:18). In Yerushalayim he is asked to join *four men which have a vow on them* (Acts 21:23), to *purify thyself with them, and be at charges with them, that they may shave their heads... that thou thyself also walkest orderly, and keepest the law* (Acts 21:24), and *the next day purifying himself with them entered into the temple, to signify the accomplishment of the days of purification, until that an offering should be offered for every one of them* (Acts 21:26). The Nazarite Torah of Numbers 6 is the very proof that the apostle walks in the law — Torah affirmed, never abolished.',
       sv.verse_id, ev.verse_id, 'free', 23628
  FROM _s312_num06_lookup sv, _s312_num06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=6 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-6-the-priestly-office-of-blessing',
       E'The Priestly Office of Blessing',
       E'*Speak unto Aaron and unto his sons, saying, On this wise ye shall bless the children of Yashar''el (Israel)* (Numbers 6:23). To bless the people is a priestly office, a charge given by Yahuah himself. It reaches its highest fulfilment in Yahusha the Formed Son: as he ascends, *he led them out as far as to Bethany, and he lifted up his hands, and blessed them* (Luke 24:50). The lifted hands of the High Priest over his people — the very gesture of the Aaronic charge — close the Gospel as he is parted from them into heaven.',
       sv.verse_id, ev.verse_id, 'free', 23631
  FROM _s312_num06_lookup sv, _s312_num06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-6-the-aaronic-blessing-of-the-shining-face',
       E'The Aaronic Blessing of the Shining Face',
       E'*Yahuah (LORD) bless thee, and keep thee: Yahuah (LORD) make his face shine upon thee, and be gracious unto thee: Yahuah (LORD) lift up his countenance upon thee, and give thee peace* (Numbers 6:24-26). The threefold blessing of the shining face becomes the heartbeat of the Psalms. All Yashar''el prays it: *Elohim (God) be merciful unto us, and bless us; and cause his face to shine upon us* (Psalm 67:1); *Yahuah (LORD), lift thou up the light of thy countenance upon us* (Psalm 4:6). The scattered flock pleads it as their regathering and salvation in the threefold refrain of Psalm 80 — *cause thy face to shine; and we shall be saved* (Psalm 80:3; 80:7; 80:19). And the final word of the blessing, *and give thee peace* (Numbers 6:26), is fulfilled in the Formed Son: *the peace of Elohim (God), which passeth all understanding, shall keep your hearts and minds through HaMashiach Yahusha (Christ Jesus)* (Philippians 4:7) — for he says, *my peace I give unto you* (John 14:27).',
       sv.verse_id, ev.verse_id, 'free', 23634
  FROM _s312_num06_lookup sv, _s312_num06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=6 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-6-they-shall-put-my-name-upon-the-children-of-yasharel',
       E'They Shall Put My Name upon the Children of Yashar''el',
       E'*And they shall put my name upon the children of Yashar''el (Israel); and I will bless them* (Numbers 6:27). The heart of the priestly blessing is the placing of the Name of Yahuah upon his people. To bear the Name is covenant identity: *all people of the earth shall see that thou art called by the name of Yahuah (LORD)* (Deuteronomy 28:10), the mark of *every one that is called by my name: for I have created him for my glory, I have formed him* (Isaiah 43:7). The Son prays this very thing — *Holy Father, keep through thine own name those whom thou hast given me, that they may be one* (John 17:11) — binding the Name to the making of the two houses one. And it is sealed at the consummation: the gathered stand with *his Father''s name written in their foreheads* (Revelation 14:1), and *they shall see his face; and his name shall be in their foreheads* (Revelation 22:4) — the shining face of Numbers 6:25 and the Name of Numbers 6:27 made one forever.',
       sv.verse_id, ev.verse_id, 'free', 23637
  FROM _s312_num06_lookup sv, _s312_num06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=6 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- =========================================================================
-- D. THREAD MEMBERS
-- =========================================================================

-- THREAD 1: the Nazarite vow of separation (6:1-8)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 13:5 — *no razor shall come on his head: for the child shall be a Nazarite unto Elohim (God) from the womb* (Judges 13:5); Samson lives out *there shall no razor come upon his head* (Numbers 6:5).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-nazarite-vow-of-separation-holy-unto-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 13:7 — *drink no wine nor strong drink, neither eat any unclean thing: for the child shall be a Nazarite to Elohim (God)* (Judges 13:7); the wine-and-strong-drink mark of *He shall separate himself from wine and strong drink* (Numbers 6:3).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-nazarite-vow-of-separation-holy-unto-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 1:11 — *I will give him unto Yahuah (LORD)... and there shall no razor come upon his head* (1 Samuel 1:11); Hannah dedicates Samuel with the sign of *there shall no razor come upon his head* (Numbers 6:5).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-nazarite-vow-of-separation-holy-unto-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Luke 1:15 — *shall drink neither wine nor strong drink; and he shall be filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb* (Luke 1:15); John the Baptist, the Nazarite consummated, fulfils *wine and strong drink* (Numbers 6:3).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-nazarite-vow-of-separation-holy-unto-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Maccabees 3:49 (extras) — *the Nazarites they stirred up, who had accomplished their days* (1 Maccabees 3:49); the living witness that *all the days of his separation he is holy unto Yahuah (LORD)* (Numbers 6:8) endured in Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s312_num06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-nazarite-vow-of-separation-holy-unto-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the completed vow and Paul's Torah-keeping in Acts (6:9-21)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Acts 18:18 — *having shorn his head in Cenchrea: for he had a vow* (Acts 18:18); Paul keeps the Nazarite close, *the Nazarite shall shave the head of his separation* (Numbers 6:18).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=18
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=18 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-completed-vow-and-pauls-torah-keeping-in-acts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Acts 21:23 — *We have four men which have a vow on them* (Acts 21:23); the Nazarite vow of Numbers 6 still performed in Yerushalayim.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=18
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=21 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-completed-vow-and-pauls-torah-keeping-in-acts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Acts 21:24 — *purify thyself with them... that thou thyself also walkest orderly, and keepest the law* (Acts 21:24); the Nazarite Torah, *he shall be brought unto the door of the tabernacle* (Numbers 6:13), proves Paul keeps the law.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=21 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-completed-vow-and-pauls-torah-keeping-in-acts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 21:26 — *entered into the temple... until that an offering should be offered for every one of them* (Acts 21:26); Paul brings the required offerings, *he shall offer his offering unto Yahuah (LORD)* (Numbers 6:14).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=21 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-completed-vow-and-pauls-torah-keeping-in-acts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: the priestly office of blessing (6:22-23)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Luke 24:50 — *he lifted up his hands, and blessed them* (Luke 24:50); the Formed Son fulfils the priestly charge *On this wise ye shall bless the children of Yashar''el (Israel)* (Numbers 6:23).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=50
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-priestly-office-of-blessing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: the Aaronic blessing of the shining face (6:24-26)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 67:1 — *bless us; and cause his face to shine upon us* (Psalm 67:1); the prayer of *Yahuah (LORD) make his face shine upon thee, and be gracious unto thee* (Numbers 6:25).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=67 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-aaronic-blessing-of-the-shining-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 4:6 — *Yahuah (LORD), lift thou up the light of thy countenance upon us* (Psalm 4:6); David prays the shining face of *Yahuah (LORD) make his face shine upon thee* (Numbers 6:25).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-aaronic-blessing-of-the-shining-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 80:3 — *cause thy face to shine; and we shall be saved* (Psalm 80:3); the scattered flock pleads the blessing of Numbers 6:25 as their salvation.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-aaronic-blessing-of-the-shining-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 80:7 — *cause thy face to shine; and we shall be saved* (Psalm 80:7); the repeated refrain of the two-house people takes up Numbers 6:25.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-aaronic-blessing-of-the-shining-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 80:19 — *Yahuah Elohim (LORD God) of hosts, cause thy face to shine; and we shall be saved* (Psalm 80:19); the climactic refrain prays the shining face of Numbers 6:25 as the regathering of Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-aaronic-blessing-of-the-shining-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Philippians 4:7 — *the peace of Elohim (God), which passeth all understanding, shall keep your hearts and minds* (Philippians 4:7); the crown of the blessing, *and give thee peace* (Numbers 6:26).'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=26
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-aaronic-blessing-of-the-shining-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'John 14:27 — *my peace I give unto you: not as the world giveth, give I unto you* (John 14:27); the final gift of *and give thee peace* (Numbers 6:26) from the mouth of Yahusha himself.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=26
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-the-aaronic-blessing-of-the-shining-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: they shall put my name upon the children of Yashar'el (6:27)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 28:10 — *all people of the earth shall see that thou art called by the name of Yahuah (LORD)* (Deuteronomy 28:10); the Name set upon the people, *they shall put my name upon the children of Yashar''el (Israel)* (Numbers 6:27), becomes covenant identity.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=27
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-they-shall-put-my-name-upon-the-children-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 43:7 — *every one that is called by my name: for I have created him for my glory, I have formed him* (Isaiah 43:7); the people who bear the Name of Numbers 6:27 are Yahuah''s own, formed for his glory.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=27
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-they-shall-put-my-name-upon-the-children-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'John 17:11 — *Holy Father, keep through thine own name those whom thou hast given me, that they may be one* (John 17:11); the Son prays the heart of Numbers 6:27, the Name keeping the people and making the two houses one.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=27
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-they-shall-put-my-name-upon-the-children-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Revelation 14:1 — *an hundred forty and four thousand, having his Father''s name written in their foreheads* (Revelation 14:1); the Name placed on Yashar''el in Numbers 6:27 sealed at the last on the gathered.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=27
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-they-shall-put-my-name-upon-the-children-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Revelation 22:4 — *they shall see his face; and his name shall be in their foreheads* (Revelation 22:4); the shining face of Numbers 6:25 and the Name of Numbers 6:27 made one forever.'
  FROM cross_reference_threads t
  JOIN _s312_num06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=6 AND sv.verse_number=27
  JOIN _s312_num06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-6-they-shall-put-my-name-upon-the-children-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_7.sql (Numbers 7) -----
-- Chapter: Numbers 7 — the dedication of the tabernacle: the princes' offerings and the Voice from the mercy seat
-- Tag: num07  |  session prefix: s312  |  temp view: _s312_num07_lookup
-- Sort band base: 23650 step 3  ->  23650, 23653, 23656
--
-- Numbers 7 coverage:
--   v.1-9 (Moses anoints and sanctifies the tabernacle; the princes bring six wagons and twelve oxen for
--          Gershon and Merari; the Kohathites get none, for they bear the holy things upon their shoulders):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 4:15 (the sons of Kohath bear upon their shoulders, touch not lest they die)
--   v.10-88 (the twelve tribal princes each bring the SAME dedication offering, one prince per day —
--            equal honour for every tribe before Yahuah):
--        NT:     Revelation 21:12 (twelve gates, the twelve tribes); Revelation 21:14 (twelve foundations, the apostles) — the twelve equal at the consummation
--        Extras: none warranted
--        Tanakh: Numbers 2:2 (every man by his own standard, the ensign of his father's house); Numbers 2:34 (so they pitched and set forward, every one after the house of their fathers) — the ordered twelve tribes
--   v.89 (Moses hears the VOICE of one speaking from off the mercy seat, from between the two cherubims):
--        NT:     Hebrews 4:16 (come boldly unto the throne of grace); Hebrews 9:5 (the cherubims of glory shadowing the mercyseat)
--        Extras: none warranted
--        Tanakh: Exodus 25:22 (there I will meet with thee... from between the two cherubims)
--
-- Threads (slug -> target libraries):
--   numbers-7-the-kohathites-bear-the-holy-things-upon-their-shoulders  [canon Tanakh]  (Num 4:15)
--   numbers-7-the-twelve-tribes-equal-devotion-each-prince-on-his-day  [canon Tanakh + NT]  (Num 2:2, 2:34; Rev 21:12, 21:14)
--   numbers-7-the-voice-from-off-the-mercy-seat-between-the-two-cherubims  [canon Tanakh + NT]  (Exod 25:22; Heb 4:16, 9:5)
--
-- Framework notes:
--   * 7:7-9 — the wagons are distributed by service: Gershon (soft furnishings) and Merari (heavy frame)
--     ride; but the Kohathites get none "because the service of the sanctuary belonging unto them was that
--     they should bear upon their shoulders" — exactly the burden-law of Numbers 4:15. The holy things are
--     never carried by cart; they ride on the shoulders of men set apart. The Torah ordinance stands intact.
--   * 7:10-88 — the long repetition is the point: twelve tribes, one identical offering, one prince per day,
--     equal honour. This is the ordered twelve of Numbers 2 (each by his standard) and forward the twelve
--     gates and twelve foundations of the New Jerusalem (Rev 21:12,14) — the tribes of Yashar'el (Israel)
--     and the apostles of the Lamb, equal at the consummation. Two-house frame: all twelve tribes are
--     honoured alike before Yahuah, none excluded, the whole people gathered round the one dwelling.
--   * 7:89 ★★ — the Voice from off the mercy seat between the two cherubims is Yahuah (LORD) meeting Moses
--     exactly where Exodus 25:22 promised. This is the Formed Son speaking — the One who appeared and spoke
--     in the Tanakh — and Hebrews carries it forward to the throne of grace and the cherubims of glory
--     shadowing the mercyseat. The meeting place is the propitiatory, the place of mercy.

CREATE TEMP VIEW _s312_num07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the Kohathites bear the holy things upon their shoulders
    ('canon','numbers',7,9,'canon','numbers',4,15,'free',
     E'*And when Aaron and his sons have made an end of covering the sanctuary, and all the vessels of the sanctuary, as the camp is to set forward; after that, the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die. These things are the burden of the sons of Kohath in the tabernacle of the congregation.* (Numbers 4:15) The wagons go to Gershon and Merari, but *unto the sons of Kohath he gave none: because the service of the sanctuary belonging unto them was that they should bear upon their shoulders* (Numbers 7:9) — the holy things ride on no cart; they are carried on the shoulders of men set apart, exactly the ordinance of Numbers 4. The Torah law stands, not abolished.'),

    -- Thread 2: the twelve tribes, equal devotion, each prince on his day
    ('canon','numbers',7,11,'canon','numbers',2,2,'free',
     E'*Every man of the children of Yashar''el (Israel) shall pitch by his own standard, with the ensign of their father''s house: far off about the tabernacle of the congregation shall they pitch.* (Numbers 2:2) The same ordered twelve that pitched by their standards now offer in order — *They shall offer their offering, each prince on his day, for the dedicating of the altar* (Numbers 7:11). Each tribe in its turn, none crowding out another, the whole people arrayed round the one dwelling.'),
    ('canon','numbers',7,84,'canon','numbers',2,34,'free',
     E'*And the children of Yashar''el (Israel) did according to all that Yahuah (LORD) commanded Moses: so they pitched by their standards, and so they set forward, every one after their families, according to the house of their fathers.* (Numbers 2:34) The dedication is summed by tribe and house — *This was the dedication of the altar... by the princes of Yashar''el (Israel): twelve chargers of silver, twelve silver bowls, twelve spoons of gold* (Numbers 7:84) — the obedient ordered twelve, each father''s house bringing its equal portion.'),
    ('canon','numbers',7,84,'canon','revelation',21,12,'free',
     E'*And had a wall great and high, and had twelve gates, and at the gates twelve angels, and names written thereon, which are the names of the twelve tribes of the children of Yashar''el (Israel)* (Revelation 21:12) The twelve equal offerings of the princes — *twelve chargers of silver, twelve silver bowls, twelve spoons of gold* (Numbers 7:84) — reach forward to the twelve gates of the New Jerusalem, every tribe of Yashar''el (Israel) named and honoured in the city to come.'),
    ('canon','numbers',7,84,'canon','revelation',21,14,'free',
     E'*And the wall of the city had twelve foundations, and in them the names of the twelve apostles of the Lamb.* (Revelation 21:14) The twelve tribes'' equal devotion at the dedication — *twelve... twelve... twelve* (Numbers 7:84) — is matched at the consummation by the twelve foundations; the tribes in the gates and the apostles in the foundations, the one people gathered, none above another.'),

    -- Thread 3: the Voice from off the mercy seat, between the two cherubims
    ('canon','numbers',7,89,'canon','exodus',25,22,'free',
     E'*And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony, of all things which I will give thee in commandment unto the children of Yashar''el (Israel).* (Exodus 25:22) The promise made at the building is now kept at the dedication — *when Moses was gone into the tabernacle of the congregation to speak with him, then he heard the voice of one speaking unto him from off the mercy seat... from between the two cherubims: and he spake unto him* (Numbers 7:89). Yahuah (LORD) meets Moses at the exact place He named; the Formed Son speaks from the propitiatory.'),
    ('canon','numbers',7,89,'canon','hebrews',9,5,'free',
     E'*And over it the cherubims of glory shadowing the mercyseat; of which we can not now speak particularly.* (Hebrews 9:5) The very furniture of Numbers 7:89 is named in the heavenly pattern — *the voice of one speaking unto him from off the mercy seat... from between the two cherubims* (Numbers 7:89) — the cherubims of glory overshadow the place where Yahuah (LORD) speaks, the meeting-place of mercy.'),
    ('canon','numbers',7,89,'canon','hebrews',4,16,'free',
     E'*Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need.* (Hebrews 4:16) The mercy seat from which Moses heard *the voice of one speaking unto him* (Numbers 7:89) is the throne of grace; what was approached only by Moses at the ark is carried forward as the throne where mercy is obtained — the place of meeting becomes the place of grace.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-7-the-kohathites-bear-the-holy-things-upon-their-shoulders',
       E'The Kohathites Bear the Holy Things Upon Their Shoulders',
       E'When the tabernacle is set up and anointed, the princes bring *six covered wagons, and twelve oxen* (Numbers 7:3), and Yahuah (LORD) tells Moses to *give them unto the Levites, to every man according to his service* (Numbers 7:5). The wagons go where they are useful: *two wagons and four oxen he gave unto the sons of Gershon* (Numbers 7:7) for the curtains and coverings, and *four wagons and eight oxen he gave unto the sons of Merari* (Numbers 7:8) for the boards and pillars. But one house receives nothing: *unto the sons of Kohath he gave none: because the service of the sanctuary belonging unto them was that they should bear upon their shoulders* (Numbers 7:9). The most holy things never ride on a cart — they are carried on the shoulders of the men set apart, exactly as the burden-law commands: *the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die. These things are the burden of the sons of Kohath* (Numbers 4:15). The gift of wagons does not loosen the ordinance; it confirms it. What is most holy is borne, not wheeled — the Torah law of the sanctuary stands intact.',
       sv.verse_id, ev.verse_id, 'free', 23650
  FROM _s312_num07_lookup sv, _s312_num07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-7-the-twelve-tribes-equal-devotion-each-prince-on-his-day',
       E'The Twelve Tribes, Equal Devotion — Each Prince on His Day',
       E'The longest chapter in the Torah is mostly the same words twelve times over, and the repetition is the message. *They shall offer their offering, each prince on his day, for the dedicating of the altar* (Numbers 7:11) — Nahshon of Yahudah (Judah) on the first day, then Issachar, then Zebulun, Reuben, Simeon, Gad, Ephraim, Manasseh, Benjamin, Dan, Asher, and Naphtali, each bringing the identical *one silver charger... one silver bowl... one spoon of ten shekels of gold, full of incense* and the same beasts (Numbers 7:13-14). No tribe gives more, none gives less; no tribe is named first by rank and the rest as afterthoughts — each has its own day, its full account written out in full. This is the ordered twelve of the camp: *every man of the children of Yashar''el (Israel) shall pitch by his own standard, with the ensign of their father''s house* (Numbers 2:2), who *did according to all that Yahuah (LORD) commanded Moses: so they pitched by their standards... according to the house of their fathers* (Numbers 2:34). The summary counts them up in equal twelves: *twelve chargers of silver, twelve silver bowls, twelve spoons of gold* (Numbers 7:84). And the equal honour of the twelve tribes reaches forward to the city: *twelve gates... the names of the twelve tribes of the children of Yashar''el (Israel)* (Revelation 21:12), and *twelve foundations, and in them the names of the twelve apostles of the Lamb* (Revelation 21:14). The whole people — every tribe, both houses — stands alike before Yahuah (LORD), none above another, gathered round the one dwelling.',
       sv.verse_id, ev.verse_id, 'free', 23653
  FROM _s312_num07_lookup sv, _s312_num07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=7 AND ev.verse_number=88
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-7-the-voice-from-off-the-mercy-seat-between-the-two-cherubims',
       E'The Voice from Off the Mercy Seat, Between the Two Cherubims',
       E'The chapter ends not with another offering but with a meeting: *And when Moses was gone into the tabernacle of the congregation to speak with him, then he heard the voice of one speaking unto him from off the mercy seat that was upon the ark of testimony, from between the two cherubims: and he spake unto him* (Numbers 7:89). This is the promise of Exodus kept to the letter: *there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony* (Exodus 25:22). Yahuah (LORD) meets Moses at the exact place He named — the propitiatory, the place of covering — and the Voice that speaks is the Formed Son, the One who appeared and spoke and led Yashar''el (Israel) throughout the Tanakh, Yahuah (LORD) who has a Father. The same furniture is named in the heavenly pattern: *over it the cherubims of glory shadowing the mercyseat* (Hebrews 9:5). And the meeting-place of mercy becomes the throne every believer is bidden to: *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need* (Hebrews 4:16). Where Moses alone heard the Voice between the cherubims, the throne of grace is now approached — the place of meeting is the place of mercy.',
       sv.verse_id, ev.verse_id, 'free', 23656
  FROM _s312_num07_lookup sv, _s312_num07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=89
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=7 AND ev.verse_number=89
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the sons of Kohath shall come to bear it... they shall not touch any holy thing, lest they die* (Numbers 4:15) — the wagons go to others; Kohath bears the holy things on the shoulder, the ordinance intact.'
  FROM cross_reference_threads t
  JOIN _s312_num07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s312_num07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-7-the-kohathites-bear-the-holy-things-upon-their-shoulders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*every man... shall pitch by his own standard, with the ensign of their father''s house* (Numbers 2:2) — the ordered twelve of the camp now offer in order, each prince on his day.'
  FROM cross_reference_threads t
  JOIN _s312_num07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s312_num07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-7-the-twelve-tribes-equal-devotion-each-prince-on-his-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*so they pitched by their standards... according to the house of their fathers* (Numbers 2:34) — the obedient ordered twelve, each father''s house bringing its equal portion to the dedication.'
  FROM cross_reference_threads t
  JOIN _s312_num07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=84
  JOIN _s312_num07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=2 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-7-the-twelve-tribes-equal-devotion-each-prince-on-his-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*twelve gates... the names of the twelve tribes of the children of Yashar''el (Israel)* (Revelation 21:12) — the twelve equal offerings reach forward to the twelve gates of the New Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s312_num07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=84
  JOIN _s312_num07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-7-the-twelve-tribes-equal-devotion-each-prince-on-his-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*twelve foundations, and in them the names of the twelve apostles of the Lamb* (Revelation 21:14) — tribes in the gates, apostles in the foundations: the one people, none above another.'
  FROM cross_reference_threads t
  JOIN _s312_num07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=84
  JOIN _s312_num07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-7-the-twelve-tribes-equal-devotion-each-prince-on-his-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*there I will meet with thee... from between the two cherubims* (Exodus 25:22) — the promise made at the building, kept to the letter at the dedication.'
  FROM cross_reference_threads t
  JOIN _s312_num07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=89
  JOIN _s312_num07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-7-the-voice-from-off-the-mercy-seat-between-the-two-cherubims'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the cherubims of glory shadowing the mercyseat* (Hebrews 9:5) — the very furniture of Numbers 7:89, the place where Yahuah (LORD) speaks.'
  FROM cross_reference_threads t
  JOIN _s312_num07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=89
  JOIN _s312_num07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-7-the-voice-from-off-the-mercy-seat-between-the-two-cherubims'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*come boldly unto the throne of grace... obtain mercy* (Hebrews 4:16) — the mercy seat where Moses heard the Voice becomes the throne of grace approached for mercy.'
  FROM cross_reference_threads t
  JOIN _s312_num07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=7 AND sv.verse_number=89
  JOIN _s312_num07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-7-the-voice-from-off-the-mercy-seat-between-the-two-cherubims'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_8.sql (Numbers 8) -----
--
-- Book: Numbers   Chapter: 8   Tag: num08   Session prefix: s312
-- Sort band base: 23675  step 3  (23675, 23678, 23681)
-- Temp view: _s312_num08_lookup
--
-- Numbers 8 coverage:
--   v.1-4 (seven lamps over against the candlestick):
--        NT:     Revelation 1:12-13,20 (seven golden candlesticks / Son of Adam in midst),
--                Revelation 4:5 (seven lamps of fire = seven Spirits) — both warranted
--        Extras: none warranted (no clean lampstand witness in the restored library for this weave)
--        Tanakh: Exodus 25:31,37 (the candlestick / seven lamps pattern), Zechariah 4:2 (golden candlestick, seven lamps) — both warranted
--   v.5-19 (Levites cleansed, wave-offered, taken instead of the firstborn, given as a gift, to make atonement):
--        NT:     Romans 12:1 (present your bodies a living sacrifice = the wave-offering of consecrated lives) — warranted
--        Extras: none warranted
--        Tanakh: Numbers 3:12, 3:13, 3:45 (Levites taken instead of the firstborn — the institution this chapter enacts) — warranted
--   v.20-22 (it was done as Yahuah commanded): NT none warranted / Extras none / Tanakh covered by v.5-19 thread; no add
--   v.23-26 (service twenty-five to fifty, then cease the burden, minister but do no service):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 4:3 (thirty to fifty, enter the host), 1 Chronicles 23:24, 23:26 (David's lowered age / no more carry the tabernacle) — warranted
--
-- Threads:
--   numbers-8-the-seven-lamps-give-light-over-against-the-candlestick  (sort 23675, tier free)
--       targets: canon NT Revelation 1 + Revelation 4; canon Tanakh Exodus 25 + Zechariah 4
--   numbers-8-the-levites-given-as-a-gift-instead-of-the-firstborn      (sort 23678, tier free)
--       targets: canon Tanakh Numbers 3; canon NT Romans 12
--   numbers-8-the-term-of-service-and-the-honoured-rest                  (sort 23681, tier free)
--       targets: canon Tanakh Numbers 4 + 1 Chronicles 23
--
-- Framework notes: the seven lamps read FORWARD to the seven assemblies and the seven Spirits
-- (Rev 1/4) and LATERALLY to the pattern (Exod 25) and the prophet's vision (Zech 4 — the two
-- anointed ones feeding the lampstand). The Levites taken INSTEAD of the firstborn and offered
-- as a wave-offering = the gift of consecrated lives, fulfilled in Romans 12:1's living
-- sacrifice. No Torah-as-curse reading; the priesthood and its appointed service stand.

CREATE TEMP VIEW _s312_num08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the seven lamps
    ('canon','numbers',8,2,'canon','revelation',1,12,'free',
     E'*And being turned, I saw seven golden candlesticks* (Revelation 1:12). The lamps that *shall give light over against the candlestick* (Numbers 8:2) are gathered up in the seven golden candlesticks John sees — the same beaten-gold light, now read as the assemblies before Yahuah (LORD).'),
    ('canon','numbers',8,2,'canon','revelation',1,13,'free',
     E'*And in the midst of the seven candlesticks one like unto the Son of Adam, clothed with a garment down to the foot, and girt about the paps with a golden girdle* (Revelation 1:13). Aaron tends the seven lamps; the Formed Son Himself stands *in the midst* of the lampstands He once gave light to give light *over against the candlestick* (Numbers 8:2).'),
    ('canon','numbers',8,2,'canon','revelation',1,20,'free',
     E'*The seven stars are the angels of the seven churches: and the seven candlesticks which thou sawest are the seven churches* (Revelation 1:20). The mystery is named: the *seven lamps* of Numbers 8:2 read forward to the seven assemblies, the gathered people that *give light* before Yahuah (LORD).'),
    ('canon','numbers',8,2,'canon','revelation',4,5,'free',
     E'*and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God)* (Revelation 4:5). The *seven lamps* commanded to *give light over against the candlestick* (Numbers 8:2) burn at last *before the throne* itself — the sevenfold Spirit of Elohim (God).'),
    ('canon','numbers',8,2,'canon','exodus',25,31,'free',
     E'*And thou shalt make a candlestick of pure gold: of beaten work shall the candlestick be made: his shaft, and his branches, his bowls, his knops, and his flowers, shall be of the same* (Exodus 25:31). The lamps Aaron lights in Numbers 8:2 sit upon the very candlestick of *beaten gold* commanded at Sinai — *according unto the pattern which Yahuah (LORD) had shewed Moses* (Numbers 8:4).'),
    ('canon','numbers',8,2,'canon','exodus',25,37,'free',
     E'*And thou shalt make the seven lamps thereof: and they shall light the lamps thereof, that they may give light over against it* (Exodus 25:37). The command is fulfilled almost word for word: the *seven lamps shall give light over against the candlestick* (Numbers 8:2).'),
    ('canon','numbers',8,2,'canon','zechariah',4,2,'free',
     E'*I have looked, and behold a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon, and seven pipes to the seven lamps* (Zechariah 4:2). The prophet sees the same golden candlestick with *his seven lamps*, fed by the two anointed ones — the lampstand of Numbers 8:2 carried into prophecy.'),
    -- Thread 2: the Levites given instead of the firstborn
    ('canon','numbers',8,16,'canon','numbers',3,12,'free',
     E'*And I, behold, I have taken the Levites from among the children of Yashar''el (Israel) instead of all the firstborn that openeth the matrix among the children of Yashar''el (Israel): therefore the Levites shall be mine* (Numbers 3:12). This is the institution Numbers 8 now enacts: the Levites taken *instead of such as open every womb, even instead of the firstborn* (Numbers 8:16).'),
    ('canon','numbers',8,17,'canon','numbers',3,13,'free',
     E'*Because all the firstborn are mine; for on the day that I smote all the firstborn in the land of Egypt I hallowed unto me all the firstborn in Yashar''el (Israel), both man and beast: mine shall they be: I am Yahuah (LORD)* (Numbers 3:13). The Passover night is the ground: *on the day that I smote every firstborn in the land of Egypt I sanctified them for myself* (Numbers 8:17).'),
    ('canon','numbers',8,18,'canon','numbers',3,45,'free',
     E'*Take the Levites instead of all the firstborn among the children of Yashar''el (Israel), and the cattle of the Levites instead of their cattle; and the Levites shall be mine: I am Yahuah (LORD)* (Numbers 3:45). The exchange is sealed: *And I have taken the Levites for all the firstborn of the children of Yashar''el (Israel)* (Numbers 8:18).'),
    ('canon','numbers',8,11,'canon','romans',12,1,'free',
     E'*I beseech you therefore, brethren, by the mercies of Elohim (God), that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service* (Romans 12:1). The Levites *offered... before Yahuah (LORD) for an offering* (Numbers 8:11) — a wave-offering of living men, not slain beasts — are the pattern of bodies presented *a living sacrifice* for *the service of Yahuah (LORD)*.'),
    -- Thread 3: term of service and honoured rest
    ('canon','numbers',8,24,'canon','numbers',4,3,'free',
     E'*From thirty years old and upward even until fifty years old, all that enter into the host, to do the work in the tabernacle of the congregation* (Numbers 4:3). The earlier muster set the burden-bearers at thirty to fifty; here the entering age is lowered: *from twenty and five years old and upward they shall go in to wait upon the service* (Numbers 8:24).'),
    ('canon','numbers',8,25,'canon','1-chronicles',23,24,'free',
     E'*These were the sons of Levi after the house of their fathers... that did the work for the service of the house of Yahuah (LORD), from the age of twenty years and upward* (1 Chronicles 23:24). David lowers the entering age again as the work changes — the same flexing of the Levites'' term that begins where they *cease waiting upon the service* (Numbers 8:25).'),
    ('canon','numbers',8,26,'canon','1-chronicles',23,26,'free',
     E'*And also unto the Levites; they shall no more carry the tabernacle, nor any vessels of it for the service thereof* (1 Chronicles 23:26). The burden is lifted in the settled land; the honoured rest foreshadowed when the aged Levite *shall do no service* but *shall minister with their brethren* (Numbers 8:26).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-8-the-seven-lamps-give-light-over-against-the-candlestick',
       E'The seven lamps give light over against the candlestick',
       E'Aaron is told, *When thou lightest the lamps, the seven lamps shall give light over against the candlestick* (Numbers 8:2), and the candlestick itself is *of beaten gold... according unto the pattern which Yahuah (LORD) had shewed Moses* (Numbers 8:4) — the very pattern given at Sinai: *And thou shalt make the seven lamps thereof: and they shall light the lamps thereof, that they may give light over against it* (Exodus 25:37; cf. *a candlestick of pure gold: of beaten work*, Exodus 25:31). The prophet Zechariah sees the same lampstand — *a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon* (Zechariah 4:2) — fed by the two anointed ones. And the apostle John sees it consummated: *I saw seven golden candlesticks* (Revelation 1:12), with *one like unto the Son of Adam* standing *in the midst of the seven candlesticks* (Revelation 1:13); the mystery is named, *the seven candlesticks which thou sawest are the seven churches* (Revelation 1:20), and the seven lamps burn *before the throne, which are the seven Spirits of Elohim (God)* (Revelation 4:5). The single seven-lamped light kindled in the wilderness is the gathered people that *give light* before Yahuah (LORD), the Formed Son in their midst.',
       sv.verse_id, ev.verse_id, 'free', 23675
  FROM _s312_num08_lookup sv, _s312_num08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-8-the-levites-given-as-a-gift-instead-of-the-firstborn',
       E'The Levites given as a gift instead of the firstborn',
       E'The Levites are cleansed — *Sprinkle water of purifying upon them, and let them shave all their flesh, and let them wash their clothes* (Numbers 8:7) — and then *Aaron shall offer the Levites before Yahuah (LORD) for an offering of the children of Yashar''el (Israel)* (Numbers 8:11), the whole congregation laying hands on them. They are a wave-offering of living men. The ground is the Passover claim: *For all the firstborn of the children of Yashar''el (Israel) are mine... on the day that I smote every firstborn in the land of Egypt I sanctified them for myself* (Numbers 8:17), and so *I have taken the Levites for all the firstborn* (Numbers 8:18). This enacts what was first declared earlier: *I have taken the Levites... instead of all the firstborn that openeth the matrix... therefore the Levites shall be mine* (Numbers 3:12), *because all the firstborn are mine* (Numbers 3:13), *and the Levites shall be mine: I am Yahuah (LORD)* (Numbers 3:45). And the apostle reads the wave-offering forward to every consecrated life: *that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service* (Romans 12:1). The gift of redeemed firstborn becomes the gift of bodies offered up.',
       sv.verse_id, ev.verse_id, 'free', 23678
  FROM _s312_num08_lookup sv, _s312_num08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-8-the-term-of-service-and-the-honoured-rest',
       E'The term of service and the honoured rest',
       E'*From twenty and five years old and upward they shall go in to wait upon the service of the tabernacle of the congregation* (Numbers 8:24), and *from the age of fifty years they shall cease waiting upon the service thereof, and shall serve no more* (Numbers 8:25) — yet *shall minister with their brethren in the tabernacle of the congregation, to keep the charge, and shall do no service* (Numbers 8:26). The term flexes as the work requires: the earlier muster set the burden-bearers *from thirty years old and upward even until fifty years old* (Numbers 4:3); and when David gives the people rest in the land he lowers the entering age again — the Levites counted *from the age of twenty years and upward* (1 Chronicles 23:24) — for *they shall no more carry the tabernacle, nor any vessels of it for the service thereof* (1 Chronicles 23:26). The burden of carriage is lifted, but the charge is kept: an honoured rest from labour that is never a discharge from the people of Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 23681
  FROM _s312_num08_lookup sv, _s312_num08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=8 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- Thread 1: the seven lamps
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I saw seven golden candlesticks* (Revelation 1:12) — the seven lamps gathered as the assemblies.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-seven-lamps-give-light-over-against-the-candlestick'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*one like unto the Son of Adam... in the midst of the seven candlesticks* (Revelation 1:13) — the Formed Son among the lamps.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-seven-lamps-give-light-over-against-the-candlestick'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the seven candlesticks which thou sawest are the seven churches* (Revelation 1:20) — the mystery named.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-seven-lamps-give-light-over-against-the-candlestick'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God)* (Revelation 4:5).'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-seven-lamps-give-light-over-against-the-candlestick'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a candlestick of pure gold: of beaten work* (Exodus 25:31) — the pattern shewed Moses.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-seven-lamps-give-light-over-against-the-candlestick'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*make the seven lamps thereof... that they may give light over against it* (Exodus 25:37) — the command Numbers 8 fulfils.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-seven-lamps-give-light-over-against-the-candlestick'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*a candlestick all of gold... and his seven lamps thereon* (Zechariah 4:2) — the prophet''s vision of the same lampstand.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-seven-lamps-give-light-over-against-the-candlestick'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the Levites given as a gift instead of the firstborn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I have taken the Levites... instead of all the firstborn... therefore the Levites shall be mine* (Numbers 3:12).'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-levites-given-as-a-gift-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all the firstborn are mine... I hallowed unto me all the firstborn in Yashar''el (Israel)* (Numbers 3:13) — the Passover ground.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-levites-given-as-a-gift-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Take the Levites instead of all the firstborn... and the Levites shall be mine* (Numbers 3:45) — the exchange sealed.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=18
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-levites-given-as-a-gift-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*present your bodies a living sacrifice... which is your reasonable service* (Romans 12:1) — the wave-offering of consecrated lives.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-levites-given-as-a-gift-instead-of-the-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: term of service and honoured rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*From thirty years old and upward even until fifty years old, all that enter into the host* (Numbers 4:3) — the earlier muster.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=24
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-term-of-service-and-the-honoured-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*from the age of twenty years and upward* (1 Chronicles 23:24) — David lowers the entering age.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=25
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=23 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-term-of-service-and-the-honoured-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they shall no more carry the tabernacle, nor any vessels of it for the service thereof* (1 Chronicles 23:26) — the burden lifted.'
  FROM cross_reference_threads t
  JOIN _s312_num08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=8 AND sv.verse_number=26
  JOIN _s312_num08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=23 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-8-the-term-of-service-and-the-honoured-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_9.sql (Numbers 9) -----
--
-- Book: Numbers   Chapter: 9   Tag: num09   Session prefix: s312
-- Sort band: base 23700, step 3  (23700, 23703, 23706, 23709)
-- Temp view: _s312_num09_lookup
--
-- Numbers 9 coverage:
--   v.1-5  (Passover kept in the wilderness, at his appointed season, according to all the rites)
--          NT:     1 Corinthians 5:7 (Messiah our passover), Luke 22:7-8 (the day of unleavened bread, the passover prepared)
--          Extras: none warranted
--          Tanakh: Exodus 12:1-14 (the ordinance instituted), Leviticus 23:5 (the LORD'S passover among the feasts)
--   v.6-12 (the Second Passover / Pesach Sheni — mercy makes a way for the unclean and the far traveller)
--          NT:     none warranted (the bones-not-broken ordinance of 9:12 -> John 19:36 carried in the same thread)
--          Extras: none warranted
--          Tanakh: 2 Chronicles 30:2-3,15 (Hezekiah's second-month passover for the unsanctified), John 19:36 (a bone of him shall not be broken — NT, the 9:12 ordinance fulfilled)
--   v.13-14 (one ordinance, both for the stranger and for him born in the land)
--          NT:     Ephesians 2:12-13,19 (strangers from the covenants made nigh, no more strangers but fellowcitizens)
--          Extras: none warranted
--          Tanakh: Exodus 12:48-49 (one law to the homeborn and the stranger that sojourneth)
--   v.15-23 (the cloud by day, the appearance of fire by night — the guiding Presence; they journeyed and pitched at the commandment of Yahuah)
--          NT:     1 Corinthians 10:1-2 (our fathers under the cloud, baptized unto Moses in the cloud), Revelation 7:15 (he that sitteth on the throne shall dwell among them)
--          Extras: none warranted
--          Tanakh: Exodus 13:21-22 (the pillar of cloud and fire that led), Nehemiah 9:19 (the pillar departed not), Isaiah 4:5 (a cloud and a flaming fire upon Zion)
--
-- Threads (4):
--   numbers-9-the-passover-kept-in-the-wilderness-at-his-appointed-season           [free]  Tanakh + NT
--   numbers-9-the-second-passover-the-mercy-that-opens-the-feast                    [free]  Tanakh + NT
--   numbers-9-one-ordinance-for-the-stranger-and-the-homeborn                       [free]  Tanakh + NT
--   numbers-9-the-cloud-and-the-fire-that-lead                                      [free]  Tanakh + NT
--
-- Framework-load-bearing notes:
--   * 9:1-5 the appointed times (Lev 23) are Yahuah's calendar, NOT abolished — kept "according to all the rites";
--     1 Cor 5:7 reads Messiah AS the Passover the feast was always pointing to (the feast still kept, v.8).
--   * 9:6-12 the Second Passover = mercy that opens the feast to the excluded; 9:12 bones-not-broken -> John 19:36
--     binds the Passover ordinance to the Lamb whose bones were unbroken.
--   * 9:13-14 one ordinance for the stranger = the one-law inclusion of the sojourner (Exod 12:48-49); Eph 2:12-13,19
--     reads the gathering-near as restoration to the commonwealth of Yashar'el, NOT a new replacement people.
--   * 9:15-23 the cloud/fire = the Formed-Son-led Presence (Exod 13:21-22), the walk by Yahuah's word; 1 Cor 10:1-2
--     reads the cloud as the type of baptism; Rev 7:15 / Isa 4:5 carry the Presence forward to the consummation.

CREATE TEMP VIEW _s312_num09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================
-- B. cross_references
-- =====================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the passover kept in the wilderness, at his appointed season
    ('canon','numbers',9,3,'canon','exodus',12,14,'free',
      E'*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever* (Exodus 12:14). When Numbers 9 records the children of Yashar''el (Israel) keeping the passover *according to all the rites of it, and according to all the ceremonies thereof* (Numbers 9:3), they are keeping the very ordinance instituted in Egypt — *a feast by an ordinance for ever*, the appointed time still standing in the wilderness of Sinai.'),
    ('canon','numbers',9,3,'canon','leviticus',23,5,'free',
      E'*In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5). The passover Numbers 9 keeps *in the fourteenth day of this month, at even... in his appointed season* (Numbers 9:3) is the first of the feasts of Yahuah set on his calendar — *the feasts of Yahuah (LORD)... which ye shall proclaim in their seasons* (Leviticus 23:4), the appointed times that are never abolished.'),
    ('canon','numbers',9,2,'canon','1-corinthians',5,7,'free',
      E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The command *Let the children of Yashar''el (Israel) also keep the passover at his appointed season* (Numbers 9:2) points forward to the One the lamb foreshadowed: *Messiah our passover* — and the feast is not cancelled but kept, *let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8).'),
    ('canon','numbers',9,5,'canon','luke',22,7,'free',
      E'*Then came the day of unleavened bread, when the passover must be killed* (Luke 22:7). As the children of Yashar''el (Israel) *kept the passover on the fourteenth day of the first month at even... according to all that Yahuah (LORD) commanded Moses* (Numbers 9:5), so the Messiah himself keeps the appointed time: *Go and prepare us the passover, that we may eat* (Luke 22:8), the rites of Numbers 9 carried forward to the upper room.'),

    -- THREAD 2: the second passover, the mercy that opens the feast
    ('canon','numbers',9,11,'canon','2-chronicles',30,15,'free',
      E'*Then they killed the passover on the fourteenth day of the second month: and the priests and the Levites were ashamed, and sanctified themselves* (2 Chronicles 30:15). The provision of Numbers 9 — *The fourteenth day of the second month at even they shall keep it* (Numbers 9:11) — is exactly the door Hezekiah walks through, gathering both houses (Yashar''el and Yahudah, Ephraim and Manasseh) to keep the passover *in the second month* when they could not in the first.'),
    ('canon','numbers',9,10,'canon','2-chronicles',30,3,'free',
      E'*For they could not keep it at that time, because the priests had not sanctified themselves sufficiently, neither had the people gathered themselves together to Jerusalem* (2 Chronicles 30:3). Numbers 9:10 makes a way for the one who *shall be unclean by reason of a dead body, or be in a journey afar off, yet he shall keep the passover* — and Hezekiah claims that very mercy for a whole congregation not yet clean, *Yahuah (LORD) hearkened to Hezekiah, and healed the people* (2 Chronicles 30:20).'),
    ('canon','numbers',9,12,'canon','john',19,36,'free',
      E'*For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken* (John 19:36). The passover ordinance repeated in the Second Passover — *They shall leave none of it unto the morning, nor break any bone of it* (Numbers 9:12) — is fulfilled in the Lamb himself: *when they came to Yahusha (Jesus), and saw that he was dead already, they brake not his legs* (John 19:33), the unbroken bone of the passover.'),

    -- THREAD 3: one ordinance for the stranger and the homeborn
    ('canon','numbers',9,14,'canon','exodus',12,49,'free',
      E'*One law shall be to him that is homeborn, and unto the stranger that sojourneth among you* (Exodus 12:49). The one-law inclusion Numbers 9:14 declares — *ye shall have one ordinance, both for the stranger, and for him that was born in the land* — is the same statute given when the passover was first instituted: *when a stranger shall sojourn with thee, and will keep the passover to Yahuah (LORD)... he shall be as one that is born in the land* (Exodus 12:48).'),
    ('canon','numbers',9,14,'canon','ephesians',2,13,'free',
      E'*But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13). The stranger who *will keep the passover unto Yahuah (LORD); according to the ordinance of the passover* (Numbers 9:14) is the one brought near — those once *aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise* (Ephesians 2:12), now *no more strangers and foreigners, but fellowcitizens* (Ephesians 2:19): one ordinance, one people.'),
    ('canon','numbers',9,14,'canon','ephesians',2,19,'free',
      E'*Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God)* (Ephesians 2:19). The single ordinance of Numbers 9:14 — *one ordinance, both for the stranger, and for him that was born in the land* — is the very pattern of the gathering-near: the sojourner who keeps the feast is no second-class guest but joined to the household, restored to the commonwealth of Yashar''el.'),

    -- THREAD 4: the cloud and the fire that lead
    ('canon','numbers',9,15,'canon','exodus',13,21,'free',
      E'*And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light* (Exodus 13:21). The Presence that settles upon the reared-up tabernacle in Numbers 9:15 — *the cloud covered the tabernacle... and at even there was upon the tabernacle as it were the appearance of fire* — is the same guiding pillar that went before Yashar''el from the start, *He took not away the pillar of the cloud by day, nor the pillar of fire by night* (Exodus 13:22).'),
    ('canon','numbers',9,16,'canon','nehemiah',9,19,'free',
      E'*Yet thou in thy manifold mercies forsookest them not in the wilderness: the pillar of the cloud departed not from them by day, to lead them in the way; neither the pillar of fire by night* (Nehemiah 9:19). Nehemiah looks back on the very constancy Numbers 9:16 records — *So it was alway: the cloud covered it by day, and the appearance of fire by night* — and names it mercy: the guiding Presence that never departed.'),
    ('canon','numbers',9,18,'canon','1-corinthians',10,1,'free',
      E'*Moreover, brethren, I would not that ye should be ignorant, how that all our fathers were under the cloud, and all passed through the sea; and were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:1-2). The cloud at whose lifting *the children of Yashar''el (Israel) journeyed, and at the commandment of Yahuah (LORD) they pitched* (Numbers 9:18) is read forward as the figure of baptism — the people walking under the Presence, led wholly by the word of Yahuah.'),
    ('canon','numbers',9,17,'canon','isaiah',4,5,'free',
      E'*And Yahuah (LORD) will create upon every dwelling place of mount Zion, and upon her assemblies, a cloud and smoke by day, and the shining of a flaming fire by night: for upon all the glory shall be a defence* (Isaiah 4:5). The wilderness cloud that lifted and abode in Numbers 9:17 returns in the day of restoration — the same cloud-and-fire Presence promised over the assemblies of Zion, the leading Glory made their covering.'),
    ('canon','numbers',9,15,'canon','revelation',7,15,'free',
      E'*Therefore are they before the throne of Elohim (God), and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them* (Revelation 7:15). The cloud that *covered the tabernacle, namely, the tent of the testimony* (Numbers 9:15) — Yahuah dwelling in the midst of his people — reaches its consummation in the One who *shall dwell among them*, the Presence that filled the wilderness tent filling the throne-temple for ever.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- C. threads
-- =====================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-9-the-passover-kept-in-the-wilderness-at-his-appointed-season',
       E'The Passover kept in the wilderness, at his appointed season',
       E'A year out of Egypt, Yahuah commands the appointed time be kept: *Let the children of Yashar''el (Israel) also keep the passover at his appointed season* (Numbers 9:2), *according to all the rites of it, and according to all the ceremonies thereof* (Numbers 9:3). This is no new thing but the very ordinance instituted in Egypt — *ye shall keep it a feast by an ordinance for ever* (Exodus 12:14) — and the first of Yahuah''s appointed feasts, *In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5). The feast is the architecture, not the scaffolding: it points forward to the Lamb it always foreshadowed — *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — and even then the keeping continues, *let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The Messiah himself keeps it: *Then came the day of unleavened bread, when the passover must be killed* (Luke 22:7). The passover kept — in the wilderness, in the upper room, for ever.',
       sv.verse_id, ev.verse_id, 'free', 23700
  FROM _s312_num09_lookup sv, _s312_num09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-9-the-second-passover-the-mercy-that-opens-the-feast',
       E'The Second Passover — the mercy that opens the feast',
       E'Certain men *defiled by the dead body of a man* could not keep the passover, and they refuse to be silently shut out: *wherefore are we kept back, that we may not offer an offering of Yahuah (LORD) in his appointed season?* (Numbers 9:7). Moses waits on Yahuah, and the answer is mercy with a door: *If any man of you... shall be unclean by reason of a dead body, or be in a journey afar off, yet he shall keep the passover unto Yahuah (LORD). The fourteenth day of the second month at even they shall keep it* (Numbers 9:10-11) — kept still *according to all the ordinances of the passover* (Numbers 9:12), the same feast, a second appointed time for the excluded. Centuries later Hezekiah claims that very provision for two houses unprepared: *they could not keep it at that time, because the priests had not sanctified themselves* (2 Chronicles 30:3), so *they killed the passover on the fourteenth day of the second month* (2 Chronicles 30:15) — and *Yahuah (LORD) hearkened to Hezekiah, and healed the people* (2 Chronicles 30:20). And the ordinance that runs through it — *nor break any bone of it* (Numbers 9:12) — finds its Lamb: *A bone of him shall not be broken* (John 19:36). The mercy that opens the feast, the unbroken bone that keeps it.',
       sv.verse_id, ev.verse_id, 'free', 23703
  FROM _s312_num09_lookup sv, _s312_num09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-9-one-ordinance-for-the-stranger-and-the-homeborn',
       E'One ordinance for the stranger and the homeborn',
       E'*And if a stranger shall sojourn among you, and will keep the passover unto Yahuah (LORD); according to the ordinance of the passover, and according to the manner thereof, so shall he do: ye shall have one ordinance, both for the stranger, and for him that was born in the land* (Numbers 9:14). The sojourner who will keep the feast is no second guest — the same statute given at the institution: *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you* (Exodus 12:49). This is the one-law inclusion, the door into the covenant people opened to the stranger who keeps the appointed times. It is exactly what Paul names as the gathering-near: those once *aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise* (Ephesians 2:12) are *made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) — *no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God)* (Ephesians 2:19). Not a new people replacing the old, but the stranger joined to the one ordinance, the one commonwealth, the one feast.',
       sv.verse_id, ev.verse_id, 'free', 23706
  FROM _s312_num09_lookup sv, _s312_num09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=9 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-9-the-cloud-and-the-fire-that-lead',
       E'The cloud and the fire that lead',
       E'*And on the day that the tabernacle was reared up the cloud covered the tabernacle... and at even there was upon the tabernacle as it were the appearance of fire* (Numbers 9:15). The guiding Presence settles over the tent of the testimony and never wavers: *So it was alway: the cloud covered it by day, and the appearance of fire by night* (Numbers 9:16). Yashar''el moves wholly by Yahuah''s word — *At the commandment of Yahuah (LORD) the children of Yashar''el (Israel) journeyed, and at the commandment of Yahuah (LORD) they pitched* (Numbers 9:18) — whether the cloud tarried *two days, or a month, or a year* (Numbers 9:22). This is the same pillar that went before them from Egypt: *Yahuah (LORD) went before them by day in a pillar of a cloud... and by night in a pillar of fire* (Exodus 13:21), the mercy Nehemiah remembers, *the pillar of the cloud departed not from them by day... neither the pillar of fire by night* (Nehemiah 9:19). Paul reads it as the figure of baptism: *all our fathers were under the cloud... and were all baptized unto Moses in the cloud* (1 Corinthians 10:1-2). And the leading Glory is promised again over restored Zion — *a cloud and smoke by day, and the shining of a flaming fire by night: for upon all the glory shall be a defence* (Isaiah 4:5) — and consummated in the throne, *he that sitteth on the throne shall dwell among them* (Revelation 7:15). The Presence that led the wilderness leads them home.',
       sv.verse_id, ev.verse_id, 'free', 23709
  FROM _s312_num09_lookup sv, _s312_num09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=9 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- D. thread_members
-- =====================================================================
-- THREAD 1: the passover kept in the wilderness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*ye shall keep it a feast by an ordinance for ever* (Exodus 12:14) — the passover Numbers 9 keeps is the very ordinance instituted in Egypt.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-passover-kept-in-the-wilderness-at-his-appointed-season'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5) — the first of the appointed feasts of Yahuah, never abolished.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-passover-kept-in-the-wilderness-at-his-appointed-season'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — the appointed time fulfilled in the Lamb, the feast still kept.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-passover-kept-in-the-wilderness-at-his-appointed-season'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the passover must be killed... Go and prepare us the passover* (Luke 22:7-8) — the Messiah keeps the appointed time of Numbers 9.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-passover-kept-in-the-wilderness-at-his-appointed-season'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the second passover
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*they killed the passover on the fourteenth day of the second month* (2 Chronicles 30:15) — Hezekiah walks through the door Numbers 9:11 opened.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=30 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-second-passover-the-mercy-that-opens-the-feast'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they could not keep it at that time, because the priests had not sanctified themselves* (2 Chronicles 30:3) — the second-month mercy of Numbers 9:10 claimed for a whole unclean congregation.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-second-passover-the-mercy-that-opens-the-feast'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*A bone of him shall not be broken* (John 19:36) — the passover ordinance of Numbers 9:12 fulfilled in the Lamb.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=12
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-second-passover-the-mercy-that-opens-the-feast'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: one ordinance for the stranger and the homeborn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*One law shall be to him that is homeborn, and unto the stranger that sojourneth among you* (Exodus 12:49) — the same one-law statute given at the institution.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-one-ordinance-for-the-stranger-and-the-homeborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) — the stranger brought near, restored to the commonwealth of Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-one-ordinance-for-the-stranger-and-the-homeborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*no more strangers and foreigners, but fellowcitizens with the saints* (Ephesians 2:19) — the sojourner who keeps the feast joined to the one household, not a replacement people.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-one-ordinance-for-the-stranger-and-the-homeborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: the cloud and the fire that lead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) went before them by day in a pillar of a cloud... and by night in a pillar of fire* (Exodus 13:21) — the same guiding pillar that led from Egypt.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-cloud-and-the-fire-that-lead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the pillar of the cloud departed not from them by day... neither the pillar of fire by night* (Nehemiah 9:19) — the unfailing Presence Numbers 9:16 records, named as mercy.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-cloud-and-the-fire-that-lead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*all our fathers were under the cloud... baptized unto Moses in the cloud* (1 Corinthians 10:1-2) — the cloud of Numbers 9:18 read as the figure of baptism.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=18
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-cloud-and-the-fire-that-lead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a cloud and smoke by day, and the shining of a flaming fire by night* (Isaiah 4:5) — the wilderness Presence promised again over restored Zion.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-cloud-and-the-fire-that-lead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he that sitteth on the throne shall dwell among them* (Revelation 7:15) — the Presence that filled the wilderness tent consummated in the throne-temple.'
  FROM cross_reference_threads t
  JOIN _s312_num09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s312_num09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-9-the-cloud-and-the-fire-that-lead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_10.sql (Numbers 10) -----
-- Chapter: Numbers 10  |  tag: num10  |  session prefix: s312
-- Sort band base 23725, step 3  (23725, 23728, 23731, 23734)
--
-- Numbers 10 coverage:
--   v.1-10  (the two silver trumpets — assembly / journeying / alarm-for-war / appointed-times)
--        NT:     1 Corinthians 14:8 (uncertain sound), 1 Cor 15:52 (the last trump),
--                1 Thessalonians 4:16 (the trump of Elohim), Matthew 24:31 (great sound of a trumpet),
--                Revelation 8:2 (seven angels, seven trumpets)
--        Extras: none warranted
--        Tanakh: Leviticus 23:24 (memorial of blowing of trumpets), Joel 2:1 (blow the trumpet in Zion),
--                Joel 2:15 (blow the trumpet, call a solemn assembly)
--   v.11-28 (the cloud lifts, the camps set forward in order — Judah's standard FIRST)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 2:9 (camp of Judah — These shall first set forth),
--                Genesis 49:10 (the sceptre shall not depart from Yahudah)
--   v.29-32 (Moses invites Hobab — the stranger invited to share the promise)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exodus 18:9 (Jethro rejoiced for all the goodness), Judges 1:16 (the Kenite went up with Yahudah)
--   v.33-36 (the ark going BEFORE them; Rise up, Yahuah / Return, O Yahuah)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 68:1 (Let Elohim arise, let his enemies be scattered),
--                Psalm 132:8 (Arise, O Yahuah, into thy rest), Joshua 3:6 (the ark went before the people)
--
-- THREADS (4):
--   numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times
--        members: 1Cor14:8, 1Cor15:52, 1Thess4:16, Matt24:31, Rev8:2 (NT/free); Lev23:24, Joel2:1, Joel2:15 (Tanakh/free) -> tier free
--   numbers-10-judahs-standard-set-forward-first-the-ordered-march-of-the-sceptre-tribe
--        members: Num2:9, Gen49:10 (Tanakh/free) -> tier free
--   numbers-10-come-with-us-and-we-will-do-thee-good-the-stranger-invited-to-the-promise
--        members: Exod18:9, Judges1:16 (Tanakh/free) -> tier free
--   numbers-10-the-ark-goes-before-rise-up-yahuah-and-let-thine-enemies-be-scattered
--        members: Ps68:1, Ps132:8, Josh3:6 (Tanakh/free) -> tier free
--
-- Framework notes: the silver trumpets are the gathering/war/appointed-times trumpet of Yahuah,
-- the ONE-ingathering trump the NT fills (last trump, trump of Elohim, great sound of a trumpet) and
-- the Feast of Trumpets (Lev 23:24) and Joel's day-of-Yahuah alarm. Judah's-standard-first is the
-- sceptre tribe leading the ordered march (Gen 49:10). Hobab is the sojourner brought in under the
-- covenant promise (NOT inclusion-by-confession; the goodness Yahuah spoke concerning Yashar'el is
-- shared with the one who joins the journey). The ark going before with "Rise up, Yahuah" is the
-- war-cry David built Psalm 68 upon, and "into thy rest" is Psalm 132:8 — the Formed Son leading
-- His people, scattering His enemies, bringing them to rest.

CREATE TEMP VIEW _s312_num10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the two silver trumpets
    ('canon','numbers',10,9,'canon','1-corinthians',14,8,'free',
      E'*For if the trumpet give an uncertain sound, who shall prepare himself to the battle?* (1 Corinthians 14:8). The silver trumpets had a defined voice — *when ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God)* (Numbers 10:9). Paul reaches back to Moses'' alarm-for-war: a trumpet must give a CERTAIN sound for the camp to prepare for battle.'),
    ('canon','numbers',10,9,'canon','1-corinthians',15,52,'free',
      E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). The trumpet that *ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9) becomes the LAST trump — the one ingathering when Yahuah remembers His people and saves them from the last enemy, death.'),
    ('canon','numbers',10,9,'canon','1-thessalonians',4,16,'free',
      E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The trumpet of remembrance and deliverance — *ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9) — is filled by the trump of Elohim that gathers the people at the descent of the Formed Son.'),
    ('canon','numbers',10,2,'canon','matthew',24,31,'free',
      E'*And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other* (Matthew 24:31). The trumpets given *for the calling of the assembly, and for the journeying of the camps* (Numbers 10:2) — *when the congregation is to be gathered together, ye shall blow* (Numbers 10:7) — are filled by the great trumpet that gathers the scattered elect, the two-house ingathering.'),
    ('canon','numbers',10,2,'canon','revelation',8,2,'free',
      E'*And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets* (Revelation 8:2). The two silver trumpets — *Make thee two trumpets of silver; of a whole piece shalt thou make them* (Numbers 10:2) — open into the seven trumpets of the consummation: the same instrument of Yahuah''s summons, warning, and judgment carried forward into the last days.'),
    ('canon','numbers',10,10,'canon','leviticus',23,24,'free',
      E'*Speak unto the children of Yashar''el (Israel), saying, In the seventh month, in the first day of the month, shall ye have a sabbath, a memorial of blowing of trumpets, an holy convocation* (Leviticus 23:24). The trumpets of Numbers 10 are sounded *in the day of your gladness, and in your solemn days, and in the beginnings of your months... that they may be to you for a memorial before your Elohim (God)* (Numbers 10:10) — the very memorial-of-blowing the Feast of Trumpets keeps in Yahuah''s appointed-times calendar.'),
    ('canon','numbers',10,5,'canon','joel',2,1,'free',
      E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1). Moses'' command — *when ye blow an alarm, then the camps that lie on the east parts shall go forward* (Numbers 10:5) — is taken up by Joel: the alarm that once moved the camps becomes the alarm of the day of Yahuah.'),
    ('canon','numbers',10,7,'canon','joel',2,15,'free',
      E'*Blow the trumpet in Zion, sanctify a fast, call a solemn assembly* (Joel 2:15). The same two-fold use of the trumpet stands — *but when the congregation is to be gathered together, ye shall blow, but ye shall not sound an alarm* (Numbers 10:7): Joel sounds the gathering-blast that calls the solemn assembly, the assembly-trumpet of Numbers 10 ringing in the prophets.'),
    -- Thread 2: Judah's standard first
    ('canon','numbers',10,14,'canon','numbers',2,9,'free',
      E'*All that were numbered in the camp of Yahudah (Judah) were an hundred thousand and fourscore thousand and six thousand and four hundred, throughout their armies. These shall first set forth* (Numbers 2:9). The marching order obeys the camp arrangement already given: *In the first place went the standard of the camp of the children of Yahudah (Judah) according to their armies* (Numbers 10:14) — Judah leads out exactly as commanded.'),
    ('canon','numbers',10,14,'canon','genesis',49,10,'free',
      E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). Why Judah goes FIRST — *In the first place went the standard of the camp of the children of Yahudah (Judah)* (Numbers 10:14) — is the sceptre-tribe leading: the order of the march already pictures the Davidic-kingly precedence that runs to Shiloh, the gathering of the people.'),
    -- Thread 3: Hobab the stranger invited
    ('canon','numbers',10,29,'canon','exodus',18,9,'free',
      E'*And Jethro rejoiced for all the goodness which Yahuah (LORD) had done to Yashar''el (Israel), whom he had delivered out of the hand of the Egyptians* (Exodus 18:9). Moses now invites Jethro''s house to share that goodness: *come thou with us, and we will do thee good: for Yahuah (LORD) hath spoken good concerning Yashar''el (Israel)* (Numbers 10:29) — the Midianite father-in-law who once rejoiced in Yahuah''s goodness is called to journey into it.'),
    ('canon','numbers',10,29,'canon','judges',1,16,'free',
      E'*And the children of the Kenite, Moses'' father in law, went up out of the city of palm trees with the children of Yahudah (Judah) into the wilderness of Yahudah (Judah), which lieth in the south of Arad; and they went and dwelt among the people* (Judges 1:16). The invitation bore fruit — *come thou with us, and we will do thee good* (Numbers 10:29): Hobab''s descendants did come up with Yahudah (Judah) and dwelt among the people, the sojourner brought into the inheritance.'),
    -- Thread 4: the ark goes before / Rise up, Yahuah
    ('canon','numbers',10,35,'canon','psalms',68,1,'free',
      E'*Let Elohim (God) arise, let his enemies be scattered: let them also that hate him flee before him* (Psalm 68:1). David built his psalm directly on Moses'' war-cry at the going-forth of the ark — *Rise up, Yahuah (LORD), and let thine enemies be scattered; and let them that hate thee flee before thee* (Numbers 10:35) — the marching prayer of the ark sung into the songbook of Yashar''el.'),
    ('canon','numbers',10,36,'canon','psalms',132,8,'free',
      E'*Arise, O Yahuah (LORD), into thy rest; thou, and the ark of thy strength* (Psalm 132:8). When the ark rested Moses said *Return, O Yahuah (LORD), unto the many thousands of Yashar''el (Israel)* (Numbers 10:36); the resting-prayer of the wilderness ark becomes Zion''s prayer for the ark to come into its everlasting rest, the dwelling of Yahuah among His people.'),
    ('canon','numbers',10,33,'canon','joshua',3,6,'free',
      E'*And Joshua spake unto the priests, saying, Take up the ark of the covenant, and pass over before the people. And they took up the ark of the covenant, and went before the people* (Joshua 3:6). The pattern set in the wilderness holds at the Jordan — *the ark of the covenant of Yahuah (LORD) went before them in the three days'' journey, to search out a resting place for them* (Numbers 10:33): the ark always goes BEFORE, leading the people into the land and the rest.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times',
       E'The Two Silver Trumpets — that gather, warn, and mark the appointed times',
       E'Yahuah commands two trumpets of beaten silver — *Make thee two trumpets of silver; of a whole piece shalt thou make them: that thou mayest use them for the calling of the assembly, and for the journeying of the camps* (Numbers 10:2). They have three offices: the assembly-blast that gathers the congregation — *when the congregation is to be gathered together, ye shall blow, but ye shall not sound an alarm* (Numbers 10:7); the alarm that moves the camps — *when ye blow an alarm, then the camps that lie on the east parts shall go forward* (Numbers 10:5); and the alarm-for-war that brings remembrance and deliverance — *if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). And they sound over the appointed times — *also in the day of your gladness, and in your solemn days, and in the beginnings of your months, ye shall blow with the trumpets... that they may be to you for a memorial before your Elohim (God)* (Numbers 10:10). This is the trumpet of Yahuah, and it rings through the whole library. Paul demands a certain sound — *for if the trumpet give an uncertain sound, who shall prepare himself to the battle?* (1 Corinthians 14:8) — and names the last trump of the one ingathering: *in a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52); *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). Messiah sends His angels *with a great sound of a trumpet, and they shall gather together his elect from the four winds* (Matthew 24:31), and the seven angels stand *and to them were given seven trumpets* (Revelation 8:2). It is the same trumpet that keeps the calendar — *a memorial of blowing of trumpets, an holy convocation* (Leviticus 23:24) — and that Joel sounds as the day of Yahuah: *blow ye the trumpet in Zion, and sound an alarm in my holy mountain* (Joel 2:1); *blow the trumpet in Zion, sanctify a fast, call a solemn assembly* (Joel 2:15). The trumpet that once gathered the camps gathers the scattered house at the last day.',
       sv.verse_id, ev.verse_id, 'free', 23725
  FROM _s312_num10_lookup sv, _s312_num10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-10-judahs-standard-set-forward-first-the-ordered-march-of-the-sceptre-tribe',
       E'Judah''s Standard Set Forward First — the ordered march of the sceptre tribe',
       E'When the cloud lifts and the camps set out, the order is exact and Judah leads: *and they first took their journey according to the commandment of Yahuah (LORD) by the hand of Moses. In the first place went the standard of the camp of the children of Yahudah (Judah) according to their armies* (Numbers 10:13-14). This is no accident of arrangement; it obeys the camp pattern already given — *all that were numbered in the camp of Yahudah (Judah)... throughout their armies. These shall first set forth* (Numbers 2:9). And the reason runs back to Jacob''s blessing: the sceptre-tribe goes before its brethren — *the sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The ordered wilderness march is a living picture of the Davidic-kingly precedence that runs the whole canon: Yahudah (Judah) at the head, the people gathered behind the sceptre, moving toward the One unto whom the gathering of the people shall be.',
       sv.verse_id, ev.verse_id, 'free', 23728
  FROM _s312_num10_lookup sv, _s312_num10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=10 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-10-come-with-us-and-we-will-do-thee-good-the-stranger-invited-to-the-promise',
       E'Come With Us and We Will Do Thee Good — the stranger invited to the promise',
       E'Moses turns to his Midianite kinsman and opens the inheritance to him: *And Moses said unto Hobab, the son of Raguel the Midianite, Moses'' father in law, We are journeying unto the place of which Yahuah (LORD) said, I will give it you: come thou with us, and we will do thee good: for Yahuah (LORD) hath spoken good concerning Yashar''el (Israel)* (Numbers 10:29). When Hobab hesitates, Moses presses — *leave us not, I pray thee; forasmuch as thou knowest how we are to encamp in the wilderness, and thou mayest be to us instead of eyes* (Numbers 10:31) — and binds the stranger''s portion to Israel''s own: *what goodness Yahuah (LORD) shall do unto us, the same will we do unto thee* (Numbers 10:32). This same house had already rejoiced in Yahuah''s goodness — *and Jethro rejoiced for all the goodness which Yahuah (LORD) had done to Yashar''el (Israel), whom he had delivered out of the hand of the Egyptians* (Exodus 18:9) — and the invitation bore fruit in the land: *and the children of the Kenite, Moses'' father in law, went up out of the city of palm trees with the children of Yahudah (Judah)... and they went and dwelt among the people* (Judges 1:16). The sojourner is brought in to share the promise spoken concerning Yashar''el (Israel) — joining the journey, dwelling among the covenant people.',
       sv.verse_id, ev.verse_id, 'free', 23731
  FROM _s312_num10_lookup sv, _s312_num10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=10 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-10-the-ark-goes-before-rise-up-yahuah-and-let-thine-enemies-be-scattered',
       E'The Ark Goes Before — Rise up, Yahuah, and let thine enemies be scattered',
       E'The ark leads the people out of the mount of Yahuah: *and the ark of the covenant of Yahuah (LORD) went before them in the three days'' journey, to search out a resting place for them. And the cloud of Yahuah (LORD) was upon them by day, when they went out of the camp* (Numbers 10:33-34). At its going-forth and its resting Moses speaks two prayers: *and it came to pass, when the ark set forward, that Moses said, Rise up, Yahuah (LORD), and let thine enemies be scattered; and let them that hate thee flee before thee. And when it rested, he said, Return, O Yahuah (LORD), unto the many thousands of Yashar''el (Israel)* (Numbers 10:35-36). David built his great psalm of triumph straight upon the war-cry — *let Elohim (God) arise, let his enemies be scattered: let them also that hate him flee before him* (Psalm 68:1) — and Zion took up the resting-prayer for the ark to enter its everlasting dwelling: *Arise, O Yahuah (LORD), into thy rest; thou, and the ark of thy strength* (Psalm 132:8). The pattern is fixed and held at the Jordan: *take up the ark of the covenant, and pass over before the people. And they took up the ark of the covenant, and went before the people* (Joshua 3:6). The ark — the throne of the Formed Son in the midst — always goes BEFORE, scattering His enemies, leading His people, bringing them into rest.',
       sv.verse_id, ev.verse_id, 'free', 23734
  FROM _s312_num10_lookup sv, _s312_num10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=10 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: the two silver trumpets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For if the trumpet give an uncertain sound, who shall prepare himself to the battle?* (1 Corinthians 14:8) — Paul on the certain-sounding alarm-for-war of Numbers 10:9.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=9
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=14 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*At the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52) — the remembrance-and-deliverance trumpet of v.9 becomes the last trump.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=9
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*With the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the trump of remembrance at the descent of the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=9
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*A great sound of a trumpet, and they shall gather together his elect from the four winds* (Matthew 24:31) — the assembly-trumpet of v.2 gathering the scattered house.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*To them were given seven trumpets* (Revelation 8:2) — the two silver trumpets opening into the seven of the consummation.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*A memorial of blowing of trumpets, an holy convocation* (Leviticus 23:24) — the Feast of Trumpets keeping the appointed-times blast of v.10.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain* (Joel 2:1) — the alarm-blast of v.5 becomes the alarm of the day of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=5
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Blow the trumpet in Zion, sanctify a fast, call a solemn assembly* (Joel 2:15) — the gathering-blast of v.7 calling the solemn assembly.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=7
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: Judah's standard first
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*All that were numbered in the camp of Yahudah (Judah)... These shall first set forth* (Numbers 2:9) — the camp order that v.14 obeys.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-judahs-standard-set-forward-first-the-ordered-march-of-the-sceptre-tribe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The sceptre shall not depart from Yahudah (Judah)... unto him shall the gathering of the people be* (Genesis 49:10) — why the sceptre-tribe leads the march.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-judahs-standard-set-forward-first-the-ordered-march-of-the-sceptre-tribe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: Hobab the stranger invited
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Jethro rejoiced for all the goodness which Yahuah (LORD) had done to Yashar''el (Israel)* (Exodus 18:9) — the Midianite house that already rejoiced in Yahuah''s goodness, now invited to share it (v.29).'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-come-with-us-and-we-will-do-thee-good-the-stranger-invited-to-the-promise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The children of the Kenite, Moses'' father in law, went up... with the children of Yahudah (Judah)... and dwelt among the people* (Judges 1:16) — the invitation of v.29 bearing fruit in the land.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-come-with-us-and-we-will-do-thee-good-the-stranger-invited-to-the-promise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the ark goes before
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Let Elohim (God) arise, let his enemies be scattered* (Psalm 68:1) — David''s psalm built on Moses'' war-cry at the going-forth of the ark (v.35).'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=35
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-ark-goes-before-rise-up-yahuah-and-let-thine-enemies-be-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Arise, O Yahuah (LORD), into thy rest; thou, and the ark of thy strength* (Psalm 132:8) — Zion''s prayer answering Moses'' resting-cry of v.36.'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=36
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-ark-goes-before-rise-up-yahuah-and-let-thine-enemies-be-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*They took up the ark of the covenant, and went before the people* (Joshua 3:6) — the same pattern of the ark going before, now at the Jordan (v.33).'
  FROM cross_reference_threads t
  JOIN _s312_num10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=33
  JOIN _s312_num10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-10-the-ark-goes-before-rise-up-yahuah-and-let-thine-enemies-be-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_11.sql (Numbers 11) -----
-- Chapter: Numbers 11  |  tag: num11  |  session prefix: s312
-- Sort band base 23750, step 3 (23750, 23753, 23756, 23759, 23762, 23765)
-- Temp view: _s312_num11_lookup
--
-- Numbers 11 coverage:
--   v.1-3  (Taberah, the fire of Yahuah, Moses prays, the fire quenched)
--          NT:     1 Corinthians 10:10 (murmuring judged — the destroyer)
--          Extras: none warranted
--          Tanakh: Psalm 78:21 (a fire was kindled against Jacob)
--   v.4-9  (the mixt multitude lust for flesh, despise the manna, the manna described)
--          NT:     1 Corinthians 10:6 (examples — lust not after evil things); John 6:31-33,49-51 (the true bread from heaven)
--          Extras: none warranted
--          Tanakh: Psalm 78:18-25 (tempted Elohim by asking meat for their lust; angels' food); Exodus 16:31 (manna like coriander seed)
--   v.10-15 (Moses overwhelmed — I am not able to bear all this people alone)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Exodus 18:18 (thou art not able to perform it thyself alone); Deuteronomy 1:9 (I am not able to bear you myself alone)
--   v.16-17,24-25 (the seventy elders — Yahuah takes of the spirit and puts it on them; they prophesy)
--          NT:     Luke 10:1 (the seventy sent); Acts 6:3,6 (seven chosen, hands laid, to share the burden)
--          Extras: none warranted
--          Tanakh: Exodus 24:1,9 (the seventy of the elders went up)
--   v.26-29 (Eldad and Medad prophesy in the camp; would Elohim that all Yahuah's people were prophets)
--          NT:     Joel 2:28-29 — wait, Joel is Tanakh; NT: Acts 2:16-18 (this is that spoken by Joel); Mark 9:38-40 (forbid him not)
--          Extras: none warranted
--          Tanakh: Joel 2:28-29 (I will pour out my spirit upon all flesh); 1 Samuel 10:6 (the Spirit of Yahuah will come upon thee)
--   v.31-35 (the quail, the plague, Kibroth-hattaavah — the graves of lust)
--          NT:     1 Corinthians 10:6 (examples — lust not after evil things)
--          Extras: none warranted
--          Tanakh: Psalm 78:26-31 (while their meat was yet in their mouths, the wrath came); Psalm 106:14-15 (he gave them their request, but sent leanness)
--
-- Threads (all slugs prefixed numbers-11-, none in EXISTING_SLUGS.txt):
--   numbers-11-the-fire-at-taberah-and-moses-prayer-quenched-it    [free]  Tanakh(Ps78) + NT(1Cor10)
--   numbers-11-the-mixt-multitude-despised-the-bread-of-heaven      [free]  Tanakh(Ps78,Exo16) + NT(1Cor10,John6)
--   numbers-11-i-am-not-able-to-bear-this-people-alone             [free]  Tanakh(Exo18,Deut1)
--   numbers-11-the-spirit-shared-upon-the-seventy-elders           [free]  Tanakh(Exo24) + NT(Luke10,Acts6)
--   numbers-11-would-that-all-yahuahs-people-were-prophets          [free]  Tanakh(Joel2,1Sam10) + NT(Acts2,Mark9)
--   numbers-11-the-graves-of-lust-at-kibroth-hattaavah             [free]  Tanakh(Ps78,Ps106) + NT(1Cor10)
-- Contested framing: the manna despised (v.6 "our soul loatheth this light bread"/"there is nothing
--   at all, beside this manna") is read as despising the bread of heaven — the very type John 6 fills
--   with the true bread, the Formed Son's flesh given for the life of the world. The seventy + Eldad/Medad
--   is read straight to Joel 2 / Acts 2: the Spirit on ALL Yahuah's people, the longing Moses voiced fulfilled.

CREATE TEMP VIEW _s312_num11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ================= cross_references =================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the fire at Taberah
    ('canon','numbers',11,1, 'canon','psalms',78,21,
      E'*Therefore Yahuah (LORD) heard this, and was wroth: so a fire was kindled against Jacob, and anger also came up against Yashar''el (Israel)* (Psalm 78:21). The psalmist sings the very judgment of Numbers 11: when *the people complained, it displeased Yahuah (LORD)... and the fire of Yahuah (LORD) burnt among them* (Numbers 11:1). The wilderness murmuring kindles the covenant Father''s anger.',
      'free'),
    ('canon','numbers',11,1, 'canon','1-corinthians',10,10,
      E'*Neither murmur ye, as some of them also murmured, and were destroyed of the destroyer* (1 Corinthians 10:10). Paul reads the wilderness murmuring — the fire that *consumed them that were in the uttermost parts of the camp* (Numbers 11:1) — as a written warning to the two-house assembly: the murmurer is judged still.',
      'free'),
    ('canon','numbers',11,2, 'canon','1-corinthians',10,11,
      E'*Now all these things happened unto them for ensamples: and they are written for our admonition, upon whom the ends of the world are come* (1 Corinthians 10:11). The mercy of Numbers 11:2 — *when Moses prayed unto Yahuah (LORD), the fire was quenched* — stands written as admonition; the intercessor turns away the wrath.',
      'free'),
    -- Thread 2: the mixt multitude despised the bread of heaven
    ('canon','numbers',11,4, 'canon','1-corinthians',10,6,
      E'*Now these things were our examples, to the intent we should not lust after evil things, as they also lusted* (1 Corinthians 10:6). The *mixt multitude that was among them fell a lusting* (Numbers 11:4) is Paul''s named pattern of evil craving — the lust that despises Yahuah''s provision.',
      'free'),
    ('canon','numbers',11,6, 'canon','psalms',78,18,
      E'*And they tempted Elohim (God) in their heart by asking meat for their lust* (Psalm 78:18). The cry *there is nothing at all, beside this manna, before our eyes* (Numbers 11:6) is the heart-tempting the psalm names: the bread of heaven counted as nothing.',
      'free'),
    ('canon','numbers',11,6, 'canon','psalms',78,25,
      E'*Man did eat angels'' food: he sent them meat to the full* (Psalm 78:25). The manna the people loathed as *light bread* the psalmist calls *angels'' food* — the despising of Numbers 11:6 is the despising of heaven''s own table.',
      'free'),
    ('canon','numbers',11,7, 'canon','exodus',16,31,
      E'*And the house of Yashar''el (Israel) called the name thereof Manna: and it was like coriander seed, white; and the taste of it was like wafers made with honey* (Exodus 16:31). Numbers 11:7 echoes the first description — *the manna was as coriander seed* — the same bread of heaven now scorned that was first received as wonder.',
      'free'),
    ('canon','numbers',11,6, 'canon','john',6,49,
      E'*Your fathers did eat manna in the wilderness, and are dead* (John 6:49). Yahusha (Jesus) takes up the very manna the people despised in Numbers 11:6 and contrasts it with himself: the wilderness bread sustained mortal flesh but could not give life.',
      'free'),
    ('canon','numbers',11,6, 'canon','john',6,32,
      E'*Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (John 6:32). The manna the people loathed (*this light bread*, Numbers 11:6) was the shadow; the Formed Son is the substance — the true bread the Father gives.',
      'free'),
    ('canon','numbers',11,6, 'canon','john',6,51,
      E'*I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51). The despised manna of Numbers 11:6 finds its fulfillment in the Formed Son, the bread of heaven given for the life of the world.',
      'free'),
    -- Thread 3: I am not able to bear this people alone
    ('canon','numbers',11,14, 'canon','exodus',18,18,
      E'*Thou wilt surely wear away, both thou, and this people that is with thee: for this thing is too heavy for thee; thou art not able to perform it thyself alone* (Exodus 18:18). Jethro''s word at Sinai foretells Moses'' cry in Numbers 11:14 — *I am not able to bear all this people alone, because it is too heavy for me* — the burden no single man can carry.',
      'free'),
    ('canon','numbers',11,14, 'canon','deuteronomy',1,9,
      E'*And I spake unto you at that time, saying, I am not able to bear you myself alone* (Deuteronomy 1:9). Moses himself recalls the very confession of Numbers 11:14, woven into the covenant retelling: the shared burden of governing Yahuah''s multiplied people.',
      'free'),
    -- Thread 4: the Spirit shared upon the seventy elders
    ('canon','numbers',11,16, 'canon','exodus',24,1,
      E'*And he said unto Moses, Come up unto Yahuah (LORD), thou, and Aaron, Nadab, and Abihu, and seventy of the elders of Yashar''el (Israel); and worship ye afar off* (Exodus 24:1). The seventy gathered in Numbers 11:16 echo the seventy who ascended at Sinai — the appointed elders set apart to stand before Yahuah with Moses.',
      'free'),
    ('canon','numbers',11,17, 'canon','luke',10,1,
      E'*After these things Yahuah (Lord) appointed other seventy also, and sent them two and two before his face into every city and place, whither he himself would come* (Luke 10:1). As Yahuah took of the spirit on Moses and put it on the seventy (Numbers 11:17), so the Formed Son appoints seventy and sends them in his authority — the pattern of the shared commission.',
      'free'),
    ('canon','numbers',11,17, 'canon','acts',6,3,
      E'*Wherefore, brethren, look ye out among you seven men of honest report, full of the Ruach HaKodesh (Holy Spirit) and wisdom, whom we may appoint over this business* (Acts 6:3). The apostles repeat Numbers 11:17 — men *full of the Ruach HaKodesh* set apart so the leaders *bear it not... alone*; the Spirit distributed for the shared burden.',
      'free'),
    ('canon','numbers',11,25, 'canon','acts',6,6,
      E'*Whom they set before the apostles: and when they had prayed, they laid their hands on them* (Acts 6:6). As Yahuah *came down in a cloud... and took of the spirit that was upon him, and gave it unto the seventy elders* (Numbers 11:25), so the appointed seven receive the laying on of hands — the Spirit conferred for ministry.',
      'free'),
    -- Thread 5: would that all Yahuah's people were prophets
    ('canon','numbers',11,29, 'canon','joel',2,28,
      E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions* (Joel 2:28). Moses'' longing — *would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29) — is the prophecy Joel records: the Spirit poured on all.',
      'free'),
    ('canon','numbers',11,29, 'canon','joel',2,29,
      E'*And also upon the servants and upon the handmaids in those days will I pour out my spirit* (Joel 2:29). The Spirit Moses wished upon all Yahuah''s people (Numbers 11:29) is poured even on servants and handmaids — none excluded from the prophetic Spirit.',
      'free'),
    ('canon','numbers',11,29, 'canon','acts',2,17,
      E'*And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams* (Acts 2:17). At Shavuot Peter declares Numbers 11:29 answered — the Spirit poured on all flesh, the longing of Moses fulfilled in the ingathering.',
      'free'),
    ('canon','numbers',11,29, 'canon','acts',2,18,
      E'*And on my servants and on my handmaidens I will pour out in those days of my Spirit; and they shall prophesy* (Acts 2:18). The Spirit Moses wished on every one of Yahuah''s people (Numbers 11:29) falls at Pentecost on servant and handmaid alike — all prophesying.',
      'free'),
    ('canon','numbers',11,28, 'canon','mark',9,38,
      E'*And John answered him, saying, Master, we saw one casting out devils in thy name, and he followeth not us: and we forbad him, because he followeth not us* (Mark 9:38). Joshua''s zeal — *My lord Moses, forbid them* (Numbers 11:28) — is the same envy John shows: the disciple would bar the one who works outside the inner circle.',
      'free'),
    ('canon','numbers',11,29, 'canon','mark',9,39,
      E'*But Yahusha (Jesus) said, Forbid him not: for there is no man which shall do a miracle in my name, that can lightly speak evil of me* (Mark 9:39). The Formed Son rebukes the envy exactly as Moses did — *Enviest thou for my sake?* (Numbers 11:29) — for the Spirit is not the property of the few.',
      'free'),
    ('canon','numbers',11,26, 'canon','1-samuel',10,6,
      E'*And the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man* (1 Samuel 10:6). As the spirit rested on Eldad and Medad and *they prophesied in the camp* (Numbers 11:26), so the Spirit comes upon Saul to prophesy — the Spirit of Yahuah falling where he wills.',
      'free'),
    -- Thread 6: the graves of lust at Kibroth-hattaavah
    ('canon','numbers',11,33, 'canon','psalms',78,30,
      E'*They were not estranged from their lust. But while their meat was yet in their mouths* (Psalm 78:30). The psalm renders Numbers 11:33 word for word — *while the flesh was yet between their teeth, ere it was chewed, the wrath of Yahuah (LORD) was kindled* — the craving cut short by judgment.',
      'free'),
    ('canon','numbers',11,33, 'canon','psalms',78,31,
      E'*The wrath of Elohim (God) came upon them, and slew the fattest of them, and smote down the chosen men of Yashar''el (Israel)* (Psalm 78:31). This is the *very great plague* of Numbers 11:33 — the granted desire turned to death.',
      'free'),
    ('canon','numbers',11,34, 'canon','psalms',106,15,
      E'*And he gave them their request; but sent leanness into their soul* (Psalm 106:15). Kibroth-hattaavah, *the graves of lust* where *they buried the people that lusted* (Numbers 11:34), is the psalm''s warning embodied: the request granted, but leanness sent into the soul.',
      'free'),
    ('canon','numbers',11,34, 'canon','1-corinthians',10,6,
      E'*Now these things were our examples, to the intent we should not lust after evil things, as they also lusted* (1 Corinthians 10:6). The graves of lust in Numbers 11:34 are the very example Paul holds up — the craving that buries; the warning written for the assembly upon whom the ends of the world are come.',
      'free')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,note,tier)
  JOIN _s312_num11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ================= threads =================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-11-the-fire-at-taberah-and-moses-prayer-quenched-it',
       E'The fire at Taberah, and Moses'' prayer quenched it',
       E'Numbers 11 opens in judgment: *And when the people complained, it displeased Yahuah (LORD): and Yahuah (LORD) heard it; and his anger was kindled; and the fire of Yahuah (LORD) burnt among them, and consumed them that were in the uttermost parts of the camp* (Numbers 11:1). The murmuring of the covenant people kindles the Father''s anger — and the psalmist sings the same fire: *Therefore Yahuah (LORD) heard this, and was wroth: so a fire was kindled against Jacob, and anger also came up against Yashar''el (Israel)* (Psalm 78:21). Yet mercy answers the intercessor: *And the people cried unto Moses; and when Moses prayed unto Yahuah (LORD), the fire was quenched* (Numbers 11:2). Paul reads this wilderness murmuring as a standing warning to the two-house assembly: *Neither murmur ye, as some of them also murmured, and were destroyed of the destroyer* (1 Corinthians 10:10), for *all these things happened unto them for ensamples... written for our admonition* (1 Corinthians 10:11).',
       sv.verse_id, ev.verse_id, 'free', 23750
  FROM _s312_num11_lookup sv, _s312_num11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-11-the-mixt-multitude-despised-the-bread-of-heaven',
       E'The mixt multitude despised the bread of heaven',
       E'*And the mixt multitude that was among them fell a lusting: and the children of Yashar''el (Israel) also wept again, and said, Who shall give us flesh to eat?* (Numbers 11:4). They despise the manna outright — *there is nothing at all, beside this manna, before our eyes* (Numbers 11:6) — even as the text testifies to its wonder: *the manna was as coriander seed* (Numbers 11:7; cf. *like coriander seed, white; and the taste of it was like wafers made with honey*, Exodus 16:31). The psalm names the sin precisely: *they tempted Elohim (God) in their heart by asking meat for their lust* (Psalm 78:18), scorning what was in truth *angels'' food* (Psalm 78:25). Paul makes them our pattern: *these things were our examples, to the intent we should not lust after evil things, as they also lusted* (1 Corinthians 10:6). And the bread they loathed is the very type the Formed Son fills: *Your fathers did eat manna in the wilderness, and are dead* (John 6:49); *Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (John 6:32); *I am the living bread which came down from heaven... and the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51). To despise the manna is to despise the bread of heaven.',
       sv.verse_id, ev.verse_id, 'free', 23753
  FROM _s312_num11_lookup sv, _s312_num11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-11-i-am-not-able-to-bear-this-people-alone',
       E'I am not able to bear all this people alone',
       E'Under the weight of the murmuring people Moses pours out his anguish: *I am not able to bear all this people alone, because it is too heavy for me* (Numbers 11:14). This is no new cry — Jethro had foretold it at Sinai: *Thou wilt surely wear away, both thou, and this people that is with thee: for this thing is too heavy for thee; thou art not able to perform it thyself alone* (Exodus 18:18). And Moses himself recalls it in the covenant retelling: *I am not able to bear you myself alone* (Deuteronomy 1:9). The burden of shepherding Yahuah''s multiplied people is more than one man can carry — which is precisely why Yahuah will distribute the Spirit upon the seventy.',
       sv.verse_id, ev.verse_id, 'free', 23756
  FROM _s312_num11_lookup sv, _s312_num11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=11 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-11-the-spirit-shared-upon-the-seventy-elders',
       E'The Spirit shared upon the seventy elders',
       E'Yahuah answers Moses'' overwhelmed cry by distributing the Spirit: *Gather unto me seventy men of the elders of Yashar''el (Israel)... that they may stand there with thee* (Numbers 11:16); *I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone* (Numbers 11:17). And it is done: *And Yahuah (LORD) came down in a cloud, and spake unto him, and took of the spirit that was upon him, and gave it unto the seventy elders: and it came to pass, that, when the spirit rested upon them, they prophesied* (Numbers 11:25). The seventy echo the seventy who ascended at Sinai — *Come up unto Yahuah (LORD), thou, and Aaron, Nadab, and Abihu, and seventy of the elders of Yashar''el (Israel)* (Exodus 24:1). The pattern carries forward: the Formed Son *appointed other seventy also, and sent them two and two before his face* (Luke 10:1); and the apostles, unwilling to *leave the word of Elohim (God), and serve tables*, set apart *seven men of honest report, full of the Ruach HaKodesh (Holy Spirit) and wisdom* (Acts 6:3), *and when they had prayed, they laid their hands on them* (Acts 6:6). The Spirit is shared for the shared burden.',
       sv.verse_id, ev.verse_id, 'free', 23759
  FROM _s312_num11_lookup sv, _s312_num11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=11 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-11-would-that-all-yahuahs-people-were-prophets',
       E'Would that all Yahuah''s people were prophets',
       E'Two of the seventy — *Eldad... and Medad* — receive the Spirit but remain in the camp: *the spirit rested upon them... and they prophesied in the camp* (Numbers 11:26). When Joshua would forbid them — *My lord Moses, forbid them* (Numbers 11:28) — Moses answers with a longing that runs to the heart of the whole framework: *Enviest thou for my sake? would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29). That longing is the very word Joel records: *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28), *and also upon the servants and upon the handmaids* (Joel 2:29). At Shavuot Peter declares it answered — *I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy* (Acts 2:17), *and on my servants and on my handmaidens... and they shall prophesy* (Acts 2:18). The same envy Joshua showed, the Formed Son rebukes in his own disciples — *we forbad him, because he followeth not us* (Mark 9:38); *Forbid him not* (Mark 9:39) — for the Spirit of Yahuah falls where he wills, even *upon thee, and thou shalt prophesy... and shalt be turned into another man* (1 Samuel 10:6). The Spirit is not the property of the few but the promised inheritance of all Yahuah''s people.',
       sv.verse_id, ev.verse_id, 'free', 23762
  FROM _s312_num11_lookup sv, _s312_num11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=11 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-11-the-graves-of-lust-at-kibroth-hattaavah',
       E'The graves of lust at Kibroth-hattaavah',
       E'The flesh they craved is granted — and becomes their grave. The quail fall (Numbers 11:31), the people gather greedily (Numbers 11:32), and then: *while the flesh was yet between their teeth, ere it was chewed, the wrath of Yahuah (LORD) was kindled against the people, and Yahuah (LORD) smote the people with a very great plague* (Numbers 11:33). The place is named for the judgment: *Kibroth-hattaavah: because there they buried the people that lusted* (Numbers 11:34) — the graves of lust. The psalm renders the scene word for word: *while their meat was yet in their mouths, the wrath of Elohim (God) came upon them, and slew the fattest of them, and smote down the chosen men of Yashar''el (Israel)* (Psalm 78:30-31). And it sounds the deeper warning: *he gave them their request; but sent leanness into their soul* (Psalm 106:15). Paul holds the whole episode up as our example — *that we should not lust after evil things, as they also lusted* (1 Corinthians 10:6). The granted craving buries the soul.',
       sv.verse_id, ev.verse_id, 'free', 23765
  FROM _s312_num11_lookup sv, _s312_num11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=11 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ================= thread_members =================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 78:21 — *a fire was kindled against Jacob*: the psalm sings the Taberah fire, the murmuring that kindles the Father''s anger.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-fire-at-taberah-and-moses-prayer-quenched-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Corinthians 10:10 — *neither murmur ye... destroyed of the destroyer*: the wilderness murmuring as standing warning to the assembly.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-fire-at-taberah-and-moses-prayer-quenched-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 10:11 — *written for our admonition*: the mercy of Moses'' intercession stands written as warning and grace.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-fire-at-taberah-and-moses-prayer-quenched-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Corinthians 10:6 — *our examples... not lust after evil things*: the mixt multitude''s craving made our warning.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-mixt-multitude-despised-the-bread-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 78:18 — *tempted Elohim... by asking meat for their lust*: counting the bread of heaven as nothing.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-mixt-multitude-despised-the-bread-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 78:25 — *man did eat angels'' food*: the loathed manna was heaven''s own table.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-mixt-multitude-despised-the-bread-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 16:31 — *like coriander seed, white... like wafers made with honey*: the first wonder, now scorned.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=7
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-mixt-multitude-despised-the-bread-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'John 6:49 — *your fathers did eat manna... and are dead*: the despised wilderness bread could not give life.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-mixt-multitude-despised-the-bread-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'John 6:32 — *my Father giveth you the true bread from heaven*: the manna was the shadow, the Formed Son the substance.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-mixt-multitude-despised-the-bread-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'John 6:51 — *I am the living bread... my flesh, which I will give for the life of the world*: the manna fulfilled in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-mixt-multitude-despised-the-bread-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 18:18 — *thou art not able to perform it thyself alone*: Jethro foretold the burden no single man can bear.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=14
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-i-am-not-able-to-bear-this-people-alone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 1:9 — *I am not able to bear you myself alone*: Moses recalls the very cry in the covenant retelling.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=14
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-i-am-not-able-to-bear-this-people-alone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 24:1 — *seventy of the elders of Yashar''el... worship ye afar off*: the seventy who ascended at Sinai.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=16
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-spirit-shared-upon-the-seventy-elders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Luke 10:1 — *Yahuah appointed other seventy also, and sent them*: the Formed Son repeats the pattern of the shared commission.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=17
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-spirit-shared-upon-the-seventy-elders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Acts 6:3 — *seven men... full of the Ruach HaKodesh*: men set apart so the leaders bear it not alone.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=17
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-spirit-shared-upon-the-seventy-elders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 6:6 — *when they had prayed, they laid their hands on them*: the Spirit conferred for ministry, as upon the seventy.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=25
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-spirit-shared-upon-the-seventy-elders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joel 2:28 — *I will pour out my spirit upon all flesh... shall prophesy*: Moses'' longing recorded as prophecy.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=29
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-would-that-all-yahuahs-people-were-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joel 2:29 — *upon the servants and upon the handmaids... I pour out my spirit*: none excluded from the prophetic Spirit.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=29
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-would-that-all-yahuahs-people-were-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Acts 2:17 — *in the last days... I will pour out of my Spirit upon all flesh*: Peter declares Moses'' wish fulfilled at Shavuot.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=29
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-would-that-all-yahuahs-people-were-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 2:18 — *on my servants and on my handmaidens... they shall prophesy*: the Spirit on every one of Yahuah''s people.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=29
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-would-that-all-yahuahs-people-were-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Mark 9:38 — *we forbad him, because he followeth not us*: Joshua''s envy mirrored in the disciple.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=28
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-would-that-all-yahuahs-people-were-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Mark 9:39 — *Forbid him not*: the Formed Son rebukes the envy as Moses did — the Spirit is not the property of the few.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=29
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-would-that-all-yahuahs-people-were-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'1 Samuel 10:6 — *the Spirit of Yahuah will come upon thee, and thou shalt prophesy*: the Spirit falling where he wills, as on Eldad and Medad.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=26
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=10 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-would-that-all-yahuahs-people-were-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 78:30 — *while their meat was yet in their mouths*: the psalm renders the quail-plague word for word.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=33
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-graves-of-lust-at-kibroth-hattaavah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 78:31 — *the wrath of Elohim came upon them, and slew the fattest of them*: the very great plague of Numbers 11:33.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=33
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-graves-of-lust-at-kibroth-hattaavah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 106:15 — *he gave them their request; but sent leanness into their soul*: the granted craving that buries the soul.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=34
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-graves-of-lust-at-kibroth-hattaavah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 10:6 — *our examples... not lust after evil things*: the graves of lust held up as warning to the assembly.'
  FROM cross_reference_threads t
  JOIN _s312_num11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=11 AND sv.verse_number=34
  JOIN _s312_num11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-11-the-graves-of-lust-at-kibroth-hattaavah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_12.sql (Numbers 12) -----
-- Book: Numbers   Chapter: 12   Tag: num12   Session: s312
-- Sort band base 23775, step 3  ->  23775, 23778, 23781
-- Source rows ALWAYS 'canon','numbers',12,v
--
-- Numbers 12 coverage:
--   v.1-3  (Miriam/Aaron speak against Moses; the man Moses very meek)
--          NT:     Matthew 11:29 (I am meek and lowly in heart), Matthew 5:5 (blessed are the meek) -> THREAD 1
--          Extras: none warranted (no clean meekness-of-Moses witness; Jasher/Jub material noisy)
--          Tanakh: handled in-thread (the meek leader who does not defend himself)
--   v.4-8  (Yahuah distinguishes Moses; mouth to mouth, similitude of Yahuah; faithful in all mine house)
--          NT:     Hebrews 3:5-6 (Moses faithful as a servant / Messiah as a Son over his house), John 1:17-18 (the only begotten declared the unseen Father) -> THREAD 2
--          Extras: none warranted
--          Tanakh: Deuteronomy 34:10 (no prophet like Moses, face to face), Exodus 33:11 (Yahuah spake face to face), Deuteronomy 18:15/18 (a Prophet like unto me) -> THREAD 2
--   v.9-15 (Miriam leprous; Moses cries Heal her now; shut out seven days)
--          NT:     Romans 12:14 (bless them which persecute you), Romans 12:21 (overcome evil with good) -> THREAD 3
--          Extras: none warranted
--          Tanakh: Deuteronomy 24:9 (remember what Yahuah did unto Miriam), Leviticus 13:46 (the leper shall dwell without the camp) -> THREAD 3
--   v.16   (removed to wilderness of Paran) NT none / Extras none / Tanakh none warranted (itinerary)
--
-- THREADS (all members canon -> tier free):
--   numbers-12-the-man-moses-was-very-meek            (NT canon)              band 23775
--   numbers-12-with-him-will-i-speak-mouth-to-mouth   (NT + Tanakh canon)     band 23778
--   numbers-12-moses-cried-heal-her-now-for-his-accuser (NT + Tanakh canon)   band 23781

CREATE TEMP VIEW _s312_num12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the man Moses was very meek
    ('canon','numbers',12,3,'canon','matthew',11,29,'free',
      E'*Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls* (Matthew 11:29). The chapter pauses to testify, *Now the man Moses was very meek, above all the men which were upon the face of the earth* (Numbers 12:3) — and when Miriam and Aaron speak against him, Moses does not defend himself; Yahuah (LORD) vindicates him. The Prophet like unto Moses takes up that same meekness as the very mark by which his yoke is learned.'),
    ('canon','numbers',12,3,'canon','matthew',5,5,'free',
      E'*Blessed are the meek: for they shall inherit the earth* (Matthew 5:5). The man who was *very meek, above all the men which were upon the face of the earth* (Numbers 12:3) is the living first-instance of the blessing — the meek leader who leaves his cause with Yahuah (LORD) inherits the land and the people he led.'),
    -- THREAD 2: with him will I speak mouth to mouth (the face-to-face servant -> the Son)
    ('canon','numbers',12,7,'canon','hebrews',3,5,'free',
      E'*And Moses verily was faithful in all his house, as a servant, for a testimony of those things which were to be spoken after* (Hebrews 3:5). Yahuah (LORD) names Moses *my servant Moses... who is faithful in all mine house* (Numbers 12:7); the apostle quotes the very words and reads Moses as the faithful servant whose faithfulness was a testimony pointing forward to what would be spoken after.'),
    ('canon','numbers',12,7,'canon','hebrews',3,6,'free',
      E'*But Messiah (Christ) as a son over his own house; whose house are we, if we hold fast the confidence and the rejoicing of the hope firm unto the end* (Hebrews 3:6). Moses is *faithful in all mine house* (Numbers 12:7) as the servant within the house; the Formed Son is faithful as a Son OVER the house — the type and its fulfillment held in one frame, the servant pointing to the Son.'),
    ('canon','numbers',12,8,'canon','exodus',33,11,'free',
      E'*And Yahuah (LORD) spake unto Moses face to face, as a man speaketh unto his friend* (Exodus 33:11). This is the nearness Numbers describes: *With him will I speak mouth to mouth, even apparently, and not in dark speeches; and the similitude of Yahuah (LORD) shall he behold* (Numbers 12:8). The same friend-nearness — and the *similitude of Yahuah* that Moses beholds is the Formed Son, the visible expression of the unseen Father.'),
    ('canon','numbers',12,8,'canon','deuteronomy',34,10,'free',
      E'*And there arose not a prophet since in Yashar''el (Israel) like unto Moses, whom Yahuah (LORD) knew face to face* (Deuteronomy 34:10). Numbers sets Moses apart from every other prophet — to them a vision or a dream, but to Moses, *mouth to mouth... and the similitude of Yahuah (LORD) shall he behold* (Numbers 12:8); Deuteronomy seals it as the standing word: no prophet ever rose like him, until the Prophet like unto him should come.'),
    ('canon','numbers',12,8,'canon','deuteronomy',18,15,'free',
      E'*Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken* (Deuteronomy 18:15). The unique mouth-to-mouth nearness of Numbers 12:8 is exactly what makes Moses the pattern — the promised Prophet is one *like unto* this servant who beheld *the similitude of Yahuah (LORD)*.'),
    ('canon','numbers',12,8,'canon','deuteronomy',18,18,'free',
      E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The servant to whom Yahuah (LORD) spoke *mouth to mouth* (Numbers 12:8) is the very measure of the coming Prophet — the words put in his mouth, the same direct speech, fulfilled in the Formed Son.'),
    ('canon','numbers',12,8,'canon','john',1,18,'free',
      E'*No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18). Moses beheld *the similitude of Yahuah (LORD)* (Numbers 12:8) — the visible likeness, the Formed Son who declares the formless Father; not the unseen Most High himself, but the only begotten who makes him known.'),
    ('canon','numbers',12,7,'canon','john',1,17,'free',
      E'*For the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17). The faithful servant of *all mine house* (Numbers 12:7) is named as the one through whom the Torah was given; the Son over the house brings grace and truth — the servant and the Son set side by side, the same covenant household.'),
    -- THREAD 3: Moses cried, Heal her now -- intercession for his accuser
    ('canon','numbers',12,13,'canon','romans',12,14,'free',
      E'*Bless them which persecute you: bless, and curse not* (Romans 12:14). Miriam had spoken against Moses, yet when she is struck leprous he does not gloat — *And Moses cried unto Yahuah (LORD), saying, Heal her now, O Elohim (God), I beseech thee* (Numbers 12:13). The meek servant blesses the one who wronged him; the apostle gives the rule Moses already lived.'),
    ('canon','numbers',12,13,'canon','romans',12,21,'free',
      E'*Be not overcome of evil, but overcome evil with good* (Romans 12:21). Miriam''s evil words against Moses are answered not with vengeance but with intercession — *Heal her now, O Elohim (God), I beseech thee* (Numbers 12:13). Moses overcomes his accuser''s evil with good, the very pattern the apostle commands.'),
    ('canon','numbers',12,14,'canon','deuteronomy',24,9,'free',
      E'*Remember what Yahuah Elohayka (the LORD thy God) did unto Miriam by the way, after that ye were come forth out of Egypt* (Deuteronomy 24:9). Numbers records the sentence — *let her be shut out from the camp seven days* (Numbers 12:14) — and the Torah later sets it as a standing memorial: remember Miriam, that the tongue against the anointed servant brings the leper''s exile.'),
    ('canon','numbers',12,14,'canon','leviticus',13,46,'free',
      E'*All the days wherein the plague shall be in him he shall be defiled; he is unclean: he shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46). Miriam''s leprosy puts her under the very law of the leper — *let her be shut out from the camp seven days* (Numbers 12:14); the priestly statute is enacted upon Aaron''s own sister, no respecter of persons.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== threads =====================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-12-the-man-moses-was-very-meek',
       E'The man Moses was very meek',
       E'When Miriam and Aaron speak against Moses — *Hath Yahuah (LORD) indeed spoken only by Moses? hath he not spoken also by us?* (Numbers 12:2) — the narrator sets down the key to the whole chapter in a parenthesis: *Now the man Moses was very meek, above all the men which were upon the face of the earth* (Numbers 12:3). The meek leader does not answer the accusation or defend his own authority; he leaves his cause with Yahuah (LORD), who hears and vindicates him. That meekness is no weakness — it is the mark of the one Yahuah trusts with his whole house. The Prophet like unto Moses takes up the very same yoke: *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls* (Matthew 11:29), and he names it as a blessing inherited — *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5). Moses, very meek above all men, is the living first-fruit of that beatitude.',
       sv.verse_id, ev.verse_id, 'free', 23775
  FROM _s312_num12_lookup sv, _s312_num12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=12 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-12-with-him-will-i-speak-mouth-to-mouth',
       E'With him will I speak mouth to mouth — the faithful servant and the Son',
       E'Yahuah (LORD) comes down in the pillar of the cloud to settle the rebellion, and in doing so distinguishes Moses from every other prophet: *If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream. My servant Moses is not so, who is faithful in all mine house. With him will I speak mouth to mouth, even apparently, and not in dark speeches; and the similitude of Yahuah (LORD) shall he behold* (Numbers 12:6-8). This is the Torah''s own seal — *there arose not a prophet since in Yashar''el (Israel) like unto Moses, whom Yahuah (LORD) knew face to face* (Deuteronomy 34:10) — and the friend-nearness shown earlier: *Yahuah (LORD) spake unto Moses face to face, as a man speaketh unto his friend* (Exodus 33:11). The *similitude of Yahuah (LORD)* that Moses beholds is the Formed Son, the visible likeness of the unseen Father — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18); *the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17). Because Moses is *faithful in all mine house* as a servant, he is the very pattern of the coming Prophet — *a Prophet from among their brethren, like unto thee* (Deuteronomy 18:18; cf. 18:15). The apostle holds the type and its fulfillment in one frame: *Moses verily was faithful in all his house, as a servant, for a testimony of those things which were to be spoken after; But Messiah (Christ) as a son over his own house* (Hebrews 3:5-6). The servant within the house points to the Son over it.',
       sv.verse_id, ev.verse_id, 'free', 23778
  FROM _s312_num12_lookup sv, _s312_num12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-12-moses-cried-heal-her-now-for-his-accuser',
       E'Heal her now — Moses intercedes for his accuser',
       E'The anger of Yahuah (LORD) is kindled, the cloud departs, and *behold, Miriam became leprous, white as snow* (Numbers 12:10). She is brought under the very law of the leper — *he shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46) — and Aaron pleads with Moses. But the meek servant does not repay the one who spoke against him with silence or vengeance; *Moses cried unto Yahuah (LORD), saying, Heal her now, O Elohim (God), I beseech thee* (Numbers 12:13). He intercedes for his accuser. This is the Moses-pattern the apostle later commands: *Bless them which persecute you: bless, and curse not* (Romans 12:14), and *Be not overcome of evil, but overcome evil with good* (Romans 12:21). The sentence still stands — *let her be shut out from the camp seven days* (Numbers 12:14) — and the Torah keeps the memory as a standing warning against the tongue lifted up against Yahuah''s anointed servant: *Remember what Yahuah Elohayka (the LORD thy God) did unto Miriam by the way, after that ye were come forth out of Egypt* (Deuteronomy 24:9).',
       sv.verse_id, ev.verse_id, 'free', 23781
  FROM _s312_num12_lookup sv, _s312_num12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ===================== thread_members =====================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Take my yoke upon you, and learn of me; for I am meek and lowly in heart* (Matthew 11:29) — the Prophet like unto Moses takes up the meekness of *the man Moses... very meek, above all the men* (Numbers 12:3).'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-the-man-moses-was-very-meek'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Blessed are the meek: for they shall inherit the earth* (Matthew 5:5) — Moses, *very meek, above all the men which were upon the face of the earth* (Numbers 12:3), is the living first-instance of the blessing.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-the-man-moses-was-very-meek'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) spake unto Moses face to face, as a man speaketh unto his friend* (Exodus 33:11) — the same friend-nearness of *mouth to mouth... and the similitude of Yahuah (LORD) shall he behold* (Numbers 12:8).'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-with-him-will-i-speak-mouth-to-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*there arose not a prophet since in Yashar''el (Israel) like unto Moses, whom Yahuah (LORD) knew face to face* (Deuteronomy 34:10) — the standing seal of Moses'' unique nearness in Numbers 12:8.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=34 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-with-him-will-i-speak-mouth-to-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a Prophet from the midst of thee, of thy brethren, like unto me* (Deuteronomy 18:15) — the mouth-to-mouth servant of Numbers 12:8 is the measure of the coming Prophet.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-with-him-will-i-speak-mouth-to-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a Prophet from among their brethren, like unto thee, and will put my words in his mouth* (Deuteronomy 18:18) — the same direct speech Moses received *mouth to mouth* (Numbers 12:8), fulfilled in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-with-him-will-i-speak-mouth-to-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17) — the faithful servant of *all mine house* (Numbers 12:7) named beside the Son.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-with-him-will-i-speak-mouth-to-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*No man hath seen Elohim (God) at any time; the only begotten Son... he hath declared him* (John 1:18) — *the similitude of Yahuah (LORD)* Moses beheld (Numbers 12:8) is the Formed Son who declares the unseen Father.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-with-him-will-i-speak-mouth-to-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Moses verily was faithful in all his house, as a servant, for a testimony of those things which were to be spoken after* (Hebrews 3:5) — the apostle quotes *faithful in all mine house* (Numbers 12:7) of the servant.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-with-him-will-i-speak-mouth-to-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*But Messiah (Christ) as a son over his own house* (Hebrews 3:6) — Moses faithful as servant within the house (Numbers 12:7), the Son faithful over it.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-with-him-will-i-speak-mouth-to-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Bless them which persecute you: bless, and curse not* (Romans 12:14) — Moses cries *Heal her now, O Elohim (God), I beseech thee* (Numbers 12:13) for the one who spoke against him.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-moses-cried-heal-her-now-for-his-accuser'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Be not overcome of evil, but overcome evil with good* (Romans 12:21) — Miriam''s evil words answered by intercession, not vengeance (Numbers 12:13).'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-moses-cried-heal-her-now-for-his-accuser'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Remember what Yahuah Elohayka (the LORD thy God) did unto Miriam by the way* (Deuteronomy 24:9) — the Torah keeps the seven-day exile (Numbers 12:14) as a standing memorial against the tongue lifted up.'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=14
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-moses-cried-heal-her-now-for-his-accuser'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46) — Miriam falls under the very law of the leper, *shut out from the camp seven days* (Numbers 12:14).'
  FROM cross_reference_threads t
  JOIN _s312_num12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=12 AND sv.verse_number=14
  JOIN _s312_num12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=13 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-12-moses-cried-heal-her-now-for-his-accuser'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_13.sql (Numbers 13) -----
-- Book: Numbers  Chapter: 13  (the twelve spies search the land of Canaan)
-- Tag: num13   Session prefix: s312   Temp view: _s312_num13_lookup
-- Sort band: base 23800 step 3  ->  23800, 23803, 23806, 23809
-- Source rows ALL 'canon','numbers',13,v
--
-- Numbers 13 coverage:
--   v.1-3   (the send / one ruler per tribe)
--           NT:     none warranted  Extras: none warranted  Tanakh: none warranted (administrative roll)
--   v.4-15  (the named spies, one per tribe)
--           NT:     none warranted  Extras: none warranted  Tanakh: none warranted (the roll of names)
--   v.8,16  (Oshea the son of Nun renamed Jehoshua by Moses)
--           NT:     Matthew 1:21 (call his name Yahusha, for he shall save) -> THREAD 1 forward
--           Extras: none warranted
--           Tanakh: lateral self Numbers 13:8 (Oshea named) -> 13:16 (renamed Jehoshua) -> THREAD 1
--   v.17-22 (sent up southward; Hebron, the children of Anak)
--           NT:     none warranted  Extras: weighed 1 Enoch 7 (giants) -> deferred to evil-report thread (v.33)
--           Tanakh: none warranted standalone
--   v.23-27 (the cluster of Eshcol borne on a staff; floweth with milk and honey)
--           NT:     none warranted (the fruit-foretaste of the good land)
--           Extras: none warranted
--           Tanakh: Deuteronomy 1:24, 1:25 (the valley of Eshcol, the good land's fruit) -> THREAD 2 lateral
--   v.28-29 (NEVERTHELESS the people be strong, the children of Anak)
--           NT:     none warranted  Extras: none warranted  Tanakh: folds into the evil-report thread
--   v.30    (Caleb: let us go up at once, we are WELL ABLE)
--           NT:     none warranted
--           Extras: none warranted
--           Tanakh: Numbers 14:24 (my servant Caleb followed me fully), Joshua 14:8 (I wholly followed Yahuah) -> THREAD 3
--   v.31-33 (the ten's evil report; we be not able; the giants; as grasshoppers)
--           NT:     Hebrews 3:19 (could not enter in because of unbelief) -> THREAD 4 forward
--           Extras: 1 Enoch 7:2 (the giants, three thousand ells) -> THREAD 4 (the sons of Anak = the Nephilim's brood)
--           Tanakh: Deuteronomy 1:28 (the sons of the Anakims), Numbers 14:37 (the evil-report bringers die by plague) -> THREAD 4
--
-- THREADS (4):
--   1 numbers-13-oshea-renamed-jehoshua-the-name-of-salvation   [free]  canon NT (Matthew) + canon lateral (Numbers self)
--   2 numbers-13-the-cluster-of-eshcol-the-fruit-of-the-good-land [free] canon lateral (Deuteronomy)
--   3 numbers-13-caleb-we-are-well-able-takes-yahuah-at-his-word  [free] canon lateral (Numbers, Joshua)
--   4 numbers-13-the-evil-report-of-unbelief                      [extras] canon NT (Hebrews) + canon lateral (Deut, Num) + 1 Enoch
--
-- Framework-load-bearing framing:
--   * 13:16 Jehoshua = "Yahuah is salvation"; the name of Joshua IS the name of Yahusha (Matthew 1:21,
--     for he shall save) -- the Formed-Son's own name carried by the man who leads Yashar'el into the land.
--   * 13:33 the giants/sons of Anak read through 1 Enoch 7 (the Nephilim) -- the seed-war flesh that
--     swallows the unbelieving eye; the evil report measures by the flesh, not by Yahuah.

CREATE TEMP VIEW _s312_num13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== CROSS_REFERENCES ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Oshea renamed Jehoshua = the name of salvation
    ('canon','numbers',13,16,'canon','numbers',13,8,'free',
     E'*Of the tribe of Ephraim, Oshea the son of Nun.* (Numbers 13:8) The spy of Ephraim is enrolled under his birth-name Oshea; then the chapter''s closing roll declares the change: *And Moses called Oshea the son of Nun Jehoshua* (Numbers 13:16). The one man among the twelve who would lead Yashar''el (Israel) into the land is given the name that means *Yahuah is salvation* before he ever sets foot in it.'),
    ('canon','numbers',13,16,'canon','matthew',1,21,'free',
     E'*And she shall bring forth a son, and thou shalt call his name Yahusha (JESUS): for he shall save his people from their sins.* (Matthew 1:21) The name Moses gives in *Moses called Oshea the son of Nun Jehoshua* (Numbers 13:16) is the very name of the Formed Son -- Jehoshua / Yahusha, *Yahuah is salvation*. The man who leads the people into the inheritance bears the salvation-name; the One who saves his people from their sins fills it.'),
    -- THREAD 2: the cluster of Eshcol, the fruit of the good land
    ('canon','numbers',13,23,'canon','deuteronomy',1,24,'free',
     E'*And they turned and went up into the mountain, and came unto the valley of Eshcol, and searched it out.* (Deuteronomy 1:24) Moses, recounting the same mission forty years on, names the place the spies reached -- the very brook where *they came unto the brook of Eshcol, and cut down from thence a branch with one cluster of grapes, and they bare it between two upon a staff* (Numbers 13:23). The cluster of Eshcol is the foretaste of the promised inheritance.'),
    ('canon','numbers',13,27,'canon','deuteronomy',1,25,'free',
     E'*And they took of the fruit of the land in their hands, and brought it down unto us, and brought us word again, and said, It is a good land which Yahuah Eloheinu (the LORD our God) doth give us.* (Deuteronomy 1:25) The spies'' true verdict in Numbers -- *surely it floweth with milk and honey; and this is the fruit of it* (Numbers 13:27) -- is the same verdict Moses preserves: a GOOD land that Yahuah is giving. The fruit in their hands testifies to the goodness of the gift.'),
    -- THREAD 3: Caleb -- we are well able -- the faith that takes Yahuah at his word
    ('canon','numbers',13,30,'canon','numbers',14,24,'free',
     E'*But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it.* (Numbers 14:24) When Caleb stills the people -- *Let us go up at once, and possess it; for we are well able to overcome it* (Numbers 13:30) -- Yahuah names it *another spirit*: faith that follows fully and takes Yahuah at his word. Caleb alone of that generation is promised the land and the seed-inheritance.'),
    ('canon','numbers',13,30,'canon','joshua',14,8,'free',
     E'*Nevertheless my brethren that went up with me made the heart of the people melt: but I wholly followed Yahuah Elohai (the LORD my God).* (Joshua 14:8) Forty-five years later Caleb claims the very land he believed in, recalling his lone stand: where the ten melted the people''s heart, he *wholly followed Yahuah*. The *we are well able* of Numbers 13:30 is the faith that, in the end, inherits.'),
    -- THREAD 4: the evil report of unbelief
    ('canon','numbers',13,31,'canon','hebrews',3,19,'free',
     E'*So we see that they could not enter in because of unbelief.* (Hebrews 3:19) The ten''s answer to Caleb -- *We be not able to go up against the people; for they are stronger than we* (Numbers 13:31) -- is named by the apostle as the unbelief that barred a whole generation from the rest. Not the giants, but the failure to take Yahuah at his word, shut the door.'),
    ('canon','numbers',13,32,'canon','numbers',14,37,'free',
     E'*Even those men that did bring up the evil report upon the land, died by the plague before Yahuah (LORD).* (Numbers 14:37) The very men of *they brought up an evil report of the land which they had searched* (Numbers 13:32) are sentenced: the slander against Yahuah''s good gift draws Yahuah''s judgment. The evil report of unbelief is no light thing.'),
    ('canon','numbers',13,33,'canon','deuteronomy',1,28,'free',
     E'*Whither shall we go up? our brethren have discouraged our heart, saying, The people is greater and taller than we; the cities are great and walled up to heaven; and moreover we have seen the sons of the Anakims there.* (Deuteronomy 1:28) Moses repeats the same fear that Numbers records -- *there we saw the giants, the sons of Anak... and we were in our own sight as grasshoppers* (Numbers 13:33). The flesh measured against the flesh always concludes defeat.'),
    ('canon','numbers',13,33,'enoch','1-enoch',7,2,'extras',
     E'*And they became pregnant, and they bare great giants, whose height was three thousand ells:* (1 Enoch 7:2) The *giants, the sons of Anak, which come of the giants* of Numbers 13:33 are the brood the Watchers'' rebellion loosed upon the earth -- the Nephilim whose monstrous stature 1 Enoch records. They are the seed-war flesh that swallowed the unbelieving eye, so that *we were in our own sight as grasshoppers, and so we were in their sight* (Numbers 13:33).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== THREADS ==============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-13-oshea-renamed-jehoshua-the-name-of-salvation',
       E'Oshea Renamed Jehoshua: The Name of Salvation',
       E'Among the twelve rulers sent to search the land, the spy of Ephraim is enrolled as *Of the tribe of Ephraim, Oshea the son of Nun* (Numbers 13:8). But the closing roll records a change Moses made: *And Moses called Oshea the son of Nun Jehoshua* (Numbers 13:16). Jehoshua means *Yahuah is salvation* -- and it is the very name of the Formed Son: *And she shall bring forth a son, and thou shalt call his name Yahusha (JESUS): for he shall save his people from their sins* (Matthew 1:21). The man who alone among his generation would lead Yashar''el (Israel) into the inheritance is given the salvation-name before the journey; the One who saves his people from their sins fills it.',
       sv.verse_id, ev.verse_id, 'free', 23800
  FROM _s312_num13_lookup sv, _s312_num13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-13-the-cluster-of-eshcol-the-fruit-of-the-good-land',
       E'The Cluster of Eshcol: The Fruit of the Good Land',
       E'The spies bring back a foretaste of the inheritance: *And they came unto the brook of Eshcol, and cut down from thence a branch with one cluster of grapes, and they bare it between two upon a staff; and they brought of the pomegranates, and of the figs* (Numbers 13:23). Their true verdict was the good one: *surely it floweth with milk and honey; and this is the fruit of it* (Numbers 13:27). Forty years on Moses preserves the same place and the same goodness: *they... came unto the valley of Eshcol, and searched it out* (Deuteronomy 1:24), *and... said, It is a good land which Yahuah Eloheinu (the LORD our God) doth give us* (Deuteronomy 1:25). The cluster borne between two is the firstfruit-witness that Yahuah''s gift is good.',
       sv.verse_id, ev.verse_id, 'free', 23803
  FROM _s312_num13_lookup sv, _s312_num13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=13 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-13-caleb-we-are-well-able-takes-yahuah-at-his-word',
       E'Caleb: We Are Well Able -- The Faith That Takes Yahuah at His Word',
       E'Against the rising murmur Caleb stands alone: *And Caleb stilled the people before Moses, and said, Let us go up at once, and possess it; for we are well able to overcome it* (Numbers 13:30). He does not deny the giants or the walls; he simply takes Yahuah at his word. Yahuah names that posture *another spirit*: *But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it* (Numbers 14:24). And forty-five years later Caleb claims the very ground he believed in: *Nevertheless my brethren that went up with me made the heart of the people melt: but I wholly followed Yahuah Elohai (the LORD my God)* (Joshua 14:8). The faith that says *we are well able* is the faith that, in the end, inherits.',
       sv.verse_id, ev.verse_id, 'free', 23806
  FROM _s312_num13_lookup sv, _s312_num13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=13 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-13-the-evil-report-of-unbelief',
       E'The Evil Report of Unbelief',
       E'The ten answer Caleb by measuring the flesh against the flesh: *We be not able to go up against the people; for they are stronger than we* (Numbers 13:31). Their report is named for what it is: *And they brought up an evil report of the land which they had searched* (Numbers 13:32), capped by *there we saw the giants, the sons of Anak... and we were in our own sight as grasshoppers, and so we were in their sight* (Numbers 13:33). Those giants are the seed-war brood the Watchers'' fall loosed -- *they... bare great giants, whose height was three thousand ells* (1 Enoch 7:2) -- and the unbelieving eye is swallowed by them. Moses recalls the same melting fear: *the cities are great and walled up to heaven; and moreover we have seen the sons of the Anakims there* (Deuteronomy 1:28). The verdict is Yahuah''s: *those men that did bring up the evil report upon the land, died by the plague before Yahuah (LORD)* (Numbers 14:37), and the apostle seals the lesson: *So we see that they could not enter in because of unbelief* (Hebrews 3:19). Not the giants, but the failure to take Yahuah at his word, shut the door of the rest.',
       sv.verse_id, ev.verse_id, 'extras', 23809
  FROM _s312_num13_lookup sv, _s312_num13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=13 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ============================== THREAD MEMBERS ==============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Moses called Oshea the son of Nun Jehoshua* (Numbers 13:16) -- the spy of Ephraim, enrolled as Oshea in 13:8, is renamed to the salvation-name before the land is entered.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s312_num13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-oshea-renamed-jehoshua-the-name-of-salvation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt call his name Yahusha (JESUS): for he shall save his people from their sins* (Matthew 1:21) -- Jehoshua / Yahusha, *Yahuah is salvation*: the man who leads the people in bears the very name of the One who saves.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s312_num13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-oshea-renamed-jehoshua-the-name-of-salvation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*they... came unto the valley of Eshcol, and searched it out* (Deuteronomy 1:24) -- Moses names the same brook of Eshcol where the cluster of 13:23 was cut down.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=23
  JOIN _s312_num13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-the-cluster-of-eshcol-the-fruit-of-the-good-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*It is a good land which Yahuah Eloheinu (the LORD our God) doth give us* (Deuteronomy 1:25) -- the same good verdict as 13:27''s *surely it floweth with milk and honey*: the fruit testifies the gift is good.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=27
  JOIN _s312_num13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-the-cluster-of-eshcol-the-fruit-of-the-good-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*my servant Caleb, because he had another spirit with him, and hath followed me fully... his seed shall possess it* (Numbers 14:24) -- Yahuah names Caleb''s *we are well able* as the spirit that follows fully and inherits.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=30
  JOIN _s312_num13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-caleb-we-are-well-able-takes-yahuah-at-his-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*but I wholly followed Yahuah Elohai (the LORD my God)* (Joshua 14:8) -- Caleb, claiming the land forty-five years later, recalls the lone stand of 13:30; the faith that took Yahuah at his word inherits.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=30
  JOIN _s312_num13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=14 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-caleb-we-are-well-able-takes-yahuah-at-his-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*So we see that they could not enter in because of unbelief* (Hebrews 3:19) -- the apostle names the ten''s *We be not able* (13:31): not the giants, but unbelief, barred the rest.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=31
  JOIN _s312_num13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-the-evil-report-of-unbelief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*those men that did bring up the evil report upon the land, died by the plague before Yahuah (LORD)* (Numbers 14:37) -- the bringers of the evil report of 13:32 are sentenced; the slander against the good gift draws judgment.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=32
  JOIN _s312_num13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-the-evil-report-of-unbelief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The people is greater and taller than we; the cities are great and walled up to heaven; and moreover we have seen the sons of the Anakims there* (Deuteronomy 1:28) -- Moses repeats the melting fear of 13:33; the flesh measured against the flesh always concludes defeat.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=33
  JOIN _s312_num13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-the-evil-report-of-unbelief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they... bare great giants, whose height was three thousand ells* (1 Enoch 7:2) -- the *giants, the sons of Anak* of 13:33 are the Watcher-loosed Nephilim brood; the seed-war flesh that swallows the unbelieving eye into *as grasshoppers*.'
  FROM cross_reference_threads t
  JOIN _s312_num13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=13 AND sv.verse_number=33
  JOIN _s312_num13_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-13-the-evil-report-of-unbelief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_14.sql (Numbers 14) -----
-- Chapter: Numbers 14  |  tag: num14  |  session prefix: s312
-- Sort band base 23825, step 3  (23825, 23828, 23831, 23834, 23837, 23840)
--
-- Numbers 14 coverage:
--   v.1-4   (the congregation weeps and rebels — would Elohim we had died in Egypt / let us return)
--        NT:     Acts 7:39 (in their hearts turned back again into Egypt)
--        Extras: none warranted
--        Tanakh: Psalm 106:24-25 (they despised the pleasant land, murmured in their tents)
--   v.5-10  (Joshua and Caleb rend their clothes — only rebel not / their defence is departed)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 13:30 (Caleb stilled the people — let us go up at once)
--   v.11-19 (★★ MOSES' GREAT INTERCESSION — plead the Name, the reputation, the self-revelation)
--        NT:     Romans 9:3 (Paul's Moses-like wish), Hebrews 7:25 (he ever liveth to make
--                intercession), 1 John 2:1 (an advocate with the Father)
--        Extras: none warranted
--        Tanakh: Exodus 32:11-14 (the same Moses-intercession at the calf), Exodus 34:6-7 (the
--                self-revelation Moses quotes), Psalm 106:23 (Moses stood before him in the breach)
--   v.20-25 (★ I have pardoned according to thy word — yet the earth filled with the glory; Caleb)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Habakkuk 2:14 (the earth filled with the knowledge of the glory),
--                Deuteronomy 1:36 (Caleb — he hath wholly followed Yahuah)
--   v.26-35 (★★ THE SENTENCE — carcases fall, forty years for forty days, the rest barred)
--        NT:     Hebrews 3:16-19 (carcases fell / could not enter in because of unbelief),
--                Hebrews 4:1-2 (the rest; the word did not profit, not mixed with faith),
--                1 Corinthians 10:5 (overthrown in the wilderness), Jude 1:5 (destroyed them
--                that believed not)
--        Extras: none warranted
--        Tanakh: Psalm 95:10-11 (forty years grieved / sware they should not enter my rest)
--   v.36-38 (the ten spies of the evil report die by the plague — Joshua and Caleb live)
--        NT:     none warranted  (folded into Thread 5 sentence / Thread 2 witnesses)
--        Extras: none warranted
--        Tanakh: none warranted  (the report-bringers judged — handled in coverage prose)
--   v.39-45 (★ the PRESUMPTUOUS attempt — go up without Him, smitten unto Hormah)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deuteronomy 1:41-44 (ye rebelled, went presumptuously up, chased as bees, Hormah)
--
-- THREADS (6):
--   numbers-14-would-elohim-we-had-died-in-egypt-the-heart-that-turns-backward
--        members: Ps106:24-25 (Tanakh/free); Acts7:39 (NT/free) -> tier free
--   numbers-14-joshua-and-caleb-rend-their-clothes-the-two-faithful-witnesses
--        members: Num13:30 (Tanakh/free) -> tier free
--   numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession
--        members: Exod32:11 (Tanakh), Exod32:13 (Tanakh), Exod34:6 (Tanakh), Exod34:7 (Tanakh),
--                 Ps106:23 (Tanakh); Rom9:3, Heb7:25, 1John2:1 (NT) -> tier free
--   numbers-14-i-have-pardoned-according-to-thy-word-yet-the-earth-filled-with-the-glory
--        members: Hab2:14 (Tanakh), Deut1:36 (Tanakh) -> tier free
--   numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest
--        members: Ps95:10 (Tanakh), Ps95:11 (Tanakh); Heb3:16, Heb3:17, Heb3:18, Heb3:19,
--                 Heb4:1, Heb4:2, 1Cor10:5, Jude1:5 (NT) -> tier free
--   numbers-14-they-presumed-to-go-up-without-him-the-door-already-shut
--        members: Deut1:41 (Tanakh), Deut1:42 (Tanakh), Deut1:43 (Tanakh), Deut1:44 (Tanakh) -> tier free
--
-- Framework notes: Chapter 14 is the hinge of the wilderness — the unbelief at Kadesh that bars
-- the rest. (1) The longing backward to Egypt is the heart Psalm 106 sings and Acts 7 names: they
-- *in their hearts turned back again into Egypt*. (2) Joshua and Caleb are the two faithful
-- witnesses who say their defence is departed and Yahuah is with us — the same Caleb of Numbers
-- 13:30. (3) MOSES' GREAT INTERCESSION is the keystone: he refuses to be made a greater nation,
-- stands in the breach (Ps 106:23), pleads the Name and the reputation of Yahuah among the nations,
-- and quotes Yahuah's own self-revelation (Exod 34:6-7) back to Him — the same mediation he made at
-- the calf (Exod 32:11-14). This is the Moses-pattern of the Mediator: Paul's Moses-like wish to be
-- accursed for his kinsmen (Rom 9:3), the Formed Son who *ever liveth to make intercession* (Heb
-- 7:25), the *advocate with the Father* (1 John 2:1). (4) Pardon WITH consequence — *I have pardoned
-- according to thy word* yet the rebels do not see the land, and the earth shall yet be filled with
-- His glory (Hab 2:14); Caleb, of another spirit, follows fully (Deut 1:36). (5) THE SENTENCE: the
-- carcases fall, forty years for forty days, the generation barred from the rest for unbelief — the
-- NT's most quoted wilderness-warning (Heb 3-4, 1 Cor 10:5, Jude 1:5) reaching back to Psalm 95's
-- *they should not enter into my rest*. The new-covenant rest is the SAME rest forfeited here, entered
-- by faith mixed with the word, NOT a different promise. (6) Presumption: after the door is shut they
-- go up without the ark and without Moses and are smitten unto Hormah — self-willed obedience is no
-- obedience (Deut 1:41-44). All members canon -> every thread tier free.

CREATE TEMP VIEW _s312_num14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: would Elohim we had died in Egypt — the heart that turns backward
    ('canon','numbers',14,3,'canon','psalms',106,24,'free',
      E'*Yea, they despised the pleasant land, they believed not his word* (Psalm 106:24). The wilderness psalm sings the very rebellion of this chapter: *And wherefore hath Yahuah (LORD) brought us unto this land, to fall by the sword... were it not better for us to return into Egypt?* (Numbers 14:3). To prefer Egypt to the land of promise is to despise the pleasant land and disbelieve the word of Yahuah.'),
    ('canon','numbers',14,2,'canon','psalms',106,25,'free',
      E'*But murmured in their tents, and hearkened not unto the voice of Yahuah (LORD)* (Psalm 106:25). Psalm 106 names the sin by its name — murmuring — exactly as the chapter opens: *And all the children of Yashar''el (Israel) murmured against Moses and against Aaron... Would Elohim (God) that we had died in the land of Egypt!* (Numbers 14:2). The murmur in the tent is unbelief made audible.'),
    ('canon','numbers',14,4,'canon','acts',7,39,'free',
      E'*To whom our fathers would not obey, but thrust him from them, and in their hearts turned back again into Egypt* (Acts 7:39). Stephen reads the heart behind the words *Let us make a captain, and let us return into Egypt* (Numbers 14:4): they did not merely speak of Egypt — in their hearts they had already turned back, refusing the Mediator Yahuah had set over them.'),
    -- Thread 2: Joshua and Caleb rend their clothes — the two faithful witnesses
    ('canon','numbers',14,9,'canon','numbers',13,30,'free',
      E'*And Caleb stilled the people before Moses, and said, Let us go up at once, and possess it; for we are well able to overcome it* (Numbers 13:30). Caleb''s first cry of faith becomes the joint plea of the two witnesses: *Only rebel not ye against Yahuah (LORD), neither fear ye the people of the land; for they are bread for us: their defence is departed from them, and Yahuah (LORD) is with us: fear them not* (Numbers 14:9). The same confidence — not in their own strength but in the presence of Yahuah — against the evil report of the ten.'),
    -- Thread 3: ★★ Moses stands in the breach pleading the Name — the great intercession
    ('canon','numbers',14,13,'canon','exodus',32,11,'free',
      E'*And Moses besought Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), why doth thy wrath wax hot against thy people, which thou hast brought forth out of the land of Egypt with great power, and with a mighty hand?* (Exodus 32:11). At the golden calf Moses made the same intercession he now makes here: when Yahuah would consume and start over from him, Moses pleads the people back as Yahuah''s OWN, the people He brought up — *Then the Egyptians shall hear it, (for thou broughtest up this people in thy might from among them;)* (Numbers 14:13).'),
    ('canon','numbers',14,16,'canon','exodus',32,13,'free',
      E'*Remember Abraham, Isaac, and Yashar''el (Israel), thy servants, to whom thou swarest by thine own self... I will multiply your seed as the stars of heaven... and they shall inherit it for ever* (Exodus 32:13). At the calf Moses pleaded the sworn promise to the fathers; here he pleads its reputation among the nations, *lest* they say *Because Yahuah (LORD) was not able to bring this people into the land which he sware unto them, therefore he hath slain them in the wilderness* (Numbers 14:16). The intercessor binds Yahuah''s honour to His oath to the seed.'),
    ('canon','numbers',14,18,'canon','exodus',34,6,'free',
      E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). Moses does not invent his plea — he quotes back to Yahuah the very self-revelation Yahuah proclaimed at Sinai: *Yahuah (LORD) is longsuffering, and of great mercy, forgiving iniquity and transgression* (Numbers 14:18). The mediator prays the character of Yahuah back to Him.'),
    ('canon','numbers',14,18,'canon','exodus',34,7,'free',
      E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty; visiting the iniquity of the fathers upon the children... unto the third and to the fourth generation* (Exodus 34:7). Moses quotes this clause word for word — *and by no means clearing the guilty, visiting the iniquity of the fathers upon the children unto the third and fourth generation* (Numbers 14:18) — holding together mercy and justice in the same breath he holds out for pardon.'),
    ('canon','numbers',14,13,'canon','psalms',106,23,'free',
      E'*Therefore he said that he would destroy them, had not Moses his chosen stood before him in the breach, to turn away his wrath, lest he should destroy them* (Psalm 106:23). The psalm names exactly what Moses does in this chapter: he stands in the breach. When Yahuah says *I will smite them... and will make of thee a greater nation* (Numbers 14:12), Moses steps into the gap between the wrath and the people and pleads, *Then the Egyptians shall hear it* (Numbers 14:13).'),
    ('canon','numbers',14,12,'canon','romans',9,3,'free',
      E'*For I could wish that myself were accursed from Messiah (Christ) for my brethren, my kinsmen according to the flesh* (Romans 9:3). Offered a greater nation in his own name — *I will... make of thee a greater nation and mightier than they* (Numbers 14:12) — Moses refuses and intercedes for the people instead. Paul shows the same Moses-heart: he would rather be cut off himself than gain at his kinsmen''s loss.'),
    ('canon','numbers',14,19,'canon','hebrews',7,25,'free',
      E'*Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). Moses'' plea — *Pardon, I beseech thee, the iniquity of this people according unto the greatness of thy mercy* (Numbers 14:19) — is the shadow of the abiding intercession of the Formed Son, who does not plead once and depart but ever liveth to make intercession, saving to the uttermost.'),
    ('canon','numbers',14,19,'canon','1-john',2,1,'free',
      E'*My little children, these things write I unto you, that ye sin not. And if any man sin, we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* (1 John 2:1). Moses standing before Yahuah to plead *Pardon, I beseech thee, the iniquity of this people* (Numbers 14:19) is the type of the Advocate — the One who stands with the Father on behalf of those who have sinned, pleading not their merit but His mercy.'),
    -- Thread 4: ★ I have pardoned according to thy word — yet the earth filled with the glory
    ('canon','numbers',14,21,'canon','habakkuk',2,14,'free',
      E'*For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14). Even in the act of pardoning the rebels who shall not see the land, Yahuah swears His unstoppable purpose: *But as truly as I live, all the earth shall be filled with the glory of Yahuah (LORD)* (Numbers 14:21). A generation may perish in unbelief, yet the glory will fill the whole earth — Habakkuk lifts the same oath into prophecy.'),
    ('canon','numbers',14,24,'canon','deuteronomy',1,36,'free',
      E'*Save Caleb the son of Jephunneh; he shall see it, and to him will I give the land that he hath trodden upon, and to his children, because he hath wholly followed Yahuah (LORD)* (Deuteronomy 1:36). Moses'' later retelling fixes the reason for Caleb''s exemption exactly as it stands here: *But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land* (Numbers 14:24). The one of another spirit, who follows fully, inherits where the rebels fall.'),
    -- Thread 5: ★★ your carcases shall fall — the unbelief that bars the rest
    ('canon','numbers',14,29,'canon','psalms',95,10,'free',
      E'*Forty years long was I grieved with this generation, and said, It is a people that do err in their heart, and they have not known my ways* (Psalm 95:10). The forty-year sentence — *your carcases shall fall in this wilderness* (Numbers 14:29), *forty days, each day for a year... even forty years* (Numbers 14:34) — is the very grief Psalm 95 names: a generation erring in heart, not knowing His ways.'),
    ('canon','numbers',14,30,'canon','psalms',95,11,'free',
      E'*Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:11). The oath of exclusion is sworn here: *Doubtless ye shall not come into the land, concerning which I sware to make you dwell therein* (Numbers 14:30). Psalm 95 turns that oath into a standing warning — the rest forfeited at Kadesh is the rest the living are still called to enter.'),
    ('canon','numbers',14,29,'canon','hebrews',3,16,'free',
      E'*For some, when they had heard, did provoke: howbeit not all that came out of Egypt by Moses* (Hebrews 3:16). Hebrews opens its great wilderness-warning on this generation — the ones who heard the signs yet provoked, *which have murmured against me* (Numbers 14:29). Not all (Joshua and Caleb), but the great number, fell under the oath.'),
    ('canon','numbers',14,32,'canon','hebrews',3,17,'free',
      E'*But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:17). Hebrews quotes the sentence of this chapter almost verbatim: *But as for you, your carcases, they shall fall in this wilderness* (Numbers 14:32). The forty years of grief and the fallen carcases are the warning the new-covenant people are not to repeat.'),
    ('canon','numbers',14,23,'canon','hebrews',3,18,'free',
      E'*And to whom sware he that they should not enter into his rest, but to them that believed not?* (Hebrews 3:18). The oath of exclusion — *Surely they shall not see the land which I sware unto their fathers, neither shall any of them that provoked me see it* (Numbers 14:23) — is read by Hebrews as the oath barring them from REST: the land is the figure, the rest is the substance.'),
    ('canon','numbers',14,11,'canon','hebrews',3,19,'free',
      E'*So we see that they could not enter in because of unbelief* (Hebrews 3:19). Hebrews names the single root Yahuah named first: *how long will it be ere they believe me, for all the signs which I have shewed among them?* (Numbers 14:11). Not weakness, not the giants, not the walled cities — unbelief alone barred them from entering.'),
    ('canon','numbers',14,30,'canon','hebrews',4,1,'free',
      E'*Let us therefore fear, lest, a promise being left us of entering into his rest, any of you should seem to come short of it* (Hebrews 4:1). Because *ye shall not come into the land* (Numbers 14:30) was spoken to that generation, the promise of rest yet stands open — and the warning stands with it: take heed lest any come short as they did.'),
    ('canon','numbers',14,11,'canon','hebrews',4,2,'free',
      E'*For unto us was the gospel preached, as well as unto them: but the word preached did not profit them, not being mixed with faith in them that heard it* (Hebrews 4:2). They heard the same good word of the good land and the same signs — yet *how long will it be ere they believe me?* (Numbers 14:11). The word does not profit unless it is mixed with faith; the report of the land was true, but unbelief made it of no profit.'),
    ('canon','numbers',14,35,'canon','1-corinthians',10,5,'free',
      E'*But with many of them Elohim (God) was not well pleased: for they were overthrown in the wilderness* (1 Corinthians 10:5). Paul gathers the whole sentence into one line — *in this wilderness they shall be consumed, and there they shall die* (Numbers 14:35) — and sets it before the assembly as an example written for our admonition: do not presume on signs and deliverance and then fall as they fell.'),
    ('canon','numbers',14,29,'canon','jude',1,5,'free',
      E'*I will therefore put you in remembrance, though ye once knew this, how that Yahuah (Lord), having saved the people out of the land of Egypt, afterward destroyed them that believed not* (Jude 1:5). Jude makes this chapter a permanent remembrance: the SAME people Yahuah saved out of Egypt are the ones whose *carcases shall fall in this wilderness* (Numbers 14:29). Being redeemed out of Egypt did not exempt the unbelieving from judgment.'),
    -- Thread 6: ★ they presumed to go up without Him — the door already shut
    ('canon','numbers',14,40,'canon','deuteronomy',1,41,'free',
      E'*Then ye answered and said unto me, We have sinned against Yahuah (LORD), we will go up and fight, according to all that Yahuah Eloheinu (the LORD our God) commanded us... ye were ready to go up into the hill* (Deuteronomy 1:41). Moses'' retelling matches the chapter: after the sentence the people mourn and reverse course — *Lo, we be here, and will go up unto the place which Yahuah (LORD) hath promised: for we have sinned* (Numbers 14:40) — too late, and on their own will.'),
    ('canon','numbers',14,42,'canon','deuteronomy',1,42,'free',
      E'*And Yahuah (LORD) said unto me, Say unto them, Go not up, neither fight; for I am not among you; lest ye be smitten before your enemies* (Deuteronomy 1:42). The warning is identical: *Go not up, for Yahuah (LORD) is not among you; that ye be not smitten before your enemies* (Numbers 14:42). Obedience after the door is shut is not obedience — to go up without His presence is to go up to defeat.'),
    ('canon','numbers',14,44,'canon','deuteronomy',1,43,'free',
      E'*So I spake unto you; and ye would not hear, but rebelled against the commandment of Yahuah (LORD), and went presumptuously up into the hill* (Deuteronomy 1:43). The presumption is named the same in both books: *But they presumed to go up unto the hill top: nevertheless the ark of the covenant of Yahuah (LORD), and Moses, departed not out of the camp* (Numbers 14:44). They went up without the ark, without the mediator — self-willed, against the word.'),
    ('canon','numbers',14,45,'canon','deuteronomy',1,44,'free',
      E'*And the Amorites, which dwelt in that mountain, came out against you, and chased you, as bees do, and destroyed you in Seir, even unto Hormah* (Deuteronomy 1:44). The outcome is one: *Then the Amalekites came down, and the Canaanites which dwelt in that hill, and smote them, and discomfited them, even unto Hormah* (Numbers 14:45). The presumptuous ascent ends at Hormah — the place of the ban — because they turned away from Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-14-would-elohim-we-had-died-in-egypt-the-heart-that-turns-backward',
       E'Would Elohim we had died in Egypt — the heart that turns backward',
       E'The chapter opens in tears that are really treason: *And all the congregation lifted up their voice, and cried; and the people wept that night* (Numbers 14:1), and the weeping becomes a wish for death and a plan to go back — *Would Elohim (God) that we had died in the land of Egypt!* (Numbers 14:2), *Let us make a captain, and let us return into Egypt* (Numbers 14:4). Psalm 106 sings the same rebellion as the sin it is: *Yea, they despised the pleasant land, they believed not his word* (Psalm 106:24); *But murmured in their tents, and hearkened not unto the voice of Yahuah (LORD)* (Psalm 106:25). Stephen reaches past the words to the heart: *To whom our fathers would not obey, but thrust him from them, and in their hearts turned back again into Egypt* (Acts 7:39). To prefer the house of bondage to the land of promise is to disbelieve the word of Yahuah — the murmur in the tent is unbelief made audible.',
       sv.verse_id, ev.verse_id, 'free', 23825
  FROM _s312_num14_lookup sv, _s312_num14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-14-joshua-and-caleb-rend-their-clothes-the-two-faithful-witnesses',
       E'Joshua and Caleb rend their clothes — the two faithful witnesses',
       E'Against the evil report of the ten, two men stand: *And Joshua the son of Nun, and Caleb the son of Jephunneh, which were of them that searched the land, rent their clothes* (Numbers 14:6). Their confidence is not in themselves but in the presence of Yahuah: *If Yahuah (LORD) delight in us, then he will bring us into this land* (Numbers 14:8), *Only rebel not ye against Yahuah (LORD), neither fear ye the people of the land; for they are bread for us: their defence is departed from them, and Yahuah (LORD) is with us: fear them not* (Numbers 14:9). It is the same cry Caleb raised first: *And Caleb stilled the people before Moses, and said, Let us go up at once, and possess it; for we are well able to overcome it* (Numbers 13:30). The congregation answers faith with stones — *But all the congregation bade stone them with stones* (Numbers 14:10) — and only then does the glory of Yahuah appear. The two faithful witnesses are spared the sentence and live to enter the land.',
       sv.verse_id, ev.verse_id, 'free', 23828
  FROM _s312_num14_lookup sv, _s312_num14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession',
       E'Moses stands in the breach, pleading the Name — the great intercession',
       E'This is the keystone of the chapter and one of the great intercessions of the Tanakh. Yahuah offers Moses what He once offered at the calf: *I will smite them with the pestilence, and disinherit them, and will make of thee a greater nation and mightier than they* (Numbers 14:12). Moses refuses the offer and steps into the gap. He pleads the reputation of Yahuah among the nations — *Then the Egyptians shall hear it* (Numbers 14:13) — *lest* they say *Because Yahuah (LORD) was not able to bring this people into the land which he sware unto them, therefore he hath slain them in the wilderness* (Numbers 14:16). Then he prays Yahuah''s own self-revelation back to Him: *Yahuah (LORD) is longsuffering, and of great mercy, forgiving iniquity and transgression* (Numbers 14:18) — the very words proclaimed at Sinai, *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6), *forgiving iniquity and transgression and sin, and that will by no means clear the guilty* (Exodus 34:7). It is the same mediation he made at the golden calf — *And Moses besought Yahuah Elohav (the LORD his God)* (Exodus 32:11), *Remember Abraham, Isaac, and Yashar''el (Israel)... I will multiply your seed as the stars of heaven* (Exodus 32:13). Psalm 106 names the act exactly: *had not Moses his chosen stood before him in the breach, to turn away his wrath* (Psalm 106:23). This is the Moses-pattern of the Mediator. Paul carries the same heart: *For I could wish that myself were accursed from Messiah (Christ) for my brethren, my kinsmen according to the flesh* (Romans 9:3). And the Formed Son fills it forever — He does not plead once and depart but *ever liveth to make intercession for them* (Hebrews 7:25), the *advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* (1 John 2:1). *Pardon, I beseech thee, the iniquity of this people according unto the greatness of thy mercy* (Numbers 14:19) is the prayer of the breach-stander, pleading not their merit but His mercy and His Name.',
       sv.verse_id, ev.verse_id, 'free', 23831
  FROM _s312_num14_lookup sv, _s312_num14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=14 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-14-i-have-pardoned-according-to-thy-word-yet-the-earth-filled-with-the-glory',
       E'I have pardoned according to thy word — yet the earth filled with the glory',
       E'Yahuah answers the intercession with mercy and with judgment in the same breath. The pardon is real: *And Yahuah (LORD) said, I have pardoned according to thy word* (Numbers 14:20). Yet pardon does not erase consequence — the men who *have tempted me now these ten times* (Numbers 14:22) *shall not see the land which I sware unto their fathers* (Numbers 14:23). And over the whole scene Yahuah swears His unstoppable purpose: *But as truly as I live, all the earth shall be filled with the glory of Yahuah (LORD)* (Numbers 14:21). A generation may forfeit the land, but the glory will fill the whole earth — Habakkuk lifts the same oath into prophecy: *For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14). One man is excepted from the sentence: *But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land* (Numbers 14:24) — and Moses'' later retelling fixes the reason, *because he hath wholly followed Yahuah (LORD)* (Deuteronomy 1:36). The one of another spirit, who follows fully, inherits where the rebels fall.',
       sv.verse_id, ev.verse_id, 'free', 23834
  FROM _s312_num14_lookup sv, _s312_num14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=14 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest',
       E'Your carcases shall fall in the wilderness — the unbelief that bars the rest',
       E'The sentence falls measure for measure. *Your carcases shall fall in this wilderness* (Numbers 14:29); *Doubtless ye shall not come into the land, concerning which I sware to make you dwell therein* (Numbers 14:30); *After the number of the days in which ye searched the land, even forty days, each day for a year... even forty years, and ye shall know my breach of promise* (Numbers 14:34) — forty years for forty days. Yahuah named the root at the very first: *how long will it be ere they believe me, for all the signs which I have shewed among them?* (Numbers 14:11). Psalm 95 turns the whole episode into a standing warning: *Forty years long was I grieved with this generation... they have not known my ways* (Psalm 95:10); *Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:11). Hebrews builds its great exhortation on it — *whose carcases fell in the wilderness?* (Hebrews 3:17), *they could not enter in because of unbelief* (Hebrews 3:19) — and reads the barred land as the still-open rest: *Let us therefore fear, lest, a promise being left us of entering into his rest, any of you should seem to come short of it* (Hebrews 4:1), for *the word preached did not profit them, not being mixed with faith in them that heard it* (Hebrews 4:2). Paul sets it before the assembly as an example — *they were overthrown in the wilderness* (1 Corinthians 10:5) — and Jude makes it a permanent remembrance: *Yahuah (Lord), having saved the people out of the land of Egypt, afterward destroyed them that believed not* (Jude 1:5). Redemption out of Egypt did not exempt the unbelieving; the rest forfeited at Kadesh is the same rest entered only by faith mixed with the word.',
       sv.verse_id, ev.verse_id, 'free', 23837
  FROM _s312_num14_lookup sv, _s312_num14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=14 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-14-they-presumed-to-go-up-without-him-the-door-already-shut',
       E'They presumed to go up without Him — the door already shut',
       E'When the sentence is spoken the people mourn and then reverse course — but too late and on their own will: *And they rose up early in the morning, and gat them up into the top of the mountain, saying, Lo, we be here, and will go up unto the place which Yahuah (LORD) hath promised: for we have sinned* (Numbers 14:40). Moses warns them plainly: *Go not up, for Yahuah (LORD) is not among you; that ye be not smitten before your enemies* (Numbers 14:42). They will not hear: *But they presumed to go up unto the hill top: nevertheless the ark of the covenant of Yahuah (LORD), and Moses, departed not out of the camp* (Numbers 14:44) — they went up without the ark and without the mediator, and were smitten *even unto Hormah* (Numbers 14:45). Deuteronomy tells it the same way: *ye would not hear, but rebelled against the commandment of Yahuah (LORD), and went presumptuously up into the hill* (Deuteronomy 1:43), and *the Amorites... chased you, as bees do, and destroyed you in Seir, even unto Hormah* (Deuteronomy 1:44). Self-willed obedience after the door is shut is not obedience. To go up without His presence — refusing first when He called, then presuming when He forbade — is to go up to defeat.',
       sv.verse_id, ev.verse_id, 'free', 23840
  FROM _s312_num14_lookup sv, _s312_num14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=39
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=14 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: would Elohim we had died in Egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yea, they despised the pleasant land, they believed not his word* (Psalm 106:24) — to prefer Egypt to the promise is to despise the pleasant land and disbelieve the word.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=3
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-would-elohim-we-had-died-in-egypt-the-heart-that-turns-backward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*But murmured in their tents, and hearkened not unto the voice of Yahuah (LORD)* (Psalm 106:25) — the murmur of Numbers 14:2 is unbelief made audible.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-would-elohim-we-had-died-in-egypt-the-heart-that-turns-backward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*in their hearts turned back again into Egypt* (Acts 7:39) — Stephen reads the heart behind ''Let us... return into Egypt'' (Numbers 14:4).'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-would-elohim-we-had-died-in-egypt-the-heart-that-turns-backward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: Joshua and Caleb the two faithful witnesses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Let us go up at once, and possess it; for we are well able to overcome it* (Numbers 13:30) — Caleb''s first cry of faith becomes the joint plea of the two witnesses.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-joshua-and-caleb-rend-their-clothes-the-two-faithful-witnesses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: Moses stands in the breach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Moses besought Yahuah Elohav (the LORD his God)* (Exodus 32:11) — the same intercession Moses made at the golden calf.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=13
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Remember Abraham, Isaac, and Yashar''el (Israel)... I will multiply your seed as the stars of heaven* (Exodus 32:13) — at the calf Moses pleaded the sworn promise; here he pleads its reputation among the nations (Numbers 14:16).'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6) — Moses quotes Yahuah''s own self-revelation back to Him (Numbers 14:18).'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*forgiving iniquity and transgression and sin, and that will by no means clear the guilty* (Exodus 34:7) — Moses quotes this clause word for word in Numbers 14:18, holding mercy and justice together.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*had not Moses his chosen stood before him in the breach, to turn away his wrath* (Psalm 106:23) — the psalm names exactly what Moses does (Numbers 14:13).'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=13
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I could wish that myself were accursed from Messiah (Christ) for my brethren* (Romans 9:3) — Paul refuses gain at his kinsmen''s loss, the same Moses-heart that refused the greater nation (Numbers 14:12).'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=12
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*he ever liveth to make intercession for them* (Hebrews 7:25) — Moses'' plea for pardon (Numbers 14:19) is the shadow of the Formed Son''s abiding intercession.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=19
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* (1 John 2:1) — Moses pleading ''Pardon, I beseech thee'' (Numbers 14:19) is the type of the Advocate.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=19
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-moses-stands-in-the-breach-pleading-the-name-the-great-intercession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: I have pardoned according to thy word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14) — Habakkuk lifts the oath of Numbers 14:21 into prophecy.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=21
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-i-have-pardoned-according-to-thy-word-yet-the-earth-filled-with-the-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*because he hath wholly followed Yahuah (LORD)* (Deuteronomy 1:36) — Moses'' retelling fixes the reason for Caleb''s exemption (Numbers 14:24).'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=24
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-i-have-pardoned-according-to-thy-word-yet-the-earth-filled-with-the-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: your carcases shall fall — the unbelief that bars the rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Forty years long was I grieved with this generation... they have not known my ways* (Psalm 95:10) — the forty-year sentence (Numbers 14:29,34) is the grief Psalm 95 names.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=29
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I sware in my wrath that they should not enter into my rest* (Psalm 95:11) — the oath of Numbers 14:30 becomes the standing rest-warning.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=30
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*not all that came out of Egypt by Moses* (Hebrews 3:16) — those who heard yet provoked (Numbers 14:29).'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=29
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*whose carcases fell in the wilderness?* (Hebrews 3:17) — quotes the sentence of Numbers 14:32 almost verbatim.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=32
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*to whom sware he that they should not enter into his rest, but to them that believed not?* (Hebrews 3:18) — the oath of exclusion (Numbers 14:23) read as the oath barring them from rest.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=23
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they could not enter in because of unbelief* (Hebrews 3:19) — names the single root Yahuah named first (Numbers 14:11).'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=11
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*a promise being left us of entering into his rest... lest any of you should seem to come short* (Hebrews 4:1) — because the land was barred (Numbers 14:30) the rest stands open.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=30
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*the word preached did not profit them, not being mixed with faith* (Hebrews 4:2) — they heard the same word but unbelief (Numbers 14:11) made it of no profit.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=11
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*they were overthrown in the wilderness* (1 Corinthians 10:5) — Paul gathers the sentence of Numbers 14:35 into an example written for our admonition.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=35
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*afterward destroyed them that believed not* (Jude 1:5) — being redeemed out of Egypt did not exempt the unbelieving whose carcases fell (Numbers 14:29).'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=29
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-your-carcases-shall-fall-in-the-wilderness-the-unbelief-that-bars-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: they presumed to go up without Him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*We have sinned against Yahuah (LORD), we will go up and fight* (Deuteronomy 1:41) — the same too-late reversal of Numbers 14:40.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=40
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-they-presumed-to-go-up-without-him-the-door-already-shut'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Go not up, neither fight; for I am not among you* (Deuteronomy 1:42) — identical to the warning of Numbers 14:42.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=42
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-they-presumed-to-go-up-without-him-the-door-already-shut'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*went presumptuously up into the hill* (Deuteronomy 1:43) — the presumption named the same as in Numbers 14:44.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=44
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-they-presumed-to-go-up-without-him-the-door-already-shut'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*chased you, as bees do, and destroyed you in Seir, even unto Hormah* (Deuteronomy 1:44) — the same outcome as Numbers 14:45.'
  FROM cross_reference_threads t
  JOIN _s312_num14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=14 AND sv.verse_number=45
  JOIN _s312_num14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-14-they-presumed-to-go-up-without-him-the-door-already-shut'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_numbers_15.sql (Numbers 15) -----
-- Book: Numbers  Chapter: 15  Tag: num15  Session prefix: s312
-- Temp view: _s312_num15_lookup
-- Sort band base: 23850  step 3  (23850, 23853, 23856, 23859, 23862)
-- Member form: SAFE VERBOSE (one INSERT per member; literal int source verse_number; NO FROM (VALUES...) AS m)
--
-- Numbers 15 coverage checklist:
--   v.1-13 (meat/drink offerings accompanying sacrifices in the land):
--        NT:     none warranted (sub-typed by the broader sacrifice/Heb framing elsewhere)
--        Extras: none warranted
--        Tanakh: Leviticus 2 (the meat offering of flour/oil), Numbers 18:12 (firstfruits oil/wine/wheat) -> THREAD 1
--   v.14-16 (one ordinance / one law for the stranger):
--        NT:     Galatians 3:28, Ephesians 2:19 (no more strangers) -> THREAD 2
--        Extras: none warranted
--        Tanakh: Exodus 12:49, Leviticus 24:22, Numbers 9:14 (one law homeborn+stranger) -> THREAD 2
--   v.17-21 (heave offering of the first of the dough):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 18:12 (firstfruits) -> folded into THREAD 1
--   v.22-29 (sin of ignorance atoned, congregation + individual; one law v.29):
--        NT:     Hebrews 9:7 (errors of the people) -> THREAD 3
--        Extras: none warranted
--        Tanakh: Leviticus 4:27-28 (the soul that sins through ignorance) -> THREAD 3
--   v.30-31 (the sin done presumptuously, with a high hand; despised the word, cut off):
--        NT:     Hebrews 10:26-29 (sin wilfully), 2 Peter 2:21 (turn from the holy commandment) -> THREAD 3
--        Extras: none warranted
--        Tanakh: (contrast within v.22-31, held in THREAD 3)
--   v.32-36 (the man gathering sticks on the sabbath stoned):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exodus 31:14-15, Exodus 35:2 (sabbath kept on pain of death) -> THREAD 4
--   v.37-41 (the fringes / tzitzit with a ribband of blue to remember the commandments):
--        NT:     Matthew 23:5 (enlarge the borders), Matthew 9:20, Matthew 14:36, Luke 8:44 (hem of his garment) -> THREAD 5
--        Extras: none warranted
--        Tanakh: Deuteronomy 22:12 (fringes on four quarters) -> THREAD 5
--
-- Threads (slug -> target libraries):
--   numbers-15-the-meat-and-drink-offerings-of-the-land               (Tanakh; free)
--   numbers-15-one-law-and-one-manner-for-you-and-for-the-stranger    (Tanakh + NT; free)
--   numbers-15-the-sin-of-ignorance-and-the-sin-done-presumptuously   (Tanakh + NT; free)
--   numbers-15-the-man-that-gathered-sticks-upon-the-sabbath-stoned   (Tanakh; free)
--   numbers-15-the-fringes-that-remember-all-the-commandments         (Tanakh + NT; free)
--
-- Framework notes: v.14-16 one-law inclusion of the sojourner is held as covenant-incorporation
--   into the ONE people (Gal 3:28 / Eph 2:19 read as no-more-strangers, NOT Torah abolished:
--   the stranger is brought UNDER the one ordinance, not freed from it). v.30-31 high-handed sin
--   framed by Heb 10:26-29 as despising the same word, NOT the gospel abolishing the law.
--   v.37-41 fringes = the worn reminder of the WHOLE Torah; Matt 23:5 rebukes the abuse-for-show,
--   the fringe itself assumed/affirmed; the hem touched for healing (Matt 9:20/14:36/Luke 8:44).

CREATE TEMP VIEW _s312_num15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: meat and drink offerings of the land
    ('canon','numbers',15,4,'canon','leviticus',2,1,'free',
      E'*And when any will offer a meat offering unto Yahuah (LORD), his offering shall be of fine flour; and he shall pour oil upon it, and put frankincense thereon* (Leviticus 2:1). The land-offering of Numbers 15:4 — *a meat offering of a tenth deal of flour mingled with the fourth part of an hin of oil* — is the same flour-and-oil oblation Leviticus 2 ordained; the wilderness law and the land law are one.'),
    ('canon','numbers',15,19,'canon','numbers',18,12,'free',
      E'*All the best of the oil, and all the best of the wine, and of the wheat, the firstfruits of them which they shall offer unto Yahuah (LORD), them have I given thee* (Numbers 18:12). Numbers 15:19''s *heave offering* of the bread of the land — *a cake of the first of your dough* (v.20) — is the same firstfruits portion given to the priesthood in Numbers 18:12: the first of the land lifted up to Yahuah (LORD).'),
    -- THREAD 2: one law for you and for the stranger
    ('canon','numbers',15,16,'canon','exodus',12,49,'free',
      E'*One law shall be to him that is homeborn, and unto the stranger that sojourneth among you* (Exodus 12:49). Numbers 15:16 — *One law and one manner shall be for you, and for the stranger that sojourneth with you* — repeats verbatim the Passover statute of Exodus 12:49: the sojourner who joins himself to Yahuah (LORD) comes under the one Torah, not beside it.'),
    ('canon','numbers',15,16,'canon','leviticus',24,22,'free',
      E'*Ye shall have one manner of law, as well for the stranger, as for one of your own country: for I am Yahuah Elohaychem (the LORD your God)* (Leviticus 24:22). The *one law and one manner* of Numbers 15:16 is the same single standard of Leviticus 24:22 — the stranger incorporated into Yashar''el (Israel) is held to the identical instruction, sealed by the Name.'),
    ('canon','numbers',15,15,'canon','numbers',9,14,'free',
      E'*And if a stranger shall sojourn among you, and will keep the passover unto Yahuah (LORD); according to the ordinance of the passover, and according to the manner thereof, so shall he do: ye shall have one ordinance, both for the stranger, and for him that was born in the land* (Numbers 9:14). Numbers 15:15 — *as ye are, so shall the stranger be before Yahuah (LORD)* — is the same one-ordinance inclusion already spoken over the Passover six chapters earlier.'),
    ('canon','numbers',15,16,'canon','galatians',3,28,'free',
      E'*There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28). The *one law and one manner* for homeborn and stranger (Numbers 15:16) is the root of the one body Paul names: not a new people, but the sojourner grafted under the one ordinance of the one covenant.'),
    ('canon','numbers',15,15,'canon','ephesians',2,19,'free',
      E'*Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God)* (Ephesians 2:19). The *stranger that sojourneth with you* of Numbers 15:15, set on equal footing — *as ye are, so shall the stranger be before Yahuah (LORD)* — is the same sojourner Ephesians declares brought near as a fellowcitizen of the commonwealth of Yashar''el (Israel).'),
    -- THREAD 3: sin of ignorance vs sin done presumptuously
    ('canon','numbers',15,27,'canon','leviticus',4,27,'free',
      E'*And if any one of the common people sin through ignorance, while he doeth somewhat against any of the commandments of Yahuah (LORD) concerning things which ought not to be done, and be guilty* (Leviticus 4:27). Numbers 15:27''s *if any soul sin through ignorance* is the same unwitting transgression Leviticus 4 provided for: the law makes a way back for the one who erred not knowing.'),
    ('canon','numbers',15,28,'canon','leviticus',4,28,'free',
      E'*Or if his sin, which he hath sinned, come to his knowledge: then he shall bring his offering, a kid of the goats, a female without blemish, for his sin which he hath sinned* (Leviticus 4:28). The *she goat of the first year for a sin offering* by which the priest atones in Numbers 15:27-28 is the very provision of Leviticus 4:28 — the same female kid for the soul that sinned ignorantly.'),
    ('canon','numbers',15,25,'canon','hebrews',9,7,'free',
      E'*But into the second went the high priest alone once every year, not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7). The priest who *make[s] an atonement for all the congregation* for their *ignorance* (Numbers 15:25) prefigures the blood offered for the *errors of the people* — the unwitting sin covered by atonement, fulfilled in the greater priesthood.'),
    ('canon','numbers',15,30,'canon','hebrews',10,26,'free',
      E'*For if we sin wilfully after that we have received the knowledge of the truth, there remaineth no more sacrifice for sins* (Hebrews 10:26). The sin *presumptuously* — *with a high hand* — of Numbers 15:30, for which no offering is named, is exactly the wilful sin after knowledge of Hebrews 10:26: not the soul that erred, but the soul that defies.'),
    ('canon','numbers',15,31,'canon','hebrews',10,29,'free',
      E'*Of how much sorer punishment, suppose ye, shall he be thought worthy, who hath trodden under foot the Son of Elohim (God), and hath counted the blood of the covenant, wherewith he was sanctified, an unholy thing, and hath done despite unto the Spirit of grace?* (Hebrews 10:29). Numbers 15:31 — *he hath despised the word of Yahuah (LORD), and hath broken his commandment, that soul shall utterly be cut off* — is the same despising; Hebrews magnifies the cutting-off for treading under foot the same word made flesh.'),
    ('canon','numbers',15,31,'canon','2-peter',2,21,'free',
      E'*For it had been better for them not to have known the way of righteousness, than, after they have known it, to turn from the holy commandment delivered unto them* (2 Peter 2:21). The high-handed despiser who *hath despised the word of Yahuah (LORD)* (Numbers 15:31) is the one who, having known, turns from the holy commandment — the defiant sin, not the ignorant.'),
    -- THREAD 4: the sabbath sticks-gatherer stoned
    ('canon','numbers',15,35,'canon','exodus',31,14,'free',
      E'*Ye shall keep the sabbath therefore; for it is holy unto you: every one that defileth it shall surely be put to death: for whosoever doeth any work therein, that soul shall be cut off from among his people* (Exodus 31:14). The death sentence on the man who *gathered sticks upon the sabbath day* (Numbers 15:32-35) executes the very statute of Exodus 31:14 — the sign-Sabbath defiled is death.'),
    ('canon','numbers',15,35,'canon','exodus',31,15,'free',
      E'*Six days may work be done; but in the seventh is the sabbath of rest, holy to Yahuah (LORD): whosoever doeth any work in the sabbath day, he shall surely be put to death* (Exodus 31:15). Numbers 15:35 — *The man shall be surely put to death* — is the case-law fulfilment of Exodus 31:15: the gathering of sticks was work in the seventh-day rest, and the penalty stood.'),
    ('canon','numbers',15,32,'canon','exodus',35,2,'free',
      E'*Six days shall work be done, but on the seventh day there shall be to you an holy day, a sabbath of rest to Yahuah (LORD): whosoever doeth work therein shall be put to death* (Exodus 35:2). The man *that gathered sticks upon the sabbath day* (Numbers 15:32) violated the very gravity Exodus 35:2 set on the seventh-day rest — the sign of the covenant guarded on pain of death.'),
    -- THREAD 5: the fringes that remember all the commandments
    ('canon','numbers',15,38,'canon','deuteronomy',22,12,'free',
      E'*Thou shalt make thee fringes upon the four quarters of thy vesture, wherewith thou coverest thyself* (Deuteronomy 22:12). The command to *make them fringes in the borders of their garments* (Numbers 15:38) is repeated in Deuteronomy 22:12 — the worn tzitzit on the four corners, the law twice given.'),
    ('canon','numbers',15,38,'canon','matthew',23,5,'free',
      E'*But all their works they do for to be seen of men: they make broad their phylacteries, and enlarge the borders of their garments* (Matthew 23:5). Yahusha (Jesus) rebukes not the fringe of Numbers 15:38 but its abuse-for-show — *they enlarge the borders of their garments* — the very fringe assumed and worn, the reminder turned into a display.'),
    ('canon','numbers',15,38,'canon','matthew',9,20,'free',
      E'*And, behold, a woman, which was diseased with an issue of blood twelve years, came behind him, and touched the hem of his garment* (Matthew 9:20). The *hem of his garment* the woman touched is the fringe of Numbers 15:38 — Yahusha (Jesus) wore the tzitzit of the commandment, and healing flowed from its border.'),
    ('canon','numbers',15,38,'canon','matthew',14,36,'free',
      E'*And besought him that they might only touch the hem of his garment: and as many as touched were made perfectly whole* (Matthew 14:36). The crowds reached for *the hem of his garment* — the commanded fringe of Numbers 15:38 worn by the Formed Son — and were made whole, the remembrance-fringe become a place of power.'),
    ('canon','numbers',15,39,'canon','luke',8,44,'free',
      E'*Came behind him, and touched the border of his garment: and immediately her issue of blood stanched* (Luke 8:44). The *border of his garment* is the fringe Numbers 15:39 said is *that ye may look upon it, and remember all the commandments of Yahuah (LORD)* — the worn reminder of the whole Torah, on the very garment that healed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s312_num15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s312_num15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-15-the-meat-and-drink-offerings-of-the-land',
       E'The meat and drink offerings of the land',
       E'When Yashar''el (Israel) is *come into the land of your habitations* (Numbers 15:2), every burnt offering and sacrifice is to be brought with its appointed meat offering and drink offering: *a meat offering of a tenth deal of flour mingled with the fourth part of an hin of oil* and *the fourth part of an hin of wine for a drink offering* (Numbers 15:4-5). This is no new law but the land-form of the wilderness Torah: *And when any will offer a meat offering unto Yahuah (LORD), his offering shall be of fine flour; and he shall pour oil upon it* (Leviticus 2:1). And the bread of the land carries its own lifting-up: *Ye shall offer up a cake of the first of your dough for an heave offering* (Numbers 15:20) — the firstfruits portion Yahuah (LORD) gave to the priesthood, *All the best of the oil, and all the best of the wine, and of the wheat, the firstfruits of them which they shall offer unto Yahuah (LORD), them have I given thee* (Numbers 18:12). The first of the land lifted to Yahuah (LORD), the flour and oil and wine of the covenant.',
       sv.verse_id, ev.verse_id, 'free', 23850
  FROM _s312_num15_lookup sv, _s312_num15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=15 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-15-one-law-and-one-manner-for-you-and-for-the-stranger',
       E'One law and one manner for you and for the stranger',
       E'*And if a stranger sojourn with you... and will offer an offering made by fire... as ye do, so he shall do* (Numbers 15:14). Then the binding word: *One ordinance shall be both for you of the congregation, and also for the stranger that sojourneth with you, an ordinance for ever in your generations: as ye are, so shall the stranger be before Yahuah (LORD). One law and one manner shall be for you, and for the stranger* (Numbers 15:15-16). The sojourner who joins himself to Yahuah (LORD) is brought UNDER the one Torah, not set free from it. This is the standing word of the covenant: *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you* (Exodus 12:49); *Ye shall have one manner of law, as well for the stranger, as for one of your own country: for I am Yahuah Elohaychem (the LORD your God)* (Leviticus 24:22); and over the Passover, *ye shall have one ordinance, both for the stranger, and for him that was born in the land* (Numbers 9:14). This one-law inclusion is the root of the one body — *ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28) — and of the sojourner brought near: *ye are no more strangers and foreigners, but fellowcitizens with the saints* (Ephesians 2:19). Not a new people grafted in by confession, but the stranger incorporated into the one ordinance of the one covenant people.',
       sv.verse_id, ev.verse_id, 'free', 23853
  FROM _s312_num15_lookup sv, _s312_num15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=15 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-15-the-sin-of-ignorance-and-the-sin-done-presumptuously',
       E'The sin of ignorance and the sin done presumptuously',
       E'The chapter draws the line that runs the whole Torah and the whole gospel: the sin not known, and the sin defied. For the first there is atonement — *if any soul sin through ignorance, then he shall bring a she goat of the first year for a sin offering... and it shall be forgiven him* (Numbers 15:27-28); the same provision Leviticus made, *if any one of the common people sin through ignorance... and be guilty* (Leviticus 4:27), bringing *a kid of the goats, a female without blemish, for his sin* (Leviticus 4:28). The priest atones for the whole congregation''s *ignorance* (Numbers 15:25), as the high priest went *not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7). But for *the soul that doeth ought presumptuously* — with a high hand — there is no offering named, only the cutting-off: *the same reproacheth Yahuah (LORD)... Because he hath despised the word of Yahuah (LORD), and hath broken his commandment, that soul shall utterly be cut off* (Numbers 15:30-31). This is the wilful sin of Hebrews: *if we sin wilfully after that we have received the knowledge of the truth, there remaineth no more sacrifice for sins* (Hebrews 10:26), and *how much sorer punishment... shall he be thought worthy, who hath trodden under foot the Son of Elohim (God)* (Hebrews 10:29) — the same despising of the same word made flesh. As Kepha (Peter) warns, *it had been better for them not to have known the way of righteousness, than, after they have known it, to turn from the holy commandment delivered unto them* (2 Peter 2:21). The unwitting is covered; the defiant despiser of the word is cut off.',
       sv.verse_id, ev.verse_id, 'free', 23856
  FROM _s312_num15_lookup sv, _s312_num15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=15 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-15-the-man-that-gathered-sticks-upon-the-sabbath-stoned',
       E'The man that gathered sticks upon the sabbath stoned',
       E'Immediately after the word on the high-handed sin, the chapter gives a case of it: *while the children of Yashar''el (Israel) were in the wilderness, they found a man that gathered sticks upon the sabbath day* (Numbers 15:32). They held him in ward, *because it was not declared what should be done to him* (Numbers 15:34), and Yahuah (LORD) answered: *The man shall be surely put to death: all the congregation shall stone him with stones without the camp* (Numbers 15:35). This is no harsh novelty but the execution of the standing Sabbath statute, the sign of the covenant guarded on pain of death: *every one that defileth it shall surely be put to death: for whosoever doeth any work therein, that soul shall be cut off* (Exodus 31:14); *whosoever doeth any work in the sabbath day, he shall surely be put to death* (Exodus 31:15); *whosoever doeth work therein shall be put to death* (Exodus 35:2). The gravity of the death sentence measures the weight of the seventh-day rest — the sign between Yahuah (LORD) and his people, kept holy.',
       sv.verse_id, ev.verse_id, 'free', 23859
  FROM _s312_num15_lookup sv, _s312_num15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=15 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'numbers-15-the-fringes-that-remember-all-the-commandments',
       E'The fringes that remember all the commandments',
       E'The chapter closes with the worn reminder of the whole Torah: *make them fringes in the borders of their garments throughout their generations, and that they put upon the fringe of the borders a ribband of blue* (Numbers 15:38). Its purpose is stated plainly: *that ye may look upon it, and remember all the commandments of Yahuah (LORD), and do them; and that ye seek not after your own heart and your own eyes... That ye may remember, and do all my commandments, and be holy unto your Elohim (God)* (Numbers 15:39-40). The command is twice given: *Thou shalt make thee fringes upon the four quarters of thy vesture, wherewith thou coverest thyself* (Deuteronomy 22:12). Yahusha (Jesus) himself wore the commanded tzitzit; he rebuked not the fringe but its abuse-for-show — *they make broad their phylacteries, and enlarge the borders of their garments* (Matthew 23:5) — the reminder turned into a display. And from the very border of his garment power flowed: *a woman... came behind him, and touched the hem of his garment* (Matthew 9:20); *as many as touched were made perfectly whole* (Matthew 14:36); *touched the border of his garment: and immediately her issue of blood stanched* (Luke 8:44). The fringe that remembers all the commandments, worn by the Formed Son, became a place of healing.',
       sv.verse_id, ev.verse_id, 'free', 23862
  FROM _s312_num15_lookup sv, _s312_num15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=37
   AND ev.edition_slug='canon' AND ev.book_slug='numbers' AND ev.chapter_number=15 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And when any will offer a meat offering unto Yahuah (LORD), his offering shall be of fine flour; and he shall pour oil upon it* (Leviticus 2:1) — the same flour-and-oil oblation as Numbers 15:4.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-meat-and-drink-offerings-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*All the best of the oil, and all the best of the wine, and of the wheat, the firstfruits of them... them have I given thee* (Numbers 18:12) — the firstfruits portion behind the heave offering of the dough in Numbers 15:19-20.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=19
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-meat-and-drink-offerings-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*One law shall be to him that is homeborn, and unto the stranger that sojourneth among you* (Exodus 12:49) — verbatim with the *one law and one manner* of Numbers 15:16.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=16
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-one-law-and-one-manner-for-you-and-for-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye shall have one manner of law, as well for the stranger, as for one of your own country* (Leviticus 24:22) — the single standard sealed by the Name, as Numbers 15:16.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=16
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-one-law-and-one-manner-for-you-and-for-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*ye shall have one ordinance, both for the stranger, and for him that was born in the land* (Numbers 9:14) — the same one-ordinance inclusion over the Passover, as Numbers 15:15.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=15
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-one-law-and-one-manner-for-you-and-for-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28) — the one body rooted in the one law for homeborn and stranger of Numbers 15:16.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=16
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-one-law-and-one-manner-for-you-and-for-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*ye are no more strangers and foreigners, but fellowcitizens with the saints* (Ephesians 2:19) — the sojourner of Numbers 15:15 brought near as a fellowcitizen of Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=15
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-one-law-and-one-manner-for-you-and-for-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if any one of the common people sin through ignorance... and be guilty* (Leviticus 4:27) — the same unwitting transgression provided for in Numbers 15:27.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=27
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-sin-of-ignorance-and-the-sin-done-presumptuously'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he shall bring his offering, a kid of the goats, a female without blemish, for his sin* (Leviticus 4:28) — the same she-goat sin offering as Numbers 15:27-28.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=28
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-sin-of-ignorance-and-the-sin-done-presumptuously'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7) — the atonement for the congregation''s ignorance of Numbers 15:25 fulfilled.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-sin-of-ignorance-and-the-sin-done-presumptuously'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*if we sin wilfully after that we have received the knowledge of the truth, there remaineth no more sacrifice for sins* (Hebrews 10:26) — the high-handed sin of Numbers 15:30 magnified.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=30
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-sin-of-ignorance-and-the-sin-done-presumptuously'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*who hath trodden under foot the Son of Elohim (God)... and hath done despite unto the Spirit of grace* (Hebrews 10:29) — the same despising of the word as Numbers 15:31.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=31
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-sin-of-ignorance-and-the-sin-done-presumptuously'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*after they have known it, to turn from the holy commandment delivered unto them* (2 Peter 2:21) — the defiant despiser of Numbers 15:31, not the ignorant.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=31
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-sin-of-ignorance-and-the-sin-done-presumptuously'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*every one that defileth it shall surely be put to death... that soul shall be cut off* (Exodus 31:14) — the standing Sabbath statute executed in Numbers 15:35.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=35
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-man-that-gathered-sticks-upon-the-sabbath-stoned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*whosoever doeth any work in the sabbath day, he shall surely be put to death* (Exodus 31:15) — the penalty Numbers 15:35 carried out for gathering sticks.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=35
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-man-that-gathered-sticks-upon-the-sabbath-stoned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*whosoever doeth work therein shall be put to death* (Exodus 35:2) — the gravity of the seventh-day rest the sticks-gatherer of Numbers 15:32 violated.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=32
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=35 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-man-that-gathered-sticks-upon-the-sabbath-stoned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt make thee fringes upon the four quarters of thy vesture* (Deuteronomy 22:12) — the same tzitzit command twice given, as Numbers 15:38.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=38
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-fringes-that-remember-all-the-commandments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they make broad their phylacteries, and enlarge the borders of their garments* (Matthew 23:5) — the fringe of Numbers 15:38 assumed, its abuse-for-show rebuked.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=38
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-fringes-that-remember-all-the-commandments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*came behind him, and touched the hem of his garment* (Matthew 9:20) — the commanded fringe of Numbers 15:38, worn by the Formed Son, a place of healing.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=38
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-fringes-that-remember-all-the-commandments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*that they might only touch the hem of his garment... were made perfectly whole* (Matthew 14:36) — the remembrance-fringe of Numbers 15:38 become a place of power.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=38
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=14 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-fringes-that-remember-all-the-commandments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*touched the border of his garment: and immediately her issue of blood stanched* (Luke 8:44) — the fringe that remembers all the commandments (Numbers 15:39), on the garment that healed.'
  FROM cross_reference_threads t
  JOIN _s312_num15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=15 AND sv.verse_number=39
  JOIN _s312_num15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=8 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='numbers-15-the-fringes-that-remember-all-the-commandments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session312 — Numbers cross-references complete.'
