-- ----- fragment: minion_psalms_133.sql (Psalm 133) -----
--
-- Chapter: Psalm 133 (of David — a Song of Ascents; KEYSTONE: brethren dwelling in unity)
-- Tag: s302 / ps133    Sort band base: 25300 (25300, 25303, 25306, 25309)
-- Source rows ALWAYS 'canon','psalms',133,v   |   slugs SINGULAR prefix psalm-133-
--
-- Psalm 133 coverage:
--   v.1  Behold, how good and how pleasant it is for brethren to dwell together in unity!
--        NT:     John 17:21, John 17:23 (that they all may be one); Eph 4:3,4:6 (unity of the Spirit; one body, one Elohim and Father) — WARRANTED
--        Extras: Ecclesiasticus (Sirach) 25:1 (the unity of brothers) — WARRANTED
--        Tanakh: Ezek 37:17 (one in thine hand), 37:22 (no more two nations) two-house reunion; Gen 13:8 (we be brethren); Rom 11:1 two-house guard — WARRANTED
--   v.2  the precious ointment upon the head... Aaron's beard... skirts of his garments
--        NT:     1 John 2:20 (an unction from the Holy One), 2:27 (the anointing... abideth in you) — WARRANTED (oil from Head to body = Spirit)
--        Extras: none warranted (Exod-anointing already canon; no cleaner extras witness)
--        Tanakh: Exod 30:25 (an holy anointing oil), 30:30 (anoint Aaron); Ps 45:7 (anointed with the oil of gladness above thy fellows) — WARRANTED
--   v.3  As the dew of Hermon... dew upon the mountains of Zion: for there Yahuah commanded the blessing, even life for evermore
--        NT:     John 10:10 (life... more abundantly) — WARRANTED (life-for-evermore weave)
--        Extras: none warranted (clean canon witnesses carry the dew/blessing/life weave)
--        Tanakh: Deut 33:13 (dew, of Joseph/Ephraim), 33:28 (heavens drop down dew); Lev 25:21 (I will command my blessing); Dan 12:2 (everlasting life); Ezek 37:26 (everlasting covenant) — WARRANTED
--
-- Threads (4):
--   psalm-133-brethren-dwell-in-unity-the-two-houses-made-one  [Tanakh + NT + extras] tier=extras  v1
--   psalm-133-the-precious-anointing-oil-from-the-head-to-the-body  [Tanakh + NT] tier=free  v2
--   psalm-133-as-the-dew-of-hermon-the-commanded-blessing  [Tanakh] tier=free  v3
--   psalm-133-there-yahuah-commanded-life-for-evermore  [Tanakh + NT] tier=free  v3
--
-- Framework-load-bearing framing notes:
--   * v1 read as the TWO-HOUSE reunion (Judah + Ephraim/Joseph made one, Ezek 37), NOT a generic
--     fellowship sentiment and NOT a replacement people — Rom 11:1 guard quoted in-thread.
--   * v2 oil flows FROM the head DOWN to the body = the Spirit from the Anointed Head to the members
--     (1 John 2:20,27); Ps 45:7 = the King anointed above his fellows. No co-equal grammar.
--   * v3 "commanded the blessing, even life for evermore" = the covenant blessing (Lev 25:21) issuing
--     in everlasting life (Dan 12:2) under the everlasting covenant of peace (Ezek 37:26) — not a poetic
--     flourish but the resurrection-life of the gathered house.

CREATE TEMP VIEW _s302_ps133_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- ---- v1 brethren in unity / two-house reunion ----
    ('canon','psalms',133,1,'canon','ezekiel',37,17,'free',
     E'*And join them one to another into one stick; and they shall become one in thine hand.* (Ezekiel 37:17) The *brethren* who *dwell together in unity* are the two sticks — *For Yahudah (Judah)* and *For Joseph, the stick of Ephraim* (37:16) — made one in the hand of Yahuah (LORD). The unity David sings is not a mood but the regathering of the divided house.'),
    ('canon','psalms',133,1,'canon','ezekiel',37,22,'free',
     E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel)... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all.* (Ezekiel 37:22) *How good and how pleasant it is for brethren to dwell together in unity* is the prophesied end of the divorce — Ephraim and Yahudah no longer two, but one people under one shepherd.'),
    ('canon','psalms',133,1,'canon','john',17,21,'free',
     E'*That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me.* (John 17:21) Yahusha (Jesus) prays Psalm 133 forward — the *unity* of the *brethren* is the oneness the Son asks the Father to keep, the gathered house made one.'),
    ('canon','psalms',133,1,'canon','john',17,23,'free',
     E'*I in them, and thou in me, that they may be made perfect in one; and that the world may know that thou hast sent me.* (John 17:23) The *brethren* dwelling *in unity* are *made perfect in one* — the two houses and all the scattered seed gathered into the one body of the Anointed, the Formed Son in them and the Father in him.'),
    ('canon','psalms',133,1,'canon','ephesians',4,3,'free',
     E'*Endeavouring to keep the unity of the Spirit in the bond of peace.* (Ephesians 4:3) The *unity* of *brethren* is kept by the Spirit in the bond of peace — the same covenant of peace Yahuah (LORD) makes with the regathered house (Ezekiel 37:26).'),
    ('canon','psalms',133,1,'canon','ephesians',4,6,'free',
     E'*One Elohim (God) and Father of all, who is above all, and through all, and in you all.* (Ephesians 4:6) *There is one body, and one Spirit... One Elohim and Father* — the *unity* of the *brethren* rests on the one Father, the formless Source, never two peoples and never co-equal persons but one household gathered to him.'),
    ('canon','psalms',133,1,'canon','genesis',13,8,'free',
     E'*And Abram said unto Lot, Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren.* (Genesis 13:8) The pattern of *brethren* who refuse strife runs from the father of the promise; what Abram kept toward Lot, the whole seed will keep when it *dwells together in unity*.'),
    ('canon','psalms',133,1,'canon','romans',11,1,'free',
     E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1) The *brethren* gathered *in unity* are the one people never cast off — the guard against any reading that makes the reunited house a replacement people instead of Yashar''el (Israel) restored.'),
    ('canon','psalms',133,1,'apocrypha','ecclesiasticus',25,1,'extras',
     E'*In three things I was beautified, and stood up beautiful both before Yahuah (God) and men: the unity of brothers, the love of neighbours, a man and a wife that agree together.* (Ecclesiasticus 25:1) The wisdom of the second Temple names *the unity of brothers* first among the things beautiful before Yahuah (God) — the very *brethren... in unity* whose goodness and pleasantness David beholds.'),
    -- ---- v2 the precious anointing oil ----
    ('canon','psalms',133,2,'canon','exodus',30,25,'free',
     E'*And thou shalt make it an oil of holy ointment, an ointment compound after the art of the apothecary: it shall be an holy anointing oil.* (Exodus 30:25) The *precious ointment* poured *upon the head* is the *holy anointing oil* of the sanctuary — not a common perfume but the consecrating oil that makes whatever it touches most holy.'),
    ('canon','psalms',133,2,'canon','exodus',30,30,'free',
     E'*And thou shalt anoint Aaron and his sons, and consecrate them, that they may minister unto me in the priest''s office.* (Exodus 30:30) The oil that *ran down... even Aaron''s beard... to the skirts of his garments* is the priestly anointing of Aaron — the unity of the *brethren* pictured as the consecrating oil that sets apart the whole house to minister.'),
    ('canon','psalms',133,2,'canon','psalms',45,7,'free',
     E'*Thou lovest righteousness, and hatest wickedness: therefore Elohim (God), thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows.* (Psalm 45:7) The oil *upon the head* is the King anointed *above his fellows* — the Anointed (Messiah) on whose head the oil first rests before it flows down to the body.'),
    ('canon','psalms',133,2,'canon','1-john',2,20,'free',
     E'*But ye have an unction from the Holy One, and ye know all things.* (1 John 2:20) The oil running down from *the head* to *the skirts of his garments* is the *unction from the Holy One* — the Spirit poured on the Anointed Head and flowing down to every member of the body.'),
    ('canon','psalms',133,2,'canon','1-john',2,27,'free',
     E'*But the anointing which ye have received of him abideth in you... and even as it hath taught you, ye shall abide in him.* (1 John 2:27) The oil that descends *upon the beard... to the skirts of his garments* is the *anointing... received of him* that abides in the body — the Spirit reaching from the Head down to the very hem.'),
    -- ---- v3 the dew of Hermon / commanded blessing ----
    ('canon','psalms',133,3,'canon','deuteronomy',33,13,'free',
     E'*And of Joseph he said, Blessed of Yahuah (LORD) be his land, for the precious things of heaven, for the dew, and for the deep that coucheth beneath.* (Deuteronomy 33:13) Moses blesses Joseph (Ephraim, the northern house) *for the dew* — the same *dew of Hermon* descending in blessing, binding the unity of the brethren to the blessing of the scattered house.'),
    ('canon','psalms',133,3,'canon','deuteronomy',33,28,'free',
     E'*Yashar''el (Israel) then shall dwell in safety alone: the fountain of Jacob shall be upon a land of corn and wine; also his heavens shall drop down dew.* (Deuteronomy 33:28) When Yashar''el (Israel) *dwells in safety*, the heavens *drop down dew* — the dwelling of the brethren in unity and the falling of the dew are one promised blessing.'),
    ('canon','psalms',133,3,'canon','leviticus',25,21,'free',
     E'*Then I will command my blessing upon you in the sixth year, and it shall bring forth fruit for three years.* (Leviticus 25:21) *There Yahuah commanded the blessing* echoes the Sabbath-year promise where Yahuah (LORD) *commands the blessing* — the commanded blessing is covenant provision, life sustained by his word.'),
    -- ---- v3 life for evermore ----
    ('canon','psalms',133,3,'canon','john',10,10,'free',
     E'*I am come that they might have life, and that they might have it more abundantly.* (John 10:10) *There Yahuah commanded the blessing, even life for evermore* — the one shepherd of the gathered house gives the abundant, unending life the dew of blessing foreshadows.'),
    ('canon','psalms',133,3,'canon','daniel',12,2,'free',
     E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2) The *life for evermore* that Yahuah commands is the *everlasting life* of the resurrection — the blessing reaches past death to the awakening of the sleeping.'),
    ('canon','psalms',133,3,'canon','ezekiel',37,26,'free',
     E'*Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them.* (Ezekiel 37:26) Where the brethren are *one* in the hand of Yahuah (LORD), there he commands *life for evermore* — the *everlasting covenant* of peace with the regathered house, the same place where the dew of blessing falls.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps133_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps133_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-133-brethren-dwell-in-unity-the-two-houses-made-one',
       E'Brethren Dwell in Unity — the Two Houses Made One',
       E'*Behold, how good and how pleasant it is for brethren to dwell together in unity!* (Psalm 133:1) David''s keystone is read here not as a sentiment of fellowship but as the prophesied reunion of the divided house. The *brethren* are Yahudah (Judah) and Ephraim/Joseph — the two sticks of Ezekiel''s sign: *And join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:17), *and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The Formed Son prays this oneness forward: *That they all may be one; as thou, Father, art in me, and I in thee* (John 17:21), *that they may be made perfect in one* (John 17:23). It is *the unity of the Spirit in the bond of peace* (Ephesians 4:3) resting on *One Elohim (God) and Father of all* (Ephesians 4:6) — one household, never two peoples, never co-equal persons. The pattern goes back to the father of the promise: *for we be brethren* (Genesis 13:8). And the second-Temple wisdom names it among the things beautiful before Yahuah (God): *the unity of brothers* (Ecclesiasticus 25:1). The guard stands over all of it — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1): the brethren made one are Yashar''el (Israel) restored, never a replacement people.',
       sv.verse_id, ev.verse_id, 'extras', 25300
  FROM _s302_ps133_lookup sv, _s302_ps133_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=133 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=133 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-133-the-precious-anointing-oil-from-the-head-to-the-body',
       E'The Precious Anointing Oil — from the Head to the Body',
       E'*It is like the precious ointment upon the head, that ran down upon the beard, even Aaron''s beard: that went down to the skirts of his garments* (Psalm 133:2). The picture of unity is the holy oil of the sanctuary: *thou shalt make it an oil of holy ointment... it shall be an holy anointing oil* (Exodus 30:25), the oil with which *thou shalt anoint Aaron and his sons, and consecrate them, that they may minister unto me in the priest''s office* (Exodus 30:30). The oil is poured first *upon the head* and flows down — to the beard, to the hem. So it is with the Anointed (Messiah): *therefore Elohim (God), thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows* (Psalm 45:7). The oil rests on the Head above his fellows, then runs down to the whole body: *ye have an unction from the Holy One, and ye know all things* (1 John 2:20), *the anointing which ye have received of him abideth in you* (1 John 2:27). The Spirit poured on the Head reaches every member down to the very skirts — the brethren made one by one anointing flowing from one Head.',
       sv.verse_id, ev.verse_id, 'free', 25303
  FROM _s302_ps133_lookup sv, _s302_ps133_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=133 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=133 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-133-as-the-dew-of-hermon-the-commanded-blessing',
       E'As the Dew of Hermon — the Commanded Blessing',
       E'*As the dew of Hermon, and as the dew that descended upon the mountains of Zion: for there Yahuah (LORD) commanded the blessing* (Psalm 133:3). The dew is the sign of covenant blessing on the land. Moses pronounces it over Joseph — the northern house, Ephraim: *Blessed of Yahuah (LORD) be his land, for the precious things of heaven, for the dew* (Deuteronomy 33:13); and over all Yashar''el (Israel) when it dwells in safety: *also his heavens shall drop down dew* (Deuteronomy 33:28). The dwelling of the brethren in unity and the falling of the dew are one promised gift. And the blessing here is *commanded* — the same word of Yahuah (LORD) that secures the Sabbath-year provision: *Then I will command my blessing upon you in the sixth year, and it shall bring forth fruit for three years* (Leviticus 25:21). The commanded blessing is covenant life sustained by his word, descending like dew on the gathered, unified house.',
       sv.verse_id, ev.verse_id, 'free', 25306
  FROM _s302_ps133_lookup sv, _s302_ps133_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=133 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=133 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-133-there-yahuah-commanded-life-for-evermore',
       E'There Yahuah Commanded Life for Evermore',
       E'*For there Yahuah (LORD) commanded the blessing, even life for evermore* (Psalm 133:3). The psalm closes not on a long life but on unending life — the blessing reaches past death. The one shepherd of the gathered house gives it: *I am come that they might have life, and that they might have it more abundantly* (John 10:10). It is the resurrection-life of Daniel''s vision: *many of them that sleep in the dust of the earth shall awake, some to everlasting life* (Daniel 12:2). And it is held in the everlasting covenant Yahuah (LORD) makes where the brethren are made one: *I will make a covenant of peace with them; it shall be an everlasting covenant with them* (Ezekiel 37:26). Where the two houses dwell together in unity, there — in that very place — Yahuah commands *life for evermore*.',
       sv.verse_id, ev.verse_id, 'free', 25309
  FROM _s302_ps133_lookup sv, _s302_ps133_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=133 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=133 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- T1 brethren / two houses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    ('canon','ezekiel',37,17,1,E'*they shall become one in thine hand* (Ezekiel 37:17) — the two sticks, Yahudah and Joseph, joined into one.'),
    ('canon','ezekiel',37,22,2,E'*they shall be no more two nations* (Ezekiel 37:22) — the divorce ended, one people under one shepherd.'),
    ('canon','john',17,21,3,E'*That they all may be one* (John 17:21) — the Son prays Psalm 133 forward.'),
    ('canon','john',17,23,4,E'*made perfect in one* (John 17:23) — the gathered house perfected into one body.'),
    ('canon','ephesians',4,3,5,E'*the unity of the Spirit in the bond of peace* (Ephesians 4:3) — unity kept by the Spirit.'),
    ('canon','ephesians',4,6,6,E'*One Elohim (God) and Father of all* (Ephesians 4:6) — one household on one Father.'),
    ('canon','genesis',13,8,7,E'*for we be brethren* (Genesis 13:8) — Abram''s pattern of brethren without strife.'),
    ('canon','romans',11,1,8,E'*Hath Elohim cast away his people? Elohim forbid* (Romans 11:1) — the guard: Yashar''el restored, not replaced.'),
    ('apocrypha','ecclesiasticus',25,1,9,E'*the unity of brothers* (Ecclesiasticus 25:1) — named beautiful before Yahuah (God).')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN _s302_ps133_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=133 AND sv.verse_number=1
  JOIN _s302_ps133_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-133-brethren-dwell-in-unity-the-two-houses-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T2 anointing oil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    ('canon','exodus',30,25,1,E'*it shall be an holy anointing oil* (Exodus 30:25) — the oil of the sanctuary, not common perfume.'),
    ('canon','exodus',30,30,2,E'*thou shalt anoint Aaron and his sons* (Exodus 30:30) — the priestly anointing pictured as the oil on Aaron''s beard.'),
    ('canon','psalms',45,7,3,E'*anointed thee with the oil of gladness above thy fellows* (Psalm 45:7) — the Anointed Head above his fellows.'),
    ('canon','1-john',2,20,4,E'*ye have an unction from the Holy One* (1 John 2:20) — the oil flowing from the Head to the body.'),
    ('canon','1-john',2,27,5,E'*the anointing which ye have received of him abideth in you* (1 John 2:27) — the Spirit reaching to the very hem.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN _s302_ps133_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=133 AND sv.verse_number=2
  JOIN _s302_ps133_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-133-the-precious-anointing-oil-from-the-head-to-the-body'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T3 dew / commanded blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    ('canon','deuteronomy',33,13,1,E'*Blessed of Yahuah be his land... for the dew* (Deuteronomy 33:13) — the dew blessing on Joseph/Ephraim.'),
    ('canon','deuteronomy',33,28,2,E'*his heavens shall drop down dew* (Deuteronomy 33:28) — Yashar''el dwelling in safety, the heavens dropping dew.'),
    ('canon','leviticus',25,21,3,E'*I will command my blessing upon you* (Leviticus 25:21) — the commanded blessing as covenant provision.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN _s302_ps133_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=133 AND sv.verse_number=3
  JOIN _s302_ps133_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-133-as-the-dew-of-hermon-the-commanded-blessing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T4 life for evermore
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    ('canon','john',10,10,1,E'*that they might have life... more abundantly* (John 10:10) — the shepherd''s abundant, unending life.'),
    ('canon','daniel',12,2,2,E'*some to everlasting life* (Daniel 12:2) — the resurrection-life reaching past the dust.'),
    ('canon','ezekiel',37,26,3,E'*an everlasting covenant with them* (Ezekiel 37:26) — life for evermore held in the covenant of peace with the one house.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN _s302_ps133_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=133 AND sv.verse_number=3
  JOIN _s302_ps133_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-133-there-yahuah-commanded-life-for-evermore'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
