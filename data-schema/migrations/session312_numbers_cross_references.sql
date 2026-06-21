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


COMMIT;
\echo 'session312 — Numbers cross-references complete.'
