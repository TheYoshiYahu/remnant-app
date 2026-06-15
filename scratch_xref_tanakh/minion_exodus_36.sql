-- ----- fragment: minion_exodus_36.sql (Exodus 36) -----
-- Exodus 36 — the wise-hearted build it / the people bring TOO MUCH / curtains & boards executed exactly as commanded
-- TAG: ex36   SESSION PREFIX: s305   SORT BAND: 29875 step +3   temp view: _s305_ex36_lookup
-- Canon book_slug: exodus  (Exodus 36 = 38 verses, all confirmed present)
--
-- Exodus 36 coverage:
--   v.1-2  THE WISE-HEARTED, IN WHOM YAHUAH PUT WISDOM
--          NT:     1 Cor 12:4-7 (gifts to profit withal) / Phil 2:13 (Elohim worketh in you to will and do)  [USED]
--          Extras: none warranted (Sirach 38:27-34 weighed — craftsman-praise, but bound better to nothing here; the Spirit-gift framing is NT)
--          Tanakh: Exod 31:3-6 / 35:30-35 (Bezaleel filled with the spirit of Elohim, wisdom put in the wise-hearted)  [USED]
--   v.3-7  THE PEOPLE BROUGHT MORE THAN ENOUGH — RESTRAINED FROM BRINGING
--          NT:     2 Cor 8:2-3 / 2 Cor 9:7-8 (cheerful giver, all grace abound) / Phil 4:18-19 (a sacrifice acceptable, my Elohim shall supply)  [USED]
--          Extras: Sirach (Ecclesiasticus) 35:8-10 (give cheerfully, give to the Most High as he hath enriched you)  [USED]
--          Tanakh: Exod 35:21,29 (whose heart stirred / willing offering) / 1 Chron 29:9,14 (offered willingly, of thine own have we given)  [USED]
--   v.8-38 THE BUILD EXECUTED EXACTLY AS COMMANDED — made AFTER THE PATTERN
--          NT:     Heb 8:5 (according to the pattern shewed to thee in the mount)  [USED]
--          Extras: Wisdom of Solomon 9:8 (a resemblance of the holy tabernacle prepared from the beginning)  [USED]
--          Tanakh: Exod 25:40 (make them after their pattern shewed in the mount)  [USED]
--   v.13,18 IT BECAME ONE TABERNACLE — the many curtains coupled into one
--          NT:     John 17:21-22 (that they all may be one, even as we are one)  [USED]
--          Extras: none warranted (two-house oneness is Ezek/John; no clean extras add)
--          Tanakh: Ezek 37:17 (the two sticks joined become one in thine hand)  [USED]
--   v.19-38 (covering/boards/bars/sockets/veil detail) — folded into the pattern thread (the whole build = obedience reproducing the blueprint); no separate add warranted
--
-- THREADS (4):
--   exodus-36-the-wise-hearted-in-whom-yahuah-put-wisdom        [canon Tanakh + NT]        free
--   exodus-36-the-people-brought-more-than-enough-restrained    [canon Tanakh + NT + extras Sirach]  extras
--   exodus-36-made-according-to-the-pattern-shewed-in-the-mount [canon Tanakh + NT + extras Wisdom]  extras
--   exodus-36-it-became-one-tabernacle                          [canon Tanakh + NT]        free

CREATE TEMP VIEW _s305_ex36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the wise-hearted in whom Yahuah put wisdom (36:1-2)
    ('canon','exodus',36,1,'canon','exodus',31,3,'free',
     E'*And I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge, and in all manner of workmanship* (Exodus 31:3). The skill that wrought the sanctuary in chapter 36 — *every wise hearted man, in whom Yahuah (LORD) put wisdom and understanding to know how to work all manner of work* — is not native talent but the Ruach poured out; the build begins where the Spirit fills.'),
    ('canon','exodus',36,2,'canon','exodus',31,6,'free',
     E'*And in the hearts of all that are wise hearted I have put wisdom, that they may make all that I have commanded thee* (Exodus 31:6). Exodus 36:2 cashes the command: *every wise hearted man, in whose heart Yahuah (LORD) had put wisdom, even every one whose heart stirred him up to come unto the work to do it.* The wisdom is given; the willing heart is the worker''s own — both meet at the work.'),
    ('canon','exodus',36,2,'canon','exodus',35,35,'free',
     E'*Them hath he filled with wisdom of heart, to work all manner of work* (Exodus 35:35). The same hands named in chapter 35 now lift the tools in 36:2 — *every wise hearted man... even every one whose heart stirred him up to come unto the work to do it* — the Spirit-filled craft moving from charge to execution.'),
    ('canon','exodus',36,1,'canon','1-corinthians',12,4,'free',
     E'*Now there are diversities of gifts, but the same Spirit* (1 Corinthians 12:4). The wise-hearted of 36:1, each *to know how to work all manner of work for the service of the sanctuary,* are the first picture of the one Spirit dealing many gifts for one house — the tabernacle built by varied hands is the body built by varied gifts.'),
    ('canon','exodus',36,1,'canon','1-corinthians',12,7,'free',
     E'*But the manifestation of the Spirit is given to every man to profit withal* (1 Corinthians 12:7). The Spirit that fills Bezaleel and *every wise hearted man* in 36:1 is given not for display but for the common work — every gift bends to the service of the sanctuary, the profit of the whole.'),
    ('canon','exodus',36,2,'canon','philippians',2,13,'free',
     E'*For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13). The two halves of 36:2 — Yahuah who *had put wisdom* and the heart that *stirred him up to come unto the work* — are the same twofold grace Paul names: the willing and the doing both wrought in the worker by Elohim.'),

    -- THREAD 2: the people brought more than enough — restrained from bringing (36:3-7)
    ('canon','exodus',36,3,'canon','exodus',35,29,'free',
     E'*The children of Yashar''el (Israel) brought a willing offering unto Yahuah (LORD), every man and woman, whose heart made them willing to bring* (Exodus 35:29). The free offerings of 36:3 — *they brought yet unto him free offerings every morning* — are that same willingness overflowing day by day, the covenant heart that cannot stop giving.'),
    ('canon','exodus',36,5,'canon','1-chronicles',29,9,'free',
     E'*Then the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9). When the people in 36:5 *bring much more than enough for the service of the work,* it is David''s temple-joy in advance — the perfect heart that pours out for the house of Yahuah, twice in the canon overflowing past need.'),
    ('canon','exodus',36,7,'canon','1-chronicles',29,14,'free',
     E'*But who am I, and what is my people, that we should be able to offer so willingly after this sort? for all things come of thee, and of thine own have we given thee* (1 Chronicles 29:14). The *sufficient... and too much* of 36:7 is answered by David''s confession: the abundance the people return was always Yahuah''s own — overflow is only His gift handed back.'),
    ('canon','exodus',36,6,'canon','2-corinthians',8,2,'extras',
     E'*How that in a great trial of affliction the abundance of their joy and their deep poverty abounded unto the riches of their liberality* (2 Corinthians 8:2). Israel restrained from bringing in 36:6 — *Let neither man nor woman make any more work for the offering* — and the Macedonians abounding *beyond their power* (8:3) are one heart: the willing offering that overflows measure, the restored covenant generosity.'),
    ('canon','exodus',36,5,'canon','2-corinthians',9,7,'extras',
     E'*Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). The people who *bring much more than enough* in 36:5 give from the heart, not constraint — the cheerful giver Yahuah loves, the offering that must be told to STOP.'),
    ('canon','exodus',36,7,'canon','2-corinthians',9,8,'extras',
     E'*And Elohim (God) is able to make all grace abound toward you; that ye, always having all sufficiency in all things, may abound to every good work* (2 Corinthians 9:8). The *sufficient for all the work... and too much* of 36:7 is the very word Paul reaches for — *all sufficiency* that overflows *to every good work*; the giving heart never runs the house short.'),
    ('canon','exodus',36,3,'canon','philippians',4,18,'extras',
     E'*I am full, having received... an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18). The *free offerings every morning* of 36:3 are the same sweet-savour gift — the people''s overflow rises to Yahuah as the Philippians'' gift rose, an acceptable sacrifice.'),
    ('canon','exodus',36,7,'canon','philippians',4,19,'extras',
     E'*But my Elohim (God) shall supply all your need according to his riches in glory by HaMashiach Yahusha (Christ Jesus)* (Philippians 4:19). The givers of 36:7 found *the stuff they had was sufficient for all the work... and too much* — the promise running both ways: those who pour out for the house never lack, Elohim supplies all their need.'),
    ('canon','exodus',36,5,'apocrypha','ecclesiasticus',35,9,'extras',
     E'*In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness. Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye* (Sirach 35:9-10). Israel''s gladness in 36:5, bringing *much more than enough,* is the wisdom of the fathers: give to the Most High out of His enriching, with a cheerful eye — the giving that overflows because the heart is glad.'),

    -- THREAD 3: made according to the pattern shewed in the mount (36:8-38)
    ('canon','exodus',36,8,'canon','exodus',25,40,'free',
     E'*And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). Every curtain, board, bar and veil wrought from 36:8 onward obeys this one charge — the wise-hearted reproduce on earth the heavenly blueprint Moses saw in the mount, the build is the command made visible.'),
    ('canon','exodus',36,35,'canon','hebrews',8,5,'extras',
     E'*Who serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The *vail of blue, and purple, and scarlet... with cherubims* of 36:35 is shadow of the heavenly — every detail executed exactly as shown is the earthly copy of a real and higher tabernacle.'),
    ('canon','exodus',36,8,'apocrypha','the-wisdom-of-solomon',9,8,'extras',
     E'*You have commanded me to build a temple upon your holy mount, and an altar in the city in which you dwellest, a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8). The tabernacle wrought *as Yahuah commanded* from 36:8 is *a resemblance of the holy tabernacle... prepared from the beginning* — the build is a copy of a pattern older than the mount.'),

    -- THREAD 4: it became one tabernacle (36:13,18)
    ('canon','exodus',36,13,'canon','ezekiel',37,17,'free',
     E'*And join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:17). The fifty taches of gold that *coupled the curtains one unto another: so it became one tabernacle* (36:13) foreshadow the two sticks of Yahudah and Yosef made one — the many pieces joined into a single dwelling for Yahuah, the two houses made one people.'),
    ('canon','exodus',36,18,'canon','john',17,21,'free',
     E'*That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me* (John 17:21). The taches of brass coupled the tent *that it might be one* (36:18) — the same oneness the Formed Son prays for, the gathered people coupled into one dwelling.'),
    ('canon','exodus',36,18,'canon','john',17,22,'free',
     E'*And the glory which thou gavest me I have given them; that they may be one, even as we are one* (John 17:22). The eleven goats''-hair curtains *coupled... that it might be one* in 36:18 are the figure fulfilled — the glory shared making the many one, as the curtains coupled become one tent.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-36-the-wise-hearted-in-whom-yahuah-put-wisdom',
       E'The Wise-Hearted, In Whom Yahuah Put Wisdom',
       E'The build of the tabernacle opens not with tools but with the Ruach. *Then wrought Bezaleel and Aholiab, and every wise hearted man, in whom Yahuah (LORD) put wisdom and understanding to know how to work all manner of work for the service of the sanctuary* (Exodus 36:1). The skill is given, not native — *I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge, and in all manner of workmanship* (Exodus 31:3); *in the hearts of all that are wise hearted I have put wisdom, that they may make all that I have commanded thee* (Exodus 31:6); *Them hath he filled with wisdom of heart, to work all manner of work* (Exodus 35:35). Yet the worker is no puppet: *every one whose heart stirred him up to come unto the work to do it* (Exodus 36:2). The Spirit fills; the willing heart steps forward — both meet at the work. Weave FORWARD: this is the first portrait of the one Spirit dealing many gifts for one house — *Now there are diversities of gifts, but the same Spirit* (1 Corinthians 12:4), each *manifestation of the Spirit... given to every man to profit withal* (1 Corinthians 12:7); and the two halves hold together in *it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13). The Spirit-filled craft that raised the sanctuary is the same Spirit building the body.',
       sv.verse_id, ev.verse_id, 'free', 29875
  FROM _s305_ex36_lookup sv, _s305_ex36_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=36 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=36 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-36-the-people-brought-more-than-enough-restrained',
       E'The People Brought More Than Enough — Restrained From Bringing',
       E'Here is the one place in all Scripture where Yahuah''s people must be told to STOP giving. *And they brought yet unto him free offerings every morning* (Exodus 36:3); *The people bring much more than enough for the service of the work, which Yahuah (LORD) commanded to make* (Exodus 36:5); *So the people were restrained from bringing. For the stuff they had was sufficient for all the work to make it, and too much* (Exodus 36:6-7). This is the willingness of chapter 35 overflowing — *The children of Yashar''el (Israel) brought a willing offering unto Yahuah (LORD), every man and woman, whose heart made them willing to bring* (Exodus 35:29) — the covenant heart that cannot be held back. It rises again at David''s temple: *the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9), confessing *of thine own have we given thee* (1 Chronicles 29:14) — overflow is only His gift handed back. Weave FORWARD: this is the Macedonian grace, *the abundance of their joy and their deep poverty abounded unto the riches of their liberality* (2 Corinthians 8:2), giving *beyond their power* (8:3); the cheerful giver Elohim loves (2 Corinthians 9:7); the *all sufficiency... abound to every good work* (2 Corinthians 9:8) — the giving heart never runs the house short. The free offerings rise as *an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18), and the promise runs back: *my Elohim (God) shall supply all your need* (Philippians 4:19). The fathers'' wisdom names it: *In all your gifts shew a cheerful countenance... Give to the Most High according as he has enriched you* (Sirach 35:9-10). The restored heart gives beyond measure, and is told to stop.',
       sv.verse_id, ev.verse_id, 'extras', 29878
  FROM _s305_ex36_lookup sv, _s305_ex36_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=36 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=36 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-36-made-according-to-the-pattern-shewed-in-the-mount',
       E'Made According To The Pattern Shewed In The Mount',
       E'From verse 8 to the end, the chapter is the command of chapter 26 executed word for word — the curtains, the loops and taches, the boards and bars and sockets, *a vail of blue, and purple, and scarlet, and fine twined linen: with cherubims made he it of cunning work* (Exodus 36:35). Nothing is invented; everything obeys the one charge given on the mount: *And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). The build is the heavenly blueprint reproduced on earth by Spirit-filled hands. Weave FORWARD: the earthly tabernacle is shadow of a real and higher one — the priests *serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God)... See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). And the pattern is older than the mount itself: *a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8). Obedience here is not mere compliance — it is the heavenly made visible, the divine pattern carried down and built exactly as shown.',
       sv.verse_id, ev.verse_id, 'extras', 29881
  FROM _s305_ex36_lookup sv, _s305_ex36_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=36 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=36 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-36-it-became-one-tabernacle',
       E'It Became One Tabernacle',
       E'The many separate pieces are coupled into a single dwelling. *And he made fifty taches of gold, and coupled the curtains one unto another with the taches: so it became one tabernacle* (Exodus 36:13); and the goats''-hair tent likewise, *he made fifty taches of brass to couple the tent together, that it might be one* (Exodus 36:18). The ten curtains, the eleven curtains — many, yet joined into one house for Yahuah. This oneness is the prophetic figure of the two houses regathered: *And join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:17) — the stick of Yahudah and the stick of Yosef made one, the divided people coupled into a single dwelling. Weave FORWARD to the Formed Son''s prayer: *That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us* (John 17:21); *And the glory which thou gavest me I have given them; that they may be one, even as we are one* (John 17:22). The curtains coupled into one tabernacle, the two sticks made one stick, the gathered people made one in the Father and the Son — one dwelling, one people, one glory.',
       sv.verse_id, ev.verse_id, 'free', 29884
  FROM _s305_ex36_lookup sv, _s305_ex36_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=36 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=36 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',36,1,'canon','exodus',31,3, 1, E'*I have filled him with the spirit of Elohim (God), in wisdom* (Exodus 31:3) — the sanctuary-skill of 36:1 is the Ruach poured out, not native talent.'),
    ('exodus',36,2,'canon','exodus',31,6, 2, E'*In the hearts of all that are wise hearted I have put wisdom* (Exodus 31:6) — the wisdom given meets the heart that *stirred him up to come unto the work* (36:2).'),
    ('exodus',36,2,'canon','exodus',35,35, 3, E'*Them hath he filled with wisdom of heart, to work all manner of work* (Exodus 35:35) — the same Spirit-filled hands of ch.35 lift the tools in 36:2.'),
    ('exodus',36,1,'canon','1-corinthians',12,4, 4, E'*Diversities of gifts, but the same Spirit* (1 Corinthians 12:4) — varied wise-hearted hands building one house = one Spirit, many gifts.'),
    ('exodus',36,1,'canon','1-corinthians',12,7, 5, E'*The manifestation of the Spirit is given to every man to profit withal* (1 Corinthians 12:7) — every gift bends to the service of the sanctuary.'),
    ('exodus',36,2,'canon','philippians',2,13, 6, E'*It is Elohim (God) which worketh in you both to will and to do* (Philippians 2:13) — the willing and the doing of 36:2 both wrought by Elohim.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-36-the-wise-hearted-in-whom-yahuah-put-wisdom'
  JOIN _s305_ex36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=36 AND sv.verse_number=m.src_v
  JOIN _s305_ex36_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',36,3,'canon','exodus',35,29, 1, E'*Brought a willing offering... whose heart made them willing to bring* (Exodus 35:29) — the willingness of ch.35 overflowing into the *free offerings every morning* of 36:3.'),
    ('exodus',36,5,'canon','1-chronicles',29,9, 2, E'*With perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9) — the temple-joy that 36:5''s *much more than enough* foreshadows.'),
    ('exodus',36,7,'canon','1-chronicles',29,14, 3, E'*Of thine own have we given thee* (1 Chronicles 29:14) — the *too much* of 36:7 is Yahuah''s own gift handed back.'),
    ('exodus',36,6,'canon','2-corinthians',8,2, 4, E'*The abundance of their joy... abounded unto the riches of their liberality* (2 Corinthians 8:2) — Israel restrained from bringing = the Macedonians abounding beyond their power.'),
    ('exodus',36,5,'canon','2-corinthians',9,7, 5, E'*Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7) — those who *bring much more than enough* (36:5) give from the heart, not constraint.'),
    ('exodus',36,7,'canon','2-corinthians',9,8, 6, E'*All sufficiency in all things, may abound to every good work* (2 Corinthians 9:8) — the very word for 36:7''s *sufficient... and too much*.'),
    ('exodus',36,3,'canon','philippians',4,18, 7, E'*An odour of a sweet smell, a sacrifice acceptable* (Philippians 4:18) — the *free offerings every morning* (36:3) rise as sweet-savour gift.'),
    ('exodus',36,7,'canon','philippians',4,19, 8, E'*My Elohim (God) shall supply all your need* (Philippians 4:19) — the givers of 36:7 never lacked; Elohim supplies the pouring-out heart.'),
    ('exodus',36,5,'apocrypha','ecclesiasticus',35,9, 9, E'*Give to the Most High according as he has enriched you... with a cheerful eye* (Sirach 35:9-10) — the fathers'' wisdom names the glad overflow of 36:5.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-36-the-people-brought-more-than-enough-restrained'
  JOIN _s305_ex36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=36 AND sv.verse_number=m.src_v
  JOIN _s305_ex36_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',36,8,'canon','exodus',25,40, 1, E'*Make them after their pattern, which was shewed thee in the mount* (Exodus 25:40) — the build from 36:8 obeys the one charge: reproduce the heavenly blueprint.'),
    ('exodus',36,35,'canon','hebrews',8,5, 2, E'*The example and shadow of heavenly things... according to the pattern shewed to thee in the mount* (Hebrews 8:5) — the cherubim-veil of 36:35 is shadow of the heavenly.'),
    ('exodus',36,8,'apocrypha','the-wisdom-of-solomon',9,8, 3, E'*A resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8) — the pattern is older than the mount.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-36-made-according-to-the-pattern-shewed-in-the-mount'
  JOIN _s305_ex36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=36 AND sv.verse_number=m.src_v
  JOIN _s305_ex36_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',36,13,'canon','ezekiel',37,17, 1, E'*They shall become one in thine hand* (Ezekiel 37:17) — the curtains coupled *so it became one tabernacle* (36:13) = the two sticks of Yahudah and Yosef made one.'),
    ('exodus',36,18,'canon','john',17,21, 2, E'*That they all may be one; as thou, Father, art in me* (John 17:21) — the tent coupled *that it might be one* (36:18) = the Formed Son''s prayer for the gathered people.'),
    ('exodus',36,18,'canon','john',17,22, 3, E'*That they may be one, even as we are one* (John 17:22) — the curtains coupled into one tent = the glory shared making the many one.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-36-it-became-one-tabernacle'
  JOIN _s305_ex36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=36 AND sv.verse_number=m.src_v
  JOIN _s305_ex36_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
