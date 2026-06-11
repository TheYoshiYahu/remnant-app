-- ----- fragment: minion_1corinthians_15.sql (S228 1 Corinthians 15) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 15 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 15 (58 verses) — THE RESURRECTION OF THE DEAD,
--   the doctrinal climax of the letter; the last Adam, the last trump.
-- Tag: co15 (temp view _s228_co15_lookup).
-- Sort band: floor 6950, step 3 (6950, 6953, 6956, 6959, 6962, 6965, 6968 used; under 6975).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul lays out the resurrection as the climax of the gospel he *received* and
-- *delivered* — Messiah died and rose *according to the scriptures* (15:3-4), the Tanakh itself the
-- ground of the resurrection hope. The whole chapter is a BODILY resurrection: the first Adam's death
-- (Genesis 2-3) undone by the last Adam (Genesis 2:7), the corruptible putting on incorruption, death
-- *swallowed up in victory* (Isaiah 25:8) at *the last trump* (15:52). NOT a platonic escape from the
-- body, NOT a disembodied immortal-soul heaven — *Elohim (God) giveth it a body as it hath pleased
-- him* (15:38), the seed sown and raised a real, transformed body. The Christology of the Formed is
-- preserved at 15:24-28: the Son delivers up the kingdom to Elohim (God) the Father and is himself
-- *subject* to the One who put all things under him, that *Elohim (God) may be all in all* — the
-- Formed Son ordered under the Father, NOT co-equal-persons. The pull renders the OT-citation Lord as
-- *Yahuah (LORD)* (Isaiah 25:8 *He will swallow up death in victory*, Hosea 13:14, Psalm 110:1) and
-- the titular Yahusha-Lord as *Lord* (*our Lord Yahusha HaMashiach*); 15:47 *the second man is
-- Yahuah (Lord) from heaven* and 15:58 *the work of Yahuah (Lord)* are preserved exactly as the pull
-- returns them. The library witness is rich: Wisdom of Solomon on the immortality and vindication of
-- the righteous, 2 Esdras on the earth restoring the dead and the changed body, 1 Enoch 51 on the
-- earth giving back what was entrusted to it, 2 Maccabees 7 on the King of the world who will raise
-- up those who died for his laws.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the gospel delivered, by which ye are saved
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (carried at 15:3-4)
--   v.3-4   Messiah died for our sins and rose the third day according to the scriptures
--           Tanakh: Isaiah 53:5 (wounded for our transgressions), 53:6 (Yahuah laid on him the
--                   iniquity of us all), 53:11-12 (bare the sin of many), Hosea 6:2 (in the third
--                   day he will raise us up), Jonah 1:17 (three days and three nights)
--           Extras: none warranted (the third-day/suffering-servant root is Tanakh)
--           NT: none warranted (the appearances are listed in-text; resurrection-tradition carried)
--   v.5-19  the witnesses; if Messiah be not raised your faith is vain
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (argument, not citation)
--   v.20-23 the firstfruits; as in Adam all die, in Messiah made alive
--           Tanakh: Genesis 2:17 (in the day thou eatest thou shalt surely die), Genesis 3:19 (dust
--                   thou art, unto dust shalt thou return)
--           Extras: 2 Esdras 7:29 (my son Messiah shall die, and all men that have life)
--           NT: Romans 5:12 (by one man sin entered, and death by sin), Romans 5:18-19 (by one the
--                   free gift unto justification of life)
--   v.24-28 he must reign till all enemies under his feet; the Son subject; Elohim all in all
--           Tanakh: Psalm 110:1 (sit at my right hand till I make thine enemies thy footstool),
--                   Psalm 8:6 (thou hast put all things under his feet)
--           Extras: none warranted   NT: none warranted (Christology carried in prose)
--   v.29-34 baptized for the dead; let us eat and drink, for to morrow we die
--           Tanakh: Isaiah 22:13 (let us eat and drink; for to morrow we shall die)
--           Extras: none warranted   NT: none warranted
--   v.35-49 with what body? the seed sown; the first man Adam, the last Adam
--           Tanakh: Genesis 2:7 (man became a living soul — the verse 15:45 cites)
--           Extras: Wisdom 2:23 (Yahuah created man to be immortal, an image of his own eternity),
--                   Wisdom 3:1-4 (the souls of the righteous... their hope full of immortality),
--                   2 Esdras 7:31-32 (the earth shall restore those that are asleep in her)
--           NT: none warranted (the two-Adams NT echo is Romans 5, bound at v.21-22)
--   v.50-53 we shall all be changed, at the last trump; the dead raised incorruptible
--           Tanakh: Isaiah 27:13 (the great trumpet shall be blown, and they shall come... gathered)
--           Extras: none warranted (the last-trump gathering carried Tanakh + NT)
--           NT: 1 Thessalonians 4:16 (the trump of Elohim, the dead in Messiah shall rise first),
--                   Revelation 11:15 (the seventh angel sounded; the kingdoms become the Lord's)
--   v.54-57 death swallowed up in victory; O death where is thy sting
--           Tanakh: Isaiah 25:8 (He will swallow up death in victory), Hosea 13:14 (O death I will
--                   be thy plagues; O grave I will be thy destruction)
--           Extras: 1 Enoch 51:1 (the earth give back that which has been entrusted to it; Sheol
--                   give back), 2 Maccabees 7:9 (the King of the world shall raise us up... to
--                   everlasting life), 2 Maccabees 7:14 (raised up again by him), 2 Maccabees 7:23
--                   (the Creator will give you breath and life again)
--           NT: none warranted (Tanakh citation + extras carry it)
--   v.58   be ye stedfast, your labour is not in vain
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (exhortation)
--
-- THREADS (slug -> target libraries):
--   6950 1-corinthians-15-messiah-died-and-rose-the-third-day-according-to-the-scriptures-isaiah-53  (Tanakh)
--   6953 1-corinthians-15-as-in-adam-all-die-in-messiah-made-alive-the-firstfruits-genesis-2-3        (Tanakh + Extras + NT)
--   6956 1-corinthians-15-he-must-reign-till-all-enemies-under-his-feet-the-son-subject-psalm-110-8    (Tanakh)
--   6959 1-corinthians-15-let-us-eat-and-drink-for-to-morrow-we-die-isaiah-22                          (Tanakh)
--   6962 1-corinthians-15-the-first-man-adam-and-the-last-adam-the-spiritual-body-genesis-2            (Tanakh + Extras)
--   6965 1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4           (Tanakh + NT)
--   6968 1-corinthians-15-death-swallowed-up-in-victory-o-death-where-is-thy-sting-isaiah-25-hosea-13  (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s228_co15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-15-messiah-died-and-rose-the-third-day-according-to-the-scriptures-isaiah-53
  ('canon', '1-corinthians', 15, 3, 'canon', 'isaiah', 53, 5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). When Paul says *Messiah (Christ) died for our sins according to the scriptures* (1 Corinthians 15:3), this is the scripture: the servant *wounded for our transgressions,* *bruised for our iniquities.* The gospel Paul received and delivered is no novelty but the suffering servant of Isaiah, whose stripes are our healing — Messiah''s death for sins was written long before in the Tanakh.'),
  ('canon', '1-corinthians', 15, 3, 'canon', 'isaiah', 53, 6, 'free', E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all.* (Isaiah 53:6). *Yahuah (LORD) hath laid on him the iniquity of us all* — this is the scripture according to which *Messiah (Christ) died for our sins* (1 Corinthians 15:3). The straying sheep and the iniquity laid upon the servant are the very shape of the gospel Paul delivered first of all; the death for sins is the Tanakh''s own word.'),
  ('canon', '1-corinthians', 15, 3, 'canon', 'isaiah', 53, 11, 'free', E'*He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* (Isaiah 53:11). *My righteous servant* shall *justify many; for he shall bear their iniquities* — and *he was numbered with the transgressors; and he bare the sin of many* (Isaiah 53:12). Paul''s *Messiah (Christ) died for our sins according to the scriptures* (1 Corinthians 15:3) rests on this: the servant bears the sin of many and is satisfied, seeing the travail of his soul. The bearing of iniquity is the scriptural ground of the death Paul preaches.'),
  ('canon', '1-corinthians', 15, 4, 'canon', 'hosea', 6, 2, 'free', E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* (Hosea 6:2). *In the third day he will raise us up* — Paul says Messiah *rose again the third day according to the scriptures* (1 Corinthians 15:4), and here is the scripture of the third day: Yahuah (LORD) reviving and raising up his people on the third day. The resurrection-on-the-third-day Paul preaches is woven into the Tanakh''s own promise of being raised up to live in his sight.'),
  ('canon', '1-corinthians', 15, 4, 'canon', 'jonah', 1, 17, 'free', E'*Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* (Jonah 1:17). Jonah in the belly *three days and three nights* is the sign of the burial and the rising *the third day according to the scriptures* (1 Corinthians 15:4). The prophet swallowed up and given back out of the deep is the figure of Messiah buried and raised; the three days of Jonah foreshadow the three days of the One who rose.'),
  -- thread: 1-corinthians-15-as-in-adam-all-die-in-messiah-made-alive-the-firstfruits-genesis-2-3
  ('canon', '1-corinthians', 15, 22, 'canon', 'genesis', 2, 17, 'free', E'*But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* (Genesis 2:17). The death that entered with the first man begins here: *thou shalt surely die.* Paul writes *as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22) — the *all die* is the working-out of this first sentence of death in the garden, undone by the last Adam who makes alive.'),
  ('canon', '1-corinthians', 15, 22, 'canon', 'genesis', 3, 19, 'free', E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). *Dust thou art, and unto dust shalt thou return* — this is the death that came *by man* (1 Corinthians 15:21), the reign of death from Adam that Paul says is reversed: *as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). The dust-return of the first man is what the resurrection of the dead overturns.'),
  ('canon', '1-corinthians', 15, 21, 'canon', 'romans', 5, 12, 'free', E'*Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* (Romans 5:12). Paul says the same to the Romans as here: *by one man sin entered into the world, and death by sin.* So in Corinth, *since by man came death, by man came also the resurrection of the dead* (1 Corinthians 15:21). The one man through whom death entered is met by the one man through whom the resurrection comes — the two Adams, death by the first, life by the last.'),
  ('canon', '1-corinthians', 15, 22, 'canon', 'romans', 5, 18, 'free', E'*Therefore as by the offence of one judgment came upon all men to condemnation; even so by the righteousness of one the free gift came upon all men unto justification of life.* (Romans 5:18). *As by the offence of one... even so by the righteousness of one* — the very architecture of *as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). What the one man''s disobedience brought, the obedience of the one undoes; the all-in-Adam dying is answered by the all-in-Messiah made alive.'),
  ('canon', '1-corinthians', 15, 22, 'apocrypha', '2-esdras', 7, 29, 'extras', E'*After these years shall my son Messiah (Christ) die, and all men that have life.* (2 Esdras 7:29). The restored library holds the same universal death: *all men that have life* shall die, the world turned to silence, then *raised up* and *the earth shall restore those that are asleep in her* (2 Esdras 7:31-32). It is the same reckoning Paul makes — *as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22): all die, and all are raised.'),
  -- thread: 1-corinthians-15-he-must-reign-till-all-enemies-under-his-feet-the-son-subject-psalm-110-8
  ('canon', '1-corinthians', 15, 25, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). *Sit thou at my right hand, until I make thine enemies thy footstool* — Paul reads this enthronement: *he must reign, till he hath put all enemies under his feet* (1 Corinthians 15:25). The Lord seated at Yahuah''s (LORD''s) right hand reigns until every enemy is made his footstool, and *the last enemy that shall be destroyed is death* (1 Corinthians 15:26).'),
  ('canon', '1-corinthians', 15, 27, 'canon', 'psalms', 8, 6, 'free', E'*Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* (Psalm 8:6). *Thou hast put all things under his feet* — Paul takes this word of the son of Adam''s dominion and applies it to the reign of Messiah: *he hath put all things under his feet* (1 Corinthians 15:27). And Paul marks the Christology carefully: *it is manifest that he is excepted, which did put all things under him* — the One who subjects all things to the Son is the Father, and the Son himself is then *subject unto him that put all things under him, that Elohim (God) may be all in all* (1 Corinthians 15:28). The Formed Son is ordered under the Father.'),
  -- thread: 1-corinthians-15-let-us-eat-and-drink-for-to-morrow-we-die-isaiah-22
  ('canon', '1-corinthians', 15, 32, 'canon', 'isaiah', 22, 13, 'free', E'*And behold joy and gladness, slaying oxen, and killing sheep, eating flesh, and drinking wine: let us eat and drink; for to morrow we shall die.* (Isaiah 22:13). *Let us eat and drink; for to morrow we shall die* — the cry of those in Jerusalem who would not look to their maker. Paul quotes it as the logic of a world with no resurrection: *if the dead rise not? let us eat and drink; for to morrow we die* (1 Corinthians 15:32). Where there is no rising, there is only the despairing feast of Isaiah''s doomed city; the resurrection is what answers that despair.'),
  -- thread: 1-corinthians-15-the-first-man-adam-and-the-last-adam-the-spiritual-body-genesis-2
  ('canon', '1-corinthians', 15, 45, 'canon', 'genesis', 2, 7, 'free', E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7). *Man became a living soul* — this is the verse Paul cites: *And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). The first man, formed of the dust and made a living soul, is set against the last Adam who is a life-giving spirit; *the first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven* (1 Corinthians 15:47). The resurrection body is the image of the heavenly — real, transformed, not an escape from the body but the natural raised a spiritual body.'),
  ('canon', '1-corinthians', 15, 42, 'apocrypha', 'the-wisdom-of-solomon', 2, 23, 'extras', E'*For Yahuah (God) created man to be immortal, and made him to be an image of his own eternity.* (Wisdom of Solomon 2:23). The library witnesses that man was *created... to be immortal, and made... an image of his own eternity* — the very destiny the resurrection restores. Paul says the body *is sown in corruption; it is raised in incorruption* (1 Corinthians 15:42): the corruptible put on incorruption is the recovery of the immortality for which man was created, the image of eternity raised in glory.'),
  ('canon', '1-corinthians', 15, 42, 'apocrypha', 'the-wisdom-of-solomon', 3, 1, 'extras', E'*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* (Wisdom of Solomon 3:1). *In the sight of the unwise they seemed to die... but they are in peace... their hope is full of immortality* (Wisdom of Solomon 3:2-4): the library holds that what looks like death and dishonour to the world is, for the righteous, the threshold of immortality. So Paul: the body *is sown in dishonour; it is raised in glory: it is sown in weakness; it is raised in power* (1 Corinthians 15:43). The seeming-death of the righteous is the sowing; the hope full of immortality is the raising.'),
  ('canon', '1-corinthians', 15, 44, 'apocrypha', '2-esdras', 7, 32, 'extras', E'*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* (2 Esdras 7:32). *The earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence* — the library''s picture of the raising of the body from the dust. Paul speaks the same raising: *It is sown a natural body; it is raised a spiritual body* (1 Corinthians 15:44). What is sown in the earth, asleep in the dust, the earth gives back transformed; the dead are raised in a body that Elohim (God) gives as it pleases him.'),
  -- thread: 1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4
  ('canon', '1-corinthians', 15, 52, 'canon', 'isaiah', 27, 13, 'free', E'*And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* (Isaiah 27:13). *The great trumpet shall be blown,* and the perishing and the outcast are gathered home to worship Yahuah (LORD). Paul''s *last trump* is this great trumpet: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). The trumpet that gathers the scattered seed is the trumpet that raises the dead — one last-trump ingathering, the outcasts brought home and the dead raised together.'),
  ('canon', '1-corinthians', 15, 52, 'canon', '1-thessalonians', 4, 16, 'free', E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* (1 Thessalonians 4:16). *With the trump of Elohim (God)... the dead in Messiah (Christ) shall rise first* — the same sounding trumpet, the same raising of the dead Paul sets before the Corinthians: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52). The trump of Elohim (God) at the coming and the last trump of the resurrection are one event: the dead raised, the living changed, caught up to meet the Lord.'),
  ('canon', '1-corinthians', 15, 52, 'canon', 'revelation', 11, 15, 'free', E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever.* (Revelation 11:15). *The seventh angel sounded* — the last of the trumpets — and the kingdoms become the Lord''s, and *the time of the dead, that they should be judged* (Revelation 11:18) is come. This seventh and last trumpet is Paul''s *last trump,* when *the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52): the final trumpet that raises the dead and brings the reign of Messiah (Christ) for ever and ever.'),
  -- thread: 1-corinthians-15-death-swallowed-up-in-victory-o-death-where-is-thy-sting-isaiah-25-hosea-13
  ('canon', '1-corinthians', 15, 54, 'canon', 'isaiah', 25, 8, 'free', E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* (Isaiah 25:8). *He will swallow up death in victory* — Paul cites this exact word as the saying brought to pass when the corruptible puts on incorruption: *then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:54). The feast on the mountain where Yahuah (LORD) destroys death and wipes away tears is the resurrection''s own promise, spoken by Yahuah (LORD) long before.'),
  ('canon', '1-corinthians', 15, 55, 'canon', 'hosea', 13, 14, 'free', E'*I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction: repentance shall be hid from mine eyes.* (Hosea 13:14). *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* — Paul turns this against death itself in triumph: *O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55). The ransom from the grave Yahuah (LORD) promised in Hosea becomes the taunt over a defeated death; the grave and death that held the dead are themselves destroyed.'),
  ('canon', '1-corinthians', 15, 54, 'enoch', '1-enoch', 51, 1, 'extras', E'*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes.* (1 Enoch 51:1). The library holds the resurrection plainly: *the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received.* When death is *swallowed up in victory* (1 Corinthians 15:54), this is what it means — the earth and Sheol forced to give back the dead they held; the grave loses its victory because what it owed it must now return.'),
  ('canon', '1-corinthians', 15, 57, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'*And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9). The second of the seven brothers dies confessing *the King of the world shall raise us up, who have died for his laws, to everlasting life* — and the Creator *will also of his own mercy give you breath and life again* (2 Maccabees 7:23). This is the victory Paul gives thanks for: *thanks be to Elohim (God), which giveth us the victory through our Lord Yahusha HaMashiach (Lord Jesus Christ)* (1 Corinthians 15:57). The King of the world who raises the faithful to everlasting life is the One who gives the victory over death.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-15-messiah-died-and-rose-the-third-day-according-to-the-scriptures-isaiah-53',
       E'Messiah died and rose the third day according to the scriptures (Isaiah 53, Hosea 6, Jonah 1)',
       E'Paul lays down the gospel he *received* and *delivered... first of all*: *how that Messiah (Christ) died for our sins according to the scriptures; And that he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:3-4). Twice he says *according to the scriptures* — the death and the rising are not novelties but the Tanakh''s own word. The death for sins is the suffering servant of Isaiah: *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5); *Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6); *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). The servant who bears the sin of many is the Messiah who *died for our sins.* And the rising on the third day is also written: *After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2) — Yahuah (LORD) raising up his people on the third day. The sign of it is Jonah, *in the belly of the fish three days and three nights* (Jonah 1:17), swallowed by the deep and given back. The gospel Paul preaches is the gospel the scriptures already held: the servant wounded for transgressions, raised the third day to life.',
       sv.verse_id, ev.verse_id, 'free', 6950
  FROM _s228_co15_lookup sv, _s228_co15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-15-as-in-adam-all-die-in-messiah-made-alive-the-firstfruits-genesis-2-3',
       E'As in Adam all die, in Messiah made alive — the firstfruits (Genesis 2-3, Romans 5, 2 Esdras 7)',
       E'*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept... For since by man came death, by man came also the resurrection of the dead. For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:20-22). The whole argument turns on the two men. The death that *all die* began with the first man in the garden: *in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17), and the sentence carried out — *dust thou art, and unto dust shalt thou return* (Genesis 3:19). Paul says the same to the Romans: *by one man sin entered into the world, and death by sin; and so death passed upon all men* (Romans 5:12), and against that *by one man''s offence death reigned,* so *by the righteousness of one the free gift came upon all men unto justification of life* (Romans 5:18). Death by the first Adam, life by the last — the all-in-Adam dying answered by the all-in-Messiah made alive. The restored library holds the same universal reckoning: *my son Messiah (Christ) [shall] die, and all men that have life* (2 Esdras 7:29), and then the world *raised up* and *the earth shall restore those that are asleep in her* (2 Esdras 7:32). All die in Adam; all are made alive in Messiah, who is the firstfruits — the first sheaf of a whole harvest of the raised, *every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* (1 Corinthians 15:23).',
       sv.verse_id, ev.verse_id, 'extras', 6953
  FROM _s228_co15_lookup sv, _s228_co15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=15 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-15-he-must-reign-till-all-enemies-under-his-feet-the-son-subject-psalm-110-8',
       E'He must reign till all enemies under his feet — the Son subject (Psalm 110, Psalm 8)',
       E'*Then cometh the end, when he shall have delivered up the kingdom to Elohim (God), even the Father... For he must reign, till he hath put all enemies under his feet. The last enemy that shall be destroyed is death* (1 Corinthians 15:24-26). Paul reads the enthronement of Psalm 110: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1) — the Lord reigns at Yahuah''s (LORD''s) right hand *until* every enemy is subdued, and the last of those enemies is death itself. And the *all things under his feet* is Psalm 8: *thou hast put all things under his feet* (Psalm 8:6), the dominion given to the son of Adam, now fulfilled in Messiah''s reign. But mark how carefully Paul guards the Christology of the Formed: *when he saith all things are put under him, it is manifest that he is excepted, which did put all things under him* (1 Corinthians 15:27) — the One who subjects all things to the Son is the Father, not under the Son. And the consummation: *when all things shall be subdued unto him, then shall the Son also himself be subject unto him that put all things under him, that Elohim (God) may be all in all* (1 Corinthians 15:28). The Son delivers up the kingdom and is himself subject to the Father; the Formed Son is ordered under the One, that Elohim (God) may be all in all. This is no co-equal-persons grammar but the Son who reigns until death is destroyed, then hands the kingdom to his Father.',
       sv.verse_id, ev.verse_id, 'free', 6956
  FROM _s228_co15_lookup sv, _s228_co15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=15 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-15-let-us-eat-and-drink-for-to-morrow-we-die-isaiah-22',
       E'Let us eat and drink, for to morrow we die — the despair of no resurrection (Isaiah 22)',
       E'Paul presses the cost of denying the resurrection: *if the dead rise not? let us eat and drink; for to morrow we die* (1 Corinthians 15:32). The words are Isaiah''s — the cry of Jerusalem under siege, who when called to weeping and mourning instead made a feast: *behold joy and gladness, slaying oxen, and killing sheep, eating flesh, and drinking wine: let us eat and drink; for to morrow we shall die* (Isaiah 22:13). Of them Yahuah (LORD) said *this iniquity shall not be purged from you till ye die* (Isaiah 22:14) — for they *looked not unto the maker thereof, neither had respect unto him that fashioned it long ago* (Isaiah 22:11). That is the world without a rising: a despairing feast that does not look to the Maker who raises the dead. Paul quotes the doomed city to show what is lost if there is no resurrection — and so to drive home that there is one. *Awake to righteousness, and sin not* (1 Corinthians 15:34): the hope of the resurrection is the answer to the eat-and-drink despair.',
       sv.verse_id, ev.verse_id, 'free', 6959
  FROM _s228_co15_lookup sv, _s228_co15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=15 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-15-the-first-man-adam-and-the-last-adam-the-spiritual-body-genesis-2',
       E'The first man Adam and the last Adam — the spiritual body (Genesis 2:7, Wisdom, 2 Esdras)',
       E'To the question *with what body do they come?* (1 Corinthians 15:35) Paul answers with the sown seed and the two Adams. The seed sown does not come up the bare grain but a body Elohim (God) gives: *Elohim (God) giveth it a body as it hath pleased him, and to every seed his own body* (1 Corinthians 15:38). So the resurrection: *It is sown in corruption; it is raised in incorruption... It is sown a natural body; it is raised a spiritual body* (1 Corinthians 15:42,44). This is no escape from the body but a real body transformed — the natural raised spiritual. And the ground of it is the verse Paul cites: *And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45), quoting *man became a living soul* (Genesis 2:7). The first man, formed of the dust, a living soul; the last Adam, a life-giving spirit. *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven* (1 Corinthians 15:47), and *as we have borne the image of the earthy, we shall also bear the image of the heavenly* (1 Corinthians 15:49). The library names the destiny the resurrection restores: *Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* (Wisdom of Solomon 2:23); and of the righteous, *in the sight of the unwise they seemed to die... but their hope is full of immortality* (Wisdom of Solomon 3:2-4) — the seeming-death the sowing, the immortality the raising. So too 2 Esdras: *the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence* (2 Esdras 7:32). What is sown in the dust the earth gives back, raised incorruptible — the image of the heavenly, the last Adam''s own life-giving form.',
       sv.verse_id, ev.verse_id, 'extras', 6962
  FROM _s228_co15_lookup sv, _s228_co15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=42
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=15 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4',
       E'The last trump — we shall all be changed (Isaiah 27, 1 Thessalonians 4, Revelation 11)',
       E'*Behold, I shew you a mystery; We shall not all sleep, but we shall all be changed, In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:51-52). The *last trump* is the great trumpet of the ingathering. Isaiah: *in that day... the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13) — the trumpet that gathers the scattered, perishing seed home. The trumpet that gathers the outcasts is the trumpet that raises the dead. Paul wrote the same to the Thessalonians: *Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the trump of Elohim (God), the dead raised, the living caught up. And John heard the last of the trumpets: *the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ)* (Revelation 11:15), when *the time of the dead, that they should be judged* is come (Revelation 11:18). One last-trump event: the great trumpet of Isaiah''s ingathering, the trump of Elohim (God) at the descent, the seventh trumpet of the kingdom — the dead raised incorruptible and the living changed, the corruptible putting on incorruption.',
       sv.verse_id, ev.verse_id, 'free', 6965
  FROM _s228_co15_lookup sv, _s228_co15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=51
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=15 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-15-death-swallowed-up-in-victory-o-death-where-is-thy-sting-isaiah-25-hosea-13',
       E'Death swallowed up in victory — O death, where is thy sting (Isaiah 25, Hosea 13, 1 Enoch 51, 2 Maccabees 7)',
       E'When the corruptible has put on incorruption, *then shall be brought to pass the saying that is written, Death is swallowed up in victory. O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:54-55). Both sayings are the Tanakh''s. Isaiah, of the feast on the mountain: *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* (Isaiah 25:8) — Yahuah (LORD) himself swallowing up death. And Hosea, the taunt over the grave: *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* (Hosea 13:14). The ransom from the grave becomes Paul''s triumphant taunt over a defeated death. The restored library holds the same defeat of the grave: *the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes* (1 Enoch 51:1) — death and Sheol forced to return what they held. And the King of the world is the One who raises: *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9), the Creator who *will... give you breath and life again* (2 Maccabees 7:23). So Paul closes in thanksgiving: *thanks be to Elohim (God), which giveth us the victory through our Lord Yahusha HaMashiach (Lord Jesus Christ)* (1 Corinthians 15:57). The sting of death is sin, the strength of sin the law — and the victory over both is given through the risen Messiah, death swallowed up, the grave emptied, the King of the world raising the faithful to everlasting life.',
       sv.verse_id, ev.verse_id, 'extras', 6968
  FROM _s228_co15_lookup sv, _s228_co15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=54
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=15 AND ev.verse_number=57
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-15-messiah-died-and-rose-the-third-day-according-to-the-scriptures-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:5 — *he was wounded for our transgressions, he was bruised for our iniquities... with his stripes we are healed* the suffering servant; *Messiah (Christ) died for our sins according to the scriptures* (1 Corinthians 15:3).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-messiah-died-and-rose-the-third-day-according-to-the-scriptures-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:6 — *Yahuah (LORD) hath laid on him the iniquity of us all* the iniquity laid on the servant; the scripture according to which *Messiah (Christ) died for our sins* (1 Corinthians 15:3).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-messiah-died-and-rose-the-third-day-according-to-the-scriptures-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:11 — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* the servant bears the sin of many; the scriptural ground of *died for our sins* (1 Corinthians 15:3).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-messiah-died-and-rose-the-third-day-according-to-the-scriptures-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 6:2 — *in the third day he will raise us up, and we shall live in his sight* the scripture of the third day; *he rose again the third day according to the scriptures* (1 Corinthians 15:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-messiah-died-and-rose-the-third-day-according-to-the-scriptures-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jonah 1:17 — *Jonah was in the belly of the fish three days and three nights* the sign of the three days; *he rose again the third day according to the scriptures* (1 Corinthians 15:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-messiah-died-and-rose-the-third-day-according-to-the-scriptures-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-15-as-in-adam-all-die-in-messiah-made-alive-the-firstfruits-genesis-2-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *in the day that thou eatest thereof thou shalt surely die* the first sentence of death; *as in Adam all die* (1 Corinthians 15:22).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-as-in-adam-all-die-in-messiah-made-alive-the-firstfruits-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *dust thou art, and unto dust shalt thou return* the death that came by man; *as in Adam all die* (1 Corinthians 15:22), undone by the last Adam.'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-as-in-adam-all-die-in-messiah-made-alive-the-firstfruits-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:12 — *by one man sin entered into the world, and death by sin* death by the one man; *since by man came death, by man came also the resurrection* (1 Corinthians 15:21).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-as-in-adam-all-die-in-messiah-made-alive-the-firstfruits-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:18 — *as by the offence of one... even so by the righteousness of one the free gift came upon all men unto justification of life* the same two-Adams architecture as *as in Adam all die, even so in Messiah all made alive* (1 Corinthians 15:22).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-as-in-adam-all-die-in-messiah-made-alive-the-firstfruits-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 7:29 — *my son Messiah (Christ) [shall] die, and all men that have life* the library''s universal death, then the raising; *as in Adam all die, even so in Messiah all made alive* (1 Corinthians 15:22).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-as-in-adam-all-die-in-messiah-made-alive-the-firstfruits-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-15-he-must-reign-till-all-enemies-under-his-feet-the-son-subject-psalm-110-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Sit thou at my right hand, until I make thine enemies thy footstool* the enthronement; *he must reign, till he hath put all enemies under his feet* (1 Corinthians 15:25).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-he-must-reign-till-all-enemies-under-his-feet-the-son-subject-psalm-110-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 8:6 — *thou hast put all things under his feet* the son of Adam''s dominion; *he hath put all things under his feet,* the Son then subject that *Elohim (God) may be all in all* (1 Corinthians 15:27-28).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-he-must-reign-till-all-enemies-under-his-feet-the-son-subject-psalm-110-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-15-let-us-eat-and-drink-for-to-morrow-we-die-isaiah-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 22:13 — *let us eat and drink; for to morrow we shall die* the despairing feast of the doomed city that looked not to its maker; *if the dead rise not? let us eat and drink; for to morrow we die* (1 Corinthians 15:32).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-let-us-eat-and-drink-for-to-morrow-we-die-isaiah-22'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-15-the-first-man-adam-and-the-last-adam-the-spiritual-body-genesis-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *man became a living soul* the verse Paul cites; *The first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-the-first-man-adam-and-the-last-adam-the-spiritual-body-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 2:23 — *Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* the destiny the resurrection restores; *it is raised in incorruption* (1 Corinthians 15:42).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-the-first-man-adam-and-the-last-adam-the-spiritual-body-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=42
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 3:1 — *the souls of the righteous are in the hand of Yahuah (God)... their hope is full of immortality* the seeming-death the sowing, immortality the raising; *sown in dishonour; raised in glory* (1 Corinthians 15:43).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-the-first-man-adam-and-the-last-adam-the-spiritual-body-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=42
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 7:32 — *the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence* the dust giving back the dead; *sown a natural body; raised a spiritual body* (1 Corinthians 15:44).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-the-first-man-adam-and-the-last-adam-the-spiritual-body-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=44
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *the great trumpet shall be blown, and they shall come which were ready to perish... and shall worship Yahuah (LORD) in the holy mount at Jerusalem* the trumpet of the ingathering; *at the last trump... the dead shall be raised* (1 Corinthians 15:52).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 4:16 — *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* the same sounding trumpet and raising; *at the last trump... the dead shall be raised incorruptible* (1 Corinthians 15:52).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 11:15 — *the seventh angel sounded... The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ)* the last of the trumpets, when the dead are judged (11:18); Paul''s *last trump* (1 Corinthians 15:52).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-15-death-swallowed-up-in-victory-o-death-where-is-thy-sting-isaiah-25-hosea-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears* the saying Paul cites; *Death is swallowed up in victory* (1 Corinthians 15:54).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-death-swallowed-up-in-victory-o-death-where-is-thy-sting-isaiah-25-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 13:14 — *I will ransom them from the power of the grave... O death, I will be thy plagues; O grave, I will be thy destruction* the ransom from the grave; *O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-death-swallowed-up-in-victory-o-death-where-is-thy-sting-isaiah-25-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 51:1 — *the earth also give back that which has been entrusted to it, And Sheol also shall give back* death and the grave forced to return the dead; *Death is swallowed up in victory* (1 Corinthians 15:54).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-death-swallowed-up-in-victory-o-death-where-is-thy-sting-isaiah-25-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=54
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 7:9 — *the King of the world shall raise us up, who have died for his laws, to everlasting life* the King who raises the faithful; *thanks be to Elohim (God), which giveth us the victory* (1 Corinthians 15:57).'
  FROM cross_reference_threads t, cross_references x, _s228_co15_lookup sv, _s228_co15_lookup tv
 WHERE t.slug='1-corinthians-15-death-swallowed-up-in-victory-o-death-where-is-thy-sting-isaiah-25-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=57
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
