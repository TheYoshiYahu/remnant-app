-- ----- fragment: minion_exodus_31.sql (Exodus 31) -----
-- Chapter: Exodus 31 — Bezalel filled with the Spirit; the Sabbath the everlasting sign; the two tables given
-- Tag: ex31   Session prefix: s305   Sort band: 29750 (+3/thread)
-- Temp view: _s305_ex31_lookup
--
-- Exodus 31 coverage:
--   v.1-11  (Bezalel & Aholiab filled with the Ruach for the dwelling)
--           NT:     1 Cor 3:10,16 (wise masterbuilder / ye are the temple), Eph 2:21-22 (built for habitation thru Spirit)
--           Extras: none warranted (Jubilees reserves its weight for the Sabbath block; no clean builder witness)
--           Tanakh: 1 Kings 7:14 (Hiram filled with wisdom for the temple), Exod 28:3 (wise-hearted filled with the spirit of wisdom)
--           -> thread exodus-31-the-spirit-of-elohim-fills-the-builder-of-the-dwelling (free)
--   v.12-17 (the Sabbath: a SIGN, holy, a perpetual covenant, creation-rooted, for ever)
--           NT:     Heb 4:9 (there remaineth a sabbath-rest), Mark 2:27-28 (made for man / Son of Adam Lord of it), Matt 5:17-18 (not destroy but fulfil)  -> separate forward thread
--           Extras: Jubilees 2:1 (Sabbath a sign for all His works), Jubilees 2:19 (a people separated who keep the Sabbath, My people)  -> in the sign thread
--           Tanakh: Gen 2:3, Exod 20:8-11, Ezek 20:12, Ezek 20:20, Isa 56:2, Isa 56:6, Isa 58:13, Isa 66:23  -> in the sign thread
--           -> thread exodus-31-the-sabbath-the-everlasting-sign-between-me-and-yashar-el (extras; Jubilees members)
--           -> thread exodus-31-there-remaineth-a-sabbath-rest-and-its-lord (free; NT forward weave)
--   v.18    (two tables of testimony written with the finger of Elohim)
--           NT:     Luke 11:20 (the finger of Elohim), 2 Cor 3:3 (written with the Spirit, in fleshy tables of the heart)
--           Extras: none warranted (clean witness not found in parse)
--           Tanakh: Exod 32:16 (the writing of Elohim graven), Exod 8:19 (the finger of Elohim), Jer 31:33 (law in inward parts), Ezek 36:26-27 (new heart, my spirit within)
--           -> thread exodus-31-written-with-the-finger-of-elohim-from-stone-to-heart (free)

CREATE TEMP VIEW _s305_ex31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================
-- cross_references
-- =====================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: Spirit fills the builder of the dwelling (Exod 31:1-11)
    ('canon','exodus',31,3,'canon','1-kings',7,14,'free',
      E'*He was a widow''s son of the tribe of Naphtali, and his father was a man of Tyre, a worker in brass: and he was filled with wisdom, and understanding, and cunning to work all works in brass* (1 Kings 7:14). The same divine filling that raised the wilderness tabernacle raises Solomon''s temple — when Yahuah (LORD) says *I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge, and in all manner of workmanship*, the gift of the Spirit is given for the building of the dwelling-place.'),
    ('canon','exodus',31,3,'canon','exodus',28,3,'free',
      E'*And thou shalt speak unto all that are wise hearted, whom I have filled with the spirit of wisdom, that they may make Aaron''s garments to consecrate him* (Exodus 28:3). The wise-hearted are *filled with the spirit of wisdom* for the holy garments just as Bezaleel is *filled... with the spirit of Elohim (God), in wisdom* for the whole sanctuary — one Ruach, given for the work of the holy place.'),
    ('canon','exodus',31,3,'canon','1-corinthians',3,10,'free',
      E'*According to the grace of Elohim (God) which is given unto me, as a wise masterbuilder, I have laid the foundation, and another buildeth thereon* (1 Corinthians 3:10). Bezaleel the first man *filled... with the spirit of Elohim (God), in wisdom* to build the dwelling is the pattern of the wise masterbuilder; the Spirit-given skill to raise the sanctuary carries forward.'),
    ('canon','exodus',31,3,'canon','1-corinthians',3,16,'free',
      E'*Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* (1 Corinthians 3:16). Bezaleel is *filled... with the spirit of Elohim (God)* to build the place where Yahuah (LORD) dwells — and the people themselves become that temple, the Spirit indwelling the dwelling He builds.'),
    ('canon','exodus',31,3,'canon','ephesians',2,22,'free',
      E'*In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). The Spirit who fills Bezaleel *in wisdom, and in understanding, and in knowledge, and in all manner of workmanship* to build the tabernacle is the same Spirit through whom the two-house people are built together into the habitation of Elohim (God).'),

  -- THREAD 2: The Sabbath the everlasting sign (Exod 31:12-17)
    ('canon','exodus',31,13,'canon','ezekiel',20,12,'free',
      E'*Moreover also I gave them my sabbaths, to be a sign between me and them, that they might know that I am Yahuah (LORD) that sanctify them* (Ezekiel 20:12). Ezekiel restates the keystone nearly verbatim: the Sabbath is the *sign between me and you... that ye may know that I am Yahuah (LORD) that doth sanctify you* (Exodus 31:13) — the standing mark of who sanctifies His people.'),
    ('canon','exodus',31,13,'canon','ezekiel',20,20,'free',
      E'*And hallow my sabbaths; and they shall be a sign between me and you, that ye may know that I am Yahuah Elohaychem (the LORD your God)* (Ezekiel 20:20). The Sabbath remains the covenant *sign between me and you* generations after Sinai — never abolished, the abiding token of the covenant Yahuah (LORD) commands in *Verily my sabbaths ye shall keep.*'),
    ('canon','exodus',31,14,'canon','isaiah',56,2,'free',
      E'*Blessed is the man that doeth this, and the son of Adam that layeth hold on it; that keepeth the sabbath from polluting it, and keepeth his hand from doing any evil* (Isaiah 56:2). The Sabbath that is *holy unto you* in Exodus 31:14 is the blessing the prophet holds out — the one who keeps it *from polluting it* is the man who is blessed.'),
    ('canon','exodus',31,16,'canon','isaiah',56,6,'free',
      E'*Also the sons of the stranger, that join themselves to Yahuah (LORD)... every one that keepeth the sabbath from polluting it, and taketh hold of my covenant* (Isaiah 56:6). The *perpetual covenant* of Exodus 31:16 is held by the gathered, even the stranger who joins himself to Yahuah (LORD) and keeps the Sabbath — the regathering of the scattered into the one Sabbath-keeping people.'),
    ('canon','exodus',31,16,'canon','isaiah',58,13,'free',
      E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13). The Sabbath kept *throughout their generations, for a perpetual covenant* (Exodus 31:16) is to be called *a delight* — not a burden laid down but the holy day honoured, with promise to follow.'),
    ('canon','exodus',31,17,'canon','genesis',2,3,'free',
      E'*And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3). Exodus 31:17 roots the sign in creation itself — *for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed* — the Sabbath is older than Sinai, woven into the fabric of the made world.'),
    ('canon','exodus',31,17,'canon','exodus',20,11,'free',
      E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The fourth word and the everlasting sign give the same creation-ground: Exodus 31:17 echoes the Ten Words — the Sabbath is the hallowed seventh day, *a sign between me and the children of Yashar''el (Israel) for ever.*'),
    ('canon','exodus',31,16,'canon','isaiah',66,23,'free',
      E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The *sign... for ever* of Exodus 31:23 reaches into the new heavens and new earth: the Sabbath is not retired but kept by all flesh in the world to come.'),
    ('canon','exodus',31,16,'jubilees','jubilees',2,1,'extras',
      E'*Write the complete history of the creation, how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1). The restored witness frames the Sabbath exactly as Exodus 31 does — *a sign... hallowed for all ages*, the same *perpetual covenant.*'),
    ('canon','exodus',31,13,'jubilees','jubilees',2,19,'extras',
      E'*Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people... and they will be My people and I shall be their Elohim (God)* (Jubilees 2:19). The Sabbath is the sign *that ye may know that I am Yahuah (LORD) that doth sanctify you* (Exodus 31:13) — the mark of the separated, sanctified people, never abolished, the token of who His people are.'),

  -- THREAD 3: There remaineth a sabbath-rest, and its Lord (Exod 31:13-17, forward weave)
    ('canon','exodus',31,15,'canon','hebrews',4,9,'free',
      E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The *sabbath of rest, holy to Yahuah (LORD)* of Exodus 31:15 is not cancelled but carried forward — a sabbath-keeping *remaineth* for the people of Elohim (God), the rest entered by faith without abolishing the day.'),
    ('canon','exodus',31,15,'canon','mark',2,27,'free',
      E'*And he said unto them, The sabbath was made for man, and not man for the sabbath: Therefore the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:27-28). The Messiah does not abolish the Sabbath of Exodus 31:15 — He declares Himself its Lord, the Formed Son owning the day He gave at Sinai, restoring its gift to man.'),
    ('canon','exodus',31,16,'canon','matthew',5,17,'free',
      E'*Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* (Matthew 5:17). The Sabbath kept *for a perpetual covenant* (Exodus 31:16) stands under the Messiah''s own word — *Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law* (Matthew 5:18); the everlasting sign is fulfilled, not voided.'),

  -- THREAD 4: Written with the finger of Elohim, from stone to heart (Exod 31:18)
    ('canon','exodus',31,18,'canon','exodus',32,16,'free',
      E'*And the tables were the work of Elohim (God), and the writing was the writing of Elohim (God), graven upon the tables* (Exodus 32:16). The *two tables of testimony, tables of stone, written with the finger of Elohim (God)* (Exodus 31:18) are the very Torah carved by His hand — the testimony Moses bore down the mountain.'),
    ('canon','exodus',31,18,'canon','exodus',8,19,'free',
      E'*Then the magicians said unto Pharaoh, This is the finger of Elohim (God): and Pharaoh''s heart was hardened* (Exodus 8:19). The same *finger of Elohim (God)* that struck Egypt with a sign now writes the covenant on stone — the power that judged the oppressor is the power that engraves the Torah for His people.'),
    ('canon','exodus',31,18,'canon','luke',11,20,'free',
      E'*But if I with the finger of Elohim (God) cast out devils, no doubt the kingdom of Elohim (God) is come upon you* (Luke 11:20). The *finger of Elohim (God)* that wrote the two tables (Exodus 31:18) is the same divine power at work in the Messiah — the One who gave the Torah is the One who casts out the enemy.'),
    ('canon','exodus',31,18,'canon','2-corinthians',3,3,'free',
      E'*Forasmuch as ye are manifestly declared to be the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). The Torah *written with the finger of Elohim (God)* on *tables of stone* (Exodus 31:18) is the same Torah now written by the Spirit on the heart — the law moving from stone to flesh, not a different law.'),
    ('canon','exodus',31,18,'canon','jeremiah',31,33,'free',
      E'*I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The covenant *written with the finger of Elohim (God)* on stone (Exodus 31:18) becomes the new-covenant law written within — the same Torah, now in the inward parts.'),
    ('canon','exodus',31,18,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Torah graven *with the finger of Elohim (God)* on stone (Exodus 31:18) is the very Torah the Spirit writes on the heart of flesh — *A new heart also will I give you* (Ezekiel 36:26) — that His people may keep His statutes.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- threads
-- =====================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-31-the-spirit-of-elohim-fills-the-builder-of-the-dwelling',
       E'The Spirit of Elohim fills the builder of the dwelling',
       E'The first man Scripture names as filled with the Ruach is named for the work of the sanctuary. *See, I have called by name Bezaleel the son of Uri... And I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge, and in all manner of workmanship* (Exodus 31:2-3). The Spirit is given to build the dwelling-place of Yahuah (LORD).\n\nThe pattern runs through the canon. The wise-hearted are *filled with the spirit of wisdom, that they may make Aaron''s garments to consecrate him* (Exodus 28:3). When Solomon raises the temple, Hiram comes *filled with wisdom, and understanding, and cunning to work all works in brass* (1 Kings 7:14) — the same divine gifting for the same holy work.\n\nThe weave reaches forward to the living temple. *According to the grace of Elohim (God) which is given unto me, as a wise masterbuilder, I have laid the foundation* (1 Corinthians 3:10) — and the people themselves are the house: *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* (1 Corinthians 3:16). The two-house people are *builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). The Spirit who filled Bezaleel to raise the tabernacle is the Spirit who builds the dwelling still.',
       sv.verse_id, ev.verse_id, 'free', 29750
  FROM _s305_ex31_lookup sv, _s305_ex31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=31 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=31 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-31-the-sabbath-the-everlasting-sign-between-me-and-yashar-el',
       E'The Sabbath — the everlasting sign between me and Yashar''el',
       E'Here is the anti-antinomian keystone. *Verily my sabbaths ye shall keep: for it is a sign between me and you throughout your generations; that ye may know that I am Yahuah (LORD) that doth sanctify you* (Exodus 31:13). It is *a perpetual covenant* (31:16), *a sign between me and the children of Yashar''el (Israel) for ever* (31:17) — and the ground is creation itself: *for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed.* The Sabbath is older than Sinai: *And Elohim (God) blessed the seventh day, and sanctified it* (Genesis 2:3); the fourth word repeats the creation-ground word for word (Exodus 20:11).\n\nEzekiel restates the keystone nearly verbatim, twice: *I gave them my sabbaths, to be a sign between me and them, that they might know that I am Yahuah (LORD) that sanctify them* (Ezekiel 20:12); *they shall be a sign between me and you, that ye may know that I am Yahuah Elohaychem (the LORD your God)* (Ezekiel 20:20). It is the standing mark of who sanctifies His people — never abolished.\n\nIsaiah holds it out as blessing and gathering: *Blessed is the man... that keepeth the sabbath from polluting it* (Isaiah 56:2); even *the sons of the stranger* who join themselves to Yahuah (LORD) and keep the Sabbath are gathered in (56:6); *call the sabbath a delight, the holy of Yahuah (LORD), honourable* (58:13). And it reaches the world to come: *from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23).\n\nThe restored witness frames it identically. Yahuah *kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1); *I will separate to Myself a people... and these will keep the Sabbath day, and I will sanctify them to Myself as My people... and they will be My people and I shall be their Elohim (God)* (Jubilees 2:19). The seventh-day Sabbath is the everlasting sign of the covenant people — the token of who sanctifies them, standing for ever.',
       sv.verse_id, ev.verse_id, 'extras', 29753
  FROM _s305_ex31_lookup sv, _s305_ex31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=31 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=31 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-31-there-remaineth-a-sabbath-rest-and-its-lord',
       E'There remaineth a sabbath-rest, and its Lord',
       E'The seventh day is *the sabbath of rest, holy to Yahuah (LORD)* (Exodus 31:15), kept *for a perpetual covenant* (31:16). The New Testament does not retire it — it confirms it.\n\n*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9): a sabbath-keeping still remains. The Messiah Himself owns the day: *The sabbath was made for man, and not man for the sabbath: Therefore the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:27-28) — the Formed Son who gave the Sabbath at Sinai declares Himself its Lord, restoring its gift, not abolishing it.\n\nAnd His own word seals the everlasting sign: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil... Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law* (Matthew 5:17-18). The perpetual covenant of Exodus 31 stands — fulfilled in its Lord, never voided.',
       sv.verse_id, ev.verse_id, 'free', 29756
  FROM _s305_ex31_lookup sv, _s305_ex31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=31 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=31 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-31-written-with-the-finger-of-elohim-from-stone-to-heart',
       E'Written with the finger of Elohim — from stone to heart',
       E'*And he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God)* (Exodus 31:18). The Torah is carved by His own hand: *the writing was the writing of Elohim (God), graven upon the tables* (Exodus 32:16).\n\nThat *finger of Elohim (God)* is a thread of divine power. It struck Egypt — *This is the finger of Elohim (God)* (Exodus 8:19) — and it works in the Messiah: *if I with the finger of Elohim (God) cast out devils, no doubt the kingdom of Elohim (God) is come upon you* (Luke 11:20). The One who gave the Torah is the One who casts out the enemy.\n\nThe same Torah moves from stone to heart — never a different law. *Ye are... the epistle of Messiah (Christ)... written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). This is the promised new covenant: *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33); *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27). The finger that graved the stone is the Spirit that writes the heart.',
       sv.verse_id, ev.verse_id, 'free', 29759
  FROM _s305_ex31_lookup sv, _s305_ex31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=31 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=31 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- thread_members
-- =====================================================================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',31,3,'canon','1-kings',7,14,1,E'*He... was filled with wisdom, and understanding, and cunning to work all works in brass* (1 Kings 7:14) — the same Spirit-gifting raises Solomon''s temple.'),
    ('exodus',31,3,'canon','exodus',28,3,2,E'*Whom I have filled with the spirit of wisdom, that they may make Aaron''s garments* (Exodus 28:3) — one Ruach for the holy garments and the whole sanctuary.'),
    ('exodus',31,3,'canon','1-corinthians',3,10,3,E'*As a wise masterbuilder, I have laid the foundation* (1 Corinthians 3:10) — Bezaleel the pattern of the Spirit-filled builder.'),
    ('exodus',31,3,'canon','1-corinthians',3,16,4,E'*Ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16) — the dwelling becomes the people.'),
    ('exodus',31,3,'canon','ephesians',2,22,5,E'*Builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22) — the same Spirit builds the two-house habitation.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-31-the-spirit-of-elohim-fills-the-builder-of-the-dwelling'
  JOIN _s305_ex31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=31 AND sv.verse_number=m.src_v
  JOIN _s305_ex31_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',31,17,'canon','genesis',2,3,1,E'*Elohim (God) blessed the seventh day, and sanctified it* (Genesis 2:3) — the Sabbath rooted in creation, older than Sinai.'),
    ('exodus',31,17,'canon','exodus',20,11,2,E'*Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11) — the fourth word gives the same creation-ground.'),
    ('exodus',31,13,'canon','ezekiel',20,12,3,E'*My sabbaths, to be a sign between me and them, that they might know that I am Yahuah (LORD) that sanctify them* (Ezekiel 20:12) — the keystone restated nearly verbatim.'),
    ('exodus',31,13,'canon','ezekiel',20,20,4,E'*They shall be a sign between me and you, that ye may know that I am Yahuah Elohaychem* (Ezekiel 20:20) — the abiding covenant mark, generations on.'),
    ('exodus',31,14,'canon','isaiah',56,2,5,E'*Blessed is the man... that keepeth the sabbath from polluting it* (Isaiah 56:2) — the holy day is the blessing.'),
    ('exodus',31,16,'canon','isaiah',56,6,6,E'*The sons of the stranger... every one that keepeth the sabbath* (Isaiah 56:6) — the gathered, even the joined-in stranger, keep the perpetual covenant.'),
    ('exodus',31,16,'canon','isaiah',58,13,7,E'*Call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13) — the everlasting sign kept as joy, not burden.'),
    ('exodus',31,16,'canon','isaiah',66,23,8,E'*From one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23) — the sign reaches the new heavens and new earth.'),
    ('exodus',31,16,'jubilees','jubilees',2,1,9,E'*Kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1) — the restored witness frames the perpetual covenant.'),
    ('exodus',31,13,'jubilees','jubilees',2,19,10,E'*These will keep the Sabbath day, and I will sanctify them to Myself as My people* (Jubilees 2:19) — the Sabbath the mark of the separated, sanctified people.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-31-the-sabbath-the-everlasting-sign-between-me-and-yashar-el'
  JOIN _s305_ex31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=31 AND sv.verse_number=m.src_v
  JOIN _s305_ex31_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',31,15,'canon','hebrews',4,9,1,E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — a sabbath-keeping remains, not cancelled.'),
    ('exodus',31,15,'canon','mark',2,27,2,E'*The sabbath was made for man... the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:27-28) — the Messiah owns the day, restores its gift.'),
    ('exodus',31,16,'canon','matthew',5,17,3,E'*I am not come to destroy, but to fulfil* (Matthew 5:17) — the perpetual covenant fulfilled, not voided.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-31-there-remaineth-a-sabbath-rest-and-its-lord'
  JOIN _s305_ex31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=31 AND sv.verse_number=m.src_v
  JOIN _s305_ex31_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',31,18,'canon','exodus',32,16,1,E'*The writing was the writing of Elohim (God), graven upon the tables* (Exodus 32:16) — the Torah carved by His own hand.'),
    ('exodus',31,18,'canon','exodus',8,19,2,E'*This is the finger of Elohim (God)* (Exodus 8:19) — the power that judged Egypt now writes the covenant.'),
    ('exodus',31,18,'canon','luke',11,20,3,E'*If I with the finger of Elohim (God) cast out devils* (Luke 11:20) — the same divine finger at work in the Messiah.'),
    ('exodus',31,18,'canon','2-corinthians',3,3,4,E'*Not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3) — the same Torah, from stone to heart.'),
    ('exodus',31,18,'canon','jeremiah',31,33,5,E'*I will... write it in their hearts* (Jeremiah 31:33) — the new-covenant law written within.'),
    ('exodus',31,18,'canon','ezekiel',36,27,6,E'*I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — the Spirit writes the very Torah graven on stone.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-31-written-with-the-finger-of-elohim-from-stone-to-heart'
  JOIN _s305_ex31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=31 AND sv.verse_number=m.src_v
  JOIN _s305_ex31_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
