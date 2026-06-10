-- ----- fragment: minion_revelation_02.sql (S224 Revelation 2) -----
-- =====================================================================
-- S224 minion — REVELATION 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: REVELATION 2 (29 verses) — the letters to Ephesus, Smyrna, Pergamos, Thyatira.
-- Tag: rv02 (temp view _s224_rv02_lookup).
-- Sort band: floor 9025, step 3 (9025, 9028, 9031, 9034, 9037, 9040, 9043 used; under 9050).
-- Source is ALWAYS the canon Revelation verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: the seven letters are the covenant-faithfulness charge brought to the assemblies
-- of the scattered seed — the SAME charge the prophets brought to the two houses: hold fast the name
-- and the works, do not eat what is sacrificed to idols, do not commit the spiritual fornication that
-- the doctrine of Balaam and the woman Jezebel seduce men into. This is NOT anti-Jewish polemic and
-- NOT a how-to list; it is the Shepherd calling his own to keep his works unto the end. The
-- overcomer's reward in each letter is a restoration-promise: the tree of life in the paradise of
-- Elohim (Eden restored), the hidden manna and the new name, power over the nations with the rod of
-- iron, the morning star.
--
-- WATCHPOINT — 2:9 *which say they are Yahudim (Jews), and are not, but are the synagogue of Satan*:
-- held as a FALSE-CLAIM DIAGNOSTIC, never a charter for anti-Jewish replacement. It is the same
-- measure Paul names in Romans 2:28-29 — *he is not a Yahudi (Jew), which is one outwardly* — those
-- who claim the covenant name while opposing the Messiah and slandering his keepers (the verse names
-- their *blasphemy*). The true Yashar'el (Israel) is the one being sealed and gathered in ch 7. The
-- diagnostic falls on a posture of opposition, not on a people; the persecuted poor-but-rich assembly
-- of Smyrna is itself largely the covenant seed.
--
-- Christology: the speaker in each letter is the Formed — *the first and the last, which was dead,
-- and is alive* (2:8 / Isaiah 44:6), *the Son of Elohim (God), who hath his eyes like unto a flame
-- of fire, and his feet are like fine brass* (2:18 / Daniel 10:6), who receives the rod-of-iron
-- authority *of my Father* (2:27 / Psalm 2:7-9) — Yahuah and yet having a Father, never collapsed,
-- never co-equal-persons grammar. Preserved exactly as the pull gives.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   Ephesus: holdeth the seven stars, left thy first love, hatest the Nicolaitans
--           Tanakh: none warranted (the load-bearing root is the tree-of-life PROMISE at v.7)
--           Extras: none warranted   NT: none warranted (the v.1 lampstand/stars carry to ch 1's thread)
--   v.7     the tree of life in the midst of the paradise of Elohim
--           Tanakh: Genesis 2:9 (the tree of life in the midst of the garden), Ezekiel 47:12 (the
--                   trees whose leaf fadeth not, for meat and medicine)
--           Extras: 1 Enoch 24:4 (the fragrant tree by the throne), 24:11 (its fruit for life to the
--                   elect, transplanted to the temple)
--           NT: Revelation 22:2 (the tree of life, the leaves for the healing of the nations — Eden
--               restored, the promise kept)
--   v.8     the first and the last, which was dead, and is alive (the Formed)
--           Tanakh: Isaiah 44:6 (I am the first, and I am the last; and beside me there is no Elohim)
--           Extras: none warranted   NT: Revelation 22:13 (I am Alpha and Omega... the first and the last)
--   v.9     they which say they are Yahudim (Jews), and are not — the false-claim diagnostic
--           Tanakh: none warranted (the diagnostic is internal; the prophets' charge carried in prose)
--           Extras: none warranted   NT: Romans 2:28-29 (he is not a Yahudi who is one outwardly)
--   v.13-16 Pergamos: the doctrine of Balaam, the stumblingblock, fornication and idol-meat
--           Tanakh: Numbers 25:1-3 (Yashar'el joined to Baal-peor through whoredom), Numbers 31:16
--                   (these caused Yashar'el to trespass through the counsel of Balaam)
--           Extras: none warranted   NT: none warranted (the prophetic root is the whole weight)
--   v.17    the hidden manna and the white stone with the new name
--           Tanakh: Exodus 16:4 (I will rain bread from heaven), Exodus 16:15 (this is the bread
--                   which Yahuah hath given you to eat)
--           Extras: none warranted   NT: John 6:32 (my Father giveth you the true bread from heaven),
--                   John 6:51 (I am the living bread which came down from heaven)
--   v.20-23 Thyatira: that woman Jezebel, the prophetess who seduces to fornication and idol-meat
--           Tanakh: 1 Kings 16:31 (Ahab took Jezebel and served Baal), 1 Kings 21:25 (Jezebel his
--                   wife stirred him up), 2 Kings 9:22 (the whoredoms and witchcrafts of Jezebel)
--           Extras: none warranted   NT: none warranted
--   v.18    the Son of Elohim, eyes like a flame of fire, feet like fine brass (the Formed)
--           Tanakh: Daniel 10:6 (his eyes as lamps of fire, his feet like polished brass)
--           Extras: none warranted   NT: none warranted (folded into the rod-of-iron thread's Christology prose)
--   v.26-28 power over the nations, rule with a rod of iron, the morning star
--           Tanakh: Psalm 2:8 (ask of me, I shall give thee the heathen for thine inheritance),
--                   Psalm 2:9 (thou shalt break them with a rod of iron), Numbers 24:17 (a Star out
--                   of Jacob, a Sceptre out of Yashar'el — Balaam's own forced blessing)
--           Extras: none warranted   NT: Revelation 22:16 (I am the root and offspring of David, the
--                   bright and morning star — the Giver is himself the gift)
--
-- THREADS (slug -> target libraries):
--   9025 revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2                              (Tanakh + Extras + NT)
--   9028 revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44                      (Tanakh + NT)
--   9031 revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2      (NT)  [BLESSING FLAG]
--   9034 revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25       (Tanakh)
--   9037 revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16                              (Tanakh + NT)
--   9040 revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21                    (Tanakh)
--   9043 revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2                         (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s224_rv02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2
  ('canon', 'revelation', 2, 7, 'canon', 'genesis', 2, 9, 'free', E'*And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* (Genesis 2:9). The promise to him that overcometh reaches all the way back to Eden: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The tree that stood *in the midst of the garden,* barred after the fall, is the very tree set before the overcomer — not a new reward but the old inheritance restored. Paradise is Eden by its Greek name; the Shepherd is calling his own home to the garden Adam was driven from.'),
  ('canon', 'revelation', 2, 7, 'canon', 'ezekiel', 47, 12, 'free', E'*And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* (Ezekiel 47:12). Ezekiel saw the tree of life multiplied into a riverside orchard by the waters from the sanctuary — *whose leaf shall not fade,* the fruit *for meat,* the leaf *for medicine.* This is the same restored Eden the overcomer is promised when he is given *to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The garden barred in Genesis is the garden Ezekiel measures and the garden the letter promises — one unbroken hope of the healed creation.'),
  ('canon', 'revelation', 2, 7, 'enoch', '1-enoch', 24, 4, 'extras', E'*And amongst them was a tree such as I had never yet smelt, neither was any amongst them nor were others like it: it had a fragrance beyond all fragrance, and its leaves and blooms and wood wither not for ever: and its fruit is beautiful, and its fruit resembles the dates of a palm.* (1 Enoch 24:4). The Hebrew library carries the same tree the letter promises — the fragrant tree by the throne-mountain whose *leaves and blooms and wood wither not for ever.* It is the tree of life the overcomer is given *to eat of... which is in the midst of the paradise of Elohim (God)* (Revelation 2:7), set apart by the throne until the day of restoration, the very hope Eden held out and the apocalypse seals.'),
  ('canon', 'revelation', 2, 7, 'enoch', '1-enoch', 24, 11, 'extras', E'*To the righteous it shall be given for food, and its fruit shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King.* (1 Enoch 24:11). Here the restored library says plainly what the letter promises: the fruit of the tree of life *shall be for life to the elect,* given to the righteous and transplanted to the holy place. *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The same elect, the same tree, the same gift of life — the overcomer of Ephesus is the righteous one to whom the fruit is given when Eden is restored at the temple of the Eternal King.'),
  ('canon', 'revelation', 2, 7, 'canon', 'revelation', 22, 2, 'free', E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* (Revelation 22:2). What is promised to the overcomer in the letter is shown fulfilled at the end of the book: the tree of life standing by the river in the new Jerusalem, *the leaves of the tree... for the healing of the nations.* *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The promise of chapter 2 and the vision of chapter 22 are one Eden restored — the garden barred at the beginning thrown open at the end, the curse undone, the tree freely given.'),
  -- thread: revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44
  ('canon', 'revelation', 2, 8, 'canon', 'isaiah', 44, 6, 'free', E'*Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* (Isaiah 44:6). The one who speaks to Smyrna names himself with the divine name of Isaiah: *These things saith the first and the last, which was dead, and is alive* (Revelation 2:8). *I am the first, and I am the last* is Yahuah''s own self-naming, *beside me there is no Elohim (God)* — and the Formed who took it on his own lips is the same one *which was dead, and is alive.* The redeemer-King of Yashar''el (Israel) who is the first and the last is the slain-yet-living Messiah, comforting the persecuted assembly with the name that outlasts death itself.'),
  ('canon', 'revelation', 2, 8, 'canon', 'revelation', 22, 13, 'free', E'*I am Alpha and Omega, the beginning and the end, the first and the last.* (Revelation 22:13). The title the speaker gives Smyrna is the title the book closes on: *the first and the last* (Revelation 2:8). At the end Yahusha (Jesus) says *I am Alpha and Omega... the first and the last,* the same self-naming that opened the letter to the dying assembly. The one who *was dead, and is alive* bears from beginning to end the name of the first and the last — the Formed who holds the keys of death speaking comfort to those who *shall have tribulation ten days.*'),
  -- thread: revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2
  ('canon', 'revelation', 2, 9, 'canon', 'romans', 2, 28, 'free', E'*For he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh:* (Romans 2:28). The letter to Smyrna names a false claim, not a people: *I know the blasphemy of them which say they are Yahudim (Jews), and are not, but are the synagogue of Satan* (Revelation 2:9). Paul holds exactly this measure — *he is not a Yahudi (Jew), which is one outwardly* — the covenant name is not secured by the outward mark when the heart opposes the Messiah and slanders his keepers. The charge falls on a posture of opposition that claims the name while warring against the name''s King, never on the covenant people as such; the persecuted poor-but-rich assembly is itself largely the seed.'),
  ('canon', 'revelation', 2, 9, 'canon', 'romans', 2, 29, 'free', E'*But he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God).* (Romans 2:29). Paul completes the diagnostic the letter assumes: the true Yahudi (Jew) is *one inwardly,* the circumcision *that of the heart, in the spirit.* So when the Messiah says of some that they *say they are Yahudim (Jews), and are not* (Revelation 2:9), he is not unmaking the covenant or handing it to another people — he is naming the gap between the claimed name and the heart that opposes him. The true Yashar''el (Israel) is the one being sealed and gathered later in the book; the false claim is exposed here, the true seed gathered there.'),
  -- thread: revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25
  ('canon', 'revelation', 2, 14, 'canon', 'numbers', 25, 1, 'free', E'*And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab.* (Numbers 25:1). The doctrine of Balaam is named by its first fruit: *thou hast there them that hold the doctrine of Balaam, who taught Balac to cast a stumblingblock before the children of Yashar''el (Israel), to eat things sacrificed unto idols, and to commit fornication* (Revelation 2:14). What Balaam could not do by cursing he did by counsel — drawing Yashar''el (Israel) into *whoredom with the daughters of Moab,* the joining of bed and altar that is at once bodily fornication and the spiritual harlotry of idolatry. The same stumblingblock is laid at Pergamos; the charge is the prophets'' charge, covenant-faithlessness, not a new offense.'),
  ('canon', 'revelation', 2, 14, 'canon', 'numbers', 25, 3, 'free', E'*And Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel).* (Numbers 25:3). The whoredom at Shittim was never merely bodily — it was the covenant people *joined... unto Baal-peor,* bound to a foreign god through the snare of the table and the bed. This is the *stumblingblock* the doctrine of Balaam casts, *to eat things sacrificed unto idols, and to commit fornication* (Revelation 2:14). The two sins are one motion: to eat the idol''s meat is to join the idol, spiritual harlotry in the costume of fellowship. The letter brings the Numbers charge forward unbroken — the same seduction, the same kindled jealousy of Yahuah (LORD) for his own.'),
  ('canon', 'revelation', 2, 14, 'canon', 'numbers', 31, 16, 'free', E'*Behold, these caused the children of Yashar''el (Israel), through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor, and there was a plague among the congregation of Yahuah (LORD).* (Numbers 31:16). Here scripture names Balaam as the architect of the snare he could not speak as a curse: it was *through the counsel of Balaam* that Yashar''el (Israel) was caused *to commit trespass against Yahuah (LORD) in the matter of Peor.* This is precisely *the doctrine of Balaam, who taught Balac to cast a stumblingblock* (Revelation 2:14). The prophet who was forced to bless turned to teaching the seduction instead — and his doctrine, the counsel that draws the covenant people into idol-fornication, is the very thing the Messiah hates at Pergamos.'),
  -- thread: revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16
  ('canon', 'revelation', 2, 17, 'canon', 'exodus', 16, 4, 'free', E'*Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* (Exodus 16:4). The hidden manna promised to the overcomer reaches back to the wilderness bread: *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17). The bread Yahuah (LORD) *rained from heaven* to *prove them, whether they will walk in my law,* a pot of which was hidden away before the Testimony, is the very provision held in store for the one who keeps the works unto the end — the table of heaven set against the idol-table the doctrine of Balaam offered.'),
  ('canon', 'revelation', 2, 17, 'canon', 'exodus', 16, 15, 'free', E'*And when the children of Yashar''el (Israel) saw it, they said one to another, It is manna: for they wist not what it was. And Moses said unto them, This is the bread which Yahuah (LORD) hath given you to eat.* (Exodus 16:15). The manna was *the bread which Yahuah (LORD) hath given you to eat* — heaven''s own food in the wilderness, a portion of it laid up before the Testimony to be kept for the generations. *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17): the bread that fed the fathers, hidden and reserved, becomes the overcomer''s reward, set over against the things sacrificed unto idols that Pergamos was tempted to eat.'),
  ('canon', 'revelation', 2, 17, 'canon', 'john', 6, 32, 'free', E'*Then Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven.* (John 6:32). The Messiah himself reads the manna forward to its truth: *my Father giveth you the true bread from heaven* (John 6:32). So the hidden manna promised the overcomer — *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17) — is no mere relic of the wilderness but the true bread the Father gives, the manna kept in store now opened to the one who overcomes; the wilderness loaf and the living bread are one provision.'),
  ('canon', 'revelation', 2, 17, 'canon', 'john', 6, 51, 'free', E'*I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* (John 6:51). The hidden manna of the letter finds its name in the Messiah''s own mouth: *I am the living bread which came down from heaven... if any man eat of this bread, he shall live for ever* (John 6:51). The bread laid up before the Testimony pointed forward to him; *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17) is the promise of the living bread himself, the food that does not perish, the table of life set against the table of idols at Pergamos.'),
  -- thread: revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21
  ('canon', 'revelation', 2, 20, 'canon', '1-kings', 16, 31, 'free', E'*And it came to pass, as if it had been a light thing for him to walk in the sins of Jeroboam the son of Nebat, that he took to wife Jezebel the daughter of Ethbaal king of the Zidonians, and went and served Baal, and worshipped him.* (1 Kings 16:31). The name the Messiah lays on Thyatira is the name of Ahab''s queen, who brought Baal into the house of Yashar''el (Israel): Ahab *took to wife Jezebel the daughter of Ethbaal... and went and served Baal.* So *that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants to commit fornication, and to eat things sacrificed unto idols* (Revelation 2:20) wears the historic Jezebel''s very office — the seductress who turns the covenant people to the idol''s bed and the idol''s table. The charge is the prophets'' charge against Baal-worship, brought forward into the assembly.'),
  ('canon', 'revelation', 2, 20, 'canon', '1-kings', 21, 25, 'free', E'*But there was none like unto Ahab, which did sell himself to work wickedness in the sight of Yahuah (LORD), whom Jezebel his wife stirred up.* (1 Kings 21:25). Scripture marks Jezebel as the one *whom* Ahab was *stirred up* by — the active seducer behind the throne''s wickedness, the prophets of Baal at her table, Naboth murdered by her letters. The Messiah names Thyatira''s teacher *that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants* (Revelation 2:20): the same office of seduction, a self-claimed prophetess turning servants to fornication and idol-meat. The first Jezebel stirred a king to Baal; this one would stir the assembly — the same spiritual harlotry the prophets withstood.'),
  ('canon', 'revelation', 2, 20, 'canon', '2-kings', 9, 22, 'free', E'*And it came to pass, when Joram saw Jehu, that he said, Is it peace, Jehu? And he answered, What peace, so long as the whoredoms of thy mother Jezebel and her witchcrafts are so many?* (2 Kings 9:22). Jehu names what Jezebel was — *the whoredoms... and her witchcrafts* — the spiritual harlotry and sorcery that defiled the house of Yashar''el (Israel) and brought the prophets'' judgment down. The same is set before Thyatira in *that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants to commit fornication, and to eat things sacrificed unto idols* (Revelation 2:20). To name the seducer *Jezebel* is to name the whole pattern — idolatry as harlotry against Yahuah (LORD) — and to warn that, as of old, *I gave her space to repent of her fornication; and she repented not* (Revelation 2:21).'),
  -- thread: revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2
  ('canon', 'revelation', 2, 26, 'canon', 'psalms', 2, 8, 'free', E'*Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession.* (Psalm 2:8). The promise to the overcomer is the inheritance the Father swore to his Anointed: *And he that overcometh, and keepeth my works unto the end, to him will I give power over the nations* (Revelation 2:26). What Yahuah (LORD) said to his Son — *Ask of me, and I shall give thee the heathen for thine inheritance* — the Son shares with the one who keeps his works to the end. The overcomer is brought into the very dominion of Psalm 2, ruling with the King who received the nations from his Father.'),
  ('canon', 'revelation', 2, 27, 'canon', 'psalms', 2, 9, 'free', E'*Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* (Psalm 2:9). The letter quotes the Psalm almost word for word: *And he shall rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers: even as I received of my Father* (Revelation 2:27). The *rod of iron* and the *potter''s vessel* are Psalm 2''s, the authority Yahuah (LORD) gave his Anointed over the raging nations — and the Messiah says he received it *of my Father* and gives it to the overcomer. The Formed who holds the rod has a Father from whom he received it; the dominion is shared down to those who keep his works.'),
  ('canon', 'revelation', 2, 28, 'canon', 'numbers', 24, 17, 'free', E'*I shall see him, but not now: I shall behold him, but not nigh: there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* (Numbers 24:17). The morning star given to the overcomer — *And I will give him the morning star* (Revelation 2:28) — was foretold by Balaam himself, the very prophet whose doctrine seduces at Pergamos: *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel).* The seer of the idol-counsel was forced to behold the rising Star and Sceptre of the true King. The overcomer who refuses Balaam''s stumblingblock is given the Star that Balaam could only see afar — the King out of Jacob, who is himself the gift.'),
  ('canon', 'revelation', 2, 28, 'canon', 'revelation', 22, 16, 'free', E'*I Yahusha (Jesus) have sent mine angel to testify unto you these things in the churches. I am the root and the offspring of David, and the bright and morning star.* (Revelation 22:16). The morning star promised the overcomer is the Messiah himself: *I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16). So *And I will give him the morning star* (Revelation 2:28) is the gift of the Giver — the overcomer is given Yahusha (Jesus), the Star out of Jacob, the root and offspring of David. The Sceptre Balaam foresaw and the rod of Psalm 2 and the morning star are one King, given to those who keep his works unto the end.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s224_rv02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s224_rv02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2',
       E'The tree of life in the midst of the paradise of Elohim (God) — Eden restored (Genesis 2)',
       E'The first letter ends with the oldest promise of all: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). Paradise is Eden by its Greek name, and the tree is the very tree of Genesis: *the tree of life also in the midst of the garden* (Genesis 2:9). The tree barred to Adam after the fall is set before the overcomer — not a new reward but the old inheritance opened again. Ezekiel saw it multiplied into a riverside orchard by the waters from the sanctuary: *all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the fruit thereof shall be for meat, and the leaf thereof for medicine* (Ezekiel 47:12). The restored library carries the same tree — the fragrant tree by the throne-mountain whose *leaves and blooms and wood wither not for ever* (1 Enoch 24:4), whose fruit *shall be for life to the elect; it shall be transplanted to the holy place, to the temple of Yahuah (God), the Eternal King* (1 Enoch 24:11). And the book itself shows the promise kept at the end: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). Genesis bars the tree; Ezekiel and the seer of Enoch behold it reserved; the letter promises it; the new Jerusalem throws it open. It is one unbroken hope — Eden brought to its consummation, the curse undone, the tree freely given to the one who keeps the works unto the end.',
       sv.verse_id, ev.verse_id, 'extras', 9025
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44',
       E'The first and the last, which was dead, and is alive — the Formed who bears the divine name (Isaiah 44)',
       E'To the persecuted assembly at Smyrna the speaker names himself with the divine name of Isaiah: *These things saith the first and the last, which was dead, and is alive* (Revelation 2:8). *I am the first, and I am the last* is Yahuah''s own self-designation — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6). The redeemer-King of Yashar''el (Israel) who bears that name is here the one *which was dead, and is alive* — the Formed who took the divine name on his own lips and yet died and rose, the slain-yet-living Messiah who holds the keys of death. He bears the name from beginning to end of the book: *I am Alpha and Omega, the beginning and the end, the first and the last* (Revelation 22:13). To Smyrna, told *ye shall have tribulation ten days,* the comfort is the name that outlasts death itself: the One who was dead and is alive is the first and the last, beside whom there is no other.',
       sv.verse_id, ev.verse_id, 'free', 9028
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2',
       E'They which say they are Yahudim (Jews), and are not — the false-claim diagnostic, not a charter for replacement (Romans 2)',
       E'This verse has been turned into a weapon against the covenant people, and the turning misreads what it says. *I know the blasphemy of them which say they are Yahudim (Jews), and are not, but are the synagogue of Satan* (Revelation 2:9). Read it as the Messiah speaks it: a false-claim diagnostic, not a charter for anti-Jewish replacement. The charge is on *the blasphemy* — the slander against the persecuted assembly — and on a claim to the covenant name held by those whose hearts oppose the name''s King. Paul holds exactly this measure: *he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh* (Romans 2:28); *but he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God)* (Romans 2:29). The outward mark does not secure the name when the heart wars against the Messiah and his keepers. So *say they are Yahudim (Jews), and are not* is not the unmaking of the covenant, and it is not the handing of Yashar''el''s (Israel''s) name to some other people — it is the naming of the gap between a claimed name and a heart in opposition. The true Yashar''el (Israel) is not erased here; it is the very seed being sealed and gathered later in the book — the twelve tribes named one by one, the great multitude gathered home. The false claim is exposed in this letter; the true seed is gathered in the chapters to come. To read the verse as a license for replacement is to make it deny the very gathering the book is moving toward.',
       sv.verse_id, ev.verse_id, 'free', 9031
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25',
       E'The doctrine of Balaam — the stumblingblock of idol-meat and spiritual harlotry (Numbers 25)',
       E'The charge against Pergamos is named from the Torah: *thou hast there them that hold the doctrine of Balaam, who taught Balac to cast a stumblingblock before the children of Yashar''el (Israel), to eat things sacrificed unto idols, and to commit fornication* (Revelation 2:14). What Balaam could not accomplish by cursing he accomplished by counsel — *And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab* (Numbers 25:1), until *Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel)* (Numbers 25:3). The whoredom and the idol-joining are one motion: to eat at the idol''s table and to lie in the idol''s bed is to be bound to the idol — bodily fornication and spiritual harlotry together. And scripture marks Balaam as the architect of the snare: *these caused the children of Yashar''el (Israel), through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor* (Numbers 31:16). The prophet forced to bless turned to teaching the seduction. This is *the doctrine of Balaam* — and it is the prophets'' own charge of covenant-faithlessness, not a new offense: the covenant people drawn from their faithfulness by the lure of the idol-feast. The Messiah hates at Pergamos exactly what kindled Yahuah''s (LORD''s) jealousy at Shittim, and calls *Repent; or else I will come unto thee quickly, and will fight against them with the sword of my mouth* (Revelation 2:16).',
       sv.verse_id, ev.verse_id, 'free', 9034
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16',
       E'The hidden manna — the bread from heaven kept in store, fulfilled in the living bread (Exodus 16)',
       E'Against the idol-meat the doctrine of Balaam offered, the overcomer is promised the true food: *To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17). The manna is the wilderness bread of Exodus: *Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no* (Exodus 16:4) — *This is the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15). A pot of that manna was *laid up before the Testimony, to be kept,* hidden in the holy place; that hidden manna is held in store for the one who keeps the works unto the end. And the Messiah himself reads the manna forward to its truth: *Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (John 6:32); *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51). So the hidden manna is no mere relic of the wilderness — it is the living bread himself, the food that does not perish, the table of life set against the table of idols at Pergamos. The overcomer who refuses the idol-feast is given the bread of heaven, and *a white stone, and in the stone a new name written, which no man knoweth saving he that receiveth it* (Revelation 2:17).',
       sv.verse_id, ev.verse_id, 'free', 9037
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21',
       E'That woman Jezebel, which calleth herself a prophetess — the seductress to idolatry named again (1 Kings 21)',
       E'The teacher the Messiah charges at Thyatira wears a historic name: *Notwithstanding I have a few things against thee, because thou sufferest that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants to commit fornication, and to eat things sacrificed unto idols* (Revelation 2:20). The first Jezebel brought Baal into the house of Yashar''el (Israel): Ahab *took to wife Jezebel the daughter of Ethbaal king of the Zidonians, and went and served Baal, and worshipped him* (1 Kings 16:31). She was the active seducer behind the throne''s wickedness — *there was none like unto Ahab, which did sell himself to work wickedness in the sight of Yahuah (LORD), whom Jezebel his wife stirred up* (1 Kings 21:25) — her prophets of Baal at her table, Naboth murdered by her letters. And Jehu named what she was: *What peace, so long as the whoredoms of thy mother Jezebel and her witchcrafts are so many?* (2 Kings 9:22). To call Thyatira''s teacher *Jezebel* is to name the whole pattern — idolatry as harlotry against Yahuah (LORD), seduction of the covenant people to the idol''s bed and the idol''s table, the very thing the prophets withstood with fire and sword. The same charge the prophets brought to Samaria is brought to the assembly, and the same patience precedes the same judgment: *I gave her space to repent of her fornication; and she repented not* (Revelation 2:21).',
       sv.verse_id, ev.verse_id, 'free', 9040
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2',
       E'Rule them with a rod of iron, and the morning star — the overcomer brought into the Anointed''s dominion (Psalm 2)',
       E'The reward to the overcomer at Thyatira is the inheritance of the Anointed himself: *And he that overcometh, and keepeth my works unto the end, to him will I give power over the nations: and he shall rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers: even as I received of my Father* (Revelation 2:26-27). The words are Psalm 2''s, where Yahuah (LORD) speaks to his Son: *Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession* (Psalm 2:8); *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9). The Messiah says he received this dominion *of my Father* — the Formed who holds the rod has a Father from whom he received it — and he shares it with the one who keeps his works to the end. Then: *And I will give him the morning star* (Revelation 2:28). That star was foretold by Balaam himself, the very prophet whose doctrine seduces at Pergamos: *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)* (Numbers 24:17). The seer of the idol-counsel was forced to behold the rising Star and Sceptre of the true King. And the Star is the Messiah himself: *I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16). So the rod of Psalm 2, the Sceptre Balaam foresaw, and the morning star are one King — and the overcomer who refuses the idol-stumblingblock is given the King himself, the Giver who is the gift.',
       sv.verse_id, ev.verse_id, 'free', 9043
  FROM _s224_rv02_lookup sv, _s224_rv02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='revelation' AND ev.chapter_number=2 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *the tree of life also in the midst of the garden* the tree barred to Adam after the fall, set before the overcomer; paradise is Eden restored (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 47:12 — *whose leaf shall not fade... the fruit thereof for meat, and the leaf thereof for medicine* the tree of life multiplied by the sanctuary waters, the restored Eden the overcomer is promised (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 24:4 — *its leaves and blooms and wood wither not for ever* the fragrant tree by the throne-mountain, the same tree of life reserved for the day of restoration (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 24:11 — *its fruit shall be for life to the elect; it shall be transplanted to the holy place* the restored library says plainly the tree''s fruit is given to the elect, as the letter promises the overcomer (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=24 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 22:2 — *the tree of life... and the leaves of the tree were for the healing of the nations* the promise of ch 2 shown fulfilled in the new Jerusalem; Eden thrown open at the end (Revelation 2:7).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-tree-of-life-in-the-paradise-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:6 — *I am the first, and I am the last; and beside me there is no Elohim (God)* Yahuah''s own self-naming, taken on the lips of the one *which was dead, and is alive*; the Formed bearing the divine name (Revelation 2:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:13 — *I am Alpha and Omega... the first and the last* the same self-naming closing the book, the title that opened the letter to Smyrna (Revelation 2:8).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-first-and-the-last-which-was-dead-and-is-alive-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 2:28 — *he is not a Yahudi (Jew), which is one outwardly* Paul''s same measure: the covenant name is not secured by the outward mark when the heart opposes the Messiah (Revelation 2:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:29 — *he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart* the true Yahudi is inward; the false claim is the gap between name and heart, not the unmaking of the covenant (Revelation 2:9).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-they-which-say-they-are-jews-and-are-not-the-false-claim-diagnostic-romans-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:1 — *the people began to commit whoredom with the daughters of Moab* the first fruit of Balaam''s counsel, the joining of bed and altar the stumblingblock casts (Revelation 2:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:3 — *Yashar''el (Israel) joined himself unto Baal-peor* the whoredom was spiritual harlotry, the covenant people bound to a foreign god; idol-meat and fornication are one motion (Revelation 2:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 31:16 — *through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor* scripture names Balaam the architect of the snare he could not speak as a curse; this is *the doctrine of Balaam* (Revelation 2:14).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-doctrine-of-balaam-the-stumblingblock-of-spiritual-harlotry-numbers-25'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 16:4 — *I will rain bread from heaven for you... that I may prove them, whether they will walk in my law* the wilderness manna, a pot of it hidden before the Testimony, held in store for the overcomer (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 16:15 — *This is the bread which Yahuah (LORD) hath given you to eat* heaven''s own food in the wilderness, set over against the idol-meat Pergamos was tempted to eat (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:32 — *my Father giveth you the true bread from heaven* the Messiah reads the manna forward to its truth; the hidden manna is the true bread the Father gives (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 6:51 — *I am the living bread which came down from heaven... he shall live for ever* the hidden manna named in the Messiah''s own mouth, the food that does not perish (Revelation 2:17).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-the-hidden-manna-and-the-bread-from-heaven-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 16:31 — *he took to wife Jezebel... and went and served Baal* the first Jezebel who brought Baal into the house of Yashar''el (Israel); Thyatira''s teacher wears her office (Revelation 2:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=16 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 21:25 — *whom Jezebel his wife stirred up* the active seducer behind the throne''s wickedness; the same office of seduction set before the assembly (Revelation 2:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 9:22 — *the whoredoms of thy mother Jezebel and her witchcrafts are so many* Jehu names the pattern: idolatry as harlotry against Yahuah (LORD), the prophets'' charge brought to the assembly (Revelation 2:20).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-that-woman-jezebel-who-calleth-herself-a-prophetess-1-kings-21'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:8 — *Ask of me, and I shall give thee the heathen for thine inheritance* the inheritance the Father swore to his Anointed, shared with the overcomer who keeps his works (Revelation 2:26).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:9 — *Thou shalt break them with a rod of iron... like a potter''s vessel* the letter quotes the Psalm nearly word for word; the Messiah received it *of my Father* and shares it (Revelation 2:27).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 24:17 — *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)* the morning star foretold by Balaam himself, whose doctrine seduces at Pergamos; the overcomer is given the Star he saw afar (Revelation 2:28).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:16 — *I am the root and the offspring of David, and the bright and morning star* the morning star is the Messiah himself; the Giver is the gift (Revelation 2:28).'
  FROM cross_reference_threads t, cross_references x, _s224_rv02_lookup sv, _s224_rv02_lookup tv
 WHERE t.slug='revelation-2-rule-them-with-a-rod-of-iron-and-the-morning-star-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
