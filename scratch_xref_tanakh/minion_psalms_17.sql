-- ----- fragment: minion_psalms_17.sql (Psalm 17) -----
-- Chapter: Psalm 17 — "A Prayer of David." THE PLEA OF THE TESTED-AND-FOUND-TRUE: *Thou hast
-- proved mine heart; thou hast visited me in the night; thou hast tried me, and shalt find
-- nothing* (v.3) — the heart-trier (lateral to Ps 7:9, Ps 11:4-5). ★ *Keep me as the apple of
-- the eye, hide me under the shadow of thy wings* (v.8) — drawn straight from Deuteronomy 32:10
-- (*he kept him as the apple of his eye*) and the wings-of-refuge motif (Ps 36:7, 91:4, Ruth
-- 2:12; Matthew 23:37 the gathering hen, handled gently as the two-house ingathering refused).
-- The contrast: *men of the world, which have their portion in this life... they are full of
-- children, and leave the rest of their substance to their babes* (v.14) — the portion-in-this-
-- life vs. the eternal portion (lateral Ps 16:5, *Yahuah is the portion of mine inheritance*).
-- ★★ THE CLOSE: *As for me, I will behold thy face in righteousness: I shall be satisfied, when
-- I awake, with thy likeness* (v.15) — the awaking-satisfied-with-his-likeness = the
-- resurrection/beatific hope (1 John 3:2, Job 19:26-27, Revelation 22:4; the awaking twin of
-- Ps 3:5 / 16:9-11).
-- Tag: ps017   Temp view: _s302_ps017_lookup
-- Sort band: base 22400, step 3 -> threads at 22400, 22403, 22406, 22409 (4 threads)
-- Source of EVERY row: 'canon','psalms',17,v
--
-- Psalm 17 coverage:
--   v.1-2 (Hear the right, O Yahuah; attend unto my cry... that goeth not out of feigned lips;
--          let thine eyes behold the things that are equal)
--        NT/Extras/Tanakh: none warranted distinct — the prayer's opening invocation; the
--          framework-bearing weave rises at v.3 (the tried-heart) which v.1-2 sets up; gathered
--          into THREAD 1's prose, not a separate add.
--   ★ v.3 (Thou hast proved mine heart; thou hast visited me in the night; thou hast tried me,
--          and shalt find nothing; I am purposed that my mouth shall not transgress)
--        NT:     none warranted distinct — the heart-trying is fulfilled FORWARD in the
--          searcher-of-hearts but the load-bearing witnesses are the psalter's own (Ps 7, Ps 11);
--          carried in prose.
--        Extras: none warranted
--        Tanakh: ★ Psalm 7:9 (the righteous Elohim trieth the hearts and reins), ★ Psalm 11:4-5
--          (his eyes behold, his eyelids try, the children of men; Yahuah trieth the righteous)
--          — THREAD 1
--   v.4-7 (by the word of thy lips I have kept me from the paths of the destroyer... thou that
--          savest by thy right hand them which put their trust in thee)
--        NT/Extras/Tanakh: none warranted distinct — the trust-and-deliverance plea; gathered
--          into THREAD 1 (the proven heart kept by the word) and THREAD 2 (the refuge sought).
--   ★ v.8 (Keep me as the apple of the eye, hide me under the shadow of thy wings)
--        NT:     Matthew 23:37 (how often would I have gathered thy children together, even as a
--          hen gathereth her chickens under her wings) — THREAD 2 (the wings-of-gathering, the
--          two-house ingathering longed-for; handled gently)
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 32:10 (he kept him as the apple of his eye — the SOURCE phrase),
--          ★ Psalm 36:7 (the children of men put their trust under the shadow of thy wings),
--          ★ Psalm 91:4 (under his wings shalt thou trust), Ruth 2:12 (under whose wings thou
--          art come to trust) — THREAD 2
--   v.9-13 (from the wicked that oppress me... like as a lion that is greedy of his prey...
--          Arise, O Yahuah, disappoint him, cast him down)
--        NT/Extras/Tanakh: none warranted distinct — the enemy-portrait + the cry to arise; the
--          lion-imagery echoes Ps 7:2 (gathered in THREAD 1's family of trial-psalms) but is the
--          psalm's own complaint; carried in prose.
--   ★ v.14 (from men of the world, which have their portion in this life, and whose belly thou
--          fillest with thy hid treasure: they are full of children, and leave the rest of their
--          substance to their babes)
--        NT:     none warranted distinct — the this-life-portion vs. eternal-portion contrast is
--          fulfilled FORWARD (the rich who have their consolation now), but the load-bearing
--          witness is the psalter's own portion-language (Ps 16:5); carried in prose.
--        Extras: none warranted
--        Tanakh: ★ Psalm 16:5 (Yahuah is the portion of mine inheritance and of my cup) —
--          THREAD 3
--   ★★ v.15 (As for me, I will behold thy face in righteousness: I shall be satisfied, when I
--          awake, with thy likeness)
--        NT:     ★★ 1 John 3:2 (when he shall appear, we shall be like him; for we shall see him
--          as he is), ★ Revelation 22:4 (they shall see his face; and his name shall be in their
--          foreheads) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Job 19:26-27 (in my flesh shall I see Elohim, whom I shall see for myself),
--          ★ Psalm 16:9-11 (my flesh also shall rest in hope... thou wilt shew me the path of
--          life), Psalm 3:5 (I laid me down and slept; I awaked; for Yahuah sustained me) —
--          THREAD 4
--
-- Threads (slug — target libraries):
--   1. psalm-17-thou-hast-proved-mine-heart-the-heart-trier — Tanakh (Psalm 7, Psalm 11) [free]
--      (the tried-and-found-true heart; Yahuah trieth the hearts and reins)
--   2. psalm-17-keep-me-as-the-apple-of-the-eye-under-the-shadow-of-thy-wings — Tanakh
--      (Deuteronomy 32, Psalm 36, Psalm 91, Ruth 2) + NT (Matthew 23) [free] (★★ the apple-of-the-
--      eye drawn straight from Deut 32:10; the wings-of-refuge motif; the gathering hen, two-house)
--   3. psalm-17-their-portion-in-this-life-versus-the-eternal-portion — Tanakh (Psalm 16) [free]
--      (the men of the world filled now vs. Yahuah Himself as the portion of the inheritance)
--   4. psalm-17-i-shall-be-satisfied-when-i-awake-with-thy-likeness — NT (1 John 3, Revelation 22)
--      + Tanakh (Job 19, Psalm 16, Psalm 3) [free] (★★ the awaking-satisfied-with-his-likeness =
--      the resurrection/beatific hope; we shall be like him, for we shall see him as he is)
--
-- Framing notes:
--   ★ THE HEART-TRIER (THREAD 1): *Thou hast proved mine heart; thou hast visited me in the night;
--      thou hast tried me, and shalt find nothing; I am purposed that my mouth shall not transgress*
--      (17:3). David's plea is the plea of the tested-and-found-true — *Hear the right* (17:1), the
--      prayer *that goeth not out of feigned lips*. The psalter sings the same Yahuah who searches:
--      *the righteous Elohim (God) trieth the hearts and reins* (7:9); *his eyes behold, his
--      eyelids try, the children of men. Yahuah (LORD) trieth the righteous* (11:4-5). The heart
--      proved in the night, tried and found with nothing, is the heart the Heart-Trier Himself
--      examines and approves.
--   ★★ THE APPLE OF THE EYE AND THE SHADOW OF THE WINGS (THREAD 2): *Keep me as the apple of the
--      eye, hide me under the shadow of thy wings* (17:8). The first phrase is drawn STRAIGHT from
--      the Song of Moses — *He found him in a desert land... he led him about, he instructed him,
--      he kept him as the apple of his eye* (Deuteronomy 32:10): the covenant tenderness Yahuah
--      bore to Yashar'el (Israel) in the wilderness is the very keeping David asks for himself. The
--      wings-of-refuge motif runs the psalter and beyond: *the children of men put their trust
--      under the shadow of thy wings* (Psalm 36:7); *He shall cover thee with his feathers, and
--      under his wings shalt thou trust* (Psalm 91:4); and Ruth the gathered-in finds the same
--      shelter — *a full reward be given thee of Yahuah Elohim (the LORD God) of Yashar'el
--      (Israel), under whose wings thou art come to trust* (Ruth 2:12). And the same wing-imagery
--      is the longed-for ingathering Yahusha (Jesus) names over Yerushalayim: *how often would I
--      have gathered thy children together, even as a hen gathereth her chickens under her wings,
--      and ye would not!* (Matthew 23:37) — the two houses Yahuah would shelter under His wings,
--      the gathering refused for a season, never the people cast off (Romans 11:1-2).
--   THE PORTION (THREAD 3): the wicked are *men of the world, which have their portion in this
--      life, and whose belly thou fillest with thy hid treasure: they are full of children, and
--      leave the rest of their substance to their babes* (17:14) — their whole inheritance spent
--      in this life. Against that, David's own portion is not substance but Yahuah Himself: *Yahuah
--      (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm
--      16:5). The men of the world filled now have their reward now; the one whose portion is
--      Yahuah waits for the face (17:15).
--   ★★ I SHALL BE SATISFIED WHEN I AWAKE (THREAD 4): the psalm closes on the resurrection-hope —
--      *As for me, I will behold thy face in righteousness: I shall be satisfied, when I awake,
--      with thy likeness* (17:15). The awaking-satisfied-with-his-likeness is the beatific hope the
--      whole canon reaches toward: *when he shall appear, we shall be like him; for we shall see
--      him as he is* (1 John 3:2) — likeness AND sight, the very pair David names; *they shall see
--      his face; and his name shall be in their foreheads* (Revelation 22:4) — the face beheld at
--      last. Job sings it from the ash-heap: *though after my skin worms destroy this body, yet in
--      my flesh shall I see Elohim (God): Whom I shall see for myself, and mine eyes shall behold,
--      and not another* (Job 19:26-27) — the body destroyed, the eyes that yet behold Him. And the
--      awaking is the resurrection twin of David's own *I laid me down and slept; I awaked; for
--      Yahuah (LORD) sustained me* (Psalm 3:5) and *my flesh also shall rest in hope... thou wilt
--      shew me the path of life* (Psalm 16:9,11) — the sleep of death and the waking to His face.
--   EXTRAS: recorded as NONE WARRANTED across the chapter — a deliberate, recorded answer. Psalms
--      extras lean; the load-bearing weaves here are the Torah-root (Deuteronomy 32), the psalter's
--      own trial- and portion- and waking-songs (Ps 3,7,11,16,36,91), Ruth, Job, and the NT
--      consummation (1 John 3, Revelation 22, Matthew 23). No restored witness was forced.
--   VERSES WITH NO ADD: v.1-2 (the prayer's opening invocation), v.4-7 (the trust-and-deliverance
--      plea), v.9-13 (the enemy-portrait + the cry to arise): the frame the four load-bearing
--      weaves rise from; the lion of v.12 echoes Ps 7:2 (gathered in THREAD 1's family of
--      trial-psalms in prose), but no separate framework-bearing target warranted beyond the psalm.

CREATE TEMP VIEW _s302_ps017_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Thou hast proved mine heart — the heart-trier
    ('canon','psalms',17,3,'canon','psalms',7,9,'free',
      E'*Oh let the wickedness of the wicked come to an end; but establish the just: for the righteous Elohim (God) trieth the hearts and reins* (Psalm 7:9). David''s plea *Thou hast proved mine heart... thou hast tried me, and shalt find nothing* (Psalm 17:3) rests on this: it is the *righteous Elohim (God)* who *trieth the hearts and reins*. The heart proved and found true is the heart the Heart-Trier Himself searches and approves; the prayer is offered to the One who alone can try it.'),
    ('canon','psalms',17,3,'canon','psalms',11,4,'free',
      E'*Yahuah (LORD) is in his holy temple, the LORD''S throne is in heaven: his eyes behold, his eyelids try, the children of men* (Psalm 11:4). When David says *Thou hast proved mine heart; thou hast visited me in the night; thou hast tried me* (Psalm 17:3), he speaks to the One whose *eyes behold, his eyelids try, the children of men*. The trying of the heart is no abstraction — it is Yahuah enthroned, His eyes upon the children of Adam.'),
    ('canon','psalms',17,3,'canon','psalms',11,5,'free',
      E'*Yahuah (LORD) trieth the righteous: but the wicked and him that loveth violence his soul hateth* (Psalm 11:5). *Thou hast proved mine heart... thou hast tried me, and shalt find nothing* (Psalm 17:3): the testing David has passed is the very work the psalter names — *Yahuah (LORD) trieth the righteous*. To be tried and found with nothing is to be numbered with the righteous Yahuah proves, not the violent His soul hates.'),

    -- THREAD 2 (★★): Keep me as the apple of the eye, hide me under the shadow of thy wings
    ('canon','psalms',17,8,'canon','deuteronomy',32,10,'free',
      E'*He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10). David''s *Keep me as the apple of the eye* (Psalm 17:8) is drawn straight from the Song of Moses: the covenant tenderness Yahuah bore to Yashar''el (Israel) in the wilderness — *he kept him as the apple of his eye* — is the very keeping David asks for his own soul. The wilderness-care of the whole house becomes the single suppliant''s plea.'),
    ('canon','psalms',17,8,'canon','psalms',36,7,'free',
      E'*How excellent is thy lovingkindness, O Elohim (God)! therefore the children of men put their trust under the shadow of thy wings* (Psalm 36:7). *Hide me under the shadow of thy wings* (Psalm 17:8) is the same refuge the psalter sings: *the children of men put their trust under the shadow of thy wings*. The wings of Yahuah are the shelter the trusting soul runs to; David asks to be hidden where all the children of Adam find their covering.'),
    ('canon','psalms',17,8,'canon','psalms',91,4,'free',
      E'*He shall cover thee with his feathers, and under his wings shalt thou trust: his truth shall be thy shield and buckler* (Psalm 91:4). *Hide me under the shadow of thy wings* (Psalm 17:8) is answered in the great refuge-psalm: *under his wings shalt thou trust*. The wing-shadow David pleads for is the covering Yahuah promises the one who dwells in His secret place — feathers for shelter, truth for a shield.'),
    ('canon','psalms',17,8,'canon','ruth',2,12,'free',
      E'*Yahuah (LORD) recompense thy work, and a full reward be given thee of Yahuah Elohim (the LORD God) of Yashar''el (Israel), under whose wings thou art come to trust* (Ruth 2:12). The plea *hide me under the shadow of thy wings* (Psalm 17:8) is the same shelter Boaz blesses over Ruth the gathered-in — *under whose wings thou art come to trust*. The wings of Yahuah cover both the psalmist of the covenant house and the stranger who comes to trust under them.'),
    ('canon','psalms',17,8,'canon','matthew',23,37,'free',
      E'*O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37). The shadow-of-the-wings David runs to (Psalm 17:8) is the very gathering Yahusha (Jesus) longed to give Yerushalayim — *even as a hen gathereth her chickens under her wings*. The wings that shelter the single suppliant are the wings that would gather the whole house together; the ingathering was refused for a season, but the people are not cast off (Romans 11:1-2).'),

    -- THREAD 3: their portion in this life vs. the eternal portion
    ('canon','psalms',17,14,'canon','psalms',16,5,'free',
      E'*Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm 16:5). Against *men of the world, which have their portion in this life* (Psalm 17:14) — whose whole inheritance is spent now, *full of children, and leave the rest of their substance to their babes* — David''s portion is not substance but Yahuah Himself: *Yahuah (LORD) is the portion of mine inheritance and of my cup*. The men of the world filled now have their reward now; the one whose portion is Yahuah waits for the face.'),

    -- THREAD 4 (★★): I shall be satisfied, when I awake, with thy likeness
    ('canon','psalms',17,15,'canon','1-john',3,2,'free',
      E'*Beloved, now are we the sons of Elohim (God), and it doth not yet appear what we shall be: but we know that, when he shall appear, we shall be like him; for we shall see him as he is* (1 John 3:2). The psalm''s close — *I shall be satisfied, when I awake, with thy likeness* (Psalm 17:15) — names the very pair: likeness AND sight. *We shall be like him; for we shall see him as he is*: the awaking-satisfied-with-his-likeness is the beatific hope, the resurrection waking in which the face is beheld and the likeness shared.'),
    ('canon','psalms',17,15,'canon','revelation',22,4,'free',
      E'*And they shall see his face; and his name shall be in their foreheads* (Revelation 22:4). *I will behold thy face in righteousness... I shall be satisfied, when I awake* (Psalm 17:15): the face David waits to behold is the face seen at the last — *they shall see his face*. The longing of the prayer is the consummation of the city: the satisfied waking is the unveiled face, His name upon His own.'),
    ('canon','psalms',17,15,'canon','job',19,26,'free',
      E'*And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God)* (Job 19:26). *I shall be satisfied, when I awake, with thy likeness* (Psalm 17:15) is Job''s own hope from the ash-heap: the body destroyed, yet *in my flesh shall I see Elohim (God)*. The waking David trusts is the resurrection in which the flesh itself beholds Him — not a bare survival, but the satisfied sight of the living Elohim.'),
    ('canon','psalms',17,15,'canon','job',19,27,'free',
      E'*Whom I shall see for myself, and mine eyes shall behold, and not another; though my reins be consumed within me* (Job 19:27). *As for me, I will behold thy face in righteousness* (Psalm 17:15): David''s own eyes will behold, as Job''s — *Whom I shall see for myself, and mine eyes shall behold, and not another*. The satisfied waking is the personal sight of Him, the very eyes that close in death opened to behold His face.'),
    ('canon','psalms',17,15,'canon','psalms',16,9,'free',
      E'*Therefore my heart is glad, and my glory rejoiceth: my flesh also shall rest in hope* (Psalm 16:9). *I shall be satisfied, when I awake* (Psalm 17:15) is the twin of David''s other resting-in-hope: *my flesh also shall rest in hope*. The flesh that rests in hope is the flesh that wakes satisfied; the sleep of death is held under the promise of the path of life (16:11), the waking to His face.'),
    ('canon','psalms',17,15,'canon','psalms',3,5,'free',
      E'*I laid me down and slept; I awaked; for Yahuah (LORD) sustained me* (Psalm 3:5). *I shall be satisfied, when I awake, with thy likeness* (Psalm 17:15) sings the same waking David trusts elsewhere — *I laid me down and slept; I awaked; for Yahuah (LORD) sustained me*. The nightly sleep-and-waking sustained by Yahuah is the figure of the last waking: the one who lies down under His keeping rises to behold His face.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps017_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps017_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-17-thou-hast-proved-mine-heart-the-heart-trier',
       E'Thou hast proved mine heart — Yahuah trieth the hearts and reins',
       E'Psalm 17 is *A Prayer of David*, the plea of the tested-and-found-true: *Hear the right, O Yahuah (LORD), attend unto my cry, give ear unto my prayer, that goeth not out of feigned lips* (17:1). At its heart is the verdict of the trial: *Thou hast proved mine heart; thou hast visited me in the night; thou hast tried me, and shalt find nothing; I am purposed that my mouth shall not transgress* (17:3). The proving rests on who Yahuah is — the Searcher of the inward man. The psalter sings it plainly: *Oh let the wickedness of the wicked come to an end; but establish the just: for the righteous Elohim (God) trieth the hearts and reins* (Psalm 7:9). It is no abstraction but Yahuah enthroned, His eyes upon the children of Adam: *Yahuah (LORD) is in his holy temple, the LORD''S throne is in heaven: his eyes behold, his eyelids try, the children of men* (Psalm 11:4); *Yahuah (LORD) trieth the righteous: but the wicked and him that loveth violence his soul hateth* (Psalm 11:5). To be proved in the night and tried and found with nothing is to be numbered with the righteous Yahuah examines and approves — the heart the Heart-Trier Himself searches and establishes.',
       sv.verse_id, ev.verse_id, 'free', 22400
  FROM _s302_ps017_lookup sv, _s302_ps017_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=17 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-17-keep-me-as-the-apple-of-the-eye-under-the-shadow-of-thy-wings',
       E'Keep me as the apple of the eye, hide me under the shadow of thy wings',
       E'The psalm''s tenderest plea: *Keep me as the apple of the eye, hide me under the shadow of thy wings* (17:8). The first phrase is drawn STRAIGHT from the Song of Moses — *He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10): the covenant tenderness Yahuah bore to Yashar''el (Israel) in the wilderness is the very keeping David asks for his own soul, the wilderness-care of the whole house pleaded by the single suppliant. The wings-of-refuge motif runs the psalter and beyond: *How excellent is thy lovingkindness, O Elohim (God)! therefore the children of men put their trust under the shadow of thy wings* (Psalm 36:7); *He shall cover thee with his feathers, and under his wings shalt thou trust: his truth shall be thy shield and buckler* (Psalm 91:4). And Ruth the gathered-in finds the same shelter — *a full reward be given thee of Yahuah Elohim (the LORD God) of Yashar''el (Israel), under whose wings thou art come to trust* (Ruth 2:12). The same wing-imagery is the longed-for ingathering Yahusha (Jesus) names over Yerushalayim: *how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37) — the two houses Yahuah would shelter under His wings, the gathering refused for a season, never the people cast off (*I say then, Hath Elohim cast away his people? Elohim forbid* — Romans 11:1-2). The wings that hide the single suppliant are the wings that would gather the whole house home.',
       sv.verse_id, ev.verse_id, 'free', 22403
  FROM _s302_ps017_lookup sv, _s302_ps017_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=17 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-17-their-portion-in-this-life-versus-the-eternal-portion',
       E'Their portion in this life — but Yahuah is the portion of mine inheritance',
       E'The psalm draws the great contrast of two inheritances. The wicked are *men which are thy hand, O Yahuah (LORD), from men of the world, which have their portion in this life, and whose belly thou fillest with thy hid treasure: they are full of children, and leave the rest of their substance to their babes* (17:14) — their whole reward spent in this life, their treasure handed down to their children, and nothing beyond. Against that stands David''s own portion, which is not substance at all but Yahuah Himself: *Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm 16:5). The men of the world filled now have their consolation now; the one whose portion is Yahuah looks past this life to the face — *As for me, I will behold thy face in righteousness* (17:15). The contrast of v.14 and v.15 is the contrast of the two portions: the belly filled in this life, or the soul satisfied with His likeness in the waking to come.',
       sv.verse_id, ev.verse_id, 'free', 22406
  FROM _s302_ps017_lookup sv, _s302_ps017_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=17 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-17-i-shall-be-satisfied-when-i-awake-with-thy-likeness',
       E'I shall be satisfied, when I awake, with thy likeness — the resurrection hope',
       E'The psalm closes on the resurrection-hope, the soul''s answer to the men of the world who have their portion in this life (17:14): *As for me, I will behold thy face in righteousness: I shall be satisfied, when I awake, with thy likeness* (17:15). The awaking-satisfied-with-his-likeness is the beatific hope the whole canon reaches toward. John names the very pair — likeness AND sight: *Beloved, now are we the sons of Elohim (God), and it doth not yet appear what we shall be: but we know that, when he shall appear, we shall be like him; for we shall see him as he is* (1 John 3:2). The city''s consummation is the face beheld at last: *And they shall see his face; and his name shall be in their foreheads* (Revelation 22:4). Job sings it from the ash-heap, the body destroyed yet the flesh beholding: *though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God): Whom I shall see for myself, and mine eyes shall behold, and not another* (Job 19:26-27). And the awaking is the resurrection twin of David''s own nightly trust — *I laid me down and slept; I awaked; for Yahuah (LORD) sustained me* (Psalm 3:5); *my flesh also shall rest in hope... thou wilt shew me the path of life* (Psalm 16:9,11). The sleep of death is held under His keeping, and the one who lies down sustained rises satisfied, to behold His face and bear His likeness.',
       sv.verse_id, ev.verse_id, 'free', 22409
  FROM _s302_ps017_lookup sv, _s302_ps017_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=17 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the righteous Elohim (God) trieth the hearts and reins* (Psalm 7:9) — the proving of 17:3 rests on the Searcher who tries the hearts and reins.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=3
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-thou-hast-proved-mine-heart-the-heart-trier'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*his eyes behold, his eyelids try, the children of men* (Psalm 11:4) — *thou hast tried me* (17:3) is Yahuah enthroned, His eyes upon the children of Adam.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=3
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-thou-hast-proved-mine-heart-the-heart-trier'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD) trieth the righteous* (Psalm 11:5) — to be tried and *find nothing* (17:3) is to be numbered with the righteous Yahuah proves.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=3
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-thou-hast-proved-mine-heart-the-heart-trier'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10) — *Keep me as the apple of the eye* (17:8) drawn STRAIGHT from the Song of Moses, the wilderness-care of the house pleaded by the one.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-keep-me-as-the-apple-of-the-eye-under-the-shadow-of-thy-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the children of men put their trust under the shadow of thy wings* (Psalm 36:7) — *hide me under the shadow of thy wings* (17:8) is the refuge all the children of Adam run to.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=36 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-keep-me-as-the-apple-of-the-eye-under-the-shadow-of-thy-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*under his wings shalt thou trust: his truth shall be thy shield and buckler* (Psalm 91:4) — the wing-shadow of 17:8 is the great refuge-psalm''s covering.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-keep-me-as-the-apple-of-the-eye-under-the-shadow-of-thy-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*under whose wings thou art come to trust* (Ruth 2:12) — the wings of 17:8 cover the stranger gathered-in as well as the psalmist of the covenant house.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-keep-me-as-the-apple-of-the-eye-under-the-shadow-of-thy-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings* (Matthew 23:37) — the shelter of 17:8 is the two-house ingathering Yahusha longed to give; refused for a season, the people not cast off (Romans 11:1-2).'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-keep-me-as-the-apple-of-the-eye-under-the-shadow-of-thy-wings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) is the portion of mine inheritance and of my cup* (Psalm 16:5) — against the men whose *portion in this life* is spent now (17:14), David''s portion is Yahuah Himself.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-their-portion-in-this-life-versus-the-eternal-portion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *when he shall appear, we shall be like him; for we shall see him as he is* (1 John 3:2) — the very pair of 17:15: satisfied with his *likeness*, beholding his *face*.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-i-shall-be-satisfied-when-i-awake-with-thy-likeness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they shall see his face; and his name shall be in their foreheads* (Revelation 22:4) — *I will behold thy face* (17:15) consummated in the city: the face seen at last.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-i-shall-be-satisfied-when-i-awake-with-thy-likeness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God)* (Job 19:26) — the *awake* of 17:15 is the resurrection in which the flesh itself beholds Him.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-i-shall-be-satisfied-when-i-awake-with-thy-likeness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Whom I shall see for myself, and mine eyes shall behold, and not another* (Job 19:27) — *I will behold thy face* (17:15): the personal sight, the very eyes that close in death opened to behold Him.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-i-shall-be-satisfied-when-i-awake-with-thy-likeness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*my flesh also shall rest in hope* (Psalm 16:9) — the flesh that rests in hope is the flesh that *wakes* satisfied (17:15); the path of life held over the sleep of death.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-i-shall-be-satisfied-when-i-awake-with-thy-likeness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I laid me down and slept; I awaked; for Yahuah (LORD) sustained me* (Psalm 3:5) — the nightly waking sustained by Yahuah is the figure of 17:15''s last waking to His face.'
  FROM cross_reference_threads t
  JOIN _s302_ps017_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s302_ps017_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-17-i-shall-be-satisfied-when-i-awake-with-thy-likeness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
