-- =====================================================================
-- Session 338 — Zechariah FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session338_zechariah_cross_references.sql
-- =====================================================================

\echo 'session338 — Zechariah cross-references starting...'
BEGIN;

-- ----- fragment: minion_zechariah_1.sql (Zechariah 1) -----
-- Chapter: Zechariah 1 — THE CALL TO RETURN and THE NIGHT-VISION OF THE MAN AMONG THE MYRTLE
-- TREES. After the seventy years of indignation the word of Yahuah comes to Zechariah with the
-- covenant-return summons: *Turn ye unto me, saith Yahuah Tseva'ot (LORD of hosts), and I will
-- turn unto you* (1:3) — the two-house call home, the lawsuit of the former prophets renewed,
-- *Be ye not as your fathers* (1:4), for *my words and my statutes... did they not take hold of
-- your fathers?* (1:6) — Torah affirmed, never abolished. Then the first night-vision: *a man
-- riding upon a red horse... among the myrtle trees* (1:8), who is named *the angel of Yahuah
-- (LORD)* (1:11) — the Formed Son, the interceding Angel who bears the Name, the One who pleads
-- *O Yahuah Tseva'ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem... these
-- threescore and ten years?* (1:12). The answer is comfort: *I am returned to Jerusalem with
-- mercies... my cities through prosperity shall yet be spread abroad; and Yahuah (LORD) shall
-- yet comfort Zion, and shall yet choose Jerusalem* (1:16-17). The chapter closes with the four
-- horns that *scattered Yahudah (Judah), Yashar'el (Israel), and Jerusalem* (1:19) and the four
-- carpenters sent *to cast out the horns of the Gentiles* (1:21) — the scattering powers cast down.
-- Tag: zec01   Temp view: _s338_zec01_lookup
-- Sort band: base 45700, step 3 -> threads at 45700, 45703, 45706, 45709, 45712, 45715 (6 threads)
-- Source of EVERY row: 'canon','zechariah',1,v
--
-- Zechariah 1 coverage:
--   ★★ v.3 (Turn ye unto me, saith Yahuah Tseva'ot, and I will turn unto you)
--        NT:     ★ James 4:8 (Draw nigh to Elohim (God), and he will draw nigh to you) — THREAD 1
--        Extras: none warranted (the return-call is fully carried by the prophets + James)
--        Tanakh: ★★ Malachi 3:7 (Return unto me, and I will return unto you), ★ Joel 2:12-13
--                (turn ye even to me with all your heart... rend your heart) — THREAD 1
--   v.4-6 (Be ye not as your fathers... my words and my statutes... did they not take hold of
--          your fathers?)
--        NT:     none warranted distinct (Torah-lawsuit woven into THREAD 1 prose; the words
--                that overtook the fathers = the covenant-word standing, not abolished)
--        Extras: none warranted
--        Tanakh: woven into THREAD 1 (the former prophets' cry renewed; Torah affirmed)
--   ★★★ v.8-11 (a man riding upon a red horse... among the myrtle trees... the angel of Yahuah)
--        NT:     ★★ Revelation 6:1-8 (the four horsemen — white, red, black, pale — sent forth)
--                — THREAD 3 (the horsemen who walk the earth)
--        Extras: none warranted (no clean horsemen witness in the extras parse; the canon weave
--                Zechariah 6 + Revelation 6 carries it)
--        Tanakh: ★★ Exodus 23:20-21 (Behold, I send an Angel... my name is in him) — THREAD 2
--                (the Angel who bears the Name = the Formed Son); ★ Zechariah 6:5 (the four
--                spirits of the heavens, which go forth from standing before Yahuah) — THREAD 3
--   ★★★ v.11-13 (the angel of Yahuah... O Yahuah Tseva'ot, how long... have mercy on Jerusalem)
--        NT:     none warranted distinct (the interceding Angel = Formed Son woven into THREAD 2)
--        Extras: none warranted
--        Tanakh: Exodus 23:20-21 (THREAD 2 — the Angel who intercedes and bears the Name)
--   ★★ v.12 (these threescore and ten years — the seventy-years indignation)
--        NT:     none warranted distinct
--        Extras: none warranted
--        Tanakh: ★★ Jeremiah 29:10 (after seventy years... I will visit you), ★ Jeremiah 25:11
--                (these nations shall serve... seventy years), ★ Daniel 9:2 (the number of the
--                years... seventy years in the desolations of Jerusalem) — THREAD 4
--   ★★ v.16-17 (I am returned to Jerusalem with mercies... Yahuah shall yet comfort Zion, and
--          shall yet choose Jerusalem)
--        NT:     ★ Luke 1:68 (Blessed be Yahuah Elohim (the Lord God) of Yashar'el; for he hath
--                visited and redeemed his people), ★ Luke 21:24 (Jerusalem shall be trodden
--                down... until the times of the Gentiles be fulfilled) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 40:1-2 (Comfort ye, comfort ye my people... her warfare is
--                accomplished), ★ Isaiah 54:7-8 (For a small moment have I forsaken thee; but
--                with great mercies will I gather thee) — THREAD 5
--   v.14-15 (I am jealous for Jerusalem and for Zion with a great jealousy... very sore
--          displeased with the heathen that are at ease)
--        NT:     none warranted distinct (the jealousy/over-affliction is the preface to the
--                comfort of v.16-17; held in THREAD 5 prose)
--        Extras: none warranted
--        Tanakh: woven into THREAD 5
--   ★★ v.18-21 (four horns... which have scattered Yahudah, Yashar'el, and Jerusalem... four
--          carpenters... to cast out the horns of the Gentiles)
--        NT:     none warranted distinct (the scattering-powers-cast-down weave is Tanakh-borne)
--        Extras: none warranted
--        Tanakh: ★ Daniel 7:7-8 (a fourth beast... it had ten horns... another little horn),
--                ★★ Ezekiel 37:19,22 (the stick of Joseph... and the stick of Yahudah... make
--                them one stick... they shall be no more two nations), ★ Jeremiah 31:10 (He that
--                scattered Yashar'el will gather him) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. zechariah-1-turn-ye-unto-me-and-i-will-turn-unto-you — NT (James 4) + Tanakh (Malachi 3, Joel 2) [free]
--      (★★ the covenant-return call; the two-house summons home; Torah-lawsuit renewed, not abolished)
--   2. zechariah-1-the-angel-of-yahuah-among-the-myrtle-trees — Tanakh (Exodus 23) [free]
--      (★★★ the man/Angel of Yahuah who bears the Name = the Formed Son, the interceding Angel)
--   3. zechariah-1-the-horsemen-sent-to-walk-to-and-fro-through-the-earth — NT (Revelation 6) + Tanakh (Zechariah 6) [free]
--      (★★ the riders sent through the earth; the four spirits of heaven; Revelation's seal-horsemen)
--   4. zechariah-1-how-long-the-threescore-and-ten-years-indignation — Tanakh (Jeremiah 29, Jeremiah 25, Daniel 9) [free]
--      (★★ the seventy-years indignation; the Angel's intercession; the appointed end of exile)
--   5. zechariah-1-i-am-returned-to-jerusalem-with-mercies-comfort-zion — NT (Luke 1, Luke 21) + Tanakh (Isaiah 40, Isaiah 54) [free]
--      (★★ the comfort of Zion; mercy returned; Jerusalem chosen again — restoration, not replacement)
--   6. zechariah-1-the-four-horns-and-the-four-carpenters — Tanakh (Daniel 7, Ezekiel 37, Jeremiah 31) [free]
--      (★★ the powers that scattered both houses cast down; the two sticks made one)
--
-- Framing notes:
--   ★★ THE RETURN-CALL (THREAD 1): *Turn ye unto me, saith Yahuah Tseva'ot (LORD of hosts), and
--      I will turn unto you* (1:3) is the heart-beat of the whole prophetic corpus and the
--      two-house summons home. Malachi seals it with the same words — *Return unto me, and I
--      will return unto you* (Malachi 3:7) — and Joel calls the return inward — *turn ye even
--      to me with all your heart... rend your heart, and not your garments* (Joel 2:12-13).
--      James carries the same reciprocal motion forward — *Draw nigh to Elohim (God), and he
--      will draw nigh to you* (James 4:8). The *be ye not as your fathers* (1:4) and *my words
--      and my statutes... did they not take hold of your fathers?* (1:6) frame this as
--      covenant-lawsuit, NOT Torah-abolition: the word stood and overtook them; the call is to
--      keep it, not to be free of it.
--   ★★★ THE ANGEL OF YAHUAH (THREAD 2): *the man that stood among the myrtle trees* (1:10) is
--      named *the angel of Yahuah (LORD)* (1:11) — the visible One who bears the Name and
--      intercedes. Exodus names the pattern exactly: *Behold, I send an Angel before thee... my
--      name is in him* (Exodus 23:20-21). This is the Formed Son — the expressed Word drawn
--      from the Formless Father, who appeared and spoke and led Yashar'el, who is Yahuah and
--      HAS a Father. NOT a created messenger, NOT trinitarian co-equal persons, NOT a modalist
--      collapse: the Angel in whom the Name dwells, who pleads *how long wilt thou not have
--      mercy on Jerusalem* (1:12).
--   ★★ THE HORSEMEN (THREAD 3): *behold a man riding upon a red horse... and behind him were
--      there red horses, speckled, and white* (1:8) — *they whom Yahuah (LORD) hath sent to
--      walk to and fro through the earth* (1:10). Zechariah's own later vision names them — *the
--      four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the
--      earth* (Zechariah 6:5) — and Revelation opens the seals with the same colored riders
--      sent forth: white, red, black, pale (Revelation 6:1-8). One patrol of heaven, walking
--      the earth at the word of the Most High.
--   ★★ THE SEVENTY YEARS (THREAD 4): *how long... these threescore and ten years?* (1:12) is the
--      indignation Jeremiah measured — *after seventy years be accomplished at Babylon I will
--      visit you* (Jeremiah 29:10); *these nations shall serve the king of Babylon seventy
--      years* (Jeremiah 25:11) — and Daniel read and understood — *the number of the years...
--      seventy years in the desolations of Jerusalem* (Daniel 9:2). The Angel pleads the very
--      term, and its end is decreed.
--   ★★ COMFORT ZION (THREAD 5): *I am returned to Jerusalem with mercies... Yahuah (LORD) shall
--      yet comfort Zion, and shall yet choose Jerusalem* (1:16-17). Isaiah's comfort-word is
--      the same — *Comfort ye, comfort ye my people... her warfare is accomplished* (Isaiah
--      40:1-2); *For a small moment have I forsaken thee; but with great mercies will I gather
--      thee* (Isaiah 54:7-8). Luke sings it fulfilled — *Blessed be Yahuah Elohim (the Lord
--      God) of Yashar'el; for he hath visited and redeemed his people* (Luke 1:68) — yet a
--      treading remains *until the times of the Gentiles be fulfilled* (Luke 21:24). Mercy
--      returned, Jerusalem chosen AGAIN; restoration, never replacement.
--   ★★ THE FOUR HORNS (THREAD 6): *These are the horns which have scattered Yahudah (Judah),
--      Yashar'el (Israel), and Jerusalem* (1:19) — the powers that broke BOTH houses — and the
--      four carpenters *to cast out the horns of the Gentiles* (1:21). Daniel sees the same
--      horn-powers (Daniel 7:7-8); but the scattering is reversed in Ezekiel's two sticks — *I
--      will take the stick of Joseph... and the stick of Yahudah... and make them one stick...
--      they shall be no more two nations* (Ezekiel 37:19,22) — and Jeremiah's gathering promise
--      — *He that scattered Yashar'el (Israel) will gather him* (Jeremiah 31:10). The horns that
--      scattered are cast down; the two houses are made one.
--   VERSES WITH NO SEPARATE ADD: v.1,7 (the dating/superscription — the word coming to
--      Zechariah; held in prose), v.5 (Your fathers, where are they? — preface to the lawsuit
--      of THREAD 1), v.9,13,14 (the angel that talked with me / Yahuah's comfortable words —
--      woven into THREADS 2-5), v.15 (the heathen at ease — preface to the comfort of THREAD 5),
--      v.20 (Yahuah shewed me four carpenters — woven into THREAD 6). All recorded, none
--      silently skipped.

CREATE TEMP VIEW _s338_zec01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Turn ye unto me, and I will turn unto you — the covenant-return call
    ('canon','zechariah',1,3,'canon','malachi',3,7,'free',
      E'*Even from the days of your fathers ye are gone away from mine ordinances, and have not kept them. Return unto me, and I will return unto you, saith Yahuah Tseva''ot (LORD of hosts). But ye said, Wherein shall we return?* (Malachi 3:7). The summons *Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you* (Zechariah 1:3) is Malachi''s own word — the reciprocal covenant-return, the same departure from the ordinances and the same call home. Repentance is a turning back to the covenant-word, not away from it.'),
    ('canon','zechariah',1,3,'canon','joel',2,12,'free',
      E'*Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12). The *Turn ye unto me* of Zechariah 1:3 is the inward turning Joel commands — *with all your heart*. The two-house return is no formality; it is the whole heart turned back to Yahuah.'),
    ('canon','zechariah',1,3,'canon','joel',2,13,'free',
      E'*And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). *I will turn unto you* (Zechariah 1:3) rests on this: the One we turn to is *gracious and merciful, slow to anger*. The rent heart, not the torn garment, meets the mercy that turns back to His people.'),
    ('canon','zechariah',1,3,'canon','james',4,8,'free',
      E'*Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). The reciprocal motion of *Turn ye unto me... and I will turn unto you* (Zechariah 1:3) runs forward unbroken: *Draw nigh... and he will draw nigh to you*. The same covenant pattern — our turning answered by His — carried into the apostolic call to a cleansed and undivided heart.'),

    -- THREAD 2 (★★★): The Angel of Yahuah among the myrtle trees — the Formed Son who bears the Name
    ('canon','zechariah',1,11,'canon','exodus',23,20,'free',
      E'*Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20). *The man that stood among the myrtle trees* (Zechariah 1:10) is named *the angel of Yahuah (LORD)* (1:11) — the same sent Angel who led Yashar''el (Israel), the visible One who goes before His people. This is the Formed Son, the expressed Word drawn from the Formless Father, who appeared and spoke in the Tanakh.'),
    ('canon','zechariah',1,11,'canon','exodus',23,21,'free',
      E'*Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). The Angel of Yahuah who stands among the myrtle trees and intercedes (Zechariah 1:11-12) is the Angel in whom the Name dwells — *my name is in him*. He is no created messenger but the Formed Son who bears Yahuah''s own Name, who is Yahuah and HAS a Father; not a co-equal trinitarian person, not a modalist mask — the One the whole library calls the Angel of Yahuah.'),

    -- THREAD 3 (★★): The horsemen sent to walk to and fro through the earth
    ('canon','zechariah',1,10,'canon','zechariah',6,5,'free',
      E'*And the angel answered and said unto me, These are the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* (Zechariah 6:5). The riders *whom Yahuah (LORD) hath sent to walk to and fro through the earth* (Zechariah 1:10) are the same heavenly patrol Zechariah sees again as four chariots — *the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth*. One commission of heaven, going forth at the word of the Most High.'),
    ('canon','zechariah',1,8,'canon','revelation',6,4,'free',
      E'*And there went out another horse that was red: and power was given to him that sat thereon to take peace from the earth, and that they should kill one another: and there was given unto him a great sword* (Revelation 6:4). Zechariah''s *man riding upon a red horse... and behind him were there red horses, speckled, and white* (Zechariah 1:8) opens the same colored-horse vision the Lamb opens at the seals — the riders sent forth across the earth. The patrol of heaven in Zechariah and the seal-horsemen of Revelation share one image of the powers loosed and walking the earth at heaven''s word.'),
    ('canon','zechariah',1,10,'canon','revelation',6,8,'free',
      E'*And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8). The horses *sent to walk to and fro through the earth* (Zechariah 1:10) become, at the seals, the riders given *power... over the fourth part of the earth*. The same earth-traversing commission, now unsealed in the apocalyptic judgment.'),

    -- THREAD 4 (★★): How long — the threescore and ten years of indignation
    ('canon','zechariah',1,12,'canon','jeremiah',29,10,'free',
      E'*For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place* (Jeremiah 29:10). The Angel''s plea — *how long wilt thou not have mercy on Jerusalem... these threescore and ten years?* (Zechariah 1:12) — names the very term Jeremiah set: *after seventy years... I will visit you*. The indignation has a measure, and its end is the visiting mercy.'),
    ('canon','zechariah',1,12,'canon','jeremiah',25,11,'free',
      E'*And this whole land shall be a desolation, and an astonishment; and these nations shall serve the king of Babylon seventy years* (Jeremiah 25:11). The *threescore and ten years* of indignation (Zechariah 1:12) is Jeremiah''s decreed servitude — *these nations shall serve the king of Babylon seventy years*. The Angel intercedes at the close of the very span the prophet foretold.'),
    ('canon','zechariah',1,12,'canon','daniel',9,2,'free',
      E'*In the first year of his reign I Daniel understood by books the number of the years, whereof the word of Yahuah (LORD) came to Jeremiah the prophet, that he would accomplish seventy years in the desolations of Jerusalem* (Daniel 9:2). Daniel read the same *seventy years in the desolations of Jerusalem* that the Angel pleads in Zechariah 1:12 — *how long... these threescore and ten years?*. One appointed term, measured by Jeremiah, prayed over by Daniel, interceded for by the Angel of Yahuah.'),

    -- THREAD 5 (★★): I am returned to Jerusalem with mercies — comfort Zion
    ('canon','zechariah',1,16,'canon','isaiah',40,1,'free',
      E'*Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1). *I am returned to Jerusalem with mercies: my house shall be built in it* (Zechariah 1:16) is Isaiah''s comfort made good — *Comfort ye, comfort ye my people*. The God who returned with mercies is the God who commanded the comforting of His own.'),
    ('canon','zechariah',1,17,'canon','isaiah',40,2,'free',
      E'*Speak ye comfortably to Jerusalem, and cry unto her, that her warfare is accomplished, that her iniquity is pardoned: for she hath received of the LORD''S hand double for all her sins* (Isaiah 40:2). *Yahuah (LORD) shall yet comfort Zion, and shall yet choose Jerusalem* (Zechariah 1:17) speaks the same word — the warfare accomplished, the iniquity pardoned, Zion comforted. The indignation past, mercy speaks comfortably to Jerusalem.'),
    ('canon','zechariah',1,17,'canon','isaiah',54,7,'free',
      E'*For a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7). The *mercies* with which Yahuah returns to Jerusalem (Zechariah 1:16-17) are Isaiah''s gathering mercies — *with great mercies will I gather thee*. The forsaking was *but a little* (Zechariah 1:15); the gathering is great, and Zion is chosen again.'),
    ('canon','zechariah',1,17,'canon','luke',1,68,'free',
      E'*Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people* (Luke 1:68). The promise that *Yahuah (LORD) shall yet comfort Zion, and shall yet choose Jerusalem* (Zechariah 1:17) is sung as fulfilled when *he hath visited and redeemed his people*. The choosing of Jerusalem is no replacement of Yashar''el (Israel) but the visiting of the same covenant people.'),
    ('canon','zechariah',1,17,'canon','luke',21,24,'free',
      E'*And they shall fall by the edge of the sword, and shall be led away captive into all nations: and Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled* (Luke 21:24). *Yahuah (LORD) shall yet... choose Jerusalem* (Zechariah 1:17): even the treading has an appointed *until* — *until the times of the Gentiles be fulfilled* — after which the chosen city is comforted. The mercy of Zechariah''s vision is not cancelled by the treading but waits beyond it.'),

    -- THREAD 6 (★★): The four horns and the four carpenters — the scattering powers cast down
    ('canon','zechariah',1,18,'canon','daniel',7,7,'free',
      E'*After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth... and it had ten horns* (Daniel 7:7). The *four horns* Zechariah sees (Zechariah 1:18) are the horn-powers of the nations — the same beast-horns Daniel beholds in his night visions, the kingdoms that *have scattered Yahudah (Judah), Yashar''el (Israel), and Jerusalem* (1:19).'),
    ('canon','zechariah',1,19,'canon','ezekiel',37,19,'free',
      E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The horns *which have scattered Yahudah (Judah), Yashar''el (Israel), and Jerusalem* (Zechariah 1:19) broke BOTH houses; Ezekiel''s two sticks answer them — the stick of Joseph and the stick of Yahudah made *one stick* in His hand. The scattering is reversed in the regathering of the two houses.'),
    ('canon','zechariah',1,19,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The horns that scattered *Yahudah (Judah), Yashar''el (Israel)* (Zechariah 1:19) divided the people into two; the carpenters that cast them out (1:21) serve the end Ezekiel names — *one nation... they shall be no more two nations*. The two houses made one again.'),
    ('canon','zechariah',1,21,'canon','jeremiah',31,10,'free',
      E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). The carpenters come *to cast out the horns of the Gentiles, which lifted up their horn over the land of Yahudah (Judah) to scatter it* (Zechariah 1:21); Jeremiah names the gathering that follows the casting-down — *He that scattered Yashar''el (Israel) will gather him*. The scattering powers fall; the Shepherd gathers His flock.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-1-turn-ye-unto-me-and-i-will-turn-unto-you',
       E'Turn ye unto me, and I will turn unto you — the covenant-return call',
       E'After the seventy years, the word of Yahuah comes with a summons: *Therefore say thou unto them, Thus saith Yahuah Tseva''ot (LORD of hosts); Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 1:3). This is the two-house call home, and Zechariah frames it as covenant-lawsuit renewed, NOT Torah-abolition: *Be ye not as your fathers, unto whom the former prophets have cried, saying... Turn ye now from your evil ways* (1:4); *But my words and my statutes, which I commanded my servants the prophets, did they not take hold of your fathers?* (1:6). The word stood and overtook them — the call is to keep it, not to be free of it. Malachi seals the same reciprocal turning with the same words: *Return unto me, and I will return unto you, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 3:7). Joel calls the return inward: *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12); *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful* (Joel 2:13). And the same covenant pattern runs forward into the apostolic call: *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). One unbroken motion across the library — our turning answered by His.',
       sv.verse_id, ev.verse_id, 'free', 45700
  FROM _s338_zec01_lookup sv, _s338_zec01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-1-the-angel-of-yahuah-among-the-myrtle-trees',
       E'The Angel of Yahuah among the myrtle trees — the Formed Son who bears the Name',
       E'In the night-vision a Person stands among the trees: *I saw by night, and behold a man riding upon a red horse, and he stood among the myrtle trees that were in the bottom* (Zechariah 1:8). When he speaks and intercedes, he is named: *they answered the angel of Yahuah (LORD) that stood among the myrtle trees* (1:11); *Then the angel of Yahuah (LORD) answered and said, O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem* (1:12). This is the Angel of Yahuah — the visible One who bears the Name and pleads for His people. Exodus names the pattern exactly: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared. Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:20-21). *My name is in him* — this is no created messenger but the Formed Son, the expressed Word drawn from the Formless Father, the One who appeared and spoke and led Yashar''el (Israel) in the Tanakh, who is Yahuah and HAS a Father. Not a co-equal trinitarian person, not a modalist mask — the Angel in whom the Name dwells, standing among the myrtle trees, interceding for Jerusalem.',
       sv.verse_id, ev.verse_id, 'free', 45703
  FROM _s338_zec01_lookup sv, _s338_zec01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-1-the-horsemen-sent-to-walk-to-and-fro-through-the-earth',
       E'The horsemen sent to walk to and fro through the earth — heaven''s patrol and the seal-riders',
       E'Behind the man on the red horse ride others: *behind him were there red horses, speckled, and white* (Zechariah 1:8), and they are explained — *These are they whom Yahuah (LORD) hath sent to walk to and fro through the earth* (1:10); they report *We have walked to and fro through the earth, and, behold, all the earth sitteth still, and is at rest* (1:11). Zechariah''s own later vision names this heavenly company: *the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* (Zechariah 6:5). And the colored-horse vision opens again at the seals, where the Lamb sends forth the riders across the earth: the white, *and there went out another horse that was red: and power was given to him that sat thereon to take peace from the earth* (Revelation 6:4), the black, and *a pale horse... power was given unto them over the fourth part of the earth* (Revelation 6:8). One patrol of heaven, going forth at the word of the Most High — the horses that walk the earth in Zechariah and the seal-horsemen unsealed in Revelation are one apocalyptic image of the powers loosed at heaven''s command.',
       sv.verse_id, ev.verse_id, 'free', 45706
  FROM _s338_zec01_lookup sv, _s338_zec01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-1-how-long-the-threescore-and-ten-years-indignation',
       E'How long — the threescore and ten years of indignation',
       E'The Angel of Yahuah turns the vision into intercession: *Then the angel of Yahuah (LORD) answered and said, O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem and on the cities of Yahudah (Judah), against which thou hast had indignation these threescore and ten years?* (Zechariah 1:12). The *threescore and ten years* is the term Jeremiah measured: *after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place* (Jeremiah 29:10); *these nations shall serve the king of Babylon seventy years* (Jeremiah 25:11). Daniel read those same books and understood: *I Daniel understood by books the number of the years, whereof the word of Yahuah (LORD) came to Jeremiah the prophet, that he would accomplish seventy years in the desolations of Jerusalem* (Daniel 9:2). One appointed term — set by Jeremiah, prayed over by Daniel, pleaded by the Angel — and its end is the visiting mercy. The indignation is measured; it does not last for ever.',
       sv.verse_id, ev.verse_id, 'free', 45709
  FROM _s338_zec01_lookup sv, _s338_zec01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-1-i-am-returned-to-jerusalem-with-mercies-comfort-zion',
       E'I am returned to Jerusalem with mercies — the comfort of Zion',
       E'The answer to the Angel''s *how long* is comfort: *And Yahuah (LORD) answered the angel that talked with me with good words and comfortable words* (Zechariah 1:13). The word cried out is mercy returned: *Therefore thus saith Yahuah (LORD); I am returned to Jerusalem with mercies: my house shall be built in it, saith Yahuah Tseva''ot (LORD of hosts)* (1:16); *My cities through prosperity shall yet be spread abroad; and Yahuah (LORD) shall yet comfort Zion, and shall yet choose Jerusalem* (1:17). This is Isaiah''s comfort-word made good: *Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1); *Speak ye comfortably to Jerusalem... that her warfare is accomplished, that her iniquity is pardoned* (Isaiah 40:2); *For a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7). The forsaking was *but a little* (Zechariah 1:15); the gathering is great. Luke sings it fulfilled — *Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people* (Luke 1:68) — yet a treading remains with an appointed end: *Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled* (Luke 21:24). The choosing of Jerusalem is no replacement of Yashar''el (Israel) but the visiting of the same covenant people; mercy returned, Zion comforted, the city chosen AGAIN.',
       sv.verse_id, ev.verse_id, 'free', 45712
  FROM _s338_zec01_lookup sv, _s338_zec01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-1-the-four-horns-and-the-four-carpenters',
       E'The four horns and the four carpenters — the scattering powers cast down',
       E'The vision closes with the powers that broke the covenant-people and the smiths sent to break them: *Then lifted I up mine eyes, and saw, and behold four horns* (Zechariah 1:18); *These are the horns which have scattered Yahudah (Judah), Yashar''el (Israel), and Jerusalem* (1:19). Then *Yahuah (LORD) shewed me four carpenters* (1:20), come *to fray them, to cast out the horns of the Gentiles, which lifted up their horn over the land of Yahudah (Judah) to scatter it* (1:21). The horns are the nations'' beast-powers Daniel saw in his night visions: *behold a fourth beast, dreadful and terrible... and it had ten horns* (Daniel 7:7). But these horns scattered BOTH houses — *Yahudah (Judah), Yashar''el (Israel)* — and the scattering is reversed in Ezekiel''s two sticks: *Behold, I will take the stick of Joseph, which is in the hand of Ephraim... and will put them with him, even with the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19); *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). And Jeremiah names the gathering that follows the casting-down: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). The horns that scattered are cast down; the two houses are made one in His hand.',
       sv.verse_id, ev.verse_id, 'free', 45715
  FROM _s338_zec01_lookup sv, _s338_zec01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Return unto me, and I will return unto you, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 3:7) — Malachi seals the reciprocal covenant-return of Zechariah 1:3 with the same words.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-turn-ye-unto-me-and-i-will-turn-unto-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12) — the *Turn ye unto me* of Zechariah 1:3 is the whole-heart inward turning.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-turn-ye-unto-me-and-i-will-turn-unto-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And rend your heart, and not your garments... for he is gracious and merciful* (Joel 2:13) — *I will turn unto you* (Zechariah 1:3) rests on the mercy that meets the rent heart.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-turn-ye-unto-me-and-i-will-turn-unto-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Draw nigh to Elohim (God), and he will draw nigh to you* (James 4:8) — the reciprocal motion of Zechariah 1:3 carried forward into the apostolic call.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-turn-ye-unto-me-and-i-will-turn-unto-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Behold, I send an Angel before thee, to keep thee in the way* (Exodus 23:20) — the Angel of Yahuah among the myrtle trees (Zechariah 1:11) is the same sent One who led Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-the-angel-of-yahuah-among-the-myrtle-trees'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *obey his voice, provoke him not... for my name is in him* (Exodus 23:21) — the Angel of Yahuah who bears the Name is the Formed Son; not a created messenger, not co-equal persons, not a modalist mask.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-the-angel-of-yahuah-among-the-myrtle-trees'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *These are the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* (Zechariah 6:5) — the riders sent to walk the earth (Zechariah 1:10) seen again as heaven''s four-spirit patrol.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-the-horsemen-sent-to-walk-to-and-fro-through-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *there went out another horse that was red... power was given to him... to take peace from the earth* (Revelation 6:4) — Zechariah''s red, speckled and white horses (Zechariah 1:8) open the same colored-horse vision the Lamb unseals.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-the-horsemen-sent-to-walk-to-and-fro-through-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *a pale horse... power was given unto them over the fourth part of the earth* (Revelation 6:8) — the horses *sent to walk to and fro through the earth* (Zechariah 1:10) become the seal-riders loosed over the earth.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-the-horsemen-sent-to-walk-to-and-fro-through-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *after seventy years be accomplished at Babylon I will visit you* (Jeremiah 29:10) — the *threescore and ten years* the Angel pleads (Zechariah 1:12) is Jeremiah''s appointed term with its visiting mercy.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-how-long-the-threescore-and-ten-years-indignation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *these nations shall serve the king of Babylon seventy years* (Jeremiah 25:11) — the indignation of Zechariah 1:12 is the decreed servitude Jeremiah foretold.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-how-long-the-threescore-and-ten-years-indignation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *seventy years in the desolations of Jerusalem* (Daniel 9:2) — Daniel read by books the same term the Angel pleads in Zechariah 1:12.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-how-long-the-threescore-and-ten-years-indignation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Comfort ye, comfort ye my people, saith your Elohim (God)* (Isaiah 40:1) — *I am returned to Jerusalem with mercies* (Zechariah 1:16) is Isaiah''s comfort made good.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-i-am-returned-to-jerusalem-with-mercies-comfort-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *that her warfare is accomplished, that her iniquity is pardoned* (Isaiah 40:2) — *Yahuah shall yet comfort Zion* (Zechariah 1:17): the warfare past, the iniquity pardoned.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-i-am-returned-to-jerusalem-with-mercies-comfort-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *For a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7) — the forsaking was *but a little* (Zechariah 1:15); the gathering mercies are great.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-i-am-returned-to-jerusalem-with-mercies-comfort-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people* (Luke 1:68) — the choosing of Jerusalem (Zechariah 1:17) sung as the visiting of the same covenant people, not replacement.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=68
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-i-am-returned-to-jerusalem-with-mercies-comfort-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled* (Luke 21:24) — even the treading has an appointed *until*, after which the chosen city (Zechariah 1:17) is comforted.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-i-am-returned-to-jerusalem-with-mercies-comfort-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *behold a fourth beast, dreadful and terrible... and it had ten horns* (Daniel 7:7) — the *four horns* of Zechariah 1:18 are the nations'' beast-horn powers Daniel saw.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-the-four-horns-and-the-four-carpenters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will take the stick of Joseph... even with the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19) — the horns scattered BOTH houses (Zechariah 1:19); Ezekiel''s two sticks reverse it.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-the-four-horns-and-the-four-carpenters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the carpenters cast out the horns (Zechariah 1:21) toward the end Ezekiel names: the two houses made one.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-the-four-horns-and-the-four-carpenters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10) — the carpenters cast out the scattering horns (Zechariah 1:21); the Shepherd gathers His flock.'
  FROM cross_reference_threads t
  JOIN _s338_zec01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s338_zec01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-1-the-four-horns-and-the-four-carpenters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_2.sql (Zechariah 2) -----
-- Chapter: Zechariah 2 — THE UNWALLED CITY AND THE GLORY IN THE MIDST. The man with the measuring
-- line goes *To measure Jerusalem, to see what is the breadth thereof, and what is the length thereof*
-- (2:2), but the word that meets him overflows the measure: *Jerusalem shall be inhabited as towns
-- without walls for the multitude of men and cattle therein: For I, saith Yahuah (LORD), will be unto
-- her a wall of fire round about, and will be the glory in the midst of her* (2:4-5). The latter-day
-- city needs no wall and no temple because the Glory Himself is its wall and its light — the New
-- Jerusalem of Revelation 21, where *I saw no temple therein: for Yahuah Elohim (the Lord God) Almighty
-- and the Lamb are the temple of it* (Rev 21:22). The chapter then calls the scattered home: *Ho, ho,
-- come forth, and flee from the land of the north... Deliver thyself, O Zion, that dwellest with the
-- daughter of Babylon* (2:6-7) — the two-house regathering, answered forward by *Come out of her, my
-- people* (Rev 18:4). Yahuah guards His own jealously — *he that toucheth you toucheth the apple of his
-- eye* (2:8; Deut 32:10). And the nations are JOINED: *many nations shall be joined to Yahuah (LORD) in
-- that day, and shall be my people: and I will dwell in the midst of thee* (2:11) — the ingathering of
-- the wild branches into the one Yashar'el, NOT a replacement people. *Yahuah (LORD) shall inherit
-- Yahudah (Judah) his portion in the holy land, and shall choose Jerusalem again* (2:12), and all flesh
-- falls silent: *Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy
-- habitation* (2:13).
-- Tag: zec02   Temp view: _s338_zec02_lookup
-- Sort band: base 45725, step 3 -> threads at 45725, 45728, 45731, 45734, 45737 (5 threads)
-- Source of EVERY row: 'canon','zechariah',2,v
--
-- Zechariah 2 coverage:
--   v.1-3 (a man with a measuring line... To measure Jerusalem)
--        NT:     ★ Revelation 21:15-16 (a golden reed to measure the city) — woven into THREAD 1 (the
--                measured-yet-unwalled city)
--        Extras: none warranted (measuring-line is the preface; the Glory-city carries the weave)
--        Tanakh: held in prose (preface to the wall-of-fire word of v.4-5)
--   ★★★ v.4-5 (Jerusalem shall be inhabited as towns without walls... For I, saith Yahuah (LORD), will
--          be unto her a wall of fire round about, and will be the glory in the midst of her)
--        NT:     ★★★ Revelation 21:22-23 (I saw no temple therein... the glory of Elohim (God) did
--                lighten it), Revelation 21:2-3 (the holy city, new Jerusalem... the tabernacle of
--                Elohim with men), Revelation 21:11 (Having the glory of Elohim), Revelation 21:15-16
--                (measure the city) — THREAD 1
--        Extras: ★ Tobit 13:16 (Jerusalem shall be built up with sapphires and emeralds... walls and
--                towers... with pure gold) — THREAD 1
--        Tanakh: ★★ Isaiah 60:19 (the sun shall be no more thy light... but Yahuah shall be unto thee an
--                everlasting light), ★ Ezekiel 48:35 (the name of the city... Yahuah Shammah, The LORD
--                is there) — THREAD 1
--   ★★ v.6-7 (Ho, ho, come forth, and flee from the land of the north... Deliver thyself, O Zion, that
--          dwellest with the daughter of Babylon)
--        NT:     ★★ Revelation 18:4 (Come out of her, my people, that ye be not partakers of her sins)
--                — THREAD 2
--        Extras: none warranted distinct (the come-out-of-Babylon call is carried canon-to-canon)
--        Tanakh: ★★ Isaiah 48:20 (Go ye forth of Babylon, flee ye from the Chaldeans), ★ Isaiah 52:11
--                (Depart ye, depart ye, go ye out from thence, touch no unclean thing) — THREAD 2
--   ★ v.8-9 (he that toucheth you toucheth the apple of his eye)
--        NT:     none warranted distinct (the jealous-guard weave is Torah-rooted; carried in THREAD 3)
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 32:9-10 (Jacob is the lot of his inheritance... he kept him as the apple
--                of his eye) — THREAD 3
--   ★★ v.10-11 (Sing and rejoice, O daughter of Zion: for, lo, I come, and I will dwell in the midst of
--          thee... many nations shall be joined to Yahuah (LORD) in that day, and shall be my people)
--        NT:     ★ Revelation 21:3 (the tabernacle of Elohim is with men... they shall be his people)
--                — woven into THREAD 4 (the dwelling in the midst)
--        Extras: ★ Tobit 13:11 (Many nations shall come from far to the name of Yahuah (God) with gifts
--                in their hands) — THREAD 4
--        Tanakh: ★★ Zechariah 8:3 (I am returned unto Zion, and will dwell in the midst of Jerusalem),
--                ★★ Zechariah 8:22-23 (many people and strong nations shall come to seek Yahuah... ten
--                men shall take hold of the skirt of him that is a Yahudi) — THREAD 4
--   ★ v.12-13 (Yahuah (LORD) shall inherit Yahudah (Judah) his portion in the holy land, and shall
--          choose Jerusalem again... Be silent, O all flesh, before Yahuah (LORD))
--        NT:     none warranted distinct (the chosen-portion is held with the dwelling thread)
--        Extras: none warranted
--        Tanakh: ★ Habakkuk 2:20 (Yahuah is in his holy temple: let all the earth keep silence before
--                him) — THREAD 5 (the silence of all flesh before the raised-up Glory)
--
-- Threads (slug — target libraries):
--   1. zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst — NT (Revelation 21) + Tanakh (Isaiah 60,
--      Ezekiel 48) + Extras (Tobit 13) [extras]
--      (★★★ the unwalled city; the Glory Himself the wall and the light → New Jerusalem without temple)
--   2. zechariah-2-flee-from-the-land-of-the-north-deliver-thyself-o-zion — NT (Revelation 18) +
--      Tanakh (Isaiah 48, Isaiah 52) [free]
--      (★★ the regathering of the scattered two-house exiles; come out of Babylon)
--   3. zechariah-2-he-that-toucheth-you-toucheth-the-apple-of-his-eye — Tanakh (Deuteronomy 32) [free]
--      (★ Yahuah's jealous guard of His covenant people; the apple of His eye)
--   4. zechariah-2-many-nations-joined-to-yahuah-and-i-will-dwell-in-the-midst — Tanakh (Zechariah 8) +
--      Extras (Tobit 13) [extras]
--      (★★ the nations JOINED into the one Yashar'el — ingathering, NOT replacement; the dwelling in the midst)
--   5. zechariah-2-be-silent-o-all-flesh-he-is-raised-up — Tanakh (Habakkuk 2) [free]
--      (★ all flesh silent before the Glory raised up out of His holy habitation)
--
-- Framing notes:
--   ★★★ THE WALL OF FIRE (THREAD 1): the measuring man is sent *To measure Jerusalem* (2:2), but the
--      answer bursts the measure — *Jerusalem shall be inhabited as towns without walls... For I, saith
--      Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of
--      her* (2:4-5). The latter-day city has no wall because the Glory is the wall; it has no need of a
--      protecting circuit because Yahuah Himself encircles it in fire. Revelation shows the city
--      consummated on exactly this pattern: *I saw no temple therein: for Yahuah Elohim (the Lord God)
--      Almighty and the Lamb are the temple of it* (Rev 21:22), *And the city had no need of the sun,
--      neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it* (Rev 21:23) —
--      the Glory in the midst is the temple and the light. Isaiah sings the same: *the sun shall be no
--      more thy light by day... but Yahuah (LORD) shall be unto thee an everlasting light* (Isaiah
--      60:19); and Ezekiel seals the city's new name: *the name of the city from that day shall be,
--      Yahuah Shammah (The LORD is there)* (Ezekiel 48:35). The restored witness pictures the rebuilt
--      city in jewels: *For Jerusalem shall be built up with sapphires and emeralds, and precious stone:
--      your walls and towers and battlements with pure gold* (Tobit 13:16) — the very stones of the New
--      Jerusalem (Rev 21:18-19). The Glory in the midst is the Formed Son, the visible Presence dwelling
--      among His people.
--   ★★ COME OUT OF BABYLON (THREAD 2): the call goes out to the scattered — *Ho, ho, come forth, and
--      flee from the land of the north, saith Yahuah (LORD): for I have spread you abroad as the four
--      winds of the heaven... Deliver thyself, O Zion, that dwellest with the daughter of Babylon*
--      (2:6-7). This is the two-house regathering: the exiles spread to the four winds, called home out
--      of the land of the north. Isaiah had cried it twice — *Go ye forth of Babylon, flee ye from the
--      Chaldeans, with a voice of singing declare ye... Yahuah (LORD) hath redeemed his servant Jacob*
--      (Isaiah 48:20); *Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out
--      of the midst of her* (Isaiah 52:11). And the Revelation answers it forward to the last Babylon:
--      *Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her
--      plagues* (Revelation 18:4). One call across the whole library: come out, my people, and be
--      gathered home. Covenant-deliverance, never ethnic war — the scattered sheep summoned out.
--   ★ THE APPLE OF HIS EYE (THREAD 3): *he that toucheth you toucheth the apple of his eye* (2:8). The
--      jealous guard is the Song of Moses made into a promise of vengeance on the spoilers: *For the
--      LORD'S portion is his people; Jacob is the lot of his inheritance. He found him in a desert land,
--      and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple
--      of his eye* (Deuteronomy 32:9-10). To strike Yahuah's people is to strike the most tender, most
--      guarded part of Him; He will *shake mine hand upon them* (2:9). His people are His portion still.
--   ★★ THE NATIONS JOINED (THREAD 4): *Sing and rejoice, O daughter of Zion: for, lo, I come, and I will
--      dwell in the midst of thee, saith Yahuah (LORD). And many nations shall be joined to Yahuah (LORD)
--      in that day, and shall be my people: and I will dwell in the midst of thee* (2:10-11). The nations
--      are JOINED to Yahuah and become *my people* — but read through the two-house lens this is
--      ingathering, NOT replacement: the wild branches grafted into the one olive tree are the scattered
--      seed grown wild in the nations, made one again with Yahudah. Zechariah's own next vision says it
--      plainly: *I am returned unto Zion, and will dwell in the midst of Jerusalem* (Zechariah 8:3), and
--      *many people and strong nations shall come to seek Yahuah Tseva'ot (LORD of hosts) in Jerusalem*
--      (Zechariah 8:22), *ten men shall take hold... of the skirt of him that is a Yahudi (Jew), saying,
--      We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23) — the
--      nations take hold of the covenant people, joined to the one body. The restored witness sings it:
--      *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands* (Tobit
--      13:11). The dwelling *in the midst* is the same Glory of v.5 — Yahuah come to dwell among the
--      gathered one people.
--   ★ BE SILENT, ALL FLESH (THREAD 5): the chapter closes in awe — *Yahuah (LORD) shall inherit Yahudah
--      (Judah) his portion in the holy land, and shall choose Jerusalem again. Be silent, O all flesh,
--      before Yahuah (LORD): for he is raised up out of his holy habitation* (2:12-13). When the Glory
--      rises from His holy habitation to dwell in the midst, all flesh falls silent — exactly Habakkuk's
--      word: *But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him*
--      (Habakkuk 2:20). The raised-up Presence silences the earth; the chosen portion is claimed, the
--      city chosen again.
--   EXTRAS: Tobit 13 (the rebuilt jeweled city; nations coming to His name with gifts) is a clean
--      witness, verses verified. No extras forced on the come-out call, the apple-of-the-eye, or the
--      silence.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the measuring-line vision — preface, woven into THREAD 1 via
--      Rev 21:15-16), v.9 (I will shake mine hand upon them — the vengeance clause of THREAD 3's guard).
--      All recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): a wall of fire, and the glory in the midst — the unwalled Glory-city
    ('canon','zechariah',2,4,'canon','revelation',21,2,'free',
      E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The word that *Jerusalem shall be inhabited as towns without walls for the multitude of men and cattle therein* (Zechariah 2:4) overflows the measuring-line: the latter-day city is the holy city John saw descending — a city of multitudes, gathered home. The measure could not contain her.'),
    ('canon','zechariah',2,5,'canon','revelation',21,22,'free',
      E'*And I saw no temple therein: for Yahuah Elohim (the Lord God) Almighty and the Lamb are the temple of it* (Revelation 21:22). When Yahuah says *I... will be unto her a wall of fire round about, and will be the glory in the midst of her* (Zechariah 2:5), He is the temple and the wall both. The city needs no protecting circuit and no separate sanctuary, for the Glory Himself dwells in the midst — the Formed Son, the visible Presence among His people.'),
    ('canon','zechariah',2,5,'canon','revelation',21,23,'free',
      E'*And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof* (Revelation 21:23). To *be the glory in the midst of her* (Zechariah 2:5) is to be her light: the New Jerusalem needs no created lamp because the Glory in the midst lightens it. The wall of fire round about is the same Glory that fills her from within.'),
    ('canon','zechariah',2,5,'canon','revelation',21,11,'free',
      E'*Having the glory of Elohim (God): and her light was like unto a stone most precious, even like a jasper stone, clear as crystal* (Revelation 21:11). The city *will be the glory in the midst of her* (Zechariah 2:5) — and John sees her *having the glory of Elohim*, radiant with the Presence. The promised Glory is no longer round-about only; it has become the city''s own shining.'),
    ('canon','zechariah',2,4,'canon','revelation',21,16,'free',
      E'*And the city lieth foursquare, and the length is as large as the breadth: and he measured the city with the reed, twelve thousand furlongs* (Revelation 21:16). The measuring man asked *what is the breadth thereof, and what is the length thereof* (Zechariah 2:2) and was told the city would overflow walls (2:4); John''s angel measures the consummated city — length as large as breadth — the same measuring vision brought to its fullness.'),
    ('canon','zechariah',2,5,'canon','isaiah',60,19,'free',
      E'*The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory* (Isaiah 60:19). To be *the glory in the midst of her* (Zechariah 2:5) is to be her everlasting light: Isaiah sings the same city, lit not by sun or moon but by Yahuah Himself — *Yahuah shall be unto thee an everlasting light, and thy Elohim thy glory*.'),
    ('canon','zechariah',2,5,'canon','ezekiel',48,35,'free',
      E'*It was round about eighteen thousand measures: and the name of the city from that day shall be, Yahuah Shammah (The LORD is there)* (Ezekiel 48:35). The Glory *in the midst of her* (Zechariah 2:5) is the city''s very name: Ezekiel seals the restored Jerusalem with the name *Yahuah Shammah, The LORD is there*. The Presence dwelling in the midst defines the city — He is there.'),
    ('canon','zechariah',2,5,'apocrypha','tobit',13,16,'extras',
      E'*For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold* (Tobit 13:16). The city whose wall is *a wall of fire round about* and whose midst holds *the glory* (Zechariah 2:5) is the jeweled city of the restored witness — sapphires, emeralds, pure gold — the very stones of the New Jerusalem (Revelation 21:18-19). The Glory-city is built of the precious things of heaven.'),

    -- THREAD 2 (★★): flee from the land of the north — deliver thyself, O Zion (come out of Babylon)
    ('canon','zechariah',2,6,'canon','revelation',18,4,'free',
      E'*And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues* (Revelation 18:4). The call *Ho, ho, come forth, and flee from the land of the north... for I have spread you abroad as the four winds of the heaven* (Zechariah 2:6) is the same summons brought to the last Babylon: *Come out of her, my people*. One voice across the library calls the scattered out and home, that they share not her judgment.'),
    ('canon','zechariah',2,7,'canon','revelation',18,4,'free',
      E'*Come out of her, my people, that ye be not partakers of her sins* (Revelation 18:4). *Deliver thyself, O Zion, that dwellest with the daughter of Babylon* (Zechariah 2:7) is the personal edge of that same command: the captive among Babylon''s daughter must *deliver thyself* — flee, come out, be gathered. The exile is not the end; the people are called to rise and depart.'),
    ('canon','zechariah',2,6,'canon','isaiah',48,20,'free',
      E'*Go ye forth of Babylon, flee ye from the Chaldeans, with a voice of singing declare ye, tell this, utter it even to the end of the earth; say ye, Yahuah (LORD) hath redeemed his servant Jacob* (Isaiah 48:20). The *flee from the land of the north* of Zechariah 2:6 echoes Isaiah''s twin cry — *Go ye forth of Babylon, flee ye from the Chaldeans* — the redeemed servant Jacob called out with singing. The regathering of the two-house exiles is one summons.'),
    ('canon','zechariah',2,7,'canon','isaiah',52,11,'free',
      E'*Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* (Isaiah 52:11). *Deliver thyself, O Zion, that dwellest with the daughter of Babylon* (Zechariah 2:7) is Isaiah''s *go ye out of the midst of her*: the captive people are to depart and be clean. The Revelation quotes this very pattern (Rev 18:4) — come out, my people.'),

    -- THREAD 3 (★): he that toucheth you toucheth the apple of his eye (Yahuah's jealous guard)
    ('canon','zechariah',2,8,'canon','deuteronomy',32,10,'free',
      E'*He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10). *He that toucheth you toucheth the apple of his eye* (Zechariah 2:8) is the Song of Moses made a promise of vengeance: the people Yahuah *kept... as the apple of his eye* are the people no spoiler may strike unpunished. To touch them is to touch the tenderest, most-guarded part of Him.'),
    ('canon','zechariah',2,8,'canon','deuteronomy',32,9,'free',
      E'*For the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9). When Yahuah Tseva''ot says He is sent *unto the nations which spoiled you: for he that toucheth you toucheth the apple of his eye* (Zechariah 2:8), He guards His own portion: *the LORD''S portion is his people; Jacob is the lot of his inheritance*. The spoilers will become a spoil (2:9) because they laid hands on His inheritance.'),

    -- THREAD 4 (★★): many nations joined to Yahuah, and I will dwell in the midst (ingathering, NOT replacement)
    ('canon','zechariah',2,10,'canon','revelation',21,3,'free',
      E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). *Lo, I come, and I will dwell in the midst of thee* (Zechariah 2:10) is consummated here: *the tabernacle of Elohim is with men... and he will dwell with them*. The dwelling in the midst is the Glory of v.5 come to abide among the gathered people for ever.'),
    ('canon','zechariah',2,11,'canon','zechariah',8,3,'free',
      E'*Thus saith Yahuah (LORD); I am returned unto Zion, and will dwell in the midst of Jerusalem: and Jerusalem shall be called a city of truth* (Zechariah 8:3). *I will dwell in the midst of thee, and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto thee* (Zechariah 2:11) is Zechariah''s own repeated promise — *I am returned unto Zion, and will dwell in the midst of Jerusalem*. The Glory returns to dwell among the gathered one people.'),
    ('canon','zechariah',2,11,'canon','zechariah',8,22,'free',
      E'*Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD)* (Zechariah 8:22). *Many nations shall be joined to Yahuah (LORD) in that day, and shall be my people* (Zechariah 2:11) is the same ingathering — *many people and strong nations shall come to seek Yahuah*. The nations joined are grafted into the one Yashar''el; the wild branches made one with the natural, NOT a replacement people.'),
    ('canon','zechariah',2,11,'canon','zechariah',8,23,'free',
      E'*Thus saith Yahuah Tseva''ot (LORD of hosts); In those days it shall come to pass, that ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23). The nations *joined to Yahuah... and shall be my people* (Zechariah 2:11) take hold of the covenant people to go with them — *ten men... shall take hold of the skirt of him that is a Yahudi*. They are joined INTO the one body, not set up beside it.'),
    ('canon','zechariah',2,11,'apocrypha','tobit',13,11,'extras',
      E'*Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven; all generations shall praise you with great joy* (Tobit 13:11). *Many nations shall be joined to Yahuah (LORD) in that day, and shall be my people* (Zechariah 2:11) is the restored witness''s song too — *many nations shall come from far to the name of Yahuah with gifts in their hands*. The ingathering of the nations to His name is the great-joy hope of the whole library.'),

    -- THREAD 5 (★): be silent, O all flesh — he is raised up out of his holy habitation
    ('canon','zechariah',2,13,'canon','habakkuk',2,20,'free',
      E'*But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20). *Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:13) is Habakkuk''s very word — *Yahuah is in his holy temple: let all the earth keep silence before him*. When the Glory rises from His holy habitation to dwell in the midst, all flesh falls silent in awe before the Presence.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst',
       E'A wall of fire, and the glory in the midst — the unwalled city of the Presence',
       E'The man with the measuring line is sent *To measure Jerusalem, to see what is the breadth thereof, and what is the length thereof* (Zechariah 2:2) — but the word that meets him bursts the measure: *Jerusalem shall be inhabited as towns without walls for the multitude of men and cattle therein: For I, saith Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of her* (Zechariah 2:4-5). The latter-day city needs no wall, for the Glory Himself encircles her in fire; she needs no separate sanctuary, for the Glory dwells in her midst. Revelation shows the city consummated on exactly this pattern: *I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven* (Revelation 21:2); *I saw no temple therein: for Yahuah Elohim (the Lord God) Almighty and the Lamb are the temple of it* (Revelation 21:22); *And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof* (Revelation 21:23) — the same Glory in the midst, now the temple and the light. The angel even *measured the city with the reed* (Revelation 21:16), the measuring vision brought to fullness. Isaiah sang it: *the sun shall be no more thy light by day... but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory* (Isaiah 60:19); and Ezekiel sealed the city''s name: *the name of the city from that day shall be, Yahuah Shammah (The LORD is there)* (Ezekiel 48:35). The restored witness pictures her built of jewels: *For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold* (Tobit 13:16) — the stones of the New Jerusalem. The Glory in the midst is the Formed Son, the visible Presence dwelling among His people; He is her wall, her light, her name.',
       sv.verse_id, ev.verse_id, 'extras', 45725
  FROM _s338_zec02_lookup sv, _s338_zec02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-2-flee-from-the-land-of-the-north-deliver-thyself-o-zion',
       E'Flee from the land of the north — the regathering of the scattered, come out of Babylon',
       E'The vision turns to a summons for the scattered: *Ho, ho, come forth, and flee from the land of the north, saith Yahuah (LORD): for I have spread you abroad as the four winds of the heaven, saith Yahuah (LORD). Deliver thyself, O Zion, that dwellest with the daughter of Babylon* (Zechariah 2:6-7). The exiles, spread to the four winds, are called home out of the land of the north — the two-house regathering of the dispersed people. Isaiah had cried the same twice: *Go ye forth of Babylon, flee ye from the Chaldeans, with a voice of singing declare ye, tell this, utter it even to the end of the earth; say ye, Yahuah (LORD) hath redeemed his servant Jacob* (Isaiah 48:20); *Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* (Isaiah 52:11). And the Revelation answers it forward to the last Babylon: *And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues* (Revelation 18:4). One call sounds across the whole library — come forth, deliver thyself, come out, my people — the scattered sheep summoned out of captivity and gathered home. This is covenant-deliverance, never ethnic war; the lost are called, not condemned.',
       sv.verse_id, ev.verse_id, 'free', 45728
  FROM _s338_zec02_lookup sv, _s338_zec02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-2-he-that-toucheth-you-toucheth-the-apple-of-his-eye',
       E'He that toucheth you toucheth the apple of his eye — Yahuah''s jealous guard',
       E'Yahuah Tseva''ot declares Himself sent in vengeance on the spoilers of His people: *After the glory hath he sent me unto the nations which spoiled you: for he that toucheth you toucheth the apple of his eye* (Zechariah 2:8); *For, behold, I will shake mine hand upon them, and they shall be a spoil to their servants* (2:9). To strike Yahuah''s people is to strike the tenderest, most-guarded part of Him. The Song of Moses is the root of this guard: *For the LORD''S portion is his people; Jacob is the lot of his inheritance. He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:9-10). The people He *kept... as the apple of his eye* are the people no nation may spoil unpunished; the spoilers become a spoil because they laid hands on His own inheritance. His people are His portion still — jealously, tenderly His.',
       sv.verse_id, ev.verse_id, 'free', 45731
  FROM _s338_zec02_lookup sv, _s338_zec02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-2-many-nations-joined-to-yahuah-and-i-will-dwell-in-the-midst',
       E'Many nations joined to Yahuah, and I will dwell in the midst — the ingathering, not replacement',
       E'The daughter of Zion is called to sing because the Glory is coming to dwell: *Sing and rejoice, O daughter of Zion: for, lo, I come, and I will dwell in the midst of thee, saith Yahuah (LORD). And many nations shall be joined to Yahuah (LORD) in that day, and shall be my people: and I will dwell in the midst of thee, and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto thee* (Zechariah 2:10-11). The nations are JOINED to Yahuah and become *my people* — but this is ingathering, NOT replacement. Read through the two sticks of Ezekiel 37, the wild branches grafted into the one olive tree are the scattered seed of Yashar''el grown wild among the nations, made one again with Yahudah; never a new people set up beside the covenant. Zechariah''s own next vision says it plainly: *I am returned unto Zion, and will dwell in the midst of Jerusalem: and Jerusalem shall be called a city of truth* (Zechariah 8:3); *many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (Zechariah 8:22); *ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23) — they take hold of the covenant people to go WITH them, joined into the one body. The restored witness sings the same: *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven; all generations shall praise you with great joy* (Tobit 13:11). The dwelling *in the midst* is the Glory of verse 5 — Yahuah come to abide among the gathered one people.',
       sv.verse_id, ev.verse_id, 'extras', 45734
  FROM _s338_zec02_lookup sv, _s338_zec02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-2-be-silent-o-all-flesh-he-is-raised-up',
       E'Be silent, O all flesh — he is raised up out of his holy habitation',
       E'The chapter closes in awe as the Glory rises to dwell: *And Yahuah (LORD) shall inherit Yahudah (Judah) his portion in the holy land, and shall choose Jerusalem again. Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:12-13). Yahuah claims His portion — Yahudah in the holy land — and chooses Jerusalem again; and when the Presence rises from His holy habitation to dwell in the midst of His people, all flesh falls silent. This is Habakkuk''s very word: *But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20). Before the raised-up Glory there is no more clamor of the nations, no boast of the spoiler; the earth keeps silence as the Holy One comes forth from His habitation to dwell among the gathered. The portion is claimed, the city chosen, and all flesh is still.',
       sv.verse_id, ev.verse_id, 'free', 45737
  FROM _s338_zec02_lookup sv, _s338_zec02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven* (Revelation 21:2) — the *towns without walls for the multitude* (Zechariah 2:4) overflowing the measuring-line into the holy city descending.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *I saw no temple therein: for Yahuah Elohim (the Lord God) Almighty and the Lamb are the temple of it* (Revelation 21:22) — the *glory in the midst of her* (Zechariah 2:5) IS the temple; no separate sanctuary, for the Presence dwells within.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the city had no need of the sun, neither of the moon... for the glory of Elohim (God) did lighten it* (Revelation 21:23) — to *be the glory in the midst of her* (Zechariah 2:5) is to be her light.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Having the glory of Elohim (God): and her light was like unto a stone most precious* (Revelation 21:11) — the city *will be the glory in the midst of her* (Zechariah 2:5), radiant with the Presence.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he measured the city with the reed, twelve thousand furlongs* (Revelation 21:16) — the measuring man''s *what is the breadth... and the length thereof* (Zechariah 2:2) brought to its fullness.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory* (Isaiah 60:19) — the *glory in the midst of her* (Zechariah 2:5) is her everlasting light, no sun nor moon needed.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *the name of the city from that day shall be, Yahuah Shammah (The LORD is there)* (Ezekiel 48:35) — the Glory *in the midst of her* (Zechariah 2:5) becomes the city''s very name: He is there.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=48 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Jerusalem shall be built up with sapphires and emeralds, and precious stone... with pure gold* (Tobit 13:16) — the Glory-city of Zechariah 2:5 built of the stones of the New Jerusalem (Revelation 21:18-19).'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-a-wall-of-fire-and-the-glory-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Come out of her, my people, that ye be not partakers of her sins* (Revelation 18:4) — the *flee from the land of the north* (Zechariah 2:6) is the same summons brought to the last Babylon.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-flee-from-the-land-of-the-north-deliver-thyself-o-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Come out of her, my people* (Revelation 18:4) — *Deliver thyself, O Zion, that dwellest with the daughter of Babylon* (Zechariah 2:7) is the personal edge of that command: rise and come out.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-flee-from-the-land-of-the-north-deliver-thyself-o-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Go ye forth of Babylon, flee ye from the Chaldeans... Yahuah (LORD) hath redeemed his servant Jacob* (Isaiah 48:20) — Isaiah''s twin cry to the *flee from the land of the north* of Zechariah 2:6.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-flee-from-the-land-of-the-north-deliver-thyself-o-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Depart ye, depart ye, go ye out from thence... go ye out of the midst of her* (Isaiah 52:11) — *Deliver thyself, O Zion* (Zechariah 2:7) is Isaiah''s go-ye-out, the pattern the Revelation quotes.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-flee-from-the-land-of-the-north-deliver-thyself-o-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he kept him as the apple of his eye* (Deuteronomy 32:10) — *he that toucheth you toucheth the apple of his eye* (Zechariah 2:8) is the Song of Moses made a promise of vengeance on the spoiler.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-he-that-toucheth-you-toucheth-the-apple-of-his-eye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9) — Yahuah guards His own portion; the spoilers become a spoil (Zechariah 2:9) for touching His inheritance.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-he-that-toucheth-you-toucheth-the-apple-of-his-eye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people* (Revelation 21:3) — *I will dwell in the midst of thee* (Zechariah 2:10) consummated: the Glory abiding among the gathered.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-many-nations-joined-to-yahuah-and-i-will-dwell-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I am returned unto Zion, and will dwell in the midst of Jerusalem* (Zechariah 8:3) — Zechariah''s own repeated promise of the dwelling in the midst (Zechariah 2:11).'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-many-nations-joined-to-yahuah-and-i-will-dwell-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (Zechariah 8:22) — the *many nations... joined to Yahuah* (Zechariah 2:11), grafted into the one Yashar''el, NOT a replacement people.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-many-nations-joined-to-yahuah-and-i-will-dwell-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *ten men shall take hold... of the skirt of him that is a Yahudi (Jew), saying, We will go with you* (Zechariah 8:23) — the joined nations take hold of the covenant people to go WITH them, into the one body.'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-many-nations-joined-to-yahuah-and-i-will-dwell-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands* (Tobit 13:11) — the restored witness''s song of the *many nations... joined to Yahuah* (Zechariah 2:11).'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-many-nations-joined-to-yahuah-and-i-will-dwell-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20) — the very word of *Be silent, O all flesh, before Yahuah... for he is raised up out of his holy habitation* (Zechariah 2:13).'
  FROM cross_reference_threads t
  JOIN _s338_zec02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s338_zec02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-2-be-silent-o-all-flesh-he-is-raised-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_3.sql (Zechariah 3) -----
-- Chapter: Zechariah 3 — ★ THE BRANCH chapter, a Christological keystone. Joshua the high priest
-- stands before the Angel of Yahuah *and Satan standing at his right hand to resist him* (3:1); the
-- court answers *Yahuah (LORD) rebuke thee, O Satan... is not this a brand plucked out of the fire?*
-- (3:2 — Jude 1:9 quotes the very words, "Yahuah rebuke thee," in the dispute over the body of Moses).
-- The filthy garments are taken away and the change of raiment given — *I have caused thine iniquity
-- to pass from thee, and I will clothe thee with change of raiment* (3:4) — the justification of the
-- priesthood (Isaiah 61:10 garments of salvation, Revelation 19:8 fine linen, Luke 15 best robe). ★★★
-- THE BRANCH: *behold, I will bring forth my servant the BRANCH* (3:8) — the Messianic Branch, the
-- Formed Son who is the SERVANT (Zechariah 6:12, Isaiah 4:2, Isaiah 11:1, Jeremiah 23:5 / 33:15
-- "a righteous Branch"; John's *Behold the man!*). ★★ the stone with seven eyes, iniquity removed in
-- ONE day (3:9 — Psalm 118:22 / 1 Peter 2:6, the seven eyes Revelation 5:6, the atonement). And the
-- Messianic peace: *every man his neighbour under the vine and under the fig tree* (3:10 — Micah 4:4).
-- The Branch and the stone carry the Formed-Son frame: the SERVANT Branch is Yahusha who HAS a Father;
-- never co-equal trinitarian grammar.
-- Tag: zec03   Temp view: _s338_zec03_lookup
-- Sort band: base 45750, step 3 -> threads at 45750, 45753, 45756, 45759, 45762, 45765 (6 threads)
-- Source of EVERY row: 'canon','zechariah',3,v
--
-- Zechariah 3 coverage:
--   ★★ v.1-2 (Joshua... and Satan standing at his right hand to resist him... Yahuah (LORD) rebuke
--          thee, O Satan... is not this a brand plucked out of the fire?)
--        NT:     ★★★ Jude 1:9 (Michael... disputed about the body of Moses... but said, Yahuah (Lord)
--                rebuke thee) — THREAD 1 (the exact courtroom rebuke quoted forward)
--        Extras: ★ 1 Enoch 40:7 (the fourth voice fending off the Satans and forbidding them to come
--                before Yahuah (God) of Spirits to accuse them who dwell on the earth) — THREAD 1; ★
--                Jubilees 48:15 (the prince of the Mastema was bound... that he might not accuse them)
--                — THREAD 1 (the accuser silenced in the heavenly court)
--        Tanakh: woven in prose (the standing accuser; Yahuah who hath chosen Jerusalem rebukes)
--   ★ v.3-5 (clothed with filthy garments... Take away the filthy garments... I have caused thine
--          iniquity to pass from thee, and I will clothe thee with change of raiment... a fair mitre)
--        NT:     ★ Revelation 19:8 (arrayed in fine linen, clean and white: for the fine linen is the
--                righteousness of saints) — THREAD 2; ★ Luke 15:22 (Bring forth the best robe, and put
--                it on him) — THREAD 2 (the robe given to the unworthy)
--        Extras: none warranted (the garment-exchange forward-weave is canon-carried)
--        Tanakh: ★ Isaiah 61:10 (he hath clothed me with the garments of salvation... the robe of
--                righteousness) — THREAD 2 (the imputed raiment)
--   ★★★ v.8 (Hear now, O Joshua... behold, I will bring forth my servant the BRANCH)
--        NT:     ★ John 19:5 (Then came Yahusha (Jesus) forth... Behold the man!) — THREAD 3 (the
--                Branch shown forth = behold the man)
--        Extras: none warranted (the Branch is canon-internal; held in prose)
--        Tanakh: ★★★ Zechariah 6:12 (Behold the man whose name is The BRANCH... he shall build the
--                temple of Yahuah... and he shall be a priest upon his throne) — THREAD 3 (the prophet's
--                own twin Branch-word); ★ Isaiah 4:2 (the branch of Yahuah (LORD) be beautiful and
--                glorious) — THREAD 3; ★★ Jeremiah 23:5 (I will raise unto David a righteous Branch),
--                Jeremiah 33:15 (the Branch of righteousness to grow up unto David), Isaiah 11:1 (a
--                Branch shall grow out of his roots) — THREAD 3 (the whole Branch chorus)
--   ★★ v.9 (the stone that I have laid before Joshua; upon one stone shall be seven eyes... I will
--          remove the iniquity of that land in one day)
--        NT:     ★★ 1 Peter 2:6 (Behold, I lay in Sion a chief corner stone, elect, precious) — THREAD
--                4; ★ Revelation 5:6 (a Lamb as it had been slain, having seven horns and seven eyes,
--                which are the seven Spirits of Elohim) — THREAD 4 (the seven eyes)
--        Extras: none warranted
--        Tanakh: ★★ Psalm 118:22 (The stone which the builders refused is become the head stone of the
--                corner) — THREAD 4 (the laid stone)
--   ★ v.10 (shall ye call every man his neighbour under the vine and under the fig tree)
--        NT:     none warranted distinct (the Messianic peace is carried by the Tanakh twin)
--        Extras: none warranted
--        Tanakh: ★ Micah 4:4 (they shall sit every man under his vine and under his fig tree; and none
--                shall make them afraid) — THREAD 5 (the day of peace)
--   v.6-7 (the angel of Yahuah protested... If thou wilt walk in my ways, and if thou wilt keep my
--          charge, then thou shalt also judge my house) — THREAD 6 (Torah-conditioned priesthood)
--        NT:     none warranted distinct (the walk/charge is Torah-affirmed, held in prose)
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 11:22 (to walk in all his ways, and to cleave unto him), Leviticus 8:35
--                (keep the charge of Yahuah) — THREAD 6 (walk in my ways / keep my charge = Torah kept)
--
-- Threads (slug — target libraries):
--   1. zechariah-3-yahuah-rebuke-thee-o-satan-a-brand-plucked-out-of-the-fire
--        — NT (Jude 1) + Extras (1 Enoch 40, Jubilees 48) [extras]
--        (★★ the standing accuser silenced; the exact "Yahuah rebuke thee" quoted by Jude)
--   2. zechariah-3-take-away-the-filthy-garments-change-of-raiment
--        — NT (Revelation 19, Luke 15) + Tanakh (Isaiah 61) [free]
--        (★ the filthy garments removed, the imputed robe of righteousness given to the unworthy)
--   3. zechariah-3-behold-i-will-bring-forth-my-servant-the-branch
--        — NT (John 19) + Tanakh (Zechariah 6, Isaiah 4, Isaiah 11, Jeremiah 23, Jeremiah 33) [free]
--        (★★★ THE BRANCH = the SERVANT Messiah, the Formed Son who has a Father; "behold the man")
--   4. zechariah-3-the-stone-with-seven-eyes-iniquity-removed-in-one-day
--        — NT (1 Peter 2, Revelation 5) + Tanakh (Psalm 118) [free]
--        (★★ the laid stone / head of the corner; the seven eyes; iniquity removed in one day = atonement)
--   5. zechariah-3-under-the-vine-and-under-the-fig-tree
--        — Tanakh (Micah 4) [free]
--        (★ the Messianic peace of the Branch's day)
--   6. zechariah-3-if-thou-wilt-walk-in-my-ways-and-keep-my-charge
--        — Tanakh (Deuteronomy 11, Leviticus 8) [free]
--        (the priesthood conditioned on walking in Yahuah's ways and keeping His charge = Torah, never abolished)
--
-- Framing notes:
--   ★★ THE ACCUSER REBUKED (THREAD 1): *And he shewed me Joshua the high priest standing before the
--      angel of Yahuah (LORD), and Satan standing at his right hand to resist him* (3:1). The Angel of
--      Yahuah here is the Formed Son, the One who bears the Name. The court answers not with argument
--      but with rebuke: *Yahuah (LORD) rebuke thee, O Satan... is not this a brand plucked out of the
--      fire?* (3:2). Jude quotes these very words in the heavenly contest over Moses' body: *Yet
--      Michael the archangel, when contending with the devil he disputed about the body of Moses, durst
--      not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee* (Jude 1:9) —
--      the rebuke belongs to Yahuah, not to the creature. The restored witnesses show the same court:
--      *the fourth voice fending off the Satans and forbidding them to come before Yahuah (God) of
--      Spirits to accuse them who dwell on the earth* (1 Enoch 40:7), and *the prince of the Mastema
--      was bound and imprisoned... that he might not accuse them* (Jubilees 48:15). The accuser stands
--      at the right hand; Yahuah silences him and the chosen are plucked from the fire.
--   ★ THE CHANGE OF RAIMENT (THREAD 2): *Now Joshua was clothed with filthy garments... Take away the
--      filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass
--      from thee, and I will clothe thee with change of raiment* (3:3-4). This is justification in
--      figure: the iniquity removed, the clean raiment given. Isaiah sings it: *he hath clothed me
--      with the garments of salvation... the robe of righteousness* (Isaiah 61:10); the bride is so
--      arrayed — *fine linen, clean and white: for the fine linen is the righteousness of saints*
--      (Revelation 19:8); and the prodigal is so received — *Bring forth the best robe, and put it on
--      him* (Luke 15:22). The fair mitre is set on the cleansed head; the priest is reclothed.
--   ★★★ THE BRANCH (THREAD 3): *behold, I will bring forth my servant the BRANCH* (3:8). The BRANCH is
--      the Messiah, and he is named here as the SERVANT — the Formed Son who is sent, who has a Father.
--      Zechariah's own twin word makes him plain: *Behold the man whose name is The BRANCH... he shall
--      build the temple of Yahuah (LORD)... and he shall be a priest upon his throne* (Zechariah 6:12-13).
--      The Branch chorus runs the prophets: *the branch of Yahuah (LORD) be beautiful and glorious*
--      (Isaiah 4:2); *a Branch shall grow out of his roots* (Isaiah 11:1); *I will raise unto David a
--      righteous Branch* (Jeremiah 23:5); *the Branch of righteousness to grow up unto David* (Jeremiah
--      33:15). And Pilate, not knowing, says the word over him: *Then came Yahusha (Jesus) forth... and
--      Pilate saith unto them, Behold the man!* (John 19:5) — the Branch brought forth. The SERVANT
--      Branch is Yahusha, who is Yahuah and HAS a Father; not a co-equal trinitarian person.
--   ★★ THE STONE WITH SEVEN EYES (THREAD 4): *For behold the stone that I have laid before Joshua; upon
--      one stone shall be seven eyes... and I will remove the iniquity of that land in one day* (3:9).
--      The laid stone is the head of the corner: *The stone which the builders refused is become the
--      head stone of the corner* (Psalm 118:22); *Behold, I lay in Sion a chief corner stone, elect,
--      precious* (1 Peter 2:6). The seven eyes are the Lamb's: *a Lamb as it had been slain, having
--      seven horns and seven eyes, which are the seven Spirits of Elohim (God)* (Revelation 5:6). And
--      iniquity removed *in one day* is the atonement accomplished once — the work of the slain Lamb,
--      the cleansing the change of raiment of v.4 declared.
--   ★ UNDER THE VINE AND FIG TREE (THREAD 5): *In that day... shall ye call every man his neighbour
--      under the vine and under the fig tree* (3:10) — the peace of the Branch's reign, the same word
--      Micah sings: *But they shall sit every man under his vine and under his fig tree; and none shall
--      make them afraid: for the mouth of Yahuah Tseva'ot (LORD of hosts) hath spoken it* (Micah 4:4).
--   WALK IN MY WAYS / KEEP MY CHARGE (THREAD 6): the reclothed priest is given a charge: *If thou wilt
--      walk in my ways, and if thou wilt keep my charge, then thou shalt also judge my house* (3:7).
--      The justification of v.4 is UNTO obedience, not instead of it — *to walk in all his ways*
--      (Deuteronomy 11:22), *keep the charge of Yahuah (LORD)* (Leviticus 8:35). Torah-conditioned
--      priesthood; grace clothes, and the cleansed walk in His ways. Never antinomian.
--   EXTRAS: 1 Enoch 40:7 (the Satans fended off from accusing) and Jubilees 48:15 (Mastema bound that
--      he might not accuse Israel) — clean heavenly-court witnesses, parses verified. No extras forced
--      on the garments, the Branch, the stone, the vine, or the charge.
--   VERSES WITH NO SEPARATE ADD: v.5 (the fair mitre — woven into THREAD 2 with v.3-4), v.6 (the angel
--      protested — preface to the charge of THREAD 6). All recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Yahuah rebuke thee, O Satan — the accuser silenced; a brand plucked from the fire
    ('canon','zechariah',3,2,'canon','jude',1,9,'free',
      E'*Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee* (Jude 1:9). Jude quotes the very courtroom answer of *Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee* (Zechariah 3:2). The rebuke of the accuser belongs to Yahuah, never to the creature; the same word silences the standing adversary in both heavenly contests.'),
    ('canon','zechariah',3,1,'enoch','1-enoch',40,7,'extras',
      E'*And I heard the fourth voice fending off the Satans and forbidding them to come before Yahuah (God) of Spirits to accuse them who dwell on the earth* (1 Enoch 40:7). The adversary of *Satan standing at his right hand to resist him* (Zechariah 3:1) is the same accuser the restored witness shows fended off — forbidden to come before Yahuah to accuse the people. The court that stands over Joshua is the court where the Satans are barred.'),
    ('canon','zechariah',3,1,'jubilees','jubilees',48,15,'extras',
      E'*And on the fourteenth day and on the fifteenth and on the sixteenth and on the seventeenth and on the eighteenth the prince of the Mastema was bound and imprisoned behind the children of Yashar''el (Israel) that he might not accuse them* (Jubilees 48:15). The *Satan standing at his right hand to resist him* (Zechariah 3:1) is the accuser Jubilees names the prince of the Mastema — bound *that he might not accuse* the people. Yahuah who hath chosen Jerusalem (3:2) silences the adversary; the chosen are kept from his charge.'),

    -- THREAD 2 (★): Take away the filthy garments — the change of raiment, the imputed robe
    ('canon','zechariah',3,4,'canon','isaiah',61,10,'free',
      E'*I will greatly rejoice in Yahuah (LORD), my soul shall be joyful in my Elohim (God); for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments* (Isaiah 61:10). The *change of raiment* given when *I have caused thine iniquity to pass from thee* (Zechariah 3:4) is the very robe Isaiah sings — *the garments of salvation... the robe of righteousness* put on the cleansed. The filthy garments removed, the righteousness imputed.'),
    ('canon','zechariah',3,4,'canon','revelation',19,8,'free',
      E'*And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8). The clean *change of raiment* of *I will clothe thee with change of raiment* (Zechariah 3:4) is the bride''s fine linen — *granted* to her, *the righteousness of saints*. The garment is given, not earned; the iniquity caused to pass, the clean linen put on.'),
    ('canon','zechariah',3,4,'canon','luke',15,22,'free',
      E'*But the father said to his servants, Bring forth the best robe, and put it on him; and put a ring on his hand, and shoes on his feet* (Luke 15:22). The returning son, like Joshua, is reclothed by another''s decree — *Take away the filthy garments from him... I will clothe thee with change of raiment* (Zechariah 3:4). The best robe is brought forth and put on the unworthy; the iniquity is caused to pass, and the cleansed is reclothed in honour.'),

    -- THREAD 3 (★★★): Behold, I will bring forth my servant the BRANCH — the Servant Messiah, the Formed Son
    ('canon','zechariah',3,8,'canon','zechariah',6,12,'free',
      E'*And speak unto him, saying, Thus speaketh Yahuah Tseva''ot (LORD of hosts), saying, Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12). The prophet''s own twin word names the BRANCH of *behold, I will bring forth my servant the BRANCH* (Zechariah 3:8): *Behold the man whose name is The BRANCH*, who builds the temple and *shall be a priest upon his throne* (6:13). The SERVANT Branch is the priest-king Messiah, the Formed Son who is sent and has a Father.'),
    ('canon','zechariah',3,8,'canon','isaiah',4,2,'free',
      E'*In that day shall the branch of Yahuah (LORD) be beautiful and glorious, and the fruit of the earth shall be excellent and comely for them that are escaped of Yashar''el (Israel)* (Isaiah 4:2). The *servant the BRANCH* (Zechariah 3:8) is *the branch of Yahuah (LORD)*, beautiful and glorious in that day — the Messianic growth promised to the escaped remnant of Yashar''el (Israel).'),
    ('canon','zechariah',3,8,'canon','isaiah',11,1,'free',
      E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). The *servant the BRANCH* (Zechariah 3:8) is the same shoot Isaiah sees spring from David''s line — *a Branch shall grow out of his roots*, the Spirit-anointed King upon whom *the spirit of Yahuah (LORD) shall rest* (11:2).'),
    ('canon','zechariah',3,8,'canon','jeremiah',23,5,'free',
      E'*Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5). The *servant the BRANCH* (Zechariah 3:8) is Jeremiah''s *righteous Branch* raised unto David — the King named *Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (23:6), in whose days Yahudah (Judah) is saved and Yashar''el (Israel) dwells safely.'),
    ('canon','zechariah',3,8,'canon','jeremiah',33,15,'free',
      E'*In those days, and at that time, will I cause the Branch of righteousness to grow up unto David; and he shall execute judgment and righteousness in the land* (Jeremiah 33:15). The *servant the BRANCH* (Zechariah 3:8) is the *Branch of righteousness* grown up unto David — the covenant kept to both houses, *the house of Yashar''el (Israel) and to the house of Yahudah (Judah)* (33:14).'),
    ('canon','zechariah',3,8,'canon','john',19,5,'free',
      E'*Then came Yahusha (Jesus) forth, wearing the crown of thorns, and the purple robe. And Pilate saith unto them, Behold the man!* (John 19:5). Pilate, not knowing, says the Branch-word over him — *Behold the man whose name is The BRANCH* (Zechariah 6:12) — as *my servant the BRANCH* (Zechariah 3:8) is brought forth. The Servant is shown to the people: behold the man, the BRANCH made flesh.'),

    -- THREAD 4 (★★): The stone with seven eyes — iniquity removed in one day
    ('canon','zechariah',3,9,'canon','psalms',118,22,'free',
      E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). The *stone that I have laid before Joshua* (Zechariah 3:9) is the head of the corner — the stone the builders refused, set in place by Yahuah. The laid stone is the Messiah, the foundation before whom the priesthood stands.'),
    ('canon','zechariah',3,9,'canon','1-peter',2,6,'free',
      E'*Wherefore also it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6). The *stone that I have laid before Joshua* (Zechariah 3:9) is the *chief corner stone, elect, precious* laid in Sion — the living stone (2:4) upon whom the spiritual house is built. The stone Yahuah lays is the Messiah himself.'),
    ('canon','zechariah',3,9,'canon','revelation',5,6,'free',
      E'*And I beheld, and, lo, in the midst of the throne... stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6). The stone *upon one stone shall be seven eyes* (Zechariah 3:9) is the slain Lamb with *seven eyes, which are the seven Spirits of Elohim (God)* — the all-seeing fulness sent into all the earth. The same seven eyes are on the stone and on the Lamb.'),

    -- THREAD 5 (★): Under the vine and under the fig tree — the Messianic peace
    ('canon','zechariah',3,10,'canon','micah',4,4,'free',
      E'*But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). The day when *ye call every man his neighbour under the vine and under the fig tree* (Zechariah 3:10) is the same peace Micah sings — every man under his own vine and fig tree, *none shall make them afraid*. The Branch''s reign is the day of unafraid rest.'),

    -- THREAD 6: If thou wilt walk in my ways, and keep my charge — Torah-conditioned priesthood
    ('canon','zechariah',3,7,'canon','deuteronomy',11,22,'free',
      E'*For if ye shall diligently keep all these commandments which I command you, to do them, to love Yahuah Elohaychem (the LORD your God), to walk in all his ways, and to cleave unto him* (Deuteronomy 11:22). The charge laid on the reclothed priest — *If thou wilt walk in my ways, and if thou wilt keep my charge* (Zechariah 3:7) — is the Torah''s own call: *to walk in all his ways, and to cleave unto him*. The garment of righteousness is given UNTO obedience, never instead of it.'),
    ('canon','zechariah',3,7,'canon','leviticus',8,35,'free',
      E'*Therefore shall ye abide at the door of the tabernacle of the congregation day and night seven days, and keep the charge of Yahuah (LORD), that ye die not: for so I am commanded* (Leviticus 8:35). The priest''s commission *if thou wilt keep my charge, then thou shalt also judge my house* (Zechariah 3:7) is the priestly duty Leviticus binds — *keep the charge of Yahuah (LORD)*. Cleansed and reclothed, Joshua is called to walk the very Torah-charge of his office.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-3-yahuah-rebuke-thee-o-satan-a-brand-plucked-out-of-the-fire',
       E'Yahuah rebuke thee, O Satan — the accuser silenced, a brand plucked from the fire',
       E'The vision opens in the heavenly court: *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him* (Zechariah 3:1). The Angel of Yahuah who stands here is the Formed Son, the One who bears the Name. The adversary stands to accuse; the court answers not with argument but with rebuke: *And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* (3:2). Jude quotes these very words in the heavenly contest over the body of Moses: *Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee* (Jude 1:9) — the rebuke belongs to Yahuah, never to the creature. The restored witnesses show the same court keeping the accuser out: *And I heard the fourth voice fending off the Satans and forbidding them to come before Yahuah (God) of Spirits to accuse them who dwell on the earth* (1 Enoch 40:7); *the prince of the Mastema was bound and imprisoned behind the children of Yashar''el (Israel) that he might not accuse them* (Jubilees 48:15). The accuser stands at the right hand; Yahuah, who hath chosen Jerusalem, silences him — and the chosen priest is a brand plucked out of the fire.',
       sv.verse_id, ev.verse_id, 'extras', 45750
  FROM _s338_zec03_lookup sv, _s338_zec03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-3-take-away-the-filthy-garments-change-of-raiment',
       E'Take away the filthy garments — the change of raiment, the robe of righteousness given',
       E'The accused priest stands in defilement: *Now Joshua was clothed with filthy garments, and stood before the angel* (Zechariah 3:3). And the verdict of the court is not condemnation but cleansing: *Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment* (3:4); *So they set a fair mitre upon his head, and clothed him with garments* (3:5). This is justification in figure — the iniquity caused to pass, the clean raiment given by another''s decree. Isaiah sings the same robe: *he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness* (Isaiah 61:10). The bride is so arrayed: *to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8) — granted, not earned. And the returning son is so received: *Bring forth the best robe, and put it on him* (Luke 15:22). The filthy garments are stripped away, the fair mitre set on the cleansed head; grace clothes the unworthy in righteousness.',
       sv.verse_id, ev.verse_id, 'free', 45753
  FROM _s338_zec03_lookup sv, _s338_zec03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-3-behold-i-will-bring-forth-my-servant-the-branch',
       E'Behold, I will bring forth my servant the BRANCH — the Servant Messiah, the Formed Son',
       E'The cleansed priesthood is a sign of one greater: *Hear now, O Joshua the high priest, thou, and thy fellows that sit before thee: for they are men wondered at: for, behold, I will bring forth my servant the BRANCH* (Zechariah 3:8). The BRANCH is the Messiah — and he is named here as the SERVANT, the Formed Son who is SENT and who HAS a Father; not a co-equal trinitarian person, but the One drawn from the Formless and brought forth. The prophet''s own twin word makes him plain: *Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12), *and he shall be a priest upon his throne* (6:13) — priest and king in one. The Branch chorus runs the prophets: *In that day shall the branch of Yahuah (LORD) be beautiful and glorious* (Isaiah 4:2); *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1); *I will raise unto David a righteous Branch, and a King shall reign and prosper* (Jeremiah 23:5); *I will cause the Branch of righteousness to grow up unto David* (Jeremiah 33:15) — the covenant kept to both houses. And in the end Pilate, not knowing, speaks the Branch-word over him: *Then came Yahusha (Jesus) forth, wearing the crown of thorns, and the purple robe. And Pilate saith unto them, Behold the man!* (John 19:5). The Servant is brought forth — behold the man, the BRANCH made flesh.',
       sv.verse_id, ev.verse_id, 'free', 45756
  FROM _s338_zec03_lookup sv, _s338_zec03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-3-the-stone-with-seven-eyes-iniquity-removed-in-one-day',
       E'The stone with seven eyes — iniquity removed in one day',
       E'Beside the Branch is laid a stone: *For behold the stone that I have laid before Joshua; upon one stone shall be seven eyes: behold, I will engrave the graving thereof, saith Yahuah Tseva''ot (LORD of hosts), and I will remove the iniquity of that land in one day* (Zechariah 3:9). The laid stone is the head of the corner: *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22); *Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6). The seven eyes are the slain Lamb''s: *a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6) — the all-seeing fulness of the Spirit upon the stone. And the iniquity removed *in one day* is the atonement accomplished once: the same cleansing the change of raiment declared (3:4), wrought by the Lamb in a single day. One stone, seven eyes, iniquity gone in one day — the Branch and the stone are one Messiah.',
       sv.verse_id, ev.verse_id, 'free', 45759
  FROM _s338_zec03_lookup sv, _s338_zec03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-3-under-the-vine-and-under-the-fig-tree',
       E'Under the vine and under the fig tree — the peace of the Branch''s day',
       E'The vision closes in peace: *In that day, saith Yahuah Tseva''ot (LORD of hosts), shall ye call every man his neighbour under the vine and under the fig tree* (Zechariah 3:10). This is the day the Branch brings — the same rest Micah sings: *But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). When the iniquity is removed in one day (3:9) and the Servant Branch reigns, the people sit unafraid, each under his own vine and fig tree, calling his neighbour to the same peace. The mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it.',
       sv.verse_id, ev.verse_id, 'free', 45762
  FROM _s338_zec03_lookup sv, _s338_zec03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-3-if-thou-wilt-walk-in-my-ways-and-keep-my-charge',
       E'If thou wilt walk in my ways, and keep my charge — the priesthood UNTO obedience',
       E'The cleansed priest is not left without a charge. The Angel of Yahuah protests unto Joshua: *Thus saith Yahuah Tseva''ot (LORD of hosts); If thou wilt walk in my ways, and if thou wilt keep my charge, then thou shalt also judge my house, and shalt also keep my courts, and I will give thee places to walk among these that stand by* (Zechariah 3:7). The change of raiment of v.4 is given UNTO obedience, never instead of it — grace clothes, and the cleansed walk in Yahuah''s ways. This is the Torah''s own call: *to love Yahuah Elohaychem (the LORD your God), to walk in all his ways, and to cleave unto him* (Deuteronomy 11:22); and the priest''s own duty: *keep the charge of Yahuah (LORD), that ye die not* (Leviticus 8:35). The justified priesthood is a walking priesthood; the robe of righteousness and the keeping of the charge are one calling, never opposed. The cleansed priest is restored to walk the very Torah-charge of his office.',
       sv.verse_id, ev.verse_id, 'free', 45765
  FROM _s338_zec03_lookup sv, _s338_zec03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Michael the archangel... disputed about the body of Moses... but said, Yahuah (Lord) rebuke thee* (Jude 1:9) — Jude quotes the very court-answer of Zechariah 3:2; the rebuke belongs to Yahuah, not the creature.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-yahuah-rebuke-thee-o-satan-a-brand-plucked-out-of-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the fourth voice fending off the Satans and forbidding them to come before Yahuah (God) of Spirits to accuse them* (1 Enoch 40:7) — the accuser of *Satan standing at his right hand* (Zechariah 3:1) barred from the court.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=40 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-yahuah-rebuke-thee-o-satan-a-brand-plucked-out-of-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the prince of the Mastema was bound and imprisoned... that he might not accuse them* (Jubilees 48:15) — the resisting Satan of Zechariah 3:1 bound so the chosen people cannot be accused.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-yahuah-rebuke-thee-o-satan-a-brand-plucked-out-of-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he hath clothed me with the garments of salvation... the robe of righteousness* (Isaiah 61:10) — the *change of raiment* of Zechariah 3:4 is the imputed robe put on the cleansed.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-take-away-the-filthy-garments-change-of-raiment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8) — the clean raiment of Zechariah 3:4 *granted*, not earned.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-take-away-the-filthy-garments-change-of-raiment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Bring forth the best robe, and put it on him* (Luke 15:22) — the returning son, like Joshua, reclothed by another''s decree; the iniquity caused to pass (Zechariah 3:4).'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-take-away-the-filthy-garments-change-of-raiment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Behold the man whose name is The BRANCH... and he shall be a priest upon his throne* (Zechariah 6:12-13) — the prophet''s own twin word: the SERVANT Branch is the priest-king Messiah.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-behold-i-will-bring-forth-my-servant-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the branch of Yahuah (LORD) be beautiful and glorious* (Isaiah 4:2) — the *servant the BRANCH* (Zechariah 3:8) glorious in that day for the escaped of Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-behold-i-will-bring-forth-my-servant-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *a Branch shall grow out of his roots* (Isaiah 11:1) — the *servant the BRANCH* (Zechariah 3:8) springs from David''s stem, the Spirit-anointed King.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-behold-i-will-bring-forth-my-servant-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will raise unto David a righteous Branch, and a King shall reign and prosper* (Jeremiah 23:5) — the *servant the BRANCH* (Zechariah 3:8) named Yahuah Tsidkenu, in whose days both houses are saved.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-behold-i-will-bring-forth-my-servant-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I will cause the Branch of righteousness to grow up unto David* (Jeremiah 33:15) — the *servant the BRANCH* (Zechariah 3:8), the covenant kept to the house of Yashar''el (Israel) and Yahudah (Judah).'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-behold-i-will-bring-forth-my-servant-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Then came Yahusha (Jesus) forth... And Pilate saith unto them, Behold the man!* (John 19:5) — Pilate speaks the Branch-word (Zechariah 6:12) over him; the Servant brought forth, the BRANCH made flesh.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-behold-i-will-bring-forth-my-servant-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22) — the *stone that I have laid before Joshua* (Zechariah 3:9) is the head of the corner.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-the-stone-with-seven-eyes-iniquity-removed-in-one-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Behold, I lay in Sion a chief corner stone, elect, precious* (1 Peter 2:6) — the laid stone of Zechariah 3:9 is the Messiah, the foundation in Sion.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-the-stone-with-seven-eyes-iniquity-removed-in-one-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God)* (Revelation 5:6) — the *seven eyes* on the stone (Zechariah 3:9) are the slain Lamb''s.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-the-stone-with-seven-eyes-iniquity-removed-in-one-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *they shall sit every man under his vine and under his fig tree; and none shall make them afraid* (Micah 4:4) — the peace of Zechariah 3:10, the unafraid rest of the Branch''s day.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-under-the-vine-and-under-the-fig-tree'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*to love Yahuah Elohaychem (the LORD your God)... to walk in all his ways, and to cleave unto him* (Deuteronomy 11:22) — the priest''s charge *walk in my ways* (Zechariah 3:7) is the Torah''s own call; the robe given unto obedience.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-if-thou-wilt-walk-in-my-ways-and-keep-my-charge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*keep the charge of Yahuah (LORD), that ye die not* (Leviticus 8:35) — the priest''s commission *keep my charge* (Zechariah 3:7) is the very priestly duty Leviticus binds.'
  FROM cross_reference_threads t
  JOIN _s338_zec03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s338_zec03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=8 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-3-if-thou-wilt-walk-in-my-ways-and-keep-my-charge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_4.sql (Zechariah 4) -----
-- Chapter: Zechariah 4 — THE GOLDEN LAMPSTAND AND THE TWO OLIVE TREES. The angel wakes the prophet
-- to a vision: *a candlestick all of gold, with a bowl upon the top of it, and his seven lamps
-- thereon... And two olive trees by it, one upon the right side of the bowl, and the other upon the
-- left side thereof* (4:2-3) — the menorah of the tabernacle (Exodus 25:31-37) carried forward into
-- the seven golden candlesticks of the Revelation (Revelation 1:12, 1:20). At the heart stands the
-- word to Zerubbabel: ★★ *Not by might, nor by power, but by my spirit, saith Yahuah Tseva'ot (LORD
-- of hosts)* (4:6) — the Spirit, not flesh-strength, finishes the house; the same Spirit that puts
-- the Torah within (Ezekiel 36:27) and is poured on all flesh (Joel 2:28). The great mountain becomes
-- a plain, the headstone is brought forth *crying, Grace, grace unto it* (4:7); the hands that laid
-- the foundation *shall also finish it* (4:9). The seven lamps are *the eyes of Yahuah (LORD), which
-- run to and fro through the whole earth* (4:10) — the Lamb's seven eyes (Revelation 5:6), the eyes
-- that range to show himself strong (2 Chronicles 16:9). And the two olive trees are ★★ *the two
-- anointed ones, that stand by Yahuah (Lord) of the whole earth* (4:14) → the two witnesses of
-- Revelation 11:4 — per the framework the two houses, Yahudah and Yashar'el, the two sticks of
-- Ezekiel 37 made one. Christology: the Spirit of Yahuah; the Formed/Formless frame, no trinitarian
-- grammar.
-- Tag: zec04   Temp view: _s338_zec04_lookup
-- Sort band: base 45775, step 3 -> threads at 45775, 45778, 45784, 45787 (4 threads; 45781 skipped —
--   the v.7-9 headstone/finished-house material is woven into THREAD 2 prose, no empty thread cut)
-- Source of EVERY row: 'canon','zechariah',4,v
--
-- Zechariah 4 coverage:
--   v.1 (the angel... waked me, as a man that is wakened out of his sleep)
--        NT: none warranted   Extras: none warranted   Tanakh: none warranted (preface to the vision)
--   ★ v.2-3 (a candlestick all of gold... his seven lamps... two olive trees by it)
--        NT:     ★★ Revelation 1:12 (I saw seven golden candlesticks), Revelation 1:20 (the seven
--                candlesticks which thou sawest are the seven churches) — THREAD 1
--        Extras: none warranted (no clean menorah witness; held canon/NT)
--        Tanakh: ★★ Exodus 25:31 (a candlestick of pure gold), Exodus 25:37 (the seven lamps thereof)
--                — THREAD 1 (the tabernacle menorah)
--   ★★ v.6 (Not by might, nor by power, but by my spirit, saith Yahuah Tseva'ot)
--        NT:     held in prose (Acts 2 Spirit-poured is the Joel fulfillment, anchored via Joel below)
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 36:27 (I will put my spirit within you, and cause you to walk in my
--                statutes), ★★ Joel 2:28 (I will pour out my spirit upon all flesh) — THREAD 2
--                (Spirit-and-Torah inseparable; NOT Spirit-vs-Law)
--   v.7 (Who art thou, O great mountain?... Grace, grace unto it)
--        NT:     woven into THREAD 2 (the Spirit finishes the work; grace) / THREAD 3 (the finished house)
--        Extras: none warranted   Tanakh: none separate (held in prose)
--   ★ v.9 (the hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it)
--        NT:     none warranted distinct (the finished-house forward-weave held in prose)
--        Extras: none warranted
--        Tanakh: held in THREAD 3 with v.7 (the headstone, the finished house, grace)
--   ★ v.10 (the seven eyes of Yahuah, which run to and fro through the whole earth)
--        NT:     ★★ Revelation 5:6 (seven eyes, which are the seven Spirits of Elohim sent forth into
--                all the earth) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ 2 Chronicles 16:9 (the eyes of Yahuah run to and fro throughout the whole earth)
--                — THREAD 4
--   ★★ v.11-14 (the two olive trees / two olive branches / the two anointed ones, that stand by Yahuah
--          of the whole earth)
--        NT:     ★★★ Revelation 11:4 (These are the two olive trees, and the two candlesticks standing
--                before the Elohim of the earth) — THREAD 5? (folded: see THREAD 1 candlestick weave +
--                THREAD 5 two-witnesses)
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 37:19 (I will take the stick of Joseph... and the stick of Yahudah... and
--                make them one stick), Ezekiel 37:22 (they shall be no more two nations) — THREAD 5
--                (the two anointed ones = the two houses, the two sticks made one)
--
-- Threads (slug — target libraries):
--   1. zechariah-4-the-candlestick-all-of-gold-with-seven-lamps — NT (Revelation 1) + Tanakh (Exodus 25) [free]
--      (★ the menorah; tabernacle lampstand -> the seven golden candlesticks)
--   2. zechariah-4-not-by-might-nor-by-power-but-by-my-spirit — Tanakh (Ezekiel 36, Joel 2) [free]
--      (★★ the Spirit not flesh-strength; Spirit-and-Torah inseparable, NOT Spirit-vs-Law)
--   (v.7-9 headstone/finished-house/grace — woven into THREAD 2 prose, NOT a separate empty thread)
--   4. zechariah-4-the-seven-eyes-of-yahuah-run-to-and-fro — NT (Revelation 5) + Tanakh (2 Chronicles 16) [free]
--      (★ the seven lamps = the eyes of Yahuah; the Lamb's seven eyes)
--   5. zechariah-4-the-two-anointed-ones-the-two-olive-trees — NT (Revelation 11) + Tanakh (Ezekiel 37) [free]
--      (★★ the two olive trees = the two witnesses = the two houses, the two sticks made one)
--
-- Framing notes:
--   ★ THE MENORAH (THREAD 1): the all-gold candlestick with its seven lamps (4:2) is the tabernacle
--      menorah Yahuah commanded Moses (Exodus 25:31, 25:37), carried forward into John's vision of
--      *seven golden candlesticks* which are *the seven churches* (Revelation 1:12, 1:20). One lampstand
--      across the library.
--   ★★ NOT BY MIGHT (THREAD 2): the load-bearing word — *Not by might, nor by power, but by my spirit*
--      (4:6). The Spirit, not flesh-strength, builds the house. Framed against the Spirit-vs-Law lie:
--      the SAME Spirit puts the Torah within (*I will put my spirit within you, and cause you to walk in
--      my statutes*, Ezekiel 36:27) and is poured on all flesh (Joel 2:28). Spirit and Torah inseparable.
--   ★★ THE TWO ANOINTED ONES (THREAD 5): *These are the two anointed ones, that stand by Yahuah (Lord)
--      of the whole earth* (4:14) -> *These are the two olive trees, and the two candlesticks standing
--      before the Elohim (God) of the earth* (Revelation 11:4), the two witnesses. Per the framework
--      the two witnesses are the two houses — *I will take the stick of Joseph... and the stick of
--      Yahudah... and make them one stick* (Ezekiel 37:19); *they shall be no more two nations*
--      (37:22) — NOT merely two individuals, but Yahudah and Yashar'el made one.
--   VERSES WITH NO SEPARATE ADD: v.1 (the waking — preface), v.4-5 (the prophet's question — frame),
--      v.8 (the word came — formula), v.11-13 (the question repeated — the answer is v.14, THREAD 5).
--      All recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The candlestick all of gold — the menorah
    ('canon','zechariah',4,2,'canon','exodus',25,31,'free',
      E'*And thou shalt make a candlestick of pure gold: of beaten work shall the candlestick be made: his shaft, and his branches, his bowls, his knops, and his flowers, shall be of the same* (Exodus 25:31). The vision''s *candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon* (Zechariah 4:2) is the tabernacle menorah Yahuah commanded Moses — a *candlestick of pure gold... of beaten work*. The lampstand Zechariah sees is the same lampstand that burned before Yahuah in the holy place.'),
    ('canon','zechariah',4,2,'canon','exodus',25,37,'free',
      E'*And thou shalt make the seven lamps thereof: and they shall light the lamps thereof, that they may give light over against it* (Exodus 25:37). The *seven lamps thereon* of Zechariah 4:2 are the seven lamps of the tabernacle menorah — *the seven lamps thereof... that they may give light*. The sevenfold light of the sanctuary is the very light the prophet beholds in his vision.'),
    ('canon','zechariah',4,2,'canon','revelation',1,12,'free',
      E'*And I turned to see the voice that spake with me. And being turned, I saw seven golden candlesticks* (Revelation 1:12). The *candlestick all of gold, with... his seven lamps thereon* (Zechariah 4:2) is drawn forward into John''s vision of *seven golden candlesticks*. The single sevenfold lampstand becomes the seven golden candlesticks among which the Formed Son walks.'),
    ('canon','zechariah',4,2,'canon','revelation',1,20,'free',
      E'*The mystery of the seven stars which thou sawest in my right hand, and the seven golden candlesticks. The seven stars are the angels of the seven churches: and the seven candlesticks which thou sawest are the seven churches* (Revelation 1:20). The all-gold lampstand of *seven lamps* (Zechariah 4:2) is interpreted at the end: *the seven candlesticks... are the seven churches*. The menorah''s light is the lamp-bearing assembly before Yahuah.'),

    -- THREAD 2 (★★): Not by might, nor by power, but by my spirit
    ('canon','zechariah',4,6,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6) — the same Spirit that finishes the house is the Spirit that *cause[s] you to walk in my statutes*. The Spirit is never set against the Torah; the Spirit is given precisely to write the Torah on the heart and to do it. Spirit and Torah are one work, not rivals.'),
    ('canon','zechariah',4,6,'canon','joel',2,28,'free',
      E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions* (Joel 2:28). The word to Zerubbabel — *not by might, nor by power, but by my spirit* (Zechariah 4:6) — is the same Spirit Yahuah promises to *pour out... upon all flesh*. What is accomplished is accomplished by the Spirit of Yahuah, not by the arm of flesh, in the rebuilding and in the latter outpouring alike.'),

    -- THREAD 4 (★): The seven eyes of Yahuah run to and fro
    ('canon','zechariah',4,10,'canon','2-chronicles',16,9,'free',
      E'*For the eyes of Yahuah (LORD) run to and fro throughout the whole earth, to shew himself strong in the behalf of them whose heart is perfect toward him* (2 Chronicles 16:9). The seven lamps that *are the eyes of Yahuah (LORD), which run to and fro through the whole earth* (Zechariah 4:10) are the very eyes Hanani names — eyes that *run to and fro throughout the whole earth* to strengthen the upright heart. The sevenfold lamps are the all-seeing watch of Yahuah over the earth.'),
    ('canon','zechariah',4,10,'canon','revelation',5,6,'free',
      E'*And I beheld, and, lo, in the midst of the throne and of the four beasts, and in the midst of the elders, stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6). The seven lamps that *are the eyes of Yahuah (LORD), which run to and fro through the whole earth* (Zechariah 4:10) are the Lamb''s *seven eyes... sent forth into all the earth*. The all-seeing eyes of Yahuah are borne by the slain Lamb who ranges over all the earth.'),

    -- THREAD 5 (★★): The two anointed ones — the two olive trees, the two witnesses, the two houses
    ('canon','zechariah',4,14,'canon','revelation',11,4,'free',
      E'*These are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4). *These are the two anointed ones, that stand by Yahuah (Lord) of the whole earth* (Zechariah 4:14) is taken up word for word: the *two olive trees... standing before the Elohim (God) of the earth* are John''s two witnesses. The two olive trees Zechariah saw are the two who stand and testify before Yahuah of the whole earth.'),
    ('canon','zechariah',4,14,'canon','ezekiel',37,19,'free',
      E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The *two anointed ones, that stand by Yahuah (Lord) of the whole earth* (Zechariah 4:14) are, by the framework, the two houses — the stick of Joseph and the stick of Yahudah that Yahuah will *make... one stick*. The two olive trees are Yahudah and Yashar''el, not merely two individuals.'),
    ('canon','zechariah',4,14,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The two olive trees — *the two anointed ones, that stand by Yahuah (Lord) of the whole earth* (Zechariah 4:14) — are the two houses Yahuah gathers into one: *they shall be no more two nations*. The two who stand before Yahuah are the divided people made one again.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-4-the-candlestick-all-of-gold-with-seven-lamps',
       E'The candlestick all of gold with seven lamps — the menorah of the sanctuary',
       E'The angel wakes the prophet to the vision: *I have looked, and behold a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon, and seven pipes to the seven lamps, which are upon the top thereof* (Zechariah 4:2). This is the tabernacle menorah Yahuah commanded Moses to make: *And thou shalt make a candlestick of pure gold: of beaten work shall the candlestick be made* (Exodus 25:31), and *thou shalt make the seven lamps thereof... that they may give light over against it* (Exodus 25:37) — the sevenfold light that burned before Yahuah in the holy place. The same lampstand is carried forward into John''s vision: *being turned, I saw seven golden candlesticks* (Revelation 1:12), interpreted at the end — *the seven candlesticks which thou sawest are the seven churches* (Revelation 1:20). One lampstand across the library: the all-gold menorah of the sanctuary, the seven lamps that give light, the seven golden candlesticks among which the Formed Son walks.',
       sv.verse_id, ev.verse_id, 'free', 45775
  FROM _s338_zec04_lookup sv, _s338_zec04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-4-not-by-might-nor-by-power-but-by-my-spirit',
       E'Not by might, nor by power, but by my spirit — the Spirit and the Torah are one',
       E'At the heart of the vision is the word to Zerubbabel: *This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The house is not finished by the arm of flesh, by army or by human strength, but by the Spirit of Yahuah — *and he shall bring forth the headstone thereof with shoutings, crying, Grace, grace unto it* (4:7). This Spirit is never set against the Torah. It is the very Spirit Yahuah promises to write his instruction within: *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the Spirit given to make the heart obey, not to abolish the law. And it is the Spirit poured out in the latter days: *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28). What Yahuah accomplishes — the rebuilding of the house, the writing of the Torah on the heart, the latter-rain outpouring — is accomplished *not by might, nor by power, but by my spirit*. Spirit and Torah are one work, never rivals.',
       sv.verse_id, ev.verse_id, 'free', 45778
  FROM _s338_zec04_lookup sv, _s338_zec04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- (NOTE: the headstone / finished-house / grace material of v.7-9 is woven into THREAD 2's prose —
--  *not by might... but by my spirit* (4:6) is what brings forth the headstone with *Grace, grace unto
--  it* (4:7) and finishes the house (4:9). No separate empty source-internal thread is created.)

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-4-the-seven-eyes-of-yahuah-run-to-and-fro',
       E'The seven eyes of Yahuah which run to and fro through the whole earth',
       E'The seven lamps of the menorah are named: *they are the eyes of Yahuah (LORD), which run to and fro through the whole earth* (Zechariah 4:10). The sevenfold light is the all-seeing watch of Yahuah over all the earth. Hanani the seer had spoken the same word to Asa: *For the eyes of Yahuah (LORD) run to and fro throughout the whole earth, to shew himself strong in the behalf of them whose heart is perfect toward him* (2 Chronicles 16:9) — eyes that range the whole earth to strengthen the upright. And the vision is gathered up in the Revelation, where the same seven eyes are borne by the slain Lamb: *stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6). The seven eyes of Yahuah that run to and fro are the Lamb''s seven eyes sent forth into all the earth — the all-seeing Spirit of Yahuah ranging over the whole earth, missing nothing, strengthening the faithful.',
       sv.verse_id, ev.verse_id, 'free', 45784
  FROM _s338_zec04_lookup sv, _s338_zec04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-4-the-two-anointed-ones-the-two-olive-trees',
       E'The two anointed ones — the two olive trees, the two witnesses, the two houses',
       E'The prophet presses for the meaning of the two trees: *What are these two olive trees upon the right side of the candlestick and upon the left side thereof?* (Zechariah 4:11); *What be these two olive branches which through the two golden pipes empty the golden oil out of themselves?* (4:12). And the answer: *These are the two anointed ones, that stand by Yahuah (Lord) of the whole earth* (4:14). John takes up this very vision: *These are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4) — Zechariah''s two olive trees are the two witnesses who prophesy and stand before Yahuah of the whole earth. By the framework these two are not merely two individuals but the two houses — Yahudah and Yashar''el, the two sticks Yahuah joins: *Behold, I will take the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19); *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The two olive trees that feed the lampstand with oil are the divided people of Yahuah made one again, standing anointed before the Lord of the whole earth.',
       sv.verse_id, ev.verse_id, 'free', 45787
  FROM _s338_zec04_lookup sv, _s338_zec04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *a candlestick of pure gold: of beaten work shall the candlestick be made* (Exodus 25:31) — the *candlestick all of gold* of Zechariah 4:2 is the tabernacle menorah Yahuah commanded Moses.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-the-candlestick-all-of-gold-with-seven-lamps'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the seven lamps thereof... that they may give light over against it* (Exodus 25:37) — the *seven lamps thereon* of Zechariah 4:2 are the sevenfold light of the sanctuary menorah.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-the-candlestick-all-of-gold-with-seven-lamps'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I saw seven golden candlesticks* (Revelation 1:12) — the single all-gold lampstand of Zechariah 4:2 carried forward into John''s vision of the seven golden candlesticks.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-the-candlestick-all-of-gold-with-seven-lamps'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the seven candlesticks which thou sawest are the seven churches* (Revelation 1:20) — the menorah of *seven lamps* (Zechariah 4:2) is the lamp-bearing assembly before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-the-candlestick-all-of-gold-with-seven-lamps'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — the Spirit of *not by might... but by my spirit* (Zechariah 4:6) is the Spirit given to keep the Torah, not to abolish it.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-not-by-might-nor-by-power-but-by-my-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will pour out my spirit upon all flesh* (Joel 2:28) — the same Spirit by which the house is built (Zechariah 4:6) is poured out in the latter days; the work is Yahuah''s Spirit, never the arm of flesh.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-not-by-might-nor-by-power-but-by-my-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the eyes of Yahuah (LORD) run to and fro throughout the whole earth, to shew himself strong* (2 Chronicles 16:9) — the seven lamps that *are the eyes of Yahuah... which run to and fro* (Zechariah 4:10) are the all-seeing watch over the earth.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=16 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-the-seven-eyes-of-yahuah-run-to-and-fro'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth* (Revelation 5:6) — the seven eyes of Yahuah (Zechariah 4:10) borne by the slain Lamb, ranging over all the earth.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-the-seven-eyes-of-yahuah-run-to-and-fro'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *These are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4) — Zechariah''s *two anointed ones, that stand by Yahuah... of the whole earth* (4:14) are John''s two witnesses.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-the-two-anointed-ones-the-two-olive-trees'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will take the stick of Joseph... even with the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19) — the two olive trees (Zechariah 4:14) are the two houses, the two sticks Yahuah joins into one.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-the-two-anointed-ones-the-two-olive-trees'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the two olive trees (Zechariah 4:14) are the divided people of Yahuah, Yahudah and Yashar''el, made one again.'
  FROM cross_reference_threads t
  JOIN _s338_zec04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s338_zec04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-4-the-two-anointed-ones-the-two-olive-trees'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_5.sql (Zechariah 5) -----
-- Chapter: Zechariah 5 — THE FLYING ROLL AND THE WOMAN IN THE EPHAH. The fifth and sixth night
-- visions. First the flying roll: *This is the curse that goeth forth over the face of the whole
-- earth: for every one that stealeth shall be cut off as on this side according to it; and every
-- one that sweareth shall be cut off as on that side according to it* (5:3) — the covenant-lawsuit
-- written out as a scroll, naming the two breaches of the eighth and third words of the Decalogue
-- (thou shalt not steal; thou shalt not take the Name in vain). The curse enters *the house of the
-- thief, and into the house of him that sweareth falsely by my name* (5:4). This is the Torah's own
-- curse for covenant-breaking (Deuteronomy 27-28), Torah AFFIRMED, never abolished. Then the ephah
-- and the woman called *Wickedness* sealed under a talent of lead (5:5-8) — wickedness/commerce
-- personified and contained. And the woman in the measure is carried by two stork-winged women *To
-- build it an house in the land of Shinar* (5:11) — the false system removed to its own base in
-- BABYLON/Shinar, the place of Babel (Genesis 11), the harlot-city of Revelation 17-18 "MYSTERY,
-- BABYLON THE GREAT." Victims, not enemies: the curse is against the SIN and the SYSTEM, never a
-- people. The harlot vs the bride; wickedness sent home to its own place, the bride gathered to hers.
-- Tag: zec05   Temp view: _s338_zec05_lookup
-- Sort band: base 45800, step 3 -> threads at 45800, 45803, 45806 (3 threads)
-- Source of EVERY row: 'canon','zechariah',5,v
--
-- Zechariah 5 coverage:
--   ★ v.1-4 (the flying roll... This is the curse that goeth forth over the face of the whole earth:
--          for every one that stealeth shall be cut off... and every one that sweareth shall be cut
--          off... into the house of him that sweareth falsely by my name)
--        NT:     ★ Malachi 3:5 is Tanakh (below); the curse-on-theft/false-swearing forward weave is
--                carried in prose (the covenant-lawsuit verdict, not forced to one NT verse) — none
--                warranted distinct
--        Extras: none warranted (the Decalogue-curse is the Tanakh's own; held to Torah witnesses)
--        Tanakh: ★★ Exodus 20:15 (Thou shalt not steal), ★★ Exodus 20:7 (Thou shalt not take the
--                name of Yahuah Elohayka in vain; for Yahuah will not hold him guiltless), ★ Deuteronomy
--                27:26 (Cursed be he that confirmeth not all the words of this law to do them), ★
--                Malachi 3:5 (I will be a swift witness against... false swearers) — THREAD 1
--   v.5-8 (the ephah that goeth forth... a talent of lead: and this is a woman that sitteth in the
--          midst of the ephah... This is wickedness)
--        NT:     none warranted distinct (the Babylon/harlot forward weave lands on v.9-11; the
--                wickedness-in-the-measure is woven to the false-balance witnesses here)
--        Extras: ★ Ecclesiasticus 27:1-2 (Many have sinned for a small matter... as a nail sticketh
--                fast between the joinings of the stones; so does sin stick close between buying and
--                selling) — THREAD 2 (sin lodged in commerce/the measure)
--        Tanakh: ★ Proverbs 11:1 (A false balance is abomination to Yahuah: but a just weight is his
--                delight), ★ Proverbs 20:23 (Divers weights are an abomination unto Yahuah; and a
--                false balance is not good) — THREAD 2 (the corrupt measure = wickedness)
--   ★ v.9-11 (two women... wings like the wings of a stork... To build it an house in the land of
--          Shinar: and it shall be established, and set there upon her own base)
--        NT:     ★★ Revelation 17:5 (upon her forehead was a name written, MYSTERY, BABYLON THE
--                GREAT, THE MOTHER OF HARLOTS), ★★ Revelation 18:2 (Babylon the great is fallen, is
--                fallen) — THREAD 3 (wickedness established at Babylon = the harlot-city)
--        Extras: none warranted (the Babel/Babylon weave is canon-to-canon; clean and sufficient)
--        Tanakh: ★★ Genesis 11:2 (a plain in the land of Shinar; and they dwelt there), ★ Genesis
--                11:9 (the name of it called Babel; because Yahuah did there confound the language)
--                — THREAD 3 (Shinar = the place of Babel, wickedness's own base)
--
-- Threads (slug — target libraries):
--   1. zechariah-5-the-curse-that-goeth-forth-every-one-that-stealeth — Tanakh (Exodus 20, Deut 27,
--      Malachi 3) [free]  (★ the flying roll = the Torah's own curse on theft + false swearing by the
--      Name; Decalogue affirmed, covenant-lawsuit, Torah NOT abolished)
--   2. zechariah-5-this-is-wickedness-in-the-ephah — Extras (Ecclesiasticus 27) + Tanakh (Proverbs)
--      [extras]  (wickedness personified in the measure; sin lodged in buying and selling, the
--      false balance an abomination)
--   3. zechariah-5-to-build-it-an-house-in-the-land-of-shinar — NT (Revelation 17, 18) + Tanakh
--      (Genesis 11) [free]  (★ wickedness carried home to Babylon/Shinar = Babel = MYSTERY BABYLON
--      THE GREAT the harlot-city; the false system removed to its own base)
--
-- Framing notes:
--   ★ THE FLYING ROLL = THE TORAH'S CURSE (THREAD 1): *This is the curse that goeth forth over the
--      face of the whole earth: for every one that stealeth shall be cut off... and every one that
--      sweareth shall be cut off* (Zechariah 5:3), entering *the house of him that sweareth falsely
--      by my name* (5:4). The roll names the eighth and third words of the Decalogue: *Thou shalt
--      not steal* (Exodus 20:15) and *Thou shalt not take the name of Yahuah Elohayka (the LORD thy
--      God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain*
--      (Exodus 20:7). The roll is the covenant-curse for covenant-breaking — *Cursed be he that
--      confirmeth not all the words of this law to do them* (Deuteronomy 27:26) — and Yahuah comes
--      as *a swift witness against... false swearers* (Malachi 3:5). The Torah is AFFIRMED here as
--      the living standard, never the abolished thing; the curse falls on the breach, not on the law.
--      Victims, not enemies: the lawsuit is against the SIN.
--   THE WOMAN CALLED WICKEDNESS (THREAD 2): *behold, there was lifted up a talent of lead: and this
--      is a woman that sitteth in the midst of the ephah. And he said, This is wickedness* (Zechariah
--      5:7-8). The ephah — the merchant's measure — holds Wickedness herself, sealed under lead. The
--      corrupt measure is the abomination: *A false balance is abomination to Yahuah (LORD): but a
--      just weight is his delight* (Proverbs 11:1); *Divers weights are an abomination unto Yahuah
--      (LORD); and a false balance is not good* (Proverbs 20:23). The restored witness names where
--      sin lodges: *as a nail sticketh fast between the joinings of the stones; so does sin stick
--      close between buying and selling* (Ecclesiasticus 27:2). Wickedness in the measure is commerce
--      turned to fraud — contained, weighed, and about to be carried off.
--   ★ TO BUILD IT AN HOUSE IN SHINAR (THREAD 3): the two stork-winged women lift the ephah *between
--      the earth and the heaven* (5:9), and it is borne *To build it an house in the land of Shinar:
--      and it shall be established, and set there upon her own base* (5:11). Shinar is the plain of
--      Babel: *they found a plain in the land of Shinar; and they dwelt there* (Genesis 11:2), where
--      *the name of it called Babel; because Yahuah (LORD) did there confound the language* (11:9).
--      Wickedness is sent home to its own seat — and Revelation names that seat: *upon her forehead
--      was a name written, MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS AND ABOMINATIONS OF THE
--      EARTH* (Revelation 17:5), the city whose end is *Babylon the great is fallen, is fallen*
--      (Revelation 18:2). The woman in the ephah is the harlot-system removed to Babylon — the
--      counterfeit set against the bride, established on its own base only to fall.
--   EXTRAS: Ecclesiasticus 27:1-2 (sin between buying and selling) on the wickedness-in-the-measure
--      — a clean witness, parse verified. No extras forced on the roll or on Shinar (the Decalogue-
--      curse and the Babel/Babylon weave are the library's own canon-to-canon testimony).
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the flying roll, its dimensions — the vision-frame, woven
--      into THREAD 1 with v.3), v.5-6 (the ephah goeth forth, their resemblance through all the earth
--      — preface to THREAD 2), v.9-10 (the two women, the stork wings, "Whither do these bear the
--      ephah?" — the carrying-question, preface to THREAD 3's answer in v.11). All recorded, none
--      silently skipped.

CREATE TEMP VIEW _s338_zec05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The curse that goeth forth — the Torah's own curse on theft + false swearing
    ('canon','zechariah',5,3,'canon','exodus',20,15,'free',
      E'*Thou shalt not steal* (Exodus 20:15). The flying roll''s first verdict — *every one that stealeth shall be cut off as on this side according to it* (Zechariah 5:3) — is the eighth word of the Decalogue written out as a curse. The roll does not overturn the Torah; it executes it, cutting off the breach of *Thou shalt not steal*. The covenant standard is AFFIRMED, never abolished.'),
    ('canon','zechariah',5,3,'canon','exodus',20,7,'free',
      E'*Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7). The roll''s second verdict — *every one that sweareth shall be cut off* (Zechariah 5:3), entering *the house of him that sweareth falsely by my name* (5:4) — is the third word of the Decalogue enforced. The one who swears falsely by the Name is not held guiltless; the curse goes forth against the very breach the Torah named.'),
    ('canon','zechariah',5,4,'canon','deuteronomy',27,26,'free',
      E'*Cursed be he that confirmeth not all the words of this law to do them. And all the people shall say, Amen* (Deuteronomy 27:26). The flying roll that enters *the house of the thief, and into the house of him that sweareth falsely by my name* (Zechariah 5:4) is the covenant-curse of Sinai made airborne — the curse for covenant-breaking, *Cursed be he that confirmeth not all the words of this law to do them*. This is the Torah''s own sanction on its own breach, the lawsuit against the sin and not against a people.'),
    ('canon','zechariah',5,3,'canon','malachi',3,5,'free',
      E'*And I will come near to you to judgment; and I will be a swift witness against the sorcerers, and against the adulterers, and against false swearers... and fear not me, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 3:5). The roll that cuts off *every one that sweareth* (Zechariah 5:3) is Yahuah coming near *a swift witness against... false swearers*. The same covenant-lawsuit, the same swift verdict on theft and false oath; Yahuah Tseva''ot is the witness against the breach of his own law.'),

    -- THREAD 2: This is wickedness in the ephah — the corrupt measure (commerce turned to fraud)
    ('canon','zechariah',5,8,'apocrypha','ecclesiasticus',27,1,'extras',
      E'*Many have sinned for a small matter; and he that seeks for abundance will turn his eyes away* (Ecclesiasticus 27:1). The woman called *wickedness* sealed in the ephah (Zechariah 5:8) — the merchant''s measure made the seat of sin — is the very thing the restored wisdom names: *Many have sinned for a small matter; and he that seeks for abundance will turn his eyes away*. Greed for gain is the wickedness the ephah carries.'),
    ('canon','zechariah',5,8,'apocrypha','ecclesiasticus',27,2,'extras',
      E'*As a nail sticketh fast between the joinings of the stones; so does sin stick close between buying and selling* (Ecclesiasticus 27:2). The ephah is the measure of buying and selling, and *This is wickedness* (Zechariah 5:8) sits in the midst of it — for *sin stick[s] close between buying and selling*, lodged fast as a nail in the stones. Wickedness in the measure is commerce turned to fraud, weighed and contained for removal.'),
    ('canon','zechariah',5,8,'canon','proverbs',11,1,'free',
      E'*A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1). The woman *wickedness* enthroned in the ephah (Zechariah 5:8) is the corrupted measure itself — and *A false balance is abomination to Yahuah (LORD)*. The dishonest weight is no small thing; it is the abomination Yahuah seals under lead and casts out of the land.'),
    ('canon','zechariah',5,8,'canon','proverbs',20,23,'free',
      E'*Divers weights are an abomination unto Yahuah (LORD); and a false balance is not good* (Proverbs 20:23). When the angel names the ephah''s occupant — *This is wickedness* (Zechariah 5:8) — he names what Proverbs already condemned: *Divers weights are an abomination unto Yahuah (LORD); and a false balance is not good*. The fraudulent measure is the wickedness the vision lifts up and carries away.'),

    -- THREAD 3 (★): To build it an house in the land of Shinar — wickedness home to Babylon/Babel
    ('canon','zechariah',5,11,'canon','genesis',11,2,'free',
      E'*And it came to pass, as they journeyed from the east, that they found a plain in the land of Shinar; and they dwelt there* (Genesis 11:2). Wickedness is borne *To build it an house in the land of Shinar* (Zechariah 5:11) — back to the plain where Babel began: *they found a plain in the land of Shinar; and they dwelt there*. The ephah of wickedness returns to its own ground, the cradle of the tower built against heaven.'),
    ('canon','zechariah',5,11,'canon','genesis',11,9,'free',
      E'*Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth* (Genesis 11:9). Shinar where the ephah is *established, and set there upon her own base* (Zechariah 5:11) is Babel — *the name of it called Babel; because Yahuah (LORD) did there confound the language*. Wickedness is sent home to the city of confusion, set on its own base in the place it was born.'),
    ('canon','zechariah',5,11,'canon','revelation',17,5,'free',
      E'*And upon her forehead was a name written, MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS AND ABOMINATIONS OF THE EARTH* (Revelation 17:5). The woman carried to a house in Shinar (Zechariah 5:11) is the harlot John sees by her own name: *MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS*. The woman in the ephah and the woman on the beast are one figure — wickedness established at Babylon, the false system set against the bride.'),
    ('canon','zechariah',5,11,'canon','revelation',18,2,'free',
      E'*And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird* (Revelation 18:2). Wickedness *established... upon her own base* in Shinar (Zechariah 5:11) is established only to fall: *Babylon the great is fallen, is fallen*. The house built for the woman in the ephah becomes the haunt of devils and the ruin Revelation announces; the counterfeit-city''s end is sure.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-5-the-curse-that-goeth-forth-every-one-that-stealeth',
       E'The curse that goeth forth — the flying roll is the Torah''s own curse',
       E'The fifth night vision is a scroll in the air: *Then I turned, and lifted up mine eyes, and looked, and behold a flying roll* (Zechariah 5:1), and the angel reads it: *This is the curse that goeth forth over the face of the whole earth: for every one that stealeth shall be cut off as on this side according to it; and every one that sweareth shall be cut off as on that side according to it* (5:3). It enters *the house of the thief, and into the house of him that sweareth falsely by my name* (5:4). The two breaches named are two words of the Decalogue: *Thou shalt not steal* (Exodus 20:15) and *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7). The roll does not abolish the Torah — it EXECUTES it. This is the covenant-curse of Sinai for covenant-breaking: *Cursed be he that confirmeth not all the words of this law to do them. And all the people shall say, Amen* (Deuteronomy 27:26). And the prophet who closes the Tanakh speaks the same verdict: *I will come near to you to judgment; and I will be a swift witness against the sorcerers, and against the adulterers, and against false swearers... saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 3:5). The Torah is affirmed here as the living standard; the curse falls on the breach, never on the law, and the lawsuit is against the SIN — victims, not enemies.',
       sv.verse_id, ev.verse_id, 'free', 45800
  FROM _s338_zec05_lookup sv, _s338_zec05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-5-this-is-wickedness-in-the-ephah',
       E'This is wickedness — the woman sealed in the ephah, the corrupt measure',
       E'The sixth vision shows wickedness contained: *And, behold, there was lifted up a talent of lead: and this is a woman that sitteth in the midst of the ephah. And he said, This is wickedness. And he cast it into the midst of the ephah; and he cast the weight of lead upon the mouth thereof* (Zechariah 5:7-8). The ephah is the merchant''s measure, and Wickedness herself sits in it, sealed under lead. The corrupted measure is no small sin — it is the abomination: *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1); *Divers weights are an abomination unto Yahuah (LORD); and a false balance is not good* (Proverbs 20:23). The restored wisdom names exactly where this wickedness lodges: *Many have sinned for a small matter; and he that seeks for abundance will turn his eyes away* (Ecclesiasticus 27:1), for *as a nail sticketh fast between the joinings of the stones; so does sin stick close between buying and selling* (Ecclesiasticus 27:2). Wickedness in the ephah is commerce turned to fraud, greed wedged fast in buying and selling — and Yahuah weighs it, seals it under lead, and carries it out of the land.',
       sv.verse_id, ev.verse_id, 'extras', 45803
  FROM _s338_zec05_lookup sv, _s338_zec05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-5-to-build-it-an-house-in-the-land-of-shinar',
       E'To build it an house in the land of Shinar — wickedness home to Babylon',
       E'The ephah does not stay; it is carried away: *Then lifted I up mine eyes, and looked, and, behold, there came out two women, and the wind was in their wings; for they had wings like the wings of a stork: and they lifted up the ephah between the earth and the heaven* (Zechariah 5:9). And the destination is named: *To build it an house in the land of Shinar: and it shall be established, and set there upon her own base* (5:11). Shinar is the plain of Babel — *they found a plain in the land of Shinar; and they dwelt there* (Genesis 11:2), where *the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth* (11:9). Wickedness is sent home to the cradle of the tower built against heaven, set on its own base in the place it was born. And Revelation names that seat by her own forehead-name: *upon her forehead was a name written, MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS AND ABOMINATIONS OF THE EARTH* (Revelation 17:5) — the woman in the ephah and the woman on the beast are one figure, the harlot-system established at Babylon, set against the bride. But the house built for her is built only to fall: *Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit* (Revelation 18:2). The counterfeit-city is removed to its own place, established for a moment, and judged.',
       sv.verse_id, ev.verse_id, 'free', 45806
  FROM _s338_zec05_lookup sv, _s338_zec05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Thou shalt not steal* (Exodus 20:15) — the roll''s first verdict, *every one that stealeth shall be cut off* (Zechariah 5:3), is the eighth word of the Decalogue executed; Torah affirmed, not abolished.'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-the-curse-that-goeth-forth-every-one-that-stealeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless* (Exodus 20:7) — the roll enters *the house of him that sweareth falsely by my name* (Zechariah 5:4); the third word enforced.'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-the-curse-that-goeth-forth-every-one-that-stealeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Cursed be he that confirmeth not all the words of this law to do them. And all the people shall say, Amen* (Deuteronomy 27:26) — the flying roll is the covenant-curse of Sinai for covenant-breaking, made airborne (Zechariah 5:4).'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-the-curse-that-goeth-forth-every-one-that-stealeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I will be a swift witness against... false swearers... saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 3:5) — the roll that cuts off *every one that sweareth* (Zechariah 5:3) is Yahuah coming near as swift witness against the breach of his own law.'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-the-curse-that-goeth-forth-every-one-that-stealeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1) — the woman *wickedness* in the ephah (Zechariah 5:8) IS the corrupted measure, the abomination Yahuah seals under lead.'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-this-is-wickedness-in-the-ephah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Divers weights are an abomination unto Yahuah (LORD); and a false balance is not good* (Proverbs 20:23) — *This is wickedness* (Zechariah 5:8) is the fraudulent measure Proverbs already condemned.'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-this-is-wickedness-in-the-ephah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Many have sinned for a small matter; and he that seeks for abundance will turn his eyes away* (Ecclesiasticus 27:1) — greed for gain is the wickedness the ephah carries (Zechariah 5:8).'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=27 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-this-is-wickedness-in-the-ephah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*as a nail sticketh fast between the joinings of the stones; so does sin stick close between buying and selling* (Ecclesiasticus 27:2) — wickedness in the ephah (the merchant''s measure) is sin lodged fast in buying and selling (Zechariah 5:8).'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=27 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-this-is-wickedness-in-the-ephah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they found a plain in the land of Shinar; and they dwelt there* (Genesis 11:2) — the ephah is borne *To build it an house in the land of Shinar* (Zechariah 5:11), back to the plain where Babel began.'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-to-build-it-an-house-in-the-land-of-shinar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the name of it called Babel; because Yahuah (LORD) did there confound the language* (Genesis 11:9) — Shinar where the ephah is *set... upon her own base* (Zechariah 5:11) is Babel, the city of confusion.'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-to-build-it-an-house-in-the-land-of-shinar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *upon her forehead was a name written, MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS* (Revelation 17:5) — the woman carried to a house in Shinar (Zechariah 5:11) is the harlot of Babylon, the false system set against the bride.'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-to-build-it-an-house-in-the-land-of-shinar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Babylon the great is fallen, is fallen, and is become the habitation of devils* (Revelation 18:2) — the house *established... upon her own base* (Zechariah 5:11) is established only to fall; the counterfeit-city''s end is sure.'
  FROM cross_reference_threads t
  JOIN _s338_zec05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s338_zec05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-5-to-build-it-an-house-in-the-land-of-shinar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_6.sql (Zechariah 6) -----
-- Chapter: Zechariah 6 — THE FOUR CHARIOTS and ★ THE BRANCH crowned (priest-king).
-- The four chariots / four spirits of the heavens go forth from between two mountains of brass
-- (6:1-8) — the patrolling spirits that walk to and fro through the earth, the Revelation 6 four
-- horses, the horsemen of Zechariah 1. Then the KEYSTONE: crowns of silver and gold set on the
-- head of Joshua the high priest, and the word *Behold the man whose name is The BRANCH... and he
-- shall build the temple of Yahuah... and he shall bear the glory, and shall sit and rule upon his
-- throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them
-- both* (6:11-13). The BRANCH is the priest-KING on ONE throne — Judah-king and Levi-priest
-- reconciled in one, the offices David could not unite. He is the Formed Son who HAS a Father,
-- Yahusha bearing glory on his throne (NOT trinitarian co-equal persons): the righteous Branch of
-- Jeremiah 23/33, the BRANCH of Zechariah 3, the branch of Yahuah of Isaiah 4, the rod from Jesse
-- of Isaiah 11, the priest after Melek Tsadiq of Psalm 110 and Hebrews 7, the man Pilate shows
-- forth (John 19:5). The temple he builds is the body-temple (John 2:19-21), the holy temple of
-- the gathered (Ephesians 2 / 1 Peter 2). And *they that are far off shall come and build in the
-- temple of Yahuah* (6:15) — the two-house ingathering, the far-off brought near.
-- Tag: zec06   Temp view: _s338_zec06_lookup
-- Sort band: base 45825, step 3 -> threads at 45825, 45828, 45831, 45834, 45837 (5 threads)
-- Source of EVERY row: 'canon','zechariah',6,v
--
-- Zechariah 6 coverage:
--   v.1-3 (behold, there came four chariots out from between two mountains... mountains of brass;
--          red horses... black horses... white horses... grisled and bay horses)
--        NT:     ★ Revelation 6:2,4,5,8 (white horse... red... black... pale horse) — THREAD 1
--        Extras: none warranted (Rev 6 is the direct library answer; Enoch winds/quarters too diffuse)
--        Tanakh: ★ Zechariah 1:8,10 (a man riding upon a red horse... these are they whom Yahuah
--                hath sent to walk to and fro through the earth) — THREAD 1
--   v.4-5 (What are these, my lord?... These are the four spirits of the heavens, which go forth
--          from standing before Yahuah (Lord) of all the earth)
--        NT:     woven into THREAD 1 (the spirits sent forth = the seal-riders sent forth)
--        Extras: none warranted
--        Tanakh: Zechariah 1:10 (THREAD 1 — sent to walk to and fro)
--   v.6-8 (the black horses... go forth into the north country... have quieted my spirit in the
--          north country)
--        NT:     none warranted distinct (the patrol/quieting woven into THREAD 1 prose)
--        Extras: none warranted
--        Tanakh: held in THREAD 1 prose (the north country = Babylon judged, spirit quieted)
--   v.9-11 (Take silver and gold, and make crowns, and set them upon the head of Joshua the son of
--          Josedech, the high priest)
--        NT:     woven into THREAD 2 (the crowning of the priest who bears the BRANCH-name)
--        Extras: none warranted
--        Tanakh: ★ Zechariah 3:8 (behold, I will bring forth my servant the BRANCH) — THREAD 2
--   ★★★ v.12-13 (Behold the man whose name is The BRANCH... he shall build the temple of Yahuah...
--          he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest
--          upon his throne: and the counsel of peace shall be between them both) — THE KEYSTONE
--        NT:     ★★★ John 19:5 (Behold the man!) — THREAD 2; ★★★ Hebrews 7:24-27 (an unchangeable
--                priesthood... he ever liveth to make intercession) — THREAD 3
--        Extras: none warranted (the priest-king fusion carried clean by Ps 110 + Heb 7)
--        Tanakh: ★ Zechariah 3:8, ★ Jeremiah 23:5-6, ★ Jeremiah 33:15-16, ★ Isaiah 4:2, ★ Isaiah
--                11:1 (the Branch threads) — THREAD 2; ★★ Psalm 110:1,4 (Sit thou at my right hand...
--                a priest for ever after the order of Melek Tsadiq) — THREAD 3
--   ★★ v.12-13 (he shall build the temple of Yahuah) read as the body-temple / gathered-temple
--        NT:     ★★ John 2:19-21 (Destroy this temple... he spake of the temple of his body),
--                ★★ Ephesians 2:20-22 (built upon the foundation... an holy temple in Yahuah),
--                ★ 1 Peter 2:5 (lively stones... built up a spiritual house) — THREAD 4
--        Extras: none warranted
--        Tanakh: woven into THREAD 4 prose
--   v.14 (the crowns shall be... for a memorial in the temple of Yahuah)
--        NT/Extras/Tanakh: none warranted (the memorial-crown detail woven into THREAD 2 prose)
--   ★★ v.15 (they that are far off shall come and build in the temple of Yahuah... if ye will
--          diligently obey the voice of Yahuah Elohaychem)
--        NT:     ★★ Ephesians 2:13,17,19 (ye who sometimes were far off are made nigh... preached
--                peace to you which were afar off, and to them that were nigh... no more strangers)
--                — THREAD 5
--        Extras: none warranted
--        Tanakh: the two-house ingathering woven into THREAD 5 prose; the obey-the-voice clause
--                carries the Torah-kept condition (1 John 2:3-4 filter, named in prose)
--
-- Threads (slug — target libraries):
--   1. zechariah-6-the-four-chariots-four-spirits-of-the-heavens — NT (Revelation 6) + Tanakh (Zechariah 1) [free]
--      (the four chariots / four spirits sent forth; the patrolling riders, the Rev 6 seals)
--   2. zechariah-6-behold-the-man-whose-name-is-the-branch — NT (John 19) + Tanakh (Zechariah 3, Jeremiah 23, Jeremiah 33, Isaiah 4, Isaiah 11) [free]
--      (★★★ THE KEYSTONE — the BRANCH crowned, behold the man, the righteous Branch the Formed Son who has a Father)
--   3. zechariah-6-a-priest-upon-his-throne-after-melek-tsadiq — NT (Hebrews 7) + Tanakh (Psalm 110) [free]
--      (★★ priest AND king on one throne — the order of Melek Tsadiq, the counsel of peace between both offices)
--   4. zechariah-6-he-shall-build-the-temple-of-yahuah — NT (John 2, Ephesians 2, 1 Peter 2) [free]
--      (★★ the temple the BRANCH builds = the body-temple raised, the gathered holy temple)
--   5. zechariah-6-they-that-are-far-off-shall-come-and-build — NT (Ephesians 2) [free]
--      (★★ the far-off brought near to build — the two-house ingathering, made nigh by the blood)
--
-- Framing notes:
--   ★ THE FOUR CHARIOTS (THREAD 1): *behold, there came four chariots out from between two mountains;
--      and the mountains were mountains of brass* (6:1) — *These are the four spirits of the heavens,
--      which go forth from standing before Yahuah (Lord) of all the earth* (6:5), sent to *walk to and
--      fro through the earth* (6:7). The same patrol as Zechariah 1: *I saw by night, and behold a man
--      riding upon a red horse... these are they whom Yahuah (LORD) hath sent to walk to and fro
--      through the earth* (1:8,10). And the colours go forth as the four seal-riders of Revelation 6:
--      white, red, black, pale. The north-country horses *have quieted my spirit in the north country*
--      (6:8) — Babylon judged, the oppressor stilled.
--   ★★★ BEHOLD THE MAN, THE BRANCH (THREAD 2): the crowns are set on Joshua the high priest, and the
--      word is *Behold the man whose name is The BRANCH; and he shall grow up out of his place* (6:12).
--      This is the named Branch of the prophets: *behold, I will bring forth my servant the BRANCH*
--      (Zechariah 3:8); *I will raise unto David a righteous Branch, and a King shall reign and prosper*
--      (Jeremiah 23:5), called *Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (23:6) for both houses —
--      *In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely*;
--      *the Branch of righteousness to grow up unto David* (Jeremiah 33:15); *the branch of Yahuah
--      (LORD)* beautiful and glorious (Isaiah 4:2); *a Branch shall grow out of his roots* (Isaiah 11:1).
--      And Pilate, not knowing, fulfils the very word: *Then came Yahusha (Jesus) forth, wearing the
--      crown of thorns... Behold the man!* (John 19:5). The crowned high priest named BRANCH is the
--      Formed Son who bears the glory and has a Father — NOT a co-equal trinitarian person.
--   ★★ A PRIEST UPON HIS THRONE (THREAD 3): *he shall bear the glory, and shall sit and rule upon his
--      throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them
--      both* (6:13). King AND priest on ONE throne — the offices David could not hold, Judah-king and
--      Levi-priest reconciled in one. This is the priest after Melek Tsadiq: *Yahuah (LORD) said unto
--      my Lord, Sit thou at my right hand* (Psalm 110:1); *Thou art a priest for ever after the order
--      of Melek Tsadiq (Melchizedek)* (110:4) — Melek Tsadiq being himself king-of-righteousness AND
--      priest (Hebrews 7:2). Hebrews names the unending priesthood: *this man, because he continueth
--      ever, hath an unchangeable priesthood... he ever liveth to make intercession for them*
--      (7:24-25), *this he did once, when he offered up himself* (7:27). The counsel of peace between
--      the two offices is the peace the one Mediator makes.
--   ★★ THE TEMPLE HE BUILDS (THREAD 4): *he shall build the temple of Yahuah (LORD)... Even he shall
--      build the temple of Yahuah (LORD)* (6:12-13). The Branch raises a temple — and Yahusha names
--      it: *Destroy this temple, and in three days I will raise it up... he spake of the temple of his
--      body* (John 2:19-21). That body-temple becomes the gathered house: *built upon the foundation
--      of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner
--      stone... an holy temple in Yahuah (Lord)* (Ephesians 2:20-21); *as lively stones, are built up
--      a spiritual house, an holy priesthood* (1 Peter 2:5).
--   ★★ THE FAR OFF SHALL BUILD (THREAD 5): *And they that are far off shall come and build in the
--      temple of Yahuah (LORD)... if ye will diligently obey the voice of Yahuah Elohaychem (the LORD
--      your God)* (6:15). The far-off are the scattered brought home to build — the two-house
--      ingathering Paul names: *ye who sometimes were far off are made nigh by the blood of Messiah*
--      (Ephesians 2:13); *peace to you which were afar off, and to them that were nigh* (2:17); *no
--      more strangers and foreigners, but fellowcitizens* (2:19). The condition *if ye will diligently
--      obey the voice* keeps the covenant-Torah inseparable from the gathering (1 John 2:3-4 filter):
--      the far-off are gathered to OBEY, not gathered out of obedience.
--   VERSES WITH NO SEPARATE ADD: v.4 (the question — preface to the answer of v.5, THREAD 1), v.6-7
--      (the directions of the patrol — woven into THREAD 1), v.9-10 (the word/the captives Heldai,
--      Tobijah, Jedaiah — the historical setting of the crowning, woven into THREAD 2), v.14 (the
--      memorial crowns — woven into THREAD 2). All recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: The four chariots / four spirits of the heavens (Revelation 6 seals; Zechariah 1 horsemen)
    ('canon','zechariah',6,1,'canon','zechariah',1,8,'free',
      E'*I saw by night, and behold a man riding upon a red horse, and he stood among the myrtle trees that were in the bottom; and behind him were there red horses, speckled, and white* (Zechariah 1:8). The four chariots *out from between two mountains* (Zechariah 6:1) are the same patrol Zechariah first saw in the night vision — the riders sent by Yahuah, the coloured horses going forth at the Word''s command.'),
    ('canon','zechariah',6,5,'canon','zechariah',1,10,'free',
      E'*And the man that stood among the myrtle trees answered and said, These are they whom Yahuah (LORD) hath sent to walk to and fro through the earth* (Zechariah 1:10). The angel''s answer in chapter 6 is the same word: *These are the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* (Zechariah 6:5), who *walk to and fro through the earth* (6:7). The sent spirits patrol the whole earth at the command of the Lord of all the earth.'),
    ('canon','zechariah',6,3,'canon','revelation',6,2,'free',
      E'*And I saw, and behold a white horse: and he that sat on him had a bow; and a crown was given unto him: and he went forth conquering, and to conquer* (Revelation 6:2). The coloured horses that *go forth* in Zechariah''s chariots — *In the third chariot white horses* (Zechariah 6:3) — open into the four seal-riders John sees: the same horses sent forth over the earth, the white going forth to conquer.'),
    ('canon','zechariah',6,2,'canon','revelation',6,4,'free',
      E'*And there went out another horse that was red: and power was given to him that sat thereon to take peace from the earth* (Revelation 6:4). *In the first chariot were red horses* (Zechariah 6:2); John''s second seal looses the same red horse over the earth. The chariots Zechariah saw going forth from before the Lord of all the earth are the seal-riders sent to do their work upon it.'),
    ('canon','zechariah',6,2,'canon','revelation',6,5,'free',
      E'*And when he had opened the third seal... I beheld, and lo a black horse; and he that sat on him had a pair of balances in his hand* (Revelation 6:5). *In the second chariot black horses* (Zechariah 6:2) go forth into the north country (6:6); John''s third seal looses the black horse. The same colours, the same going-forth — the chariots of the four spirits open into the four seals over the earth.'),
    ('canon','zechariah',6,3,'canon','revelation',6,8,'free',
      E'*And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him* (Revelation 6:8). The *grisled and bay horses* of the fourth chariot (Zechariah 6:3) match the fourth seal''s pale horse — the last of the four sent over the earth. Zechariah''s four chariots and John''s four seal-riders are one apparatus of the patrolling, judging spirits sent forth from before the Lord.'),

    -- THREAD 2 (★★★): Behold the man whose name is The BRANCH (the Branch threads + behold the man)
    ('canon','zechariah',6,12,'canon','zechariah',3,8,'free',
      E'*Hear now, O Joshua the high priest... behold, I will bring forth my servant the BRANCH* (Zechariah 3:8). Three chapters earlier the same Joshua hears the Branch-promise; now the crown is set on his head and the word comes: *Behold the man whose name is The BRANCH; and he shall grow up out of his place* (Zechariah 6:12). The high priest is the living sign of the coming servant-BRANCH, my-servant brought forth.'),
    ('canon','zechariah',6,12,'canon','jeremiah',23,5,'free',
      E'*Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5). The BRANCH whose name is set on the crowned priest (Zechariah 6:12) is the *righteous Branch* raised to David — a KING who reigns. The priestly crown and the royal Branch meet in one man.'),
    ('canon','zechariah',6,12,'canon','jeremiah',23,6,'free',
      E'*In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely: and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6). The BRANCH (Zechariah 6:12) saves BOTH houses — Yahudah saved and Yashar''el dwelling safely — and bears the Name itself. The crowned-priest Branch is the two-house King-of-righteousness.'),
    ('canon','zechariah',6,12,'canon','jeremiah',33,15,'free',
      E'*In those days, and at that time, will I cause the Branch of righteousness to grow up unto David; and he shall execute judgment and righteousness in the land* (Jeremiah 33:15). *He shall grow up out of his place* (Zechariah 6:12) is the very growing-up of the *Branch of righteousness* unto David — the promise made to *the house of Yashar''el (Israel) and to the house of Yahudah (Judah)* (33:14), both houses again.'),
    ('canon','zechariah',6,12,'canon','isaiah',4,2,'free',
      E'*In that day shall the branch of Yahuah (LORD) be beautiful and glorious, and the fruit of the earth shall be excellent and comely for them that are escaped of Yashar''el (Israel)* (Isaiah 4:2). The man *whose name is The BRANCH* (Zechariah 6:12) is the *branch of Yahuah* — glorious, the glory of the escaped remnant of Yashar''el. He grows up beautiful for those gathered home.'),
    ('canon','zechariah',6,12,'canon','isaiah',11,1,'free',
      E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). *He shall grow up out of his place* (Zechariah 6:12) and *a Branch shall grow out of his roots* are one growing — the Davidic Branch sprung from the felled stem of Jesse, the priest-King who builds the temple.'),
    ('canon','zechariah',6,12,'canon','john',19,5,'free',
      E'*Then came Yahusha (Jesus) forth, wearing the crown of thorns, and the purple robe. And Pilate saith unto them, Behold the man!* (John 19:5). The word *Behold the man whose name is The BRANCH* (Zechariah 6:12) is fulfilled in Pilate''s unknowing cry — the crowned man brought forth. Where Zechariah''s priest wore crowns of silver and gold, the BRANCH himself wears the crown of thorns; the same *Behold the man*, the same Formed Son who bears the glory and has a Father.'),

    -- THREAD 3 (★★): A priest upon his throne after the order of Melek Tsadiq (Psalm 110; Hebrews 7)
    ('canon','zechariah',6,13,'canon','psalms',110,1,'free',
      E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). *He shall... sit and rule upon his throne* (Zechariah 6:13) is the enthroned Lord David sees seated at Yahuah''s right hand. The BRANCH ruling on his throne is the One Yahuah bids *Sit thou at my right hand* — the Formed Son enthroned, who has a Father over him.'),
    ('canon','zechariah',6,13,'canon','psalms',110,4,'free',
      E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). *He shall be a priest upon his throne* (Zechariah 6:13) — a king who is ALSO priest — is exactly the priest-king order of Melek Tsadiq, who was king of Salem AND priest of El Elyon. The two offices David could not unite are sworn into one in the BRANCH.'),
    ('canon','zechariah',6,13,'canon','hebrews',7,24,'free',
      E'*But this man, because he continueth ever, hath an unchangeable priesthood* (Hebrews 7:24). The priest who *shall be a priest upon his throne* (Zechariah 6:13) holds an unending priesthood — not passing from death to death like the Levites, but continuing ever. The enthroned priest-King serves a priesthood that never changes hands.'),
    ('canon','zechariah',6,13,'canon','hebrews',7,25,'free',
      E'*Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). *The counsel of peace shall be between them both* (Zechariah 6:13) — the peace the priest-King makes — is his ever-living intercession: he *ever liveth to make intercession*, the priest on the throne reconciling. King and priest in one, he makes peace between Elohim and his people.'),

    -- THREAD 4 (★★): He shall build the temple of Yahuah (the body-temple; the gathered temple)
    ('canon','zechariah',6,12,'canon','john',2,19,'free',
      E'*Yahusha (Jesus) answered and said unto them, Destroy this temple, and in three days I will raise it up* (John 2:19). *He shall build the temple of Yahuah (LORD)* (Zechariah 6:12) — the temple the BRANCH builds — is the temple Yahusha says he himself will raise. The Branch-builder names the temple as his own to raise up.'),
    ('canon','zechariah',6,13,'canon','john',2,21,'free',
      E'*But he spake of the temple of his body* (John 2:21). *Even he shall build the temple of Yahuah (LORD)* (Zechariah 6:13) — the temple the BRANCH raises is the body-temple, the temple *of his body*, raised in three days. The house the priest-King builds is himself, the dwelling of the glory.'),
    ('canon','zechariah',6,13,'canon','ephesians',2,20,'free',
      E'*And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20). The temple the BRANCH builds (Zechariah 6:13) grows from himself as the corner stone — the gathered house *built upon the foundation*. He who *shall build the temple of Yahuah* is its chief corner stone.'),
    ('canon','zechariah',6,13,'canon','ephesians',2,21,'free',
      E'*In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21). *Even he shall build the temple of Yahuah (LORD)* (Zechariah 6:13) is fulfilled as the gathered *building fitly framed together* grows into *an holy temple in Yahuah* — the living temple the priest-King raises out of his own people.'),
    ('canon','zechariah',6,13,'canon','1-peter',2,5,'free',
      E'*Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ)* (1 Peter 2:5). The temple the BRANCH builds (Zechariah 6:13) is raised of *lively stones* into *a spiritual house, an holy priesthood* — and because the builder is *a priest upon his throne*, the house he builds is itself a priesthood.'),

    -- THREAD 5 (★★): They that are far off shall come and build (the two-house ingathering)
    ('canon','zechariah',6,15,'canon','ephesians',2,13,'free',
      E'*But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13). *They that are far off shall come and build in the temple of Yahuah (LORD)* (Zechariah 6:15) — the scattered, the far-off, brought home to build. Paul names how they come: the far-off *made nigh by the blood of Messiah*, gathered to build the one temple.'),
    ('canon','zechariah',6,15,'canon','ephesians',2,17,'free',
      E'*And came and preached peace to you which were afar off, and to them that were nigh* (Ephesians 2:17). The two-house ingathering of *they that are far off* (Zechariah 6:15) is the peace preached *to you which were afar off, and to them that were nigh* — the near house (Yahudah) and the far house (scattered Yashar''el) made one in the temple the Branch builds.'),
    ('canon','zechariah',6,15,'canon','ephesians',2,19,'free',
      E'*Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God)* (Ephesians 2:19). *They that are far off shall come and build* (Zechariah 6:15) become *no more strangers and foreigners, but fellowcitizens* — the far-off gathered into the household of Elohim, building the same temple. The condition stands: *if ye will diligently obey the voice of Yahuah Elohaychem* (6:15) — gathered to OBEY, never gathered out of obedience.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-6-the-four-chariots-four-spirits-of-the-heavens',
       E'The four chariots — the four spirits of the heavens sent forth',
       E'The vision opens with chariots between brass mountains: *behold, there came four chariots out from between two mountains; and the mountains were mountains of brass. In the first chariot were red horses; and in the second chariot black horses; And in the third chariot white horses; and in the fourth chariot grisled and bay horses* (Zechariah 6:1-3). The angel names them: *These are the four spirits of the heavens, which go forth from standing before Yahuah (Lord) of all the earth* (6:5), sent to *walk to and fro through the earth* (6:7), and the north-country horses *have quieted my spirit in the north country* (6:8) — Babylon judged, the oppressor stilled. This is the same patrol Zechariah saw at the first: *I saw by night, and behold a man riding upon a red horse... these are they whom Yahuah (LORD) hath sent to walk to and fro through the earth* (Zechariah 1:8,10). And it opens forward into the four seal-riders John sees loosed over the earth: *behold a white horse... he went forth conquering* (Revelation 6:2), *another horse that was red... to take peace from the earth* (6:4), *a black horse* with the balances (6:5), and *a pale horse: and his name that sat on him was Death* (6:8). One apparatus across the library — the coloured horses sent forth from before the Lord of all the earth to do his work upon it.',
       sv.verse_id, ev.verse_id, 'free', 45825
  FROM _s338_zec06_lookup sv, _s338_zec06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-6-behold-the-man-whose-name-is-the-branch',
       E'Behold the man whose name is The BRANCH — the crowned priest-King',
       E'The crowns of silver and gold are set on the high priest''s head, and the keystone word comes: *Then take silver and gold, and make crowns, and set them upon the head of Joshua the son of Josedech, the high priest; And speak unto him, saying, Thus speaketh Yahuah Tseva''ot (LORD of hosts), saying, Behold the man whose name is The BRANCH; and he shall grow up out of his place* (Zechariah 6:11-12). A high PRIEST crowned with a KING''s crown and named for the coming BRANCH — the two offices meeting in one man. The Branch is named across the prophets: *behold, I will bring forth my servant the BRANCH* (Zechariah 3:8); *I will raise unto David a righteous Branch, and a King shall reign and prosper* (Jeremiah 23:5), called *Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* who saves BOTH houses — *In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely* (23:6); *the Branch of righteousness to grow up unto David* (Jeremiah 33:15); *the branch of Yahuah (LORD)* beautiful and glorious for *them that are escaped of Yashar''el (Israel)* (Isaiah 4:2); *a Branch shall grow out of his roots* (Isaiah 11:1). And the word *Behold the man* is fulfilled at the judgment-seat, where Pilate brings the crowned man forth: *Then came Yahusha (Jesus) forth, wearing the crown of thorns, and the purple robe. And Pilate saith unto them, Behold the man!* (John 19:5). Where Zechariah''s priest wore crowns of silver and gold, the BRANCH himself wears the crown of thorns. He is the Formed Son who *shall bear the glory* (6:13) and HAS a Father — not a co-equal trinitarian person, but the One drawn from the Formless, crowned priest and King in one.',
       sv.verse_id, ev.verse_id, 'free', 45828
  FROM _s338_zec06_lookup sv, _s338_zec06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=6 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-6-a-priest-upon-his-throne-after-melek-tsadiq',
       E'A priest upon his throne — the order of Melek Tsadiq, the counsel of peace',
       E'The keystone clause fuses the two offices on one throne: *Even he shall build the temple of Yahuah (LORD); and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13). A KING who rules on his throne, who is ALSO a PRIEST on that same throne — the offices David could not unite (a king who could not serve at the altar), Judah-king and Levi-priest reconciled in one man. This is the priest-king order of Melek Tsadiq, sworn in the psalm David could not explain: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1), and *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4) — Melek Tsadiq being himself king of Salem AND priest of El Elyon. Hebrews names the unending priesthood of this enthroned priest: *this man, because he continueth ever, hath an unchangeable priesthood* (Hebrews 7:24), and *he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (7:25). *The counsel of peace... between them both* is the peace the priest-King makes — his ever-living intercession, the one Mediator reconciling Elohim and his people. He sits at the right hand, the Formed Son enthroned, who has a Father over him.',
       sv.verse_id, ev.verse_id, 'free', 45831
  FROM _s338_zec06_lookup sv, _s338_zec06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-6-he-shall-build-the-temple-of-yahuah',
       E'He shall build the temple of Yahuah — the body-temple, the gathered house',
       E'Twice the word names the Branch as temple-builder: *Behold the man whose name is The BRANCH... and he shall build the temple of Yahuah (LORD): Even he shall build the temple of Yahuah (LORD)* (Zechariah 6:12-13). Not the stone temple Zerubbabel raised — the temple the BRANCH himself builds, and Yahusha names it: *Destroy this temple, and in three days I will raise it up* (John 2:19) — *But he spake of the temple of his body* (John 2:21). The body-temple raised in three days becomes the gathered house: *built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone; In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:20-21); *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ)* (1 Peter 2:5). The priest-King who *shall be a priest upon his throne* builds a house that is itself a priesthood — the living temple of the gathered, raised out of his own body and his own people.',
       sv.verse_id, ev.verse_id, 'free', 45834
  FROM _s338_zec06_lookup sv, _s338_zec06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-6-they-that-are-far-off-shall-come-and-build',
       E'They that are far off shall come and build — the two-house ingathering',
       E'The chapter closes with the far-off gathered home to build: *And they that are far off shall come and build in the temple of Yahuah (LORD), and ye shall know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you. And this shall come to pass, if ye will diligently obey the voice of Yahuah Elohaychem (the LORD your God)* (Zechariah 6:15). The far-off are the scattered house — Yashar''el divorced and dispersed through the nations — brought home to build the one temple the BRANCH raises. Paul names exactly this ingathering: *But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13); *And came and preached peace to you which were afar off, and to them that were nigh* (2:17) — the near house (Yahudah) and the far house (scattered Yashar''el) made one; *Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God)* (2:19). And the condition stands plain: *if ye will diligently obey the voice of Yahuah Elohaychem (the LORD your God)* — the far-off are gathered to OBEY, never gathered out of obedience. The covenant and its Torah are inseparable from the gathering; the ingathered come home to keep the voice of Yahuah, not to be excused from it.',
       sv.verse_id, ev.verse_id, 'free', 45837
  FROM _s338_zec06_lookup sv, _s338_zec06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *behold a man riding upon a red horse... red horses, speckled, and white* (Zechariah 1:8) — the four chariots of 6:1 are the same patrol Zechariah saw in the first night vision.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-the-four-chariots-four-spirits-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*these are they whom Yahuah (LORD) hath sent to walk to and fro through the earth* (Zechariah 1:10) — the four spirits of 6:5 sent on the same earth-wide patrol.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-the-four-chariots-four-spirits-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *behold a white horse... he went forth conquering, and to conquer* (Revelation 6:2) — the white horses of the third chariot (6:3) open into the first seal-rider.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-the-four-chariots-four-spirits-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*another horse that was red: and power was given... to take peace from the earth* (Revelation 6:4) — the red horses of the first chariot (6:2) loosed as the second seal.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-the-four-chariots-four-spirits-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*lo a black horse; and he that sat on him had a pair of balances* (Revelation 6:5) — the black horses of the second chariot (6:2) loosed as the third seal.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-the-four-chariots-four-spirits-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*behold a pale horse: and his name that sat on him was Death* (Revelation 6:8) — the grisled and bay horses of the fourth chariot (6:3) as the fourth seal; one apparatus of patrolling, judging spirits.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-the-four-chariots-four-spirits-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *behold, I will bring forth my servant the BRANCH* (Zechariah 3:8) — the same Joshua, three chapters earlier, hears the Branch-promise the crown now seals.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-behold-the-man-whose-name-is-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will raise unto David a righteous Branch, and a King shall reign and prosper* (Jeremiah 23:5) — the BRANCH is a KING; priestly crown and royal Branch in one man.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-behold-the-man-whose-name-is-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely... Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6) — the Branch saves BOTH houses and bears the Name.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-behold-the-man-whose-name-is-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the Branch of righteousness to grow up unto David* (Jeremiah 33:15) — *he shall grow up out of his place* (6:12); the promise to both the house of Yashar''el and the house of Yahudah.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-behold-the-man-whose-name-is-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the branch of Yahuah (LORD)* beautiful and glorious for *them that are escaped of Yashar''el (Israel)* (Isaiah 4:2) — the BRANCH-name (6:12) is the glory of the gathered remnant.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-behold-the-man-whose-name-is-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*a Branch shall grow out of his roots* (Isaiah 11:1) — *he shall grow up out of his place* (6:12); the Davidic Branch sprung from the stem of Jesse.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-behold-the-man-whose-name-is-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★★ *Then came Yahusha (Jesus) forth, wearing the crown of thorns... Behold the man!* (John 19:5) — Pilate''s unknowing cry fulfils *Behold the man whose name is The BRANCH* (6:12); the BRANCH himself wears the crown.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-behold-the-man-whose-name-is-the-branch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1) — *he shall... sit and rule upon his throne* (6:13); the enthroned Lord at Yahuah''s right hand.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-a-priest-upon-his-throne-after-melek-tsadiq'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4) — *he shall be a priest upon his throne* (6:13); king AND priest in one, the order David could not unite.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-a-priest-upon-his-throne-after-melek-tsadiq'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*this man, because he continueth ever, hath an unchangeable priesthood* (Hebrews 7:24) — the priest on the throne (6:13) holds a priesthood that never passes away.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-a-priest-upon-his-throne-after-melek-tsadiq'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *he ever liveth to make intercession for them* (Hebrews 7:25) — *the counsel of peace... between them both* (6:13) is the priest-King''s ever-living intercession reconciling Elohim and his people.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-a-priest-upon-his-throne-after-melek-tsadiq'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Destroy this temple, and in three days I will raise it up* (John 2:19) — the temple the BRANCH builds (6:12) is the temple Yahusha says he himself will raise.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-he-shall-build-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *But he spake of the temple of his body* (John 2:21) — *even he shall build the temple of Yahuah* (6:13) is the body-temple raised in three days.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-he-shall-build-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20) — the temple the BRANCH builds grows from himself as the corner stone.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-he-shall-build-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21) — the gathered house grows into the holy temple the priest-King raises.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-he-shall-build-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5) — because the builder is *a priest upon his throne* (6:13), the house he builds is itself a priesthood.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-he-shall-build-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) — *they that are far off shall come and build* (6:15); the scattered brought home by the blood.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-they-that-are-far-off-shall-come-and-build'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*peace to you which were afar off, and to them that were nigh* (Ephesians 2:17) — the far house (scattered Yashar''el) and the near house (Yahudah) made one, the two-house gathering of 6:15.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-they-that-are-far-off-shall-come-and-build'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*no more strangers and foreigners, but fellowcitizens... of the household of Elohim (God)* (Ephesians 2:19) — the far-off gathered to build, *if ye will diligently obey the voice of Yahuah Elohaychem* (6:15): gathered to OBEY, never out of obedience.'
  FROM cross_reference_threads t
  JOIN _s338_zec06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s338_zec06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-6-they-that-are-far-off-shall-come-and-build'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_7.sql (Zechariah 7) -----
-- Chapter: Zechariah 7 — FASTING VS. TRUE OBEDIENCE; the weightier matters of the Torah. The men of
-- Bethel send to ask whether they should keep weeping in the fifth month (7:1-3). Yahuah answers with
-- a question that cuts to the heart of all worship: *When ye fasted and mourned... did ye at all fast
-- unto me, even to me? And when ye did eat... did not ye eat for yourselves?* (7:5-6) — worship aimed
-- at self, not at Yahuah, is no worship at all (the true fast of Isaiah 58; the secret fast of Matthew
-- 6). Then the abiding word of the former prophets: ★★ *Execute true judgment, and shew mercy and
-- compassions every man to his brother: And oppress not the widow, nor the fatherless, the stranger,
-- nor the poor* (7:9-10) — the WEIGHTIER matters of the Torah Yahusha names by the same three words
-- (Matthew 23:23 "judgment, mercy, and faith"), the *I desired mercy, and not sacrifice* of Hosea 6:6
-- (Matthew 9:13), the *do justly... love mercy... walk humbly* of Micah 6:8, the pure religion of James
-- 1:27 — the Torah's OWN social commands (Exodus 22:21-22; Deuteronomy 24:17), Torah-affirmed, NOT
-- abolished. ★ The refusal: *they made their hearts as an adamant stone, lest they should hear the law,
-- and the words which Yahuah Tseva'ot hath sent in his spirit by the former prophets* (7:11-12) — the
-- hardening against the Torah and the Spirit (Acts 7:51 "ye do always resist the Ruach HaKodesh";
-- Jeremiah 7:26). Therefore the scattering: *I scattered them with a whirlwind among all the nations*
-- (7:13-14) — the Deuteronomy 28 exile-curse for covenant-breaking, NOT the Torah's fault; the
-- two-house dispersion that 8:7-8 will reverse.
-- Tag: zec07   Temp view: _s338_zec07_lookup
-- Sort band: base 45850, step 3 -> threads at 45850, 45853, 45856, 45859, 45862 (5 threads)
-- Source of EVERY row: 'canon','zechariah',7,v
--
-- Zechariah 7 coverage:
--   v.1-4 (the men of Bethel sent to pray and to ask the priests, Should I weep in the fifth month)
--        NT:     none warranted (the question is the setup; the answer in v.5-6 carries the forward weave)
--        Extras: none warranted
--        Tanakh: held in prose (the fifth-month fast mourned the burning of the temple; preface to THREAD 1)
--   ★ v.5-6 (When ye fasted... did ye at all fast unto me, even to me? did not ye eat for yourselves?)
--        NT:     ★ Matthew 6:16 (when ye fast, be not, as the hypocrites... that they may appear unto men),
--                Matthew 6:18 (appear not unto men to fast, but unto thy Father which is in secret) — THREAD 1
--        Extras: none warranted (the true-fast weave is carried by Isaiah 58 + Matthew 6)
--        Tanakh: ★ Isaiah 58:6 (Is not this the fast that I have chosen? to loose the bands of wickedness),
--                Isaiah 58:7 (to deal thy bread to the hungry... bring the poor that are cast out to thy house) — THREAD 1
--   v.7 (Should ye not hear the words which Yahuah hath cried by the former prophets)
--        NT:     none warranted distinct (the former-prophet word is the very charge of v.9-10; THREAD 2)
--        Extras: none warranted
--        Tanakh: woven into THREAD 2/THREAD 4 (the former prophets' enduring word, refused in v.11-12)
--   ★★ v.9 (Execute true judgment, and shew mercy and compassions every man to his brother)
--        NT:     ★★ Matthew 23:23 (omitted the weightier matters of the law, judgment, mercy, and faith),
--                ★★ Hosea 6:6→Matthew 9:13 (I will have mercy, and not sacrifice) — THREAD 2
--        Extras: ★ Sirach 4:10 (Be as a father to the fatherless... so shall you be as the son of the Most High) — THREAD 2
--        Tanakh: ★★ Hosea 6:6 (I desired mercy, and not sacrifice), ★ Micah 6:8 (do justly... love mercy) — THREAD 2
--   ★★ v.10 (oppress not the widow, nor the fatherless, the stranger, nor the poor)
--        NT:     ★ James 1:27 (Pure religion... To visit the fatherless and widows in their affliction) — THREAD 2
--        Extras: ★ Sirach 35:14 (He will not despise the supplication of the fatherless; nor the widow),
--                Sirach 35:15 (Do not the tears run down the widow's cheeks?) — THREAD 3
--        Tanakh: ★ Exodus 22:21 (neither vex a stranger, nor oppress him), Exodus 22:22 (Ye shall not afflict
--                any widow, or fatherless child), ★ Deuteronomy 24:17 (not pervert the judgment of the stranger,
--                nor of the fatherless), Jeremiah 7:6 (If ye oppress not the stranger, the fatherless, and the widow) — THREAD 3
--   ★ v.11-12 (they refused... stopped their ears... made their hearts as an adamant stone, lest they should
--          hear the law, and the words which Yahuah hath sent in his spirit by the former prophets)
--        NT:     ★ Acts 7:51 (Ye stiffnecked... ye do always resist the Ruach HaKodesh: as your fathers did) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 7:26 (they hearkened not... but hardened their neck: they did worse than their fathers) — THREAD 4
--   v.13-14 (as he cried, and they would not hear; so they cried, and I would not hear... I scattered them
--          with a whirlwind among all the nations)
--        NT:     none warranted distinct (the scattering is the Torah's own covenant-sanction; Tanakh-rooted)
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 28:64 (Yahuah shall scatter thee among all people, from the one end of the earth) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. zechariah-7-did-ye-at-all-fast-unto-me-even-to-me — NT (Matthew 6) + Tanakh (Isaiah 58) [free]
--      (the true fast — worship unto Yahuah, not unto self; the heart of the fast)
--   2. zechariah-7-execute-true-judgment-and-shew-mercy — NT (Matthew 23, Matthew 9, James 1) + Tanakh (Hosea 6, Micah 6) + Extras (Sirach 4) [extras]
--      (★★ the weightier matters of the Torah — the same charge Yahusha names; Torah-affirmed, not abolished)
--   3. zechariah-7-oppress-not-the-widow-nor-the-fatherless — Tanakh (Exodus 22, Deuteronomy 24, Jeremiah 7) + Extras (Sirach 35) [extras]
--      (★ the Torah's own social commands toward stranger, widow, fatherless, poor — Torah-affirmed)
--   4. zechariah-7-they-made-their-hearts-as-an-adamant-stone — NT (Acts 7) + Tanakh (Jeremiah 7) [free]
--      (★ the hardening against the Torah and the Spirit — the covenant-lawsuit; resisting the Ruach HaKodesh)
--   5. zechariah-7-i-scattered-them-among-all-the-nations — Tanakh (Deuteronomy 28) [free]
--      (the scattering = the Deuteronomy 28 exile-curse for covenant-breaking; the two-house dispersion)
--
-- Framing notes:
--   ★ THE TRUE FAST (THREAD 1): The men ask whether to keep the fifth-month fast (7:3); Yahuah answers
--      with the heart of all worship: *When ye fasted and mourned in the fifth and seventh month... did ye
--      at all fast unto me, even to me? And when ye did eat, and when ye did drink, did not ye eat for
--      yourselves, and drink for yourselves?* (7:5-6). A fast aimed at self is no fast. Isaiah names the
--      fast Yahuah chooses: *to loose the bands of wickedness... to deal thy bread to the hungry* (Isaiah
--      58:6-7); Yahusha sets the same heart: *when thou fastest, anoint thine head... appear not unto men
--      to fast, but unto thy Father which is in secret* (Matthew 6:17-18). Worship unto Yahuah, never unto men.
--   ★★ THE WEIGHTIER MATTERS (THREAD 2): *Execute true judgment, and shew mercy and compassions every man
--      to his brother* (7:9) is the abiding word of the former prophets — and Yahusha names the very same
--      three: *ye... have omitted the weightier matters of the law, judgment, mercy, and faith: these ought
--      ye to have done, and not to leave the other undone* (Matthew 23:23 — the weightier matters are STILL
--      to be done, the Torah affirmed not abolished). He twice quotes Hosea: *I desired mercy, and not
--      sacrifice* (Hosea 6:6) → *I will have mercy, and not sacrifice* (Matthew 9:13); Micah folds the same
--      charge into one line: *to do justly, and to love mercy, and to walk humbly with thy Elohim (God)*
--      (Micah 6:8); James calls it pure religion: *To visit the fatherless and widows in their affliction*
--      (James 1:27). The restored witness teaches the same mercy: *Be as a father to the fatherless... so
--      shall you be as the son of the Most High* (Sirach 4:10). One charge across the whole library.
--   ★ THE TORAH'S SOCIAL COMMANDS (THREAD 3): *oppress not the widow, nor the fatherless, the stranger, nor
--      the poor; and let none of you imagine evil against his brother in your heart* (7:10) is not new — it
--      is the Torah's own command: *Thou shalt neither vex a stranger, nor oppress him... Ye shall not
--      afflict any widow, or fatherless child* (Exodus 22:21-22); *Thou shalt not pervert the judgment of
--      the stranger, nor of the fatherless* (Deuteronomy 24:17). Jeremiah cried the same former-prophet word
--      (Jeremiah 7:6); and the restored witness pleads for the same: *He will not despise the supplication
--      of the fatherless; nor the widow* (Sirach 35:14). The prophet calls Yahudah back to the Torah, not away.
--   ★ THE ADAMANT HEART (THREAD 4): *But they refused to hearken... made their hearts as an adamant stone,
--      lest they should hear the law (Torah), and the words which Yahuah Tseva'ot (LORD of hosts) hath sent
--      in his spirit by the former prophets* (7:11-12). The hardening is against the Torah AND the Spirit
--      together (they are inseparable). Stephen names the same sin: *Ye stiffnecked and uncircumcised in
--      heart and ears, ye do always resist the Ruach HaKodesh (Holy Spirit): as your fathers did, so do ye*
--      (Acts 7:51); Jeremiah too: *they hardened their neck: they did worse than their fathers* (Jeremiah
--      7:26). Covenant-lawsuit — conduct within the covenant, NEVER ethnic; the refusal is the sin, the Torah
--      is the good thing refused.
--   THE SCATTERING (THREAD 5): *I scattered them with a whirlwind among all the nations whom they knew not*
--      (7:14) is the Deuteronomy 28 exile-curse enacted for covenant-breaking — *Yahuah (LORD) shall scatter
--      thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64). The
--      curse is the judgment for breaking covenant, NEVER the Torah itself; and the scattering is the
--      two-house dispersion that the very next chapter reverses (*I will save my people from the east country,
--      and from the west country... and they shall be my people*, Zechariah 8:7-8).
--   EXTRAS: Sirach 4:10 (a father to the fatherless) on the mercy-charge (THREAD 2) and Sirach 35:14 (the
--      widow's supplication) on the oppress-not command (THREAD 3) — clean wisdom-witnesses, parses verified.
--      No extras forced on the fast, the adamant heart, or the scattering.
--   VERSES WITH NO SEPARATE ADD: v.1-4 (the deputation and the question — preface to THREAD 1), v.7 (the
--      former-prophet word — woven into THREAD 2 and THREAD 4), v.8 (the word came to Zechariah — the formula
--      introducing v.9-10), v.13 (so they cried, and I would not hear — the measure-for-measure preface to
--      the scattering of THREAD 5). All recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Did ye at all fast unto me, even to me? — the true fast
    ('canon','zechariah',7,5,'canon','matthew',6,16,'free',
      E'*Moreover when ye fast, be not, as the hypocrites, of a sad countenance: for they disfigure their faces, that they may appear unto men to fast. Verily I say unto you, They have their reward* (Matthew 6:16). Zechariah''s question — *When ye fasted and mourned in the fifth and seventh month... did ye at all fast unto me, even to me?* (Zechariah 7:5) — is the very heart Yahusha names: a fast performed *that they may appear unto men* is reward already spent. The fast must be unto Yahuah, not unto self, not unto men.'),
    ('canon','zechariah',7,5,'canon','matthew',6,18,'free',
      E'*That thou appear not unto men to fast, but unto thy Father which is in secret: and thy Father, which seeth in secret, shall reward thee openly* (Matthew 6:18). The fast that fails is the one aimed at self — *did not ye eat for yourselves, and drink for yourselves?* (Zechariah 7:6); the fast that counts is *unto thy Father which is in secret*. Worship unto Yahuah, never a performance unto men.'),
    ('canon','zechariah',7,5,'canon','isaiah',58,6,'free',
      E'*Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* (Isaiah 58:6). When Yahuah asks *did ye at all fast unto me, even to me?* (Zechariah 7:5), Isaiah has already declared the fast He chooses: not abstaining for self but loosing wickedness and freeing the oppressed. The acceptable fast bears fruit toward the brother.'),
    ('canon','zechariah',7,6,'canon','isaiah',58,7,'free',
      E'*Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* (Isaiah 58:7). Eating and drinking *for yourselves* (Zechariah 7:6) is the opposite of the chosen fast — *to deal thy bread to the hungry*. The fast Yahuah seeks turns outward to the poor; the false fast turns inward to self.'),

    -- THREAD 2 (★★): Execute true judgment, and shew mercy — the weightier matters of the Torah
    ('canon','zechariah',7,9,'canon','matthew',23,23,'free',
      E'*Woe unto you, scribes and Pharisees, hypocrites! for ye pay tithe of mint and anise and cummin, and have omitted the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23). Yahusha names the very triad of Zechariah''s charge — *Execute true judgment, and shew mercy and compassions* (Zechariah 7:9) — as *the weightier matters of the law (Torah)*: judgment and mercy. And he says they *ought ye to have done, and not to leave the other undone* — the Torah affirmed, not abolished; the weighty and the light both kept.'),
    ('canon','zechariah',7,9,'canon','hosea',6,6,'free',
      E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). The charge to *shew mercy and compassions every man to his brother* (Zechariah 7:9) is Hosea''s own word: Yahuah desires *mercy, and not sacrifice*. The fast and the offering without mercy toward the brother are nothing; mercy is the weightier matter.'),
    ('canon','zechariah',7,9,'canon','matthew',9,13,'free',
      E'*But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance* (Matthew 9:13). Yahusha quotes Hosea 6:6 to seal the same charge Zechariah cries — *shew mercy and compassions every man to his brother* (Zechariah 7:9). Mercy is what Yahuah requires; the religion that fasts and tithes but withholds mercy has missed the heart of the Torah.'),
    ('canon','zechariah',7,9,'canon','micah',6,8,'free',
      E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Micah folds Zechariah''s charge into one line — *Execute true judgment* (Zechariah 7:9) is *to do justly*; *shew mercy and compassions* is *to love mercy*. This is what Yahuah requires, the same word by every former prophet.'),
    ('canon','zechariah',7,9,'apocrypha','ecclesiasticus',4,10,'extras',
      E'*Be as a father to the fatherless, and instead of an husband to their mother: so shall you be as the son of the Most High, and he shall love you more than your mother does* (Sirach 4:10). The restored wisdom-witness teaches the very mercy Zechariah commands — *shew mercy and compassions every man to his brother* (Zechariah 7:9): to be *a father to the fatherless* is to be *as the son of the Most High*. Mercy toward the helpless is the family-likeness of the children of Yahuah.'),
    ('canon','zechariah',7,10,'canon','james',1,27,'free',
      E'*Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). Zechariah''s command — *oppress not the widow, nor the fatherless* (Zechariah 7:10) — is the same heart James calls *pure religion*: *To visit the fatherless and widows in their affliction*. Religion that overlooks the widow and the orphan is not pure; the Torah''s mercy is its measure.'),

    -- THREAD 3 (★): Oppress not the widow, nor the fatherless — the Torah's own social commands
    ('canon','zechariah',7,10,'canon','exodus',22,21,'free',
      E'*Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt* (Exodus 22:21). The command *oppress not the... stranger* (Zechariah 7:10) is the Torah''s own word, grounded in Yashar''el''s (Israel''s) memory of bondage — *for ye were strangers in the land of Egypt*. Zechariah calls the people back to the Torah, not away from it.'),
    ('canon','zechariah',7,10,'canon','exodus',22,22,'free',
      E'*Ye shall not afflict any widow, or fatherless child* (Exodus 22:22). The widow and the fatherless of Zechariah''s charge — *oppress not the widow, nor the fatherless* (Zechariah 7:10) — are the very ones the Torah names: *Ye shall not afflict any widow, or fatherless child*, with the warning that Yahuah will *surely hear their cry* (22:23). The prophet preaches the Torah''s own protection of the helpless.'),
    ('canon','zechariah',7,10,'canon','deuteronomy',24,17,'free',
      E'*Thou shalt not pervert the judgment of the stranger, nor of the fatherless; nor take a widow''s raiment to pledge* (Deuteronomy 24:17). Zechariah joins judgment and mercy toward the helpless — *Execute true judgment... oppress not the widow, nor the fatherless, the stranger* (Zechariah 7:9-10) — exactly as the Torah does: *not pervert the judgment of the stranger, nor of the fatherless*. True judgment and care for the vulnerable are one command.'),
    ('canon','zechariah',7,10,'canon','jeremiah',7,6,'free',
      E'*If ye oppress not the stranger, the fatherless, and the widow, and shed not innocent blood in this place, neither walk after other gods to your hurt* (Jeremiah 7:6). The former prophets cried one word: Jeremiah''s *oppress not the stranger, the fatherless, and the widow* is Zechariah''s *oppress not the widow, nor the fatherless, the stranger* (Zechariah 7:10). The same charge stood *by the former prophets* (Zechariah 7:7), and stands still.'),
    ('canon','zechariah',7,10,'apocrypha','ecclesiasticus',35,14,'extras',
      E'*He will not despise the supplication of the fatherless; nor the widow, when she poureth out her complaint* (Sirach 35:14). The restored witness names the widow and the fatherless of Zechariah''s command — *oppress not the widow, nor the fatherless* (Zechariah 7:10) — as the very ones Yahuah hears: *He will not despise the supplication of the fatherless; nor the widow*. To oppress them is to provoke the One who hears their cry.'),
    ('canon','zechariah',7,10,'apocrypha','ecclesiasticus',35,15,'extras',
      E'*Do not the tears run down the widow''s cheeks? and is not her cry against him that causeth them to fall?* (Sirach 35:15). Zechariah''s warning — *oppress not the widow* (Zechariah 7:10) — is sealed by the wisdom-witness: the widow''s tears become *her cry against him that causeth them to fall*. The oppressor of the helpless answers to Yahuah for every tear.'),

    -- THREAD 4 (★): They made their hearts as an adamant stone — the hardening against the Torah and the Spirit
    ('canon','zechariah',7,12,'canon','acts',7,51,'free',
      E'*Ye stiffnecked and uncircumcised in heart and ears, ye do always resist the Ruach HaKodesh (Holy Spirit): as your fathers did, so do ye* (Acts 7:51). Stephen names the same sin Zechariah charges — *they made their hearts as an adamant stone, lest they should hear the law (Torah), and the words which Yahuah... hath sent in his spirit by the former prophets* (Zechariah 7:12). The adamant heart that will not hear the Torah is the heart that *do always resist the Ruach HaKodesh*; the Torah and the Spirit are refused together. Covenant-lawsuit — conduct, never ethnic.'),
    ('canon','zechariah',7,12,'canon','jeremiah',7,26,'free',
      E'*Yet they hearkened not unto me, nor inclined their ear, but hardened their neck: they did worse than their fathers* (Jeremiah 7:26). The refusal of Zechariah 7:11-12 — *they refused to hearken, and... stopped their ears... made their hearts as an adamant stone* — is the same hardening Jeremiah cried: *they hearkened not... but hardened their neck*. The former prophets cried, and the people would not hear; the sin is the refusal, never the Torah that was refused.'),

    -- THREAD 5: I scattered them among all the nations — the Deuteronomy 28 exile-curse
    ('canon','zechariah',7,14,'canon','deuteronomy',28,64,'free',
      E'*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone* (Deuteronomy 28:64). The scattering of Zechariah 7:14 — *I scattered them with a whirlwind among all the nations whom they knew not* — is the very curse the Torah foretold for covenant-breaking: *Yahuah (LORD) shall scatter thee among all people*. The exile is the covenant-sanction of Deuteronomy 28, NEVER the fault of the Torah itself; and it is the two-house dispersion the next chapter reverses (Zechariah 8:7-8).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-7-did-ye-at-all-fast-unto-me-even-to-me',
       E'Did ye at all fast unto me, even to me? — the true fast, unto Yahuah not unto self',
       E'The men of Bethel send to ask whether they should keep the fifth-month fast that mourned the burning of the temple: *Should I weep in the fifth month, separating myself, as I have done these so many years?* (Zechariah 7:3). Yahuah answers not with a yes or no but with the heart of all worship: *When ye fasted and mourned in the fifth and seventh month, even those seventy years, did ye at all fast unto me, even to me? And when ye did eat, and when ye did drink, did not ye eat for yourselves, and drink for yourselves?* (Zechariah 7:5-6). A fast performed for self, for show, for habit, is no fast at all. Isaiah has already named the fast Yahuah chooses: *Is not this the fast that I have chosen? to loose the bands of wickedness... to let the oppressed go free... to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house* (Isaiah 58:6-7). And Yahusha sets the same heart for the secret place: *when thou fastest, anoint thine head, and wash thy face; That thou appear not unto men to fast, but unto thy Father which is in secret: and thy Father, which seeth in secret, shall reward thee openly* (Matthew 6:17-18) — over against the hypocrites who *disfigure their faces, that they may appear unto men to fast* (Matthew 6:16). The fast that Yahuah seeks is unto Him, turned outward to the brother; the fast that fails is turned inward to self and outward to men.',
       sv.verse_id, ev.verse_id, 'free', 45850
  FROM _s338_zec07_lookup sv, _s338_zec07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-7-execute-true-judgment-and-shew-mercy',
       E'Execute true judgment, and shew mercy — the weightier matters of the Torah',
       E'After the question about the fast comes the abiding word of the former prophets, the heart of the whole Torah: *Thus speaketh Yahuah Tseva''ot (LORD of hosts), saying, Execute true judgment, and shew mercy and compassions every man to his brother* (Zechariah 7:9). Yahusha names this very triad — judgment and mercy — as *the weightier matters of the law (Torah)*: *Woe unto you, scribes and Pharisees, hypocrites! for ye pay tithe of mint and anise and cummin, and have omitted the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23). Mark his ruling: the weighty and the light both ought *to have done* — the Torah affirmed, never abolished. He twice quotes Hosea to drive the mercy home: *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) → *I will have mercy, and not sacrifice* (Matthew 9:13). Micah folds the same charge into one line: *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). James calls it pure religion: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction* (James 1:27). And the restored wisdom-witness teaches the same family-likeness of mercy: *Be as a father to the fatherless... so shall you be as the son of the Most High* (Sirach 4:10). One charge, by every prophet and apostle: judgment, mercy, compassion — the weightier matters Yahuah has required from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 45853
  FROM _s338_zec07_lookup sv, _s338_zec07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-7-oppress-not-the-widow-nor-the-fatherless',
       E'Oppress not the widow, nor the fatherless — the Torah''s own social commands',
       E'The mercy of the former-prophet charge has a concrete shape — the four most vulnerable in the land: *And oppress not the widow, nor the fatherless, the stranger, nor the poor; and let none of you imagine evil against his brother in your heart* (Zechariah 7:10). This is not a new ethic; it is the Torah''s own command, repeated word for word. Exodus binds it to Yashar''el''s (Israel''s) own memory of bondage: *Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt. Ye shall not afflict any widow, or fatherless child* (Exodus 22:21-22) — with the warning that if they cry, Yahuah *will surely hear their cry* (22:23). Deuteronomy joins it to true judgment, just as Zechariah does: *Thou shalt not pervert the judgment of the stranger, nor of the fatherless; nor take a widow''s raiment to pledge* (Deuteronomy 24:17). Jeremiah cried the very same former-prophet word: *If ye oppress not the stranger, the fatherless, and the widow, and shed not innocent blood in this place* (Jeremiah 7:6). And the restored witness pleads with the oppressor: *He will not despise the supplication of the fatherless; nor the widow, when she poureth out her complaint. Do not the tears run down the widow''s cheeks? and is not her cry against him that causeth them to fall?* (Sirach 35:14-15). The prophet calls Yahudah (Judah) back to the Torah, not away from it — the Torah affirmed, the care of the helpless its very heart.',
       sv.verse_id, ev.verse_id, 'extras', 45856
  FROM _s338_zec07_lookup sv, _s338_zec07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-7-they-made-their-hearts-as-an-adamant-stone',
       E'They made their hearts as an adamant stone — refusing the Torah and the Spirit',
       E'The fathers heard the former-prophet word and would not have it: *But they refused to hearken, and pulled away the shoulder, and stopped their ears, that they should not hear. Yea, they made their hearts as an adamant stone, lest they should hear the law, and the words which Yahuah Tseva''ot (LORD of hosts) hath sent in his spirit by the former prophets: therefore came a great wrath from Yahuah Tseva''ot (LORD of hosts)* (Zechariah 7:11-12). Mark what was refused: *the law (Torah), and the words which Yahuah... hath sent in his spirit* — the Torah and the Spirit together, for they are inseparable. Stephen names the same sin in his last breath: *Ye stiffnecked and uncircumcised in heart and ears, ye do always resist the Ruach HaKodesh (Holy Spirit): as your fathers did, so do ye* (Acts 7:51). Jeremiah cried it of the same generation: *Yet they hearkened not unto me, nor inclined their ear, but hardened their neck: they did worse than their fathers* (Jeremiah 7:26). This is covenant-lawsuit — conduct within the covenant, the refusal of those who would not turn, NEVER ethnic hatred. The Torah is the good thing refused; the adamant heart, the stopped ears, the resisted Spirit are the sin. The lost sheep are called to turn, not cast off.',
       sv.verse_id, ev.verse_id, 'free', 45859
  FROM _s338_zec07_lookup sv, _s338_zec07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-7-i-scattered-them-among-all-the-nations',
       E'I scattered them among all the nations — the Deuteronomy 28 exile-curse',
       E'The chapter closes in judgment measure-for-measure: *as he cried, and they would not hear; so they cried, and I would not hear, saith Yahuah Tseva''ot (LORD of hosts): But I scattered them with a whirlwind among all the nations whom they knew not. Thus the land was desolate after them* (Zechariah 7:13-14). The scattering is no arbitrary wrath — it is the exact covenant-sanction the Torah foretold for covenant-breaking: *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone* (Deuteronomy 28:64). The curse is the Deuteronomy 28 judgment for breaking the covenant, NEVER the Torah''s own fault — the Torah is the inheritance refused, the curse the consequence of the refusing. And the scattering *among all the nations* is the two-house dispersion that the very next chapter reverses: *I will save my people from the east country, and from the west country... and they shall be my people, and I will be their Elohim (God), in truth and in righteousness* (Zechariah 8:7-8). He that scattered Yashar''el (Israel) will gather him.',
       sv.verse_id, ev.verse_id, 'free', 45862
  FROM _s338_zec07_lookup sv, _s338_zec07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *be not, as the hypocrites, of a sad countenance... that they may appear unto men to fast* (Matthew 6:16) — the fast aimed at show, the opposite of *did ye at all fast unto me, even to me?* (Zechariah 7:5).'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-did-ye-at-all-fast-unto-me-even-to-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *appear not unto men to fast, but unto thy Father which is in secret* (Matthew 6:18) — the fast that counts is unto Yahuah, not *for yourselves* (Zechariah 7:6).'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-did-ye-at-all-fast-unto-me-even-to-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Is not this the fast that I have chosen? to loose the bands of wickedness... to let the oppressed go free* (Isaiah 58:6) — the fast Yahuah seeks, turned outward, over against the fast *unto me, even to me?* refused in Zechariah 7:5.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-did-ye-at-all-fast-unto-me-even-to-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*to deal thy bread to the hungry... bring the poor that are cast out to thy house* (Isaiah 58:7) — the chosen fast turns to the poor, the opposite of eating and drinking *for yourselves* (Zechariah 7:6).'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-did-ye-at-all-fast-unto-me-even-to-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *have omitted the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23) — Yahusha names Zechariah''s very triad as the weightier matters of the Torah, STILL to be done.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-execute-true-judgment-and-shew-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) — the mercy of *shew mercy and compassions* (Zechariah 7:9) is what Yahuah desires above sacrifice.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-execute-true-judgment-and-shew-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *go ye and learn what that meaneth, I will have mercy, and not sacrifice* (Matthew 9:13) — Yahusha quotes Hosea 6:6 to seal the charge to *shew mercy and compassions every man to his brother* (Zechariah 7:9).'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-execute-true-judgment-and-shew-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *to do justly, and to love mercy, and to walk humbly with thy Elohim (God)* (Micah 6:8) — Micah folds *Execute true judgment, and shew mercy* (Zechariah 7:9) into the one thing Yahuah requires.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-execute-true-judgment-and-shew-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Be as a father to the fatherless... so shall you be as the son of the Most High* (Sirach 4:10) — the restored witness teaches the very mercy of *shew mercy and compassions every man to his brother* (Zechariah 7:9).'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-execute-true-judgment-and-shew-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Pure religion and undefiled... is this, To visit the fatherless and widows in their affliction* (James 1:27) — James calls the mercy of *oppress not the widow, nor the fatherless* (Zechariah 7:10) the very measure of pure religion.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-execute-true-judgment-and-shew-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt* (Exodus 22:21) — the Torah''s own command behind *oppress not the... stranger* (Zechariah 7:10).'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-oppress-not-the-widow-nor-the-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22) — the widow and the fatherless of Zechariah 7:10 are the very ones the Torah protects, with the warning Yahuah will *surely hear their cry* (22:23).'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-oppress-not-the-widow-nor-the-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Thou shalt not pervert the judgment of the stranger, nor of the fatherless* (Deuteronomy 24:17) — the Torah joins true judgment and care for the helpless exactly as *Execute true judgment... oppress not the... stranger* (Zechariah 7:9-10).'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-oppress-not-the-widow-nor-the-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*If ye oppress not the stranger, the fatherless, and the widow* (Jeremiah 7:6) — a former prophet cried the same word Zechariah recalls (Zechariah 7:7, 10); one charge by the former prophets.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-oppress-not-the-widow-nor-the-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *He will not despise the supplication of the fatherless; nor the widow* (Sirach 35:14) — the restored witness names the widow and fatherless of Zechariah 7:10 as the very ones Yahuah hears.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-oppress-not-the-widow-nor-the-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Do not the tears run down the widow''s cheeks? and is not her cry against him that causeth them to fall?* (Sirach 35:15) — the oppressor of the widow Zechariah forbids (Zechariah 7:10) answers to Yahuah for every tear.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-oppress-not-the-widow-nor-the-fatherless'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Ye stiffnecked and uncircumcised in heart and ears, ye do always resist the Ruach HaKodesh (Holy Spirit): as your fathers did, so do ye* (Acts 7:51) — the adamant heart that will not hear the Torah (Zechariah 7:12) is the heart that resists the Spirit; both refused together.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-they-made-their-hearts-as-an-adamant-stone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they hearkened not... but hardened their neck: they did worse than their fathers* (Jeremiah 7:26) — the same refusal as *they refused to hearken... made their hearts as an adamant stone* (Zechariah 7:11-12); the sin is the refusing, never the Torah refused.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-they-made-their-hearts-as-an-adamant-stone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64) — the scattering *among all the nations* (Zechariah 7:14) is the Deuteronomy 28 covenant-curse for covenant-breaking, never the Torah''s fault; the two-house dispersion Zechariah 8:7-8 reverses.'
  FROM cross_reference_threads t
  JOIN _s338_zec07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s338_zec07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-7-i-scattered-them-among-all-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_8.sql (Zechariah 8) -----
-- Chapter: Zechariah 8 — ZION RESTORED, the two-house regathering, the nations drawn in. Yahuah
-- returns to dwell in the midst of Jerusalem (*I am returned unto Zion, and will dwell in the midst
-- of Jerusalem: and Jerusalem shall be called a city of truth*, 8:3 — the Presence in the midst,
-- the Glory returned); the city restored to shalom, old men and old women in the streets, boys and
-- girls playing (8:4-5). ★★ THE TWO-HOUSE INGATHERING: *Behold, I will save my people from the
-- east country, and from the west country... they shall be my people, and I will be their Elohim,
-- in truth and in righteousness* (8:7-8 — the covenant-formula restored, the scattered gathered from
-- all directions; Hosea Lo-ammi reversed, Ezekiel's two sticks made one). ★ the curse turned to
-- blessing on BOTH houses named — *O house of Yahudah (Judah), and house of Yashar'el (Israel)*
-- (8:13). ★ the Torah of the restored community: *Speak ye every man the truth to his neighbour*
-- (8:16) → Ephesians 4:25. ★★★ THE NATIONS TO ZION: *many people and strong nations shall come to
-- seek Yahuah Tseva'ot in Jerusalem... ten men shall take hold of the skirt of him that is a Yahudi
-- (Jew), saying, We will go with you: for we have heard that Elohim is with you* (8:20-23 — the
-- far-off grafted in, NOT replacement; Isaiah 2 / Micah 4 mountain-of-the-house, Ephesians 2 the
-- aliens made nigh).
-- Tag: zec08   Temp view: _s338_zec08_lookup
-- Sort band: base 45875, step 3 -> threads at 45875, 45878, 45881, 45884, 45887, 45890 (6 threads)
-- Source of EVERY row: 'canon','zechariah',8,v
--
-- Zechariah 8 coverage:
--   v.1-2 (I was jealous for Zion with great jealousy) — woven into THREAD 1 (the jealous return of
--          the Presence to Zion); no separate add forced.
--   ★ v.3 (I am returned unto Zion, and will dwell in the midst of Jerusalem... a city of truth... the
--          holy mountain)
--        NT:     ★★ Revelation 21:3 (the tabernacle of Elohim is with men, and he will dwell with them)
--                — THREAD 1 (the Presence dwelling in the midst, consummated)
--        Extras: none warranted (the dwelling-in-the-midst weave is canon-carried)
--        Tanakh: ★★ Ezekiel 37:27 (My tabernacle also shall be with them... I will be their Elohim,
--                and they shall be my people) — THREAD 1
--   v.4-5 (old men and old women in the streets... boys and girls playing) — restored-shalom picture,
--          woven into THREAD 1's prose; no separate library add warranted.
--   v.6 (If it be marvellous in the eyes of the remnant... should it also be marvellous in mine eyes)
--        — the remnant's wonder at the restoration; held in THREAD 1/THREAD 2 prose. None warranted.
--   ★★ v.7-8 (Behold, I will save my people from the east country, and from the west country... they
--          shall be my people, and I will be their Elohim, in truth and in righteousness)
--        NT:     ★★ Romans 9:25-26 (I will call them my people, which were not my people... there shall
--                they be called the children of the living Elohim) — THREAD 2 (Hosea reversed, Paul's
--                own naming of the ingathering)
--        Extras: none warranted (the two-house covenant-formula is canon-dense already)
--        Tanakh: ★★ Hosea 1:10 (in the place where it was said... Ye are not my people, there it shall
--                be said... Ye are the sons of the living Elohim), ★★ Hosea 2:23 (I will say to them which
--                were not my people, Thou art my people), ★★ Ezekiel 37:21 (I will take the children of
--                Yashar'el from among the heathen... and bring them into their own land), ★★ Ezekiel 37:23
--                (so shall they be my people, and I will be their Elohim), ★ Jeremiah 31:33 (I will be
--                their Elohim, and they shall be my people) — THREAD 2
--   v.9-12 (Let your hands be strong... the seed shall be prosperous... I will cause the remnant of this
--          people to possess all these things) — temple-rebuild encouragement / covenant blessing; the
--          curse-to-blessing turn carries into THREAD 3. v.10-12 held in THREAD 3 prose. None separate.
--   ★ v.13 (as ye were a curse among the heathen, O house of Yahudah, and house of Yashar'el; so will I
--          save you, and ye shall be a blessing)
--        NT:     none warranted distinct (the blessing-to-the-nations forward-weave lands in THREAD 6
--                where the nations are drawn in; here the load is the BOTH-houses naming)
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 37:22 (I will make them one nation... they shall be no more two nations) —
--                THREAD 3 (the two houses named together, divorce reversed); ★ Genesis 12:3 (in thee
--                shall all families of the earth be blessed) — THREAD 3 (the curse turned to the
--                Abrahamic blessing)
--   ★ v.16-17 (Speak ye every man the truth to his neighbour; execute the judgment of truth and peace...
--          love no false oath: for all these are things that I hate)
--        NT:     ★ Ephesians 4:25 (putting away lying, speak every man truth with his neighbour) —
--                THREAD 4 (the Torah of the restored community, the new man walking it)
--        Extras: none warranted
--        Tanakh: ★ Leviticus 19:11 (Ye shall not steal, neither deal falsely, neither lie one to another)
--                — THREAD 4 (the truth-and-neighbour command rooted in Torah)
--   v.18-19 (the fasts turned to joy and gladness and cheerful feasts) — the mourning-fasts become
--          moedim of joy; held in prose. None warranted (no clean single target weightier than the
--          ingathering threads it serves).
--   ★★★ v.20-23 (many people and strong nations shall come to seek Yahuah Tseva'ot in Jerusalem... ten men
--          shall take hold of the skirt of him that is a Yahudi, saying, We will go with you: for we
--          have heard that Elohim is with you)
--        NT:     ★★ Ephesians 2:12-13 (ye were aliens from the commonwealth of Yashar'el... but now in
--                HaMashiach Yahusha ye who sometimes were far off are made nigh) — THREAD 6 (the far-off
--                grafted in, NOT a new people replacing Israel — Romans 11 guard in prose)
--        Extras: ★ Tobit 13:11 (Many nations shall come from far to the name of Yahuah with gifts), ★ Tobit
--                14:6-7 (all nations shall turn, and fear Yahuah truly... and his people shall confess
--                Yahuah) — THREAD 6 (clean nations-to-Zion witness)
--        Tanakh: ★★ Isaiah 2:2-3 (all nations shall flow unto it... let us go up to the mountain of
--                Yahuah... for out of Zion shall go forth the law), ★★ Micah 4:1-2 (many nations shall
--                come... for the law shall go forth of Zion) — THREAD 5 (the mountain of the house, the
--                nations streaming up) — split from THREAD 6 because the mountain-pilgrimage twin
--                (Isaiah/Micah) is its own dense weave.
--
-- Threads (slug — target libraries):
--   1. zechariah-8-i-am-returned-unto-zion-and-will-dwell-in-the-midst — NT (Revelation 21) + Tanakh
--      (Ezekiel 37) [free] (★★ the Presence returned to dwell in the midst; the city of truth)
--   2. zechariah-8-they-shall-be-my-people-and-i-will-be-their-elohim — NT (Romans 9) + Tanakh (Hosea
--      1, Hosea 2, Ezekiel 37, Jeremiah 31) [free] (★★ the two-house ingathering, Lo-ammi reversed)
--   3. zechariah-8-O-house-of-yahudah-and-house-of-yasharel-a-blessing — Tanakh (Ezekiel 37, Genesis
--      12) [free] (★ both houses named, curse turned to the Abrahamic blessing)
--   4. zechariah-8-speak-every-man-the-truth-to-his-neighbour — NT (Ephesians 4) + Tanakh (Leviticus
--      19) [free] (★ the Torah of the restored community)
--   5. zechariah-8-many-nations-shall-flow-to-the-mountain-of-yahuah — Tanakh (Isaiah 2, Micah 4)
--      [free] (★★ the nations streaming up to the mountain of the house; out of Zion the law)
--   6. zechariah-8-ten-men-shall-take-hold-of-the-skirt-of-a-yahudi — NT (Ephesians 2) + Extras (Tobit
--      13, Tobit 14) [extras] (★★★ the nations take hold of Yashar'el — grafted in, NOT replacement)
--
-- Framing notes:
--   ★★ THE PRESENCE RETURNED (THREAD 1): *I am returned unto Zion, and will dwell in the midst of
--      Jerusalem* (8:3). The covenant-dwelling that runs the whole library lands here and is consummated
--      in Ezekiel — *My tabernacle also shall be with them... I will be their Elohim, and they shall be
--      my people* (Ezekiel 37:27) — and at the end — *the tabernacle of Elohim is with men, and he will
--      dwell with them* (Revelation 21:3). The Glory in the midst is the Formed Presence returned;
--      framed in prose, the dwelling is His, the One drawn from the Formless Father.
--   ★★ THE TWO-HOUSE INGATHERING (THREAD 2): *they shall be my people, and I will be their Elohim*
--      (8:8) — the exact covenant-formula of the regathering. Hosea's Lo-ammi ("not my people") reversed
--      (Hosea 1:10, 2:23), Ezekiel's gathering "from among the heathen" (37:21,23), Jeremiah's Torah on
--      the heart (31:33), and Paul's OWN naming of it (Romans 9:25-26, quoting Hosea). The divorced
--      northern house brought home — NOT a new people replacing Israel. Romans 11:1-2 guard kept in prose.
--   ★ BOTH HOUSES, CURSE TO BLESSING (THREAD 3): *O house of Yahudah (Judah), and house of Yashar'el
--      (Israel); so will I save you, and ye shall be a blessing* (8:13) — both houses named together,
--      the two-nations division reversed (Ezekiel 37:22), the Abrahamic *in thee shall all families of
--      the earth be blessed* (Genesis 12:3) made good on the regathered people.
--   ★ THE TORAH OF THE COMMUNITY (THREAD 4): *Speak ye every man the truth to his neighbour* (8:16) —
--      the restored people walk the Torah, quoted forward in Ephesians 4:25 and rooted in Leviticus
--      19:11. The covenant instruction is not abolished but the conduct of the new man; 1 John 2:3-4 lens.
--   ★★ THE MOUNTAIN OF THE HOUSE (THREAD 5): *many people and strong nations shall come to seek Yahuah
--      Tseva'ot in Jerusalem* (8:22) is Isaiah 2 / Micah 4 — *all nations shall flow unto it... for out
--      of Zion shall go forth the law* (Isaiah 2:2-3; Micah 4:1-2). The nations come to LEARN the Torah,
--      not to abolish it.
--   ★★★ TEN MEN TAKE HOLD (THREAD 6): *ten men shall take hold... of the skirt of him that is a Yahudi
--      (Jew), saying, We will go with you: for we have heard that Elohim is with you* (8:23). The
--      nations take hold of Yashar'el and join — grafted in, NOT a new people displacing Israel.
--      Ephesians 2:12-13 names it: *aliens from the commonwealth of Yashar'el... made nigh*. Tobit's
--      restored witness sings it clean: *Many nations shall come from far to the name of Yahuah* (13:11);
--      *all nations shall turn, and fear Yahuah truly... and his people shall confess Yahuah* (14:6-7).
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the jealous word — woven into THREAD 1), v.4-6 (the restored
--      streets, the remnant's wonder — THREAD 1 prose), v.9-12 (build the temple, the seed prosperous —
--      THREAD 3 prose), v.14-15 (I repented not / I have thought to do well — the turn that THREAD 3
--      carries), v.18-19 (fasts to feasts — held in prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): I am returned unto Zion, and will dwell in the midst — the Presence returned
    ('canon','zechariah',8,3,'canon','ezekiel',37,27,'free',
      E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27). The promise of Zechariah — *I am returned unto Zion, and will dwell in the midst of Jerusalem* (Zechariah 8:3) — is the same dwelling Ezekiel seals over the regathered two-house people: the tabernacle set in the midst for ever. The Presence returns to dwell among His people.'),
    ('canon','zechariah',8,3,'canon','revelation',21,3,'free',
      E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The *I am returned unto Zion, and will dwell in the midst of Jerusalem* of Zechariah 8:3 is consummated in the New Jerusalem — the dwelling-in-the-midst made everlasting, the same covenant-formula carried to its end. The Glory that returns to Zion is the Presence that fills the city of truth for ever.'),

    -- THREAD 2 (★★): they shall be my people, and I will be their Elohim — the two-house ingathering
    ('canon','zechariah',8,8,'canon','hosea',1,10,'free',
      E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The covenant-formula of Zechariah — *they shall be my people, and I will be their Elohim (God)* (8:8) — is the reversal of Hosea''s Lo-ammi: the divorced northern house, once *not my people*, called home as *the sons of the living Elohim (God)*. The ingathering is the undoing of the divorce.'),
    ('canon','zechariah',8,8,'canon','hosea',2,23,'free',
      E'*and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). Zechariah''s *they shall be my people, and I will be their Elohim (God)* (8:8) is Hosea''s very word of restoration — the once-divorced people re-betrothed, *Thou art my people... Thou art my Elohim (God)*. The same covenant-formula, the same scattered house brought home in truth and righteousness.'),
    ('canon','zechariah',8,7,'canon','ezekiel',37,21,'free',
      E'*Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). Zechariah''s *I will save my people from the east country, and from the west country* (8:7) is Ezekiel''s gathering *on every side* — the scattered of both houses taken from among the nations and brought home. The regathering comes from all directions to the one land.'),
    ('canon','zechariah',8,8,'canon','ezekiel',37,23,'free',
      E'*so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23). The covenant-formula of Zechariah 8:8 — *they shall be my people, and I will be their Elohim (God)* — is sealed in Ezekiel over the cleansed and reunited two houses, no more divided into two kingdoms (37:22). One people, one Elohim, in truth and in righteousness.'),
    ('canon','zechariah',8,8,'canon','jeremiah',31,33,'free',
      E'*I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Zechariah''s *they shall be my people, and I will be their Elohim (God)* (8:8) is the new-covenant formula of Jeremiah — the SAME covenant, the Torah written on the heart, never replaced. The regathered people dwell *in truth and in righteousness* (8:8) because the law is written within them.'),
    ('canon','zechariah',8,7,'canon','romans',9,25,'free',
      E'*As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). Paul names the very ingathering Zechariah foretells — *I will save my people from the east country, and from the west country* (8:7) — as the calling of those once *not my people*, quoting Hosea. The scattered, the divorced, the *not my people* are gathered and named His own.'),
    ('canon','zechariah',8,8,'canon','romans',9,26,'free',
      E'*And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26). Zechariah''s *they shall be my people, and I will be their Elohim (God)* (8:8) is Paul''s own naming of the ingathering — the once-rejected northern house called *the children of the living Elohim (God)*. Not a new people replacing Israel, but the divorced house of Yashar''el brought home.'),

    -- THREAD 3 (★): O house of Yahudah, and house of Yashar'el — both houses, curse to blessing
    ('canon','zechariah',8,13,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Zechariah names both houses together — *O house of Yahudah (Judah), and house of Yashar''el (Israel); so will I save you* (8:13) — the very two that Ezekiel makes one nation again. The division after Solomon is reversed; the two sticks become one in the hand of Yahuah.'),
    ('canon','zechariah',8,13,'canon','genesis',12,3,'free',
      E'*And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* (Genesis 12:3). Zechariah turns the curse to blessing on both houses — *as ye were a curse among the heathen... so will I save you, and ye shall be a blessing* (8:13) — making good the Abrahamic promise: the regathered people become the blessing through whom *all families of the earth* are blessed. The very nations that come seeking in 8:20-23 are the families blessed in the seed.'),

    -- THREAD 4 (★): Speak every man the truth to his neighbour — the Torah of the restored community
    ('canon','zechariah',8,16,'canon','ephesians',4,25,'free',
      E'*Wherefore putting away lying, speak every man truth with his neighbour: for we are members one of another* (Ephesians 4:25). Paul quotes Zechariah''s command to the restored community — *Speak ye every man the truth to his neighbour* (8:16) — as the walk of the new man. The Torah of truth-among-the-people is not abolished but lived; the regathered are *members one of another*, speaking truth in the gates.'),
    ('canon','zechariah',8,16,'canon','leviticus',19,11,'free',
      E'*Ye shall not steal, neither deal falsely, neither lie one to another* (Leviticus 19:11). Zechariah''s charge — *Speak ye every man the truth to his neighbour; execute the judgment of truth and peace in your gates* (8:16) — is rooted in the Torah''s own command against falsehood toward the neighbour. The restored community walks the same covenant instruction; *love no false oath: for all these are things that I hate, saith Yahuah (LORD)* (8:17).'),

    -- THREAD 5 (★★): many nations shall flow to the mountain of Yahuah — Isaiah 2 / Micah 4
    ('canon','zechariah',8,22,'canon','isaiah',2,2,'free',
      E'*And it shall come to pass in the last days, that the mountain of the LORD''S house shall be established in the top of the mountains, and shall be exalted above the hills; and all nations shall flow unto it* (Isaiah 2:2). Zechariah''s *many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (8:22) is Isaiah''s mountain of the house, to which *all nations shall flow*. The same last-days pilgrimage of the nations up to Zion.'),
    ('canon','zechariah',8,22,'canon','isaiah',2,3,'free',
      E'*And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). The nations of Zechariah 8:21-22 who say *Let us go speedily to pray before Yahuah (LORD)* are Isaiah''s *many people* going up to be taught His ways — and what goes forth from Zion is the law. The nations come to LEARN the Torah, not to abolish it.'),
    ('canon','zechariah',8,22,'canon','micah',4,1,'free',
      E'*But in the last days it shall come to pass, that the mountain of the house of Yahuah (LORD) shall be established in the top of the mountains, and it shall be exalted above the hills; and people shall flow unto it* (Micah 4:1). Zechariah''s ingathering of *many people and strong nations* to Jerusalem (8:22) is Micah''s mountain of the house, the peoples flowing up to it in the last days. The twin prophecy of the nations drawn to Zion.'),
    ('canon','zechariah',8,22,'canon','micah',4,2,'free',
      E'*And many nations shall come, and say, Come, and let us go up to the mountain of Yahuah (LORD), and to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for the law shall go forth of Zion, and the word of Yahuah (LORD) from Jerusalem* (Micah 4:2). Zechariah''s *Let us go speedily to pray before Yahuah (LORD)* (8:21) is Micah''s *Come, and let us go up to the mountain of Yahuah (LORD)* — the nations seeking to be taught His ways, and *the law shall go forth of Zion*. They come for the Torah.'),

    -- THREAD 6 (★★★): ten men take hold of the skirt of a Yahudi — the nations grafted in
    ('canon','zechariah',8,23,'canon','ephesians',2,12,'extras',
      E'*That at that time ye were without Messiah (Christ), being aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise, having no hope, and without Elohim (God) in the world* (Ephesians 2:12). The *ten men out of all languages of the nations* who *take hold of the skirt of him that is a Yahudi (Jew)* (Zechariah 8:23) are these very aliens — once strangers from the covenants of promise — taking hold of Yashar''el to come in. Not a new people displacing Israel, but the far-off laying hold of the covenant people.'),
    ('canon','zechariah',8,23,'canon','ephesians',2,13,'extras',
      E'*But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13). Zechariah''s nations *take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (8:23) — the far-off made nigh, grafted into the commonwealth of Yashar''el. The skirt they grasp is the covenant people; they are brought in, never replacing the root.'),
    ('canon','zechariah',8,23,'apocrypha','tobit',13,11,'extras',
      E'*Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven; all generations shall praise you with great joy* (Tobit 13:11). The restored witness sings Zechariah''s ingathering of the nations — *many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (8:22) — as nations coming *from far to the name of Yahuah (God)* with gifts. The far-off drawn to Zion, taking hold of the people of the Name.'),
    ('canon','zechariah',8,23,'apocrypha','tobit',14,6,'extras',
      E'*And all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). Zechariah''s *ten men... out of all languages of the nations* who lay hold of the Yahudi because *Elohim (God) is with you* (8:23) are the nations Tobit foresees turning to *fear Yahuah (God) truly* and burying their idols. The nations forsake their idols and take hold of the living Elohim through His people.'),
    ('canon','zechariah',8,23,'apocrypha','tobit',14,7,'extras',
      E'*So shall all nations praise Yahuah (God), and his people shall confess Yahuah (God), and Yahuah (God) shall exalt his people; and all those which love Yahuah (God) in truth and justice shall rejoice, shewing mercy to our brothers* (Tobit 14:7). The nations who *take hold of the skirt of him that is a Yahudi (Jew)* (Zechariah 8:23) join *his people* in confessing Yahuah, and Yahuah *exalts his people*. The nations come IN to the covenant people — grafted in, the people of Yahuah exalted, not replaced.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-8-i-am-returned-unto-zion-and-will-dwell-in-the-midst',
       E'I am returned unto Zion — the Presence dwelling in the midst, the city of truth',
       E'After the jealous word — *I was jealous for Zion with great jealousy, and I was jealous for her with great fury* (Zechariah 8:2) — Yahuah declares His return: *I am returned unto Zion, and will dwell in the midst of Jerusalem: and Jerusalem shall be called a city of truth; and the mountain of Yahuah Tseva''ot (LORD of hosts) the holy mountain* (8:3). The Presence comes back to dwell among His people, and the city is restored to shalom: *There shall yet old men and old women dwell in the streets of Jerusalem... And the streets of the city shall be full of boys and girls playing* (8:4-5). This dwelling-in-the-midst is the covenant-promise that runs the whole library. Ezekiel seals it over the regathered two-house people: *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27). And it is consummated in the New Jerusalem: *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The Glory that returns to Zion is the Presence drawn from the Formless Father, dwelling in the midst of His people for ever.',
       sv.verse_id, ev.verse_id, 'free', 45875
  FROM _s338_zec08_lookup sv, _s338_zec08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-8-they-shall-be-my-people-and-i-will-be-their-elohim',
       E'They shall be my people — the two-house ingathering, Lo-ammi reversed',
       E'The heart of the chapter is the regathering of the scattered from all directions: *Behold, I will save my people from the east country, and from the west country; And I will bring them, and they shall dwell in the midst of Jerusalem: and they shall be my people, and I will be their Elohim (God), in truth and in righteousness* (Zechariah 8:7-8). That closing line — *they shall be my people, and I will be their Elohim (God)* — is the covenant-formula of the two-house regathering. Hosea had named the divorce: *Call his name Lo-ammi: for ye are not my people* (Hosea 1:9). And Hosea named its reversal: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10), *I will say to them which were not my people, Thou art my people* (Hosea 2:23). Ezekiel gathers them *from among the heathen... on every side* (37:21) and seals the same formula — *so shall they be my people, and I will be their Elohim (God)* (37:23). Jeremiah writes the Torah on their heart with the same words — *will be their Elohim (God), and they shall be my people* (31:33), the SAME covenant, never replaced. And Paul names this very ingathering as the calling of those once rejected: *I will call them my people, which were not my people* (Romans 9:25); *in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26). This is the divorced northern house of Yashar''el (Israel) brought home — NOT a new people replacing Israel. *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). The scattered are gathered, the *not my people* are named His own, in truth and in righteousness.',
       sv.verse_id, ev.verse_id, 'free', 45878
  FROM _s338_zec08_lookup sv, _s338_zec08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-8-O-house-of-yahudah-and-house-of-yasharel-a-blessing',
       E'O house of Yahudah and house of Yashar''el — the curse turned to blessing on both houses',
       E'Yahuah names both houses together and turns their curse to blessing: *And it shall come to pass, that as ye were a curse among the heathen, O house of Yahudah (Judah), and house of Yashar''el (Israel); so will I save you, and ye shall be a blessing: fear not, but let your hands be strong* (Zechariah 8:13). The two houses divided after Solomon — Yahudah in the south, Yashar''el in the north — are named side by side as the one people Yahuah saves. This is the very division Ezekiel reverses: *I will make them one nation in the land upon the mountains of Yashar''el (Israel)... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). And the turning of curse to blessing makes good the Abrahamic promise: *in thee shall all families of the earth be blessed* (Genesis 12:3) — the regathered people become the blessing through whom the nations are blessed, the very nations who come seeking in 8:20-23. The seed prospers, the vine gives her fruit, the heavens give their dew (8:12); the residue of the people inherit, and the two houses, once a curse, become a blessing in the earth.',
       sv.verse_id, ev.verse_id, 'free', 45881
  FROM _s338_zec08_lookup sv, _s338_zec08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-8-speak-every-man-the-truth-to-his-neighbour',
       E'Speak every man the truth to his neighbour — the Torah of the restored community',
       E'The regathered people are given the conduct that fits the city of truth: *These are the things that ye shall do; Speak ye every man the truth to his neighbour; execute the judgment of truth and peace in your gates: And let none of you imagine evil in your hearts against his neighbour; and love no false oath: for all these are things that I hate, saith Yahuah (LORD)* (Zechariah 8:16-17). This is the Torah lived, not abolished — rooted in the covenant instruction itself: *Ye shall not steal, neither deal falsely, neither lie one to another* (Leviticus 19:11). Paul quotes Zechariah''s very command as the walk of the new man: *Wherefore putting away lying, speak every man truth with his neighbour: for we are members one of another* (Ephesians 4:25). The covenant-people in their restored city keep the same Torah of truth toward the neighbour; the law written on the heart (Jeremiah 31:33) becomes truth spoken in the gates. Any reading that makes the commandment irrelevant is false — *He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:4).',
       sv.verse_id, ev.verse_id, 'free', 45884
  FROM _s338_zec08_lookup sv, _s338_zec08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=8 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-8-many-nations-shall-flow-to-the-mountain-of-yahuah',
       E'Many nations shall come to seek Yahuah in Jerusalem — the mountain of the house',
       E'The chapter opens the gates to the nations: *It shall yet come to pass, that there shall come people, and the inhabitants of many cities: And the inhabitants of one city shall go to another, saying, Let us go speedily to pray before Yahuah (LORD), and to seek Yahuah Tseva''ot (LORD of hosts): I will go also. Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD)* (Zechariah 8:20-22). This is the last-days pilgrimage Isaiah and Micah both saw: *the mountain of the LORD''S house shall be established in the top of the mountains... and all nations shall flow unto it* (Isaiah 2:2), *Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways... for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3); the twin in Micah — *many nations shall come, and say, Come, and let us go up to the mountain of Yahuah (LORD)... and he will teach us of his ways, and we will walk in his paths: for the law shall go forth of Zion* (Micah 4:1-2). The nations stream up not to abolish the Torah but to LEARN it — *out of Zion shall go forth the law*. The seeking of Yahuah in Jerusalem is the seeking of His ways, His paths, His instruction.',
       sv.verse_id, ev.verse_id, 'free', 45887
  FROM _s338_zec08_lookup sv, _s338_zec08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=8 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-8-ten-men-shall-take-hold-of-the-skirt-of-a-yahudi',
       E'Ten men shall take hold of the skirt of a Yahudi — the nations grafted in, not replacing',
       E'The chapter ends with the nations laying hold of the covenant people: *Thus saith Yahuah Tseva''ot (LORD of hosts); In those days it shall come to pass, that ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23). The far-off take hold of Yashar''el and come IN — they do not replace the people, they grasp the skirt of the people. Paul names exactly this: *ye were aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise, having no hope, and without Elohim (God) in the world* (Ephesians 2:12), *But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) — the aliens made nigh, grafted into the commonwealth, never replacing the root (Romans 11:1-2). The restored witness sings the same ingathering clean: *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands* (Tobit 13:11); *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols. So shall all nations praise Yahuah (God), and his people shall confess Yahuah (God), and Yahuah (God) shall exalt his people* (Tobit 14:6-7). The nations forsake their idols and take hold of the living Elohim through His people — His people exalted, the far-off brought near, the blessing of Abraham reaching all the families of the earth.',
       sv.verse_id, ev.verse_id, 'extras', 45890
  FROM _s338_zec08_lookup sv, _s338_zec08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=8 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27) — the dwelling-in-the-midst of Zechariah 8:3 sealed over the regathered two-house people.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-i-am-returned-unto-zion-and-will-dwell-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the tabernacle of Elohim (God) is with men, and he will dwell with them... and be their Elohim (God)* (Revelation 21:3) — the *I am returned unto Zion, and will dwell in the midst* (Zechariah 8:3) consummated in the New Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-i-am-returned-unto-zion-and-will-dwell-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10) — the Lo-ammi divorce reversed; the formula of Zechariah 8:8 is the homecoming of the *not my people*.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-they-shall-be-my-people-and-i-will-be-their-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23) — Zechariah 8:8''s covenant-formula in Hosea''s very words of restoration.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-they-shall-be-my-people-and-i-will-be-their-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will take the children of Yashar''el (Israel) from among the heathen... and will gather them on every side, and bring them into their own land* (Ezekiel 37:21) — Zechariah''s *from the east country, and from the west country* (8:7) is Ezekiel''s gathering from every side.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-they-shall-be-my-people-and-i-will-be-their-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23) — the exact covenant-formula of Zechariah 8:8, sealed over the cleansed and reunited two houses.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-they-shall-be-my-people-and-i-will-be-their-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33) — the SAME covenant, Torah on the heart; *in truth and in righteousness* (Zechariah 8:8) because the law is written within.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-they-shall-be-my-people-and-i-will-be-their-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25) — Paul names Zechariah''s ingathering (8:7) as the calling of the once-rejected, quoting Hosea.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-they-shall-be-my-people-and-i-will-be-their-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26) — the divorced house of Zechariah 8:8 named His own; not a new people replacing Israel (Romans 11:1).'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-they-shall-be-my-people-and-i-will-be-their-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will make them one nation... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the two houses Zechariah names together (8:13) made one again.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=13
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-O-house-of-yahudah-and-house-of-yasharel-a-blessing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *in thee shall all families of the earth be blessed* (Genesis 12:3) — the curse turned to blessing on both houses (Zechariah 8:13) makes good the Abrahamic promise; the regathered become the blessing.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=13
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-O-house-of-yahudah-and-house-of-yasharel-a-blessing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *putting away lying, speak every man truth with his neighbour: for we are members one of another* (Ephesians 4:25) — Paul quotes Zechariah 8:16 as the walk of the new man; the Torah lived, not abolished.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-speak-every-man-the-truth-to-his-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye shall not steal, neither deal falsely, neither lie one to another* (Leviticus 19:11) — Zechariah''s *Speak ye every man the truth to his neighbour* (8:16) rooted in the Torah''s own command against falsehood.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-speak-every-man-the-truth-to-his-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the mountain of the LORD''S house shall be established in the top of the mountains... and all nations shall flow unto it* (Isaiah 2:2) — Zechariah''s *many people and strong nations shall come to seek Yahuah* (8:22) is Isaiah''s mountain of the house.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-many-nations-shall-flow-to-the-mountain-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *let us go up to the mountain of Yahuah (LORD)... for out of Zion shall go forth the law* (Isaiah 2:3) — the nations of Zechariah 8:21-22 come to be taught His ways; the Torah goes forth from Zion, not abolished.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-many-nations-shall-flow-to-the-mountain-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the mountain of the house of Yahuah (LORD) shall be established... and people shall flow unto it* (Micah 4:1) — the twin of Isaiah 2; the peoples flowing up to Zion in the last days, as Zechariah 8:22 foretells.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-many-nations-shall-flow-to-the-mountain-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *let us go up to the mountain of Yahuah (LORD)... for the law shall go forth of Zion* (Micah 4:2) — Zechariah''s *Let us go speedily to pray before Yahuah* (8:21) is Micah''s nations seeking His ways; they come for the Torah.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-many-nations-shall-flow-to-the-mountain-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *ye were aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise* (Ephesians 2:12) — the *ten men out of all languages of the nations* (Zechariah 8:23) are these very aliens, taking hold to come in.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-ten-men-shall-take-hold-of-the-skirt-of-a-yahudi'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) — the nations grasping the skirt of the Yahudi (Zechariah 8:23) are the far-off made nigh, grafted in, never replacing the root (Romans 11:1-2).'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-ten-men-shall-take-hold-of-the-skirt-of-a-yahudi'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands* (Tobit 13:11) — the restored witness sings Zechariah''s ingathering of the nations to Zion (8:22).'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-ten-men-shall-take-hold-of-the-skirt-of-a-yahudi'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6) — the nations who lay hold of the Yahudi (Zechariah 8:23) forsake their idols for the living Elohim.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-ten-men-shall-take-hold-of-the-skirt-of-a-yahudi'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *all nations shall praise Yahuah (God), and his people shall confess Yahuah (God), and Yahuah (God) shall exalt his people* (Tobit 14:7) — the nations come IN to His people (Zechariah 8:23); His people exalted, not replaced.'
  FROM cross_reference_threads t
  JOIN _s338_zec08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s338_zec08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-8-ten-men-shall-take-hold-of-the-skirt-of-a-yahudi'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_9.sql (Zechariah 9) -----
-- Chapter: Zechariah 9 — ★ THE KING ON THE DONKEY (the Palm-Sunday prophecy); the blood of the
-- covenant; the prisoners freed. The burden falls on the surrounding nations and on proud Tyrus
-- (9:1-8), then the prophet breaks into the great Messianic shout: *Rejoice greatly, O daughter of
-- Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having
-- salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (9:9) — the
-- triumphal entry the gospels quote word-for-word (Matthew 21:4-5; John 12:14-15). The King is
-- *just, and having salvation* yet *lowly* — the Formed Son, the King who HAS a Father, not a
-- co-equal trinitarian person. *He shall speak peace unto the heathen: and his dominion shall be
-- from sea even to sea* (9:10) — the universal Messianic reign (Psalm 72:8; Revelation 11:15). Then
-- ★★ the covenant-blood that frees the captives: *As for thee also, by the blood of thy covenant I
-- have sent forth thy prisoners out of the pit wherein is no water* (9:11 — Exodus 24:8 the blood of
-- the covenant; Matthew 26:28 my blood of the new testament; Hebrews 13:20 the everlasting covenant;
-- 1 Peter 3:19 the spirits in prison; Isaiah 61:1 liberty to the captives). *Turn you to the strong
-- hold, ye prisoners of hope... I will render double* (9:12 — Isaiah 61:7). And Yahudah and Ephraim
-- are bent as Yahuah's bow and arrows together (9:13) — the TWO HOUSES armed as one (Ezekiel 37);
-- Yahuah seen over them, the trumpet blown, his people saved as the flock (9:14-17).
-- Tag: zec09   Temp view: _s338_zec09_lookup
-- Sort band: base 45900, step 3 -> threads at 45900, 45903, 45906, 45909, 45912 (5 threads)
-- Source of EVERY row: 'canon','zechariah',9,v
--
-- Zechariah 9 coverage:
--   v.1-8 (the burden on Hadrach, Damascus, Tyrus, the Philistine cities; *I will encamp about mine
--          house... no oppressor shall pass through them any more*)
--        NT:     none warranted distinct (the nation-burden/Tyrus-judgment is held in prose; the
--                heaviest weave is the Messianic shout that follows; v.8 the guarded house preface)
--        Extras: none warranted
--        Tanakh: none forced (the Tyrus/Philistia burden is the lawsuit-preface to the King's coming)
--   ★★★ v.9 (Rejoice greatly... behold, thy King cometh unto thee: he is just, and having salvation;
--          lowly, and riding upon an ass, and upon a colt the foal of an ass)
--        NT:     ★★★ Matthew 21:4-5 (that it might be fulfilled... Behold, thy King cometh unto thee,
--                meek, and sitting upon an ass), ★★★ John 12:14-15 (when he had found a young ass...
--                Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass's colt),
--                ★ John 12:13 (palm branches... Blessed is the King of Yashar'el), ★ Matthew 21:9
--                (Hosanna to the Son of David) — THREAD 1
--        Extras: ★ 1 Maccabees 13:51 (entered into it... with branches of palm trees... and hymns,
--                and songs) — THREAD 1 (the palm-branch entry into Jerusalem witness)
--        Tanakh: woven (the King who is just AND lowly = the Formed Son who has a Father)
--   ★★ v.10 (he shall speak peace unto the heathen: and his dominion shall be from sea even to sea,
--          and from the river even to the ends of the earth)
--        NT:     ★★ Revelation 11:15 (The kingdoms of this world are become the kingdoms of our Lord,
--                and of his Messiah; and he shall reign for ever and ever) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Psalm 72:8 (He shall have dominion also from sea to sea, and from the river unto
--                the ends of the earth) — THREAD 2 (the universal Messianic reign, near-verbatim)
--   ★★ v.11 (by the blood of thy covenant I have sent forth thy prisoners out of the pit wherein is
--          no water)
--        NT:     ★★ Matthew 26:28 (this is my blood of the new testament, shed for many for the
--                remission of sins), ★ Hebrews 13:20 (through the blood of the everlasting covenant),
--                ★ 1 Peter 3:19 (he went and preached unto the spirits in prison) — THREAD 3
--        Extras: none warranted (clean extras captives witness not available; held in prose)
--        Tanakh: ★★ Exodus 24:8 (Behold the blood of the covenant, which Yahuah hath made with you),
--                ★ Isaiah 61:1 (to proclaim liberty to the captives, and the opening of the prison to
--                them that are bound) — THREAD 3
--   ★ v.12 (Turn you to the strong hold, ye prisoners of hope... I will render double unto thee)
--        NT:     none warranted distinct (the double-restoration forward-weave carried in prose)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 61:7 (For your shame ye shall have double... in their land they shall
--                possess the double) — THREAD 4
--   ★ v.13 (When I have bent Yahudah for me, filled the bow with Ephraim, and raised up thy sons, O
--          Zion, against thy sons, O Greece)
--        NT:     none warranted distinct (the two-house weave is the Tanakh's own; held in prose)
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 37:19 (the stick of Joseph... and the stick of Yahudah... make them one
--                stick), ★ Ezekiel 37:22 (one nation... they shall be no more two nations) — THREAD 5
--   v.14-17 (Yahuah shall be seen over them... shall blow the trumpet... shall save them in that day
--          as the flock of his people... as the stones of a crown)
--        NT:     none warranted distinct (the theophany/trumpet/flock-saved held in prose; the
--                trumpet and the flock are woven into the surrounding threads)
--        Extras: none warranted
--        Tanakh: held in prose (the King's victory-deliverance closing the chapter)
--
-- Threads (slug — target libraries):
--   1. zechariah-9-thy-king-cometh-lowly-riding-upon-an-ass — NT (Matthew 21, John 12) + Extras
--      (1 Maccabees 13) [extras]  (★★★ THE TRIUMPHAL ENTRY; the just-yet-lowly King = the Formed Son)
--   2. zechariah-9-his-dominion-from-sea-even-to-sea — NT (Revelation 11) + Tanakh (Psalm 72) [free]
--      (★★ the universal Messianic reign, peace to the heathen, sea to sea)
--   3. zechariah-9-by-the-blood-of-thy-covenant-prisoners-out-of-the-pit — NT (Matthew 26, Hebrews
--      13, 1 Peter 3) + Tanakh (Exodus 24, Isaiah 61) [free]  (★★ the covenant-blood that frees the
--      captives; the new testament in his blood = the SAME blood of the covenant, not a replacement)
--   4. zechariah-9-prisoners-of-hope-i-will-render-double — Tanakh (Isaiah 61) [free]
--      (★ the double restoration to the prisoners of hope)
--   5. zechariah-9-yahudah-and-ephraim-his-bow-the-two-houses — Tanakh (Ezekiel 37) [free]
--      (★ Yahudah and Ephraim bent together as Yahuah's bow = the two sticks made one)
--
-- Framing notes:
--   ★★★ THE KING ON THE DONKEY (THREAD 1): *Rejoice greatly, O daughter of Zion; shout, O daughter
--      of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and
--      riding upon an ass, and upon a colt the foal of an ass* (9:9). The gospels quote this as the
--      triumphal entry, by name: *All this was done, that it might be fulfilled which was spoken by
--      the prophet* (Matthew 21:4); *Behold, thy King cometh unto thee, meek, and sitting upon an
--      ass* (Matthew 21:5); *Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass's
--      colt* (John 12:15). The King is *just, and having salvation* — yet *lowly*: the Formed Son, who
--      is Yahuah and HAS a Father, riding meek into his own city; NOT a co-equal trinitarian person.
--      The crowd cries *Blessed is the King of Yashar'el (Israel) that cometh in the name of Yahuah*
--      (John 12:13). And the restored witness gives the palm-branch pattern of an earlier deliverer's
--      entry: *entered into it... with branches of palm trees, and with harps, and cymbals... and
--      hymns, and songs* (1 Maccabees 13:51).
--   ★★ HIS DOMINION FROM SEA TO SEA (THREAD 2): *he shall speak peace unto the heathen: and his
--      dominion shall be from sea even to sea, and from the river even to the ends of the earth*
--      (9:10) — the royal psalm says it near-verbatim: *He shall have dominion also from sea to sea,
--      and from the river unto the ends of the earth* (Psalm 72:8); and the kingdom comes in full:
--      *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ);
--      and he shall reign for ever and ever* (Revelation 11:15).
--   ★★ THE BLOOD OF THE COVENANT (THREAD 3): *by the blood of thy covenant I have sent forth thy
--      prisoners out of the pit wherein is no water* (9:11). The phrase is Sinai's own: *Behold the
--      blood of the covenant, which Yahuah (LORD) hath made with you* (Exodus 24:8); and Yahusha takes
--      up the SAME phrase at the table: *this is my blood of the new testament, which is shed for many
--      for the remission of sins* (Matthew 26:28) — the new covenant in the SAME covenant-blood, not a
--      replacement, *the blood of the everlasting covenant* (Hebrews 13:20). The captives in the
--      waterless pit are freed: *to proclaim liberty to the captives, and the opening of the prison to
--      them that are bound* (Isaiah 61:1); *he went and preached unto the spirits in prison*
--      (1 Peter 3:19).
--   ★ PRISONERS OF HOPE, RENDER DOUBLE (THREAD 4): *Turn you to the strong hold, ye prisoners of
--      hope: even to day do I declare that I will render double unto thee* (9:12) — the double of
--      restoration: *For your shame ye shall have double... in their land they shall possess the
--      double: everlasting joy shall be unto them* (Isaiah 61:7).
--   ★ THE TWO HOUSES AS HIS BOW (THREAD 5): *When I have bent Yahudah (Judah) for me, filled the bow
--      with Ephraim, and raised up thy sons, O Zion, against thy sons, O Greece* (9:13) — Yahudah and
--      Ephraim, the two houses, armed together in Yahuah's hand. This is the two sticks made one:
--      *I will take the stick of Joseph... and the stick of Yahudah (Judah), and make them one stick*
--      (Ezekiel 37:19); *they shall be no more two nations* (Ezekiel 37:22). Never replacement —
--      both houses are Yashar'el (Israel), gathered and made one in his hand.
--   EXTRAS: 1 Maccabees 13:51 (the palm-branch entry into Jerusalem) woven on the donkey-King; clean
--      witness, parse verified. No extras forced on the dominion, the covenant-blood, the double, or
--      the two-house bow (no clean captives/righteous-king witness available in this parse — held in
--      prose deliberately).
--   VERSES WITH NO SEPARATE ADD: v.1-7 (the burden on the nations and Tyrus — the lawsuit-preface to
--      the King's coming, held in prose), v.8 (the guarded house — preface to the King), v.14-17 (the
--      theophany, the trumpet, the flock saved as a crown — the King's victory, woven in prose). All
--      recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Thy King cometh lowly, riding upon an ass — the triumphal entry
    ('canon','zechariah',9,9,'canon','matthew',21,4,'free',
      E'*All this was done, that it might be fulfilled which was spoken by the prophet, saying* (Matthew 21:4). The gospel names Zechariah''s shout — *behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9) — as the very prophecy fulfilled on the day the King rode into Jerusalem. *All this was done, that it might be fulfilled which was spoken by the prophet.*'),
    ('canon','zechariah',9,9,'canon','matthew',21,5,'free',
      E'*Tell ye the daughter of Sion, Behold, thy King cometh unto thee, meek, and sitting upon an ass, and a colt the foal of an ass* (Matthew 21:5). This is Zechariah 9:9 quoted word for word — *behold, thy King cometh unto thee... lowly, and riding upon an ass, and upon a colt the foal of an ass*. The King who is *just, and having salvation* comes *meek*, the Formed Son who is Yahuah and has a Father, riding into his own city; not the war-horse of an emperor but the colt of the lowly King.'),
    ('canon','zechariah',9,9,'canon','john',12,14,'free',
      E'*And Yahusha (Jesus), when he had found a young ass, sat thereon; as it is written* (John 12:14). John marks the act as the fulfilment of the written word: the King *riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9) is Yahusha (Jesus) who *found a young ass, sat thereon; as it is written*. The prophecy and the deed are one.'),
    ('canon','zechariah',9,9,'canon','john',12,15,'free',
      E'*Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass''s colt* (John 12:15). John quotes the shout of Zechariah 9:9 — *Rejoice greatly, O daughter of Zion... behold, thy King cometh unto thee... riding upon an ass, and upon a colt the foal of an ass* — over the King''s entry. The daughter of Zion is bidden *Fear not*; her King has come, lowly, on the colt.'),
    ('canon','zechariah',9,9,'canon','john',12,13,'free',
      E'*Took branches of palm trees, and went forth to meet him, and cried, Hosanna: Blessed is the King of Yashar''el (Israel) that cometh in the name of Yahuah (Lord)* (John 12:13). The *King cometh unto thee* of Zechariah 9:9 is met by the city with palms and the cry *Blessed is the King of Yashar''el (Israel) that cometh in the name of Yahuah (Lord)*. The daughter of Zion bidden to *Rejoice greatly* does shout for her King.'),
    ('canon','zechariah',9,9,'canon','matthew',21,9,'free',
      E'*And the multitudes that went before, and that followed, cried, saying, Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah (Lord); Hosanna in the highest* (Matthew 21:9). The shout *Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem* (Zechariah 9:9) becomes the Hosanna of the crowd — *Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah (Lord)* — hailing the lowly King who has come.'),
    ('canon','zechariah',9,9,'apocrypha','1-maccabees',13,51,'extras',
      E'*And entered into it the three and twentieth day of the second month in the hundred seventy and first year, with thanksgiving, and branches of palm trees, and with harps, and cymbals, and with viols, and hymns, and songs: because there was destroyed a great enemy out of Yashar''el (Israel)* (1 Maccabees 13:51). When Simon entered Jerusalem delivered, the city met him *with branches of palm trees... and hymns, and songs* — the same palm-branch rejoicing the daughter of Zion would pour on her true King: *Rejoice greatly, O daughter of Zion... behold, thy King cometh unto thee* (Zechariah 9:9).'),

    -- THREAD 2 (★★): His dominion from sea even to sea — the universal Messianic reign
    ('canon','zechariah',9,10,'canon','psalms',72,8,'free',
      E'*He shall have dominion also from sea to sea, and from the river unto the ends of the earth* (Psalm 72:8). The royal psalm says it almost word for word with Zechariah''s King: *his dominion shall be from sea even to sea, and from the river even to the ends of the earth* (Zechariah 9:10). The lowly King who rode in on the colt is the same King whose reign reaches the ends of the earth.'),
    ('canon','zechariah',9,10,'canon','revelation',11,15,'free',
      E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The dominion *from sea even to sea... unto the ends of the earth* (Zechariah 9:10) comes to its consummation when *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ)*. The King who spoke peace to the heathen reigns for ever and ever.'),

    -- THREAD 3 (★★): By the blood of thy covenant — the prisoners freed from the pit
    ('canon','zechariah',9,11,'canon','exodus',24,8,'free',
      E'*And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8). Zechariah''s *blood of thy covenant* (Zechariah 9:11) is Sinai''s very phrase — *Behold the blood of the covenant, which Yahuah (LORD) hath made with you*. The covenant sealed in blood at the mountain is the blood that now frees the prisoners.'),
    ('canon','zechariah',9,11,'canon','matthew',26,28,'free',
      E'*For this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28). At the table Yahusha takes up the very words: the *blood of thy covenant* (Zechariah 9:11) and *the blood of the covenant* of Sinai (Exodus 24:8) become *my blood of the new testament, which is shed for many for the remission of sins* — the SAME covenant-blood renewed, not a replacement, the blood that *sent forth thy prisoners out of the pit*.'),
    ('canon','zechariah',9,11,'canon','hebrews',13,20,'free',
      E'*Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant* (Hebrews 13:20). The *blood of thy covenant* by which the prisoners are freed (Zechariah 9:11) is *the blood of the everlasting covenant* — the same covenant-blood by which the great Shepherd was brought again from the dead, the blood that opens the waterless pit.'),
    ('canon','zechariah',9,11,'canon','isaiah',61,1,'free',
      E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound* (Isaiah 61:1). The freeing of *thy prisoners out of the pit wherein is no water* (Zechariah 9:11) is the Anointed One''s very commission — *to proclaim liberty to the captives, and the opening of the prison to them that are bound*.'),
    ('canon','zechariah',9,11,'canon','1-peter',3,19,'free',
      E'*By which also he went and preached unto the spirits in prison* (1 Peter 3:19). The prisoners *out of the pit wherein is no water* (Zechariah 9:11) are reached even in the deepest hold: *he went and preached unto the spirits in prison*. The covenant-blood frees the captives, and the proclamation goes down to the very pit.'),

    -- THREAD 4 (★): Prisoners of hope — I will render double
    ('canon','zechariah',9,12,'canon','isaiah',61,7,'free',
      E'*For your shame ye shall have double; and for confusion they shall rejoice in their portion: therefore in their land they shall possess the double: everlasting joy shall be unto them* (Isaiah 61:7). The promise to the *prisoners of hope* — *I will render double unto thee* (Zechariah 9:12) — is Isaiah''s double of restoration: *for your shame ye shall have double... in their land they shall possess the double*. The captives turned to the strong hold are repaid double for their grief.'),

    -- THREAD 5 (★): Yahudah and Ephraim his bow — the two houses made one
    ('canon','zechariah',9,13,'canon','ezekiel',37,19,'free',
      E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). When Yahuah bends *Yahudah (Judah) for me, filled the bow with Ephraim* (Zechariah 9:13), the two houses are armed as one — the very two sticks Yahuah takes *and make them one stick... one in mine hand*.'),
    ('canon','zechariah',9,13,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Yahudah and Ephraim bent together as Yahuah''s bow (Zechariah 9:13) are *no more two nations* but *one nation... and one king shall be king to them all*. Both houses are Yashar''el (Israel), gathered and made one in his hand — never replacement.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-9-thy-king-cometh-lowly-riding-upon-an-ass',
       E'Thy King cometh, lowly, riding upon an ass — the triumphal entry',
       E'After the burden on the nations, the prophet breaks into a shout: *Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9). The gospels name this very prophecy as fulfilled on the day the King rode into Jerusalem: *All this was done, that it might be fulfilled which was spoken by the prophet, saying, Tell ye the daughter of Sion, Behold, thy King cometh unto thee, meek, and sitting upon an ass, and a colt the foal of an ass* (Matthew 21:4-5); *And Yahusha (Jesus), when he had found a young ass, sat thereon; as it is written, Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass''s colt* (John 12:14-15). The King is *just, and having salvation* — yet *lowly*: the Formed Son, who is Yahuah and HAS a Father, riding meek into his own city, not on the war-horse of an emperor but on the colt of the humble King; not a co-equal trinitarian person but the King the Father sends and exalts. The city meets him with the cry of the daughter of Zion: *Took branches of palm trees, and went forth to meet him, and cried, Hosanna: Blessed is the King of Yashar''el (Israel) that cometh in the name of Yahuah (Lord)* (John 12:13); *Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah (Lord); Hosanna in the highest* (Matthew 21:9). And the restored witness gives the pattern of an earlier deliverer''s entry into the same city: *And entered into it... with thanksgiving, and branches of palm trees, and with harps, and cymbals, and with viols, and hymns, and songs: because there was destroyed a great enemy out of Yashar''el (Israel)* (1 Maccabees 13:51) — the palm branches and the songs that the daughter of Zion would one day pour on her true King.',
       sv.verse_id, ev.verse_id, 'extras', 45900
  FROM _s338_zec09_lookup sv, _s338_zec09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-9-his-dominion-from-sea-even-to-sea',
       E'He shall speak peace — his dominion from sea even to sea',
       E'The King who comes lowly is no petty ruler: *And I will cut off the chariot from Ephraim, and the horse from Jerusalem, and the battle bow shall be cut off: and he shall speak peace unto the heathen: and his dominion shall be from sea even to sea, and from the river even to the ends of the earth* (Zechariah 9:10). The royal psalm sings the same reach almost word for word: *He shall have dominion also from sea to sea, and from the river unto the ends of the earth* (Psalm 72:8) — *Yea, all kings shall fall down before him: all nations shall serve him* (Psalm 72:11). And the kingdom comes to its consummation when the seventh trumpet sounds: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The colt-riding King who *speaks peace unto the heathen* is the King whose dominion fills the earth — the Formed Son to whom the Father gives the kingdom for ever.',
       sv.verse_id, ev.verse_id, 'free', 45903
  FROM _s338_zec09_lookup sv, _s338_zec09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-9-by-the-blood-of-thy-covenant-prisoners-out-of-the-pit',
       E'By the blood of thy covenant — the prisoners freed from the pit',
       E'*As for thee also, by the blood of thy covenant I have sent forth thy prisoners out of the pit wherein is no water* (Zechariah 9:11). The phrase *the blood of the covenant* is Sinai''s own: *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8). And Yahusha takes up the SAME words at the table: *For this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28) — the new covenant in the SAME covenant-blood, not a covenant set aside but the covenant renewed, *the blood of the everlasting covenant* (Hebrews 13:20) by which the great Shepherd was brought again from the dead. By that blood the captives in the waterless pit are loosed, which is the Anointed One''s very commission: *he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound* (Isaiah 61:1). The deliverance reaches even to the deepest hold: *By which also he went and preached unto the spirits in prison* (1 Peter 3:19). The blood of the covenant opens the pit where there is no water.',
       sv.verse_id, ev.verse_id, 'free', 45906
  FROM _s338_zec09_lookup sv, _s338_zec09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=9 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-9-prisoners-of-hope-i-will-render-double',
       E'Prisoners of hope — I will render double unto thee',
       E'The freed captives are bidden home to safety: *Turn you to the strong hold, ye prisoners of hope: even to day do I declare that I will render double unto thee* (Zechariah 9:12). The double is the double of restoration that Isaiah promises the same broken people: *For your shame ye shall have double; and for confusion they shall rejoice in their portion: therefore in their land they shall possess the double: everlasting joy shall be unto them* (Isaiah 61:7) — the very chapter that proclaims *liberty to the captives* (Isaiah 61:1). The prisoners of hope who turn to the strong hold are repaid double for all their grief; everlasting joy is theirs in their land.',
       sv.verse_id, ev.verse_id, 'free', 45909
  FROM _s338_zec09_lookup sv, _s338_zec09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-9-yahudah-and-ephraim-his-bow-the-two-houses',
       E'Yahudah and Ephraim, his bow — the two houses armed as one',
       E'Yahuah arms his people for the battle, and he arms them TOGETHER: *When I have bent Yahudah (Judah) for me, filled the bow with Ephraim, and raised up thy sons, O Zion, against thy sons, O Greece, and made thee as the sword of a mighty man* (Zechariah 9:13). Yahudah is the bent bow, Ephraim the arrows — the two houses, south and north, made one weapon in Yahuah''s hand. This is the two sticks made one: *Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19); *and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Both houses are Yashar''el (Israel) — the divided kingdom gathered and made one in his hand; never replacement, never a new people grafted in by confession, but Yahudah and Ephraim restored and armed as Yahuah''s own bow.',
       sv.verse_id, ev.verse_id, 'free', 45912
  FROM _s338_zec09_lookup sv, _s338_zec09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=9 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *that it might be fulfilled which was spoken by the prophet* (Matthew 21:4) — the gospel names Zechariah 9:9 as the prophecy fulfilled when the King rode in.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-thy-king-cometh-lowly-riding-upon-an-ass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Behold, thy King cometh unto thee, meek, and sitting upon an ass, and a colt the foal of an ass* (Matthew 21:5) — Zechariah 9:9 word for word; the just King who comes lowly, the Formed Son who has a Father.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-thy-king-cometh-lowly-riding-upon-an-ass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *Yahusha (Jesus), when he had found a young ass, sat thereon; as it is written* (John 12:14) — the deed done as the written word of Zechariah 9:9 foretold.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-thy-king-cometh-lowly-riding-upon-an-ass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★★ *Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass''s colt* (John 12:15) — John quotes the shout of Zechariah 9:9 over the King''s entry; the daughter of Zion bidden Fear not.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-thy-king-cometh-lowly-riding-upon-an-ass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *branches of palm trees... Hosanna: Blessed is the King of Yashar''el (Israel) that cometh in the name of Yahuah (Lord)* (John 12:13) — the daughter of Zion bidden to Rejoice greatly (Zechariah 9:9) shouts for her King.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-thy-king-cometh-lowly-riding-upon-an-ass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Hosanna to the Son of David: Blessed is he that cometh in the name of Yahuah (Lord)* (Matthew 21:9) — the shout of Zechariah 9:9 becomes the Hosanna of the multitude.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-thy-king-cometh-lowly-riding-upon-an-ass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *entered into it... with branches of palm trees... and hymns, and songs* (1 Maccabees 13:51) — the palm-branch entry into Jerusalem; the rejoicing the daughter of Zion would pour on her true King (Zechariah 9:9).'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=13 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-thy-king-cometh-lowly-riding-upon-an-ass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *He shall have dominion also from sea to sea, and from the river unto the ends of the earth* (Psalm 72:8) — the royal psalm says Zechariah 9:10 almost word for word; the same universal reign.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-his-dominion-from-sea-even-to-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15) — the dominion from sea to sea (Zechariah 9:10) at its consummation.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-his-dominion-from-sea-even-to-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Behold the blood of the covenant, which Yahuah (LORD) hath made with you* (Exodus 24:8) — Zechariah''s blood of thy covenant (9:11) is Sinai''s very phrase.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-by-the-blood-of-thy-covenant-prisoners-out-of-the-pit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28) — the SAME covenant-blood (Zechariah 9:11; Exodus 24:8) renewed, not replaced.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-by-the-blood-of-thy-covenant-prisoners-out-of-the-pit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *that great shepherd of the sheep, through the blood of the everlasting covenant* (Hebrews 13:20) — the blood of thy covenant (Zechariah 9:11) is the blood of the everlasting covenant.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-by-the-blood-of-thy-covenant-prisoners-out-of-the-pit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *to proclaim liberty to the captives, and the opening of the prison to them that are bound* (Isaiah 61:1) — the freeing of the prisoners from the pit (Zechariah 9:11) is the Anointed One''s commission.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-by-the-blood-of-thy-covenant-prisoners-out-of-the-pit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he went and preached unto the spirits in prison* (1 Peter 3:19) — the deliverance reaches even the deepest hold; the pit wherein is no water (Zechariah 9:11) is not beyond his reach.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-by-the-blood-of-thy-covenant-prisoners-out-of-the-pit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *For your shame ye shall have double... in their land they shall possess the double: everlasting joy shall be unto them* (Isaiah 61:7) — the double rendered to the prisoners of hope (Zechariah 9:12) is Isaiah''s double of restoration.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=12
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-prisoners-of-hope-i-will-render-double'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the stick of Joseph... and the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19) — Yahudah and Ephraim bent together as Yahuah''s bow (Zechariah 9:13) are the two sticks made one.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-yahudah-and-ephraim-his-bow-the-two-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the two houses armed as one (Zechariah 9:13); both are Yashar''el (Israel), never replacement.'
  FROM cross_reference_threads t
  JOIN _s338_zec09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s338_zec09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-9-yahudah-and-ephraim-his-bow-the-two-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_10.sql (Zechariah 10) -----
-- Chapter: Zechariah 10 — THE SHEPHERDS JUDGED AND THE TWO-HOUSE REGATHERING. The people, misled by
-- idols and diviners, *went their way as a flock, they were troubled, because there was no shepherd*
-- (10:2); Yahuah's anger is kindled against the false shepherds, but he *hath visited his flock the
-- house of Yahudah (Judah)* (10:3). From Yahudah comes the Messianic ruler — *Out of him came forth the
-- corner, out of him the nail, out of him the battle bow* (10:4): the cornerstone/nail/scepter from
-- Judah. Then the keystone of the chapter: *I will strengthen the house of Yahudah (Judah), and I will
-- save the house of Joseph... and they shall be as though I had not cast them off* (10:6) — BOTH houses,
-- Judah AND Joseph/Ephraim, restored together, the Hosea Lo-Ammi reversal, the two sticks made one,
-- gathered home in a second exodus *out of the land of Egypt... out of Assyria* (10:10). The Romans 11
-- anti-replacement guard anchors the keystone: *Hath Elohim (God) cast away his people? Elohim (God)
-- forbid* (Rom 11:1).
-- Tag: zec10   Temp view: _s338_zec10_lookup   Session prefix: s338
-- Sort band: base 45925, step 3 -> threads at 45925, 45928, 45931, 45934, 45937 (5 threads)
-- Source of EVERY row: 'canon','zechariah',10,v
--
-- Zechariah 10 coverage:
--   v.1  (Ask ye of Yahuah (LORD) rain in the time of the latter rain)
--        NT:     none warranted (latter-rain woven into prose; no single forced NT add)
--        Extras: none warranted
--        Tanakh: none warranted distinct (preface to the shepherd-lawsuit of v.2-3)
--   ★ v.2-3 (they went their way as a flock... because there was no shepherd / Mine anger was kindled
--          against the shepherds)
--        NT:     ★ Matthew 9:36 (because they fainted, and were scattered abroad, as sheep having no
--                shepherd) — THREAD 1
--        Extras: none warranted (Ezekiel carries the lateral weight cleanly)
--        Tanakh: ★ Ezekiel 34:5 (they were scattered, because there is no shepherd), ★ Ezekiel 34:10
--                (Behold, I am against the shepherds) — THREAD 1
--   ★ v.3 (Yahuah Tseva'ot hath visited his flock the house of Yahudah (Judah))
--        NT:     ★ Luke 1:68 (Blessed be Yahuah Elohim... for he hath visited and redeemed his people)
--                — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 34:11 (I, even I, will both search my sheep, and seek them out), Ezekiel
--                34:12 (so will I seek out my sheep) — THREAD 2 (Yahuah himself visits/seeks the flock)
--   ★★ v.4 (Out of him came forth the corner, out of him the nail... out of him every oppressor together)
--        NT:     ★★ 1 Peter 2:6 (Behold, I lay in Sion a chief corner stone, elect, precious) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Genesis 49:10 (The sceptre shall not depart from Yahudah), ★★ Isaiah 22:23 (I will
--                fasten him as a nail in a sure place), ★ Isaiah 28:16 (a precious corner stone),
--                Psalm 118:22 (the head stone of the corner) — THREAD 3
--   v.5 (they shall be as mighty men... Yahuah (LORD) is with them)
--        NT/Extras/Tanakh: none warranted distinct (woven into THREAD 3 prose — the strengthened flock
--                under the cornerstone-ruler)
--   ★★★ v.6-7 (I will strengthen the house of Yahudah... I will save the house of Joseph... as though I
--          had not cast them off / they of Ephraim shall be like a mighty man)
--        NT:     ★★★ Romans 11:1 (Hath Elohim (God) cast away his people? Elohim (God) forbid) — THREAD 4
--                (the anti-replacement guard)
--        Extras: ★ 2 Esdras 13:40 (Those are the ten tribes, which were carried away prisoners) — THREAD 4
--        Tanakh: ★★★ Hosea 1:10 (in the place where it was said... Ye are not my people... Ye are the
--                sons of the living Elohim), ★★ Hosea 2:23 (I will say to them which were not my people,
--                Thou art my people), ★★ Ezekiel 37:19 (the stick of Joseph... with the stick of
--                Yahudah... one stick), ★★ Ezekiel 37:22 (they shall be no more two nations) — THREAD 4
--   ★ v.8-10 (I will hiss for them, and gather them; for I have redeemed them / I will bring them again
--          also out of the land of Egypt, and gather them out of Assyria)
--        NT:     none warranted distinct (the second-exodus ingathering carried by Isaiah laterally +
--                Tobit out; NT regathering held in THREAD 4's two-house frame)
--        Extras: ★ Tobit 13:5 (will gather us out of all nations, among whom he has scattered us),
--                ★ Tobit 14:5 (afterward they shall return from all places of their captivity) — THREAD 5
--        Tanakh: ★ Isaiah 11:11 (Yahuah shall set his hand again the second time to recover the remnant),
--                ★ Isaiah 11:12 (assemble the outcasts of Yashar'el... the dispersed of Yahudah) — THREAD 5
--   v.11 (he shall pass through the sea with affliction... the pride of Assyria shall be brought down)
--        NT/Extras: none warranted
--        Tanakh: woven into THREAD 5 (the second-exodus sea-passage, the Assyria/Egypt downfall)
--   v.12 (I will strengthen them in Yahuah; and they shall walk up and down in his name)
--        NT/Extras/Tanakh: none warranted distinct (the chapter's closing seal, woven into THREAD 4/5
--                prose — the redeemed walking in his name)
--
-- Threads (slug — target libraries):
--   1. zechariah-10-they-went-their-way-as-a-flock-no-shepherd — NT (Matthew 9) + Tanakh (Ezekiel 34) [free]
--      (★ the scattered flock with no shepherd; the false shepherds judged)
--   2. zechariah-10-yahuah-hath-visited-his-flock-the-house-of-judah — NT (Luke 1) + Tanakh (Ezekiel 34) [free]
--      (★ Yahuah himself visits/seeks the flock — hath visited and redeemed his people)
--   3. zechariah-10-out-of-him-the-corner-the-nail-the-ruler-from-judah — NT (1 Peter 2) + Tanakh
--      (Genesis 49, Isaiah 22, Isaiah 28, Psalm 118) [free]
--      (★★ the cornerstone/nail/scepter out of Yahudah — the Messianic ruler from Judah)
--   4. zechariah-10-i-will-save-the-house-of-judah-and-of-joseph — NT (Romans 11) + Extras (2 Esdras 13)
--      + Tanakh (Hosea 1, Hosea 2, Ezekiel 37) [extras]
--      (★★★ THE KEYSTONE — both houses saved as though never cast off; Lo-Ammi reversed, two sticks one,
--      Romans 11 anti-replacement guard)
--   5. zechariah-10-gather-them-out-of-egypt-and-assyria — Extras (Tobit 13, Tobit 14) + Tanakh
--      (Isaiah 11) [extras]
--      (★ the second exodus — redeemed and gathered home out of the lands of scattering)
--
-- Framing notes:
--   ★ NO SHEPHERD (THREAD 1): *therefore they went their way as a flock, they were troubled, because
--      there was no shepherd* (10:2); *Mine anger was kindled against the shepherds* (10:3). Ezekiel's
--      shepherd-lawsuit is the lateral root: *they were scattered, because there is no shepherd* (Ezek
--      34:5); *Behold, I am against the shepherds* (Ezek 34:10). Yahusha sees the same flock: *moved with
--      compassion... because they fainted, and were scattered abroad, as sheep having no shepherd* (Matt
--      9:36). Covenant-lawsuit against the FAILED shepherds; the flock are victims, not enemies.
--   ★ YAHUAH VISITS HIS FLOCK (THREAD 2): *Yahuah Tseva'ot (LORD of hosts) hath visited his flock the
--      house of Yahudah (Judah)* (10:3). Ezekiel: *I, even I, will both search my sheep, and seek them
--      out* (Ezek 34:11) — Yahuah himself becomes the shepherd. Zacharias names the visitation fulfilled:
--      *Blessed be Yahuah Elohim (the Lord God) of Yashar'el (Israel); for he hath visited and redeemed
--      his people* (Luke 1:68).
--   ★★ THE CORNER, THE NAIL, THE RULER FROM JUDAH (THREAD 3): *Out of him came forth the corner, out of
--      him the nail, out of him the battle bow* (10:4) — out of Yahudah comes the cornerstone-ruler.
--      Genesis: *The sceptre shall not depart from Yahudah... until Shiloh come* (Gen 49:10). The nail:
--      *I will fasten him as a nail in a sure place* (Isa 22:23). The cornerstone: *Behold, I lay in Zion
--      for a foundation a stone... a precious corner stone* (Isa 28:16); *The stone which the builders
--      refused is become the head stone of the corner* (Ps 118:22); fulfilled — *Behold, I lay in Sion a
--      chief corner stone, elect, precious* (1 Pet 2:6). The Formed Son, the ruler drawn from Yahudah.
--   ★★★ THE KEYSTONE — BOTH HOUSES SAVED (THREAD 4): *I will strengthen the house of Yahudah (Judah), and
--      I will save the house of Joseph, and I will bring them again to place them... and they shall be as
--      though I had not cast them off* (10:6); *they of Ephraim shall be like a mighty man* (10:7). BOTH
--      houses — Judah AND Joseph/Ephraim — restored together. This is the Lo-Ammi reversal: *in the place
--      where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the
--      sons of the living Elohim (God)* (Hos 1:10); *I will say to them which were not my people, Thou art
--      my people* (Hos 2:23). The two sticks made one: *the stick of Joseph... with the stick of Yahudah
--      (Judah), and make them one stick* (Ezek 37:19); *they shall be no more two nations* (Ezek 37:22).
--      The restored witness names the lost house: *Those are the ten tribes, which were carried away
--      prisoners* (2 Esdras 13:40). And the ANTI-REPLACEMENT GUARD: *Hath Elohim (God) cast away his
--      people? Elohim (God) forbid* (Rom 11:1) — *as though I had not cast them off*. Never replacement;
--      both houses are Yashar'el, gathered home.
--   ★ THE SECOND EXODUS (THREAD 5): *I will hiss for them, and gather them; for I have redeemed them*
--      (10:8); *I will bring them again also out of the land of Egypt, and gather them out of Assyria*
--      (10:10). Isaiah: *Yahuah (Lord) shall set his hand again the second time to recover the remnant of
--      his people* (Isa 11:11); *assemble the outcasts of Yashar'el (Israel), and gather together the
--      dispersed of Yahudah (Judah)* (Isa 11:12). The restored witness sings the same: *will gather us
--      out of all nations, among whom he has scattered us* (Tobit 13:5); *afterward they shall return
--      from all places of their captivity* (Tobit 14:5).
--   VERSES WITH NO SEPARATE ADD: v.1 (latter rain — preface, woven into prose), v.5 (mighty men — woven
--      into THREAD 3), v.9 (sown among the people — woven into THREAD 5's scattering/regathering), v.11
--      (the sea-passage, Assyria/Egypt downfall — woven into THREAD 5), v.12 (walk in his name — closing
--      seal, woven into THREAD 4/5). All recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The scattered flock with no shepherd; the false shepherds judged
    ('canon','zechariah',10,2,'canon','matthew',9,36,'free',
      E'*But when he saw the multitudes, he was moved with compassion on them, because they fainted, and were scattered abroad, as sheep having no shepherd* (Matthew 9:36). The flock that *went their way as a flock, they were troubled, because there was no shepherd* (Zechariah 10:2) is the very multitude Yahusha (Jesus) beholds — *scattered abroad, as sheep having no shepherd*. The misled, shepherdless flock of the prophet is the people he is *moved with compassion* over; victims of the failed shepherds, not enemies.'),
    ('canon','zechariah',10,2,'canon','ezekiel',34,5,'free',
      E'*And they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered* (Ezekiel 34:5). Zechariah''s flock *troubled, because there was no shepherd* (Zechariah 10:2) is Ezekiel''s scattered flock — *scattered, because there is no shepherd*. The same diagnosis: the sheep are lost because those set over them failed to feed them.'),
    ('canon','zechariah',10,3,'canon','ezekiel',34,10,'free',
      E'*Thus saith Adonai Yahuah (the Lord GOD); Behold, I am against the shepherds; and I will require my flock at their hand, and cause them to cease from feeding the flock* (Ezekiel 34:10). When *Mine anger was kindled against the shepherds* (Zechariah 10:3), it is the verdict Ezekiel pronounced — *Behold, I am against the shepherds*. Covenant-lawsuit against the false shepherds; Yahuah requires the scattered flock at their hand.'),

    -- THREAD 2 (★): Yahuah himself visits/seeks the flock — hath visited and redeemed his people
    ('canon','zechariah',10,3,'canon','luke',1,68,'free',
      E'*Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people* (Luke 1:68). When *Yahuah Tseva''ot (LORD of hosts) hath visited his flock the house of Yahudah (Judah)* (Zechariah 10:3), Zacharias names the visitation come — *he hath visited and redeemed his people*. The Shepherd who was kindled against the false shepherds comes himself to his flock.'),
    ('canon','zechariah',10,3,'canon','ezekiel',34,11,'free',
      E'*For thus saith Adonai Yahuah (the Lord GOD); Behold, I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11). Because the shepherds failed, Yahuah himself takes up the staff: *Yahuah Tseva''ot (LORD of hosts) hath visited his flock* (Zechariah 10:3) — *I, even I, will both search my sheep, and seek them out*. The visitation of the flock is Yahuah becoming the Shepherd of his own people.'),
    ('canon','zechariah',10,3,'canon','ezekiel',34,12,'free',
      E'*As a shepherd seeketh out his flock in the day that he is among his sheep that are scattered; so will I seek out my sheep, and will deliver them out of all places where they have been scattered in the cloudy and dark day* (Ezekiel 34:12). The flock *visited* (Zechariah 10:3) is the scattered flock Yahuah seeks out *in the cloudy and dark day* — delivered *out of all places where they have been scattered*. The visitation is the gathering of the lost sheep home.'),

    -- THREAD 3 (★★): The corner, the nail, the ruler out of Yahudah — the Messianic ruler from Judah
    ('canon','zechariah',10,4,'canon','genesis',49,10,'free',
      E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). *Out of him came forth the corner, out of him the nail, out of him the battle bow* (Zechariah 10:4) — out of Yahudah comes the ruler. Jacob''s blessing set it first: *The sceptre shall not depart from Yahudah... until Shiloh come*. The corner and the nail are the scepter-bearer drawn from Judah.'),
    ('canon','zechariah',10,4,'canon','isaiah',22,23,'free',
      E'*And I will fasten him as a nail in a sure place; and he shall be for a glorious throne to his father''s house* (Isaiah 22:23). The *nail* that comes *out of him* (Zechariah 10:4) is Isaiah''s nail — *I will fasten him as a nail in a sure place*. The peg on which the whole house hangs is the ruler from Yahudah, set fast and bearing the glory of his father''s house.'),
    ('canon','zechariah',10,4,'canon','isaiah',28,16,'free',
      E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The *corner* that comes *out of him* (Zechariah 10:4) is the cornerstone laid in Zion — *a precious corner stone, a sure foundation*. The ruler out of Yahudah is the tried stone the whole building rests upon.'),
    ('canon','zechariah',10,4,'canon','psalms',118,22,'free',
      E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). The *corner* that comes *out of him* (Zechariah 10:4) is the rejected stone become *the head stone of the corner*. The cornerstone from Yahudah, set at nought by the builders, is exalted to the place of honour over the whole house.'),
    ('canon','zechariah',10,4,'canon','1-peter',2,6,'free',
      E'*Wherefore also it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6). The *corner... out of him* (Zechariah 10:4) is named fulfilled — *a chief corner stone, elect, precious*, laid in Sion. The ruler drawn from Yahudah is the Formed Son, the cornerstone the whole house of both peoples is built upon.'),

    -- THREAD 4 (★★★): THE KEYSTONE — both houses saved as though never cast off; Lo-Ammi reversed
    ('canon','zechariah',10,6,'canon','hosea',1,10,'extras',
      E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). *I will save the house of Joseph... and they shall be as though I had not cast them off* (Zechariah 10:6) is the Lo-Ammi reversal: the house divorced and called *not my people* is restored — *Ye are the sons of the living Elohim (God)*. The northern house multiplied and re-owned.'),
    ('canon','zechariah',10,6,'canon','hosea',2,23,'extras',
      E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). *For I have mercy upon them: and they shall be as though I had not cast them off* (Zechariah 10:6) is Hosea''s mercy-reversal — *I will have mercy upon her that had not obtained mercy... I will say to them which were not my people, Thou art my people*. The cast-off house is re-claimed as Yahuah''s own.'),
    ('canon','zechariah',10,6,'canon','ezekiel',37,19,'extras',
      E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). *I will strengthen the house of Yahudah (Judah), and I will save the house of Joseph* (Zechariah 10:6) — the two houses saved together — is the two sticks made one: *the stick of Joseph... even with the stick of Yahudah (Judah), and make them one stick*. Both houses, Judah and Joseph/Ephraim, joined in Yahuah''s hand.'),
    ('canon','zechariah',10,6,'canon','ezekiel',37,22,'extras',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The Judah-and-Joseph salvation of *they shall be as though I had not cast them off* (Zechariah 10:6) ends in one people — *they shall be no more two nations*. The divided kingdom reunited under one King, never again two.'),
    ('canon','zechariah',10,6,'canon','romans',11,1,'extras',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). *They shall be as though I had not cast them off* (Zechariah 10:6) is the anti-replacement guard Paul echoes: *Hath Elohim (God) cast away his people? Elohim (God) forbid*. Yahuah never cast off his people; both houses are restored, never replaced — the covenant lineage gathered, not a new people grafted in by confession.'),
    ('canon','zechariah',10,6,'apocrypha','2-esdras',13,40,'extras',
      E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land* (2 Esdras 13:40). *I will save the house of Joseph* (Zechariah 10:6) names the lost northern house the restored witness identifies — *the ten tribes, which were carried away prisoners... captive*. The scattered house of Joseph/Ephraim is the very people Yahuah promises to save and bring again.'),

    -- THREAD 5 (★): The second exodus — redeemed and gathered home out of the lands of scattering
    ('canon','zechariah',10,10,'canon','isaiah',11,11,'extras',
      E'*And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea* (Isaiah 11:11). *I will bring them again also out of the land of Egypt, and gather them out of Assyria* (Zechariah 10:10) is Isaiah''s second exodus — *the second time to recover the remnant... from Assyria, and from Egypt*. The same lands of scattering, the same hand of Yahuah gathering home.'),
    ('canon','zechariah',10,10,'canon','isaiah',11,12,'extras',
      E'*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The regathering *out of the land of Egypt... out of Assyria* (Zechariah 10:10) is the assembling of both houses — *the outcasts of Yashar''el (Israel)* and *the dispersed of Yahudah (Judah)* — from the four corners of the earth. Both peoples brought home together.'),
    ('canon','zechariah',10,8,'apocrypha','tobit',13,5,'extras',
      E'*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). *I will hiss for them, and gather them; for I have redeemed them* (Zechariah 10:8) is Tobit''s gathering-after-mercy — *will have mercy again, and will gather us out of all nations*. The redeemed are called home from every place of their scattering.'),
    ('canon','zechariah',10,10,'apocrypha','tobit',14,5,'extras',
      E'*And that again Yahuah (God) will have mercy on them, and bring them again into the land, where they shall build a temple... and afterward they shall return from all places of their captivity, and build up Jerusalem gloriously* (Tobit 14:5). *I will bring them again also out of the land of Egypt, and gather them out of Assyria* (Zechariah 10:10) is the return Tobit foresees — *afterward they shall return from all places of their captivity*. The redeemed brought again into the land, the city built up gloriously.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-10-they-went-their-way-as-a-flock-no-shepherd',
       E'They went their way as a flock — because there was no shepherd',
       E'The people, misled by idols and diviners, are a flock without a guide: *For the idols have spoken vanity, and the diviners have seen a lie, and have told false dreams; they comfort in vain: therefore they went their way as a flock, they were troubled, because there was no shepherd* (Zechariah 10:2). And Yahuah''s verdict falls on those who should have fed them: *Mine anger was kindled against the shepherds* (10:3). Ezekiel''s shepherd-lawsuit is the lateral root: *And they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered* (Ezekiel 34:5); *Behold, I am against the shepherds; and I will require my flock at their hand* (Ezekiel 34:10). And Yahusha (Jesus) sees the very same flock: *But when he saw the multitudes, he was moved with compassion on them, because they fainted, and were scattered abroad, as sheep having no shepherd* (Matthew 9:36). This is covenant-lawsuit against the FAILED shepherds, never against the sheep — the flock are victims of those who fed themselves, the lost sheep the true Shepherd is moved with compassion over.',
       sv.verse_id, ev.verse_id, 'free', 45925
  FROM _s338_zec10_lookup sv, _s338_zec10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-10-yahuah-hath-visited-his-flock-the-house-of-judah',
       E'Yahuah hath visited his flock — he hath visited and redeemed his people',
       E'Because the shepherds failed, Yahuah takes up the staff himself: *for Yahuah Tseva''ot (LORD of hosts) hath visited his flock the house of Yahudah (Judah), and hath made them as his goodly horse in the battle* (Zechariah 10:3). Ezekiel had promised exactly this — that when the hirelings fall, Yahuah becomes the Shepherd: *Behold, I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11); *As a shepherd seeketh out his flock in the day that he is among his sheep that are scattered; so will I seek out my sheep, and will deliver them out of all places where they have been scattered in the cloudy and dark day* (Ezekiel 34:12). And Zacharias, filled with the Ruach HaKodesh (Holy Spirit), names the visitation arrived: *Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people* (Luke 1:68). The Shepherd kindled against the false shepherds comes himself to seek, deliver, and redeem his flock.',
       sv.verse_id, ev.verse_id, 'free', 45928
  FROM _s338_zec10_lookup sv, _s338_zec10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-10-out-of-him-the-corner-the-nail-the-ruler-from-judah',
       E'Out of him the corner, out of him the nail — the ruler from Yahudah',
       E'From the visited house of Yahudah comes the ruler: *Out of him came forth the corner, out of him the nail, out of him the battle bow, out of him every oppressor together* (Zechariah 10:4). Every title points to the Messianic ruler drawn from Judah. The scepter: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The nail: *And I will fasten him as a nail in a sure place; and he shall be for a glorious throne to his father''s house* (Isaiah 22:23) — the peg the whole house hangs upon. The corner: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation* (Isaiah 28:16); *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). And the cornerstone is named fulfilled in the Formed Son: *Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6). The corner, the nail, and the scepter all come *out of* Yahudah — one ruler, the stone the whole house is built upon.',
       sv.verse_id, ev.verse_id, 'free', 45931
  FROM _s338_zec10_lookup sv, _s338_zec10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★) KEYSTONE
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-10-i-will-save-the-house-of-judah-and-of-joseph',
       E'I will save the house of Yahudah AND the house of Joseph — as though never cast off',
       E'Here is the keystone of the chapter — BOTH houses, saved together: *And I will strengthen the house of Yahudah (Judah), and I will save the house of Joseph, and I will bring them again to place them; for I have mercy upon them: and they shall be as though I had not cast them off: for I am Yahuah (LORD) their Elohim (God), and will hear them* (Zechariah 10:6); *And they of Ephraim shall be like a mighty man... their heart shall rejoice in Yahuah (LORD)* (10:7). Judah AND Joseph/Ephraim — the southern house and the divorced northern house — restored as one. This is the Lo-Ammi reversal Hosea sang: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10); *I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). It is Ezekiel''s two sticks made one: *I will take the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19); *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The restored witness names the lost house plainly: *Those are the ten tribes, which were carried away prisoners out of their own land... whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — the house of Joseph Yahuah promises to save. And the anti-replacement guard seals it: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). *As though I had not cast them off* — Yahuah never cast off his people. Both houses are Yashar''el (Israel), gathered home; never replaced, never a new people grafted in by confession, but the covenant people made one again.',
       sv.verse_id, ev.verse_id, 'extras', 45934
  FROM _s338_zec10_lookup sv, _s338_zec10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-10-gather-them-out-of-egypt-and-assyria',
       E'I will gather them out of Egypt and Assyria — the second exodus',
       E'The redeemed are whistled home from every land of their scattering: *I will hiss for them, and gather them; for I have redeemed them: and they shall increase as they have increased* (Zechariah 10:8); *I will bring them again also out of the land of Egypt, and gather them out of Assyria; and I will bring them into the land of Gilead and Lebanon* (10:10). This is the second exodus Isaiah foretold: *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush* (Isaiah 11:11); *and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12) — both houses, the outcasts and the dispersed, brought home. The restored witness sings the same hope: *will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5); *afterward they shall return from all places of their captivity, and build up Jerusalem gloriously* (Tobit 14:5). The same lands of exile — Egypt, Assyria, all nations — the same hand of Yahuah gathering the redeemed home, that *they shall walk up and down in his name* (Zechariah 10:12).',
       sv.verse_id, ev.verse_id, 'extras', 45937
  FROM _s338_zec10_lookup sv, _s338_zec10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *scattered abroad, as sheep having no shepherd* (Matthew 9:36) — the shepherdless flock of Zechariah 10:2 is the multitude Yahusha is moved with compassion over.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-they-went-their-way-as-a-flock-no-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they were scattered, because there is no shepherd* (Ezekiel 34:5) — the same diagnosis as Zechariah 10:2; the flock lost because the shepherds failed to feed them.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-they-went-their-way-as-a-flock-no-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Behold, I am against the shepherds; and I will require my flock at their hand* (Ezekiel 34:10) — Yahuah''s anger *kindled against the shepherds* (Zechariah 10:3); covenant-lawsuit against the hirelings, never the sheep.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-they-went-their-way-as-a-flock-no-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *for he hath visited and redeemed his people* (Luke 1:68) — Zacharias names the visitation of Zechariah 10:3 arrived; the Shepherd comes himself.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=68
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-yahuah-hath-visited-his-flock-the-house-of-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11) — when the hirelings fall, Yahuah himself becomes the Shepherd who *visited his flock* (Zechariah 10:3).'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-yahuah-hath-visited-his-flock-the-house-of-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*so will I seek out my sheep, and will deliver them out of all places where they have been scattered* (Ezekiel 34:12) — the visitation of the flock (Zechariah 10:3) is the gathering of the scattered sheep home.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-yahuah-hath-visited-his-flock-the-house-of-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *The sceptre shall not depart from Yahudah (Judah)... until Shiloh come* (Genesis 49:10) — the ruler that comes *out of him* (Zechariah 10:4) is the scepter-bearer drawn from Judah.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-out-of-him-the-corner-the-nail-the-ruler-from-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will fasten him as a nail in a sure place* (Isaiah 22:23) — the *nail* out of Yahudah (Zechariah 10:4) is the peg the whole house hangs upon.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=22 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-out-of-him-the-corner-the-nail-the-ruler-from-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Behold, I lay in Zion for a foundation a stone... a precious corner stone, a sure foundation* (Isaiah 28:16) — the *corner* out of Yahudah (Zechariah 10:4) is the cornerstone laid in Zion.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-out-of-him-the-corner-the-nail-the-ruler-from-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22) — the rejected cornerstone from Yahudah (Zechariah 10:4) exalted to the head of the house.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-out-of-him-the-corner-the-nail-the-ruler-from-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Behold, I lay in Sion a chief corner stone, elect, precious* (1 Peter 2:6) — the corner out of Yahudah (Zechariah 10:4) named fulfilled in the Formed Son, the stone the whole house is built upon.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-out-of-him-the-corner-the-nail-the-ruler-from-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★) KEYSTONE
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Ye are not my people... Ye are the sons of the living Elohim (God)* (Hosea 1:10) — the Lo-Ammi reversal; the house of Joseph saved *as though I had not cast them off* (Zechariah 10:6).'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-i-will-save-the-house-of-judah-and-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will say to them which were not my people, Thou art my people* (Hosea 2:23) — the mercy-reversal of *I have mercy upon them* (Zechariah 10:6); the cast-off house re-claimed.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-i-will-save-the-house-of-judah-and-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the stick of Joseph... even with the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19) — Judah and Joseph saved together (Zechariah 10:6) is the two sticks made one.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-i-will-save-the-house-of-judah-and-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — both houses (Zechariah 10:6) reunited as one people under one King.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-i-will-save-the-house-of-judah-and-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★★ *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the anti-replacement guard on *as though I had not cast them off* (Zechariah 10:6); both houses restored, never replaced.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-i-will-save-the-house-of-judah-and-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Those are the ten tribes, which were carried away prisoners* (2 Esdras 13:40) — the restored witness names the lost house of Joseph (Zechariah 10:6) Yahuah promises to save.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-i-will-save-the-house-of-judah-and-of-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people... from Assyria, and from Egypt* (Isaiah 11:11) — the regathering *out of Egypt... out of Assyria* (Zechariah 10:10) is Isaiah''s second exodus.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-gather-them-out-of-egypt-and-assyria'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah)* (Isaiah 11:12) — both houses gathered home (Zechariah 10:10), the outcasts and the dispersed alike.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-gather-them-out-of-egypt-and-assyria'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5) — the restored witness echoes *I will hiss for them, and gather them; for I have redeemed them* (Zechariah 10:8).'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-gather-them-out-of-egypt-and-assyria'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*afterward they shall return from all places of their captivity, and build up Jerusalem gloriously* (Tobit 14:5) — the return *out of Egypt... out of Assyria* (Zechariah 10:10), the redeemed brought again into the land.'
  FROM cross_reference_threads t
  JOIN _s338_zec10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s338_zec10_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-10-gather-them-out-of-egypt-and-assyria'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_11.sql (Zechariah 11) -----
-- Chapter: Zechariah 11 — ★ THE THIRTY PIECES OF SILVER, the rejected good Shepherd, the worthless
-- shepherd. The flock of slaughter (11:1-6); the two staves Beauty and Bands, three shepherds cut
-- off (11:7-9); Beauty broken = the covenant with the people broken (11:10-11); ★★★ the price of
-- the rejected Shepherd: *So they weighed for my price thirty pieces of silver. And Yahuah (LORD)
-- said unto me, Cast it unto the potter: a goodly price that I was prised at of them. And I took the
-- thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD)* (11:12-13) —
-- the Formed Son valued at a slave's price (Exodus 21:32), fulfilled to the letter in the betrayal
-- of Yahusha (Matthew 26:15; 27:3-10, the money cast down, returned, the potter's field); Bands
-- broken = the brotherhood between Yahudah and Yashar'el sundered (11:14 — the two-house division
-- this very book reverses, contra Ezekiel 37); ★★ the idol shepherd raised up who devours the flock
-- (11:15-17) vs. the good Shepherd who lays down his life (John 10:11-13; Ezekiel 34).
-- Tag: zec11   Temp view: _s338_zec11_lookup
-- Sort band: base 45950, step 3 -> threads at 45950, 45953, 45956, 45959, 45962 (5 threads)
-- Source of EVERY row: 'canon','zechariah',11,v
--
-- Zechariah 11 coverage:
--   v.1-3 (Open thy doors, O Lebanon... the voice of the howling of the shepherds; for their glory
--          is spoiled)
--        NT:     none warranted (the howling-shepherds proem feeds the flock-of-slaughter lament;
--                woven into THREAD 3 prose, no forced single NT verse)
--        Extras: none warranted
--        Tanakh: held in prose (preface to the shepherd-lawsuit of v.4-6 / Ezekiel 34, THREAD 3)
--   v.4-6 (Feed the flock of the slaughter; Whose possessors slay them... their own shepherds pity
--          them not)
--        NT:     none warranted distinct (the shepherd-failure is fulfilled forward in the
--                hireling/idol shepherd of THREAD 2; held there)
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 34:2-4 (Woe be to the shepherds of Yashar'el (Israel) that do feed
--                themselves!... Ye eat the fat... but ye feed not the flock) — THREAD 3
--   v.7-9 (two staves Beauty and Bands; Three shepherds also I cut off in one month)
--        NT:     none warranted distinct (the two staves anchor THREADS 1, 5; held there)
--        Extras: none warranted
--        Tanakh: held in prose (the staves frame the breaking of covenant v.10 and brotherhood v.14)
--   v.10-11 (I took my staff, even Beauty, and cut it asunder, that I might break my covenant)
--        NT:     none warranted distinct (the broken Beauty-staff = the rejected-Shepherd act, woven
--                into THREAD 1's covenant frame)
--        Extras: none warranted
--        Tanakh: held in prose (the covenant-breaking is the dark side of Ezekiel 34's restoration)
--   ★★★ v.12-13 (So they weighed for my price thirty pieces of silver. And Yahuah said... Cast it
--          unto the potter: a goodly price that I was prised at of them... and cast them to the
--          potter in the house of Yahuah)
--        NT:     ★★★ Matthew 26:15 (they covenanted with him for thirty pieces of silver),
--                ★★★ Matthew 27:3-5 (brought again the thirty pieces... cast down the pieces of
--                silver in the temple), ★★★ Matthew 27:9-10 (they took the thirty pieces of
--                silver... and gave them for the potter's field, as Yahuah appointed) — THREAD 1
--        Extras: none warranted (no clean betrayal/silver witness in the restored library)
--        Tanakh: ★★ Exodus 21:32 (he shall give... thirty shekels of silver — the slave-price) +
--                Jeremiah 18:6 (the clay in the potter's hand) — THREAD 1 (Exodus), THREAD 4 (Jer)
--   ★ v.14 (cut asunder mine other staff, even Bands, that I might break the brotherhood between
--          Yahudah and Yashar'el)
--        NT:     none warranted (the regathering is forward but carried in the Ezekiel contrast)
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 37:19, 37:22 (make them one stick... they shall be no more two nations)
--                — THREAD 5 (what is broken here is made one there)
--   ★★ v.15-17 (the foolish/idol shepherd raised up who devours the flock; Woe to the idol shepherd
--          that leaveth the flock!)
--        NT:     ★★ John 10:11-13 (I am the good shepherd... but he that is an hireling... leaveth
--                the sheep, and fleeth) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 34:2-4 (the shepherds who feed themselves, not the flock) — THREAD 2/3
--                + ★ Ezekiel 34:23 (one shepherd... my servant David) as the good-Shepherd contrast
--                — THREAD 2
--
-- Threads (slug — target libraries):
--   1. zechariah-11-thirty-pieces-of-silver-cast-to-the-potter — NT (Matthew 26, Matthew 27) +
--      Tanakh (Exodus 21) [free] (★★★ the price of the rejected Shepherd, a slave's price, the
--      betrayal money cast to the potter — fulfilled to the letter in Yahusha)
--   2. zechariah-11-the-idol-shepherd-and-the-good-shepherd — NT (John 10) + Tanakh (Ezekiel 34)
--      [free] (★★ the worthless shepherd who devours vs. the good Shepherd who lays down his life)
--   3. zechariah-11-feed-the-flock-of-the-slaughter — Tanakh (Ezekiel 34) [free]
--      (★ the shepherds who pity not, who feed themselves — the covenant-lawsuit against false shepherds)
--   4. zechariah-11-cast-it-unto-the-potter-the-clay-in-his-hand — Tanakh (Jeremiah 18) [free]
--      (the potter-clay image: the rejected price thrown to the potter in the house of Yahuah)
--   5. zechariah-11-the-brotherhood-broken-and-made-one — Tanakh (Ezekiel 37) [free]
--      (★★ Bands cut: Yahudah and Yashar'el sundered here — the two sticks made one there)
--
-- Framing notes:
--   ★★★ THE THIRTY PIECES OF SILVER (THREAD 1): *And I said unto them, If ye think good, give me my
--      price; and if not, forbear. So they weighed for my price thirty pieces of silver* (11:12).
--      Thirty pieces of silver is the Torah's compensation for a gored slave: *he shall give unto
--      their master thirty shekels of silver* (Exodus 21:32) — the Shepherd of Yashar'el priced at
--      a slave's worth. *And Yahuah (LORD) said unto me, Cast it unto the potter: a goodly price
--      that I was prised at of them. And I took the thirty pieces of silver, and cast them to the
--      potter in the house of Yahuah (LORD)* (11:13). The gospel records the fulfillment to the
--      letter: *they covenanted with him for thirty pieces of silver* (Matthew 26:15); the betrayer
--      *brought again the thirty pieces of silver... And he cast down the pieces of silver in the
--      temple* (Matthew 27:3-5); the chief priests *bought with them the potter's field* (27:7), so
--      that *Then was fulfilled... And they took the thirty pieces of silver, the price of him that
--      was valued, whom they of the children of Yashar'el (Israel) did value; And gave them for the
--      potter's field, as Yahuah (Lord) appointed me* (27:9-10). The rejected Shepherd valued by the
--      flock at a slave's price is the Formed Son. (Matthew 27:9 attributes the quotation to "Jeremy"
--      — the wording is Zechariah's, woven with Jeremiah's potter; both potter-threads, 1 and 4,
--      stand. No clean restored-library betrayal/silver witness, so extras = none warranted.)
--   ★★ THE IDOL SHEPHERD vs THE GOOD SHEPHERD (THREAD 2): *Woe to the idol shepherd that leaveth
--      the flock! the sword shall be upon his arm, and upon his right eye* (11:17). The worthless
--      shepherd *shall eat the flesh of the fat, and tear their claws in pieces* (11:16). Yahusha
--      sets himself against this figure: *I am the good shepherd: the good shepherd giveth his life
--      for the sheep. But he that is an hireling... seeth the wolf coming, and leaveth the sheep, and
--      fleeth* (John 10:11-12). The good Shepherd who lays down his life is the rejected Shepherd of
--      11:12-13 — the Formed Son — over against the idol shepherd who devours. Ezekiel names the same
--      contrast: the shepherds who *feed themselves* (Ezekiel 34:2) over against *one shepherd... my
--      servant David* (Ezekiel 34:23).
--   ★ FEED THE FLOCK OF THE SLAUGHTER (THREAD 3): *Feed the flock of the slaughter; Whose possessors
--      slay them, and hold themselves not guilty... and their own shepherds pity them not* (11:4-5).
--      This is Ezekiel's lawsuit against the shepherds of Yashar'el: *Woe be to the shepherds of
--      Yashar'el (Israel) that do feed themselves! should not the shepherds feed the flocks? Ye eat
--      the fat... but ye feed not the flock* (Ezekiel 34:2-3). Covenant-lawsuit against faithless
--      shepherds — the sheep are victims, the system the target.
--   THE POTTER (THREAD 4): *Cast it unto the potter* (11:13). Jeremiah's potter-sign frames it: *O
--      house of Yashar'el (Israel), cannot I do with you as this potter?... as the clay is in the
--      potter's hand, so are ye in mine hand* (Jeremiah 18:6). The price thrown to the potter in the
--      house of Yahuah is bound to the potter-house where Yahuah shapes his people.
--   ★★ THE BROTHERHOOD BROKEN AND MADE ONE (THREAD 5): *Then I cut asunder mine other staff, even
--      Bands, that I might break the brotherhood between Yahudah (Judah) and Yashar'el (Israel)*
--      (11:14). This is the two-house sundering — the very division the prophets promise to reverse:
--      *Behold, I will take the stick of Joseph... and... the stick of Yahudah (Judah), and make
--      them one stick* (Ezekiel 37:19); *they shall be no more two nations* (Ezekiel 37:22). What
--      Bands breaks here, the two sticks make one there.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the howling-shepherds proem — preface to the flock-of-
--      slaughter lament, woven into THREAD 3), v.7-9 (the two staves / three shepherds cut off —
--      frame THREADS 1 and 5, held in prose), v.10-11 (Beauty cut, the covenant broken — the dark
--      side of Ezekiel 34's restoration, woven into THREAD 1's covenant frame). All recorded, none
--      silently skipped.

CREATE TEMP VIEW _s338_zec11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): the thirty pieces of silver, cast to the potter
    ('canon','zechariah',11,12,'canon','matthew',26,15,'free',
      E'*And said unto them, What will ye give me, and I will deliver him unto you? And they covenanted with him for thirty pieces of silver* (Matthew 26:15). When the Shepherd asks his price — *So they weighed for my price thirty pieces of silver* (Zechariah 11:12) — the flock answers with the betrayal sum: *they covenanted with him for thirty pieces of silver*. The exact price prophesied here is the exact price weighed out for the Formed Son.'),
    ('canon','zechariah',11,12,'canon','exodus',21,32,'free',
      E'*If the ox shall push a manservant or a maidservant; he shall give unto their master thirty shekels of silver, and the ox shall be stoned* (Exodus 21:32). The Torah fixes thirty pieces of silver as the compensation for a gored slave. *So they weighed for my price thirty pieces of silver* (Zechariah 11:12) — the Shepherd of Yashar''el (Israel) is valued at a slave''s price, the deliberate insult the prophecy records.'),
    ('canon','zechariah',11,13,'canon','matthew',27,3,'free',
      E'*Then Judas, which had betrayed him, when he saw that he was condemned, repented himself, and brought again the thirty pieces of silver to the chief priests and elders* (Matthew 27:3). *Cast it unto the potter: a goodly price that I was prised at of them. And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD)* (Zechariah 11:13). The betrayer brings the very silver *again* — back into the temple, the house of Yahuah — exactly as the Shepherd''s word foretold.'),
    ('canon','zechariah',11,13,'canon','matthew',27,5,'free',
      E'*And he cast down the pieces of silver in the temple, and departed, and went and hanged himself* (Matthew 27:5). *And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD)* (Zechariah 11:13) — the silver *cast down... in the temple*, the house of Yahuah, then turned to the potter''s field (27:7). The prophesied casting of the price into the house of Yahuah is fulfilled to the letter.'),
    ('canon','zechariah',11,13,'canon','matthew',27,9,'free',
      E'*Then was fulfilled that which was spoken by Jeremy the prophet, saying, And they took the thirty pieces of silver, the price of him that was valued, whom they of the children of Yashar''el (Israel) did value* (Matthew 27:9). The gospel names this very prophecy fulfilled: *a goodly price that I was prised at of them* (Zechariah 11:13) becomes *the price of him that was valued, whom they of the children of Yashar''el (Israel) did value* — the rejected Shepherd is the Formed Son.'),
    ('canon','zechariah',11,13,'canon','matthew',27,10,'free',
      E'*And gave them for the potter''s field, as Yahuah (Lord) appointed me* (Matthew 27:10). *Cast it unto the potter* (Zechariah 11:13) — and the silver is *gave... for the potter''s field, as Yahuah (Lord) appointed*. The command to cast the price to the potter is fulfilled in the field bought with the betrayal money, the burying-place of strangers.'),

    -- THREAD 2 (★★): the idol shepherd and the good Shepherd
    ('canon','zechariah',11,17,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). Over against *the idol shepherd that leaveth the flock* (Zechariah 11:17), Yahusha stands as *the good shepherd* who *giveth his life for the sheep* — the rejected Shepherd of 11:12-13 who lays down his life, the Formed Son set against the worthless one who devours.'),
    ('canon','zechariah',11,17,'canon','john',10,12,'free',
      E'*But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep* (John 10:12). The idol shepherd *that leaveth the flock* (Zechariah 11:17) is the hireling who *leaveth the sheep, and fleeth*. The worthless shepherd abandons the flock to the wolf; the good Shepherd gives his life for it.'),
    ('canon','zechariah',11,16,'canon','ezekiel',34,23,'free',
      E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). Against the worthless shepherd who *shall not visit those that be cut off, neither shall seek the young one... but he shall eat the flesh of the fat* (Zechariah 11:16), Yahuah promises the true one — *one shepherd... my servant David* — the Davidic good Shepherd who really feeds the flock.'),

    -- THREAD 3 (★): feed the flock of the slaughter
    ('canon','zechariah',11,5,'canon','ezekiel',34,2,'free',
      E'*Son of Adam, prophesy against the shepherds of Yashar''el (Israel)... Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2). The possessors who *slay them, and hold themselves not guilty... and their own shepherds pity them not* (Zechariah 11:5) are Ezekiel''s self-feeding shepherds. The covenant-lawsuit is against the faithless shepherds, never the sheep — who are the victims.'),
    ('canon','zechariah',11,5,'canon','ezekiel',34,3,'free',
      E'*Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock* (Ezekiel 34:3). The shepherds who *pity them not* (Zechariah 11:5) match those who *eat the fat... but feed not the flock*. The flock of the slaughter (11:4) suffers under shepherds who feed on it instead of feeding it.'),

    -- THREAD 4: cast it unto the potter — the clay in his hand
    ('canon','zechariah',11,13,'canon','jeremiah',18,6,'free',
      E'*O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel)* (Jeremiah 18:6). When Yahuah says *Cast it unto the potter... and cast them to the potter in the house of Yahuah (LORD)* (Zechariah 11:13), the potter is no random craftsman: he is Jeremiah''s figure of Yahuah shaping his people — *as the clay is in the potter''s hand, so are ye in mine hand*.'),

    -- THREAD 5 (★★): the brotherhood broken and made one
    ('canon','zechariah',11,14,'canon','ezekiel',37,19,'free',
      E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The breaking of Bands *that I might break the brotherhood between Yahudah (Judah) and Yashar''el (Israel)* (Zechariah 11:14) is the very two-house sundering that the two sticks reverse: what is cut asunder here is *made... one stick* there.'),
    ('canon','zechariah',11,14,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Bands breaks *the brotherhood between Yahudah (Judah) and Yashar''el (Israel)* (Zechariah 11:14) — the two-house division. The promise stands over it: *they shall be no more two nations*. The whole book of Zechariah drives toward that reunion.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-11-thirty-pieces-of-silver-cast-to-the-potter',
       E'Thirty pieces of silver, cast to the potter — the price of the rejected Shepherd',
       E'The Shepherd asks the flock to set his worth, and they answer with contempt: *And I said unto them, If ye think good, give me my price; and if not, forbear. So they weighed for my price thirty pieces of silver* (Zechariah 11:12). Thirty pieces of silver is the Torah''s compensation for a gored slave — *he shall give unto their master thirty shekels of silver, and the ox shall be stoned* (Exodus 21:32). The Shepherd of Yashar''el (Israel) is priced at a slave''s worth. Then Yahuah commands what to do with the insulting sum: *And Yahuah (LORD) said unto me, Cast it unto the potter: a goodly price that I was prised at of them. And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD)* (11:13). The gospel records the fulfillment to the letter. The betrayer goes to the chief priests: *they covenanted with him for thirty pieces of silver* (Matthew 26:15). Stricken with what he has done, *Then Judas, which had betrayed him, when he saw that he was condemned, repented himself, and brought again the thirty pieces of silver to the chief priests and elders* (Matthew 27:3), and *he cast down the pieces of silver in the temple, and departed* (27:5) — cast down in the house of Yahuah, exactly as foretold. With it the priests *bought... the potter''s field* (27:7), so that *Then was fulfilled that which was spoken by Jeremy the prophet, saying, And they took the thirty pieces of silver, the price of him that was valued, whom they of the children of Yashar''el (Israel) did value; And gave them for the potter''s field, as Yahuah (Lord) appointed me* (Matthew 27:9-10). The rejected Shepherd valued by his own flock at a slave''s price is the Formed Son — the One drawn from the Formless Father, who appeared and led Yashar''el and at last took flesh. (The gospel names the quotation by "Jeremy" — the wording is Zechariah''s, woven with Jeremiah''s potter; both stand.)',
       sv.verse_id, ev.verse_id, 'free', 45950
  FROM _s338_zec11_lookup sv, _s338_zec11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-11-the-idol-shepherd-and-the-good-shepherd',
       E'The idol shepherd that leaveth the flock — and the good Shepherd who lays down his life',
       E'After the good Shepherd is rejected, Yahuah raises a counterfeit: *Take unto thee yet the instruments of a foolish shepherd. For, lo, I will raise up a shepherd in the land, which shall not visit those that be cut off, neither shall seek the young one, nor heal that that is broken, nor feed that that standeth still: but he shall eat the flesh of the fat, and tear their claws in pieces* (Zechariah 11:15-16). The woe falls on him: *Woe to the idol shepherd that leaveth the flock! the sword shall be upon his arm, and upon his right eye* (11:17). Yahusha sets himself against exactly this figure: *I am the good shepherd: the good shepherd giveth his life for the sheep. But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep* (John 10:11-12). The idol shepherd *leaveth the flock*; the hireling *leaveth the sheep, and fleeth*; the good Shepherd does the opposite — he *giveth his life for the sheep*. The rejected Shepherd valued at thirty pieces (11:12-13) is that good Shepherd, the Formed Son. And the true one is the promised Davidic shepherd: *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23) — the One who really feeds the flock, against the worthless one who devours it.',
       sv.verse_id, ev.verse_id, 'free', 45953
  FROM _s338_zec11_lookup sv, _s338_zec11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-11-feed-the-flock-of-the-slaughter',
       E'Feed the flock of the slaughter — the shepherds who pity not',
       E'Yahuah sends his prophet to a doomed flock under cruel keepers: *Thus saith Yahuah Elohai (the LORD my God); Feed the flock of the slaughter; Whose possessors slay them, and hold themselves not guilty: and they that sell them say, Blessed be Yahuah (LORD); for I am rich: and their own shepherds pity them not* (Zechariah 11:4-5). This is Ezekiel''s covenant-lawsuit against the shepherds of Yashar''el word for word: *Son of Adam, prophesy against the shepherds of Yashar''el (Israel)... Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks? Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock* (Ezekiel 34:2-3). The shepherds devour the sheep instead of feeding them; the sheep are slaughtered while their keepers grow rich and feel no guilt. Read it as the prophets always frame such lawsuits: the system of faithless shepherds is the target, never the flock — the sheep are the victims, the lost ones Yahuah will himself come to seek and save (Ezekiel 34:11-16).',
       sv.verse_id, ev.verse_id, 'free', 45956
  FROM _s338_zec11_lookup sv, _s338_zec11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=11 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-11-cast-it-unto-the-potter-the-clay-in-his-hand',
       E'Cast it unto the potter — the clay in the potter''s hand',
       E'When Yahuah disposes of the insulting price, he sends it to a potter: *And Yahuah (LORD) said unto me, Cast it unto the potter: a goodly price that I was prised at of them. And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD)* (Zechariah 11:13). The potter is no incidental figure. Jeremiah was sent to the potter''s house to learn what Yahuah does with his people: *Then the word of Yahuah (LORD) came to me, saying, O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel)* (Jeremiah 18:6). The silver cast to the potter in the house of Yahuah is bound to the potter-house where Yahuah marrs and remakes the vessel as seems good to him — and in the gospel that potter''s ground becomes the field bought with the betrayal money (Matthew 27:7-10).',
       sv.verse_id, ev.verse_id, 'free', 45959
  FROM _s338_zec11_lookup sv, _s338_zec11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-11-the-brotherhood-broken-and-made-one',
       E'Bands cut asunder — the brotherhood broken here, the two sticks made one there',
       E'The second staff names the deepest wound: *Then I cut asunder mine other staff, even Bands, that I might break the brotherhood between Yahudah (Judah) and Yashar''el (Israel)* (Zechariah 11:14). This is the two-house sundering — the southern house of Yahudah and the northern house of Yashar''el / Ephraim / Yosef divided, the brotherhood broken. But the breaking is not the last word; it is the very division the prophets promise to heal. Ezekiel takes two sticks and joins them: *Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19), *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). What Bands cuts asunder here, the two sticks make one there — and the whole book of Zechariah drives toward that reunion of the two houses under one Shepherd-King.',
       sv.verse_id, ev.verse_id, 'free', 45962
  FROM _s338_zec11_lookup sv, _s338_zec11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=11 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *they covenanted with him for thirty pieces of silver* (Matthew 26:15) — the exact price *they weighed for my price* (Zechariah 11:12), the betrayal sum for the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-thirty-pieces-of-silver-cast-to-the-potter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *he shall give unto their master thirty shekels of silver* (Exodus 21:32) — the Torah''s slave-price; the Shepherd of Yashar''el valued at a slave''s worth (Zechariah 11:12).'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-thirty-pieces-of-silver-cast-to-the-potter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *brought again the thirty pieces of silver to the chief priests* (Matthew 27:3) — the silver brought back, exactly as *Cast it unto the potter... in the house of Yahuah* foretold (Zechariah 11:13).'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-thirty-pieces-of-silver-cast-to-the-potter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★★ *cast down the pieces of silver in the temple* (Matthew 27:5) — the silver *cast... to the potter in the house of Yahuah* (Zechariah 11:13), cast down in the temple itself.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-thirty-pieces-of-silver-cast-to-the-potter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★★ *the price of him that was valued, whom they of the children of Yashar''el (Israel) did value* (Matthew 27:9) — the gospel names this prophecy fulfilled: *a goodly price that I was prised at of them* (Zechariah 11:13).'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-thirty-pieces-of-silver-cast-to-the-potter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★★ *gave them for the potter''s field, as Yahuah (Lord) appointed me* (Matthew 27:10) — *Cast it unto the potter* (Zechariah 11:13) fulfilled in the potter''s field bought with the betrayal money.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-thirty-pieces-of-silver-cast-to-the-potter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — against *the idol shepherd that leaveth the flock* (Zechariah 11:17), the Formed Son lays down his life.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=17
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-the-idol-shepherd-and-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *he that is an hireling... leaveth the sheep, and fleeth* (John 10:12) — the idol shepherd *that leaveth the flock* (Zechariah 11:17) is the hireling who abandons the sheep to the wolf.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=17
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-the-idol-shepherd-and-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *one shepherd... my servant David; he shall feed them* (Ezekiel 34:23) — the true Shepherd against the worthless one who *shall not... feed that that standeth still... but eat the flesh of the fat* (Zechariah 11:16).'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=16
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-the-idol-shepherd-and-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves!* (Ezekiel 34:2) — the possessors whose *own shepherds pity them not* (Zechariah 11:5); the lawsuit is against the shepherds, not the flock.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-feed-the-flock-of-the-slaughter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Ye eat the fat... but ye feed not the flock* (Ezekiel 34:3) — the shepherds who *pity them not* (Zechariah 11:5) feed on the flock of the slaughter instead of feeding it.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-feed-the-flock-of-the-slaughter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel)* (Jeremiah 18:6) — the potter Yahuah sends the price to (*Cast it unto the potter*, Zechariah 11:13) is his figure of shaping his people.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=18 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-cast-it-unto-the-potter-the-clay-in-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will take the stick of Joseph... and... the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19) — Bands breaks *the brotherhood between Yahudah and Yashar''el* (Zechariah 11:14); the two sticks make it one.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=14
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-the-brotherhood-broken-and-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the promise over the broken brotherhood of Zechariah 11:14; the two houses made one nation under one King.'
  FROM cross_reference_threads t
  JOIN _s338_zec11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=11 AND sv.verse_number=14
  JOIN _s338_zec11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-11-the-brotherhood-broken-and-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_12.sql (Zechariah 12) -----
-- Chapter: Zechariah 12 — ★★★ THEY SHALL LOOK UPON ME WHOM THEY HAVE PIERCED. The burden of Yahuah
-- for Yashar'el (Israel) opens with the Creator who *formeth the spirit of man within him* (12:1 —
-- Genesis 2:7, Isaiah 42:5, Numbers 16:22). Jerusalem is made *a cup of trembling* and *a burdensome
-- stone for all people* (12:2-3) — the end-day siege of the nations gathered against her (Zechariah
-- 14:2-3 / Revelation 16:14 / 19:19), whom Yahuah comes to destroy (12:9). Then the keystone of the
-- whole book: *And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the
-- spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they
-- shall mourn for him, as one mourneth for his only son* (12:10). John quotes it of the cross — *They
-- shall look on him whom they pierced* (John 19:37); Revelation sees every eye behold him — *every
-- eye shall see him, and they also which pierced him* (Revelation 1:7). Mark the staggering grammar:
-- they look upon ME (Yahuah speaking) and mourn for HIM — Yahuah pierced in the Formed Son, the
-- visible One who is Yahuah and HAS a Father (the Formed and the Formless; NOT co-equal trinitarian
-- persons, NOT a modalist collapse). The spirit of grace POURED is the new heart (Joel 2:28-29,
-- Ezekiel 36:26-27, Jubilees 1:23); the only-son/firstborn mourning (Amos 8:10, Jeremiah 6:26) is the
-- national turning of the two-house people — *and so all Yashar'el (Israel) shall be saved* (Romans
-- 11:26), every family apart in repentance (12:11-14).
-- Tag: zec12   Temp view: _s338_zec12_lookup
-- Sort band: base 45975, step 3 -> threads at 45975, 45978, 45981, 45984, 45987 (5 threads)
-- Source of EVERY row: 'canon','zechariah',12,v
--
-- Zechariah 12 coverage:
--   ★ v.1 (which stretcheth forth the heavens, and layeth the foundation of the earth, and formeth
--          the spirit of man within him)
--        NT:     none warranted distinct (the Creator-forms-spirit weave is Tanakh-rooted; held)
--        Extras: none warranted (clean Tanakh witnesses carry it)
--        Tanakh: ★ Genesis 2:7 (formed man... breathed into his nostrils the breath of life),
--                ★ Isaiah 42:5 (he that giveth breath unto the people... spirit to them that walk),
--                Numbers 16:22 (the Elohim of the spirits of all flesh) — THREAD 1
--   ★★ v.2-3 (Jerusalem a cup of trembling... a burdensome stone for all people... all the people of
--          the earth be gathered together against it) + v.9 (destroy all the nations that come against)
--        NT:     ★★ Revelation 16:14 (gather them to the battle of that great day), ★★ Revelation
--                19:19 (the kings of the earth... gathered together to make war against him) — THREAD 2
--        Extras: none warranted distinct (the eschatological gathering is carried canon-side)
--        Tanakh: ★★ Zechariah 14:2-3 (I will gather all nations against Jerusalem... then shall
--                Yahuah go forth, and fight against those nations) — THREAD 2
--   v.4-9 (Yahuah smites the horses, the feeble as David, the house of David as Elohim, as the angel
--          of Yahuah before them; Yahuah saves the tents of Yahudah; destroys the nations)
--        NT:     none warranted distinct (the defence-of-Jerusalem block feeds THREAD 2's prose; v.9
--                bound to THREAD 2 as anchor of the destroy-the-nations word)
--        Extras: none warranted
--        Tanakh: woven in THREAD 2 prose (the day of battle); no separate forced add
--   ★★★ v.10 (I will pour... the spirit of grace and of supplications: and they shall look upon me
--          whom they have pierced, and they shall mourn for him, as one mourneth for his only son)
--        NT:     ★★★ John 19:37 (They shall look on him whom they pierced), ★★★ Revelation 1:7
--                (every eye shall see him, and they also which pierced him) — THREAD 3 (the keystone);
--                also Romans 11:26 (all Yashar'el shall be saved) — THREAD 5 (the mourning→turning)
--        Extras: ★ 1 Enoch 62:9 (this Son of Adam... shall raise up the kings and the mighty) — THREAD 3
--                (the Son of Adam beheld by the nations in the day); ★ Jubilees 1:23 (I shall create in
--                them a holy spirit... cleanse them) — THREAD 4 (the spirit poured / new heart)
--        Tanakh: ★★ Joel 2:28-29 (I will pour out my spirit), ★★ Ezekiel 36:26-27 (a new heart... a
--                new spirit... my spirit within you) — THREAD 4 (the spirit of grace poured); ★ Amos
--                8:10 (the mourning of an only son... a bitter day), ★ Jeremiah 6:26 (mourning, as for
--                an only son, most bitter lamentation) — THREAD 5 (the only-son/firstborn mourning)
--   ★ v.11-14 (a great mourning in Jerusalem... the land shall mourn, every family apart — David,
--          Nathan, Levi, Shimei)
--        NT:     ★ Romans 11:26 (so all Yashar'el shall be saved... turn away ungodliness from Jacob)
--                — THREAD 5 (the national turning the mourning precedes)
--        Extras: none warranted distinct
--        Tanakh: Amos 8:10 / Jeremiah 6:26 (THREAD 5, with v.10's only-son grief)
--
-- Threads (slug — target libraries):
--   1. zechariah-12-which-formeth-the-spirit-of-man-within-him — Tanakh (Genesis 2, Isaiah 42, Numbers 16) [free]
--      (★ the Creator who forms the spirit within — the same hand that pours the spirit of grace in v.10)
--   2. zechariah-12-jerusalem-a-cup-of-trembling-and-a-burdensome-stone — NT (Revelation 16, 19) + Tanakh (Zechariah 14) [free]
--      (★★ the end-day siege; all nations gathered against Jerusalem, whom Yahuah comes to destroy)
--   3. zechariah-12-they-shall-look-upon-me-whom-they-have-pierced — NT (John 19, Revelation 1) + Extras (1 Enoch 62) [extras]
--      (★★★ THE PIERCED ONE — the keystone; Yahuah pierced in the Formed Son, beheld in the day)
--   4. zechariah-12-the-spirit-of-grace-and-of-supplications-poured — Tanakh (Joel 2, Ezekiel 36) + Extras (Jubilees 1) [extras]
--      (★★ the spirit of grace POURED = the new heart, the spirit within, that brings the looking and mourning)
--   5. zechariah-12-they-shall-mourn-for-him-as-for-an-only-son — Tanakh (Amos 8, Jeremiah 6) + NT (Romans 11) [free]
--      (★ the only-son/firstborn mourning = the national turning of the two-house people, all Yashar'el saved)
--
-- Framing notes:
--   ★ THE CREATOR WHO FORMS THE SPIRIT (THREAD 1): *Yahuah... which stretcheth forth the heavens, and
--      layeth the foundation of the earth, and formeth the spirit of man within him* (12:1). The God who
--      pronounces the burden is the Creator who formed the spirit He will later POUR upon His people
--      (12:10) — *Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into
--      his nostrils the breath of life* (Genesis 2:7); *he that giveth breath unto the people upon it,
--      and spirit to them that walk therein* (Isaiah 42:5); *the Elohim (God) of the spirits of all
--      flesh* (Numbers 16:22). The hand that forms the spirit within is the hand that pours the spirit
--      of grace; creation and new-creation are one Maker.
--   ★★ THE CUP AND THE BURDENSOME STONE (THREAD 2): *I will make Jerusalem a cup of trembling unto all
--      the people... a burdensome stone for all people: all that burden themselves with it shall be cut
--      in pieces, though all the people of the earth be gathered together against it* (12:2-3); *I will
--      seek to destroy all the nations that come against Jerusalem* (12:9). This is the end-day siege
--      Zechariah names again: *I will gather all nations against Jerusalem to battle... Then shall Yahuah
--      (LORD) go forth, and fight against those nations, as when he fought in the day of battle*
--      (Zechariah 14:2-3) — and Revelation sees the same gathering: *to gather them to the battle of
--      that great day of El Shaddai (God Almighty)* (Revelation 16:14); *the kings of the earth, and
--      their armies, gathered together to make war against him that sat on the horse* (Revelation 19:19).
--   ★★★ THE PIERCED ONE (THREAD 3): *they shall look upon me whom they have pierced, and they shall
--      mourn for him* (12:10). John quotes it of the cross: *They shall look on him whom they pierced*
--      (John 19:37); Revelation of the return: *every eye shall see him, and they also which pierced
--      him: and all kindreds of the earth shall wail because of him* (Revelation 1:7). The grammar is
--      the proof: Yahuah speaks — *they shall look upon ME* — yet *mourn for HIM*. Yahuah is pierced in
--      the Formed Son, the visible One drawn from the Formless Father, who is Yahuah and HAS a Father —
--      NOT co-equal trinitarian persons, NOT a modalist collapse. The restored witness frames the day:
--      *this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats*
--      (1 Enoch 62:9) — the Son of Adam beheld in the day of His appearing.
--   ★★ THE SPIRIT OF GRACE POURED (THREAD 4): *I will pour upon the house of David... the spirit of
--      grace and of supplications* (12:10). The pouring is the new-covenant heart: *I will pour out my
--      spirit upon all flesh* (Joel 2:28); *A new heart also will I give you, and a new spirit will I
--      put within you... And I will put my spirit within you, and cause you to walk in my statutes*
--      (Ezekiel 36:26-27) — the Spirit and the Torah inseparable, the new heart UNTO the keeping, never
--      instead of it. The restored witness says the same: *I shall create in them a holy spirit, and I
--      shall cleanse them* (Jubilees 1:23). The spirit of grace poured is what opens the eyes to look
--      upon the pierced One and break in mourning.
--   ★ THE ONLY-SON MOURNING (THREAD 5): *they shall mourn for him, as one mourneth for his only son,
--      and shall be in bitterness for him, as one that is in bitterness for his firstborn* (12:10);
--      *a great mourning in Jerusalem... the land shall mourn, every family apart* (12:11-12). The
--      prophets know that grief: *I will make it as the mourning of an only son, and the end thereof as
--      a bitter day* (Amos 8:10); *make thee mourning, as for an only son, most bitter lamentation*
--      (Jeremiah 6:26). This is the national turning of the two-house people — the looking and the
--      mourning that precede the restoration: *And so all Yashar'el (Israel) shall be saved: as it is
--      written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob*
--      (Romans 11:26). Covenant repentance, never a cast-off people (Romans 11:1-2); the lost sheep
--      brought home, every family apart.
--   EXTRAS: 1 Enoch 62:9 (the Son of Adam beheld by the kings/nations in the day — THREAD 3, clean
--      witness) and Jubilees 1:23 (the holy spirit created within, the heart cleansed — THREAD 4, clean
--      witness). No extras forced on the Creator-forms-spirit (THREAD 1), the siege (THREAD 2), or the
--      only-son mourning (THREAD 5) — the canon witnesses carry those fully.
--   VERSES WITH NO SEPARATE ADD: v.4-8 (the smiting of the horses, the feeble as David, the house of
--      David as Elohim/as the angel of Yahuah before them — the defence-of-Jerusalem block woven into
--      THREAD 2's prose; the "as the angel of Yahuah" theophany held in prose, not forced to a single
--      target), v.13-14 (the remaining families mourning apart — bound to THREAD 5 with v.11-12). All
--      recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): which formeth the spirit of man within him — the Creator who forms the spirit
    ('canon','zechariah',12,1,'canon','genesis',2,7,'free',
      E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). The God who speaks the burden is named as the One who *formeth the spirit of man within him* (Zechariah 12:1) — the very hand of Genesis that *formed man... and breathed into his nostrils the breath of life*. The Maker who first formed the spirit within is the Maker who will pour the spirit of grace upon His people (12:10).'),
    ('canon','zechariah',12,1,'canon','isaiah',42,5,'free',
      E'*Thus saith Elohim (God) Yahuah (LORD), he that created the heavens, and stretched them out; he that spread forth the earth, and that which cometh out of it; he that giveth breath unto the people upon it, and spirit to them that walk therein* (Isaiah 42:5). Isaiah''s threefold title matches Zechariah''s word for word: the One *which stretcheth forth the heavens, and layeth the foundation of the earth, and formeth the spirit of man within him* (Zechariah 12:1) is *he that giveth breath unto the people upon it, and spirit to them that walk therein*. The Creator of heaven and earth is the Giver of the spirit within.'),
    ('canon','zechariah',12,1,'canon','numbers',16,22,'free',
      E'*And they fell upon their faces, and said, O Elohim (God), the Elohim (God) of the spirits of all flesh, shall one man sin, and wilt thou be wroth with all the congregation?* (Numbers 16:22). He who *formeth the spirit of man within him* (Zechariah 12:1) is *the Elohim (God) of the spirits of all flesh* — the spirit of every man is His forming and His own. The Creator of the spirit is the Lord of it.'),

    -- THREAD 2 (★★): Jerusalem a cup of trembling and a burdensome stone — the end-day siege
    ('canon','zechariah',12,3,'canon','zechariah',14,2,'free',
      E'*For I will gather all nations against Jerusalem to battle; and the city shall be taken, and the houses rifled, and the women ravished; and half of the city shall go forth into captivity, and the residue of the people shall not be cut off from the city* (Zechariah 14:2). The *burdensome stone for all people* against which *all the people of the earth be gathered together* (Zechariah 12:3) is the same end-day gathering Zechariah names two chapters on: *I will gather all nations against Jerusalem to battle*. The siege of 12 and the siege of 14 are one day.'),
    ('canon','zechariah',12,9,'canon','zechariah',14,3,'free',
      E'*Then shall Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (Zechariah 14:3). The word *I will seek to destroy all the nations that come against Jerusalem* (Zechariah 12:9) is enacted when *Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle*. The Defender of Jerusalem comes Himself against the gathered nations.'),
    ('canon','zechariah',12,3,'canon','revelation',16,14,'free',
      E'*For they are the spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14). The *all the people of the earth... gathered together against it* (Zechariah 12:3) is the gathering Revelation sees: the kings of the whole world drawn *to the battle of that great day of El Shaddai (God Almighty)*. Jerusalem the burdensome stone is the place the nations are massed against in the last day.'),
    ('canon','zechariah',12,9,'canon','revelation',19,19,'free',
      E'*And I saw the beast, and the kings of the earth, and their armies, gathered together to make war against him that sat on the horse, and against his army* (Revelation 19:19). The nations that *come against Jerusalem* whom Yahuah comes *to destroy* (Zechariah 12:9) are the armies Revelation sees *gathered together to make war against him that sat on the horse* — and cut in pieces by Him. The burdensome-stone judgment of 12:3 is the rider''s war of Revelation 19.'),

    -- THREAD 3 (★★★): they shall look upon me whom they have pierced — THE PIERCED ONE (keystone)
    ('canon','zechariah',12,10,'canon','john',19,37,'free',
      E'*And again another scripture saith, They shall look on him whom they pierced* (John 19:37). John quotes Zechariah 12:10 directly at the cross — *they shall look upon me whom they have pierced* — naming the crucified One as the pierced One the prophet foretold. The Yahuah who says *me* is beheld *whom they pierced*: Yahuah pierced in the Formed Son, the visible One who is Yahuah and HAS a Father.'),
    ('canon','zechariah',12,10,'canon','revelation',1,7,'free',
      E'*Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen* (Revelation 1:7). The looking-and-mourning of *they shall look upon me whom they have pierced, and they shall mourn for him* (Zechariah 12:10) is fulfilled in the day He returns: *every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him*. The pierced One returns, and the families mourn — the very grief Zechariah saw.'),
    ('canon','zechariah',12,10,'enoch','1-enoch',62,9,'extras',
      E'*And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners* (1 Enoch 62:9). The pierced One *they shall look upon* (Zechariah 12:10) is the Son of Adam the restored witness sees revealed in the day — *this Son of Adam whom thou hast seen* — before whom the kings and the mighty are abased. The day of looking upon the pierced One is the day of the Son of Adam''s appearing.'),

    -- THREAD 4 (★★): the spirit of grace and of supplications poured — the new heart, the spirit within
    ('canon','zechariah',12,10,'canon','joel',2,28,'free',
      E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions* (Joel 2:28). The promise *I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications* (Zechariah 12:10) is the pouring Joel foresaw: *I will pour out my spirit upon all flesh*. The same outpoured Spirit opens eyes to look upon the pierced One.'),
    ('canon','zechariah',12,10,'canon','ezekiel',36,26,'free',
      E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). The *spirit of grace and of supplications* poured upon Jerusalem (Zechariah 12:10) is the new-covenant heart of Ezekiel — *a new heart... a new spirit... within you*, the stony heart taken away. The grace poured is the heart made able to mourn and to turn.'),
    ('canon','zechariah',12,10,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The spirit poured upon the house of David (Zechariah 12:10) is the Spirit that *cause[s] you to walk in my statutes... and do them* — the Spirit and the Torah inseparable. The spirit of grace is given UNTO the keeping of His judgments, never instead of them.'),
    ('canon','zechariah',12,10,'jubilees','jubilees',1,23,'extras',
      E'*And after this they will turn to Me in all uprightness and with all (their) heart and with all (their) soul, and I shall circumcise the foreskin of their heart and the foreskin of the heart of their seed, and I shall create in them a holy spirit, and I shall cleanse them so that they shall not turn away from Me from that day to eternity* (Jubilees 1:23). The *spirit of grace and of supplications* poured (Zechariah 12:10) is the holy spirit the restored witness promises: *I shall create in them a holy spirit, and I shall cleanse them*, the heart circumcised, the people turned and held forever. The poured Spirit is the cleansing that brings the everlasting turning.'),

    -- THREAD 5 (★): they shall mourn for him as for an only son — the national turning
    ('canon','zechariah',12,10,'canon','amos',8,10,'free',
      E'*And I will turn your feasts into mourning, and all your songs into lamentation; and I will bring up sackcloth upon all loins, and baldness upon every head; and I will make it as the mourning of an only son, and the end thereof as a bitter day* (Amos 8:10). The grief Zechariah foresees — *they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him* (Zechariah 12:10) — is Amos''s deepest sorrow: *the mourning of an only son... a bitter day*. The bitterest grief a people can know becomes the grief of the day they behold the pierced One.'),
    ('canon','zechariah',12,10,'canon','jeremiah',6,26,'free',
      E'*O daughter of my people, gird thee with sackcloth, and wallow thyself in ashes: make thee mourning, as for an only son, most bitter lamentation: for the spoiler shall suddenly come upon us* (Jeremiah 6:26). The only-son mourning of Zechariah 12:10 — *as one mourneth for his only son... in bitterness for him, as one that is in bitterness for his firstborn* — is Jeremiah''s charge to the daughter of his people: *make thee mourning, as for an only son, most bitter lamentation*. The same incomparable grief, poured out over the pierced One.'),
    ('canon','zechariah',12,12,'canon','romans',11,26,'free',
      E'*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). The land mourning *every family apart* (Zechariah 12:12) is the national turning Paul names: *so all Yashar''el (Israel) shall be saved... the Deliverer... shall turn away ungodliness from Jacob*. The great mourning is the repentance that precedes the restoration of the two-house people — covenant turning, never a cast-off people (Romans 11:1-2).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-12-which-formeth-the-spirit-of-man-within-him',
       E'Which formeth the spirit of man within him — the Creator who forms the spirit',
       E'The burden opens by naming who speaks it: *The burden of the word of Yahuah (LORD) for Yashar''el (Israel), saith Yahuah (LORD), which stretcheth forth the heavens, and layeth the foundation of the earth, and formeth the spirit of man within him* (Zechariah 12:1). The God who will pour the spirit of grace upon His people (12:10) is first named as the One who FORMED the spirit within — the very hand of Genesis: *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). Isaiah carries the same threefold title: *he that created the heavens, and stretched them out; he that spread forth the earth... he that giveth breath unto the people upon it, and spirit to them that walk therein* (Isaiah 42:5). And the spirit of every man is His own — *O Elohim (God), the Elohim (God) of the spirits of all flesh* (Numbers 16:22). The Maker who first formed the spirit within is the Maker who pours the spirit of grace; creation and new-creation are one hand.',
       sv.verse_id, ev.verse_id, 'free', 45975
  FROM _s338_zec12_lookup sv, _s338_zec12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=12 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-12-jerusalem-a-cup-of-trembling-and-a-burdensome-stone',
       E'Jerusalem a cup of trembling and a burdensome stone — the siege of the end',
       E'In the last day Jerusalem becomes the place all the nations are massed against: *Behold, I will make Jerusalem a cup of trembling unto all the people round about... And in that day will I make Jerusalem a burdensome stone for all people: all that burden themselves with it shall be cut in pieces, though all the people of the earth be gathered together against it* (Zechariah 12:2-3). And Yahuah comes Himself against them: *I will seek to destroy all the nations that come against Jerusalem* (12:9). Zechariah names the same day two chapters on: *I will gather all nations against Jerusalem to battle... Then shall Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (Zechariah 14:2-3). Revelation sees the gathering of the kings of the whole world *to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14), *the kings of the earth, and their armies, gathered together to make war against him that sat on the horse* (Revelation 19:19) — and cut in pieces by the rider. The burdensome stone none can lift; the city Yahuah defends to the end.',
       sv.verse_id, ev.verse_id, 'free', 45978
  FROM _s338_zec12_lookup sv, _s338_zec12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★) — KEYSTONE
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-12-they-shall-look-upon-me-whom-they-have-pierced',
       E'They shall look upon me whom they have pierced — the pierced One they behold',
       E'The keystone of the whole book: *And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son* (Zechariah 12:10). John quotes it at the cross: *And again another scripture saith, They shall look on him whom they pierced* (John 19:37) — the crucified One IS the pierced One the prophet saw. Revelation sees the day He returns: *Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him* (Revelation 1:7). Mark the staggering grammar: Yahuah is speaking — *they shall look upon ME* — yet *they shall mourn for HIM*. Yahuah is the One pierced, in the Formed Son: the visible One drawn from the Formless Father, who appeared and spoke and walked among Yashar''el (Israel), who is Yahuah and HAS a Father. This is NOT co-equal trinitarian persons; it is NOT a modalist collapse — it is the Formed and the Formless, Yahuah pierced in His own expressed Word. The restored witness frames the day of His appearing: *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And break the teeth of the sinners* (1 Enoch 62:9). The pierced One is the Son of Adam, beheld by all in the day.',
       sv.verse_id, ev.verse_id, 'extras', 45981
  FROM _s338_zec12_lookup sv, _s338_zec12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=12 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-12-the-spirit-of-grace-and-of-supplications-poured',
       E'The spirit of grace and of supplications poured — the new heart, the spirit within',
       E'Before they look and mourn, the Spirit is poured: *And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications* (Zechariah 12:10). This is the new-covenant outpouring the prophets foretold: *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28). It is the new heart of Ezekiel: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26), *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the Spirit and the Torah inseparable, the heart made new UNTO the keeping, never instead of it. The restored witness promises the same cleansing: *I shall circumcise the foreskin of their heart... and I shall create in them a holy spirit, and I shall cleanse them so that they shall not turn away from Me from that day to eternity* (Jubilees 1:23). The spirit of grace poured is the heart made able to behold the pierced One and break in true supplication.',
       sv.verse_id, ev.verse_id, 'extras', 45984
  FROM _s338_zec12_lookup sv, _s338_zec12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=12 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-12-they-shall-mourn-for-him-as-for-an-only-son',
       E'They shall mourn for him as for an only son — the national turning, all Yashar''el saved',
       E'The grief Zechariah foresees is the deepest a people can know: *they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn* (Zechariah 12:10); *In that day shall there be a great mourning in Jerusalem... And the land shall mourn, every family apart; the family of the house of David apart... the family of the house of Nathan apart... The family of the house of Levi apart... the family of Shimei apart... All the families that remain, every family apart* (12:11-14). The prophets know that grief: *I will make it as the mourning of an only son, and the end thereof as a bitter day* (Amos 8:10); *make thee mourning, as for an only son, most bitter lamentation* (Jeremiah 6:26). This is the national turning of the two-house people — the looking and the mourning that precede the restoration: *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). Covenant repentance, family by family, never a cast-off people — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the lost sheep brought home.',
       sv.verse_id, ev.verse_id, 'free', 45987
  FROM _s338_zec12_lookup sv, _s338_zec12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=12 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life* (Genesis 2:7) — the hand that *formeth the spirit of man within him* (Zechariah 12:1).'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-which-formeth-the-spirit-of-man-within-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *he that giveth breath unto the people upon it, and spirit to them that walk therein* (Isaiah 42:5) — Isaiah''s threefold Creator-title matches Zechariah 12:1 word for word.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-which-formeth-the-spirit-of-man-within-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the Elohim (God) of the spirits of all flesh* (Numbers 16:22) — He who forms the spirit within (Zechariah 12:1) is Lord of the spirit of every man.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-which-formeth-the-spirit-of-man-within-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will gather all nations against Jerusalem to battle* (Zechariah 14:2) — the same end-day gathering as the *burdensome stone* against which all peoples are massed (Zechariah 12:3).'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-jerusalem-a-cup-of-trembling-and-a-burdensome-stone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Then shall Yahuah (LORD) go forth, and fight against those nations* (Zechariah 14:3) — the *destroy all the nations that come against Jerusalem* of 12:9 enacted by Yahuah Himself.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=9
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-jerusalem-a-cup-of-trembling-and-a-burdensome-stone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *to gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14) — the *all the people of the earth... gathered together* of 12:3 seen massed for the last battle.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-jerusalem-a-cup-of-trembling-and-a-burdensome-stone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the kings of the earth, and their armies, gathered together to make war against him that sat on the horse* (Revelation 19:19) — the nations of 12:9 cut in pieces by the rider.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=9
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-jerusalem-a-cup-of-trembling-and-a-burdensome-stone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★) — KEYSTONE
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *They shall look on him whom they pierced* (John 19:37) — John quotes Zechariah 12:10 at the cross; the crucified One IS the pierced One Yahuah foretold.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-they-shall-look-upon-me-whom-they-have-pierced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him* (Revelation 1:7) — the looking-and-mourning of 12:10 at His return.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-they-shall-look-upon-me-whom-they-have-pierced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats* (1 Enoch 62:9) — the pierced One they look upon is the Son of Adam beheld in the day of His appearing.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-they-shall-look-upon-me-whom-they-have-pierced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will pour out my spirit upon all flesh* (Joel 2:28) — the pouring of the *spirit of grace and of supplications* (Zechariah 12:10) is the outpouring Joel foresaw.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-the-spirit-of-grace-and-of-supplications-poured'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *A new heart also will I give you, and a new spirit will I put within you* (Ezekiel 36:26) — the spirit of grace poured (12:10) is the new-covenant heart, the stony heart taken away.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-the-spirit-of-grace-and-of-supplications-poured'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *And I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — the spirit poured is given UNTO the keeping of Torah, never instead of it.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-the-spirit-of-grace-and-of-supplications-poured'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I shall create in them a holy spirit, and I shall cleanse them* (Jubilees 1:23) — the heart circumcised, the holy spirit created within: the cleansing of the poured spirit of grace.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-the-spirit-of-grace-and-of-supplications-poured'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I will make it as the mourning of an only son, and the end thereof as a bitter day* (Amos 8:10) — the deepest grief a people can know, the grief of the day they behold the pierced One (Zechariah 12:10).'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-they-shall-mourn-for-him-as-for-an-only-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *make thee mourning, as for an only son, most bitter lamentation* (Jeremiah 6:26) — the same incomparable only-son grief of Zechariah 12:10.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-they-shall-mourn-for-him-as-for-an-only-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *And so all Yashar''el (Israel) shall be saved... the Deliverer... shall turn away ungodliness from Jacob* (Romans 11:26) — the great mourning *every family apart* (12:12) is the national turning of the two-house people, never a cast-off people.'
  FROM cross_reference_threads t
  JOIN _s338_zec12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=12 AND sv.verse_number=12
  JOIN _s338_zec12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-12-they-shall-mourn-for-him-as-for-an-only-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_13.sql (Zechariah 13) -----
-- Chapter: Zechariah 13 — ★ THE FOUNTAIN OPENED, SMITE THE SHEPHERD, THE REFINED THIRD.
-- Flowing straight out of 12:10 (*they shall look upon me whom they have pierced*), the prophet
-- declares: *In that day there shall be a fountain opened to the house of David and to the
-- inhabitants of Jerusalem for sin and for uncleanness* (13:1) — the cleansing flow from the
-- pierced One, the clean water of Ezekiel 36:25, the blood and water from his side (John 19:34).
-- The idols and false prophets are purged from the land (13:2-6). Then the keystone: *Awake, O
-- sword, against my shepherd, and against the man that is my fellow, saith Yahuah Tseva'ot (LORD
-- of hosts): smite the shepherd, and the sheep shall be scattered* (13:7) — the Shepherd who is
-- Yahuah's FELLOW (of his own nature, yet HAS a Father) = the Formed Son, quoted by Yahusha the
-- night of his arrest (Matthew 26:31; Mark 14:27). And the remnant is refined: *I will bring the
-- third part through the fire... they shall call on my name... I will say, It is my people: and
-- they shall say, Yahuah (LORD) is my Elohim (God)* (13:8-9) — the covenant-formula restored, the
-- two-house people reclaimed (Hosea 2:23; Malachi 3:3; Romans 11).
-- Tag: zec13   Temp view: _s338_zec13_lookup
-- Sort band: base 46000, step 3 -> threads at 46000, 46003, 46006 (3 threads)
-- Source of EVERY row: 'canon','zechariah',13,v
--
-- Zechariah 13 coverage:
--   ★★ v.1 (In that day there shall be a fountain opened to the house of David and to the
--          inhabitants of Jerusalem for sin and for uncleanness)
--        NT:     ★★ John 19:34 (one of the soldiers with a spear pierced his side, and forthwith
--                came there out blood and water), ★ 1 John 1:7 (the blood of Yahusha HaMashiach
--                his Son cleanseth us from all sin), ★ Hebrews 9:14 (the blood of Messiah... purge
--                your conscience), Revelation 22:1 (a pure river of water of life) — THREAD 1
--        Extras: none warranted (the cleansing-fountain weave is fully carried by Ezekiel + NT)
--        Tanakh: ★★ Ezekiel 36:25 (then will I sprinkle clean water upon you, and ye shall be
--                clean), Ezekiel 47:1 (waters issued out from under the threshold of the house) — THREAD 1
--   v.2-6 (cut off the names of the idols... cause the prophets and the unclean spirit to pass
--          out of the land; v.6 the wounds in thine hands "in the house of my friends")
--        NT:     none forced — v.6 is PRIMARILY the unmasked false prophet, NOT overclaimed as the
--                pierced One; the pierced-friend resonance is noted in prose only, anchored to the
--                purge of false prophecy. No standalone thread (the idol/false-prophet purge sets
--                up the cleansed land of v.1 and is woven into THREAD 1's prose).
--        Extras: none warranted
--        Tanakh: none warranted distinct (held in prose)
--   ★★★ v.7 (Awake, O sword, against my shepherd, and against the man that is my fellow... smite
--          the shepherd, and the sheep shall be scattered)
--        NT:     ★★★ Matthew 26:31 (I will smite the shepherd, and the sheep of the flock shall be
--                scattered abroad), ★★★ Mark 14:27 (I will smite the shepherd, and the sheep shall
--                be scattered) — THREAD 2 (quoted BY NAME by Yahusha the night of his arrest)
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 53:5 (he was wounded for our transgressions... with his stripes we are
--                healed), Isaiah 53:6 (all we like sheep have gone astray... Yahuah hath laid on
--                him the iniquity of us all) — THREAD 2 (the smitten Shepherd = the smitten Servant)
--   ★ v.8-9 (two parts cut off... but the third shall be left; I will bring the third part through
--          the fire, and will refine them as silver is refined... they shall call on my name...
--          It is my people... Yahuah is my Elohim)
--        NT:     ★ 1 Peter 1:7 (the trial of your faith... though it be tried with fire), ★ Romans
--                11:5 (a remnant according to the election of grace) + Romans 11:2 (Elohim hath not
--                cast away his people which he foreknew) GUARD — THREAD 3
--        Extras: ★ Sirach 2:5 / Ecclesiasticus 2:5 (for gold is tried in the fire, and acceptable
--                men in the furnace of adversity) — THREAD 3
--        Tanakh: ★★ Malachi 3:3 (he shall sit as a refiner and purifier of silver), ★★ Hosea 2:23
--                (I will say to them which were not my people, Thou art my people) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. zechariah-13-a-fountain-opened-for-sin-and-uncleanness — NT (John 19, 1 John 1, Hebrews 9,
--      Revelation 22) + Tanakh (Ezekiel 36, Ezekiel 47) [free]
--      (★★ the cleansing fountain from the pierced One; clean water, blood and water, the river of life)
--   2. zechariah-13-smite-the-shepherd-the-man-that-is-my-fellow — NT (Matthew 26, Mark 14) +
--      Tanakh (Isaiah 53) [free]
--      (★★★ CHRISTOLOGY KEYSTONE — the smitten Shepherd who is Yahuah's FELLOW = the Formed Son,
--       quoted by Yahusha the night of his arrest; the smitten Servant of Isaiah 53)
--   3. zechariah-13-the-third-brought-through-the-fire-refined — NT (1 Peter 1, Romans 11) +
--      Tanakh (Malachi 3, Hosea 2) + Extras (Sirach 2) [extras]
--      (★ the refined two-house remnant; the covenant-formula restored "It is my people")
--
-- Framing notes:
--   ★★ THE FOUNTAIN (THREAD 1): *In that day there shall be a fountain opened to the house of David
--      and to the inhabitants of Jerusalem for sin and for uncleanness* (13:1) flows out of the
--      pierced One of 12:10. It is the clean water of the new covenant — *then will I sprinkle clean
--      water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will
--      I cleanse you* (Ezekiel 36:25) — and the river from the temple (Ezekiel 47:1). The NT names
--      the source: blood and water from his side (John 19:34); the blood that *cleanseth us from all
--      sin* (1 John 1:7); the blood that *purge[s] your conscience* (Hebrews 9:14); the *pure river
--      of water of life* (Revelation 22:1). The idol/false-prophet purge of 13:2-6 is the negative
--      side of the same cleansing — the land washed of its uncleanness.
--   ★ v.6 HANDLED CAREFULLY: *What are these wounds in thine hands?... Those with which I was wounded
--      in the house of my friends* (13:6) is PRIMARILY the unmasked false prophet of v.2-5 (the
--      self-inflicted prophet-cult marks he now denies), NOT overclaimed as the pierced Messiah.
--      The pierced-friend resonance is noted but anchored to the false-prophet purge — not threaded.
--   ★★★ THE SMITTEN SHEPHERD (THREAD 2 — CHRISTOLOGY KEYSTONE): *Awake, O sword, against my shepherd,
--      and against the man that is my fellow, saith Yahuah Tseva'ot (LORD of hosts): smite the
--      shepherd, and the sheep shall be scattered* (13:7). The Shepherd is Yahuah's FELLOW — of
--      Yahuah's own nature — YET he is "my shepherd," one who HAS a Father: this is the Formed Son,
--      the expressed Word drawn from the Formless. Yahusha quotes it BY NAME the night of his arrest:
--      *I will smite the shepherd, and the sheep of the flock shall be scattered abroad* (Matthew
--      26:31; Mark 14:27). He is the smitten Servant — *he was wounded for our transgressions... with
--      his stripes we are healed* (Isaiah 53:5); *all we like sheep have gone astray... Yahuah hath
--      laid on him the iniquity of us all* (Isaiah 53:6). NOT co-equal trinitarian persons, NOT a
--      modalist collapse — the FELLOW who is smitten, who has a Father, is Yahusha.
--   ★ THE REFINED THIRD (THREAD 3): *I will bring the third part through the fire, and will refine
--      them as silver is refined... they shall call on my name... It is my people... Yahuah is my
--      Elohim* (13:8-9). The refining of the remnant: *he shall sit as a refiner and purifier of
--      silver* (Malachi 3:3); *the trial of your faith... though it be tried with fire* (1 Peter
--      1:7); *for gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach
--      2:5). The covenant-formula restored — *It is my people... Yahuah is my Elohim* — is the
--      two-house reclaiming of Hosea: *I will say to them which were not my people, Thou art my people*
--      (Hosea 2:23). And the remnant stands, never cast off: *a remnant according to the election of
--      grace* (Romans 11:5); *Elohim hath not cast away his people which he foreknew* (Romans 11:2).
--   VERSES WITH NO SEPARATE ADD: v.2-5 (the idol/false-prophet purge — woven into THREAD 1's prose
--      as the negative cleansing of the land), v.6 (the wounds "in the house of my friends" — the
--      unmasked false prophet, pierced-friend resonance noted but not overclaimed/threaded). All
--      recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): A fountain opened for sin and uncleanness — the cleansing flow from the pierced One
    ('canon','zechariah',13,1,'canon','ezekiel',36,25,'free',
      E'*Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25). The *fountain opened to the house of David and to the inhabitants of Jerusalem for sin and for uncleanness* (Zechariah 13:1) is this very cleansing of the new covenant — clean water sprinkled, *from all your filthiness, and from all your idols* purged. The same chapter that opens the fountain cuts off *the names of the idols out of the land* (13:2); Ezekiel names the washing it accomplishes.'),
    ('canon','zechariah',13,1,'canon','ezekiel',47,1,'free',
      E'*Afterward he brought me again unto the door of the house; and, behold, waters issued out from under the threshold of the house eastward... at the south side of the altar* (Ezekiel 47:1). The *fountain opened* (Zechariah 13:1) is the river from the temple — *waters issued out from under the threshold of the house*, flowing from the altar to heal all it touches (47:9). One cleansing stream: opened in Zechariah, flowing from the sanctuary in Ezekiel.'),
    ('canon','zechariah',13,1,'canon','john',19,34,'free',
      E'*But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water* (John 19:34). The fountain *for sin and for uncleanness* (Zechariah 13:1) flows from the pierced One of the verse before — *they shall look upon me whom they have pierced* (12:10). At the cross the source is opened: *blood and water* from his pierced side, the very fountain Zechariah saw opened for sin and for uncleanness.'),
    ('canon','zechariah',13,1,'canon','1-john',1,7,'free',
      E'*But if we walk in the light, as he is in the light, we have fellowship one with another, and the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin* (1 John 1:7). The *fountain opened... for sin and for uncleanness* (Zechariah 13:1) is the blood that *cleanseth us from all sin* — the flow that washes what no other water could reach. The fountain for SIN is his blood; the fountain for UNCLEANNESS is the clean water; both came from his side.'),
    ('canon','zechariah',13,1,'canon','hebrews',9,14,'free',
      E'*How much more shall the blood of Messiah (Christ), who through the eternal Spirit offered himself without spot to Elohim (God), purge your conscience from dead works to serve the living Elohim (God)?* (Hebrews 9:14). The fountain *for sin* (Zechariah 13:1) is the blood of Messiah that does what the ashes of an heifer never could — *purge your conscience from dead works*. The opened fountain cleanses not the flesh only but the conscience, that the cleansed may serve the living Elohim (God).'),
    ('canon','zechariah',13,1,'canon','revelation',22,1,'free',
      E'*And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). The *fountain opened* for cleansing (Zechariah 13:1) reaches its consummation as the *pure river of water of life... proceeding out of the throne of Elohim (God) and of the Lamb* — the fountain opened at the cross flows forever from the throne, with the tree of life on either bank for the healing of the nations.'),

    -- THREAD 2 (★★★ CHRISTOLOGY KEYSTONE): Smite the shepherd — the man that is Yahuah's FELLOW = the Formed Son
    ('canon','zechariah',13,7,'canon','matthew',26,31,'free',
      E'*Then saith Yahusha (Jesus) unto them, All ye shall be offended because of me this night: for it is written, I will smite the shepherd, and the sheep of the flock shall be scattered abroad* (Matthew 26:31). Yahusha quotes Zechariah 13:7 BY NAME the night of his arrest — *smite the shepherd, and the sheep shall be scattered* — and names HIMSELF as the smitten Shepherd. The sword awakes against him that very night; the sheep scatter as the prophet foretold.'),
    ('canon','zechariah',13,7,'canon','mark',14,27,'free',
      E'*And Yahusha (Jesus) saith unto them, All ye shall be offended because of me this night: for it is written, I will smite the shepherd, and the sheep shall be scattered* (Mark 14:27). Again Yahusha takes Zechariah 13:7 upon himself the night of his betrayal — *I will smite the shepherd, and the sheep shall be scattered*. The Shepherd of Zechariah is the Shepherd of Gethsemane; the smiting is the cross.'),
    ('canon','zechariah',13,7,'canon','isaiah',53,5,'free',
      E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5). The sword that awakes *against my shepherd, and against the man that is my fellow* (Zechariah 13:7) is the wounding of the Servant — *wounded for our transgressions... bruised for our iniquities*. The smitten Shepherd and the smitten Servant are one: smitten of Elohim (God) for the sheep.'),
    ('canon','zechariah',13,7,'canon','isaiah',53,6,'free',
      E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). When the Shepherd is smitten *the sheep shall be scattered* (Zechariah 13:7) — *all we like sheep have gone astray*. Yet the scattering serves the bearing: *Yahuah (LORD) hath laid on him the iniquity of us all*. The straying sheep are gathered back through the Shepherd who bore their iniquity.'),

    -- THREAD 3 (★): The third brought through the fire, refined — It is my people (the two-house remnant)
    ('canon','zechariah',13,9,'canon','malachi',3,3,'free',
      E'*And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). The third part brought *through the fire, and will refine them as silver is refined* (Zechariah 13:9) is the refiner''s work of Malachi — *he shall sit as a refiner and purifier of silver*. The fire does not destroy the remnant; it purifies it for righteous worship.'),
    ('canon','zechariah',13,9,'canon','hosea',2,23,'free',
      E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). The covenant-formula of the refined remnant — *I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God)* (Zechariah 13:9) — is Hosea''s two-house reclaiming word for word: *I will say to them which were not my people, Thou art my people*. Lo-Ammi made Ammi; the scattered house owned again.'),
    ('canon','zechariah',13,9,'canon','1-peter',1,7,'free',
      E'*That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:7). The remnant tried *as gold is tried* (Zechariah 13:9) is the faith *tried with fire* that proves *much more precious than of gold that perisheth*. The furnace is not wrath upon the third part but the proving of a faith made precious for the day of his appearing.'),
    ('canon','zechariah',13,9,'canon','romans',11,5,'free',
      E'*Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). *The third shall be left therein* (Zechariah 13:8), refined and reclaimed as *my people* (13:9), is the remnant Paul confirms still stands — *a remnant according to the election of grace*. The two parts cut off are not a cast-off people but the chaff; the third is the preserved remnant.'),
    ('canon','zechariah',13,8,'canon','romans',11,2,'free',
      E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). Though *two parts therein shall be cut off and die; but the third shall be left therein* (Zechariah 13:8), the cutting-off is covenant-judgment on the unrefined, NEVER a casting-off of the people — *Elohim (God) hath not cast away his people which he foreknew*. The third left is the proof: the people endure, refined, never abandoned. Victims, not enemies; the lost sheep, with a remnant standing.'),
    ('canon','zechariah',13,9,'apocrypha','ecclesiasticus',2,5,'extras',
      E'*For gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). The third part brought *through the fire... tried as gold is tried* (Zechariah 13:9) is the proving the restored wisdom-witness teaches: *gold is tried in the fire, and acceptable men in the furnace of adversity*. The furnace is the making of the acceptable, not the ruin of the elect.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-13-a-fountain-opened-for-sin-and-uncleanness',
       E'A fountain opened for sin and for uncleanness — the cleansing flow from the pierced One',
       E'Flowing straight out of the pierced One of the verse before (*they shall look upon me whom they have pierced*, 12:10), the prophet declares: *In that day there shall be a fountain opened to the house of David and to the inhabitants of Jerusalem for sin and for uncleanness* (Zechariah 13:1). This is the cleansing of the new covenant — *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25) — the same washing that cuts off *the names of the idols out of the land* (13:2). It is the river from the sanctuary: *waters issued out from under the threshold of the house eastward... at the south side of the altar* (Ezekiel 47:1). And the NT names where the fountain was opened: *one of the soldiers with a spear pierced his side, and forthwith came there out blood and water* (John 19:34). The fountain for SIN is his blood — *the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin* (1 John 1:7); *the blood of Messiah (Christ)... purge your conscience from dead works to serve the living Elohim (God)* (Hebrews 9:14) — and the fountain for UNCLEANNESS is the clean water; both came from his pierced side. It reaches its consummation as the *pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). One fountain: opened in Zechariah, flowing from the cross, ending at the throne.',
       sv.verse_id, ev.verse_id, 'free', 46000
  FROM _s338_zec13_lookup sv, _s338_zec13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★ CHRISTOLOGY KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-13-smite-the-shepherd-the-man-that-is-my-fellow',
       E'Smite the shepherd — the man that is my fellow, the Formed Son',
       E'The chapter''s keystone: *Awake, O sword, against my shepherd, and against the man that is my fellow, saith Yahuah Tseva''ot (LORD of hosts): smite the shepherd, and the sheep shall be scattered: and I will turn mine hand upon the little ones* (Zechariah 13:7). The Shepherd is Yahuah''s FELLOW — of Yahuah''s own nature — and YET he is "MY shepherd," one who HAS a Father. This is the Formed and the Formless: the smitten Shepherd is the Formed Son, the expressed Word drawn from the Formless Father, who is Yahuah and yet has a Father; NOT co-equal trinitarian persons, NOT a modalist collapse. Yahusha quotes this verse BY NAME the night of his arrest and names himself the Shepherd: *Then saith Yahusha (Jesus) unto them, All ye shall be offended because of me this night: for it is written, I will smite the shepherd, and the sheep of the flock shall be scattered abroad* (Matthew 26:31); *And Yahusha (Jesus) saith unto them... for it is written, I will smite the shepherd, and the sheep shall be scattered* (Mark 14:27). The sword awakes against him that very night; the sheep scatter as foretold. He is the smitten Servant of Isaiah: *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5); *all we like sheep have gone astray... and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). The Shepherd is smitten that the scattered sheep, whose iniquity he bore, may be gathered home.',
       sv.verse_id, ev.verse_id, 'free', 46003
  FROM _s338_zec13_lookup sv, _s338_zec13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=13 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-13-the-third-brought-through-the-fire-refined',
       E'The third brought through the fire — refined, and It is my people',
       E'After the Shepherd is smitten and the sheep scattered, the remnant is refined: *And it shall come to pass, that in all the land, saith Yahuah (LORD), two parts therein shall be cut off and die; but the third shall be left therein. And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God)* (Zechariah 13:8-9). The fire is the refiner''s work, not wrath upon the elect: *he shall sit as a refiner and purifier of silver... and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3); *the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire* (1 Peter 1:7); *for gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). And the covenant-formula is restored — *It is my people... Yahuah (LORD) is my Elohim (God)* — which is Hosea''s two-house reclaiming word for word: *I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). Lo-Ammi made Ammi; the scattered house owned again. The two parts cut off are the chaff, never a cast-off people: *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2); *even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). The third left is the proof — refined, reclaimed, never abandoned.',
       sv.verse_id, ev.verse_id, 'extras', 46006
  FROM _s338_zec13_lookup sv, _s338_zec13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25) — the new-covenant cleansing the *fountain opened... for sin and for uncleanness* (Zechariah 13:1) pours out.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-a-fountain-opened-for-sin-and-uncleanness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*waters issued out from under the threshold of the house eastward... at the south side of the altar* (Ezekiel 47:1) — the *fountain opened* (Zechariah 13:1) is the river from the sanctuary, flowing from the altar to heal.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-a-fountain-opened-for-sin-and-uncleanness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *one of the soldiers with a spear pierced his side, and forthwith came there out blood and water* (John 19:34) — the fountain *for sin and for uncleanness* (Zechariah 13:1) opened at the pierced side (12:10).'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-a-fountain-opened-for-sin-and-uncleanness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin* (1 John 1:7) — the fountain *for sin* (Zechariah 13:1) is his blood, washing what no other water could reach.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-a-fountain-opened-for-sin-and-uncleanness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the blood of Messiah (Christ)... purge your conscience from dead works to serve the living Elohim (God)* (Hebrews 9:14) — the fountain *for sin* cleanses not the flesh only but the conscience.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-a-fountain-opened-for-sin-and-uncleanness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1) — the *fountain opened* (Zechariah 13:1) reaches its consummation as the river from the throne.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-a-fountain-opened-for-sin-and-uncleanness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *for it is written, I will smite the shepherd, and the sheep of the flock shall be scattered abroad* (Matthew 26:31) — Yahusha quotes Zechariah 13:7 BY NAME the night of his arrest and names himself the smitten Shepherd.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-smite-the-shepherd-the-man-that-is-my-fellow'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *for it is written, I will smite the shepherd, and the sheep shall be scattered* (Mark 14:27) — the Shepherd of Zechariah is the Shepherd of Gethsemane; the smiting is the cross.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=14 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-smite-the-shepherd-the-man-that-is-my-fellow'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *he was wounded for our transgressions, he was bruised for our iniquities... and with his stripes we are healed* (Isaiah 53:5) — the smitten Shepherd (Zechariah 13:7) is the smitten Servant, wounded for the sheep.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-smite-the-shepherd-the-man-that-is-my-fellow'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *all we like sheep have gone astray... and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6) — when the Shepherd is smitten *the sheep shall be scattered* (Zechariah 13:7); the straying are gathered through the One who bore their iniquity.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-smite-the-shepherd-the-man-that-is-my-fellow'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he shall sit as a refiner and purifier of silver... that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3) — the third *refine[d]... as silver* (Zechariah 13:9) is the refiner''s work, purifying for righteous worship.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-the-third-brought-through-the-fire-refined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23) — the covenant-formula of the refined remnant (*It is my people*, Zechariah 13:9) is Hosea''s two-house reclaiming, Lo-Ammi made Ammi.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-the-third-brought-through-the-fire-refined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the trial of your faith... though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:7) — the remnant *tried as gold is tried* (Zechariah 13:9) is the proving of a precious faith for the day of his appearing.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-the-third-brought-through-the-fire-refined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5) — *the third shall be left therein* (Zechariah 13:8), refined and reclaimed, is the remnant Paul confirms still stands.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-the-third-brought-through-the-fire-refined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ GUARD: *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — *two parts... cut off* (Zechariah 13:8) is covenant-judgment on the unrefined, NEVER a casting-off of the people; the third left is the proof. Victims, not enemies.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=8
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-the-third-brought-through-the-fire-refined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *for gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5) — the third *tried as gold is tried* (Zechariah 13:9); the furnace is the making of the acceptable, not the ruin of the elect.'
  FROM cross_reference_threads t
  JOIN _s338_zec13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s338_zec13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-13-the-third-brought-through-the-fire-refined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zechariah_14.sql (Zechariah 14) -----
-- Chapter: Zechariah 14 — ★★ THE BOOK'S CLIMAX. The day of Yahuah, all nations gathered against
-- Jerusalem (14:1-2 → Revelation 16:14/19:19, the end-siege). ★★ HIS FEET ON OLIVET: *And his feet
-- shall stand in that day upon the mount of Olives... and the mount of Olives shall cleave in the midst
-- thereof* (14:3-4) → Acts 1:11-12, *this same Yahusha (Jesus)... shall so come in like manner* from
-- Olivet, the Formed Son returns where he ascended. *Yahuah Elohai (the LORD my God) shall come, and all
-- the saints with thee* (14:5) → 1 Thessalonians 3:13 / Jude 1:14 / ★ 1 Enoch 1:9 *He cometh with ten
-- thousands of His set-apart ones* (a clean self-linkable witness). Living waters out of Jerusalem
-- (14:8) → Ezekiel 47:1-9 / John 7:38 / Revelation 22:1. ★★★ YAHUAH KING OVER ALL THE EARTH: *And
-- Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his
-- name one* (14:9) → Revelation 11:15/19:6 + Deuteronomy 6:4 *Yahuah Eloheinu (The LORD our God) is one
-- Yahuah (LORD)* (the Name ONE, the Formed/Formless unity). ★★★ SUKKOT FOR THE NATIONS: *every one that
-- is left of all the nations... shall even go up from year to year to worship the King, Yahuah Tseva'ot
-- (LORD of hosts), and to keep the feast of tabernacles* (14:16-19) → Leviticus 23:34-43 + Isaiah 66:23
-- + John 7 — the anti-antinomian capstone, the Torah's feasts kept FOREVER by all flesh, NOT abolished.
-- ★ HOLINESS UNTO YAHUAH (14:20-21) → Exodus 28:36, the holiness once on the high priest's mitre now on
-- everything; no more the Canaanite/trafficker in the house of Yahuah.
-- Tag: zec14   Temp view: _s338_zec14_lookup
-- Sort band: base 46025, step 3 -> threads at 46025, 46028, 46031, 46034, 46037, 46040, 46043 (7 threads)
-- Source of EVERY row: 'canon','zechariah',14,v
--
-- Zechariah 14 coverage:
--   v.1-2 (the day of Yahuah cometh... I will gather all nations against Jerusalem to battle)
--        NT:     ★★ Revelation 16:14 (the spirits of devils... go forth unto the kings of the earth...
--                to gather them to the battle of that great day) + Revelation 19:19 (the beast, and the
--                kings of the earth, and their armies, gathered together to make war) — THREAD 1
--        Extras: none warranted (the gathering-of-nations witness is the NT's own)
--        Tanakh: woven in prose; the day-of-Yahuah motif (Joel/Zeph) held in the thread narrative
--   ★★ v.3-5 (Yahuah go forth, and fight... his feet shall stand in that day upon the mount of Olives...
--          the mount of Olives shall cleave... ye shall flee)
--        NT:     ★★ Acts 1:11 (this same Yahusha (Jesus)... shall so come in like manner) + Acts 1:12
--                (the mount called Olivet) — THREAD 2 (the return to Olivet)
--        Extras: none warranted distinct (the saints-coming witness sits in THREAD 3 on v.5)
--        Tanakh: held in prose
--   ★ v.5b (Yahuah Elohai (the LORD my God) shall come, and all the saints with thee)
--        NT:     ★ 1 Thessalonians 3:13 (the coming of our Lord Yahusha HaMashiach... with all his
--                saints) + ★ Jude 1:14 (Behold, Yahuah (Lord) cometh with ten thousands of his saints) — THREAD 3
--        Extras: ★ 1 Enoch 1:9 (He cometh with ten thousands of His set-apart ones To execute judgement
--                upon all) — THREAD 3 (Jude quotes this very line; a clean self-linkable witness)
--        Tanakh: woven in prose (Deuteronomy 33:2 named, not separately threaded)
--   v.6-7 (the light shall not be clear, nor dark... at evening time it shall be light)
--        NT:     none warranted distinct (the day-known-to-Yahuah weave held in THREAD 1/2 prose)
--        Extras: none warranted
--        Tanakh: none warranted (the unique-day motif woven into the day-of-Yahuah narrative)
--   v.8 (living waters shall go out from Jerusalem... in summer and in winter)
--        NT:     ★ John 7:38 (out of his belly shall flow rivers of living water) + Revelation 22:1 (a
--                pure river of water of life... proceeding out of the throne) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 47:1 + 47:9 (waters issued out from under the threshold of the house...
--                every thing shall live whither the river cometh) — THREAD 4 (the temple river)
--   ★★★ v.9 (Yahuah shall be king over all the earth: in that day shall there be one Yahuah, his name one)
--        NT:     ★★★ Revelation 11:15 (The kingdoms of this world are become the kingdoms of our Lord)
--                + ★★ Revelation 19:6 (Yahuah Elohim (the Lord God) omnipotent reigneth) — THREAD 5
--        Extras: none warranted (the kingship witness is the canon's own)
--        Tanakh: ★★★ Deuteronomy 6:4 (Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)) — THREAD 5
--                (the Name ONE; the Formed/Formless unity)
--   v.10-15 (the land turned as a plain... the plague... Yahudah also shall fight)
--        NT:     none warranted distinct (the judgment-on-the-nations weave held in THREAD 1 prose)
--        Extras: none warranted
--        Tanakh: none warranted (geography/plague detail, woven into the day-of-Yahuah narrative)
--   ★★★ v.16-19 (every one that is left of all the nations... shall go up... to keep the feast of
--          tabernacles... upon them shall be no rain)
--        NT:     ★ John 7:2 (the Yahudim's feast of tabernacles was at hand) + ★ John 7:37 (In the last
--                day, that great day of the feast, Yahusha (Jesus) stood and cried) — THREAD 6
--        Extras: none warranted clean (Jubilees Sukkot parse not pulled; NT+Tanakh carry it fully)
--        Tanakh: ★★★ Leviticus 23:34 + 23:42-43 (the feast of tabernacles... ye shall dwell in booths...
--                a statute for ever) + ★★ Isaiah 66:23 (from one new moon to another... shall all flesh
--                come to worship) — THREAD 6 (the appointed times NOT abolished; the anti-antinomian capstone)
--   ★ v.20-21 (upon the bells of the horses, HOLINESS UNTO YAHUAH... every pot in Jerusalem... holiness
--          unto Yahuah Tseva'ot... no more the Canaanite in the house of Yahuah)
--        NT:     none warranted distinct (the holy-city consummation woven in prose; Revelation 21-22
--                named in narrative)
--        Extras: none warranted
--        Tanakh: ★ Exodus 28:36 (a plate of pure gold... HOLINESS TO THE Yahuah (LORD)) + Isaiah 66:23
--                (all flesh come to worship) — THREAD 7 (the mitre-holiness now on everything)
--
-- Threads (slug — target libraries):
--   1. zechariah-14-the-day-of-yahuah-all-nations-gathered-against-jerusalem — NT (Revelation 16, 19) [free]
--      (★★ the end-siege; all nations gathered, Yahuah goes forth to fight)
--   2. zechariah-14-his-feet-shall-stand-upon-the-mount-of-olives — NT (Acts 1) [free]
--      (★★ the Formed Son returns to Olivet in like manner as he ascended)
--   3. zechariah-14-and-all-the-saints-with-thee — NT (1 Thessalonians 3, Jude 1) + Extras (1 Enoch 1) [extras]
--      (★ Yahuah comes with all his saints; Jude quotes 1 Enoch 1:9 by name — a self-link witness)
--   4. zechariah-14-living-waters-shall-go-out-from-jerusalem — NT (John 7, Revelation 22) + Tanakh (Ezekiel 47) [free]
--      (the temple river that heals; the rivers of living water, summer and winter)
--   5. zechariah-14-yahuah-shall-be-king-over-all-the-earth-his-name-one — NT (Revelation 11, 19) + Tanakh (Deuteronomy 6) [free]
--      (★★★ the universal kingship; one Yahuah, his name one — the Formed/Formless unity)
--   6. zechariah-14-the-nations-shall-keep-the-feast-of-tabernacles — NT (John 7) + Tanakh (Leviticus 23, Isaiah 66) [free]
--      (★★★ Sukkot kept FOREVER by all flesh; the appointed times NOT abolished — the anti-antinomian capstone)
--   7. zechariah-14-holiness-unto-yahuah-upon-the-bells-of-the-horses — Tanakh (Exodus 28, Isaiah 66) [free]
--      (★ the mitre-holiness now on everything; no more the Canaanite in the house of Yahuah)
--
-- Framing notes:
--   ★★ THE DAY OF YAHUAH (THREAD 1): *Behold, the day of Yahuah (LORD) cometh* (14:1); *I will gather
--      all nations against Jerusalem to battle* (14:2); *Then shall Yahuah (LORD) go forth, and fight
--      against those nations* (14:3). Revelation shows the same end-gathering: the spirits of devils
--      *go forth unto the kings of the earth... to gather them to the battle of that great day* (16:14),
--      and *the kings of the earth, and their armies, gathered together to make war against him that
--      sat on the horse* (19:19). One day, one siege, one Yahuah who goes forth to fight.
--   ★★ HIS FEET ON OLIVET (THREAD 2): *And his feet shall stand in that day upon the mount of Olives*
--      (14:4). The angels at the ascension point to this return: *this same Yahusha (Jesus), which is
--      taken up from you into heaven, shall so come in like manner as ye have seen him go* (Acts 1:11) —
--      and he went up from *the mount called Olivet* (Acts 1:12). The Formed Son returns to the very
--      mount of his ascension; his feet stand where they stood.
--   ★ ALL THE SAINTS WITH THEE (THREAD 3): *Yahuah Elohai (the LORD my God) shall come, and all the
--      saints with thee* (14:5). 1 Thessalonians 3:13 names the coming *with all his saints*; Jude 1:14
--      quotes the restored witness verbatim — *Behold, Yahuah (Lord) cometh with ten thousands of his
--      saints* — which is 1 Enoch 1:9, *He cometh with ten thousands of His set-apart ones To execute
--      judgement upon all*. The same coming-with-the-holy-ones across the whole library; a clean
--      self-link to 1 Enoch.
--   ★★★ YAHUAH KING / HIS NAME ONE (THREAD 5): *And Yahuah (LORD) shall be king over all the earth: in
--      that day shall there be one Yahuah (LORD), and his name one* (14:9). Revelation: *The kingdoms of
--      this world are become the kingdoms of our Lord* (11:15); *Yahuah Elohim (the Lord God) omnipotent
--      reigneth* (19:6). And the Shema is the ground: *Yahuah Eloheinu (The LORD our God) is one Yahuah
--      (LORD)* (Deuteronomy 6:4). One Yahuah, one Name — the Formed Son and the Formless Father in
--      perfect unity, the Name ONE; not co-equal trinitarian persons, not a modalist collapse.
--   ★★★ SUKKOT FOR THE NATIONS (THREAD 6): *every one that is left of all the nations... shall even go
--      up from year to year to worship the King, Yahuah Tseva'ot (LORD of hosts), and to keep the feast
--      of tabernacles* (14:16); rain is withheld from those who refuse (14:17). This is the
--      anti-antinomian capstone: the appointed time commanded *for ever* — *the feast of tabernacles...
--      ye shall dwell in booths... a statute for ever* (Leviticus 23:34, 42-43) — is kept in the
--      Messianic age by ALL the nations, *from one new moon to another, and from one sabbath to another,
--      shall all flesh come to worship* (Isaiah 66:23). Yahusha himself went up to this very feast
--      (John 7:2, 37). The Torah's feasts are NOT abolished; they are kept forever by all flesh.
--   ★ HOLINESS UNTO YAHUAH (THREAD 7): *In that day shall there be upon the bells of the horses,
--      HOLINESS UNTO THE Yahuah (LORD)... every pot in Jerusalem and in Yahudah (Judah) shall be
--      holiness unto Yahuah Tseva'ot* (14:20-21). The words once engraved only on the high priest's
--      mitre — *a plate of pure gold... HOLINESS TO THE Yahuah (LORD)* (Exodus 28:36) — are now on the
--      bells of horses and the common pots; the whole creation sanctified, and *no more the Canaanite
--      in the house of Yahuah Tseva'ot* (14:21).
--   EXTRAS: 1 Enoch 1:9 (the coming with ten thousands of His set-apart ones) — the one extras add,
--      clean and self-linkable, the very line Jude quotes. Jubilees Sukkot material not pulled (NT +
--      Leviticus + Isaiah carry the feast fully).
--   VERSES WITH NO SEPARATE ADD: v.6-7 (the unique day, light at evening — woven into the day-of-Yahuah
--      narrative), v.10-15 (the land made a plain, the plague on the nations, Yahudah fighting — judgment
--      detail woven into THREAD 1). All recorded, none silently skipped.

CREATE TEMP VIEW _s338_zec14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): The day of Yahuah — all nations gathered against Jerusalem
    ('canon','zechariah',14,2,'canon','revelation',16,14,'free',
      E'*For they are the spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14). Zechariah''s *I will gather all nations against Jerusalem to battle* (14:2) is the same end-gathering — the kings of the whole world drawn to *that great day*. The siege of the nations against the city is the prelude to the day of Yahuah.'),
    ('canon','zechariah',14,3,'canon','revelation',19,19,'free',
      E'*And I saw the beast, and the kings of the earth, and their armies, gathered together to make war against him that sat on the horse, and against his army* (Revelation 19:19). When *Yahuah (LORD) go forth, and fight against those nations* (14:3), it is this war: the gathered kings making war, and the One on the white horse going forth against them. Yahuah fights *as when he fought in the day of battle* (14:3).'),

    -- THREAD 2 (★★): His feet shall stand upon the mount of Olives
    ('canon','zechariah',14,4,'canon','acts',1,11,'free',
      E'*Ye men of Galilee, why stand ye gazing up into heaven? this same Yahusha (Jesus), which is taken up from you into heaven, shall so come in like manner as ye have seen him go into heaven* (Acts 1:11). *His feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east* (14:4) — the Formed Son returns *in like manner* to the very mount from which he ascended. The same Yahusha (Jesus), the same place, his feet standing where they stood.'),
    ('canon','zechariah',14,4,'canon','acts',1,12,'free',
      E'*Then returned they unto Jerusalem from the mount called Olivet, which is from Jerusalem a sabbath day''s journey* (Acts 1:12). The mount whose name is given here is the very mount of *his feet shall stand in that day upon the mount of Olives* (14:4). From Olivet he was taken up; upon Olivet his feet shall stand, and *the mount of Olives shall cleave in the midst thereof* (14:4) at his return.'),

    -- THREAD 3 (★): And all the saints with thee — he cometh with ten thousands of his saints
    ('canon','zechariah',14,5,'canon','1-thessalonians',3,13,'free',
      E'*To the end he may stablish your hearts unblameable in holiness before Elohim (God), even our Father, at the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13). *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (14:5) — the coming *with all his saints*, the holy ones in his train at the day of Yahuah.'),
    ('canon','zechariah',14,5,'canon','jude',1,14,'free',
      E'*And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14). Jude names the prophet and quotes the line that answers *and all the saints with thee* (14:5): Yahuah *cometh with ten thousands of his saints*. The coming-with-the-holy-ones is one witness across the canon — and Jude draws it from the restored book of Enoch.'),
    ('canon','zechariah',14,5,'enoch','1-enoch',1,9,'extras',
      E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly* (1 Enoch 1:9). This is the very line Jude quotes — and it answers *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (14:5). The restored witness shows the same day of Yahuah: *He cometh with ten thousands of His set-apart ones*, the holy ones gathered for the judgement upon all flesh.'),

    -- THREAD 4: Living waters shall go out from Jerusalem
    ('canon','zechariah',14,8,'canon','ezekiel',47,1,'free',
      E'*Afterward he brought me again unto the door of the house; and, behold, waters issued out from under the threshold of the house eastward... and the waters came down from under from the right side of the house, at the south side of the altar* (Ezekiel 47:1). *Living waters shall go out from Jerusalem* (14:8) is the same river: the waters issuing from the house, from the altar, flowing out from the city of Yahuah.'),
    ('canon','zechariah',14,8,'canon','ezekiel',47,9,'free',
      E'*And it shall come to pass, that every thing that liveth, which moveth, whithersoever the rivers shall come, shall live... for they shall be healed; and every thing shall live whither the river cometh* (Ezekiel 47:9). The *living waters* of Zechariah 14:8 are living indeed — wherever the river comes, *every thing shall live*. *In summer and in winter shall it be* (14:8): an unfailing river of life from Jerusalem.'),
    ('canon','zechariah',14,8,'canon','john',7,38,'free',
      E'*He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water* (John 7:38). At the feast of tabernacles Yahusha (Jesus) names the *living waters* that *shall go out from Jerusalem* (14:8): *rivers of living water* flowing from the believer, the Spirit poured out (John 7:39). The river from the city is the Spirit of life given through the Formed Son.'),
    ('canon','zechariah',14,8,'canon','revelation',22,1,'free',
      E'*And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). The consummation of the *living waters... out from Jerusalem* (14:8): *a pure river of water of life... proceeding out of the throne*, watering the tree of life whose leaves are *for the healing of the nations* (Revelation 22:2). The river that began at the altar ends at the throne.'),

    -- THREAD 5 (★★★): Yahuah shall be king over all the earth — his name one
    ('canon','zechariah',14,9,'canon','revelation',11,15,'free',
      E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). *And Yahuah (LORD) shall be king over all the earth* (14:9) is this very announcement: the kingdoms of the world become his, and *he shall reign for ever and ever*. The universal kingship Zechariah foretold, proclaimed in heaven.'),
    ('canon','zechariah',14,9,'canon','revelation',19,6,'free',
      E'*And I heard as it were the voice of a great multitude... saying, Alleluia: for Yahuah Elohim (the Lord God) omnipotent reigneth* (Revelation 19:6). When *Yahuah (LORD) shall be king over all the earth* (14:9), this is the cry: *Yahuah Elohim (the Lord God) omnipotent reigneth*. The one Yahuah, king over all, reigning in the day when *there shall be one Yahuah (LORD), and his name one* (14:9).'),
    ('canon','zechariah',14,9,'canon','deuteronomy',6,4,'free',
      E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4). The Shema is the ground of *in that day shall there be one Yahuah (LORD), and his name one* (14:9): one Yahuah, one Name. The Formed Son and the Formless Father in perfect unity — Yahuah is ONE, and his name one; not co-equal trinitarian persons, not a modalist collapse, but the one Yahuah whose Name shall be one over all the earth.'),

    -- THREAD 6 (★★★): The nations shall keep the feast of tabernacles
    ('canon','zechariah',14,16,'canon','leviticus',23,34,'free',
      E'*Speak unto the children of Yashar''el (Israel), saying, The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34). The feast the nations go up to keep — *to keep the feast of tabernacles* (14:16) — is this appointed time, *the feast of tabernacles... unto Yahuah (LORD)*. The Torah''s feast, commanded to Yashar''el (Israel), kept in the Messianic age by all the nations.'),
    ('canon','zechariah',14,16,'canon','leviticus',23,42,'free',
      E'*Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths* (Leviticus 23:42), *that your generations may know that I made the children of Yashar''el (Israel) to dwell in booths, when I brought them out of the land of Egypt* (23:43). The booths of Sukkot, *a statute for ever* (23:41), are the very feast *every one that is left of all the nations* shall *go up from year to year... to keep* (14:16). The appointed time is NOT abolished; it is kept forever, now by all flesh.'),
    ('canon','zechariah',14,16,'canon','isaiah',66,23,'free',
      E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The nations going up *to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (14:16) is *all flesh* coming to worship by the new moons and sabbaths. The calendar of Yahuah — feasts, new moons, sabbaths — kept by all flesh in the age to come, not abolished but consummated.'),
    ('canon','zechariah',14,16,'canon','john',7,2,'free',
      E'*Now the Yahudim''s (Jews'') feast of tabernacles was at hand* (John 7:2). The very feast the nations shall keep — *the feast of tabernacles* (14:16) — is the feast Yahusha (Jesus) himself went up to keep. The Formed Son kept Sukkot; the nations shall keep it forever.'),
    ('canon','zechariah',14,16,'canon','john',7,37,'free',
      E'*In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink* (John 7:37). On the great day of the *feast of tabernacles* (14:16) Yahusha (Jesus) stood and cried — keeping the feast, and pointing to the living water (John 7:38) that *shall go out from Jerusalem* (14:8). The feast the nations will keep is the feast the Messiah kept and filled.'),

    -- THREAD 7 (★): Holiness unto Yahuah upon the bells of the horses
    ('canon','zechariah',14,20,'canon','exodus',28,36,'free',
      E'*And thou shalt make a plate of pure gold, and grave upon it, like the engravings of a signet, HOLINESS TO THE Yahuah (LORD)* (Exodus 28:36). The words once engraved only on the high priest''s golden plate, worn on the mitre — *HOLINESS TO THE Yahuah (LORD)* — are now *upon the bells of the horses, HOLINESS UNTO THE Yahuah (LORD)* (14:20). The holiness reserved for the priest''s forehead is now upon the common things; the whole creation sanctified.'),
    ('canon','zechariah',14,21,'canon','isaiah',66,23,'free',
      E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). When *every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts)* (14:21) and *all they that sacrifice shall come and take of them*, all flesh worships in a city wholly holy — *no more the Canaanite in the house of Yahuah Tseva''ot* (14:21). The consummated holiness where all flesh comes to worship.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s338_zec14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s338_zec14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-14-the-day-of-yahuah-all-nations-gathered-against-jerusalem',
       E'The day of Yahuah — all nations gathered against Jerusalem',
       E'The book''s climax opens with the day of Yahuah: *Behold, the day of Yahuah (LORD) cometh, and thy spoil shall be divided in the midst of thee. For I will gather all nations against Jerusalem to battle; and the city shall be taken* (Zechariah 14:1-2). Then Yahuah himself goes forth: *Then shall Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (14:3). The Revelation shows the same end-gathering: *For they are the spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle of that great day of El Shaddai (God Almighty)* (16:14); *And I saw the beast, and the kings of the earth, and their armies, gathered together to make war against him that sat on the horse, and against his army* (19:19). One siege, one day, one Yahuah who goes forth to fight for his city — the kings of the whole world drawn to *that great day*, and the One on the white horse going forth against them.',
       sv.verse_id, ev.verse_id, 'free', 46025
  FROM _s338_zec14_lookup sv, _s338_zec14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=14 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-14-his-feet-shall-stand-upon-the-mount-of-olives',
       E'His feet shall stand upon the mount of Olives — the return to Olivet',
       E'When Yahuah goes forth to fight, he stands on a particular mountain: *And his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east, and the mount of Olives shall cleave in the midst thereof toward the east and toward the west, and there shall be a very great valley* (Zechariah 14:4). This is the very mount of the ascension. The angels declared at his going up: *Ye men of Galilee, why stand ye gazing up into heaven? this same Yahusha (Jesus), which is taken up from you into heaven, shall so come in like manner as ye have seen him go into heaven* (Acts 1:11) — and the place is named: *Then returned they unto Jerusalem from the mount called Olivet, which is from Jerusalem a sabbath day''s journey* (Acts 1:12). From Olivet the Formed Son was taken up; upon Olivet his feet shall stand, *in like manner* as he went. The same Yahusha (Jesus), the same mount, his feet standing where they stood — and the mountain cleaving at his return.',
       sv.verse_id, ev.verse_id, 'free', 46028
  FROM _s338_zec14_lookup sv, _s338_zec14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=14 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★) — extras
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-14-and-all-the-saints-with-thee',
       E'And all the saints with thee — he cometh with ten thousands of his holy ones',
       E'The day of Yahuah is a coming with the holy ones: *and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5). This is one witness across the whole library. Paul names the coming *with all his saints*: *To the end he may stablish your hearts unblameable in holiness before Elohim (God), even our Father, at the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13). And Jude quotes the restored book of Enoch by name: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14) — which is the very line of 1 Enoch: *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly* (1 Enoch 1:9). Zechariah''s *all the saints with thee*, Paul''s *all his saints*, Jude''s *ten thousands of his saints*, and Enoch''s *ten thousands of His set-apart ones* are one and the same coming — the Formed Son with the holy ones at the day of Yahuah, gathered for the judgement upon all flesh.',
       sv.verse_id, ev.verse_id, 'extras', 46031
  FROM _s338_zec14_lookup sv, _s338_zec14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=14 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-14-living-waters-shall-go-out-from-jerusalem',
       E'Living waters shall go out from Jerusalem — the river that heals',
       E'From the kingdom-city flows a river of life: *And it shall be in that day, that living waters shall go out from Jerusalem; half of them toward the former sea, and half of them toward the hinder sea: in summer and in winter shall it be* (Zechariah 14:8) — an unfailing river, in every season. Ezekiel saw it issue from the temple: *waters issued out from under the threshold of the house eastward... at the south side of the altar* (47:1), and *every thing that liveth, which moveth, whithersoever the rivers shall come, shall live... and every thing shall live whither the river cometh* (47:9). At the feast Yahusha (Jesus) named it: *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water* (John 7:38) — the Spirit of life given through the Formed Son. And the consummation: *a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1), watering the tree whose *leaves of the tree were for the healing of the nations* (22:2). The river that began at the altar ends at the throne; living waters from Jerusalem, summer and winter, healing every thing they touch.',
       sv.verse_id, ev.verse_id, 'free', 46034
  FROM _s338_zec14_lookup sv, _s338_zec14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=14 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-14-yahuah-shall-be-king-over-all-the-earth-his-name-one',
       E'Yahuah shall be king over all the earth — and his name one',
       E'Here is the heart of the book''s climax: *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9). The universal kingship, and the Name ONE. Revelation proclaims it: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (11:15), and the great multitude cries *Alleluia: for Yahuah Elohim (the Lord God) omnipotent reigneth* (19:6). And the ground of *one Yahuah... and his name one* is the Shema: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4). This is the Formed and the Formless in perfect unity — the Formed Son drawn from the Formless Father, yet Yahuah is ONE, and his name one over all the earth. Not co-equal trinitarian persons; not a modalist collapse — one Yahuah, one Name, king over all the earth in that day.',
       sv.verse_id, ev.verse_id, 'free', 46037
  FROM _s338_zec14_lookup sv, _s338_zec14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-14-the-nations-shall-keep-the-feast-of-tabernacles',
       E'The nations shall keep the feast of tabernacles — the appointed times forever',
       E'The anti-antinomian capstone of the whole Tanakh: *And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16) — and rain is withheld from those who refuse (14:17-19). The feast is the Torah''s appointed time: *The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34); *Ye shall dwell in booths seven days... that your generations may know that I made the children of Yashar''el (Israel) to dwell in booths, when I brought them out of the land of Egypt* (23:42-43), *a statute for ever* (23:41). In the Messianic age this feast is kept not only by Yashar''el (Israel) but by ALL the nations — *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). Yahusha (Jesus) himself kept it: *Now the Yahudim''s (Jews'') feast of tabernacles was at hand* (John 7:2), and *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink* (John 7:37). The appointed times are NOT abolished; the feast of tabernacles is kept FOREVER, by all flesh, in the kingdom of the King.',
       sv.verse_id, ev.verse_id, 'free', 46040
  FROM _s338_zec14_lookup sv, _s338_zec14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=14 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zechariah-14-holiness-unto-yahuah-upon-the-bells-of-the-horses',
       E'HOLINESS UNTO YAHUAH — the whole creation sanctified',
       E'The book ends in total holiness: *In that day shall there be upon the bells of the horses, HOLINESS UNTO THE Yahuah (LORD); and the pots in the LORD''S house shall be like the bowls before the altar. Yea, every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts)* (Zechariah 14:20-21). The words once engraved on a single golden plate worn on the high priest''s mitre — *And thou shalt make a plate of pure gold, and grave upon it, like the engravings of a signet, HOLINESS TO THE Yahuah (LORD)* (Exodus 28:36) — are now on the bells of horses and the common cooking-pots. The holiness reserved for the priest''s forehead spreads to the whole creation. *All they that sacrifice shall come and take of them, and seethe therein: and in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot* (14:21) — no more the trafficker in the house of Yahuah, when *all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The whole city, the whole land, the common things — all holiness unto Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 46043
  FROM _s338_zec14_lookup sv, _s338_zec14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='zechariah' AND ev.chapter_number=14 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the spirits of devils... go forth unto the kings of the earth... to gather them to the battle of that great day* (Revelation 16:14) — the *all nations against Jerusalem* of Zechariah 14:2, the end-gathering to the day of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-the-day-of-yahuah-all-nations-gathered-against-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the kings of the earth, and their armies, gathered together to make war against him that sat on the horse* (Revelation 19:19) — when *Yahuah (LORD) go forth, and fight against those nations* (14:3), the One on the white horse goes forth against the gathered kings.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=3
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-the-day-of-yahuah-all-nations-gathered-against-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *this same Yahusha (Jesus), which is taken up from you into heaven, shall so come in like manner as ye have seen him go* (Acts 1:11) — *his feet shall stand in that day upon the mount of Olives* (14:4); the Formed Son returns in like manner to the mount of his ascension.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-his-feet-shall-stand-upon-the-mount-of-olives'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the mount called Olivet, which is from Jerusalem a sabbath day''s journey* (Acts 1:12) — the very *mount of Olives* (14:4) named; from Olivet he ascended, upon Olivet his feet shall stand and the mount shall cleave.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-his-feet-shall-stand-upon-the-mount-of-olives'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★) — extras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13) — the coming *with all the saints* of Zechariah 14:5, the holy ones in his train.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=5
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-and-all-the-saints-with-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Enoch... prophesied... Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14) — Jude quotes 1 Enoch 1:9, the very answer to *all the saints with thee* (14:5).'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=5
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-and-all-the-saints-with-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *He cometh with ten thousands of His set-apart ones To execute judgement upon all* (1 Enoch 1:9) — the restored witness Jude quotes; the same day-of-Yahuah coming with the holy ones of Zechariah 14:5.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=5
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-and-all-the-saints-with-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*waters issued out from under the threshold of the house eastward... at the south side of the altar* (Ezekiel 47:1) — the *living waters... out from Jerusalem* (14:8) seen issuing from the temple and the altar.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-living-waters-shall-go-out-from-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*every thing shall live whither the river cometh* (Ezekiel 47:9) — the *living waters* of 14:8 are living indeed; wherever the river comes, every thing lives.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-living-waters-shall-go-out-from-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *out of his belly shall flow rivers of living water* (John 7:38) — at the feast Yahusha (Jesus) names the *living waters* of 14:8: the Spirit of life given through the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-living-waters-shall-go-out-from-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a pure river of water of life... proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1) — the consummation of the *living waters... out from Jerusalem* (14:8); the river that began at the altar ends at the throne.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-living-waters-shall-go-out-from-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *The kingdoms of this world are become the kingdoms of our Lord... and he shall reign for ever and ever* (Revelation 11:15) — the announcement of *Yahuah (LORD) shall be king over all the earth* (14:9).'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-yahuah-shall-be-king-over-all-the-earth-his-name-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Alleluia: for Yahuah Elohim (the Lord God) omnipotent reigneth* (Revelation 19:6) — the cry when *Yahuah (LORD) shall be king over all the earth* (14:9), and his name one.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-yahuah-shall-be-king-over-all-the-earth-his-name-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) — the Shema is the ground of *one Yahuah (LORD), and his name one* (14:9); the Formed/Formless unity, one Yahuah, one Name.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-yahuah-shall-be-king-over-all-the-earth-his-name-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34) — the appointed time the nations go up *to keep* (14:16); the Torah''s feast kept in the Messianic age.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-the-nations-shall-keep-the-feast-of-tabernacles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Ye shall dwell in booths seven days* (Leviticus 23:42), *a statute for ever* (23:41) — the very feast *every one... of all the nations* shall *go up... to keep* (14:16); NOT abolished, kept forever, now by all flesh.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-the-nations-shall-keep-the-feast-of-tabernacles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23) — the nations *to worship the King... and to keep the feast of tabernacles* (14:16); the calendar of Yahuah kept by all flesh.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-the-nations-shall-keep-the-feast-of-tabernacles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Now the Yahudim''s (Jews'') feast of tabernacles was at hand* (John 7:2) — the very feast (14:16) Yahusha (Jesus) himself went up to keep.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-the-nations-shall-keep-the-feast-of-tabernacles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried... If any man thirst, let him come unto me, and drink* (John 7:37) — the Formed Son kept the feast of tabernacles (14:16) and filled it with the living water.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-the-nations-shall-keep-the-feast-of-tabernacles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *a plate of pure gold... grave upon it... HOLINESS TO THE Yahuah (LORD)* (Exodus 28:36) — the words once only on the high priest''s mitre, now *upon the bells of the horses* (14:20); the whole creation sanctified.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=20
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-holiness-unto-yahuah-upon-the-bells-of-the-horses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*from one new moon to another... shall all flesh come to worship before me* (Isaiah 66:23) — when *every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot* (14:21) and *no more the Canaanite in the house of Yahuah*, all flesh worships in a city wholly holy.'
  FROM cross_reference_threads t
  JOIN _s338_zec14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=21
  JOIN _s338_zec14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zechariah-14-holiness-unto-yahuah-upon-the-bells-of-the-horses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session338 — Zechariah cross-references complete.'
