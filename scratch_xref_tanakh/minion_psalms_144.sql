-- ----- fragment: minion_psalms_144.sql (Psalm 144) -----
-- Chapter: Psalm 144 — DAVID'S BATTLE-BLESSING: *Blessed be Yahuah (LORD) my strength, which teacheth
--   my hands to war* (v.1). The psalm is woven almost entirely from Psalm 18 / 2 Samuel 22 (the rock,
--   the fortress, the descent, the deliverance from strange children), turned into a war-and-blessing
--   prayer. Yahuah is the Rock who teaches the hands to war (vv.1-2); the wondering at the frailty of
--   the son of Adam, his days a shadow that passeth away (vv.3-4); the theophany-cry for the heavens to
--   bow and the One to come down (vv.5-8); the new song for the deliverance of David his servant
--   (vv.9-11); and the closing covenant-blessing of the Torah-keeping people whose Elohim is Yahuah
--   (vv.12-15). The seed-war (the hand of strange children) read forward to the spiritual warfare; the
--   descent read as the coming-down of the Formed One; the blessing read as the Deuteronomy 28 / Leviticus
--   26 shalom of the obedient covenant nation.
-- Tag: ps144   Temp view: _s302_ps144_lookup
-- Sort band: base 25575, step 3 -> threads at 25575, 25578, 25581, 25584, 25587 (5 threads)
-- Source of EVERY row: 'canon','psalms',144,v
--
-- NOTE on "son of Adam" (v.3): the parse reads *or the son of Adam, that thou makest account of him!* — the
--   seed-of-Adam frailty weight, quoted exactly as dump_canon returns it. NO Daniel-7 kaph carve-out applies
--   here (no "like" / "one like"); the near-twin Psalm 8:4 reads identically (*and the son of Adam, that thou
--   visitest him?*). In Psalm 144 the son-of-Adam note is the OTHER face of Psalm 8: not the crowning, but
--   the frailty — *Man is like to vanity: his days are as a shadow that passeth away* (v.4).
--
-- Psalm 144 coverage:
--   v.1-2 (Blessed be Yahuah my strength, which teacheth my hands to war... my fortress; my high tower, and my
--          deliverer; my shield... who subdueth my people under me)
--        NT:     1 Corinthians 10:4 (that spiritual Rock that followed them; and that Rock was Messiah — the Rock
--                that David names as his strength is the Formed One) — THREAD 1
--        Extras: none warranted (no clean parallel; the rock/fortress imagery is fully held by Psalm 18)
--        Tanakh: ★ Psalm 18:2 (Yahuah is my rock, and my fortress, and my deliverer... my high tower); ★ Psalm 18:34
--                (He teacheth my hands to war, so that a bow of steel is broken by mine arms — the near-twin source);
--                Psalm 18:46 (blessed be my rock); Psalm 18:47 (subdueth the people under me) — THREAD 1
--   ★ v.3-4 (Yahuah, what is man, that thou takest knowledge of him! or the son of Adam, that thou makest account
--            of him! Man is like to vanity: his days are as a shadow that passeth away)
--        NT:     James 4:14 (For what is your life? It is even a vapour, that appeareth for a little time, and then
--                vanisheth away) — THREAD 2
--        Extras: none warranted (the frailty-of-flesh motif is fully carried by the Psalter + Job + James)
--        Tanakh: ★ Psalm 8:4 (What is man... and the son of Adam, that thou visitest him? — the near-twin);
--                Job 7:17 (What is man, that thou shouldest magnify him?); Psalm 39:5 (every man at his best state
--                is altogether vanity); Psalm 90:5-6 (they are as a sleep... in the evening it is cut down);
--                Psalm 102:11 (My days are like a shadow that declineth) — THREAD 2
--   v.5-8 (Bow thy heavens, O Yahuah, and come down: touch the mountains, and they shall smoke... shoot out thine
--          arrows... rid me from the hand of strange children)
--        NT:     none warranted distinct (the descent-theophany has no clean single NT member in scope; the
--                forward weave is the Formed-One descent, framed in THREAD 3 prose via Isaiah 64)
--        Extras: none warranted clean
--        Tanakh: ★ Psalm 18:9 (He bowed the heavens also, and came down: and darkness was under his feet);
--                Psalm 18:14 (he sent out his arrows, and scattered them); ★ Isaiah 64:1 (Oh that thou wouldest
--                rend the heavens, that thou wouldest come down, that the mountains might flow down) — THREAD 3
--   v.9-11 (I will sing a new song unto thee, O Elohim... it is he that giveth salvation unto kings; who delivereth
--           David his servant)
--        NT:     ★ Revelation 5:9 (And they sung a new song, saying, Thou art worthy... for thou wast slain) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Psalm 33:3 (Sing unto him a new song; play skilfully with a loud noise) — THREAD 4
--   v.12-15 (That our sons may be as plants grown up... our garners full... no breaking in, nor going out... Happy
--            is that people, whose Elohim is Yahuah)
--        NT:     none warranted (the covenant-blessing picture is Torah-rooted; the forward weave is the shalom of
--                the obedient nation, held in the Tanakh members)
--        Extras: none warranted clean
--        Tanakh: ★ Deuteronomy 28:3-12 (Blessed shalt thou be... the fruit of thy body... thy basket and thy store...
--                no breaking in implied in the head-not-tail blessing); ★ Leviticus 26:3-13 (If ye walk in my
--                statutes... none shall make you afraid... I will walk among you, and... ye shall be my people);
--                ★ Psalm 33:12 (Blessed is the nation whose Elohim is Yahuah) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. psalm-144-yahuah-my-strength-the-rock-that-teacheth-my-hands-to-war — NT (1 Corinthians) + Tanakh (Psalm 18) [free]
--   2. psalm-144-what-is-man-the-son-of-adam-a-shadow-that-passeth-away — NT (James) + Tanakh (Psalm 8, Job, Psalm 39/90/102) [free] (★ the frailty-face of the son of Adam)
--   3. psalm-144-bow-thy-heavens-and-come-down-the-descent-of-the-formed-one — Tanakh (Psalm 18, Isaiah 64) [free]
--   4. psalm-144-i-will-sing-a-new-song-the-deliverance-of-david — NT (Revelation) + Tanakh (Psalm 33) [free]
--   5. psalm-144-happy-the-people-whose-elohim-is-yahuah — Tanakh (Deuteronomy 28, Leviticus 26, Psalm 33) [free]
--
-- Framing notes:
--   ★ THE ROCK THAT TEACHES THE HANDS TO WAR (THREAD 1): *Blessed be Yahuah (LORD) my strength, which teacheth my
--     hands to war, and my fingers to fight* (144:1) is lifted nearly word for word from David's great deliverance
--     psalm: *He teacheth my hands to war, so that a bow of steel is broken by mine arms* (Psalm 18:34). The titles
--     of v.2 — *my fortress; my high tower, and my deliverer; my shield* — are the very titles of *Yahuah (LORD) is
--     my rock, and my fortress, and my deliverer... my high tower* (Psalm 18:2). And David's *strength* and *rock*
--     are the Formed One: *that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians
--     10:4). The war the hands are taught is the seed-war; the One who teaches them is the Rock who is the Messiah.
--   ★ THE FRAILTY-FACE OF THE SON OF ADAM (THREAD 2): where Psalm 8 wonders at the son of Adam CROWNED, Psalm 144
--     wonders at the son of Adam FRAIL: *Yahuah (LORD), what is man, that thou takest knowledge of him! or the son of
--     Adam, that thou makest account of him! Man is like to vanity: his days are as a shadow that passeth away*
--     (144:3-4). The near-twin Psalm 8:4 reads the same opening (*What is man... and the son of Adam, that thou
--     visitest him?*); Job asks it in his anguish (*What is man, that thou shouldest magnify him?* Job 7:17); the
--     Psalter answers it again and again — *verily every man at his best state is altogether vanity* (Psalm 39:5);
--     *in the evening it is cut down, and withereth* (Psalm 90:6); *My days are like a shadow that declineth* (Psalm
--     102:11) — and James carries it forward whole: *For what is your life? It is even a vapour, that appeareth for a
--     little time, and then vanisheth away* (James 4:14). The humility of mortal flesh, the shadow that passeth away.
--   THE DESCENT OF THE FORMED ONE (THREAD 3): *Bow thy heavens, O Yahuah (LORD), and come down: touch the mountains,
--     and they shall smoke* (144:5) is the descent of Psalm 18: *He bowed the heavens also, and came down: and
--     darkness was under his feet* (Psalm 18:9), with the arrows of *he sent out his arrows, and scattered them*
--     (Psalm 18:14) echoed in *shoot out thine arrows, and destroy them* (144:6). Isaiah cries the same theophany:
--     *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy
--     presence* (Isaiah 64:1). The One who bows the heavens and comes down is the Formed Son who appeared and walked
--     in the Tanakh and would take flesh — the divine descent, never the formless Father made visible of Himself.
--   THE NEW SONG AND THE DELIVERANCE OF DAVID (THREAD 4): *I will sing a new song unto thee, O Elohim (God): upon a
--     psaltery and an instrument of ten strings will I sing praises unto thee* (144:9) — the new song of *Sing unto
--     him a new song; play skilfully with a loud noise* (Psalm 33:3), sung at last before the throne: *And they sung
--     a new song, saying, Thou art worthy to take the book... for thou wast slain, and hast redeemed us to Elohim
--     (God) by thy blood* (Revelation 5:9). *It is he that giveth salvation unto kings: who delivereth David his
--     servant* (144:10) — the Davidic deliverance that crowns in the Lion of the tribe of Yahudah, the Root of David.
--   ★ HAPPY THE COVENANT PEOPLE (THREAD 5): the closing blessing-picture — *That our sons may be as plants grown up
--     in their youth... our garners may be full... that there be no breaking in, nor going out... Happy is that
--     people, whose Elohim (God) is Yahuah (LORD)* (144:12-15) — is the Deuteronomy 28 blessing of the obedient
--     covenant nation: *Blessed shall be the fruit of thy body, and the fruit of thy ground, and the fruit of thy
--     cattle* (Deuteronomy 28:4), with *no breaking in* the very *enemies... smitten before thy face* (28:7). It is
--     the Leviticus 26 shalom: *If ye walk in my statutes, and keep my commandments, and do them... none shall make
--     you afraid... I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus
--     26:3,6,12). And it is the beatitude of Psalm 33: *Blessed is the nation whose Elohim (God) is Yahuah (LORD)*
--     (Psalm 33:12). The happy people is the Torah-keeping covenant nation, never a people apart from the statutes.
--   VERSES WITH NO SEPARATE ADD: v.7-8 / v.11 (the hand of strange children, the right hand of falsehood) is the
--     refrain of the deliverance-cry; it is carried within THREAD 3 (the descent-and-rescue) and named in the THREAD 4
--     prose (the deliverance of David), not separately threaded.

CREATE TEMP VIEW _s302_ps144_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- THREAD 1: Yahuah my strength, the Rock that teacheth my hands to war (vv.1-2)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','psalms',144,1,'canon','psalms',18,34,'free',
      E'*He teacheth my hands to war, so that a bow of steel is broken by mine arms* (Psalm 18:34). David''s battle-blessing is lifted nearly word for word from his great deliverance psalm: *Blessed be Yahuah (LORD) my strength, which teacheth my hands to war, and my fingers to fight* (Psalm 144:1). The same Yahuah who broke the bow of steel by his arms teaches the hands to war — the warfare is granted, the strength is given, never the warrior''s own.'),
    ('canon','psalms',144,2,'canon','psalms',18,2,'free',
      E'*Yahuah (LORD) is my rock, and my fortress, and my deliverer; my Elohim (God), my strength, in whom I will trust; my buckler, and the horn of my salvation, and my high tower* (Psalm 18:2). The string of titles in *my goodness, and my fortress; my high tower, and my deliverer; my shield, and he in whom I trust* (Psalm 144:2) is the very string of Psalm 18 — rock, fortress, deliverer, high tower, shield, trust. David names Yahuah by the same names in the day of war as in the day of deliverance.'),
    ('canon','psalms',144,2,'canon','psalms',18,47,'free',
      E'*It is Elohim (God) that avengeth me, and subdueth the people under me* (Psalm 18:47). The close of v.2 — *who subdueth my people under me* — answers Psalm 18''s *subdueth the people under me*: the victory is Yahuah''s doing, the subduing his act, the king set over the people by the hand that teaches him to war.'),
    ('canon','psalms',144,1,'canon','1-corinthians',10,4,'free',
      E'*And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4). David''s *strength* and the *rock* of his deliverance psalm are not a bare metaphor: the Rock that went with Yashar''el (Israel) in the wilderness *was Messiah* — the Formed One. The strength that *teacheth my hands to war* (Psalm 144:1) is the Rock who is the Messiah, the One who appeared and led his people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps144_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps144_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 2 (★): What is man, the son of Adam — a shadow that passeth away (vv.3-4)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','psalms',144,3,'canon','psalms',8,4,'free',
      E'*What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4). The near-twin opens with the same wonder as *Yahuah (LORD), what is man, that thou takest knowledge of him! or the son of Adam, that thou makest account of him!* (Psalm 144:3). Where Psalm 8 goes on to the son of Adam CROWNED with glory, Psalm 144 turns to the son of Adam FRAIL — the two faces of the same question, the dignity and the vanity of the seed of Adam.'),
    ('canon','psalms',144,3,'canon','job',7,17,'free',
      E'*What is man, that thou shouldest magnify him? and that thou shouldest set thine heart upon him?* (Job 7:17). Out of his affliction Job asks the very question of the psalm — *what is man, that thou takest knowledge of him!* (Psalm 144:3) — marvelling that the Most High should magnify so frail a creature, *his days are as a shadow that passeth away* (144:4).'),
    ('canon','psalms',144,4,'canon','psalms',39,5,'free',
      E'*Behold, thou hast made my days as an handbreadth; and mine age is as nothing before thee: verily every man at his best state is altogether vanity. Selah* (Psalm 39:5). *Man is like to vanity: his days are as a shadow that passeth away* (Psalm 144:4) is the same confession: every man, even at his best, *altogether vanity* — the handbreadth of mortal days under the everlasting Yahuah.'),
    ('canon','psalms',144,4,'canon','psalms',90,6,'free',
      E'*In the morning it flourisheth, and groweth up; in the evening it is cut down, and withereth* (Psalm 90:6). The fleeting grass of Moses'' psalm answers *Man is like to vanity: his days are as a shadow that passeth away* (Psalm 144:4): man springs up in the morning and is cut down by evening — the shadow, the grass, the vapour, the brevity of the son of Adam before the eternal Elohim.'),
    ('canon','psalms',144,4,'canon','psalms',102,11,'free',
      E'*My days are like a shadow that declineth; and I am withered like grass* (Psalm 102:11). The very figure of Psalm 144 — *his days are as a shadow that passeth away* (144:4) — is wept in the affliction-psalm: *My days are like a shadow that declineth*. The shadow lengthens and is gone; mortal flesh fades like grass, while *thou, O Yahuah (LORD), shalt endure for ever* (Psalm 102:12).'),
    ('canon','psalms',144,4,'canon','james',4,14,'free',
      E'*Whereas ye know not what shall be on the morrow. For what is your life? It is even a vapour, that appeareth for a little time, and then vanisheth away* (James 4:14). Ya''aqob (James) carries the psalm''s confession forward whole: *Man is like to vanity: his days are as a shadow that passeth away* (Psalm 144:4) — *what is your life? It is even a vapour*. The frailty the psalm names is the rebuke of every boast of tomorrow; the son of Adam is a passing shadow, a vapour that vanisheth.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps144_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps144_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 3: Bow thy heavens and come down — the descent of the Formed One (vv.5-8)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','psalms',144,5,'canon','psalms',18,9,'free',
      E'*He bowed the heavens also, and came down: and darkness was under his feet* (Psalm 18:9). The cry *Bow thy heavens, O Yahuah (LORD), and come down: touch the mountains, and they shall smoke* (Psalm 144:5) prays for the very descent David had already sung in Psalm 18: the heavens bowed, the One come down, the mountains smoking at his presence. The theophany of the deliverance-psalm becomes the prayer of the battle-psalm.'),
    ('canon','psalms',144,6,'canon','psalms',18,14,'free',
      E'*Yea, he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them* (Psalm 18:14). *Cast forth lightning, and scatter them: shoot out thine arrows, and destroy them* (Psalm 144:6) prays the lightning and arrows of Psalm 18 against the enemy — the same weapons of the descending Yahuah, sent to scatter the hand of strange children.'),
    ('canon','psalms',144,5,'canon','isaiah',64,1,'free',
      E'*Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence* (Isaiah 64:1). Yeshayahu (Isaiah) cries the same theophany as *Bow thy heavens, O Yahuah (LORD), and come down: touch the mountains, and they shall smoke* (Psalm 144:5): the heavens rent, the One come down, the mountains melting at his presence. The One who bows the heavens and comes down is the Formed Son who appeared and walked in the Tanakh and would take flesh — the divine descent, the coming-down of the visible Glory.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps144_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps144_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 4: I will sing a new song — the deliverance of David (vv.9-11)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','psalms',144,9,'canon','psalms',33,3,'free',
      E'*Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3). *I will sing a new song unto thee, O Elohim (God): upon a psaltery and an instrument of ten strings will I sing praises unto thee* (Psalm 144:9) takes up the new-song call of the Psalter — *sing unto him a new song* — the fresh praise for a fresh deliverance, the ten-stringed instrument lifted for the salvation given to the king.'),
    ('canon','psalms',144,9,'canon','revelation',5,9,'free',
      E'*And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9). The new song David begins — *I will sing a new song unto thee, O Elohim (God)* (Psalm 144:9) — is sung at last before the throne, to *the Lion of the tribe of Juda, the Root of David* (Revelation 5:5). The deliverance of *David his servant* (144:10) finds its end in the slain Lamb, the Root of David, worthy of the new song of the redeemed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps144_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps144_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 5 (★): Happy the people whose Elohim is Yahuah — the covenant blessing (vv.12-15)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','psalms',144,13,'canon','deuteronomy',28,4,'free',
      E'*Blessed shall be the fruit of thy body, and the fruit of thy ground, and the fruit of thy cattle, the increase of thy kine, and the flocks of thy sheep* (Deuteronomy 28:4). The blessing-picture *That our garners may be full, affording all manner of store: that our sheep may bring forth thousands and ten thousands in our streets* (Psalm 144:13) is the Deuteronomy 28 blessing of the obedient covenant nation — the fruit of the body, the ground, the cattle, the flocks. The shalom of the psalm is the promised increase of the people that hearkens to the voice of Yahuah.'),
    ('canon','psalms',144,14,'canon','deuteronomy',28,7,'free',
      E'*Yahuah (LORD) shall cause thine enemies that rise up against thee to be smitten before thy face: they shall come out against thee one way, and flee before thee seven ways* (Deuteronomy 28:7). *That there be no breaking in, nor going out; that there be no complaining in our streets* (Psalm 144:14) is the peace of the city whose enemies are smitten before her face — no breach in the wall, no captive led out, no cry in the streets: the Deuteronomy 28 safety of the covenant-keeping nation.'),
    ('canon','psalms',144,15,'canon','leviticus',26,12,'free',
      E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:12). *Happy is that people, that is in such a case: yea, happy is that people, whose Elohim (God) is Yahuah (LORD)* (Psalm 144:15) names the blessedness Leviticus promises to the people who *walk in my statutes, and keep my commandments, and do them* (Leviticus 26:3): Yahuah walking among them, *your Elohim (God)*, and they *my people*. The happy people is the Torah-keeping covenant nation, never a people apart from the statutes.'),
    ('canon','psalms',144,15,'canon','psalms',33,12,'free',
      E'*Blessed is the nation whose Elohim (God) is Yahuah (LORD); and the people whom he hath chosen for his own inheritance* (Psalm 33:12). The closing beatitude of Psalm 144 — *happy is that people, whose Elohim (God) is Yahuah (LORD)* (144:15) — is the very beatitude of Psalm 33: *Blessed is the nation whose Elohim (God) is Yahuah*. The blessedness is the chosen inheritance, the covenant people whose Elohim is the One who teaches their hands to war and fills their garners.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps144_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps144_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-144-yahuah-my-strength-the-rock-that-teacheth-my-hands-to-war',
       E'Yahuah my strength — the Rock that teacheth my hands to war',
       E'David opens his battle-psalm with a blessing: *Blessed be Yahuah (LORD) my strength, which teacheth my hands to war, and my fingers to fight: My goodness, and my fortress; my high tower, and my deliverer; my shield, and he in whom I trust; who subdueth my people under me* (Psalm 144:1-2). Every line is lifted from his great deliverance psalm. *He teacheth my hands to war, so that a bow of steel is broken by mine arms* (Psalm 18:34) is the near-twin of the first verse; the string of titles — *Yahuah (LORD) is my rock, and my fortress, and my deliverer... my buckler... and my high tower* (Psalm 18:2) — is the string of the second; and *who subdueth my people under me* answers *It is Elohim (God) that avengeth me, and subdueth the people under me* (Psalm 18:47). The warfare is granted, the strength given, the victory Yahuah''s doing. And the *strength* and the *rock* David names are not a bare figure: *they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4). The Rock who went with Yashar''el (Israel) in the wilderness, the strength that teaches the hands to war, is the Formed One — the One who appeared and led his people, the Messiah who is David''s rock.',
       sv.verse_id, ev.verse_id, 'free', 25575
  FROM _s302_ps144_lookup sv, _s302_ps144_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=144 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-144-what-is-man-the-son-of-adam-a-shadow-that-passeth-away',
       E'What is man, the son of Adam — a shadow that passeth away',
       E'In the midst of the war-prayer comes the wonder of the frail: *Yahuah (LORD), what is man, that thou takest knowledge of him! or the son of Adam, that thou makest account of him! Man is like to vanity: his days are as a shadow that passeth away* (Psalm 144:3-4). It is the question of the sister psalm — *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4) — but turned to its other face. Where Psalm 8 answers with the son of Adam CROWNED with glory, Psalm 144 answers with the son of Adam FRAIL, a shadow, a vanity. Job asks it out of his affliction: *What is man, that thou shouldest magnify him? and that thou shouldest set thine heart upon him?* (Job 7:17). And the Psalter confesses the brevity again and again: *verily every man at his best state is altogether vanity* (Psalm 39:5); *in the evening it is cut down, and withereth* (Psalm 90:6); *My days are like a shadow that declineth; and I am withered like grass* (Psalm 102:11). Ya''aqob (James) carries it forward whole: *what is your life? It is even a vapour, that appeareth for a little time, and then vanisheth away* (James 4:14). That the everlasting Yahuah should take knowledge of so passing a shadow is the marvel; the son of Adam is dust and vapour, and yet the Most High makes account of him.',
       sv.verse_id, ev.verse_id, 'free', 25578
  FROM _s302_ps144_lookup sv, _s302_ps144_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=144 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-144-bow-thy-heavens-and-come-down-the-descent-of-the-formed-one',
       E'Bow thy heavens and come down — the descent of the Formed One',
       E'The psalm cries for the theophany: *Bow thy heavens, O Yahuah (LORD), and come down: touch the mountains, and they shall smoke. Cast forth lightning, and scatter them: shoot out thine arrows, and destroy them... rid me, and deliver me out of great waters, from the hand of strange children* (Psalm 144:5-7). It prays for the very descent David had already sung in his deliverance psalm: *He bowed the heavens also, and came down: and darkness was under his feet* (Psalm 18:9), *he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them* (Psalm 18:14). Yeshayahu (Isaiah) cries the same: *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence* (Isaiah 64:1). The One who bows the heavens and comes down, who touches the mountains till they smoke, is the Formed Son — the visible Glory, the One who appeared and walked and led Yashar''el (Israel) in the Tanakh and would take flesh. The descent is never the formless Father made visible of Himself; it is the coming-down of the Formed One, who scatters the hand of strange children whose *mouth speaketh vanity, and their right hand is a right hand of falsehood* (Psalm 144:8).',
       sv.verse_id, ev.verse_id, 'free', 25581
  FROM _s302_ps144_lookup sv, _s302_ps144_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=144 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-144-i-will-sing-a-new-song-the-deliverance-of-david',
       E'I will sing a new song — the deliverance of David his servant',
       E'For the deliverance granted, a fresh praise: *I will sing a new song unto thee, O Elohim (God): upon a psaltery and an instrument of ten strings will I sing praises unto thee. It is he that giveth salvation unto kings: who delivereth David his servant from the hurtful sword* (Psalm 144:9-10). The new-song call is the Psalter''s own: *Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3) — fresh praise for a fresh deliverance. And the new song David begins is sung at last before the throne, to the One in whom the deliverance of *David his servant* finds its end: *behold, the Lion of the tribe of Juda, the Root of David, hath prevailed* (Revelation 5:5), and *they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9). The salvation given to kings, the deliverance of the servant David, is gathered up in the slain Lamb, the Root of David, who is worthy of the new song of the redeemed.',
       sv.verse_id, ev.verse_id, 'free', 25584
  FROM _s302_ps144_lookup sv, _s302_ps144_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=144 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-144-happy-the-people-whose-elohim-is-yahuah',
       E'Happy the people whose Elohim is Yahuah — the covenant blessing',
       E'The psalm closes on the picture of the blessed covenant nation: *That our sons may be as plants grown up in their youth; that our daughters may be as corner stones, polished after the similitude of a palace: That our garners may be full, affording all manner of store: that our sheep may bring forth thousands and ten thousands in our streets: That our oxen may be strong to labour; that there be no breaking in, nor going out; that there be no complaining in our streets. Happy is that people, that is in such a case: yea, happy is that people, whose Elohim (God) is Yahuah (LORD)* (Psalm 144:12-15). This is the Deuteronomy 28 blessing of the obedient people: *Blessed shall be the fruit of thy body, and the fruit of thy ground, and the fruit of thy cattle, the increase of thy kine, and the flocks of thy sheep* (Deuteronomy 28:4), and the peace of the city whose enemies are *smitten before thy face... and flee before thee seven ways* (Deuteronomy 28:7) — no breaking in, no going out, no cry in the streets. It is the Leviticus 26 shalom promised to the people who *walk in my statutes, and keep my commandments, and do them* (Leviticus 26:3): *none shall make you afraid... And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:6,12). And it is the beatitude of the Psalter: *Blessed is the nation whose Elohim (God) is Yahuah (LORD); and the people whom he hath chosen for his own inheritance* (Psalm 33:12). The happy people is the Torah-keeping covenant nation — never a people blessed apart from the statutes, but the very people who walk in them.',
       sv.verse_id, ev.verse_id, 'free', 25587
  FROM _s302_ps144_lookup sv, _s302_ps144_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=144 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *He teacheth my hands to war, so that a bow of steel is broken by mine arms* (Psalm 18:34) — the near-twin source; 144:1 is lifted from David''s great deliverance psalm.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=1
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-yahuah-my-strength-the-rock-that-teacheth-my-hands-to-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (LORD) is my rock, and my fortress, and my deliverer... my high tower* (Psalm 18:2) — the string of titles in 144:2 (fortress, high tower, deliverer, shield) is the string of Psalm 18.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=2
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-yahuah-my-strength-the-rock-that-teacheth-my-hands-to-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*It is Elohim (God) that avengeth me, and subdueth the people under me* (Psalm 18:47) — answers *who subdueth my people under me* (144:2); the subduing is Yahuah''s act.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=2
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-yahuah-my-strength-the-rock-that-teacheth-my-hands-to-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4) — David''s *strength* and *rock* (144:1) is the Formed One, the Messiah who led Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=1
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-yahuah-my-strength-the-rock-that-teacheth-my-hands-to-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *What is man... and the son of Adam, that thou visitest him?* (Psalm 8:4) — the near-twin; Psalm 8 the son of Adam crowned, Psalm 144 the son of Adam frail.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=3
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-what-is-man-the-son-of-adam-a-shadow-that-passeth-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*What is man, that thou shouldest magnify him?* (Job 7:17) — Job asks the same question out of his affliction; the marvel that the Most High takes knowledge of frail flesh.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=3
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=7 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-what-is-man-the-son-of-adam-a-shadow-that-passeth-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*verily every man at his best state is altogether vanity* (Psalm 39:5) — the handbreadth of days; same confession as *Man is like to vanity* (144:4).'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=4
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-what-is-man-the-son-of-adam-a-shadow-that-passeth-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*in the evening it is cut down, and withereth* (Psalm 90:6) — man springs up in the morning and is cut down by evening; the shadow of 144:4.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=4
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-what-is-man-the-son-of-adam-a-shadow-that-passeth-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*My days are like a shadow that declineth; and I am withered like grass* (Psalm 102:11) — the very figure of 144:4, *his days are as a shadow that passeth away*.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=4
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-what-is-man-the-son-of-adam-a-shadow-that-passeth-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*what is your life? It is even a vapour, that appeareth for a little time, and then vanisheth away* (James 4:14) — carries 144:4 forward; the rebuke of every boast of tomorrow.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=4
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-what-is-man-the-son-of-adam-a-shadow-that-passeth-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *He bowed the heavens also, and came down: and darkness was under his feet* (Psalm 18:9) — the descent 144:5 prays for, already sung in David''s deliverance psalm.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=5
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-bow-thy-heavens-and-come-down-the-descent-of-the-formed-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them* (Psalm 18:14) — the lightning and arrows of 144:6 against the enemy.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=6
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-bow-thy-heavens-and-come-down-the-descent-of-the-formed-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence* (Isaiah 64:1) — the same theophany as 144:5; the coming-down of the Formed One.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=5
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-bow-thy-heavens-and-come-down-the-descent-of-the-formed-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3) — the new-song call of the Psalter; 144:9 fresh praise for a fresh deliverance.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=9
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-i-will-sing-a-new-song-the-deliverance-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *And they sung a new song... for thou wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9) — the new song of 144:9 sung before the throne to the Lion of Yahudah, the Root of David.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=9
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-i-will-sing-a-new-song-the-deliverance-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Blessed shall be the fruit of thy body, and the fruit of thy ground, and the fruit of thy cattle... and the flocks of thy sheep* (Deuteronomy 28:4) — the covenant blessing the full garners and teeming flocks of 144:13 picture.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=13
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-happy-the-people-whose-elohim-is-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thine enemies... shall come out against thee one way, and flee before thee seven ways* (Deuteronomy 28:7) — the peace of *no breaking in, nor going out* (144:14); the safety of the covenant nation.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=14
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-happy-the-people-whose-elohim-is-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:12) — the shalom promised to those who keep the statutes (26:3); the blessedness of 144:15.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=15
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-happy-the-people-whose-elohim-is-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Blessed is the nation whose Elohim (God) is Yahuah (LORD); and the people whom he hath chosen for his own inheritance* (Psalm 33:12) — the very beatitude of 144:15, *happy is that people, whose Elohim is Yahuah*.'
  FROM cross_reference_threads t
  JOIN _s302_ps144_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=144 AND sv.verse_number=15
  JOIN _s302_ps144_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-144-happy-the-people-whose-elohim-is-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
