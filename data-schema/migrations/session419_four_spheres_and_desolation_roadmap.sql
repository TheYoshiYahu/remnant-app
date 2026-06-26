-- ---------------------------------------------------------------------
-- Session 419 — (1) Extend the Romans 11 "fulness of the nations" kingdom
--               card with the FOUR SPHERES (the seed revealed, not
--               foreigners helped); (2) add the DESOLATION ROADMAP kingdom
--               card on Luke 21:24, with the counterfeit-within folded in;
--               (3) cross-refs, hinged on the twin phrase
--               Luke 21:24 (times of the Gentiles fulfilled)
--               <-> Romans 11:25 (fulness of the Gentiles come in).
-- ---------------------------------------------------------------------
-- Decisions locked with Yoshi 2026-06-26 (session419 open):
--   * NO individual-mercy cases. The woman of Canaan, Naaman, the widow of
--     Tsarephath, and the centurion are SEED REVEALED in four spheres, not
--     foreigners shown mercy. The Romans 11 card is extended to say so.
--   * Two linked cards (not one): the gathering card (strand 'gathering')
--     extended; a new desolation card (strand 'kingdom') created.
--   * The desolation chain stays Luke 21 <-> Ezek 33, Ezek 9, Zech 13-14,
--     with the Ezek 33 anchor extended to 33:28-29. NO Daniel 9, NO Deut 28.
--   * The counterfeit-within (real Canaanite converts barred, Deut 23:3 /
--     Ezek 44:9; tares sown in, Matthew 13:38-39 / Eli's sons, 1 Sam 2:12)
--     folds into the desolation card (Ezek 9:6 'begin at my sanctuary').
--
-- Idempotent: kingdom_verses upserts ON CONFLICT (verse_id); cross_references
-- guarded with WHERE NOT EXISTS. strand 'kingdom' is in the schema CHECK set.
--
-- NOTE for review: the desolation card attaches to Luke 21:24 only. If Luke
-- 21:24 already carries a kingdom card, the ON CONFLICT upsert will REPLACE
-- it -- confirm 21:24 is clear before running (or widen/narrow as desired).
--
-- Run: python3 api/apply_migration.py data-schema/migrations/session419_four_spheres_and_desolation_roadmap.sql
-- ---------------------------------------------------------------------

BEGIN;

-- =====================================================================
-- 1. Romans 11:13/14/15/25 — EXTEND the existing fulness-of-the-nations
--    card with the four spheres. The full card_md is reproduced (the
--    session418 body) and the four-spheres section is appended, so the
--    ON CONFLICT upsert keeps everything and adds the new reading.
-- =====================================================================
WITH card AS (
    SELECT
        'The First Redeeming and the Fulness of the Nations'::TEXT AS card_title,
        $card$*The Angel which redeemed me from all evil, bless the lads; and let my name be named on them, and the name of my fathers Abraham and Isaac; and let them grow into a multitude in the midst of the earth.* (Genesis 48:16)

*And his father refused, and said, I know it, my son, I know it: he also shall become a people, and he also shall be great: but truly his younger brother shall be greater than he, and his seed shall become a multitude of nations.* (Genesis 48:19)

*For I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Yashar'el (Israel), until the fulness of the Gentiles be come in.* (Romans 11:25)

*And so all Yashar'el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob:* (Romans 11:26)

The first time scripture says redeemed, Jacob is speaking, and his hands are on Joseph's sons: bless the lads — let my name be named on them, and let them grow into a multitude in the midst of the earth. The blessing's destination is named a moment later: Ephraim's seed shall become a multitude of nations. Paul's mystery turns on that very phrase — blindness in part, until the fulness of the nations be come in: until Ephraim's promised multitude, grown wild among the peoples, comes home. And so all Yashar'el (Israel) shall be saved: the first redeeming word in the book and the final gathering are one blessing.

And Paul tells you plainly who that multitude is. A few verses earlier he names his own audience:

*For I speak to you Gentiles, inasmuch as I am the apostle of the Gentiles, I magnify mine office: If by any means I may provoke to emulation them which are my flesh, and might save some of them. For if the casting away of them be the reconciling of the world, what shall the receiving of them be, but life from the dead?* (Romans 11:13-15)

The Gentiles he is apostle to, he calls *them which are my flesh* — his own kinsmen. They are defined by their *casting away*, and the gospel is their *receiving* back, which he names *life from the dead*. Jeremiah had already traced the whole arc:

*Therefore will I cast you out of this land into a land that ye know not, neither ye nor your fathers; and there shall ye serve other gods day and night; where I will not shew you favour.* (Jeremiah 16:13)

*But, Yahuah (LORD) liveth, that brought up the children of Yashar'el (Israel) from the land of the north, and from all the lands whither he had driven them: and I will bring them again into their land that I gave unto their fathers.* (Jeremiah 16:15)

*Behold, I will send for many fishers, saith Yahuah (LORD), and they shall fish them; and after will I send for many hunters, and they shall hunt them from every mountain, and from every hill, and out of the holes of the rocks.* (Jeremiah 16:16)

*And he saith unto them, Follow me, and I will make you fishers of men.* (Matthew 4:19)

When Yahusha (Jesus) made fishermen into fishers of men, he was not coining a fond image — he was quoting Jeremiah, the fishers Yahuah promised to send to gather the cast-away house from the land of the north. Paul's apostleship to the Gentiles is that fishing. The casting away of his flesh was the reconciling of the world; their receiving back is life from the dead. The fulness of the Gentiles coming in (v.25) is the receiving of them (v.15): the cast-away seed of Ephraim, fished home.

And the Shepherd went after that seed wherever the scattering had carried it — and when he reached one of them, he named who she was. To the woman whose daughter was vexed, the one Mark calls a Greek and a Syrophoenician, the one Matthew calls a woman of Canaan, he said the thing that tells you everything:

*But he answered and said, I am not sent but unto the lost sheep of the house of Yashar'el (Israel).* (Matthew 15:24)

He was not sent but to the lost sheep — and then he healed her daughter. She is one of them. The three names on her are three names for one place: the merchant coast of Tyre and Sidon. The word *Canaanite* itself — kena'ani — is the Hebrew for a merchant, the name of the trafficking coast; and that coast is where the divorced house of the north was swallowed up among the nations:

*Israel is swallowed up: now shall they be among the Gentiles as a vessel wherein is no pleasure.* (Hosea 8:8)

Every name on her marks the ground of her exile, not a verdict on her blood. She is a daughter of the divorced house, dispersed into Canaan and called by the coast she was scattered to — a lost sheep, not a stranger let in. The seed of promise is found in four spheres, and the same Shepherd sought it in every one. In the assembly and the land — the returned house of Yahudah (Judah). In the lands the land was set against — Naaman the Syrian, who already had a captive daughter of Yashar'el (Israel) in his house, and who came up out of the water confessing:

*Behold, now I know that there is no Elohim (God) in all the earth, but in Yashar'el (Israel).* (2 Kings 5:15)

Scattered abroad — the widow *which belongeth to Zidon* (1 Kings 17:9), and the woman of the Canaan coast. And in rulership under Rome — the centurion, of whom he said:

*When Yahusha (Jesus) heard it, he marvelled, and said to them that followed, Verily I say unto you, I have not found so great faith, no, not in Yashar'el (Israel).* (Matthew 8:10)

Then he named the whole gathering in a single breath — the seed come home from every sphere, and the visible house that would not hear, cast out:

*And I say unto you, That many shall come from the east and west, and shall sit down with Abraham, and Isaac, and Jacob, in the kingdom of heaven. But the children of the kingdom shall be cast out into outer darkness: there shall be weeping and gnashing of teeth.* (Matthew 8:11-12)

Many, from the east and the west, sat down with the fathers — the scattered seed gathered home from every land the exile drove them to. The fulness of the Gentiles is not strangers admitted to the covenant. It is the lost sheep of the house of Yashar'el (Israel), found in every sphere of the scattering, sat down at last with Abraham, Isaac, and Jacob.$card$::TEXT AS card_md,
        '{"Genesis 48:16","Genesis 48:19","Romans 11:13-15","Romans 11:25","Jeremiah 16:13-16","Matthew 4:19","Matthew 15:24","Hosea 8:8","2 Kings 5:15","1 Kings 17:9","Matthew 8:10","Matthew 8:11-12"}'::TEXT[] AS anchor_refs
),
verselist AS (
    SELECT v.id AS verse_id
    FROM verses v
    JOIN chapters c ON c.id = v.chapter_id
    JOIN books b ON b.id = c.book_id
    JOIN editions e ON e.id = b.edition_id
    WHERE e.slug = 'canon' AND b.slug = 'romans' AND c.chapter_number = 11
      AND v.verse_number IN (13, 14, 15, 25)
)
INSERT INTO kingdom_verses (verse_id, strand, strand_label, card_title, card_md, anchor_refs, tier_required, last_reviewed_at)
SELECT vl.verse_id, 'gathering', 'The gathering', card.card_title, card.card_md, card.anchor_refs, 'free', NOW()
FROM verselist vl CROSS JOIN card
ON CONFLICT (verse_id) DO UPDATE SET
    strand = EXCLUDED.strand,
    strand_label = EXCLUDED.strand_label,
    card_title = EXCLUDED.card_title,
    card_md = EXCLUDED.card_md,
    anchor_refs = EXCLUDED.anchor_refs,
    last_reviewed_at = NOW(),
    updated_at = NOW();

-- =====================================================================
-- 2. Luke 21:24 — NEW desolation roadmap card (strand 'kingdom').
--    The great separation that clears the field before the gathering;
--    the counterfeit-within folded in at Ezekiel 9:6 'begin at my
--    sanctuary'. One card, one anchor verse (Luke 21:24).
-- =====================================================================
INSERT INTO kingdom_verses (verse_id, strand, strand_label, card_title, card_md, anchor_refs, tier_required, last_reviewed_at)
VALUES (
    (SELECT v.id FROM verses v JOIN chapters c ON c.id = v.chapter_id JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id WHERE e.slug = 'canon' AND b.slug = 'luke' AND c.chapter_number = 21 AND v.verse_number = 24),
    'kingdom', 'The kingdom',
    'The Desolation and the Times of the Gentiles — the great separation before the gathering',
    $card$*And when ye shall see Jerusalem compassed with armies, then know that the desolation thereof is nigh.* (Luke 21:20)

*And they shall fall by the edge of the sword, and shall be led away captive into all nations: and Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled.* (Luke 21:24)

Two phrases stand as twins, and the whole roadmap hangs between them. Here: *until the times of the Gentiles be fulfilled*. And a few letters of Paul away: *until the fulness of the Gentiles be come in* (Romans 11:25). The treading-down runs until a fullness; the blindness runs until a fullness; the two end at the same hour. The desolation is not the opposite of the gathering. It is its first motion — the great separation that clears the field before the harvest is brought home.

And the separation begins inside the house. Before the sword reaches the nations, a mark is set in the city itself:

*And Yahuah (the LORD) said unto him, Go through the midst of the city, through the midst of Jerusalem, and set a mark upon the foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof.* (Ezekiel 9:4)

*Slay utterly old and young, both maids, and little children, and women: but come not near any man upon whom is the mark; and begin at my sanctuary.* (Ezekiel 9:6)

*Begin at my sanctuary.* The dividing starts at the holy place, not at the gate of the nations — the mark sorts those who grieve the abominations from those who do them, inside the visible house. That is the shape of the whole desolation: a counterfeit had been sown into the assembly, and the day of Yahuah (the LORD) burns it out first.

For there were two kinds of non-seed standing in the visible body. The first was foreign blood brought in by conversion, against the plain word that forbade it:

*Thus saith Adonai Yahuah (the Lord GOD); No stranger, uncircumcised in heart, nor uncircumcised in flesh, shall enter into my sanctuary, of any stranger that is among the children of Yashar'el (Israel).* (Ezekiel 44:9)

*An Ammonite or Moabite shall not enter into the congregation of Yahuah (the LORD); even to their tenth generation shall they not enter into the congregation of Yahuah (the LORD) for ever.* (Deuteronomy 23:3)

The second was tares — the wicked one's seed sown among the wheat, wearing the tribe outwardly, known only by their fruit:

*The field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one; The enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels.* (Matthew 13:38-39)

*Now the sons of Eli were sons of Belial; they knew not Yahuah (the LORD).* (1 Samuel 2:12)

Sons of the priestly line, physical seed, standing at the sanctuary — and sons of Belial. The counterfeit is not always outside the camp; it grows in the midst of it. The watchman was set for exactly this hour:

*But if the watchman see the sword come, and blow not the trumpet, and the people be not warned; if the sword come, and take any person from among them, he is taken away in his iniquity; but his blood will I require at the watchman's hand.* (Ezekiel 33:6)

And the land itself is laid desolate for what was done in it:

*For I will lay the land most desolate, and the pomp of her strength shall cease; and the mountains of Yashar'el (Israel) shall be desolate, that none shall pass through. Then shall they know that I am Yahuah (the LORD), when I have laid the land most desolate because of all their abominations which they have committed.* (Ezekiel 33:28-29)

The desolation is a sifting, not an erasure — the fire that leaves silver behind:

*And it shall come to pass, that in all the land, saith Yahuah (the LORD), two parts therein shall be cut off and die; but the third shall be left therein. And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (the LORD) is my Elohim (God).* (Zechariah 13:8-9)

Two parts cut off; a third refined and named *my people*. And the day closes with the King's own feet on the mountain:

*For I will gather all nations against Jerusalem to battle; and the city shall be taken, and the houses rifled, and the women ravished; and half of the city shall go forth into captivity, and the residue of the people shall not be cut off from the city.* (Zechariah 14:2)

*And his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east, and the mount of Olives shall cleave in the midst thereof toward the east and toward the west, and there shall be a very great valley; and half of the mountain shall remove toward the north, and half of it toward the south.* (Zechariah 14:4)

*And Yahuah (the LORD) shall be king over all the earth: in that day shall there be one Yahuah (the LORD), and his name one.* (Zechariah 14:9)

This is the times of the Gentiles running their full course — the treading-down that purges the field, the mark that begins at the sanctuary, the fire that leaves the silver — until the very hour the fulness of the Gentiles, the scattered seed, comes home. The desolation and the gathering are one work of one hand: the counterfeit burned out of the house, and the lost sheep brought in.$card$,
    '{"Luke 21:20","Luke 21:24","Ezekiel 9:4-6","Ezekiel 33:6","Ezekiel 33:28-29","Zechariah 13:8-9","Zechariah 14:2","Zechariah 14:4","Zechariah 14:9","Romans 11:25","Ezekiel 44:9","Deuteronomy 23:3","Matthew 13:38-39","1 Samuel 2:12"}'::TEXT[],
    'free', NOW()
)
ON CONFLICT (verse_id) DO UPDATE SET
    strand = EXCLUDED.strand,
    strand_label = EXCLUDED.strand_label,
    card_title = EXCLUDED.card_title,
    card_md = EXCLUDED.card_md,
    anchor_refs = EXCLUDED.anchor_refs,
    last_reviewed_at = NOW(),
    updated_at = NOW();

-- =====================================================================
-- 3. cross_references — the twin-phrase hinge (both directions) plus the
--    desolation-chain ties and the four-spheres -> fulness ties.
-- =====================================================================

-- 3a. Luke 21:24 -> Romans 11:25 (times of the Gentiles <-> fulness of the Gentiles)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25),
    'manual',
    $note$*...blindness in part is happened to Yashar'el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25). The twin of Luke's *until the times of the Gentiles be fulfilled* (Luke 21:24). The treading-down of the city and the blindness of the house run to the same hour and end at the same fullness: the desolation that clears the field and the gathering that brings the scattered seed home are one work.$note$,
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25)
);

-- 3b. Romans 11:25 -> Luke 21:24 (reverse, so the hinge surfaces in Romans 11 too)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24),
    'manual',
    $note$*...and Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled* (Luke 21:24). The twin of *until the fulness of the Gentiles be come in* (Romans 11:25). The same fullness ends both: the desolation runs its course and the scattered seed comes home at the one hour.$note$,
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24)
);

-- 3c. Luke 21:24 -> Ezekiel 9:6 (the separation begins at the sanctuary)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='ezekiel' AND c.chapter_number=9 AND v.verse_number=6),
    'manual',
    $note$*...but come not near any man upon whom is the mark; and begin at my sanctuary* (Ezekiel 9:6). The treading-down of Luke 21:24 is the same separation Ezekiel saw, and it starts inside the house: the mark divides the sighing remnant from the abominations they grieved, and the dividing begins at the holy place. The counterfeit sown into the assembly is burned out first.$note$,
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='ezekiel' AND c.chapter_number=9 AND v.verse_number=6)
);

-- 3d. Luke 21:24 -> Zechariah 13:8 (two parts cut off, the third refined)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='zechariah' AND c.chapter_number=13 AND v.verse_number=8),
    'manual',
    $note$*...two parts therein shall be cut off and die; but the third shall be left therein* (Zechariah 13:8). The desolation Luke names is a sifting, not an erasure: two parts cut off, a third brought through the fire and refined as silver. The treading-down purges the field; the remnant it leaves is the silver Yahuah (the LORD) calls *my people* (Zechariah 13:9).$note$,
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='zechariah' AND c.chapter_number=13 AND v.verse_number=8)
);

-- 3e. Luke 21:24 -> Zechariah 14:9 (the day closes: Yahuah king over all the earth)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='zechariah' AND c.chapter_number=14 AND v.verse_number=9),
    'manual',
    $note$*And Yahuah (the LORD) shall be king over all the earth: in that day shall there be one Yahuah (the LORD), and his name one* (Zechariah 14:9). Where the times of the Gentiles are fulfilled (Luke 21:24), the day of Yahuah closes: all nations gathered against the city, his feet on the mount of Olives, and the King over all the earth. The desolation runs until the kingdom comes.$note$,
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='zechariah' AND c.chapter_number=14 AND v.verse_number=9)
);

-- 3f. Matthew 15:24 -> Romans 11:25 (the lost sheep ARE the fulness)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='matthew' AND c.chapter_number=15 AND v.verse_number=24),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25),
    'manual',
    $note$*I am not sent but unto the lost sheep of the house of Yashar'el (Israel)* (Matthew 15:24) — said to the woman of Canaan, then her daughter healed. She is a lost sheep wearing the name of the coast she was scattered to, not a stranger let in. The fulness of the Gentiles (Romans 11:25) is exactly this: the lost sheep found in every sphere of the scattering, gathered home.$note$,
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='matthew' AND c.chapter_number=15 AND v.verse_number=24)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25)
);

-- 3g. Matthew 8:11 -> Romans 11:25 (many from east and west = the fulness gathered)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='matthew' AND c.chapter_number=8 AND v.verse_number=11),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25),
    'manual',
    $note$*...many shall come from the east and west, and shall sit down with Abraham, and Isaac, and Jacob, in the kingdom of heaven* (Matthew 8:11) — said of the centurion's faith, with the children of the kingdom cast out (v.12). The many gathered from east and west are the scattered seed come home from every sphere: the fulness of the Gentiles (Romans 11:25) sat down with the fathers.$note$,
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='matthew' AND c.chapter_number=8 AND v.verse_number=11)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25)
);

COMMIT;
