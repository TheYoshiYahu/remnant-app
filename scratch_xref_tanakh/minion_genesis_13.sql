-- ----- fragment: minion_genesis_13.sql (Genesis 13) -----
-- Chapter: Genesis 13 (Abram comes up out of Egypt rich; the strife and the generous separation from Lot; Lot's choice by sight toward Sodom; the land-promise and the seed renewed; walk through the land; the altar at Mamre/Hebron)
-- Tag: ge13   Temp view: _s301_ge13_lookup
-- Sort band: base 20300, step 3 -> threads at 20300, 20303, 20306, 20309, 20312, 20315 (6 threads)
-- Source of EVERY row: 'canon','genesis',13,v
--
-- Genesis 13 coverage:
--   v.1-4 (Abram up out of Egypt very rich; back to Beth-el, to the place of the altar made at the first; there Abram called on the name of Yahuah)
--        NT:     none warranted distinct (the call-on-the-Name forward weave is the patriarchal worship at THREAD 6; the riches are narrative setup)
--        Extras: Jubilees 13:15 (returned to the place of the altar... called on the name of Yahuah: "You, the most high Elohim, are my Elohim for ever and ever") — THREAD 6
--        Tanakh: Genesis 12:8 (the same altar between Beth-el and Hai where he called on the name of Yahuah at the first); Genesis 4:26 (then began men to call upon the name of Yahuah) — THREAD 6
--   v.5-9 (the land could not bear them both; strife between the herdmen; Canaanite and Perizzite in the land; Abram: let there be no strife, we be brethren; is not the whole land before thee? — gives Lot first choice)
--        NT:     Romans 4:13 (the promise that he should be the HEIR OF THE WORLD — Abram can yield the choicest plain because the WHOLE land is already promised him by faith) — THREAD 1 (load-bearing for the framing of the generosity)
--        Extras: none warranted as distinct MEMBER (Jubilees 13:17-18 carries the parting at THREAD 2; the strife/peace-making itself has no clean distinct extras witness here)
--        Tanakh: none warranted distinct (the generosity is framed by the promise via Romans 4:13; no Tanakh lateral adds without dumping)
--   ★ v.10-13 (Lot lifted up his eyes, beheld all the plain of Jordan well watered, even as the garden of Yahuah, like the land of Egypt; chose the plain; pitched toward Sodom; the men of Sodom were wicked and sinners before Yahuah exceedingly)
--        NT:     2 Peter 2:7-8 (just Lot, vexed with the filthy conversation of the wicked; that righteous man vexed his righteous soul from day to day) — THREAD 2 (load-bearing); 2 Peter 2:6 (turning Sodom and Gomorrha into ashes, an ensample) — THREAD 2
--        Extras: Jubilees 13:17 (Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly) — THREAD 2
--        Tanakh: Genesis 19:24-25 (Yahuah rained upon Sodom and Gomorrah brimstone and fire... overthrew those cities, and all the plain) — THREAD 2 (the doom of the well-watered land Lot chose by sight)
--   ★★ v.14-15 (Yahuah to Abram after Lot was separated: lift up thine eyes... all the land which thou seest, to thee will I give it, and to thy seed FOR EVER)
--        NT:     Romans 4:13 (heir of the world); Romans 4:16-17 (the promise sure to ALL the seed... a father of many nations); Hebrews 11:8-10 (called to an inheritance, sojourned in the land of promise, looked for a CITY which hath foundations) — THREAD 3 (centerpiece)
--        Extras: Jubilees 13:20 (all the land which you see I shall give to you and to your seed for ever); Jasher 13:7 (this is the land which I gave to you and to your seed after you forever); Jasher 13:18 (to you and to your seed I will give this land for an inheritance) — THREAD 3
--        Tanakh: Genesis 12:7 (unto thy seed will I give this land); Genesis 15:18 (unto thy seed have I given this land); Genesis 17:8 (the land... for an everlasting possession) — THREAD 3
--   ★ v.16 (I will make thy seed AS THE DUST OF THE EARTH: so that if a man can number the dust... then shall thy seed also be numbered — innumerable)
--        NT:     Romans 4:18 (who against hope believed in hope, that he might become the father of many nations); Hebrews 11:12 (so many as the stars of the sky in multitude, and as the sand by the sea shore innumerable) — THREAD 4
--        Extras: Jubilees 13:20 (I shall make your seed as the sand of the sea: though a man may number the dust of the earth, yet your seed shall not be numbered) — THREAD 4 (note: SAME Jubilees verse anchors THREAD 3 and THREAD 4, distinct source verses 15 vs 16 — distinct cross_reference rows)
--        Tanakh: Genesis 15:5 (look toward heaven, tell the stars... so shall thy seed be); Genesis 22:17 (multiply thy seed as the stars of the heaven, and as the sand upon the sea shore) — THREAD 4
--   ★ v.17 (Arise, walk through the land in the length of it and in the breadth of it; for I will give it unto thee — possession by faith, the walking-out of the inheritance)
--        NT:     Hebrews 11:9 (he sojourned in the land of promise, as in a strange country, dwelling in tabernacles); Hebrews 11:13 (died in faith, not having received the promises, strangers and pilgrims on the earth); Hebrews 11:16 (they desire a better country... he hath prepared for them a city) — THREAD 5 (the "for ever" reaches past this life — the resurrection-hope)
--        Extras: Jubilees 13:20 (Arise, walk through the land in the length of it and the breadth of it... for to your seed shall I give it); Jasher 13:18-19 (walk before me and be perfect... and shall inherit it forever) — THREAD 5
--        Tanakh: none warranted distinct (the walk-by-faith forward weave is Hebrews 11; the land-grant lateral is carried at THREAD 3)
--   v.18 (Abram removed his tent, dwelt in the plain of Mamre, in Hebron, and built there an altar unto Yahuah)
--        NT:     none warranted (patriarchal worship; the city-looked-for forward weave is at THREAD 5)
--        Extras: Jubilees 13:4 (he built an altar there, and offered a burnt sacrifice to Yahuah, who had appeared to him); Jasher 13:28 (he there built an altar to Yahuah who appeared to him, which is still to this day in the plains of Mamre) — THREAD 6
--        Tanakh: Genesis 12:7-8 (the altars at Sichem and between Beth-el and Hai); Genesis 4:26 (men began to call upon the name of Yahuah) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. genesis-13-let-there-be-no-strife-abrams-generous-peace — NT (Romans) [free]
--   2. genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight — NT (2 Peter) + Tanakh (Genesis 19) + Extras (Jubilees) [extras]
--   3. genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed — NT (Romans, Hebrews) + Tanakh (Genesis) + Extras (Jubilees, Jasher) [extras] (CENTERPIECE)
--   4. genesis-13-thy-seed-as-the-dust-of-the-earth — NT (Romans, Hebrews) + Tanakh (Genesis) + Extras (Jubilees) [extras]
--   5. genesis-13-walk-through-the-land-possession-by-faith — NT (Hebrews) + Extras (Jubilees, Jasher) [extras]
--   6. genesis-13-the-altar-at-mamre-calling-on-the-name — Tanakh (Genesis) + Extras (Jubilees, Jasher) [extras]
--
-- Framing notes:
--   THREAD 1 — ABRAM'S GENEROUS PEACE (free): the elder yields the choice to the younger — *Is not the whole land
--   before thee? separate thyself, I pray thee, from me* (13:9). The generosity is NOT mere temperament: Abram can
--   surrender the choicest plain because *the promise, that he should be the heir of the world* (Romans 4:13) is
--   already his by faith — he holds the WHOLE land in promise, so he need not grasp a portion by sight. Walk-by-
--   promise frees the hand to give. (Kept tight: no TSK live-peaceably dump; the one load-bearing weave is the
--   heir-of-the-world logic that grounds the open hand.)
--   ★ THREAD 2 — THE CHOICE BY SIGHT (extras): *Lot lifted up his eyes, and beheld all the plain of Jordan, that
--   it was well watered every where... even as the garden of Yahuah, like the land of Egypt* (13:10) — Eden-like and
--   Egypt-like to the eye, yet *before Yahuah destroyed Sodom and Gomorrah*; the narrator already names the doom.
--   The contrast is walk-by-sight (Lot, *pitched his tent toward Sodom*, 13:12) vs walk-by-promise (Abram, lifting
--   his eyes only when Yahuah says lift them, 13:14). 2 Peter holds Lot as *just Lot, vexed* (2:7) — saved, but
--   vexed day by day in the land his eyes chose; Sodom *turned into ashes* an *ensample* (2:6); Genesis 19:24-25
--   the fire that fell. The well-watered-like-Eden-yet-doomed plain is the whole warning.
--   ★★ THREAD 3 — THE LAND AND THE SEED RENEWED (CENTERPIECE, extras): *all the land which thou seest, to thee
--   will I give it, and to thy seed FOR EVER* (13:15). The "for ever" is load-bearing — it reaches past this life:
--   Abram *looked for a city which hath foundations, whose builder and maker is Elohim* (Hebrews 11:10), the
--   everlasting inheritance held by RESURRECTION-hope, not by this lifetime's deed. Romans reads the grant as the
--   promise that Abram should be *the heir of the world* (4:13) and *a father of many nations* (4:17). Jubilees and
--   Jasher renew the same land-and-seed grant word for word. The land-FOREVER is possessed by faith now and in the
--   body raised.
--   ★ THREAD 4 — SEED AS THE DUST OF THE EARTH (extras): *I will make thy seed as the dust of the earth* (13:16) —
--   the FIRST of the great innumerability figures, paired with the seed-as-STARS of Genesis 15:5 and 22:17 and the
--   sand of the sea. Romans 4:18 — *who against hope believed in hope, that he might become the father of many
--   nations* — and Hebrews 11:12 — *so many as the stars of the sky in multitude, and as the sand which is by the
--   sea shore innumerable* — gather dust, stars, and sand into the one promised multitude of the seed. (NOTE: the
--   single Jubilees 13:20 verse legitimately anchors BOTH this thread and THREAD 3 — distinct SOURCE verses, 13:15
--   land vs 13:16 dust — so they are two distinct cross_reference rows, not a double-write collision.)
--   ★ THREAD 5 — WALK THROUGH THE LAND, POSSESSION BY FAITH (extras): *Arise, walk through the land in the length
--   of it and in the breadth of it; for I will give it unto thee* (13:17). Abram walks the land he does not yet
--   hold by deed — possession by faith. Hebrews 11 reads the whole patriarchal walk: he *sojourned in the land of
--   promise, as in a strange country* (11:9), *died in faith, not having received the promises... strangers and
--   pilgrims on the earth* (11:13), desiring *a better country, that is, an heavenly* (11:16). The walking is the
--   inheriting-in-hope.
--   THREAD 6 — THE ALTAR AT MAMRE, CALLING ON THE NAME (extras): *there Abram called on the name of Yahuah* (13:4);
--   *built there an altar unto Yahuah* (13:18) — the patriarchal worship that began when *men began to call upon
--   the name of Yahuah* (Genesis 4:26) and ran through Abram's altars (Genesis 12:7-8). Jubilees and Jasher remember
--   the altars and the confession: *"You, the eternal Elohim, are my Elohim"* (Jubilees 13:7).
--   PARSE/TRAP NOTES: Jubilees double-written 'jubilees','jubilees'; Jasher double-written 'jasher','jasher' (every
--   VALUES row 10 cols). Jasher's Abram/Lot land material is in JASHER 13 (the call, the land-grant, the altars at
--   Mamre, seed-as-stars) — JASHER 14 is the Rikayon/Egyptian-tax tale, UNRELATED, so it is NOT pulled. Jubilees 13
--   is clean for the verses used (v.4, 7, 15, 17, 20); v.2-3 run together in the parse but v.20 carries the land/
--   seed/walk grant cleanly at its front clause.

CREATE TEMP VIEW _s301_ge13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: let there be no strife — Abram's generous peace
    ('canon','genesis',13,9,'canon','romans',4,13,'free',
      E'*For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith* (Romans 4:13). When Abram says *Is not the whole land before thee? separate thyself, I pray thee, from me: if thou wilt take the left hand, then I will go to the right* (Genesis 13:9), he gives away the choicest plain without grasping — because the WHOLE land is already his by promise. The open hand is the fruit of walking by the promise, not by sight: a man who is *heir of the world* by faith need not seize a portion by his own eyes.'),
    -- THREAD 2: Lot lifted up his eyes — the choice by sight
    ('canon','genesis',13,10,'canon','2-peter',2,8,'extras',
      E'*(For that righteous man dwelling among them, in seeing and hearing, vexed his righteous soul from day to day with their unlawful deeds;)* (2 Peter 2:8). Lot *lifted up his eyes, and beheld all the plain of Jordan, that it was well watered every where... even as the garden of Yahuah (LORD), like the land of Egypt* (Genesis 13:10) — Eden-like and Egypt-like to the eye, and he chose it. The end of the choice-by-sight is a righteous soul vexed *from day to day* in the city his eyes desired; what looked like the garden becomes the daily grief of the just man.'),
    ('canon','genesis',13,12,'canon','2-peter',2,7,'extras',
      E'*And delivered just Lot, vexed with the filthy conversation of the wicked* (2 Peter 2:7). *Lot dwelled in the cities of the plain, and pitched his tent toward Sodom* (Genesis 13:12) — the tent turned by inches toward the wicked city. Scripture still calls him *just Lot*: saved, yet vexed, the believer who chose his dwelling by sight and paid for it in vexation, drawn out at the last only by mercy.'),
    ('canon','genesis',13,13,'canon','2-peter',2,6,'extras',
      E'*And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly* (2 Peter 2:6). The narrator marks the plain Lot chose: *But the men of Sodom were wicked and sinners before Yahuah (LORD) exceedingly* (Genesis 13:13). The well-watered land was already under sentence; its end is *ashes* set up as an *ensample* — the warning written into the very ground Lot beheld.'),
    ('canon','genesis',13,10,'canon','genesis',19,24,'free',
      E'*Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24). The plain was *well watered every where... even as the garden of Yahuah (LORD)* — *before Yahuah (LORD) destroyed Sodom and Gomorrah* (Genesis 13:10); the narrator names the doom in the same breath as the beauty. The garden-to-the-eye becomes fire-from-heaven: the choice by sight chose a land already marked for the overthrow.'),
    ('canon','genesis',13,13,'jubilees','jubilees',13,17,'extras',
      E'*And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17). The restored witness tells the same parting and the same indictment as *the men of Sodom were wicked and sinners before Yahuah (LORD) exceedingly* (Genesis 13:13) — Lot lodged among a people Yahuah had already weighed and found *sinners exceedingly*.'),
    -- THREAD 3 (CENTERPIECE): to thee and to thy seed for ever — the land renewed
    ('canon','genesis',13,15,'canon','romans',4,13,'free',
      E'*For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith* (Romans 4:13). *All the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15) — Romans reads the land-grant as nothing less than the world inherited, and inherited *through the righteousness of faith*. The seest-it-all-given becomes heir-of-the-world: the promise opens past one plot to the whole earth held by the faith of Abram and his seed.'),
    ('canon','genesis',13,15,'canon','romans',4,17,'free',
      E'*(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17). The land given *to thy seed for ever* (Genesis 13:15) is a promise made before the seed exists — and Elohim *calleth those things which be not as though they were*. The everlasting grant rests on the Elohim *who quickeneth the dead*: a forever-inheritance can only be kept by the One who raises the dead to hold it.'),
    ('canon','genesis',13,15,'canon','hebrews',11,10,'free',
      E'*For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). When Yahuah says *to thy seed for ever* (Genesis 13:15), the *for ever* reaches past Abram''s lifetime and past this age: he held the land-promise by looking for *a city which hath foundations*, the everlasting inheritance secured by resurrection-hope, not by a deed signed in his own years. The land FOREVER is possessed by faith now and in the body raised.'),
    ('canon','genesis',13,15,'canon','genesis',12,7,'free',
      E'*And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). The grant first spoken at the entrance to Canaan is now renewed after Lot departs: *all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15). The same word — *unto thy seed... this land* — said again and enlarged with *for ever*: the promise does not move, it deepens.'),
    ('canon','genesis',13,15,'canon','genesis',15,18,'free',
      E'*In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). What is promised in Genesis 13:15 — *to thee will I give it, and to thy seed for ever* — is cut into covenant two chapters on, the boundaries named, the gift sworn. The renewed land-word here is the seed of the sworn covenant there.'),
    ('canon','genesis',13,15,'canon','genesis',17,8,'free',
      E'*And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God)* (Genesis 17:8). The *for ever* of Genesis 13:15 is spelled out as *an everlasting possession* — and bound to the covenant bond *I will be their Elohim*. The land-forever and the Elohim-forever are one promise: the inheritance is held in the One who gives it.'),
    ('canon','genesis',13,15,'jubilees','jubilees',13,20,'extras',
      E'*For all the land which you see I shall give to you and to your seed for ever, and I shall make your seed as the sand of the sea* (Jubilees 13:20). The restored witness renews the land-grant word for word with *all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15) — the same *all the land which you see*, the same *to your seed for ever*. The forever-inheritance stands in both the canon and the witness.'),
    ('canon','genesis',13,15,'jasher','jasher',13,7,'extras',
      E'*This is the land which I gave to you and to your seed after you forever, and I will make your seed like the stars of heaven, and I will give to your seed for an inheritance all the lands which you see* (Jasher 13:7). Jasher renews the same grant as *all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15) — the land *which you see* given *to your seed after you forever*, joined to the seed-as-stars that Genesis 15 will speak.'),
    ('canon','genesis',13,14,'canon','hebrews',11,8,'free',
      E'*By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8). When Yahuah says *Lift up now thine eyes, and look from the place where thou art northward, and southward, and eastward, and westward* (Genesis 13:14), Abram looks on the inheritance he was called to but does not yet hold. Hebrews names the posture: an inheritance received by faith, walked toward in obedience before it is possessed by hand.'),
    -- THREAD 4: thy seed as the dust of the earth
    ('canon','genesis',13,16,'canon','genesis',15,5,'free',
      E'*And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5). The dust-figure of *I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16) is matched by the star-figure: dust below, stars above, both past counting. The innumerable seed is promised first as the dust, then as the stars.'),
    ('canon','genesis',13,16,'canon','genesis',22,17,'free',
      E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies* (Genesis 22:17). The dust of *as the dust of the earth... then shall thy seed also be numbered* (Genesis 13:16) is gathered with the stars of heaven and the sand of the sea — three figures of one innumerable seed, here sworn by oath after the binding of Isaac.'),
    ('canon','genesis',13,16,'canon','romans',4,18,'free',
      E'*Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be* (Romans 4:18). The promise *I will make thy seed as the dust of the earth... then shall thy seed also be numbered* (Genesis 13:16) is the very *so shall thy seed be* Abram believed *against hope* — childless, yet trusting the One who counts a seed as numberless as dust. The faith that took the dust-promise is the faith counted for righteousness.'),
    ('canon','genesis',13,16,'canon','hebrews',11,12,'free',
      E'*Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). The dust-promise of Genesis 13:16 — *so that if a man can number the dust of the earth, then shall thy seed also be numbered* — comes true *of one, and him as good as dead*: the innumerable seed, *stars... and... sand... innumerable*, sprung from the one man who believed the dust could not be counted.'),
    ('canon','genesis',13,16,'jubilees','jubilees',13,20,'extras',
      E'*I shall make your seed as the sand of the sea: though a man may number the dust of the earth, yet your seed shall not be numbered* (Jubilees 13:20). The restored witness carries the same innumerable-seed word as *I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16) — *though a man may number the dust... yet your seed shall not be numbered*. The seed past counting stands in canon and witness alike.'),
    -- THREAD 5: walk through the land — possession by faith
    ('canon','genesis',13,17,'canon','hebrews',11,9,'extras',
      E'*By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9). *Arise, walk through the land in the length of it and in the breadth of it; for I will give it unto thee* (Genesis 13:17) — Abram is told to walk a land he will hold only by promise; Hebrews names the walk a SOJOURN *as in a strange country*, dwelling in tents in the very land deeded to his seed. The walking-through is the possessing-in-hope.'),
    ('canon','genesis',13,17,'canon','hebrews',11,13,'extras',
      E'*These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). Abram walks *the length of it and... the breadth of it* (Genesis 13:17) and yet dies *not having received the promises* — he possesses by faith, *strangers and pilgrims on the earth*, the land seen *afar off* and embraced. The walk measures an inheritance held in hope past this life.'),
    ('canon','genesis',13,17,'canon','hebrews',11,16,'extras',
      E'*But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). The land Abram walks at *Arise, walk through the land... for I will give it unto thee* (Genesis 13:17) opens onto *a better country, that is, an heavenly* — the *for ever* of the grant reaching to the prepared *city*. The walking-out of the land is the first step of an inheritance kept in the resurrection.'),
    ('canon','genesis',13,17,'jubilees','jubilees',13,20,'extras',
      E'*Arise, walk (through the land) in the length of it and the breadth of it, and see it all; for to your seed shall I give it* (Jubilees 13:20). The restored witness gives the same command as *Arise, walk through the land in the length of it and in the breadth of it; for I will give it unto thee* (Genesis 13:17) — the land walked in *the length... and the breadth*, given to the seed. The possession-by-walking stands in both.'),
    ('canon','genesis',13,17,'jasher','jasher',13,18,'extras',
      E'*Now therefore walk before me and be perfect and keep my commands, for to you and to your seed I will give this land for an inheritance, from the river Mitzraim to the great river Euphrates* (Jasher 13:18). Jasher binds the walk of *Arise, walk through the land... for I will give it unto thee* (Genesis 13:17) to covenant-walk: *walk before me and be perfect and keep my commands* — the land-inheritance and the keeping of the commands are one path. The walking is faith-and-obedience together, never one without the other.'),
    -- THREAD 6: the altar at Mamre — calling on the name
    ('canon','genesis',13,4,'canon','genesis',4,26,'free',
      E'*And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). When *Abram called on the name of Yahuah (LORD)* (Genesis 13:4) at the altar he had made at the first, he keeps the worship that began in the line of Seth — *then began men to call upon the name of Yahuah*. The patriarchal altar is the old true worship carried down the seed-line of promise.'),
    ('canon','genesis',13,4,'canon','genesis',12,8,'free',
      E'*And he removed from thence unto a mountain on the east of Beth-el, and pitched his tent, having Beth-el on the west, and Hai on the east: and there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* (Genesis 12:8). Abram returns *unto the place of the altar, which he had made there at the first: and there Abram called on the name of Yahuah (LORD)* (Genesis 13:4) — the very altar between Beth-el and Hai. He comes back from Egypt to the place of worship he had left, and calls on the Name again.'),
    ('canon','genesis',13,18,'canon','genesis',12,7,'free',
      E'*And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). At Mamre Abram *built there an altar unto Yahuah (LORD)* (Genesis 13:18), as he did at Sichem when the land was first promised. Each renewal of the land-word is answered with an altar: the promise heard, the worship raised, the Name confessed in the land of the promise.'),
    ('canon','genesis',13,4,'jubilees','jubilees',13,15,'extras',
      E'*he journeyed to the place where he had pitched his tent at the beginning, to the place of the altar... and called on the name of Yahuah (God), and said: "You, the most high Elohim (God), are my Elohim (God) for ever and ever."* (Jubilees 13:15). The restored witness fills the confession behind *there Abram called on the name of Yahuah (LORD)* (Genesis 13:4): returning to the first altar, he names Yahuah his Elohim *for ever and ever* — the calling-on-the-Name is a covenant confession, not a bare invocation.'),
    ('canon','genesis',13,18,'jubilees','jubilees',13,4,'extras',
      E'*And he built an altar there, and he offered thereon a burnt sacrifice to Yahuah (God), who had appeared to him* (Jubilees 13:4). The same altar-building as *built there an altar unto Yahuah (LORD)* (Genesis 13:18) is remembered with the sacrifice and the reason — *to Yahuah, who had appeared to him*. The altar answers the appearing: Yahuah shows Himself, Abram builds and offers.'),
    ('canon','genesis',13,18,'jasher','jasher',13,28,'extras',
      E'*And Yahuah (the Lord) again appeared to Abram and said, To your seed will I give this land; and he there built an altar to Yahuah (the Lord) who appeared to him, which is still to this day in the plains of Mamre* (Jasher 13:28). Jasher names the very place of *dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD)* (Genesis 13:18) — *an altar... in the plains of Mamre*, raised when Yahuah appeared and renewed *to your seed will I give this land*. The altar at Mamre marks the land-promise renewed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-let-there-be-no-strife-abrams-generous-peace',
       E'Let there be no strife — Abram''s generous peace',
       E'The land cannot hold both households: *the land was not able to bear them, that they might dwell together: for their substance was great* (Genesis 13:6), and *there was a strife between the herdmen of Abram''s cattle and the herdmen of Lot''s cattle* (Genesis 13:7). The elder, who holds the promise, refuses to contend: *Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren* (Genesis 13:8). Then he gives the choice away — *Is not the whole land before thee? separate thyself, I pray thee, from me: if thou wilt take the left hand, then I will go to the right; or if thou depart to the right hand, then I will go to the left* (Genesis 13:9). This open hand is not mere mildness; it is the fruit of faith. *For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith* (Romans 4:13). Abram can surrender the choicest plain because the WHOLE land is already his by promise — a man who is heir of the world by faith need not grasp a portion by sight. Walk-by-promise frees the hand to give.',
       sv.verse_id, ev.verse_id, 'free', 20300
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight',
       E'Lot lifted up his eyes — the choice by sight',
       E'Where Abram waits on the promise, Lot chooses by his eyes: *And Lot lifted up his eyes, and beheld all the plain of Jordan, that it was well watered every where, before Yahuah (LORD) destroyed Sodom and Gomorrah, even as the garden of Yahuah (LORD), like the land of Egypt* (Genesis 13:10). Eden-like and Egypt-like to the eye — and in the same breath the narrator names the doom: *before Yahuah destroyed Sodom and Gomorrah*. He *chose him all the plain of Jordan* (Genesis 13:11) and *pitched his tent toward Sodom* (Genesis 13:12), the tent turned by inches toward the wicked city — *But the men of Sodom were wicked and sinners before Yahuah (LORD) exceedingly* (Genesis 13:13). The restored witness tells it the same: *Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17). The end of the choice-by-sight is written ahead. Scripture still calls him *just Lot, vexed with the filthy conversation of the wicked* (2 Peter 2:7) — saved, yet *that righteous man dwelling among them, in seeing and hearing, vexed his righteous soul from day to day with their unlawful deeds* (2 Peter 2:8). And the land itself is *turned into ashes... an ensample unto those that after should live ungodly* (2 Peter 2:6), for *Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24). Well-watered like Eden, yet doomed: the warning is in the very ground his eyes desired.',
       sv.verse_id, ev.verse_id, 'extras', 20303
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed',
       E'To thee and to thy seed for ever — the land renewed',
       E'After Lot is gone, Yahuah lifts Abram''s eyes — not by his own choosing now, but at the word: *And Yahuah (LORD) said unto Abram, after that Lot was separated from him, Lift up now thine eyes, and look from the place where thou art northward, and southward, and eastward, and westward* (Genesis 13:14). Then the grant: *For all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15). It is the word first spoken at the entrance to Canaan — *Unto thy seed will I give this land* (Genesis 12:7) — now renewed and enlarged with *for ever*, and cut into covenant two chapters on: *Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18); *all the land of Canaan, for an everlasting possession; and I will be their Elohim (God)* (Genesis 17:8). The restored witnesses renew it word for word: *all the land which you see I shall give to you and to your seed for ever* (Jubilees 13:20); *this is the land which I gave to you and to your seed after you forever* (Jasher 13:7). Now hear how far the *for ever* reaches. Romans reads the grant as *the promise, that he should be the heir of the world... through the righteousness of faith* (Romans 4:13), a promise to one *who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17) — for a forever-inheritance can only be kept by the One who raises the dead to hold it. And Abram knew it: *he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10), for *by faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed* (Hebrews 11:8). The *for ever* of Genesis 13:15 does not stop at this lifetime or this age — it is the everlasting land held by resurrection-hope, possessed by faith now and in the body raised.',
       sv.verse_id, ev.verse_id, 'extras', 20306
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-thy-seed-as-the-dust-of-the-earth',
       E'Thy seed as the dust of the earth',
       E'With the land comes the seed, and the seed is past counting: *And I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16). This is the FIRST of the great innumerability figures, and the others answer it. Yahuah will bring Abram out under the night and say *Look now toward heaven, and tell the stars, if thou be able to number them... So shall thy seed be* (Genesis 15:5); and after the binding of Isaac He swears *I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17). Dust of the earth, stars of heaven, sand of the sea — three figures of one numberless seed. The restored witness joins them: *I shall make your seed as the sand of the sea: though a man may number the dust of the earth, yet your seed shall not be numbered* (Jubilees 13:20). And this is the very promise Abram believed against all sight: *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be* (Romans 4:18). It came true from one as good as dead: *Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). The dust-promise, taken by faith, became the innumerable seed.',
       sv.verse_id, ev.verse_id, 'extras', 20309
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-walk-through-the-land-possession-by-faith',
       E'Walk through the land — possession by faith',
       E'The grant ends with a command to walk: *Arise, walk through the land in the length of it and in the breadth of it; for I will give it unto thee* (Genesis 13:17). Abram is told to walk a land he holds only by promise — to measure with his feet an inheritance no deed has yet given him. This is possession by faith, and Hebrews reads the whole patriarchal walk by it: *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9). He walked it and dwelt in tents in it and yet *died in faith, not having received the promises, but having seen them afar off... and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). The walking measures an inheritance held in hope past this life: *they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). The restored witnesses give the same command, and Jasher binds it to covenant-walk: *Arise, walk (through the land) in the length of it and the breadth of it... for to your seed shall I give it* (Jubilees 13:20); *Now therefore walk before me and be perfect and keep my commands, for to you and to your seed I will give this land for an inheritance* (Jasher 13:18). To walk the land is to walk before Yahuah in faith and obedience together — the inheriting-in-hope is never the keeping-of-commands set aside, but the two as one path.',
       sv.verse_id, ev.verse_id, 'extras', 20312
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-the-altar-at-mamre-calling-on-the-name',
       E'The altar at Mamre — calling on the name',
       E'The chapter is framed by worship. Coming up from Egypt, Abram returns *unto the place of the altar, which he had made there at the first: and there Abram called on the name of Yahuah (LORD)* (Genesis 13:4) — the very altar between Beth-el and Hai where *he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* (Genesis 12:8). And at the chapter''s close, with the land renewed, *Abram removed his tent, and came and dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD)* (Genesis 13:18). This is the old true worship of the seed-line: *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26), carried down through Abram''s altars, each one answering an appearing of Yahuah — *Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). The restored witnesses remember the altars and fill in the confession: *he built an altar there, and he offered thereon a burnt sacrifice to Yahuah (God), who had appeared to him* (Jubilees 13:4); returning to the first altar he *called on the name of Yahuah (God), and said: "You, the most high Elohim (God), are my Elohim (God) for ever and ever"* (Jubilees 13:15); and Jasher names the place — *he there built an altar to Yahuah (the Lord) who appeared to him, which is still to this day in the plains of Mamre* (Jasher 13:28). The calling-on-the-Name is no bare invocation but a covenant confession: Yahuah appears, renews the land, and Abram raises an altar and names Him his Elohim for ever.',
       sv.verse_id, ev.verse_id, 'extras', 20315
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the promise, that he should be the heir of the world... through the righteousness of faith* (Romans 4:13) — Abram yields the choicest plain (*separate thyself, I pray thee, from me*, 13:9) because the WHOLE land is already his by faith.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-let-there-be-no-strife-abrams-generous-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*that righteous man... vexed his righteous soul from day to day* (2 Peter 2:8) — the end of Lot''s choice-by-sight (*beheld all the plain of Jordan... even as the garden of Yahuah*, 13:10) is a soul vexed daily in the land his eyes desired.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And delivered just Lot, vexed with the filthy conversation of the wicked* (2 Peter 2:7) — saved yet vexed, the believer who *pitched his tent toward Sodom* (13:12) by sight.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*turning the cities of Sodom and Gomorrha into ashes... an ensample* (2 Peter 2:6) — the plain of *the men of Sodom were wicked and sinners before Yahuah exceedingly* (13:13) was already under sentence.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Then Yahuah rained upon Sodom and upon Gomorrah brimstone and fire* (Genesis 19:24) — the doom named in the same breath as the beauty (*well watered... before Yahuah destroyed Sodom and Gomorrah*, 13:10) falls on the land chosen by sight.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17) — the restored witness names the same parting and indictment as *the men of Sodom were wicked and sinners before Yahuah exceedingly* (13:13).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed* (Hebrews 11:8) — Abram looks where Yahuah says *Lift up now thine eyes... northward, and southward, and eastward, and westward* (13:14) upon an inheritance held by faith.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Unto thy seed will I give this land: and there builded he an altar* (Genesis 12:7) — the grant first spoken at the entrance to Canaan, now renewed and enlarged with *for ever* (13:15).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Unto thy seed have I given this land, from the river of Egypt unto the great river* (Genesis 15:18) — the *to thy seed for ever* of 13:15 cut into sworn covenant, the boundaries named.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*all the land of Canaan, for an everlasting possession; and I will be their Elohim* (Genesis 17:8) — the *for ever* of 13:15 spelled out as an everlasting possession bound to the covenant bond.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the promise, that he should be the heir of the world... through the righteousness of faith* (Romans 4:13) — the land-grant of 13:15 read as nothing less than the world inherited by faith.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Elohim, who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17) — the *for ever* grant rests on the One who raises the dead to keep it.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*he looked for a city which hath foundations, whose builder and maker is Elohim* (Hebrews 11:10) — the *for ever* of 13:15 reaches past this life to the everlasting city, held by resurrection-hope.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*all the land which you see I shall give to you and to your seed for ever* (Jubilees 13:20) — the restored witness renews *to thy seed for ever* (13:15) word for word.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*This is the land which I gave to you and to your seed after you forever* (Jasher 13:7) — Jasher renews the same grant, the land *which you see* given *to your seed after you forever*.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Look now toward heaven, and tell the stars... So shall thy seed be* (Genesis 15:5) — the dust-figure of 13:16 matched by the star-figure, both past counting.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17) — dust, stars, and sand gathered as one innumerable seed, sworn by oath after the binding of Isaac.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Who against hope believed in hope... So shall thy seed be* (Romans 4:18) — the dust-promise of 13:16 is the very word Abram believed against all sight.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12) — the dust-promise of 13:16 come true from one as good as dead.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*though a man may number the dust of the earth, yet your seed shall not be numbered* (Jubilees 13:20) — the restored witness carries the same innumerable-seed word as 13:16 (distinct row from THREAD 3: source 13:16, not 13:15).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles* (Hebrews 11:9) — Abram walks (*walk through the land in the length of it and in the breadth of it*, 13:17) a land held only by promise.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*These all died in faith, not having received the promises... strangers and pilgrims on the earth* (Hebrews 11:13) — the walk of 13:17 measures an inheritance held in hope past this life.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they desire a better country, that is, an heavenly... he hath prepared for them a city* (Hebrews 11:16) — the walked land of 13:17 opens onto the heavenly country, the *for ever* reaching to the prepared city.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Arise, walk (through the land) in the length of it and the breadth of it... for to your seed shall I give it* (Jubilees 13:20) — the restored witness gives the same possession-by-walking command as 13:17.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*walk before me and be perfect and keep my commands, for to you and to your seed I will give this land for an inheritance* (Jasher 13:18) — Jasher binds the walk of 13:17 to covenant-walk: faith and obedience as one path, never commands set aside.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*then began men to call upon the name of Yahuah* (Genesis 4:26) — Abram''s *called on the name of Yahuah* (13:4) keeps the worship begun in the line of Seth.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*there he builded an altar unto Yahuah, and called upon the name of Yahuah* (Genesis 12:8) — the very altar between Beth-el and Hai Abram returns to at 13:4.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Unto thy seed will I give this land: and there builded he an altar unto Yahuah, who appeared unto him* (Genesis 12:7) — at Mamre Abram builds an altar (13:18) as at Sichem; each renewed land-word answered by worship.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*called on the name of Yahuah... "You, the most high Elohim, are my Elohim for ever and ever"* (Jubilees 13:15) — the restored witness fills the covenant confession behind *Abram called on the name of Yahuah* (13:4).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he built an altar there, and he offered thereon a burnt sacrifice to Yahuah, who had appeared to him* (Jubilees 13:4) — the same altar-building as *built there an altar unto Yahuah* (13:18), the altar answering the appearing.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*he there built an altar to Yahuah who appeared to him, which is still to this day in the plains of Mamre* (Jasher 13:28) — Jasher names the very place of *dwelt in the plain of Mamre... and built there an altar* (13:18).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
