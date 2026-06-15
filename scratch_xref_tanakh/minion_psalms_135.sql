-- ----- fragment: minion_psalms_135.sql (Psalm 135) -----
-- Chapter: Psalm 135 — a Hallelujah praise-anthology woven from Exodus, Deuteronomy,
--          Jeremiah 10, and Psalm 115 (its twin idol-polemic / threefold-call psalm).
-- Tag: ps135   Session prefix: s302   Sort band base: 25350 (step 3)
-- Slug prefix (SINGULAR): psalm-135-...   (checked EXISTING_SLUGS.txt — no collisions)
--
-- Threads (5):
--   25350  psalm-135-yahuah-hath-chosen-jacob-for-his-peculiar-treasure      [Tanakh + NT]  free
--   25353  psalm-135-whatsoever-yahuah-pleased-the-sovereign-maker           [Tanakh]       free
--   25356  psalm-135-who-smote-egypt-and-gave-the-land-for-an-heritage       [Tanakh]       free
--   25359  psalm-135-the-idols-of-the-heathen-are-the-work-of-mens-hands     [Tanakh+NT+Extras] extras
--   25362  psalm-135-bless-yahuah-o-house-of-israel-the-threefold-call       [Tanakh]       free
--
-- Psalm 135 coverage:
--   v.1-3  (Praise ye Yahuah ... ye that stand in the house of Yahuah)
--          NT:     none warranted (temple-court doxology framing)
--          Extras: none warranted
--          Tanakh: Ps 134:1 lateral (servants standing in the house) — folded into the
--                  threefold-call thread's frame; not its own thread (call-to-praise envelope).
--   v.4    (Yahuah hath chosen Jacob ... Israel for his peculiar treasure)
--          NT:     Titus 2:14 / 1 Peter 2:9 (a peculiar people — restoration, NOT replacement); Rom 11:1-2 guard
--          Extras: none warranted
--          Tanakh: Exod 19:5 (peculiar treasure), Deut 7:6 (chosen ... special people), Mal 3:17 (mine ... my jewels)
--          → THREAD 1
--   v.5-7  (Yahuah is great ... whatsoever Yahuah pleased ... wind out of his treasuries)
--          NT:     none warranted (Formed-Maker named in prose)
--          Extras: none warranted
--          Tanakh: Ps 115:3 (done whatsoever he pleased), Jer 10:12-13 (which this psalm quotes)
--          → THREAD 2
--   v.8-12 (smote the firstborn of Egypt ... gave their land for an heritage unto Israel)
--          NT:     none warranted (Exodus recital)
--          Extras: none warranted
--          Tanakh: Exod 12:29 (smote all the firstborn), Deut 4:34 (signs and wonders), Num 21:34 /
--                  Deut 2:33 (Sihon & Og), Ps 136:10/21 lateral, Deut 32:9 (Jacob the lot of his inheritance)
--          → THREAD 3
--   v.13-14 (Thy name endureth for ever ... Yahuah will judge his people)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deut 32:9/36 themes — folded into the heritage thread's frame; not its own thread.
--   v.15-18 (idols of the heathen are silver and gold ... they that make them are like unto them)
--          NT:     1 Cor 8:4 (an idol is nothing), 1 Thess 1:9 (turned from idols), Rev 9:20 (repented not ... idols)
--          Extras: Wisdom of Solomon 15:15-16 (idols neither see nor hear nor breathe; man made them) — clean witness
--          Tanakh: Ps 115:4 (the twin it echoes), Jer 10:5 (cannot speak/go), Isa 44:9 (graven image ... vanity)
--          → THREAD 4 (extras-bearing)
--   v.19-20 (Bless Yahuah O house of Israel ... house of Aaron ... house of Levi ... ye that fear Yahuah)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Ps 115:9-11 (twin threefold call), Ps 118:2-4 (the threefold "let ... now say")
--          → THREAD 5
--   v.21  (Blessed be Yahuah out of Zion ... Praise ye Yahuah)
--          NT/Extras/Tanakh: none warranted (Zion benediction close; Ps 134:3 lateral noted in frame)

CREATE TEMP VIEW _s302_ps135_lookup AS
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
    -- THREAD 1: v.4 — chosen Jacob / peculiar treasure (election of the WHOLE house)
    ('canon','psalms',135,4,'canon','exodus',19,5,'free',
     E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). The psalm''s *Yahuah (LORD) hath chosen Jacob unto himself, and Yashar''el (Israel) for his peculiar treasure* (Psalm 135:4) sings back the Sinai election word: the same Hebrew *segullah*, peculiar-treasure, bound to obeying his voice and keeping his covenant — election is covenant-kept, never lineage-only and never confession-only.'),
    ('canon','psalms',135,4,'canon','deuteronomy',7,6,'free',
     E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). The psalm''s *hath chosen Jacob unto himself* (Psalm 135:4) is this Deuteronomy choosing exactly — the one whole house set apart, the two-house people Yahuah took for his own.'),
    ('canon','psalms',135,4,'canon','malachi',3,17,'free',
     E'*And they shall be mine, saith Yahuah Tseva''ot (LORD of hosts), in that day when I make up my jewels; and I will spare them, as a man spareth his own son that serveth him* (Malachi 3:17). The *peculiar treasure* of Psalm 135:4 reaches forward to the day Yahuah gathers his jewels — the elect house preserved, not cast off, *as a man spareth his own son*.'),
    ('canon','psalms',135,4,'canon','titus',2,14,'free',
     E'*Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14). The *peculiar treasure* of Psalm 135:4 is the *peculiar people* the Formed Son redeems and purifies — restoration of the same chosen house unto Torah-zeal, never the replacement of it.'),
    ('canon','psalms',135,4,'canon','1-peter',2,9,'free',
     E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9). Peter lays the Sinai-and-psalm titles — *chosen*, *holy nation*, *a peculiar people* — on the regathered house; the *peculiar treasure* of Psalm 135:4 is gathered out of darkness, not annulled.'),
    ('canon','psalms',135,4,'canon','romans',11,1,'free',
     E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The guard on the election of Psalm 135:4: because Yahuah *hath chosen Jacob*, his people are never cast away — Paul stands as living proof of the unbroken covenant line.'),
    ('canon','psalms',135,4,'canon','romans',11,2,'free',
     E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The *chosen ... peculiar treasure* of Psalm 135:4 is foreknown and kept; the choosing of Jacob is irrevocable — the two-house people stand because Yahuah set his love upon them, not because of merit they brought.'),

    -- THREAD 2: v.5-7 — the sovereign Maker (the Formed Word), quoting Jeremiah 10
    ('canon','psalms',135,6,'canon','psalms',115,3,'free',
     E'*But our Elohim (God) is in the heavens: he hath done whatsoever he hath pleased* (Psalm 115:3). The twin idol-psalm''s confession is Psalm 135''s opening of the same theme — *Whatsoever Yahuah (LORD) pleased, that did he in heaven, and in earth* (Psalm 135:6): the living Maker who acts at will set against the idols that cannot act at all.'),
    ('canon','psalms',135,7,'canon','jeremiah',10,12,'free',
     E'*He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12). Psalm 135:6-7 draws straight from Jeremiah''s great Maker — the Formed Word by whom the earth was made — the same hand that *causeth the vapours to ascend* over against the dead idols of the surrounding verse.'),
    ('canon','psalms',135,7,'canon','jeremiah',10,13,'free',
     E'*When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures* (Jeremiah 10:13). Psalm 135:7 — *he causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries* — is this Jeremiah verse almost word for word: the psalm consciously sings the prophet''s polemic that the Maker speaks and the storehouses obey, while idols are nothing.'),

    -- THREAD 3: v.8-12 — smote Egypt, smote the kings, gave the land for an heritage
    ('canon','psalms',135,8,'canon','exodus',12,29,'free',
     E'*And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle* (Exodus 12:29). Psalm 135:8 — *Who smote the firstborn of Egypt, both of man and beast* — recites the Passover night itself, the tenth blow by which Yahuah brought his people out.'),
    ('canon','psalms',135,9,'canon','deuteronomy',4,34,'free',
     E'*Or hath Elohim (God) assayed to go and take him a nation from the midst of another nation, by temptations, by signs, and by wonders, and by war, and by a mighty hand ... according to all that Yahuah Elohaychem (the LORD your God) did for you in Egypt before your eyes?* (Deuteronomy 4:34). The *tokens and wonders* Yahuah *sent into the midst of thee, O Egypt* (Psalm 135:9) are these very signs and wonders by which a nation was taken from the midst of a nation — the unique Exodus deliverance.'),
    ('canon','psalms',135,11,'canon','numbers',21,34,'free',
     E'*And Yahuah (LORD) said unto Moses, Fear him not: for I have delivered him into thy hand, and all his people, and his land; and thou shalt do to him as thou didst unto Sihon king of the Amorites, which dwelt at Heshbon* (Numbers 21:34). Psalm 135:11 names *Sihon king of the Amorites, and Og king of Bashan* — the two kings of Numbers 21 whose defeat opened the heritage east of Jordan.'),
    ('canon','psalms',135,11,'canon','deuteronomy',2,33,'free',
     E'*And Yahuah Eloheinu (the LORD our God) delivered him before us; and we smote him, and his sons, and all his people* (Deuteronomy 2:33). Moses'' recital of the fall of Sihon stands behind Psalm 135:10-11 — *Who smote great nations, and slew mighty kings; Sihon king of the Amorites* — the deliverance Yahuah wrought, not Israel''s own arm.'),
    ('canon','psalms',135,10,'canon','psalms',136,17,'free',
     E'*To him which smote great kings: for his mercy endureth for ever* (Psalm 136:17). Psalm 135 and its companion Psalm 136 sing the same conquest; the psalm''s *Who smote great nations, and slew mighty kings* (Psalm 135:10) is Psalm 136''s refrain that every blow against the kings was an act of enduring mercy toward the heritage-people.'),
    ('canon','psalms',135,12,'canon','psalms',136,21,'free',
     E'*And gave their land for an heritage: for his mercy endureth for ever* (Psalm 136:21). Psalm 135:12 — *And gave their land for an heritage, an heritage unto Yashar''el (Israel) his people* — is Psalm 136''s same gift, the land bestowed as covenant inheritance on the whole house.'),
    ('canon','psalms',135,12,'canon','deuteronomy',32,9,'free',
     E'*For the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9). The land *for an heritage ... unto Yashar''el (Israel) his people* (Psalm 135:12) rests on the deeper inheritance of the Song of Moses: the people themselves are Yahuah''s portion, Jacob his allotted heritage — the two-house people belong to him.'),

    -- THREAD 4: v.15-18 — the idol polemic (extras-bearing)
    ('canon','psalms',135,15,'canon','psalms',115,4,'free',
     E'*Their idols are silver and gold, the work of men''s hands* (Psalm 115:4). Psalm 135:15 is the twin verse it echoes — *The idols of the heathen are silver and gold, the work of men''s hands* — the two idol-psalms standing back to back against the lifeless gods.'),
    ('canon','psalms',135,16,'canon','jeremiah',10,5,'free',
     E'*They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go ... Be not afraid of them; for they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5). Psalm 135:16 — *They have mouths, but they speak not; eyes have they, but they see not* — sings Jeremiah''s mockery: the idol cannot speak, cannot walk, can neither harm nor help.'),
    ('canon','psalms',135,15,'canon','isaiah',44,9,'free',
     E'*They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed* (Isaiah 44:9). Isaiah''s long idol-satire underwrites Psalm 135:15-18: the maker of the image is vanity, the image sees not — *They that make them are like unto them* (Psalm 135:18).'),
    ('canon','psalms',135,16,'apocrypha','the-wisdom-of-solomon',15,15,'extras',
     E'*For they counted all the idols of the heathen to be gods: which neither have the use of eyes to see, nor noses to draw breath, nor ears to hear, nor fingers of hands to handle; and as for their feet, they are slow to go* (Wisdom of Solomon 15:15). The Wisdom-writer carries the psalm''s very catalogue — *They have mouths, but they speak not; eyes have they, but they see not ... neither is there any breath in their mouths* (Psalm 135:16-17): eyes, breath, ears, hands, feet, all lifeless.'),
    ('canon','psalms',135,18,'apocrypha','the-wisdom-of-solomon',15,16,'extras',
     E'*For man made them, and he that borrowed his own spirit fashioned them: but no man can make a god like to himself* (Wisdom of Solomon 15:16). This is the psalm''s verdict of verse 18 — *They that make them are like unto them: so is every one that trusteth in them*: the mortal fashions a dead thing and sinks to its level; trust in the work of hands deadens the truster.'),
    ('canon','psalms',135,18,'canon','1-corinthians',8,4,'free',
     E'*As concerning therefore the eating of those things that are offered in sacrifice unto idols, we know that an idol is nothing in the world, and that there is none other Elohim (God) but one* (1 Corinthians 8:4). Paul carries the psalm forward: the idol is *nothing* — *They that make them are like unto them* (Psalm 135:18), so there is none other Elohim but the one living Maker the psalm has just praised.'),
    ('canon','psalms',135,18,'canon','1-thessalonians',1,9,'free',
     E'*For they themselves shew of us what manner of entering in we had unto you, and how ye turned to Elohim (God) from idols to serve the living and true Elohim (God)* (1 Thessalonians 1:9). The psalm''s warning that *every one that trusteth in them* (Psalm 135:18) becomes as lifeless as the idol is answered in the turning the apostle describes: from dead idols to *the living and true Elohim*.'),
    ('canon','psalms',135,18,'canon','revelation',9,20,'free',
     E'*And the rest of the men which were not killed by these plagues yet repented not of the works of their hands, that they should not worship devils, and idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk* (Revelation 9:20). The end-time refusal repeats the psalm''s indictment exactly — idols of *gold, and silver ... which neither can see, nor hear, nor walk* — and the worshippers, hardened, are *like unto them* (Psalm 135:18).'),

    -- THREAD 5: v.19-20 — the houses called to bless (threefold call)
    ('canon','psalms',135,19,'canon','psalms',115,9,'free',
     E'*O Yashar''el (Israel), trust thou in Yahuah (LORD): he is their help and their shield* (Psalm 115:9). The twin psalm''s call to the house of Israel matches Psalm 135:19 — *Bless Yahuah (LORD), O house of Yashar''el (Israel)* — the same congregation summoned, there to trust, here to bless.'),
    ('canon','psalms',135,19,'canon','psalms',115,10,'free',
     E'*O house of Aaron, trust in Yahuah (LORD): he is their help and their shield* (Psalm 115:10). Psalm 135:19 calls the same *house of Aaron* to bless that Psalm 115 calls to trust — the priestly house joined to the whole house in the one worship.'),
    ('canon','psalms',135,20,'canon','psalms',115,11,'free',
     E'*Ye that fear Yahuah (LORD), trust in Yahuah (LORD): he is their help and their shield* (Psalm 115:11). The threefold close of Psalm 135:20 — *ye that fear Yahuah (LORD), bless Yahuah (LORD)* — gathers in *ye that fear Yahuah* exactly as the twin psalm does: house of Israel, house of Aaron, and all the Yahuah-fearers, one chorus.'),
    ('canon','psalms',135,19,'canon','psalms',118,2,'free',
     E'*Let Yashar''el (Israel) now say, that his mercy endureth for ever* (Psalm 118:2). The antiphonal *let ... now say* of Psalm 118 is the same liturgical summons as Psalm 135:19''s *Bless Yahuah (LORD), O house of Yashar''el (Israel)* — the congregation of the whole house called first to confess his mercy.'),
    ('canon','psalms',135,19,'canon','psalms',118,3,'free',
     E'*Let the house of Aaron now say, that his mercy endureth for ever* (Psalm 118:3). Psalm 118''s second call to the *house of Aaron* answers Psalm 135:19''s *bless Yahuah (LORD), O house of Aaron* — the priestly house given its part in the responsive praise.'),
    ('canon','psalms',135,20,'canon','psalms',118,4,'free',
     E'*Let them now that fear Yahuah (LORD) say, that his mercy endureth for ever* (Psalm 118:4). The third call of Psalm 118 — *them now that fear Yahuah* — is the third call of Psalm 135:20, *ye that fear Yahuah (LORD), bless Yahuah (LORD)*: the same threefold structure, Israel, Aaron, and the Yahuah-fearers, sealing the psalm in united blessing.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps135_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps135_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. cross_reference_threads
-- ============================================================================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-135-yahuah-hath-chosen-jacob-for-his-peculiar-treasure',
       E'Yahuah hath chosen Jacob for his peculiar treasure',
       E'At the heart of the praise stands the election of the whole house: *For Yahuah (LORD) hath chosen Jacob unto himself, and Yashar''el (Israel) for his peculiar treasure* (Psalm 135:4). The phrase is lifted straight from Sinai — *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5) — and from Moses'' charge, *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people* (Deuteronomy 7:6). Election is covenant-kept, not lineage-only and not confession-only. It reaches forward to the day Yahuah gathers his own: *they shall be mine, saith Yahuah Tseva''ot (LORD of hosts), in that day when I make up my jewels* (Malachi 3:17). The Formed Son redeems this same treasure — *purify unto himself a peculiar people, zealous of good works* (Titus 2:14) — and Peter lays the Sinai titles on the regathered house: *ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9). This is restoration of the chosen house, never its replacement, and the guard is fixed: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). Because Yahuah chose Jacob, the two-house people stand.',
       sv.verse_id, ev.verse_id, 'free', 25350
  FROM _s302_ps135_lookup sv, _s302_ps135_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=135 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=135 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-135-whatsoever-yahuah-pleased-the-sovereign-maker',
       E'Whatsoever Yahuah pleased: the sovereign Maker',
       E'Against the dead idols the psalm sets the living Maker who does as he pleases: *Whatsoever Yahuah (LORD) pleased, that did he in heaven, and in earth, in the seas, and all deep places* (Psalm 135:6); *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries* (Psalm 135:7). This is the confession of the twin idol-psalm — *our Elohim (God) is in the heavens: he hath done whatsoever he hath pleased* (Psalm 115:3) — and it is drawn almost word for word from Jeremiah''s great Maker-polemic: *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12); *he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures* (Jeremiah 10:13). The Formed Word by whom the earth was made commands the storehouses of wind and rain at his pleasure; the idol of the next breath cannot lift a finger. The Maker speaks and creation obeys.',
       sv.verse_id, ev.verse_id, 'free', 25353
  FROM _s302_ps135_lookup sv, _s302_ps135_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=135 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=135 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-135-who-smote-egypt-and-gave-the-land-for-an-heritage',
       E'Who smote Egypt and gave the land for an heritage',
       E'The psalm recites the founding deliverance: *Who smote the firstborn of Egypt, both of man and beast* (Psalm 135:8) — the Passover night itself, *at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt* (Exodus 12:29). The *tokens and wonders* sent into the midst of Egypt (Psalm 135:9) are the signs by which a nation was taken from the midst of a nation: *by signs, and by wonders, and by war, and by a mighty hand* (Deuteronomy 4:34). Then the conquest: *Who smote great nations, and slew mighty kings; Sihon king of the Amorites, and Og king of Bashan* (Psalm 135:10-11) — the kings of Numbers 21, *I have delivered him into thy hand* (Numbers 21:34), *Yahuah Eloheinu (the LORD our God) delivered him before us* (Deuteronomy 2:33), every blow an act of enduring mercy in the companion psalm: *To him which smote great kings: for his mercy endureth for ever* (Psalm 136:17). And the gift: *And gave their land for an heritage, an heritage unto Yashar''el (Israel) his people* (Psalm 135:12); *And gave their land for an heritage: for his mercy endureth for ever* (Psalm 136:21). Beneath the land lies the deeper inheritance — *the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9): the two-house people themselves are Yahuah''s heritage.',
       sv.verse_id, ev.verse_id, 'free', 25356
  FROM _s302_ps135_lookup sv, _s302_ps135_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=135 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=135 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-135-the-idols-of-the-heathen-are-the-work-of-mens-hands',
       E'The idols of the heathen are the work of men''s hands',
       E'The psalm turns its sharpest edge on the lifeless gods: *The idols of the heathen are silver and gold, the work of men''s hands. They have mouths, but they speak not; eyes have they, but they see not; They have ears, but they hear not; neither is there any breath in their mouths* (Psalm 135:15-17). It is the twin of Psalm 115 — *Their idols are silver and gold, the work of men''s hands* (Psalm 115:4) — and of Jeremiah''s mockery, *they must needs be borne, because they cannot go ... they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5), and Isaiah''s satire, *They that make a graven image are all of them vanity ... they see not, nor know* (Isaiah 44:9). The restored Wisdom-witness carries the very catalogue: idols *which neither have the use of eyes to see, nor noses to draw breath, nor ears to hear, nor fingers of hands to handle* (Wisdom of Solomon 15:15), and *man made them ... but no man can make a god like to himself* (Wisdom of Solomon 15:16). Then the verdict that binds it all: *They that make them are like unto them: so is every one that trusteth in them* (Psalm 135:18) — the maker sinks to the level of the dead thing he trusts. The apostles carry it forward — *an idol is nothing in the world* (1 Corinthians 8:4); the Thessalonians *turned to Elohim (God) from idols to serve the living and true Elohim (God)* (1 Thessalonians 1:9) — and the end-time hardened *repented not ... idols of gold, and silver ... which neither can see, nor hear, nor walk* (Revelation 9:20). The whole library answers idolatry with one voice.',
       sv.verse_id, ev.verse_id, 'extras', 25359
  FROM _s302_ps135_lookup sv, _s302_ps135_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=135 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=135 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-135-bless-yahuah-o-house-of-israel-the-threefold-call',
       E'Bless Yahuah, O house of Israel: the threefold call',
       E'The psalm closes by summoning the congregation in three ranks: *Bless Yahuah (LORD), O house of Yashar''el (Israel): bless Yahuah (LORD), O house of Aaron: Bless Yahuah (LORD), O house of Levi: ye that fear Yahuah (LORD), bless Yahuah (LORD)* (Psalm 135:19-20). It is the antiphonal liturgy of the twin psalm — *O Yashar''el (Israel), trust thou in Yahuah (LORD)* (Psalm 115:9); *O house of Aaron, trust in Yahuah (LORD)* (Psalm 115:10); *Ye that fear Yahuah (LORD), trust in Yahuah (LORD)* (Psalm 115:11) — and of the great Hallel: *Let Yashar''el (Israel) now say, that his mercy endureth for ever* (Psalm 118:2); *Let the house of Aaron now say* (Psalm 118:3); *Let them now that fear Yahuah (LORD) say* (Psalm 118:4). The same three ranks every time: the whole house of Israel, the priestly house, and all who fear the Name — gathered into one chorus of blessing, the worship of the chosen people whose every breath answers the Maker that idols cannot.',
       sv.verse_id, ev.verse_id, 'free', 25362
  FROM _s302_ps135_lookup sv, _s302_ps135_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=135 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=135 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. cross_reference_thread_members
-- ============================================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','psalms',135,4,'canon','exodus',19,5,1,E'Exodus 19:5 — *a peculiar treasure unto me above all people*, the Sinai election bound to keeping the covenant.'),
    ('canon','psalms',135,4,'canon','deuteronomy',7,6,2,E'Deuteronomy 7:6 — *hath chosen thee to be a special people unto himself*, the choosing of the one whole house.'),
    ('canon','psalms',135,4,'canon','malachi',3,17,3,E'Malachi 3:17 — *they shall be mine ... when I make up my jewels*, the peculiar treasure gathered and spared.'),
    ('canon','psalms',135,4,'canon','titus',2,14,4,E'Titus 2:14 — *purify unto himself a peculiar people, zealous of good works*, the Formed Son redeeming the same treasure unto Torah-zeal.'),
    ('canon','psalms',135,4,'canon','1-peter',2,9,5,E'1 Peter 2:9 — *a chosen generation ... a peculiar people*, the Sinai titles laid on the regathered house, restoration not replacement.'),
    ('canon','psalms',135,4,'canon','romans',11,1,6,E'Romans 11:1 — *Hath Elohim (God) cast away his people? Elohim (God) forbid*, the guard on the irrevocable election.'),
    ('canon','psalms',135,4,'canon','romans',11,2,7,E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew*, the chosen house kept because foreknown.')
  ) AS m(s_ed,s_slug,s_ch,s_v,t_ed,t_slug,t_ch,t_v,sort_order,member_note)
  JOIN _s302_ps135_lookup sv ON sv.edition_slug=m.s_ed AND sv.book_slug=m.s_slug AND sv.chapter_number=m.s_ch AND sv.verse_number=m.s_v
  JOIN _s302_ps135_lookup tv ON tv.edition_slug=m.t_ed AND tv.book_slug=m.t_slug AND tv.chapter_number=m.t_ch AND tv.verse_number=m.t_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-135-yahuah-hath-chosen-jacob-for-his-peculiar-treasure'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','psalms',135,6,'canon','psalms',115,3,1,E'Psalm 115:3 — *he hath done whatsoever he hath pleased*, the twin psalm''s confession of the living Maker.'),
    ('canon','psalms',135,7,'canon','jeremiah',10,12,2,E'Jeremiah 10:12 — *He hath made the earth by his power ... stretched out the heavens by his discretion*, the Formed Word the Maker.'),
    ('canon','psalms',135,7,'canon','jeremiah',10,13,3,E'Jeremiah 10:13 — *he causeth the vapours to ascend ... bringeth forth the wind out of his treasures*, the verse Psalm 135:7 sings almost word for word.')
  ) AS m(s_ed,s_slug,s_ch,s_v,t_ed,t_slug,t_ch,t_v,sort_order,member_note)
  JOIN _s302_ps135_lookup sv ON sv.edition_slug=m.s_ed AND sv.book_slug=m.s_slug AND sv.chapter_number=m.s_ch AND sv.verse_number=m.s_v
  JOIN _s302_ps135_lookup tv ON tv.edition_slug=m.t_ed AND tv.book_slug=m.t_slug AND tv.chapter_number=m.t_ch AND tv.verse_number=m.t_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-135-whatsoever-yahuah-pleased-the-sovereign-maker'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','psalms',135,8,'canon','exodus',12,29,1,E'Exodus 12:29 — *Yahuah (LORD) smote all the firstborn in the land of Egypt*, the Passover night recited.'),
    ('canon','psalms',135,9,'canon','deuteronomy',4,34,2,E'Deuteronomy 4:34 — *by signs, and by wonders ... a nation from the midst of another nation*, the tokens and wonders of the deliverance.'),
    ('canon','psalms',135,11,'canon','numbers',21,34,3,E'Numbers 21:34 — *I have delivered him into thy hand*, the defeat of Og following Sihon.'),
    ('canon','psalms',135,11,'canon','deuteronomy',2,33,4,E'Deuteronomy 2:33 — *Yahuah Eloheinu (the LORD our God) delivered him before us*, the fall of Sihon king of the Amorites.'),
    ('canon','psalms',135,10,'canon','psalms',136,17,5,E'Psalm 136:17 — *To him which smote great kings: for his mercy endureth for ever*, the companion psalm''s refrain over the same conquest.'),
    ('canon','psalms',135,12,'canon','psalms',136,21,6,E'Psalm 136:21 — *And gave their land for an heritage: for his mercy endureth for ever*, the same gift of the land.'),
    ('canon','psalms',135,12,'canon','deuteronomy',32,9,7,E'Deuteronomy 32:9 — *Jacob is the lot of his inheritance*, the deeper heritage: the people themselves are Yahuah''s portion.')
  ) AS m(s_ed,s_slug,s_ch,s_v,t_ed,t_slug,t_ch,t_v,sort_order,member_note)
  JOIN _s302_ps135_lookup sv ON sv.edition_slug=m.s_ed AND sv.book_slug=m.s_slug AND sv.chapter_number=m.s_ch AND sv.verse_number=m.s_v
  JOIN _s302_ps135_lookup tv ON tv.edition_slug=m.t_ed AND tv.book_slug=m.t_slug AND tv.chapter_number=m.t_ch AND tv.verse_number=m.t_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-135-who-smote-egypt-and-gave-the-land-for-an-heritage'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','psalms',135,15,'canon','psalms',115,4,1,E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands*, the twin verse Psalm 135:15 echoes.'),
    ('canon','psalms',135,16,'canon','jeremiah',10,5,2,E'Jeremiah 10:5 — idols *cannot do evil, neither ... do good*, the prophet''s mockery of the mute, motionless god.'),
    ('canon','psalms',135,15,'canon','isaiah',44,9,3,E'Isaiah 44:9 — *They that make a graven image are all of them vanity ... they see not, nor know*, the great idol-satire.'),
    ('canon','psalms',135,16,'apocrypha','the-wisdom-of-solomon',15,15,4,E'Wisdom of Solomon 15:15 — idols *neither have the use of eyes to see, nor noses to draw breath, nor ears to hear*, the psalm''s very catalogue.'),
    ('canon','psalms',135,18,'apocrypha','the-wisdom-of-solomon',15,16,5,E'Wisdom of Solomon 15:16 — *man made them ... but no man can make a god like to himself*, the verdict that the maker is like the dead thing.'),
    ('canon','psalms',135,18,'canon','1-corinthians',8,4,6,E'1 Corinthians 8:4 — *an idol is nothing in the world ... none other Elohim (God) but one*, Paul carrying the polemic forward.'),
    ('canon','psalms',135,18,'canon','1-thessalonians',1,9,7,E'1 Thessalonians 1:9 — *turned to Elohim (God) from idols to serve the living and true Elohim (God)*, the turning from dead trust to the living Maker.'),
    ('canon','psalms',135,18,'canon','revelation',9,20,8,E'Revelation 9:20 — *idols of gold, and silver ... which neither can see, nor hear, nor walk*, the end-time hardened made like what they worship.')
  ) AS m(s_ed,s_slug,s_ch,s_v,t_ed,t_slug,t_ch,t_v,sort_order,member_note)
  JOIN _s302_ps135_lookup sv ON sv.edition_slug=m.s_ed AND sv.book_slug=m.s_slug AND sv.chapter_number=m.s_ch AND sv.verse_number=m.s_v
  JOIN _s302_ps135_lookup tv ON tv.edition_slug=m.t_ed AND tv.book_slug=m.t_slug AND tv.chapter_number=m.t_ch AND tv.verse_number=m.t_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-135-the-idols-of-the-heathen-are-the-work-of-mens-hands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','psalms',135,19,'canon','psalms',115,9,1,E'Psalm 115:9 — *O Yashar''el (Israel), trust thou in Yahuah (LORD)*, the first rank of the twin psalm''s call.'),
    ('canon','psalms',135,19,'canon','psalms',115,10,2,E'Psalm 115:10 — *O house of Aaron, trust in Yahuah (LORD)*, the priestly house summoned.'),
    ('canon','psalms',135,20,'canon','psalms',115,11,3,E'Psalm 115:11 — *Ye that fear Yahuah (LORD), trust in Yahuah (LORD)*, the third rank, all the Yahuah-fearers.'),
    ('canon','psalms',135,19,'canon','psalms',118,2,4,E'Psalm 118:2 — *Let Yashar''el (Israel) now say, that his mercy endureth for ever*, the Hallel''s antiphonal call to the whole house.'),
    ('canon','psalms',135,19,'canon','psalms',118,3,5,E'Psalm 118:3 — *Let the house of Aaron now say*, the priestly house given its part.'),
    ('canon','psalms',135,20,'canon','psalms',118,4,6,E'Psalm 118:4 — *Let them now that fear Yahuah (LORD) say*, the third call sealing the same threefold structure.')
  ) AS m(s_ed,s_slug,s_ch,s_v,t_ed,t_slug,t_ch,t_v,sort_order,member_note)
  JOIN _s302_ps135_lookup sv ON sv.edition_slug=m.s_ed AND sv.book_slug=m.s_slug AND sv.chapter_number=m.s_ch AND sv.verse_number=m.s_v
  JOIN _s302_ps135_lookup tv ON tv.edition_slug=m.t_ed AND tv.book_slug=m.t_slug AND tv.chapter_number=m.t_ch AND tv.verse_number=m.t_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-135-bless-yahuah-o-house-of-israel-the-threefold-call'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
