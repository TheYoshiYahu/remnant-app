-- ----- fragment: minion_exodus_29.sql (Exodus 29) -----
-- Chapter: Exodus 29 — the CONSECRATION of the priests + the continual daily offering
-- Tag: ex29   Session prefix: s305   Temp view: _s305_ex29_lookup
-- Sort band: 29700 (+3 per thread)
-- Source book_slug: exodus  (edition 'canon')
--
-- Exodus 29 coverage:
--   v.1-9  THE CONSECRATION RITE (washed, clothed, anointed, "fill the hand")
--          NT:     Hebrews 7:23-28 / 9:11-14 / 10:1,14 (the better, once-for-all priesthood) — USED (thread 4)
--          Extras: Ecclesiasticus 45:7 (everlasting covenant of the priesthood of Aaron) — USED (thread 4)
--          Tanakh: Leviticus 8 (the rite carried out) — woven in summary
--   v.7    THE ANOINTING (pour the oil on his head, anoint him → the Anointed)
--          NT:     none direct (Isa 61:1 carries the messianic anointing forward) — see thread 1
--          Extras: Ecclesiasticus 45:15 (Moses anointed him with holy oil, everlasting covenant) — USED (thread 1)
--          Tanakh: Psalm 133:2 (precious oil on Aaron's head) + Isaiah 61:1 (the Spirit upon the Anointed) — USED (thread 1)
--   v.10-14 THE SIN OFFERING / body burnt WITHOUT THE CAMP
--          NT:     Hebrews 13:11-13 (bodies burned without the camp; Yahusha suffered without the gate) — USED (thread 3)
--          Extras: none warranted
--          Tanakh: Leviticus 8:17 (the bullock burnt without the camp) — USED (thread 3)
--   v.20   THE BLOOD ON EAR, THUMB, TOE (the whole man set apart by blood)
--          NT:     none warranted direct
--          Extras: none warranted
--          Tanakh: Leviticus 8:23-24 (the rite performed on Aaron and his sons) — USED (thread 2)
--   v.22-28 THE RAM OF CONSECRATION + the WAVE OFFERING — folded into the shadow/priesthood thread (4)
--   v.37   "whatsoever toucheth the altar shall be holy" — none warranted (Matt 23:19 holds, not strong enough to thread)
--   v.38-42 THE CONTINUAL DAILY LAMB (the tamid, morning and evening)
--          NT:     John 1:29 (Behold the Lamb of Elohim) — USED (thread 5)
--          Extras: Ecclesiasticus 45:14 (their sacrifices wholly consumed every day twice continually) — USED (thread 5)
--          Tanakh: Numbers 28:3-4 (the tamid restated) — USED (thread 5)
--   v.43-46 THE INDWELLING PROMISE ("I will dwell among the children of Yashar'el")
--          NT:     John 1:14 (the Word made flesh, dwelt among us) / Revelation 21:3 (the tabernacle with men) / 2 Corinthians 6:16 — USED (thread 6)
--          Extras: none warranted
--          Tanakh: Leviticus 26:11-12 / Ezekiel 37:27 (the covenant-dwelling formula) — USED (thread 6)
--
-- THREADS (slug — target libraries):
--   1 exodus-29-the-anointing-oil-poured-on-the-head-the-anointed   [Tanakh canon + Apocrypha/Ecclesiasticus]  tier extras
--   2 exodus-29-the-blood-on-ear-thumb-and-toe-the-whole-man-set-apart  [Tanakh canon]  tier free
--   3 exodus-29-the-sin-offering-burnt-without-the-camp   [Tanakh canon + NT/Hebrews]  tier free
--   4 exodus-29-the-shadow-whose-body-is-the-messiah-the-better-priesthood  [NT/Hebrews + Apocrypha/Ecclesiasticus]  tier extras
--   5 exodus-29-the-continual-daily-lamb-morning-and-evening   [Tanakh canon + NT/John + Apocrypha/Ecclesiasticus]  tier extras
--   6 exodus-29-i-will-dwell-among-the-children-of-israel   [Tanakh canon + NT/John,Revelation,2-Corinthians]  tier free
--
-- Contested framing notes:
--   * Hebrews "change of the law" / "disannulling" (7:12,18) framed as the PRIESTHOOD changing
--     (Levi→Melek Tsadiq) and the shadow finding its body — fulfilled-not-abolished — NOT the Torah
--     repealed. The tamid, the feasts, clean/unclean STAND; the once-for-all offering is what they
--     pointed to (Heb 10:1 "a shadow of good things to come... the very image" is the Messiah).
--   * The priesthood "for a perpetual statute" (29:9) is honoured: Ecclesiasticus 45:7,15 keeps the
--     everlasting covenant of Aaron intact; the better priesthood is after the order of Melek Tsadiq,
--     it does not erase Aaron's, it fulfils the pattern Aaron's served.

CREATE TEMP VIEW _s305_ex29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the anointing oil poured on the head — the Anointed (29:7)
    ('canon','exodus',29,7,'canon','psalms',133,2,'free',
      E'*It is like the precious ointment upon the head, that ran down upon the beard, even Aaron''s beard: that went down to the skirts of his garments* (Psalm 133:2). Exodus 29:7 commands *take the anointing oil, and pour it upon his head, and anoint him* — and the psalm of brethren dwelling together in unity sings that very oil running down on Aaron''s head as the picture of the blessing, *life for evermore* (Psalm 133:3). The consecrating oil is the sign of the gathered people made one.'),
    ('canon','exodus',29,7,'canon','isaiah',61,1,'free',
      E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives* (Isaiah 61:1). The oil *poured upon his head* in Exodus 29:7 is the shadow; the substance is the Anointed One on whom the Spirit Himself rests — the Messiah, the true and final consecrated One.'),
    ('canon','exodus',29,7,'apocrypha','ecclesiasticus',45,15,'extras',
      E'*Moses consecrated him, and anointed him with holy oil: this was appointed to him by an everlasting covenant, and to his seed, so long as the heavens should remain, that they should minister to him, and execute the office of the priesthood, and bless the people in his name* (Ecclesiasticus 45:15). The wisdom of Ben Sira reads Exodus 29:7''s *anoint him* exactly as an EVERLASTING covenant of priesthood — not a temporary fixture but a standing ordinance, fulfilled and crowned in the Anointed.'),

    -- THREAD 2: blood on ear, thumb, toe — the whole man set apart (29:20)
    ('canon','exodus',29,20,'canon','leviticus',8,23,'free',
      E'*And he slew it; and Moses took of the blood of it, and put it upon the tip of Aaron''s right ear, and upon the thumb of his right hand, and upon the great toe of his right foot* (Leviticus 8:23). What Exodus 29:20 commands, Leviticus 8 carries out to the letter: the blood of the ram of consecration on *the tip of the right ear... the thumb of their right hand... the great toe of their right foot* — the whole man, hearing and doing and walking, sealed by blood.'),
    ('canon','exodus',29,20,'canon','leviticus',8,24,'free',
      E'*And he brought Aaron''s sons, and Moses put of the blood upon the tip of their right ear, and upon the thumbs of their right hands, and upon the great toes of their right feet: and Moses sprinkled the blood upon the altar round about* (Leviticus 8:24). The sons receive the same blood-mark Exodus 29:20 ordains — ear, thumb, toe — the same consecration extended down the line of the priesthood.'),

    -- THREAD 3: the sin offering burnt without the camp (29:14)
    ('canon','exodus',29,14,'canon','leviticus',8,17,'free',
      E'*But the bullock, and his hide, his flesh, and his dung, he burnt with fire without the camp; as Yahuah (LORD) commanded Moses* (Leviticus 8:17). Leviticus 8 performs the very command of Exodus 29:14 — *the flesh of the bullock, and his skin, and his dung, shalt thou burn with fire without the camp: it is a sin offering* — the sin offering carried outside the place of dwelling, the pattern the Messiah would fill.'),
    ('canon','exodus',29,14,'canon','hebrews',13,11,'free',
      E'*For the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11). Hebrews reaches straight back to Exodus 29:14''s *burn with fire without the camp: it is a sin offering* and reads it as the type — the sin offering whose body is consumed outside the gate.'),
    ('canon','exodus',29,14,'canon','hebrews',13,12,'free',
      E'*Wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). The sin-offering bullock *burnt with fire without the camp* (Exodus 29:14) finds its body: the Messiah, sanctifying the people with His own blood, suffered *without the gate* — the shadow fulfilled, not abolished.'),
    ('canon','exodus',29,14,'canon','hebrews',13,13,'free',
      E'*Let us go forth therefore unto him without the camp, bearing his reproach* (Hebrews 13:13). Because the sin offering of Exodus 29:14 was *burn[t] with fire without the camp*, the people are now called out to Him in that same place — the consecration of the priests becomes the call of the whole assembly.'),

    -- THREAD 4: the shadow whose body is the Messiah — the better priesthood (29:1-9 / key 29:9)
    ('canon','exodus',29,9,'canon','hebrews',7,23,'free',
      E'*And they truly were many priests, because they were not suffered to continue by reason of death: But this man, because he continueth ever, hath an unchangeable priesthood* (Hebrews 7:23-24). Exodus 29:9 makes *the priest''s office... theirs for a perpetual statute* — yet Aaron and his sons died and were replaced; Hebrews shows the pattern reaching its body in the One who *ever liveth to make intercession* (Hebrews 7:25). The Aaronic line is the shadow; the everliving Priest is the substance.'),
    ('canon','exodus',29,9,'canon','hebrews',7,27,'free',
      E'*Who needeth not daily, as those high priests, to offer up sacrifice, first for his own sins, and then for the people''s: for this he did once, when he offered up himself* (Hebrews 7:27). The consecration of Aaron in Exodus 29 had to be repeated, the offerings renewed — *for this he did once*: the better Priest offers Himself a single time, the body of what the rite foreshadowed.'),
    ('canon','exodus',29,9,'canon','hebrews',9,11,'free',
      E'*But Messiah (Christ) being come an high priest of good things to come, by a greater and more perfect tabernacle, not made with hands, that is to say, not of this building* (Hebrews 9:11). The hand-filling of Aaron in Exodus 29:9 sets up a priesthood in a tabernacle of cloth and skins; Hebrews shows it pointing to *a greater and more perfect tabernacle, not made with hands* — fulfilment, not erasure.'),
    ('canon','exodus',29,9,'canon','hebrews',10,1,'free',
      E'*For the law having a shadow of good things to come, and not the very image of the things, can never with those sacrifices which they offered year by year continually make the comers thereunto perfect* (Hebrews 10:1). The consecration of Exodus 29 is named exactly: *a shadow of good things to come*. The shadow is real and Yahuah-given; its body — *the very image* — is the Messiah it was always casting forward to.'),
    ('canon','exodus',29,9,'canon','hebrews',10,14,'free',
      E'*For by one offering he hath perfected for ever them that are sanctified* (Hebrews 10:14). Where Exodus 29 sanctifies the priests by repeated blood and seven days of consecration, the substance is *one offering* that *perfected for ever* — the priesthood the whole rite was building toward.'),
    ('canon','exodus',29,9,'apocrypha','ecclesiasticus',45,7,'extras',
      E'*An everlasting covenant he made with him and gave him the priesthood among the people; he beautified him with comely ornaments, and clothed him with a robe of glory* (Ecclesiasticus 45:7). Ben Sira honours the very office Exodus 29:9 establishes — *the priest''s office shall be theirs for a perpetual statute* — as an EVERLASTING covenant of Aaron. The better priesthood after Melek Tsadiq does not cancel this covenant; it fulfils the pattern Aaron''s robe of glory was made to serve.'),

    -- THREAD 5: the continual daily lamb — morning and evening (29:38-42)
    ('canon','exodus',29,38,'canon','numbers',28,3,'free',
      E'*And thou shalt say unto them, This is the offering made by fire which ye shall offer unto Yahuah (LORD); two lambs of the first year without spot day by day, for a continual burnt offering* (Numbers 28:3). Numbers restates the tamid of Exodus 29:38 word for word — *two lambs of the first year day by day continually* — the perpetual daily offering at the heart of the worship of Yahuah.'),
    ('canon','exodus',29,39,'canon','numbers',28,4,'free',
      E'*The one lamb shalt thou offer in the morning, and the other lamb shalt thou offer at even* (Numbers 28:4). The morning-and-evening rhythm of Exodus 29:39 — *the one lamb thou shalt offer in the morning; and the other lamb thou shalt offer at even* — is the appointed cadence of the continual offering, the hours that became the hours of prayer.'),
    ('canon','exodus',29,38,'canon','john',1,29,'free',
      E'*The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29). The *two lambs of the first year day by day continually* of Exodus 29:38 — the unceasing daily lamb — find their substance when John points and says *Behold the Lamb of Elohim*: the Lamb the tamid was rehearsing every morning and every evening.'),
    ('canon','exodus',29,38,'apocrypha','ecclesiasticus',45,14,'extras',
      E'*Their sacrifices shall be wholly consumed every day twice continually* (Ecclesiasticus 45:14). Ben Sira describes the priesthood of Aaron in the very terms of Exodus 29:38 — the offering *wholly consumed every day twice continually*, the morning and evening tamid — confirming the daily, perpetual character of the lamb at the door of the tabernacle.'),

    -- THREAD 6: I will dwell among the children of Yashar'el (29:43-46)
    ('canon','exodus',29,45,'canon','leviticus',26,11,'free',
      E'*And I will set my tabernacle among you: and my soul shall not abhor you* (Leviticus 26:11). The purpose of the whole priesthood is stated in Exodus 29:45 — *I will dwell among the children of Yashar''el (Israel), and will be their Elohim* — and Leviticus 26:11 sings the same covenant-dwelling: Yahuah pitching His tabernacle in the midst of His people.'),
    ('canon','exodus',29,45,'canon','leviticus',26,12,'free',
      E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:12). Exodus 29:45''s *I will dwell among... and will be their Elohim* is the covenant formula; Leviticus 26:12 completes it — *I will walk among you... and ye shall be my people* — the two halves of the one promise the tabernacle was built to keep.'),
    ('canon','exodus',29,45,'canon','ezekiel',37,27,'free',
      E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27). The dwelling promise of Exodus 29:45 is carried forward to the great two-house regathering — the stick of Yahudah and the stick of Yosef made one (Ezekiel 37:19) — and sealed with the same words: *I will be their Elohim, and they shall be my people*.'),
    ('canon','exodus',29,45,'canon','john',1,14,'free',
      E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). Exodus 29:45 promises *I will dwell among the children of Yashar''el (Israel)* — and the Formed Word, drawn from the Formless Father, *dwelt* (tabernacled) among them in flesh; the glory that filled the tent now beheld face to face.'),
    ('canon','exodus',29,46,'canon','revelation',21,3,'free',
      E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The promise of Exodus 29:46 — *that I may dwell among them: I am Yahuah their Elohim* — reaches its consummation in the new Jerusalem, the same covenant-dwelling formula spoken over the whole restored people forever.'),
    ('canon','exodus',29,45,'canon','2-corinthians',6,16,'free',
      E'*for ye are the temple of the living Elohim (God); as Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16). Paul quotes the very dwelling-and-walking formula of Exodus 29:45 (with Leviticus 26:11-12) over the gathered people — *I will dwell in them, and walk in them* — the priesthood''s purpose now fulfilled in a living temple.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. cross_reference_threads
-- ============================================================================
-- THREAD 1 (29:7) — anointing oil / the Anointed — tier extras (Ecclesiasticus member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-29-the-anointing-oil-poured-on-the-head-the-anointed',
       E'The Anointing Oil Poured on the Head — the Anointed',
       E'*Then shalt thou take the anointing oil, and pour it upon his head, and anoint him* (Exodus 29:7). The priest is made by oil poured on the head — and the picture runs the whole canon. The psalmist sees it: *It is like the precious ointment upon the head, that ran down upon the beard, even Aaron''s beard* (Psalm 133:2), the sign of brethren dwelling together in unity, of *life for evermore* (Psalm 133:3). Ben Sira reads it as an unbreakable covenant: *Moses consecrated him, and anointed him with holy oil: this was appointed to him by an everlasting covenant* (Ecclesiasticus 45:15). And the shadow finds its body in the One on whom the Spirit Himself rests: *Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted* (Isaiah 61:1) — the Messiah, the Anointed, the true and final consecrated One the oil on Aaron''s head was always reaching toward.',
       sv.verse_id, ev.verse_id, 'extras', 29700
  FROM _s305_ex29_lookup sv, _s305_ex29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=29 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (29:20) — blood on ear, thumb, toe — tier free
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-29-the-blood-on-ear-thumb-and-toe-the-whole-man-set-apart',
       E'The Blood on Ear, Thumb, and Toe — the Whole Man Set Apart',
       E'*Then shalt thou kill the ram, and take of his blood, and put it upon the tip of the right ear of Aaron, and upon the tip of the right ear of his sons, and upon the thumb of their right hand, and upon the great toe of their right foot* (Exodus 29:20). The blood of the ram of consecration touches three places — the ear that hears the word, the hand that does it, the foot that walks in it — the whole man set apart to Yahuah by blood. Leviticus shows the command carried out to the letter: *Moses took of the blood of it, and put it upon the tip of Aaron''s right ear, and upon the thumb of his right hand, and upon the great toe of his right foot* (Leviticus 8:23), and the same mark passed to his sons — *upon the tip of their right ear, and upon the thumbs of their right hands, and upon the great toes of their right feet* (Leviticus 8:24). Consecration is never partial; the blood claims hearing, doing, and walking together.',
       sv.verse_id, ev.verse_id, 'free', 29703
  FROM _s305_ex29_lookup sv, _s305_ex29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=29 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (29:14) — sin offering burnt without the camp — tier free
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-29-the-sin-offering-burnt-without-the-camp',
       E'The Sin Offering Burnt Without the Camp',
       E'*But the flesh of the bullock, and his skin, and his dung, shalt thou burn with fire without the camp: it is a sin offering* (Exodus 29:14). The sin-offering body is carried outside the place of dwelling and consumed — and Leviticus performs it: *the bullock, and his hide, his flesh, and his dung, he burnt with fire without the camp; as Yahuah (LORD) commanded Moses* (Leviticus 8:17). Hebrews lifts the eyes to the body of this shadow: *For the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11) — *Wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). The Torah''s sin offering is not abolished but fulfilled; and the call follows: *Let us go forth therefore unto him without the camp, bearing his reproach* (Hebrews 13:13). What set the priests apart now gathers the whole people to Him.',
       sv.verse_id, ev.verse_id, 'free', 29706
  FROM _s305_ex29_lookup sv, _s305_ex29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=29 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (29:9) — the shadow whose body is the Messiah — tier extras (Ecclesiasticus member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-29-the-shadow-whose-body-is-the-messiah-the-better-priesthood',
       E'The Shadow Whose Body Is the Messiah — the Better Priesthood',
       E'*The priest''s office shall be theirs for a perpetual statute: and thou shalt consecrate Aaron and his sons* (Exodus 29:9). The whole rite of Exodus 29 — washed, clothed, anointed, the hand filled, the ram of consecration, the seven days renewed — is a shadow whose body is the Messiah. Hebrews names it plainly: *the law having a shadow of good things to come, and not the very image of the things* (Hebrews 10:1). Aaron and his sons were *many priests, because they were not suffered to continue by reason of death* (Hebrews 7:23) — but the better Priest *continueth ever* and *did once, when he offered up himself* (Hebrews 7:27), *by a greater and more perfect tabernacle, not made with hands* (Hebrews 9:11), so that *by one offering he hath perfected for ever them that are sanctified* (Hebrews 10:14). This is fulfilment, not erasure: Ben Sira keeps the *everlasting covenant... the priesthood among the people* (Ecclesiasticus 45:7) of Aaron whole and honoured — the better priesthood after the order of Melek Tsadiq (Melchizedek) crowns the very pattern the robe of glory was made to serve.',
       sv.verse_id, ev.verse_id, 'extras', 29709
  FROM _s305_ex29_lookup sv, _s305_ex29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=29 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (29:38-42) — the continual daily lamb — tier extras (Ecclesiasticus member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-29-the-continual-daily-lamb-morning-and-evening',
       E'The Continual Daily Lamb — Morning and Evening',
       E'*Now this is that which thou shalt offer upon the altar; two lambs of the first year day by day continually. The one lamb thou shalt offer in the morning; and the other lamb thou shalt offer at even* (Exodus 29:38-39). The tamid — the perpetual daily lamb at the door of the tabernacle — is restated word for word in the wilderness: *two lambs of the first year without spot day by day, for a continual burnt offering* (Numbers 28:3), *the one lamb shalt thou offer in the morning, and the other lamb shalt thou offer at even* (Numbers 28:4). Ben Sira describes the priesthood by the same continual rhythm: *their sacrifices shall be wholly consumed every day twice continually* (Ecclesiasticus 45:14). And the unceasing daily lamb finds its substance when John points to Him: *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29) — the Lamb the morning and evening offering had been rehearsing all along.',
       sv.verse_id, ev.verse_id, 'extras', 29712
  FROM _s305_ex29_lookup sv, _s305_ex29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=38
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=29 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (29:43-46) — I will dwell among the children of Yashar'el — tier free
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-29-i-will-dwell-among-the-children-of-israel',
       E'I Will Dwell Among the Children of Yashar''el',
       E'*And I will dwell among the children of Yashar''el (Israel), and will be their Elohim (God). And they shall know that I am Yahuah (LORD) their Elohim, that brought them forth out of the land of Egypt, that I may dwell among them* (Exodus 29:45-46). Here is the purpose of the whole priesthood: not ritual for its own sake, but that Yahuah should DWELL with His people. The covenant-dwelling formula echoes through the Torah — *I will set my tabernacle among you* (Leviticus 26:11), *I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:12) — and is sealed over the two-house regathering: *My tabernacle also shall be with them: yea, I will be their Elohim, and they shall be my people* (Ezekiel 37:27). The Formed Word made it visible: *the Word was made flesh, and dwelt among us* (John 1:14). Paul speaks it over the living temple: *I will dwell in them, and walk in them; and I will be their Elohim, and they shall be my people* (2 Corinthians 6:16). And it reaches its consummation: *Behold, the tabernacle of Elohim is with men, and he will dwell with them, and they shall be his people* (Revelation 21:3). The dwelling promised at the door of the tent is the dwelling that fills the new Jerusalem forever.',
       sv.verse_id, ev.verse_id, 'free', 29715
  FROM _s305_ex29_lookup sv, _s305_ex29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=43
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=29 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. cross_reference_thread_members
-- ============================================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 133:2 — *the precious ointment upon the head... even Aaron''s beard*: the consecrating oil of Exodus 29:7 sung as the sign of the gathered people made one, *life for evermore*.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=7
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=133 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-anointing-oil-poured-on-the-head-the-anointed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 61:1 — *Yahuah hath anointed me to preach good tidings*: the oil poured on the priest''s head is the shadow; the Spirit resting on the Anointed is the substance.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=7
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-anointing-oil-poured-on-the-head-the-anointed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ecclesiasticus 45:15 — *anointed him with holy oil... an everlasting covenant*: Ben Sira reads the anointing of Exodus 29:7 as a standing, everlasting ordinance.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=7
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=45 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-anointing-oil-poured-on-the-head-the-anointed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 8:23 — the rite of Exodus 29:20 carried out on Aaron: blood on the right ear, thumb, and great toe.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=20
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=8 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-blood-on-ear-thumb-and-toe-the-whole-man-set-apart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 8:24 — the same blood-mark of Exodus 29:20 passed to Aaron''s sons: ear, thumb, toe down the priestly line.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=20
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=8 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-blood-on-ear-thumb-and-toe-the-whole-man-set-apart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 8:17 — Exodus 29:14''s sin-offering bullock burnt without the camp, performed as commanded.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=14
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=8 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-sin-offering-burnt-without-the-camp'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 13:11 — *the bodies of those beasts... are burned without the camp*: the type read from Exodus 29:14.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=14
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-sin-offering-burnt-without-the-camp'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 13:12 — *Yahusha also... suffered without the gate*: the sin offering of Exodus 29:14 finds its body.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=14
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-sin-offering-burnt-without-the-camp'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 13:13 — *Let us go forth therefore unto him without the camp*: the priestly consecration becomes the call of the whole people.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=14
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-sin-offering-burnt-without-the-camp'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Hebrews 7:23-24 — *many priests, because... death... but this man... an unchangeable priesthood*: Aaron the shadow, the everliving Priest the substance of Exodus 29:9''s perpetual office.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=9
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-shadow-whose-body-is-the-messiah-the-better-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 7:27 — *this he did once, when he offered up himself*: the repeated consecration of Exodus 29 answered by a single offering.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=9
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-shadow-whose-body-is-the-messiah-the-better-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 9:11 — *a greater and more perfect tabernacle, not made with hands*: the body of the tent-and-priesthood pattern of Exodus 29.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=9
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-shadow-whose-body-is-the-messiah-the-better-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 10:1 — *a shadow of good things to come, and not the very image*: Exodus 29 named as the Yahuah-given shadow whose body is the Messiah.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=9
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-shadow-whose-body-is-the-messiah-the-better-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Hebrews 10:14 — *by one offering he hath perfected for ever them that are sanctified*: the consecration of Exodus 29 brought to its end.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=9
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-shadow-whose-body-is-the-messiah-the-better-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Ecclesiasticus 45:7 — *an everlasting covenant... the priesthood among the people*: the office of Exodus 29:9 honoured as Aaron''s everlasting covenant, fulfilled not cancelled by the better priesthood.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=9
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=45 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-shadow-whose-body-is-the-messiah-the-better-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 28:3 — *two lambs of the first year... day by day, for a continual burnt offering*: the tamid of Exodus 29:38 restated.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=38
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-continual-daily-lamb-morning-and-evening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 28:4 — *the one lamb... in the morning, and the other lamb... at even*: the morning-and-evening cadence of Exodus 29:39.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=39
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-continual-daily-lamb-morning-and-evening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'John 1:29 — *Behold the Lamb of Elohim, which taketh away the sin of the world*: the substance of the continual daily lamb of Exodus 29:38.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=38
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-continual-daily-lamb-morning-and-evening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Ecclesiasticus 45:14 — *their sacrifices shall be wholly consumed every day twice continually*: Ben Sira confirms the twice-daily tamid of Exodus 29:38.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=38
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=45 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-the-continual-daily-lamb-morning-and-evening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 26:11 — *I will set my tabernacle among you*: the dwelling purpose of Exodus 29:45.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=45
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-i-will-dwell-among-the-children-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 26:12 — *I will walk among you... and ye shall be my people*: the second half of the covenant formula of Exodus 29:45.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=45
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-i-will-dwell-among-the-children-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ezekiel 37:27 — *My tabernacle also shall be with them*: the dwelling promise of Exodus 29:45 sealed over the two-house regathering.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=45
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-i-will-dwell-among-the-children-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'John 1:14 — *the Word was made flesh, and dwelt among us*: the Formed Word makes Exodus 29:45''s dwelling visible.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=45
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-i-will-dwell-among-the-children-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Corinthians 6:16 — *I will dwell in them, and walk in them... they shall be my people*: Paul speaks the dwelling-and-walking formula of Exodus 29:45 over the living temple.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=45
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-i-will-dwell-among-the-children-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Revelation 21:3 — *the tabernacle of Elohim is with men, and he will dwell with them*: the consummation of Exodus 29:46''s *that I may dwell among them*.'
  FROM cross_reference_threads t
  JOIN _s305_ex29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=29 AND sv.verse_number=46
  JOIN _s305_ex29_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-29-i-will-dwell-among-the-children-of-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
