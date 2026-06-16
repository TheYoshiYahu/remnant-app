-- =====================================================================
-- Session 339 — Malachi FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session339_malachi_cross_references.sql
-- =====================================================================

\echo 'session339 — Malachi cross-references starting...'
BEGIN;

-- ----- fragment: minion_malachi_1.sql (Malachi 1) -----
-- Chapter: Malachi 1 — "I have loved you." The book opens on the election of Jacob over Esau —
-- *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau
-- Jacob's brother? saith Yahuah (LORD): yet I loved Jacob, And I hated Esau* (1:2-3), the very
-- words Paul quotes (*Jacob have I loved, but Esau have I hated*, Romans 9:13): covenant-election
-- by Yahuah's choice and by conduct, NOT ethnic spite — Esau=Edom the profane line who sold his
-- birthright (Genesis 25:23-34; Hebrews 12:16). Then the lawsuit against the priests who despise
-- the Name and the altar: *A son honoureth his father... if then I be a father, where is mine
-- honour?* (1:6); *Ye offer polluted bread upon mine altar* (1:7); *if ye offer the blind for
-- sacrifice, is it not evil?* (1:8) — the blemished beast forbidden by the Torah (Leviticus 22:20-22;
-- Deuteronomy 15:21), the sacrificial worship NOT abolished but DEFENDED as holy. And the keystone:
-- ★★ *For from the rising of the sun even unto the going down of the same my name shall be great
-- among the Gentiles; and in every place incense shall be offered unto my name, and a pure offering*
-- (1:11) — the worship of the ONE Name (the Formed and the Formless: one Name over all flesh)
-- spreading to all the nations: NOT a replacement of Yashar'el but the ingathering of all flesh into
-- the worship of Yahuah (Isaiah 66:23; Zephaniah 2:11; Revelation 15:4/5:9; Tobit 13:11), the
-- incense = the prayers of the saints (Psalm 141:2; Revelation 8:3-4). The chapter closes: *for I am
-- a great King... and my name is dreadful among the heathen* (1:14).
-- Tag: mal01   Temp view: _s339_mal01_lookup
-- Sort band: base 46100, step 3 -> threads at 46100, 46103, 46106, 46109 (4 threads)
-- Source of EVERY row: 'canon','malachi',1,v
--
-- Malachi 1 coverage:
--   v.1 (The burden of the word of Yahuah unto Yashar'el by Malachi) — superscription; woven in prose, no add
--   ★ v.2-3 (I have loved you... yet I loved Jacob, And I hated Esau)
--        NT:     ★★★ Romans 9:13 (Jacob have I loved, but Esau have I hated) — THREAD 1 (quoted verbatim);
--                ★ Hebrews 12:16 (profane person, as Esau, who for one morsel of meat sold his birthright) — THREAD 1
--        Extras: ★ Jubilees 35:13 (now I love Jacob more than Esau, for he has done manifold evil deeds) — THREAD 1
--                (the conduct-not-ethnic guard, clean witness)
--        Tanakh: ★ Genesis 25:23 (Two nations are in thy womb... the elder shall serve the younger) — THREAD 1
--   v.4 (Edom... they shall build, but I will throw down) — Edom-judgment; woven into THREAD 1 prose, no separate add
--   v.5 (Yahuah will be magnified from the border of Yashar'el) — woven in prose, no add
--   v.6 (A son honoureth his father... O priests, that despise my name)
--        NT:     none warranted distinct (the honour-due-the-Father weave held in THREAD 2 prose)
--        Extras: none warranted
--        Tanakh: ★ Leviticus 22:2 (profane not my holy name in those things which they hallow) — THREAD 2
--   ★ v.7-8 (Ye offer polluted bread upon mine altar... if ye offer the blind for sacrifice, is it not evil?)
--        NT:     none warranted (the blemished-offering rebuke is Torah-internal; the worship DEFENDED not abolished)
--        Extras: none warranted
--        Tanakh: ★★ Leviticus 22:20 (whatsoever hath a blemish, that shall ye not offer) + Leviticus 22:22
--                (Blind, or broken, or maimed... ye shall not offer these) + Deuteronomy 15:21 (if there be any
--                blemish therein, as if it be lame, or blind... thou shalt not sacrifice it) — THREAD 2
--   v.9-10 (beseech Elohim... I have no pleasure in you... neither will I accept an offering) — woven into THREAD 2, no add
--   ★★ v.11 (from the rising of the sun... my name shall be great among the Gentiles; and in every place
--          incense shall be offered unto my name, and a pure offering)
--        NT:     ★★ Revelation 15:4 (all nations shall come and worship before thee) + ★★ Revelation 5:9
--                (redeemed us... out of every kindred, and tongue, and people, and nation) — THREAD 3;
--                ★ Revelation 8:3-4 (golden censer... the prayers of all saints... the smoke of the incense...
--                ascended up before Elohim) — THREAD 4
--        Extras: ★ Tobit 13:11 (Many nations shall come from far to the name of Yahuah (God) with gifts) — THREAD 3
--        Tanakh: ★ Isaiah 59:19 (So shall they fear the name of Yahuah from the west... from the rising of the sun)
--                + ★★ Isaiah 66:23 (from one new moon to another... shall all flesh come to worship before me)
--                + ★ Zephaniah 2:11 (men shall worship him, every one from his place... all the isles of the heathen)
--                — THREAD 3; ★ Psalm 141:2 (Let my prayer be set forth before thee as incense) — THREAD 4
--   v.12-13 (ye have profaned it... Behold, what a weariness is it!... ye brought that which was torn) — woven THREAD 2, no add
--   v.14 (cursed be the deceiver... I am a great King... and my name is dreadful among the heathen)
--        NT:     none warranted distinct (the great-King/name-dreadful weave folded into THREAD 3's Name-among-nations)
--        Extras: none warranted
--        Tanakh: held in prose (the Name dreadful among the heathen = the same Name great among the Gentiles of v.11)
--
-- Threads (slug — target libraries):
--   1. malachi-1-jacob-have-i-loved-but-esau-have-i-hated — NT (Romans 9, Hebrews 12) + Tanakh (Genesis 25)
--      + Extras (Jubilees 35) [extras] (★ the election by choice and by conduct; victims-not-ethnic guard)
--   2. malachi-1-ye-offer-polluted-bread-upon-mine-altar — Tanakh (Leviticus 22, Deuteronomy 15) [free]
--      (★ the despised Name + the blemished offering forbidden; the worship DEFENDED as holy, not abolished)
--   3. malachi-1-my-name-shall-be-great-among-the-gentiles — NT (Revelation 5, Revelation 15) + Tanakh
--      (Isaiah 59, Isaiah 66, Zephaniah 2) + Extras (Tobit 13) [extras]
--      (★★ the ONE Name worshiped by all flesh; ingathering of the nations, NOT replacement)
--   4. malachi-1-in-every-place-incense-shall-be-offered — NT (Revelation 8) + Tanakh (Psalm 141) [free]
--      (the incense/pure offering = the prayers of the saints rising before the throne)
--
-- Framing notes:
--   ★ JACOB/ESAU (THREAD 1): *yet I loved Jacob, And I hated Esau* (1:2-3) is the seedbed of Romans 9:13
--      (*Jacob have I loved, but Esau have I hated*) — covenant-election that *might stand, not of works,
--      but of him that calleth* (Romans 9:11). The choice was Yahuah's before the twins were born (Genesis
--      25:23, *the elder shall serve the younger*), and it was BORNE OUT in conduct: Esau *despised his
--      birthright* (Genesis 25:34) and is the *profane person... who for one morsel of meat sold his
--      birthright* (Hebrews 12:16). Jubilees keeps the same conduct-frame: *now I love Jacob more than Esau,
--      for he has done manifold evil deeds* (Jubilees 35:13). Esau=Edom is the profane LINE judged for its
--      profanity (1:4), never an ethnic spite — election and conduct, victims-not-enemies.
--   ★ THE BLEMISHED OFFERING (THREAD 2): *Ye offer polluted bread upon mine altar... if ye offer the blind
--      for sacrifice, is it not evil?* (1:7-8). Malachi prosecutes the priests by the Torah's own standard —
--      the sacrificial worship is DEFENDED as holy, not deemed defunct: *whatsoever hath a blemish, that
--      shall ye not offer* (Leviticus 22:20); *Blind, or broken, or maimed... ye shall not offer these unto
--      Yahuah* (Leviticus 22:22); *if there be any blemish therein, as if it be lame, or blind... thou shalt
--      not sacrifice it unto Yahuah Elohayka* (Deuteronomy 15:21). Despising the altar is despising the Name
--      (1:6; Leviticus 22:2). The appointed worship is not abolished here — it is honoured.
--   ★★ THE NAME GREAT AMONG THE NATIONS (THREAD 3): *from the rising of the sun even unto the going down of
--      the same my name shall be great among the Gentiles... a pure offering: for my name shall be great
--      among the heathen* (1:11). This is the worship of the ONE Name spreading to ALL flesh — the Formed and
--      the Formless, the single Name over the whole earth. Isaiah sings it: *So shall they fear the name of
--      Yahuah from the west, and his glory from the rising of the sun* (Isaiah 59:19); *from one new moon to
--      another, and from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23) —
--      the Sabbath and new moon STILL kept, all flesh streaming in. Zephaniah: *men shall worship him, every
--      one from his place* (Zephaniah 2:11). Revelation seals it: *all nations shall come and worship before
--      thee* (Revelation 15:4), the Lamb having *redeemed us to Elohim by thy blood out of every kindred, and
--      tongue, and people, and nation* (Revelation 5:9). And Tobit: *Many nations shall come from far to the
--      name of Yahuah (God) with gifts in their hands* (Tobit 13:11). This is the INGATHERING of the nations
--      into the worship of Yahuah — never a replacement of Yashar'el, but all flesh brought home to the
--      one Name.
--   THE INCENSE (THREAD 4): *in every place incense shall be offered unto my name* (1:11). The incense is
--      the prayers of the saints: *Let my prayer be set forth before thee as incense* (Psalm 141:2); and at
--      the heavenly altar, *much incense, that he should offer it with the prayers of all saints... the smoke
--      of the incense, which came with the prayers of the saints, ascended up before Elohim* (Revelation
--      8:3-4). The pure offering rising from every place is worship and prayer before the throne.
--   EXTRAS: Jubilees 35:13 (Jacob loved-more by conduct — clean) and Tobit 13:11 (nations to the Name —
--      clean). No extras forced on the blemished-offering or the incense.
--   VERSES WITH NO SEPARATE ADD: v.1 (superscription), v.4-5 (Edom-judgment + Yahuah magnified — woven into
--      THREAD 1), v.6/v.9-10/v.12-13 (the priestly lawsuit — woven into THREAD 2), v.14 (great King, name
--      dreadful among the heathen — folded into THREAD 3's Name-among-nations). All recorded, none silently skipped.

CREATE TEMP VIEW _s339_mal01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Jacob have I loved, but Esau have I hated — election by choice and by conduct
    ('canon','malachi',1,2,'canon','romans',9,13,'free',
      E'*As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13). Paul quotes Malachi verbatim — *yet I loved Jacob, And I hated Esau* (Malachi 1:2-3) — to show the covenant-election was Yahuah''s own choice: *the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth* (Romans 9:11). The love and the hatred name the two lines, the chosen and the profane — election by Yahuah''s sovereign call, not by merit and not by ethnic spite.'),
    ('canon','malachi',1,3,'canon','genesis',25,23,'free',
      E'*And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23). The election Malachi declares — *yet I loved Jacob, And I hated Esau* (Malachi 1:2-3) — was spoken at the womb: *the elder shall serve the younger*. Two nations, two lines; the choice of Jacob over Esau stands from before their birth.'),
    ('canon','malachi',1,3,'canon','hebrews',12,16,'free',
      E'*Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). Esau, whom Malachi names hated — *And I hated Esau* (Malachi 1:3) — is the *profane person* who held the birthright cheap and *sold his birthright* for a meal (Genesis 25:34). The hatred is upon the profane line and its conduct, not an ethnic spite; Esau despised the very inheritance Jacob loved.'),
    ('canon','malachi',1,3,'jubilees','jubilees',35,13,'extras',
      E'*I loved Esau formerly more than Jacob, because he was the first-born; but now I love Jacob more than Esau, for he has done manifold evil deeds, and there is no righteousness in him* (Jubilees 35:13). The restored witness frames the love and hatred of *yet I loved Jacob, And I hated Esau* (Malachi 1:2-3) by CONDUCT: Isaac comes to love Jacob more *for he has done manifold evil deeds*. The election is borne out in deeds and righteousness — conduct, not ethnicity; the guard against reading Malachi as mere spite.'),

    -- THREAD 2 (★): Ye offer polluted bread upon mine altar — the blemished offering forbidden, worship defended
    ('canon','malachi',1,6,'canon','leviticus',22,2,'free',
      E'*Speak unto Aaron and to his sons, that they separate themselves from the holy things of the children of Yashar''el (Israel), and that they profane not my holy name in those things which they hallow unto me: I am Yahuah (LORD)* (Leviticus 22:2). The priests of Malachi *despise my name* (Malachi 1:6) by profaning the holy things — the very sin Leviticus warns the sons of Aaron against: *that they profane not my holy name in those things which they hallow*. To despise the altar is to despise the Name.'),
    ('canon','malachi',1,8,'canon','leviticus',22,20,'free',
      E'*But whatsoever hath a blemish, that shall ye not offer: for it shall not be acceptable for you* (Leviticus 22:20). Malachi prosecutes the priests by the Torah''s own rule — *if ye offer the blind for sacrifice, is it not evil? and if ye offer the lame and sick, is it not evil?* (Malachi 1:8). The standard is Leviticus: *whatsoever hath a blemish, that shall ye not offer*. The sacrificial worship is DEFENDED as holy, never deemed defunct; the sin is the blemished beast, not the altar.'),
    ('canon','malachi',1,8,'canon','leviticus',22,22,'free',
      E'*Blind, or broken, or maimed, or having a wen, or scurvy, or scabbed, ye shall not offer these unto Yahuah (LORD), nor make an offering by fire of them upon the altar unto Yahuah (LORD)* (Leviticus 22:22). The blind and the lame Malachi condemns — *if ye offer the blind for sacrifice... if ye offer the lame and sick* (Malachi 1:8) — are named here exactly: *Blind, or broken, or maimed... ye shall not offer these unto Yahuah*. The Torah''s holiness for the altar is precisely the law Malachi upholds.'),
    ('canon','malachi',1,8,'canon','deuteronomy',15,21,'free',
      E'*And if there be any blemish therein, as if it be lame, or blind, or have any ill blemish, thou shalt not sacrifice it unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 15:21). The lame and blind offering Malachi calls evil — *if ye offer the lame and sick, is it not evil?* (Malachi 1:8) — is forbidden in the Torah: *if it be lame, or blind... thou shalt not sacrifice it unto Yahuah Elohayka*. Offer to the governor what you would not give Yahuah, the prophet says (1:8) — the very thing the Torah forbids.'),

    -- THREAD 3 (★★): My name shall be great among the Gentiles — the one Name worshiped by all flesh
    ('canon','malachi',1,11,'canon','isaiah',59,19,'free',
      E'*So shall they fear the name of Yahuah (LORD) from the west, and his glory from the rising of the sun. When the enemy shall come in like a flood, the Spirit of Yahuah (LORD) shall lift up a standard against him* (Isaiah 59:19). Malachi''s *from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles* (Malachi 1:11) is Isaiah''s word: the Name feared *from the west... from the rising of the sun* — the one Name honoured across the whole compass of the earth.'),
    ('canon','malachi',1,11,'canon','isaiah',66,23,'free',
      E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The *pure offering* and the worship *in every place* of Malachi 1:11 is Isaiah''s ingathering — *all flesh come to worship before me* — and note the appointed times STAND: *from one new moon to another, and from one sabbath to another*. The Name great among the nations does not abolish the Sabbath; all flesh streams in to keep it.'),
    ('canon','malachi',1,11,'canon','zephaniah',2,11,'free',
      E'*Yahuah (LORD) will be terrible unto them: for he will famish all the gods of the earth; and men shall worship him, every one from his place, even all the isles of the heathen* (Zephaniah 2:11). Malachi''s *in every place incense shall be offered unto my name* (Malachi 1:11) is Zephaniah''s vision: *men shall worship him, every one from his place, even all the isles of the heathen*. The idols famished, the one Name worshiped from every place on earth.'),
    ('canon','malachi',1,11,'canon','revelation',15,4,'extras',
      E'*Who shall not fear thee, O Yahuah (Lord), and glorify thy name? for thou only art holy: for all nations shall come and worship before thee; for thy judgments are made manifest* (Revelation 15:4). The Name *great among the Gentiles... great among the heathen* (Malachi 1:11) is consummated in the song of Moses and the Lamb: *all nations shall come and worship before thee*. The worship of the one Name fills the whole earth, just as Malachi foretold.'),
    ('canon','malachi',1,11,'canon','revelation',5,9,'extras',
      E'*And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9). The *pure offering* of the Name *among the Gentiles* (Malachi 1:11) is the worship of the redeemed *out of every kindred, and tongue, and people, and nation* — the ingathering of all flesh into the worship of the one Name, NOT a replacement of Yashar''el but the nations brought home.'),
    ('canon','malachi',1,11,'apocrypha','tobit',13,11,'extras',
      E'*Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven; all generations shall praise you with great joy* (Tobit 13:11). Malachi''s *my name shall be great among the Gentiles* (Malachi 1:11) is Tobit''s hope: *Many nations shall come from far to the name of Yahuah (God) with gifts*. The pure offering of the nations rising to the one Name — all generations praising the King of heaven.'),

    -- THREAD 4: In every place incense shall be offered — the incense = the prayers of the saints
    ('canon','malachi',1,11,'canon','psalms',141,2,'free',
      E'*Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2). The *incense... offered unto my name* in every place (Malachi 1:11) is the prayer of the faithful: *Let my prayer be set forth before thee as incense*. The pure offering rising from every place is worship and prayer before Yahuah.'),
    ('canon','malachi',1,11,'canon','revelation',8,3,'free',
      E'*And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3). The incense offered *in every place* unto the Name (Malachi 1:11) is gathered at the heavenly altar — *much incense, that he should offer it with the prayers of all saints*. The pure offering of every place ascends before the throne.'),
    ('canon','malachi',1,11,'canon','revelation',8,4,'free',
      E'*And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). Malachi''s incense unto the Name (Malachi 1:11) rises here at last — *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God)*. The pure offering of the nations is the prayers of the saints rising before the throne.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s339_mal01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s339_mal01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-1-jacob-have-i-loved-but-esau-have-i-hated',
       E'Jacob have I loved, but Esau have I hated — election by choice and by conduct',
       E'The book opens on Yahuah''s love and the people''s doubt: *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob, And I hated Esau, and laid his mountains and his heritage waste* (Malachi 1:2-3). Paul quotes it word for word — *As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13) — to prove the election was Yahuah''s own choice: *the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth* (Romans 9:11). The choice was spoken at the womb: *Two nations are in thy womb... and the elder shall serve the younger* (Genesis 25:23). And it was borne out in conduct — Esau is the *profane person... who for one morsel of meat sold his birthright* (Hebrews 12:16), who *despised his birthright* (Genesis 25:34). The restored witness keeps the same conduct-frame: *now I love Jacob more than Esau, for he has done manifold evil deeds, and there is no righteousness in him* (Jubilees 35:13). Esau=Edom is the profane LINE, judged for its profanity — *the people against whom Yahuah (LORD) hath indignation for ever* (1:4) — never an ethnic spite. Election by Yahuah''s sovereign call, confirmed in deeds: the chosen line and the profane.',
       sv.verse_id, ev.verse_id, 'extras', 46100
  FROM _s339_mal01_lookup sv, _s339_mal01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-1-ye-offer-polluted-bread-upon-mine-altar',
       E'Ye offer polluted bread upon mine altar — the blemished offering forbidden, the worship defended',
       E'The lawsuit turns to the priests who despise the Name: *A son honoureth his father, and a servant his master: if then I be a father, where is mine honour? and if I be a master, where is my fear? saith Yahuah Tseva''ot (LORD of hosts) unto you, O priests, that despise my name* (Malachi 1:6). They despise it by profaning the altar — the very sin the Torah warns the sons of Aaron against: *that they profane not my holy name in those things which they hallow unto me* (Leviticus 22:2). *Ye offer polluted bread upon mine altar... if ye offer the blind for sacrifice, is it not evil? and if ye offer the lame and sick, is it not evil? offer it now unto thy governor; will he be pleased with thee?* (1:7-8). Malachi prosecutes them by the Torah''s own standard for the altar — never deeming the sacrificial worship defunct, but DEFENDING it as holy: *whatsoever hath a blemish, that shall ye not offer: for it shall not be acceptable for you* (Leviticus 22:20); *Blind, or broken, or maimed, or having a wen, or scurvy, or scabbed, ye shall not offer these unto Yahuah (LORD)* (Leviticus 22:22); *if there be any blemish therein, as if it be lame, or blind, or have any ill blemish, thou shalt not sacrifice it unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 15:21). The sin is the blemished beast and the contemptuous heart — *I have no pleasure in you... neither will I accept an offering at your hand* (1:10) — not the altar. The appointed worship is honoured here, not abolished; to despise the offering is to despise the Name.',
       sv.verse_id, ev.verse_id, 'free', 46103
  FROM _s339_mal01_lookup sv, _s339_mal01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-1-my-name-shall-be-great-among-the-gentiles',
       E'My name shall be great among the Gentiles — the one Name worshiped by all flesh',
       E'Against the despised table comes the keystone promise: *For from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles; and in every place incense shall be offered unto my name, and a pure offering: for my name shall be great among the heathen, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 1:11), and at the close, *for I am a great King... and my name is dreadful among the heathen* (1:14). This is the worship of the ONE Name — the Formed and the Formless, the single Name of Yahuah — spreading to ALL flesh across the whole compass of the earth. Isaiah sings the same span: *So shall they fear the name of Yahuah (LORD) from the west, and his glory from the rising of the sun* (Isaiah 59:19); and *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23) — note the appointed times STAND, all flesh streaming in to keep them. Zephaniah: *men shall worship him, every one from his place, even all the isles of the heathen* (Zephaniah 2:11). The restored witness joins it: *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands... all generations shall praise you with great joy* (Tobit 13:11). And Revelation seals the consummation: *all nations shall come and worship before thee; for thy judgments are made manifest* (Revelation 15:4), the Lamb having *redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9). This is the INGATHERING of the nations into the worship of Yahuah — never the replacement of Yashar''el, but all flesh brought home to the one Name.',
       sv.verse_id, ev.verse_id, 'extras', 46106
  FROM _s339_mal01_lookup sv, _s339_mal01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-1-in-every-place-incense-shall-be-offered',
       E'In every place incense shall be offered — the pure offering, the prayers of the saints',
       E'Within the great promise lies a quiet picture of the worship itself: *in every place incense shall be offered unto my name, and a pure offering* (Malachi 1:11). The incense is the prayer of the faithful: *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2). And at the heavenly altar the picture is completed: *another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3), so that *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). The pure offering rising from every place is worship and prayer — the prayers of the saints ascending before the throne of Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 46109
  FROM _s339_mal01_lookup sv, _s339_mal01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13) — Paul quotes Malachi 1:2-3 verbatim; the election that *might stand, not of works, but of him that calleth* (Romans 9:11).'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-jacob-have-i-loved-but-esau-have-i-hated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Two nations are in thy womb... the elder shall serve the younger* (Genesis 25:23) — the choice of Jacob over Esau (Malachi 1:3) was spoken at the womb, before either had done good or evil.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-jacob-have-i-loved-but-esau-have-i-hated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16) — the hated Esau (Malachi 1:3) is the profane line that despised the inheritance Jacob loved.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-jacob-have-i-loved-but-esau-have-i-hated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *now I love Jacob more than Esau, for he has done manifold evil deeds, and there is no righteousness in him* (Jubilees 35:13) — the love and hatred of Malachi 1:2-3 framed by CONDUCT, the guard against reading it as ethnic spite.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=35 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-jacob-have-i-loved-but-esau-have-i-hated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *that they profane not my holy name in those things which they hallow unto me* (Leviticus 22:2) — the priests who *despise my name* (Malachi 1:6) profane the holy things; to despise the altar is to despise the Name.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-ye-offer-polluted-bread-upon-mine-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *whatsoever hath a blemish, that shall ye not offer: for it shall not be acceptable for you* (Leviticus 22:20) — the Torah''s own standard by which Malachi condemns the blind and lame offering (Malachi 1:8); the worship defended, not abolished.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=22 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-ye-offer-polluted-bread-upon-mine-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blind, or broken, or maimed... ye shall not offer these unto Yahuah (LORD)* (Leviticus 22:22) — the blind sacrifice of Malachi 1:8 named exactly; the holiness Malachi upholds.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=22 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-ye-offer-polluted-bread-upon-mine-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *if it be lame, or blind, or have any ill blemish, thou shalt not sacrifice it unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 15:21) — the lame offering Malachi calls evil (1:8) is forbidden by the Torah; offer the governor what you would not give Yahuah.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-ye-offer-polluted-bread-upon-mine-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *So shall they fear the name of Yahuah (LORD) from the west, and his glory from the rising of the sun* (Isaiah 59:19) — the Name great *from the rising of the sun* (Malachi 1:11), honoured across the whole compass of the earth.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-my-name-shall-be-great-among-the-gentiles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23) — the worship in every place (Malachi 1:11) with the Sabbath and new moon STILL kept; all flesh streaming in.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-my-name-shall-be-great-among-the-gentiles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *men shall worship him, every one from his place, even all the isles of the heathen* (Zephaniah 2:11) — the one Name worshiped *in every place* (Malachi 1:11), the idols famished, all the isles brought in.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-my-name-shall-be-great-among-the-gentiles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *all nations shall come and worship before thee; for thy judgments are made manifest* (Revelation 15:4) — the Name great *among the heathen* (Malachi 1:11) consummated in the song of Moses and the Lamb.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-my-name-shall-be-great-among-the-gentiles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9) — the pure offering of the Name among the Gentiles (Malachi 1:11) = the ingathering of all flesh, NOT a replacement of Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-my-name-shall-be-great-among-the-gentiles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands* (Tobit 13:11) — the restored witness to the Name great among the nations (Malachi 1:11); all generations praising the King of heaven.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-my-name-shall-be-great-among-the-gentiles'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2) — the incense offered in every place (Malachi 1:11) is the prayer of the faithful.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=141 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-in-every-place-incense-shall-be-offered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3) — the incense unto the Name (Malachi 1:11) gathered at the heavenly altar.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-in-every-place-incense-shall-be-offered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God)* (Revelation 8:4) — the pure offering of every place (Malachi 1:11) rising at last before the throne.'
  FROM cross_reference_threads t
  JOIN _s339_mal01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s339_mal01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-1-in-every-place-incense-shall-be-offered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_malachi_2.sql (Malachi 2) -----
-- Chapter: Malachi 2 — THE COVENANT WITH LEVI and the COVENANT OF MARRIAGE. The curse on the
-- priests who will not lay it to heart (2:1-3); then the charter of the true priest: *My covenant
-- was with him of life and peace... The law of truth was in his mouth, and iniquity was not found
-- in his lips... For the priest's lips should keep knowledge, and they should seek the law at his
-- mouth: for he is the messenger of Yahuah Tseva'ot (LORD of hosts)* (2:5-7) — the priest as
-- Torah-bearer and messenger, the Torah AFFIRMED as his charge. The priests departed, caused many
-- to stumble at the law, were partial in the law (2:8-9). Then the appeal to the one Father, one
-- Creator: *Have we not all one father? hath not one Elohim (God) created us?* (2:10) — the
-- Formed/Formless one El who made all, the brotherhood of the covenant. Yahudah profaned the
-- holiness of Yahuah, married the daughter of a strange god (2:11-12) — the mixed-worship/unequal
-- yoke. And the marriage-covenant: *Yahuah (LORD) hath been witness between thee and the wife of
-- thy youth... he hateth putting away* (2:14-16) — marriage as covenant, "I hate divorce," with
-- the two-house resonance (Yahuah Himself put away the northern house yet redeems her, Jer 3).
-- Tag: mal02   Temp view: _s339_mal02_lookup
-- Sort band: base 46125, step 3 -> threads at 46125, 46128, 46131, 46134, 46137, 46140 (6 threads)
-- Source of EVERY row: 'canon','malachi',2,v
--
-- Malachi 2 coverage:
--   v.1-3 (this commandment is for you... I will even send a curse upon you... corrupt your seed,
--          and spread dung upon your faces)
--        NT:     none warranted (the curse-for-not-laying-to-heart is the lawsuit preface; woven in prose)
--        Extras: none warranted
--        Tanakh: held in prose (preface to the Levi-covenant of THREAD 1)
--   ★★ v.4-7 (my covenant might be with Levi... My covenant was with him of life and peace... The
--          law of truth was in his mouth... the priest's lips should keep knowledge, and they should
--          seek the law at his mouth: for he is the messenger of Yahuah Tseva'ot)
--        NT:     ★ Hebrews 7 (the priesthood; the change to Melek Tsadiq's order) — held mainly in THREAD 2
--        Extras: ★★ Ecclesiasticus/Sirach 45:7,15,17 (an everlasting covenant he made with him and
--                gave him the priesthood... that he should teach Jacob the testimonies) — THREAD 1
--        Tanakh: ★★ Deuteronomy 33:8-10 (They shall teach Jacob thy judgments, and Yashar'el thy law),
--                ★ Leviticus 10:11 (that ye may teach the children of Yashar'el all the statutes),
--                ★ Malachi 3:1 (the messenger of the covenant) — THREAD 1
--   ★ v.8-9 (ye are departed out of the way; ye have caused many to stumble at the law; ye have
--          corrupted the covenant of Levi... have been partial in the law)
--        NT:     none warranted distinct (the corrupted-priest contrast carried in prose)
--        Extras: none warranted
--        Tanakh: ★ Malachi 3:3 (he shall purify the sons of Levi, and purge them as gold and silver) — THREAD 2
--   ★★ v.10 (Have we not all one father? hath not one Elohim (God) created us? why do we deal
--          treacherously every man against his brother)
--        NT:     ★★ Acts 17:26 (hath made of one blood all nations), ★ Ephesians 4:6 (One Elohim and
--                Father of all) — THREAD 3
--        Extras: none warranted (Acts/Eph carry it)
--        Tanakh: ★★ Genesis 1:27 (So Elohim created man in his own image) — THREAD 3
--   ★ v.11-12 (Yahudah hath profaned the holiness of Yahuah which he loved, and hath married the
--          daughter of a strange god... Yahuah will cut off the man that doeth this)
--        NT:     ★ 2 Corinthians 6:14 (Be ye not unequally yoked together with unbelievers) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Ezra 9:2 (the holy seed have mingled themselves with the people of those lands),
--                ★ Ezra 10:11 (separate yourselves... from the strange wives) — THREAD 4
--   v.13 (covering the altar of Yahuah with tears... he regardeth not the offering any more)
--        NT/Extras/Tanakh: none warranted (the rejected-offering is the consequence of the treachery
--                of 2:14; woven into THREAD 5's prose)
--   ★★ v.14-16 (Yahuah hath been witness between thee and the wife of thy youth... yet is she thy
--          companion, and the wife of thy covenant. And did not he make one?... That he might seek
--          a godly seed... he hateth putting away)
--        NT:     ★★ Matthew 19:6 (What therefore Elohim hath joined together, let not man put
--                asunder), ★★ Mark 10:9 (same) — THREAD 5
--        Extras: ★ Tobit 8:6-7 (You madest Adam, and gavest him Eve his wife... I take not this my
--                sister for lust but uprightly) — THREAD 5
--        Tanakh: ★★ Genesis 2:24 (they shall be one flesh), ★ Proverbs 5:18 (rejoice with the wife
--                of thy youth) — THREAD 5; AND the two-house resonance ★★ Jeremiah 3:8 (I had put her
--                away, and given her a bill of divorce), ★ Jeremiah 3:14 (I am married unto you) — THREAD 6
--   v.17 (Ye have wearied Yahuah with your words... Where is the Elohim of judgment?)
--        NT/Extras/Tanakh: none warranted (the wearying is the preface to the messenger of 3:1, already
--                anchored in THREAD 1 via Mal 3:1; recorded, not forced to a second add)
--
-- Threads (slug — target libraries):
--   1. malachi-2-the-covenant-with-levi-the-messenger-of-yahuah — Tanakh (Deut 33, Lev 10, Mal 3) +
--      Extras (Sirach 45) [extras]  (★★ the priest the Torah-bearer, the messenger of Yahuah; Torah affirmed)
--   2. malachi-2-departed-out-of-the-way-partial-in-the-law — NT (Hebrews 7) + Tanakh (Mal 3) [free]
--      (★ the corrupted priesthood vs. the refiner who purifies the sons of Levi)
--   3. malachi-2-have-we-not-all-one-father-one-elohim-created-us — NT (Acts 17, Eph 4) + Tanakh (Gen 1) [free]
--      (★★ one Father, one Creator; the Formed/Formless one El; the brotherhood not to deal treacherously)
--   4. malachi-2-married-the-daughter-of-a-strange-god — NT (2 Cor 6) + Tanakh (Ezra 9, Ezra 10) [free]
--      (★ the mixed-worship / unequal yoke; the holy seed not to mingle)
--   5. malachi-2-i-hate-putting-away-the-wife-of-thy-youth — NT (Matt 19, Mark 10) + Tanakh (Gen 2, Prov 5)
--      + Extras (Tobit 8) [extras]  (★★ marriage as covenant; "I hate putting away"; one flesh, a godly seed)
--   6. malachi-2-yahuah-witness-of-the-covenant-the-divorced-house-redeemed — Tanakh (Jeremiah 3) [free]
--      (★ the two-house resonance: Yahuah put away the northern house yet remains married, and redeems her)
--
-- Framing notes:
--   ★★ THE COVENANT WITH LEVI (THREAD 1): the true priest is defined by the Torah in his mouth —
--      *The law of truth was in his mouth, and iniquity was not found in his lips... For the priest's
--      lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger
--      of Yahuah Tseva'ot* (2:6-7). This is the Torah AFFIRMED, never abolished: the priest's whole
--      office is to carry and teach it. Moses' Levi-blessing says the same: *They shall teach Jacob
--      thy judgments, and Yashar'el (Israel) thy law* (Deut 33:10); the priest's charge is *that ye
--      may teach the children of Yashar'el (Israel) all the statutes* (Lev 10:11). Sirach remembers
--      the everlasting covenant of priesthood: *An everlasting covenant he made with him and gave him
--      the priesthood among the people* (Sirach 45:7), *that he should teach Jacob the testimonies, and
--      inform Yashar'el (Israel) in his laws* (45:17). And the messenger-pattern points forward to the
--      one who comes: *Behold, I will send my messenger... even the messenger of the covenant* (Mal 3:1).
--   ★ THE CORRUPTED PRIESTHOOD (THREAD 2): the priests *departed out of the way... caused many to
--      stumble at the law... corrupted the covenant of Levi* and *have been partial in the law* (2:8-9)
--      — the inverse of the Levi-charter. Malachi's own remedy is the refiner: *he shall purify the
--      sons of Levi, and purge them as gold and silver* (Mal 3:3). And Hebrews shows the deeper
--      answer: a priest after the order of Melek Tsadiq, *holy, harmless, undefiled* (Heb 7:26), the
--      flawless Priest the corrupt Levites could never be.
--   ★★ ONE FATHER, ONE CREATOR (THREAD 3): *Have we not all one father? hath not one Elohim (God)
--      created us?* (2:10). The Formed/Formless: one El created all — *So Elohim (God) created man in
--      his own image* (Gen 1:27); *hath made of one blood all nations of men* (Acts 17:26); *One
--      Elohim (God) and Father of all* (Eph 4:6). The brotherhood of the covenant people is not to
--      deal treacherously — the two houses are kin under one Father.
--   ★ THE STRANGE WIVES (THREAD 4): *Yahudah (Judah)... hath married the daughter of a strange god*
--      (2:11) — the mixed-worship/unequal-yoke problem Ezra fought: *the holy seed have mingled
--      themselves with the people of those lands* (Ezra 9:2); *separate yourselves... from the strange
--      wives* (Ezra 10:11); answered forward by *Be ye not unequally yoked together with unbelievers*
--      (2 Cor 6:14). The seed of promise requires paternal lineage AND covenant-word together — not
--      to be mingled with strange-god worship.
--   ★★ I HATE PUTTING AWAY (THREAD 5): *Yahuah (LORD) hath been witness between thee and the wife of
--      thy youth... yet is she thy companion, and the wife of thy covenant. And did not he make one?...
--      That he might seek a godly seed... he hateth putting away* (2:14-16). Marriage is a covenant
--      Yahuah witnesses, rooted in Eden: *they shall be one flesh* (Gen 2:24); affirmed by Yahusha:
--      *What therefore Elohim (God) hath joined together, let not man put asunder* (Matt 19:6; Mark
--      10:9); celebrated in *rejoice with the wife of thy youth* (Prov 5:18); and prayed in Tobit's
--      uprightness: *You madest Adam, and gavest him Eve his wife for an helper... I take not this my
--      sister for lust but uprightly* (Tobit 8:6-7). The "godly seed" of 2:15 is the seed-of-promise
--      purpose of one-flesh covenant marriage.
--   ★ THE DIVORCED HOUSE REDEEMED (THREAD 6): the marriage-covenant carries a two-house resonance.
--      Yahuah Himself, witness against the treacherous husband, had Himself put away the northern
--      house for her adultery: *I had put her away, and given her a bill of divorce* (Jer 3:8) — yet
--      He does NOT cast her off: *Turn, O backsliding children, saith Yahuah (LORD); for I am married
--      unto you... and I will bring you to Zion* (Jer 3:14). The One who *hateth putting away* (2:16)
--      keeps His marriage-covenant even with the scattered house — covenant-faithfulness, victims not
--      enemies, the lost wife brought home.
--   EXTRAS: Sirach 45 (the everlasting covenant of priesthood, the priest who teaches the testimonies)
--      and Tobit 8 (marriage taken uprightly, the Eden one-flesh pattern) — both clean witnesses,
--      parses verified. No extras forced on the one-Father appeal, the strange-wives, the corrupt
--      priesthood, or the divorced-house resonance.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the curse for not laying to heart — lawsuit preface to THREAD 1),
--      v.13 (the rejected offering — consequence of the treachery, woven into THREAD 5 prose), v.17
--      (the wearying / "Where is the Elohim of judgment?" — preface to the messenger of Mal 3:1, already
--      anchored in THREAD 1). All recorded, none silently skipped.

CREATE TEMP VIEW _s339_mal02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): the covenant with Levi — the priest the messenger of Yahuah, the Torah in his mouth
    ('canon','malachi',2,7,'canon','deuteronomy',33,10,'free',
      E'*They shall teach Jacob thy judgments, and Yashar''el (Israel) thy law: they shall put incense before thee, and whole burnt sacrifice upon thine altar* (Deuteronomy 33:10). The priest of *the law of truth was in his mouth* (Malachi 2:6), whose *lips should keep knowledge, and they should seek the law at his mouth* (2:7), is exactly the Levi Moses blessed — the tribe charged to *teach Jacob thy judgments, and Yashar''el (Israel) thy law*. The priest''s whole office is to carry the Torah; the Torah is affirmed as his charge, never abolished.'),
    ('canon','malachi',2,7,'canon','deuteronomy',33,8,'free',
      E'*And of Levi he said, Let thy Thummim and thy Urim be with thy holy one, whom thou didst prove at Massah, and with whom thou didst strive at the waters of Meribah* (Deuteronomy 33:8). The *messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7) is the Levite of the Urim and Thummim, the holy one set apart to mediate the covenant-word. Malachi recalls the very blessing that set Levi to seek and speak the Torah at the people''s asking.'),
    ('canon','malachi',2,7,'canon','leviticus',10,11,'free',
      E'*And that ye may teach the children of Yashar''el (Israel) all the statutes which Yahuah (LORD) hath spoken unto them by the hand of Moses* (Leviticus 10:11). The charge that *the priest''s lips should keep knowledge, and they should seek the law at his mouth* (Malachi 2:7) is the priest''s founding commission: *that ye may teach... all the statutes which Yahuah (LORD) hath spoken*. The Torah-teaching priest of Leviticus is the *messenger of Yahuah* Malachi defends.'),
    ('canon','malachi',2,5,'apocrypha','ecclesiasticus',45,7,'extras',
      E'*An everlasting covenant he made with him and gave him the priesthood among the people; he beautified him with comely ornaments, and clothed him with a robe of glory* (Ecclesiasticus/Sirach 45:7). The *covenant... of life and peace* (Malachi 2:5) Yahuah made with Levi is the *everlasting covenant* of priesthood Sirach remembers — the office of life and glory given to Aaron and his seed. Malachi pleads that this everlasting covenant not be corrupted.'),
    ('canon','malachi',2,6,'apocrypha','ecclesiasticus',45,17,'extras',
      E'*He gave to him his commandments, and authority in the statutes of judgments, that he should teach Jacob the testimonies, and inform Yashar''el (Israel) in his laws* (Ecclesiasticus/Sirach 45:17). The priest with *the law of truth... in his mouth* who *did turn many away from iniquity* (Malachi 2:6) is the Levite Sirach describes — given authority *that he should teach Jacob the testimonies, and inform Yashar''el (Israel) in his laws*. The priest''s glory is the Torah he teaches.'),
    ('canon','malachi',2,7,'canon','malachi',3,1,'free',
      E'*Behold, I will send my messenger, and he shall prepare the way before me... even the messenger of the covenant, whom ye delight in* (Malachi 3:1). The priest who *is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7) points forward to THE messenger who comes — *the messenger of the covenant*. The corrupted priest-messengers of chapter 2 set up the promise of the true Messenger of chapter 3.'),

    -- THREAD 2 (★): departed out of the way, partial in the law — corrupt priests vs the refiner
    ('canon','malachi',2,8,'canon','malachi',3,3,'free',
      E'*And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). The priests who *are departed out of the way... have corrupted the covenant of Levi* (Malachi 2:8) are exactly the *sons of Levi* the refiner comes to purge — *and purify the sons of Levi, and purge them as gold and silver*. The corruption of chapter 2 is answered by the refining of chapter 3.'),
    ('canon','malachi',2,9,'canon','hebrews',7,26,'free',
      E'*For such an high priest became us, who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens* (Hebrews 7:26). The priests *made... contemptible and base before all the people* because they *have been partial in the law* (Malachi 2:9) are the foil to the flawless Priest after the order of Melek Tsadiq (Melchizedek) — *holy, harmless, undefiled, separate from sinners*. What the corrupt Levites could not be, the eternal Priest is.'),

    -- THREAD 3 (★★): have we not all one father? hath not one Elohim created us?
    ('canon','malachi',2,10,'canon','genesis',1,27,'free',
      E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them* (Genesis 1:27). *Hath not one Elohim (God) created us?* (Malachi 2:10) reaches back to the creation: the one El who *created man in his own image* made the whole brotherhood. Because one Creator formed us all, *to deal treacherously every man against his brother* (2:10) tears the bond of the one who made us.'),
    ('canon','malachi',2,10,'canon','acts',17,26,'free',
      E'*And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). *Have we not all one father? hath not one Elohim (God) created us?* (Malachi 2:10) is Paul''s own argument at Athens — Yahuah *hath made of one blood all nations of men*. One Creator, one origin; the treachery of brother against brother denies the Father who made them one.'),
    ('canon','malachi',2,10,'canon','ephesians',4,6,'free',
      E'*One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:6). The appeal *Have we not all one father?* (Malachi 2:10) is sung whole in Ephesians — *One Elohim (God) and Father of all*. The Formed and the Formless: one El created all, one Father is over all; the covenant-people are kin and must not deal treacherously against a brother.'),

    -- THREAD 4 (★): married the daughter of a strange god — the unequal yoke, the holy seed not mingled
    ('canon','malachi',2,11,'canon','ezra',9,2,'free',
      E'*For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands: yea, the hand of the princes and rulers hath been chief in this trespass* (Ezra 9:2). When *Yahudah (Judah)... hath married the daughter of a strange god* (Malachi 2:11), it is the very trespass Ezra mourned — *the holy seed have mingled themselves with the people of those lands*. The seed of promise is carried by lineage AND covenant-word together, not mingled with strange-god worship.'),
    ('canon','malachi',2,11,'canon','ezra',10,11,'free',
      E'*Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives* (Ezra 10:11). The abomination that *Yahudah (Judah) hath profaned the holiness of Yahuah (LORD)... and hath married the daughter of a strange god* (Malachi 2:11) is answered by Ezra''s call to *separate yourselves... from the strange wives*. The holiness of Yahuah is profaned by mixed worship; repentance is separation back to the covenant.'),
    ('canon','malachi',2,11,'canon','2-corinthians',6,14,'free',
      E'*Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* (2 Corinthians 6:14). To marry *the daughter of a strange god* (Malachi 2:11) is the unequal yoke Paul forbids — *be ye not unequally yoked together with unbelievers*. The covenant-people are the temple of the living Elohim (God); strange-god union profanes the holiness Yahuah loved.'),

    -- THREAD 5 (★★): I hate putting away — the wife of thy youth, the covenant, one flesh, a godly seed
    ('canon','malachi',2,15,'canon','genesis',2,24,'free',
      E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). *And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed* (Malachi 2:15) reaches back to Eden — *they shall be one flesh*. Yahuah made the two one to seek a godly seed; the one-flesh covenant of creation is the ground Malachi stands on against the treacherous husband.'),
    ('canon','malachi',2,16,'canon','matthew',19,6,'free',
      E'*Wherefore they are no more twain, but one flesh. What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:6). Yahusha (Jesus) affirms the very word *he hateth putting away* (Malachi 2:16): *What therefore Elohim (God) hath joined together, let not man put asunder*. The divorce Yahuah hates is the sundering of what He joined — the marriage-covenant He Himself witnessed (2:14).'),
    ('canon','malachi',2,16,'canon','mark',10,9,'free',
      E'*What therefore Elohim (God) hath joined together, let not man put asunder* (Mark 10:9). Mark records the same charter against putting away — *let not man put asunder* — that Malachi declares Yahuah hates: *he hateth putting away* (Malachi 2:16). Moses suffered the bill of divorce *for the hardness of your heart* (Mark 10:5), but from the beginning it was one flesh; Yahuah''s heart hates the sundering.'),
    ('canon','malachi',2,14,'canon','proverbs',5,18,'free',
      E'*Let thy fountain be blessed: and rejoice with the wife of thy youth* (Proverbs 5:18). Against the man who *dealt treacherously* with *the wife of thy youth* (Malachi 2:14), the wisdom-word says *rejoice with the wife of thy youth*. The same phrase — *the wife of thy youth* — names the covenant-companion to be cherished, not betrayed; she is *thy companion, and the wife of thy covenant* (2:14).'),
    ('canon','malachi',2,15,'apocrypha','tobit',8,6,'extras',
      E'*You madest Adam, and gavest him Eve his wife for an helper and stay: of them came mankind: you have said, It is not good that man should be alone; let us make to him an aid like to himself* (Tobit 8:6). The marriage *that he might seek a godly seed* (Malachi 2:15) is the Eden pattern Tobias prays — *You madest Adam, and gavest him Eve his wife for an helper... of them came mankind*. Marriage taken in the fear of Yahuah seeks the seed of promise, not lust.'),
    ('canon','malachi',2,16,'apocrypha','tobit',8,7,'extras',
      E'*And now, O Yahuah (God), I take not this my sister for lust but uprightly: therefore mercifully ordain that we may become aged together* (Tobit 8:7). Against treachery toward *the wife of thy covenant* (Malachi 2:14), Tobias models the covenant-marriage Yahuah loves — *I take not this my sister for lust but uprightly... that we may become aged together*. The wife of thy youth is a companion for life, not a thing to be put away.'),

    -- THREAD 6 (★): Yahuah witness of the covenant — the divorced northern house yet married, redeemed
    ('canon','malachi',2,16,'canon','jeremiah',3,8,'free',
      E'*And I saw, when for all the causes whereby backsliding Yashar''el (Israel) committed adultery I had put her away, and given her a bill of divorce; yet her treacherous sister Yahudah (Judah) feared not, but went and played the harlot also* (Jeremiah 3:8). The One who *hateth putting away* (Malachi 2:16) had Himself *put her away, and given her a bill of divorce* — the northern house, for her adultery. The marriage-covenant Malachi defends is the very covenant Yahuah keeps with His scattered wife.'),
    ('canon','malachi',2,14,'canon','jeremiah',3,14,'free',
      E'*Turn, O backsliding children, saith Yahuah (LORD); for I am married unto you: and I will take you one of a city, and two of a family, and I will bring you to Zion* (Jeremiah 3:14). *Yahuah (LORD) hath been witness between thee and the wife of thy youth* (Malachi 2:14) — and Yahuah is Himself the faithful Husband: *I am married unto you... and I will bring you to Zion*. The two-house resonance: the divorced northern house is not cast off but redeemed, gathered home by the One who keeps the marriage-covenant.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s339_mal02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s339_mal02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-2-the-covenant-with-levi-the-messenger-of-yahuah',
       E'The covenant with Levi — the law of truth in his mouth, the messenger of Yahuah',
       E'Against the failing priests Malachi sets up the charter of the true priest: *And ye shall know that I have sent this commandment unto you, that my covenant might be with Levi, saith Yahuah Tseva''ot (LORD of hosts). My covenant was with him of life and peace... The law of truth was in his mouth, and iniquity was not found in his lips: he walked with me in peace and equity, and did turn many away from iniquity. For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:4-7). The priest''s whole office is the Torah — to carry it, keep it, teach it, seek it at his mouth. The Torah is AFFIRMED, never abolished; it is the priest''s glory. This is the very office Moses blessed: *And of Levi he said, Let thy Thummim and thy Urim be with thy holy one* (Deuteronomy 33:8); *They shall teach Jacob thy judgments, and Yashar''el (Israel) thy law* (33:10) — and the founding charge at Sinai: *that ye may teach the children of Yashar''el (Israel) all the statutes which Yahuah (LORD) hath spoken unto them by the hand of Moses* (Leviticus 10:11). The restored witness remembers the everlasting covenant of priesthood: *An everlasting covenant he made with him and gave him the priesthood among the people* (Ecclesiasticus/Sirach 45:7), *that he should teach Jacob the testimonies, and inform Yashar''el (Israel) in his laws* (45:17). And the messenger Malachi names points forward to the One who comes: *Behold, I will send my messenger... even the messenger of the covenant, whom ye delight in* (Malachi 3:1). The corrupt priest-messengers of chapter 2 set up the promise of the true Messenger of chapter 3.',
       sv.verse_id, ev.verse_id, 'extras', 46125
  FROM _s339_mal02_lookup sv, _s339_mal02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-2-departed-out-of-the-way-partial-in-the-law',
       E'Ye are departed out of the way — the corrupt priesthood and the refiner who purges Levi',
       E'The charter of Levi has been broken: *But ye are departed out of the way; ye have caused many to stumble at the law; ye have corrupted the covenant of Levi, saith Yahuah Tseva''ot (LORD of hosts). Therefore have I also made you contemptible and base before all the people, according as ye have not kept my ways, but have been partial in the law* (Malachi 2:8-9). These are the exact inverse of the true priest: he *did turn many away from iniquity* (2:6), they *caused many to stumble at the law*; his lips kept knowledge, theirs were partial in it. Malachi''s own remedy follows in the next chapter — the refiner who purifies the very sons of Levi: *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). And the deeper answer is the flawless Priest after the order of Melek Tsadiq (Melchizedek): *For such an high priest became us, who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens* (Hebrews 7:26). What the partial, corrupt Levites could never be, the eternal Priest is — holy and undefiled, the One who keeps the covenant of life and peace they corrupted.',
       sv.verse_id, ev.verse_id, 'free', 46128
  FROM _s339_mal02_lookup sv, _s339_mal02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-2-have-we-not-all-one-father-one-elohim-created-us',
       E'Have we not all one father? — one Creator, one Father, the brotherhood of the covenant',
       E'From the priesthood Malachi turns to the whole people with the one ground of all brotherhood: *Have we not all one father? hath not one Elohim (God) created us? why do we deal treacherously every man against his brother, by profaning the covenant of our fathers?* (Malachi 2:10). The argument is creation itself: one El made us. *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them* (Genesis 1:27) — the one Creator formed the whole human family. Paul preaches the same at Athens: *And hath made of one blood all nations of men for to dwell on all the face of the earth* (Acts 17:26); and sings it whole to the Ephesians: *One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:6). This is the Formed and the Formless: one El created all, one Father is over all. Because one Father made us, treachery of brother against brother — and the profaning of *the covenant of our fathers* — tears the bond of the One who made us one. The two houses are kin under one Father; they must not deal treacherously.',
       sv.verse_id, ev.verse_id, 'free', 46131
  FROM _s339_mal02_lookup sv, _s339_mal02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-2-married-the-daughter-of-a-strange-god',
       E'Married the daughter of a strange god — the unequal yoke, the holy seed not mingled',
       E'The treachery takes a concrete form — mixed worship: *Yahudah (Judah) hath dealt treacherously, and an abomination is committed in Yashar''el (Israel) and in Jerusalem; for Yahudah (Judah) hath profaned the holiness of Yahuah (LORD) which he loved, and hath married the daughter of a strange god* (Malachi 2:11). This is the very trespass Ezra mourned in the return: *For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands* (Ezra 9:2), and his call was separation — *make confession unto Yahuah Elohim (the LORD God) of your fathers... and separate yourselves from the people of the land, and from the strange wives* (Ezra 10:11). Paul carries the same charge forward: *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* (2 Corinthians 6:14). The seed of promise is carried by paternal lineage AND covenant-word together — never lineage alone, never mingled with strange-god worship. To marry the daughter of a strange god is to profane the holiness Yahuah loved.',
       sv.verse_id, ev.verse_id, 'free', 46134
  FROM _s339_mal02_lookup sv, _s339_mal02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-2-i-hate-putting-away-the-wife-of-thy-youth',
       E'I hate putting away — the wife of thy youth, the covenant, one flesh, a godly seed',
       E'Malachi names the deepest treachery — the betrayal of the marriage-covenant: *Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant. And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth. For Yahuah (LORD), the Elohim (God) of Yashar''el (Israel), saith that he hateth putting away* (Malachi 2:14-16). Marriage is a covenant Yahuah Himself witnesses, rooted in Eden: *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). Yahusha (Jesus) affirms that one-flesh charter against divorce: *Wherefore they are no more twain, but one flesh. What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:6; *let not man put asunder*, Mark 10:9). The wisdom-word cherishes the same companion: *Let thy fountain be blessed: and rejoice with the wife of thy youth* (Proverbs 5:18). And the restored witness prays marriage taken uprightly in the Eden pattern: *You madest Adam, and gavest him Eve his wife for an helper and stay... It is not good that man should be alone* (Tobit 8:6); *I take not this my sister for lust but uprightly: therefore mercifully ordain that we may become aged together* (Tobit 8:7). The *godly seed* of 2:15 is the seed-of-promise purpose of one-flesh covenant marriage; Yahuah hates the putting away that breaks it.',
       sv.verse_id, ev.verse_id, 'extras', 46137
  FROM _s339_mal02_lookup sv, _s339_mal02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-2-yahuah-witness-of-the-covenant-the-divorced-house-redeemed',
       E'The divorced house redeemed — Yahuah keeps His marriage-covenant with the scattered wife',
       E'The marriage-covenant Malachi defends carries a two-house resonance. *Yahuah (LORD) hath been witness between thee and the wife of thy youth* (Malachi 2:14) — and Yahuah is Himself the wronged-yet-faithful Husband of His people. He had Himself put away the northern house for her adultery: *And I saw, when for all the causes whereby backsliding Yashar''el (Israel) committed adultery I had put her away, and given her a bill of divorce; yet her treacherous sister Yahudah (Judah) feared not, but went and played the harlot also* (Jeremiah 3:8). Yet the One who *hateth putting away* (Malachi 2:16) does not cast His wife off forever: *Turn, O backsliding children, saith Yahuah (LORD); for I am married unto you: and I will take you one of a city, and two of a family, and I will bring you to Zion* (Jeremiah 3:14). The divorced northern house is not abandoned but redeemed, gathered home — *the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel)* (Jeremiah 3:18), the two sticks made one. This is covenant-faithfulness, victims not enemies: the lost wife brought back by the Husband who keeps the marriage-covenant He hates to see broken.',
       sv.verse_id, ev.verse_id, 'free', 46140
  FROM _s339_mal02_lookup sv, _s339_mal02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *They shall teach Jacob thy judgments, and Yashar''el (Israel) thy law* (Deuteronomy 33:10) — the priest whose lips *seek the law at his mouth* (Malachi 2:7) is the Levi Moses blessed to teach the Torah; the Torah affirmed as the priest''s charge.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-the-covenant-with-levi-the-messenger-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Let thy Thummim and thy Urim be with thy holy one* (Deuteronomy 33:8) — the *messenger of Yahuah Tseva''ot* (Malachi 2:7) is the Levite of the Urim and Thummim, set apart to mediate the covenant-word.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-the-covenant-with-levi-the-messenger-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *that ye may teach the children of Yashar''el (Israel) all the statutes which Yahuah (LORD) hath spoken* (Leviticus 10:11) — the priest''s founding charge: the *knowledge* his *lips should keep* (Malachi 2:7) is the Torah he is set to teach.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-the-covenant-with-levi-the-messenger-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *An everlasting covenant he made with him and gave him the priesthood among the people* (Ecclesiasticus/Sirach 45:7) — the *covenant... of life and peace* (Malachi 2:5) Yahuah made with Levi, remembered as the everlasting priesthood.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=45 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-the-covenant-with-levi-the-messenger-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *that he should teach Jacob the testimonies, and inform Yashar''el (Israel) in his laws* (Ecclesiasticus/Sirach 45:17) — the priest with *the law of truth... in his mouth* (Malachi 2:6); his glory is the Torah he teaches.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=45 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-the-covenant-with-levi-the-messenger-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*even the messenger of the covenant, whom ye delight in* (Malachi 3:1) — the priest who *is the messenger of Yahuah Tseva''ot* (Malachi 2:7) points forward to THE Messenger who comes.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-the-covenant-with-levi-the-messenger-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he shall purify the sons of Levi, and purge them as gold and silver* (Malachi 3:3) — the priests who *corrupted the covenant of Levi* (Malachi 2:8) are the very sons the refiner comes to purge.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-departed-out-of-the-way-partial-in-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*such an high priest... who is holy, harmless, undefiled, separate from sinners* (Hebrews 7:26) — the foil to the priests *partial in the law* (Malachi 2:9); the flawless Priest after Melek Tsadiq the corrupt Levites could never be.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-departed-out-of-the-way-partial-in-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *So Elohim (God) created man in his own image* (Genesis 1:27) — *hath not one Elohim (God) created us?* (Malachi 2:10) reaches back to the one Creator who formed the whole brotherhood.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-have-we-not-all-one-father-one-elohim-created-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *hath made of one blood all nations of men* (Acts 17:26) — Paul''s own Athens argument is Malachi''s: *have we not all one father? hath not one Elohim (God) created us?* (Malachi 2:10).'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-have-we-not-all-one-father-one-elohim-created-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:6) — the appeal *have we not all one father?* (Malachi 2:10) sung whole; the Formed and the Formless, one El over all.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-have-we-not-all-one-father-one-elohim-created-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the holy seed have mingled themselves with the people of those lands* (Ezra 9:2) — to marry *the daughter of a strange god* (Malachi 2:11) is the very trespass Ezra mourned; the seed of promise not to be mingled.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-married-the-daughter-of-a-strange-god'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*separate yourselves... from the strange wives* (Ezra 10:11) — the holiness *Yahuah (LORD)... loved* (Malachi 2:11) profaned by strange-god union; repentance is separation back to the covenant.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-married-the-daughter-of-a-strange-god'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Be ye not unequally yoked together with unbelievers* (2 Corinthians 6:14) — marrying *the daughter of a strange god* (Malachi 2:11) is the unequal yoke Paul forbids; what communion hath light with darkness?'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-married-the-daughter-of-a-strange-god'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they shall be one flesh* (Genesis 2:24) — *and did not he make one?... That he might seek a godly seed* (Malachi 2:15) reaches back to the Eden one-flesh covenant.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-i-hate-putting-away-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:6) — Yahusha affirms the word *he hateth putting away* (Malachi 2:16); the divorce Yahuah hates is the sundering of what He joined.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-i-hate-putting-away-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *What therefore Elohim (God) hath joined together, let not man put asunder* (Mark 10:9) — the same charter against putting away; from the beginning it was one flesh, and Yahuah''s heart *hateth putting away* (Malachi 2:16).'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-i-hate-putting-away-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*rejoice with the wife of thy youth* (Proverbs 5:18) — the same phrase Malachi defends: *the wife of thy youth... thy companion, and the wife of thy covenant* (Malachi 2:14), to be cherished not betrayed.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-i-hate-putting-away-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *You madest Adam, and gavest him Eve his wife for an helper... It is not good that man should be alone* (Tobit 8:6) — the marriage *that he might seek a godly seed* (Malachi 2:15) prayed in the Eden pattern.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=8 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-i-hate-putting-away-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I take not this my sister for lust but uprightly... that we may become aged together* (Tobit 8:7) — covenant-marriage against treachery toward *the wife of thy covenant* (Malachi 2:14); a companion for life, not to be put away.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-i-hate-putting-away-the-wife-of-thy-youth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I had put her away, and given her a bill of divorce* (Jeremiah 3:8) — the One who *hateth putting away* (Malachi 2:16) had Himself put away the adulterous northern house; the marriage-covenant He defends is the one He keeps.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-yahuah-witness-of-the-covenant-the-divorced-house-redeemed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *for I am married unto you... and I will bring you to Zion* (Jeremiah 3:14) — Yahuah, *witness between thee and the wife of thy youth* (Malachi 2:14), is the faithful Husband who redeems the divorced house, not casts her off.'
  FROM cross_reference_threads t
  JOIN _s339_mal02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s339_mal02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-2-yahuah-witness-of-the-covenant-the-divorced-house-redeemed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_malachi_3.sql (Malachi 3) -----
-- Chapter: Malachi 3 — ★★ THE MESSENGER + THE MESSENGER OF THE COVENANT; the refiner's fire; "I am
-- Yahuah, I change not"; ye are gone away from mine ordinances / RETURN (Torah-never-abolished); the
-- tithe / robbing Elohim; the book of remembrance / my jewels. *Behold, I will send my messenger, and
-- he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his
-- temple, even the messenger of the covenant* (3:1) — the forerunner (John the Immerser, Mark 1:2 /
-- Matthew 11:10 / Luke 7:27, with Isaiah 40:3) and the messenger-of-the-covenant who is Yahuah coming
-- to his temple = the Formed Son who HAS a Father (Formed/Formless). *He is like a refiner's fire...
-- and he shall purify the sons of Levi* (3:2-3 — Zechariah 13:9, Isaiah 1:25, 1 Peter 1:7, Sirach 2:5,
-- the offering in righteousness Romans 12:1). *I will be a swift witness against... those that oppress
-- the hireling in his wages, the widow, and the fatherless, and... the stranger* (3:5 — James 5:4,
-- Zechariah 7:10, Exodus 22:21-22). ★★★ *For I am Yahuah (LORD), I change not; therefore ye sons of
-- Jacob are not consumed* (3:6 — Numbers 23:19, Hebrews 13:8, James 1:17; the anti-replacement guard,
-- Romans 11:1/11:29). ★★★ *Even from the days of your fathers ye are gone away from mine ordinances...
-- Return unto me, and I will return unto you* (3:7 — the ordinances STAND, the people departed, the call
-- is to RETURN; Zechariah 1:3, Joel 2:12, Deuteronomy 30:2, Acts 3:19). The tithe robbed (3:8-10 —
-- Deuteronomy 14:22, Leviticus 27:30, Genesis 14:20 / Hebrews 7:2, Proverbs 3:9). The book of
-- remembrance / the jewels (3:16-17 — Revelation 20:12, Daniel 12:1, Psalm 56:8, the peculiar treasure
-- Exodus 19:5 / 1 Peter 2:9, 1 Enoch 47:3 / 108:3).
-- Tag: mal03   Temp view: _s339_mal03_lookup
-- Sort band: base 46150, step 3 -> threads at 46150, 46153, 46156, 46159, 46162, 46165, 46168 (7 threads)
-- Source of EVERY row: 'canon','malachi',3,v
--
-- Malachi 3 coverage:
--   ★★★ v.1 (Behold, I will send my messenger, and he shall prepare the way before me... even the
--          messenger of the covenant, whom ye delight in)
--        NT:     ★★★ Mark 1:2 (Behold, I send my messenger before thy face, which shall prepare thy
--                way before thee) + Matthew 11:10 + Luke 7:27 (For this is he, of whom it is written) — THREAD 1
--        Extras: none warranted (the forerunner is the gospel's own naming)
--        Tanakh: ★ Isaiah 40:3 (The voice of him that crieth in the wilderness, Prepare ye the way of
--                Yahuah) + ★ Malachi 4:5 (Behold, I will send you Elijah the prophet) — THREAD 1
--   ★★ v.2-3 (he is like a refiner's fire, and like fullers' soap... he shall purify the sons of Levi,
--          and purge them as gold and silver, that they may offer unto Yahuah an offering in righteousness)
--        NT:     ★ 1 Peter 1:7 (the trial of your faith... though it be tried with fire) + Romans 12:1
--                (present your bodies a living sacrifice) — THREAD 2
--        Extras: ★ Sirach 2:5 (For gold is tried in the fire, and acceptable men in the furnace of
--                adversity) — THREAD 2
--        Tanakh: ★★ Zechariah 13:9 (I will bring the third part through the fire, and will refine them
--                as silver is refined) + Isaiah 1:25 (purely purge away thy dross) — THREAD 2
--   v.4 (Then shall the offering of Yahudah and Jerusalem be pleasant unto Yahuah) — woven into THREAD 2
--          (the restored offering in righteousness); no separate add
--   ★ v.5 (I will be a swift witness against... those that oppress the hireling in his wages, the
--          widow, and the fatherless, and that turn aside the stranger)
--        NT:     ★ James 5:4 (the hire of the labourers... kept back by fraud, crieth) — THREAD 3
--        Extras: none warranted (the social-Torah witness is carried in canon)
--        Tanakh: ★ Zechariah 7:10 (oppress not the widow, nor the fatherless, the stranger) + Exodus
--                22:21 (neither vex a stranger) + Exodus 22:22 (Ye shall not afflict any widow) — THREAD 3
--   ★★★ v.6 (For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed)
--        NT:     ★★ Hebrews 13:8 (Yahusha HaMashiach the same yesterday, and to day, and for ever) +
--                James 1:17 (with whom is no variableness) + GUARD Romans 11:1 / 11:29 — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Numbers 23:19 (Elohim is not a man, that he should lie; neither the son of Adam,
--                that he should repent) — THREAD 4
--   ★★★ v.7 (ye are gone away from mine ordinances, and have not kept them. Return unto me, and I will
--          return unto you)
--        NT:     ★ Acts 3:19 (Repent ye therefore, and be converted, that your sins may be blotted out) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★ Zechariah 1:3 (Turn ye unto me... and I will turn unto you) + Joel 2:12 (turn ye
--                even to me with all your heart) + Deuteronomy 30:2 (shalt return unto Yahuah Elohayka) — THREAD 5
--   ★ v.8-10 (Will a man rob Elohim?... In tithes and offerings... Bring ye all the tithes into the
--          storehouse... if I will not open you the windows of heaven)
--        NT:     ★ Hebrews 7:2 (Abraham gave a tenth part of all) — THREAD 6
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 14:22 (Thou shalt truly tithe all the increase of thy seed) + Leviticus
--                27:30 (all the tithe of the land... is the LORD'S) + Genesis 14:20 (he gave him tithes
--                of all) + Proverbs 3:9 (Honour Yahuah with thy substance) — THREAD 6
--   v.11-12 (I will rebuke the devourer... ye shall be a delightsome land) — woven into THREAD 6's
--          blessing-promise; no separate add
--   v.13-15 (Your words have been stout against me... It is vain to serve Elohim) — the contrast that
--          sets up the book of remembrance; carried in THREAD 7's prose; no separate add
--   ★ v.16-17 (a book of remembrance was written before him for them that feared Yahuah... they shall
--          be mine... when I make up my jewels; and I will spare them, as a man spareth his own son)
--        NT:     ★ Revelation 20:12 (another book was opened, which is the book of life) + 1 Peter 2:9
--                (a peculiar people) — THREAD 7
--        Extras: ★ 1 Enoch 47:3 (the books of the living were opened before Him) + 1 Enoch 108:3 (their
--                names shall be blotted out of the book of life) — THREAD 7
--        Tanakh: ★ Daniel 12:1 (every one that shall be found written in the book) + Exodus 19:5 (ye
--                shall be a peculiar treasure unto me) + Psalm 56:8 (are they not in thy book?) — THREAD 7
--   v.18 (discern between the righteous and the wicked) — the book's verdict; woven into THREAD 7; no separate add
--
-- Threads (slug — target libraries):
--   1. malachi-3-behold-i-will-send-my-messenger — NT (Mark 1, Matthew 11, Luke 7) + Tanakh (Isaiah 40, Malachi 4) [free]
--      (★★★ the forerunner who prepares the way + the messenger of the covenant = the Formed Son coming to his temple)
--   2. malachi-3-like-a-refiners-fire-the-sons-of-levi-purged — NT (1 Peter 1, Romans 12) + Tanakh (Zechariah 13, Isaiah 1) + Extras (Sirach 2) [extras]
--      (★★ the refiner's fire; the priesthood purged; the offering in righteousness restored)
--   3. malachi-3-a-swift-witness-against-the-oppressors — NT (James 5) + Tanakh (Zechariah 7, Exodus 22) [free]
--      (★ the swift witness against the oppressors of hireling/widow/fatherless/stranger — the social Torah)
--   4. malachi-3-for-i-am-yahuah-i-change-not — NT (Hebrews 13, James 1, Romans 11) + Tanakh (Numbers 23) [free]
--      (★★★ Yahuah immutable; the covenant people NOT consumed — the anti-replacement guard)
--   5. malachi-3-ye-are-gone-away-from-mine-ordinances-return — NT (Acts 3) + Tanakh (Zechariah 1, Joel 2, Deuteronomy 30) [free]
--      (★★★ the Torah-never-abolished verse: the ordinances STAND, the people departed, the call is to RETURN)
--   6. malachi-3-the-tithes-into-the-storehouse — NT (Hebrews 7) + Tanakh (Deuteronomy 14, Leviticus 27, Genesis 14, Proverbs 3) [free]
--      (★ the tithe robbed; the storehouse; the windows of heaven opened)
--   7. malachi-3-a-book-of-remembrance-my-jewels — NT (Revelation 20, 1 Peter 2) + Tanakh (Daniel 12, Exodus 19, Psalm 56) + Extras (1 Enoch 47, 1 Enoch 108) [extras]
--      (★ the book of remembrance / the treasured jewels / the spared son — the book of life, the peculiar treasure)
--
-- Framing notes:
--   ★★★ THE MESSENGER + THE MESSENGER OF THE COVENANT (THREAD 1): two figures in one verse. The
--      forerunner — *Behold, I will send my messenger, and he shall prepare the way before me* (3:1) — is
--      named by the gospel as John the Immerser: *As it is written in the prophets, Behold, I send my
--      messenger before thy face, which shall prepare thy way before thee* (Mark 1:2), *this is he, of whom
--      it is written* (Matthew 11:10 / Luke 7:27), set beside Isaiah's *voice of him that crieth in the
--      wilderness, Prepare ye the way of Yahuah* (Isaiah 40:3) and Malachi's own *I will send you Elijah
--      the prophet* (Malachi 4:5). The second figure is *Yahuah (Lord), whom ye seek* who *shall suddenly
--      come to his temple, even the messenger of the covenant* — Yahuah Himself coming, yet a messenger
--      SENT and DELIGHTED in. This is the Formed and the Formless: the One who comes to his temple is the
--      Formed Son, the expressed Word who is Yahuah and HAS a Father; NOT co-equal trinitarian persons.
--   ★★ THE REFINER'S FIRE (THREAD 2): *he is like a refiner's fire... and he shall purify the sons of
--      Levi, and purge them as gold and silver, that they may offer unto Yahuah an offering in
--      righteousness* (3:2-3). Zechariah sings the same refining of the remnant: *I will bring the third
--      part through the fire, and will refine them as silver is refined* (Zechariah 13:9); Isaiah, *purely
--      purge away thy dross* (Isaiah 1:25). The trial is forward-fulfilled: *the trial of your faith...
--      though it be tried with fire* (1 Peter 1:7); the restored offering in righteousness is the living
--      sacrifice (Romans 12:1). The restored witness sings it too: *gold is tried in the fire, and
--      acceptable men in the furnace of adversity* (Sirach 2:5).
--   ★ THE SWIFT WITNESS (THREAD 3): *I will be a swift witness against... those that oppress the hireling
--      in his wages, the widow, and the fatherless, and that turn aside the stranger* (3:5) — the Torah's
--      own social commands enforced. The hireling's wage: *the hire of the labourers... kept back by
--      fraud, crieth* (James 5:4); the widow/fatherless/stranger: *oppress not the widow, nor the
--      fatherless, the stranger* (Zechariah 7:10), *Thou shalt neither vex a stranger, nor oppress him*
--      (Exodus 22:21), *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22). The Torah is
--      the standard Yahuah judges by — never abolished.
--   ★★★ I CHANGE NOT (THREAD 4): *For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not
--      consumed* (3:6). The immutable Yahuah is the GROUND of the covenant people's preservation — *Elohim
--      is not a man, that he should lie; neither the son of Adam, that he should repent* (Numbers 23:19),
--      *Yahusha HaMashiach the same yesterday, and to day, and for ever* (Hebrews 13:8), *with whom is no
--      variableness, neither shadow of turning* (James 1:17). And this is the anti-replacement guard:
--      BECAUSE He changes not, the sons of Jacob are NOT consumed — *Hath Elohim cast away his people?
--      Elohim forbid* (Romans 11:1), *the gifts and calling of Elohim are without repentance* (Romans
--      11:29). The covenant people stand because the covenant Maker does not change.
--   ★★★ GONE AWAY FROM MINE ORDINANCES / RETURN (THREAD 5): the Torah-never-abolished verse. *Even from
--      the days of your fathers ye are gone away from mine ordinances, and have not kept them. Return unto
--      me, and I will return unto you* (3:7). The ordinances STAND; the people DEPARTED from them; the call
--      is to RETURN to them — never the ordinances replaced. The prophets say it one voice: *Turn ye unto
--      me... and I will turn unto you* (Zechariah 1:3), *turn ye even to me with all your heart* (Joel
--      2:12), *shalt return unto Yahuah Elohayka, and shalt obey his voice* (Deuteronomy 30:2); and the
--      gospel keeps it: *Repent ye therefore, and be converted, that your sins may be blotted out* (Acts
--      3:19). Return is repentance unto obedience, not freedom from the ordinances.
--   ★ THE TITHE (THREAD 6): *Will a man rob Elohim?... In tithes and offerings... Bring ye all the tithes
--      into the storehouse... if I will not open you the windows of heaven* (3:8-10) — the standing Torah
--      tithe: *Thou shalt truly tithe all the increase of thy seed* (Deuteronomy 14:22), *all the tithe of
--      the land... is the LORD'S* (Leviticus 27:30); patriarch-old, *he gave him tithes of all* (Genesis
--      14:20 / Hebrews 7:2 the tithe to Melek Tsadiq); the wisdom echo *Honour Yahuah with thy substance*
--      (Proverbs 3:9). The windows of heaven open in blessing for the faithful, as they once opened in
--      judgment (Genesis 7:11).
--   ★ THE BOOK OF REMEMBRANCE / THE JEWELS (THREAD 7): *a book of remembrance was written before him for
--      them that feared Yahuah, and that thought upon his name. And they shall be mine... in that day when
--      I make up my jewels; and I will spare them, as a man spareth his own son that serveth him*
--      (3:16-17). The book is the book of life: *another book was opened, which is the book of life*
--      (Revelation 20:12), *every one that shall be found written in the book* (Daniel 12:1), *are they not
--      in thy book?* (Psalm 56:8). The treasured jewels are the peculiar treasure: *ye shall be a peculiar
--      treasure unto me above all people* (Exodus 19:5), *a peculiar people* (1 Peter 2:9). The restored
--      witness shows the same book opened at the throne — *the books of the living were opened before Him*
--      (1 Enoch 47:3) — and the wicked blotted from it (1 Enoch 108:3).
--   EXTRAS: Sirach 2:5 (gold tried in the fire — THREAD 2) and 1 Enoch 47:3 / 108:3 (the books of the
--      living opened / blotted out — THREAD 7) are clean witnesses, parses verified. No extras forced on
--      the messenger, the swift witness, I-change-not, return, or the tithe.
--   VERSES WITH NO SEPARATE ADD: v.4 (the restored offering — woven into THREAD 2), v.11-12 (the devourer
--      rebuked / delightsome land — the tithe-blessing of THREAD 6), v.13-15 (stout words / it is vain to
--      serve — the contrast that sets up THREAD 7), v.18 (discern between righteous and wicked — the book's
--      verdict, THREAD 7). All recorded, none silently skipped.

CREATE TEMP VIEW _s339_mal03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Behold, I will send my messenger — the forerunner + the messenger of the covenant
    ('canon','malachi',3,1,'canon','mark',1,2,'free',
      E'*As it is written in the prophets, Behold, I send my messenger before thy face, which shall prepare thy way before thee* (Mark 1:2). The gospel opens by quoting *Behold, I will send my messenger, and he shall prepare the way before me* (Malachi 3:1) — and names the messenger John the Immerser, *the voice of one crying in the wilderness* (Mark 1:3). The forerunner who prepares the way is the herald sent ahead of the One who comes to his temple.'),
    ('canon','malachi',3,1,'canon','matthew',11,10,'free',
      E'*For this is he, of whom it is written, Behold, I send my messenger before thy face, which shall prepare thy way before thee* (Matthew 11:10). Yahusha (Jesus) names whom Malachi foretold: *Behold, I will send my messenger, and he shall prepare the way before me* (Malachi 3:1) — *this is he*, John the Immerser, *more than a prophet* (11:9), the forerunner who readies the way.'),
    ('canon','malachi',3,1,'canon','luke',7,27,'free',
      E'*This is he, of whom it is written, Behold, I send my messenger before thy face, which shall prepare thy way before thee* (Luke 7:27). The same naming: the *messenger* of *he shall prepare the way before me* (Malachi 3:1) is John the Immerser, the herald sent ahead — *this is he, of whom it is written*.'),
    ('canon','malachi',3,1,'canon','isaiah',40,3,'free',
      E'*The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD), make straight in the desert a highway for our Elohim (God)* (Isaiah 40:3). Malachi''s *he shall prepare the way before me* (Malachi 3:1) is Isaiah''s wilderness-voice — the gospel quotes them together (Mark 1:2-3). The way prepared is the way of Yahuah Himself, who *shall suddenly come to his temple*.'),
    ('canon','malachi',3,1,'canon','malachi',4,5,'free',
      E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). Malachi names the messenger of 3:1 again at the book''s close: the one who *shall prepare the way before me* comes in the spirit of Elijah before the great day — the forerunner of *the messenger of the covenant, whom ye delight in* (3:1).'),

    -- THREAD 2 (★★): Like a refiner's fire — the sons of Levi purged; the offering in righteousness
    ('canon','malachi',3,2,'canon','zechariah',13,9,'free',
      E'*And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God)* (Zechariah 13:9). Malachi''s *he is like a refiner''s fire... and he shall purify the sons of Levi, and purge them as gold and silver* (Malachi 3:2-3) is Zechariah''s refining of the remnant — the same fire that tries silver and gold, that the refined may be owned: *It is my people*.'),
    ('canon','malachi',3,3,'canon','isaiah',1,25,'free',
      E'*And I will turn my hand upon thee, and purely purge away thy dross, and take away all thy tin* (Isaiah 1:25). The refiner who shall *purge them as gold and silver* (Malachi 3:3) does Isaiah''s purging — *purely purge away thy dross*. The fire is not destruction but purification: the dross removed so the metal is pure, that they may *offer unto Yahuah an offering in righteousness*.'),
    ('canon','malachi',3,2,'canon','1-peter',1,7,'free',
      E'*That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:7). The *refiner''s fire* (Malachi 3:2) is fulfilled in the trial that purifies faith — *tried with fire*, like gold, *at the appearing*. Who *may abide the day of his coming* are those the fire has refined.'),
    ('canon','malachi',3,3,'canon','romans',12,1,'free',
      E'*I beseech you therefore, brethren, by the mercies of Elohim (God), that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service* (Romans 12:1). The purged sons of Levi *offer unto Yahuah an offering in righteousness* (Malachi 3:3) — fulfilled in the living sacrifice, the body presented holy and acceptable. The refined priesthood offers in righteousness at last.'),
    ('canon','malachi',3,3,'apocrypha','ecclesiasticus',2,5,'extras',
      E'*For gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). The restored witness sings Malachi''s refining: the refiner *shall purify the sons of Levi, and purge them as gold and silver* (Malachi 3:3) — for *gold is tried in the fire, and acceptable men in the furnace of adversity*. The fire makes acceptable; the furnace proves the faithful.'),

    -- THREAD 3 (★): A swift witness against the oppressors — the social Torah enforced
    ('canon','malachi',3,5,'canon','james',5,4,'free',
      E'*Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). Malachi''s swift witness *against those that oppress the hireling in his wages* (Malachi 3:5) is James'' crying wage: the defrauded hire *crieth... into the ears of Yahuah (Lord) of sabaoth*. The Torah''s wage-justice is enforced from the Tanakh to the apostle.'),
    ('canon','malachi',3,5,'canon','zechariah',7,10,'free',
      E'*And oppress not the widow, nor the fatherless, the stranger, nor the poor; and let none of you imagine evil against his brother in your heart* (Zechariah 7:10). Malachi''s witness *against those that oppress... the widow, and the fatherless, and that turn aside the stranger* (Malachi 3:5) is Zechariah''s same charge — *oppress not the widow, nor the fatherless, the stranger*. The standard is the Torah''s care for the defenseless.'),
    ('canon','malachi',3,5,'canon','exodus',22,21,'free',
      E'*Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt* (Exodus 22:21). The swift witness *against those that... turn aside the stranger from his right* (Malachi 3:5) enforces the Torah command itself — *thou shalt neither vex a stranger, nor oppress him*. Malachi judges Yashar''el (Israel) by the very statutes Yahuah gave.'),
    ('canon','malachi',3,5,'canon','exodus',22,22,'free',
      E'*Ye shall not afflict any widow, or fatherless child* (Exodus 22:22). Malachi''s witness *against those that oppress... the widow, and the fatherless* (Malachi 3:5) is the Torah''s own word — *Ye shall not afflict any widow, or fatherless child*. The social commands of the Torah stand; their breach is what Yahuah comes to witness against.'),

    -- THREAD 4 (★★★): For I am Yahuah, I change not — the immutable Yahuah; the anti-replacement guard
    ('canon','malachi',3,6,'canon','numbers',23,19,'free',
      E'*Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). Malachi''s *For I am Yahuah (LORD), I change not* (Malachi 3:6) is Balaam''s confession — *Elohim is not a man, that he should lie; neither the son of Adam, that he should repent*. Yahuah does not turn; what He has said, He makes good. His unchanging word is the ground of the covenant.'),
    ('canon','malachi',3,6,'canon','hebrews',13,8,'free',
      E'*Yahusha HaMashiach (Jesus Christ) the same yesterday, and to day, and for ever* (Hebrews 13:8). Malachi''s *I am Yahuah (LORD), I change not* (Malachi 3:6) is the Formed Son''s own constancy — *the same yesterday, and to day, and for ever*. The One who comes to his temple (3:1) does not change; the messenger of the covenant is as immutable as the Father from whom He is drawn.'),
    ('canon','malachi',3,6,'canon','james',1,17,'free',
      E'*Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17). Malachi''s *I change not* (Malachi 3:6) is James'' *Father of lights, with whom is no variableness, neither shadow of turning*. Yahuah is constant as light without flicker; therefore the gifts are sure and the people are not consumed.'),
    ('canon','malachi',3,6,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Malachi''s *therefore ye sons of Jacob are not consumed* (Malachi 3:6) is Paul''s guard — *Hath Elohim cast away his people? Elohim forbid*. Because Yahuah changes not, the covenant people are not consumed and not cast away; never a replaced people.'),
    ('canon','malachi',3,6,'canon','romans',11,29,'free',
      E'*For the gifts and calling of Elohim (God) are without repentance* (Romans 11:29). Malachi''s ground — *I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6) — is Paul''s *the gifts and calling of Elohim are without repentance*. The unchanging God does not revoke His call; the sons of Jacob stand because He does not change.'),

    -- THREAD 5 (★★★): Ye are gone away from mine ordinances / Return — the Torah-never-abolished verse
    ('canon','malachi',3,7,'canon','zechariah',1,3,'free',
      E'*Therefore say thou unto them, Thus saith Yahuah Tseva''ot (LORD of hosts); Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 1:3). Malachi''s *Return unto me, and I will return unto you* (Malachi 3:7) is Zechariah''s word exactly — *Turn ye unto me... and I will turn unto you*. The covenant-return is mutual: the people come back to the ordinances they left, and Yahuah comes back to them.'),
    ('canon','malachi',3,7,'canon','joel',2,12,'free',
      E'*Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12). Malachi''s *Return unto me* (Malachi 3:7) is Joel''s *turn ye even to me with all your heart*. The return is not a new way but the whole-hearted coming back to the ordinances the fathers forsook.'),
    ('canon','malachi',3,7,'canon','deuteronomy',30,2,'free',
      E'*And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul* (Deuteronomy 30:2). Malachi''s *ye are gone away from mine ordinances... Return unto me* (Malachi 3:7) is the Torah''s own promise of return — *shalt return unto Yahuah Elohayka, and shalt obey his voice*. Return is repentance unto obedience; the ordinances stand and are kept again.'),
    ('canon','malachi',3,7,'canon','acts',3,19,'free',
      E'*Repent ye therefore, and be converted, that your sins may be blotted out, when the times of refreshing shall come from the presence of Yahuah (Lord)* (Acts 3:19). Malachi''s *Return unto me, and I will return unto you* (Malachi 3:7) is the gospel''s call to return — *Repent ye therefore, and be converted*. The same covenant-return: turn back, and the refreshing comes from His presence.'),

    -- THREAD 6 (★): The tithes into the storehouse — the standing Torah tithe
    ('canon','malachi',3,10,'canon','deuteronomy',14,22,'free',
      E'*Thou shalt truly tithe all the increase of thy seed, that the field bringeth forth year by year* (Deuteronomy 14:22). Malachi''s *Bring ye all the tithes into the storehouse* (Malachi 3:10) is the Torah''s standing tithe — *Thou shalt truly tithe all the increase of thy seed*. To withhold the tithe is to rob Elohim of what He commanded; the command was never repealed.'),
    ('canon','malachi',3,8,'canon','leviticus',27,30,'free',
      E'*And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD)* (Leviticus 27:30). Malachi''s charge — *Will a man rob Elohim (God)?... In tithes and offerings* (Malachi 3:8) — rests on this: the tithe *is the LORD''S: it is holy unto Yahuah*. To keep back the tithe is to rob what already belongs to Him.'),
    ('canon','malachi',3,8,'canon','genesis',14,20,'free',
      E'*And blessed be the El Elyon (most high God), which hath delivered thine enemies into thy hand. And he gave him tithes of all* (Genesis 14:20). The tithe Malachi requires (Malachi 3:8) is patriarch-old: Abraham *gave him tithes of all* to Melek Tsadiq (Melchizedek). The tithe is not a Levitical novelty but a worship older than Sinai, owed to the Most High.'),
    ('canon','malachi',3,8,'canon','hebrews',7,2,'free',
      E'*To whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace* (Hebrews 7:2). Malachi''s tithe (Malachi 3:8) reaches back to *Abraham gave a tenth part of all* to Melek Tsadiq — the priest-king of righteousness and peace. The tenth is the worship the fathers gave; the people Malachi rebukes had robbed God of it.'),
    ('canon','malachi',3,10,'canon','proverbs',3,9,'free',
      E'*Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* (Proverbs 3:9). Malachi''s *Bring ye all the tithes into the storehouse... prove me now herewith* (Malachi 3:10) is the wisdom counsel — *Honour Yahuah with thy substance, and with the firstfruits*. The promise follows: *so shall thy barns be filled with plenty* (3:10), as Yahuah opens *the windows of heaven*.'),

    -- THREAD 7 (★): A book of remembrance / my jewels — the book of life, the peculiar treasure
    ('canon','malachi',3,16,'canon','revelation',20,12,'free',
      E'*And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). Malachi''s *a book of remembrance was written before him for them that feared Yahuah* (Malachi 3:16) is the book of life opened at the judgment — *another book was opened, which is the book of life*. The names of them that feared Yahuah and thought upon His name are written there.'),
    ('canon','malachi',3,16,'canon','daniel',12,1,'free',
      E'*And at that time shall Michael stand up, the great prince which standeth for the children of thy people... and at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). Malachi''s *book of remembrance... for them that feared Yahuah* (Malachi 3:16) is Daniel''s book of deliverance — *every one that shall be found written in the book*. To be in the book is to be among the jewels Yahuah spares.'),
    ('canon','malachi',3,16,'canon','psalms',56,8,'free',
      E'*Thou tellest my wanderings: put thou my tears into thy bottle: are they not in thy book?* (Psalm 56:8). Malachi''s *a book of remembrance was written before him* (Malachi 3:16) is the book the psalmist trusts — *are they not in thy book?* Yahuah forgets nothing of those who fear Him; their words and tears are remembered before Him.'),
    ('canon','malachi',3,17,'canon','exodus',19,5,'free',
      E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). Malachi''s *they shall be mine... in that day when I make up my jewels* (Malachi 3:17) is the Sinai promise — *a peculiar treasure unto me above all people*. The jewels Yahuah makes up are His treasured covenant people, kept on condition of obeying His voice.'),
    ('canon','malachi',3,17,'canon','1-peter',2,9,'free',
      E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9). Malachi''s treasured *jewels* (Malachi 3:17) are the *peculiar people* — the chosen generation, the royal priesthood, the holy nation. The two-house people gathered and owned: *they shall be mine, saith Yahuah Tseva''ot*.'),
    ('canon','malachi',3,16,'enoch','1-enoch',47,3,'extras',
      E'*In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him* (1 Enoch 47:3). Malachi''s *book of remembrance was written before him* (Malachi 3:16) is the restored witness''s *books of the living... opened before Him* at the throne. The remembered righteous are recorded before the Head of Days.'),
    ('canon','malachi',3,17,'enoch','1-enoch',108,3,'extras',
      E'*Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones* (1 Enoch 108:3). Malachi''s spared jewels — *I will spare them, as a man spareth his own son that serveth him* (Malachi 3:17) — stand against those whose *names shall be blotted out of the book of life*. The book of remembrance keeps the faithful; the wicked are blotted out.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s339_mal03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s339_mal03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-3-behold-i-will-send-my-messenger',
       E'Behold, I will send my messenger — the forerunner and the messenger of the covenant',
       E'Two figures stand in one verse: *Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant, whom ye delight in: behold, he shall come, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 3:1). The first is the FORERUNNER — *my messenger... he shall prepare the way before me* — named by the gospel as John the Immerser: *As it is written in the prophets, Behold, I send my messenger before thy face, which shall prepare thy way before thee* (Mark 1:2); *For this is he, of whom it is written* (Matthew 11:10); *This is he, of whom it is written* (Luke 7:27). The gospel sets him beside Isaiah''s wilderness-voice: *The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD)* (Isaiah 40:3); and Malachi names him again at the book''s close, *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). The second figure is *Yahuah (Lord), whom ye seek* who *shall suddenly come to his temple, even the messenger of the covenant* — Yahuah Himself, yet a messenger SENT and *delight[ed] in*. This is the Formed and the Formless: the One who comes to his temple is the Formed Son, the expressed Word who is Yahuah and HAS a Father — not co-equal trinitarian persons, not a modalist collapse. The forerunner readies the way; the messenger of the covenant comes suddenly to his temple.',
       sv.verse_id, ev.verse_id, 'free', 46150
  FROM _s339_mal03_lookup sv, _s339_mal03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-3-like-a-refiners-fire-the-sons-of-levi-purged',
       E'Like a refiner''s fire — the sons of Levi purged, the offering in righteousness',
       E'The coming One purifies before He is served: *But who may abide the day of his coming? and who shall stand when he appeareth? for he is like a refiner''s fire, and like fullers'' soap: And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:2-3), *Then shall the offering of Yahudah (Judah) and Jerusalem be pleasant unto Yahuah (LORD), as in the days of old* (3:4). The fire is not destruction but purification. Zechariah refines the remnant the same way: *I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried... I will say, It is my people* (Zechariah 13:9); Isaiah, *I will... purely purge away thy dross, and take away all thy tin* (Isaiah 1:25). The trial is forward-fulfilled in the faith tried by fire: *the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire* (1 Peter 1:7); and the offering in righteousness is the living sacrifice — *present your bodies a living sacrifice, holy, acceptable unto Elohim (God)* (Romans 12:1). The restored witness sings it: *For gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). Who may abide the day are those the refiner''s fire has made pure.',
       sv.verse_id, ev.verse_id, 'extras', 46153
  FROM _s339_mal03_lookup sv, _s339_mal03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-3-a-swift-witness-against-the-oppressors',
       E'A swift witness against the oppressors — the social Torah enforced',
       E'Yahuah comes near as witness against covenant-breaking conduct: *And I will come near to you to judgment; and I will be a swift witness against the sorcerers, and against the adulterers, and against false swearers, and against those that oppress the hireling in his wages, the widow, and the fatherless, and that turn aside the stranger from his right, and fear not me, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 3:5). The standard is the Torah''s own social commands. The hireling''s held-back wage cries out: *the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). The widow, the fatherless, the stranger are the Torah''s charge: *oppress not the widow, nor the fatherless, the stranger, nor the poor* (Zechariah 7:10); *Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt* (Exodus 22:21); *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22). This is covenant-lawsuit against conduct, never ethnic hatred — Yahuah judges His people by the very statutes He gave them, and the Torah''s care for the defenseless stands unrepealed.',
       sv.verse_id, ev.verse_id, 'free', 46156
  FROM _s339_mal03_lookup sv, _s339_mal03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-3-for-i-am-yahuah-i-change-not',
       E'For I am Yahuah, I change not — the immutable God, the covenant people not consumed',
       E'The hinge of the chapter: *For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6). The immutability of Yahuah is the GROUND of the covenant people''s preservation — not their merit, but His unchanging word. Balaam confessed it: *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it?* (Numbers 23:19). The Formed Son shares that constancy: *Yahusha HaMashiach (Jesus Christ) the same yesterday, and to day, and for ever* (Hebrews 13:8); and the Father of lights has *no variableness, neither shadow of turning* (James 1:17). This is the anti-replacement guard, plain in the text: BECAUSE He changes not, the sons of Jacob are NOT consumed. Paul holds the same line — *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite* (Romans 11:1); *For the gifts and calling of Elohim (God) are without repentance* (Romans 11:29). The covenant people stand because the covenant Maker does not change; He has not cast them away and never will.',
       sv.verse_id, ev.verse_id, 'free', 46159
  FROM _s339_mal03_lookup sv, _s339_mal03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-3-ye-are-gone-away-from-mine-ordinances-return',
       E'Ye are gone away from mine ordinances — Return unto me (the Torah-never-abolished verse)',
       E'The covenant call laid bare: *Even from the days of your fathers ye are gone away from mine ordinances, and have not kept them. Return unto me, and I will return unto you, saith Yahuah Tseva''ot (LORD of hosts). But ye said, Wherein shall we return?* (Malachi 3:7). Read it carefully — the ordinances STAND; the people DEPARTED from them; the call is to RETURN to them. Never the ordinances replaced or abolished; the fault is in the people who left, and the cure is to come back. The prophets speak it with one voice: *Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you* (Zechariah 1:3); *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12); and the Torah''s own promise, *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day... with all thine heart* (Deuteronomy 30:2). The gospel keeps the same call: *Repent ye therefore, and be converted, that your sins may be blotted out, when the times of refreshing shall come* (Acts 3:19). Return is repentance unto obedience — the whole-hearted coming back to the ordinances the fathers forsook, not a freedom from them.',
       sv.verse_id, ev.verse_id, 'free', 46162
  FROM _s339_mal03_lookup sv, _s339_mal03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-3-the-tithes-into-the-storehouse',
       E'Bring ye all the tithes into the storehouse — the standing tithe, the windows of heaven',
       E'The charge of robbery and the test of the tithe: *Will a man rob Elohim (God)? Yet ye have robbed me. But ye say, Wherein have we robbed thee? In tithes and offerings* (Malachi 3:8); *Bring ye all the tithes into the storehouse, that there may be meat in mine house, and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it* (3:10). The tithe is the standing Torah command, never repealed: *Thou shalt truly tithe all the increase of thy seed, that the field bringeth forth year by year* (Deuteronomy 14:22); and it is holy, already His — *all the tithe of the land... is the LORD''S: it is holy unto Yahuah (LORD)* (Leviticus 27:30). It is older than Sinai: Abraham *gave him tithes of all* (Genesis 14:20) to Melek Tsadiq (Melchizedek), *to whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace* (Hebrews 7:2). The wisdom counsel matches the promise — *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase: so shall thy barns be filled with plenty* (Proverbs 3:9-10). To withhold the tithe is to rob Elohim of what is His; to bring it is to open the windows of heaven.',
       sv.verse_id, ev.verse_id, 'free', 46165
  FROM _s339_mal03_lookup sv, _s339_mal03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-3-a-book-of-remembrance-my-jewels',
       E'A book of remembrance — my jewels, the son that is spared',
       E'Against the stout words of those who said *It is vain to serve Elohim (God)* (Malachi 3:14), a faithful remnant is remembered: *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name. And they shall be mine, saith Yahuah Tseva''ot (LORD of hosts), in that day when I make up my jewels; and I will spare them, as a man spareth his own son that serveth him* (Malachi 3:16-17). The book is the book of life, opened at the judgment: *another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books* (Revelation 20:12); *every one that shall be found written in the book* is delivered (Daniel 12:1); *are they not in thy book?* (Psalm 56:8) — Yahuah forgets nothing of those who fear Him. The treasured jewels are the peculiar treasure of Sinai: *ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5); *ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9). The restored witness shows the same book opened at the throne — *the books of the living were opened before Him* (1 Enoch 47:3) — and the wicked blotted from it: *their names shall be blotted out of the book of life* (1 Enoch 108:3). *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (3:18).',
       sv.verse_id, ev.verse_id, 'extras', 46168
  FROM _s339_mal03_lookup sv, _s339_mal03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Behold, I send my messenger before thy face, which shall prepare thy way before thee* (Mark 1:2) — the gospel opens by quoting Malachi 3:1 and names the messenger John the Immerser.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-behold-i-will-send-my-messenger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *For this is he, of whom it is written, Behold, I send my messenger before thy face* (Matthew 11:10) — Yahusha names whom Malachi foretold: John the Immerser, the forerunner.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-behold-i-will-send-my-messenger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*This is he, of whom it is written, Behold, I send my messenger before thy face* (Luke 7:27) — the same naming of the messenger of Malachi 3:1 as John the Immerser.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-behold-i-will-send-my-messenger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD)* (Isaiah 40:3) — the wilderness-voice the gospel quotes with Malachi 3:1; the way prepared is Yahuah''s own.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-behold-i-will-send-my-messenger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5) — Malachi names the messenger of 3:1 again: the forerunner in the spirit of Elijah.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-behold-i-will-send-my-messenger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will bring the third part through the fire, and will refine them as silver is refined... I will say, It is my people* (Zechariah 13:9) — the same refining of the remnant as the refiner''s fire of Malachi 3:2-3.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-like-a-refiners-fire-the-sons-of-levi-purged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*purely purge away thy dross, and take away all thy tin* (Isaiah 1:25) — the refiner who shall purge the sons of Levi (Malachi 3:3) does Isaiah''s purging; the fire purifies, not destroys.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-like-a-refiners-fire-the-sons-of-levi-purged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the trial of your faith... though it be tried with fire, might be found unto praise and honour and glory* (1 Peter 1:7) — the refiner''s fire (Malachi 3:2) fulfilled in faith tried like gold at his appearing.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-like-a-refiners-fire-the-sons-of-levi-purged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*present your bodies a living sacrifice, holy, acceptable unto Elohim (God)* (Romans 12:1) — the purged sons of Levi''s offering in righteousness (Malachi 3:3) fulfilled in the living sacrifice.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-like-a-refiners-fire-the-sons-of-levi-purged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *For gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5) — the restored witness sings the refiner''s fire of Malachi 3:3; the furnace makes acceptable.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-like-a-refiners-fire-the-sons-of-levi-purged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the hire of the labourers... kept back by fraud, crieth: and the cries... are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4) — the swift witness against oppressors of the hireling (Malachi 3:5) enforced.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-swift-witness-against-the-oppressors'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*oppress not the widow, nor the fatherless, the stranger, nor the poor* (Zechariah 7:10) — the same Torah charge Malachi 3:5 enforces against those who oppress them.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-swift-witness-against-the-oppressors'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt* (Exodus 22:21) — the Torah statute behind Malachi 3:5''s witness against turning aside the stranger.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-swift-witness-against-the-oppressors'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Ye shall not afflict any widow, or fatherless child* (Exodus 22:22) — the Torah''s own word; Malachi 3:5 is a swift witness against those who break it.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-swift-witness-against-the-oppressors'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent* (Numbers 23:19) — the immutable Yahuah of Malachi 3:6; what He has said, He makes good.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-for-i-am-yahuah-i-change-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Yahusha HaMashiach (Jesus Christ) the same yesterday, and to day, and for ever* (Hebrews 13:8) — the Formed Son shares the *I change not* of Malachi 3:6; the messenger of the covenant is immutable.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-for-i-am-yahuah-i-change-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17) — the *I change not* of Malachi 3:6; light without flicker, the gifts sure.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-for-i-am-yahuah-i-change-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — Malachi''s *ye sons of Jacob are not consumed* (3:6); the anti-replacement guard, the people not cast away.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-for-i-am-yahuah-i-change-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For the gifts and calling of Elohim (God) are without repentance* (Romans 11:29) — because Yahuah changes not (Malachi 3:6), His call is not revoked; the sons of Jacob stand.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-for-i-am-yahuah-i-change-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Turn ye unto me, saith Yahuah Tseva''ot (LORD of hosts), and I will turn unto you* (Zechariah 1:3) — Malachi 3:7''s *Return unto me, and I will return unto you* word for word; the mutual covenant-return.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-ye-are-gone-away-from-mine-ordinances-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12) — the return Malachi 3:7 calls for: whole-hearted, back to the ordinances forsaken.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-ye-are-gone-away-from-mine-ordinances-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice... with all thine heart* (Deuteronomy 30:2) — return is repentance unto obedience; the ordinances of Malachi 3:7 stand and are kept again.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-ye-are-gone-away-from-mine-ordinances-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Repent ye therefore, and be converted, that your sins may be blotted out, when the times of refreshing shall come* (Acts 3:19) — the gospel keeps the same covenant-return as Malachi 3:7.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-ye-are-gone-away-from-mine-ordinances-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Thou shalt truly tithe all the increase of thy seed, that the field bringeth forth year by year* (Deuteronomy 14:22) — the standing Torah tithe Malachi 3:10 calls them to bring in full.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-the-tithes-into-the-storehouse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all the tithe of the land... is the LORD''S: it is holy unto Yahuah (LORD)* (Leviticus 27:30) — to withhold the tithe is to rob Elohim (Malachi 3:8) of what is already His.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-the-tithes-into-the-storehouse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he gave him tithes of all* (Genesis 14:20) — the tithe of Malachi 3:8 is patriarch-old: Abraham tithed to Melek Tsadiq, a worship older than Sinai.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-the-tithes-into-the-storehouse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*To whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness... King of peace* (Hebrews 7:2) — the tithe of Malachi 3:8 reaches back to Abraham''s tenth to Melek Tsadiq.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-the-tithes-into-the-storehouse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* (Proverbs 3:9) — the wisdom counsel behind Malachi 3:10; the promise of barns filled follows the tithe brought.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-the-tithes-into-the-storehouse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books* (Revelation 20:12) — the book of remembrance of Malachi 3:16 is the book of life opened at judgment.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-book-of-remembrance-my-jewels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1) — to be in the book of remembrance (Malachi 3:16) is to be among the jewels Yahuah spares.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-book-of-remembrance-my-jewels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou tellest my wanderings: put thou my tears into thy bottle: are they not in thy book?* (Psalm 56:8) — the book of remembrance (Malachi 3:16): Yahuah forgets nothing of those who fear Him.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=56 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-book-of-remembrance-my-jewels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5) — the jewels Yahuah makes up (Malachi 3:17) are the Sinai peculiar treasure, the treasured covenant people.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-book-of-remembrance-my-jewels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9) — the treasured jewels of Malachi 3:17 are the peculiar people, the two-house people gathered and owned.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-book-of-remembrance-my-jewels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him* (1 Enoch 47:3) — the restored witness''s book opened at the throne, as Malachi''s 3:16 book of remembrance written before Him.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-book-of-remembrance-my-jewels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *their names shall be blotted out of the book of life, And out of the books of the holy ones* (1 Enoch 108:3) — the spared jewels of Malachi 3:17 stand against those blotted from the book; the remembrance keeps the faithful.'
  FROM cross_reference_threads t
  JOIN _s339_mal03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s339_mal03_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-3-a-book-of-remembrance-my-jewels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_malachi_4.sql (Malachi 4) -----
-- Chapter: Malachi 4 — THE CLOSE OF THE TANAKH. The Hebrew Scriptures seal on three notes: the
-- DAY THAT BURNS as an oven (4:1), the SUN OF RIGHTEOUSNESS arising with healing in his wings
-- for them that fear the Name (4:2), the command REMEMBER THE TORAH OF MOSES commanded in Horeb
-- for all Yashar'el (Israel) (4:4 — the Torah-never-abolished CAPSTONE of the whole canon), and
-- ELIJAH sent before the great and dreadful day of Yahuah to turn the hearts of fathers and
-- children (4:5-6). The Formed Son is the rising Sun, the dayspring, the light who has a Father;
-- the Torah and the statutes and judgments STAND; the forerunner restores all things before the
-- day. The Tanakh ends on TORAH + the messianic light + the forerunner + the day of Yahuah.
-- Tag: mal04   Temp view: _s339_mal04_lookup   Session prefix: s339
-- Sort band: base 46175, step 3 -> threads at 46175, 46178, 46181, 46184 (4 threads)
-- Source of EVERY row: 'canon','malachi',4,v
--
-- Malachi 4 coverage:
--   ★ v.1 (the day cometh, that shall burn as an oven; all the proud... shall be stubble... burn
--          them up... neither root nor branch)
--        NT:     ★ Matthew 3:12 (he will burn up the chaff with unquenchable fire), 2 Peter 3:10
--                (the day of Yahuah... the elements shall melt with fervent heat... burned up) — THREAD 1
--        Extras: ★ 1 Enoch 1:6-7 (the high hills... shall melt like wax before the flame; the earth
--                shall be wholly rent... and there shall be a judgement upon all) — THREAD 1
--        Tanakh: ★ Obadiah 1:18 (the house of Esau for stubble... there shall not be any remaining),
--                Joel 2:31 (the great and the terrible day of Yahuah) — THREAD 1
--   ★★ v.2 (unto you that fear my name shall the Sun of righteousness arise with healing in his
--          wings; and ye shall go forth, and grow up as calves of the stall)
--        NT:     ★★ Luke 1:78-79 (the dayspring from on high hath visited us, to give light to them
--                that sit in darkness), John 8:12 (I am the light of the world), Matthew 9:20-21
--                (touched the hem of his garment... I shall be whole — healing in his wings/hem) — THREAD 2
--        Extras: ★ 1 Enoch 48:4 (he shall be the light of the Gentiles, And the hope of those who are
--                troubled of heart) — THREAD 2
--        Tanakh: ★ Psalm 84:11 (Yahuah Elohim is a sun and shield), Isaiah 60:1-3 (Arise, shine; for
--                thy light is come) — THREAD 2
--   v.3 (ye shall tread down the wicked; for they shall be ashes under the soles of your feet)
--        NT:     none warranted distinct (the treading-down of the wicked is the day-of-burning's
--                aftermath, woven into THREAD 1's prose with v.1)
--        Extras: none warranted distinct
--        Tanakh: held in prose with v.1 (the ashes are the stubble burned up)
--   ★★★ v.4 (Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all
--          Yashar'el (Israel), with the statutes and judgments)
--        NT:     ★★★ Matthew 5:17-18 (Think not that I am come to destroy the law... Till heaven and
--                earth pass, one jot or one tittle shall in no wise pass), John 5:46 (had ye believed
--                Moses, ye would have believed me: for he wrote of me) — THREAD 3
--        Extras: none warranted (the Torah-capstone is canon's own seal; no extras forced)
--        Tanakh: ★★ Deuteronomy 4:1-2 (hearken... unto the statutes and unto the judgments... ye
--                shall not add... neither shall ye diminish), Joshua 1:7-8 (observe to do according to
--                all the law, which Moses my servant commanded thee) — THREAD 3
--   ★★★ v.5-6 (I will send you Elijah the prophet before the coming of the great and dreadful day of
--          Yahuah... he shall turn the heart of the fathers to the children... lest I come and smite
--          the earth with a curse)
--        NT:     ★★★ Matthew 17:11-13 (Elias truly shall first come, and restore all things... Elias
--                is come already), Luke 1:16-17 (in the spirit and power of Elias... to turn the hearts
--                of the fathers to the children), Matthew 11:14 (this is Elias, which was for to come),
--                Mark 9:12-13 (Elias verily cometh first, and restoreth all things) — THREAD 4
--        Extras: ★ Sirach (Ecclesiasticus) 48:1 (Then stood up Elias the prophet as fire), 48:10
--                (ordained... to turn the heart of the father to the son, and to restore the tribes of
--                Jacob) — THREAD 4 (a SUPERB clean Elijah-restorer + two-house witness)
--        Tanakh: none separate (the forerunner-promise is unique here; the day-of-Yahuah resonance is
--                carried in THREAD 1's Joel/Obadiah)
--
-- Threads (slug — target libraries):
--   1. malachi-4-the-day-that-shall-burn-as-an-oven — NT (Matthew 3, 2 Peter 3) + Extras (1 Enoch 1)
--      + Tanakh (Obadiah 1, Joel 2) [extras]  (★ the day of Yahuah; the proud as stubble burned up)
--   2. malachi-4-the-sun-of-righteousness-with-healing-in-his-wings — NT (Luke 1, John 8, Matthew 9)
--      + Extras (1 Enoch 48) + Tanakh (Psalm 84, Isaiah 60) [extras]  (★★ the Formed Son the rising
--      Sun/light/dayspring who has a Father; healing in his wings)
--   3. malachi-4-remember-ye-the-law-of-moses — NT (Matthew 5, John 5) + Tanakh (Deuteronomy 4,
--      Joshua 1) [free]  (★★★ the Torah-never-abolished CAPSTONE; the statutes and judgments STAND)
--   4. malachi-4-behold-i-will-send-you-elijah-the-prophet — NT (Matthew 17, Luke 1, Matthew 11,
--      Mark 9) + Extras (Sirach 48) [extras]  (★★★ the forerunner before the day; turning hearts,
--      restoring all things, the two-house resonance)
--
-- Framing notes:
--   ★★ v.2 SUN OF RIGHTEOUSNESS (THREAD 2): the One who *arise[s] with healing in his wings* for
--      *you that fear my name* is the Formed Son — the dayspring (Luke 1:78-79), the light of the
--      world (John 8:12), the One whose hem/wings heal (Matthew 9:20-21). He is the rising Sun who
--      HAS a Father (the Formed and the Formless); the Father is Yahuah Elohim the sun and shield
--      (Psalm 84:11). NOT trinitarian co-equal grammar.
--   ★★★ v.4 REMEMBER THE TORAH (THREAD 3): the whole Tanakh closes commanding Torah-keeping — the
--      statutes and judgments commanded at Horeb FOR ALL YASHAR'EL. This is the anti-antinomian seal
--      of the entire Hebrew Scriptures. Yahusha confirms it: *one jot or one tittle shall in no wise
--      pass* (Matthew 5:18); *he wrote of me* (John 5:46). The Torah is the covenant inheritance,
--      never abolished.
--   ★★★ v.5-6 ELIJAH (THREAD 4): the forerunner who *restore[s] all things* before the day = John
--      the Immerser (Matthew 17:11-13), going *in the spirit and power of Elias* (Luke 1:17). The
--      turning of the hearts of fathers and children carries the two-house restoration resonance —
--      Sirach 48:10 names it outright: *to restore the tribes of Jacob*. The curse is averted by the
--      restoration before the day.
--   VERSES WITH NO SEPARATE ADD: v.3 (treading down the wicked as ashes — the day-of-burning's own
--      aftermath, woven into THREAD 1 with v.1). All recorded, none silently skipped.

CREATE TEMP VIEW _s339_mal04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The day that shall burn as an oven — the day of Yahuah, the proud as stubble
    ('canon','malachi',4,1,'canon','matthew',3,12,'free',
      E'*Whose fan is in his hand, and he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff with unquenchable fire* (Matthew 3:12). The day of Malachi 4:1 — *the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up* — is the same threshing-floor verdict John the Immerser proclaims: the wheat gathered, *the chaff* burned *with unquenchable fire*. The proud who do wickedly are the chaff; the day leaves them *neither root nor branch*.'),
    ('canon','malachi',4,1,'canon','2-peter',3,10,'free',
      E'*But the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up* (2 Peter 3:10). The oven-day of Malachi 4:1 that *shall burn them up* is the day of Yahuah Peter foretells — the elements melting *with fervent heat*, the works *burned up*. The same fire of the great and final day, in which all that do wickedly become stubble.'),
    ('canon','malachi',4,1,'enoch','1-enoch',1,6,'extras',
      E'*And the high mountains shall be shaken, And the high hills shall be made low, And shall melt like wax before the flame* (1 Enoch 1:6). The day that *shall burn as an oven* (Malachi 4:1) is the day Enoch beholds when even the hills *melt like wax before the flame*. The proud who become *stubble* fare no better than the mountains melting before the fire of the coming day.'),
    ('canon','malachi',4,1,'enoch','1-enoch',1,7,'extras',
      E'*And the earth shall be wholly rent in sunder, And all that is upon the earth shall perish, And there shall be a judgement upon all (men)* (1 Enoch 1:7). The burning day of Malachi 4:1 that leaves the wicked *neither root nor branch* is the judgement Enoch foresees — *a judgement upon all*, when *all that do wickedly* are consumed. The restored witness frames Malachi''s oven-day as the universal reckoning.'),
    ('canon','malachi',4,1,'canon','obadiah',1,18,'free',
      E'*And the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble, and they shall kindle in them, and devour them; and there shall not be any remaining of the house of Esau; for Yahuah (LORD) hath spoken it* (Obadiah 1:18). Malachi 4:1''s *all that do wickedly, shall be stubble... burn them up* speaks the same fire and stubble Obadiah names: the wicked *for stubble*, the day leaving *not any remaining* — *neither root nor branch* (Malachi 4:1).'),
    ('canon','malachi',4,1,'canon','joel',2,31,'free',
      E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31). The oven-day of Malachi 4:1 is the *great and the terrible day of Yahuah* Joel announces — the day of burning toward which the whole prophetic word strains. The proud as stubble (Malachi 4:1) meet that dreadful day.'),

    -- THREAD 2 (★★): The Sun of righteousness with healing in his wings — the Formed Son the rising light
    ('canon','malachi',4,2,'canon','luke',1,78,'free',
      E'*Through the tender mercy of our Elohim (God); whereby the dayspring from on high hath visited us* (Luke 1:78). The *Sun of righteousness* that shall *arise with healing in his wings* (Malachi 4:2) is the *dayspring from on high* of Zacharias'' song — the rising light visiting his people. The Formed Son is the Sun that arises; he has a Father, *our Elohim (God)*, of whose *tender mercy* he comes.'),
    ('canon','malachi',4,2,'canon','luke',1,79,'free',
      E'*To give light to them that sit in darkness and in the shadow of death, to guide our feet into the way of peace* (Luke 1:79). The Sun of righteousness *arise[s]* (Malachi 4:2) to do exactly this — *to give light to them that sit in darkness*. The healing in his wings is light to the shadow of death; the rising Sun guides the feet of them that fear the Name into peace.'),
    ('canon','malachi',4,2,'canon','john',8,12,'free',
      E'*Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12). The *Sun of righteousness* (Malachi 4:2) names himself: *I am the light of the world*. The rising Sun with healing in his wings is the Formed Son, the light of life for them that fear the Name — and he has a Father who sent him (John 8:18).'),
    ('canon','malachi',4,2,'canon','matthew',9,20,'free',
      E'*And, behold, a woman, which was diseased with an issue of blood twelve years, came behind him, and touched the hem of his garment* (Matthew 9:20). *Healing in his wings* (Malachi 4:2) is enacted at the very hem — the *wings* (corners) of the Sun of righteousness'' garment. The woman reaches for the edge of his robe and the healing flows from it.'),
    ('canon','malachi',4,2,'canon','matthew',9,21,'free',
      E'*For she said within herself, If I may but touch his garment, I shall be whole* (Matthew 9:21). The promise of *healing in his wings* (Malachi 4:2) is met in faith: *If I may but touch his garment, I shall be whole*. The healing carried in the wings of the rising Sun is reached at the hem of his robe, and she is made whole.'),
    ('canon','malachi',4,2,'enoch','1-enoch',48,4,'extras',
      E'*He shall be a staff to the righteous whereon to stay themselves and not fall, And he shall be the light of the Gentiles, And the hope of those who are troubled of heart* (1 Enoch 48:4). The *Sun of righteousness* arising with *healing* (Malachi 4:2) is the One the restored witness calls *the light of the Gentiles* and *the hope of those who are troubled of heart* — the rising light and healing of all who fear the Name.'),
    ('canon','malachi',4,2,'canon','psalms',84,11,'free',
      E'*For Yahuah Elohim (the LORD God) is a sun and shield: Yahuah (LORD) will give grace and glory: no good thing will he withhold from them that walk uprightly* (Psalm 84:11). The *Sun of righteousness* arising for *you that fear my name* (Malachi 4:2) is no stranger to the Psalter, where *Yahuah Elohim (the LORD God) is a sun and shield* — the rising Sun and the giver of grace and glory to them that walk uprightly.'),
    ('canon','malachi',4,2,'canon','isaiah',60,1,'free',
      E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1). The Sun of righteousness that shall *arise* (Malachi 4:2) is the light Isaiah summons — *thy light is come, and the glory of Yahuah (LORD) is risen upon thee*. The rising Sun is the dawning glory upon them that fear the Name, and the Gentiles come to that light (Isaiah 60:3).'),

    -- THREAD 3 (★★★): Remember ye the law of Moses — the Torah-never-abolished CAPSTONE of the Tanakh
    ('canon','malachi',4,4,'canon','matthew',5,17,'free',
      E'*Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* (Matthew 5:17). The Tanakh''s closing command — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* (Malachi 4:4) — is sealed by Yahusha himself: he came *not to destroy* the law but to fulfil it. The Torah remembered at the close of the Hebrew Scriptures is the Torah he upholds.'),
    ('canon','malachi',4,4,'canon','matthew',5,18,'free',
      E'*For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled* (Matthew 5:18). *Remember ye the law of Moses... with the statutes and judgments* (Malachi 4:4) — and not one jot or tittle of that law passes till heaven and earth pass. The Tanakh ends on Torah, and the Messiah confirms its every stroke stands.'),
    ('canon','malachi',4,4,'canon','john',5,46,'free',
      E'*For had ye believed Moses, ye would have believed me: for he wrote of me* (John 5:46). The command to *Remember ye the law of Moses my servant* (Malachi 4:4) is no dead letter: Moses *wrote of* the Messiah, and to believe Moses is to believe him. The Torah remembered at the canon''s close testifies of the Sun of righteousness who arose.'),
    ('canon','malachi',4,4,'canon','deuteronomy',4,2,'free',
      E'*Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you* (Deuteronomy 4:2). *Remember ye the law of Moses... with the statutes and judgments* (Malachi 4:4) sends the reader back to Horeb, where *the statutes and unto the judgments* were given (Deuteronomy 4:1) — a Torah neither to be added to nor diminished. The Tanakh closes pointing back to the unaltered covenant law.'),
    ('canon','malachi',4,4,'canon','joshua',1,8,'free',
      E'*This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success* (Joshua 1:8). To *Remember ye the law of Moses my servant* (Malachi 4:4) is the same charge Joshua received — *the law, which Moses my servant commanded thee* (Joshua 1:7), kept and meditated day and night. The Torah commanded at the start of the inheritance is the Torah remembered at the close of the canon.'),

    -- THREAD 4 (★★★): Behold, I will send you Elijah the prophet — the forerunner before the day
    ('canon','malachi',4,5,'canon','matthew',17,11,'free',
      E'*And Yahusha (Jesus) answered and said unto them, Elias truly shall first come, and restore all things* (Matthew 17:11). The promise *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5) is named by Yahusha: *Elias truly shall first come, and restore all things*. The forerunner comes before the day to restore.'),
    ('canon','malachi',4,5,'canon','matthew',17,12,'free',
      E'*But I say unto you, That Elias is come already, and they knew him not, but have done unto him whatsoever they listed. Likewise shall also the Son of Adam suffer of them* (Matthew 17:12). The Elijah Malachi 4:5 promised has come: *Elias is come already* — and *the disciples understood that he spake unto them of John the Baptist* (Matthew 17:13). The forerunner of the dreadful day was John the Immerser.'),
    ('canon','malachi',4,6,'canon','luke',1,17,'free',
      E'*And he shall go before him in the spirit and power of Elias, to turn the hearts of the fathers to the children, and the disobedient to the wisdom of the just; to make ready a people prepared for Yahuah (Lord)* (Luke 1:17). This is Malachi 4:6 spoken over John before his birth — *he shall turn the heart of the fathers to the children* — *in the spirit and power of Elias*. The forerunner turns the hearts and makes ready a people for the day.'),
    ('canon','malachi',4,5,'canon','matthew',11,14,'free',
      E'*And if ye will receive it, this is Elias, which was for to come* (Matthew 11:14). The *Elijah the prophet* Malachi 4:5 promised to send *before the coming of the great and dreadful day* is, Yahusha says of John, *Elias, which was for to come*. The forerunner of the day had come.'),
    ('canon','malachi',4,5,'canon','mark',9,12,'free',
      E'*And he answered and told them, Elias verily cometh first, and restoreth all things; and how it is written of the Son of Adam, that he must suffer many things, and be set at nought* (Mark 9:12). Malachi 4:5''s sent *Elijah the prophet* is the one who *cometh first, and restoreth all things* — *Elias is indeed come* (Mark 9:13). The restoring forerunner comes before the day, even as the Son of Adam goes to suffer.'),
    ('canon','malachi',4,5,'apocrypha','ecclesiasticus',48,1,'extras',
      E'*Then stood up Elias the prophet as fire, and his word burned like a lamp* (Sirach 48:1). The *Elijah the prophet* Malachi 4:5 will send is the fiery prophet the restored wisdom-witness extols — *Elias the prophet as fire, and his word burned like a lamp*. The one sent before the dreadful day is the prophet of fire.'),
    ('canon','malachi',4,6,'apocrypha','ecclesiasticus',48,10,'extras',
      E'*Who were ordained for reproofs in their times, to pacify the wrath of the judgment of Yahuah (God), before it brake forth into fury, and to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10). This is Malachi 4:6 quoted by name centuries before the Immerser came — Elijah *to turn the heart of the father to the son*, and (the two-house resonance) *to restore the tribes of Jacob*. The forerunner turns the hearts and restores Yashar''el (Israel) before the wrath of the day breaks forth, lest the earth be smitten with a curse.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s339_mal04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s339_mal04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-4-the-day-that-shall-burn-as-an-oven',
       E'The day that shall burn as an oven — the proud as stubble in the day of Yahuah',
       E'The Tanakh''s last chapter opens with the day of burning: *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch* (Malachi 4:1), and *ye shall tread down the wicked; for they shall be ashes under the soles of your feet* (4:3). John the Immerser proclaims the same threshing-floor verdict: *Whose fan is in his hand, and he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff with unquenchable fire* (Matthew 3:12). Peter names it the day of Yahuah: *the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up* (2 Peter 3:10). The restored witness beholds it too: *And the high mountains shall be shaken, And the high hills shall be made low, And shall melt like wax before the flame... And there shall be a judgement upon all (men)* (1 Enoch 1:6-7). And the prophets had spoken it: the wicked *for stubble... there shall not be any remaining* (Obadiah 1:18), *before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31). The oven-day leaves the proud *neither root nor branch* — the universal reckoning toward which the whole prophetic word strains.',
       sv.verse_id, ev.verse_id, 'extras', 46175
  FROM _s339_mal04_lookup sv, _s339_mal04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-4-the-sun-of-righteousness-with-healing-in-his-wings',
       E'The Sun of righteousness with healing in his wings — the Formed Son the rising light',
       E'Against the day of burning stands a promise for them that fear the Name: *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall* (Malachi 4:2). The rising Sun is the Formed Son, the dayspring drawn from the Formless Father: *the dayspring from on high hath visited us, to give light to them that sit in darkness and in the shadow of death* (Luke 1:78-79). He names himself: *I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12) — the rising Sun who *HAS a Father* who sent him. The *healing in his wings* is reached at the very hem of his garment: *a woman, which was diseased with an issue of blood twelve years, came behind him, and touched the hem of his garment... If I may but touch his garment, I shall be whole* (Matthew 9:20-21) — the wings (corners) of the Sun''s robe carry healing. The Father is the sun behind the Son: *Yahuah Elohim (the LORD God) is a sun and shield: Yahuah (LORD) will give grace and glory* (Psalm 84:11); and Isaiah summons the dawn: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1). The restored witness calls him *the light of the Gentiles, And the hope of those who are troubled of heart* (1 Enoch 48:4). The Sun of righteousness rises with healing for all who fear the Name.',
       sv.verse_id, ev.verse_id, 'extras', 46178
  FROM _s339_mal04_lookup sv, _s339_mal04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-4-remember-ye-the-law-of-moses',
       E'Remember ye the law of Moses — the Torah-never-abolished capstone of the Tanakh',
       E'The entire Hebrew Scriptures close with a command to keep the Torah: *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* (Malachi 4:4). The Tanakh ends not on grace-instead-of-law but on the charge to remember the statutes and judgments commanded at Horeb FOR ALL YASHAR''EL — the anti-antinomian seal of the whole canon. Yahusha confirms it: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* (Matthew 5:17), and *Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled* (Matthew 5:18); for Moses *wrote of me* — *had ye believed Moses, ye would have believed me* (John 5:46). The command points back to Horeb itself, where the law was given to be neither added to nor diminished: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God)* (Deuteronomy 4:2); and the same charge launched the inheritance under Joshua: *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein* (Joshua 1:8). The Torah is the covenant inheritance, never the curse — and the Tanakh seals itself on Remember the Torah of Moses.',
       sv.verse_id, ev.verse_id, 'free', 46181
  FROM _s339_mal04_lookup sv, _s339_mal04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'malachi-4-behold-i-will-send-you-elijah-the-prophet',
       E'Behold, I will send you Elijah the prophet — the forerunner before the great and dreadful day',
       E'The Tanakh''s final words promise a forerunner: *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD): And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse* (Malachi 4:5-6). Yahusha names that Elijah-to-come: *Elias truly shall first come, and restore all things... But I say unto you, That Elias is come already, and they knew him not* (Matthew 17:11-12) — *the disciples understood that he spake unto them of John the Baptist* (17:13); *Elias verily cometh first, and restoreth all things* (Mark 9:12); *this is Elias, which was for to come* (Matthew 11:14). The angel spoke Malachi 4:6 over John before his birth: *he shall go before him in the spirit and power of Elias, to turn the hearts of the fathers to the children, and the disobedient to the wisdom of the just; to make ready a people prepared for Yahuah (Lord)* (Luke 1:17). And the restored wisdom-witness had quoted the promise by name centuries before: *Then stood up Elias the prophet as fire* (Sirach 48:1), *ordained... to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10) — the very turning of the hearts, carrying the two-house resonance of restoring Yashar''el (Israel). The forerunner comes before the day to turn the hearts and restore, lest the earth be smitten with a curse.',
       sv.verse_id, ev.verse_id, 'extras', 46184
  FROM _s339_mal04_lookup sv, _s339_mal04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='malachi' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he will burn up the chaff with unquenchable fire* (Matthew 3:12) — the proud who do wickedly are the *stubble* of Malachi 4:1; the threshing-floor verdict of the day.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-day-that-shall-burn-as-an-oven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the day of Yahuah (Lord) will come as a thief... the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up* (2 Peter 3:10) — the oven-day of Malachi 4:1 that *shall burn them up*.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-day-that-shall-burn-as-an-oven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the high hills shall be made low, And shall melt like wax before the flame* (1 Enoch 1:6) — the day that *shall burn as an oven* (Malachi 4:1) melts even the hills before the fire.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-day-that-shall-burn-as-an-oven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the earth shall be wholly rent in sunder... and there shall be a judgement upon all (men)* (1 Enoch 1:7) — the burning day that leaves the wicked *neither root nor branch* (Malachi 4:1) is the universal reckoning.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-day-that-shall-burn-as-an-oven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the house of Esau for stubble... there shall not be any remaining* (Obadiah 1:18) — the wicked *for stubble* of Malachi 4:1, the day leaving *neither root nor branch*.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-day-that-shall-burn-as-an-oven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31) — the oven-day of Malachi 4:1 is the great and terrible day toward which the prophets strain.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-day-that-shall-burn-as-an-oven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the dayspring from on high hath visited us* (Luke 1:78) — the *Sun of righteousness* that shall *arise* (Malachi 4:2) is the dayspring, the Formed Son who has a Father.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=78
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-sun-of-righteousness-with-healing-in-his-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *To give light to them that sit in darkness and in the shadow of death* (Luke 1:79) — the rising Sun (Malachi 4:2) gives light to the shadow of death.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=79
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-sun-of-righteousness-with-healing-in-his-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I am the light of the world... shall have the light of life* (John 8:12) — the Sun of righteousness (Malachi 4:2) names himself the light; the Formed Son who has a Father.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-sun-of-righteousness-with-healing-in-his-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *came behind him, and touched the hem of his garment* (Matthew 9:20) — *healing in his wings* (Malachi 4:2) reached at the very hem/wings of his robe.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-sun-of-righteousness-with-healing-in-his-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*If I may but touch his garment, I shall be whole* (Matthew 9:21) — the healing carried in the wings of the rising Sun (Malachi 4:2), reached in faith at the hem.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-sun-of-righteousness-with-healing-in-his-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*he shall be the light of the Gentiles, And the hope of those who are troubled of heart* (1 Enoch 48:4) — the Sun of righteousness (Malachi 4:2) the restored witness calls the light and hope.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-sun-of-righteousness-with-healing-in-his-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Yahuah Elohim (the LORD God) is a sun and shield* (Psalm 84:11) — the Father is the sun behind the rising Son (Malachi 4:2), giver of grace and glory to them that walk uprightly.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=84 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-sun-of-righteousness-with-healing-in-his-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1) — the rising Sun (Malachi 4:2) is the dawning light upon them that fear the Name.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-the-sun-of-righteousness-with-healing-in-his-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Think not that I am come to destroy the law... not to destroy, but to fulfil* (Matthew 5:17) — the Tanakh''s closing *Remember ye the law of Moses* (Malachi 4:4) sealed by the Messiah.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-remember-ye-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law* (Matthew 5:18) — the statutes and judgments of Malachi 4:4 stand to the last stroke.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-remember-ye-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *had ye believed Moses, ye would have believed me: for he wrote of me* (John 5:46) — the law of Moses remembered (Malachi 4:4) testifies of the Sun of righteousness.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-remember-ye-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Ye shall not add unto the word... neither shall ye diminish ought from it* (Deuteronomy 4:2) — the Horeb law (Malachi 4:4) given unaltered, to be kept.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-remember-ye-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night* (Joshua 1:8) — the same Torah Malachi 4:4 commands remembered, kept from the start of the inheritance.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-remember-ye-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Elias truly shall first come, and restore all things* (Matthew 17:11) — the Elijah Malachi 4:5 will send, who restores before the day.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-behold-i-will-send-you-elijah-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Elias is come already, and they knew him not* (Matthew 17:12) — the forerunner of the dreadful day (Malachi 4:5) was John the Immerser (17:13).'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-behold-i-will-send-you-elijah-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *in the spirit and power of Elias, to turn the hearts of the fathers to the children* (Luke 1:17) — Malachi 4:6 spoken over John before his birth; the hearts turned, a people made ready.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-behold-i-will-send-you-elijah-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*this is Elias, which was for to come* (Matthew 11:14) — the Elijah Malachi 4:5 promised to send before the day.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-behold-i-will-send-you-elijah-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Elias verily cometh first, and restoreth all things* (Mark 9:12) — the restoring forerunner of Malachi 4:5, *Elias is indeed come* (9:13).'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-behold-i-will-send-you-elijah-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Then stood up Elias the prophet as fire, and his word burned like a lamp* (Sirach 48:1) — the *Elijah the prophet* Malachi 4:5 will send, the prophet of fire.'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-behold-i-will-send-you-elijah-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10) — Malachi 4:6 quoted by name; the turning of hearts and the two-house restoration of Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s339_mal04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='malachi' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s339_mal04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='malachi-4-behold-i-will-send-you-elijah-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session339 — Malachi cross-references complete.'
