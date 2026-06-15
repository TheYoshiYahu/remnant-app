-- ----- fragment: minion_exodus_30.sql (Exodus 30) -----
-- Exodus 30 — the altar of incense, the half-shekel ransom, the brazen laver,
--   the holy anointing oil & the holy incense.
-- Tag: ex30   Session prefix: s305   Temp view: _s305_ex30_lookup
-- Sort band: 29725, step +3 per thread.
--
-- Exodus 30 coverage:
--   v.1-10 (altar of incense / perpetual incense / atonement on horns):
--        NT:     Rev 5:8 (golden vials full of odours = prayers of saints), Rev 8:3-4 (incense
--                with the prayers of all saints ascends), Luke 1:10 (people praying at the hour
--                of incense) — ALL TAKEN.
--        Extras: Sirach (Ecclesiasticus) 45:16 (Aaron chose to offer incense, a memorial) — TAKEN
--                in anointing-oil thread; 50:9 incense in censer = ornamental, none warranted here.
--        Tanakh: Ps 141:2 (prayer set forth as incense), Lev 16:13 (cloud of incense covers
--                mercy seat on Yom Kippur), Num 16:46-48 (incense stays the plague), 2 Chron
--                26:16-19 (Uzziah's unlawful incense / leprosy) — ALL TAKEN.
--   v.11-16 (half-shekel ransom for the soul / no plague / rich-poor equal / atonement money):
--        NT:     1 Pet 1:18-19 (not redeemed with silver/gold but the blood of Messiah),
--                Matt 17:24-27 (temple-tax / tribute money), Mark 10:45 + Matt 20:28 (Son of
--                Adam gives his life a ransom for many) — ALL TAKEN.
--        Extras: none warranted (no clean ransom-money witness).
--        Tanakh: Ps 49:7-8 (no man can redeem his brother; redemption of the soul is precious) — TAKEN.
--   v.17-21 (brazen laver / wash hands and feet that they die not):
--        NT:     Titus 3:5 (washing of regeneration), John 13:10 (he that is washed is clean),
--                Eph 5:26 (washing of water by the word), Heb 10:22 (bodies washed with pure water) — ALL TAKEN.
--        Extras: none warranted.
--        Tanakh: laver-specific lateral none warranted (priestly cleansing dispersed; NT weave carries it).
--   v.22-33 (holy anointing oil / not on man's flesh / cut off if counterfeited):
--        NT:     1 John 2:20,27 (unction / anointing from the Holy One abiding), Isa 61:1
--                (Yahuah hath anointed me) [Tanakh-forward] — TAKEN.
--        Extras: Sirach (Ecclesiasticus) 45:15-16 (Moses anointed Aaron with holy oil, an
--                everlasting covenant; incense a memorial) — TAKEN.
--        Tanakh: Ps 133:2 (the precious ointment upon Aaron's beard), Isa 61:1 — TAKEN.
--   v.34-38 (holy incense / ye shall not make to yourselves / cut off):
--        NT:     folded into incense thread; the "strange incense" warning weaves with the
--                set-apart-worship-not-counterfeited theme already carried.
--        Extras: none warranted (Sirach 50 ornamental only).
--        Tanakh: 2 Chron 26:16-19 (Uzziah's strange/unlawful incense) — carried in incense thread;
--                echoes Lev 10 Nadab/Abihu strange fire (named in prose, no clean discrete add beyond above).
--
-- THREADS (5):
--   exodus-30-the-incense-is-the-prayers-of-the-set-apart           [free]  canon (Tanakh+NT)
--   exodus-30-the-half-shekel-ransom-for-the-soul                   [free]  canon (Tanakh+NT)
--   exodus-30-the-laver-the-washing-that-they-die-not               [free]  canon (NT)
--   exodus-30-the-holy-anointing-oil-the-anointed-one               [extras] canon (Tanakh+NT) + apocrypha (Sirach)
--   (incense-counterfeit folded into thread 1)
-- Christology: the Anointed One (Messiah = the Anointed) is the Formed Son drawn from the
--   Formless Father (Isa 61:1 the Spirit upon him, Yahuah anointed me); incense = the prayers
--   rising before the throne; the true ransom is his blood, never silver or gold.

CREATE TEMP VIEW _s305_ex30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ========================= cross_references =========================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: incense = the prayers of the set-apart
  ('canon','exodus',30,8,'canon','psalms',141,2,'free',
   E'*Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2). The *perpetual incense before Yahuah (LORD)* burnt by Aaron *every morning* and *at even* (Exodus 30:7-8) is the figure David sings: the rising smoke is the rising prayer, the evening incense the evening cry.'),
  ('canon','exodus',30,7,'canon','revelation',5,8,'free',
   E'*And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints* (Revelation 5:8). The Spirit names the meaning of the *sweet incense* of Exodus 30:7 outright — the *odours* in the golden vials *are the prayers of saints* rising before the throne.'),
  ('canon','exodus',30,8,'canon','revelation',8,3,'free',
   E'*And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3). The earthly *golden* altar of incense (Exodus 30:3) has its heavenly pattern; the *much incense* offered *with the prayers of all saints* is the *perpetual incense before Yahuah* fulfilled.'),
  ('canon','exodus',30,8,'canon','revelation',8,4,'free',
   E'*And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). The *perpetual incense before Yahuah (LORD) throughout your generations* (Exodus 30:8) ascends still — the smoke and the prayers are one thing rising before the throne.'),
  ('canon','exodus',30,7,'canon','luke',1,10,'free',
   E'*And the whole multitude of the people were praying without at the time of incense* (Luke 1:10). When Aaron *burned thereon sweet incense* (Exodus 30:7), the people prayed; centuries later Zacharias burns the incense and *the whole multitude* prays — the rite was always the prayer made visible.'),
  ('canon','exodus',30,10,'canon','leviticus',16,13,'free',
   E'*And he shall put the incense upon the fire before Yahuah (LORD), that the cloud of the incense may cover the mercy seat that is upon the testimony, that he die not* (Leviticus 16:13). The *atonement upon the horns* of the incense altar *once in a year* (Exodus 30:10) is Yom Kippur: the cloud of incense shields the priest before the mercy seat.'),
  ('canon','exodus',30,7,'canon','numbers',16,46,'free',
   E'*And Moses said unto Aaron, Take a censer, and put fire therein from off the altar, and put on incense, and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah (LORD); the plague is begun* (Numbers 16:46). The incense Aaron *burned* (Exodus 30:7) is no empty ceremony — here it stays the wrath; Aaron *stood between the dead and the living; and the plague was stayed* (16:48).'),
  ('canon','exodus',30,9,'canon','2-chronicles',26,19,'free',
   E'*Then Uzziah was wroth, and had a censer in his hand to burn incense: and while he was wroth with the priests, the leprosy even rose up in his forehead* (2 Chronicles 26:19). Exodus 30:9 forbids *strange incense*; the set-apart altar is for the consecrated priests alone — Uzziah, a king who seized the censer, is struck with leprosy on the spot.'),
  -- THREAD 2: the half-shekel ransom for the soul
  ('canon','exodus',30,12,'canon','1-peter',1,18,'free',
   E'*Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold, from your vain conversation received by tradition from your fathers* (1 Peter 1:18). The half-shekel was *a ransom for his soul* (Exodus 30:12), but it was only ever a memorial — the soul is *not redeemed with corruptible things, as silver and gold*.'),
  ('canon','exodus',30,15,'canon','1-peter',1,19,'free',
   E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). *The rich shall not give more, and the poor shall not give less... to make an atonement for your souls* (Exodus 30:15) — the equal price for every soul points past the silver to the one ransom of equal worth for all: *the precious blood of Messiah*.'),
  ('canon','exodus',30,13,'canon','matthew',17,24,'free',
   E'*And when they were come to Capernaum, they that received tribute money came to Peter, and said, Doth not your master pay tribute?* (Matthew 17:24). The *half a shekel after the shekel of the sanctuary... an half shekel shall be the offering of Yahuah (LORD)* (Exodus 30:13) is the very temple-tax Messiah is asked to pay.'),
  ('canon','exodus',30,16,'canon','matthew',17,27,'free',
   E'*...thou shalt find a piece of money: that take, and give unto them for me and thee* (Matthew 17:27). The *atonement money of the children of Yashar''el (Israel)* (Exodus 30:16) — Messiah, the King''s own Son, is free, yet provides the coin for himself and Peter, fulfilling the memorial offering even as he is its substance.'),
  ('canon','exodus',30,12,'canon','mark',10,45,'free',
   E'*For even the Son of Adam came not to be ministered unto, but to minister, and to give his life a ransom for many* (Mark 10:45). The half-shekel *ransom for his soul* (Exodus 30:12) finds its truth here: the Son of Adam gives *his life a ransom* — not silver, but himself, *for many*.'),
  ('canon','exodus',30,12,'canon','matthew',20,28,'free',
   E'*Even as the Son of Adam came not to be ministered unto, but to minister, and to give his life a ransom for many* (Matthew 20:28). The continual *ransom for his soul* (Exodus 30:12) is answered once for all in the Son of Adam who gives *his life a ransom for many*.'),
  ('canon','exodus',30,15,'canon','psalms',49,7,'free',
   E'*None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7). The half-shekel could not itself buy a soul — *for the redemption of their soul is precious, and it ceaseth for ever* (49:8). The equal offering of Exodus 30:15 confesses that only Yahuah redeems.'),
  -- THREAD 3: the laver — the washing that they die not
  ('canon','exodus',30,18,'canon','titus',3,5,'free',
   E'*Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5). The *laver of brass... to wash withal* (Exodus 30:18) is the figure of *the washing of regeneration* — cleansing for those who draw near to minister.'),
  ('canon','exodus',30,19,'canon','john',13,10,'free',
   E'*Yahusha (Jesus) saith to him, He that is washed needeth not save to wash his feet, but is clean every whit: and ye are clean, but not all* (John 13:10). *Aaron and his sons shall wash their hands and their feet* (Exodus 30:19); Messiah washes the disciples'' feet and names the truth the laver taught — the washed are *clean every whit*.'),
  ('canon','exodus',30,20,'canon','ephesians',5,26,'free',
   E'*That he might sanctify and cleanse it with the washing of water by the word* (Ephesians 5:26). The priests washed *that they die not* (Exodus 30:20); the bride is cleansed *with the washing of water by the word* — the same set-apart washing before drawing near.'),
  ('canon','exodus',30,20,'canon','hebrews',10,22,'free',
   E'*Let us draw near with a true heart in full assurance of faith, having our hearts sprinkled from an evil conscience, and our bodies washed with pure water* (Hebrews 10:22). To *come near to the altar to minister* (Exodus 30:20) required the laver; to draw near now requires *our bodies washed with pure water* — the laver fulfilled.'),
  -- THREAD 4: the holy anointing oil — the Anointed One
  ('canon','exodus',30,25,'canon','psalms',133,2,'free',
   E'*It is like the precious ointment upon the head, that ran down upon the beard, even Aaron''s beard: that went down to the skirts of his garments* (Psalm 133:2). The *holy anointing oil* (Exodus 30:25) poured upon Aaron is the very picture David sings — the consecrating oil running down in abundance.'),
  ('canon','exodus',30,30,'canon','isaiah',61,1,'free',
   E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek...* (Isaiah 61:1). The oil that *anoint[ed] Aaron and his sons* (Exodus 30:30) foreshadows the true Anointing — Messiah (the Anointed) on whom the Spirit rests; the Formed Son sent by the Father.'),
  ('canon','exodus',30,30,'canon','1-john',2,20,'free',
   E'*But ye have an unction from the Holy One, and ye know all things* (1 John 2:20). The exclusive *holy anointing oil* set apart Aaron (Exodus 30:30); the set-apart now have *an unction from the Holy One* — *the anointing which ye have received of him abideth in you* (2:27).'),
  ('canon','exodus',30,25,'apocrypha','ecclesiasticus',45,15,'extras',
   E'*Moses consecrated him, and anointed him with holy oil: this was appointed to him by an everlasting covenant, and to his seed, so long as the heavens should remain, that they should minister to him, and execute the office of the priesthood* (Sirach 45:15). The library remembers the *holy anointing oil* (Exodus 30:25) as *an everlasting covenant* — Moses anointing Aaron, the priesthood appointed to his seed.'),
  ('canon','exodus',30,25,'apocrypha','ecclesiasticus',45,16,'extras',
   E'*He chose him out of all men living to offer sacrifices to Yahuah (God), incense, and a sweet savour, for a memorial, to make reconciliation for his people* (Sirach 45:16). Aaron, anointed with the *holy anointing oil* (Exodus 30:25), is the chosen one to offer *incense... for a memorial* — the very incense of Exodus 30:7-8, named here as reconciliation.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ========================= threads =========================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-30-the-incense-is-the-prayers-of-the-set-apart',
       E'The incense is the prayers of the set-apart',
       E'Aaron is to *burn thereon sweet incense every morning... and when Aaron lighteth the lamps at even, he shall burn incense upon it, a perpetual incense before Yahuah (LORD) throughout your generations* (Exodus 30:7-8). The rite is the prayer made visible. David sings it: *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2). And the Spirit names the meaning outright in the throne-room — the *golden vials full of odours, which are the prayers of saints* (Revelation 5:8), and *much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne... and the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God)* (Revelation 8:3-4). At the appointed hour *the whole multitude of the people were praying without at the time of incense* (Luke 1:10). This incense is set-apart and deadly serious: it shields the priest before the mercy seat on the Day of Atonement — *that the cloud of the incense may cover the mercy seat... that he die not* (Leviticus 16:13) — and it stays the plague when Aaron *put on incense, and made an atonement for the people* (Numbers 16:46-48). So *ye shall offer no strange incense thereon* (Exodus 30:9); when King Uzziah seized the censer, *the leprosy even rose up in his forehead* (2 Chronicles 26:19). The prayers of the set-apart rise before the throne, and the worship is never to be counterfeited.',
       sv.verse_id, ev.verse_id, 'free', 29725
  FROM _s305_ex30_lookup sv, _s305_ex30_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=30 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=30 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-30-the-half-shekel-ransom-for-the-soul',
       E'The half-shekel ransom for the soul',
       E'*When thou takest the sum of the children of Yashar''el (Israel)... then shall they give every man a ransom for his soul unto Yahuah (LORD)... that there be no plague among them* (Exodus 30:12). The price is fixed and equal: *the rich shall not give more, and the poor shall not give less than half a shekel... to make an atonement for your souls* (30:15). One soul, one price — the silver a *memorial unto the children of Yashar''el* (30:16). Yet the silver was never the redemption; the Psalmist confesses it plainly: *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him: (for the redemption of their soul is precious, and it ceaseth for ever)* (Psalm 49:7-8). The half-shekel points past itself. Messiah is asked for the very temple-tax — *Doth not your master pay tribute?* (Matthew 17:24) — and though the King''s Son is free, he provides the coin (17:27). But the true ransom is not money: *ye were not redeemed with corruptible things, as silver and gold... but with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:18-19); *the Son of Adam came not to be ministered unto, but to minister, and to give his life a ransom for many* (Mark 10:45; Matthew 20:28). The equal half-shekel was the standing witness that every soul is ransomed at one price — and that the price would be blood, not silver.',
       sv.verse_id, ev.verse_id, 'free', 29728
  FROM _s305_ex30_lookup sv, _s305_ex30_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=30 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=30 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-30-the-laver-the-washing-that-they-die-not',
       E'The laver — the washing that they die not',
       E'*Thou shalt also make a laver of brass... to wash withal... For Aaron and his sons shall wash their hands and their feet thereat: when they go into the tabernacle of the congregation, they shall wash with water, that they die not* (Exodus 30:18-20). No one draws near to minister unwashed. The washing was never abolished but fulfilled: *not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5). Messiah washes the disciples'' feet and names the truth the laver taught — *He that is washed needeth not save to wash his feet, but is clean every whit* (John 13:10). The bride is cleansed *with the washing of water by the word* (Ephesians 5:26), and the worshipper draws near *having our hearts sprinkled from an evil conscience, and our bodies washed with pure water* (Hebrews 10:22). The brazen laver still stands between the altar and the holy place: cleansing precedes service, *that they die not*.',
       sv.verse_id, ev.verse_id, 'free', 29731
  FROM _s305_ex30_lookup sv, _s305_ex30_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=30 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=30 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-30-the-holy-anointing-oil-the-anointed-one',
       E'The holy anointing oil — the Anointed One',
       E'*And thou shalt make it an oil of holy ointment... it shall be an holy anointing oil* (Exodus 30:25), and with it *thou shalt anoint Aaron and his sons, and consecrate them* (30:30). It is exclusive and set-apart: *upon man''s flesh shall it not be poured, neither shall ye make any other like it... whosoever compoundeth any like it... shall even be cut off from his people* (30:32-33). The restored library remembers this as covenant: *Moses consecrated him, and anointed him with holy oil: this was appointed to him by an everlasting covenant, and to his seed... He chose him out of all men living to offer sacrifices to Yahuah (God), incense, and a sweet savour, for a memorial* (Sirach 45:15-16). David sings the abundance — *the precious ointment upon the head, that ran down upon the beard, even Aaron''s beard* (Psalm 133:2). And the oil foreshadows the true Anointing. Messiah is *the Anointed*: *the Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek* (Isaiah 61:1) — the Formed Son on whom the Spirit rests, sent by the Father. From him the set-apart receive the same: *ye have an unction from the Holy One* (1 John 2:20), *the anointing which ye have received of him abideth in you* (2:27). The oil that could be poured on no common flesh is poured out now in the Spirit upon his own.',
       sv.verse_id, ev.verse_id, 'extras', 29734
  FROM _s305_ex30_lookup sv, _s305_ex30_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=30 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=30 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ========================= thread_members =========================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   ('exodus',30,8,'canon','psalms',141,2,1,E'*Let my prayer be set forth before thee as incense* (Psalm 141:2) — the rising smoke is the rising prayer.'),
   ('exodus',30,7,'canon','revelation',5,8,2,E'*golden vials full of odours, which are the prayers of saints* (Revelation 5:8) — the Spirit names the incense outright.'),
   ('exodus',30,8,'canon','revelation',8,3,3,E'*much incense, that he should offer it with the prayers of all saints upon the golden altar* (Revelation 8:3) — the heavenly pattern of the golden altar.'),
   ('exodus',30,8,'canon','revelation',8,4,4,E'*the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim* (Revelation 8:4) — the perpetual incense ascending still.'),
   ('exodus',30,7,'canon','luke',1,10,5,E'*the whole multitude of the people were praying without at the time of incense* (Luke 1:10) — the rite was always the prayer made visible.'),
   ('exodus',30,10,'canon','leviticus',16,13,6,E'*the cloud of the incense may cover the mercy seat... that he die not* (Leviticus 16:13) — the once-a-year atonement at the mercy seat.'),
   ('exodus',30,7,'canon','numbers',16,46,7,E'*put on incense, and go quickly unto the congregation, and make an atonement for them* (Numbers 16:46) — the incense stays the plague.'),
   ('exodus',30,9,'canon','2-chronicles',26,19,8,E'*the leprosy even rose up in his forehead* (2 Chronicles 26:19) — Uzziah''s strange incense; no strange incense thereon.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-30-the-incense-is-the-prayers-of-the-set-apart'
  JOIN _s305_ex30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex30_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   ('exodus',30,12,'canon','1-peter',1,18,1,E'*ye were not redeemed with corruptible things, as silver and gold* (1 Peter 1:18) — the silver was only ever a memorial.'),
   ('exodus',30,15,'canon','1-peter',1,19,2,E'*but with the precious blood of Messiah, as of a lamb without blemish and without spot* (1 Peter 1:19) — the one price of equal worth for all.'),
   ('exodus',30,13,'canon','matthew',17,24,3,E'*Doth not your master pay tribute?* (Matthew 17:24) — the very half-shekel temple-tax.'),
   ('exodus',30,16,'canon','matthew',17,27,4,E'*give unto them for me and thee* (Matthew 17:27) — the King''s Son provides the atonement money.'),
   ('exodus',30,12,'canon','mark',10,45,5,E'*the Son of Adam... to give his life a ransom for many* (Mark 10:45) — the true ransom for the soul.'),
   ('exodus',30,12,'canon','matthew',20,28,6,E'*to give his life a ransom for many* (Matthew 20:28) — not silver, but himself.'),
   ('exodus',30,15,'canon','psalms',49,7,7,E'*None... can by any means redeem his brother, nor give to Elohim a ransom for him* (Psalm 49:7) — only Yahuah redeems the precious soul.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-30-the-half-shekel-ransom-for-the-soul'
  JOIN _s305_ex30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex30_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   ('exodus',30,18,'canon','titus',3,5,1,E'*the washing of regeneration, and renewing of the Ruach HaKodesh* (Titus 3:5) — the laver fulfilled.'),
   ('exodus',30,19,'canon','john',13,10,2,E'*He that is washed... is clean every whit* (John 13:10) — Messiah names the truth the laver taught.'),
   ('exodus',30,20,'canon','ephesians',5,26,3,E'*the washing of water by the word* (Ephesians 5:26) — the same set-apart washing before drawing near.'),
   ('exodus',30,20,'canon','hebrews',10,22,4,E'*our bodies washed with pure water* (Hebrews 10:22) — cleansing precedes drawing near.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-30-the-laver-the-washing-that-they-die-not'
  JOIN _s305_ex30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex30_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   ('exodus',30,25,'canon','psalms',133,2,1,E'*the precious ointment upon the head, that ran down... even Aaron''s beard* (Psalm 133:2) — the consecrating oil in abundance.'),
   ('exodus',30,30,'canon','isaiah',61,1,2,E'*Yahuah hath anointed me to preach good tidings unto the meek* (Isaiah 61:1) — the true Anointing, the Formed Son on whom the Spirit rests.'),
   ('exodus',30,30,'canon','1-john',2,20,3,E'*ye have an unction from the Holy One* (1 John 2:20) — the anointing now abiding in the set-apart.'),
   ('exodus',30,25,'apocrypha','ecclesiasticus',45,15,4,E'*anointed him with holy oil: this was appointed... by an everlasting covenant* (Sirach 45:15) — the library remembers the oil as covenant.'),
   ('exodus',30,25,'apocrypha','ecclesiasticus',45,16,5,E'*to offer... incense, and a sweet savour, for a memorial, to make reconciliation* (Sirach 45:16) — Aaron chosen to offer the incense of Exodus 30:7-8.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-30-the-holy-anointing-oil-the-anointed-one'
  JOIN _s305_ex30_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex30_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
