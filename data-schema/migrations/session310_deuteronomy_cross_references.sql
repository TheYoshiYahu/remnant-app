-- =====================================================================
-- Session 310 — Deuteronomy FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /Users/mtm/Desktop/App/data-schema/migrations/session310_deuteronomy_cross_references.sql
-- =====================================================================

\echo 'session310 — Deuteronomy cross-references starting...'
BEGIN;

-- ----- fragment: minion_deuteronomy_1.sql (Deuteronomy 1) -----
-- Chapter: Deuteronomy 1 — Moses begins to declare the Torah on the plains of Moab, rehearsing the
-- forty-year history to the new generation. Two great currents run the chapter: the appointment of
-- righteous judges (*the judgment is Elohim''s*, 1:17) and the rebellion at Kadesh-barnea — the twelve
-- spies, the refusal to go up, the murmuring *Because Yahuah (LORD) hated us* (1:27), and the sentence
-- that an evil generation should not see the good land. Woven through it is the tender word that
-- Yahuah *bare thee, as a man doth bear his son* (1:31) — the fatherly carrying of His people through
-- the wilderness. The framework: Torah-justice is binding and forward (no respect of persons with
-- Elohim); the barring from the rest is UNBELIEF, the very lesson Hebrews presses on the assembly;
-- the carrying is the Father''s love for His son Yashar''el (the two-house people loved from Egypt);
-- and the presumptuous defeat at Hormah warns against self-willed "obedience" without Him.
-- Tag: deu01   Temp view: _s310_deu01_lookup
-- Sort band: base 24500, step 3 -> threads at 24500, 24503, 24506, 24509, 24512 (5 threads)
-- Source of EVERY row: 'canon','deuteronomy',1,v
--
-- Deuteronomy 1 coverage:
--   v.1-5 (the words Moses spake... began Moses to declare this law) — preface/setting; woven into
--          framing prose; no separate thread forced.
--        NT: none warranted   Extras: none warranted   Tanakh: none warranted (handled in prose)
--   v.6-15 (turn you, take your journey... take you wise men... made them heads over you)
--        NT:     none warranted distinct (the multiplication-as-stars and the appointment are prefatory
--                to the judging-charge of v.16-17 — held in THREAD 1''s setting)
--        Extras: none warranted
--        Tanakh: ★ Genesis 22:17/15:5 (stars of heaven) woven in prose only; appointment recap of
--                Exodus 18 held in prose
--   ★★ v.16-17 (judge righteously between every man and his brother... Ye shall not respect persons in
--          judgment; ye shall hear the small as well as the great... for the judgment is Elohim''s)
--        NT:     ★★ John 7:24 (judge righteous judgment), ★★ Romans 2:11 (no respect of persons with
--                Elohim), ★★ James 2:9 (if ye have respect to persons... convinced of the law as
--                transgressors) — THREAD 1
--        Extras: none warranted (the apocryphal wisdom on just judgment is diffuse; not forced)
--        Tanakh: ★ Leviticus 19:15 (thou shalt not respect the person of the poor, nor honour the
--                person of the mighty), ★ Deuteronomy 16:19 (thou shalt not respect persons, neither
--                take a gift), ★ 2 Chronicles 19:6-7 (ye judge not for man, but for Yahuah... no
--                respect of persons) — THREAD 1
--   ★★ v.22-33 (we will send men before us... ye would not go up, but rebelled... ye murmured... Because
--          Yahuah hated us... Yet in this thing ye did not believe Yahuah Elohaychem)
--        NT:     ★★★ Hebrews 3:19 (they could not enter in because of unbelief), ★★ Hebrews 4:1-2
--                (the word preached did not profit them, not being mixed with faith) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Numbers 14:22-23 (have tempted me now these ten times... shall not see the land),
--                ★ Psalm 95:7-11 (Harden not your heart... I sware... they should not enter into my
--                rest) — THREAD 2
--   ★★ v.31-33 (Yahuah thy Elohim bare thee, as a man doth bear his son... in fire by night... a cloud
--          by day)
--        NT:     ★ Acts 13:18 (about the time of forty years suffered he their manners in the wilderness)
--                — THREAD 3
--        Extras: ★ Wisdom of Solomon 18:3 (thou gavest them a burning pillar of fire, both to be a
--                guide of the unknown journey) — THREAD 3 (the pillar/fire-by-night witness)
--        Tanakh: ★ Hosea 11:1,3 (when Yashar''el was a child... I taught Ephraim also to go, taking them
--                by their arms), ★ Exodus 19:4 (I bare you on eagles'' wings), ★ Isaiah 46:3-4 (borne by
--                me from the belly... I will carry you), ★ Deuteronomy 8:5 (as a man chasteneth his son)
--                — THREAD 3
--   ★ v.34-40 (there shall not one of these men of this evil generation see that good land, save Caleb...
--          but Joshua... your little ones... they shall go in thither)
--        NT:     ★ Hebrews 3:17 (with whom was he grieved forty years?... whose carcases fell in the
--                wilderness) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Numbers 14:24 (my servant Caleb... hath followed me fully), ★ Numbers 14:29-30
--                (Your carcases shall fall in this wilderness... save Caleb... and Joshua) — THREAD 4
--   ★ v.41-45 (We have sinned... we will go up and fight... went presumptuously up into the hill... the
--          Amorites... chased you, as bees do, and destroyed you in Seir, even unto Hormah)
--        NT:     none warranted distinct (self-willed presumption is held in the lateral Numbers weave)
--        Extras: none warranted
--        Tanakh: ★ Numbers 14:40 (we be here, and will go up... for we have sinned), ★ Numbers 14:44-45
--                (they presumed to go up... the Amalekites... smote them... even unto Hormah) — THREAD 5
--   v.46 (ye abode in Kadesh many days) — closing note; held in prose.
--
-- Threads (slug — target libraries):
--   1. deuteronomy-1-the-judgment-is-elohims-respect-not-persons
--      — Tanakh (Leviticus 19, Deuteronomy 16, 2 Chronicles 19) + NT (John 7, Romans 2, James 2) [free]
--      (★★ righteous judgment / no respect of persons = Torah-justice binding and forward)
--   2. deuteronomy-1-ye-would-not-go-up-could-not-enter-for-unbelief
--      — Tanakh (Numbers 14, Psalm 95) + NT (Hebrews 3, Hebrews 4) [free]
--      (★★★ the rest barred by UNBELIEF — Hebrews'' own warning to the assembly)
--   3. deuteronomy-1-as-a-man-doth-bear-his-son
--      — Tanakh (Hosea 11, Exodus 19, Isaiah 46, Deuteronomy 8) + NT (Acts 13) + Extras (Wisdom 18) [extras]
--      (★★ the fatherly carrying of His son Yashar''el through the wilderness)
--   4. deuteronomy-1-this-evil-generation-shall-not-see-the-good-land
--      — Tanakh (Numbers 14) + NT (Hebrews 3) [free]
--      (★ the sentence — carcases fall, only Caleb who wholly followed, and the little ones)
--   5. deuteronomy-1-went-presumptuously-up-and-were-smitten
--      — Tanakh (Numbers 14) [free]
--      (★ the self-willed defeat at Hormah — going up without Him)
--
-- Framing notes:
--   ★★ THE JUDGMENT IS ELOHIM''S (THREAD 1): the charge to the judges — *judge righteously... Ye shall
--      not respect persons in judgment... for the judgment is Elohim''s* (1:16-17) — is the Torah''s own
--      justice (Lev 19:15; Deut 16:19) grounded in the character of Yahuah (2 Chron 19:6-7), and it
--      runs FORWARD unbroken: Yahusha commands *judge righteous judgment* (John 7:24), Paul declares
--      *there is no respect of persons with Elohim* (Romans 2:11), and James seals it AS Torah —
--      respecting persons makes one *convinced of the law as transgressors* (James 2:9). The Torah is
--      not abolished; it is the binding standard the NT presses.
--   ★★★ UNBELIEF BARRED THE REST (THREAD 2): *ye would not go up, but rebelled... ye murmured... Because
--      Yahuah hated us... Yet in this thing ye did not believe Yahuah Elohaychem* (1:26-32). Hebrews
--      names the cause exactly: *they could not enter in because of unbelief* (3:19), the word *not
--      being mixed with faith* (4:2). Psalm 95 sings the same oath (95:11). The lesson is conduct/faith
--      within the covenant, never a cast-off people.
--   ★★ AS A MAN DOTH BEAR HIS SON (THREAD 3): *Yahuah thy Elohim bare thee, as a man doth bear his son*
--      (1:31), leading *in fire by night... a cloud by day* (1:33). Yashar''el is Yahuah''s SON, loved
--      from Egypt (Hosea 11:1) — the two-house people the Father taught to walk (Hosea 11:3), bore on
--      eagles'' wings (Exod 19:4), and carries to old age (Isa 46:3-4). The pillar of fire that guided
--      is witnessed in Wisdom 18:3. Acts 13:18 names the forty-year forbearance.
--   ★ THE EVIL GENERATION (THREAD 4) and ★ HORMAH (THREAD 5): the sentence (Num 14) and the
--      presumptuous defeat — going up *when I am not among you* (1:42) — round out the chapter''s
--      covenant-lawsuit, with Caleb who *wholly followed* and the little ones preserved.

CREATE TEMP VIEW _s310_deu01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): the judgment is Elohim''s — no respect of persons
    ('canon','deuteronomy',1,16,'canon','leviticus',19,15,'free',
      E'*Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). The charge to the judges — *judge righteously between every man and his brother, and the stranger that is with him* (Deuteronomy 1:16) — is the Torah''s own standard of justice: no leaning toward poor or mighty, only *in righteousness shalt thou judge*. Moses rehearses on the plains of Moab the very law Yahuah gave at Sinai.'),
    ('canon','deuteronomy',1,17,'canon','deuteronomy',16,19,'free',
      E'*Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous* (Deuteronomy 16:19). The command *Ye shall not respect persons in judgment; but ye shall hear the small as well as the great* (Deuteronomy 1:17) is reaffirmed later in the same book — the impartial bench is binding Torah, kept free of bribe and favouritism.'),
    ('canon','deuteronomy',1,17,'canon','2-chronicles',19,7,'free',
      E'*Wherefore now let the fear of Yahuah (LORD) be upon you; take heed and do it: for there is no iniquity with Yahuah Eloheinu (the LORD our God), nor respect of persons, nor taking of gifts* (2 Chronicles 19:7). Why must the judge not respect persons? *for the judgment is Elohim''s* (Deuteronomy 1:17). Jehoshaphat charges his judges from the same ground: there is *no respect of persons* with Yahuah, so His bench must mirror His character — *ye judge not for man, but for Yahuah (LORD), who is with you in the judgment* (2 Chronicles 19:6).'),
    ('canon','deuteronomy',1,17,'canon','john',7,24,'free',
      E'*Judge not according to the appearance, but judge righteous judgment* (John 7:24). Yahusha commands the very thing the Torah charged: not by the face of man but by truth. *Ye shall not respect persons in judgment... ye shall not be afraid of the face of man; for the judgment is Elohim''s* (Deuteronomy 1:17) — *judge righteous judgment* is Torah-justice carried forward unbroken.'),
    ('canon','deuteronomy',1,17,'canon','romans',2,11,'free',
      E'*For there is no respect of persons with Elohim (God)* (Romans 2:11). Paul states as bedrock the principle Deuteronomy roots in the bench: *Ye shall not respect persons in judgment... for the judgment is Elohim''s* (Deuteronomy 1:17). Because the judgment belongs to Elohim, and there is no partiality with Him, His people''s judging must be impartial too.'),
    ('canon','deuteronomy',1,17,'canon','james',2,9,'free',
      E'*But if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors* (James 2:9). James seals impartial judgment AS Torah still binding: to respect persons is to be *convinced of the law as transgressors*. The command *Ye shall not respect persons in judgment* (Deuteronomy 1:17) is not abolished — its breach is named sin against the law that stands.'),

    -- THREAD 2 (★★★): ye would not go up — could not enter for unbelief
    ('canon','deuteronomy',1,26,'canon','numbers',14,22,'free',
      E'*Because all those men which have seen my glory, and my miracles, which I did in Egypt and in the wilderness, and have tempted me now these ten times, and have not hearkened to my voice* (Numbers 14:22). The rebellion Moses rehearses — *ye would not go up, but rebelled against the commandment of Yahuah Elohaychem (the LORD your God)* (Deuteronomy 1:26) — is the tenth provocation: men who had seen the glory and still *have not hearkened to my voice*. Unbelief after the miracles is the gravest hardening.'),
    ('canon','deuteronomy',1,32,'canon','numbers',14,23,'free',
      E'*Surely they shall not see the land which I sware unto their fathers, neither shall any of them that provoked me see it* (Numbers 14:23). *Yet in this thing ye did not believe Yahuah Elohaychem (the LORD your God)* (Deuteronomy 1:32) — and the sentence followed the unbelief: those who provoked *shall not see the land*. The good land was barred not by weakness but by the failure to trust the One who *went in the way before you* (1:33).'),
    ('canon','deuteronomy',1,32,'canon','psalms',95,11,'free',
      E'*Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:11). The psalm sings this very Kadesh-barnea unbelief — *Harden not your heart, as in the provocation... in the wilderness* (95:8) — and names the oath: barred *into my rest*. *Yet in this thing ye did not believe Yahuah Elohaychem (the LORD your God)* (Deuteronomy 1:32); the hardened heart could not enter.'),
    ('canon','deuteronomy',1,32,'canon','hebrews',3,19,'free',
      E'*So we see that they could not enter in because of unbelief* (Hebrews 3:19). Hebrews reads the Kadesh rebellion and names the cause exactly as Moses does: *Yet in this thing ye did not believe Yahuah Elohaychem (the LORD your God)* (Deuteronomy 1:32) — *they could not enter in because of unbelief*. The barring from the good land is the standing warning to every generation.'),
    ('canon','deuteronomy',1,32,'canon','hebrews',4,2,'free',
      E'*For unto us was the gospel preached, as well as unto them: but the word preached did not profit them, not being mixed with faith in them that heard it* (Hebrews 4:2). The promise *Behold, Yahuah Elohayka (the LORD thy God) hath set the land before thee: go up and possess it... fear not* (Deuteronomy 1:21) profited nothing because *ye did not believe* (1:32) — *the word preached... not being mixed with faith*. The rest is entered by trust, forfeited by unbelief.'),

    -- THREAD 3 (★★): as a man doth bear his son — the fatherly carrying
    ('canon','deuteronomy',1,31,'canon','hosea',11,1,'free',
      E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1). The carrying *as a man doth bear his son* (Deuteronomy 1:31) is the love of a Father for His SON: Yashar''el is *my son*, loved as a child and called out of Egypt. The wilderness bearing is fatherly love, not mere providence.'),
    ('canon','deuteronomy',1,31,'canon','hosea',11,3,'free',
      E'*I taught Ephraim also to go, taking them by their arms; but they knew not that I healed them* (Hosea 11:3). The image of Deuteronomy 1:31 — Yahuah who *bare thee, as a man doth bear his son, in all the way that ye went* — is Hosea''s tender picture of the Father teaching the child to walk, *taking them by their arms*. Even the northern house, Ephraim, was carried like a son.'),
    ('canon','deuteronomy',1,31,'canon','exodus',19,4,'free',
      E'*Ye have seen what I did unto the Egyptians, and how I bare you on eagles'' wings, and brought you unto myself* (Exodus 19:4). The bearing *as a man doth bear his son, in all the way that ye went* (Deuteronomy 1:31) is the same word from Sinai: *I bare you on eagles'' wings, and brought you unto myself*. He carried the people the whole way to Himself.'),
    ('canon','deuteronomy',1,31,'canon','isaiah',46,4,'free',
      E'*And even to your old age I am he; and even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you* (Isaiah 46:4). The carrying that began in the wilderness — *Yahuah thy Elohim bare thee, as a man doth bear his son* (Deuteronomy 1:31) — never ends: *which are borne by me from the belly... even to hoar hairs will I carry you* (Isaiah 46:3-4). The Father who bore the infant nation bears it to old age.'),
    ('canon','deuteronomy',1,31,'canon','deuteronomy',8,5,'free',
      E'*Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5). The same book holds both sides of the father-son bond: He who *bare thee, as a man doth bear his son* (Deuteronomy 1:31) also *chasteneth thee* as a son (8:5). The wilderness was a father''s carrying AND a father''s discipline.'),
    ('canon','deuteronomy',1,31,'canon','acts',13,18,'free',
      E'*And about the time of forty years suffered he their manners in the wilderness* (Acts 13:18). Paul rehearses the same forty-year forbearance Moses recalls — the Father who *bare thee, as a man doth bear his son, in all the way that ye went, until ye came into this place* (Deuteronomy 1:31). To bear a son is to suffer his manners; Yahuah endured them forty years.'),
    ('canon','deuteronomy',1,33,'apocrypha','the-wisdom-of-solomon',18,3,'extras',
      E'*Instead of which thou gavest them a burning pillar of fire, both to be a guide of the unknown journey, and an harmless sun to entertain them honourably* (Wisdom of Solomon 18:3). The guiding Moses recalls — Yahuah *went in the way before you, to search you out a place to pitch your tents in, in fire by night, to shew you by what way ye should go, and in a cloud by day* (Deuteronomy 1:33) — is witnessed in the restored book: *a burning pillar of fire... to be a guide of the unknown journey*. The fire by night that led the son through the wilderness.'),

    -- THREAD 4 (★): this evil generation shall not see the good land
    ('canon','deuteronomy',1,36,'canon','numbers',14,24,'free',
      E'*But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it* (Numbers 14:24). The exception Moses names — *Save Caleb the son of Jephunneh; he shall see it... because he hath wholly followed Yahuah (LORD)* (Deuteronomy 1:36) — is the word from Numbers: Caleb *had another spirit... and hath followed me fully*. To wholly follow is to inherit; to draw back is to fall in the wilderness.'),
    ('canon','deuteronomy',1,35,'canon','numbers',14,29,'free',
      E'*Your carcases shall fall in this wilderness; and all that were numbered of you, according to your whole number, from twenty years old and upward, which have murmured against me* (Numbers 14:29). The sentence Moses rehearses — *there shall not one of these men of this evil generation see that good land* (Deuteronomy 1:35) — is the oath of Numbers: the murmurers'' *carcases shall fall in this wilderness*. The generation that would not believe could not enter.'),
    ('canon','deuteronomy',1,35,'canon','hebrews',3,17,'free',
      E'*But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:17). Hebrews presses the same evil generation as a warning: *there shall not one of these men of this evil generation see that good land* (Deuteronomy 1:35) — *whose carcases fell in the wilderness*. The grief was forty years long, the bar from rest the fruit of their sin and unbelief.'),

    -- THREAD 5 (★): went presumptuously up and were smitten — Hormah
    ('canon','deuteronomy',1,41,'canon','numbers',14,40,'free',
      E'*And they rose up early in the morning, and gat them up into the top of the mountain, saying, Lo, we be here, and will go up unto the place which Yahuah (LORD) hath promised: for we have sinned* (Numbers 14:40). The about-face Moses recalls — *We have sinned against Yahuah (LORD), we will go up and fight... ye were ready to go up into the hill* (Deuteronomy 1:41) — is the very scene of Numbers: after the sentence, they presume to go up, confessing *we have sinned* yet still self-willed.'),
    ('canon','deuteronomy',1,44,'canon','numbers',14,45,'free',
      E'*Then the Amalekites came down, and the Canaanites which dwelt in that hill, and smote them, and discomfited them, even unto Hormah* (Numbers 14:45). The defeat Moses recalls — *the Amorites, which dwelt in that mountain, came out against you, and chased you, as bees do, and destroyed you in Seir, even unto Hormah* (Deuteronomy 1:44) — is the same rout: going up *when I am not among you* (1:42), the presumptuous were smitten *even unto Hormah*. Self-willed obedience without Him is no obedience.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-1-the-judgment-is-elohims-respect-not-persons',
       E'The judgment is Elohim''s — judge righteously, respect not persons',
       E'Rehearsing the appointment of judges, Moses gives the charge that grounds all righteous justice: *And I charged your judges at that time, saying, Hear the causes between your brethren, and judge righteously between every man and his brother, and the stranger that is with him. Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man; for the judgment is Elohim''s (God''s)* (Deuteronomy 1:16-17). The bench must mirror its Owner — the judgment belongs to Elohim. This is the Torah''s settled standard: *Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15), and *Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift* (Deuteronomy 16:19). Jehoshaphat charges his judges from the same ground: *take heed what ye do: for ye judge not for man, but for Yahuah (LORD), who is with you in the judgment... there is no iniquity with Yahuah Eloheinu (the LORD our God), nor respect of persons, nor taking of gifts* (2 Chronicles 19:6-7). And it runs FORWARD, never abolished: Yahusha commands *Judge not according to the appearance, but judge righteous judgment* (John 7:24); Paul states the bedrock *For there is no respect of persons with Elohim (God)* (Romans 2:11); and James seals it AS binding Torah — *if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors* (James 2:9). Impartial judgment is the character of Yahuah pressed into His people from Sinai to the apostles.',
       sv.verse_id, ev.verse_id, 'free', 24500
  FROM _s310_deu01_lookup sv, _s310_deu01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-1-ye-would-not-go-up-could-not-enter-for-unbelief',
       E'Ye would not go up — they could not enter in because of unbelief',
       E'The spies brought back the good land''s fruit and a true report — *It is a good land which Yahuah Eloheinu (the LORD our God) doth give us* (Deuteronomy 1:25) — yet the people refused: *Notwithstanding ye would not go up, but rebelled against the commandment of Yahuah Elohaychem (the LORD your God): And ye murmured in your tents, and said, Because Yahuah (LORD) hated us, he hath brought us forth out of the land of Egypt, to deliver us into the hand of the Amorites, to destroy us* (1:26-27). Moses names the root: *Yet in this thing ye did not believe Yahuah Elohaychem (the LORD your God), Who went in the way before you, to search you out a place to pitch your tents in, in fire by night... and in a cloud by day* (1:32-33). This was the tenth provocation: *all those men which have seen my glory, and my miracles... have tempted me now these ten times, and have not hearkened to my voice* (Numbers 14:22), and so *they shall not see the land which I sware unto their fathers* (14:23). The psalm sings the oath: *Harden not your heart, as in the provocation... Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:8,11). And Hebrews presses it on the assembly as the standing warning: *So we see that they could not enter in because of unbelief* (Hebrews 3:19); *the word preached did not profit them, not being mixed with faith in them that heard it* (Hebrews 4:2). The land was barred not by giants or walled cities but by the failure to trust the One who *went in the way before you*. The rest is entered by faith — forfeited by unbelief; conduct and faith within the covenant, never a casting-off of the people.',
       sv.verse_id, ev.verse_id, 'free', 24503
  FROM _s310_deu01_lookup sv, _s310_deu01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=1 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-1-as-a-man-doth-bear-his-son',
       E'As a man doth bear his son — the Father carrying Yashar''el through the wilderness',
       E'Against the murmuring that Yahuah *hated* them, Moses sets the truth of the wilderness: *And in the wilderness, where thou hast seen how that Yahuah Elohayka (the LORD thy God) bare thee, as a man doth bear his son, in all the way that ye went, until ye came into this place* (Deuteronomy 1:31) — He *went in the way before you... in fire by night, to shew you by what way ye should go, and in a cloud by day* (1:33). This is the Father carrying His son. Hosea draws the same picture: *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1), *I taught Ephraim also to go, taking them by their arms* (11:3) — the northern house too carried like a son learning to walk. From Sinai it was the same word: *how I bare you on eagles'' wings, and brought you unto myself* (Exodus 19:4); and the carrying never ends — *which are borne by me from the belly, which are carried from the womb... even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you* (Isaiah 46:3-4). The same book holds the discipline that belongs to a father''s love: *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5). Paul rehearses the forty-year forbearance — *about the time of forty years suffered he their manners in the wilderness* (Acts 13:18) — for to bear a son is to suffer his manners. And the restored witness names the guiding fire: *thou gavest them a burning pillar of fire, both to be a guide of the unknown journey* (Wisdom of Solomon 18:3). Yashar''el is the SON whom the Father loved, carried, taught, disciplined, and led — the two-house people borne the whole way home.',
       sv.verse_id, ev.verse_id, 'extras', 24506
  FROM _s310_deu01_lookup sv, _s310_deu01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=1 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-1-this-evil-generation-shall-not-see-the-good-land',
       E'This evil generation shall not see the good land — save Caleb who wholly followed',
       E'The sentence on the unbelief is grievous but bounded: *And Yahuah (LORD) heard the voice of your words, and was wroth, and sware, saying, Surely there shall not one of these men of this evil generation see that good land, which I sware to give unto your fathers, Save Caleb the son of Jephunneh; he shall see it... because he hath wholly followed Yahuah (LORD)* (Deuteronomy 1:34-36). Two are spared and the children preserved: *But Joshua the son of Nun, which standeth before thee, he shall go in thither... Moreover your little ones, which ye said should be a prey... they shall go in thither* (1:38-39). This is the oath of Numbers rehearsed: *Your carcases shall fall in this wilderness; and all that were numbered of you, according to your whole number, from twenty years old and upward, which have murmured against me* (Numbers 14:29); and the exception — *my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land... and his seed shall possess it* (14:24). Hebrews presses the warning on the assembly: *But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:17). To wholly follow Yahuah is to inherit; to draw back in unbelief is to fall short of the rest. The promise stands — it passes to the little ones who *had no knowledge between good and evil* — but the murmuring generation forfeited its own portion.',
       sv.verse_id, ev.verse_id, 'free', 24509
  FROM _s310_deu01_lookup sv, _s310_deu01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=1 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-1-went-presumptuously-up-and-were-smitten',
       E'Went presumptuously up — smitten even unto Hormah, going up without Him',
       E'When the sentence fell, the people swung from refusal to presumption: *Then ye answered and said unto me, We have sinned against Yahuah (LORD), we will go up and fight, according to all that Yahuah Eloheinu (the LORD our God) commanded us. And when ye had girded on every man his weapons of war, ye were ready to go up into the hill* (Deuteronomy 1:41). But Yahuah warned: *Go not up, neither fight; for I am not among you; lest ye be smitten before your enemies* (1:42). They would not hear: *So I spake unto you; and ye would not hear, but rebelled against the commandment of Yahuah (LORD), and went presumptuously up into the hill. And the Amorites, which dwelt in that mountain, came out against you, and chased you, as bees do, and destroyed you in Seir, even unto Hormah* (1:43-44). This is the scene of Numbers: *And they rose up early in the morning, and gat them up into the top of the mountain, saying, Lo, we be here, and will go up... for we have sinned* (Numbers 14:40); *Then the Amalekites came down, and the Canaanites which dwelt in that hill, and smote them, and discomfited them, even unto Hormah* (14:45). The lesson is sharp: self-willed action that runs ahead of Yahuah — *I am not among you* — is not obedience but rebellion in another dress, and it ends in defeat. Then *ye returned and wept before Yahuah (LORD); but Yahuah (LORD) would not hearken to your voice* (1:45). Both the refusal to go up at His word and the rushing up against His word spring from the same unbelief.',
       sv.verse_id, ev.verse_id, 'free', 24512
  FROM _s310_deu01_lookup sv, _s310_deu01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=41
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=1 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15) — the Torah''s standard behind *judge righteously between every man and his brother* (Deuteronomy 1:16).'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-the-judgment-is-elohims-respect-not-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift* (Deuteronomy 16:19) — the same impartial bench reaffirmed later in the book; binding Torah, free of bribe.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-the-judgment-is-elohims-respect-not-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *there is no iniquity with Yahuah Eloheinu (the LORD our God), nor respect of persons, nor taking of gifts* (2 Chronicles 19:7) — the bench mirrors its Owner, *for the judgment is Elohim''s* (Deuteronomy 1:17).'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-the-judgment-is-elohims-respect-not-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Judge not according to the appearance, but judge righteous judgment* (John 7:24) — Yahusha commands the very Torah-justice of Deuteronomy 1:17, not by the face of man but by truth.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-the-judgment-is-elohims-respect-not-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *For there is no respect of persons with Elohim (God)* (Romans 2:11) — Paul''s bedrock; because the judgment is Elohim''s (Deuteronomy 1:17) and He is impartial, His people must judge impartially.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-the-judgment-is-elohims-respect-not-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors* (James 2:9) — impartial judgment named AS binding Torah; its breach is sin against the law that stands (Deuteronomy 1:17).'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-the-judgment-is-elohims-respect-not-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *have tempted me now these ten times, and have not hearkened to my voice* (Numbers 14:22) — the rebellion of Deuteronomy 1:26 was the tenth provocation, by men who had seen the glory.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=26
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-ye-would-not-go-up-could-not-enter-for-unbelief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Surely they shall not see the land which I sware unto their fathers... neither shall any of them that provoked me see it* (Numbers 14:23) — the sentence followed the unbelief of Deuteronomy 1:32.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=32
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-ye-would-not-go-up-could-not-enter-for-unbelief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:11) — the psalm sings the Kadesh oath; the hardened heart (95:8) could not enter, as in Deuteronomy 1:32.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=32
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-ye-would-not-go-up-could-not-enter-for-unbelief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★★ *So we see that they could not enter in because of unbelief* (Hebrews 3:19) — Hebrews names the cause exactly as Moses: *ye did not believe Yahuah Elohaychem* (Deuteronomy 1:32).'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=32
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-ye-would-not-go-up-could-not-enter-for-unbelief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *the word preached did not profit them, not being mixed with faith in them that heard it* (Hebrews 4:2) — the promise *go up and possess it* (Deuteronomy 1:21) profited nothing without faith.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=32
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-ye-would-not-go-up-could-not-enter-for-unbelief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1) — the carrying *as a man doth bear his son* (Deuteronomy 1:31) is a Father''s love for His SON.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=31
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-as-a-man-doth-bear-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I taught Ephraim also to go, taking them by their arms* (Hosea 11:3) — the Father teaching the child to walk; even the northern house carried like a son (Deuteronomy 1:31).'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=31
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-as-a-man-doth-bear-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *how I bare you on eagles'' wings, and brought you unto myself* (Exodus 19:4) — the same Sinai word: He carried the people the whole way to Himself (Deuteronomy 1:31).'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=31
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-as-a-man-doth-bear-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you* (Isaiah 46:4) — the carrying that began in the wilderness (Deuteronomy 1:31) never ends.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=31
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-as-a-man-doth-bear-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5) — the same book: He who *bare thee... as a man doth bear his son* (1:31) also disciplines as a son.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=31
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-as-a-man-doth-bear-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *about the time of forty years suffered he their manners in the wilderness* (Acts 13:18) — to bear a son is to suffer his manners; Yahuah endured them forty years (Deuteronomy 1:31).'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=31
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-as-a-man-doth-bear-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *thou gavest them a burning pillar of fire, both to be a guide of the unknown journey* (Wisdom of Solomon 18:3) — the restored witness to the *fire by night* that led the son (Deuteronomy 1:33).'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=33
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-as-a-man-doth-bear-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *my servant Caleb, because he had another spirit with him, and hath followed me fully... his seed shall possess it* (Numbers 14:24) — the exception of Deuteronomy 1:36: Caleb who *wholly followed* inherits.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=36
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-this-evil-generation-shall-not-see-the-good-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Your carcases shall fall in this wilderness... which have murmured against me* (Numbers 14:29) — the oath behind *there shall not one of these men of this evil generation see that good land* (Deuteronomy 1:35).'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=35
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-this-evil-generation-shall-not-see-the-good-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:17) — Hebrews presses the evil generation of Deuteronomy 1:35 as a warning to the assembly.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=35
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-this-evil-generation-shall-not-see-the-good-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Lo, we be here, and will go up unto the place which Yahuah (LORD) hath promised: for we have sinned* (Numbers 14:40) — the about-face of Deuteronomy 1:41, presuming to go up after the sentence.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=41
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-went-presumptuously-up-and-were-smitten'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the Amalekites... and the Canaanites... smote them, and discomfited them, even unto Hormah* (Numbers 14:45) — the same rout as Deuteronomy 1:44: going up without Him ends in defeat.'
  FROM cross_reference_threads t
  JOIN _s310_deu01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=1 AND sv.verse_number=44
  JOIN _s310_deu01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-1-went-presumptuously-up-and-were-smitten'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_deuteronomy_2.sql (Deuteronomy 2) -----
--
-- Book: deuteronomy   Chapter: 2   Session prefix: s310   Tag: deu02
-- Temp view: _s310_deu02_lookup
-- Sort band: base 24525, step 3 -> 24525, 24528, 24531, 24534, 24537
--
-- FRAMING: Moses' wilderness recital of the 38 silent years and the apportioning of the
-- nations. The chapter is governed by Yahuah's SOVEREIGN apportioning: he gives Seir to
-- Esau, Ar to Moab, the Ammonite land to the children of Lot — boundaries Yashar'el may not
-- transgress (Deut 32:8, the bounds of the people) — even as he hardens Sihon's heart and
-- gives him into Yashar'el's hand (the same pattern as Pharaoh; Rom 9:18). Weave: the
-- election-by-purpose of Jacob over Esau (Rom 9), the wilderness generation consumed (Heb 3),
-- and the dread of Yahuah's people falling on the nations (Exod 15 / Josh 2). No extras
-- members warranted; the witnesses are all canon-lateral and NT-forward.
--
-- Deuteronomy 2 coverage:
--   v.1-3   NT: none warranted   Extras: none warranted   Tanakh: woven into Seir thread (turning northward, mount Seir)
--   v.4-5   NT: Rom 9:10-13 (Jacob/Esau election), Heb 12:16-17 (Esau profane, rejected)
--           Extras: none warranted
--           Tanakh: Gen 36:8 (Esau is Edom, dwelt in Seir), Deut 32:8 (bounds of the people), Josh 24:4 (gave Esau mount Seir)
--   v.6-7   NT: none warranted   Extras: none warranted   Tanakh: folded into Seir thread (wilderness provision, lacked nothing)
--   v.8     NT/Extras/Tanakh: none warranted (itinerary)
--   v.9     NT: none warranted   Extras: none warranted   Tanakh: Gen 19:37 (Moab, son of Lot)  [Moab/Ammon thread]
--   v.10-13 NT/Extras: none warranted   Tanakh: none warranted (giant ethnography / brook Zered)
--   v.14    NT: Heb 3:17 (carcases fell in the wilderness)
--           Extras: none warranted
--           Tanakh: Num 14:34-35 (forty years, consumed), Ps 95:10-11 (grieved, not enter rest)  [38-years thread]
--   v.15-23 NT: none warranted (v.15 folded into 38-years thread)   Extras: none warranted
--           Tanakh: Gen 19:38 (Ammon, son of Lot) folded into Moab/Ammon thread (v.19)
--   v.19    NT: none warranted   Extras: none warranted   Tanakh: Gen 19:38 (Ben-ammi, children of Lot)
--   v.24    NT: none warranted   Extras: none warranted   Tanakh: folded into Sihon thread (given into thine hand)
--   v.25    NT: none warranted   Extras: none warranted   Tanakh: Exod 15:14-16 (the nations tremble), Josh 2:9-10 (terror fallen on us)  [dread thread]
--   v.26-29 NT/Extras/Tanakh: none warranted (words of peace itinerary)
--   v.30    NT: Rom 9:18 (whom he will he hardeneth)
--           Extras: none warranted
--           Tanakh: Exod 4:21 / Exod 9:12 (Pharaoh's heart), Josh 11:20 (harden their hearts)  [Sihon thread]
--   v.31-37 NT/Extras/Tanakh: none warranted (battle narrative, folded into Sihon thread)
--
-- Threads (5):
--   deuteronomy-2-i-have-given-mount-seir-unto-esau (24525) — free — Gen 36:8, Deut 32:8, Josh 24:4 (Tanakh); Rom 9:11/9:13, Heb 12:16 (NT)
--   deuteronomy-2-ar-given-unto-the-children-of-lot (24528) — free — Gen 19:37, Gen 19:38 (Tanakh)
--   deuteronomy-2-thirty-and-eight-years-the-men-of-war-wasted-out (24531) — free — Num 14:34, Num 14:35, Ps 95:10, Ps 95:11 (Tanakh); Heb 3:17 (NT)
--   deuteronomy-2-yahuah-hardened-sihons-spirit (24534) — free — Exod 4:21, Exod 9:12, Josh 11:20 (Tanakh); Rom 9:18 (NT)
--   deuteronomy-2-the-dread-of-thee-upon-the-nations (24537) — free — Exod 15:14, Exod 15:16, Josh 2:9, Josh 2:10 (Tanakh)
--
-- Contested/load-bearing framing:
--   * v.4-5 + Rom 9:10-13: election by Yahuah's PURPOSE and conduct (Esau the profane person,
--     Heb 12:16, who despised the birthright), NOT ethnic spite — the seed line carried by the
--     paternal-blood-AND-covenant-word together. Deut 32:8 grounds it: the bounds of the
--     people are set "according to the number of the children of Yashar'el."
--   * v.30 + Rom 9:18: Sihon's hardening is the SAME pattern as Pharaoh (Exod 4:21 / 9:12) and
--     the Canaanite kings (Josh 11:20) — Yahuah's sovereign hand, never arbitrary cruelty;
--     framed as judicial delivering-up of an obstinate king, the lens of Rom 9:18.

CREATE TEMP VIEW _s310_deu02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- CROSS-REFERENCES
-- ============================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: I have given mount Seir unto Esau (v.4-7)
    ('canon','deuteronomy',2,5,'canon','genesis',36,8,'free',
      E'*Thus dwelt Esau in mount Seir: Esau is Edom.* (Genesis 36:8). Deuteronomy 2:5 honours that ancient grant — *I will not give you of their land, no, not so much as a foot breadth; because I have given mount Seir unto Esau for a possession* — Yahuah''s sovereign apportioning of the nations stands generations later, the brother-kin of Yashar''el unmolested.'),
    ('canon','deuteronomy',2,5,'canon','deuteronomy',32,8,'free',
      E'*When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* (Deuteronomy 32:8). The *foot breadth* Yashar''el may not take from Esau (Deuteronomy 2:5) is the boundary Yahuah himself fixed — the apportioning of all the nations is measured around his covenant people.'),
    ('canon','deuteronomy',2,5,'canon','joshua',24,4,'free',
      E'*And I gave unto Isaac Jacob and Esau: and I gave unto Esau mount Seir, to possess it; but Jacob and his children went down into Egypt.* (Joshua 24:4). Joshua''s covenant-renewal recites the same grant Moses guards in Deuteronomy 2:5, *I have given mount Seir unto Esau for a possession* — the seed line split, each given his portion by Yahuah.'),
    ('canon','deuteronomy',2,5,'canon','romans',9,11,'free',
      E'*(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* (Romans 9:11). The division of the brothers — Yashar''el to inherit, Esau given Seir apart (Deuteronomy 2:4-5) — rests on Yahuah''s purpose of election, the seed of promise carried in Jacob by Yahuah''s call, not by works.'),
    ('canon','deuteronomy',2,4,'canon','romans',9,13,'free',
      E'*As it is written, Jacob have I loved, but Esau have I hated.* (Romans 9:13). Moses commands Yashar''el to *take ye good heed unto yourselves* among *the children of Esau* (Deuteronomy 2:4) — the elder serves outside the covenant line, the younger carries the seed; conduct and Yahuah''s purpose, not ethnic spite, sets the two apart.'),
    ('canon','deuteronomy',2,5,'canon','hebrews',12,16,'free',
      E'*Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* (Hebrews 12:16). Esau possesses Seir but not the birthright (Deuteronomy 2:5); the New Testament names him the *profane person* who despised the covenant inheritance — why the seed promise runs through Jacob, not the firstborn.'),
    -- THREAD 2: Ar / Ammon given unto the children of Lot (v.9, v.19)
    ('canon','deuteronomy',2,9,'canon','genesis',19,37,'free',
      E'*And the firstborn bare a son, and called his name Moab: the same is the father of the Moabites unto this day.* (Genesis 19:37). Deuteronomy 2:9 — *Distress not the Moabites... because I have given Ar unto the children of Lot for a possession* — Yahuah honours the kinship of Lot, Abraham''s nephew, sparing his offspring''s land even though they were born of the cave.'),
    ('canon','deuteronomy',2,19,'canon','genesis',19,38,'free',
      E'*And the younger, she also bare a son, and called his name Ben-ammi: the same is the father of the children of Ammon unto this day.* (Genesis 19:38). Deuteronomy 2:19 — *I will not give thee of the land of the children of Ammon any possession; because I have given it unto the children of Lot for a possession* — the Ammonites'' boundary, like Moab''s, is protected by Yahuah''s remembrance of Lot.'),
    -- THREAD 3: Thirty and eight years / the men of war wasted out (v.14-15)
    ('canon','deuteronomy',2,14,'canon','numbers',14,34,'free',
      E'*After the number of the days in which ye searched the land, even forty days, each day for a year, shall ye bear your iniquities, even forty years, and ye shall know my breach of promise.* (Numbers 14:34). Deuteronomy 2:14 recounts the fulfilment — *thirty and eight years; until all the generation of the men of war were wasted out* — the year-for-a-day sentence from Kadesh-barnea worked out in the wilderness.'),
    ('canon','deuteronomy',2,15,'canon','numbers',14,35,'free',
      E'*I Yahuah (LORD) have said, I will surely do it unto all this evil congregation, that are gathered together against me: in this wilderness they shall be consumed, and there they shall die.* (Numbers 14:35). Deuteronomy 2:15 confirms the decree executed — *the hand of Yahuah (LORD) was against them, to destroy them from among the host, until they were consumed.*'),
    ('canon','deuteronomy',2,14,'canon','psalms',95,10,'free',
      E'*Forty years long was I grieved with this generation, and said, It is a people that do err in their heart, and they have not known my ways:* (Psalm 95:10). The psalm sings the forty-year wasting that Deuteronomy 2:14 records — the generation of the men of war erring and consumed before the brook Zered was crossed.'),
    ('canon','deuteronomy',2,14,'canon','psalms',95,11,'free',
      E'*Unto whom I sware in my wrath that they should not enter into my rest.* (Psalm 95:11). The oath behind the thirty-eight years — *as Yahuah (LORD) sware unto them* (Deuteronomy 2:14) — that the men of war should fall short of the rest of the land.'),
    ('canon','deuteronomy',2,14,'canon','hebrews',3,17,'free',
      E'*But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:17). The New Testament reaches back to the very wasting Deuteronomy 2:14 narrates — *until all the generation of the men of war were wasted out* — as the warning to the gathered people not to harden the heart and fall short of the rest.'),
    -- THREAD 4: Yahuah hardened Sihon's spirit (v.24, v.30)
    ('canon','deuteronomy',2,30,'canon','exodus',4,21,'free',
      E'*And Yahuah (LORD) said unto Moses, When thou goest to return into Egypt, see that thou do all those wonders before Pharaoh, which I have put in thine hand: but I will harden his heart, that he shall not let the people go.* (Exodus 4:21). Sihon''s obstinacy is the same sovereign pattern — *Yahuah Elohayka (the LORD thy God) hardened his spirit, and made his heart obstinate, that he might deliver him into thy hand* (Deuteronomy 2:30) — the king delivered up to judgment as Pharaoh was.'),
    ('canon','deuteronomy',2,30,'canon','exodus',9,12,'free',
      E'*And Yahuah (LORD) hardened the heart of Pharaoh, and he hearkened not unto them; as Yahuah (LORD) had spoken unto Moses.* (Exodus 9:12). As with Pharaoh, so with Sihon — *Yahuah Elohayka (the LORD thy God) hardened his spirit* (Deuteronomy 2:30) so that the obstinate king would not let Yashar''el pass, and so be given into their hand.'),
    ('canon','deuteronomy',2,30,'canon','joshua',11,20,'free',
      E'*For it was of Yahuah (LORD) to harden their hearts, that they should come against Yashar''el (Israel) in battle, that he might destroy them utterly, and that they might have no favour, but that he might destroy them, as Yahuah (LORD) commanded Moses.* (Joshua 11:20). The Canaanite kings'' hardening mirrors Sihon''s — the obstinate heart (Deuteronomy 2:30) is Yahuah''s judicial delivering-up of nations ripe for judgment into Yashar''el''s hand.'),
    ('canon','deuteronomy',2,30,'canon','romans',9,18,'free',
      E'*Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth.* (Romans 9:18). The New Testament names the principle behind Sihon''s spirit — *Yahuah Elohayka (the LORD thy God) hardened his spirit, and made his heart obstinate* (Deuteronomy 2:30) — Yahuah''s sovereign right to harden the obstinate and deliver him into judgment.'),
    -- THREAD 5: The dread of thee upon the nations (v.25)
    ('canon','deuteronomy',2,25,'canon','exodus',15,14,'free',
      E'*The people shall hear, and be afraid: sorrow shall take hold on the inhabitants of Palestina.* (Exodus 15:14). The song of the sea foretold the very terror Deuteronomy 2:25 now begins to pour out — *This day will I begin to put the dread of thee and the fear of thee upon the nations... and shall tremble, and be in anguish because of thee.*'),
    ('canon','deuteronomy',2,25,'canon','exodus',15,16,'free',
      E'*Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD), till the people pass over, which thou hast purchased.* (Exodus 15:16). The promised *fear and dread* upon the nations is what Yahuah declares fulfilled in Deuteronomy 2:25 — the nations under the whole heaven trembling as Yashar''el passes over.'),
    ('canon','deuteronomy',2,25,'canon','joshua',2,9,'free',
      E'*And she said unto the men, I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you.* (Joshua 2:9). Rahab''s confession is the dread of Deuteronomy 2:25 landed in Canaan — *the dread of thee and the fear of thee upon the nations... who shall hear report of thee, and shall tremble.*'),
    ('canon','deuteronomy',2,25,'canon','joshua',2,10,'free',
      E'*For we have heard how Yahuah (LORD) dried up the water of the Red sea for you, when ye came out of Egypt; and what ye did unto the two kings of the Amorites, that were on the other side Jordan, Sihon and Og, whom ye utterly destroyed.* (Joshua 2:10). The *report of thee* that makes the nations tremble (Deuteronomy 2:25) includes the very defeat of Sihon recounted in this chapter — the dread spread by the deeds of Yahuah for his people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- THREADS
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-2-i-have-given-mount-seir-unto-esau',
       E'I Have Given Mount Seir Unto Esau for a Possession',
       E'When Yashar''el (Israel) must pass through the coast of *the children of Esau, which dwell in Seir*, Yahuah forbids any seizure: *Meddle not with them; for I will not give you of their land, no, not so much as a foot breadth; because I have given mount Seir unto Esau for a possession* (Deuteronomy 2:4-5). This is the sovereign apportioning of the nations. The grant is ancient — *Thus dwelt Esau in mount Seir: Esau is Edom* (Genesis 36:8) — and recited again at the covenant-renewal — *I gave unto Esau mount Seir, to possess it* (Joshua 24:4). The boundary is measured around the covenant people: *he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). Yet the brothers were divided by Yahuah''s purpose, not by lineage alone — *the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth* (Romans 9:11); *Jacob have I loved, but Esau have I hated* (Romans 9:13). Esau is granted Seir but forfeited the birthright by his own conduct — *a profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). The seed of promise runs through Jacob by paternal blood and covenant word together, while Esau is given his portion apart and unmolested. And in the same breath Yahuah reminds his people that they themselves have lacked nothing: *these forty years Yahuah Elohayka (the LORD thy God) hath been with thee; thou hast lacked nothing* (Deuteronomy 2:7).',
       sv.verse_id, ev.verse_id, 'free', 24525
  FROM _s310_deu02_lookup sv, _s310_deu02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-2-ar-given-unto-the-children-of-lot',
       E'Ar and Ammon Given Unto the Children of Lot',
       E'Twice in this chapter Yahuah fences off a nation from Yashar''el''s conquest for the sake of kinship: *Distress not the Moabites, neither contend with them in battle: for I will not give thee of their land for a possession; because I have given Ar unto the children of Lot for a possession* (Deuteronomy 2:9), and again, *I will not give thee of the land of the children of Ammon any possession; because I have given it unto the children of Lot for a possession* (Deuteronomy 2:19). Both nations descend from Lot, Abraham''s nephew — *And the firstborn bare a son, and called his name Moab: the same is the father of the Moabites unto this day* (Genesis 19:37); *And the younger, she also bare a son, and called his name Ben-ammi: the same is the father of the children of Ammon unto this day* (Genesis 19:38). Though born of the cave, the offspring of Lot are remembered, and their boundaries are honoured by the same sovereign hand that apportioned Seir to Esau. Yahuah keeps the bounds he has set, even for the half-kin of his covenant people.',
       sv.verse_id, ev.verse_id, 'free', 24528
  FROM _s310_deu02_lookup sv, _s310_deu02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=2 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-2-thirty-and-eight-years-the-men-of-war-wasted-out',
       E'Thirty and Eight Years — the Men of War Wasted Out',
       E'Between Kadesh-barnea and the brook Zered lay the silent sentence: *the space in which we came from Kadesh-barnea, until we were come over the brook Zered, was thirty and eight years; until all the generation of the men of war were wasted out from among the host, as Yahuah (LORD) sware unto them* (Deuteronomy 2:14), *for indeed the hand of Yahuah (LORD) was against them, to destroy them from among the host, until they were consumed* (Deuteronomy 2:15). This is the year-for-a-day decree of the spies'' rebellion fulfilled: *each day for a year, shall ye bear your iniquities, even forty years* (Numbers 14:34), *in this wilderness they shall be consumed, and there they shall die* (Numbers 14:35). The psalmist sings the grief: *Forty years long was I grieved with this generation... Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:10-11). And the New Testament reaches back to this very wasting as warning to the gathered people — *with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:17). The unbelieving generation falls short of the rest of the land; only when they are consumed does the inheritance begin.',
       sv.verse_id, ev.verse_id, 'free', 24531
  FROM _s310_deu02_lookup sv, _s310_deu02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-2-yahuah-hardened-sihons-spirit',
       E'Yahuah Hardened Sihon''s Spirit',
       E'When Yashar''el sends words of peace to Sihon king of Heshbon, the king refuses — but the refusal is governed: *Sihon king of Heshbon would not let us pass by him: for Yahuah Elohayka (the LORD thy God) hardened his spirit, and made his heart obstinate, that he might deliver him into thy hand, as appeareth this day* (Deuteronomy 2:30). This is the same sovereign pattern worked upon Pharaoh — *I will harden his heart, that he shall not let the people go* (Exodus 4:21); *And Yahuah (LORD) hardened the heart of Pharaoh, and he hearkened not unto them* (Exodus 9:12) — and upon the Canaanite kings — *it was of Yahuah (LORD) to harden their hearts, that they should come against Yashar''el (Israel) in battle, that he might destroy them utterly* (Joshua 11:20). The New Testament names the principle: *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). Yahuah''s hardening is never arbitrary cruelty but the judicial delivering-up of the obstinate into the judgment already due — *behold, I have given into thine hand Sihon the Amorite, king of Heshbon, and his land* (Deuteronomy 2:24).',
       sv.verse_id, ev.verse_id, 'free', 24534
  FROM _s310_deu02_lookup sv, _s310_deu02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=2 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-2-the-dread-of-thee-upon-the-nations',
       E'This Day Will I Begin to Put the Dread of Thee Upon the Nations',
       E'As Yashar''el turns to possess the land, Yahuah declares the campaign of fear opened: *This day will I begin to put the dread of thee and the fear of thee upon the nations that are under the whole heaven, who shall hear report of thee, and shall tremble, and be in anguish because of thee* (Deuteronomy 2:25). The song of the sea had already foretold it: *The people shall hear, and be afraid: sorrow shall take hold on the inhabitants of Palestina* (Exodus 15:14); *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over* (Exodus 15:16). And it lands in Canaan in Rahab''s confession: *I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you* (Joshua 2:9), *for we have heard how Yahuah (LORD) dried up the water of the Red sea for you... and what ye did unto the two kings of the Amorites... Sihon and Og, whom ye utterly destroyed* (Joshua 2:10). The dread is not the strength of Yashar''el but the report of what Yahuah does for his people — the very defeat of Sihon recounted in this chapter spreading terror through the nations.',
       sv.verse_id, ev.verse_id, 'free', 24537
  FROM _s310_deu02_lookup sv, _s310_deu02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=2 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- THREAD MEMBERS
-- ============================================================
-- THREAD 1: I have given mount Seir unto Esau
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thus dwelt Esau in mount Seir: Esau is Edom* (Genesis 36:8) — the ancient grant Deuteronomy 2:5 honours, the brother-kin unmolested in his given possession.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-i-have-given-mount-seir-unto-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — the *foot breadth* Yashar''el may not take is the boundary Yahuah himself fixed.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-i-have-given-mount-seir-unto-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I gave unto Esau mount Seir, to possess it* (Joshua 24:4) — the covenant-renewal recites the same apportioning Moses guards: each brother given his portion by Yahuah.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-i-have-given-mount-seir-unto-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*That the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth* (Romans 9:11) — the division of the brothers rests on Yahuah''s purpose, the seed carried in Jacob by his call.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-i-have-given-mount-seir-unto-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Jacob have I loved, but Esau have I hated* (Romans 9:13) — Yashar''el must *take ye good heed* among the children of Esau; conduct and Yahuah''s purpose, not spite, set the two apart.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-i-have-given-mount-seir-unto-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*A profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16) — Esau possesses Seir but forfeited the birthright; why the seed promise runs through Jacob.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-i-have-given-mount-seir-unto-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: Ar and Ammon given unto the children of Lot
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The same is the father of the Moabites unto this day* (Genesis 19:37) — Moab descends from Lot; Deuteronomy 2:9 spares his land for the sake of that kinship.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-ar-given-unto-the-children-of-lot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The same is the father of the children of Ammon unto this day* (Genesis 19:38) — Ammon too descends from Lot; Deuteronomy 2:19 protects his boundary by the same remembrance.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-ar-given-unto-the-children-of-lot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: Thirty and eight years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Each day for a year, shall ye bear your iniquities, even forty years* (Numbers 14:34) — the year-for-a-day sentence whose fulfilment Deuteronomy 2:14 records.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-thirty-and-eight-years-the-men-of-war-wasted-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*In this wilderness they shall be consumed, and there they shall die* (Numbers 14:35) — the decree Deuteronomy 2:15 confirms executed by the hand of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-thirty-and-eight-years-the-men-of-war-wasted-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Forty years long was I grieved with this generation* (Psalm 95:10) — the psalm sings the very wasting Deuteronomy 2:14 narrates.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-thirty-and-eight-years-the-men-of-war-wasted-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:11) — the oath behind the thirty-eight years, that the men of war fall short of the land.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-thirty-and-eight-years-the-men-of-war-wasted-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Whose carcases fell in the wilderness?* (Hebrews 3:17) — the New Testament reaches back to this wasting as warning to the gathered people not to fall short of the rest.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-thirty-and-eight-years-the-men-of-war-wasted-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: Yahuah hardened Sihon's spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will harden his heart, that he shall not let the people go* (Exodus 4:21) — Sihon''s obstinacy is the same sovereign pattern worked on Pharaoh.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=30
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-yahuah-hardened-sihons-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Yahuah (LORD) hardened the heart of Pharaoh, and he hearkened not unto them* (Exodus 9:12) — as with Pharaoh, so with Sihon, that he might be delivered into Yashar''el''s hand.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=30
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-yahuah-hardened-sihons-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*It was of Yahuah (LORD) to harden their hearts, that they should come against Yashar''el (Israel) in battle* (Joshua 11:20) — the Canaanite kings'' hardening mirrors Sihon''s: judicial delivering-up of nations ripe for judgment.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=30
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=11 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-yahuah-hardened-sihons-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Whom he will he hardeneth* (Romans 9:18) — the New Testament names the principle behind Sihon''s obstinate heart: Yahuah''s sovereign right over the obstinate.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=30
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-yahuah-hardened-sihons-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: The dread of thee upon the nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The people shall hear, and be afraid* (Exodus 15:14) — the song of the sea foretold the very terror Deuteronomy 2:25 begins to pour out.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=25
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-the-dread-of-thee-upon-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Fear and dread shall fall upon them... till thy people pass over* (Exodus 15:16) — the promised dread is what Yahuah declares fulfilled in Deuteronomy 2:25.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=25
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-the-dread-of-thee-upon-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Your terror is fallen upon us, and... all the inhabitants of the land faint because of you* (Joshua 2:9) — Rahab''s confession is the dread of Deuteronomy 2:25 landed in Canaan.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=25
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-the-dread-of-thee-upon-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*What ye did unto the two kings of the Amorites... Sihon and Og, whom ye utterly destroyed* (Joshua 2:10) — the *report of thee* that makes the nations tremble includes the defeat of Sihon recounted in this chapter.'
  FROM cross_reference_threads t
  JOIN _s310_deu02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=2 AND sv.verse_number=25
  JOIN _s310_deu02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-2-the-dread-of-thee-upon-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_deuteronomy_3.sql (Deuteronomy 3) -----
-- Book: deuteronomy | Chapter: 3 | Session: s310 | Tag: deu03
-- Temp view: _s310_deu03_lookup
-- Sort band base 24550, step 3 -> 24550, 24553, 24556, 24559
--
-- FRAMING (Step-0 lens applied throughout):
--   Moses' first-discourse recap of the conquest east of Jordan: Og the last of the
--   remnant of giants (the Rephaim line the flood judged, Genesis 6 / 1 Enoch 7), the
--   2.5 tribes armed before their brethren until ALL Yashar'el has rest, and Moses the
--   mediator who bears the people's sin and is refused entry — Joshua (same Name as
--   Yahusha) brings the people into the rest the servant could not give (Hebrews 4:8).
--
-- Deuteronomy 3 coverage:
--   v.1-11  Og king of Bashan, last of the remnant of giants, iron bedstead
--           NT:     none warranted (giant-line judged; NT giant material at Jude/2Pet runs through the Watchers, already carried at 1Pet3/2Pet2/Jude)
--           Extras: 1 Enoch 7:2 (the great giants begotten of the Watchers) — CLEAN witness
--           Tanakh: Genesis 14:5 (Rephaims smitten), Numbers 13:33 (the giants, sons of Anak), Joshua 12:4 (Og of the remnant of the giants)
--   v.12-17 allotment of Gilead/Bashan to Reuben, Gad, half-Manasseh
--           NT: none warranted | Extras: none warranted | Tanakh: carried into the v.18-20 brotherhood thread (same 2.5 tribes)
--   v.18-20 ye shall pass over armed before your brethren until Yahuah give rest to ALL
--           NT:     Romans 15:1 / Galatians 6:2 (bear one another's burdens) — weighed; fit is genuine for the brotherhood-rest principle, included as forward weave
--           Extras: none warranted
--           Tanakh: Joshua 1:12-15 (Joshua repeats the charge), Joshua 22:1-4 (rest given, they return)
--   v.21-22 Yahuah he shall fight for you — carried in the v.18-20/v.28 weave; no separate thread
--   v.23-27 Moses besought, let me go over — refused: Let it suffice thee; speak no more
--           NT:     none warranted (the type is the servant who does not enter; the Son who does = the v.28 thread)
--           Extras: none warranted
--           Tanakh: Numbers 20:12 (because ye believed me not... ye shall not bring), Deuteronomy 34:4-5 (sees from Pisgah, dies), Psalm 106:32-33 (it went ill with Moses for their sakes)
--   v.28    charge Joshua... he shall cause them to inherit
--           NT:     Hebrews 4:8 (if Yahusha had given them rest), Acts 7:45 (brought in with Yahusha), Hebrews 3:5-6 (Moses servant, the Son over the house)
--           Extras: none warranted
--           Tanakh: Joshua 1 (Joshua commissioned) — carried in v.18-20 thread
--   v.29    abode in the valley over against Beth-peor — narrative seam, none warranted
--
-- THREADS (4):
--   deuteronomy-3-og-last-of-the-remnant-of-giants          [extras] -> genesis, numbers, joshua, 1-enoch
--   deuteronomy-3-armed-before-your-brethren-until-rest      [free]   -> joshua (x2), romans, galatians
--   deuteronomy-3-the-mediator-refused-let-me-go-over        [free]   -> numbers, deuteronomy, psalm
--   deuteronomy-3-charge-joshua-he-shall-cause-them-inherit  [free]   -> hebrews (x2), acts

CREATE TEMP VIEW _s310_deu03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- CROSS_REFERENCES
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Og last of the remnant of giants (3:1-11)
    ('canon','deuteronomy',3,11,'canon','genesis',14,5,'free',
     E'*And in the fourteenth year came Chedorlaomer, and the kings that were with him, and smote the Rephaims in Ashteroth Karnaim, and the Zuzims in Ham, and the Emims in Shaveh Kiriathaim* (Genesis 14:5). The Rephaim (giants) Chedorlaomer smote in Abram''s day are the same line as Og, *king of Bashan* who *remained of the remnant of giants* (Deuteronomy 3:11) — Bashan and Ashtaroth being their seat. The seed-war line the flood judged still surfaces in the land Yashar''el is given to clear.'),
    ('canon','deuteronomy',3,11,'canon','numbers',13,33,'free',
     E'*And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight* (Numbers 13:33). The very giants whose stature broke the ten spies a generation earlier are now overthrown: Og, *of the remnant of giants* (Deuteronomy 3:11), falls until *none was left to him remaining* (3:3). What unbelief once magnified, Yahuah delivers into their hand.'),
    ('canon','deuteronomy',3,11,'canon','joshua',12,4,'free',
     E'*And the coast of Og king of Bashan, which was of the remnant of the giants, that dwelt at Ashtaroth and at Edrei* (Joshua 12:4). Joshua''s conquest roll names Og with the same phrase Moses uses — *the remnant of the giants* — confirming Deuteronomy 3:11, *For only Og king of Bashan remained of the remnant of giants*, as the last of that line east of Jordan.'),
    ('canon','deuteronomy',3,11,'enoch','1-enoch',7,2,'extras',
     E'*And they became pregnant, and they bare great giants, whose height was three thousand ells* (1 Enoch 7:2). The restored Watcher-witness names the origin of the giant line: the Nephilim begotten when the sons of Elohim took wives of the daughters of men (Genesis 6). Og, *of the remnant of giants* (Deuteronomy 3:11) with his iron bedstead *nine cubits... the length thereof*, is a surviving stump of that judged seed — the conquest finishing what the flood began.'),

    -- Thread 2: armed before your brethren until rest (3:18-20)
    ('canon','deuteronomy',3,18,'canon','joshua',1,14,'free',
     E'*Your wives, your little ones, and your cattle, shall remain in the land which Moses gave you on this side Jordan; but ye shall pass before your brethren armed, all the mighty men of valour, and help them* (Joshua 1:14). Joshua repeats Moses'' charge of Deuteronomy 3:18 almost word for word — *ye shall pass over armed before your brethren the children of Yashar''el* — so the 2.5 eastern tribes do not settle into their own rest while their brethren still go to war.'),
    ('canon','deuteronomy',3,20,'canon','joshua',1,15,'free',
     E'*Until Yahuah have given your brethren rest, as he hath given you, and they also have possessed the land... then ye shall return unto the land of your possession* (Joshua 1:15). This seals the condition of Deuteronomy 3:20 — *Until Yahuah have given rest unto your brethren, as well as unto you... and then shall ye return.* No tribe enters its own inheritance until ALL Yashar''el has rest; the brotherhood of the two-house people is one body.'),
    ('canon','deuteronomy',3,20,'canon','joshua',22,4,'free',
     E'*And now Yahuah Elohaychem (the LORD your God) hath given rest unto your brethren, as he promised them: therefore now return ye, and get you unto your tents, and unto the land of your possession* (Joshua 22:4). The promise of Deuteronomy 3:20 is fulfilled: the rest is given to all, and only THEN are Reuben, Gad and half-Manasseh sent home — the charge kept to the letter.'),
    ('canon','deuteronomy',3,18,'canon','romans',15,1,'free',
     E'*We then that are strong ought to bear the infirmities of the weak, and not to please ourselves* (Romans 15:1). The pattern of Deuteronomy 3:18 — the able men crossing over *armed before your brethren* and refusing their own ease until the weaker have rest — is the same brotherhood law Paul presses: the strong carry the weak rather than possess in isolation.'),
    ('canon','deuteronomy',3,18,'canon','galatians',6,2,'free',
     E'*Bear ye one another''s burdens, and so fulfil the law of Messiah* (Galatians 6:2). To *pass over armed before your brethren* (Deuteronomy 3:18) until they too possess the land is to fulfil the very law of love among brethren — the eastern tribes shouldering the war of the western, no man''s rest counted complete while a brother still fights.'),

    -- Thread 3: the mediator refused, let me go over (3:23-27)
    ('canon','deuteronomy',3,26,'canon','numbers',20,12,'free',
     E'*And Yahuah spake unto Moses and Aaron, Because ye believed me not, to sanctify me in the eyes of the children of Yashar''el (Israel), therefore ye shall not bring this congregation into the land which I have given them* (Numbers 20:12). This is the sentence behind Deuteronomy 3:26 — *But Yahuah was wroth with me for your sakes, and would not hear me.* The mediator who struck the rock at Meribah bears the consequence and is barred from the good land.'),
    ('canon','deuteronomy',3,27,'canon','deuteronomy',34,4,'free',
     E'*And Yahuah said unto him, This is the land which I sware unto Abraham, unto Isaac, and unto Jacob, saying, I will give it unto thy seed: I have caused thee to see it with thine eyes, but thou shalt not go over thither* (Deuteronomy 34:4). The command of Deuteronomy 3:27 — *Get thee up into the top of Pisgah... and behold it with thine eyes: for thou shalt not go over this Jordan* — is carried out at the end: Moses sees the whole land from Pisgah, then dies (34:5), the servant who showed the people the inheritance but did not himself enter.'),
    ('canon','deuteronomy',3,26,'canon','psalms',106,32,'free',
     E'*They angered him also at the waters of strife, so that it went ill with Moses for their sakes: Because they provoked his spirit, so that he spake unadvisedly with his lips* (Psalm 106:32-33). The Psalm sings the very reason of Deuteronomy 3:26 — *Yahuah was wroth with me for your sakes* — naming the people''s provocation, not the mediator''s ambition, as the cause his entry was refused.'),

    -- Thread 4: charge Joshua, he shall cause them to inherit (3:28)
    ('canon','deuteronomy',3,28,'canon','hebrews',4,8,'free',
     E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8). Here the Greek name for Joshua and Yahusha is one word: the writer reasons that because Joshua — who *shall go over before this people, and... cause them to inherit the land* (Deuteronomy 3:28) — gave only the land, a greater rest still remained, the true rest of the seventh day brought by the greater Yahusha.'),
    ('canon','deuteronomy',3,28,'canon','acts',7,45,'free',
     E'*Which also our fathers that came after brought in with Yahusha (Jesus) into the possession of the Gentiles, whom Elohim drave out before the face of our fathers, unto the days of David* (Acts 7:45). Stephen names Joshua by the same Name — *with Yahusha* — as the one who brought the fathers into the possession, the inheritance Deuteronomy 3:28 charges him to cause Yashar''el to enter where Moses could not.'),
    ('canon','deuteronomy',3,28,'canon','hebrews',3,5,'free',
     E'*And Moses verily was faithful in all his house, as a servant, for a testimony of those things which were to be spoken after; But Messiah (Christ) as a son over his own house* (Hebrews 3:5-6). Deuteronomy 3:28 shows the servant Moses handing the charge to another to lead the people in: Moses faithful as servant who does not enter, the Son faithful over the house who brings the people into the inheritance and the rest.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- THREADS
-- ============================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-3-og-last-of-the-remnant-of-giants',
  E'Og king of Bashan — the last of the remnant of giants',
  E'Moses recalls the fall of Og: *For only Og king of Bashan remained of the remnant of giants; behold, his bedstead was a bedstead of iron... nine cubits was the length thereof, and four cubits the breadth of it* (Deuteronomy 3:11). Og is a surviving stump of the giant line — the Rephaim Chedorlaomer had smitten in Abram''s day, *the Rephaims in Ashteroth Karnaim... and the Emims in Shaveh Kiriathaim* (Genesis 14:5), and the same *giants, the sons of Anak, which come of the giants* that broke the ten spies, before whom *we were in our own sight as grasshoppers* (Numbers 13:33). Joshua''s conquest roll repeats Moses'' phrase exactly — Og *was of the remnant of the giants, that dwelt at Ashtaroth and at Edrei* (Joshua 12:4). The restored Watcher-witness names that line''s origin: when the fallen ones took wives of the daughters of men, *they became pregnant, and they bare great giants* (1 Enoch 7:2) — the Nephilim of Genesis 6 whom the flood judged. The conquest east of Jordan finishes what the flood began: the seed-war giant line is cut off *until none was left to him remaining* (Deuteronomy 3:3).',
  sv.verse_id, ev.verse_id, 'extras', 24550
  FROM _s310_deu03_lookup sv, _s310_deu03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-3-armed-before-your-brethren-until-rest',
  E'Armed before your brethren — no rest till all Yashar''el has rest',
  E'The 2.5 eastern tribes receive their land first, but on a condition that binds the whole people into one body: *ye shall pass over armed before your brethren the children of Yashar''el (Israel), all that are meet for the war... Until Yahuah have given rest unto your brethren, as well as unto you... and then shall ye return every man unto his possession* (Deuteronomy 3:18-20). No tribe settles into its own inheritance while a brother still fights. Joshua repeats the charge nearly word for word — *ye shall pass before your brethren armed, all the mighty men of valour, and help them; Until Yahuah have given your brethren rest, as he hath given you* (Joshua 1:14-15) — and at last the promise is kept: *now Yahuah Elohaychem hath given rest unto your brethren, as he promised them: therefore now return ye* (Joshua 22:4). This is the brotherhood law of the two-house people, the same pattern the apostle presses forward: *We then that are strong ought to bear the infirmities of the weak* (Romans 15:1), *Bear ye one another''s burdens, and so fulfil the law of Messiah* (Galatians 6:2). No man''s rest is counted complete while a brother still goes to war.',
  sv.verse_id, ev.verse_id, 'free', 24553
  FROM _s310_deu03_lookup sv, _s310_deu03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-3-the-mediator-refused-let-me-go-over',
  E'Let me go over — the mediator who bears the people''s sin and does not enter',
  E'Moses pleads to cross into the inheritance: *I pray thee, let me go over, and see the good land that is beyond Jordan, that goodly mountain, and Lebanon* (Deuteronomy 3:25). The answer is a closed door: *But Yahuah was wroth with me for your sakes, and would not hear me: and Yahuah said unto me, Let it suffice thee; speak no more unto me of this matter* (3:26). The sentence was passed at Meribah — *Because ye believed me not, to sanctify me in the eyes of the children of Yashar''el, therefore ye shall not bring this congregation into the land* (Numbers 20:12) — and the Psalm names the people''s provocation, not the mediator''s ambition, as the cause: *it went ill with Moses for their sakes: Because they provoked his spirit, so that he spake unadvisedly with his lips* (Psalm 106:32-33). So Moses is told to ascend and look: *Get thee up into the top of Pisgah... and behold it with thine eyes: for thou shalt not go over this Jordan* (Deuteronomy 3:27), which the book''s end carries out — *I have caused thee to see it with thine eyes, but thou shalt not go over thither* (34:4), and *Moses the servant of Yahuah died there* (34:5). The faithful servant bears the consequence *for your sakes* and shows the people the inheritance he will not himself enter.',
  sv.verse_id, ev.verse_id, 'free', 24556
  FROM _s310_deu03_lookup sv, _s310_deu03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=3 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-3-charge-joshua-he-shall-cause-them-inherit',
  E'Charge Joshua — he shall cause them to inherit the rest Moses could not give',
  E'Where the servant is barred, the charge passes to another bearing the very Name: *But charge Joshua, and encourage him, and strengthen him: for he shall go over before this people, and he shall cause them to inherit the land which thou shalt see* (Deuteronomy 3:28). Joshua and Yahusha (Jesus) are one Name, and the New Testament reads the type openly. Stephen says the fathers were *brought in with Yahusha (Jesus) into the possession... whom Elohim drave out before the face of our fathers* (Acts 7:45) — Joshua leading the people into the land Moses only saw. Yet the writer to the Hebrews shows Joshua''s rest was not the final one: *For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8) — the conquest-rest was a shadow of the seventh-day rest still remaining for the people of Elohim. And the whole pattern crowns the Christology: *Moses verily was faithful in all his house, as a servant... But Messiah as a son over his own house* (Hebrews 3:5-6). Moses faithful as servant who does not enter; the Son faithful over the house who brings the people into the inheritance and the rest.',
  sv.verse_id, ev.verse_id, 'free', 24559
  FROM _s310_deu03_lookup sv, _s310_deu03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=3 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- THREAD MEMBERS
-- ============================================================================
-- Thread 1: Og last of the remnant of giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And in the fourteenth year came Chedorlaomer... and smote the Rephaims in Ashteroth Karnaim... and the Emims in Shaveh Kiriathaim* (Genesis 14:5) — the giant Rephaim line in Abram''s day, Og''s own kin.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-og-last-of-the-remnant-of-giants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And there we saw the giants, the sons of Anak... and we were in our own sight as grasshoppers* (Numbers 13:33) — the giants that broke the ten spies, now overthrown in Og.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-og-last-of-the-remnant-of-giants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And the coast of Og king of Bashan, which was of the remnant of the giants, that dwelt at Ashtaroth and at Edrei* (Joshua 12:4) — Joshua''s roll repeats Moses'' phrase exactly.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=12 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-og-last-of-the-remnant-of-giants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And they became pregnant, and they bare great giants, whose height was three thousand ells* (1 Enoch 7:2) — the Watcher-origin of the giant line the flood judged; Og its surviving remnant.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-og-last-of-the-remnant-of-giants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: armed before your brethren until rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*but ye shall pass before your brethren armed, all the mighty men of valour, and help them* (Joshua 1:14) — Joshua repeats Moses'' charge of Deuteronomy 3:18 word for word.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-armed-before-your-brethren-until-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Until Yahuah have given your brethren rest, as he hath given you... then ye shall return* (Joshua 1:15) — the same condition as Deuteronomy 3:20: all rest first, then return.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-armed-before-your-brethren-until-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And now Yahuah Elohaychem hath given rest unto your brethren... therefore now return ye* (Joshua 22:4) — the promise of Deuteronomy 3:20 fulfilled; the tribes sent home.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=22 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-armed-before-your-brethren-until-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*We then that are strong ought to bear the infirmities of the weak, and not to please ourselves* (Romans 15:1) — the brotherhood principle of Deuteronomy 3:18 carried forward.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-armed-before-your-brethren-until-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Bear ye one another''s burdens, and so fulfil the law of Messiah* (Galatians 6:2) — crossing over armed for the brethren (Deuteronomy 3:18) is fulfilling the law of love.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-armed-before-your-brethren-until-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the mediator refused
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Because ye believed me not... therefore ye shall not bring this congregation into the land* (Numbers 20:12) — the Meribah sentence behind Deuteronomy 3:26.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=26
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-the-mediator-refused-let-me-go-over'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I have caused thee to see it with thine eyes, but thou shalt not go over thither* (Deuteronomy 34:4) — the Pisgah command of 3:27 carried out; Moses sees, then dies.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=27
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=34 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-the-mediator-refused-let-me-go-over'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*it went ill with Moses for their sakes: Because they provoked his spirit* (Psalm 106:32-33) — the Psalm names the people''s provocation as the cause of 3:26, *for your sakes*.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=26
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-the-mediator-refused-let-me-go-over'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: charge Joshua, he shall cause them to inherit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8) — Joshua gave the land, not the final rest still remaining.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-charge-joshua-he-shall-cause-them-inherit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Which also our fathers... brought in with Yahusha (Jesus) into the possession of the Gentiles* (Acts 7:45) — Stephen names Joshua by the same Name as the one who brought the people in.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-charge-joshua-he-shall-cause-them-inherit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Moses verily was faithful in all his house, as a servant... But Messiah as a son over his own house* (Hebrews 3:5-6) — the servant who hands the charge; the Son who brings the people into the rest.'
  FROM cross_reference_threads t
  JOIN _s310_deu03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s310_deu03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-3-charge-joshua-he-shall-cause-them-inherit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_deuteronomy_4.sql (Deuteronomy 4) -----
-- Chapter: Deuteronomy 4 — Moses' first covenant sermon at Beth-peor on the plains of Moab.
-- Tag: deu04 | Session prefix: s310 | Temp view: _s310_deu04_lookup
-- Sort band base 24575, step 3 -> 24575, 24578, 24581, 24584, 24587, 24590, 24593
--
-- THREADS (7):
--   1. deuteronomy-4-add-not-nor-diminish-the-word-the-canon-guard (v.2)
--        free  -> Deut 12:32, Proverbs 30:5-6, Revelation 22:18-19  [Tanakh + NT]
--   2. deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations (v.6-8)
--        extras-> Psalm 19:7-8, Psalm 147:19-20, Romans 7:12, Matthew 5:14-19, Sirach 24:23  [Tanakh + NT + Apocrypha]
--   3. deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude (v.12,15-19)
--        extras-> Exodus 20:4, Exodus 33:20, Isaiah 40:18, John 1:18, John 5:37, Wisdom 13:1-2, Baruch 3:37  [Tanakh + NT + Apocrypha]
--   4. deuteronomy-4-a-consuming-fire-a-jealous-el (v.24)
--        free  -> Exodus 34:14, Deut 9:3, Hebrews 12:29  [Tanakh + NT]
--   5. deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee (v.25-31)
--        extras-> Lev 26:33, Lev 26:44, Deut 30:1, Deut 30:3, Nehemiah 1:9, Jeremiah 29:13-14, Romans 11:1-2, Romans 11:28-29, Jubilees 1:15  [Tanakh + NT + Jubilees]
--   6. deuteronomy-4-did-ever-people-hear-the-voice-of-elohim-and-live (v.33-36)
--        free  -> Exodus 19:5-6, Hebrews 12:18-19  [Tanakh + NT]
--   7. deuteronomy-4-yahuah-he-is-elohim-there-is-none-else-beside-him (v.35,39)
--        extras-> Deut 6:4, Isaiah 45:5, Isaiah 45:21-22, Mark 12:32, Baruch 3:35-36  [Tanakh + NT + Apocrypha]
--
-- Per-chapter coverage checklist:
--   v.1   NT: none warranted   Extras: none warranted   Tanakh: covered laterally by v.40 statutes-to-live (intro/restatement)
--   v.2   NT: Revelation 22:18-19 (add/take-away guard)   Extras: none warranted   Tanakh: Deut 12:32, Proverbs 30:5-6  [thread 1]
--   v.3-4 NT: none warranted   Extras: none warranted   Tanakh: Baal-peor (Num 25) — historical recall, none threaded
--   v.5   NT: none warranted   Extras: none warranted   Tanakh: folded into wisdom thread (taught statutes)
--   v.6-8 NT: Romans 7:12, Matthew 5:14-19   Extras: Sirach 24:23 (wisdom=Torah)   Tanakh: Psalm 19:7-8, Psalm 147:19-20  [thread 2]
--   v.9-11 NT: none warranted   Extras: none warranted   Tanakh: Horeb teaching — folded into theophany threads 3 & 6
--   v.12,15-19 NT: John 1:18, John 5:37   Extras: Wisdom 13:1-2, Baruch 3:37   Tanakh: Exodus 20:4, Exodus 33:20, Isaiah 40:18  [thread 3]
--   v.13-14 NT: none warranted   Extras: none warranted   Tanakh: ten words on two tables — folded into theophany threads
--   v.20  NT: none warranted   Extras: none warranted   Tanakh: iron furnace / people of inheritance — folded into election material
--   v.21-23 NT: none warranted   Extras: none warranted   Tanakh: Moses barred from Jordan (Num 20) — historical, none threaded
--   v.24  NT: Hebrews 12:29 (consuming fire)   Extras: none warranted   Tanakh: Exodus 34:14, Deut 9:3  [thread 4]
--   v.25-31 NT: Romans 11:1-2, Romans 11:28-29   Extras: Jubilees 1:15 (latter-days return)   Tanakh: Lev 26:33/44, Deut 30:1/3, Neh 1:9, Jer 29:13-14  [thread 5]
--   v.32  NT: none warranted   Extras: none warranted   Tanakh: rhetorical frame for v.33-36 — folded into thread 6
--   v.33-36 NT: Hebrews 12:18-19 (voice out of fire)   Extras: none warranted   Tanakh: Exodus 19:5-6  [thread 6]
--   v.35,39 NT: Mark 12:32 (one Elohim, none other)   Extras: Baruch 3:35-36   Tanakh: Deut 6:4, Isaiah 45:5/21-22  [thread 7]
--   v.37-38 NT: none warranted   Extras: none warranted   Tanakh: he loved/chose the fathers' seed — folded into election (thread 5/7 framing)
--   v.40  NT: none warranted   Extras: none warranted   Tanakh: keep his statutes that it may go well — inclusio with v.1, none threaded
--   v.41-49 NT: none warranted   Extras: none warranted   Tanakh: three cities of refuge + heading to the law-code — narrative/legal frame, none threaded
--
-- Framework notes:
--   * v.2 the add-not/diminish-not is the CANON-GUARD: the Torah is the fixed, sufficient word
--     (Deut 12:32, Prov 30:5-6) and Revelation 22:18-19 closes the whole library with the SAME
--     guard — Torah never abolished, never amended.
--   * v.6-8 the Torah IS Yahuah's wisdom drawing the nations — Romans 7:12 (the commandment holy,
--     just, good) and Matthew 5:14-19 (city on a hill / not one jot to pass) carry it forward; the
--     2nd-Temple voice (Sirach 24:23) already equates Wisdom with the law Moses commanded.
--   * v.12,15-19 the FORMED/FORMLESS lens: the Father (Formless Source) was HEARD but saw no
--     similitude — hence no image of male/female/beast/host-of-heaven. John 1:18 / John 5:37 make
--     it explicit: no man hath seen Elohim's shape — He is declared/made visible only in the Formed
--     Son. Baruch 3:37 sees the same One who "shewed himself upon earth, and conversed with men."
--   * v.25-31 the EXILE-and-RETURN, the merciful El who "will not forsake thee... nor forget the
--     covenant of thy fathers" — the two-house scattering and ingathering (Lev 26, Deut 30, Neh 1,
--     Jer 29) and the anti-replacement guard Romans 11 (He hath NOT cast away his people).
--   * v.35,39 the Shema confession ("Yahuah he is Elohim; there is none else") setting up ch6:4 —
--     Isaiah's none-else oracles and the scribe's confession in Mark 12:32.

CREATE TEMP VIEW _s310_deu04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: add not, nor diminish — the canon guard (v.2)
    ('canon','deuteronomy',4,2,'canon','deuteronomy',12,32,'free',
      E'*What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it.* (Deuteronomy 12:32). The same guard Moses gives twice in this one book: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God)* (Deuteronomy 4:2). The Torah is the fixed, sufficient covenant-word — not to be amended, not to be abolished.'),
    ('canon','deuteronomy',4,2,'canon','proverbs',30,5,'free',
      E'*Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him. Add thou not unto his words, lest he reprove thee, and thou be found a liar* (Proverbs 30:5-6). Wisdom echoes Moses'' charge — the word is pure and complete; to *add* to it is to be found a liar, the mirror of the command *Ye shall not add unto the word... neither shall ye diminish* (Deuteronomy 4:2).'),
    ('canon','deuteronomy',4,2,'canon','revelation',22,18,'free',
      E'*For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book* (Revelation 22:18). The whole library closes with the very guard it opened in the Torah: as Moses said *Ye shall not add unto the word... neither shall ye diminish* (Deuteronomy 4:2), so the last page seals the same canon-fence around the word.'),
    ('canon','deuteronomy',4,2,'canon','revelation',22,19,'free',
      E'*And if any man shall take away from the words of the book of this prophecy, Elohim (God) shall take away his part out of the book of life, and out of the holy city, and from the things which are written in this book* (Revelation 22:19). The *diminish* half of Moses'' charge — *neither shall ye diminish ought from it* (Deuteronomy 4:2) — answered at the consummation: to take away from the word is to be taken away.'),

    -- THREAD 2: this is your wisdom — the Torah draws the nations (v.6-8)
    ('canon','deuteronomy',4,6,'canon','psalms',19,7,'free',
      E'*The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7). What Moses calls *your wisdom and your understanding in the sight of the nations* (Deuteronomy 4:6), David sings: the Torah is perfect and *making wise the simple* — the very wisdom that makes Yashar''el (Israel) a *wise and understanding people.*'),
    ('canon','deuteronomy',4,8,'canon','psalms',19,8,'free',
      E'*The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes* (Psalm 19:8). Moses asks *what nation is there so great, that hath statutes and judgments so righteous as all this law* (Deuteronomy 4:8); the Psalm answers — the statutes are *right* and the commandment *pure,* the righteousness no nation else possesses.'),
    ('canon','deuteronomy',4,7,'canon','psalms',147,19,'free',
      E'*He sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* (Psalm 147:19). Moses marvels *what nation is there so great, who hath Elohim (God) so nigh unto them* (Deuteronomy 4:7); the Psalm names the nearness — the word, statutes, and judgments given to Jacob alone.'),
    ('canon','deuteronomy',4,8,'canon','psalms',147,20,'free',
      E'*He hath not dealt so with any nation: and as for his judgments, they have not known them. Praise ye Yahuah (LORD)* (Psalm 147:20). The exact thought of *what nation is there so great, that hath statutes and judgments so righteous as all this law* (Deuteronomy 4:8) — no other nation has been dealt with so; the Torah is Yashar''el''s singular inheritance.'),
    ('canon','deuteronomy',4,8,'canon','romans',7,12,'free',
      E'*Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12). The apostolic verdict matches Moses'' — the *statutes and judgments so righteous as all this law* (Deuteronomy 4:8) are *holy, and just, and good,* never the curse, never abolished.'),
    ('canon','deuteronomy',4,6,'canon','matthew',5,14,'free',
      E'*Ye are the light of the world. A city that is set on an hill cannot be hid* (Matthew 5:14). Moses'' vision of the Torah *in the sight of the nations* (Deuteronomy 4:6) is the same light: a covenant people keeping the statutes is a city on a hill the nations cannot miss.'),
    ('canon','deuteronomy',4,8,'canon','matthew',5,19,'free',
      E'*Whosoever therefore shall break one of these least commandments, and shall teach men so, he shall be called the least in the kingdom of heaven: but whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19). Far from abolishing the *law so righteous* (Deuteronomy 4:8), the Messiah binds the doing and teaching of it — the same wisdom that makes a people great in the eyes of the nations.'),
    ('canon','deuteronomy',4,8,'apocrypha','ecclesiasticus',24,23,'extras',
      E'*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23). The 2nd-Temple sages already read Deuteronomy''s claim — *statutes and judgments so righteous as all this law* (Deuteronomy 4:8) — as Wisdom herself: the divine Wisdom IS the Torah Moses gave for an heritage.'),

    -- THREAD 3: ye heard the voice but saw no similitude (v.12, 15-19)
    ('canon','deuteronomy',4,16,'canon','exodus',20,4,'free',
      E'*Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth* (Exodus 20:4). Moses grounds the second word in the theophany itself: because *ye heard the voice of the words, but saw no similitude* (Deuteronomy 4:12), make no *graven image, the similitude of any figure* (Deuteronomy 4:16). The Formless Source cannot be carved.'),
    ('canon','deuteronomy',4,12,'canon','exodus',33,20,'free',
      E'*And he said, Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). The unseen face is the reason Yashar''el *saw no similitude; only ye heard a voice* (Deuteronomy 4:12) — the Father is heard, never beheld in form.'),
    ('canon','deuteronomy',4,15,'canon','isaiah',40,18,'free',
      E'*To whom then will ye liken Elohim (God)? or what likeness will ye compare unto him?* (Isaiah 40:18). Isaiah presses Moses'' logic forward: since *ye saw no manner of similitude on the day that Yahuah (LORD) spake unto you in Horeb* (Deuteronomy 4:15), no likeness can be compared to Him at all.'),
    ('canon','deuteronomy',4,12,'canon','john',1,18,'free',
      E'*No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18). This is the Formed/Formless lens of Deuteronomy 4 made explicit: Yashar''el *saw no similitude; only ye heard a voice* (Deuteronomy 4:12) — the invisible Father is declared and made visible only in the only begotten Son, the Formed Word.'),
    ('canon','deuteronomy',4,12,'canon','john',5,37,'free',
      E'*And the Father himself, which hath sent me, hath borne witness of me. Ye have neither heard his voice at any time, nor seen his shape* (John 5:37). The Messiah affirms the Sinai truth — no man has *seen his shape,* the very point of *ye saw no similitude* (Deuteronomy 4:12): the Father is the unseen Source, witnessed in the Formed Son who was sent.'),
    ('canon','deuteronomy',4,19,'apocrypha','the-wisdom-of-solomon',13,1,'extras',
      E'*Surely vain are all men by nature, who are ignorant of Yahuah (God), and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster* (Wisdom of Solomon 13:1). The warning against being *driven to worship... the sun, and the moon, and the stars, even all the host of heaven* (Deuteronomy 4:19) is exactly the folly Wisdom names: mistaking the creature for the Creator.'),
    ('canon','deuteronomy',4,19,'apocrypha','the-wisdom-of-solomon',13,2,'extras',
      E'*But deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world* (Wisdom of Solomon 13:2). A direct gloss on Deuteronomy 4:19 — the *circle of the stars* and *the lights of heaven* are the very *sun, and the moon, and the stars... all the host of heaven* Moses forbids the people to worship.'),
    ('canon','deuteronomy',4,12,'apocrypha','baruch-with-the-letter-of-jeremiah',3,37,'extras',
      E'*Afterward did he shew himself upon earth, and conversed with men* (Baruch 3:37). The unseen One whose *similitude* Yashar''el could not behold — *ye heard the voice of the words, but saw no similitude* (Deuteronomy 4:12) — is the same who would *shew himself upon earth,* the Formed Son made visible.'),

    -- THREAD 4: a consuming fire, a jealous El (v.24)
    ('canon','deuteronomy',4,24,'canon','exodus',34,14,'free',
      E'*For thou shalt worship no other god: for Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* (Exodus 34:14). Moses'' warning that *Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* (Deuteronomy 4:24) names the same attribute — His very name is Jealous, which is why no rival image may stand.'),
    ('canon','deuteronomy',4,24,'canon','deuteronomy',9,3,'free',
      E'*Understand therefore this day, that Yahuah Elohayka (the LORD thy God) is he which goeth over before thee; as a consuming fire he shall destroy them* (Deuteronomy 9:3). The same figure Moses uses again — *a consuming fire* (Deuteronomy 4:24) — now turned against the nations before Yashar''el: the jealous fire that brooks no idol also clears the land.'),
    ('canon','deuteronomy',4,24,'canon','hebrews',12,29,'free',
      E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29). The letter to the Hebrews quotes Moses verbatim — *Yahuah Elohayka (the LORD thy God) is a consuming fire* (Deuteronomy 4:24) — proving the God of Sinai is unchanged: the same holy, jealous fire under the new covenant as under the old.'),

    -- THREAD 5: scattered, yet in the latter days he will not forsake thee (v.25-31)
    ('canon','deuteronomy',4,27,'canon','leviticus',26,33,'free',
      E'*And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste* (Leviticus 26:33). The covenant-curse Moses foretells — *Yahuah (LORD) shall scatter you among the nations, and ye shall be left few in number among the heathen* (Deuteronomy 4:27) — is the same scattering Leviticus already wrote into the covenant.'),
    ('canon','deuteronomy',4,31,'canon','leviticus',26,44,'free',
      E'*And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God)* (Leviticus 26:44). This is the mercy of Deuteronomy 4:31 — *he will not forsake thee, neither destroy thee, nor forget the covenant of thy fathers* — the El who scatters but never breaks faith with His people.'),
    ('canon','deuteronomy',4,30,'canon','deuteronomy',30,1,'free',
      E'*And it shall come to pass, when all these things are come upon thee, the blessing and the curse, which I have set before thee, and thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee* (Deuteronomy 30:1). The turning *in the latter days* (Deuteronomy 4:30) is unfolded six chapters on — the scattered people calling the covenant to mind among the nations.'),
    ('canon','deuteronomy',4,29,'canon','deuteronomy',30,3,'free',
      E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). The promise that *if from thence thou shalt seek Yahuah... thou shalt find him* (Deuteronomy 4:29) becomes the two-house ingathering: gathered from all the nations into which they were scattered.'),
    ('canon','deuteronomy',4,29,'canon','nehemiah',1,9,'free',
      E'*But if ye turn unto me, and keep my commandments, and do them; though there were of you cast out unto the uttermost part of the heaven, yet will I gather them from thence, and will bring them unto the place that I have chosen to set my name there* (Nehemiah 1:9). Nehemiah prays Deuteronomy 4 back to Yahuah — *if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him* (Deuteronomy 4:29) — pleading the very mercy Moses promised the scattered.'),
    ('canon','deuteronomy',4,29,'canon','jeremiah',29,13,'free',
      E'*And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). Jeremiah quotes Moses almost word for word — *if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29) — the same condition, the same finding, given to the exiles in Babylon.'),
    ('canon','deuteronomy',4,31,'canon','jeremiah',29,14,'free',
      E'*And I will be found of you, saith Yahuah (LORD): and I will turn away your captivity, and I will gather you from all the nations... and I will bring you again into the place whence I caused you to be carried away captive* (Jeremiah 29:14). The merciful El who *will not forsake thee, neither destroy thee* (Deuteronomy 4:31) keeps the word in Jeremiah — gathered from all the nations and brought home.'),
    ('canon','deuteronomy',4,31,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The anti-replacement guard: Moses'' promise that *he will not forsake thee, neither destroy thee, nor forget the covenant of thy fathers* (Deuteronomy 4:31) stands — Yahuah has NOT cast away His people.'),
    ('canon','deuteronomy',4,31,'canon','romans',11,28,'free',
      E'*As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes. For the gifts and calling of Elohim (God) are without repentance* (Romans 11:28-29). The exact ground Moses names — *the covenant of thy fathers which he sware unto them* (Deuteronomy 4:31) — they are *beloved for the fathers'' sakes,* the calling that cannot be revoked.'),
    ('canon','deuteronomy',4,30,'jubilees','jubilees',1,15,'extras',
      E'*And after this they will turn to Me from amongst the nations with all their heart and with all their soul and with all their strength, and I shall gather them from amongst all the nations, and they will seek Me, so that I shall be found of them, when they seek Me with all their heart and with all their soul* (Jubilees 1:15). The restored witness sings Deuteronomy 4:29-30 nearly verbatim — *if thou turn to Yahuah Elohayka (the LORD thy God)... thou shalt find him, if thou seek him with all thy heart and with all thy soul* — the latter-days return and ingathering.'),

    -- THREAD 6: did ever people hear the voice of Elohim and live (v.33-36)
    ('canon','deuteronomy',4,34,'canon','exodus',19,5,'free',
      E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). The God who *assayed to go and take him a nation from the midst of another nation* (Deuteronomy 4:34) declared His purpose at the same mountain: a peculiar treasure, a kingdom of priests.'),
    ('canon','deuteronomy',4,36,'canon','hebrews',12,18,'free',
      E'*For ye are not come unto the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest, And the sound of a trumpet, and the voice of words; which voice they that heard intreated that the word should not be spoken to them any more* (Hebrews 12:18-19). This is Moses'' awe — *Did ever people hear the voice of Elohim (God) speaking out of the midst of the fire, as thou hast heard, and live?* (Deuteronomy 4:33) — the burning mount whose voice they could not bear.'),

    -- THREAD 7: Yahuah he is Elohim; there is none else beside him (v.35, 39)
    ('canon','deuteronomy',4,35,'canon','deuteronomy',6,4,'free',
      E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4). The confession Moses presses in *Yahuah (LORD) he is Elohim (God); there is none else beside him* (Deuteronomy 4:35) is sealed two chapters on as the Shema — the one Yahuah, none else.'),
    ('canon','deuteronomy',4,35,'canon','isaiah',45,5,'free',
      E'*I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me* (Isaiah 45:5). Isaiah carries Moses'' words forward whole — *there is none else beside him* (Deuteronomy 4:35) — the sole Yahuah who alone is Elohim.'),
    ('canon','deuteronomy',4,39,'canon','isaiah',45,21,'free',
      E'*...have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me. Look unto me, and be ye saved, all the ends of the earth: for I am Elohim (God), and there is none else* (Isaiah 45:21-22). Moses'' charge to *know therefore this day... that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39) is Isaiah''s gospel to the ends of the earth.'),
    ('canon','deuteronomy',4,35,'canon','mark',12,32,'free',
      E'*And the scribe said unto him, Well, Master, thou hast said the truth: for there is one Elohim (God); and there is none other but he* (Mark 12:32). The scribe confesses Deuteronomy 4:35 back to the Messiah — *Yahuah (LORD) he is Elohim (God); there is none else beside him* — and the Messiah commends him: the Shema unbroken into the Gospel.'),
    ('canon','deuteronomy',4,39,'apocrypha','baruch-with-the-letter-of-jeremiah',3,35,'extras',
      E'*This is our Elohim (God), and there shall none other be accounted of in comparison of him* (Baruch 3:35). The restored witness repeats Moses'' confession — *Yahuah (LORD) he is Elohim (God)... there is none else* (Deuteronomy 4:39) — none other to be accounted of beside Him.'),
    ('canon','deuteronomy',4,39,'apocrypha','baruch-with-the-letter-of-jeremiah',3,36,'extras',
      E'*He has found out all the way of knowledge, and has given it to Jacob his servant, and to Yashar''el (Israel) his beloved* (Baruch 3:36). The one Elohim of Deuteronomy 4:39 *there is none else* is the same who gave the way of knowledge — the Torah-wisdom — to Jacob and Yashar''el alone.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- threads
-- ============================================================================

-- THREAD 1 (v.2)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-4-add-not-nor-diminish-the-word-the-canon-guard',
  E'Add not, nor diminish — the canon guard',
  E'Moses fences the covenant-word the moment he begins to expound it: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God)* (Deuteronomy 4:2). The Torah is the fixed, sufficient word — not to be amended, not to be cut down, never abolished. He repeats it within the same book: *What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32), and Wisdom seals it: *Every word of Elohim (God) is pure... Add thou not unto his words, lest he reprove thee, and thou be found a liar* (Proverbs 30:5-6). The whole library closes with the identical guard: *If any man shall add unto these things, Elohim (God) shall add unto him the plagues* (Revelation 22:18), and *if any man shall take away from the words... Elohim (God) shall take away his part out of the book of life* (Revelation 22:19). The first page of the sermon and the last page of the prophecy fence the same word.',
  sv.verse_id, ev.verse_id, 'free', 24575
  FROM _s310_deu04_lookup sv, _s310_deu04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (v.6-8)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations',
  E'This is your wisdom — the Torah draws the nations',
  E'Moses calls the Torah Yashar''el (Israel)''s wisdom in the eyes of the watching world: *Keep therefore and do them; for this is your wisdom and your understanding in the sight of the nations... Surely this great nation is a wise and understanding people* (Deuteronomy 4:6), *what nation is there so great, who hath Elohim (God) so nigh unto them* (Deuteronomy 4:7), *what nation is there so great, that hath statutes and judgments so righteous as all this law* (Deuteronomy 4:8). David sings the same: *The law of Yahuah (LORD) is perfect, converting the soul... The statutes of Yahuah (LORD) are right, rejoicing the heart* (Psalm 19:7-8); and *He sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel). He hath not dealt so with any nation* (Psalm 147:19-20). The apostolic verdict agrees — *the law is holy, and the commandment holy, and just, and good* (Romans 7:12) — and the Messiah binds it as light to the nations: *Ye are the light of the world. A city that is set on an hill cannot be hid* (Matthew 5:14); *whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19). The 2nd-Temple sages already named the Torah as Wisdom herself: *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23). The Torah is never the curse — it is the righteousness that draws the nations to Yahuah.',
  sv.verse_id, ev.verse_id, 'extras', 24578
  FROM _s310_deu04_lookup sv, _s310_deu04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (v.12, 15-19)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude',
  E'Ye heard the voice, but saw no similitude — the Formless and the Formed',
  E'At Horeb Yashar''el (Israel) met Yahuah by hearing, not by sight: *ye heard the voice of the words, but saw no similitude; only ye heard a voice* (Deuteronomy 4:12); *ye saw no manner of similitude on the day that Yahuah (LORD) spake unto you* (Deuteronomy 4:15). Therefore make no image — not *the likeness of male or female* (Deuteronomy 4:16), no beast, fowl, fish (Deuteronomy 4:17-18), and do not be *driven to worship... the sun, and the moon, and the stars, even all the host of heaven* (Deuteronomy 4:19). The reason is the Formless Source Himself: *Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20); *Thou shalt not make unto thee any graven image* (Exodus 20:4); *To whom then will ye liken Elohim (God)?* (Isaiah 40:18). The New Testament makes the lens explicit: *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18); *Ye have neither heard his voice at any time, nor seen his shape* (John 5:37). The Father is heard and never beheld in form — He is declared and made visible only in the Formed Son, the One Baruch foresaw: *Afterward did he shew himself upon earth, and conversed with men* (Baruch 3:37). And the warning against worshipping the host of heaven is the folly Wisdom names — *deemed... the circle of the stars, or the lights of heaven, to be the gods which govern the world* (Wisdom of Solomon 13:1-2): the creature mistaken for the Creator.',
  sv.verse_id, ev.verse_id, 'extras', 24581
  FROM _s310_deu04_lookup sv, _s310_deu04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=4 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (v.24)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-4-a-consuming-fire-a-jealous-el',
  E'A consuming fire, even a jealous El',
  E'The ground of the no-image command is the very nature of Yahuah: *For Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* (Deuteronomy 4:24). His name itself is the warrant — *Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* (Exodus 34:14) — which is why no rival image may stand. The same fire clears the land before His people: *as a consuming fire he shall destroy them* (Deuteronomy 9:3). And the letter to the Hebrews quotes Moses verbatim to prove the God of Sinai is unchanged: *For our Elohim (God) is a consuming fire* (Hebrews 12:29). The holy, jealous fire is the same under the new covenant as under the old.',
  sv.verse_id, ev.verse_id, 'free', 24584
  FROM _s310_deu04_lookup sv, _s310_deu04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (v.25-31)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee',
  E'Scattered, yet in the latter days he will not forsake thee',
  E'Moses foresees the whole arc — corruption, exile, and merciful return. When the people corrupt themselves *Yahuah (LORD) shall scatter you among the nations, and ye shall be left few in number among the heathen* (Deuteronomy 4:27); yet *if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29), and *in the latter days, if thou turn to Yahuah Elohayka (the LORD thy God)... he will not forsake thee, neither destroy thee, nor forget the covenant of thy fathers* (Deuteronomy 4:30-31). The scattering was already written into the covenant: *I will scatter you among the heathen* (Leviticus 26:33), as was the mercy: *yet for all that, when they be in the land of their enemies, I will not cast them away... for I am Yahuah (LORD) their Elohim (God)* (Leviticus 26:44). The same turning and ingathering returns: *thou shalt call them to mind among all the nations* (Deuteronomy 30:1); *he will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3) — the two-house regathering. Nehemiah pleads it (*though there were of you cast out unto the uttermost part of the heaven, yet will I gather them from thence* — Nehemiah 1:9), Jeremiah quotes it to the exiles (*ye shall seek me, and find me, when ye shall search for me with all your heart... I will gather you from all the nations* — Jeremiah 29:13-14), and the restored witness sings it almost word for word (*they will turn to Me from amongst the nations with all their heart... I shall gather them from amongst all the nations* — Jubilees 1:15). And the anti-replacement guard stands: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *as touching the election, they are beloved for the fathers'' sakes. For the gifts and calling of Elohim (God) are without repentance* (Romans 11:28-29) — the very *covenant of thy fathers* Moses said He would not forget.',
  sv.verse_id, ev.verse_id, 'extras', 24587
  FROM _s310_deu04_lookup sv, _s310_deu04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=4 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (v.33-36)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-4-did-ever-people-hear-the-voice-of-elohim-and-live',
  E'Did ever people hear the voice of Elohim — and live?',
  E'Moses stands amazed at the singular grace of Sinai: *Did ever people hear the voice of Elohim (God) speaking out of the midst of the fire, as thou hast heard, and live?* (Deuteronomy 4:33); *Or hath Elohim (God) assayed to go and take him a nation from the midst of another nation, by temptations, by signs, and by wonders... according to all that Yahuah Elohaychem (the LORD your God) did for you in Egypt* (Deuteronomy 4:34); *Out of heaven he made thee to hear his voice, that he might instruct thee: and upon earth he shewed thee his great fire* (Deuteronomy 4:36). The God who took a nation from the midst of a nation declared His purpose at that same mountain: *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5). And the Hebrews letter recalls the terror of that voice: *ye are not come unto the mount that might be touched, and that burned with fire... And the sound of a trumpet, and the voice of words; which voice they that heard intreated that the word should not be spoken to them any more* (Hebrews 12:18-19) — the burning mount whose living voice no other nation has heard.',
  sv.verse_id, ev.verse_id, 'free', 24590
  FROM _s310_deu04_lookup sv, _s310_deu04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=4 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (v.35, 39)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-4-yahuah-he-is-elohim-there-is-none-else-beside-him',
  E'Yahuah he is Elohim; there is none else beside him',
  E'The sermon rises to the great confession that will be sealed as the Shema: *Unto thee it was shewed, that thou mightest know that Yahuah (LORD) he is Elohim (God); there is none else beside him* (Deuteronomy 4:35); *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39). Two chapters on it becomes the watchword of Yashar''el: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4). Isaiah carries the same oracle whole — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me* (Isaiah 45:5); *there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour... Look unto me, and be ye saved, all the ends of the earth* (Isaiah 45:21-22). The scribe confesses it back to the Messiah, who commends him: *there is one Elohim (God); and there is none other but he* (Mark 12:32). And the restored witness repeats it: *This is our Elohim (God), and there shall none other be accounted of in comparison of him* (Baruch 3:35), the same One who *has given* the way of knowledge *to Jacob his servant, and to Yashar''el (Israel) his beloved* (Baruch 3:36). One Yahuah, none else — the Father the formless Source, made known in the Formed Son.',
  sv.verse_id, ev.verse_id, 'extras', 24593
  FROM _s310_deu04_lookup sv, _s310_deu04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=4 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- thread_members
-- ============================================================================

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32) — Moses gives the same guard twice in one book.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-add-not-nor-diminish-the-word-the-canon-guard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Add thou not unto his words, lest he reprove thee, and thou be found a liar* (Proverbs 30:5-6) — Wisdom echoes the charge.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-add-not-nor-diminish-the-word-the-canon-guard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*If any man shall add unto these things, Elohim (God) shall add unto him the plagues* (Revelation 22:18) — the library''s last page seals the same fence.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-add-not-nor-diminish-the-word-the-canon-guard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*if any man shall take away from the words... Elohim (God) shall take away his part out of the book of life* (Revelation 22:19) — the *diminish* half answered at the consummation.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-add-not-nor-diminish-the-word-the-canon-guard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The law of Yahuah (LORD) is perfect, converting the soul* (Psalm 19:7) — the Torah is the wisdom that makes the simple wise.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The statutes of Yahuah (LORD) are right... the commandment of Yahuah (LORD) is pure* (Psalm 19:8) — the righteousness no other nation holds.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* (Psalm 147:19) — the nearness Moses marvels at.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He hath not dealt so with any nation* (Psalm 147:20) — no other nation has statutes so righteous.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the law is holy, and the commandment holy, and just, and good* (Romans 7:12) — the apostolic verdict matches Moses''.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Ye are the light of the world. A city that is set on an hill cannot be hid* (Matthew 5:14) — the Torah-keeping people seen by the nations.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19) — the Messiah binds the doing of the law, not its abolition.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23) — the 2nd-Temple sages equate Wisdom with the Torah.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-this-is-your-wisdom-the-torah-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt not make unto thee any graven image* (Exodus 20:4) — the second word, grounded in the formless theophany.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*there shall no man see me, and live* (Exodus 33:20) — the unseen face is why they saw no similitude.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*To whom then will ye liken Elohim (God)?* (Isaiah 40:18) — no likeness can be compared to the Formless Source.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*No man hath seen Elohim (God) at any time; the only begotten Son... hath declared him* (John 1:18) — the Formed makes the Formless visible.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Ye have neither heard his voice at any time, nor seen his shape* (John 5:37) — the Messiah affirms the Sinai truth.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*could not out of the good things that are seen know him that is* (Wisdom of Solomon 13:1) — the idolater''s folly Moses forbids.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the circle of the stars, or... the lights of heaven, to be the gods* (Wisdom of Solomon 13:2) — directly the host of heaven Moses forbids worshipping.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=19
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Afterward did he shew himself upon earth, and conversed with men* (Baruch 3:37) — the unseen One foreseen as the Formed Son made visible.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-ye-heard-the-voice-but-saw-no-similitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* (Exodus 34:14) — His very name is the warrant against rival images.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=24
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-a-consuming-fire-a-jealous-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*as a consuming fire he shall destroy them* (Deuteronomy 9:3) — the same figure turned against the nations.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=24
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-a-consuming-fire-a-jealous-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29) — Moses quoted verbatim; the God of Sinai unchanged.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=24
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-a-consuming-fire-a-jealous-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will scatter you among the heathen* (Leviticus 26:33) — the scattering written into the covenant.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=27
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will not cast them away... for I am Yahuah (LORD) their Elohim (God)* (Leviticus 26:44) — the mercy of Deuteronomy 4:31, the unbroken covenant.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=31
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee* (Deuteronomy 30:1) — the latter-days turning unfolded.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=30
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he will return and gather thee from all the nations, whither... he hath scattered thee* (Deuteronomy 30:3) — the two-house ingathering.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=29
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*though there were of you cast out unto the uttermost part of the heaven, yet will I gather them* (Nehemiah 1:9) — Nehemiah prays Deuteronomy 4 back to Yahuah.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=29
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13) — Moses'' condition quoted to the exiles.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=29
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*I will turn away your captivity, and I will gather you from all the nations* (Jeremiah 29:14) — the merciful El keeps the word.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=31
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the anti-replacement guard; the promise stands.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=31
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*they are beloved for the fathers'' sakes. For the gifts and calling of Elohim (God) are without repentance* (Romans 11:28-29) — the very covenant of the fathers Moses said He would not forget.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=31
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*they will turn to Me from amongst the nations with all their heart... I shall gather them from amongst all the nations* (Jubilees 1:15) — the restored witness sings Deuteronomy 4:29-30 nearly verbatim.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=30
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-scattered-yet-in-the-latter-days-he-will-not-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5) — the purpose declared at the same burning mountain.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=34
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-did-ever-people-hear-the-voice-of-elohim-and-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the mount that... burned with fire... the voice of words; which voice they that heard intreated that the word should not be spoken to them any more* (Hebrews 12:18-19) — the awe of the living voice no other nation heard.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=36
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-did-ever-people-hear-the-voice-of-elohim-and-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) — the confession sealed two chapters on as the Shema.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=35
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-yahuah-he-is-elohim-there-is-none-else-beside-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me* (Isaiah 45:5) — Isaiah carries Moses'' words forward whole.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=35
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-yahuah-he-is-elohim-there-is-none-else-beside-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Look unto me, and be ye saved, all the ends of the earth: for I am Elohim (God), and there is none else* (Isaiah 45:21-22) — Moses'' charge become Isaiah''s gospel to the nations.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=39
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-yahuah-he-is-elohim-there-is-none-else-beside-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*there is one Elohim (God); and there is none other but he* (Mark 12:32) — the scribe confesses Deuteronomy 4:35 back to the Messiah.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=35
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-yahuah-he-is-elohim-there-is-none-else-beside-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*This is our Elohim (God), and there shall none other be accounted of in comparison of him* (Baruch 3:35) — the restored witness repeats the confession.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=39
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-yahuah-he-is-elohim-there-is-none-else-beside-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*has given it to Jacob his servant, and to Yashar''el (Israel) his beloved* (Baruch 3:36) — the one Elohim who gave the Torah-wisdom to His people alone.'
  FROM cross_reference_threads t
  JOIN _s310_deu04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=4 AND sv.verse_number=39
  JOIN _s310_deu04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-4-yahuah-he-is-elohim-there-is-none-else-beside-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_deuteronomy_5.sql (Deuteronomy 5) -----
-- Chapter: Deuteronomy 5 — the Ten Words restated at Horeb + Moses the mediator + the new-heart longing.
-- Tag: deu05 | Session prefix: s310 | Temp view: _s310_deu05_lookup
-- Sort band base 24600, step 3.
--
-- FRAMING: The Decalogue restated to the generation entering the land. The covenant at Horeb is
--   LIVING, not "made with our fathers" only but "with us, even us, who are all of us here alive
--   this day" (5:3) — the perpetual-present of the covenant. The Ten Words are grouped sensibly:
--   first table (gods/image/Name), the Sabbath (here Egypt-deliverance-grounded, complementing
--   Exodus 20:11's creation-grounding — the Sabbath STANDING, not abolished), honour-of-parents
--   (the first commandment with promise), and the second table. Moses standing between Yahuah and
--   the people (5:5) sets up the one Mediator and the Prophet-like-Moses (Deut 18). The terror at
--   the voice/fire (5:23-27) is the very request Yahuah answers with the Prophet (Deut 18:16-18)
--   and which Hebrews 12 contrasts with mount Sion. The new-heart longing (5:29) is answered by
--   the new covenant — Torah written on the heart (Jer 31 / Ezek 36 / Heb 8 / Jubilees 1) — NOT
--   Torah abolished. The closing "turn not aside" (5:32-33) is the obedience-unto-life spine.
--
-- Deuteronomy 5 coverage:
--   v.1-5  NT:     none warranted (face-to-face covenant carried lateral + into mediator thread)
--          Extras: none warranted
--          Tanakh: Exodus 19:9,16-19 (lateral, the Horeb theophany)
--   v.6-11 NT:     1 Corinthians 8:4-6 (one Elohim, the Father + one Lord — Formed/Formless on no-other-gods/no-image)
--          Extras: none warranted
--          Tanakh: Exodus 20:2-7 (lateral, the same Words)
--   v.12-15 NT:    Mark 2:27-28 (Sabbath made for man; Son of Adam Lord of it), Hebrews 4:9 (rest remains)
--          Extras: none warranted
--          Tanakh: Exodus 20:8-11 (lateral, creation-grounding complement)
--   v.16   NT:     Ephesians 6:2-3 (first commandment with promise), Matthew 15:4 (honour father/mother affirmed)
--          Extras: none warranted
--          Tanakh: Exodus 20:12 (lateral)
--   v.17-21 NT:    Romans 13:9, Matthew 5:21,27, James 2:11 (second table affirmed, deepened to the heart)
--          Extras: none warranted
--          Tanakh: Exodus 20:13-17 (lateral)
--   v.5,23-27 NT:  1 Timothy 2:5, Galatians 3:19, Hebrews 12:18-21 (Moses the mediator; the terror)
--          Extras: none warranted
--          Tanakh: Deuteronomy 18:15-18 (the Prophet like Moses answering this request)
--   v.29   NT:     Hebrews 8:10 (the new covenant)
--          Extras: Jubilees 1:23 (circumcise the foreskin of the heart, a holy spirit)
--          Tanakh: Jeremiah 31:33, Ezekiel 36:26-27 (Torah on the heart; new heart, my Spirit)
--   v.32-33 NT:    none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 28:14, Joshua 1:7, Proverbs 4:27 (turn not aside, that ye may live)
--
-- Threads (8):
--   deuteronomy-5-the-living-covenant-at-horeb-face-to-face            [Tanakh]        free
--   deuteronomy-5-the-ten-words-first-table-none-other-gods           [Tanakh, NT]    free
--   deuteronomy-5-keep-the-sabbath-day-standing-not-abolished         [Tanakh, NT]    free
--   deuteronomy-5-honour-thy-father-and-thy-mother-first-with-promise [Tanakh, NT]    free
--   deuteronomy-5-the-second-table-kill-adultery-steal-witness-covet  [Tanakh, NT]    free
--   deuteronomy-5-i-stood-between-yahuah-and-you-the-one-mediator     [Tanakh, NT]    free
--   deuteronomy-5-o-that-there-were-such-an-heart-the-new-covenant    [Tanakh, NT, Extras] extras
--   deuteronomy-5-turn-not-aside-to-the-right-hand-or-to-the-left     [Tanakh]        free

CREATE TEMP VIEW _s310_deu05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== CROSS_REFERENCES =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the living covenant at Horeb (5:2-5 -> Exodus 19)
    ('canon','deuteronomy',5,3,'canon','exodus',19,9,'free',
     E'*And Yahuah (LORD) said unto Moses, Lo, I come unto thee in a thick cloud, that the people may hear when I speak with thee, and believe thee for ever* (Exodus 19:9). Moses says the covenant was *made not... with our fathers, but with us, even us, who are all of us here alive this day* (Deuteronomy 5:3) — the same thick-cloud descent at Horeb, retold to the new generation as a LIVING present, not a closed antique.'),
    ('canon','deuteronomy',5,4,'canon','exodus',19,18,'free',
     E'*And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly* (Exodus 19:18). This is the *fire* Moses recalls in *Yahuah (LORD) talked with you face to face in the mount out of the midst of the fire* (Deuteronomy 5:4) — the theophany of the Formed Son who descended and spoke.'),
    ('canon','deuteronomy',5,4,'canon','exodus',19,19,'free',
     E'*And when the voice of the trumpet sounded long, and waxed louder and louder, Moses spake, and Elohim (God) answered him by a voice* (Exodus 19:19). The audible *voice* that answered Moses at Sinai is the same *face to face* speaking Moses recounts in *Yahuah (LORD) talked with you face to face* (Deuteronomy 5:4).'),

    -- Thread 2: first table (5:6-11 -> Exodus 20, 1 Cor 8)
    ('canon','deuteronomy',5,6,'canon','exodus',20,2,'free',
     E'*I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* (Exodus 20:2). The Ten Words open in both tellings with the deliverance as the ground of obedience — *I am Yahuah Elohayka (the LORD thy God), which brought thee out of the land of Egypt, from the house of bondage* (Deuteronomy 5:6): grace first, then the commandments.'),
    ('canon','deuteronomy',5,7,'canon','exodus',20,3,'free',
     E'*Thou shalt have no other gods before me* (Exodus 20:3). Word for word the first commandment of the first table, restated in *Thou shalt have none other gods before me* (Deuteronomy 5:7) — the one Yahuah and no rival.'),
    ('canon','deuteronomy',5,7,'canon','1-corinthians',8,6,'free',
     E'*But to us there is but one Elohim (God), the Father, of whom are all things, and we in him; and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things, and we by him* (1 Corinthians 8:6). Paul reads *Thou shalt have none other gods before me* (Deuteronomy 5:7) exactly: the one Source-Father, and the one Formed Lord through whom all things are — never a pantheon, never a co-equal rival, the Formed drawn from the Formless.'),
    ('canon','deuteronomy',5,8,'canon','exodus',20,4,'free',
     E'*Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth* (Exodus 20:4). The same prohibition of the graven image stands in *Thou shalt not make thee any graven image, or any likeness of any thing* (Deuteronomy 5:8) — Yahuah is worshipped by his Word and his Name, not by a carved form.'),
    ('canon','deuteronomy',5,11,'canon','exodus',20,7,'free',
     E'*Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7). The Name-commandment is restated verbatim in *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain* (Deuteronomy 5:11) — the Name is holy and guarded.'),

    -- Thread 3: the Sabbath (5:12-15 -> Exodus 20:8-11, Mark 2, Heb 4)
    ('canon','deuteronomy',5,12,'canon','exodus',20,8,'free',
     E'*Remember the sabbath day, to keep it holy* (Exodus 20:8). The Sabbath command stands in both tellings — *Keep the sabbath day to sanctify it, as Yahuah Elohayka (the LORD thy God) hath commanded thee* (Deuteronomy 5:12); one ledger reads *remember*, the other *keep*, but it is the one seventh-day appointment.'),
    ('canon','deuteronomy',5,15,'canon','exodus',20,11,'free',
     E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). Exodus grounds the Sabbath in CREATION; Deuteronomy grounds it in REDEMPTION — *remember that thou wast a servant in the land of Egypt... therefore Yahuah Elohayka (the LORD thy God) commanded thee to keep the sabbath day* (Deuteronomy 5:15). Two grounds, one sign: the day that hallows both maker and deliverer.'),
    ('canon','deuteronomy',5,14,'canon','mark',2,27,'free',
     E'*And he said unto them, The sabbath was made for man, and not man for the sabbath* (Mark 2:27). The Deuteronomy command itself is a mercy — *that thy manservant and thy maidservant may rest as well as thou* (Deuteronomy 5:14); Messiah affirms its design, not its abolition: it was MADE for man.'),
    ('canon','deuteronomy',5,14,'canon','mark',2,28,'free',
     E'*Therefore the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:28). The Formed Son who gave the Sabbath at Horeb — *the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God)* (Deuteronomy 5:14) — is its Lord, owning and upholding it, not cancelling it.'),
    ('canon','deuteronomy',5,14,'canon','hebrews',4,9,'free',
     E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The weekly *sabbath of Yahuah Elohayka (the LORD thy God)* (Deuteronomy 5:14) is the standing pledge of the rest that yet remains — the Sabbath is not retired but consummated.'),

    -- Thread 4: honour father and mother (5:16 -> Exodus 20:12, Eph 6, Matt 15)
    ('canon','deuteronomy',5,16,'canon','exodus',20,12,'free',
     E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). The fifth commandment with its land-promise stands in both — *Honour thy father and thy mother... that thy days may be prolonged, and that it may go well with thee, in the land* (Deuteronomy 5:16).'),
    ('canon','deuteronomy',5,16,'canon','ephesians',6,2,'free',
     E'*Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2). Paul names this very Word — *that thy days may be prolonged, and that it may go well with thee* (Deuteronomy 5:16) — as the first commandment carrying a promise, binding on the children he writes to: the Torah affirmed, not abolished.'),
    ('canon','deuteronomy',5,16,'canon','ephesians',6,3,'free',
     E'*That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3). Paul quotes the Deuteronomy form of the promise almost word for word — *that it may go well with thee, in the land* (Deuteronomy 5:16) — the blessing still attached.'),
    ('canon','deuteronomy',5,16,'canon','matthew',15,4,'free',
     E'*For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death* (Matthew 15:4). Messiah quotes this commandment against the tradition that voided it — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee* (Deuteronomy 5:16) — and rebukes man-made rules that nullify Torah.'),

    -- Thread 5: second table (5:17-21 -> Exodus 20:13-17, Rom 13, Matt 5, James 2)
    ('canon','deuteronomy',5,17,'canon','exodus',20,13,'free',
     E'*Thou shalt not kill* (Exodus 20:13). The second table opens identically — *Thou shalt not kill* (Deuteronomy 5:17) — the same Words written *in two tables of stone* (Deuteronomy 5:22).'),
    ('canon','deuteronomy',5,21,'canon','exodus',20,17,'free',
     E'*Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s* (Exodus 20:17). The coveting prohibition that ends the table stands in both — *Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house... or any thing that is thy neighbour''s* (Deuteronomy 5:21) — the law reaching into the heart.'),
    ('canon','deuteronomy',5,17,'canon','romans',13,9,'free',
     E'*For this, Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet; and if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9). Paul recites the second table — *Thou shalt not kill... commit adultery... steal... bear false witness... covet* (Deuteronomy 5:17-21) — as the very content of love, fulfilled not deleted.'),
    ('canon','deuteronomy',5,18,'canon','matthew',5,27,'free',
     E'*Ye have heard that it was said by them of old time, Thou shalt not commit adultery* (Matthew 5:27). Messiah takes up *Neither shalt thou commit adultery* (Deuteronomy 5:18) and presses it to its root in the heart — deepening the commandment, never repealing it.'),
    ('canon','deuteronomy',5,17,'canon','matthew',5,21,'free',
     E'*Ye have heard that it was said by them of old time, Thou shalt not kill; and whosoever shall kill shall be in danger of the judgment* (Matthew 5:21). Messiah takes *Thou shalt not kill* (Deuteronomy 5:17) and traces it to anger in the heart — the commandment intensified.'),
    ('canon','deuteronomy',5,18,'canon','james',2,11,'free',
     E'*For he that said, Do not commit adultery, said also, Do not kill. Now if thou commit no adultery, yet if thou kill, thou art become a transgressor of the law* (James 2:11). James reads the two tables as one indivisible Torah — *Neither shalt thou commit adultery... Thou shalt not kill* (Deuteronomy 5:17-18) come from the one Lawgiver, and to break one is to be a transgressor.'),

    -- Thread 6: Moses the mediator + the terror (5:5,23-27 -> Deut 18, 1 Tim 2, Gal 3, Heb 12)
    ('canon','deuteronomy',5,5,'canon','1-timothy',2,5,'free',
     E'*For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). Moses standing *between Yahuah (LORD) and you at that time, to shew you the word of Yahuah (LORD)* (Deuteronomy 5:5) is the pattern of the one Mediator who would come — the man who stands between Elohim and men.'),
    ('canon','deuteronomy',5,5,'canon','galatians',3,19,'free',
     E'*Wherefore then serveth the law? It was added because of transgressions, till the seed should come to whom the promise was made; and it was ordained by angels in the hand of a mediator* (Galatians 3:19). The Torah was given at Horeb *in the hand of a mediator* — Moses, who *stood between Yahuah (LORD) and you* (Deuteronomy 5:5); a mediator implies the two parties he joins.'),
    ('canon','deuteronomy',5,27,'canon','deuteronomy',18,16,'free',
     E'*According to all that thou desiredst of Yahuah Elohayka (the LORD thy God) in Horeb in the day of the assembly, saying, Let me not hear again the voice of Yahuah Elohai (the LORD my God), neither let me see this great fire any more, that I die not* (Deuteronomy 18:16). The people''s plea *Go thou near, and hear all that Yahuah Eloheinu (the LORD our God) shall say... we will hear it, and do it* (Deuteronomy 5:27) is the exact request Yahuah answers by promising the Prophet like Moses.'),
    ('canon','deuteronomy',5,27,'canon','deuteronomy',18,18,'free',
     E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The terror at the voice that made the people beg *speak thou unto us... we will hear it, and do it* (Deuteronomy 5:27) is answered with the Prophet-like-Moses — the Formed Son who would speak the Father''s words.'),
    ('canon','deuteronomy',5,25,'canon','hebrews',12,21,'free',
     E'*And so terrible was the sight, that Moses said, I exceedingly fear and quake* (Hebrews 12:21). Hebrews recalls the very dread of *Now therefore why should we die? for this great fire will consume us* (Deuteronomy 5:25) — the unbearable mount that drives the contrast with mount Sion.'),
    ('canon','deuteronomy',5,26,'canon','hebrews',12,18,'free',
     E'*For ye are not come unto the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest* (Hebrews 12:18). The burning, voice-bearing mount the people *heard the voice of the living Elohim (God) speaking out of the midst of the fire* (Deuteronomy 5:26) is the very mount Hebrews names — and the believer is brought beyond its terror to the heavenly Jerusalem, the same covenant deepened.'),

    -- Thread 7: O that there were such an heart (5:29 -> Jer 31, Ezek 36, Heb 8, Jubilees 1)
    ('canon','deuteronomy',5,29,'canon','jeremiah',31,33,'free',
     E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Yahuah''s longing *O that there were such an heart in them, that they would fear me, and keep all my commandments always* (Deuteronomy 5:29) is answered by the new covenant — the SAME Torah written inward, not a different law.'),
    ('canon','deuteronomy',5,29,'canon','ezekiel',36,26,'free',
     E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). The *heart* Yahuah wished for — *O that there were such an heart in them, that they would fear me* (Deuteronomy 5:29) — he himself supplies in the restoration: a new heart of flesh.'),
    ('canon','deuteronomy',5,29,'canon','ezekiel',36,27,'free',
     E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The wish *that they would... keep all my commandments always* (Deuteronomy 5:29) is fulfilled not by abolishing the statutes but by the Spirit causing the people to WALK in them — Torah-keeping enabled, never cancelled.'),
    ('canon','deuteronomy',5,29,'canon','hebrews',8,10,'free',
     E'*For this is the covenant that I will make with the house of Yashar''el (Israel) after those days, saith Yahuah (Lord); I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10). Hebrews quotes Jeremiah to show the new covenant as Yahuah''s answer to *O that there were such an heart in them* (Deuteronomy 5:29) — the law internalized, the very thing Yahuah longed for.'),
    ('canon','deuteronomy',5,29,'jubilees','jubilees',1,23,'extras',
     E'*And after this they will turn to Me in all uprightness and with all (their) heart and with all (their) soul, and I shall circumcise the foreskin of their heart and the foreskin of the heart of their seed, and I shall create in them a holy spirit, and I shall cleanse them so that they shall not turn away from Me from that day to eternity* (Jubilees 1:23). Jubilees retells this very Horeb scene and gives Yahuah''s own resolution of *O that there were such an heart in them* (Deuteronomy 5:29) — he will circumcise the heart and put his holy spirit within, the new-covenant promise inside the Torah-library itself.'),

    -- Thread 8: turn not aside (5:32-33 -> Deut 28, Joshua 1, Prov 4)
    ('canon','deuteronomy',5,32,'canon','deuteronomy',28,14,'free',
     E'*And thou shalt not go aside from any of the words which I command thee this day, to the right hand, or to the left, to go after other gods to serve them* (Deuteronomy 28:14). The same charge governs the blessing chapter — *ye shall not turn aside to the right hand or to the left* (Deuteronomy 5:32): the straight path of obedience that leads to life.'),
    ('canon','deuteronomy',5,32,'canon','joshua',1,7,'free',
     E'*Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest* (Joshua 1:7). Yahuah hands Joshua the very words Moses gave the people — *ye shall not turn aside to the right hand or to the left* (Deuteronomy 5:32) — the unbroken obedience that prospers in the land.'),
    ('canon','deuteronomy',5,32,'canon','proverbs',4,27,'free',
     E'*Turn not to the right hand nor to the left: remove thy foot from evil* (Proverbs 4:27). Wisdom echoes the Mosaic charge — *ye shall not turn aside to the right hand or to the left* (Deuteronomy 5:32) — the single straight way of the commandments.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== THREADS =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-5-the-living-covenant-at-horeb-face-to-face',
       E'The living covenant at Horeb — face to face out of the fire',
       E'Moses gathers the new generation and insists the covenant is not a relic of the dead: *Yahuah (LORD) made not this covenant with our fathers, but with us, even us, who are all of us here alive this day* (Deuteronomy 5:3). He recalls the theophany — *Yahuah (LORD) talked with you face to face in the mount out of the midst of the fire* (Deuteronomy 5:4) — the descent of the Formed Son. Exodus tells the same scene: *And Yahuah (LORD) said unto Moses, Lo, I come unto thee in a thick cloud, that the people may hear when I speak with thee, and believe thee for ever* (Exodus 19:9), and *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire* (Exodus 19:18), where *Moses spake, and Elohim (God) answered him by a voice* (Exodus 19:19). The covenant of Horeb is a LIVING present, binding on every generation that stands alive before Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 24600
  FROM _s310_deu05_lookup sv, _s310_deu05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-5-the-ten-words-first-table-none-other-gods',
       E'The Ten Words restated — the first table: none other gods, no graven image, the Name',
       E'The Decalogue opens the same in both tellings, grounded in deliverance before command: *I am Yahuah Elohayka (the LORD thy God), which brought thee out of the land of Egypt, from the house of bondage* (Deuteronomy 5:6), matching *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* (Exodus 20:2). The first table guards the worship of the one Yahuah: *Thou shalt have none other gods before me* (Deuteronomy 5:7), *Thou shalt not make thee any graven image* (Deuteronomy 5:8), *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain* (Deuteronomy 5:11). Paul reads the first commandment exactly through the Formed and the Formless: *But to us there is but one Elohim (God), the Father, of whom are all things, and we in him; and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things, and we by him* (1 Corinthians 8:6) — no rival, no carved form, the Father the Source and the Son the expressed Word.',
       sv.verse_id, ev.verse_id, 'free', 24603
  FROM _s310_deu05_lookup sv, _s310_deu05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-5-keep-the-sabbath-day-standing-not-abolished',
       E'Keep the sabbath day — creation-grounded and redemption-grounded, standing not abolished',
       E'The fourth Word stands in both ledgers of the Decalogue: *Keep the sabbath day to sanctify it, as Yahuah Elohayka (the LORD thy God) hath commanded thee* (Deuteronomy 5:12), beside Exodus''s *Remember the sabbath day, to keep it holy* (Exodus 20:8). The two givings carry two grounds for the one sign. Exodus roots it in creation: *For in six days Yahuah (LORD) made heaven and earth... and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). Deuteronomy roots it in redemption: *remember that thou wast a servant in the land of Egypt... therefore Yahuah Elohayka (the LORD thy God) commanded thee to keep the sabbath day* (Deuteronomy 5:15) — a mercy reaching even *thy manservant and thy maidservant* (Deuteronomy 5:14). Messiah affirms its design: *The sabbath was made for man, and not man for the sabbath* (Mark 2:27), *Therefore the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:28) — its Lord, not its abolisher. And it abides as pledge of the rest to come: *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9).',
       sv.verse_id, ev.verse_id, 'free', 24606
  FROM _s310_deu05_lookup sv, _s310_deu05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=5 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-5-honour-thy-father-and-thy-mother-first-with-promise',
       E'Honour thy father and thy mother — the first commandment with promise',
       E'The hinge of the two tables carries a blessing: *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land* (Deuteronomy 5:16), matching *Honour thy father and thy mother: that thy days may be long upon the land* (Exodus 20:12). Paul names it directly and binds it on the children he writes to: *Honour thy father and mother; (which is the first commandment with promise;) That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:2-3) — quoting the Deuteronomy promise almost word for word. Messiah wields it against tradition that voids it: *For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death* (Matthew 15:4). The Torah affirmed, the promise still attached.',
       sv.verse_id, ev.verse_id, 'free', 24609
  FROM _s310_deu05_lookup sv, _s310_deu05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-5-the-second-table-kill-adultery-steal-witness-covet',
       E'The second table — kill, adultery, steal, false witness, covet: the one law deepened',
       E'The second table guards the neighbour and stands word for word in both tellings: *Thou shalt not kill* (Deuteronomy 5:17), and the coveting that reaches into the heart — *Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house... or any thing that is thy neighbour''s* (Deuteronomy 5:21), matching *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife... nor any thing that is thy neighbour''s* (Exodus 20:17). Paul recites the whole table as the substance of love: *Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet... it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9). Messiah presses each to its root: *Ye have heard that it was said by them of old time, Thou shalt not kill* (Matthew 5:21) and *Thou shalt not commit adultery* (Matthew 5:27) — traced to anger and lust in the heart. James reads the table as one indivisible Torah from one Lawgiver: *For he that said, Do not commit adultery, said also, Do not kill... thou art become a transgressor of the law* (James 2:11). Deepened, never deleted.',
       sv.verse_id, ev.verse_id, 'free', 24612
  FROM _s310_deu05_lookup sv, _s310_deu05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-5-i-stood-between-yahuah-and-you-the-one-mediator',
       E'I stood between Yahuah and you — Moses the mediator and the Prophet to come',
       E'Moses recalls his place at Horeb: *I stood between Yahuah (LORD) and you at that time, to shew you the word of Yahuah (LORD): for ye were afraid by reason of the fire* (Deuteronomy 5:5). This is the pattern of the one Mediator: *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5), and the Torah was given *in the hand of a mediator* (Galatians 3:19). The people''s terror — *Now therefore why should we die? for this great fire will consume us* (Deuteronomy 5:25), *who is there of all flesh, that hath heard the voice of the living Elohim (God)... and lived?* (Deuteronomy 5:26) — drives their plea, *Go thou near, and hear all that Yahuah Eloheinu (the LORD our God) shall say... and we will hear it, and do it* (Deuteronomy 5:27). Yahuah answers that very plea with the Prophet like Moses: *According to all that thou desiredst of Yahuah Elohayka (the LORD thy God) in Horeb in the day of the assembly* (Deuteronomy 18:16), *I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth* (Deuteronomy 18:18). Hebrews recalls the same dread — *And so terrible was the sight, that Moses said, I exceedingly fear and quake* (Hebrews 12:21), *the mount that might be touched, and that burned with fire* (Hebrews 12:18) — and carries the believer beyond it to mount Sion.',
       sv.verse_id, ev.verse_id, 'free', 24615
  FROM _s310_deu05_lookup sv, _s310_deu05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=5 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-5-o-that-there-were-such-an-heart-the-new-covenant',
       E'O that there were such an heart — the new covenant, Torah written within',
       E'Yahuah voices the deepest longing of the whole Torah: *O that there were such an heart in them, that they would fear me, and keep all my commandments always, that it might be well with them, and with their children for ever!* (Deuteronomy 5:29). The new covenant is the answer — not the abolition of the commandments but their internalizing. Jeremiah: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Ezekiel: *A new heart also will I give you, and a new spirit will I put within you* (Ezekiel 36:26), *and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). Hebrews quotes the promise to show its fulfillment: *I will put my laws into their mind, and write them in their hearts* (Hebrews 8:10). And the Torah-library''s own retelling of Horeb gives Yahuah''s resolution: *I shall circumcise the foreskin of their heart... and I shall create in them a holy spirit, and I shall cleanse them so that they shall not turn away from Me* (Jubilees 1:23). The heart Yahuah wished for, Yahuah himself supplies.',
       sv.verse_id, ev.verse_id, 'extras', 24618
  FROM _s310_deu05_lookup sv, _s310_deu05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=5 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-5-turn-not-aside-to-the-right-hand-or-to-the-left',
       E'Turn not aside to the right hand or to the left — the straight way that ye may live',
       E'Moses seals the Decalogue with the charge of undeviating obedience: *Ye shall observe to do therefore as Yahuah Elohaychem (the LORD your God) hath commanded you: ye shall not turn aside to the right hand or to the left* (Deuteronomy 5:32), *that ye may live, and that it may be well with you, and that ye may prolong your days in the land* (Deuteronomy 5:33). The same charge governs the blessing chapter — *thou shalt not go aside from any of the words which I command thee this day, to the right hand, or to the left* (Deuteronomy 28:14) — and is handed to Joshua: *turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest* (Joshua 1:7). Wisdom echoes it: *Turn not to the right hand nor to the left: remove thy foot from evil* (Proverbs 4:27). One straight way of the commandments, leading to life.',
       sv.verse_id, ev.verse_id, 'free', 24621
  FROM _s310_deu05_lookup sv, _s310_deu05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=5 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ===================== THREAD MEMBERS =====================
-- Thread 1: living covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lateral — *Lo, I come unto thee in a thick cloud, that the people may hear when I speak with thee, and believe thee for ever* (Exodus 19:9): the Horeb cloud-descent behind *made not this covenant with our fathers, but with us* (Deuteronomy 5:3).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-living-covenant-at-horeb-face-to-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Lateral — *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire* (Exodus 19:18): the *fire* of *face to face* (Deuteronomy 5:4).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-living-covenant-at-horeb-face-to-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Lateral — *Moses spake, and Elohim (God) answered him by a voice* (Exodus 19:19): the voice of the *face to face* speaking (Deuteronomy 5:4).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-living-covenant-at-horeb-face-to-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: first table
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lateral — *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt* (Exodus 20:2): deliverance grounds the command, as in Deuteronomy 5:6.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-ten-words-first-table-none-other-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Lateral — *Thou shalt have no other gods before me* (Exodus 20:3): the first commandment, as Deuteronomy 5:7.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-ten-words-first-table-none-other-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Forward — *one Elohim (God), the Father... and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things* (1 Corinthians 8:6): the Formed and the Formless reading of *none other gods* (Deuteronomy 5:7).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-ten-words-first-table-none-other-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Lateral — *Thou shalt not make unto thee any graven image, or any likeness* (Exodus 20:4): the image prohibition, as Deuteronomy 5:8.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-ten-words-first-table-none-other-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Lateral — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain* (Exodus 20:7): the Name guarded, as Deuteronomy 5:11.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-ten-words-first-table-none-other-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: sabbath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lateral — *Remember the sabbath day, to keep it holy* (Exodus 20:8): the same fourth Word, Deuteronomy 5:12.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-keep-the-sabbath-day-standing-not-abolished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Lateral — *For in six days Yahuah (LORD) made heaven and earth... wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11): the creation-ground complementing Deuteronomy''s redemption-ground (5:15).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-keep-the-sabbath-day-standing-not-abolished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Forward — *The sabbath was made for man, and not man for the sabbath* (Mark 2:27): Messiah affirms the Sabbath''s design, the mercy of Deuteronomy 5:14.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-keep-the-sabbath-day-standing-not-abolished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Forward — *Therefore the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:28): the Formed Son who gave it (Deuteronomy 5:14) is its Lord, not its abolisher.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-keep-the-sabbath-day-standing-not-abolished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Forward — *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9): the weekly Sabbath (Deuteronomy 5:14) as pledge of the rest that yet remains.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-keep-the-sabbath-day-standing-not-abolished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: honour parents
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lateral — *Honour thy father and thy mother: that thy days may be long upon the land* (Exodus 20:12): the same fifth Word with promise, Deuteronomy 5:16.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-honour-thy-father-and-thy-mother-first-with-promise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Forward — *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2): Paul binds Deuteronomy 5:16 on the children, Torah affirmed.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-honour-thy-father-and-thy-mother-first-with-promise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Forward — *That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3): the Deuteronomy form of the promise quoted (5:16).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-honour-thy-father-and-thy-mother-first-with-promise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Forward — *For Elohim (God) commanded, saying, Honour thy father and mother... let him die the death* (Matthew 15:4): Messiah wields the commandment against nullifying tradition (Deuteronomy 5:16).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-honour-thy-father-and-thy-mother-first-with-promise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: second table
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lateral — *Thou shalt not kill* (Exodus 20:13): the second table opens identically, Deuteronomy 5:17.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=17
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-second-table-kill-adultery-steal-witness-covet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Lateral — *Thou shalt not covet thy neighbour''s house... nor any thing that is thy neighbour''s* (Exodus 20:17): coveting reaching into the heart, Deuteronomy 5:21.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-second-table-kill-adultery-steal-witness-covet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Forward — *Thou shalt not commit adultery... kill... steal... bear false witness... covet... comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9): the table as the substance of love (Deuteronomy 5:17-21).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=17
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-second-table-kill-adultery-steal-witness-covet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Forward — *Ye have heard that it was said... Thou shalt not kill* (Matthew 5:21): Messiah traces Deuteronomy 5:17 to anger in the heart.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=17
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-second-table-kill-adultery-steal-witness-covet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Forward — *Ye have heard that it was said... Thou shalt not commit adultery* (Matthew 5:27): Messiah presses Deuteronomy 5:18 to its root in the heart.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-second-table-kill-adultery-steal-witness-covet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Forward — *he that said, Do not commit adultery, said also, Do not kill... thou art become a transgressor of the law* (James 2:11): the two tables one indivisible Torah (Deuteronomy 5:17-18).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-the-second-table-kill-adultery-steal-witness-covet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: the mediator + terror
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Forward — *one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5): Moses standing *between Yahuah (LORD) and you* (Deuteronomy 5:5) is the pattern.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-i-stood-between-yahuah-and-you-the-one-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Forward — *it was ordained by angels in the hand of a mediator* (Galatians 3:19): the Torah given through Moses the mediator (Deuteronomy 5:5).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-i-stood-between-yahuah-and-you-the-one-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Lateral — *According to all that thou desiredst of Yahuah... in Horeb in the day of the assembly* (Deuteronomy 18:16): the plea of Deuteronomy 5:27 named as the ground of the Prophet-promise.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=27
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-i-stood-between-yahuah-and-you-the-one-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Lateral — *I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth* (Deuteronomy 18:18): the Prophet-like-Moses answering the terror of Deuteronomy 5:27.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=27
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-i-stood-between-yahuah-and-you-the-one-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Forward — *the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest* (Hebrews 12:18): the burning mount whose voice they *heard... out of the midst of the fire* (Deuteronomy 5:26).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=26
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-i-stood-between-yahuah-and-you-the-one-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Forward — *And so terrible was the sight, that Moses said, I exceedingly fear and quake* (Hebrews 12:21): the dread of *why should we die? for this great fire will consume us* (Deuteronomy 5:25).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=25
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-i-stood-between-yahuah-and-you-the-one-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: the new heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lateral — *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33): the new covenant answering *O that there were such an heart in them* (Deuteronomy 5:29).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=29
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-o-that-there-were-such-an-heart-the-new-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Lateral — *A new heart also will I give you, and a new spirit will I put within you* (Ezekiel 36:26): the very heart Yahuah wished for in Deuteronomy 5:29.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=29
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-o-that-there-were-such-an-heart-the-new-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Lateral — *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27): the wish *keep all my commandments always* (Deuteronomy 5:29) fulfilled by the Spirit, not abolished.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=29
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-o-that-there-were-such-an-heart-the-new-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Forward — *I will put my laws into their mind, and write them in their hearts* (Hebrews 8:10): the new covenant as Yahuah''s answer to Deuteronomy 5:29.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=29
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-o-that-there-were-such-an-heart-the-new-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Extra-canonical — *I shall circumcise the foreskin of their heart... and I shall create in them a holy spirit* (Jubilees 1:23): the Torah-library''s own retelling of Horeb resolving Deuteronomy 5:29.'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=29
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-o-that-there-were-such-an-heart-the-new-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 8: turn not aside
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lateral — *thou shalt not go aside from any of the words which I command thee... to the right hand, or to the left* (Deuteronomy 28:14): the same charge in the blessing chapter (Deuteronomy 5:32).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=32
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-turn-not-aside-to-the-right-hand-or-to-the-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Lateral — *turn not from it to the right hand or to the left, that thou mayest prosper* (Joshua 1:7): Moses'' charge handed to Joshua (Deuteronomy 5:32).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=32
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-turn-not-aside-to-the-right-hand-or-to-the-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Lateral — *Turn not to the right hand nor to the left: remove thy foot from evil* (Proverbs 4:27): wisdom echoing the Mosaic charge (Deuteronomy 5:32).'
  FROM cross_reference_threads t
  JOIN _s310_deu05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=5 AND sv.verse_number=32
  JOIN _s310_deu05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-5-turn-not-aside-to-the-right-hand-or-to-the-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_deuteronomy_6.sql (Deuteronomy 6) -----
--
-- Book: Deuteronomy | Chapter: 6 | Session prefix: s310 | Tag: deu06
-- Temp view: _s310_deu06_lookup
-- Sort band base 24625, step 3 -> 24625, 24628, 24631, 24634, 24637, 24640, 24643
--
-- FRAMING: SUPREME KEYSTONE CHAPTER — the Shema. The chapter is the covenant heart of
-- Torah: hear (shema), love Yahuah with all, internalize and teach the words, fear/serve/
-- swear by the Name, do not test him, catechize the children, and keep the commandments
-- as covenant righteousness. Framed through the Formed/Formless: "one Yahuah" (echad) is the
-- indivisible unity of the Father (Source) and the Formed Son who bears his Name — NOT
-- tritheism, NOT a denial of the Son. Anti-antinomian throughout: 6:25 makes Torah-keeping
-- covenant righteousness (living obedience), never flesh-merit and never a curse.
--
-- Deuteronomy 6 coverage:
--   v.1-3  NT:     none warranted (general preamble; the do-and-live promise carried in thread 6 via Lev 18:5)
--          Extras: none warranted
--          Tanakh: none warranted (do-and-live captured under 6:25 thread)
--   v.4-5  NT:     Mark 12:29-30 (Yahusha names it THE first commandment), Matthew 22:37-38, Luke 10:27  [thread 1]
--          Extras: none warranted (no clean witness adds to the verbatim NT chain)
--          Tanakh: Zechariah 14:9 (one Yahuah, his name one), Deuteronomy 4:35, Deuteronomy 4:39 (none else beside him)  [thread 1]
--   v.6-9  NT:     Matthew 5:19 (do and teach the least commandment)  [thread 2]
--          Extras: none warranted
--          Tanakh: Deuteronomy 11:18, Proverbs 3:3, Proverbs 7:3, Jeremiah 31:33 (Torah written on the heart)  [thread 2]
--   v.10-12 NT:    none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 8:11, 8:12, 8:14 (beware lest thou forget when full)  [thread 7]
--   v.13   NT:     Matthew 4:10, Luke 4:8 (Yahusha repels Satan: him only shalt thou serve)  [thread 3]
--          Extras: none warranted
--          Tanakh: Deuteronomy 10:20 (fear, serve, cleave, swear by his name)  [thread 3]
--   v.14-15 NT:    none warranted (jealous Elohim folded into the fear/serve thread context)
--          Extras: none warranted
--          Tanakh: none warranted
--   v.16   NT:     Matthew 4:7, Luke 4:12 (Yahusha: thou shalt not tempt Yahuah)  [thread 4]
--          Extras: none warranted
--          Tanakh: Exodus 17:2, Exodus 17:7 (Massah/Meribah), Psalm 95:8, Psalm 95:9  [thread 4]
--   v.17-19 NT:    none warranted (diligently-keep folded into 6:25 righteousness thread theme)
--          Extras: none warranted
--          Tanakh: none warranted
--   v.20-23 NT:    none warranted
--          Extras: none warranted
--          Tanakh: Exodus 12:26, Exodus 13:8, Exodus 13:14 (the Passover catechesis)  [thread 5]
--   v.24-25 NT:    Romans 10:5 (the righteousness which is of the law — living obedience)  [thread 6]
--          Extras: none warranted
--          Tanakh: Deuteronomy 24:13, Psalm 106:31, Leviticus 18:5 (do and live)  [thread 6]
--
-- THREADS (slug — target libraries):
--   1. deuteronomy-6-the-shema-hear-o-yasharel-yahuah-is-one          (NT + Tanakh)  [free]  6:4-6:5
--   2. deuteronomy-6-these-words-shall-be-in-thine-heart              (NT + Tanakh)  [free]  6:6-6:9
--   3. deuteronomy-6-him-only-shalt-thou-serve-fear-and-the-name      (NT + Tanakh)  [free]  6:13-6:13
--   4. deuteronomy-6-ye-shall-not-tempt-yahuah-as-at-massah           (NT + Tanakh)  [free]  6:16-6:16
--   5. deuteronomy-6-what-mean-the-testimonies-the-catechesis         (Tanakh)       [free]  6:20-6:23
--   6. deuteronomy-6-it-shall-be-our-righteousness-do-and-live        (NT + Tanakh)  [free]  6:24-6:25
--   7. deuteronomy-6-beware-lest-thou-forget-when-thou-art-full       (Tanakh)       [free]  6:10-6:12
--
-- CONTESTED/LOAD-BEARING: thread 1 frames "one Yahuah" (echad) as the indivisible unity of
-- Father + Formed Son who bears the Name (no trinitarian co-equal-persons grammar, no
-- modalist collapse); thread 6 frames 6:25 + Romans 10:5 as living covenant obedience, not
-- flesh-merit and not the Torah-as-curse. All seven threads are free (no extras member).

CREATE TEMP VIEW _s310_deu06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: The Shema (6:4-5)
    ('canon','deuteronomy',6,4,'canon','mark',12,29,'free',
     E'*And Yahusha (Jesus) answered him, The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord)* (Mark 12:29). When the scribe asked which is the first commandment of all, Yahusha named the Shema verbatim. *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) is not abolished by the Formed Son — it is the very confession he ranks above every other word.'),
    ('canon','deuteronomy',6,5,'canon','mark',12,30,'free',
     E'*And thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind, and with all thy strength: this is the first commandment* (Mark 12:30). Yahusha repeats *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5) and calls it *the first commandment* — Torah''s greatest word on the lips of the Formed Son.'),
    ('canon','deuteronomy',6,5,'canon','matthew',22,37,'free',
     E'*Yahusha (Jesus) said unto him, Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind* (Matthew 22:37). *This is the first and great commandment* (Matthew 22:38). The great commandment of the law is Deuteronomy 6:5 itself — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* — on which, with love of neighbour, hang all the law and the prophets.'),
    ('canon','deuteronomy',6,5,'canon','luke',10,27,'free',
     E'*And he answering said, Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy strength, and with all thy mind; and thy neighbour as thyself* (Luke 10:27). The lawyer who asked what to do to inherit eternal life answered from the Torah; Yahusha replied, *this do, and thou shalt live* — Deuteronomy 6:5 is the road to life, not a defunct old law.'),
    ('canon','deuteronomy',6,4,'canon','zechariah',14,9,'free',
     E'*And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9). The Shema''s *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) reaches forward to the day the whole earth confesses what Yashar''el confesses now — one Yahuah, his Name one. The echad of the Father and the Formed Son who bears that Name is the unity all creation will own.'),
    ('canon','deuteronomy',6,4,'canon','deuteronomy',4,35,'free',
     E'*Unto thee it was shewed, that thou mightest know that Yahuah (LORD) he is Elohim (God); there is none else beside him* (Deuteronomy 4:35). Moses had already grounded the Shema''s *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4): there is no rival deity, none else beside him — the indivisible One.'),
    ('canon','deuteronomy',6,4,'canon','deuteronomy',4,39,'free',
     E'*Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39). The Shema''s confession that *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) is to be considered in the heart — heaven above and earth beneath answer to one Yahuah, none else.'),

    -- THREAD 2: these words shall be in thine heart (6:6-9)
    ('canon','deuteronomy',6,6,'canon','jeremiah',31,33,'free',
     E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The command that *these words... shall be in thine heart* (Deuteronomy 6:6) is the very thing the new covenant fulfils — not Torah replaced, but Torah written inward. The covenant aim was always the heart.'),
    ('canon','deuteronomy',6,6,'canon','proverbs',3,3,'free',
     E'*Let not mercy and truth forsake thee: bind them about thy neck; write them upon the table of thine heart* (Proverbs 3:3). Wisdom echoes the Shema''s charge that the words *shall be in thine heart* (Deuteronomy 6:6) — bound on the body, written on the heart-table, never let go.'),
    ('canon','deuteronomy',6,8,'canon','proverbs',7,3,'free',
     E'*Bind them upon thy fingers, write them upon the table of thine heart* (Proverbs 7:3). The Shema''s *thou shalt bind them for a sign upon thine hand* (Deuteronomy 6:8) is taken up by wisdom: bind them on the fingers, inscribe them on the heart — the outward sign matched by the inward writing.'),
    ('canon','deuteronomy',6,7,'canon','deuteronomy',11,18,'free',
     E'*Therefore shall ye lay up these my words in your heart and in your soul, and bind them for a sign upon your hand, that they may be as frontlets between your eyes* (Deuteronomy 11:18). Moses repeats the Shema''s charge to teach diligently and bind the words (Deuteronomy 6:7) — *thou shalt teach them diligently unto thy children* — the same covenant words laid up, bound, and made frontlets.'),
    ('canon','deuteronomy',6,7,'canon','matthew',5,19,'free',
     E'*Whosoever therefore shall break one of these least commandments, and shall teach men so, he shall be called the least in the kingdom of heaven: but whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19). The Shema commands *thou shalt teach them diligently unto thy children* (Deuteronomy 6:7); Yahusha makes doing-and-teaching the commandments the measure of greatness in the kingdom — the diligent teaching of Torah honoured, not abolished.'),

    -- THREAD 3: fear, serve, swear by his name (6:13)
    ('canon','deuteronomy',6,13,'canon','matthew',4,10,'free',
     E'*Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10). In the wilderness test the Formed Son repelled Satan by quoting *Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him* (Deuteronomy 6:13) — him only is to be served; the Shema chapter is his sword against the tempter.'),
    ('canon','deuteronomy',6,13,'canon','luke',4,8,'free',
     E'*And Yahusha (Jesus) answered and said unto him, Get thee behind me, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Luke 4:8). Offered the kingdoms of the world for one act of worship, Yahusha answered from Deuteronomy 6:13 — *and serve him* — refusing any service but to Yahuah alone.'),
    ('canon','deuteronomy',6,13,'canon','deuteronomy',10,20,'free',
     E'*Thou shalt fear Yahuah Elohayka (the LORD thy God); him shalt thou serve, and to him shalt thou cleave, and swear by his name* (Deuteronomy 10:20). Moses restates the charge of 6:13 almost word for word — *Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him, and shalt swear by his name* — fear, service, and the Name held together as the single allegiance.'),

    -- THREAD 4: ye shall not tempt Yahuah (6:16)
    ('canon','deuteronomy',6,16,'canon','matthew',4,7,'free',
     E'*Yahusha (Jesus) said unto him, It is written again, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Matthew 4:7). When Satan urged him to throw himself down, the Formed Son answered with *Ye shall not tempt Yahuah your Elohim (God), as ye tempted him in Massah* (Deuteronomy 6:16) — the wilderness command that the wilderness rebellion violated.'),
    ('canon','deuteronomy',6,16,'canon','luke',4,12,'free',
     E'*And Yahusha (Jesus) answering said unto him, It is said, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Luke 4:12). Yahusha quotes Deuteronomy 6:16 to refuse the test — *Ye shall not tempt Yahuah your Elohim (God)* — succeeding where Yashar''el at Massah failed.'),
    ('canon','deuteronomy',6,16,'canon','exodus',17,2,'free',
     E'*Wherefore the people did chide with Moses, and said, Give us water that we may drink. And Moses said unto them, Why chide ye with me? wherefore do ye tempt Yahuah (LORD)?* (Exodus 17:2). This is the Massah of Deuteronomy 6:16 — *as ye tempted him in Massah* — the people demanding proof and so putting Yahuah to the test.'),
    ('canon','deuteronomy',6,16,'canon','exodus',17,7,'free',
     E'*And he called the name of the place Massah, and Meribah, because of the chiding of the children of Yashar''el (Israel), and because they tempted Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* (Exodus 17:7). The very name Massah is given here; Deuteronomy 6:16''s warning *as ye tempted him in Massah* points back to this place where they doubted whether Yahuah was among them.'),
    ('canon','deuteronomy',6,16,'canon','psalms',95,8,'free',
     E'*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* (Psalm 95:8). The Psalm sings the Massah warning of Deuteronomy 6:16 as a present call — do not repeat the day of temptation, do not test Yahuah as the fathers did.'),
    ('canon','deuteronomy',6,16,'canon','psalms',95,9,'free',
     E'*When your fathers tempted me, proved me, and saw my work* (Psalm 95:9). The fathers'' testing at Massah, which Deuteronomy 6:16 forbids repeating — *as ye tempted him in Massah* — is held up as the warning Yashar''el must not relive.'),

    -- THREAD 5: the catechesis (6:20-23)
    ('canon','deuteronomy',6,20,'canon','exodus',12,26,'free',
     E'*And it shall come to pass, when your children shall say unto you, What mean ye by this service?* (Exodus 12:26). The Shema chapter''s catechesis — *when thy son asketh thee in time to come, saying, What mean the testimonies* (Deuteronomy 6:20) — answers the same child''s question first raised at the Passover, the covenant taught from one generation to the next.'),
    ('canon','deuteronomy',6,21,'canon','exodus',13,8,'free',
     E'*And thou shalt shew thy son in that day, saying, This is done because of that which Yahuah (LORD) did unto me when I came forth out of Egypt* (Exodus 13:8). The father''s answer in Deuteronomy 6:21 — *We were Pharaoh''s bondmen in Egypt; and Yahuah (LORD) brought us out of Egypt with a mighty hand* — retells the exodus the child is taught to claim as his own.'),
    ('canon','deuteronomy',6,20,'canon','exodus',13,14,'free',
     E'*And it shall be when thy son asketh thee in time to come, saying, What is this? that thou shalt say unto him, By strength of hand Yahuah (LORD) brought us out from Egypt, from the house of bondage* (Exodus 13:14). The very form of the catechesis in Deuteronomy 6:20 — *when thy son asketh thee in time to come* — matches this Passover-instruction word for word, the redemption story handed down by question and answer.'),

    -- THREAD 6: it shall be our righteousness (6:24-25)
    ('canon','deuteronomy',6,25,'canon','deuteronomy',24,13,'free',
     E'*In any case thou shalt deliver him the pledge again when the sun goeth down, that he may sleep in his own raiment, and bless thee: and it shall be righteousness unto thee before Yahuah Elohayka (the LORD thy God)* (Deuteronomy 24:13). Just as the Shema chapter declares *it shall be our righteousness, if we observe to do all these commandments* (Deuteronomy 6:25), a single act of covenant mercy is reckoned righteousness — Torah-obedience counted righteous, not flesh-merit.'),
    ('canon','deuteronomy',6,25,'canon','psalms',106,31,'free',
     E'*And that was counted unto him for righteousness unto all generations for evermore* (Psalm 106:31). Phinehas''s zealous obedience was *counted... for righteousness*, the same reckoning Deuteronomy 6:25 promises — *it shall be our righteousness, if we observe to do all these commandments* — covenant faithfulness credited as righteousness through the generations.'),
    ('canon','deuteronomy',6,24,'canon','leviticus',18,5,'free',
     E'*Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5). The Shema chapter''s promise that Yahuah *commanded us to do all these statutes... for our good always, that he might preserve us alive* (Deuteronomy 6:24) is the do-and-live principle: the statutes are life to the one who walks in them.'),
    ('canon','deuteronomy',6,25,'canon','romans',10,5,'free',
     E'*For Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them* (Romans 10:5). Paul cites Moses for *the righteousness which is of the law* — the same word as Deuteronomy 6:25, *it shall be our righteousness, if we observe to do all these commandments*. Read as living covenant obedience (the do-and-live of Leviticus 18:5), not as the flesh-merit Paul elsewhere excludes; Torah-keeping is covenant righteousness, never a curse.'),

    -- THREAD 7: beware lest thou forget (6:10-12)
    ('canon','deuteronomy',6,12,'canon','deuteronomy',8,11,'free',
     E'*Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments, and his judgments, and his statutes, which I command thee this day* (Deuteronomy 8:11). The warning of Deuteronomy 6:12 — *Then beware lest thou forget Yahuah (LORD), which brought thee forth out of the land of Egypt* — is doubled here: forgetting Yahuah and forsaking his commandments are one and the same fall.'),
    ('canon','deuteronomy',6,11,'canon','deuteronomy',8,12,'free',
     E'*Lest when thou hast eaten and art full, and hast built goodly houses, and dwelt therein* (Deuteronomy 8:12). The very danger of 6:11 — *houses full of all good things, which thou filledst not... when thou shalt have eaten and be full* — is that abundance breeds forgetfulness; the good land becomes a snare to the comfortable heart.'),
    ('canon','deuteronomy',6,12,'canon','deuteronomy',8,14,'free',
     E'*Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage* (Deuteronomy 8:14). Word for word the peril of Deuteronomy 6:12 — *lest thou forget Yahuah (LORD), which brought thee forth out of the land of Egypt, from the house of bondage* — the lifted-up heart of the full man forgetting the Redeemer.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-6-the-shema-hear-o-yasharel-yahuah-is-one',
       E'The Shema — Hear, O Yashar''el: Yahuah is one',
       E'The Shema is the covenant heart of Torah: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD): And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:4-5). When asked which is the first commandment of all, the Formed Son named it verbatim: *The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord): And thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart... this is the first commandment* (Mark 12:29-30), repeated in *Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind. This is the first and great commandment* (Matthew 22:37-38) and confessed by the lawyer in *Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart... and thy neighbour as thyself* (Luke 10:27). The *one Yahuah (LORD)* is no abstract singularity: it is the indivisible unity (echad) of the Father, the formless Source, and the Formed Son who bears his Name — never tritheism, never a denial of the Son. Zechariah sees the day all creation owns it: *Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9). And Moses had already grounded the confession — *Yahuah (LORD) he is Elohim (God); there is none else beside him* (Deuteronomy 4:35); *there is none else* (Deuteronomy 4:39). The greatest word of Torah is the greatest word on the lips of the Formed Son.',
       sv.verse_id, ev.verse_id, 'free', 24625
  FROM _s310_deu06_lookup sv, _s310_deu06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-6-these-words-shall-be-in-thine-heart',
       E'These words shall be in thine heart — Torah written, taught, and bound',
       E'The Shema commands the covenant words to live inward and be handed on: *And these words, which I command thee this day, shall be in thine heart: And thou shalt teach them diligently unto thy children... And thou shalt bind them for a sign upon thine hand... And thou shalt write them upon the posts of thy house* (Deuteronomy 6:6-9). This is the very thing the new covenant fulfils — not Torah replaced, but Torah interiorized: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Wisdom takes up the same charge: *bind them about thy neck; write them upon the table of thine heart* (Proverbs 3:3); *Bind them upon thy fingers, write them upon the table of thine heart* (Proverbs 7:3). Moses doubles the command himself: *lay up these my words in your heart and in your soul, and bind them for a sign upon your hand* (Deuteronomy 11:18). And the Formed Son makes the diligent teaching of these commandments the measure of greatness in the kingdom: *whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19) — the words bound, written, and taught, never abolished.',
       sv.verse_id, ev.verse_id, 'free', 24628
  FROM _s310_deu06_lookup sv, _s310_deu06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-6-him-only-shalt-thou-serve-fear-and-the-name',
       E'Him only shalt thou serve — fear Yahuah and swear by his Name',
       E'*Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him, and shalt swear by his name* (Deuteronomy 6:13). When the tempter offered the kingdoms of the world, the Formed Son drew this sword from the Shema chapter: *Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10); *Get thee behind me, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Luke 4:8). Yahusha succeeds in the wilderness where Yashar''el failed, refusing any allegiance but to Yahuah alone. Moses restates the same charge almost word for word: *Thou shalt fear Yahuah Elohayka (the LORD thy God); him shalt thou serve, and to him shalt thou cleave, and swear by his name* (Deuteronomy 10:20) — fear, service, cleaving, and the Name held together as the single, undivided loyalty.',
       sv.verse_id, ev.verse_id, 'free', 24631
  FROM _s310_deu06_lookup sv, _s310_deu06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-6-ye-shall-not-tempt-yahuah-as-at-massah',
       E'Ye shall not tempt Yahuah — as ye tempted him in Massah',
       E'*Ye shall not tempt Yahuah your Elohim (God), as ye tempted him in Massah* (Deuteronomy 6:16). Urged to cast himself down for a sign, the Formed Son answered from this verse: *It is written again, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Matthew 4:7); *It is said, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Luke 4:12). Massah is the place named in the wilderness: *wherefore do ye tempt Yahuah (LORD)?* (Exodus 17:2), and *he called the name of the place Massah, and Meribah... because they tempted Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* (Exodus 17:7). The Psalm sings the warning as an ever-present call: *Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness: When your fathers tempted me, proved me, and saw my work* (Psalm 95:8-9). Where the fathers demanded proof and doubted whether Yahuah was among them, the Son of Adam trusted and would not put his Father to the test.',
       sv.verse_id, ev.verse_id, 'free', 24634
  FROM _s310_deu06_lookup sv, _s310_deu06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-6-what-mean-the-testimonies-the-catechesis',
       E'What mean the testimonies? — the covenant taught to the children',
       E'The Shema chapter sets the form of covenant teaching: *And when thy son asketh thee in time to come, saying, What mean the testimonies, and the statutes, and the judgments, which Yahuah Eloheinu (the LORD our God) hath commanded you? Then thou shalt say unto thy son, We were Pharaoh''s bondmen in Egypt; and Yahuah (LORD) brought us out of Egypt with a mighty hand* (Deuteronomy 6:20-21). This is the same child''s question first raised at the Passover: *when your children shall say unto you, What mean ye by this service?* (Exodus 12:26); *thou shalt shew thy son in that day, saying, This is done because of that which Yahuah (LORD) did unto me when I came forth out of Egypt* (Exodus 13:8); *when thy son asketh thee in time to come, saying, What is this? that thou shalt say unto him, By strength of hand Yahuah (LORD) brought us out from Egypt, from the house of bondage* (Exodus 13:14). Generation by generation the redemption is handed down by question and answer — the child taught to claim the exodus as his own.',
       sv.verse_id, ev.verse_id, 'free', 24637
  FROM _s310_deu06_lookup sv, _s310_deu06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-6-it-shall-be-our-righteousness-do-and-live',
       E'It shall be our righteousness — Torah-keeping as covenant righteousness',
       E'The chapter closes with the do-and-live principle: *And Yahuah (LORD) commanded us to do all these statutes... for our good always, that he might preserve us alive, as it is at this day. And it shall be our righteousness, if we observe to do all these commandments before Yahuah Eloheinu (the LORD our God), as he hath commanded us* (Deuteronomy 6:24-25). Torah-keeping is covenant righteousness — living obedience, not a curse and not flesh-merit. A single act of mercy is reckoned righteous: *it shall be righteousness unto thee before Yahuah Elohayka (the LORD thy God)* (Deuteronomy 24:13); Phinehas''s zeal *was counted unto him for righteousness unto all generations for evermore* (Psalm 106:31). The statutes are life to the one who walks in them: *which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5). When Paul writes, *For Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them* (Romans 10:5), he names this same word — read as the living covenant obedience of Deuteronomy 6:25 and Leviticus 18:5, never the flesh-credential he elsewhere excludes. The commandments are *for our good always* — righteousness, not bondage.',
       sv.verse_id, ev.verse_id, 'free', 24640
  FROM _s310_deu06_lookup sv, _s310_deu06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=6 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-6-beware-lest-thou-forget-when-thou-art-full',
       E'Beware lest thou forget — when the full heart forgets the Redeemer',
       E'Entering a land of unearned plenty carries its own peril: *houses full of all good things, which thou filledst not, and wells digged, which thou diggedst not... when thou shalt have eaten and be full; Then beware lest thou forget Yahuah (LORD), which brought thee forth out of the land of Egypt, from the house of bondage* (Deuteronomy 6:11-12). The same warning is doubled two chapters on: *Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments* (Deuteronomy 8:11) — forgetting Yahuah and forsaking his commandments are one fall, not two. *Lest when thou hast eaten and art full, and hast built goodly houses, and dwelt therein* (Deuteronomy 8:12); *Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage* (Deuteronomy 8:14). Abundance lifts up the heart and crowds out the memory of the Redeemer; the cure is to remember whose hand gave the land.',
       sv.verse_id, ev.verse_id, 'free', 24643
  FROM _s310_deu06_lookup sv, _s310_deu06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=6 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Yahusha (Jesus) answered him, The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord)* (Mark 12:29) — the Formed Son names the Shema verbatim as the first of all commandments.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-the-shema-hear-o-yasharel-yahuah-is-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind, and with all thy strength: this is the first commandment* (Mark 12:30) — Deuteronomy 6:5 ranked the first commandment by the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-the-shema-hear-o-yasharel-yahuah-is-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind. This is the first and great commandment* (Matthew 22:37-38) — the great commandment of the law is Deuteronomy 6:5.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-the-shema-hear-o-yasharel-yahuah-is-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy strength, and with all thy mind; and thy neighbour as thyself* (Luke 10:27) — the lawyer answers from Deuteronomy 6:5; *this do, and thou shalt live*.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-the-shema-hear-o-yasharel-yahuah-is-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9) — the Shema''s one Yahuah owned by all the earth, Father and Formed Son who bears the Name in echad unity.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-the-shema-hear-o-yasharel-yahuah-is-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Yahuah (LORD) he is Elohim (God); there is none else beside him* (Deuteronomy 4:35) — Moses grounds the Shema: no rival deity, the indivisible One.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-the-shema-hear-o-yasharel-yahuah-is-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39) — heaven and earth answer to one Yahuah, considered in the heart.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-the-shema-hear-o-yasharel-yahuah-is-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33) — the new covenant fulfils the Shema''s charge that the words be in the heart; Torah interiorized, not replaced.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-these-words-shall-be-in-thine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Let not mercy and truth forsake thee: bind them about thy neck; write them upon the table of thine heart* (Proverbs 3:3) — wisdom echoes the Shema''s words-in-the-heart.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-these-words-shall-be-in-thine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Bind them upon thy fingers, write them upon the table of thine heart* (Proverbs 7:3) — the outward binding of Deuteronomy 6:8 matched by the inward writing.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-these-words-shall-be-in-thine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Therefore shall ye lay up these my words in your heart and in your soul, and bind them for a sign upon your hand, that they may be as frontlets between your eyes* (Deuteronomy 11:18) — Moses repeats the Shema''s charge to lay up and bind the words.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-these-words-shall-be-in-thine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19) — the Formed Son honours the diligent teaching of Torah commanded in Deuteronomy 6:7, never abolished.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-these-words-shall-be-in-thine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10) — the Formed Son repels the tempter with Deuteronomy 6:13.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-him-only-shalt-thou-serve-fear-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Get thee behind me, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Luke 4:8) — offered the kingdoms, Yahusha answers from Deuteronomy 6:13: serve him alone.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-him-only-shalt-thou-serve-fear-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt fear Yahuah Elohayka (the LORD thy God); him shalt thou serve, and to him shalt thou cleave, and swear by his name* (Deuteronomy 10:20) — Moses restates 6:13 almost word for word: fear, service, and the Name.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-him-only-shalt-thou-serve-fear-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*It is written again, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Matthew 4:7) — the Formed Son refuses the test with Deuteronomy 6:16.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-ye-shall-not-tempt-yahuah-as-at-massah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*It is said, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Luke 4:12) — Yahusha succeeds in the wilderness where Yashar''el failed, quoting Deuteronomy 6:16.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-ye-shall-not-tempt-yahuah-as-at-massah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Why chide ye with me? wherefore do ye tempt Yahuah (LORD)?* (Exodus 17:2) — the Massah of Deuteronomy 6:16, the people demanding proof.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-ye-shall-not-tempt-yahuah-as-at-massah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he called the name of the place Massah, and Meribah... because they tempted Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* (Exodus 17:7) — the very place Deuteronomy 6:16 names, where they doubted Yahuah''s presence.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-ye-shall-not-tempt-yahuah-as-at-massah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* (Psalm 95:8) — the Massah warning of Deuteronomy 6:16 sung as a present call.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-ye-shall-not-tempt-yahuah-as-at-massah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*When your fathers tempted me, proved me, and saw my work* (Psalm 95:9) — the fathers'' testing at Massah held up as the warning not to relive, the testing Deuteronomy 6:16 forbids.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-ye-shall-not-tempt-yahuah-as-at-massah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*when your children shall say unto you, What mean ye by this service?* (Exodus 12:26) — the same child''s question of Deuteronomy 6:20, first raised at the Passover.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-what-mean-the-testimonies-the-catechesis'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt shew thy son in that day, saying, This is done because of that which Yahuah (LORD) did unto me when I came forth out of Egypt* (Exodus 13:8) — the father''s exodus answer of Deuteronomy 6:21, the child taught to claim it as his own.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=21
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-what-mean-the-testimonies-the-catechesis'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*when thy son asketh thee in time to come, saying, What is this? that thou shalt say unto him, By strength of hand Yahuah (LORD) brought us out from Egypt, from the house of bondage* (Exodus 13:14) — the catechesis form of Deuteronomy 6:20 word for word.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-what-mean-the-testimonies-the-catechesis'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*it shall be righteousness unto thee before Yahuah Elohayka (the LORD thy God)* (Deuteronomy 24:13) — a single act of covenant mercy reckoned righteousness, as Deuteronomy 6:25 promises for keeping the commandments.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-it-shall-be-our-righteousness-do-and-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And that was counted unto him for righteousness unto all generations for evermore* (Psalm 106:31) — Phinehas''s obedience counted righteous, the reckoning Deuteronomy 6:25 names.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-it-shall-be-our-righteousness-do-and-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5) — the do-and-live principle behind Deuteronomy 6:24, the statutes as life.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=24
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-it-shall-be-our-righteousness-do-and-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*For Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them* (Romans 10:5) — Paul names the same word as Deuteronomy 6:25, read as living covenant obedience, not flesh-merit and not the Torah-as-curse.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-it-shall-be-our-righteousness-do-and-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments, and his judgments, and his statutes* (Deuteronomy 8:11) — the warning of Deuteronomy 6:12 doubled; forgetting Yahuah and forsaking his commandments are one fall.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-beware-lest-thou-forget-when-thou-art-full'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Lest when thou hast eaten and art full, and hast built goodly houses, and dwelt therein* (Deuteronomy 8:12) — the very danger of 6:11, abundance breeding forgetfulness.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=11
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-beware-lest-thou-forget-when-thou-art-full'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage* (Deuteronomy 8:14) — word for word the peril of Deuteronomy 6:12, the lifted-up heart forgetting the Redeemer.'
  FROM cross_reference_threads t
  JOIN _s310_deu06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s310_deu06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-6-beware-lest-thou-forget-when-thou-art-full'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_deuteronomy_7.sql (Deuteronomy 7) -----
--
-- BOOK: Deuteronomy  CHAPTER: 7  SESSION PREFIX: s310  TAG: deu07
-- TEMP VIEW: _s310_deu07_lookup
-- SORT BAND: base 24650, step 3 -> 24650, 24653, 24656, 24659, 24662, 24665
-- SOURCE every row: 'canon','deuteronomy',7,v
--
-- FRAMING: Deuteronomy 7 is the chosen-people charter on the threshold of the land. The
-- separation it commands (no covenant, no marriages, break the altars) is COVENANT/CONDUCT
-- separation against idolatry that would turn the heart -- victims-not-enemies, never ethnic
-- hatred (7:4 names the reason: "they will turn away thy son from following me"). Election here
-- is by LOVE and OATH, not by merit or size (7:7-8), and the El who keeps it is the faithful
-- covenant-keeper to a thousand generations of "them that love him and keep his commandments"
-- (7:9) -- the very condition 1 John 5:3 carries forward. This is the two-house chosen people,
-- NOT a people replaced; the NT "peculiar people" texts (1 Pet 2:9, Titus 2:14) are quoting
-- THIS charter, not founding a new one.
--
-- PER-CHAPTER COVERAGE CHECKLIST:
--   v.1-4  no covenant / no marriages with the seven nations
--          NT:     2 Corinthians 6:14,17 (be ye not unequally yoked / come out and be separate)
--          Extras: Jubilees 30:11 (command... not to give their daughters to the nations)
--          Tanakh: Exodus 34:12,16; Ezra 9:2,12; Joshua 23:12-13
--   v.5,25-26  break the altars / no abomination into the house
--          NT:     1 John 5:21 (keep yourselves from idols)
--          Extras: none warranted (Jub 30 already carried at v.1-4)
--          Tanakh: Deuteronomy 12:3
--   v.6  holy people, chosen, a special people above all
--          NT:     1 Peter 2:9 (a chosen generation, a peculiar people); Titus 2:14
--          Extras: none warranted
--          Tanakh: Exodus 19:5-6
--   v.7-8  election by love and oath, not number / merit
--          NT:     Romans 9:11,13 (purpose of election... Jacob have I loved); Ephesians 1:4-5
--          Extras: none warranted
--          Tanakh: Deuteronomy 9:5; Malachi 1:2
--   v.9  the faithful El, keepeth covenant and mercy to a thousand generations
--          NT:     1 John 5:3 (love... that we keep his commandments)
--          Extras: none warranted
--          Tanakh: Exodus 20:6; Exodus 34:6-7; Daniel 9:4; Nehemiah 1:5
--   v.10-16  repayeth them that hate him / keep the commandments / blessing
--          NT:     none warranted (covenant-keeping condition carried at v.9)
--          Extras: none warranted
--          Tanakh: covered under v.9 covenant-keeping thread
--   v.17-21  fear not, remember Pharaoh; Yahuah a mighty El and terrible among you
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Exodus 15:6,11 (the song of the Red Sea)
--
-- THREADS (6):
--   deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled  [free+extras]
--       -> 2corinthians, exodus, ezra, joshua, jubilees(extras)
--   deuteronomy-7-break-down-their-altars-no-abomination-into-thine-house  [free]
--       -> 1john, deuteronomy
--   deuteronomy-7-an-holy-people-chosen-a-special-people-unto-himself  [free]
--       -> 1peter, titus, exodus
--   deuteronomy-7-not-because-ye-were-more-but-because-he-loved-you-and-kept-the-oath  [free]
--       -> deuteronomy(9), malachi, romans, ephesians
--   deuteronomy-7-the-faithful-el-keepeth-covenant-and-mercy-to-them-that-love-him  [free]
--       -> exodus(20), exodus(34), daniel, nehemiah, 1john
--   deuteronomy-7-fear-not-remember-what-he-did-unto-pharaoh-a-mighty-el-and-terrible  [free]
--       -> exodus(15)
--
-- CONTESTED / LOAD-BEARING FRAMING: the herem (utter destruction) and "shew no mercy" language
-- (7:2,16) is conduct-against-idolatry within the covenant lawsuit, NOT a charter for ethnic
-- hatred -- 7:4 gives the reason (apostasy of the heart) and Jub 30:11 names the marriages
-- "abominable" for the same reason (defiling the holy seed/name), never blood-hatred of peoples.

CREATE TEMP VIEW _s310_deu07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================================================================================
-- CROSS_REFERENCES
-- ===================================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: v.1-4 make no covenant, no marriages -- the holy seed not mingled
    ('canon','deuteronomy',7,2,'canon','2-corinthians',6,14,'free',
     E'*Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* (2 Corinthians 6:14). Moses'' charge *thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2) is the same separation Paul carries forward -- not yoking the covenant people in binding partnership with idolatry. The barrier is conduct and covenant, never the persons themselves.'),
    ('canon','deuteronomy',7,3,'canon','2-corinthians',6,17,'free',
     E'*Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3) -- the holy seed kept unmingled, lest the heart be drawn off after other gods (7:4).'),
    ('canon','deuteronomy',7,2,'canon','exodus',34,12,'free',
     E'*Take heed to thyself, lest thou make a covenant with the inhabitants of the land whither thou goest, lest it be for a snare in the midst of thee* (Exodus 34:12). The identical warning at Sinai, re-spoken on the plains of Moab: *thou shalt make no covenant with them* (Deuteronomy 7:2). The danger is the snare, the turning of the heart, never the blood of the nations.'),
    ('canon','deuteronomy',7,3,'canon','exodus',34,16,'free',
     E'*And thou take of their daughters unto thy sons, and their daughters go a whoring after their gods, and make thy sons go a whoring after their gods* (Exodus 34:16). This is exactly why Deuteronomy 7:3 forbids the marriages: *for they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4). Apostasy of the heart, not ethnic purity, is the stated reason.'),
    ('canon','deuteronomy',7,3,'canon','ezra',9,2,'free',
     E'*For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands* (Ezra 9:2). Ezra weeps because the post-exile remnant broke the charter of Deuteronomy 7:3 -- the *holy seed* mingled, the very thing Moses forbade to guard the covenant line.'),
    ('canon','deuteronomy',7,3,'canon','ezra',9,12,'free',
     E'*Now therefore give not your daughters unto their sons, neither take their daughters unto your sons, nor seek their peace or their wealth for ever* (Ezra 9:12). Ezra quotes Deuteronomy 7:3 back as binding Torah centuries later -- *neither shalt thou make marriages with them* -- proving the separation is covenant instruction still in force, not a one-time conquest order.'),
    ('canon','deuteronomy',7,2,'canon','joshua',23,13,'free',
     E'*Know for a certainty that Yahuah Elohaychem (the LORD your God) will no more drive out any of these nations from before you; but they shall be snares and traps unto you, and scourges in your sides, and thorns in your eyes* (Joshua 23:13). Joshua at the end of his life warns that breaking Deuteronomy 7''s *make no covenant... make no marriages* turns the spared nations into snares -- the outcome Moses foretold.'),
    ('canon','deuteronomy',7,3,'jubilees','jubilees',30,11,'extras',
     E'*And do you, Moses, command the children of Yashar''el (Israel) and exhort them not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God)* (Jubilees 30:11). The restored witness reads Deuteronomy 7:3 as a standing law to guard the holy seed -- *abominable* because of defilement and apostasy, the same conduct-and-covenant reason, never blood-hatred.'),

    -- THREAD 2: v.5,25-26 break the altars / no abomination into thine house
    ('canon','deuteronomy',7,5,'canon','1-john',5,21,'free',
     E'*Little children, keep yourselves from idols. Amen* (1 John 5:21). The whole of Deuteronomy 7:5 -- *ye shall destroy their altars, and break down their images, and cut down their groves, and burn their graven images with fire* -- comes to its plainest New Testament echo in this closing charge of John: no idol tolerated near the covenant heart.'),
    ('canon','deuteronomy',7,26,'canon','1-john',5,21,'free',
     E'*Little children, keep yourselves from idols. Amen* (1 John 5:21). *Neither shalt thou bring an abomination into thine house, lest thou be a cursed thing like it* (Deuteronomy 7:26) -- the idol carries its curse into whatever house receives it; John''s last word guards that same threshold of the heart.'),
    ('canon','deuteronomy',7,5,'canon','deuteronomy',12,3,'free',
     E'*And ye shall overthrow their altars, and break their pillars, and burn their groves with fire; and ye shall hew down the graven images of their gods, and destroy the names of them out of that place* (Deuteronomy 12:3). The command repeats almost word for word from Deuteronomy 7:5 -- the false worship is to be dismantled utterly, the system torn down so the heart is not snared.'),

    -- THREAD 3: v.6 an holy people, chosen, a special people
    ('canon','deuteronomy',7,6,'canon','1-peter',2,9,'free',
     E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9). Peter is quoting this very verse: *thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah... hath chosen thee to be a special people unto himself* (Deuteronomy 7:6). The chosen two-house people, restored -- not a new people replacing them.'),
    ('canon','deuteronomy',7,6,'canon','titus',2,14,'free',
     E'*Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14). The *special people unto himself* of Deuteronomy 7:6 is the *peculiar people* of Titus 2:14 -- chosen, redeemed, and set apart UNTO obedience, never apart from it.'),
    ('canon','deuteronomy',7,6,'canon','exodus',19,5,'free',
     E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). The Sinai charter Moses now re-affirms: *a special people unto himself, above all people* (Deuteronomy 7:6) -- the same election, conditioned on keeping the covenant.'),
    ('canon','deuteronomy',7,6,'canon','exodus',19,6,'free',
     E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6). *Thou art an holy people unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 7:6) -- the *holy nation* of Sinai is the *holy people* of Moab, the priestly calling carried into the land.'),

    -- THREAD 4: v.7-8 not because more in number, but because he loved you and kept the oath
    ('canon','deuteronomy',7,8,'canon','deuteronomy',9,5,'free',
     E'*Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land... but... that he may perform the word which Yahuah (LORD) sware unto thy fathers, Abraham, Isaac, and Jacob* (Deuteronomy 9:5). The companion text: as 7:8 grounds election in love and oath not number, 9:5 grounds it in the oath not merit -- the sworn word to the fathers, never flesh-credit.'),
    ('canon','deuteronomy',7,8,'canon','malachi',1,2,'free',
     E'*I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob* (Malachi 1:2). *Because Yahuah (LORD) loved you, and because he would keep the oath* (Deuteronomy 7:8) -- the electing love named here is the same love Malachi presses centuries later: chosen by love, not by worth.'),
    ('canon','deuteronomy',7,7,'canon','romans',9,11,'free',
     E'*(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* (Romans 9:11). Paul builds his doctrine of election straight out of Deuteronomy 7:7 -- *Yahuah (LORD) did not set his love upon you... because ye were more in number* -- election rests on the One who calls, not on merit or size.'),
    ('canon','deuteronomy',7,8,'canon','romans',9,13,'free',
     E'*As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13). *Because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* (Deuteronomy 7:8) -- the love that elected Jacob and kept the oath is the love Paul cites; never false-inclusion by confession, never flesh-merit, but sovereign covenant love.'),
    ('canon','deuteronomy',7,8,'canon','ephesians',1,4,'free',
     E'*According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love* (Ephesians 1:4). The choosing *in love* before the world is the same electing love of Deuteronomy 7:8 -- *because Yahuah (LORD) loved you* -- and it is unto holiness, not instead of it.'),
    ('canon','deuteronomy',7,8,'canon','ephesians',1,5,'free',
     E'*Having predestinated us unto the adoption of children by Yahusha HaMashiach (Jesus Christ) to himself, according to the good pleasure of his will* (Ephesians 1:5). Election *according to the good pleasure of his will*, not human number or merit -- the very ground of Deuteronomy 7:7-8, the oath and the love of Yahuah and nothing in us.'),

    -- THREAD 5: v.9 the faithful El, keepeth covenant and mercy to a thousand generations
    ('canon','deuteronomy',7,9,'canon','exodus',20,6,'free',
     E'*And shewing mercy unto thousands of them that love me, and keep my commandments* (Exodus 20:6). The Decalogue''s own promise, restated in Deuteronomy 7:9: *the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* -- love and obedience held together, never split.'),
    ('canon','deuteronomy',7,9,'canon','exodus',34,6,'free',
     E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). The Name proclaimed on Sinai stands behind Deuteronomy 7:9''s *faithful Elohim (God)* -- the covenant-keeping, mercy-keeping character of Yahuah himself.'),
    ('canon','deuteronomy',7,10,'canon','exodus',34,7,'free',
     E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty* (Exodus 34:7). Deuteronomy 7:9-10 holds the same two edges: *mercy... to a thousand generations* yet *repayeth them that hate him to their face* -- the faithful El who both keeps covenant and does not clear the unrepentant.'),
    ('canon','deuteronomy',7,9,'canon','daniel',9,4,'free',
     E'*And I prayed unto Yahuah Elohai (the LORD my God), and made my confession, and said, O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments* (Daniel 9:4). Daniel prays Deuteronomy 7:9 back almost verbatim from exile -- the faithful covenant-keeper, the same condition: love him and keep his commandments.'),
    ('canon','deuteronomy',7,9,'canon','nehemiah',1,5,'free',
     E'*And said, I beseech thee, O Yahuah Elohim (LORD God) of heaven, the great and terrible Elohim (God), that keepeth covenant and mercy for them that love him and observe his commandments* (Nehemiah 1:5). Nehemiah, like Daniel, prays in the words of Deuteronomy 7:9 -- the prayer of the remnant resting on the faithful El who keeps covenant and mercy.'),
    ('canon','deuteronomy',7,9,'canon','1-john',5,3,'free',
     E'*For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3). Deuteronomy 7:9 binds *them that love him and keep his commandments* -- and John carries the identical filter forward: love IS commandment-keeping. Any reading that makes the commandments irrelevant fails this test.'),

    -- THREAD 6: v.17-21 fear not, remember Pharaoh; a mighty El and terrible
    ('canon','deuteronomy',7,18,'canon','exodus',15,6,'free',
     E'*Thy right hand, O Yahuah (LORD), is become glorious in power: thy right hand, O Yahuah (LORD), hath dashed in pieces the enemy* (Exodus 15:6). *Shalt well remember what Yahuah Elohayka (the LORD thy God) did unto Pharaoh, and unto all Egypt* (Deuteronomy 7:18) -- the Song of the Sea is the very memory Moses bids them rehearse against fear of the nations.'),
    ('canon','deuteronomy',7,21,'canon','exodus',15,11,'free',
     E'*Who is like unto thee, O Yahuah (LORD), among the gods? who is like thee, glorious in holiness, fearful in praises, doing wonders?* (Exodus 15:11). *Yahuah Elohayka (the LORD thy God) is among you, a mighty Elohim (God) and terrible* (Deuteronomy 7:21) -- the incomparable, awesome El of the Red Sea is the same El now in their midst, so they need not be afraid.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================================================================================
-- THREADS
-- ===================================================================================

-- THREAD 1 (extras: Jubilees member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled',
       E'Make no covenant, no marriages: the holy seed not mingled',
       E'On the threshold of the land Yahuah commands a separation that is covenant and conduct, never blood-hatred: *thou shalt make no covenant with them, nor shew mercy unto them: Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:2-3). The reason is stated outright -- *for they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4). The peril is apostasy of the heart, the holy seed drawn off after idols, never the existence of the peoples.\n\nThe charge stands across the canon. At Sinai: *Take heed to thyself, lest thou make a covenant with the inhabitants of the land... lest it be for a snare* (Exodus 34:12), *and thou take of their daughters unto thy sons, and their daughters go a whoring after their gods* (Exodus 34:16). Joshua warns at his death that the spared nations, if joined to, *shall be snares and traps unto you, and scourges in your sides, and thorns in your eyes* (Joshua 23:13). Ezra weeps when the remnant breaks it -- *the holy seed have mingled themselves with the people of those lands* (Ezra 9:2) -- and quotes Moses back as binding law: *give not your daughters unto their sons, neither take their daughters unto your sons* (Ezra 9:12).\n\nThe restored witness reads the same: *command the children of Yashar''el (Israel)... not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God)* (Jubilees 30:11) -- abominable because of defilement and apostasy, the same conduct-and-covenant reason. And the apostle carries the principle straight forward: *Be ye not unequally yoked together with unbelievers... Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:14,17). One charge, one reason, victims-not-enemies throughout: guard the heart, never hate the people.',
       sv.verse_id, ev.verse_id, 'extras', 24650
  FROM _s310_deu07_lookup sv, _s310_deu07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=7 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-7-break-down-their-altars-no-abomination-into-thine-house',
       E'Break down their altars: no abomination into thine house',
       E'The separation of Deuteronomy 7 is not passive avoidance but active dismantling of the idol-system: *ye shall destroy their altars, and break down their images, and cut down their groves, and burn their graven images with fire* (Deuteronomy 7:5). And nothing of it is to be carried home: *Neither shalt thou bring an abomination into thine house, lest thou be a cursed thing like it: but thou shalt utterly detest it, and thou shalt utterly abhor it; for it is a cursed thing* (Deuteronomy 7:26). The system is torn down; the persons are not the target.\n\nThe command repeats almost word for word in the central-worship law: *ye shall overthrow their altars, and break their pillars, and burn their groves with fire; and ye shall hew down the graven images of their gods, and destroy the names of them out of that place* (Deuteronomy 12:3). And the same charge comes to its plainest New Testament echo in John''s closing word: *Little children, keep yourselves from idols. Amen* (1 John 5:21). From the altars of Canaan to the idols of John''s churches, the heart is guarded the same way -- the idol with its curse kept utterly out.',
       sv.verse_id, ev.verse_id, 'free', 24653
  FROM _s310_deu07_lookup sv, _s310_deu07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=7 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-7-an-holy-people-chosen-a-special-people-unto-himself',
       E'An holy people, chosen, a special people unto himself',
       E'Here is the charter of the chosen people: *thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). It re-affirms Sinai word for word -- *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5), *and ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6) -- election conditioned on keeping the covenant, a priestly calling.\n\nThe New Testament does not found a new people; it quotes this one. *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9) lifts the very words of Deuteronomy 7:6 and Exodus 19:6. And the calling is unto obedience, never apart from it: *Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14). The two-house people chosen and restored -- not replaced.',
       sv.verse_id, ev.verse_id, 'free', 24656
  FROM _s310_deu07_lookup sv, _s310_deu07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-7-not-because-ye-were-more-but-because-he-loved-you-and-kept-the-oath',
       E'Not because ye were more, but because he loved you and kept the oath',
       E'Election here is grounded in nothing in the people themselves: *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people: But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* (Deuteronomy 7:7-8). Not number, not merit -- love and the sworn word. The companion text says it of righteousness: *Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land... but... that he may perform the word which Yahuah (LORD) sware unto thy fathers, Abraham, Isaac, and Jacob* (Deuteronomy 9:5).\n\nThe electing love runs forward. Malachi presses it: *I have loved you, saith Yahuah (LORD)... yet I loved Jacob* (Malachi 1:2). Paul builds his whole doctrine of election out of it: *the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth* (Romans 9:11), *as it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13). And it reaches the saints in Messiah: *he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love* (Ephesians 1:4), *having predestinated us unto the adoption of children... according to the good pleasure of his will* (Ephesians 1:5). Never flesh-merit, never false-inclusion by confession -- sovereign covenant love and the oath, and the choosing is unto holiness.',
       sv.verse_id, ev.verse_id, 'free', 24659
  FROM _s310_deu07_lookup sv, _s310_deu07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-7-the-faithful-el-keepeth-covenant-and-mercy-to-them-that-love-him',
       E'The faithful El: keepeth covenant and mercy to them that love him',
       E'The ground of confidence is the character of Yahuah himself: *Know therefore that Yahuah Elohayka (the LORD thy God), he is Elohim (God), the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* (Deuteronomy 7:9) -- and the other edge -- *And repayeth them that hate him to their face, to destroy them* (Deuteronomy 7:10). Love and obedience are held together, never split apart.\n\nThis is the Decalogue''s own promise -- *shewing mercy unto thousands of them that love me, and keep my commandments* (Exodus 20:6) -- and the Name proclaimed on Sinai: *Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6), *keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty* (Exodus 34:7). From exile the prophets pray it back almost verbatim: *the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments* (Daniel 9:4); *the great and terrible Elohim (God), that keepeth covenant and mercy for them that love him and observe his commandments* (Nehemiah 1:5).\n\nAnd John carries the identical filter to the end: *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3). Love is commandment-keeping, the Torah written on the heart, never the Torah set aside.',
       sv.verse_id, ev.verse_id, 'free', 24662
  FROM _s310_deu07_lookup sv, _s310_deu07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-7-fear-not-remember-what-he-did-unto-pharaoh-a-mighty-el-and-terrible',
       E'Fear not: remember what he did unto Pharaoh, a mighty El and terrible',
       E'Against the dread of the nations Moses prescribes memory, not panic: *If thou shalt say in thine heart, These nations are more than I; how can I dispossess them? Thou shalt not be afraid of them: but shalt well remember what Yahuah Elohayka (the LORD thy God) did unto Pharaoh, and unto all Egypt* (Deuteronomy 7:17-18). And the assurance is presence: *Thou shalt not be affrighted at them: for Yahuah Elohayka (the LORD thy God) is among you, a mighty Elohim (God) and terrible* (Deuteronomy 7:21).\n\nThe memory Moses bids them rehearse is the Song of the Sea. *Thy right hand, O Yahuah (LORD), is become glorious in power: thy right hand, O Yahuah (LORD), hath dashed in pieces the enemy* (Exodus 15:6) -- this is what he did unto Pharaoh. And the incomparable, awesome El who drowned the chariots is the very One now in their midst: *Who is like unto thee, O Yahuah (LORD), among the gods? who is like thee, glorious in holiness, fearful in praises, doing wonders?* (Exodus 15:11). Remember the Red Sea, and the seven nations hold no terror.',
       sv.verse_id, ev.verse_id, 'free', 24665
  FROM _s310_deu07_lookup sv, _s310_deu07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=7 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ===================================================================================
-- THREAD MEMBERS
-- ===================================================================================

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Corinthians 6:14 -- *be ye not unequally yoked* carries forward *make no covenant* (Deut 7:2): covenant separation, not hatred.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Corinthians 6:17 -- *come out from among them, and be ye separate* echoes *make no marriages* (Deut 7:3), the holy seed unmingled.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 34:12 -- the Sinai original: *lest thou make a covenant... lest it be for a snare* = Deut 7:2.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 34:16 -- names the reason for the marriage ban: *make thy sons go a whoring after their gods* = Deut 7:4.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Ezra 9:2 -- the breach wept over: *the holy seed have mingled themselves* = the very thing Deut 7:3 forbade.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Ezra 9:12 -- quotes Deut 7:3 back as binding Torah: *give not your daughters... neither take their daughters*.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Joshua 23:13 -- breaking the charter turns the spared nations into *snares and traps... thorns in your eyes* (Deut 7:2 outcome).'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Jubilees 30:11 (extras) -- the restored witness reads Deut 7:3 as standing law: *not to give their daughters to the nations... abominable before Yahuah*.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-make-no-covenant-no-marriages-the-holy-seed-not-mingled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 John 5:21 -- *keep yourselves from idols* is the plainest NT echo of *destroy their altars... burn their graven images* (Deut 7:5).'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-break-down-their-altars-no-abomination-into-thine-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 John 5:21 -- also guards *neither shalt thou bring an abomination into thine house* (Deut 7:26): no idol near the heart.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-break-down-their-altars-no-abomination-into-thine-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 12:3 -- repeats the demolition almost verbatim: *overthrow their altars... burn their groves... destroy the names of them*.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-break-down-their-altars-no-abomination-into-thine-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Peter 2:9 -- *a chosen generation... a peculiar people* directly quotes *a special people unto himself* (Deut 7:6); two-house restored, not replaced.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-an-holy-people-chosen-a-special-people-unto-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Titus 2:14 -- *a peculiar people, zealous of good works*: chosen UNTO obedience, the Deut 7:6 people redeemed.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-an-holy-people-chosen-a-special-people-unto-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 19:5 -- the Sinai charter: *a peculiar treasure unto me above all people*, conditioned on keeping the covenant = Deut 7:6.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-an-holy-people-chosen-a-special-people-unto-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 19:6 -- *a kingdom of priests, and an holy nation*: the *holy people* of Deut 7:6, the priestly calling into the land.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-an-holy-people-chosen-a-special-people-unto-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 9:5 -- companion text: not for righteousness but to *perform the word which Yahuah sware unto thy fathers* = the oath of Deut 7:8.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-not-because-ye-were-more-but-because-he-loved-you-and-kept-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Malachi 1:2 -- *I have loved you... yet I loved Jacob*: the electing love of Deut 7:8 pressed centuries on.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-not-because-ye-were-more-but-because-he-loved-you-and-kept-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Romans 9:11 -- *not of works, but of him that calleth* built straight out of *not because ye were more in number* (Deut 7:7).'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-not-because-ye-were-more-but-because-he-loved-you-and-kept-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 9:13 -- *Jacob have I loved* cites the same covenant love that *loved you... and kept the oath* (Deut 7:8); not flesh-merit.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-not-because-ye-were-more-but-because-he-loved-you-and-kept-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Ephesians 1:4 -- *chosen... before the foundation of the world... in love* = the electing love of Deut 7:8, unto holiness.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-not-because-ye-were-more-but-because-he-loved-you-and-kept-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Ephesians 1:5 -- predestinated *according to the good pleasure of his will*: the ground of Deut 7:7-8, never human number or merit.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-not-because-ye-were-more-but-because-he-loved-you-and-kept-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 20:6 -- the Decalogue''s own *mercy unto thousands of them that love me, and keep my commandments* = Deut 7:9, love and obedience joined.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-the-faithful-el-keepeth-covenant-and-mercy-to-them-that-love-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 34:6 -- the Name proclaimed: *merciful and gracious, longsuffering, and abundant in goodness and truth* behind the *faithful Elohim* of Deut 7:9.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-the-faithful-el-keepeth-covenant-and-mercy-to-them-that-love-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 34:7 -- both edges held: *keeping mercy for thousands... and that will by no means clear the guilty* = Deut 7:9-10 mercy + repayment.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-the-faithful-el-keepeth-covenant-and-mercy-to-them-that-love-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Daniel 9:4 -- prays Deut 7:9 back almost verbatim from exile: *keeping the covenant and mercy to them that love him, and to them that keep his commandments*.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-the-faithful-el-keepeth-covenant-and-mercy-to-them-that-love-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Nehemiah 1:5 -- the same prayer of the remnant: *that keepeth covenant and mercy for them that love him and observe his commandments* = Deut 7:9.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-the-faithful-el-keepeth-covenant-and-mercy-to-them-that-love-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 John 5:3 -- the same filter to the end: *the love of Elohim, that we keep his commandments* = Deut 7:9; commandment-keeping never irrelevant.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-the-faithful-el-keepeth-covenant-and-mercy-to-them-that-love-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 15:6 -- the Song of the Sea, the very memory of *what he did unto Pharaoh* (Deut 7:18): *thy right hand... hath dashed in pieces the enemy*.'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-fear-not-remember-what-he-did-unto-pharaoh-a-mighty-el-and-terrible'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 15:11 -- *who is like unto thee, O Yahuah... glorious in holiness... doing wonders?* = the *mighty Elohim and terrible* now among them (Deut 7:21).'
  FROM cross_reference_threads t
  JOIN _s310_deu07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s310_deu07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-7-fear-not-remember-what-he-did-unto-pharaoh-a-mighty-el-and-terrible'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_deuteronomy_8.sql (Deuteronomy 8) -----
-- Chapter: Deuteronomy 8 — the wilderness test: "not by bread alone," chastening as a son,
--   the good land and table-grace, the prosperity-danger of a lifted-up heart, and Yahuah the
--   giver of power to get wealth who keeps his covenant.
-- Tag: deu08 | Session prefix: s310 | Temp view: _s310_deu08_lookup
-- Sort band base 24675, step 3.
--
-- FRAMING: This is THE wilderness-test keystone. The forty years are a deliberate proving — Yahuah
--   *humbled thee, and suffered thee to hunger, and fed thee with manna... that he might make thee
--   know that man doth not live by bread only, but by every word that proceedeth out of the mouth of
--   Yahuah doth man live* (8:3). The Formed Son recapitulates Israel's wilderness test and PASSES
--   where the nation failed: led into the wilderness, fasting, hungered, he repels the tempter with
--   this very verse (Matthew 4:4 / Luke 4:4) — the true Son tested as the nation-son was tested.
--   The chastening of 8:5 is the father-son discipline Hebrews 12 names as the proof of sonship, not
--   wrath. The good land (8:7-10) is the source of the table-grace principle — bless Yahuah when full.
--   8:11-18 is the prosperity-danger spine: fullness breeds a lifted-up, forgetting heart that says
--   *My power and the might of mine hand hath gotten me this wealth* (8:17); the antidote is to
--   REMEMBER — *it is he that giveth thee power to get wealth, that he may establish his covenant*
--   (8:18). The rich-fool parable, the charge to the rich, and Laodicea's "rich and increased with
--   goods" all forward this warning. 8:15-16 — water from the rock, manna in the great and terrible
--   wilderness — is the wilderness-provision the prophets sing and Paul reads as the spiritual Rock
--   that was Messiah. Throughout: the commandments are kept UNTO life (8:1,6,11) — Torah the covenant
--   inheritance, never the curse; forgetting Yahuah and serving other gods is the perishing (8:19-20).
--
-- Deuteronomy 8 coverage:
--   v.1     NT:     none warranted (obey-unto-life carried into the chastening + prosperity threads)
--           Extras: none warranted
--           Tanakh: none warranted (frame verse)
--   v.2-3   NT:     Matthew 4:4 + Luke 4:4 (the Formed Son quotes it verbatim, recapitulating + passing the test)
--           Extras: none warranted (clean manna witnesses are canonical lateral)
--           Tanakh: Exodus 16:4,15 (manna given to prove), Psalm 78:24-25 (rained-down manna/angels' food), Nehemiah 9:20-21 (manna + raiment not old)
--   v.4     NT:     none warranted
--           Extras: none warranted
--           Tanakh: Nehemiah 9:21 (carried with v.3 thread — clothes waxed not old)
--   v.5     NT:     Hebrews 12:5-7 (whom Yahuah loveth he chasteneth — sonship discipline)
--           Extras: none warranted
--           Tanakh: Proverbs 3:11-12, Psalm 94:12 (chastening of the son / taught out of the law)
--   v.6     NT:     none warranted (keep-and-walk frame; Torah affirmed, carried in prose)
--           Extras: none warranted
--           Tanakh: none warranted
--   v.7-10  NT:     none warranted (table-grace principle carried lateral)
--           Extras: none warranted
--           Tanakh: Deuteronomy 6:11 (houses full thou filledst not), Nehemiah 9:25 (fat land, filled, became fat)
--   v.11-14 NT:     Luke 12:16-21 (the rich fool — eaten, full, lifted up, forgets)
--   v.17-18 NT:     1 Timothy 6:17 (rich not highminded, trust the living Elohim), Revelation 3:17 (rich and increased with goods, knowest not)
--           Extras: none warranted
--           Tanakh: Hosea 13:6 (filled, heart exalted, forgotten me), Proverbs 30:8-9 (neither poverty nor riches, lest I be full and deny thee)
--   v.15-16 NT:     1 Corinthians 10:3-4 (the spiritual meat + the Rock that was Messiah)
--           Extras: none warranted
--           Tanakh: Numbers 20:11 (water out of the rock), Psalm 105:41 (he opened the rock, waters gushed out)
--   v.19-20 NT:     none warranted (perish-if-forget; covenant-lawsuit carried in framing prose)
--           Extras: none warranted
--           Tanakh: none warranted
--
-- THREADS (6):
--   1. deuteronomy-8-not-by-bread-alone-but-by-every-word                (8:2-3)   libs: NT(Matthew,Luke) + Tanakh(Exodus,Psalms,Nehemiah)  [free]
--   2. deuteronomy-8-as-a-man-chasteneth-his-son                          (8:5)     libs: NT(Hebrews) + Tanakh(Proverbs,Psalms)               [free]
--   3. deuteronomy-8-the-good-land-when-thou-art-full-bless-yahuah        (8:7-10)  libs: Tanakh(Deuteronomy,Nehemiah)                         [free]
--   4. deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget     (8:11-18) libs: NT(Luke,1Timothy,Revelation) + Tanakh(Hosea,Proverbs) [free]
--   5. deuteronomy-8-water-out-of-the-rock-the-spiritual-rock            (8:15-16) libs: NT(1Corinthians) + Tanakh(Numbers,Psalms)            [free]
--   6. deuteronomy-8-my-power-and-the-might-of-mine-hand-vs-he-gives-power (8:17-18) libs: NT(1Timothy) + Tanakh(Hosea,Proverbs) -- see note
--
-- NOTE: threads 4 and 6 overlap on 8:17-18; thread 4 is the broad "lifted-up-heart/forget" arc
--   (8:11-18, NT rich-fool + Laodicea), thread 6 is the tight "self-credit vs Yahuah-the-giver"
--   pair (8:17 boast / 8:18 remember). To avoid double-threading I FOLD 6 into 4 — see below: this
--   file ships 5 threads, all keystone-weighted, with 8:17-18 carried inside thread 4. (5 is within
--   the 5-7 target.)

CREATE TEMP VIEW _s310_deu08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== CROSS_REFERENCES =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: not by bread alone (8:2-3 -> Matthew 4, Luke 4, Exodus 16, Psalm 78, Nehemiah 9)
    ('canon','deuteronomy',8,3,'canon','matthew',4,4,'free',
     E'*But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4). The Formed Son, led into the wilderness, fasting and an hungred, repels the tempter with this very verse — *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). He recapitulates Israel''s forty-year hunger-test and PASSES where the nation-son failed: the true Son fed on the word.'),
    ('canon','deuteronomy',8,3,'canon','luke',4,4,'free',
     E'*And Yahusha (Jesus) answered him, saying, It is written, That man shall not live by bread alone, but by every word of Elohim (God)* (Luke 4:4). Luke records the same answer drawn from *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3) — the Formed Son tested in the wilderness as Israel was tested, standing on the word against bread alone.'),
    ('canon','deuteronomy',8,2,'canon','exodus',16,4,'free',
     E'*Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no* (Exodus 16:4). The manna was a PROVING from the first day — *that I may prove them* matches Moses'' summary, Yahuah *led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments* (Deuteronomy 8:2). The daily bread tested obedience to the Torah.'),
    ('canon','deuteronomy',8,3,'canon','exodus',16,15,'free',
     E'*And when the children of Yashar''el (Israel) saw it, they said one to another, It is manna: for they wist not what it was. And Moses said unto them, This is the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15). This is the bread *which thou knewest not, neither did thy fathers know* (Deuteronomy 8:3) — given to teach that life flows from the mouth of Yahuah, not from bread alone.'),
    ('canon','deuteronomy',8,3,'canon','psalms',78,24,'free',
     E'*And had rained down manna upon them to eat, and had given them of the corn of heaven* (Psalm 78:24). The psalmist sings the wilderness feeding behind *fed thee with manna, which thou knewest not* (Deuteronomy 8:3) — the corn of heaven rained for a people Yahuah was teaching to live by his word.'),
    ('canon','deuteronomy',8,3,'canon','psalms',78,25,'free',
     E'*Man did eat angels'' food: he sent them meat to the full* (Psalm 78:25). The manna that taught *man doth not live by bread only* (Deuteronomy 8:3) is here named angels'' food — heaven''s provision, not earth''s harvest.'),
    ('canon','deuteronomy',8,3,'canon','nehemiah',9,20,'free',
     E'*Thou gavest also thy good spirit to instruct them, and withheldest not thy manna from their mouth, and gavest them water for their thirst* (Nehemiah 9:20). Nehemiah''s confession recalls the same provision — the manna unwithheld and the water given — behind Yahuah''s feeding *thee with manna, which thou knewest not* (Deuteronomy 8:3), joining the bread of heaven to the Spirit''s instruction.'),
    ('canon','deuteronomy',8,4,'canon','nehemiah',9,21,'free',
     E'*Yea, forty years didst thou sustain them in the wilderness, so that they lacked nothing; their clothes waxed not old, and their feet swelled not* (Nehemiah 9:21). This is the very wonder of *Thy raiment waxed not old upon thee, neither did thy foot swell, these forty years* (Deuteronomy 8:4) — sustained so wholly through the test that even their garments and feet were kept.'),

    -- Thread 2: chastening as a son (8:5 -> Hebrews 12, Proverbs 3, Psalm 94)
    ('canon','deuteronomy',8,5,'canon','hebrews',12,5,'free',
     E'*And ye have forgotten the exhortation which speaketh unto you as unto children, My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him* (Hebrews 12:5). The writer reads the wilderness-discipline of *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5) as the father''s training of beloved children, not wrath.'),
    ('canon','deuteronomy',8,5,'canon','hebrews',12,6,'free',
     E'*For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6). The chastening of Deuteronomy is LOVE — *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5); the humbling and proving of the forty years was a Father disciplining the son he receives.'),
    ('canon','deuteronomy',8,5,'canon','hebrews',12,7,'free',
     E'*If ye endure chastening, Elohim (God) dealeth with you as with sons; for what son is he whom the father chasteneth not?* (Hebrews 12:7). The mark of true sonship is the very discipline Moses names — *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5).'),
    ('canon','deuteronomy',8,5,'canon','proverbs',3,11,'free',
     E'*My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction* (Proverbs 3:11). Wisdom echoes the wilderness lesson — *consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5) — the son is not to spurn the Father''s correction.'),
    ('canon','deuteronomy',8,5,'canon','proverbs',3,12,'free',
     E'*For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:12). The father-son frame of *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5) is wisdom''s own: correction flows from delight, not rejection.'),
    ('canon','deuteronomy',8,5,'canon','psalms',94,12,'free',
     E'*Blessed is the man whom thou chastenest, O Yahuah (LORD), and teachest him out of thy law* (Psalm 94:12). The chastening of *as a man chasteneth his son* (Deuteronomy 8:5) is blessing, and it is wedded to the Torah — Yahuah disciplines AND teaches out of his law, the covenant instruction kept unto life (Deuteronomy 8:1,6).'),

    -- Thread 3: the good land, bless Yahuah when full (8:7-10 -> Deuteronomy 6, Nehemiah 9)
    ('canon','deuteronomy',8,7,'canon','deuteronomy',6,11,'free',
     E'*And houses full of all good things, which thou filledst not, and wells digged, which thou diggedst not, vineyards and olive trees, which thou plantedst not; when thou shalt have eaten and be full* (Deuteronomy 6:11). The same gift of an unearned land of *brooks of water... wheat, and barley, and vines, and fig trees, and pomegranates... oil olive, and honey* (Deuteronomy 8:7-8) — given full so that the people would receive, not boast, and bless the Giver.'),
    ('canon','deuteronomy',8,10,'canon','nehemiah',9,25,'free',
     E'*And they took strong cities, and a fat land, and possessed houses full of all goods, wells digged, vineyards, and oliveyards, and fruit trees in abundance: so they did eat, and were filled, and became fat, and delighted themselves in thy great goodness* (Nehemiah 9:25). Nehemiah records the land''s bounty exactly as promised — *When thou hast eaten and art full, then thou shalt bless Yahuah Elohayka (the LORD thy God) for the good land which he hath given thee* (Deuteronomy 8:10) — the table-grace principle: fullness is the cue to bless, here remembered as the prelude to forgetting.'),

    -- Thread 4: beware the lifted-up, forgetting heart (8:11-18 -> Luke 12, 1 Timothy 6, Revelation 3, Hosea 13, Proverbs 30)
    ('canon','deuteronomy',8,12,'canon','luke',12,16,'free',
     E'*And he spake a parable unto them, saying, The ground of a certain rich man brought forth plentifully* (Luke 12:16). The parable opens with the very scene Moses warns of — *when thou hast eaten and art full, and hast built goodly houses, and dwelt therein* (Deuteronomy 8:12) — the abundance that becomes a snare to the forgetting heart.'),
    ('canon','deuteronomy',8,17,'canon','luke',12,19,'free',
     E'*And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19). This is the lifted-up heart of *thou say in thine heart, My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17) — self-crediting, self-securing, forgetting the Giver.'),
    ('canon','deuteronomy',8,17,'canon','luke',12,20,'free',
     E'*But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). The rich fool is the man who said *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17) and did not *remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth* (Deuteronomy 8:18) — the warning of forgetting carried to its end.'),
    ('canon','deuteronomy',8,18,'canon','1-timothy',6,17,'free',
     E'*Charge them that are rich in this world, that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God), who giveth us richly all things to enjoy* (1 Timothy 6:17). Paul''s charge is Moses'' charge: against the lifted-up heart (Deuteronomy 8:14) and toward remembering *it is he that giveth thee power to get wealth* (Deuteronomy 8:18) — trust the Giver, not the gift.'),
    ('canon','deuteronomy',8,17,'canon','revelation',3,17,'free',
     E'*Because thou sayest, I am rich, and increased with goods, and have need of nothing; and knowest not that thou art wretched, and miserable, and poor, and blind, and naked* (Revelation 3:17). Laodicea speaks the exact boast Moses foresaw — *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17) — the fullness that breeds a forgetting, self-sufficient heart that does not know its true poverty.'),
    ('canon','deuteronomy',8,14,'canon','hosea',13,6,'free',
     E'*According to their pasture, so were they filled; they were filled, and their heart was exalted; therefore have they forgotten me* (Hosea 13:6). Hosea names the warning come true — *thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God)* (Deuteronomy 8:14): filled, exalted, and so forgetting the One who fed them.'),
    ('canon','deuteronomy',8,18,'canon','proverbs',30,8,'free',
     E'*Remove far from me vanity and lies: give me neither poverty nor riches; feed me with food convenient for me* (Proverbs 30:8). Agur prays for the middle path that guards against the very danger of 8:17 — wealth that makes the heart say *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17), forgetting *it is he that giveth thee power to get wealth* (Deuteronomy 8:18).'),
    ('canon','deuteronomy',8,14,'canon','proverbs',30,9,'free',
     E'*Lest I be full, and deny thee, and say, Who is Yahuah (LORD)? or lest I be poor, and steal, and take the name of my Elohim (God) in vain* (Proverbs 30:9). The peril of fullness is exactly Moses'' — *when thou hast eaten and art full... then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God)* (Deuteronomy 8:12-14): plenty tempting the soul to deny and forget its Maker.'),

    -- Thread 5: water out of the rock, the spiritual Rock (8:15-16 -> Numbers 20, Psalm 105, 1 Corinthians 10)
    ('canon','deuteronomy',8,15,'canon','numbers',20,11,'free',
     E'*And Moses lifted up his hand, and with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank, and their beasts also* (Numbers 20:11). This is the deed behind *who brought thee forth water out of the rock of flint* (Deuteronomy 8:15) — provision in the *great and terrible wilderness... where there was no water*, the Formed Son sustaining his people.'),
    ('canon','deuteronomy',8,15,'canon','psalms',105,41,'free',
     E'*He opened the rock, and the waters gushed out; they ran in the dry places like a river* (Psalm 105:41). The psalmist sings the same wonder of *water out of the rock of flint* (Deuteronomy 8:15) — rivers in the dry places, the wilderness made to give drink.'),
    ('canon','deuteronomy',8,16,'canon','1-corinthians',10,3,'free',
     E'*And did all eat the same spiritual meat* (1 Corinthians 10:3). The manna of *Who fed thee in the wilderness with manna, which thy fathers knew not* (Deuteronomy 8:16) is Paul''s spiritual meat — the wilderness feeding read forward as more than bread.'),
    ('canon','deuteronomy',8,15,'canon','1-corinthians',10,4,'free',
     E'*And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4). Paul names the giver of the water of *the rock of flint* (Deuteronomy 8:15): the Rock that followed Yashar''el (Israel) in the wilderness was the Formed Son, Messiah — the same One who *led thee through that great and terrible wilderness* (Deuteronomy 8:15).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== THREADS =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-8-not-by-bread-alone-but-by-every-word',
       E'Not by bread alone — the wilderness test the Formed Son passed',
       E'The forty years were a deliberate proving: Yahuah *led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). He *suffered thee to hunger, and fed thee with manna, which thou knewest not... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). The manna was a proving from the first day — *that I may prove them, whether they will walk in my law, or no* (Exodus 16:4) — *the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15), the *corn of heaven* (Psalm 78:24), *angels'' food* (Psalm 78:25), unwithheld with water for their thirst (Nehemiah 9:20), so that *forty years didst thou sustain them in the wilderness, so that they lacked nothing; their clothes waxed not old* (Nehemiah 9:21) — the wonder of *Thy raiment waxed not old upon thee, neither did thy foot swell, these forty years* (Deuteronomy 8:4). Then the Formed Son is led into the wilderness, fasts, hungers, and repels the tempter with this very word: *Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4; Luke 4:4). He recapitulates the nation-son''s test and PASSES where Israel failed — the true Son who lives by the word.',
       sv.verse_id, ev.verse_id, 'free', 24675
  FROM _s310_deu08_lookup sv, _s310_deu08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-8-as-a-man-chasteneth-his-son',
       E'As a man chasteneth his son — the discipline that proves sonship',
       E'Moses reads the whole humbling-and-proving of the wilderness as a father''s training: *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5). The writer to the Hebrews quotes this lens directly — *My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him* (Hebrews 12:5) — for *whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6), and *what son is he whom the father chasteneth not?* (Hebrews 12:7). Wisdom says the same: *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction* (Proverbs 3:11), *for whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:12). And the discipline is wedded to the Torah, never set against it: *Blessed is the man whom thou chastenest, O Yahuah (LORD), and teachest him out of thy law* (Psalm 94:12). The chastening of Deuteronomy 8 is love disciplining the son toward keeping the commandments unto life (Deuteronomy 8:1,6), not wrath.',
       sv.verse_id, ev.verse_id, 'free', 24678
  FROM _s310_deu08_lookup sv, _s310_deu08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-8-the-good-land-when-thou-art-full-bless-yahuah',
       E'The good land — when thou hast eaten and art full, bless Yahuah',
       E'The land is described in full bounty: *a good land, a land of brooks of water, of fountains and depths that spring out of valleys and hills; a land of wheat, and barley, and vines, and fig trees, and pomegranates; a land of oil olive, and honey; a land wherein thou shalt eat bread without scarceness, thou shalt not lack any thing in it; a land whose stones are iron, and out of whose hills thou mayest dig brass* (Deuteronomy 8:7-9). And the command that follows is the root of all table-grace: *When thou hast eaten and art full, then thou shalt bless Yahuah Elohayka (the LORD thy God) for the good land which he hath given thee* (Deuteronomy 8:10). It is a land received, not earned — *houses full of all good things, which thou filledst not, and wells digged, which thou diggedst not, vineyards and olive trees, which thou plantedst not* (Deuteronomy 6:11). Nehemiah records it fulfilled to the letter — *a fat land, and... houses full of all goods, wells digged, vineyards, and oliveyards, and fruit trees in abundance: so they did eat, and were filled, and became fat* (Nehemiah 9:25) — the very fullness that, ungratefully held, would become the snare of the next thread: blessing forgotten is forgetting begun.',
       sv.verse_id, ev.verse_id, 'free', 24681
  FROM _s310_deu08_lookup sv, _s310_deu08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=8 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget',
       E'Beware lest thine heart be lifted up and forget — My power vs. He who gives power',
       E'The prosperity-danger is the spine of the chapter: *Beware that thou forget not Yahuah Elohayka (the LORD thy God)... Lest when thou hast eaten and art full, and hast built goodly houses, and dwelt therein; and when thy herds and thy flocks multiply, and thy silver and thy gold is multiplied... Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God)* (Deuteronomy 8:11-14). The fatal boast is *thou say in thine heart, My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17); the antidote is to remember: *But thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth, that he may establish his covenant which he sware unto thy fathers* (Deuteronomy 8:18). The rich fool lives the warning whole — built bigger barns, said *Soul... take thine ease, eat, drink, and be merry* (Luke 12:19), and heard *Thou fool, this night thy soul shall be required of thee* (Luke 12:20). Paul charges the rich *that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God)* (1 Timothy 6:17). Laodicea is the boast itself — *I am rich, and increased with goods, and have need of nothing; and knowest not that thou art wretched, and miserable, and poor* (Revelation 3:17). Hosea names it fulfilled — *they were filled, and their heart was exalted; therefore have they forgotten me* (Hosea 13:6) — and Agur prays the guard: *give me neither poverty nor riches... Lest I be full, and deny thee, and say, Who is Yahuah (LORD)?* (Proverbs 30:8-9).',
       sv.verse_id, ev.verse_id, 'free', 24684
  FROM _s310_deu08_lookup sv, _s310_deu08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=8 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-8-water-out-of-the-rock-the-spiritual-rock',
       E'Water out of the rock of flint — the spiritual Rock that was Messiah',
       E'Moses recalls the wilderness provision: Yahuah *led thee through that great and terrible wilderness, wherein were fiery serpents, and scorpions, and drought, where there was no water; who brought thee forth water out of the rock of flint* (Deuteronomy 8:15), and *fed thee in the wilderness with manna, which thy fathers knew not, that he might humble thee, and that he might prove thee, to do thee good at thy latter end* (Deuteronomy 8:16). The deed itself: *Moses lifted up his hand, and with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank* (Numbers 20:11); the psalm sings it: *He opened the rock, and the waters gushed out; they ran in the dry places like a river* (Psalm 105:41). Paul reads the giver behind the gift: *they did all eat the same spiritual meat; and did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:3-4). The One who led Yashar''el (Israel) through the great and terrible wilderness and split the flint for water was the Formed Son — Messiah present with his people in the proving.',
       sv.verse_id, ev.verse_id, 'free', 24687
  FROM _s310_deu08_lookup sv, _s310_deu08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ===================== THREAD_MEMBERS =====================
-- Thread 1: not by bread alone (8:2-3)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Forward — *Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4): the Formed Son quotes 8:3 verbatim to repel the tempter, passing the wilderness test Israel failed.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-not-by-bread-alone-but-by-every-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Forward — *man shall not live by bread alone, but by every word of Elohim (God)* (Luke 4:4): Luke''s record of the same wilderness victory drawn from 8:3.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-not-by-bread-alone-but-by-every-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Lateral — *I will rain bread from heaven for you... that I may prove them, whether they will walk in my law, or no* (Exodus 16:4): the manna a proving of obedience from day one, behind *to prove thee, to know what was in thine heart* (Deuteronomy 8:2).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-not-by-bread-alone-but-by-every-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Lateral — *It is manna... This is the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15): the bread *which thou knewest not* (Deuteronomy 8:3).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-not-by-bread-alone-but-by-every-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Lateral — *had rained down manna upon them to eat, and had given them of the corn of heaven* (Psalm 78:24): the psalm sings the feeding of 8:3.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-not-by-bread-alone-but-by-every-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Lateral — *Man did eat angels'' food: he sent them meat to the full* (Psalm 78:25): the manna of 8:3 named heaven''s provision.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-not-by-bread-alone-but-by-every-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Lateral — *withheldest not thy manna from their mouth, and gavest them water for their thirst* (Nehemiah 9:20): the manna unwithheld of 8:3, joined to the Spirit''s instruction.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-not-by-bread-alone-but-by-every-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Lateral — *forty years didst thou sustain them in the wilderness... their clothes waxed not old, and their feet swelled not* (Nehemiah 9:21): the wonder of *Thy raiment waxed not old upon thee, neither did thy foot swell* (Deuteronomy 8:4).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=4
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-not-by-bread-alone-but-by-every-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: chastening as a son (8:5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Forward — *My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him* (Hebrews 12:5): the wilderness discipline of 8:5 read as a father''s training of children.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-as-a-man-chasteneth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Forward — *whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6): the chastening of 8:5 is love, not wrath.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-as-a-man-chasteneth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Forward — *what son is he whom the father chasteneth not?* (Hebrews 12:7): discipline is the mark of true sonship, the lens of 8:5.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-as-a-man-chasteneth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Lateral — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction* (Proverbs 3:11): wisdom echoes the son-discipline of 8:5.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-as-a-man-chasteneth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Lateral — *whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:12): correction from delight, the frame of 8:5.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-as-a-man-chasteneth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Lateral — *Blessed is the man whom thou chastenest, O Yahuah (LORD), and teachest him out of thy law* (Psalm 94:12): the chastening of 8:5 wedded to the Torah, blessing not wrath.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-as-a-man-chasteneth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the good land, bless Yahuah (8:7-10)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lateral — *houses full of all good things, which thou filledst not... vineyards and olive trees, which thou plantedst not; when thou shalt have eaten and be full* (Deuteronomy 6:11): the land received unearned, behind the good land of 8:7-9.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-the-good-land-when-thou-art-full-bless-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Lateral — *a fat land, and... houses full of all goods... so they did eat, and were filled, and became fat* (Nehemiah 9:25): the bounty fulfilled, the very fullness that became a snare — behind *when thou hast eaten and art full, then thou shalt bless Yahuah* (Deuteronomy 8:10).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-the-good-land-when-thou-art-full-bless-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: beware the lifted-up heart (8:11-18)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Forward — *The ground of a certain rich man brought forth plentifully* (Luke 12:16): the parable opens on the scene of *when thou hast eaten and art full, and hast built goodly houses* (Deuteronomy 8:12).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Forward — *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19): the lifted-up, self-securing heart of *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Forward — *Thou fool, this night thy soul shall be required of thee* (Luke 12:20): the end of the man who did not *remember Yahuah... for it is he that giveth thee power to get wealth* (Deuteronomy 8:18).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Forward — *that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God)* (1 Timothy 6:17): Paul''s charge is Moses'' — trust the Giver of *power to get wealth* (Deuteronomy 8:18), not the gift.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=18
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Forward — *I am rich, and increased with goods, and have need of nothing; and knowest not that thou art wretched, and miserable, and poor* (Revelation 3:17): Laodicea speaks the boast of *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Lateral — *they were filled, and their heart was exalted; therefore have they forgotten me* (Hosea 13:6): the warning of *thine heart be lifted up, and thou forget Yahuah* (Deuteronomy 8:14) come true.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Lateral — *give me neither poverty nor riches; feed me with food convenient for me* (Proverbs 30:8): Agur prays the guard against the self-credit of *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=18
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Lateral — *Lest I be full, and deny thee, and say, Who is Yahuah (LORD)?* (Proverbs 30:9): the peril of fullness exactly Moses'' — plenty tempting the heart to forget its Maker (Deuteronomy 8:12-14).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-beware-lest-thine-heart-be-lifted-up-and-forget'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: water out of the rock (8:15-16)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lateral — *with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank* (Numbers 20:11): the deed behind *who brought thee forth water out of the rock of flint* (Deuteronomy 8:15).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=15
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-water-out-of-the-rock-the-spiritual-rock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Lateral — *He opened the rock, and the waters gushed out; they ran in the dry places like a river* (Psalm 105:41): the psalm sings the wonder of *water out of the rock of flint* (Deuteronomy 8:15).'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=15
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-water-out-of-the-rock-the-spiritual-rock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Forward — *did all eat the same spiritual meat* (1 Corinthians 10:3): the manna of *Who fed thee in the wilderness with manna* (Deuteronomy 8:16) read as spiritual meat.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-water-out-of-the-rock-the-spiritual-rock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Forward — *they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4): the giver of the water of *the rock of flint* (Deuteronomy 8:15) was the Formed Son, present with his people in the proving.'
  FROM cross_reference_threads t
  JOIN _s310_deu08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=8 AND sv.verse_number=15
  JOIN _s310_deu08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-8-water-out-of-the-rock-the-spiritual-rock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_deuteronomy_9.sql (Deuteronomy 9) -----
--
-- Book: deuteronomy  Chapter: 9   Tag: deu09   Session prefix: s310
-- Sort band: base 24700 step 3 -> 24700, 24703, 24706, 24709, 24712, 24715
-- Temp view: _s310_deu09_lookup
--
-- FRAMING (the lens): Deuteronomy 9 is the great flesh-merit excision. Moses tells
-- Yashar'el that the land is NOT given for their righteousness but on (a) the wickedness
-- of the nations and (b) the OATH sworn to Abraham, Isaac, and Jacob — the seed-promise
-- and covenant-word together. This excludes the boast of the flesh credential; it does
-- NOT abolish Torah (the very chapter rehearses the breaking of the tables FOR sin and
-- Moses' intercession to RESTORE the covenant). Moses falling forty days in the breach
-- is the Prophet-like-Moses pattern of the Formed Son's ever-living intercession.
--
-- Deuteronomy 9 coverage:
--   v.1-3  Anakim / consuming fire — NT: Hebrews 12:29; Extras: none warranted;
--          Tanakh: Deut 4:24, Numbers 13:28, Numbers 13:33  -> THREAD 1
--   v.4-6  not-for-thy-righteousness / oath — NT: Titus 3:5, Romans 11:6, Ephesians 2:9;
--          Extras: none warranted; Tanakh: Deut 7:7, Deut 7:8, Ezekiel 36:22  -> THREAD 2
--   v.6,13 stiffnecked people — NT: Acts 7:51; Extras: none warranted;
--          Tanakh: Exodus 32:9, Exodus 33:3  -> THREAD 3
--   v.7-21 golden calf rehearsed / tables broken — NT: none warranted (carried in calf
--          theme); Extras: none warranted; Tanakh: Exodus 32:9, Exodus 32:31, Exodus 32:32
--          -> THREAD 4
--   v.18-29 Moses the intercessor in the breach — NT: Hebrews 7:25, Romans 9:3,
--          1 Timothy 2:5; Extras: none warranted; Tanakh: Psalm 106:23, Exodus 32:11,
--          Exodus 32:12  -> THREAD 5
--   v.26-29 plead the oath to the fathers / thine inheritance — NT: none warranted;
--          Extras: none warranted; Tanakh: Exodus 32:13, Exodus 32:14  -> THREAD 6
--
-- Threads (slug -> target libraries):
--   1 deuteronomy-9-yahuah-goeth-over-as-a-consuming-fire            free  (Tanakh + NT)
--   2 deuteronomy-9-not-for-thy-righteousness-but-the-oath           free  (Tanakh + NT)
--   3 deuteronomy-9-thou-art-a-stiffnecked-people                    free  (Tanakh + NT)
--   4 deuteronomy-9-the-golden-calf-and-the-broken-tables            free  (Tanakh)
--   5 deuteronomy-9-moses-fell-down-forty-days-in-the-breach         free  (Tanakh + NT)
--   6 deuteronomy-9-remember-thy-servants-plead-the-oath             free  (Tanakh)
--
-- Contested verse handling: 9:4-6 is framed as flesh-merit/self-righteous-boast
-- EXCLUDED (oath + nations' wickedness), NOT Torah abolished — the new-covenant heart
-- still keeps the covenant (Ezek 36 / Titus 3:5 washing-of-regeneration UNTO walking).
--
-- SAFE VERBOSE FORM: one cross_references INSERT FROM (VALUES ...) AS i; separate
-- threads INSERTs; separate per-member INSERT blocks. No BEGIN/COMMIT/\echo.

CREATE TEMP VIEW _s310_deu09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM ( VALUES

  -- THREAD 1: consuming fire goeth over before thee (9:1-3)
  ('canon','deuteronomy',9,3,'canon','deuteronomy',4,24,'free',
   E'*For Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* (Deuteronomy 4:24). Five chapters earlier Moses named the very fire that now *goeth over before thee; as a consuming fire he shall destroy them* (Deuteronomy 9:3) — the same devouring holiness that drives out the Anakim is the jealous Elohim of the covenant.'),
  ('canon','deuteronomy',9,2,'canon','numbers',13,28,'free',
   E'*Nevertheless the people be strong that dwell in the land, and the cities are walled, and very great: and moreover we saw the children of Anak there* (Numbers 13:28). This is the very report Moses recalls — *A people great and tall, the children of the Anakims, whom thou knowest* (Deuteronomy 9:2) — the giants the spies feared, now to be dispossessed because Yahuah goeth over before.'),
  ('canon','deuteronomy',9,2,'canon','numbers',13,33,'free',
   E'*And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight* (Numbers 13:33). The unbelief that quailed before *the children of Anak* (Deuteronomy 9:2) is answered: the Anakim are not bigger than the consuming fire that goes before His people.'),
  ('canon','deuteronomy',9,3,'canon','hebrews',12,29,'free',
   E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29). The writer to the Hebrews lifts Moses'' word forward unchanged — the *consuming fire* that *goeth over before thee* to destroy the nations (Deuteronomy 9:3) is the same Elohim before whom the assembly of the firstborn still stands in reverence.'),

  -- THREAD 2: not for thy righteousness, but the oath (9:4-6)
  ('canon','deuteronomy',9,5,'canon','deuteronomy',7,7,'free',
   E'*Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people* (Deuteronomy 7:7). The same excision of merit: *Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land* (Deuteronomy 9:5) — election rests on Yahuah''s love and oath, never on Israel''s deserving.'),
  ('canon','deuteronomy',9,5,'canon','deuteronomy',7,8,'free',
   E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers... brought you out with a mighty hand* (Deuteronomy 7:8). This is the ground Deuteronomy 9:5 names — *that he may perform the word which Yahuah (LORD) sware unto thy fathers, Abraham, Isaac, and Jacob* — the seed-promise oath, not flesh-merit, carries the inheritance.'),
  ('canon','deuteronomy',9,4,'canon','ezekiel',36,22,'free',
   E'*I do not this for your sakes, O house of Yashar''el (Israel), but for mine holy name''s sake, which ye have profaned among the heathen* (Ezekiel 36:22). The prophet of the new heart echoes Moses exactly: *Speak not thou in thine heart... For my righteousness Yahuah (LORD) hath brought me in* (Deuteronomy 9:4) — Yahuah acts for His name and oath, then writes His Torah on the heart, never for the people''s sake.'),
  ('canon','deuteronomy',9,5,'canon','titus',3,5,'free',
   E'*Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5). Paul carries Moses'' principle forward word for word — *Not for thy righteousness, or for the uprightness of thine heart* (Deuteronomy 9:5): the flesh credential is excluded, mercy and the Spirit''s renewing bring in, and the renewed walk the covenant — Torah is not abolished, self-merit is.'),
  ('canon','deuteronomy',9,4,'canon','romans',11,6,'free',
   E'*And if by grace, then is it no more of works: otherwise grace is no more grace* (Romans 11:6). The same logic as *Speak not thou in thine heart, after that Yahuah Elohayka (the LORD thy God) hath cast them out from before thee, saying, For my righteousness* (Deuteronomy 9:4) — the gift cannot be claimed as a wage of one''s own righteousness.'),
  ('canon','deuteronomy',9,6,'canon','ephesians',2,9,'free',
   E'*Not of works, lest any man should boast* (Ephesians 2:9). Moses had already shut the boast: *Yahuah Elohayka (the LORD thy God) giveth thee not this good land to possess it for thy righteousness; for thou art a stiffnecked people* (Deuteronomy 9:6). The inheritance, like salvation, leaves no room for the flesh to glory.'),

  -- THREAD 3: thou art a stiffnecked people (9:6,13)
  ('canon','deuteronomy',9,6,'canon','exodus',32,9,'free',
   E'*And Yahuah (LORD) said unto Moses, I have seen this people, and, behold, it is a stiffnecked people* (Exodus 32:9). The same verdict Moses presses on them: *for thou art a stiffnecked people* (Deuteronomy 9:6) — the calf-day diagnosis becomes the standing description that strips every claim of merit.'),
  ('canon','deuteronomy',9,13,'canon','exodus',33,3,'free',
   E'*for I will not go up in the midst of thee; for thou art a stiffnecked people: lest I consume thee in the way* (Exodus 33:3). Deuteronomy 9:13 rehearses Yahuah''s own word — *I have seen this people, and, behold, it is a stiffnecked people* — the refrain that nearly cost them His presence in the way.'),
  ('canon','deuteronomy',9,13,'canon','acts',7,51,'free',
   E'*Ye stiffnecked and uncircumcised in heart and ears, ye do always resist the Ruach HaKodesh (Holy Spirit): as your fathers did, so do ye* (Acts 7:51). Stephen lays Moses'' indictment on a later generation — *it is a stiffnecked people* (Deuteronomy 9:13) — the same hardness, *as your fathers did*, resisting the Spirit who gave the Torah.'),

  -- THREAD 4: the golden calf and the broken tables (9:7-21)
  ('canon','deuteronomy',9,16,'canon','exodus',32,9,'free',
   E'*And Yahuah (LORD) said unto Moses, I have seen this people, and, behold, it is a stiffnecked people* (Exodus 32:9). Deuteronomy 9:16 rehearses the moment of the molten calf — *ye had made you a molten calf: ye had turned aside quickly out of the way* — the sin that broke the tables and laid the people open to destruction.'),
  ('canon','deuteronomy',9,18,'canon','exodus',32,31,'free',
   E'*And Moses returned unto Yahuah (LORD), and said, Oh, this people have sinned a great sin, and have made them gods of gold* (Exodus 32:31). The fasting and falling of Deuteronomy 9:18 — *I fell down before Yahuah (LORD)... because of all your sins which ye sinned* — is the same intercession Exodus records, owning the great sin of the gold.'),
  ('canon','deuteronomy',9,19,'canon','exodus',32,32,'free',
   E'*Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32). Behind Moses'' *I was afraid of the anger and hot displeasure... But Yahuah (LORD) hearkened unto me at that time also* (Deuteronomy 9:19) stands this offer to be blotted out for them — the mediator staking himself for the people.'),

  -- THREAD 5: Moses fell down forty days, stood in the breach (9:18-29)
  ('canon','deuteronomy',9,18,'canon','psalms',106,23,'free',
   E'*Therefore he said that he would destroy them, had not Moses his chosen stood before him in the breach, to turn away his wrath, lest he should destroy them* (Psalm 106:23). The Psalm names what Deuteronomy 9:18 narrates — *I fell down before Yahuah (LORD)... forty days and forty nights* — Moses the chosen standing in the breach to turn away the wrath.'),
  ('canon','deuteronomy',9,26,'canon','exodus',32,11,'free',
   E'*And Moses besought Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), why doth thy wrath wax hot against thy people, which thou hast brought forth out of the land of Egypt with great power, and with a mighty hand?* (Exodus 32:11). This is the very prayer of Deuteronomy 9:26 — *destroy not thy people and thine inheritance, which thou hast redeemed... which thou hast brought forth out of Egypt with a mighty hand* — the redeemed-from-Egypt plea repeated.'),
  ('canon','deuteronomy',9,28,'canon','exodus',32,12,'free',
   E'*Wherefore should the Egyptians speak, and say, For mischief did he bring them out, to slay them in the mountains... Turn from thy fierce wrath* (Exodus 32:12). Deuteronomy 9:28 pleads the same name-of-Yahuah argument — *Lest the land whence thou broughtest us out say, Because Yahuah (LORD) was not able to bring them into the land... he hath brought them out to slay them* — guarding Yahuah''s honour among the nations.'),
  ('canon','deuteronomy',9,18,'canon','hebrews',7,25,'free',
   E'*Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). Moses falling *forty days and forty nights* (Deuteronomy 9:18) for a people deserving destruction is the shadow of the Prophet-like-Moses, the Formed Son who *ever liveth* in unbroken intercession.'),
  ('canon','deuteronomy',9,18,'canon','romans',9,3,'free',
   E'*For I could wish that myself were accursed from Messiah (Christ) for my brethren, my kinsmen according to the flesh* (Romans 9:3). Paul echoes the Moses pattern of Deuteronomy 9:18 — the mediator willing to be cut off for his people — the self-offering love that turns away wrath.'),
  ('canon','deuteronomy',9,26,'canon','1-timothy',2,5,'free',
   E'*For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). Moses standing between wrath and people in Deuteronomy 9:26 — *I prayed therefore unto Yahuah (LORD), and said, O Yahuah (Lord) GOD, destroy not thy people* — foreshadows the one Mediator, the Man, who intercedes before the Father.'),

  -- THREAD 6: remember thy servants, plead the oath (9:26-29)
  ('canon','deuteronomy',9,27,'canon','exodus',32,13,'free',
   E'*Remember Abraham, Isaac, and Yashar''el (Israel), thy servants, to whom thou swarest by thine own self... I will multiply your seed as the stars of heaven, and all this land that I have spoken of will I give unto your seed* (Exodus 32:13). Deuteronomy 9:27 prays the identical plea — *Remember thy servants, Abraham, Isaac, and Jacob; look not unto the stubbornness of this people* — resting the people''s survival on the oath to the fathers, never on their righteousness.'),
  ('canon','deuteronomy',9,29,'canon','exodus',32,14,'free',
   E'*And Yahuah (LORD) repented of the evil which he thought to do unto his people* (Exodus 32:14). The answer to Deuteronomy 9:29 — *Yet they are thy people and thine inheritance, which thou broughtest out by thy mighty power and by thy stretched out arm* — the oath-pleading prevails; the inheritance is spared because Yahuah keeps His sworn word.')

  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-9-yahuah-goeth-over-as-a-consuming-fire',
       E'Yahuah goeth over before thee as a consuming fire',
       E'Moses sends Yashar''el against giants: *A people great and tall, the children of the Anakims, whom thou knowest, and of whom thou hast heard say, Who can stand before the children of Anak!* (Deuteronomy 9:2). The spies had quailed at the very same — *and moreover we saw the children of Anak there* (Numbers 13:28); *there we saw the giants, the sons of Anak... and we were in our own sight as grasshoppers* (Numbers 13:33). The answer is not Israel''s strength but Yahuah''s presence: *Yahuah Elohayka (the LORD thy God) is he which goeth over before thee; as a consuming fire he shall destroy them* (Deuteronomy 9:3). That fire is His covenant jealousy — *For Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* (Deuteronomy 4:24) — and the same fire still stands: *For our Elohim (God) is a consuming fire* (Hebrews 12:29).',
       sv.verse_id, ev.verse_id, 'free', 24700
  FROM _s310_deu09_lookup sv, _s310_deu09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=9 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-9-not-for-thy-righteousness-but-the-oath',
       E'Not for thy righteousness, but for the oath to the fathers',
       E'Here the flesh credential is cut out at the root. *Speak not thou in thine heart... For my righteousness Yahuah (LORD) hath brought me in to possess this land: but for the wickedness of these nations Yahuah (LORD) doth drive them out* (Deuteronomy 9:4); *Not for thy righteousness, or for the uprightness of thine heart... but for the wickedness of these nations... and that he may perform the word which Yahuah (LORD) sware unto thy fathers, Abraham, Isaac, and Jacob* (Deuteronomy 9:5). The inheritance rests on the OATH and the nations'' wickedness, never on Israel''s deserving — *Yahuah Elohayka (the LORD thy God) giveth thee not this good land to possess it for thy righteousness; for thou art a stiffnecked people* (Deuteronomy 9:6). This is the same election Deuteronomy already taught — *Yahuah (LORD) did not set his love upon you... because ye were more in number... for ye were the fewest of all people* (Deuteronomy 7:7), *but because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* (Deuteronomy 7:8) — and the prophet of the new heart says it plainly: *I do not this for your sakes... but for mine holy name''s sake* (Ezekiel 36:22). Paul carries it forward unbroken: *Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration* (Titus 3:5); *if by grace, then is it no more of works* (Romans 11:6); *Not of works, lest any man should boast* (Ephesians 2:9). The boast of the flesh is excluded — yet the very next breath of the covenant is Torah kept and the heart renewed UNTO walking in His statutes. Self-merit is abolished; the Torah is not.',
       sv.verse_id, ev.verse_id, 'free', 24703
  FROM _s310_deu09_lookup sv, _s310_deu09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-9-thou-art-a-stiffnecked-people',
       E'Thou art a stiffnecked people',
       E'Twice in this chapter the verdict falls: *for thou art a stiffnecked people* (Deuteronomy 9:6), and Yahuah''s own word rehearsed — *I have seen this people, and, behold, it is a stiffnecked people* (Deuteronomy 9:13). It is the calf-day diagnosis carried over from Sinai: *And Yahuah (LORD) said unto Moses, I have seen this people, and, behold, it is a stiffnecked people* (Exodus 32:9); the same hardness that nearly cost them His presence — *for thou art a stiffnecked people: lest I consume thee in the way* (Exodus 33:3). Stephen lays the identical indictment on a later generation: *Ye stiffnecked and uncircumcised in heart and ears, ye do always resist the Ruach HaKodesh (Holy Spirit): as your fathers did, so do ye* (Acts 7:51) — the standing hardness that resists the Spirit who gave the Torah, and that only the new heart can answer.',
       sv.verse_id, ev.verse_id, 'free', 24706
  FROM _s310_deu09_lookup sv, _s310_deu09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=9 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-9-the-golden-calf-and-the-broken-tables',
       E'The golden calf and the broken tables',
       E'Moses rehearses the great apostasy to keep the people from the boast of merit: *ye had sinned against Yahuah Elohaychem (the LORD your God), and had made you a molten calf: ye had turned aside quickly out of the way which Yahuah (LORD) had commanded you* (Deuteronomy 9:16); *And I took the two tables, and cast them out of my two hands, and brake them before your eyes* (Deuteronomy 9:17). This is the Sinai account retold — *And Yahuah (LORD) said unto Moses, I have seen this people, and, behold, it is a stiffnecked people* (Exodus 32:9) — and Moses'' grief and intercession then: *Oh, this people have sinned a great sin, and have made them gods of gold* (Exodus 32:31), staking himself for them — *if not, blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32). His forty-day fast answers it: *I fell down before Yahuah (LORD), as at the first, forty days and forty nights... because of all your sins which ye sinned* (Deuteronomy 9:18). The broken tables are not the end of the covenant but the measure of the sin the mediator carries — and the calf is ground to dust (9:21).',
       sv.verse_id, ev.verse_id, 'free', 24709
  FROM _s310_deu09_lookup sv, _s310_deu09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=9 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-9-moses-fell-down-forty-days-in-the-breach',
       E'Moses fell down forty days, standing in the breach',
       E'The heart of the chapter is the mediator. *I fell down before Yahuah (LORD), as at the first, forty days and forty nights: I did neither eat bread, nor drink water, because of all your sins* (Deuteronomy 9:18); *I prayed therefore unto Yahuah (LORD), and said, O Yahuah (Lord) GOD, destroy not thy people and thine inheritance, which thou hast redeemed through thy greatness, which thou hast brought forth out of Egypt with a mighty hand* (Deuteronomy 9:26). The Psalm names the act: *Therefore he said that he would destroy them, had not Moses his chosen stood before him in the breach, to turn away his wrath* (Psalm 106:23). It is the very Sinai prayer — *Yahuah (LORD), why doth thy wrath wax hot against thy people, which thou hast brought forth out of the land of Egypt with great power* (Exodus 32:11) — guarding Yahuah''s name among the nations: *Lest the land whence thou broughtest us out say, Because Yahuah (LORD) was not able to bring them into the land... he hath brought them out to slay them* (Deuteronomy 9:28), as in *Wherefore should the Egyptians speak, and say, For mischief did he bring them out... Turn from thy fierce wrath* (Exodus 32:12). This is the Prophet-like-Moses pattern of the Formed Son: the one Mediator — *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5) — who *ever liveth to make intercession for them* (Hebrews 7:25); and Paul takes up the same self-spending love — *I could wish that myself were accursed from Messiah (Christ) for my brethren, my kinsmen according to the flesh* (Romans 9:3).',
       sv.verse_id, ev.verse_id, 'free', 24712
  FROM _s310_deu09_lookup sv, _s310_deu09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=9 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-9-remember-thy-servants-plead-the-oath',
       E'Remember thy servants — Moses pleads the oath',
       E'Moses'' decisive argument is the oath to the fathers, not the people''s worth: *Remember thy servants, Abraham, Isaac, and Jacob; look not unto the stubbornness of this people, nor to their wickedness, nor to their sin* (Deuteronomy 9:27); *Yet they are thy people and thine inheritance, which thou broughtest out by thy mighty power and by thy stretched out arm* (Deuteronomy 9:29). It is the same plea that prevailed at Sinai: *Remember Abraham, Isaac, and Yashar''el (Israel), thy servants, to whom thou swarest by thine own self... I will multiply your seed as the stars of heaven, and all this land that I have spoken of will I give unto your seed, and they shall inherit it for ever* (Exodus 32:13) — the seed-promise, paternal line and covenant-word together. And it works: *And Yahuah (LORD) repented of the evil which he thought to do unto his people* (Exodus 32:14). The inheritance survives because Yahuah keeps His sworn word — the very oath that, not Israel''s righteousness, brought them in.',
       sv.verse_id, ev.verse_id, 'free', 24715
  FROM _s310_deu09_lookup sv, _s310_deu09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=9 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================

-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* (Deuteronomy 4:24) — the same fire that goeth over before His people.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-yahuah-goeth-over-as-a-consuming-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*moreover we saw the children of Anak there* (Numbers 13:28) — the report Moses now answers.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-yahuah-goeth-over-as-a-consuming-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*there we saw the giants, the sons of Anak... we were in our own sight as grasshoppers* (Numbers 13:33) — the unbelief the consuming fire answers.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-yahuah-goeth-over-as-a-consuming-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29) — the same fire still standing in the new covenant.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-yahuah-goeth-over-as-a-consuming-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*ye were the fewest of all people* (Deuteronomy 7:7) — election on love, not merit or number.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-not-for-thy-righteousness-but-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*because he would keep the oath which he had sworn unto your fathers* (Deuteronomy 7:8) — the oath, not the deserving, brings them in.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-not-for-thy-righteousness-but-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I do not this for your sakes... but for mine holy name''s sake* (Ezekiel 36:22) — the prophet of the new heart says it exactly.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-not-for-thy-righteousness-but-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Not by works of righteousness which we have done, but according to his mercy he saved us* (Titus 3:5) — flesh-merit excluded, the renewed walk the covenant.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-not-for-thy-righteousness-but-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*if by grace, then is it no more of works* (Romans 11:6) — the gift is not a wage of one''s own righteousness.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-not-for-thy-righteousness-but-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Not of works, lest any man should boast* (Ephesians 2:9) — Moses had already shut the boast (Deuteronomy 9:6).'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-not-for-thy-righteousness-but-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I have seen this people, and, behold, it is a stiffnecked people* (Exodus 32:9) — the calf-day verdict made the standing description.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-thou-art-a-stiffnecked-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*for thou art a stiffnecked people: lest I consume thee in the way* (Exodus 33:3) — the refrain that nearly cost them His presence.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-thou-art-a-stiffnecked-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Ye stiffnecked... ye do always resist the Ruach HaKodesh (Holy Spirit): as your fathers did, so do ye* (Acts 7:51) — Stephen lays the same indictment forward.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-thou-art-a-stiffnecked-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I have seen this people, and, behold, it is a stiffnecked people* (Exodus 32:9) — the calf-day word behind the molten calf rehearsed.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-the-golden-calf-and-the-broken-tables'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*this people have sinned a great sin, and have made them gods of gold* (Exodus 32:31) — Moses owns the great sin in intercession.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=18
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-the-golden-calf-and-the-broken-tables'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*if not, blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32) — the mediator staking himself for the people.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=19
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-the-golden-calf-and-the-broken-tables'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Moses his chosen stood before him in the breach, to turn away his wrath* (Psalm 106:23) — the Psalm names what 9:18 narrates.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=18
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-moses-fell-down-forty-days-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD), why doth thy wrath wax hot against thy people... brought forth out of the land of Egypt* (Exodus 32:11) — the same redeemed-from-Egypt plea.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=26
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-moses-fell-down-forty-days-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Wherefore should the Egyptians speak... For mischief did he bring them out... Turn from thy fierce wrath* (Exodus 32:12) — guarding Yahuah''s honour among the nations.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=28
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-moses-fell-down-forty-days-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he ever liveth to make intercession for them* (Hebrews 7:25) — the Prophet-like-Moses, the Formed Son, in unbroken intercession.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=18
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-moses-fell-down-forty-days-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I could wish that myself were accursed from Messiah (Christ) for my brethren* (Romans 9:3) — Paul takes up the Moses self-spending love.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=18
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-moses-fell-down-forty-days-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5) — Moses between wrath and people foreshadows the one Mediator.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=26
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-moses-fell-down-forty-days-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Remember Abraham, Isaac, and Yashar''el (Israel), thy servants, to whom thou swarest by thine own self... I will multiply your seed as the stars of heaven* (Exodus 32:13) — the identical oath-plea that prevailed at Sinai.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=27
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-remember-thy-servants-plead-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Yahuah (LORD) repented of the evil which he thought to do unto his people* (Exodus 32:14) — the oath-pleading prevails; the inheritance is spared.'
  FROM cross_reference_threads t
  JOIN _s310_deu09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=9 AND sv.verse_number=29
  JOIN _s310_deu09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-9-remember-thy-servants-plead-the-oath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_deuteronomy_10.sql (Deuteronomy 10) -----
--
-- Book: Deuteronomy | Chapter: 10 | Tag: deu10 | Session prefix: s310
-- Sort band base 24725, step 3 -> 24725, 24728, 24731, 24734, 24737, 24740
-- Temp view: _s310_deu10_lookup
--
-- KEYSTONE chapter: "circumcise the heart" + "what doth Yahuah require." Moses re-hews the
-- second tables and lays them in the ark, distills the whole Torah to fear+walk+love+serve+KEEP
-- "for thy good," commands heart-circumcision, names Yahuah Elohim of gods / no respecter of
-- persons who loves the stranger, and closes on the threescore-and-ten become as the stars.
--
-- Deuteronomy 10 coverage:
--   v.1-5  (second tables hewn, the ark, "as Yahuah commanded me")
--          NT:     Hebrews 9:4 (ark + tables of the covenant) -- THREADED
--          Extras: none warranted (tabernacle material covered elsewhere)
--          Tanakh: Exodus 34:1-4 (hew thee two tables like the first), Exodus 25:16 (put into
--                  the ark the testimony) -- THREADED
--   v.6-11 (Aaron dies, Levi separated, 40 days, arise and possess) -- supportive narrative;
--          Levi-as-inheritance noted in prose; no standalone thread warranted this chapter.
--   v.12-13 (what doth Yahuah require: fear/walk/love/serve/KEEP, for thy good)
--          NT:     Matthew 22:37-40 (love Yahuah with all thy heart... all the law hangs) -- THREADED
--          Extras: none warranted (Micah/Eccl carry the canon weight)
--          Tanakh: Micah 6:8 (what doth Yahuah require: do justly, love mercy, walk humbly),
--                  Ecclesiastes 12:13 (fear Elohim and keep his commandments: the whole duty) -- THREADED
--   v.14-15 (heaven of heavens His; chose their seed) -- election/seed noted in prose under v.21-22.
--   v.16  (circumcise the foreskin of your heart, be no more stiffnecked)  ***KEYSTONE***
--          NT:     Romans 2:28-29 (circumcision of the heart, in the spirit), Colossians 2:11
--                  (circumcision made without hands) -- THREADED
--          Extras: none warranted
--          Tanakh: Deuteronomy 30:6 (Yahuah will circumcise thine heart to love him), Jeremiah
--                  4:4 (circumcise yourselves, take away the foreskins of your heart), Jeremiah
--                  9:25-26 (all the house of Israel uncircumcised in the heart), Ezekiel 44:7,9
--                  (no uncircumcised-in-heart in the sanctuary) -- THREADED
--   v.17  (Elohim of gods, Lord of lords, regardeth not persons, taketh not reward)
--          NT:     Revelation 17:14 + 19:16 (Lord of lords, King of kings), 1 Timothy 6:15
--                  (King of kings, Lord of lords), Acts 10:34 (no respecter of persons),
--                  Romans 2:11 (no respect of persons with Elohim) -- THREADED
--          Extras: none warranted
--          Tanakh: (the canon-NT chain carries it)
--   v.18-19 (judge the fatherless and widow, love the stranger; ye were strangers in Egypt)
--          NT:     Ephesians 2:19 (no more strangers but fellowcitizens), James 1:27 (pure
--                  religion: the fatherless and widows) -- THREADED
--          Extras: none warranted
--          Tanakh: Leviticus 19:33-34 (love him as thyself), Exodus 22:21-22 (vex not a
--                  stranger / afflict not the widow), Deuteronomy 24:17-19 (judgment of the
--                  stranger / gleanings for the fatherless and widow) -- THREADED
--   v.20  (fear, serve, cleave, swear by his name) -- distilled-Torah echo; folded into v.12-13.
--   v.21-22 (He is thy praise; threescore and ten -> as the stars of heaven for multitude)
--          NT:     Acts 7:14 (threescore and fifteen souls), Hebrews 11:12 (so many as the
--                  stars of the sky) -- THREADED
--          Extras: none warranted
--          Tanakh: Genesis 15:5 (so shall thy seed be), Genesis 46:27 (threescore and ten) -- THREADED
--
-- Threads (6):
--   deuteronomy-10-1-5-the-second-tables-hewn-and-laid-in-the-ark      [free] Ex34, Ex25, Heb9
--   deuteronomy-10-12-13-what-doth-yahuah-require-fear-walk-love-serve-keep   [free] Micah6, Matt22, Eccl12
--   deuteronomy-10-16-circumcise-the-foreskin-of-your-heart            [free] Deut30, Jer4, Jer9, Ezek44, Rom2, Col2
--   deuteronomy-10-17-elohim-of-gods-and-lord-of-lords-no-respecter-of-persons  [free] Rev17, Rev19, 1Tim6, Acts10, Rom2
--   deuteronomy-10-18-19-love-ye-the-stranger-for-ye-were-strangers    [free] Lev19, Ex22, Deut24, Eph2, James1
--   deuteronomy-10-21-22-threescore-and-ten-made-as-the-stars-of-heaven   [free] Gen15, Gen46, Acts7, Heb11
--
-- Existing-slug check: only revelation-17-...-deuteronomy-10-daniel-2 exists in EXISTING_SLUGS.txt
-- (a Revelation-anchored thread); none of the deuteronomy-10-* slugs below collide.

CREATE TEMP VIEW _s310_deu10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================
-- B. cross_references
-- =====================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the second tables hewn and laid in the ark (v.1-5)
    ('canon','deuteronomy',10,1,'canon','exodus',34,1,'free',
     E'*And Yahuah (LORD) said unto Moses, Hew thee two tables of stone like unto the first: and I will write upon these tables the words that were in the first tables, which thou brakest.* (Exodus 34:1). Deuteronomy 10:1 retells that same command — *Hew thee two tables of stone like unto the first, and come up unto me into the mount* — Yahuah re-issues the broken covenant in full; the Ten Words are not revised, the SAME words are written again.'),
    ('canon','deuteronomy',10,3,'canon','exodus',34,4,'free',
     E'*And he hewed two tables of stone like unto the first; and Moses rose up early in the morning, and went up unto mount Sinai, as Yahuah (LORD) had commanded him, and took in his hand the two tables of stone.* (Exodus 34:4). Deuteronomy 10:3 — *And I made an ark of shittim wood, and hewed two tables of stone like unto the first, and went up into the mount, having the two tables in mine hand* — is Moses'' own first-person account of the very act narrated in Exodus.'),
    ('canon','deuteronomy',10,5,'canon','exodus',25,16,'free',
     E'*And thou shalt put into the ark the testimony which I shall give thee.* (Exodus 25:16). Deuteronomy 10:5 closes the scene — *and put the tables in the ark which I had made; and there they be, as Yahuah (LORD) commanded me* — the testimony lodged exactly where the pattern in the mount commanded; the covenant word housed at the heart of the sanctuary.'),
    ('canon','deuteronomy',10,5,'canon','hebrews',9,4,'free',
     E'*Which had the golden censer, and the ark of the covenant overlaid round about with gold, wherein was the golden pot that had manna, and Aaron''s rod that budded, and the tables of the covenant;* (Hebrews 9:4). Hebrews names the very contents Deuteronomy 10:5 lays in — *the tables in the ark which I had made; and there they be, as Yahuah (LORD) commanded me* — the tables of the covenant inside the ark, the abiding witness the NT still reckons with, never discarded.'),

    -- THREAD 2: what doth Yahuah require (v.12-13)
    ('canon','deuteronomy',10,12,'canon','micah',6,8,'free',
     E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Micah deliberately echoes the keystone question of Deuteronomy 10:12 — *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka... to walk in all his ways, and to love him, and to serve* — the prophet distills the Torah, he does not replace it; justice, mercy, and humble walking ARE the fear, love, and walking Moses named.'),
    ('canon','deuteronomy',10,12,'canon','matthew',22,37,'free',
     E'*Yahusha (Jesus) said unto him, Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind.* (Matthew 22:37). Yahusha names the first and great commandment straight out of Deuteronomy 10:12 — *to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul* — the heart-and-soul love of Yahuah is the hinge of the whole Torah, quoted by Messiah as still binding.'),
    ('canon','deuteronomy',10,12,'canon','matthew',22,40,'free',
     E'*On these two commandments hang all the law and the prophets.* (Matthew 22:40). Deuteronomy 10:12-13 already hung the whole requirement on love and obedience — *to love him... To keep the commandments of Yahuah (LORD), and his statutes* — Yahusha confirms the Torah is not a heap of disconnected rules but love-of-Yahuah and love-of-neighbour, the law and the prophets suspended from them, not abolished by them.'),
    ('canon','deuteronomy',10,13,'canon','ecclesiastes',12,13,'free',
     E'*Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* (Ecclesiastes 12:13). Qoheleth gathers the entire book into the same two-fold word Deuteronomy 10:13 commands — *To keep the commandments of Yahuah (LORD), and his statutes, which I command thee this day for thy good* — fear and keep; the requirement is not a burden but *for thy good*, the whole duty of man.'),

    -- THREAD 3: circumcise the foreskin of your heart (v.16)  ***KEYSTONE***
    ('canon','deuteronomy',10,16,'canon','deuteronomy',30,6,'free',
     E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6). The command of Deuteronomy 10:16 — *Circumcise therefore the foreskin of your heart* — becomes the covenant PROMISE in chapter 30: what Yahuah requires of the people, Yahuah Himself will work in them. The inward circumcision is the same Torah pressed into the heart, never a cancelling of it.'),
    ('canon','deuteronomy',10,16,'canon','jeremiah',4,4,'free',
     E'*Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart, ye men of Yahudah (Judah) and inhabitants of Jerusalem: lest my fury come forth like fire...* (Jeremiah 4:4). Jeremiah lifts Deuteronomy 10:16 word for word — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* — pressing the same heart-surgery on Judah; the inward circumcision was always the point of the outward sign, demanded by the prophets centuries on.'),
    ('canon','deuteronomy',10,16,'canon','jeremiah',9,26,'free',
     E'*Egypt, and Yahudah (Judah), and Edom... and all the house of Yashar''el (Israel) are uncircumcised in the heart.* (Jeremiah 9:26). Jeremiah''s verdict measures the people by Deuteronomy 10:16 — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* — flesh-circumcision without heart-circumcision leaves a man *uncircumcised in the heart*; the sign was never sufficient apart from the love and obedience it figured.'),
    ('canon','deuteronomy',10,16,'canon','ezekiel',44,9,'free',
     E'*Thus saith Adonai Yahuah (the Lord GOD); No stranger, uncircumcised in heart, nor uncircumcised in flesh, shall enter into my sanctuary, of any stranger that is among the children of Yashar''el (Israel).* (Ezekiel 44:9). Ezekiel''s sanctuary law holds BOTH circumcisions together — heart AND flesh — exactly as Deuteronomy 10:16 (*Circumcise therefore the foreskin of your heart*) joins them: the inward never voids the outward sign; both are demanded of those who would draw near.'),
    ('canon','deuteronomy',10,16,'canon','romans',2,29,'free',
     E'*But he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God).* (Romans 2:29). Paul is quoting Moses, not innovating: Deuteronomy 10:16 already located true circumcision in the heart — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* — *circumcision is that of the heart, in the spirit*, the Torah''s own inward demand carried forward.'),
    ('canon','deuteronomy',10,16,'canon','colossians',2,11,'free',
     E'*In whom also ye are circumcised with the circumcision made without hands, in putting off the body of the sins of the flesh by the circumcision of Messiah (Christ):* (Colossians 2:11). The *circumcision made without hands* is the very heart-circumcision Deuteronomy 10:16 commanded — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* — the stiff neck cut away, the heart turned to love and obey; fulfilment of the inward sign, not its abolition.'),

    -- THREAD 4: Elohim of gods and Lord of lords, no respecter of persons (v.17)
    ('canon','deuteronomy',10,17,'canon','revelation',17,14,'free',
     E'*These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings: and they that are with him are called, and chosen, and faithful.* (Revelation 17:14). The Lamb wears the title Deuteronomy 10:17 gives Yahuah — *For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords* — the Formed Son bearing the Father''s own Name and supremacy, *Lord of lords*, over every power that makes war.'),
    ('canon','deuteronomy',10,17,'canon','revelation',19,16,'free',
     E'*And he hath on his vesture and on his thigh a name written, KING OF KINGS, AND LORD OF LORDS.* (Revelation 19:16). The rider''s emblazoned name is the confession of Deuteronomy 10:17 — *a great Elohim (God), a mighty, and a terrible* who is *Lord of lords* — the Most High''s supremacy worn openly by the One who came forth from Him, *KING OF KINGS, AND LORD OF LORDS*.'),
    ('canon','deuteronomy',10,17,'canon','1-timothy',6,15,'free',
     E'*Which in his times he shall shew, who is the blessed and only Potentate, the King of kings, and Lord of lords;* (1 Timothy 6:15). Paul renders Deuteronomy 10:17 into doxology — *Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty* — the *blessed and only Potentate*, no rival deity beside Him, *King of kings, and Lord of lords*.'),
    ('canon','deuteronomy',10,17,'canon','acts',10,34,'free',
     E'*Then Peter opened his mouth, and said, Of a truth I perceive that Elohim (God) is no respecter of persons:* (Acts 10:34). Peter is restating Deuteronomy 10:17 — Yahuah *which regardeth not persons, nor taketh reward* — the impartiality of the Most High; the stranger drawn near is the working-out of the same justice, *no respecter of persons*.'),
    ('canon','deuteronomy',10,17,'canon','romans',2,11,'free',
     E'*For there is no respect of persons with Elohim (God).* (Romans 2:11). Paul anchors the judgment of Jew and Greek alike on the very attribute of Deuteronomy 10:17 — Yahuah *which regardeth not persons, nor taketh reward* — *no respect of persons with Elohim*, the impartial Judge who cannot be bribed.'),

    -- THREAD 5: love ye the stranger, for ye were strangers (v.18-19)
    ('canon','deuteronomy',10,19,'canon','leviticus',19,34,'free',
     E'*But the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself; for ye were strangers in the land of Egypt: I am Yahuah Elohaychem (the LORD your God).* (Leviticus 19:34). Deuteronomy 10:19 gives the identical command and ground — *Love ye therefore the stranger: for ye were strangers in the land of Egypt* — the sojourner loved *as one born among you*, grafted into the covenant people, one law for the home-born and the stranger.'),
    ('canon','deuteronomy',10,19,'canon','exodus',22,21,'free',
     E'*Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt.* (Exodus 22:21). The same memory of Egypt that grounds Deuteronomy 10:19 — *Love ye therefore the stranger: for ye were strangers in the land of Egypt* — forbids vexing him; love of the sojourner is the positive form of *neither vex... nor oppress him*.'),
    ('canon','deuteronomy',10,18,'canon','exodus',22,22,'free',
     E'*Ye shall not afflict any widow, or fatherless child.* (Exodus 22:22). Deuteronomy 10:18 names Yahuah as the very Defender that law presumes — *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment* — the people''s obligation flows from Yahuah''s own character toward *the fatherless and widow*.'),
    ('canon','deuteronomy',10,18,'canon','deuteronomy',24,17,'free',
     E'*Thou shalt not pervert the judgment of the stranger, nor of the fatherless; nor take a widow''s raiment to pledge:* (Deuteronomy 24:17). The triad of Deuteronomy 10:18 — *the fatherless and widow, and... the stranger* — becomes binding case-law in chapter 24, with the gleanings reserved for them (24:19); the love commanded is enacted in specific, costly statute.'),
    ('canon','deuteronomy',10,19,'canon','ephesians',2,19,'free',
     E'*Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God);* (Ephesians 2:19). The stranger loved and provided for in Deuteronomy 10:19 — *Love ye therefore the stranger... ye were strangers in the land of Egypt* — is brought near as *fellowcitizens*: the sojourner grafted into the commonwealth of Yashar''el (Israel), not a separate people, the one covenant household enlarged.'),
    ('canon','deuteronomy',10,18,'canon','james',1,27,'free',
     E'*Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* (James 1:27). James names as *pure religion* the very care Deuteronomy 10:18 says Yahuah Himself performs — *He doth execute the judgment of the fatherless and widow* — true worship mirrors the Most High''s own justice toward the *fatherless and widows*.'),

    -- THREAD 6: threescore and ten made as the stars of heaven (v.21-22)
    ('canon','deuteronomy',10,22,'canon','genesis',15,5,'free',
     E'*And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* (Genesis 15:5). Deuteronomy 10:22 reports the promise come true — *Thy fathers went down into Egypt with threescore and ten persons; and now Yahuah Elohayka (the LORD thy God) hath made thee as the stars of heaven for multitude* — the word sworn to Abram, *So shall thy seed be*, now standing fulfilled in the redeemed nation.'),
    ('canon','deuteronomy',10,22,'canon','genesis',46,27,'free',
     E'*And the sons of Joseph, which were born him in Egypt, were two souls: all the souls of the house of Jacob, which came into Egypt, were threescore and ten.* (Genesis 46:27). Deuteronomy 10:22 counts the same seventy — *Thy fathers went down into Egypt with threescore and ten persons* — the precise *threescore and ten* that descended, the small remnant Yahuah multiplied into a host like the stars.'),
    ('canon','deuteronomy',10,22,'canon','acts',7,14,'free',
     E'*Then sent Joseph, and called his father Jacob to him, and all his kindred, threescore and fifteen souls.* (Acts 7:14). Stephen rehearses the descent into Egypt that Deuteronomy 10:22 marks — *Thy fathers went down into Egypt with threescore and ten persons* — the household carried down before the multiplying; the canon keeps returning to that founding remnant.'),
    ('canon','deuteronomy',10,22,'canon','hebrews',11,12,'free',
     E'*Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable.* (Hebrews 11:12). Hebrews reads the multiplying exactly as Deuteronomy 10:22 frames it — *now Yahuah Elohayka (the LORD thy God) hath made thee as the stars of heaven for multitude* — *of one, and him as good as dead*, the seventy become *as the stars of the sky*, the Abrahamic word made flesh in a nation.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s310_deu10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s310_deu10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- C. threads
-- =====================================================================

-- THREAD 1 (v.1-5) ---------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-10-1-5-the-second-tables-hewn-and-laid-in-the-ark',
       E'The second tables hewn and laid in the ark',
       E'Moses retells the renewal of the covenant: *Hew thee two tables of stone like unto the first... And I will write on the tables the words that were in the first tables which thou brakest* (Deuteronomy 10:1-2). This is the same act Exodus narrates — *Hew thee two tables of stone like unto the first: and I will write upon these tables the words that were in the first tables, which thou brakest* (Exodus 34:1). The SAME Ten Words are written again; the broken covenant is not revised, it is restored. Moses then houses them where the pattern commanded: *thou shalt put into the ark the testimony which I shall give thee* (Exodus 25:16), and reports it done — *put the tables in the ark which I had made; and there they be, as Yahuah (LORD) commanded me* (Deuteronomy 10:5). The New Testament still reckons with that ark and its contents: *the ark of the covenant overlaid round about with gold... and the tables of the covenant* (Hebrews 9:4). The covenant word is lodged at the heart of the sanctuary, abiding, never discarded.',
       sv.verse_id, ev.verse_id, 'free', 24725
  FROM _s310_deu10_lookup sv, _s310_deu10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=10 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (v.12-13) -------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-10-12-13-what-doth-yahuah-require-fear-walk-love-serve-keep',
       E'What doth Yahuah require: fear, walk, love, serve, keep',
       E'The whole Torah distilled to its heart: *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka... to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul, To keep the commandments of Yahuah (LORD), and his statutes, which I command thee this day for thy good?* (Deuteronomy 10:12-13). The requirement is fear + walk + love + serve + KEEP — and it is *for thy good*, never a burden. Micah deliberately echoes the question: *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Yahusha (Jesus) lifts the love-command as the hinge of all: *Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind* (Matthew 22:37), and seals it: *On these two commandments hang all the law and the prophets* (Matthew 22:40). Qoheleth gathers everything to the same word: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). Fear and keep — the prophets distill the Torah, the Messiah confirms it, the wise man concludes with it; never abolished.',
       sv.verse_id, ev.verse_id, 'free', 24728
  FROM _s310_deu10_lookup sv, _s310_deu10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (v.16) ----------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-10-16-circumcise-the-foreskin-of-your-heart',
       E'Circumcise the foreskin of your heart',
       E'The keystone command of the inward Torah: *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). What the people are commanded, Yahuah Himself promises to work: *And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deuteronomy 30:6). The prophets press the same surgery: *Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart, ye men of Yahudah (Judah)* (Jeremiah 4:4); and they measure the people by it — *all the house of Yashar''el (Israel) are uncircumcised in the heart* (Jeremiah 9:26). Ezekiel holds both circumcisions together, heart AND flesh: *No stranger, uncircumcised in heart, nor uncircumcised in flesh, shall enter into my sanctuary* (Ezekiel 44:9). The New Testament does not invent heart-circumcision — it quotes Moses: *circumcision is that of the heart, in the spirit, and not in the letter* (Romans 2:29), and *ye are circumcised with the circumcision made without hands, in putting off the body of the sins of the flesh by the circumcision of Messiah (Christ)* (Colossians 2:11). The inward circumcision FULFILS the sign; it never cancels it. The stiff neck cut away, the heart turned to love and obey.',
       sv.verse_id, ev.verse_id, 'free', 24731
  FROM _s310_deu10_lookup sv, _s310_deu10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=10 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (v.17) ----------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-10-17-elohim-of-gods-and-lord-of-lords-no-respecter-of-persons',
       E'Elohim of gods and Lord of lords, no respecter of persons',
       E'The confession of the Most High''s supremacy and impartiality: *For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward* (Deuteronomy 10:17). The Formed Son bears the Father''s own title: *the Lamb shall overcome them: for he is Lord of lords, and King of kings* (Revelation 17:14), and the rider has *a name written, KING OF KINGS, AND LORD OF LORDS* (Revelation 19:16); Paul names Him *the blessed and only Potentate, the King of kings, and Lord of lords* (1 Timothy 6:15) — no rival deity beside Him. And the impartiality Moses confesses is preached forward: *Of a truth I perceive that Elohim (God) is no respecter of persons* (Acts 10:34), *For there is no respect of persons with Elohim (God)* (Romans 2:11). The God who *taketh not reward* cannot be bribed; the same justice that exalts Him over every power bends down to the fatherless, the widow, and the stranger in the very next breath.',
       sv.verse_id, ev.verse_id, 'free', 24734
  FROM _s310_deu10_lookup sv, _s310_deu10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=10 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (v.18-19) -------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-10-18-19-love-ye-the-stranger-for-ye-were-strangers',
       E'Love ye the stranger, for ye were strangers in Egypt',
       E'Yahuah''s own justice becomes the people''s law: *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment. Love ye therefore the stranger: for ye were strangers in the land of Egypt* (Deuteronomy 10:18-19). This is one-law inclusion: the sojourner loved *as one born among you... for ye were strangers in the land of Egypt* (Leviticus 19:34), never to be vexed — *Thou shalt neither vex a stranger, nor oppress him* (Exodus 22:21) — and the widow and fatherless protected: *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22), their judgment never perverted, the gleanings reserved for them (Deuteronomy 24:17-19). The stranger is grafted INTO the covenant people, not handed a separate gospel: *ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God)* (Ephesians 2:19). And true worship mirrors Yahuah''s own care: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction* (James 1:27). The redeemed remember the iron furnace and love accordingly.',
       sv.verse_id, ev.verse_id, 'free', 24737
  FROM _s310_deu10_lookup sv, _s310_deu10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=10 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (v.21-22) -------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'deuteronomy-10-21-22-threescore-and-ten-made-as-the-stars-of-heaven',
       E'Threescore and ten made as the stars of heaven',
       E'The remnant multiplied to fulfil the oath: *He is thy praise, and he is thy Elohim (God)... Thy fathers went down into Egypt with threescore and ten persons; and now Yahuah Elohayka (the LORD thy God) hath made thee as the stars of heaven for multitude* (Deuteronomy 10:21-22). This is the Abrahamic promise come true: *Look now toward heaven, and tell the stars, if thou be able to number them... So shall thy seed be* (Genesis 15:5). The precise seventy who descended is named — *all the souls of the house of Jacob, which came into Egypt, were threescore and ten* (Genesis 46:27) — and the canon keeps returning to that founding household: *Joseph... called his father Jacob to him, and all his kindred, threescore and fifteen souls* (Acts 7:14). Hebrews reads the multiplying exactly as Moses frames it: *Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). From a dead-as-good-as man and seventy souls, a nation like the stars — the word of Yahuah made flesh in a people.',
       sv.verse_id, ev.verse_id, 'free', 24740
  FROM _s310_deu10_lookup sv, _s310_deu10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='deuteronomy' AND ev.chapter_number=10 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- D. thread_members
-- =====================================================================

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Hew thee two tables of stone like unto the first: and I will write upon these tables the words that were in the first tables, which thou brakest.* (Exodus 34:1) — the same renewal command; the SAME Ten Words written again, not revised.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-1-5-the-second-tables-hewn-and-laid-in-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And he hewed two tables of stone like unto the first... and took in his hand the two tables of stone.* (Exodus 34:4) — the act Deuteronomy 10:3 recounts in the first person.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-1-5-the-second-tables-hewn-and-laid-in-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And thou shalt put into the ark the testimony which I shall give thee.* (Exodus 25:16) — the pattern that Deuteronomy 10:5 obeys: the tables lodged in the ark.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=5
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-1-5-the-second-tables-hewn-and-laid-in-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the ark of the covenant overlaid round about with gold... and the tables of the covenant;* (Hebrews 9:4) — the NT names the very contents of Deuteronomy 10:5, the abiding witness.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=5
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-1-5-the-second-tables-hewn-and-laid-in-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8) — the prophet deliberately echoes Deuteronomy 10:12 and distills, never replaces, the Torah.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-12-13-what-doth-yahuah-require-fear-walk-love-serve-keep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind.* (Matthew 22:37) — Yahusha names the first commandment out of Deuteronomy 10:12.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-12-13-what-doth-yahuah-require-fear-walk-love-serve-keep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*On these two commandments hang all the law and the prophets.* (Matthew 22:40) — the Torah suspended from love of Yahuah and neighbour, confirmed as binding, not abolished.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-12-13-what-doth-yahuah-require-fear-walk-love-serve-keep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* (Ecclesiastes 12:13) — the same fear-and-keep that Deuteronomy 10:13 commands *for thy good*.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-12-13-what-doth-yahuah-require-fear-walk-love-serve-keep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart... to love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deuteronomy 30:6) — the command of 10:16 becomes the covenant promise: what He requires, He works.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-16-circumcise-the-foreskin-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart, ye men of Yahudah (Judah)* (Jeremiah 4:4) — Jeremiah lifts Deuteronomy 10:16 word for word, pressing it on Judah.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-16-circumcise-the-foreskin-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*all the house of Yashar''el (Israel) are uncircumcised in the heart.* (Jeremiah 9:26) — flesh-circumcision without heart-circumcision is no circumcision at all, by the measure of Deuteronomy 10:16.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-16-circumcise-the-foreskin-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*No stranger, uncircumcised in heart, nor uncircumcised in flesh, shall enter into my sanctuary* (Ezekiel 44:9) — both circumcisions held together, as Deuteronomy 10:16 joins heart and covenant sign.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=44 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-16-circumcise-the-foreskin-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*circumcision is that of the heart, in the spirit, and not in the letter* (Romans 2:29) — Paul quotes Moses; heart-circumcision was always the Torah''s inward demand.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-16-circumcise-the-foreskin-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*ye are circumcised with the circumcision made without hands... by the circumcision of Messiah (Christ)* (Colossians 2:11) — the stiff neck cut away; fulfilment of the inward sign of Deuteronomy 10:16, not its abolition.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=16
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-16-circumcise-the-foreskin-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the Lamb shall overcome them: for he is Lord of lords, and King of kings* (Revelation 17:14) — the Formed Son bears the Father''s title of Deuteronomy 10:17.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=17
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-17-elohim-of-gods-and-lord-of-lords-no-respecter-of-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a name written, KING OF KINGS, AND LORD OF LORDS.* (Revelation 19:16) — the supremacy of Deuteronomy 10:17 worn openly by the rider.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=17
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-17-elohim-of-gods-and-lord-of-lords-no-respecter-of-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the blessed and only Potentate, the King of kings, and Lord of lords;* (1 Timothy 6:15) — no rival deity beside Him, as Deuteronomy 10:17 confesses.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=17
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-17-elohim-of-gods-and-lord-of-lords-no-respecter-of-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Of a truth I perceive that Elohim (God) is no respecter of persons* (Acts 10:34) — Peter restates the impartiality of Deuteronomy 10:17.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=17
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-17-elohim-of-gods-and-lord-of-lords-no-respecter-of-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For there is no respect of persons with Elohim (God).* (Romans 2:11) — the impartial Judge of Deuteronomy 10:17 who *taketh not reward*.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=17
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-17-elohim-of-gods-and-lord-of-lords-no-respecter-of-persons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself; for ye were strangers in the land of Egypt* (Leviticus 19:34) — identical command and ground to Deuteronomy 10:19; one-law inclusion.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=19
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-18-19-love-ye-the-stranger-for-ye-were-strangers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt.* (Exodus 22:21) — the negative form of the love commanded in Deuteronomy 10:19.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=19
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-18-19-love-ye-the-stranger-for-ye-were-strangers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Ye shall not afflict any widow, or fatherless child.* (Exodus 22:22) — the people''s duty flows from Yahuah''s own care for the fatherless and widow in Deuteronomy 10:18.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=18
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-18-19-love-ye-the-stranger-for-ye-were-strangers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt not pervert the judgment of the stranger, nor of the fatherless; nor take a widow''s raiment to pledge:* (Deuteronomy 24:17) — the triad of 10:18 made binding case-law, gleanings reserved (24:19).'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=18
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-18-19-love-ye-the-stranger-for-ye-were-strangers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*ye are no more strangers and foreigners, but fellowcitizens with the saints* (Ephesians 2:19) — the stranger of Deuteronomy 10:19 grafted into the commonwealth of Yashar''el, not a separate people.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=19
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-18-19-love-ye-the-stranger-for-ye-were-strangers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Pure religion and undefiled... is this, To visit the fatherless and widows in their affliction* (James 1:27) — true worship mirrors the care Deuteronomy 10:18 says Yahuah Himself performs.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=18
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-18-19-love-ye-the-stranger-for-ye-were-strangers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*tell the stars, if thou be able to number them... So shall thy seed be.* (Genesis 15:5) — the promise to Abram that Deuteronomy 10:22 reports fulfilled.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=22
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-21-22-threescore-and-ten-made-as-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all the souls of the house of Jacob, which came into Egypt, were threescore and ten.* (Genesis 46:27) — the precise seventy Deuteronomy 10:22 counts.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=22
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-21-22-threescore-and-ten-made-as-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Joseph... called his father Jacob to him, and all his kindred, threescore and fifteen souls.* (Acts 7:14) — Stephen rehearses the founding household of Deuteronomy 10:22.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=22
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-21-22-threescore-and-ten-made-as-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*of one, and him as good as dead, so many as the stars of the sky in multitude* (Hebrews 11:12) — Hebrews reads the multiplying exactly as Deuteronomy 10:22 frames it.'
  FROM cross_reference_threads t
  JOIN _s310_deu10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='deuteronomy' AND sv.chapter_number=10 AND sv.verse_number=22
  JOIN _s310_deu10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='deuteronomy-10-21-22-threescore-and-ten-made-as-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session310 — Deuteronomy cross-references complete.'
