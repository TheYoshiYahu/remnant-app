-- ----- fragment: minion_1corinthians_09.sql (S228 1 Corinthians 9) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 9 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 9 (27 verses) — apostolic rights grounded in the law of Moses;
--          all things to all men (missionary accommodation, NOT Torah-abandonment); the race/crown.
-- Tag: co09 (temp view _s228_co09_lookup).
-- Sort band: floor 6800, step 3 (6800, 6803, 6806, 6809 used; under 6825).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul defends his apostolic right to material support, and he grounds the right
-- in TORAH, not against it: *saith not the law the same also? For it is written in the law of Moses,
-- Thou shalt not muzzle the mouth of the ox that treadeth out the corn* (9:8-9). The Levitical
-- portion is the model — *they which minister about holy things live of the things of the temple*
-- (9:13) — and the Lord ordained the same for the gospel (9:14 / Luke 10:7). 9:20-21 is the
-- HIGH-SENSITIVITY frame: *unto the Yahudim (Jews) I became as a Yahudi (Jew)... to them that are
-- under the law, as under the law... To them that are without law, as without law (being not without
-- law to Elohim (God), but under the law to Messiah (Christ))* — read as MISSIONARY ACCOMMODATION,
-- NOT Torah-abandonment. Paul is explicit: he is *not without law to Elohim (God)* but *under the law
-- to Messiah (Christ)* (ennomos Christou — Torah-bound TO the Messiah, never Torah-free). The frame is
-- anchored on the Tanakh Torah-from-within: *thy law is within my heart* (Psalm 40:8) and the
-- new-covenant Torah-internalized *I will put my law in their inward parts, and write it in their
-- hearts* (Jeremiah 31:33). The closing race/crown (9:24-27) — temperance, the body kept under,
-- the incorruptible crown — echoes the Hebrew library's call to refrain from the appetites.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-7   the apostle's rights: eat, drink, lead a wife, forbear working; the soldier/vineyard/flock
--           Tanakh: none warranted (the rights are argued; the Torah ground arrives at v.8-9 and the
--                   vineyard/flock images are illustrative, not a quoted root)
--           Extras: none warranted   NT: none warranted (carried in the law-of-Moses thread at v.8)
--   v.8-12  saith not the law the same? Thou shalt not muzzle the ox that treadeth out the corn
--           Tanakh: Deuteronomy 25:4 (Thou shalt not muzzle the ox when he treadeth out the corn)
--           Extras: none warranted   NT: none warranted
--   v.13-14 they which minister of the temple live of the temple; the Lord ordained gospel-support
--           Tanakh: Numbers 18:8-24 (the priests' and Levites' portion of the offerings/tithe),
--                   Deuteronomy 18:1-4 (the priests the Levites... shall eat the offerings of Yahuah)
--           Extras: none warranted   NT: Luke 10:7 (the labourer is worthy of his hire)
--   v.15-19 I have used none of these; necessity is laid upon me; made myself servant unto all
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (apostolic apologia)
--   v.20-23 to the Jews a Jew; under the law as under the law; not without law to Elohim, under law to Messiah
--           Tanakh: Psalm 40:8 (thy law is within my heart), Jeremiah 31:33 (I will put my law in
--                   their inward parts, and write it in their hearts)
--           Extras: none warranted   NT: none warranted (the frame is the Torah-from-within root)
--   v.24-27 the race, the prize, the incorruptible crown, the temperate athlete, the body kept under
--           Tanakh: none warranted (the athletic figure has no quoted Tanakh root)
--           Extras: Sirach (Ecclesiasticus) 18:30 (refrain thyself from your appetites)
--           NT: none warranted
--
-- THREADS (slug -> target libraries):
--   6800 1-corinthians-9-the-law-of-moses-and-the-unmuzzled-ox-deuteronomy-25       (Tanakh)
--   6803 1-corinthians-9-they-which-minister-of-the-temple-live-of-the-altar-numbers-18  (Tanakh + NT)
--   6806 1-corinthians-9-not-without-law-to-elohim-but-under-the-law-to-messiah-psalm-40 (Tanakh)
--   6809 1-corinthians-9-the-race-the-incorruptible-crown-and-the-temperate-athlete-sirach-18  (Extras)
-- =====================================================================

CREATE TEMP VIEW _s228_co09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-9-the-law-of-moses-and-the-unmuzzled-ox-deuteronomy-25
  ('canon', '1-corinthians', 9, 9, 'canon', 'deuteronomy', 25, 4, 'free', E'*Thou shalt not muzzle the ox when he treadeth out the corn.* (Deuteronomy 25:4). Paul grounds the apostle''s right to be supported by those he serves not in human reasoning but in the Torah itself: *Say I these things as a man? or saith not the law the same also? For it is written in the law of Moses, Thou shalt not muzzle the mouth of the ox that treadeth out the corn* (1 Corinthians 9:8-9). The mercy that lets the threshing ox eat of the grain it works is, Paul argues, *altogether for our sakes* — *that he that ploweth should plow in hope* (1 Corinthians 9:10). Far from setting the law aside, Paul reads it as living instruction for the assembly: the law of Moses is his authority and his proof.'),
  -- thread: 1-corinthians-9-they-which-minister-of-the-temple-live-of-the-altar-numbers-18
  ('canon', '1-corinthians', 9, 13, 'canon', 'numbers', 18, 8, 'free', E'*And Yahuah (LORD) spake unto Aaron, Behold, I also have given thee the charge of mine heave offerings of all the hallowed things of the children of Yashar''el (Israel); unto thee have I given them by reason of the anointing, and to thy sons, by an ordinance for ever.* (Numbers 18:8). Yahuah (LORD) gave the priests their living from the altar — the heave offerings, the most holy things, the tithe of Yashar''el (Israel) — *I am thy part and thine inheritance* (Numbers 18:20). On exactly this Torah pattern Paul reasons: *Do ye not know that they which minister about holy things live of the things of the temple? and they which wait at the altar are partakers with the altar?* (1 Corinthians 9:13). The Levitical portion is the model for the right he claims; the order of the temple stands as his proof.'),
  ('canon', '1-corinthians', 9, 13, 'canon', 'deuteronomy', 18, 1, 'free', E'*The priests the Levites, and all the tribe of Levi, shall have no part nor inheritance with Yashar''el (Israel): they shall eat the offerings of Yahuah (LORD) made by fire, and his inheritance.* (Deuteronomy 18:1). The tribe of Levi held no land; *they shall eat the offerings of Yahuah (LORD) made by fire,* and the priest''s due was the shoulder and the cheeks and the firstfruits of corn and wine and oil (Deuteronomy 18:3-4). This is the very thing Paul invokes — *they which wait at the altar are partakers with the altar* (1 Corinthians 9:13). The Torah''s provision for those who serve the sanctuary is the ground on which Paul stands; he honors the order even as he chooses to forgo the right.'),
  ('canon', '1-corinthians', 9, 14, 'canon', 'luke', 10, 7, 'free', E'*And in the same house remain, eating and drinking such things as they give: for the labourer is worthy of his hire. Go not from house to house.* (Luke 10:7). When Yahusha (Jesus) sent out the seventy he laid down the rule Paul now cites — *the labourer is worthy of his hire.* So Paul writes, *Even so hath Yahuah (Lord) ordained that they which preach the gospel should live of the gospel* (1 Corinthians 9:14). The Levitical portion of the temple and the word of the Lord to his sent ones are one continuous ordinance: the one who labors in holy things lives of holy things. Paul will not use the right, but the right is real and ordained.'),
  -- thread: 1-corinthians-9-not-without-law-to-elohim-but-under-the-law-to-messiah-psalm-40
  ('canon', '1-corinthians', 9, 21, 'canon', 'psalms', 40, 8, 'free', E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* (Psalm 40:8). When Paul says he became *to them that are without law, as without law,* he immediately guards the words: *being not without law to Elohim (God), but under the law to Messiah (Christ)* (1 Corinthians 9:21). This is no Torah-abandonment but the Servant''s own posture — *thy law is within my heart.* Paul is Torah-bound to the Messiah, not Torah-free; he accommodates himself to win the nations without law, yet he himself carries the law of Elohim (God) within, delighting to do his will. The law has not been set aside; it has been written where it belongs.'),
  ('canon', '1-corinthians', 9, 21, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The new covenant is not the abolishing of the law but its inscribing on the heart — *I will put my law in their inward parts.* This is what Paul means when he calls himself *not without law to Elohim (God), but under the law to Messiah (Christ)* (1 Corinthians 9:21): the Torah-bound man of the renewed covenant, the law no longer only on tablets but written within. His freedom toward men *that I might gain the more* (1 Corinthians 9:19) never makes him lawless toward Elohim (God); the law is in his inward parts.'),
  -- thread: 1-corinthians-9-the-race-the-incorruptible-crown-and-the-temperate-athlete-sirach-18
  ('canon', '1-corinthians', 9, 25, 'apocrypha', 'ecclesiasticus', 18, 30, 'extras', E'*Go not after your lusts, but refrain thyself from your appetites.* (Sirach 18:30). The Hebrew library''s call to master the appetites stands behind Paul''s figure of the disciplined runner: *every man that striveth for the mastery is temperate in all things* (1 Corinthians 9:25), *But I keep under my body, and bring it into subjection* (1 Corinthians 9:27). As the athlete refrains for a corruptible crown, the servant of the gospel refrains for an incorruptible one — *refrain thyself from your appetites* is the wisdom Paul lives, lest *when I have preached to others, I myself should be a castaway* (1 Corinthians 9:27).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-9-the-law-of-moses-and-the-unmuzzled-ox-deuteronomy-25',
       E'Saith not the law the same also? The unmuzzled ox (Deuteronomy 25)',
       E'Defending the apostle''s right to be supported, Paul does not appeal to human custom but to the Torah: *Say I these things as a man? or saith not the law the same also? For it is written in the law of Moses, Thou shalt not muzzle the mouth of the ox that treadeth out the corn* (1 Corinthians 9:8-9). The command is Moses'' own: *Thou shalt not muzzle the ox when he treadeth out the corn* (Deuteronomy 25:4) — the working beast must be free to eat of the grain it threshes. Paul presses the mercy of the law toward its deeper intent: *Doth Elohim (God) take care for oxen? Or saith he it altogether for our sakes? For our sakes, no doubt, this is written: that he that ploweth should plow in hope; and that he that thresheth in hope should be partaker of his hope* (1 Corinthians 9:9-10). The law of Moses is not a dead letter Paul reasons around; it is living instruction, his authority and his proof, written *for our sakes* — so that the one who labors in the gospel may, like the threshing ox, partake of the harvest he serves.',
       sv.verse_id, ev.verse_id, 'free', 6800
  FROM _s228_co09_lookup sv, _s228_co09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-9-they-which-minister-of-the-temple-live-of-the-altar-numbers-18',
       E'They which minister of the temple live of the temple (Numbers 18, Deuteronomy 18)',
       E'Paul''s second proof for gospel-support is the Levitical portion: *Do ye not know that they which minister about holy things live of the things of the temple? and they which wait at the altar are partakers with the altar?* (1 Corinthians 9:13). This is the Torah''s own provision. Yahuah (LORD) gave the priesthood its living from the altar: *Behold, I also have given thee the charge of mine heave offerings of all the hallowed things of the children of Yashar''el (Israel); unto thee have I given them by reason of the anointing... by an ordinance for ever* (Numbers 18:8), and the tithe of Yashar''el (Israel) to the Levites for their service, for *I am thy part and thine inheritance* (Numbers 18:20). So too in Moses'' last words: *The priests the Levites, and all the tribe of Levi, shall have no part nor inheritance with Yashar''el (Israel): they shall eat the offerings of Yahuah (LORD) made by fire, and his inheritance* (Deuteronomy 18:1), the priest''s due being the shoulder and the firstfruits of corn and wine and oil. And the same ordinance carries forward in the word of Yahusha (Jesus) to the seventy: *the labourer is worthy of his hire* (Luke 10:7) — on which Paul concludes, *Even so hath Yahuah (Lord) ordained that they which preach the gospel should live of the gospel* (1 Corinthians 9:14). Temple, altar, and gospel are one continuous order: the one who serves holy things lives of holy things. Paul will forgo the right *lest we should hinder the gospel of Messiah (Christ)* (1 Corinthians 9:12), but the right is real and Yahuah (Lord)-ordained.',
       sv.verse_id, ev.verse_id, 'free', 6803
  FROM _s228_co09_lookup sv, _s228_co09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=9 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-9-not-without-law-to-elohim-but-under-the-law-to-messiah-psalm-40',
       E'Not without law to Elohim, but under the law to Messiah (Psalm 40, Jeremiah 31)',
       E'Paul becomes all things to all men *that I might by all means save some* (1 Corinthians 9:22): *unto the Yahudim (Jews) I became as a Yahudi (Jew)... to them that are under the law, as under the law... To them that are without law, as without law* (1 Corinthians 9:20-21). But read the parenthesis he sets in the very middle of those words, for it governs the whole: *being not without law to Elohim (God), but under the law to Messiah (Christ)* (1 Corinthians 9:21). This is missionary accommodation, never Torah-abandonment. Paul does not discard the law to win the lawless; he bends his manner of life to reach them while remaining himself Torah-bound — *under the law to Messiah (Christ),* Torah-bound to the Messiah, never Torah-free. His posture is the Servant''s own: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8). And it is the shape of the renewed covenant, which abolishes nothing but writes the law where it could not be erased: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). To be *without law* toward the nations for the sake of the gospel is one thing; to be *without law to Elohim (God)* is what Paul explicitly denies. The man who *made myself servant unto all* (1 Corinthians 9:19) carries the law of Elohim (God) in his inward parts, under the law to the Messiah.',
       sv.verse_id, ev.verse_id, 'free', 6806
  FROM _s228_co09_lookup sv, _s228_co09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=9 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-9-the-race-the-incorruptible-crown-and-the-temperate-athlete-sirach-18',
       E'So run, that ye may obtain: the incorruptible crown and the temperate athlete (Sirach 18)',
       E'Paul closes the chapter with the figure of the games: *Know ye not that they which run in a race run all, but one receiveth the prize? So run, that ye may obtain. And every man that striveth for the mastery is temperate in all things. Now they do it to obtain a corruptible crown; but we an incorruptible* (1 Corinthians 9:24-25). The athlete''s self-mastery is the wisdom of the Hebrew library, which had long taught the servant of Elohim (God) to rule his desires: *Go not after your lusts, but refrain thyself from your appetites* (Sirach 18:30). Paul does the same, but for a crown that does not fade: *I therefore so run, not as uncertainly; so fight I, not as one that beateth the air: But I keep under my body, and bring it into subjection: lest that by any means, when I have preached to others, I myself should be a castaway* (1 Corinthians 9:26-27). The discipline that refrains from the appetites is no mere athletic conceit; it is the watchful temperance of the one who would finish the race and not be disqualified — the body kept under, the appetites refused, the incorruptible crown in view.',
       sv.verse_id, ev.verse_id, 'extras', 6809
  FROM _s228_co09_lookup sv, _s228_co09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=9 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-9-the-law-of-moses-and-the-unmuzzled-ox-deuteronomy-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 25:4 — *Thou shalt not muzzle the ox when he treadeth out the corn* the law of Moses Paul cites as his proof; *saith not the law the same also?* (1 Corinthians 9:8-9), written *for our sakes.*'
  FROM cross_reference_threads t, cross_references x, _s228_co09_lookup sv, _s228_co09_lookup tv
 WHERE t.slug='1-corinthians-9-the-law-of-moses-and-the-unmuzzled-ox-deuteronomy-25'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-9-they-which-minister-of-the-temple-live-of-the-altar-numbers-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 18:8 — *I also have given thee the charge of mine heave offerings of all the hallowed things... by an ordinance for ever* the priests'' living from the altar; *they which wait at the altar are partakers with the altar* (1 Corinthians 9:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co09_lookup sv, _s228_co09_lookup tv
 WHERE t.slug='1-corinthians-9-they-which-minister-of-the-temple-live-of-the-altar-numbers-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:1 — *The priests the Levites... shall eat the offerings of Yahuah (LORD) made by fire, and his inheritance* the Levitical portion; *they which minister about holy things live of the things of the temple* (1 Corinthians 9:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co09_lookup sv, _s228_co09_lookup tv
 WHERE t.slug='1-corinthians-9-they-which-minister-of-the-temple-live-of-the-altar-numbers-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 10:7 — *the labourer is worthy of his hire* the word of Yahusha (Jesus) to the seventy; *Yahuah (Lord) ordained that they which preach the gospel should live of the gospel* (1 Corinthians 9:14).'
  FROM cross_reference_threads t, cross_references x, _s228_co09_lookup sv, _s228_co09_lookup tv
 WHERE t.slug='1-corinthians-9-they-which-minister-of-the-temple-live-of-the-altar-numbers-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-9-not-without-law-to-elohim-but-under-the-law-to-messiah-psalm-40
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 40:8 — *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* the Servant''s Torah-from-within; Paul is *not without law to Elohim (God), but under the law to Messiah (Christ)* (1 Corinthians 9:21).'
  FROM cross_reference_threads t, cross_references x, _s228_co09_lookup sv, _s228_co09_lookup tv
 WHERE t.slug='1-corinthians-9-not-without-law-to-elohim-but-under-the-law-to-messiah-psalm-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the renewed covenant that abolishes nothing but internalizes the law; Paul Torah-bound, *under the law to Messiah (Christ)* (1 Corinthians 9:21).'
  FROM cross_reference_threads t, cross_references x, _s228_co09_lookup sv, _s228_co09_lookup tv
 WHERE t.slug='1-corinthians-9-not-without-law-to-elohim-but-under-the-law-to-messiah-psalm-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-9-the-race-the-incorruptible-crown-and-the-temperate-athlete-sirach-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 18:30 — *Go not after your lusts, but refrain thyself from your appetites* the library''s self-mastery; *every man that striveth for the mastery is temperate in all things... I keep under my body* (1 Corinthians 9:25,27).'
  FROM cross_reference_threads t, cross_references x, _s228_co09_lookup sv, _s228_co09_lookup tv
 WHERE t.slug='1-corinthians-9-the-race-the-incorruptible-crown-and-the-temperate-athlete-sirach-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
