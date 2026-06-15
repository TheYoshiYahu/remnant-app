-- ----- fragment: minion_psalms_42.sql (Psalm 42) -----
-- Chapter: Psalm 42 — BOOK II OPENS, the KORAHITE LONGING PSALM. The exiled singer, cut off from the
-- house of Elohim, thirsts for the living Elohim as the hart pants for water brooks (v.1-2), weeps
-- under the scoffers' taunt *Where is thy Elohim?* (v.3,10), is overwhelmed by the deep (v.7), and
-- preaches to his own soul the great refrain *Why art thou cast down, O my soul?... hope thou in
-- Elohim* (v.5,11). Psalm 42 + 43 are ONE psalm split in two (no superscription on 43; shared refrain
-- at 42:5, 42:11, 43:5) — the refrain thread is anchored HERE and laterals to 43:5; a separate minion
-- builds the rest of Ps 43.
-- Tag: ps042   Temp view: _s302_ps042_lookup   Source of EVERY row: 'canon','psalms',42,v
-- Sort band: base 23025, step 3 -> threads at 23025, 23028, 23031, 23034 (4 threads)
--
-- Psalm 42 coverage:
--   ★ v.1-2 (As the hart panteth after the water brooks, so panteth my soul after thee, O Elohim. My
--           soul thirsteth for Elohim, for the living Elohim: when shall I come and appear before Elohim?)
--        NT:     ★ John 4:14 (the water that I shall give... a well of water springing up into
--                everlasting life — never thirst), ★ John 7:37 (If any man thirst, let him come unto me,
--                and drink), Revelation 21:6 (I will give unto him that is athirst of the fountain of the
--                water of life freely), Revelation 22:17 (let him that is athirst come... the water of
--                life freely) — THREAD 1 (the thirst for the living Elohim fulfilled in the Formed Son's living water)
--        Extras: none warranted (the living-water fulfilment is carried clean by the NT + Isaiah)
--        Tanakh: ★ Isaiah 55:1 (Ho, every one that thirsteth, come ye to the waters), Psalm 63:1 (my
--                soul thirsteth for thee... in a dry and thirsty land), Psalm 84:2 (my heart and my
--                flesh crieth out for the living Elohim — the same Korahite longing) — THREAD 1
--   v.3,10 (My tears have been my meat day and night, while they continually say unto me, Where is thy
--           Elohim?... mine enemies reproach me; while they say daily unto me, Where is thy Elohim?)
--        NT:     ★ Matthew 27:43 (He trusted in Elohim; let him deliver him now... for he said, I am the
--                Son of Elohim — the same scoffers' taunt fall on the Messiah) — THREAD 2 (lateral)
--        Extras: none warranted
--        Tanakh: ★ Psalm 79:10 (Wherefore should the heathen say, Where is their Elohim?), Psalm 115:2
--                (Wherefore should the heathen say, Where is now their Elohim?), Joel 2:17 (wherefore
--                should they say among the people, Where is their Elohim? — the priests' plea) — THREAD 2
--   v.4 (I went with them to the house of Elohim... with a multitude that kept holyday)
--        NT/Extras/Tanakh: none warranted as separate (the longing-for-the-house motif folds into the
--                thirst of THREAD 1 — appearing before Elohim, v.2 — and the Korahite Ps 84 lateral there)
--   ★★ v.5,11 (Why art thou cast down, O my soul? and why art thou disquieted in me? hope thou in
--           Elohim: for I shall yet praise him)
--        NT:     none warranted (the soul-speaking-to-itself refrain is carried within the psalter's own
--                triple repetition; the Gethsemane echo *my soul is exceeding sorrowful* is not forced)
--        Extras: none warranted
--        Tanakh: ★★ Psalm 43:5 (the THIRD occurrence of the identical refrain — Ps 42+43 are one psalm),
--                Psalm 42:11 (the SECOND occurrence, bracketing the psalm) — THREAD 3 (the refrain thread,
--                anchored in 42, lateral to 43:5)
--   v.6 (O my Elohim, my soul is cast down within me: therefore will I remember thee from the land of
--           Jordan... from the hill Mizar)
--        NT/Extras/Tanakh: none warranted as separate (the cast-down confession is the lead-in to the
--                refrain at v.5/11; folded into THREAD 3)
--   ★ v.7 (Deep calleth unto deep at the noise of thy waterspouts: all thy waves and thy billows are
--           gone over me)
--        NT:     none warranted (the floods-of-affliction figure is carried clean by Jonah + the psalter)
--        Extras: none warranted (weighed; the Jonah-canon near-verbatim is the cleaner hit, brief's call)
--        Tanakh: ★★ Jonah 2:3 (all thy billows and thy waves passed over me — near-verbatim), Psalm 69:1-2
--                (the waters are come in unto my soul... I am come into deep waters, where the floods
--                overflow me) — THREAD 4
--   v.8 (Yet Yahuah will command his lovingkindness in the daytime, and in the night his song shall be
--           with me)
--        NT/Extras/Tanakh: none warranted as separate (the turn of trust between the billows of v.7 and
--                the refrain of v.11; folded as the hinge into THREAD 4's close)
--   v.9 (I will say unto Elohim my rock, Why hast thou forgotten me?)
--        NT/Extras/Tanakh: none warranted as separate (the why-forgotten cry parallels 43:2 and feeds the
--                refrain; folded into THREAD 3)
--
-- Threads (slug — target libraries):
--   1. psalm-42-as-the-hart-panteth-so-panteth-my-soul-for-the-living-elohim — NT (John 4, John 7,
--      Revelation 21, Revelation 22) + Tanakh (Isaiah 55, Psalm 63, Psalm 84) [free]
--      (★ the thirst for the living Elohim fulfilled in the Formed Son's living water — never thirst again)
--   2. psalm-42-where-is-thy-elohim-the-reproach-of-the-scoffers — Tanakh (Psalm 79, Psalm 115, Joel 2)
--      + NT (Matthew 27) [free] (the taunt of the heathen/the cross-reproach)
--   3. psalm-42-why-art-thou-cast-down-o-my-soul-hope-thou-in-elohim — Tanakh (Psalm 42:11, Psalm 43:5)
--      [free] (★★ the refrain binding the one split psalm — soul preaching hope to itself in exile)
--   4. psalm-42-deep-calleth-unto-deep-all-thy-waves-are-gone-over-me — Tanakh (Jonah 2, Psalm 69) [free]
--      (the floods of affliction — near-verbatim with Jonah's prayer from the deep)
--
-- Framing notes:
--   ★ THIRST FOR THE LIVING ELOHIM (THREAD 1): *As the hart panteth after the water brooks, so panteth
--      my soul after thee, O Elohim. My soul thirsteth for Elohim, for the living Elohim* (42:1-2). The
--      Formed Son meets the thirst with living water that ends thirst: *whosoever drinketh of the water
--      that I shall give him shall never thirst* (John 4:14); *If any man thirst, let him come unto me,
--      and drink* (John 7:37). It is sealed at the end — *I will give unto him that is athirst of the
--      fountain of the water of life freely* (Rev 21:6); *let him that is athirst come* (Rev 22:17). The
--      prophet's open call is the same — *Ho, every one that thirsteth, come ye to the waters* (Isa 55:1)
--      — and the psalter sings the same Korahite longing — *my soul thirsteth for thee* (Ps 63:1); *my
--      heart and my flesh crieth out for the living Elohim* (Ps 84:2).
--   WHERE IS THY ELOHIM (THREAD 2): the scoffers' daily taunt — *they continually say unto me, Where is
--      thy Elohim?* (42:3,10) — is the standing reproach of the heathen against the scattered people:
--      *Wherefore should the heathen say, Where is their Elohim?* (Ps 79:10; Ps 115:2); the priests'
--      plea answers it — *wherefore should they say among the people, Where is their Elohim?* (Joel 2:17).
--      The same taunt falls upon the Messiah at the tree — *He trusted in Elohim; let him deliver him
--      now... for he said, I am the Son of Elohim* (Matt 27:43). (No curse-on-the-people reading: the
--      reproach is the enemy's mockery, the singer is the faithful remnant, per Rom 11:1-2.)
--   ★★ WHY ART THOU CAST DOWN (THREAD 3): the refrain sounds three times across the one psalm — *Why art
--      thou cast down, O my soul? and why art thou disquieted in me? hope thou in Elohim* (42:5); again
--      *Why art thou cast down, O my soul?... hope thou in Elohim* (42:11); and a third time in the psalm
--      it opens into — *Why art thou cast down, O my soul?... hope in Elohim* (43:5). Psalm 42 and 43 are
--      one psalm split in two (43 has no superscription); the refrain is the seam that binds them. The
--      soul preaches hope to itself in the land of exile: cast down, yet commanded to wait for the praise
--      that will yet come.
--   DEEP CALLETH UNTO DEEP (THREAD 4): *Deep calleth unto deep at the noise of thy waterspouts: all thy
--      waves and thy billows are gone over me* (42:7). Jonah's prayer from the fish's belly is nearly the
--      same words — *the floods compassed me about: all thy billows and thy waves passed over me*
--      (Jonah 2:3) — and the great affliction-psalm — *the waters are come in unto my soul... I am come
--      into deep waters, where the floods overflow me* (Ps 69:1-2). The waves of trouble go over the head
--      of the righteous, yet *Yet Yahuah will command his lovingkindness in the daytime* (42:8): the deep
--      does not have the last word.
--   VERSES WITH NO SEPARATE ADD: v.4 (the house-of-Elohim longing, folded into THREAD 1's appear-before-Elohim),
--      v.6 (cast-down confession, lead-in to the refrain THREAD 3), v.8 (the hinge of trust, folded into
--      THREAD 4's close), v.9 (why-hast-thou-forgotten cry, folded into THREAD 3) — the framework weight
--      sits on vv.1-2, 3/10, 5/11, 7, woven there.

CREATE TEMP VIEW _s302_ps042_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): As the hart panteth — the thirst for the living Elohim fulfilled in living water
    ('canon','psalms',42,2,'canon','john',4,14,'free',
      E'*But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14). *My soul thirsteth for Elohim (God), for the living Elohim (God)* (Psalm 42:2): the thirst of the panting soul is met by the Formed Son at the well — the living water He gives ends thirst forever, a well springing up into everlasting life. The hart''s longing for the brooks is the soul''s longing for Him.'),
    ('canon','psalms',42,2,'canon','john',7,37,'free',
      E'*In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink* (John 7:37). *My soul thirsteth for Elohim (God), for the living Elohim (God): when shall I come and appear before Elohim (God)?* (Psalm 42:2): the cry *when shall I come* is answered by the Formed Son''s open call — *if any man thirst, let him come unto me, and drink*. The One the psalmist thirsts for is the One who bids the thirsty come.'),
    ('canon','psalms',42,2,'canon','revelation',21,6,'free',
      E'*I am Alpha and Omega, the beginning and the end. I will give unto him that is athirst of the fountain of the water of life freely* (Revelation 21:6). *My soul thirsteth for Elohim (God), for the living Elohim (God)* (Psalm 42:2): the longing of the panting soul is satisfied at the last — the fountain of the water of life given freely to him that is athirst. The thirst that runs the whole psalm finds its fountain.'),
    ('canon','psalms',42,2,'canon','revelation',22,17,'free',
      E'*And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely* (Revelation 22:17). *My soul thirsteth for Elohim (God), for the living Elohim (God)* (Psalm 42:2): the canon closes with the same invitation the psalm opens — *let him that is athirst come*. The hart''s thirst is the bride''s thirst, and the water of life is offered without price.'),
    ('canon','psalms',42,2,'canon','isaiah',55,1,'free',
      E'*Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price* (Isaiah 55:1). *My soul thirsteth for Elohim (God), for the living Elohim (God)* (Psalm 42:2): the prophet flings open the same call — every one that thirsts is bidden to the waters, freely. The soul that pants for the living Elohim is the soul Isaiah summons to drink.'),
    ('canon','psalms',42,1,'canon','psalms',63,1,'free',
      E'*O Elohim (God), thou art my Elohim (God); early will I seek thee: my soul thirsteth for thee, my flesh longeth for thee in a dry and thirsty land, where no water is* (Psalm 63:1). *As the hart panteth after the water brooks, so panteth my soul after thee, O Elohim (God)* (Psalm 42:1): the same thirst sings twice — the soul panting in a dry land, flesh and soul longing for Elohim where no water is. The hart of Psalm 42 is the thirsty land of Psalm 63.'),
    ('canon','psalms',42,2,'canon','psalms',84,2,'free',
      E'*My soul longeth, yea, even fainteth for the courts of Yahuah (LORD): my heart and my flesh crieth out for the living Elohim (God)* (Psalm 84:2). *My soul thirsteth for Elohim (God), for the living Elohim (God): when shall I come and appear before Elohim (God)?* (Psalm 42:2): the Korahite longing is one song — the soul fainting for the courts, heart and flesh crying out for the living Elohim, aching to appear before Him. The same singers, the same thirst for the house of Elohim.'),

    -- THREAD 2: Where is thy Elohim — the reproach of the scoffers
    ('canon','psalms',42,3,'canon','psalms',79,10,'free',
      E'*Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed* (Psalm 79:10). *My tears have been my meat day and night, while they continually say unto me, Where is thy Elohim (God)?* (Psalm 42:3): the same taunt — *Where is thy Elohim?* — is the standing mockery of the heathen against the people; what the scoffers fling at the lone singer they fling at the whole scattered house.'),
    ('canon','psalms',42,3,'canon','psalms',115,2,'free',
      E'*Wherefore should the heathen say, Where is now their Elohim (God)?* (Psalm 115:2). *They continually say unto me, Where is thy Elohim (God)?* (Psalm 42:3): the reproach is word for word — the heathen demanding *where is now their Elohim?* The answer the psalter gives is that He is in the heavens and has done whatsoever He pleased; the taunt does not undo the trust.'),
    ('canon','psalms',42,10,'canon','joel',2,17,'free',
      E'*Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach... wherefore should they say among the people, Where is their Elohim (God)?* (Joel 2:17). *Mine enemies reproach me; while they say daily unto me, Where is thy Elohim (God)?* (Psalm 42:10): the priests'' plea names the very reproach the singer endures — the heathen''s taunt *Where is their Elohim?* — and answers it with intercession, that the heritage not be given to scorn.'),
    ('canon','psalms',42,10,'canon','matthew',27,43,'free',
      E'*He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God)* (Matthew 27:43). *Mine enemies reproach me; while they say daily unto me, Where is thy Elohim (God)?* (Psalm 42:10): the same reproach falls on the Formed Son at the tree — the mockers daring Elohim to deliver Him, the taunt *where is thy Elohim* turned into *let him deliver him now*. The reproach of the righteous singer is filled up in the Messiah''s reproach.'),

    -- THREAD 3 (★★): Why art thou cast down, O my soul — the refrain (Ps 42+43 one psalm)
    ('canon','psalms',42,5,'canon','psalms',42,11,'free',
      E'*Why art thou cast down, O my soul? and why art thou disquieted within me? hope thou in Elohim (God): for I shall yet praise him, who is the health of my countenance, and my Elohim (God)* (Psalm 42:11). *Why art thou cast down, O my soul? and why art thou disquieted in me? hope thou in Elohim (God): for I shall yet praise him for the help of his countenance* (Psalm 42:5): the refrain sounds twice within the chapter, bracketing the lament — the soul preaching hope to itself, commanded to wait for the praise that shall yet come.'),
    ('canon','psalms',42,5,'canon','psalms',43,5,'free',
      E'*Why art thou cast down, O my soul? and why art thou disquieted within me? hope in Elohim (God): for I shall yet praise him, who is the health of my countenance, and my Elohim (God)* (Psalm 43:5). *Why art thou cast down, O my soul?... hope thou in Elohim (God)* (Psalm 42:5): the third sounding of the same refrain — for Psalm 42 and 43 are one psalm split in two (43 carries no superscription). The refrain is the seam binding the two halves; the exiled soul, cast down across both, is held by the one charge: hope in Elohim.'),

    -- THREAD 4: Deep calleth unto deep — all thy waves are gone over me
    ('canon','psalms',42,7,'canon','jonah',2,3,'free',
      E'*For thou hadst cast me into the deep, in the midst of the seas; and the floods compassed me about: all thy billows and thy waves passed over me* (Jonah 2:3). *Deep calleth unto deep at the noise of thy waterspouts: all thy waves and thy billows are gone over me* (Psalm 42:7): Jonah''s prayer from the fish''s belly is nearly the same words — *all thy billows and thy waves* gone over the drowning man. The figure of the overwhelming deep is one figure: the righteous engulfed, yet crying up out of the floods.'),
    ('canon','psalms',42,7,'canon','psalms',69,1,'free',
      E'*Save me, O Elohim (God); for the waters are come in unto my soul. I sink in deep mire, where there is no standing: I am come into deep waters, where the floods overflow me* (Psalm 69:1-2). *Deep calleth unto deep... all thy waves and thy billows are gone over me* (Psalm 42:7): the great affliction-psalm sings the same deep — waters come in unto the soul, floods overflowing. The billows of Psalm 42 are the deep waters of Psalm 69, the trouble that goes over the head of the righteous.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps042_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps042_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-42-as-the-hart-panteth-so-panteth-my-soul-for-the-living-elohim',
       E'As the hart panteth, so panteth my soul for the living Elohim — the thirst met in living water',
       E'Book II opens with a thirst: *As the hart panteth after the water brooks, so panteth my soul after thee, O Elohim (God). My soul thirsteth for Elohim (God), for the living Elohim (God): when shall I come and appear before Elohim (God)?* (Psalm 42:1-2). The Formed Son meets that thirst with living water that ends thirst forever — *whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14) — and stands at the feast and cries the open call: *If any man thirst, let him come unto me, and drink* (John 7:37). The whole canon closes on the same invitation: *I will give unto him that is athirst of the fountain of the water of life freely* (Revelation 21:6); *let him that is athirst come... let him take the water of life freely* (Revelation 22:17). The prophet flung the door open long before — *Ho, every one that thirsteth, come ye to the waters... without money and without price* (Isaiah 55:1) — and the psalter sings the same Korahite longing: *my soul thirsteth for thee... in a dry and thirsty land, where no water is* (Psalm 63:1); *my heart and my flesh crieth out for the living Elohim (God)* (Psalm 84:2). The hart''s panting is the soul''s ache to appear before Him; the living Elohim is the living water.',
       sv.verse_id, ev.verse_id, 'free', 23025
  FROM _s302_ps042_lookup sv, _s302_ps042_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=42 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-42-where-is-thy-elohim-the-reproach-of-the-scoffers',
       E'Where is thy Elohim? — the reproach of the scoffers',
       E'The singer''s tears are his meat because of a daily taunt: *My tears have been my meat day and night, while they continually say unto me, Where is thy Elohim (God)?* (Psalm 42:3); *mine enemies reproach me; while they say daily unto me, Where is thy Elohim (God)?* (42:10). It is the standing mockery of the heathen against the scattered people: *Wherefore should the heathen say, Where is their Elohim (God)?* (Psalm 79:10); *Wherefore should the heathen say, Where is now their Elohim (God)?* (Psalm 115:2). The priests weep between the porch and the altar to answer it: *give not thine heritage to reproach... wherefore should they say among the people, Where is their Elohim (God)?* (Joel 2:17). And the same reproach falls upon the Formed Son at the tree — *He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God)* (Matthew 27:43) — the taunt *where is thy Elohim* turned into *let him deliver him now*. The reproach is the enemy''s mockery, not Yahuah''s verdict; the singer is the faithful remnant, and the answer to the scoffer is that He is in the heavens and will yet be praised.',
       sv.verse_id, ev.verse_id, 'free', 23028
  FROM _s302_ps042_lookup sv, _s302_ps042_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=42 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-42-why-art-thou-cast-down-o-my-soul-hope-thou-in-elohim',
       E'Why art thou cast down, O my soul? hope thou in Elohim — the refrain that binds the one psalm',
       E'Three times the same words sound across the psalm — the soul preaching hope to itself: *Why art thou cast down, O my soul? and why art thou disquieted in me? hope thou in Elohim (God): for I shall yet praise him for the help of his countenance* (Psalm 42:5); again at the chapter''s close — *Why art thou cast down, O my soul? and why art thou disquieted within me? hope thou in Elohim (God): for I shall yet praise him, who is the health of my countenance, and my Elohim (God)* (42:11); and a third time in the psalm it opens into — *Why art thou cast down, O my soul?... hope in Elohim (God)* (Psalm 43:5). Psalm 42 and 43 are one psalm split in two — 43 carries no superscription, and this thrice-repeated refrain is the seam that binds the halves. The exiled soul, cast down and disquieted across both, is held by one charge given to itself: hope in Elohim, for the praise will yet come, and He is the health of the countenance.',
       sv.verse_id, ev.verse_id, 'free', 23031
  FROM _s302_ps042_lookup sv, _s302_ps042_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=42 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-42-deep-calleth-unto-deep-all-thy-waves-are-gone-over-me',
       E'Deep calleth unto deep — all thy waves and thy billows are gone over me',
       E'*Deep calleth unto deep at the noise of thy waterspouts: all thy waves and thy billows are gone over me* (Psalm 42:7). Jonah''s prayer from the fish''s belly is nearly the same words — *thou hadst cast me into the deep, in the midst of the seas; and the floods compassed me about: all thy billows and thy waves passed over me* (Jonah 2:3) — and the great affliction-psalm sings the same engulfing deep — *Save me, O Elohim (God); for the waters are come in unto my soul... I am come into deep waters, where the floods overflow me* (Psalm 69:1-2). The billows of trouble go over the head of the righteous; yet the deep does not have the last word — *Yet Yahuah (LORD) will command his lovingkindness in the daytime, and in the night his song shall be with me* (42:8). The same singer who is drowned in the deep is the one who hopes in Elohim.',
       sv.verse_id, ev.verse_id, 'free', 23034
  FROM _s302_ps042_lookup sv, _s302_ps042_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=42 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the water that I shall give him... a well of water springing up into everlasting life* (John 4:14) — the thirst of 42:2 met by the Formed Son: living water that ends thirst.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=2
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-as-the-hart-panteth-so-panteth-my-soul-for-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *If any man thirst, let him come unto me, and drink* (John 7:37) — the cry *when shall I come* (42:2) answered: the One thirsted for bids the thirsty come.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=2
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-as-the-hart-panteth-so-panteth-my-soul-for-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the fountain of the water of life freely* (Revelation 21:6) — the longing of 42:2 satisfied at the last: the fountain given to him that is athirst.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=2
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-as-the-hart-panteth-so-panteth-my-soul-for-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*let him that is athirst come... let him take the water of life freely* (Revelation 22:17) — the canon closes on the same invitation 42 opens: the thirsty bidden to drink.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=2
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-as-the-hart-panteth-so-panteth-my-soul-for-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Ho, every one that thirsteth, come ye to the waters* (Isaiah 55:1) — the prophet flings open the same call as the thirst of 42:2: come and drink without price.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=2
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-as-the-hart-panteth-so-panteth-my-soul-for-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*my soul thirsteth for thee... in a dry and thirsty land, where no water is* (Psalm 63:1) — the same thirst as 42:1: the soul panting in a dry land for Elohim.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=1
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=63 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-as-the-hart-panteth-so-panteth-my-soul-for-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*my heart and my flesh crieth out for the living Elohim (God)* (Psalm 84:2) — the Korahite longing of 42:2: the soul aching to appear before the living Elohim.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=2
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=84 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-as-the-hart-panteth-so-panteth-my-soul-for-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Wherefore should the heathen say, Where is their Elohim (God)?* (Psalm 79:10) — the taunt of 42:3 is the heathen''s standing mockery of the whole scattered people.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=3
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-where-is-thy-elohim-the-reproach-of-the-scoffers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Wherefore should the heathen say, Where is now their Elohim (God)?* (Psalm 115:2) — word for word the reproach of 42:3, answered: He is in the heavens, doing as He pleases.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=3
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-where-is-thy-elohim-the-reproach-of-the-scoffers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*wherefore should they say among the people, Where is their Elohim (God)?* (Joel 2:17) — the priests'' plea names the very reproach of 42:10, met with intercession for the heritage.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=10
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-where-is-thy-elohim-the-reproach-of-the-scoffers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He trusted in Elohim (God); let him deliver him now... for he said, I am the Son of Elohim (God)* (Matthew 27:43) — the reproach of 42:10 filled up at the tree: the same taunt flung at the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=10
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-where-is-thy-elohim-the-reproach-of-the-scoffers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Why art thou cast down, O my soul?... hope thou in Elohim (God): for I shall yet praise him* (Psalm 42:11) — the second sounding of the refrain, bracketing the lament of the chapter.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=5
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=42 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-why-art-thou-cast-down-o-my-soul-hope-thou-in-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Why art thou cast down, O my soul?... hope in Elohim (God)* (Psalm 43:5) — the third sounding: Ps 42+43 are one psalm split in two, and this refrain is the seam binding them.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=5
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=43 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-why-art-thou-cast-down-o-my-soul-hope-thou-in-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the floods compassed me about: all thy billows and thy waves passed over me* (Jonah 2:3) — nearly the same words as 42:7: the deep engulfing, yet the cry rising out of it.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=7
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-deep-calleth-unto-deep-all-thy-waves-are-gone-over-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the waters are come in unto my soul... I am come into deep waters, where the floods overflow me* (Psalm 69:1-2) — the same engulfing deep as 42:7: the trouble over the head of the righteous.'
  FROM cross_reference_threads t
  JOIN _s302_ps042_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=42 AND sv.verse_number=7
  JOIN _s302_ps042_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-42-deep-calleth-unto-deep-all-thy-waves-are-gone-over-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
