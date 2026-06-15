-- ----- fragment: minion_exodus_26.sql (Exodus 26) -----
-- Chapter: Exodus 26 (the tabernacle itself — the ten curtains, the boards, the veil)
-- Tag: ex26   Session prefix: s305   Sort band: 29625 step +3
-- Temp view: _s305_ex26_lookup
--
-- THREADS (5):
--   exodus-26-the-vail-that-is-to-say-his-flesh          [free]  canon NT (Heb 10:19-20, Heb 9:3, Heb 9:8, Matt 27:51, Mark 15:38)
--   exodus-26-couple-the-tent-that-it-may-be-one-pattern [free]  canon (Exod 25:9, Exod 25:40, Heb 8:5, Heb 9:23, Heb 9:24)
--   exodus-26-cherubims-of-cunning-work-keep-the-way     [free]  canon (Gen 3:24, Ezek 1:5, Ezek 10:1, 1 Kings 6:29, Heb 9:5, Rev 4:8)
--   exodus-26-that-i-may-dwell-among-them-the-shakan     [extras] canon + extras (Exod 25:8, John 1:14, Rev 21:3, Wisdom 9:8)
--   exodus-26-the-sockets-of-silver-the-ransom-of-souls  [free]  canon (Exod 30:12, Exod 30:16, Exod 38:27)
--
-- Exodus 26 coverage:
--   v.1 (ten curtains, cherubims of cunning work)
--        NT:     Heb 9:5 cherubims of glory (cherubim thread); Rev 21:3 tabernacle of Elohim with men (shakan thread)
--        Extras: Wisdom 9:8 resemblance of the holy tabernacle (shakan thread)
--        Tanakh: Gen 3:24 cherubims keep the way; Ezek 1:5/10:1; 1 Kings 6:29; Exod 25:8 (dwell among them)
--   v.6 (couple the curtains... it shall be one tabernacle)
--        NT:     Heb 8:5 / Heb 9:23-24 the pattern, the figures of the true (pattern thread)
--        Extras: none warranted (pattern handled at ch25)
--        Tanakh: Exod 25:9, Exod 25:40 the pattern shewed in the mount (pattern thread)
--   v.11 (couple the tent together, that it may be one) — folded into pattern/shakan (the dwelling made ONE)
--   v.15-29 (boards of shittim, sockets of silver, bars overlaid with gold)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exod 30:12,16 ransom/atonement money; Exod 38:27 sockets cast of the silver (silver-sockets thread)
--   v.30 (rear up the tabernacle according to the fashion shewed thee in the mount) — folded into pattern thread
--   v.31-33 ★★ (a vail of blue/purple/scarlet, with cherubims; the vail shall divide between holy and most holy)
--        NT:     Heb 10:19-20 boldness to enter by the veil = his flesh; Heb 9:3 the second veil / Holiest; Heb 9:8 way not yet manifest; Matt 27:51 + Mark 15:38 the veil rent in twain (veil thread). Cherubim-on-the-veil → cherubim thread (Heb 9:5)
--        Extras: none warranted
--        Tanakh: cherubim thread laterals (Gen 3:24 etc.)
--   v.34 (mercy seat upon the ark in the most holy) — context for veil/cherubim threads, no separate add (ark/mercyseat = ch25's thread)
--   v.36-37 (hanging for the door, five pillars) — none warranted (subsidiary to the curtain/veil weave)

CREATE TEMP VIEW _s305_ex26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- cross_references
-- ============================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: the vail, that is to say, his flesh (26:31-33)
  ('canon','exodus',26,31,'canon','hebrews',10,20,'free',
    E'*By a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh* (Hebrews 10:20). The veil woven *of blue, and purple, and scarlet... with cherubims* (Exodus 26:31) is read forward as the flesh of the Formed Son: the Father drew the Formless into a body, and that body became the curtain through which the way into the Presence is opened.'),
  ('canon','exodus',26,33,'canon','hebrews',10,19,'free',
    E'*Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus)* (Hebrews 10:19). Where the vail *divide unto you between the holy place and the most holy* (Exodus 26:33), the barrier kept Yashar''el (Israel) out of the most holy; the blood of the Formed Son gives bold entrance into the very place the vail once closed.'),
  ('canon','exodus',26,33,'canon','hebrews',9,3,'free',
    E'*And after the second veil, the tabernacle which is called the Holiest of all* (Hebrews 9:3). This names exactly the partition of Exodus 26:33 — *the vail shall divide unto you between the holy place and the most holy* — the second curtain guarding the Holiest, the very veil later torn open.'),
  ('canon','exodus',26,33,'canon','hebrews',9,8,'free',
    E'*The Ruach HaKodesh (Holy Spirit) this signifying, that the way into the holiest of all was not yet made manifest, while as the first tabernacle was yet standing* (Hebrews 9:8). The dividing vail of Exodus 26:33 was itself the sign that *the way* was not yet open — a closed door declaring a coming opening.'),
  ('canon','exodus',26,33,'canon','matthew',27,51,'free',
    E'*And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent* (Matthew 27:51). At the death of the Formed Son the very vail that *divide... between the holy place and the most holy* (Exodus 26:33) was torn from the top down — by Yahuah''s hand, not man''s — the barrier abolished, the Presence opened.'),
  ('canon','exodus',26,33,'canon','mark',15,38,'free',
    E'*And the veil of the temple was rent in twain from the top to the bottom* (Mark 15:38). The second witness to the tearing of the curtain of Exodus 26:33: the partition between *the holy place and the most holy* is split open at the moment the flesh of the Messiah is given.'),

  -- THREAD 2: couple the tent that it may be one — the pattern in the mount (26:6,11,30)
  ('canon','exodus',26,6,'canon','exodus',25,9,'free',
    E'*According to all that I shew thee, after the pattern of the tabernacle, and the pattern of all the instruments thereof, even so shall ye make it* (Exodus 25:9). The curtains coupled with taches of gold *and it shall be one tabernacle* (Exodus 26:6) are no human design — every coupling answers a heavenly pattern Moses was shown.'),
  ('canon','exodus',26,30,'canon','exodus',25,40,'free',
    E'*And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). The charge to *rear up the tabernacle according to the fashion thereof which was shewed thee in the mount* (Exodus 26:30) echoes the same command — the earthly dwelling is a copy of what already stands above.'),
  ('canon','exodus',26,30,'canon','hebrews',8,5,'free',
    E'*Who serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). Hebrews quotes the mount-pattern charge of Exodus 26:30 directly: the tabernacle is the *shadow* of the true sanctuary in the heavens.'),
  ('canon','exodus',26,30,'canon','hebrews',9,23,'free',
    E'*It was therefore necessary that the patterns of things in the heavens should be purified with these; but the heavenly things themselves with better sacrifices than these* (Hebrews 9:23). The tabernacle built *according to the fashion... shewed thee in the mount* (Exodus 26:30) is named here a *pattern of things in the heavens* — the copy points to a greater original.'),
  ('canon','exodus',26,30,'canon','hebrews',9,24,'free',
    E'*For Messiah (Christ) is not entered into the holy places made with hands, which are the figures of the true; but into heaven itself, now to appear in the presence of Elohim (God) for us* (Hebrews 9:24). The mount-pattern tabernacle of Exodus 26:30 is the *figure of the true*; the Formed Son passes into the heavenly sanctuary the earthly one was copied from.'),

  -- THREAD 3: cherubims of cunning work — guarding the way to the Presence (26:1,31)
  ('canon','exodus',26,1,'canon','genesis',3,24,'free',
    E'*So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). The cherubim woven into the curtains *of cunning work* (Exodus 26:1) carry the Eden image forward: the same guardians who kept the way to the tree of life now stand woven across the dwelling, marking the holy ground a sinner cannot freely tread.'),
  ('canon','exodus',26,31,'canon','genesis',3,24,'free',
    E'*And he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). The vail *with cherubims shall it be made* (Exodus 26:31) sets the same Eden guardians upon the curtain before the most holy — the way to the Presence is once again guarded, until the flesh of the Messiah opens it.'),
  ('canon','exodus',26,31,'canon','ezekiel',1,5,'free',
    E'*Also out of the midst thereof came the likeness of four living creatures. And this was their appearance; they had the likeness of a man* (Ezekiel 1:5). The cherubim figured into the vail *with cherubims shall it be made* (Exodus 26:31) are no mere ornament — Ezekiel sees the living cherubim themselves bearing the throne-chariot of the Glory.'),
  ('canon','exodus',26,31,'canon','ezekiel',10,1,'free',
    E'*Then I looked, and, behold, in the firmament that was above the head of the cherubims there appeared over them as it were a sapphire stone, as the appearance of the likeness of a throne* (Ezekiel 10:1). The woven cherubim of Exodus 26:31 picture the real cherubim over whom the throne of Yahuah rests — the dwelling''s embroidery mirrors the heavenly attendants of the Presence.'),
  ('canon','exodus',26,1,'canon','1-kings',6,29,'free',
    E'*And he carved all the walls of the house round about with carved figures of cherubims and palm trees and open flowers, within and without* (1 Kings 6:29). When the tabernacle gave way to the temple, the cherubim *of cunning work* (Exodus 26:1) were carved into the very walls — the same guardian-pattern carried from the curtains into the house of cedar.'),
  ('canon','exodus',26,31,'canon','hebrews',9,5,'free',
    E'*And over it the cherubims of glory shadowing the mercyseat; of which we can not now speak particularly* (Hebrews 9:5). The cherubim woven into the vail *with cherubims shall it be made* (Exodus 26:31) are named *the cherubims of glory* overshadowing the place of atonement — guarding the throne-seat of mercy.'),
  ('canon','exodus',26,31,'canon','revelation',4,8,'free',
    E'*And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). The cherubim figured in the vail (Exodus 26:31) appear at last living before the throne itself — what was embroidery in the dwelling is the unending praise of the heavenly sanctuary.'),

  -- THREAD 4: that I may dwell among them — the shakan, Yahuah tabernacling with his people (26:1,6)
  ('canon','exodus',26,1,'canon','exodus',25,8,'free',
    E'*And let them make me a sanctuary; that I may dwell among them* (Exodus 25:8). The whole work of the ten curtains *of fine twined linen* (Exodus 26:1) serves one purpose declared at the outset — that Yahuah might dwell in the midst of his people; the tabernacle is the place of the indwelling.'),
  ('canon','exodus',26,6,'canon','john',1,14,'free',
    E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). The curtains coupled *that it may be one tabernacle* (Exodus 26:6) foreshadow the Formed Son tabernacling in flesh — the Word pitched his tent among Yashar''el (Israel), the true dwelling the curtains pictured.'),
  ('canon','exodus',26,6,'canon','revelation',21,3,'free',
    E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The one tabernacle of Exodus 26:6 reaches its end here — no longer a tent of curtains but the eternal dwelling of Yahuah with his restored people.'),
  ('canon','exodus',26,1,'apocrypha','the-wisdom-of-solomon',9,8,'extras',
    E'*You have commanded me to build a temple upon your holy mount, and an altar in the city in which you dwellest, a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8). Solomon confesses what Exodus 26:1 begins — the sanctuary is *a resemblance of the holy tabernacle* prepared from the beginning, the earthly curtains copying a dwelling that stood before the world.'),

  -- THREAD 5: the sockets of silver — the dwelling rests on the ransom of souls (26:19,21,25)
  ('canon','exodus',26,19,'canon','exodus',30,12,'free',
    E'*When thou takest the sum of the children of Yashar''el (Israel) after their number, then shall they give every man a ransom for his soul unto Yahuah (LORD)... that there be no plague among them* (Exodus 30:12). The *forty sockets of silver* (Exodus 26:19) on which the boards stand were not raw bullion but the ransom-money of every soul — the dwelling rests upon redemption paid.'),
  ('canon','exodus',26,19,'canon','exodus',30,16,'free',
    E'*And thou shalt take the atonement money of the children of Yashar''el (Israel), and shalt appoint it for the service of the tabernacle of the congregation; that it may be a memorial unto the children of Yashar''el (Israel) before Yahuah (LORD), to make an atonement for your souls* (Exodus 30:16). The silver beneath the boards (Exodus 26:19) is named *atonement money* — the very foundation of the sanctuary is a standing memorial of atonement.'),
  ('canon','exodus',26,25,'canon','exodus',38,27,'free',
    E'*And of the hundred talents of silver were cast the sockets of the sanctuary, and the sockets of the vail; an hundred sockets of the hundred talents, a talent for a socket* (Exodus 38:27). The *sixteen sockets* of silver (Exodus 26:25) are accounted here: every socket of the sanctuary and of the vail was cast from the ransom-silver — the whole structure footed upon the price of redeemed souls.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-26-the-vail-that-is-to-say-his-flesh',
  E'The vail, that is to say, his flesh',
  E'*And thou shalt make a vail of blue, and purple, and scarlet, and fine twined linen of cunning work: with cherubims shall it be made* (Exodus 26:31) — *and the vail shall divide unto you between the holy place and the most holy* (Exodus 26:33). The curtain stood as the barrier no man could cross into the Presence; the high priest passed it once a year, with blood. Hebrews reads the partition as a sign waiting to be undone: *The Ruach HaKodesh (Holy Spirit) this signifying, that the way into the holiest of all was not yet made manifest, while as the first tabernacle was yet standing* (Hebrews 9:8), the curtain itself named *the second veil, the tabernacle which is called the Holiest of all* (Hebrews 9:3). Then the body of the Formed Son is given, and the way opens: *Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus), by a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh* (Hebrews 10:19-20). The flesh of the Messiah is the curtain — and at his death *the veil of the temple was rent in twain from the top to the bottom* (Matthew 27:51; Mark 15:38), torn by Yahuah''s own hand from above, the barrier of Exodus 26:33 abolished and the most holy thrown open.',
  sv.verse_id, ev.verse_id, 'free', 29625
  FROM _s305_ex26_lookup sv, _s305_ex26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=26 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-26-couple-the-tent-that-it-may-be-one-pattern',
  E'Couple the tent that it may be one — the pattern in the mount',
  E'The ten curtains are joined with loops and *fifty taches of gold... and it shall be one tabernacle* (Exodus 26:6); the goats'' hair covering is coupled *that it may be one* (Exodus 26:11); and the whole is reared *according to the fashion thereof which was shewed thee in the mount* (Exodus 26:30). The dwelling is made ONE because it copies one heavenly original: *According to all that I shew thee, after the pattern of the tabernacle, and the pattern of all the instruments thereof, even so shall ye make it* (Exodus 25:9) — *look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). Hebrews quotes the charge directly: *as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The tent is *the example and shadow of heavenly things*, the *patterns of things in the heavens* (Hebrews 9:23), *the figures of the true* into which the Formed Son entered — *not into the holy places made with hands... but into heaven itself* (Hebrews 9:24). Every coupling on earth answers a sanctuary that already stands above.',
  sv.verse_id, ev.verse_id, 'free', 29628
  FROM _s305_ex26_lookup sv, _s305_ex26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=26 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-26-cherubims-of-cunning-work-keep-the-way',
  E'Cherubims of cunning work — guarding the way to the Presence',
  E'The curtains are woven *with cherubims of cunning work* (Exodus 26:1), and upon the vail before the most holy *with cherubims shall it be made* (Exodus 26:31). These are no mere ornament — they are the Eden guardians carried forward. When the man was driven out, Yahuah Elohim *placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24); now the same guardians are figured across the dwelling and across the curtain that closes the Presence, declaring that the way to Yahuah is guarded. Ezekiel sees the living cherubim themselves — *the likeness of four living creatures* (Ezekiel 1:5), with the throne *above the head of the cherubims* (Ezekiel 10:1); Solomon carved them *round about... within and without* the temple walls (1 Kings 6:29); Hebrews names them *the cherubims of glory shadowing the mercyseat* (Hebrews 9:5). At the last they stand living before the throne: *they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty* (Revelation 4:8). What was embroidery in the tent is the unceasing worship of the heavenly sanctuary.',
  sv.verse_id, ev.verse_id, 'free', 29631
  FROM _s305_ex26_lookup sv, _s305_ex26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=26 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-26-that-i-may-dwell-among-them-the-shakan',
  E'That I may dwell among them — the dwelling of Yahuah with his people',
  E'All the labour of the *ten curtains of fine twined linen* (Exodus 26:1), coupled *that it may be one tabernacle* (Exodus 26:6), serves a single purpose spoken at the start of the work: *And let them make me a sanctuary; that I may dwell among them* (Exodus 25:8). The tabernacle is the place of the indwelling — Yahuah pitching his dwelling in the midst of Yashar''el (Israel). It foreshadows the Formed Son who tabernacled in flesh: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14) — the Word pitched his tent among the people, the true dwelling the curtains pictured. Solomon confesses the sanctuary is *a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8), a copy of a dwelling older than the world. And it reaches its end where the curtains give way to the eternal Presence: *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them* (Revelation 21:3).',
  sv.verse_id, ev.verse_id, 'extras', 29634
  FROM _s305_ex26_lookup sv, _s305_ex26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=26 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-26-the-sockets-of-silver-the-ransom-of-souls',
  E'The sockets of silver — the dwelling rests on the ransom of souls',
  E'The boards of shittim wood stand not on bare earth but on silver: *forty sockets of silver under the twenty boards* (Exodus 26:19), and again *eight boards, and their sockets of silver, sixteen sockets* (Exodus 26:25). That silver was no ordinary metal. When the people were numbered, every man gave *a ransom for his soul unto Yahuah (LORD)... that there be no plague among them* (Exodus 30:12); it is named *the atonement money of the children of Yashar''el (Israel)... a memorial... before Yahuah (LORD), to make an atonement for your souls* (Exodus 30:16). And the book of the work accounts it plainly: *of the hundred talents of silver were cast the sockets of the sanctuary, and the sockets of the vail; an hundred sockets of the hundred talents, a talent for a socket* (Exodus 38:27). The whole tabernacle is footed upon the price of redeemed souls — the dwelling of Yahuah rests, board by board, upon atonement paid.',
  sv.verse_id, ev.verse_id, 'free', 29637
  FROM _s305_ex26_lookup sv, _s305_ex26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=26 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- thread_members
-- ============================================================
-- THREAD 1: the vail, that is to say, his flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*through the veil, that is to say, his flesh* (Hebrews 10:20) — the curtain of Exodus 26:31 read as the flesh of the Formed Son, the way opened.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=31
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-the-vail-that-is-to-say-his-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*boldness to enter into the holiest by the blood of Yahusha (Jesus)* (Hebrews 10:19) — the vail that divided (Exodus 26:33) now passed by blood.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=33
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-the-vail-that-is-to-say-his-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the second veil, the tabernacle which is called the Holiest of all* (Hebrews 9:3) — names the very partition of Exodus 26:33.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=33
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-the-vail-that-is-to-say-his-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the way into the holiest of all was not yet made manifest, while as the first tabernacle was yet standing* (Hebrews 9:8) — the dividing vail (Exodus 26:33) was the sign of a closed way.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=33
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-the-vail-that-is-to-say-his-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the veil of the temple was rent in twain from the top to the bottom* (Matthew 27:51) — the barrier of Exodus 26:33 torn open at the Messiah''s death.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=33
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-the-vail-that-is-to-say-his-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the veil of the temple was rent in twain from the top to the bottom* (Mark 15:38) — second witness to the tearing of the curtain of Exodus 26:33.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=33
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=15 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-the-vail-that-is-to-say-his-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: couple the tent that it may be one — the pattern
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*after the pattern of the tabernacle... even so shall ye make it* (Exodus 25:9) — the one tabernacle of Exodus 26:6 copies a heavenly design.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=6
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-couple-the-tent-that-it-may-be-one-pattern'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*make them after their pattern, which was shewed thee in the mount* (Exodus 25:40) — echoes the mount-charge of Exodus 26:30.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=30
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-couple-the-tent-that-it-may-be-one-pattern'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5) — quotes Exodus 26:30; the tabernacle a shadow of heavenly things.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=30
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-couple-the-tent-that-it-may-be-one-pattern'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the patterns of things in the heavens* (Hebrews 9:23) — the mount-pattern tent of Exodus 26:30 is a copy of the heavenly.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=30
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-couple-the-tent-that-it-may-be-one-pattern'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the holy places made with hands, which are the figures of the true* (Hebrews 9:24) — the Formed Son enters the heaven the tent (Exodus 26:30) figured.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=30
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-couple-the-tent-that-it-may-be-one-pattern'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: cherubims of cunning work
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Cherubims, and a flaming sword... to keep the way of the tree of life* (Genesis 3:24) — the Eden guardians woven into the curtains of Exodus 26:1.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=1
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-cherubims-of-cunning-work-keep-the-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Cherubims... to keep the way of the tree of life* (Genesis 3:24) — the same guardians set upon the vail of Exodus 26:31 before the most holy.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=31
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-cherubims-of-cunning-work-keep-the-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the likeness of four living creatures* (Ezekiel 1:5) — the living cherubim the vail of Exodus 26:31 only figured.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=31
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-cherubims-of-cunning-work-keep-the-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*above the head of the cherubims... the likeness of a throne* (Ezekiel 10:1) — the throne rests over the cherubim the vail (Exodus 26:31) pictures.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=31
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-cherubims-of-cunning-work-keep-the-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*carved figures of cherubims... within and without* (1 Kings 6:29) — the curtain-cherubim of Exodus 26:1 carved into the temple walls.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=1
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=6 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-cherubims-of-cunning-work-keep-the-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the cherubims of glory shadowing the mercyseat* (Hebrews 9:5) — the woven cherubim of Exodus 26:31 named, overshadowing the seat of atonement.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=31
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-cherubims-of-cunning-work-keep-the-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*they rest not day and night, saying, Holy, holy, holy* (Revelation 4:8) — the cherubim of Exodus 26:31 living at last before the throne.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=31
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-cherubims-of-cunning-work-keep-the-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: that I may dwell among them — the shakan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*let them make me a sanctuary; that I may dwell among them* (Exodus 25:8) — the purpose of the curtains of Exodus 26:1: Yahuah dwelling among his people.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=1
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-that-i-may-dwell-among-them-the-shakan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the Word was made flesh, and dwelt among us* (John 1:14) — the one tabernacle of Exodus 26:6 fulfilled in the Formed Son tabernacling in flesh.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=6
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-that-i-may-dwell-among-them-the-shakan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the tabernacle of Elohim (God) is with men, and he will dwell with them* (Revelation 21:3) — the one tabernacle of Exodus 26:6 made the eternal dwelling.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=6
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-that-i-may-dwell-among-them-the-shakan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8) — the curtains of Exodus 26:1 copy a dwelling older than the world.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=1
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-that-i-may-dwell-among-them-the-shakan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: the sockets of silver — the ransom of souls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*every man a ransom for his soul unto Yahuah (LORD)* (Exodus 30:12) — the silver beneath the boards of Exodus 26:19 is the ransom of souls.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=19
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-the-sockets-of-silver-the-ransom-of-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the atonement money... to make an atonement for your souls* (Exodus 30:16) — the sockets of Exodus 26:19 footed on atonement money.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=19
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-the-sockets-of-silver-the-ransom-of-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*of the hundred talents of silver were cast the sockets of the sanctuary, and the sockets of the vail* (Exodus 38:27) — the sockets of Exodus 26:25 cast from the ransom-silver.'
  FROM cross_reference_threads t
  JOIN _s305_ex26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=26 AND sv.verse_number=25
  JOIN _s305_ex26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=38 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-26-the-sockets-of-silver-the-ransom-of-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
