-- =====================================================================
-- Session 322 — Song of Solomon FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session322_song_of_solomon_cross_references.sql
-- =====================================================================

\echo 'session322 — Song of Solomon cross-references starting...'
BEGIN;

-- ----- fragment: minion_song-of-solomon_1.sql (Song of Solomon 1) -----
-- Song of Solomon 1 — full-library cross-references. Tag song01. Session prefix s322.
-- Sort band 39300, step 1: 39300, 39301, 39302, 39303, 39304.
-- View: _s322_song01_lookup
--
-- READING FRAME: the Song is read as the covenant-love between the Beloved/Bridegroom
-- = the Messiah, the Formed Son who loves and seeks his bride (he HAS a Father — the
-- Bridegroom King of Psalm 45, never co-equal-trinity), and the bride/spouse = his
-- covenant people, Yashar'el (Israel) restored: BOTH houses gathered, NOT a new people
-- replacing Israel (Rom 11:1-2 anti-replacement guard — the bride IS Yashar'el, the
-- wild and natural branches of the one olive). Woven to the canon's own marriage-
-- covenant thread (Eph 5:25-32; Rev 19:7-9; Rev 21:2; Isa 54:5; Hosea 2:19-20;
-- Jer 2:2; Psalm 45). REVERENT/CHASTE throughout — the spousal-covenant allegory the
-- canon itself develops, never an eroticized reading.
--
-- Song of Solomon 1 coverage:
--   v.2-4 (let him kiss me; thy love better than wine; draw me, we will run; the king brought me into his chambers)
--        NT:     John 6:44 (no man can come except the Father draw him) — the drawing
--        Extras: none warranted
--        Tanakh: Jer 31:3 (with lovingkindness have I drawn thee), Hosea 11:4 (I drew them with cords of a man, bands of love), Psalm 45:14-15 (brought unto the king) — THREAD 1
--   v.3 (thy name is as ointment poured forth, therefore do the virgins love thee)
--        NT:     Phil 2:9-10 (a name above every name) — the Name beloved/exalted
--        Extras: none warranted
--        Tanakh: Ecclesiastes 7:1 (a good name is better than precious ointment) — THREAD 2
--   v.5-6 (I am black but comely, O daughters of Jerusalem; the sun hath looked upon me; mine own vineyard have I not kept)
--        NT:     Eph 5:25-27 (loved the church, present it glorious, without spot) — the bride made comely by love
--        Extras: none warranted
--        Tanakh: Isa 54:5 (thy Maker is thine husband) — the afflicted/widowed bride still espoused — THREAD 3
--   v.7-8 (where thou feedest, where thou makest thy flock to rest at noon; feed thy kids beside the shepherds' tents)
--        NT:     John 10:11 (I am the good shepherd) — the Beloved as Shepherd
--        Extras: none warranted
--        Tanakh: Psalm 23:1-2 (Yahuah is my shepherd, maketh me lie down), Ezek 34:15 (I will feed my flock, cause them to lie down) — THREAD 4
--   v.12-17 (spikenard, bundle of myrrh, cluster of camphire in Engedi; thou art fair, my love; thou art fair, my beloved; our bed is green; beams cedar, rafters fir)
--        NT:     Rev 19:7 (the marriage of the Lamb is come), Rev 21:2 (a bride adorned for her husband) — the marriage consummated
--        Extras: none warranted
--        Tanakh: Hosea 2:19-20 (I will betroth thee unto me for ever), Jer 2:2 (the love of thine espousals) — the betrothal/espousal — THREAD 5
--
-- THREADS:
--   song01: song-of-solomon-1-draw-me-we-will-run-after-thee-the-king-drew-his-bride-with-lovingkindness (canon Tanakh + NT) [free]
--   song01: song-of-solomon-1-thy-name-is-as-ointment-poured-forth-the-name-beloved (canon Tanakh + NT) [free]
--   song01: song-of-solomon-1-i-am-black-but-comely-the-afflicted-bride-still-fair-to-the-beloved (canon Tanakh + NT) [free]
--   song01: song-of-solomon-1-where-thou-feedest-thy-flock-the-beloved-is-the-shepherd (canon Tanakh + NT) [free]
--   song01: song-of-solomon-1-a-bundle-of-myrrh-is-my-wellbeloved-the-marriage-covenant-of-love (canon Tanakh + NT) [free]
--
-- Contested/load-bearing framing:
--   v.5 "I am black, but comely" — read REVERENTLY as the covenant-love that beholds the
--   bride lovely despite her hard estate: the sun-darkened, sun-afflicted, scattered people
--   still comely in the Beloved's eyes (Isa 54:5, the widowed bride still espoused;
--   Eph 5:25-27, the assembly loved and made without spot). NOT an ethnic/skin reading,
--   NOT eroticized — the affliction is exile/scattering, the comeliness is covenant.
--   The bride = Yashar'el restored (both houses), never a new people (Rom 11 guard).
--   v.4 "Draw me" / John 6:44 — the Father draws to the Son; the Bridegroom Son has a
--   Father (Psalm 45 King), never co-equal-trinity grammar.

CREATE TEMP VIEW _s322_song01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: draw me, we will run after thee — the King drew his bride with lovingkindness
    ('canon','song-of-solomon',1,4,'canon','jeremiah',31,3,'free',E'*Yahuah (LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (Jeremiah 31:3). The bride''s cry *Draw me, we will run after thee* (Song of Solomon 1:4) is answered here in plain covenant-word: it is the Beloved who first draws, and He draws His own with lovingkindness and an everlasting love — Yashar''el (Israel) drawn back to her husband.'),
    ('canon','song-of-solomon',1,4,'canon','hosea',11,4,'free',E'*I drew them with cords of a man, with bands of love: and I was to them as they that take off the yoke on their jaws, and I laid meat unto them* (Hosea 11:4). The longing *Draw me, we will run after thee* (Song of Solomon 1:4) is the very drawing Yahuah describes toward His people — not by force but with *cords of a man, with bands of love*, the gentle covenant-pull of the Bridegroom upon His bride.'),
    ('canon','song-of-solomon',1,4,'canon','john',6,44,'free',E'*No man can come to me, except the Father which hath sent me draw him: and I will raise him up at the last day* (John 6:44). The bride does not run of herself — *Draw me, we will run after thee* (Song of Solomon 1:4) — and the Formed Son names the same order forward: the Father draws to the Son. The Bridegroom has a Father; the running follows the drawing.'),
    ('canon','song-of-solomon',1,4,'canon','psalms',45,14,'free',E'*She shall be brought unto the king in raiment of needlework: the virgins her companions that follow her shall be brought unto thee* (Psalm 45:14). *The king hath brought me into his chambers* (Song of Solomon 1:4) is the wedding-song of Psalm 45 enacted — the bride and her virgin companions brought in unto the King, the King''s own daughter-bride led to her Bridegroom.'),
    ('canon','song-of-solomon',1,4,'canon','psalms',45,15,'free',E'*With gladness and rejoicing shall they be brought: they shall enter into the king''s palace* (Psalm 45:15). *We will be glad and rejoice in thee* (Song of Solomon 1:4) is the gladness of Psalm 45 — the bride brought with rejoicing into the King''s chambers, the joy of the covenant-people entering the house of their Bridegroom-King.'),
    -- THREAD 2: thy name is as ointment poured forth — the Name beloved
    ('canon','song-of-solomon',1,3,'canon','ecclesiastes',7,1,'free',E'*A good name is better than precious ointment; and the day of death than the day of one''s birth* (Ecclesiastes 7:1). The bride says *thy name is as ointment poured forth* (Song of Solomon 1:3); the wisdom of Solomon weighs the two together — a name above ointment — so the Beloved''s name, poured forth like fragrant oil, is the most precious thing, *therefore do the virgins love thee*.'),
    ('canon','song-of-solomon',1,3,'canon','philippians',2,9,'free',E'*Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9). The fragrance the bride loves — *thy name is as ointment poured forth, therefore do the virgins love thee* (Song of Solomon 1:3) — is fulfilled forward in the name the Father bestows upon the Formed Son: the name above every name, given by the Father, beloved by all who are His.'),
    ('canon','song-of-solomon',1,3,'canon','philippians',2,10,'free',E'*That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). The virgins love the Beloved for His name poured forth (Song of Solomon 1:3); that same name is the one before which every knee shall bow — the bride''s love now, the whole creation''s homage at the last.'),
    -- THREAD 3: I am black, but comely — the afflicted bride still fair to the Beloved
    ('canon','song-of-solomon',1,5,'canon','isaiah',54,5,'free',E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called* (Isaiah 54:5). The bride owns her hard estate — *I am black, but comely, O ye daughters of Jerusalem* (Song of Solomon 1:5) — yet she is comely still, for her Maker is her husband: the afflicted, sun-darkened, scattered wife is not cast off but espoused, beautiful in her Redeemer''s eyes.'),
    ('canon','song-of-solomon',1,6,'canon','isaiah',54,5,'free',E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). *Look not upon me, because I am black, because the sun hath looked upon me* (Song of Solomon 1:6): the bride bears the marks of affliction and a vineyard not kept, yet the covenant stands — her Husband-Maker redeems her, the shame of her hard estate not the last word.'),
    ('canon','song-of-solomon',1,5,'canon','ephesians',5,27,'free',E'*That he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish* (Ephesians 5:27). The bride confesses *I am black, but comely* (Song of Solomon 1:5) — comely not by her own keeping but by the love that washes and presents her glorious; the Beloved beholds her fair and makes her so, the assembly loved and cleansed.'),
    ('canon','song-of-solomon',1,6,'canon','ephesians',5,25,'free',E'*Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). *Mine own vineyard have I not kept* (Song of Solomon 1:6): the bride''s failure is real, yet the love that holds her is the Bridegroom''s self-giving — He loves her and gives himself for her, the afflicted vineyard-keeper still His own.'),
    -- THREAD 4: where thou feedest thy flock — the Beloved is the Shepherd
    ('canon','song-of-solomon',1,7,'canon','psalms',23,1,'free',E'*Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1). The bride seeks her Beloved as a shepherd to be followed — *Tell me, O thou whom my soul loveth, where thou feedest, where thou makest thy flock to rest at noon* (Song of Solomon 1:7) — and the Psalm names Him: the One whom the soul loveth is the Shepherd, beside whom the flock shall not want.'),
    ('canon','song-of-solomon',1,7,'canon','psalms',23,2,'free',E'*He maketh me to lie down in green pastures: he leadeth me beside the still waters* (Psalm 23:2). *Where thou makest thy flock to rest at noon* (Song of Solomon 1:7): the rest the bride seeks is the Shepherd''s own gift — He makes His flock lie down in green pastures, the noonday rest of the loved sheep beside her Beloved.'),
    ('canon','song-of-solomon',1,7,'canon','ezekiel',34,15,'free',E'*I will feed my flock, and I will cause them to lie down, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 34:15). The bride asks *where thou feedest, where thou makest thy flock to rest* (Song of Solomon 1:7); Yahuah answers as the true Shepherd who feeds His own and causes them to lie down — the scattered flock of Yashar''el (Israel) gathered and fed by their own Beloved.'),
    ('canon','song-of-solomon',1,7,'canon','john',10,11,'free',E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). *O thou whom my soul loveth, where thou feedest... thy flock* (Song of Solomon 1:7): the Shepherd the bride loves is the Formed Son who lays down His life for the sheep — the Beloved-Shepherd, sought and found at the head of His flock.'),
    -- THREAD 5: a bundle of myrrh is my wellbeloved — the marriage-covenant of love
    ('canon','song-of-solomon',1,13,'canon','hosea',2,19,'free',E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). *A bundle of myrrh is my wellbeloved unto me* (Song of Solomon 1:13): the bride holds her Beloved near as a fragrance worn over the heart, the very nearness of the everlasting betrothal Yahuah swears to His people — His for ever, in lovingkindness.'),
    ('canon','song-of-solomon',1,14,'canon','hosea',2,20,'free',E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20). *My beloved is unto me as a cluster of camphire in the vineyards of En-gedi* (Song of Solomon 1:14): the bride''s delight in her Beloved is the answering knowledge of the faithful betrothal — she knows her Husband, the love sealed in faithfulness.'),
    ('canon','song-of-solomon',1,15,'canon','jeremiah',2,2,'free',E'*Thus saith Yahuah (LORD); I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest after me in the wilderness, in a land that was not sown* (Jeremiah 2:2). *Behold, thou art fair, my love; behold, thou art fair* (Song of Solomon 1:15): the Beloved''s delight in the bride is the love of the espousals Yahuah remembers — the first-love of the betrothed wife, fair in her Bridegroom''s eyes.'),
    ('canon','song-of-solomon',1,16,'canon','revelation',19,7,'free',E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). *Behold, thou art fair, my beloved, yea, pleasant: also our bed is green* (Song of Solomon 1:16): the mutual delight of bride and Beloved reaches its consummation forward at the marriage of the Lamb, the wedding the whole canon has been singing toward.'),
    ('canon','song-of-solomon',1,16,'canon','revelation',21,2,'free',E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). *Behold, thou art fair, my beloved... also our bed is green* (Song of Solomon 1:16): the green-bowered chamber of love is the figure of the dwelling fulfilled when the bride, Yashar''el (Israel) restored, comes down adorned for her husband — the marriage made everlasting.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s322_song01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s322_song01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-1-draw-me-we-will-run-after-thee-the-king-drew-his-bride-with-lovingkindness',
       E'"Draw me, we will run after thee" — the King drew his bride with lovingkindness',
       E'The Song opens with the bride''s longing for her Beloved, and her longing is itself His gift: *Draw me, we will run after thee: the king hath brought me into his chambers: we will be glad and rejoice in thee, we will remember thy love more than wine: the upright love thee* (Song of Solomon 1:4). She does not run of herself — she asks to be drawn, and only then runs. This is the order Yahuah names in plain covenant-word toward Yashar''el (Israel): *Yahuah (LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (Jeremiah 31:3), and *I drew them with cords of a man, with bands of love* (Hosea 11:4). The Bridegroom draws His bride not by force but by love. The Formed Son speaks the same order forward — *No man can come to me, except the Father which hath sent me draw him* (John 6:44): the Bridegroom has a Father, and the running follows the drawing. And being drawn, the bride is brought in: this is the wedding-song of Psalm 45 enacted — *She shall be brought unto the king in raiment of needlework... With gladness and rejoicing shall they be brought: they shall enter into the king''s palace* (Psalm 45:14-15). The covenant-people, drawn and brought with rejoicing into the chambers of their King.',
       sv.verse_id, ev.verse_id, 'free', 39300
  FROM _s322_song01_lookup sv, _s322_song01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-1-thy-name-is-as-ointment-poured-forth-the-name-beloved',
       E'"Thy name is as ointment poured forth" — the Name beloved',
       E'The bride loves the Beloved for His very name: *Because of the savour of thy good ointments thy name is as ointment poured forth, therefore do the virgins love thee* (Song of Solomon 1:3). A name like fragrant oil emptied out, filling the room — and the love it draws. The wisdom of Solomon weighs the same two things together: *A good name is better than precious ointment* (Ecclesiastes 7:1). The Beloved''s name is the more precious fragrance, and it is loved. This is fulfilled forward in the name the Father bestows upon the Formed Son: *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name: That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:9-10). The name the virgins love now is the name before which all creation shall bow — given by the Father, poured forth like ointment, the Bridegroom''s name beloved.',
       sv.verse_id, ev.verse_id, 'free', 39301
  FROM _s322_song01_lookup sv, _s322_song01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-1-i-am-black-but-comely-the-afflicted-bride-still-fair-to-the-beloved',
       E'"I am black, but comely" — the afflicted bride still fair to the Beloved',
       E'The bride owns her hard estate without flinching, and yet claims her beauty: *I am black, but comely, O ye daughters of Jerusalem, as the tents of Kedar, as the curtains of Solomon* (Song of Solomon 1:5). She tells how the darkness came: *Look not upon me, because I am black, because the sun hath looked upon me: my mother''s children were angry with me; they made me the keeper of the vineyards; but mine own vineyard have I not kept* (Song of Solomon 1:6). This is the covenant-love that beholds the bride lovely despite her affliction: the sun-scorched, hard-used, scattered wife — her own vineyard unkept — is comely still in the Beloved''s eyes. The prophet names her plainly: *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5) — the afflicted, widowed-seeming wife is not cast off but espoused and redeemed. And her comeliness is not her own keeping but His love that washes her: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it... That he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish* (Ephesians 5:25,27). The bride is Yashar''el (Israel) restored — both houses gathered, never replaced — black with the marks of exile, comely with the love of her Husband.',
       sv.verse_id, ev.verse_id, 'free', 39302
  FROM _s322_song01_lookup sv, _s322_song01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-1-where-thou-feedest-thy-flock-the-beloved-is-the-shepherd',
       E'"Where thou feedest thy flock" — the Beloved is the Shepherd',
       E'The bride seeks her Beloved not in a palace but at the head of his flock, as a shepherd to be followed: *Tell me, O thou whom my soul loveth, where thou feedest, where thou makest thy flock to rest at noon: for why should I be as one that turneth aside by the flocks of thy companions?* (Song of Solomon 1:7). The One whom her soul loveth is the Shepherd, and the whole canon names Him so. The Psalm sings it: *Yahuah Ra''ah (The LORD is my shepherd); I shall not want. He maketh me to lie down in green pastures: he leadeth me beside the still waters* (Psalm 23:1-2) — the very noonday rest the bride seeks is the Shepherd''s own gift. The prophet promises it to the scattered: *I will feed my flock, and I will cause them to lie down, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 34:15) — the lost sheep of Yashar''el (Israel) gathered and fed by their own Beloved. And the Formed Son fills it: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). The Beloved the bride loves is the Shepherd who lays down His life for her — sought, found, and followed beside His flock.',
       sv.verse_id, ev.verse_id, 'free', 39303
  FROM _s322_song01_lookup sv, _s322_song01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-1-a-bundle-of-myrrh-is-my-wellbeloved-the-marriage-covenant-of-love',
       E'"A bundle of myrrh is my wellbeloved" — the marriage-covenant of love',
       E'The bride keeps her Beloved near as a fragrance worn over the heart, and the delight runs both ways: *While the king sitteth at his table, my spikenard sendeth forth the smell thereof. A bundle of myrrh is my wellbeloved unto me... My beloved is unto me as a cluster of camphire in the vineyards of En-gedi* (Song of Solomon 1:12-14). Then His voice answers hers: *Behold, thou art fair, my love; behold, thou art fair; thou hast doves'' eyes. Behold, thou art fair, my beloved, yea, pleasant: also our bed is green* (Song of Solomon 1:15-16). This mutual delight is the very betrothal Yahuah swears to His people: *And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies. I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:19-20). It is the first-love Yahuah remembers: *the love of thine espousals, when thou wentest after me in the wilderness* (Jeremiah 2:2). And it reaches its consummation forward at the wedding the whole canon sings toward: *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7), when *new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The green-bowered chamber of the Song is the figure of that everlasting dwelling — the Bridegroom and His bride, Yashar''el (Israel) restored, joined for ever.',
       sv.verse_id, ev.verse_id, 'free', 39304
  FROM _s322_song01_lookup sv, _s322_song01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1: draw me, we will run after thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*with lovingkindness have I drawn thee* (Jeremiah 31:3) — the Beloved draws first, with everlasting love.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-draw-me-we-will-run-after-thee-the-king-drew-his-bride-with-lovingkindness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I drew them with cords of a man, with bands of love* (Hosea 11:4) — the gentle covenant-pull, not by force.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-draw-me-we-will-run-after-thee-the-king-drew-his-bride-with-lovingkindness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*except the Father which hath sent me draw him* (John 6:44) — the Father draws to the Son; the running follows the drawing.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-draw-me-we-will-run-after-thee-the-king-drew-his-bride-with-lovingkindness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*She shall be brought unto the king in raiment of needlework* (Psalm 45:14) — the wedding-song of the bride brought in.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-draw-me-we-will-run-after-thee-the-king-drew-his-bride-with-lovingkindness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*With gladness and rejoicing shall they be brought: they shall enter into the king''s palace* (Psalm 45:15) — the joy of entering the King''s chambers.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-draw-me-we-will-run-after-thee-the-king-drew-his-bride-with-lovingkindness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: thy name is as ointment poured forth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A good name is better than precious ointment* (Ecclesiastes 7:1) — the wisdom of Solomon weighs the name above the oil.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-thy-name-is-as-ointment-poured-forth-the-name-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a name which is above every name* (Philippians 2:9) — the Father bestows the name beloved.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-thy-name-is-as-ointment-poured-forth-the-name-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*at the name of Yahusha (Jesus) every knee should bow* (Philippians 2:10) — the name the virgins love, before which all bow.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-thy-name-is-as-ointment-poured-forth-the-name-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: I am black, but comely
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thy Maker is thine husband* (Isaiah 54:5) — the afflicted wife still espoused, comely to her Redeemer (on v.5).'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-i-am-black-but-comely-the-afflicted-bride-still-fair-to-the-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thy Maker is thine husband* (Isaiah 54:5) — the sun-darkened bride redeemed, the covenant standing (on v.6).'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-i-am-black-but-comely-the-afflicted-bride-still-fair-to-the-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a glorious church, not having spot, or wrinkle... holy and without blemish* (Ephesians 5:27) — comely by the love that washes her.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-i-am-black-but-comely-the-afflicted-bride-still-fair-to-the-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*loved the church, and gave himself for it* (Ephesians 5:25) — the Bridegroom''s self-giving holds the unkept vineyard-keeper.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-i-am-black-but-comely-the-afflicted-bride-still-fair-to-the-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: where thou feedest thy flock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1) — the One the soul loveth is the Shepherd.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-where-thou-feedest-thy-flock-the-beloved-is-the-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He maketh me to lie down in green pastures* (Psalm 23:2) — the noonday rest the bride seeks is the Shepherd''s gift.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-where-thou-feedest-thy-flock-the-beloved-is-the-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will feed my flock, and I will cause them to lie down* (Ezekiel 34:15) — the scattered flock of Yashar''el (Israel) fed by her Beloved.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-where-thou-feedest-thy-flock-the-beloved-is-the-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — the Beloved-Shepherd who lays down His life.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-where-thou-feedest-thy-flock-the-beloved-is-the-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: a bundle of myrrh is my wellbeloved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will betroth thee unto me for ever... in lovingkindness, and in mercies* (Hosea 2:19) — the everlasting betrothal worn near the heart.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-a-bundle-of-myrrh-is-my-wellbeloved-the-marriage-covenant-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20) — the bride knows her faithful Husband.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-a-bundle-of-myrrh-is-my-wellbeloved-the-marriage-covenant-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the love of thine espousals, when thou wentest after me in the wilderness* (Jeremiah 2:2) — the first-love Yahuah remembers, the bride fair to Him.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-a-bundle-of-myrrh-is-my-wellbeloved-the-marriage-covenant-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the wedding the whole canon sings toward.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-a-bundle-of-myrrh-is-my-wellbeloved-the-marriage-covenant-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*prepared as a bride adorned for her husband* (Revelation 21:2) — Yashar''el (Israel) restored, the marriage made everlasting.'
  FROM cross_reference_threads t
  JOIN _s322_song01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s322_song01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-1-a-bundle-of-myrrh-is-my-wellbeloved-the-marriage-covenant-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_song-of-solomon_2.sql (Song of Solomon 2) -----
-- Book: Song of Solomon, chapter 2 | tag: song02 | session: s322
-- Reading frame: covenant-love between the Beloved (Messiah the Bridegroom, the Formed Son
--   who HAS a Father — Ps 45 the King) and the bride (his people, Yashar'el restored, BOTH
--   houses — NOT a new people, Rom 11:1-2 anti-replacement guard). Reverent covenant-love
--   allegory throughout; never eroticized. The verses of mutual desire (2:5-6) are the
--   covenant-bond's tenderness, framed only as the love that holds the bond, not exploited.
-- sort_order band: 39325 + 1 per thread (39325..39329)
--
-- Song 2 coverage:
--   v.1-2  rose of Sharon / lily among thorns
--          NT:     none warranted (the lateral Tanakh blossoming-imagery carries it)
--          Extras: none warranted
--          Tanakh: Isaiah 35:1-2 (desert blossom as the rose), Hosea 14:5 (he shall grow as the lily) -> thread 1
--   v.3    apple tree / I sat down under his shadow
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Psalm 91:1 (under the shadow of the Almighty), Psalm 17:8 (shadow of thy wings),
--                  Hosea 14:7 (they that dwell under his shadow shall return) -> thread 2
--   v.4    banqueting house / his banner over me was love
--          NT:     Revelation 19:9 (marriage supper of the Lamb), Matthew 22:2 (king made a marriage) -> thread 3
--          Extras: none warranted
--          Tanakh: Exodus 17:15 (Yahuah Nissi, the banner), Psalm 60:4 (a banner... displayed for truth),
--                  Psalm 23:5 (thou preparest a table) -> thread 3
--   v.5-6  stay me with flagons / his left hand under my head
--          NT/Extras/Tanakh: none warranted (the tenderness of the bond, held within threads 3 & 5; reverent, not threaded alone)
--   v.7    charge you... stir not up my love till he please
--          NT/Extras/Tanakh: none warranted (the refrain; love not forced — folded into the call-of-restoration frame)
--   v.8-9  voice of my beloved! he cometh leaping upon the mountains
--          NT/Extras/Tanakh: none warranted (sets up the call; carried by thread 4)
--   v.10-13 rise up my love, the winter is past, come away (the call into the new season)
--          NT:     none warranted (the Tanakh restoration-imagery is the heart of it; kept inside the canon to avoid over-weave)
--          Extras: none warranted
--          Tanakh: Isaiah 35:10 (the ransomed shall return with songs), Hosea 14:7 (revive as the corn),
--                  Isaiah 54:6 (a woman forsaken... called again), Hosea 2:14 (I will allure her... speak comfortably) -> thread 4
--   v.14-15 dove in the clefts / take the little foxes
--          NT/Extras/Tanakh: none warranted (imagery within the call; no distinct framework weave)
--   v.16   my beloved is mine, and I am his
--          NT:     Ephesians 5:31-32 (one flesh... Messiah and the church), Revelation 19:7 (the marriage of the Lamb) -> thread 5
--          Extras: none warranted
--          Tanakh: Song 6:3 (parallel formula); Hosea 2:23 (Thou art my people... Thou art my Elohim),
--                  Jeremiah 31:33 (will be their Elohim, they my people), Ezekiel 37:27 (I will be their Elohim, they my people) -> thread 5
--   v.17   until the day break... turn, my beloved
--          NT/Extras/Tanakh: none warranted (closing refrain; folded into the belonging frame)
--
-- THREADS (5):
--   1 song-of-solomon-2-the-rose-of-sharon-the-lily-among-thorns        [free]  Tanakh
--   2 song-of-solomon-2-i-sat-down-under-his-shadow                     [free]  Tanakh
--   3 song-of-solomon-2-his-banner-over-me-was-love                     [free]  Tanakh + NT
--   4 song-of-solomon-2-rise-up-my-love-the-winter-is-past             [free]  Tanakh
--   5 song-of-solomon-2-my-beloved-is-mine-and-i-am-his                 [free]  Tanakh + NT

CREATE TEMP VIEW _s322_song02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the rose of Sharon, the lily among thorns
    ('canon','song-of-solomon',2,1,'canon','isaiah',35,1,'free',
     E'*The wilderness and the solitary place shall be glad for them; and the desert shall rejoice, and blossom as the rose.* (Isaiah 35:1) The bride sings *I am the rose of Sharon, and the lily of the valleys* (Song 2:1), and Isaiah names the very flower of the wasteland made glad — Yashar''el (Israel) restored is the desert blossoming under the Beloved''s care, the same Sharon that *shall see the glory of Yahuah (LORD)* (Isaiah 35:2).'),
    ('canon','song-of-solomon',2,1,'canon','isaiah',35,2,'free',
     E'*It shall blossom abundantly, and rejoice even with joy and singing: the glory of Lebanon shall be given unto it, the excellency of Carmel and Sharon, they shall see the glory of Yahuah (LORD), and the excellency of our Elohim (God).* (Isaiah 35:2) Sharon is named outright: the bride who is *the rose of Sharon* (Song 2:1) is the restored land and people whose blossoming ends in beholding *the glory of Yahuah (LORD).*'),
    ('canon','song-of-solomon',2,1,'canon','hosea',14,5,'free',
     E'*I will be as the dew unto Yashar''el (Israel): he shall grow as the lily, and cast forth his roots as Lebanon.* (Hosea 14:5) The bride is *the lily of the valleys* (Song 2:1); Hosea makes the lily the very figure of Yashar''el (Israel) healed and growing under Yahuah''s reviving dew — the covenant-people blooming, not a new people.'),
    ('canon','song-of-solomon',2,2,'canon','hosea',14,5,'free',
     E'*I will be as the dew unto Yashar''el (Israel): he shall grow as the lily, and cast forth his roots as Lebanon.* (Hosea 14:5) *As the lily among thorns, so is my love among the daughters* (Song 2:2): the Beloved sees his bride as the one lily Hosea promises — Yashar''el (Israel) made to grow as the lily, set apart and tender amid the thorns of the nations.'),
    -- Thread 2: I sat down under his shadow
    ('canon','song-of-solomon',2,3,'canon','psalms',91,1,'free',
     E'*He that dwelleth in the secret place of the El Elyon (most High) shall abide under the shadow of the Almighty.* (Psalm 91:1) *I sat down under his shadow with great delight* (Song 2:3): to rest under the Beloved''s shadow is to abide *under the shadow of the Almighty* — the bride sheltered in the Bridegroom who is Yahuah and has a Father.'),
    ('canon','song-of-solomon',2,3,'canon','psalms',17,8,'free',
     E'*Keep me as the apple of the eye, hide me under the shadow of thy wings,* (Psalm 17:8) The bride sits *under his shadow with great delight* (Song 2:3); David asks the same shelter — to be hidden *under the shadow of thy wings* — the covenant-love that covers his own.'),
    ('canon','song-of-solomon',2,3,'canon','hosea',14,7,'free',
     E'*They that dwell under his shadow shall return; they shall revive as the corn, and grow as the vine: the scent thereof shall be as the wine of Lebanon.* (Hosea 14:7) Song''s *I sat down under his shadow* (Song 2:3) is Hosea''s promise: *they that dwell under his shadow shall return* — the gathering of the scattered into the Beloved''s shade, revived as the vine.'),
    -- Thread 3: his banner over me was love
    ('canon','song-of-solomon',2,4,'canon','exodus',17,15,'free',
     E'*And Moses built an altar, and called the name of it Yahuah Nissi (Jehovah-nissi):* (Exodus 17:15) *his banner over me was love* (Song 2:4): the name Moses gave the altar means "Yahuah my banner." The standard raised over the bride is the same banner Yahuah set over Yashar''el (Israel) in the wilderness — now its meaning is love.'),
    ('canon','song-of-solomon',2,4,'canon','psalms',60,4,'free',
     E'*Thou hast given a banner to them that fear thee, that it may be displayed because of the truth. Selah.* (Psalm 60:4) The Beloved''s *banner over me was love* (Song 2:4) is the banner Yahuah gives *to them that fear thee* — the standard of covenant-truth lifted over his own, here unfurled as love over the bride.'),
    ('canon','song-of-solomon',2,4,'canon','psalms',23,5,'free',
     E'*Thou preparest a table before me in the presence of mine enemies: thou anointest my head with oil; my cup runneth over.* (Psalm 23:5) *He brought me to the banqueting house* (Song 2:4): the Bridegroom who is the Shepherd spreads the table; the house of wine is the table prepared by the One who leads his flock and his bride alike.'),
    ('canon','song-of-solomon',2,4,'canon','revelation',19,9,'free',
     E'*And he saith unto me, Write, Blessed are they which are called unto the marriage supper of the Lamb. And he saith unto me, These are the true sayings of Elohim (God).* (Revelation 19:9) The *banqueting house* (Song 2:4) opens forward to its consummation: *the marriage supper of the Lamb* — the bride at last brought into the house of wine, the banner of love over the wedding feast.'),
    ('canon','song-of-solomon',2,4,'canon','matthew',22,2,'free',
     E'*The kingdom of heaven is like unto a certain king, which made a marriage for his son,* (Matthew 22:2) The Beloved who *brought me to the banqueting house* (Song 2:4) is the king''s son for whom the marriage is made — the Formed Son with a Father, the Bridegroom whose wedding feast is the kingdom.'),
    -- Thread 4: rise up my love, the winter is past
    ('canon','song-of-solomon',2,10,'canon','hosea',2,14,'free',
     E'*Therefore, behold, I will allure her, and bring her into the wilderness, and speak comfortably unto her.* (Hosea 2:14) *Rise up, my love, my fair one, and come away* (Song 2:10): the call to come away is Yahuah''s wooing of Yashar''el (Israel) — to *allure her* and *speak comfortably*, the betrothal renewed, not a new bride taken.'),
    ('canon','song-of-solomon',2,11,'canon','isaiah',35,10,'free',
     E'*And the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.* (Isaiah 35:10) *The winter is past, the rain is over and gone* (Song 2:11): the turning of the season is the turning of exile — *sorrow and sighing shall flee away* as the ransomed return with songs to the Beloved''s call.'),
    ('canon','song-of-solomon',2,13,'canon','hosea',14,7,'free',
     E'*They that dwell under his shadow shall return; they shall revive as the corn, and grow as the vine: the scent thereof shall be as the wine of Lebanon.* (Hosea 14:7) *The fig tree putteth forth her green figs, and the vines with the tender grape give a good smell* (Song 2:13): the springtime fruiting is Hosea''s revival — the vine reviving, the good smell, Yashar''el (Israel) grown again under the Beloved.'),
    ('canon','song-of-solomon',2,10,'canon','isaiah',54,6,'free',
     E'*For Yahuah (LORD) hath called thee as a woman forsaken and grieved in spirit, and a wife of youth, when thou wast refused, saith thy Elohim (God).* (Isaiah 54:6) *Rise up, my love... and come away* (Song 2:10): the bride called away is the *wife of youth* once *forsaken* and now called again — the same restoration-marriage, the divorced northern house gathered home.'),
    -- Thread 5: my beloved is mine, and I am his
    ('canon','song-of-solomon',2,16,'canon','song-of-solomon',6,3,'free',
     E'*I am my beloved''s, and my beloved is mine: he feedeth among the lilies.* (Song 6:3) Song''s own refrain repeats the covenant-belonging formula of *My beloved is mine, and I am his* (Song 2:16) — the mutual possession sung twice, the bond the whole book turns on.'),
    ('canon','song-of-solomon',2,16,'canon','hosea',2,23,'free',
     E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23) *My beloved is mine, and I am his* (Song 2:16) is the very formula the prophets sing over the two houses: *Thou art my people... Thou art my Elohim* — Lo-Ammi made Ammi, the not-my-people made his again.'),
    ('canon','song-of-solomon',2,16,'canon','jeremiah',31,33,'free',
     E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33) The belonging of *My beloved is mine, and I am his* (Song 2:16) is the new covenant''s own seal — *will be their Elohim, and they shall be my people* — the Torah written on the heart, the bond made inward.'),
    ('canon','song-of-solomon',2,16,'canon','ezekiel',37,27,'free',
     E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people.* (Ezekiel 37:27) *My beloved is mine, and I am his* (Song 2:16): Ezekiel sets the same formula over the two sticks made one — *I will be their Elohim, and they shall be my people* — the covenant-belonging of the regathered house of Yashar''el (Israel) and house of Yahudah (Judah).'),
    ('canon','song-of-solomon',2,16,'canon','ephesians',5,32,'free',
     E'*This is a great mystery: but I speak concerning Messiah (Christ) and the church.* (Ephesians 5:32) The mutual *My beloved is mine, and I am his* (Song 2:16) is read forward to the marriage of *Messiah (Christ) and the church* — the bride being his people, Yashar''el (Israel) restored, joined to the Bridegroom as one.'),
    ('canon','song-of-solomon',2,16,'canon','revelation',19,7,'free',
     E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready.* (Revelation 19:7) The belonging of *My beloved is mine, and I am his* (Song 2:16) finds its consummation in *the marriage of the Lamb* — the bride at last made ready, the covenant-love sealed forever.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s322_song02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s322_song02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-2-the-rose-of-sharon-the-lily-among-thorns',
       E'The Rose of Sharon, the Lily Among Thorns',
       E'The bride opens her song: *I am the rose of Sharon, and the lily of the valleys* (Song of Solomon 2:1), and the Beloved answers, *As the lily among thorns, so is my love among the daughters* (Song of Solomon 2:2). Read in covenant-love, the bride is Yashar''el (Israel) restored — and the very flowers she names are the prophets'' figures for that restoration. Isaiah sees the wasteland made glad: *the desert shall rejoice, and blossom as the rose* (Isaiah 35:1), and names the place outright — *the excellency of Carmel and Sharon, they shall see the glory of Yahuah (LORD)* (Isaiah 35:2). Hosea makes the lily the very emblem of the healed people: *I will be as the dew unto Yashar''el (Israel): he shall grow as the lily, and cast forth his roots as Lebanon* (Hosea 14:5). The bride is no new people but the covenant-people blooming — the lily set apart and tender among the thorns of the nations.',
       sv.verse_id, ev.verse_id, 'free', 39325
  FROM _s322_song02_lookup sv, _s322_song02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-2-i-sat-down-under-his-shadow',
       E'I Sat Down Under His Shadow With Great Delight',
       E'*As the apple tree among the trees of the wood, so is my beloved among the sons. I sat down under his shadow with great delight, and his fruit was sweet to my taste* (Song of Solomon 2:3). To rest under the Beloved''s shadow is the covenant-shelter the Psalms and the prophets sing. David: *He that dwelleth in the secret place of the El Elyon (most High) shall abide under the shadow of the Almighty* (Psalm 91:1) — the bride sheltered in the Bridegroom who is Yahuah and has a Father. Again: *Keep me as the apple of the eye, hide me under the shadow of thy wings* (Psalm 17:8). And Hosea makes the shadow the very place of the gathering: *They that dwell under his shadow shall return; they shall revive as the corn, and grow as the vine* (Hosea 14:7). The scattered come home into the Beloved''s shade, revived as the vine — covenant-love that covers his own.',
       sv.verse_id, ev.verse_id, 'free', 39326
  FROM _s322_song02_lookup sv, _s322_song02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-2-his-banner-over-me-was-love',
       E'He Brought Me to the Banqueting House, His Banner Over Me Was Love',
       E'*He brought me to the banqueting house, and his banner over me was love* (Song of Solomon 2:4). The standard raised over the bride is the same banner Yahuah set over Yashar''el (Israel) in the wilderness: *And Moses built an altar, and called the name of it Yahuah Nissi (Jehovah-nissi)* (Exodus 17:15) — "Yahuah my banner" — and *Thou hast given a banner to them that fear thee, that it may be displayed because of the truth* (Psalm 60:4). Now that standard of covenant-truth is unfurled as love. The house of wine is the table the Shepherd-Bridegroom spreads: *Thou preparest a table before me in the presence of mine enemies; thou anointest my head with oil; my cup runneth over* (Psalm 23:5). And the banqueting house opens forward to its consummation — the king *which made a marriage for his son* (Matthew 22:2), and the summons, *Blessed are they which are called unto the marriage supper of the Lamb* (Revelation 19:9). The Bridegroom is the Formed Son with a Father, and his banner over his people is love.',
       sv.verse_id, ev.verse_id, 'free', 39327
  FROM _s322_song02_lookup sv, _s322_song02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-2-rise-up-my-love-the-winter-is-past',
       E'Rise Up, My Love — the Winter Is Past, Come Away',
       E'*My beloved spake, and said unto me, Rise up, my love, my fair one, and come away. For, lo, the winter is past, the rain is over and gone; The flowers appear on the earth... the fig tree putteth forth her green figs, and the vines with the tender grape give a good smell* (Song of Solomon 2:10-13). The Bridegroom''s call into the new season is the call out of exile into restoration. It is Yahuah''s own wooing of Yashar''el (Israel): *I will allure her, and bring her into the wilderness, and speak comfortably unto her* (Hosea 2:14) — and his calling-back of the once-divorced wife: *Yahuah (LORD) hath called thee as a woman forsaken and grieved in spirit, and a wife of youth, when thou wast refused* (Isaiah 54:6). The turning of the season is the turning of captivity: *the ransomed of Yahuah (LORD) shall return, and come to Zion with songs... and sorrow and sighing shall flee away* (Isaiah 35:10). And the springtime fruiting is Hosea''s revival: *they shall revive as the corn, and grow as the vine* (Hosea 14:7). The winter past is the exile ended; the call to come away gathers both houses home.',
       sv.verse_id, ev.verse_id, 'free', 39328
  FROM _s322_song02_lookup sv, _s322_song02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-2-my-beloved-is-mine-and-i-am-his',
       E'My Beloved Is Mine, and I Am His — the Covenant-Belonging',
       E'*My beloved is mine, and I am his: he feedeth among the lilies* (Song of Solomon 2:16). This is the covenant-belonging formula the whole library sings, repeated in Song''s own refrain — *I am my beloved''s, and my beloved is mine* (Song 6:3) — and answered word for word by the prophets over the two houses. Hosea: *I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23) — Lo-Ammi made Ammi. Jeremiah seals it in the new covenant, the Torah written within: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Ezekiel sets it over the two sticks made one: *I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27). Read forward, it is *a great mystery... concerning Messiah (Christ) and the church* (Ephesians 5:32), consummated at last in *the marriage of the Lamb... and his wife hath made herself ready* (Revelation 19:7). The bride is his people — Yashar''el (Israel) restored, both houses gathered — and the bond is mutual, sealed, and inward.',
       sv.verse_id, ev.verse_id, 'free', 39329
  FROM _s322_song02_lookup sv, _s322_song02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the desert shall rejoice, and blossom as the rose* (Isaiah 35:1) — the wasteland made glad is the bride who is *the rose of Sharon* (Song 2:1).'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-the-rose-of-sharon-the-lily-among-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the excellency of Carmel and Sharon, they shall see the glory of Yahuah (LORD)* (Isaiah 35:2) — Sharon named outright, the bride''s blossoming ending in the glory of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-the-rose-of-sharon-the-lily-among-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he shall grow as the lily* (Hosea 14:5) — the lily of the valleys is Yashar''el (Israel) reviving under Yahuah''s dew.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-the-rose-of-sharon-the-lily-among-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he shall grow as the lily* (Hosea 14:5) — *the lily among thorns* (Song 2:2) is the covenant-people grown as the lily, set apart amid the nations.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-the-rose-of-sharon-the-lily-among-thorns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*under the shadow of the Almighty* (Psalm 91:1) — to sit *under his shadow* (Song 2:3) is to abide in the El Elyon (most High).'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-i-sat-down-under-his-shadow'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*hide me under the shadow of thy wings* (Psalm 17:8) — the same covenant-shelter the bride finds under the Beloved.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=17 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-i-sat-down-under-his-shadow'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*They that dwell under his shadow shall return* (Hosea 14:7) — the gathering of the scattered into the Beloved''s shade.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-i-sat-down-under-his-shadow'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah Nissi (Jehovah-nissi)* (Exodus 17:15) — "Yahuah my banner," the standard set over Yashar''el, now unfurled as love.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-his-banner-over-me-was-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou hast given a banner to them that fear thee* (Psalm 60:4) — the banner of covenant-truth lifted over his own.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=60 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-his-banner-over-me-was-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou preparest a table before me* (Psalm 23:5) — the banqueting house is the table the Shepherd-Bridegroom spreads.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-his-banner-over-me-was-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Blessed are they which are called unto the marriage supper of the Lamb* (Revelation 19:9) — the banqueting house''s consummation.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-his-banner-over-me-was-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a certain king, which made a marriage for his son* (Matthew 22:2) — the Bridegroom is the king''s son, the Formed Son with a Father.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-his-banner-over-me-was-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will allure her... and speak comfortably unto her* (Hosea 2:14) — the call to *come away* (Song 2:10) is Yahuah''s wooing of Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-rise-up-my-love-the-winter-is-past'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a wife of youth, when thou wast refused* (Isaiah 54:6) — the bride called away is the once-forsaken wife called home.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-rise-up-my-love-the-winter-is-past'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the ransomed of Yahuah (LORD) shall return... and sorrow and sighing shall flee away* (Isaiah 35:10) — *the winter is past* (Song 2:11) is exile ended.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-rise-up-my-love-the-winter-is-past'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they shall revive as the corn, and grow as the vine* (Hosea 14:7) — the springtime fruiting of *the tender grape* (Song 2:13) is Hosea''s revival.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-rise-up-my-love-the-winter-is-past'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I am my beloved''s, and my beloved is mine* (Song 6:3) — Song''s own refrain repeats the belonging formula.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='song-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-my-beloved-is-mine-and-i-am-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will say to them which were not my people, Thou art my people* (Hosea 2:23) — Lo-Ammi made Ammi, the covenant-belonging restored.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-my-beloved-is-mine-and-i-am-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*will be their Elohim (God), and they shall be my people* (Jeremiah 31:33) — the new covenant''s seal, the Torah written within.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-my-beloved-is-mine-and-i-am-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27) — the formula over the two sticks made one.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-my-beloved-is-mine-and-i-am-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:32) — the belonging read forward to the Bridegroom and his people.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-my-beloved-is-mine-and-i-am-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the covenant-belonging consummated.'
  FROM cross_reference_threads t
  JOIN _s322_song02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s322_song02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-2-my-beloved-is-mine-and-i-am-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_song-of-solomon_3.sql (Song of Solomon 3) -----
-- Book: Song of Solomon  Chapter: 3   Source book_slug=song-of-solomon (edition canon)
-- TAG: song03   session prefix s322   temp view _s322_song03_lookup
-- sort_order band start 39350 (+1 per thread): 39350,39351,39352,39353
-- READING FRAME: covenant-love allegory — the Beloved = Messiah the Bridegroom/King
--   (the Formed Son who HAS a Father, Ps 45); the bride = his people Yashar'el (Israel)
--   restored, both houses (NOT a new people — Rom 11:1-2 guard). REVERENT throughout;
--   the night-longing of 3:1-4 is read as wholehearted seeking-love, never eroticized.
--
-- Song 3 coverage:
--   v.1-4  seeking him whom my soul loveth, by night, in the city, till found and held
--          NT:     John 20:15-16 (Mary seeking at the tomb — reverent)            [used]
--          Extras: none warranted
--          Tanakh: Jer 29:13, Deut 4:29, Prov 8:17, Isa 55:6 (seek-and-find)      [used]
--   v.5    I charge you... stir not up, nor awake my love, till he please (the refrain)
--          NT:     Eph 5:25,32 (Messiah and the bride)                            [used]
--          Extras: none warranted
--          Tanakh: Hosea 2:19-20, Isa 54:5 (the betrothal covenant)               [used]
--   v.6    Who is this that cometh out of the wilderness like pillars of smoke
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Song 8:5 (lateral, comes up from wilderness), Exod 13:21 (pillar) [used]
--   v.7-11 King Solomon's procession, the crown of his espousals, the day of gladness
--          NT:     Rev 19:7,9,11,16 (marriage of the Lamb / the King comes), Matt 25:1,6 [used]
--          Extras: none warranted
--          Tanakh: Ps 45:6,8,11 (the King's wedding), Isa 62:5 (Elohim rejoices over bride) [used]
--
-- THREADS:
--   1 song-of-solomon-3-i-sought-him-whom-my-soul-loveth-till-i-found-him  [free]  Tanakh+NT
--   2 song-of-solomon-3-stir-not-up-nor-awake-my-love-the-betrothal-covenant [free] Tanakh+NT
--   3 song-of-solomon-3-who-is-this-that-cometh-out-of-the-wilderness        [free] Tanakh
--   4 song-of-solomon-3-the-king-with-the-crown-in-the-day-of-his-espousals  [free] Tanakh+NT
--
-- Framework-load-bearing framing:
--   3:1-4 night-longing handled as the covenant's wholehearted seeking (Jer 29:13/Deut 4:29),
--         the bride who will not let him go = the lost-sheep who finds the Bridegroom; the
--         empty-tomb seeking (John 20) woven reverently, NOT eroticized.
--   3:11 the espousal-day King = the royal Bridegroom (Messiah, Ps 45 — anointed BY his Elohim,
--         a Formed Son who has a Father, NOT a co-equal person), coming for his bride (Rev 19),
--         his Elohim/Father rejoicing over her (Isa 62:5).
--   bride = Yashar'el restored throughout (both houses), never a new people replacing her.

CREATE TEMP VIEW _s322_song03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================= cross_references =============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: seeking him whom my soul loveth, till found and held (3:1-4)
    ('canon','song-of-solomon',3,1,'canon','jeremiah',29,13,'free',
     E'*And ye shall seek me, and find me, when ye shall search for me with all your heart.* (Jeremiah 29:13). The bride''s night-cry — *I sought him whom my soul loveth: I sought him, but I found him not* (Song 3:1) — is the very seeking the covenant rewards: him whom the soul loves is found by the one who searches with the whole heart, never the half-hearted.'),
    ('canon','song-of-solomon',3,2,'canon','deuteronomy',4,29,'free',
     E'*But if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul.* (Deuteronomy 4:29). The bride who will *rise now, and go about the city in the streets... I will seek him whom my soul loveth* (Song 3:2) walks out the Torah''s own promise — even from the place of scattering, the whole-souled seeker finds him.'),
    ('canon','song-of-solomon',3,4,'canon','proverbs',8,17,'free',
     E'*I love them that love me; and those that seek me early shall find me.* (Proverbs 8:17). The Wisdom-Son answers the bride who *found him whom my soul loveth: I held him, and would not let him go* (Song 3:4) — the love that seeks is the love that is met and not let go.'),
    ('canon','song-of-solomon',3,4,'canon','isaiah',55,6,'free',
     E'*Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). The bride''s persistence — *I held him, and would not let him go* (Song 3:4) — is the prophet''s urgency made tender: he may be found, and the one who finds him clings.'),
    ('canon','song-of-solomon',3,4,'canon','john',20,15,'free',
     E'*Yahusha (Jesus) saith unto her, Woman, why weepest thou? whom seekest thou? She, supposing him to be the gardener... I will take him away.* (John 20:15). At the empty tomb the seeking bride of the Song is answered in the flesh — Miryam seeking the Beloved she will not leave, *I found him whom my soul loveth: I held him, and would not let him go* (Song 3:4).'),
    ('canon','song-of-solomon',3,4,'canon','john',20,16,'free',
     E'*Yahusha (Jesus) saith unto her, Mary. She turned herself, and saith unto him, Rabboni; which is to say, Master.* (John 20:16). The Beloved names the seeker and she holds fast — the Song''s *I held him, and would not let him go* (Song 3:4) fulfilled at the garden, the risen Bridegroom found by the one who would not stop seeking.'),

    -- Thread 2: stir not up, nor awake my love (3:5) — the betrothal covenant
    ('canon','song-of-solomon',3,5,'canon','hosea',2,19,'free',
     E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies.* (Hosea 2:19). The charge — *that ye stir not up, nor awake my love, till he please* (Song 3:5) — guards a love that is covenant, not impulse: Yahuah''s everlasting betrothal of Yashar''el (Israel), love kept until its appointed waking.'),
    ('canon','song-of-solomon',3,5,'canon','hosea',2,20,'free',
     E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD).* (Hosea 2:20). The love not to be awakened *till he please* (Song 3:5) is the faithful betrothal of the scattered house brought home — restored Yashar''el (Israel) made to know her Husband.'),
    ('canon','song-of-solomon',3,5,'canon','isaiah',54,5,'free',
     E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). The Beloved whose love must not be stirred before its time *till he please* (Song 3:5) is the Maker-Husband himself — the bride is no new people but his own Yashar''el (Israel), Maker and Redeemer.'),
    ('canon','song-of-solomon',3,5,'canon','ephesians',5,25,'free',
     E'*Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). The patient, covenant love the daughters are charged not to awake before its hour *till he please* (Song 3:5) is the Bridegroom''s self-giving love — the great mystery of Messiah and his bride.'),
    ('canon','song-of-solomon',3,5,'canon','ephesians',5,32,'free',
     E'*This is a great mystery: but I speak concerning Messiah (Christ) and the church.* (Ephesians 5:32). The Song''s guarded love *till he please* (Song 3:5) is itself the mystery Paul names — the whole allegory of Beloved and bride read as Messiah and his redeemed Yashar''el (Israel).'),

    -- Thread 3: Who is this that cometh out of the wilderness (3:6)
    ('canon','song-of-solomon',3,6,'canon','song-of-solomon',8,5,'free',
     E'*Who is this that cometh up from the wilderness, leaning upon her beloved?* (Song of Solomon 8:5). The same wonder opens here — *Who is this that cometh out of the wilderness like pillars of smoke* (Song 3:6) — the bride and her Beloved coming up together out of the wilderness, the watchers of Zion marvelling at the procession.'),
    ('canon','song-of-solomon',3,6,'canon','exodus',13,21,'free',
     E'*And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire... to go by day and night* (Exodus 13:21). The Beloved who *cometh out of the wilderness like pillars of smoke* (Song 3:6) comes as Yahuah came to lead Yashar''el (Israel) out — the wilderness pillar, the Formed Son going before his people.'),

    -- Thread 4: the King with the crown in the day of his espousals (3:7-11)
    ('canon','song-of-solomon',3,11,'canon','psalms',45,6,'free',
     E'*Thy throne, O Elohim (God), is for ever and ever: the sceptre of thy kingdom is a right sceptre.* (Psalm 45:6). The wedding-psalm of the King is the lens for *behold king Solomon with the crown wherewith his mother crowned him in the day of his espousals* (Song 3:11) — the royal Bridegroom enthroned, the espousal-day King.'),
    ('canon','song-of-solomon',3,11,'canon','psalms',45,8,'free',
     E'*All thy garments smell of myrrh, and aloes, and cassia, out of the ivory palaces, whereby they have made thee glad.* (Psalm 45:8). The King who *cometh out of the wilderness... perfumed with myrrh and frankincense* (Song 3:6) toward his espousals (Song 3:11) is the same myrrh-clad Bridegroom-King the psalm sings, robed for the day of his gladness.'),
    ('canon','song-of-solomon',3,11,'canon','psalms',45,11,'free',
     E'*So shall the king greatly desire thy beauty: for he is thy Yahuah (Lord); and worship thou him.* (Psalm 45:11). The crowned King of his espousal-day *in the day of the gladness of his heart* (Song 3:11) is the Bridegroom the psalm names thy Lord — anointed by his Elohim (Ps 45:7), a Son who has a Father, and worshipped by his bride.'),
    ('canon','song-of-solomon',3,11,'canon','isaiah',62,5,'free',
     E'*as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5). The *day of the gladness of his heart* (Song 3:11) is exactly this — the Bridegroom-Elohim rejoicing over restored Yashar''el (Israel) his bride, the espousal-day joy the prophet promised.'),
    ('canon','song-of-solomon',3,11,'canon','revelation',19,7,'free',
     E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready.* (Revelation 19:7). The procession of the crowned King *in the day of his espousals* (Song 3:11) reaches its end at the marriage of the Lamb — the Bridegroom come, the bride made ready.'),
    ('canon','song-of-solomon',3,11,'canon','revelation',19,9,'free',
     E'*Blessed are they which are called unto the marriage supper of the Lamb. And he saith unto me, These are the true sayings of Elohim (God).* (Revelation 19:9). The daughters of Zion called to *behold king Solomon with the crown* on his wedding day (Song 3:11) are called to the marriage supper of the Lamb — the espousal-feast of the true King.'),
    ('canon','song-of-solomon',3,11,'canon','revelation',19,16,'free',
     E'*And he hath on his vesture and on his thigh a name written, KING OF KINGS, AND LORD OF LORDS.* (Revelation 19:16). King Solomon''s crown of espousals (Song 3:11) foreshadows the greater King — the Bridegroom who comes wearing the name King of kings, coming for his bride.'),
    ('canon','song-of-solomon',3,11,'canon','matthew',25,6,'free',
     E'*And at midnight there was a cry made, Behold, the bridegroom cometh; go ye out to meet him.* (Matthew 25:6). The call *Go forth, O ye daughters of Zion, and behold king Solomon* on his espousal-day (Song 3:11) is the midnight cry — behold, the Bridegroom cometh; go out to meet the King.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s322_song03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s322_song03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================= threads =============================
-- Thread 1: seeking him whom my soul loveth (3:1-4)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-3-i-sought-him-whom-my-soul-loveth-till-i-found-him',
       E'I sought him whom my soul loveth, till I found him and held him',
       E'The chapter opens in the bride''s night-longing: *By night on my bed I sought him whom my soul loveth: I sought him, but I found him not* (Song 3:1). This is no idle restlessness but covenant-love that will not be satisfied apart from the Beloved — read reverently, the soul that aches for its Bridegroom. She rises and searches the city: *I will rise now, and go about the city in the streets, and in the broad ways I will seek him whom my soul loveth* (Song 3:2). This is precisely the seeking Yahuah rewards: *And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13), and the Torah''s own promise even from the place of scattering, *if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29). Wisdom answers in kind: *I love them that love me; and those that seek me early shall find me* (Proverbs 8:17); and the prophet presses, *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). The seeking ends in finding and holding: *It was but a little that I passed from them, but I found him whom my soul loveth: I held him, and would not let him go* (Song 3:4). At the empty tomb this very scene is answered in the flesh — *whom seekest thou?... Mary. She turned herself, and saith unto him, Rabboni* (John 20:15-16) — the risen Beloved found by the one who would not stop seeking, held and not let go.',
       sv.verse_id, ev.verse_id, 'free', 39350
  FROM _s322_song03_lookup sv, _s322_song03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: stir not up, nor awake my love (3:5)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-3-stir-not-up-nor-awake-my-love-the-betrothal-covenant',
       E'Stir not up, nor awake my love, till he please — the betrothal covenant',
       E'The refrain charges restraint: *I charge you, O ye daughters of Jerusalem, by the roes, and by the hinds of the field, that ye stir not up, nor awake my love, till he please* (Song 3:5). The love guarded here is covenant, not impulse — kept until its appointed hour. This is the betrothal Yahuah swears over his people: *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19), and *I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20) — the scattered house brought home and made to know her Husband. For the bride is no new people grafted in by confession but Yahuah''s own: *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). Paul names the whole allegory plainly — *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25) — *This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:32): the patient covenant love of the Bridegroom for the bride he is redeeming.',
       sv.verse_id, ev.verse_id, 'free', 39351
  FROM _s322_song03_lookup sv, _s322_song03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: Who is this that cometh out of the wilderness (3:6)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-3-who-is-this-that-cometh-out-of-the-wilderness',
       E'Who is this that cometh out of the wilderness like pillars of smoke',
       E'The watchers of Zion lift their eyes to the approaching procession: *Who is this that cometh out of the wilderness like pillars of smoke, perfumed with myrrh and frankincense, with all powders of the merchant?* (Song 3:6). The same wonder returns at the book''s climax — *Who is this that cometh up from the wilderness, leaning upon her beloved?* (Song of Solomon 8:5) — the bride and her Beloved coming up together out of the wilderness. And the wilderness with its pillar is the road Yahuah himself walked before his people: *And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night* (Exodus 13:21). The Beloved coming as pillars of smoke comes as the Formed Son once led Yashar''el (Israel) out — the same presence, going before his bride.',
       sv.verse_id, ev.verse_id, 'free', 39352
  FROM _s322_song03_lookup sv, _s322_song03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: the King with the crown in the day of his espousals (3:7-11)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-3-the-king-with-the-crown-in-the-day-of-his-espousals',
       E'Behold the King with the crown in the day of his espousals',
       E'The procession resolves into a royal wedding. The daughters are summoned: *Go forth, O ye daughters of Zion, and behold king Solomon with the crown wherewith his mother crowned him in the day of his espousals, and in the day of the gladness of his heart* (Song 3:11). The wedding-psalm of the King reads this for us — *Thy throne, O Elohim (God), is for ever and ever: the sceptre of thy kingdom is a right sceptre* (Psalm 45:6); *All thy garments smell of myrrh, and aloes, and cassia... whereby they have made thee glad* (Psalm 45:8), the very myrrh of the wilderness-procession; *So shall the king greatly desire thy beauty: for he is thy Yahuah (Lord); and worship thou him* (Psalm 45:11) — the Bridegroom-King anointed by his Elohim (Psalm 45:7), a Son who has a Father, worshipped by his bride. This is the day the prophet foretold: *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5) — joy over restored Yashar''el (Israel). And it reaches its consummation at the marriage of the Lamb: *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7); *Blessed are they which are called unto the marriage supper of the Lamb* (Revelation 19:9); the crowned King now *hath on his vesture and on his thigh a name written, KING OF KINGS, AND LORD OF LORDS* (Revelation 19:16). So the summons to behold the espousal-day King is at last the midnight cry: *Behold, the bridegroom cometh; go ye out to meet him* (Matthew 25:6).',
       sv.verse_id, ev.verse_id, 'free', 39353
  FROM _s322_song03_lookup sv, _s322_song03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ============================= thread_members =============================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (3,1,'jeremiah',29,13,1,E'*And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13) — the bride''s night-seeking is the covenant''s whole-hearted search.'),
    (3,2,'deuteronomy',4,29,2,E'*if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him* (Deuteronomy 4:29) — even from scattering the whole-souled seeker finds him.'),
    (3,4,'proverbs',8,17,3,E'*those that seek me early shall find me* (Proverbs 8:17) — the Wisdom-Son meets the love that seeks.'),
    (3,4,'isaiah',55,6,4,E'*Seek ye Yahuah (LORD) while he may be found* (Isaiah 55:6) — the urgency behind *I would not let him go*.'),
    (3,4,'john',20,15,5,E'*whom seekest thou?* (John 20:15) — the empty-tomb seeking, the Song''s scene in the flesh.'),
    (3,4,'john',20,16,6,E'*Mary... Rabboni* (John 20:16) — the risen Beloved found and held by the one who sought.')
  ) AS m(src_ch,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s322_song03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-3-i-sought-him-whom-my-soul-loveth-till-i-found-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (3,5,'hosea',2,19,1,E'*I will betroth thee unto me for ever... in righteousness, and in judgment* (Hosea 2:19) — love guarded as covenant betrothal.'),
    (3,5,'hosea',2,20,2,E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20) — the scattered house brought home.'),
    (3,5,'isaiah',54,5,3,E'*For thy Maker is thine husband* (Isaiah 54:5) — the bride is his own Yashar''el (Israel), not a new people.'),
    (3,5,'ephesians',5,25,4,E'*Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25) — the Bridegroom''s self-giving love.'),
    (3,5,'ephesians',5,32,5,E'*a great mystery... concerning Messiah (Christ) and the church* (Ephesians 5:32) — the allegory named.')
  ) AS m(src_ch,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s322_song03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-3-stir-not-up-nor-awake-my-love-the-betrothal-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (3,6,'song-of-solomon',8,5,1,E'*Who is this that cometh up from the wilderness, leaning upon her beloved?* (Song of Solomon 8:5) — the same wonder, the bride and Beloved coming up together.'),
    (3,6,'exodus',13,21,2,E'*Yahuah (LORD) went before them by day in a pillar of a cloud... by night in a pillar of fire* (Exodus 13:21) — the wilderness pillar, the Formed Son going before his people.')
  ) AS m(src_ch,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s322_song03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-3-who-is-this-that-cometh-out-of-the-wilderness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (3,11,'psalms',45,6,1,E'*Thy throne, O Elohim (God), is for ever and ever* (Psalm 45:6) — the enthroned Bridegroom-King of the wedding-psalm.'),
    (3,11,'psalms',45,8,2,E'*All thy garments smell of myrrh, and aloes, and cassia* (Psalm 45:8) — the myrrh-clad King of the procession.'),
    (3,11,'psalms',45,11,3,E'*he is thy Yahuah (Lord); and worship thou him* (Psalm 45:11) — anointed by his Elohim, a Son who has a Father, worshipped by his bride.'),
    (3,11,'isaiah',62,5,4,E'*as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5) — the day of the gladness of his heart over restored Yashar''el (Israel).'),
    (3,11,'revelation',19,7,5,E'*the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the espousal consummated.'),
    (3,11,'revelation',19,9,6,E'*Blessed are they which are called unto the marriage supper of the Lamb* (Revelation 19:9) — the daughters called to the King''s feast.'),
    (3,11,'revelation',19,16,7,E'*on his vesture and on his thigh a name written, KING OF KINGS, AND LORD OF LORDS* (Revelation 19:16) — the greater crowned King come for his bride.'),
    (3,11,'matthew',25,6,8,E'*Behold, the bridegroom cometh; go ye out to meet him* (Matthew 25:6) — the summons to behold the King as the midnight cry.')
  ) AS m(src_ch,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s322_song03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-3-the-king-with-the-crown-in-the-day-of-his-espousals'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_song-of-solomon_4.sql (Song of Solomon 4) -----
-- Book: Song of Solomon, chapter 4 — the Bridegroom (Messiah, the Formed Son who has a Father, Ps 45)
--   praises the bride (his people Yashar'el restored, both houses — Rom 11:1-2 guard, NOT a new people).
--   REVERENT covenant-love allegory; the descriptive/garden imagery handled chastely throughout.
-- Tag: song04   Session prefix: s322   Temp view: _s322_song04_lookup
-- Slug prefix: song-of-solomon-4-...   Sort band: 39375 (+1 per thread)
--
-- Song of Solomon 4 coverage:
--   v.1-5 (descriptive praise, head down — handled chastely as the Bridegroom delighting in the bride):
--        NT:     none warranted (the praise gathers into v.7 'all fair / no spot' thread)
--        Extras: none warranted
--        Tanakh: none warranted (folded into v.7 spotless-bride + v.9 delight threads)
--   v.6  (myrrh/frankincense mountain): NT none / Extras none / Tanakh none warranted
--   v.7  ('Thou art all fair... there is no spot in thee') — THE SPOTLESS BRIDE:
--        NT:     Ephesians 5:26-27, Colossians 1:22, Revelation 19:8, 2 Peter 3:14  -> thread A
--        Extras: none warranted
--        Tanakh: Ezekiel 16:9 (I washed thee... and thou wast exceeding beautiful) -> thread A
--   v.8  ('Come with me from Lebanon, my spouse') — the call / the marriage-covenant:
--        NT:     Revelation 19:7, Revelation 21:2 -> thread C
--        Extras: none warranted
--        Tanakh: Hosea 2:19 (I will betroth thee unto me for ever) -> thread C
--   v.9-10 ('Thou hast ravished my heart... how fair is thy love') — the Bridegroom's delight:
--        NT:     none warranted (the delight is filled by the Tanakh prophets quoting it forward)
--        Extras: none warranted
--        Tanakh: Isaiah 62:5, Zephaniah 3:17, Isaiah 54:5 -> thread B
--   v.11 (lips/honey/milk/garments): folded into v.9-10 delight; none separately warranted
--   v.12 ('A garden inclosed... a fountain sealed') — purity reserved for the Beloved:
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Proverbs 5:15, Proverbs 5:18, Psalm 45:11, Psalm 45:13 -> thread D
--   v.13-14 (spices/orchard): folded into v.12 enclosed-garden; none separately warranted
--   v.15 ('a well of living waters... streams from Lebanon') — the living waters:
--        NT:     John 4:14, John 7:38 -> thread E
--        Extras: none warranted
--        Tanakh: Jeremiah 2:13, Jeremiah 17:13 -> thread E
--   v.16 ('Let my beloved come into his garden') — folded into v.12/v.15 garden threads
--
-- Threads (slug -> target libraries):
--   A song-of-solomon-4-thou-art-all-fair-no-spot-in-thee-the-spotless-bride  (NT + Tanakh; free)
--   B song-of-solomon-4-thou-hast-ravished-my-heart-the-bridegroom-rejoices   (Tanakh; free)
--   C song-of-solomon-4-come-with-me-from-lebanon-the-marriage-of-the-lamb     (NT + Tanakh; free)
--   D song-of-solomon-4-a-garden-inclosed-a-fountain-sealed-reserved-for-the-beloved (Tanakh; free)
--   E song-of-solomon-4-a-well-of-living-waters-streams-from-lebanon          (NT + Tanakh; free)
--
-- Framework-load-bearing framing:
--   v.7 'no spot in thee' = the spotless bride the BRIDEGROOM HIMSELF presents holy (Eph 5:27,
--        Col 1:22) — the covenant-people sanctified by HIS cleansing love (Ezek 16:9), NOT
--        self-made flesh-merit. Rev 19:8 'fine linen... the righteousness of saints' is granted to her.
--   v.9-10 the Bridegroom's delight = Yahuah/Elohim rejoicing over the restored bride (Isa 62:5,
--        Zeph 3:17) — the Formed Son who HAS a Father rejoicing over Yashar'el regathered, both houses,
--        NOT a new people (Isa 54:5 'thy Maker is thine husband').
--

CREATE TEMP VIEW _s322_song04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================ cross_references
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread A: the spotless bride (4:7)
    ('canon','song-of-solomon',4,7,'canon','ephesians',5,26,'free',
     E'*That he might sanctify and cleanse it with the washing of water by the word* (Ephesians 5:26). The Bridegroom''s word, *Thou art all fair, my love; there is no spot in thee* (Song of Solomon 4:7), is no flattery of flesh-merit — Sha''ul names HOW the bride came to be without spot: the Beloved Himself sanctified and cleansed her.'),
    ('canon','song-of-solomon',4,7,'canon','ephesians',5,27,'free',
     E'*That he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish* (Ephesians 5:27). The Song''s *there is no spot in thee* (Song of Solomon 4:7) is filled exactly: Messiah (Christ) presents the bride to Himself spotless — her purity is His gift to her, the covenant-people sanctified by His own cleansing love, not by her own works.'),
    ('canon','song-of-solomon',4,7,'canon','colossians',1,22,'free',
     E'*In the body of his flesh through death, to present you holy and unblameable and unreproveable in his sight* (Colossians 1:22). The Bridegroom who says *there is no spot in thee* (Song of Solomon 4:7) is the One who made the bride holy and unblameable through His own flesh — the spotlessness is reckoned to her because He cleansed her, the seed restored, not a flesh-credential she earned.'),
    ('canon','song-of-solomon',4,7,'canon','revelation',19,8,'free',
     E'*And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8). The bride of whom the Beloved said *Thou art all fair... there is no spot in thee* (Song of Solomon 4:7) stands at the marriage clean and white — and the linen was *granted* to her, the Bridegroom''s gift, the righteousness wrought in His people.'),
    ('canon','song-of-solomon',4,7,'canon','2-peter',3,14,'free',
     E'*Wherefore, beloved, seeing that ye look for such things, be diligent that ye may be found of him in peace, without spot, and blameless* (2 Peter 3:14). The Song''s *no spot in thee* (Song of Solomon 4:7) becomes the people''s calling: to be *found of him... without spot* at His coming, walking in the holiness the Bridegroom Himself works in them.'),
    ('canon','song-of-solomon',4,7,'canon','ezekiel',16,9,'free',
     E'*Then washed I thee with water; yea, I throughly washed away thy blood from thee, and I anointed thee with oil* (Ezekiel 16:9). Long before the Song, Yahuah (LORD) declared how the bride became *exceeding beautiful* (Ezekiel 16:13): He washed her. So when the Beloved says *there is no spot in thee* (Song of Solomon 4:7), the beauty is His doing — Yashar''el cleansed by the covenant-husband, never self-adorned.'),

    -- Thread B: the Bridegroom rejoices over the bride (4:9-10)
    ('canon','song-of-solomon',4,9,'canon','isaiah',62,5,'free',
     E'*For as a young man marrieth a virgin, so shall thy sons marry thee: and as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5). The Song''s *Thou hast ravished my heart, my sister, my spouse* (Song of Solomon 4:9) is the very rejoicing Isaiah names — the Bridegroom''s delight in the bride is Elohim''s delight over restored Yashar''el.'),
    ('canon','song-of-solomon',4,9,'canon','zephaniah',3,17,'free',
     E'*Yahuah Elohayka (The LORD thy God) in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing* (Zephaniah 3:17). The Beloved''s *thou hast ravished my heart* (Song of Solomon 4:9) is the joy and singing Zephaniah promises — the Formed Son, who has a Father, exulting over His regathered people.'),
    ('canon','song-of-solomon',4,10,'canon','isaiah',54,5,'free',
     E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called* (Isaiah 54:5). The Bridegroom who marvels *How fair is thy love, my sister, my spouse!* (Song of Solomon 4:10) is the Maker-Husband Himself — the covenant-love of the Song is the love of Yahuah for Yashar''el, never a new people set in her place.'),

    -- Thread C: the call / marriage of the Lamb (4:8)
    ('canon','song-of-solomon',4,8,'canon','hosea',2,19,'free',
     E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). The Bridegroom''s call *Come with me from Lebanon, my spouse* (Song of Solomon 4:8) is the betrothal Hosea announces — the scattered house (Lo-Ammi) wooed back and betrothed for ever, the two-house people made His bride.'),
    ('canon','song-of-solomon',4,8,'canon','revelation',19,7,'free',
     E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). The summons *Come with me from Lebanon, my spouse* (Song of Solomon 4:8) reaches its consummation at the marriage of the Lamb — the bride called away from the high places of the leopards to her Husband.'),
    ('canon','song-of-solomon',4,8,'canon','revelation',21,2,'free',
     E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The bride called to *Come with me from Lebanon* (Song of Solomon 4:8) is at last the New Jerusalem adorned for her Husband — Yashar''el restored, the covenant-marriage made everlasting.'),

    -- Thread D: a garden inclosed, a fountain sealed (4:12)
    ('canon','song-of-solomon',4,12,'canon','proverbs',5,15,'free',
     E'*Drink waters out of thine own cistern, and running waters out of thine own well* (Proverbs 5:15). The bride as *a garden inclosed... a spring shut up, a fountain sealed* (Song of Solomon 4:12) is the purity Proverbs guards — the well reserved for one, the covenant-faithfulness that belongs to the Beloved alone.'),
    ('canon','song-of-solomon',4,12,'canon','proverbs',5,18,'free',
     E'*Let thy fountain be blessed: and rejoice with the wife of thy youth* (Proverbs 5:18). The *fountain sealed* (Song of Solomon 4:12) is the blessed fountain Proverbs names — the bride kept whole for her Husband, the chaste love Yahuah honours in His people.'),
    ('canon','song-of-solomon',4,12,'canon','psalms',45,11,'free',
     E'*So shall the king greatly desire thy beauty: for he is thy Yahuah (Lord); and worship thou him* (Psalm 45:11). The enclosed garden reserved for the Beloved (Song of Solomon 4:12) answers the King''s desire of His bride in the royal wedding-psalm — her beauty kept for Him who is her Lord.'),
    ('canon','song-of-solomon',4,12,'canon','psalms',45,13,'free',
     E'*The king''s daughter is all glorious within: her clothing is of wrought gold* (Psalm 45:13). The bride who is *a garden inclosed* (Song of Solomon 4:12) is *all glorious within* — the hidden, reserved purity of the King''s bride, Yashar''el adorned for her covenant-Husband.'),

    -- Thread E: a well of living waters (4:15)
    ('canon','song-of-solomon',4,15,'canon','jeremiah',2,13,'free',
     E'*For my people have committed two evils; they have forsaken me the fountain of living waters, and hewed them out cisterns, broken cisterns, that can hold no water* (Jeremiah 2:13). The bride is *a fountain of gardens, a well of living waters* (Song of Solomon 4:15) only because she draws from Yahuah, the fountain of living waters — the very fountain her people once forsook, now restored in covenant-love.'),
    ('canon','song-of-solomon',4,15,'canon','jeremiah',17,13,'free',
     E'*O Yahuah (LORD), the hope of Yashar''el (Israel), all that forsake thee shall be ashamed... because they have forsaken Yahuah (LORD), the fountain of living waters* (Jeremiah 17:13). The *well of living waters* (Song of Solomon 4:15) within the bride is Yahuah Himself, the hope of Yashar''el — the Beloved is the source the garden flows from.'),
    ('canon','song-of-solomon',4,15,'canon','john',4,14,'free',
     E'*But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14). The bride''s *well of living waters* (Song of Solomon 4:15) is fulfilled in the living water the Formed Son gives — a well springing up in His people unto everlasting life.'),
    ('canon','song-of-solomon',4,15,'canon','john',7,38,'free',
     E'*He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water* (John 7:38). The *well of living waters, and streams from Lebanon* (Song of Solomon 4:15) flow forward into the rivers of living water Yahusha (Jesus) promises — the garden-bride become a wellspring because the Beloved indwells her.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s322_song04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s322_song04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================ threads
-- Thread A: the spotless bride (4:7)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-4-thou-art-all-fair-no-spot-in-thee-the-spotless-bride',
       E'Thou art all fair, my love; there is no spot in thee — the spotless bride the Bridegroom presents holy',
       E'The Bridegroom''s word over His bride is the heart of the chapter: *Thou art all fair, my love; there is no spot in thee* (Song of Solomon 4:7). Read in covenant-love, this is no flattery of flesh-merit — it is the Beloved declaring His people clean because He Himself cleansed them. Sha''ul names exactly how: *That he might sanctify and cleanse it with the washing of water by the word* (Ephesians 5:26), *that he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish* (Ephesians 5:27). The spotlessness is the Bridegroom''s gift, not the bride''s achievement — *to present you holy and unblameable and unreproveable in his sight* (Colossians 1:22). At the wedding it is *granted* to her: *to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8), and the people are called to walk in it — *be diligent that ye may be found of him in peace, without spot, and blameless* (2 Peter 3:14). And the root of it all stands in the Tanakh: Yahuah (LORD) had already said of His covenant-bride, *Then washed I thee with water; yea, I throughly washed away thy blood from thee, and I anointed thee with oil* (Ezekiel 16:9), until *thou wast exceeding beautiful*. The beauty of the bride is the Bridegroom''s own sanctifying love — Yashar''el restored, washed, presented spotless, never self-adorned.',
       sv.verse_id, ev.verse_id, 'free', 39375
  FROM _s322_song04_lookup sv, _s322_song04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- Thread B: the Bridegroom rejoices (4:9-10)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-4-thou-hast-ravished-my-heart-the-bridegroom-rejoices',
       E'Thou hast ravished my heart, my sister, my spouse — the Bridegroom rejoices over the bride',
       E'The Beloved''s delight pours out: *Thou hast ravished my heart, my sister, my spouse; thou hast ravished my heart with one of thine eyes* (Song of Solomon 4:9), *How fair is thy love, my sister, my spouse! how much better is thy love than wine!* (Song of Solomon 4:10). This is the very rejoicing the prophets promise over restored Yashar''el. Isaiah: *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5). Zephaniah: *Yahuah Elohayka (The LORD thy God) in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing* (Zephaniah 3:17). And the Husband is named outright: *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). The Bridegroom who is ravished by His bride is the Formed Son, who has a Father — Yahuah Himself delighting over His own people regathered, both houses made one, never a new bride set in her place.',
       sv.verse_id, ev.verse_id, 'free', 39376
  FROM _s322_song04_lookup sv, _s322_song04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- Thread C: come with me from Lebanon / marriage of the Lamb (4:8)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-4-come-with-me-from-lebanon-the-marriage-of-the-lamb',
       E'Come with me from Lebanon, my spouse — the call away to the marriage of the Lamb',
       E'The Bridegroom calls His bride away from the high and dangerous places: *Come with me from Lebanon, my spouse, with me from Lebanon... from the lions'' dens, from the mountains of the leopards* (Song of Solomon 4:8). This is the betrothal-summons the covenant carries forward. Hosea: *And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19) — the scattered house, once Lo-Ammi, wooed back and betrothed for ever. Its consummation is the marriage of the Lamb: *Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7), and *I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The call from Lebanon is the call out of exile and danger into everlasting covenant-marriage — Yashar''el regathered to her Husband.',
       sv.verse_id, ev.verse_id, 'free', 39377
  FROM _s322_song04_lookup sv, _s322_song04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- Thread D: a garden inclosed, a fountain sealed (4:12)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-4-a-garden-inclosed-a-fountain-sealed-reserved-for-the-beloved',
       E'A garden inclosed... a fountain sealed — the bride''s purity reserved for the Beloved',
       E'The Beloved names the bride''s reserved purity: *A garden inclosed is my sister, my spouse; a spring shut up, a fountain sealed* (Song of Solomon 4:12). Read chastely and in covenant, this is the faithfulness that belongs to the Husband alone — a wholeness kept for Him. Proverbs guards the same: *Drink waters out of thine own cistern, and running waters out of thine own well* (Proverbs 5:15), and *Let thy fountain be blessed: and rejoice with the wife of thy youth* (Proverbs 5:18) — the sealed fountain is the blessed one. The royal wedding-psalm sees the same bride: *So shall the king greatly desire thy beauty: for he is thy Yahuah (Lord); and worship thou him* (Psalm 45:11), *The king''s daughter is all glorious within: her clothing is of wrought gold* (Psalm 45:13). The enclosed garden, the sealed fountain, the glory hidden within — this is the bride kept whole for her covenant-Husband, Yashar''el faithful to the Beloved who alone may enter.',
       sv.verse_id, ev.verse_id, 'free', 39378
  FROM _s322_song04_lookup sv, _s322_song04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- Thread E: a well of living waters (4:15)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-4-a-well-of-living-waters-streams-from-lebanon',
       E'A well of living waters, and streams from Lebanon — the bride filled by the fountain',
       E'The enclosed garden is no dry place: *A fountain of gardens, a well of living waters, and streams from Lebanon* (Song of Solomon 4:15). The bride is a wellspring only because she is filled from the true Fountain. Jeremiah names Him: *they have forsaken me the fountain of living waters, and hewed them out cisterns, broken cisterns, that can hold no water* (Jeremiah 2:13), and *O Yahuah (LORD), the hope of Yashar''el (Israel)... because they have forsaken Yahuah (LORD), the fountain of living waters* (Jeremiah 17:13). What was forsaken is restored in the Beloved: the Formed Son gives *a well of water springing up into everlasting life* (John 4:14), and of His indwelt people He says, *out of his belly shall flow rivers of living water* (John 7:38). The garden-bride becomes a fountain because the Beloved Himself is the living water within her — Yashar''el restored to the source she once abandoned.',
       sv.verse_id, ev.verse_id, 'free', 39379
  FROM _s322_song04_lookup sv, _s322_song04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=4 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ============================================================ thread_members
-- Thread A members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (4,7,'ephesians',5,26,1,E'*That he might sanctify and cleanse it with the washing of water by the word* (Ephesians 5:26) — the Bridegroom names HOW the bride became spotless: He cleansed her.'),
    (4,7,'ephesians',5,27,2,E'*Not having spot, or wrinkle... holy and without blemish* (Ephesians 5:27) — the Song''s *no spot in thee* fulfilled: Messiah presents the bride spotless to Himself.'),
    (4,7,'colossians',1,22,3,E'*To present you holy and unblameable and unreproveable in his sight* (Colossians 1:22) — spotlessness reckoned to the bride through His flesh, not her flesh-merit.'),
    (4,7,'revelation',19,8,4,E'*Arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8) — the spotless linen *granted* to her at the marriage.'),
    (4,7,'2-peter',3,14,5,E'*That ye may be found of him in peace, without spot, and blameless* (2 Peter 3:14) — the people called to walk in the spotlessness the Bridegroom works.'),
    (4,7,'ezekiel',16,9,6,E'*Then washed I thee with water... and thou wast exceeding beautiful* (Ezekiel 16:9,13) — the Tanakh root: Yahuah Himself made the bride beautiful by washing her.')
  ) AS m(src_ch,src_v,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN _s322_song04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-4-thou-art-all-fair-no-spot-in-thee-the-spotless-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread B members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (4,9,'isaiah',62,5,1,E'*As the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5) — the Bridegroom''s delight is Elohim''s delight over restored Yashar''el.'),
    (4,9,'zephaniah',3,17,2,E'*He will rejoice over thee with joy... he will joy over thee with singing* (Zephaniah 3:17) — the Formed Son, who has a Father, exulting over His regathered people.'),
    (4,10,'isaiah',54,5,3,E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name* (Isaiah 54:5) — the ravished Bridegroom is the Maker-Husband Himself, never a new bride.')
  ) AS m(src_ch,src_v,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN _s322_song04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-4-thou-hast-ravished-my-heart-the-bridegroom-rejoices'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread C members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (4,8,'hosea',2,19,1,E'*I will betroth thee unto me for ever... in lovingkindness, and in mercies* (Hosea 2:19) — the call from Lebanon is the betrothal of the scattered house wooed back.'),
    (4,8,'revelation',19,7,2,E'*The marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the summons reaches its consummation.'),
    (4,8,'revelation',21,2,3,E'*New Jerusalem... prepared as a bride adorned for her husband* (Revelation 21:2) — the bride called away becomes the everlasting covenant-marriage.')
  ) AS m(src_ch,src_v,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN _s322_song04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-4-come-with-me-from-lebanon-the-marriage-of-the-lamb'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread D members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (4,12,'proverbs',5,15,1,E'*Drink waters out of thine own cistern, and running waters out of thine own well* (Proverbs 5:15) — the well reserved for one, the purity the sealed fountain guards.'),
    (4,12,'proverbs',5,18,2,E'*Let thy fountain be blessed: and rejoice with the wife of thy youth* (Proverbs 5:18) — the sealed fountain is the blessed one, kept whole for the Beloved.'),
    (4,12,'psalms',45,11,3,E'*So shall the king greatly desire thy beauty: for he is thy Yahuah (Lord)* (Psalm 45:11) — the enclosed garden answers the King''s desire of His bride.'),
    (4,12,'psalms',45,13,4,E'*The king''s daughter is all glorious within: her clothing is of wrought gold* (Psalm 45:13) — the hidden, reserved glory of the bride within.')
  ) AS m(src_ch,src_v,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN _s322_song04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-4-a-garden-inclosed-a-fountain-sealed-reserved-for-the-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread E members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (4,15,'jeremiah',2,13,1,E'*They have forsaken me the fountain of living waters* (Jeremiah 2:13) — the bride is a well only because she draws from the true Fountain her people once forsook.'),
    (4,15,'jeremiah',17,13,2,E'*Yahuah (LORD), the hope of Yashar''el (Israel)... the fountain of living waters* (Jeremiah 17:13) — the living water within the bride is Yahuah Himself.'),
    (4,15,'john',4,14,3,E'*A well of water springing up into everlasting life* (John 4:14) — the Formed Son gives the living water the Song''s bride bears.'),
    (4,15,'john',7,38,4,E'*Out of his belly shall flow rivers of living water* (John 7:38) — the garden-bride becomes a wellspring because the Beloved indwells her.')
  ) AS m(src_ch,src_v,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN _s322_song04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-4-a-well-of-living-waters-streams-from-lebanon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_song-of-solomon_5.sql (Song of Solomon 5) -----
-- Chapter: Song of Solomon 5 — the Beloved knocks, the bride's loss and search, his surpassing beauty
-- Reading frame: REVERENT covenant-love allegory. Beloved = Messiah the Bridegroom (the Formed Son
--   who HAS a Father, Ps45 King); bride = his people Yashar'el restored (both houses, NOT a new
--   people — Rom 11:1-2 anti-replacement guard). Bodily-description imagery (5:10-16) handled
--   chastely as the bride's adoration of the GLORY of her Beloved, never eroticized.
-- Tag: song05   |   Session prefix: s322   |   Temp view: _s322_song05_lookup
-- Sort band: 39400 + 1 per thread (39400, 39401, 39402, 39403)
-- Source book_slug: song-of-solomon, chapter 5 (parse reads "Jerusalem" not "Yerushalayim" — quoted exactly)
--
-- COVERAGE CHECKLIST (all three libraries weighed per verse-block):
--   v.1   NT:     none warranted (garden-consummation refrain; carried in marriage-covenant thread frame)
--         Extras: none warranted
--         Tanakh: none warranted (anchors marriage-covenant thread implicitly)
--   v.2   NT:     ★ Revelation 3:20 (he stands and knocks); Matthew 25:5 (the bride slumbered) — BUILT
--         Extras: none warranted (no clean knocking-at-the-door witness)
--         Tanakh: none warranted (NT fulfillment carries it)
--   v.3-6 NT:     none warranted directly (the delay/withdrawal type is filled by the seek-Me Tanakh weave)
--         Extras: none warranted
--         Tanakh: ★ Hosea 5:15 (I will return to my place till they seek my face); Isaiah 55:6 (seek Yahuah while He may be found) — BUILT
--   v.7   NT:     none warranted (affliction of the seeking bride; carried lightly in the search thread)
--         Extras: none warranted
--         Tanakh: none warranted
--   v.8-9 NT:     none warranted (daughters-of-Jerusalem dialogue; sets up the praise)
--         Extras: none warranted
--         Tanakh: none warranted
--   v.10-16 NT:   ★ Revelation 1:14-15 (white head, eyes as flame, feet as fine brass — the glorified Son);
--                   Philippians 2:9 (highly exalted, name above every name = chiefest) — BUILT
--         Extras: none warranted (canon Ps45/Isa33/Rev1 carry the surpassing-beauty weave fully)
--         Tanakh: ★ Psalm 45:2 (fairer than the children of men — the King-Bridegroom);
--                   Isaiah 33:17 (thine eyes shall see the king in his beauty) — BUILT
--   FRAME NT:     Ephesians 5:25-32 (Messiah loved the bride, gave himself); Revelation 19:7-9 (marriage of the Lamb);
--                   Revelation 21:2 (bride adorned for her husband) — BUILT
--         Extras: none warranted
--         Tanakh: Isaiah 54:5 (thy Maker is thine husband); Hosea 2:19-20 (I will betroth thee unto me for ever) — BUILT
--
-- THREADS:
--   song-of-solomon-5-the-beloved-stands-at-the-door-and-knocks  (5:2)      → NT (Rev3:20, Matt25:5)                         [free]
--   song-of-solomon-5-i-sought-him-but-could-not-find-him        (5:3-6)    → Tanakh (Hosea5:15, Isa55:6)                     [free]
--   song-of-solomon-5-altogether-lovely-the-chiefest-among-ten-thousand (5:10-16) → Tanakh+NT (Ps45:2, Isa33:17, Rev1:14-15, Phil2:9) [free]
--   song-of-solomon-5-the-marriage-covenant-of-the-bridegroom-and-his-bride (5:2-16) → Tanakh+NT (Isa54:5, Hosea2:19-20, Eph5:25/32, Rev19:7/9, Rev21:2) [free]

CREATE TEMP VIEW _s322_song05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Beloved stands at the door and knocks (5:2)
    ('canon','song-of-solomon',5,2,'canon','revelation',3,20,'free',
      E'*Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in to him, and will sup with him, and he with me.* (Revelation 3:20). The drowsy bride hears *the voice of my beloved that knocketh, saying, Open to me, my sister, my love, my dove, my undefiled* (Song of Solomon 5:2) — the same Bridegroom who stands at the door of his people and calls them to open. The Formed Son does not break in; he knocks, and the covenant-love must answer.'),
    ('canon','song-of-solomon',5,2,'canon','matthew',25,5,'free',
      E'*While the bridegroom tarried, they all slumbered and slept.* (Matthew 25:5). The bride confesses *I sleep, but my heart waketh* (Song of Solomon 5:2) — the slumber that falls while the Bridegroom delays. The heart that wakes at his knock is the lamp kept burning; the bride must rouse and open before the door is shut.'),
    -- THREAD 2: I sought him, but I could not find him (5:3-6)
    ('canon','song-of-solomon',5,6,'canon','hosea',5,15,'free',
      E'*I will go and return to my place, till they acknowledge their offence, and seek my face: in their affliction they will seek me early.* (Hosea 5:15). When the bride delays and rises too late — *I opened to my beloved; but my beloved had withdrawn himself, and was gone... I sought him, but I could not find him* (Song of Solomon 5:6) — this is no abandonment but the discipline of withdrawn presence, the Beloved who returns to his place until his people seek his face. The withdrawal is the very thing that turns the heart to seek him early.'),
    ('canon','song-of-solomon',5,6,'canon','isaiah',55,6,'free',
      E'*Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near:* (Isaiah 55:6). The bride who searches the night streets — *I sought him, but I could not find him; I called him, but he gave me no answer* (Song of Solomon 5:6) — learns the cost of delay: there is a season of nearness in which the Beloved is found, and the soul that waits too long must seek through the dark. Seek him while he may be found.'),
    -- THREAD 3: altogether lovely, the chiefest among ten thousand (5:10-16)
    ('canon','song-of-solomon',5,10,'canon','psalms',45,2,'free',
      E'*Thou art fairer than the children of men: grace is poured into thy lips: therefore Elohim (God) hath blessed thee for ever.* (Psalm 45:2). The bride beholds her Beloved — *My beloved is white and ruddy, the chiefest among ten thousand* (Song of Solomon 5:10) — the same surpassing beauty the wedding psalm sings of the anointed King-Bridegroom. He is fairer than the children of men, the Formed Son whom the Father hath blessed for ever.'),
    ('canon','song-of-solomon',5,10,'canon','isaiah',33,17,'free',
      E'*Thine eyes shall see the king in his beauty: they shall behold the land that is very far off.* (Isaiah 33:17). The bride''s adoring gaze upon her *chiefest among ten thousand* (Song of Solomon 5:10) is the promised sight: the redeemed shall see the King in his beauty. What the bride beholds in the night the gathered people shall behold in the day of restoration.'),
    ('canon','song-of-solomon',5,11,'canon','revelation',1,14,'free',
      E'*His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* (Revelation 1:14). The bride''s praise — *His head is as the most fine gold... His eyes are as the eyes of doves by the rivers of waters* (Song of Solomon 5:11-12) — finds its full glory in the unveiled Son, his head crowned in radiance and his eyes as flame. The veiled adoration of the Song is the open glory of the One who took flesh and was exalted.'),
    ('canon','song-of-solomon',5,15,'canon','revelation',1,15,'free',
      E'*And his feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters.* (Revelation 1:15). The bride sings *His legs are as pillars of marble, set upon sockets of fine gold: his countenance is as Lebanon, excellent as the cedars* (Song of Solomon 5:15) — the same towering, burnished glory John sees in the risen Son. The bride''s marble-and-gold Beloved is the Formed Son in his majesty.'),
    ('canon','song-of-solomon',5,10,'canon','philippians',2,9,'free',
      E'*Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9). *The chiefest among ten thousand* (Song of Solomon 5:10) is the One the Father highly exalted above every name — the surpassing pre-eminence the bride names with her eyes the Father has decreed in heaven. He is altogether lovely because the Most High has set him highest.'),
    -- THREAD 4: the marriage-covenant of the Bridegroom and his bride (frame, 5:2-16)
    ('canon','song-of-solomon',5,2,'canon','isaiah',54,5,'free',
      E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called.* (Isaiah 54:5). The whole Song is this covenant: the Beloved who knocks — *Open to me, my sister, my love, my dove, my undefiled* (Song of Solomon 5:2) — is the Maker who is husband to his people, the Redeemer of Yashar''el (Israel). The bride is no new people but the covenant wife restored.'),
    ('canon','song-of-solomon',5,2,'canon','hosea',2,19,'free',
      E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies.* (Hosea 2:19). The Beloved who calls *Open to me, my sister, my love* (Song of Solomon 5:2) is the One who betroths divorced and scattered Yashar''el (Israel) back to himself for ever — the two-house bride reclaimed, not replaced. The night-search and the betrothal are one covenant story.'),
    ('canon','song-of-solomon',5,16,'canon','ephesians',5,25,'free',
      E'*Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it;* (Ephesians 5:25). When the bride says *This is my beloved, and this is my friend, O daughters of Jerusalem* (Song of Solomon 5:16), she names the love Paul makes the pattern of all marriage: the Bridegroom who gave himself for the bride. The altogether-lovely Beloved loved first and loved to the giving of himself.'),
    ('canon','song-of-solomon',5,16,'canon','ephesians',5,32,'free',
      E'*This is a great mystery: but I speak concerning Messiah (Christ) and the church.* (Ephesians 5:32). The bride''s confession *This is my beloved, and this is my friend* (Song of Solomon 5:16) is the great mystery laid open: the Song''s covenant-love is of Messiah and his gathered people. The whole chapter is read aright only as Bridegroom and bride.'),
    ('canon','song-of-solomon',5,16,'canon','revelation',19,7,'free',
      E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready.* (Revelation 19:7). The bride who sought through the night and praised her Beloved — *he is altogether lovely* (Song of Solomon 5:16) — arrives at the marriage of the Lamb, made ready at last. The longing of the Song is consummated in the wedding of the Bridegroom and his restored wife.'),
    ('canon','song-of-solomon',5,16,'canon','revelation',19,9,'free',
      E'*And he saith unto me, Write, Blessed are they which are called unto the marriage supper of the Lamb. And he saith unto me, These are the true sayings of Elohim (God).* (Revelation 19:9). The bride''s *This is my beloved, and this is my friend* (Song of Solomon 5:16) is answered in the blessing on those called to the marriage supper of the Lamb. The covenant-love sought in the dark ends at the table of the Bridegroom.'),
    ('canon','song-of-solomon',5,16,'canon','revelation',21,2,'free',
      E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* (Revelation 21:2). The bride of the Song, who lost and sought and adored her Beloved, is at last *prepared as a bride adorned for her husband* (Revelation 21:2). The altogether-lovely Bridegroom receives the restored people of Yashar''el (Israel) as the New Jerusalem.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s322_song05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s322_song05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. cross_reference_threads =====================
-- THREAD 1 (5:2)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-5-the-beloved-stands-at-the-door-and-knocks',
       E'The Beloved Stands at the Door and Knocks',
       E'The bride is drowsy, half-asleep, when love comes calling: *I sleep, but my heart waketh: it is the voice of my beloved that knocketh, saying, Open to me, my sister, my love, my dove, my undefiled* (Song of Solomon 5:2). The Beloved is the Messiah the Bridegroom, the Formed Son who does not force the door but knocks and calls — *Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in to him* (Revelation 3:20). The covenant-love must answer; the heart that wakes at his voice is the bride who keeps her lamp. And the warning of the delay is plain: *While the bridegroom tarried, they all slumbered and slept* (Matthew 25:5). The slumber that falls while the Bridegroom tarries is the very danger the bride here lives — she sleeps, but blessed is the heart that still wakes to open at his knock.',
       sv.verse_id, ev.verse_id, 'free', 39400
  FROM _s322_song05_lookup sv, _s322_song05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (5:3-6)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-5-i-sought-him-but-could-not-find-him',
       E'I Sought Him, But I Could Not Find Him — the Withdrawn Presence',
       E'The bride hesitates — *I have put off my coat; how shall I put it on? I have washed my feet; how shall I defile them?* (Song of Solomon 5:3) — and by the time she rises, the door of the hour has closed: *I opened to my beloved; but my beloved had withdrawn himself, and was gone: my soul failed when he spake: I sought him, but I could not find him; I called him, but he gave me no answer* (Song of Solomon 5:6). This is the cost of delay — yet it is not abandonment but the discipline of withdrawn presence. *I will go and return to my place, till they acknowledge their offence, and seek my face: in their affliction they will seek me early* (Hosea 5:15): the Beloved returns to his place precisely so that his people will turn and seek his face. And there remains a season for the seeking: *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). The withdrawn Beloved is the One who is teaching the bride to seek him early and with her whole heart.',
       sv.verse_id, ev.verse_id, 'free', 39401
  FROM _s322_song05_lookup sv, _s322_song05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (5:10-16)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-5-altogether-lovely-the-chiefest-among-ten-thousand',
       E'Altogether Lovely — the Chiefest Among Ten Thousand',
       E'Asked what makes her Beloved more than any other, the bride pours out his praise: *My beloved is white and ruddy, the chiefest among ten thousand* (Song of Solomon 5:10), and at the last, *His mouth is most sweet: yea, he is altogether lovely. This is my beloved, and this is my friend* (Song of Solomon 5:16). This is the bride beholding the GLORY of her Bridegroom — the surpassing beauty the wedding psalm sings: *Thou art fairer than the children of men: grace is poured into thy lips: therefore Elohim (God) hath blessed thee for ever* (Psalm 45:2). It is the promised sight of the redeemed: *Thine eyes shall see the king in his beauty* (Isaiah 33:17). The veiled adoration of the Song stands open in the unveiled Son — *His head and his hairs were white like wool... and his eyes were as a flame of fire* (Revelation 1:14), *And his feet like unto fine brass, as if they burned in a furnace* (Revelation 1:15) — the very head-of-gold, eyes-as-doves, and pillars-of-marble the bride names. He is the chiefest because the Father has made him so: *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9). The Formed Son who has a Father is altogether lovely.',
       sv.verse_id, ev.verse_id, 'free', 39402
  FROM _s322_song05_lookup sv, _s322_song05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (frame, 5:2-16)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-5-the-marriage-covenant-of-the-bridegroom-and-his-bride',
       E'The Marriage-Covenant of the Bridegroom and His Bride',
       E'The whole of Song 5 — the knock, the search, the praise — is one covenant: the Bridegroom and his bride. The Beloved who calls *Open to me, my sister, my love, my dove, my undefiled* (Song of Solomon 5:2) and whom the bride names *my beloved... my friend* (Song of Solomon 5:16) is the Maker who weds his people: *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). The bride is no new people but scattered Yashar''el restored — *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). Paul makes this love the pattern: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25), and names the depth of it — *This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:32). The longing of the Song is consummated at the wedding: *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7); *Blessed are they which are called unto the marriage supper of the Lamb* (Revelation 19:9); and the restored people come down *prepared as a bride adorned for her husband* (Revelation 21:2). The bride who sought her Beloved in the night is the bride adorned for him in the day.',
       sv.verse_id, ev.verse_id, 'free', 39403
  FROM _s322_song05_lookup sv, _s322_song05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. cross_reference_thread_members =====================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Revelation 3:20 — *Behold, I stand at the door, and knock... open the door, I will come in to him*: the Bridegroom who knocks and waits to be let in, the very voice the bride hears at her door.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-the-beloved-stands-at-the-door-and-knocks'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Matthew 25:5 — *While the bridegroom tarried, they all slumbered and slept*: the slumber that falls while the Bridegroom delays; the bride sleeps, but blessed is the heart that wakes to open.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-the-beloved-stands-at-the-door-and-knocks'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Hosea 5:15 — *I will go and return to my place, till they acknowledge their offence, and seek my face*: the withdrawn Beloved is no abandonment but the discipline that turns his people to seek him.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=5 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-i-sought-him-but-could-not-find-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 55:6 — *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near*: there is a season of nearness; the bride learns the cost of delay and seeks through the dark.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-i-sought-him-but-could-not-find-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 45:2 — *Thou art fairer than the children of men: grace is poured into thy lips*: the wedding psalm''s surpassing beauty of the King-Bridegroom, fairer than all, blessed of the Father.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-altogether-lovely-the-chiefest-among-ten-thousand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 33:17 — *Thine eyes shall see the king in his beauty*: the promised sight of the redeemed; the bride''s adoring gaze is the people''s coming vision of the King.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=33 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-altogether-lovely-the-chiefest-among-ten-thousand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Revelation 1:14 — *His head and his hairs were white like wool... and his eyes were as a flame of fire*: the head-of-gold and dove-eyes of the Song unveiled in the glory of the risen Son.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-altogether-lovely-the-chiefest-among-ten-thousand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Revelation 1:15 — *his feet like unto fine brass... and his voice as the sound of many waters*: the pillars-of-marble and Lebanon-countenance of the Song in the towering majesty of the Son.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-altogether-lovely-the-chiefest-among-ten-thousand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Philippians 2:9 — *Elohim (God) also hath highly exalted him, and given him a name which is above every name*: the chiefest among ten thousand is the One the Father set highest; the Formed Son who has a Father.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-altogether-lovely-the-chiefest-among-ten-thousand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 54:5 — *thy Maker is thine husband... thy Redeemer the Holy One of Yashar''el (Israel)*: the Beloved who knocks is the Maker-husband of his people, the bride no new people but the covenant wife.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-the-marriage-covenant-of-the-bridegroom-and-his-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hosea 2:19 — *I will betroth thee unto me for ever... in righteousness, and in judgment, and in lovingkindness, and in mercies*: scattered Yashar''el (Israel) betrothed back for ever — restored, not replaced.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-the-marriage-covenant-of-the-bridegroom-and-his-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ephesians 5:25 — *love your wives, even as Messiah (Christ) also loved the church, and gave himself for it*: the Bridegroom''s self-giving love made the pattern of all marriage.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-the-marriage-covenant-of-the-bridegroom-and-his-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Ephesians 5:32 — *This is a great mystery: but I speak concerning Messiah (Christ) and the church*: the Song''s covenant-love laid open as the mystery of Messiah and his gathered people.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-the-marriage-covenant-of-the-bridegroom-and-his-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Revelation 19:7 — *the marriage of the Lamb is come, and his wife hath made herself ready*: the longing of the Song consummated at the wedding of the Bridegroom and his restored wife.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-the-marriage-covenant-of-the-bridegroom-and-his-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Revelation 19:9 — *Blessed are they which are called unto the marriage supper of the Lamb*: the covenant-love sought in the dark ends at the table of the Bridegroom.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-the-marriage-covenant-of-the-bridegroom-and-his-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Revelation 21:2 — *new Jerusalem... prepared as a bride adorned for her husband*: the bride who sought her Beloved in the night is the restored people adorned for him in the day.'
  FROM cross_reference_threads t
  JOIN _s322_song05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s322_song05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-5-the-marriage-covenant-of-the-bridegroom-and-his-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_song-of-solomon_6.sql (Song of Solomon 6) -----
-- Song of Solomon chapter 6 — full-library cross-references (Tanakh foundation layer)
-- Tag: song06 ; session prefix s322 ; sort band 39425+
-- Reading frame: REVERENT covenant-love allegory. Beloved = Messiah the Bridegroom
--   (the Formed Son who HAS a Father, Ps 45); bride = his people Yashar'el (Israel)
--   RESTORED, both houses — never a new people (Rom 11:1-2 guard). Never eroticized.
--
-- Song 6 coverage:
--   v.2-3 ("My beloved is gone down into his garden... I am my beloved's, and my beloved
--          is mine: he feedeth among the lilies") = the mutual covenant-belonging formula.
--        NT:     Jeremiah 31:33 stands as the Tanakh root; the prophets' formula. (NT: none
--                added — the canon prophets carry it more exactly than any NT verse here.)
--        Extras: none warranted (no clean witness restates the belonging-formula).
--        Tanakh: Song 2:16 (the same formula reversed), Leviticus 26:12, Jeremiah 31:33,
--                Ezekiel 37:27, Hosea 2:23 — the "I will be their Elohim, they my people."
--   v.4,10 ("terrible as an army with banners"; "Who is she that looketh forth as the
--          morning, fair as the moon, clear as the sun") = the radiant, gathered, arrayed
--          covenant-people glorified.
--        NT:     Revelation 12:1 (woman clothed with the sun = covenant-people),
--                Revelation 21:2 (the bride/new Jerusalem).
--        Extras: none warranted.
--        Tanakh: Isaiah 60:1 ("Arise, shine; for thy light is come"), Isaiah 60:2 (his
--                glory seen upon thee).
--   v.9 ("My dove, my undefiled is but one... the daughters saw her, and blessed her")
--          = the one undefiled bride.
--        NT:     Ephesians 4:4 (one body), Ephesians 5:27 (the undefiled bride).
--        Extras: none warranted.
--        Tanakh: Psalm 45:13 (the king's daughter all glorious within).
--   v.5-7,8,11-13 (the wasf detail, threescore queens, the garden of nuts, Return O
--          Shulamite / company of two armies): no thread warranted — descriptive/poetic
--          frame around the load-bearing covenant verses already threaded above.
--
-- Threads (3) — every member canon → all tier 'free':
--   1. song-of-solomon-6-i-am-my-beloveds-and-my-beloved-is-mine-the-covenant-belonging-formula
--      [Tanakh: Song 2:16, Lev 26:12, Jer 31:33, Ezek 37:27, Hosea 2:23]
--   2. song-of-solomon-6-terrible-as-an-army-with-banners-the-radiant-covenant-people
--      [Tanakh: Isa 60:1, Isa 60:2 ; NT: Rev 12:1, Rev 21:2]
--   3. song-of-solomon-6-my-undefiled-is-but-one-the-one-undefiled-bride
--      [Tanakh: Ps 45:13 ; NT: Eph 4:4, Eph 5:27]

CREATE TEMP VIEW _s322_song06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the covenant-belonging formula (Song 6:3, anchored by 6:2)
    ('canon','song-of-solomon',6,3,'canon','song-of-solomon',2,16,'free',
     E'*My beloved is mine, and I am his: he feedeth among the lilies.* (Song of Solomon 2:16) The same mutual belonging-formula sung earlier in the book returns here at *I am my beloved''s, and my beloved is mine: he feedeth among the lilies* (Song of Solomon 6:3) — the covenant bond between the Bridegroom (Messiah) and his bride (Yashar''el, Israel, restored), each wholly the other''s.'),
    ('canon','song-of-solomon',6,3,'canon','leviticus',26,12,'free',
     E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people.* (Leviticus 26:12) The Torah''s own covenant-belonging promise stands behind *I am my beloved''s, and my beloved is mine* (Song of Solomon 6:3): the bride who belongs to the Beloved is the people Yahuah claimed as his own from Sinai — not a new people, but the same Yashar''el (Israel).'),
    ('canon','song-of-solomon',6,3,'canon','jeremiah',31,33,'free',
     E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33) The Beloved''s *I am my beloved''s, and my beloved is mine* (Song of Solomon 6:3) is the renewed covenant in song: the Torah written on the heart binds bride to Bridegroom, *their Elohim* and *my people*.'),
    ('canon','song-of-solomon',6,3,'canon','ezekiel',37,27,'free',
     E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people.* (Ezekiel 37:27) Spoken in the two-stick chapter where Yahudah (Judah) and Yashar''el (Israel) are made one, this is the very belonging *I am my beloved''s, and my beloved is mine* (Song of Solomon 6:3) sings — the gathered, reunited bride dwelt-with forever.'),
    ('canon','song-of-solomon',6,3,'canon','hosea',2,23,'free',
     E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23) The scattered northern house, once *Lo-Ammi* (not my people), is reclaimed as bride — exactly the mutual *I am my beloved''s, and my beloved is mine* (Song of Solomon 6:3); the belonging is restoration, never replacement.'),
    -- Thread 2: terrible as an army with banners — the radiant covenant-people (Song 6:4, 6:10)
    ('canon','song-of-solomon',6,10,'canon','isaiah',60,1,'free',
     E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1) The bride *fair as the moon, clear as the sun* (Song of Solomon 6:10) shines because the glory of Yahuah has risen upon her — Yashar''el (Israel) restored is luminous not of herself but with the Beloved''s glory.'),
    ('canon','song-of-solomon',6,10,'canon','isaiah',60,2,'free',
     E'*For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* (Isaiah 60:2) She who *looketh forth as the morning* (Song of Solomon 6:10) is the covenant-people upon whom Yahuah''s glory is seen while darkness covers the earth — the radiant, gathered bride.'),
    ('canon','song-of-solomon',6,10,'canon','revelation',12,1,'free',
     E'*And there appeared a great wonder in heaven; a woman clothed with the sun, and the moon under her feet, and upon her head a crown of twelve stars.* (Revelation 12:1) The woman of the twelve tribes, sun-clothed and moon-footed, is the same bride *fair as the moon, clear as the sun, and terrible as an army with banners* (Song of Solomon 6:10) — the covenant-people Yashar''el (Israel), arrayed and majestic.'),
    ('canon','song-of-solomon',6,10,'canon','revelation',21,2,'free',
     E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* (Revelation 21:2) The bride who *looketh forth as the morning* (Song of Solomon 6:10) is consummated as the new Jerusalem, adorned for her husband — the Bridegroom''s glorified people at the end of the matter.'),
    -- Thread 3: my undefiled is but one — the one undefiled bride (Song 6:9)
    ('canon','song-of-solomon',6,9,'canon','psalms',45,13,'free',
     E'*The king''s daughter is all glorious within: her clothing is of wrought gold.* (Psalm 45:13) The royal wedding psalm names the bride of the Messianic King; *my dove, my undefiled is but one... the daughters saw her, and blessed her* (Song of Solomon 6:9) is that same all-glorious bride, the only one, blessed of all.'),
    ('canon','song-of-solomon',6,9,'canon','ephesians',4,4,'free',
     E'*There is one body, and one Spirit, even as ye are called in one hope of your calling.* (Ephesians 4:4) The Beloved''s *my undefiled is but one* (Song of Solomon 6:9) answers forward to the one body — one bride, one undivided people, the two houses made one.'),
    ('canon','song-of-solomon',6,9,'canon','ephesians',5,27,'free',
     E'*That he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish.* (Ephesians 5:27) The undefiled, unblemished bride presented to the Bridegroom is exactly *my dove, my undefiled is but one* (Song of Solomon 6:9) — Yashar''el (Israel) restored, holy and without spot.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s322_song06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s322_song06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
-- Thread 1 (anchor 6:2 -> 6:3)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-6-i-am-my-beloveds-and-my-beloved-is-mine-the-covenant-belonging-formula',
       E'I Am My Beloved''s, and My Beloved Is Mine — the Covenant-Belonging Formula',
       E'*My beloved is gone down into his garden, to the beds of spices, to feed in the gardens, and to gather lilies. I am my beloved''s, and my beloved is mine: he feedeth among the lilies.* (Song of Solomon 6:2-3) The Bridegroom (Messiah) and his bride (Yashar''el, Israel, restored) name their mutual belonging — the same formula sung at *My beloved is mine, and I am his: he feedeth among the lilies* (Song of Solomon 2:16). This is no private romance but the covenant-belonging formula of the whole Tanakh. Torah set it down at Sinai: *And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:12). The prophets renew it: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33), and *I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27) — spoken in the very chapter where the stick of Yahudah (Judah) and the stick of Yashar''el (Israel) are made one. And to the scattered northern house, once *Lo-Ammi*, Hosea sings the reclaiming: *I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). The bride who says *I am my beloved''s* is the same covenant-people Yahuah has always claimed — gathered and restored, never a new people set in her place.',
       sv.verse_id, ev.verse_id, 'free', 39425
  FROM _s322_song06_lookup sv, _s322_song06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- Thread 2 (anchor 6:4 -> 6:10)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-6-terrible-as-an-army-with-banners-the-radiant-covenant-people',
       E'Terrible as an Army with Banners — the Radiant Covenant-People',
       E'*Thou art beautiful, O my love, as Tirzah, comely as Jerusalem, terrible as an army with banners* (Song of Solomon 6:4), and again *Who is she that looketh forth as the morning, fair as the moon, clear as the sun, and terrible as an army with banners?* (Song of Solomon 6:10). The bride is not merely lovely; she is radiant and arrayed — the glorified, gathered covenant-people. Her light is borrowed glory: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1), for *Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee* (Isaiah 60:2). She shines like the sun because the Beloved''s glory rests on her. The seer beholds her as *a woman clothed with the sun, and the moon under her feet, and upon her head a crown of twelve stars* (Revelation 12:1) — the twelve-tribed covenant-people, sun-clothed and moon-footed, the same bride *fair as the moon, clear as the sun*. And at the last she is consummated: *the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The army-with-banners is Yashar''el (Israel) gathered, arrayed, and shining with the glory of her Bridegroom.',
       sv.verse_id, ev.verse_id, 'free', 39426
  FROM _s322_song06_lookup sv, _s322_song06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- Thread 3 (anchor 6:9 -> 6:9)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-6-my-undefiled-is-but-one-the-one-undefiled-bride',
       E'My Undefiled Is But One — the One Undefiled Bride',
       E'*My dove, my undefiled is but one; she is the only one of her mother, she is the choice one of her that bare her. The daughters saw her, and blessed her; yea, the queens and the concubines, and they praised her.* (Song of Solomon 6:9) Among threescore queens and fourscore concubines and virgins without number, the Beloved has but one — undefiled, the only one, the choice one, blessed and praised by all. This is the royal bride of the wedding psalm: *The king''s daughter is all glorious within: her clothing is of wrought gold* (Psalm 45:13). She is one because the covenant-people are one — *There is one body, and one Spirit, even as ye are called in one hope of your calling* (Ephesians 4:4), the two houses of Yahudah (Judah) and Yashar''el (Israel) made a single bride. And she is undefiled because the Bridegroom himself makes her so: *that he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish* (Ephesians 5:27). The one undefiled bride is Yashar''el (Israel) restored — holy, whole, and his alone.',
       sv.verse_id, ev.verse_id, 'free', 39427
  FROM _s322_song06_lookup sv, _s322_song06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('song-of-solomon',6,3,'canon','song-of-solomon',2,16,1,E'*My beloved is mine, and I am his: he feedeth among the lilies.* (Song of Solomon 2:16) — the same mutual belonging-formula sung earlier in the book.'),
    ('song-of-solomon',6,3,'canon','leviticus',26,12,2,E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people.* (Leviticus 26:12) — the Torah''s covenant-belonging promise behind the bride''s words.'),
    ('song-of-solomon',6,3,'canon','jeremiah',31,33,3,E'*...will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33) — the renewed covenant, Torah on the heart, binds bride to Bridegroom.'),
    ('song-of-solomon',6,3,'canon','ezekiel',37,27,4,E'*I will be their Elohim (God), and they shall be my people.* (Ezekiel 37:27) — the two sticks made one; the gathered bride dwelt-with forever.'),
    ('song-of-solomon',6,3,'canon','hosea',2,23,5,E'*...Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23) — the scattered northern house reclaimed; belonging is restoration, not replacement.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-6-i-am-my-beloveds-and-my-beloved-is-mine-the-covenant-belonging-formula'
  JOIN _s322_song06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song06_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('song-of-solomon',6,10,'canon','isaiah',60,1,1,E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1) — the bride shines with the Beloved''s glory risen upon her.'),
    ('song-of-solomon',6,10,'canon','isaiah',60,2,2,E'*...Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* (Isaiah 60:2) — the covenant-people luminous while darkness covers the earth.'),
    ('song-of-solomon',6,10,'canon','revelation',12,1,3,E'*...a woman clothed with the sun, and the moon under her feet, and upon her head a crown of twelve stars.* (Revelation 12:1) — the twelve-tribed bride, sun-clothed, fair as the moon and clear as the sun.'),
    ('song-of-solomon',6,10,'canon','revelation',21,2,4,E'*...new Jerusalem... prepared as a bride adorned for her husband.* (Revelation 21:2) — the bride consummated and adorned for the Bridegroom.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-6-terrible-as-an-army-with-banners-the-radiant-covenant-people'
  JOIN _s322_song06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song06_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('song-of-solomon',6,9,'canon','psalms',45,13,1,E'*The king''s daughter is all glorious within: her clothing is of wrought gold.* (Psalm 45:13) — the royal bride of the Messianic King, all-glorious and choice.'),
    ('song-of-solomon',6,9,'canon','ephesians',4,4,2,E'*There is one body, and one Spirit...* (Ephesians 4:4) — the bride is but one; the two houses made a single people.'),
    ('song-of-solomon',6,9,'canon','ephesians',5,27,3,E'*...a glorious church, not having spot, or wrinkle... holy and without blemish.* (Ephesians 5:27) — the undefiled bride the Bridegroom himself makes whole.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='song-of-solomon-6-my-undefiled-is-but-one-the-one-undefiled-bride'
  JOIN _s322_song06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s322_song06_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_song-of-solomon_7.sql (Song of Solomon 7) -----
-- Song of Solomon chapter 7 — full-library cross-references
-- TAG: song07  |  session prefix: s322  |  sort_order band: 39450+
-- Source book_slug=song-of-solomon, edition=canon
-- READING FRAME: covenant-love allegory — Beloved=Messiah the Bridegroom (the Formed Son
--   who HAS a Father, Ps 45), bride=his people Yashar'el (Israel) restored, both houses
--   (NOT a new people — Rom 11:1-2 guard). The bridal descriptions (7:1-9) are handled
--   REVERENTLY and CHASTELY: the framework meaning is the Bridegroom's cherishing delight
--   in his redeemed people, never eroticized.
--
-- Song 7 coverage:
--   v.1-5  (the Beloved's praise of the bride's beauty — handled chastely)
--          NT:     none warranted (the descriptive imagery; covenant meaning carried in the v.6 delight thread + the marriage-covenant frame thread)
--          Extras: none warranted
--          Tanakh: folded into the marriage-covenant frame thread (Ps 45:11 the king desires the bride's beauty)
--   v.6   "How fair and how pleasant art thou, O love, for delights!"
--          NT:     none warranted (the delight is foregrounded through the prophets' "delighteth in thee")
--          Extras: none warranted
--          Tanakh: Isaiah 62:4 (Hephzibah=my-delight-is-in-her), Zephaniah 3:17 (rejoice over thee with joy), Isaiah 65:19 (I will rejoice in Jerusalem) — THREAD A
--   v.7-9 (the palm tree, the clusters, the best wine — handled chastely)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: none warranted (folded chastely under the delight/frame threads)
--   v.10  "I am my beloved's, and his desire is toward me."
--          NT:     none warranted (belonging-formula carried by the prophets; the desire redeemed at the Tanakh level)
--          Extras: none warranted
--          Tanakh: Song 2:16, Song 6:3 (the belonging deepened), Genesis 3:16 (the SAME word "desire" redeemed/rightly-ordered in covenant), Psalm 45:11 (the king greatly desires thy beauty), Hosea 2:19-20 (the betrothal formula) — THREAD B
--   v.1-10 (the whole — the marriage-covenant of the Bridegroom and bride)
--          NT:     Ephesians 5:25 (love your wives as Messiah loved), Revelation 19:7 (marriage of the Lamb) — THREAD C
--          Extras: none warranted
--          Tanakh: Isaiah 54:5 (thy Maker is thine husband), Hosea 2:19 (I will betroth thee unto me for ever), Psalm 45:11 (the king greatly desire thy beauty) — THREAD C
--   v.11-13 "Come, my beloved, let us go forth into the field... there will I give thee my loves" — the fruitful covenant-love
--          NT:     John 15:5 (the fruitful abiding in the vine) — THREAD D
--          Extras: none warranted
--          Tanakh: Song 6:11 (went down to see whether the vine flourished), Hosea 14:7 (they shall revive as the corn, grow as the vine) — THREAD D
--
-- THREADS (4):
--   A song-of-solomon-7-how-fair-and-pleasant-the-bridegroom-delights (7:6) — Tanakh (Isa/Zeph) — free
--   B song-of-solomon-7-i-am-my-beloveds-and-his-desire-is-toward-me (7:10) — Tanakh (Song/Gen/Ps/Hosea) — free
--   C song-of-solomon-7-the-marriage-covenant-of-the-bridegroom-and-bride (7:6-10) — Tanakh + NT (Isa/Hosea/Ps + Eph/Rev) — free
--   D song-of-solomon-7-let-us-go-forth-the-love-that-bears-fruit (7:11-13) — Tanakh + NT (Song/Hosea + John) — free
--

CREATE TEMP VIEW _s322_song07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD A: 7:6 the Bridegroom's delight
    ('canon','song-of-solomon',7,6,'canon','isaiah',62,4,'free',
     E'*Thou shalt no more be termed Forsaken; neither shall thy land any more be termed Desolate: but thou shalt be called Hephzi-bah, and thy land Beulah: for Yahuah (LORD) delighteth in thee, and thy land shall be married* (Isaiah 62:4). The Bridegroom''s cry *How fair and how pleasant art thou, O love, for delights!* (Song 7:6) is the very heart of the covenant: Yahuah names his restored people Hephzi-bah — "my delight is in her" — no longer Forsaken but married. His delight in the bride is his delight in his redeemed Yashar''el (Israel).'),
    ('canon','song-of-solomon',7,6,'canon','zephaniah',3,17,'free',
     E'*Yahuah Elohayka (The LORD thy God) in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing* (Zephaniah 3:17). The Bridegroom''s *How fair and how pleasant art thou, O love, for delights!* (Song 7:6) is the Formed Son — who has a Father — rejoicing over his bride with joy and singing; his delight is the gladness of Yahuah over restored Yashar''el (Israel).'),
    ('canon','song-of-solomon',7,6,'canon','isaiah',65,19,'free',
     E'*And I will rejoice in Jerusalem, and joy in my people: and the voice of weeping shall be no more heard in her, nor the voice of crying* (Isaiah 65:19). When the Bridegroom says *How fair and how pleasant art thou, O love, for delights!* (Song 7:6), it is Yahuah''s own promise to *rejoice in Jerusalem, and joy in my people* — the delight that ends all weeping in the restored bride.'),

    -- THREAD B: 7:10 I am my beloved's, and his desire is toward me
    ('canon','song-of-solomon',7,10,'canon','song-of-solomon',2,16,'free',
     E'*My beloved is mine, and I am his: he feedeth among the lilies* (Song 2:16). The bride''s belonging deepens across the Song: from *My beloved is mine, and I am his* (2:16) to the fuller surrender of *I am my beloved''s, and his desire is toward me* (Song 7:10) — the covenant-belonging matured from possession to the Beloved''s answering longing toward her.'),
    ('canon','song-of-solomon',7,10,'canon','song-of-solomon',6,3,'free',
     E'*I am my beloved''s, and my beloved is mine: he feedeth among the lilies* (Song 6:3). The bride who once said *I am my beloved''s, and my beloved is mine* (6:3) now rests wholly in him: *I am my beloved''s, and his desire is toward me* (Song 7:10) — no longer naming her own claim, but resting in his desire toward her. This is the covenant-belonging of Yashar''el (Israel) to her Bridegroom.'),
    ('canon','song-of-solomon',7,10,'canon','genesis',3,16,'free',
     E'*Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee* (Genesis 3:16). The same word "desire" that fell under the curse — *thy desire shall be to thy husband* — is redeemed and rightly ordered in the Bridegroom: *I am my beloved''s, and his desire is toward me* (Song 7:10). In covenant-love the longing is healed, mutual, and turned back toward the bride.'),
    ('canon','song-of-solomon',7,10,'canon','psalms',45,11,'free',
     E'*So shall the king greatly desire thy beauty: for he is thy Yahuah (Lord); and worship thou him* (Psalm 45:11). The wedding psalm of the Messiah-King answers the bride''s *his desire is toward me* (Song 7:10): the King *greatly desire[s] thy beauty* — the Formed Son''s covenant-longing toward his redeemed people.'),
    ('canon','song-of-solomon',7,10,'canon','hosea',2,19,'free',
     E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). The bride''s *I am my beloved''s, and his desire is toward me* (Song 7:10) is the answering "yes" to Yahuah''s everlasting betrothal of scattered Yashar''el (Israel) — the mutual covenant-belonging the prophets promised.'),

    -- THREAD C: 7:6-10 the marriage-covenant frame
    ('canon','song-of-solomon',7,10,'canon','isaiah',54,5,'free',
     E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called* (Isaiah 54:5). The Song''s mutual *I am my beloved''s, and his desire is toward me* (Song 7:10) sings what Isaiah declares plainly: *thy Maker is thine husband* — the Bridegroom is the Redeemer of Yashar''el (Israel), and the bride is his covenant-people, not a new people.'),
    ('canon','song-of-solomon',7,10,'canon','hosea',2,20,'free',
     E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20). The bride''s glad *I am my beloved''s* (Song 7:10) is sealed by the Bridegroom''s own oath of faithful betrothal; the marriage-covenant is everlasting, and to be his is to *know Yahuah (LORD)*.'),
    ('canon','song-of-solomon',7,6,'canon','ephesians',5,25,'free',
     E'*Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). The Bridegroom''s delight *How fair and how pleasant art thou, O love, for delights!* (Song 7:6) is the cherishing love the apostle reads forward to its fullness — Messiah loving and giving himself for his bride, *a great mystery... concerning Messiah (Christ) and the church* (Eph 5:32), the restored Yashar''el (Israel).'),
    ('canon','song-of-solomon',7,10,'canon','revelation',19,7,'free',
     E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). The Song''s covenant-belonging *I am my beloved''s, and his desire is toward me* (Song 7:10) reaches its consummation in the marriage of the Lamb — the Bridegroom and his made-ready bride, the wedding the whole canon has been singing toward.'),

    -- THREAD D: 7:11-13 the love that bears fruit
    ('canon','song-of-solomon',7,12,'canon','song-of-solomon',6,11,'free',
     E'*I went down into the garden of nuts to see the fruits of the valley, and to see whether the vine flourished, and the pomegranates budded* (Song 6:11). The bride''s glad invitation *let us see if the vine flourish, whether the tender grape appear, and the pomegranates bud forth* (Song 7:12) answers the Beloved''s own going-down to the garden — together now they tend the vineyard, the covenant-love that looks for fruit.'),
    ('canon','song-of-solomon',7,12,'canon','hosea',14,7,'free',
     E'*They that dwell under his shadow shall return; they shall revive as the corn, and grow as the vine: the scent thereof shall be as the wine of Lebanon* (Hosea 14:7). The bride''s *let us see if the vine flourish* (Song 7:12) is the prophet''s promise of restored Yashar''el (Israel): the returning people *revive as the corn, and grow as the vine* — the covenant-love that bears living fruit.'),
    ('canon','song-of-solomon',7,13,'canon','john',15,5,'free',
     E'*I am the vine, ye are the branches: He that abideth in me, and I in him, the same bringeth forth much fruit: for without me ye can do nothing* (John 15:5). When the bride says *at our gates are all manner of pleasant fruits, new and old, which I have laid up for thee, O my beloved* (Song 7:13), the love stored up for the Beloved is the fruit of abiding — the bride who dwells in the Bridegroom *bringeth forth much fruit*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s322_song07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s322_song07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
-- THREAD A
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-7-how-fair-and-pleasant-the-bridegroom-delights',
  E'How Fair and How Pleasant — the Bridegroom''s Delight in His People',
  E'*How fair and how pleasant art thou, O love, for delights!* (Song of Solomon 7:6). The Beloved''s cry of delight is the very heart-language of the covenant. Read chastely, it is not bodily appetite but the Bridegroom''s cherishing joy in his redeemed people. The prophets carry the same word forward: *Thou shalt no more be termed Forsaken... but thou shalt be called Hephzi-bah, and thy land Beulah: for Yahuah (LORD) delighteth in thee, and thy land shall be married* (Isaiah 62:4) — Hephzi-bah means "my delight is in her." The Bridegroom''s delight names the bride no longer Forsaken but married. *Yahuah Elohayka (The LORD thy God) in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing* (Zephaniah 3:17) — the Formed Son, who has a Father, rejoicing over his bride with singing. *And I will rejoice in Jerusalem, and joy in my people: and the voice of weeping shall be no more heard in her, nor the voice of crying* (Isaiah 65:19). The delight of Song 7:6 is Yahuah''s own delight in restored Yashar''el (Israel) — both houses gathered, not a new people, but the wife he always loved.',
  sv.verse_id, ev.verse_id, 'free', 39450
  FROM _s322_song07_lookup sv, _s322_song07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD B
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-7-i-am-my-beloveds-and-his-desire-is-toward-me',
  E'I Am My Beloved''s — the Desire Rightly Ordered in Covenant',
  E'*I am my beloved''s, and his desire is toward me* (Song of Solomon 7:10). This is the deepest belonging-line of the Song. Earlier the bride said *My beloved is mine, and I am his: he feedeth among the lilies* (Song 2:16), and again *I am my beloved''s, and my beloved is mine* (Song 6:3) — but here she no longer names her own claim; she rests wholly in HIS desire toward her. And the word "desire" is itself redeemed. Under the fall it was spoken in sorrow: *thy desire shall be to thy husband, and he shall rule over thee* (Genesis 3:16). In covenant-love that same longing is healed and rightly ordered — now *his desire is toward me*, mutual and cherishing. The wedding psalm answers: *So shall the king greatly desire thy beauty: for he is thy Yahuah (Lord); and worship thou him* (Psalm 45:11) — the Messiah-King''s covenant-longing toward his people. And the prophets seal it: *And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). The bride''s glad "I am his" is the answering yes of scattered Yashar''el (Israel) to her Bridegroom''s everlasting betrothal.',
  sv.verse_id, ev.verse_id, 'free', 39451
  FROM _s322_song07_lookup sv, _s322_song07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD C
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-7-the-marriage-covenant-of-the-bridegroom-and-bride',
  E'The Marriage-Covenant of the Bridegroom and His Bride',
  E'The Song''s mutual love — the Bridegroom''s delight (*How fair and how pleasant art thou, O love, for delights!*, Song 7:6) and the bride''s surrender (*I am my beloved''s, and his desire is toward me*, Song 7:10) — sings the one covenant-marriage the whole canon proclaims. Isaiah declares it plainly: *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called* (Isaiah 54:5) — the Bridegroom is the Redeemer of Yashar''el, the bride is his covenant-people, not a new people. Hosea seals the oath: *I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20). Psalm 45 sings the King''s longing: *So shall the king greatly desire thy beauty* (Psalm 45:11). The apostle reads the delight forward to its fullness: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25) — *a great mystery... concerning Messiah (Christ) and the church* (Eph 5:32). And it consummates at the end of the age: *Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). The Beloved of the Song is the Formed Son who has a Father; the bride is restored Yashar''el, both houses made ready for the wedding.',
  sv.verse_id, ev.verse_id, 'free', 39452
  FROM _s322_song07_lookup sv, _s322_song07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD D
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-7-let-us-go-forth-the-love-that-bears-fruit',
  E'Let Us Go Forth — the Covenant-Love That Bears Fruit',
  E'*Come, my beloved, let us go forth into the field; let us lodge in the villages. Let us get up early to the vineyards; let us see if the vine flourish, whether the tender grape appear, and the pomegranates bud forth: there will I give thee my loves* (Song of Solomon 7:11-12). The bride''s glad invitation is the love that goes out together to tend the vineyard and look for fruit. It answers the Beloved''s own going-down: *I went down into the garden of nuts to see the fruits of the valley, and to see whether the vine flourished, and the pomegranates budded* (Song 6:11). The prophet sings the same flourishing over restored Yashar''el (Israel): *They that dwell under his shadow shall return; they shall revive as the corn, and grow as the vine: the scent thereof shall be as the wine of Lebanon* (Hosea 14:7). And the Bridegroom, taking flesh, names the secret of all fruitfulness: *I am the vine, ye are the branches: He that abideth in me, and I in him, the same bringeth forth much fruit: for without me ye can do nothing* (John 15:5). When the bride says *at our gates are all manner of pleasant fruits, new and old, which I have laid up for thee, O my beloved* (Song 7:13), the love stored up for the Beloved is the fruit of abiding in him.',
  sv.verse_id, ev.verse_id, 'free', 39453
  FROM _s322_song07_lookup sv, _s322_song07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD A members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*for Yahuah (LORD) delighteth in thee, and thy land shall be married* (Isaiah 62:4) — the bride named Hephzi-bah, "my delight is in her"; the Bridegroom''s delight of Song 7:6.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-how-fair-and-pleasant-the-bridegroom-delights'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he will rejoice over thee with joy... he will joy over thee with singing* (Zephaniah 3:17) — the Formed Son who has a Father rejoicing over his bride.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-how-fair-and-pleasant-the-bridegroom-delights'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And I will rejoice in Jerusalem, and joy in my people* (Isaiah 65:19) — the delight that ends all weeping in the restored bride.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-how-fair-and-pleasant-the-bridegroom-delights'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD B members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*My beloved is mine, and I am his* (Song 2:16) — the belonging that the surrender of 7:10 deepens.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='song-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-i-am-my-beloveds-and-his-desire-is-toward-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am my beloved''s, and my beloved is mine* (Song 6:3) — now she rests wholly in his desire, not her own claim.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='song-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-i-am-my-beloveds-and-his-desire-is-toward-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thy desire shall be to thy husband* (Genesis 3:16) — the same word "desire," fallen under the curse, now redeemed and rightly ordered in covenant-love.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-i-am-my-beloveds-and-his-desire-is-toward-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*So shall the king greatly desire thy beauty* (Psalm 45:11) — the Messiah-King''s covenant-longing toward his people.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-i-am-my-beloveds-and-his-desire-is-toward-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*And I will betroth thee unto me for ever* (Hosea 2:19) — the bride''s "I am his" answers Yahuah''s everlasting betrothal of scattered Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-i-am-my-beloveds-and-his-desire-is-toward-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD C members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thy Maker is thine husband... and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5) — the Bridegroom is the Redeemer; the bride is his covenant-people, not a new people.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-the-marriage-covenant-of-the-bridegroom-and-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20) — the everlasting marriage-oath the bride''s gladness answers.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-the-marriage-covenant-of-the-bridegroom-and-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25) — the Bridegroom''s delight read forward to its fullness, the great mystery of Messiah and his bride.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-the-marriage-covenant-of-the-bridegroom-and-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the consummation: the Bridegroom and his made-ready bride.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-the-marriage-covenant-of-the-bridegroom-and-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD D members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I went down into the garden of nuts... to see whether the vine flourished, and the pomegranates budded* (Song 6:11) — the Beloved''s going-down that the bride''s invitation answers; together they tend the vineyard.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='song-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-let-us-go-forth-the-love-that-bears-fruit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they shall revive as the corn, and grow as the vine* (Hosea 14:7) — restored Yashar''el (Israel) flourishing; the covenant-love that bears living fruit.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-let-us-go-forth-the-love-that-bears-fruit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He that abideth in me, and I in him, the same bringeth forth much fruit* (John 15:5) — the love stored up for the Beloved (Song 7:13) is the fruit of abiding in the Bridegroom.'
  FROM cross_reference_threads t
  JOIN _s322_song07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s322_song07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-7-let-us-go-forth-the-love-that-bears-fruit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_song-of-solomon_8.sql (Song of Solomon 8) -----
-- Chapter: Song of Solomon 8 (the KEYSTONE/closing chapter — love strong as death, the seal, the consummation)
-- Tag: song08   Temp view: _s322_song08_lookup   Session prefix: s322
-- Slug prefix: song-of-solomon-8-...   Sort band: 39475 (+1 per thread → 39475..39479)
-- Source book_slug: song-of-solomon (canon), chapter 8.
--
-- READING FRAME: REVERENT covenant-love allegory, never eroticized. The Beloved/Bridegroom = the
-- Messiah, the Formed Son who HAS a Father (the Ps45 King anointed by his Elohim). The bride = his
-- people Yashar'el (Israel) restored — both houses, NOT a new people grafted in by confession
-- (Rom 11:1-2 anti-replacement guard woven into the marriage thread).
--
-- HOW 8:6-7 (the keystone) IS FRAMED: "love is strong as death... many waters cannot quench love" is
-- the UNQUENCHABLE COVENANT-LOVE of the Bridegroom that death cannot defeat or separate. The SEAL upon
-- heart and arm (8:6) is split into its own thread and bound to Deut 6:8 — the covenant-love AND the
-- Torah-words both sealed on heart and hand — and to the Spirit's sealing (Eph 1:13). "Love strong as
-- death / the vehement flame / many waters cannot quench it" is bound to Rom 8:35-39 (nothing, not even
-- death, separates us from the love of Messiah) and John 13:1 (he loved his own unto the end). The love
-- that cannot be bought (8:7b) = the love only GIVEN — the Bridegroom who gave himself, redeeming not
-- with silver and gold but his precious blood (1 Pet 1:18-19; lateral Prov 6:35). NOT eroticized; the
-- whole movement read as the covenant-betrothal of the Redeemer to his redeemed people.
--
-- ---- Song of Solomon 8 coverage ----
--   v.5  (up from the wilderness leaning on her beloved)
--        NT:     none warranted directly (wilderness-leaning carried via Tanakh; the covenant-history)
--        Extras: none warranted
--        Tanakh: Song 3:6 (who is this... out of the wilderness); Deut 8:2 (Yahuah led thee in the
--                wilderness); Jer 2:2 (the love of thine espousals... in the wilderness); Hosea 2:14
--                (I will allure her, bring her into the wilderness); Isa 40:3 (voice in the wilderness);
--                Micah 7:15 (days of thy coming out of Egypt). → THREAD 1
--   v.6a (set me as a seal upon thine heart, as a seal upon thine arm)
--        NT:     Eph 1:13 (sealed with that holy Spirit of promise)
--        Extras: none warranted
--        Tanakh: Deut 6:8 (bind them for a sign upon thine hand... frontlets between thine eyes —
--                covenant-words/love sealed on heart and hand). → THREAD 2
--   v.6b-7 (love is strong as death... many waters cannot quench love... floods cannot drown it)
--        NT:     Rom 8:35-39 (who shall separate us from the love of Messiah... neither death...);
--                John 13:1 (having loved his own... he loved them unto the end). → THREAD 3
--   v.7b (if a man would give all the substance of his house for love, it would utterly be contemned)
--        NT:     1 Pet 1:18-19 (not redeemed with corruptible things... but the precious blood)
--        Extras: none warranted
--        Tanakh: Prov 6:35 (he will not regard any ransom — love cannot be bought). → THREAD 4
--                (folded into the Redeemer-husband / marriage-of-the-Lamb thread; the love only GIVEN)
--   v.5-7 (the covenant-betrothal frame underlying the whole keystone)
--        NT:     Eph 5:25-27 (Messiah loved the church and gave himself); Rev 19:7 (the marriage of
--                the Lamb is come, his wife hath made herself ready); Rom 11:1-2 (Elohim hath NOT cast
--                away his people — the anti-replacement guard, the bride IS Yashar'el restored).
--        Tanakh: Isa 54:5 (thy Maker is thine husband... thy Redeemer the Holy One of Yashar'el);
--                Hosea 2:19-20 (I will betroth thee unto me for ever); Ps 45:6-7 (the King anointed by
--                his Elohim — the Formed Son who has a Father). → THREAD 4
--   v.8-12 (the little sister, the vineyard let out)
--        NT:     none warranted   Extras: none warranted   Tanakh: none warranted (handled lightly,
--                no thread — the gathering/care motif already carried by the wilderness + marriage threads)
--   v.13-14 (the companions hearken; "make haste, my beloved" — the closing bride's-cry)
--        NT:     Rev 22:17 (the Spirit and the bride say, Come); Rev 22:20 (Even so, come, Lord Yahusha)
--        Extras: none warranted
--        Tanakh: none warranted (the longing-for-the-Bridegroom's-return closes BOTH this book and the
--                canon — weave FORWARD to the canon's last words). → THREAD 5
--
-- ---- Threads (5) ----
--   1. song-of-solomon-8-coming-up-from-the-wilderness-leaning-on-her-beloved   [Tanakh]            free
--   2. song-of-solomon-8-set-me-as-a-seal-upon-thine-heart-and-arm              [Tanakh + NT]       free
--   3. song-of-solomon-8-love-is-strong-as-death-many-waters-cannot-quench-it   [NT]                free
--   4. song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb      [Tanakh + NT]       free
--   5. song-of-solomon-8-make-haste-my-beloved-the-bride-says-come              [NT]                free
-- All members canon (Tanakh + NT) → every thread tier_required 'free'.

CREATE TEMP VIEW _s322_song08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: 8:5 up from the wilderness leaning on her beloved (Tanakh wilderness-betrothal)
    ('canon','song-of-solomon',8,5,'canon','song-of-solomon',3,6,'free',
      E'*Who is this that cometh out of the wilderness like pillars of smoke, perfumed with myrrh and frankincense, with all powders of the merchant?* (Song of Solomon 3:6). The same wondering cry opens here — *Who is this that cometh up from the wilderness, leaning upon her beloved?* (Song 8:5) — but now the bride does not come alone in pillars of smoke; she comes up LEANING on him. The book that began with the question ends with the answer: the redeemed brought up out of the wilderness held by the Beloved himself.'),
    ('canon','song-of-solomon',8,5,'canon','deuteronomy',8,2,'free',
      E'*And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart* (Deuteronomy 8:2). The bride *cometh up from the wilderness, leaning upon her beloved* (Song 8:5) — the very wilderness journey of Yashar''el (Israel), led the whole way by the Formed Son who went before them; she did not walk it alone, she leaned on him.'),
    ('canon','song-of-solomon',8,5,'canon','jeremiah',2,2,'free',
      E'*I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest after me in the wilderness, in a land that was not sown* (Jeremiah 2:2). Yahuah names the wilderness years the days of the BETROTHAL — *the love of thine espousals*. So the bride *leaning upon her beloved* coming up out of the wilderness (Song 8:5) is the espoused people, the wandering made a wedding-journey by his love.'),
    ('canon','song-of-solomon',8,5,'canon','hosea',2,14,'free',
      E'*Therefore, behold, I will allure her, and bring her into the wilderness, and speak comfortably unto her* (Hosea 2:14). The estranged wife is wooed back THROUGH the wilderness, then betrothed for ever (*I will betroth thee unto me for ever* — Hosea 2:19). The bride *coming up from the wilderness, leaning upon her beloved* (Song 8:5) is that allured and restored wife, Yashar''el (Israel) brought home.'),
    ('canon','song-of-solomon',8,5,'canon','isaiah',40,3,'free',
      E'*The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD), make straight in the desert a highway for our Elohim (God)* (Isaiah 40:3). The wilderness is the road of comfort and return for the gathered people; up that highway the bride *cometh up from the wilderness, leaning upon her beloved* (Song 8:5), brought home along the very way prepared for Yahuah.'),
    ('canon','song-of-solomon',8,5,'canon','micah',7,15,'free',
      E'*According to the days of thy coming out of the land of Egypt will I shew unto him marvellous things* (Micah 7:15). The new exodus repeats the old; the redeemed come up out of bondage and wilderness again. So the bride *cometh up from the wilderness, leaning upon her beloved* (Song 8:5) — the second coming-up, the people leaning on the One who leads them out.'),

    -- THREAD 2: 8:6a set me as a seal upon thine heart, as a seal upon thine arm
    ('canon','song-of-solomon',8,6,'canon','deuteronomy',6,8,'free',
      E'*And thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8) — the covenant-words bound on hand and head, the love of Yahuah (Deut 6:5) and his Torah sealed onto heart and hand together. So the bride asks, *Set me as a seal upon thine heart, as a seal upon thine arm* (Song 8:6): the same binding-love, the covenant graven on heart and arm, the bride and the Word made one possession.'),
    ('canon','song-of-solomon',8,6,'canon','ephesians',1,13,'free',
      E'*In whom also after that ye believed, ye were sealed with that holy Spirit of promise* (Ephesians 1:13). The bride''s plea — *Set me as a seal upon thine heart, as a seal upon thine arm* (Song 8:6) — is answered in the Bridegroom''s sealing of his own: the Spirit is the seal set upon the people, the earnest of the inheritance, the mark that they are his and he is theirs.'),

    -- THREAD 3: 8:6b-7 love is strong as death; many waters cannot quench love
    ('canon','song-of-solomon',8,6,'canon','romans',8,38,'free',
      E'*For I am persuaded, that neither death, nor life, nor angels, nor principalities, nor powers, nor things present, nor things to come* (Romans 8:38) — *shall be able to separate us from the love of Messiah* (Rom 8:35,39). This is *love is strong as death* (Song 8:6) made unbreakable: the covenant-love of the Bridegroom that death itself cannot overpower or sever.'),
    ('canon','song-of-solomon',8,7,'canon','romans',8,35,'free',
      E'*Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35). *Many waters cannot quench love, neither can the floods drown it* (Song 8:7): no flood of tribulation, no sword, no death drowns the love that binds the Beloved to his bride — its vehement flame burns through every water.'),
    ('canon','song-of-solomon',8,6,'canon','john',13,1,'free',
      E'*Having loved his own which were in the world, he loved them unto the end* (John 13:1). Here the love *strong as death* (Song 8:6) is shown strong THROUGH death: the Bridegroom, knowing his hour was come, loved his own to the uttermost — the coals of fire, the most vehement flame, the love that the grave could not put out.'),

    -- THREAD 4: 8:5-7 the Redeemer-husband and the marriage of the Lamb (incl. 8:7b love cannot be bought)
    ('canon','song-of-solomon',8,7,'canon','proverbs',6,35,'free',
      E'*He will not regard any ransom; neither will he rest content, though thou givest many gifts* (Proverbs 6:35). Love and jealousy are not for sale: *if a man would give all the substance of his house for love, it would utterly be contemned* (Song 8:7). The covenant-love of the Bridegroom cannot be purchased with substance — it can only be given.'),
    ('canon','song-of-solomon',8,7,'canon','1-peter',1,18,'free',
      E'*Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold... But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:18-19). *All the substance of his house* could not buy this love (Song 8:7); the Bridegroom redeemed his bride not with silver and gold but with himself, the love that is only ever given.'),
    ('canon','song-of-solomon',8,6,'canon','ephesians',5,25,'free',
      E'*Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). The seal of love *strong as death* (Song 8:6) is the Bridegroom giving himself for the bride; what the Song allegorizes, Sha''ul names plainly — Messiah and his people, the great mystery of one flesh.'),
    ('canon','song-of-solomon',8,5,'canon','isaiah',54,5,'free',
      E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). The Beloved on whom the bride leans (Song 8:5) is the Husband-Redeemer of Yashar''el (Israel) himself — the bride is no new people but the restored covenant-wife, her Maker her husband.'),
    ('canon','song-of-solomon',8,5,'canon','hosea',2,19,'free',
      E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). The leaning bride (Song 8:5) is the betrothed-for-ever; her coming up from the wilderness IS the everlasting betrothal of Yashar''el (Israel) restored to her Husband.'),
    ('canon','song-of-solomon',8,6,'canon','psalms',45,6,'free',
      E'*Thy throne, O Elohim (God), is for ever and ever... Thou lovest righteousness... therefore Elohim (God), thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows* (Psalm 45:6-7). The Bridegroom whose love is *strong as death* (Song 8:6) is the King of Psalm 45 — anointed BY his Elohim, the Formed Son who has a Father, the royal Husband desiring the bride''s beauty.'),
    ('canon','song-of-solomon',8,7,'canon','revelation',19,7,'free',
      E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). The unquenchable love of Song 8:6-7 reaches its wedding-day: the marriage of the Lamb, the bride arrayed in the fine linen which is the righteousness of saints — the consummation the Song longs toward.'),
    ('canon','song-of-solomon',8,6,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1-2). The seal of love *strong as death* (Song 8:6) guards against every replacement reading: the bride is Yashar''el (Israel) NOT cast off but kept and gathered — the foreknown people the Bridegroom never abandons.'),

    -- THREAD 5: 8:13-14 make haste, my beloved — the closing bride's-cry, Come
    ('canon','song-of-solomon',8,14,'canon','revelation',22,17,'free',
      E'*And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come* (Revelation 22:17). The Song ends on the bride''s cry — *Make haste, my beloved* (Song 8:14) — and the canon itself ends on the same cry: the Spirit and the bride together calling the Bridegroom, Come.'),
    ('canon','song-of-solomon',8,14,'canon','revelation',22,20,'free',
      E'*He which testifieth these things saith, Surely I come quickly. Amen. Even so, come, Lord Yahusha (Lord Jesus)* (Revelation 22:20). *Make haste, my beloved, and be thou like to a roe or to a young hart upon the mountains of spices* (Song 8:14) — the closing longing of the Song is the closing longing of all Scripture: the bride pleading for the Bridegroom''s swift return.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s322_song08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s322_song08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. cross_reference_threads ============================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-8-coming-up-from-the-wilderness-leaning-on-her-beloved',
  E'Coming up from the wilderness, leaning upon her Beloved',
  E'The closing chapter opens with the wondering cry, *Who is this that cometh up from the wilderness, leaning upon her beloved?* (Song of Solomon 8:5). The book that began with the same question — *Who is this that cometh out of the wilderness like pillars of smoke?* (Song 3:6) — now answers it: the bride does not come alone, she comes up LEANING on him. This is the redeemed people brought up through the wilderness held by the Beloved. The wilderness years were the years Yahuah led Yashar''el (Israel) the whole way — *thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness* (Deuteronomy 8:2) — and he named those years the days of the betrothal: *I remember thee... the love of thine espousals, when thou wentest after me in the wilderness, in a land that was not sown* (Jeremiah 2:2). The estranged wife is wooed back the same road: *I will allure her, and bring her into the wilderness, and speak comfortably unto her* (Hosea 2:14), unto the everlasting betrothal. It is the highway of comfort and return — *the voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD)* (Isaiah 40:3) — and the road of the new exodus: *According to the days of thy coming out of the land of Egypt will I shew unto him marvellous things* (Micah 7:15). The bride leaning on her Beloved is Yashar''el (Israel) coming home, leaning on the One who led her out.',
  sv.verse_id, ev.verse_id, 'free', 39475
  FROM _s322_song08_lookup sv, _s322_song08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-8-set-me-as-a-seal-upon-thine-heart-and-arm',
  E'Set me as a seal upon thine heart, as a seal upon thine arm',
  E'*Set me as a seal upon thine heart, as a seal upon thine arm* (Song of Solomon 8:6) — the bride asks to be graven onto the Beloved''s very heart and arm, an unremovable mark of belonging. The Torah already knows this binding: *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deuteronomy 6:5), and *thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8) — the covenant-love and the covenant-words sealed together on heart and hand. The bride and the Word are one possession, fastened to the Beloved. And what the bride pleads, the Bridegroom answers in the sealing of his own: *In whom also after that ye believed, ye were sealed with that holy Spirit of promise* (Ephesians 1:13) — the Spirit is the seal set upon the people, the mark that they are his and he is theirs, the earnest of the whole inheritance.',
  sv.verse_id, ev.verse_id, 'free', 39476
  FROM _s322_song08_lookup sv, _s322_song08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-8-love-is-strong-as-death-many-waters-cannot-quench-it',
  E'Love is strong as death — many waters cannot quench it',
  E'Here is the keystone of the whole book: *for love is strong as death; jealousy is cruel as the grave: the coals thereof are coals of fire, which hath a most vehement flame. Many waters cannot quench love, neither can the floods drown it* (Song of Solomon 8:6-7). This is the unquenchable covenant-love of the Bridegroom for his bride — a love death cannot overpower, a flame no flood can drown. The New Testament makes it unbreakable: *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35), and *I am persuaded, that neither death, nor life, nor angels, nor principalities, nor powers... shall be able to separate us from the love of Messiah* (Romans 8:38-39). The flood of tribulation and the sword of death cannot drown it. And it is shown strong THROUGH death in the Bridegroom himself: *having loved his own which were in the world, he loved them unto the end* (John 13:1) — the coals of fire, the most vehement flame, the love the grave could not put out.',
  sv.verse_id, ev.verse_id, 'free', 39477
  FROM _s322_song08_lookup sv, _s322_song08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb',
  E'The Redeemer-Husband and the marriage of the Lamb',
  E'The Beloved on whom the bride leans, whose love is *strong as death* (Song of Solomon 8:6), is the Husband-Redeemer of Yashar''el (Israel) himself: *For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). The betrothal is everlasting — *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). He is the King of Psalm 45, the Formed Son who has a Father, *anointed... with the oil of gladness above thy fellows* by his own Elohim (Psalm 45:6-7). His love cannot be bought — *if a man would give all the substance of his house for love, it would utterly be contemned* (Song 8:7), for *he will not regard any ransom* (Proverbs 6:35) — it can only be given: *ye were not redeemed with corruptible things, as silver and gold... But with the precious blood of Messiah (Christ)* (1 Peter 1:18-19), even as *Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). And the bride is no new people grafted in by confession — *Hath Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1-2). She is Yashar''el (Israel) restored, kept for the wedding-day: *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7).',
  sv.verse_id, ev.verse_id, 'free', 39478
  FROM _s322_song08_lookup sv, _s322_song08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-solomon-8-make-haste-my-beloved-the-bride-says-come',
  E'Make haste, my Beloved — the bride says, Come',
  E'The Song closes on the bride''s cry for the Beloved: *Make haste, my beloved, and be thou like to a roe or to a young hart upon the mountains of spices* (Song of Solomon 8:14). It is the longing for the Bridegroom''s swift return — and it is the very note the whole canon ends upon. *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come* (Revelation 22:17): the Spirit and the bride together call the Bridegroom home. And the last words of Scripture answer the bride''s plea: *He which testifieth these things saith, Surely I come quickly. Amen. Even so, come, Lord Yahusha (Lord Jesus)* (Revelation 22:20). The closing longing of the Song is the closing longing of all the Word — the bride pleading, the Bridegroom promising to come quickly.',
  sv.verse_id, ev.verse_id, 'free', 39479
  FROM _s322_song08_lookup sv, _s322_song08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='song-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. cross_reference_thread_members ============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Who is this that cometh out of the wilderness like pillars of smoke?* (Song of Solomon 3:6) — the book''s opening question answered: now she comes up LEANING on him.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='song-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-coming-up-from-the-wilderness-leaning-on-her-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness* (Deuteronomy 8:2) — the wilderness journey the bride leans through, never walked alone.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-coming-up-from-the-wilderness-leaning-on-her-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The love of thine espousals, when thou wentest after me in the wilderness* (Jeremiah 2:2) — Yahuah names the wilderness years the days of the betrothal.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-coming-up-from-the-wilderness-leaning-on-her-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will allure her, and bring her into the wilderness* (Hosea 2:14) — the estranged wife wooed back through the wilderness unto the everlasting betrothal.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-coming-up-from-the-wilderness-leaning-on-her-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD)* (Isaiah 40:3) — the wilderness highway of comfort and return, the road home.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-coming-up-from-the-wilderness-leaning-on-her-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*According to the days of thy coming out of the land of Egypt will I shew unto him marvellous things* (Micah 7:15) — the new exodus, the second coming-up out of bondage and wilderness.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-coming-up-from-the-wilderness-leaning-on-her-beloved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8) — the covenant-love and the Torah-words sealed on heart and hand, the same binding the bride asks.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-set-me-as-a-seal-upon-thine-heart-and-arm'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye were sealed with that holy Spirit of promise* (Ephesians 1:13) — the Bridegroom answers the plea; the Spirit is the seal set upon his people.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-set-me-as-a-seal-upon-thine-heart-and-arm'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Neither death, nor life... shall be able to separate us from the love of Messiah* (Romans 8:38-39) — love *strong as death* made unbreakable; death cannot sever it.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-love-is-strong-as-death-many-waters-cannot-quench-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Who shall separate us from the love of Messiah?... famine, or nakedness, or peril, or sword?* (Romans 8:35) — *many waters cannot quench love*; no flood of tribulation drowns it.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-love-is-strong-as-death-many-waters-cannot-quench-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Having loved his own... he loved them unto the end* (John 13:1) — the love *strong as death* shown strong THROUGH death; the grave could not put out the vehement flame.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-love-is-strong-as-death-many-waters-cannot-quench-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thy Maker is thine husband... thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5) — the Beloved is the Husband-Redeemer of Yashar''el himself.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will betroth thee unto me for ever* (Hosea 2:19) — the leaning bride is the everlasting-betrothed, Yashar''el restored to her Husband.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thy throne, O Elohim (God), is for ever and ever... Elohim, thy Elohim, hath anointed thee* (Psalm 45:6-7) — the royal Bridegroom, the Formed Son anointed by his Father.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He will not regard any ransom* (Proverbs 6:35) — love cannot be bought, *if a man would give all the substance of his house for love, it would utterly be contemned*.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Ye were not redeemed with corruptible things... but with the precious blood of Messiah* (1 Peter 1:18-19) — the love that could not be bought was given; the Bridegroom redeemed his bride with himself.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25) — the seal of love strong as death is the Bridegroom giving himself; the great mystery named plainly.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1-2) — the anti-replacement guard: the bride is Yashar''el restored, NOT a new people; the foreknown wife never abandoned.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*The marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the consummation the Song longs toward, the bride arrayed for the wedding-day.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-the-redeemer-husband-and-the-marriage-of-the-lamb'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And the Spirit and the bride say, Come* (Revelation 22:17) — the canon ends on the same cry the Song ends on: the bride calling the Bridegroom home.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-make-haste-my-beloved-the-bride-says-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Surely I come quickly. Amen. Even so, come, Lord Yahusha (Lord Jesus)* (Revelation 22:20) — the last words of Scripture answer the bride''s *Make haste, my beloved*.'
  FROM cross_reference_threads t
  JOIN _s322_song08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='song-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s322_song08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='song-of-solomon-8-make-haste-my-beloved-the-bride-says-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session322 — Song of Solomon cross-references complete.'
