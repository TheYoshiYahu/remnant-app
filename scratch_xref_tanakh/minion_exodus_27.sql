-- ----- fragment: minion_exodus_27.sql (Exodus 27) -----
-- Chapter: Exodus 27 — the brazen altar of burnt offering, the court, the oil for the lamp
-- Session prefix: s305   Tag: ex27   Temp view: _s305_ex27_lookup
-- Sort band: 29650 step +3   (29650, 29653, 29656, 29659)
-- Slugs all prefixed exodus-27- ; checked against EXISTING_SLUGS.txt (none present)
--
-- Exodus 27 coverage checklist:
--   v.1-8 (brazen altar, horns, brass, hollow with boards, pattern in the mount):
--        NT:     Hebrews 13:10 (we have an altar)  [thread 1]
--        Extras: Ecclesiasticus/Sirach 45:14 (consumed continually), 50:15 (blood poured at the foot of the altar)  [thread 1]
--        Tanakh: Leviticus 6:13 (fire never out), Numbers 21:9 (serpent of brass), Psalm 118:27 (horns of the altar),
--                1 Kings 1:50 + 2:28 (caught hold on the horns)  [thread 1]; Exodus 25:40 (pattern in the mount)  [thread 2]
--   v.9-19 (the court, fine twined linen, the ONE gate of the court 27:16):
--        NT:     John 10:9 (I am the door), John 14:6 (the way... no man cometh but by me), Revelation 19:8 (fine linen = righteousness)  [thread 3]
--        Extras: none warranted (no clean court/gate witness)
--        Tanakh: none warranted laterally beyond the NT door-fulfillment (court geometry is descriptive)
--   v.20-21 (pure beaten oil, the lamp to burn always, from evening to morning, a statute for ever):
--        NT:     John 8:12 (light of the world), Revelation 1:20 (seven lampstands), Matthew 25:1+4 (wise virgins with oil)  [thread 4]
--        Extras: none warranted (Sirach 45 is priesthood/sacrifice, not the lamp; quoted in thread 1)
--        Tanakh: Leviticus 24:2-4 (restated lamp statute), Zechariah 4:2+4:6 (lampstand fed by the Spirit), Psalm 119:105 (word a lamp)  [thread 4]
--
-- Threads (slug — target libraries):
--   exodus-27-the-brazen-altar-and-the-horns-of-atonement   — canon (Tanakh+NT) + apocrypha (Sirach)  => tier extras
--   exodus-27-after-the-pattern-shewed-thee-in-the-mount     — canon (Tanakh)  => tier free
--   exodus-27-the-one-gate-of-the-court-i-am-the-door        — canon (Tanakh+NT)  => tier free
--   exodus-27-the-lamp-to-burn-always-the-light-never-out    — canon (Tanakh+NT)  => tier free
--
-- Contested/load-bearing framing:
--   * 27:20-21 "a statute for ever unto their generations" — the perpetual light is Torah-permanent;
--     the NT (light of the world / seven lampstands / oil of the wise) FILLS it, never abolishes it.
--   * The brass throughout (altar, grate, sockets) read as judgment borne — bound to the serpent of brass
--     lifted up (Num 21:9), the Formed Son's once-for-all altar (Heb 13:10), NOT a defunct shadow.

CREATE TEMP VIEW _s305_ex27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the brazen altar and the horns of atonement (27:1-8)
    ('canon','exodus',27,2,'canon','numbers',21,9,'free',
      E'*And Moses made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived* (Numbers 21:9). The altar of burnt offering is *overlay[ed]... with brass* (Exodus 27:2) — the same metal of borne judgment lifted up; the place where sin is consumed and the smitten one who looks is healed.'),
    ('canon','exodus',27,2,'canon','psalms',118,27,'free',
      E'*Elohim (God) is Yahuah (LORD), which hath shewed us light: bind the sacrifice with cords, even unto the horns of the altar* (Psalm 118:27). *The horns of it upon the four corners thereof* (Exodus 27:2) are the very horns to which the festal sacrifice is bound — the appointed offering brought up to the place of atonement.'),
    ('canon','exodus',27,2,'canon','1-kings',1,50,'free',
      E'*And Adonijah feared because of Solomon, and arose, and went, and caught hold on the horns of the altar* (1 Kings 1:50). *The horns of it* (Exodus 27:2) become the place of refuge: the man under sentence flees to the horns of the altar to lay hold of mercy.'),
    ('canon','exodus',27,2,'canon','1-kings',2,28,'free',
      E'*And Joab fled unto the tabernacle of Yahuah (LORD), and caught hold on the horns of the altar* (1 Kings 2:28). Again *the horns* of Exodus 27:2 are gripped as sanctuary — the altar of atonement is where the guilty run to grasp at life.'),
    ('canon','exodus',27,1,'canon','leviticus',6,13,'free',
      E'*The fire shall ever be burning upon the altar; it shall never go out* (Leviticus 6:13). The altar of *shittim wood... overlay[ed]... with brass* (Exodus 27:1-2) carries a continual fire — the offering that never ceases, the perpetual approach of the covenant people.'),
    ('canon','exodus',27,1,'canon','hebrews',13,10,'free',
      E'*We have an altar, whereof they have no right to eat which serve the tabernacle* (Hebrews 13:10). The brazen *altar of shittim wood* (Exodus 27:1) is fulfilled in the Formed Son''s once-for-all altar — the same place of sacrifice, now the body offered without the gate.'),
    ('canon','exodus',27,1,'apocrypha','ecclesiasticus',45,14,'extras',
      E'*Their sacrifices shall be wholly consumed every day twice continually* (Ecclesiasticus 45:14). The Second-Temple memory holds the continual burnt offering of the *altar* (Exodus 27:1) as the priesthood''s unbroken daily service — atonement that never lapses.'),
    ('canon','exodus',27,1,'apocrypha','ecclesiasticus',50,15,'extras',
      E'*He stretched out his hand to the cup, and poured of the blood of the grape, he poured out at the foot of the altar a sweetsmelling savour to the most high King of all* (Ecclesiasticus 50:15). The high priest pouring at *the foot of the altar* remembers the brazen *altar of burnt offering* (Exodus 27:1) as the living centre of atoning worship.'),
    -- Thread 2: after the pattern shewed thee in the mount (27:8)
    ('canon','exodus',27,8,'canon','exodus',25,40,'free',
      E'*And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). *As it was shewed thee in the mount, so shall they make it* (Exodus 27:8) — the earthly altar and court copy a heavenly pattern; nothing in the dwelling is invented, all is given from above.'),
    -- Thread 3: the one gate of the court — I am the door (27:9-19)
    ('canon','exodus',27,16,'canon','john',10,9,'free',
      E'*I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture* (John 10:9). The court has but one *hanging for the gate... of blue, and purple, and scarlet* (Exodus 27:16) — a single appointed way of approach, filled in the Formed Son who is the door into the dwelling of Yahuah (LORD).'),
    ('canon','exodus',27,16,'canon','john',14,6,'free',
      E'*Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me* (John 14:6). The lone *gate of the court* (Exodus 27:16) declares one road in; there is no entrance to the Father except through the one whom the gate foreshadows.'),
    ('canon','exodus',27,9,'canon','revelation',19,8,'free',
      E'*And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8). The court walled with *hangings... of fine twined linen* (Exodus 27:9) pictures the set-apart righteousness that encloses the dwelling — the bride at last arrayed in the same fine linen.'),
    -- Thread 4: the lamp to burn always — the light never out (27:20-21)
    ('canon','exodus',27,20,'canon','leviticus',24,2,'free',
      E'*Command the children of Yashar''el (Israel), that they bring unto thee pure oil olive beaten for the light, to cause the lamps to burn continually* (Leviticus 24:2). The very charge of Exodus 27:20 — *pure oil olive beaten for the light, to cause the lamp to burn always* — is restated as a standing statute of the dwelling.'),
    ('canon','exodus',27,20,'canon','zechariah',4,2,'free',
      E'*I have looked, and behold a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon* (Zechariah 4:2). The lamp kept burning by *pure oil olive beaten* (Exodus 27:20) reappears in the prophet''s vision — the golden lampstand fed by an unfailing supply of oil.'),
    ('canon','exodus',27,20,'canon','zechariah',4,6,'free',
      E'*Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The oil that makes *the lamp to burn always* (Exodus 27:20) is read as the Ruach HaKodesh (Holy Spirit) — the witness kept alight not by human strength but by the Spirit of Yahuah (LORD).'),
    ('canon','exodus',27,20,'canon','psalms',119,105,'free',
      E'*Thy word is a lamp unto my feet, and a light unto my path* (Psalm 119:105). The perpetual *light* of Exodus 27:20 is the word of Yahuah (LORD) itself — the Torah-lamp that never goes dark for the one who walks by it.'),
    ('canon','exodus',27,20,'canon','john',8,12,'free',
      E'*I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12). The lamp that must *burn always* (Exodus 27:20) is filled in the Formed Son — the light of the dwelling now declared the light of the world.'),
    ('canon','exodus',27,21,'canon','revelation',1,20,'free',
      E'*The seven candlesticks which thou sawest are the seven churches* (Revelation 1:20). The lamp ordered *from evening to morning before Yahuah (LORD)... a statute for ever* (Exodus 27:21) opens out to the seven golden lampstands — the witness of the set-apart people kept burning to the end.'),
    ('canon','exodus',27,21,'canon','matthew',25,4,'free',
      E'*But the wise took oil in their vessels with their lamps* (Matthew 25:4). The charge to keep *the lamp to burn always* with *pure oil olive beaten* (Exodus 27:20-21) is the parable''s test: the wise are those who hold the oil so the light is not found extinguished when the bridegroom comes.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-27-the-brazen-altar-and-the-horns-of-atonement',
       E'The Brazen Altar and the Horns of Atonement',
       E'*And thou shalt make an altar of shittim wood... and thou shalt overlay it with brass* (Exodus 27:1-2). The first thing in the court is the place of blood — the altar of burnt offering, foursquare, horned at the four corners. The brass is the metal of borne judgment: *Moses made a serpent of brass, and put it upon a pole... when he beheld the serpent of brass, he lived* (Numbers 21:9). The fire on it never lapses — *The fire shall ever be burning upon the altar; it shall never go out* (Leviticus 6:13) — the continual approach of the covenant people, which the Second-Temple memory keeps: *Their sacrifices shall be wholly consumed every day twice continually* (Ecclesiasticus 45:14), and the high priest *poured out at the foot of the altar a sweetsmelling savour* (Ecclesiasticus 50:15). The *horns of it upon the four corners* (Exodus 27:2) are the place of refuge and of the bound offering: *bind the sacrifice with cords, even unto the horns of the altar* (Psalm 118:27); the man under sentence *caught hold on the horns of the altar* (1 Kings 1:50; 2:28) to lay hold of mercy. And the whole is filled in the Formed Son''s once-for-all altar: *We have an altar, whereof they have no right to eat which serve the tabernacle* (Hebrews 13:10). The Torah''s altar is not abolished — it is the very pattern of the atonement it foreshadowed.',
       sv.verse_id, ev.verse_id, 'extras', 29650
  FROM _s305_ex27_lookup sv, _s305_ex27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=27 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=27 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-27-after-the-pattern-shewed-thee-in-the-mount',
       E'After the Pattern Shewed Thee in the Mount',
       E'*Hollow with boards shalt thou make it: as it was shewed thee in the mount, so shall they make it* (Exodus 27:8). The altar and the court are not Moses'' design but a copy of a pattern given from above — the same charge that governs the whole dwelling: *And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). Nothing in the tabernacle is invented; every cubit answers to a heavenly original, and the earthly worship of Yahuah (LORD) is the shadow of a true and unseen sanctuary.',
       sv.verse_id, ev.verse_id, 'free', 29653
  FROM _s305_ex27_lookup sv, _s305_ex27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=27 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=27 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-27-the-one-gate-of-the-court-i-am-the-door',
       E'The One Gate of the Court — I Am the Door',
       E'The whole camp is ordered around the dwelling, walled with *hangings... of fine twined linen* (Exodus 27:9), and the court has but a single entrance: *for the gate of the court shall be an hanging of twenty cubits, of blue, and purple, and scarlet, and fine twined linen* (Exodus 27:16). One gate, one way of approach. The Formed Son declares himself that gate: *I am the door: by me if any man enter in, he shall be saved* (John 10:9); *I am the way, the truth, and the life: no man cometh unto the Father, but by me* (John 14:6). And the fine linen that walls the court is the set-apart righteousness that at last clothes the bride: *the fine linen is the righteousness of saints* (Revelation 19:8). The architecture preaches the gospel: there is one appointed door into the presence of Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 29656
  FROM _s305_ex27_lookup sv, _s305_ex27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=27 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=27 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-27-the-lamp-to-burn-always-the-light-never-out',
       E'The Lamp to Burn Always — the Light Never Out',
       E'*And thou shalt command the children of Yashar''el (Israel), that they bring thee pure oil olive beaten for the light, to cause the lamp to burn always... from evening to morning before Yahuah (LORD): it shall be a statute for ever unto their generations* (Exodus 27:20-21). The light must never go dark — a perpetual statute, restated word for word: *pure oil olive beaten for the light, to cause the lamps to burn continually* (Leviticus 24:2). The prophet sees the lampstand and learns what keeps it lit: *behold a candlestick all of gold... and his seven lamps thereon* (Zechariah 4:2), fed *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The oil is the word and the Spirit together: *Thy word is a lamp unto my feet, and a light unto my path* (Psalm 119:105). The Formed Son fills the lamp: *I am the light of the world: he that followeth me... shall have the light of life* (John 8:12); the lampstands become the witnessing people — *the seven candlesticks... are the seven churches* (Revelation 1:20); and the wise are those who keep the oil ready — *the wise took oil in their vessels with their lamps* (Matthew 25:4). The light Yahuah (LORD) commanded to burn always has never been put out.',
       sv.verse_id, ev.verse_id, 'free', 29659
  FROM _s305_ex27_lookup sv, _s305_ex27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=27 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=27 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: the brazen altar and the horns of atonement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',27,1,'canon','leviticus',6,13,1,E'*The fire shall ever be burning upon the altar; it shall never go out* (Leviticus 6:13) — the continual fire of the brazen altar.'),
    ('exodus',27,2,'canon','numbers',21,9,2,E'*Moses made a serpent of brass, and put it upon a pole... he lived* (Numbers 21:9) — the brass of borne judgment lifted up.'),
    ('exodus',27,2,'canon','psalms',118,27,3,E'*bind the sacrifice with cords, even unto the horns of the altar* (Psalm 118:27) — the offering bound to the horns.'),
    ('exodus',27,2,'canon','1-kings',1,50,4,E'*caught hold on the horns of the altar* (1 Kings 1:50) — the horns as the place of refuge.'),
    ('exodus',27,2,'canon','1-kings',2,28,5,E'*Joab fled unto the tabernacle... and caught hold on the horns of the altar* (1 Kings 2:28) — the guilty grasping at sanctuary.'),
    ('exodus',27,1,'canon','hebrews',13,10,6,E'*We have an altar, whereof they have no right to eat which serve the tabernacle* (Hebrews 13:10) — the Formed Son''s once-for-all altar.'),
    ('exodus',27,1,'apocrypha','ecclesiasticus',45,14,7,E'*Their sacrifices shall be wholly consumed every day twice continually* (Ecclesiasticus 45:14) — the unbroken daily offering.'),
    ('exodus',27,1,'apocrypha','ecclesiasticus',50,15,8,E'*he poured out at the foot of the altar a sweetsmelling savour* (Ecclesiasticus 50:15) — the high priest at the altar of atonement.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-27-the-brazen-altar-and-the-horns-of-atonement'
  JOIN _s305_ex27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=27 AND sv.verse_number=m.src_v
  JOIN _s305_ex27_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: after the pattern shewed thee in the mount
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',27,8,'canon','exodus',25,40,1,E'*make them after their pattern, which was shewed thee in the mount* (Exodus 25:40) — the same heavenly-pattern charge governing the whole dwelling.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-27-after-the-pattern-shewed-thee-in-the-mount'
  JOIN _s305_ex27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=27 AND sv.verse_number=m.src_v
  JOIN _s305_ex27_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the one gate of the court — I am the door
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',27,16,'canon','john',10,9,1,E'*I am the door: by me if any man enter in, he shall be saved* (John 10:9) — the one gate of the court filled.'),
    ('exodus',27,16,'canon','john',14,6,2,E'*no man cometh unto the Father, but by me* (John 14:6) — one appointed way of approach.'),
    ('exodus',27,9,'canon','revelation',19,8,3,E'*the fine linen is the righteousness of saints* (Revelation 19:8) — the fine twined linen of the court become the bride''s array.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-27-the-one-gate-of-the-court-i-am-the-door'
  JOIN _s305_ex27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=27 AND sv.verse_number=m.src_v
  JOIN _s305_ex27_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the lamp to burn always — the light never out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',27,20,'canon','leviticus',24,2,1,E'*pure oil olive beaten for the light, to cause the lamps to burn continually* (Leviticus 24:2) — the lamp statute restated.'),
    ('exodus',27,20,'canon','zechariah',4,2,2,E'*behold a candlestick all of gold... and his seven lamps thereon* (Zechariah 4:2) — the prophet''s lampstand fed with oil.'),
    ('exodus',27,20,'canon','zechariah',4,6,3,E'*Not by might, nor by power, but by my spirit* (Zechariah 4:6) — the oil read as the Ruach HaKodesh (Holy Spirit).'),
    ('exodus',27,20,'canon','psalms',119,105,4,E'*Thy word is a lamp unto my feet, and a light unto my path* (Psalm 119:105) — the perpetual light as the word of Yahuah (LORD).'),
    ('exodus',27,20,'canon','john',8,12,5,E'*I am the light of the world... shall have the light of life* (John 8:12) — the lamp filled in the Formed Son.'),
    ('exodus',27,21,'canon','revelation',1,20,6,E'*the seven candlesticks... are the seven churches* (Revelation 1:20) — the witnessing people kept burning.'),
    ('exodus',27,21,'canon','matthew',25,4,7,E'*the wise took oil in their vessels with their lamps* (Matthew 25:4) — the wise keep the oil so the light is not found out.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-27-the-lamp-to-burn-always-the-light-never-out'
  JOIN _s305_ex27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=27 AND sv.verse_number=m.src_v
  JOIN _s305_ex27_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
