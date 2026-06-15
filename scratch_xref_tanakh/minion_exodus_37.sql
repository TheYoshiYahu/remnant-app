-- ----- fragment: minion_exodus_37.sql (Exodus 37) -----
-- Exodus 37 — Bezalel MAKES the holy-place furniture (the command of ch25/30 executed)
-- Tag: ex37   Session prefix: s305   Sort band: 29900 step +3
-- Temp view: _s305_ex37_lookup
--
-- Exodus 37 coverage:
--   v.1-9   THE ARK & THE MERCY SEAT MADE (cherubim covering, faces toward the mercy seat)
--           NT:     Romans 3:25 (propitiation/mercy-seat in his blood); Hebrews 9:5 (cherubims of glory shadowing the mercyseat)
--           Tanakh: Leviticus 16:14-15 (blood on the mercy seat, Yom Kippur); Genesis 3:24 (cherubims guard the way to the tree of life)
--           Extras: none warranted (clean canon weave carries the atonement type)
--   v.10-16 THE TABLE OF SHEWBREAD MADE (bread of the Presence)
--           NT:     Matthew 12:3-4 (the Son of Adam, David ate the shewbread); John 6:35 (I am the bread of life)
--           Tanakh: Leviticus 24:5-9 (twelve cakes, everlasting covenant, most holy); 1 Samuel 21:6 (David given the hallowed shewbread)
--           Extras: none warranted (1 Macc held for the restoration thread)
--   v.17-24 THE PURE CANDLESTICK / MENORAH MADE (beaten gold, almond-bowls, seven lamps)
--           NT:     Revelation 1:20 (the seven golden candlesticks); John 8:12 (I am the light of the world)
--           Tanakh: Numbers 8:4 (menorah of beaten work, by the pattern shewn Moses); Numbers 17:8 (Aaron's rod budded almonds — chosen priesthood); Zechariah 4:6 (not by might, but by my spirit)
--           Extras: none warranted on the make (1 Macc held for the restoration thread)
--   v.25-29 THE INCENSE ALTAR & THE HOLY ANOINTING OIL & PURE INCENSE MADE
--           NT:     Revelation 8:3-4 (golden altar, incense with the prayers of the saints)
--           Tanakh: Psalm 141:2 (my prayer set forth as incense)
--           Extras: 1 Maccabees 4:49-50 (the restored candlestick, incense altar, table, lamps lit at the rededication — two-house restoration witness)
--
-- Threads (slug — libraries):
--   exodus-37-the-mercy-seat-made-the-place-of-atonement (free) — Tanakh + NT
--   exodus-37-the-table-of-shewbread-the-bread-of-the-presence (free) — Tanakh + NT
--   exodus-37-the-pure-candlestick-of-beaten-gold-the-light (free) — Tanakh + NT
--   exodus-37-the-golden-altar-of-incense-and-the-prayers-restored (extras) — Tanakh + NT + Apocrypha (1 Maccabees)
--
-- Framework notes: the mercy-seat = hilasterion (Rom 3:25) — the made-object IS the atonement type the
-- whole library fills; the shewbread = the Presence the Son of Adam, Lord of the sabbath, claims (Matt 12);
-- the menorah's almond-bowls bind to Aaron's budded rod (the chosen priesthood) and the Spirit (Zech 4),
-- the made lampstand the Light of the world fills; the 1 Macc rededication = the SAME furniture restored,
-- a two-house restoration witness that the appointed worship is never abolished.

CREATE TEMP VIEW _s305_ex37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THE ARK & THE MERCY SEAT MADE (37:1-9)
    ('canon','exodus',37,6,'canon','romans',3,25,'free',
     E'*Whom Elohim (God) hath set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins that are past, through the forbearance of Elohim (God)* (Romans 3:25). When Bezalel *made the mercy seat of pure gold* (Exodus 37:6), he was fashioning the very place the apostle names: the propitiation (the mercy-seat, hilasterion) where Yahuah (LORD) meets his people in covering blood — set forth at last in the Messiah''s own.'),
    ('canon','exodus',37,9,'canon','hebrews',9,5,'free',
     E'*And over it the cherubims of glory shadowing the mercyseat; of which we can not now speak particularly* (Hebrews 9:5). Bezalel made *the cherubims spread out their wings on high... even to the mercy seatward were the faces of the cherubims* (Exodus 37:9); the writer to the Hebrews looks straight back at this made object — the cherubim of glory over the place of atonement — as the standing pattern of the heavenly things.'),
    ('canon','exodus',37,9,'canon','leviticus',16,14,'free',
     E'*And he shall take of the blood of the bullock, and sprinkle it with his finger upon the mercy seat eastward; and before the mercy seat shall he sprinkle of the blood with his finger seven times* (Leviticus 16:14). The mercy seat *made... of pure gold* with its covering cherubim (Exodus 37:6-9) is built for one day — Yom Kippur, when atoning blood is sprinkled upon it; the furniture is the appointed-time worship in advance.'),
    ('canon','exodus',37,9,'canon','leviticus',16,15,'free',
     E'*Then shall he kill the goat of the sin offering, that is for the people, and bring his blood within the vail, and do with that blood as he did with the blood of the bullock, and sprinkle it upon the mercy seat, and before the mercy seat* (Leviticus 16:15). The cherubim whose *faces* are *to the mercy seatward* (Exodus 37:9) look down on the very spot where the blood for the whole people is brought within the vail — the heart of the Day of Atonement.'),
    ('canon','exodus',37,9,'canon','genesis',3,24,'free',
     E'*So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). The first cherubim guarded the way back to life; now cherubim are *made... on the two ends* of the mercy seat (Exodus 37:8) — the guarded way reopened, the place where Yahuah (LORD) again meets man over the covering blood.'),

    -- THE TABLE OF SHEWBREAD MADE (37:10-16)
    ('canon','exodus',37,16,'canon','leviticus',24,6,'free',
     E'*And thou shalt set them in two rows, six on a row, upon the pure table before Yahuah (LORD)... Every sabbath he shall set it in order before Yahuah (LORD) continually, being taken from the children of Yashar''el (Israel) by an everlasting covenant* (Leviticus 24:6,8). The table *made... of shittim wood* overlaid with gold and its *vessels... of pure gold* (Exodus 37:10-16) holds the bread of the Presence — twelve cakes for the twelve tribes, an everlasting-covenant sign, never abolished.'),
    ('canon','exodus',37,16,'canon','1-samuel',21,6,'free',
     E'*So the priest gave him hallowed bread: for there was no bread there but the shewbread, that was taken from before Yahuah (LORD), to put hot bread in the day when it was taken away* (1 Samuel 21:6). The shewbread the table was *made* to carry (Exodus 37:10-16) is the very bread David receives in his need — the loaves of the Presence sustaining the LORD''s anointed-to-be.'),
    ('canon','exodus',37,16,'canon','matthew',12,4,'free',
     E'*How he entered into the house of Elohim (God), and did eat the shewbread, which was not lawful for him to eat, neither for them which were with him, but only for the priests?* (Matthew 12:4). The Son of Adam, Lord of the sabbath, points to David and this shewbread — the bread the golden table was *made* to bear (Exodus 37:10-16) — to teach that mercy and the Presence are the heart of the Torah, not its overthrow.'),
    ('canon','exodus',37,16,'canon','john',6,35,'free',
     E'*And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (John 6:35). The table *made... of pure gold* to hold the continual bread before Yahuah (LORD) (Exodus 37:10-16) foreshadows the Presence become bread — the Formed Son who is himself the bread of life set before the people.'),

    -- THE PURE CANDLESTICK / MENORAH MADE (37:17-24)
    ('canon','exodus',37,17,'canon','numbers',8,4,'free',
     E'*And this work of the candlestick was of beaten gold, unto the shaft thereof, unto the flowers thereof, was beaten work: according unto the pattern which Yahuah (LORD) had shewed Moses, so he made the candlestick* (Numbers 8:4). Bezalel made the candlestick *of beaten work... of one beaten work of pure gold* (Exodus 37:17,22) — exactly the heavenly pattern shewn Moses; the lamp is no human design but the form revealed from above.'),
    ('canon','exodus',37,19,'canon','numbers',17,8,'free',
     E'*And, behold, the rod of Aaron for the house of Levi was budded, and brought forth buds, and bloomed blossoms, and yielded almonds* (Numbers 17:8). The candlestick''s *bowls made after the fashion of almonds... a knop and a flower* (Exodus 37:19) carry the same sign — the budding-almond of the chosen priesthood; the lamp that gives light is bound to the priesthood Yahuah (LORD) himself elected.'),
    ('canon','exodus',37,17,'canon','zechariah',4,6,'free',
     E'*Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The all-gold candlestick *made... of beaten work* (Exodus 37:17) becomes the prophet''s vision of the lampstand fed continually — its light burns *not by might, nor by power, but by my spirit*; the menorah is the Ruach HaKodesh (Holy Spirit) in figure.'),
    ('canon','exodus',37,23,'canon','revelation',1,20,'free',
     E'*The seven stars are the angels of the seven churches: and the seven candlesticks which thou sawest are the seven churches* (Revelation 1:20). Bezalel made *his seven lamps... of pure gold* (Exodus 37:23); the seven golden lampstands stand at last among the assemblies of the saints, the one menorah become seven before the throne — the light of the Presence kept burning among the gathered people.'),
    ('canon','exodus',37,23,'canon','john',8,12,'free',
     E'*Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12). The candlestick *made... of pure gold* with *his seven lamps* (Exodus 37:17,23) was the only light in the holy place; the Formed Son names himself the light it was made to foreshadow — the light of life for all who follow.'),

    -- THE INCENSE ALTAR & THE HOLY OIL & PURE INCENSE MADE (37:25-29)
    ('canon','exodus',37,25,'canon','psalms',141,2,'free',
     E'*Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2). The *incense altar* Bezalel *made... of shittim wood* overlaid with gold (Exodus 37:25-26) is built for the rising smoke that the psalmist reads as prayer ascending — the golden altar is intercession in figure.'),
    ('canon','exodus',37,29,'canon','revelation',8,3,'extras',
     E'*And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3). Bezalel made *the pure incense of sweet spices, according to the work of the apothecary* (Exodus 37:29); the same pure incense rises at last upon the golden altar before the throne, joined to the prayers of all the saints.'),
    ('canon','exodus',37,29,'canon','revelation',8,4,'extras',
     E'*And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). The *pure incense of sweet spices* made *according to the work of the apothecary* (Exodus 37:29) is no empty rite — its smoke ascends before Elohim (God) carrying the prayers of the saints; the made spice is the saints'' supplication.'),
    ('canon','exodus',37,29,'apocrypha','1-maccabees',4,49,'extras',
     E'*They made also new holy vessels, and into the temple they brought the candlestick, and the altar of burnt offerings, and of incense, and the table* (1 Maccabees 4:49). What Bezalel *made* — the candlestick, the incense altar, the table, the holy oil and pure incense (Exodus 37:17-29) — is the very furniture the faithful restore at the rededication; the appointed worship is taken up again, never abolished, a witness to the people gathered back.'),
    ('canon','exodus',37,29,'apocrypha','1-maccabees',4,50,'extras',
     E'*And upon the altar they burned incense, and the lamps that were upon the candlestick they lighted, that they might give light in the temple* (1 Maccabees 4:50). The pure incense and the lamps that Bezalel *made* (Exodus 37:23,29) burn again at the rededication — the incense rising, the menorah relit; the restored people resume the worship Yahuah (LORD) commanded from the first.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-37-the-mercy-seat-made-the-place-of-atonement',
       E'The Mercy Seat Made — the Place of Atonement',
       E'Bezalel *made the mercy seat of pure gold* and *made two cherubims of gold, beaten out of one piece... on the two ends of the mercy seat... even to the mercy seatward were the faces of the cherubims* (Exodus 37:6-9). This made object is the heart of the sanctuary: the covering over the testimony where Yahuah (LORD) meets his people. The whole library reads it as the place of atonement. On the Day of Atonement the blood is sprinkled here — *upon the mercy seat eastward... seven times* (Leviticus 16:14), and *the goat of the sin offering, that is for the people... sprinkle it upon the mercy seat* (Leviticus 16:15). The cherubim with downward faces recall the first cherubim who kept *the way of the tree of life* (Genesis 3:24): the guarded way to life reopened over covering blood. And the apostle names it directly — the Messiah is the one *Elohim (God) hath set forth to be a propitiation through faith in his blood* (Romans 3:25), the mercy-seat itself — while the writer to the Hebrews looks back at *the cherubims of glory shadowing the mercyseat* (Hebrews 9:5) as the standing pattern of the heavenly things. The furniture is the atonement, made in gold and waiting to be filled.',
       sv.verse_id, ev.verse_id, 'free', 29900
  FROM _s305_ex37_lookup sv, _s305_ex37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=37 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=37 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-37-the-table-of-shewbread-the-bread-of-the-presence',
       E'The Table of Shewbread Made — the Bread of the Presence',
       E'Bezalel *made the table of shittim wood... overlaid it with pure gold... and made the vessels which were upon the table... of pure gold* (Exodus 37:10-16) — the table for the bread of the Presence. The Torah sets the meaning: *two rows, six on a row, upon the pure table before Yahuah (LORD)... every sabbath he shall set it in order... by an everlasting covenant* (Leviticus 24:6,8) — twelve cakes for the twelve tribes, a perpetual statute. When David is in need, the priest gives him *the shewbread, that was taken from before Yahuah (LORD)* (1 Samuel 21:6); and the Son of Adam, Lord of the sabbath, points back to that very moment — *did eat the shewbread, which was not lawful for him to eat... but only for the priests* (Matthew 12:4) — to show that mercy and the Presence are the Torah''s heart, not its overthrow. At last the Presence itself becomes the bread: *I am the bread of life: he that cometh to me shall never hunger* (John 6:35). The golden table was made to hold him in figure.',
       sv.verse_id, ev.verse_id, 'free', 29903
  FROM _s305_ex37_lookup sv, _s305_ex37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=37 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=37 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-37-the-pure-candlestick-of-beaten-gold-the-light',
       E'The Pure Candlestick of Beaten Gold — the Light',
       E'Bezalel *made the candlestick of pure gold: of beaten work made he the candlestick*, with *bowls made after the fashion of almonds*, *his seven lamps... of pure gold*, *all of it... one beaten work of pure gold* (Exodus 37:17-24). The lamp is no human design: it was made *according unto the pattern which Yahuah (LORD) had shewed Moses* (Numbers 8:4), the heavenly form revealed from above. Its almond-bowls carry the sign of the chosen priesthood — *the rod of Aaron for the house of Levi was budded... and yielded almonds* (Numbers 17:8). And its burning is the Spirit: the prophet sees the all-gold lampstand fed continually and hears, *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The made lamp opens at last into the seven golden lampstands among the assemblies — *the seven candlesticks... are the seven churches* (Revelation 1:20) — and the Formed Son names himself the light it foreshadowed: *I am the light of the world... shall have the light of life* (John 8:12).',
       sv.verse_id, ev.verse_id, 'free', 29906
  FROM _s305_ex37_lookup sv, _s305_ex37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=37 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=37 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-37-the-golden-altar-of-incense-and-the-prayers-restored',
       E'The Golden Altar of Incense — the Prayers, and the Worship Restored',
       E'Bezalel *made the incense altar of shittim wood... overlaid it with pure gold... also he made the holy anointing oil, and the pure incense of sweet spices, according to the work of the apothecary* (Exodus 37:25-29). The rising smoke is read as prayer ascending: *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2). At the throne the figure is fulfilled — an angel with *much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3), and *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God)* (Revelation 8:4). And when the people are gathered back from exile and defilement, this very furniture is restored: *into the temple they brought the candlestick, and the altar of... incense, and the table* (1 Maccabees 4:49), and *upon the altar they burned incense, and the lamps that were upon the candlestick they lighted* (1 Maccabees 4:50). The appointed worship Yahuah (LORD) commanded from the first is taken up again, never abolished — a witness to a people restored.',
       sv.verse_id, ev.verse_id, 'extras', 29909
  FROM _s305_ex37_lookup sv, _s305_ex37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=37 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=37 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1: the mercy seat made
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (37,6,'canon','romans',3,25,1,E'*set forth to be a propitiation through faith in his blood* (Romans 3:25) — the made mercy-seat IS the propitiation the Messiah fills.'),
    (37,9,'canon','hebrews',9,5,2,E'*the cherubims of glory shadowing the mercyseat* (Hebrews 9:5) — the made cherubim as the pattern of heavenly things.'),
    (37,9,'canon','leviticus',16,14,3,E'*sprinkle... upon the mercy seat eastward... seven times* (Leviticus 16:14) — the made seat built for the Day of Atonement.'),
    (37,9,'canon','leviticus',16,15,4,E'*sprinkle it upon the mercy seat... for the people* (Leviticus 16:15) — atoning blood for the whole people on this very seat.'),
    (37,9,'canon','genesis',3,24,5,E'*Cherubims... to keep the way of the tree of life* (Genesis 3:24) — the guarded way to life reopened over the mercy seat.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-37-the-mercy-seat-made-the-place-of-atonement'
  JOIN _s305_ex37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=37 AND sv.verse_number=m.src_v
  JOIN _s305_ex37_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the table of shewbread
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (37,16,'canon','leviticus',24,6,1,E'*two rows, six on a row, upon the pure table... by an everlasting covenant* (Leviticus 24:6,8) — twelve cakes for the twelve tribes, perpetual.'),
    (37,16,'canon','1-samuel',21,6,2,E'*the priest gave him... the shewbread, that was taken from before Yahuah (LORD)* (1 Samuel 21:6) — the loaves sustaining the anointed-to-be.'),
    (37,16,'canon','matthew',12,4,3,E'*did eat the shewbread, which was not lawful... but only for the priests* (Matthew 12:4) — the Son of Adam: mercy and the Presence are the Torah''s heart.'),
    (37,16,'canon','john',6,35,4,E'*I am the bread of life: he that cometh to me shall never hunger* (John 6:35) — the Presence become bread, foreshadowed by the golden table.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-37-the-table-of-shewbread-the-bread-of-the-presence'
  JOIN _s305_ex37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=37 AND sv.verse_number=m.src_v
  JOIN _s305_ex37_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the pure candlestick
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (37,17,'canon','numbers',8,4,1,E'*according unto the pattern which Yahuah (LORD) had shewed Moses* (Numbers 8:4) — the beaten-gold lamp is the heavenly form revealed.'),
    (37,19,'canon','numbers',17,8,2,E'*the rod of Aaron... budded... and yielded almonds* (Numbers 17:8) — the almond-bowls carry the sign of the chosen priesthood.'),
    (37,17,'canon','zechariah',4,6,3,E'*Not by might, nor by power, but by my spirit* (Zechariah 4:6) — the all-gold lampstand is the Ruach HaKodesh (Holy Spirit) in figure.'),
    (37,23,'canon','revelation',1,20,4,E'*the seven candlesticks... are the seven churches* (Revelation 1:20) — the seven lamps among the gathered assemblies.'),
    (37,23,'canon','john',8,12,5,E'*I am the light of the world... shall have the light of life* (John 8:12) — the Formed Son the menorah was made to foreshadow.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-37-the-pure-candlestick-of-beaten-gold-the-light'
  JOIN _s305_ex37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=37 AND sv.verse_number=m.src_v
  JOIN _s305_ex37_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the golden altar of incense + restoration
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (37,25,'canon','psalms',141,2,1,E'*Let my prayer be set forth before thee as incense* (Psalm 141:2) — the rising smoke read as prayer ascending.'),
    (37,29,'canon','revelation',8,3,2,E'*much incense... with the prayers of all saints upon the golden altar* (Revelation 8:3) — the pure incense at the throne.'),
    (37,29,'canon','revelation',8,4,3,E'*the smoke of the incense... ascended up before Elohim (God)* (Revelation 8:4) — the made spice become the saints'' supplication.'),
    (37,29,'apocrypha','1-maccabees',4,49,4,E'*into the temple they brought the candlestick, and the altar of... incense, and the table* (1 Maccabees 4:49) — the made furniture restored at the rededication.'),
    (37,29,'apocrypha','1-maccabees',4,50,5,E'*they burned incense, and the lamps... they lighted* (1 Maccabees 4:50) — the appointed worship taken up again, never abolished.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-37-the-golden-altar-of-incense-and-the-prayers-restored'
  JOIN _s305_ex37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=37 AND sv.verse_number=m.src_v
  JOIN _s305_ex37_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
