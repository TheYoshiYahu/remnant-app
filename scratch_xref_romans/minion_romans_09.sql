-- ----- fragment: minion_romans_09.sql (S219 Romans 9) -----
-- =====================================================================
-- S219 minion — ROMANS 9 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 9.  Tag: r09 (temp view _s219_r09_lookup).  Sort band: 6200-6224, step 3.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #1/#3/#7/#11 — HIGHEST VOICE-RISK PASSAGE): Romans 9 is read
-- as ISRAEL'S OWN — corporate/covenantal election, restoration not replacement, NEVER
-- individual-soul predestination and NEVER a new people displacing Israel.
--   * 9:4-5 — the adoption, the glory, the covenants, the law, the service, the promises
--     belong to Yashar'el (Israel) and are NOT revoked. Paul grieves FOR his kinsmen — the
--     proof Elohim has not finished with them.
--   * The election of Isaac/Jacob over Ishmael/Esau, and the hardening of Pharaoh, is
--     CORPORATE — which line carries the promise, which nation rises — read nation-level
--     through *two nations are in thy womb* (Genesis 25:23) and Malachi 1:2-3 (Esau = Edom).
--     NOT a decree of individual souls to heaven or hell.
--   * 9:24 — vessels of mercy called *not of the Yahudim (Jews) only, but also of the
--     Gentiles* = the TWO HOUSES, Yahudah and the scattered Yosef/Ephraim of the north.
--   * 9:25-26 — *I will call them my people, which were not my people* (= Hosea 2:23) and
--     *the children of the living Elohim (God)* (= Hosea 1:10) is the Lo-Ammi / Lo-Ruhamah
--     of the DIVORCED NORTHERN HOUSE regathered — the once-cast-off seed reclaimed, NOT
--     outsiders newly admitted by confession.
--   * 9:27-29 — *a remnant shall be saved* (Isaiah 10:22-23); *except a seed, we had been
--     as Sodoma* (Isaiah 1:9) — the faithful remnant of Israel preserved, the down-payment
--     of the gathering.
--   * 9:32-33 — the stumblingstone (Isaiah 8:14, 28:16) — Israel stumbled at the stone, but
--     the stone is LAID IN ZION for them, a sanctuary and sure foundation, not against them.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   Paul's heaviness                       Tanakh: none added (carried at v.3-5)  Extras: none warranted  NT: none warranted (epistolary lament)
--   v.3-5   covenants/law/promises pertain to Israel Tanakh: Exodus 4:22 (Israel my firstborn son), Deuteronomy 7:6 (a holy people, chosen)  Extras: 2 Esdras 8:16 (Israel my inheritance, for whom I mourn)  NT: none added
--   v.6-9   In Isaac shall thy seed be called        Tanakh: Genesis 21:12 (in Isaac shall thy seed be called)  Extras: none warranted  NT: none added
--   v.10-13 Jacob/Esau, the elder serve the younger  Tanakh: Genesis 25:23 (two nations in thy womb), Malachi 1:2-3 (Jacob loved, Esau hated = Edom)  Extras: none warranted  NT: none added
--   v.14-18 mercy on whom I will; Pharaoh raised up   Tanakh: Exodus 33:19 (I will have mercy on whom I will), Exodus 9:16 (for this cause raised thee up)  Extras: Wisdom of Solomon 12:18, 12:16 (mastering power, gracious to all; longsuffering)  NT: none added
--   v.19-23 the thing formed; potter over the clay    Tanakh: Isaiah 29:16 (shall the thing framed say...), Isaiah 45:9 (woe to him that striveth with his Maker), Jeremiah 18:6 (as clay in the potter's hand)  Extras: Wisdom of Solomon 15:7 (same clay, vessels for clean and contrary uses), 2 Esdras 8:2 (much mould for vessels, little dust for gold)  NT: none added
--   v.24-26 not of the Jews only but also the Gentiles Tanakh: Hosea 2:23 (I will say to them which were not my people, Thou art my people), Hosea 1:10 (the sons of the living Elohim), Hosea 2:1 (Ammi, Ru-hamah)  Extras: none warranted  NT: none added (two-house gathering carried by Hosea targets)
--   v.27-29 a remnant shall be saved / except a seed   Tanakh: Isaiah 10:22-23 (a remnant shall return), Isaiah 1:9 (except a remnant, as Sodom)  Extras: 2 Esdras 9:7-8 (saved by works and by faith, sanctified from the beginning), 2 Esdras 9:21-22 (a grape of the cluster kept)  NT: none added
--   v.30-33 the stumblingstone laid in Zion            Tanakh: Isaiah 8:14 (a stone of stumbling to both houses), Isaiah 28:16 (I lay in Zion a sure foundation)  Extras: none warranted  NT: none added
--
-- THREADS (slug -> target libraries):
--   6200 romans-9-to-them-pertain-the-covenants-paul-grieves-for-his-kinsmen-israel       (Tanakh + Extras)
--   6203 romans-9-in-isaac-shall-thy-seed-be-called-the-corporate-election-of-the-line    (Tanakh)
--   6206 romans-9-i-will-have-mercy-on-whom-i-will-have-mercy-the-sovereign-compassion    (Tanakh + Extras)
--   6209 romans-9-the-thing-formed-and-the-potter-over-the-clay                            (Tanakh + Extras)
--   6212 romans-9-i-will-call-them-my-people-which-were-not-my-people-lo-ammi-regathered   (Tanakh)
--   6215 romans-9-a-remnant-shall-be-saved-except-a-seed-we-had-been-as-sodom              (Tanakh + Extras)
--   6218 romans-9-the-stumblingstone-laid-in-zion-they-stumbled-at-the-stone               (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s219_r09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-9-to-them-pertain-the-covenants-paul-grieves-for-his-kinsmen-israel
  ('canon', 'romans', 9, 4, 'canon', 'exodus', 4, 22, 'free', E'*And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn:* (Exodus 4:22). Paul names his kinsmen *Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises* (Romans 9:4). The adoption is no new thing handed to outsiders — Yahuah called Yashar''el his firstborn son before Pharaoh, and that sonship is the first of the things that still *pertain* to them. Paul lists what is theirs to prove the word of Elohim has not failed.'),
  ('canon', 'romans', 9, 4, 'canon', 'deuteronomy', 7, 6, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). To Yashar''el *pertaineth the adoption, and the glory, and the covenants … and the promises* (Romans 9:4). Moses had already declared them chosen, a special people. Paul does not revoke that choosing — he grieves precisely because it stands, and his kinsmen according to the flesh have not yet known the day of their gathering.'),
  ('canon', 'romans', 9, 4, 'apocrypha', '2-esdras', 8, 16, 'extras', E'*And for your inheritance, for whose cause I mourn; and for Yashar''el (Israel), for whom I am heavy; and for Jacob, for whose sake I am troubled;* (2 Esdras 8:16). *I have great heaviness and continual sorrow in my heart* (Romans 9:2), Paul says, *for my brethren, my kinsmen according to the flesh* (Romans 9:3). Esdras carried the same burden long before — heavy and troubled for Yashar''el, the inheritance, the seed of Jacob. The grief is the proof of love, not of rejection: the prophet and the apostle both mourn for the covenant people, certain Elohim will not abandon his own inheritance.'),
  -- thread: romans-9-in-isaac-shall-thy-seed-be-called-the-corporate-election-of-the-line
  ('canon', 'romans', 9, 7, 'canon', 'genesis', 21, 12, 'free', E'*And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* (Genesis 21:12). *Neither, because they are the seed of Abraham, are they all children: but, In Isaac shall thy seed be called* (Romans 9:7). Paul quotes the word at Beer-sheba: the line of promise runs through Isaac, not Ishmael. This is the choosing of which seed carries the covenant — a corporate, generational election of the line, not a verdict on the eternal fate of one man''s soul.'),
  ('canon', 'romans', 9, 12, 'canon', 'genesis', 25, 23, 'free', E'*And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* (Genesis 25:23). *It was said unto her, The elder shall serve the younger* (Romans 9:12). The word to Rebecca is spoken of *two nations* and *two manner of people* — not two individuals weighed for heaven. The election of the younger over the elder is the choosing of which people will carry the promise; the very verse Paul cites names them nations in the womb.'),
  ('canon', 'romans', 9, 13, 'canon', 'malachi', 1, 2, 'free', E'*I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* (Malachi 1:2). *As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13). Paul quotes Malachi, and Malachi is speaking of nations: the next breath lays *his mountains and his heritage waste* and names *Edom* (Malachi 1:3-4). Esau is Edom, a people and a land under judgment — the love and the hatred are spoken over the houses the brothers fathered, the covenantal sorting of the lines, not the predestining of two souls.'),
  ('canon', 'romans', 9, 13, 'canon', 'malachi', 1, 3, 'free', E'*And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* (Malachi 1:3). *Jacob have I loved, but Esau have I hated* (Romans 9:13). The hatred Paul cites is not abstract: Malachi names it as the laying waste of Esau''s mountains and heritage — the judgment that falls on Edom the nation. Read in its own context the word is corporate and territorial, the sorting of which people inherits and which is brought low, never a decree fixing the fate of individual souls before they were born.'),
  -- thread: romans-9-i-will-have-mercy-on-whom-i-will-have-mercy-the-sovereign-compassion
  ('canon', 'romans', 9, 15, 'canon', 'exodus', 33, 19, 'free', E'*And he said, I will make all my goodness pass before thee, and I will proclaim the name of Yahuah (LORD) before thee; and will be gracious to whom I will be gracious, and will shew mercy on whom I will shew mercy.* (Exodus 33:19). *For he saith to Moses, I will have mercy on whom I will have mercy, and I will have compassion on whom I will have compassion* (Romans 9:15). Paul quotes the word spoken at the mount, where Yahuah declared his name to be goodness and mercy. The setting is the renewal of the covenant after the calf — mercy proclaimed to a people who deserved consuming. The sovereign freedom to show mercy is named at the very moment Yashar''el is spared, not at a courtroom of damnation.'),
  ('canon', 'romans', 9, 17, 'canon', 'exodus', 9, 16, 'free', E'*And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth.* (Exodus 9:16). *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth* (Romans 9:17). Pharaoh is raised up that the name might be declared in all the earth — the hardening serves the deliverance of Yashar''el and the spreading of the renown of Yahuah. The purpose is the redemption of the firstborn son out of Egypt; Pharaoh''s hardening is the dark backdrop against which the mercy on the covenant people is shown.'),
  ('canon', 'romans', 9, 18, 'apocrypha', 'the-wisdom-of-solomon', 12, 18, 'extras', E'*But you, mastering your power, judgest with equity, and orderest us with great favour: for you may use power when you will.* (Wisdom of Solomon 12:18). *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). The wisdom-writer holds the same truth Paul presses: the One who *may use power when he will* nonetheless *judgest with equity* and orders his own with great favour. The sovereign hand is never arbitrary cruelty — it is power mastered, mercy ordered, the same hand that hardens the oppressor showing favour to the people he loves.'),
  ('canon', 'romans', 9, 15, 'apocrypha', 'the-wisdom-of-solomon', 12, 16, 'extras', E'*For your power is the beginning of righteousness, and because you are Yahuah (God) of all, it makes you to be gracious to all.* (Wisdom of Solomon 12:16). *I will have mercy on whom I will have mercy, and I will have compassion on whom I will have compassion* (Romans 9:15). The wisdom-writer roots the very freedom Paul names in righteousness: because Yahuah is Elohim of all, his power *makes him to be gracious.* Sovereign mercy is the outflow of a righteous heart, not a cold lottery — the freedom to show compassion is the freedom of the One whose power is *the beginning of righteousness.*'),
  -- thread: romans-9-the-thing-formed-and-the-potter-over-the-clay
  ('canon', 'romans', 9, 20, 'canon', 'isaiah', 29, 16, 'free', E'*Surely your turning of things upside down shall be esteemed as the potter''s clay: for shall the work say of him that made it, He made me not? or shall the thing framed say of him that framed it, He had no understanding?* (Isaiah 29:16). *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* (Romans 9:20). Paul reaches straight for Isaiah''s image: the thing framed cannot arraign its Maker. And mark what frames it in Isaiah — the very next promise is that *the deaf hear the words of the book, and the eyes of the blind shall see* (Isaiah 29:18). The potter''s sovereignty is bent toward restoration, the opening of blind eyes in Yashar''el, not the breaking of the clay.'),
  ('canon', 'romans', 9, 20, 'canon', 'isaiah', 45, 9, 'free', E'*Woe unto him that striveth with his Maker! Let the potsherd strive with the potsherds of the earth. Shall the clay say to him that fashioneth it, What makest thou? or thy work, He hath no hands?* (Isaiah 45:9). *Shall the thing formed say to him that formed it, Why hast thou made me thus?* (Romans 9:20). Isaiah''s woe stands behind Paul''s rebuke. And in Isaiah the Maker''s purpose is named outright: *in Yahuah (LORD) shall all the seed of Yashar''el (Israel) be justified, and shall glory* (Isaiah 45:25). The potter who will not be questioned is the same who has sworn the justifying and the gathering of the seed — the clay is in the hand of One determined to save it.'),
  ('canon', 'romans', 9, 21, 'canon', 'jeremiah', 18, 6, 'free', E'*O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel).* (Jeremiah 18:6). *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* (Romans 9:21). The figure is Jeremiah''s, and Jeremiah names the clay: *the house of Yashar''el (Israel).* And the potter''s work there is remaking — *the vessel … was marred … so he made it again another vessel* (Jeremiah 18:4). The sovereignty over the clay is the sovereignty to reshape and restore the very house that was marred, conditioned on whether the nation turns (Jeremiah 18:8).'),
  ('canon', 'romans', 9, 21, 'apocrypha', 'the-wisdom-of-solomon', 15, 7, 'extras', E'*For the potter, tempering soft earth, fashioneth every vessel with much labour for our service: yes, of the same clay he makes both the vessels that serve for clean uses, and likewise also all such as serve to the contrary: but what is the use of either sort, the potter himself is the judge.* (Wisdom of Solomon 15:7). *Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* (Romans 9:21). The wisdom-writer drew the exact image Paul draws — one clay, the same lump, vessels for clean uses and vessels to the contrary, and *the potter himself is the judge.* Paul is not inventing a new doctrine of arbitrary fate; he is pressing a figure already common in the library, the Maker''s rightful authority over what he forms.'),
  ('canon', 'romans', 9, 23, 'apocrypha', '2-esdras', 8, 2, 'extras', E'*I will tell you a similitude, Esdras; As when you ask the earth, it shall say to you, that it gives much mould of which earthen vessels are made, but little dust that gold comes of: even so is the course of this present world.* (2 Esdras 8:2). *And that he might make known the riches of his glory on the vessels of mercy, which he had afore prepared unto glory* (Romans 9:23). Esdras too speaks of vessels formed from the earth and of the few of great worth drawn from the many — the much mould, the little gold. The vessels of mercy *afore prepared unto glory* are that precious remnant, the seed kept back from the lump for the riches of his glory, the down-payment of the gathering.'),
  -- thread: romans-9-i-will-call-them-my-people-which-were-not-my-people-lo-ammi-regathered
  ('canon', 'romans', 9, 25, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). *As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). This is the word Paul quotes, and it is spoken over the divorced northern house — Lo-Ruhamah, *her that had not obtained mercy,* and Lo-Ammi, *them which were not my people.* These are not strangers newly admitted by confession; they are the cast-off seed of Yashar''el reclaimed, *sown … in the earth* and gathered, the once-not-my-people made my people again.'),
  ('canon', 'romans', 9, 26, 'canon', 'hosea', 1, 10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). *And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26). Paul quotes Hosea word for word. The *children of the living Elohim* are *the children of Yashar''el* multiplied as the sand — the scattered seed of the north, dispersed among the nations until they were *not my people,* now reclaimed in the very place of their scattering. The vessels of mercy *also of the Gentiles* (Romans 9:24) are this dispersed house coming home, not a replacement people.'),
  ('canon', 'romans', 9, 25, 'canon', 'hosea', 2, 1, 'free', E'*Say ye unto your brethren, Ammi; and to your sisters, Ru-hamah.* (Hosea 2:1). *I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). Hosea reverses the names of judgment: Lo-Ammi (not my people) becomes Ammi (my people), and Lo-Ruhamah (not beloved, not pitied) becomes Ru-hamah (beloved, having obtained mercy). Paul''s *my people, which were not my people* and *her beloved, which was not beloved* is exactly this undoing — the divorced house addressed again as brethren and sisters, the names of casting-off lifted from the scattered seed.'),
  -- thread: romans-9-a-remnant-shall-be-saved-except-a-seed-we-had-been-as-sodom
  ('canon', 'romans', 9, 27, 'canon', 'isaiah', 10, 22, 'free', E'*For though thy people Yashar''el (Israel) be as the sand of the sea, yet a remnant of them shall return: the consumption decreed shall overflow with righteousness.* (Isaiah 10:22). *Esaias also crieth concerning Yashar''el (Israel), Though the number of the children of Yashar''el (Israel) be as the sand of the sea, a remnant shall be saved* (Romans 9:27). Paul quotes Isaiah, and Isaiah''s word is hope, not abandonment: *the remnant shall return, even the remnant of Jacob, unto El Gibbor (the mighty God)* (Isaiah 10:21). The saved remnant is the kept seed of Yashar''el, the survivors of Jacob who lean again upon the Holy One — the gathering''s first sheaf, proof the whole harvest is coming.'),
  ('canon', 'romans', 9, 28, 'canon', 'isaiah', 10, 23, 'free', E'*For Adonai Yahuah (the Lord GOD) of hosts shall make a consumption, even determined, in the midst of all the land.* (Isaiah 10:23). *For he will finish the work, and cut it short in righteousness: because a short work will Yahuah (Lord) make upon the earth* (Romans 9:28). Paul carries Isaiah''s next line: the determined consumption, the short and decisive work. Yet in Isaiah the very next breath comforts the remnant — *be not afraid of the Assyrian … for yet a very little while, and the indignation shall cease* (Isaiah 10:24-25). The cutting-short in righteousness clears the ground for the kept seed; the judgment is the threshing that preserves the wheat.'),
  ('canon', 'romans', 9, 29, 'canon', 'isaiah', 1, 9, 'free', E'*Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom, and we should have been like unto Gomorrah.* (Isaiah 1:9). *And as Esaias said before, Except Yahuah (Lord) of Sabaoth had left us a seed, we had been as Sodoma, and been made like unto Gomorrha* (Romans 9:29). Paul quotes Isaiah''s confession: only the seed Yahuah left kept Yashar''el from the utter end of Sodom. The remnant is sheer mercy — a seed preserved when the whole deserved consuming. That kept seed is the pledge that the house is not finished; the gathering begins with the few who were spared.'),
  ('canon', 'romans', 9, 27, 'apocrypha', '2-esdras', 9, 8, 'extras', E'*Shall be preserved from the said perils, and shall see my salvation in my land, and within my borders: for I have sanctified them for me from the beginning.* (2 Esdras 9:8). *Though the number of the children of Yashar''el (Israel) be as the sand of the sea, a remnant shall be saved* (Romans 9:27). Esdras names the saved as those *sanctified … from the beginning* — set apart before, not chosen after by their response. The remnant that *shall see my salvation in my land* is the kept seed, marked from the foundation and preserved through the perils; their salvation reveals what was already true, the covenant standing from of old.'),
  ('canon', 'romans', 9, 29, 'apocrypha', '2-esdras', 9, 21, 'extras', E'*And I saw, and spared it greatly, and have kept me a grape of the cluster, and a plant of a great people.* (2 Esdras 9:21). *Except Yahuah (Lord) of Sabaoth had left us a seed, we had been as Sodoma* (Romans 9:29). Esdras speaks the same mercy Paul confesses: out of the great people the Most High *kept me a grape of the cluster, and a plant* — the preserved few from among the many. The seed Yahuah left, the grape kept from the cluster, is the same remnant: spared greatly, kept by labour, the living root from which the whole gathered people will grow again.'),
  -- thread: romans-9-the-stumblingstone-laid-in-zion-they-stumbled-at-the-stone
  ('canon', 'romans', 9, 32, 'canon', 'isaiah', 8, 14, 'free', E'*And he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel), for a gin and for a snare to the inhabitants of Jerusalem.* (Isaiah 8:14). *For they stumbled at that stumblingstone* (Romans 9:32). Paul draws on Isaiah, and Isaiah names the stone first a *sanctuary* — and only then *a stone of stumbling … to both the houses of Yashar''el.* The same stone is refuge and offence: a sanctuary to those who sanctify Yahuah and lean on him, a stumbling to those who would not. It is set for both houses, Yahudah and the scattered north — the stone of Yashar''el''s own, not a rock raised against them.'),
  ('canon', 'romans', 9, 33, 'canon', 'isaiah', 28, 16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16). *As it is written, Behold, I lay in Sion a stumblingstone and rock of offence: and whosoever believeth on him shall not be ashamed* (Romans 9:33). Paul binds Isaiah''s two stones into one: the rock of offence and the precious corner stone are the same stone, *laid in Zion* by Yahuah himself. He is a tried, sure foundation for his people — *whosoever believeth on him shall not be ashamed.* The stone is set in Zion FOR Yashar''el; they stumbled at him by seeking righteousness as it were by works, but the stone laid in Zion is laid for them to build upon, the cornerstone of the house being gathered.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-9-to-them-pertain-the-covenants-paul-grieves-for-his-kinsmen-israel',
       E'To them pertain the covenants — Paul grieves for his kinsmen Yashar''el (Israel)',
       E'Romans 9 opens not with a verdict against Yashar''el (Israel) but with grief for her: *I have great heaviness and continual sorrow in my heart* (Romans 9:2), *for my brethren, my kinsmen according to the flesh* (Romans 9:3). And the grief is built on what still stands — *who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises; whose are the fathers* (Romans 9:4-5). The verb is present: these things *pertain* to them yet, not once-upon-a-time. The adoption is no new thing handed to outsiders — Yahuah named Yashar''el his own before Pharaoh: *Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22). The choosing is old: *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself* (Deuteronomy 7:6). And the heaviness Paul feels is the heaviness the prophets felt before him — *for Yashar''el (Israel), for whom I am heavy; and for Jacob, for whose sake I am troubled* (2 Esdras 8:16). Paul lists what is theirs and grieves over them precisely to prove the word of Elohim has not failed. He has not finished with his people; the apostle''s sorrow is the surest sign the covenant still holds.',
       sv.verse_id, ev.verse_id, 'extras', 6200
  FROM _s219_r09_lookup sv, _s219_r09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-9-in-isaac-shall-thy-seed-be-called-the-corporate-election-of-the-line',
       E'In Isaac shall thy seed be called — the corporate election of the line',
       E'*For they are not all Yashar''el (Israel), which are of Yashar''el (Israel)* (Romans 9:6) — and Paul proves it from the patriarchs, but the proof is the choosing of which line carries the promise, never a decree weighing individual souls for heaven or hell. *In Isaac shall thy seed be called* (Romans 9:7) is the word at Beer-sheba: *for in Isaac shall thy seed be called* (Genesis 21:12) — the covenant runs through Isaac, not Ishmael. So with the next generation: *the elder shall serve the younger* (Romans 9:12), and the word to Rebecca is spoken plainly of peoples — *two nations are in thy womb, and two manner of people shall be separated from thy bowels … and the elder shall serve the younger* (Genesis 25:23). When Paul writes *Jacob have I loved, but Esau have I hated* (Romans 9:13) he quotes Malachi, and Malachi is speaking nation to nation: *yet I loved Jacob, and I hated Esau, and laid his mountains and his heritage waste* (Malachi 1:2-3) — Esau is Edom, a people and a land brought low. From the womb to the wilderness of Edom, the election here is corporate and covenantal: which seed bears the promise, which house rises and which is humbled. It is not the predestining of two men''s eternal fates before they had done good or evil.',
       sv.verse_id, ev.verse_id, 'free', 6203
  FROM _s219_r09_lookup sv, _s219_r09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=9 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-9-i-will-have-mercy-on-whom-i-will-have-mercy-the-sovereign-compassion',
       E'I will have mercy on whom I will have mercy — the sovereign compassion',
       E'*For he saith to Moses, I will have mercy on whom I will have mercy, and I will have compassion on whom I will have compassion* (Romans 9:15). Paul quotes the word given at the mount, and the setting is everything: *I will make all my goodness pass before thee, and I will proclaim the name of Yahuah (LORD) before thee; and will be gracious to whom I will be gracious, and will shew mercy on whom I will shew mercy* (Exodus 33:19). This is mercy proclaimed to Yashar''el (Israel) just after the calf — the people spared who deserved consuming. The sovereign freedom to show mercy is named at the very moment the covenant is renewed, not at a tribunal of the damned. And the counterweight, Pharaoh, serves the same deliverance: *Even for this same purpose have I raised thee up, that I might shew my power in thee* (Romans 9:17), quoting *for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth* (Exodus 9:16) — the hardening of the oppressor is the dark ground against which the redemption of the firstborn son is shown. *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). And this is never arbitrary cruelty: *you, mastering your power, judgest with equity, and orderest us with great favour* (Wisdom of Solomon 12:18), for *your power is the beginning of righteousness, and because you are Yahuah (God) of all, it makes you to be gracious to all* (Wisdom of Solomon 12:16). The hand that hardens Egypt is the same hand showing favour to the people he loves — power mastered, mercy ordered, the freedom of a righteous Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 6206
  FROM _s219_r09_lookup sv, _s219_r09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=9 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-9-the-thing-formed-and-the-potter-over-the-clay',
       E'The thing formed and the potter over the clay',
       E'*Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* (Romans 9:20). Paul reaches for a figure already worn smooth in the library — and every place it is used, it bends toward restoration, not toward the breaking of the clay. Isaiah: *shall the thing framed say of him that framed it, He had no understanding?* (Isaiah 29:16) — and the very next promise is *the eyes of the blind shall see out of obscurity* (Isaiah 29:18). Isaiah again: *Woe unto him that striveth with his Maker! … Shall the clay say to him that fashioneth it, What makest thou?* (Isaiah 45:9) — and that same chapter swears *in Yahuah (LORD) shall all the seed of Yashar''el (Israel) be justified, and shall glory* (Isaiah 45:25). Jeremiah names the clay outright: *as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel)* (Jeremiah 18:6) — where the potter *made it again another vessel* (Jeremiah 18:4), remaking the marred house. So *hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?* (Romans 9:21) is no novel decree of arbitrary fate. The wisdom-writer drew the same picture: *of the same clay he makes both the vessels that serve for clean uses, and likewise also all such as serve to the contrary: but … the potter himself is the judge* (Wisdom of Solomon 15:7). And the vessels of mercy *afore prepared unto glory* (Romans 9:23) are the precious few drawn from the lump — as Esdras saw, *much mould of which earthen vessels are made, but little dust that gold comes of* (2 Esdras 8:2). The potter''s sovereignty is the sovereignty to reshape, to keep back the gold, to remake the house that was marred.',
       sv.verse_id, ev.verse_id, 'extras', 6209
  FROM _s219_r09_lookup sv, _s219_r09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=9 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-9-i-will-call-them-my-people-which-were-not-my-people-lo-ammi-regathered',
       E'I will call them my people, which were not my people — the Lo-Ammi regathered',
       E'The vessels of mercy are *us, whom he hath called, not of the Yahudim (Jews) only, but also of the Gentiles* (Romans 9:24) — and this is the two houses, Yahudah and the scattered seed of the north, not a new people displacing Yashar''el (Israel). Paul proves it from Hosea, and Hosea''s words are spoken over the divorced northern house. *I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25) quotes *I will say to them which were not my people, Thou art my people … I will have mercy upon her that had not obtained mercy* (Hosea 2:23) — Lo-Ammi (not my people) and Lo-Ruhamah (not pitied), the very children of judgment, reclaimed. Hosea had already reversed the names: *Say ye unto your brethren, Ammi; and to your sisters, Ru-hamah* (Hosea 2:1) — my people, beloved, the names of casting-off lifted off the scattered seed. And *in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26) quotes Hosea word for word: *the number of the children of Yashar''el (Israel) shall be as the sand of the sea … there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The children of the living Elohim ARE the children of Yashar''el multiplied as the sand — the dispersed house, scattered among the nations until they were *not my people,* reclaimed in the very place of their scattering. The Gentiles of Romans 9:24 are this house coming home. Not outsiders newly admitted by confession — the once-cast-off seed of the north, made Ammi again.',
       sv.verse_id, ev.verse_id, 'free', 6212
  FROM _s219_r09_lookup sv, _s219_r09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=9 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-9-a-remnant-shall-be-saved-except-a-seed-we-had-been-as-sodom',
       E'A remnant shall be saved — except a seed, we had been as Sodom',
       E'*Esaias also crieth concerning Yashar''el (Israel), Though the number of the children of Yashar''el (Israel) be as the sand of the sea, a remnant shall be saved* (Romans 9:27). Paul quotes Isaiah, and Isaiah''s word is hope: *a remnant of them shall return … the remnant shall return, even the remnant of Jacob, unto El Gibbor (the mighty God)* (Isaiah 10:22, 10:21). The saved remnant is the kept seed of Yashar''el, the survivors of Jacob leaning again on the Holy One — the first sheaf of the gathering, proof the whole harvest is coming. *He will finish the work, and cut it short in righteousness* (Romans 9:28) carries Isaiah''s next line, *a consumption, even determined* (Isaiah 10:23) — yet the very next breath comforts the remnant: *be not afraid of the Assyrian … for yet a very little while, and the indignation shall cease* (Isaiah 10:24-25). The cutting-short is the threshing that preserves the wheat. And the remnant is sheer mercy: *Except Yahuah (Lord) of Sabaoth had left us a seed, we had been as Sodoma* (Romans 9:29), quoting *except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom* (Isaiah 1:9). Only the seed Yahuah left kept the whole house from the end of Sodom. Esdras names this kept seed too — those *sanctified … from the beginning* who *shall see my salvation in my land* (2 Esdras 9:8), the *grape of the cluster, and a plant of a great people* the Most High *kept* and *spared greatly* (2 Esdras 9:21). The remnant is the living root, marked from old, from which the gathered people will grow again.',
       sv.verse_id, ev.verse_id, 'extras', 6215
  FROM _s219_r09_lookup sv, _s219_r09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=9 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-9-the-stumblingstone-laid-in-zion-they-stumbled-at-the-stone',
       E'The stumblingstone laid in Zion — they stumbled at the stone',
       E'*But Yashar''el (Israel), which followed after the law of righteousness, hath not attained to the law of righteousness. Wherefore? Because they sought it not by faith, but as it were by the works of the law. For they stumbled at that stumblingstone* (Romans 9:31-32). The failure is named exactly: not the law itself, but the seeking of righteousness as a system of flesh-performance apart from the faithfulness that should have clung to the stone. And the stone they stumbled at is, in Isaiah, first a refuge: *he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* (Isaiah 8:14). The same stone is sanctuary and offence — refuge to those who sanctify Yahuah and lean on him, stumbling to those who would not. It is set for *both the houses,* Yahudah and the scattered north — the stone of Yashar''el''s own. And Paul binds it to Isaiah''s sure foundation: *Behold, I lay in Sion a stumblingstone and rock of offence: and whosoever believeth on him shall not be ashamed* (Romans 9:33), where Isaiah declared *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The rock of offence and the precious corner stone are one stone, *laid in Zion* by Yahuah himself — laid FOR his people to build upon. They stumbled at him by seeking it by works; but the stone is set in Zion for them, the cornerstone of the house being gathered, and *whosoever believeth on him shall not be ashamed.*',
       sv.verse_id, ev.verse_id, 'free', 6218
  FROM _s219_r09_lookup sv, _s219_r09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=9 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-9-to-them-pertain-the-covenants-paul-grieves-for-his-kinsmen-israel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:22 — *Yashar''el (Israel) is my son, even my firstborn* the adoption that still pertains to them is no new thing; Yahuah named them his firstborn before Pharaoh (Romans 9:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-to-them-pertain-the-covenants-paul-grieves-for-his-kinsmen-israel'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:6 — *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people* the choosing is old and stands; Paul does not revoke it but grieves that it holds (Romans 9:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-to-them-pertain-the-covenants-paul-grieves-for-his-kinsmen-israel'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 8:16 — *for Yashar''el (Israel), for whom I am heavy; and for Jacob, for whose sake I am troubled* the prophet''s grief is Paul''s grief; mourning for the covenant people is the proof of love, not rejection (Romans 9:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-to-them-pertain-the-covenants-paul-grieves-for-his-kinsmen-israel'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-9-in-isaac-shall-thy-seed-be-called-the-corporate-election-of-the-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:12 — *in Isaac shall thy seed be called* the line of promise runs through Isaac, not Ishmael; the choosing of which seed carries the covenant (Romans 9:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-in-isaac-shall-thy-seed-be-called-the-corporate-election-of-the-line'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:23 — *two nations are in thy womb … the elder shall serve the younger* the word to Rebecca is spoken of nations and peoples, not two souls weighed for heaven (Romans 9:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-in-isaac-shall-thy-seed-be-called-the-corporate-election-of-the-line'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 1:2 — *yet I loved Jacob* the love Paul quotes is spoken nation to nation, the covenantal sorting of the houses the brothers fathered (Romans 9:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-in-isaac-shall-thy-seed-be-called-the-corporate-election-of-the-line'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 1:3 — *I hated Esau, and laid his mountains and his heritage waste* the hatred is corporate and territorial, the judgment on Edom the nation, never a decree on an individual soul (Romans 9:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-in-isaac-shall-thy-seed-be-called-the-corporate-election-of-the-line'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-9-i-will-have-mercy-on-whom-i-will-have-mercy-the-sovereign-compassion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 33:19 — *will shew mercy on whom I will shew mercy* spoken at the mount as the covenant is renewed after the calf; sovereign mercy named at the moment Yashar''el is spared (Romans 9:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-i-will-have-mercy-on-whom-i-will-have-mercy-the-sovereign-compassion'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 9:16 — *for this cause have I raised thee up, for to shew in thee my power* Pharaoh''s hardening serves the deliverance of the firstborn son and the spreading of the name (Romans 9:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-i-will-have-mercy-on-whom-i-will-have-mercy-the-sovereign-compassion'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 12:16 — *because you are Yahuah (God) of all, it makes you to be gracious to all* sovereign mercy is the outflow of righteousness, not a cold lottery (Romans 9:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-i-will-have-mercy-on-whom-i-will-have-mercy-the-sovereign-compassion'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 12:18 — *mastering your power, judgest with equity, and orderest us with great favour* the hand that hardens the oppressor is power mastered and mercy ordered (Romans 9:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-i-will-have-mercy-on-whom-i-will-have-mercy-the-sovereign-compassion'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-9-the-thing-formed-and-the-potter-over-the-clay
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 29:16 — *shall the thing framed say of him that framed it, He had no understanding?* the image whose next breath is the opening of blind eyes; the potter bent toward restoration (Romans 9:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-the-thing-formed-and-the-potter-over-the-clay'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:9 — *Shall the clay say to him that fashioneth it, What makest thou?* the woe whose same chapter swears all the seed of Yashar''el justified and glorying (Romans 9:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-the-thing-formed-and-the-potter-over-the-clay'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 18:6 — *as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel)* the clay is named: the house itself, remade after it was marred (Romans 9:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-the-thing-formed-and-the-potter-over-the-clay'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 15:7 — *of the same clay he makes both the vessels that serve for clean uses, and likewise also all such as serve to the contrary* the exact figure Paul presses, already worn smooth in the library (Romans 9:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-the-thing-formed-and-the-potter-over-the-clay'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 8:2 — *much mould of which earthen vessels are made, but little dust that gold comes of* the vessels of mercy afore prepared unto glory are the precious few drawn from the lump (Romans 9:23).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-the-thing-formed-and-the-potter-over-the-clay'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-9-i-will-call-them-my-people-which-were-not-my-people-lo-ammi-regathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 2:23 — *I will say to them which were not my people, Thou art my people* the Lo-Ammi and Lo-Ruhamah of the divorced northern house reclaimed, sown again in the earth (Romans 9:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-i-will-call-them-my-people-which-were-not-my-people-lo-ammi-regathered'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 1:10 — *Ye are the sons of the living Elohim (God)* the children of the living Elohim ARE the children of Yashar''el as the sand, the scattered north reclaimed in the place of their scattering (Romans 9:26).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-i-will-call-them-my-people-which-were-not-my-people-lo-ammi-regathered'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 2:1 — *Say ye unto your brethren, Ammi; and to your sisters, Ru-hamah* the names of casting-off reversed: not-my-people made my-people, not-pitied made beloved (Romans 9:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-i-will-call-them-my-people-which-were-not-my-people-lo-ammi-regathered'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-9-a-remnant-shall-be-saved-except-a-seed-we-had-been-as-sodom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 10:22 — *yet a remnant of them shall return* the saved remnant is the kept seed of Yashar''el, the survivors of Jacob leaning again on the Holy One (Romans 9:27).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-a-remnant-shall-be-saved-except-a-seed-we-had-been-as-sodom'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 10:23 — *a consumption, even determined, in the midst of all the land* the cutting-short in righteousness is the threshing that preserves the wheat, comfort to the remnant (Romans 9:28).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-a-remnant-shall-be-saved-except-a-seed-we-had-been-as-sodom'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 1:9 — *Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom* the remnant is sheer mercy, a seed preserved when the whole deserved consuming (Romans 9:29).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-a-remnant-shall-be-saved-except-a-seed-we-had-been-as-sodom'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 9:8 — *I have sanctified them for me from the beginning* the saved are set apart before, not chosen after by their response; their salvation reveals what was already true (Romans 9:27).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-a-remnant-shall-be-saved-except-a-seed-we-had-been-as-sodom'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 9:21 — *have kept me a grape of the cluster, and a plant of a great people* the seed Yahuah left, the grape kept from the cluster, the living root of the gathered people (Romans 9:29).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-a-remnant-shall-be-saved-except-a-seed-we-had-been-as-sodom'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=9 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-9-the-stumblingstone-laid-in-zion-they-stumbled-at-the-stone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 8:14 — *he shall be for a sanctuary; but for a stone of stumbling … to both the houses of Yashar''el (Israel)* the same stone is refuge and offence, set for both houses, the stone of Israel''s own (Romans 9:32).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-the-stumblingstone-laid-in-zion-they-stumbled-at-the-stone'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 28:16 — *I lay in Zion for a foundation a stone … a sure foundation: he that believeth shall not make haste* the rock of offence and the precious corner stone are one stone, laid in Zion FOR his people (Romans 9:33).'
  FROM cross_reference_threads t, cross_references x, _s219_r09_lookup sv, _s219_r09_lookup tv
 WHERE t.slug='romans-9-the-stumblingstone-laid-in-zion-they-stumbled-at-the-stone'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=9 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
