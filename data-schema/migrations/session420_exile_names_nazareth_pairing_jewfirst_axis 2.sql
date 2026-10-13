-- ---------------------------------------------------------------------
-- Session 420 — Close the 5 card-misses on the Romans 11 "fulness of the
--               nations" gathering card, plus the Luke 21:24 -> Ezekiel 33
--               desolation cross-ref that session419 left unlinked.
--
--   (1) FULL EXILE-NAME LIST on the Romans 11 card — the scattered house
--       wears the name of the land that swallowed it: the dispersed among
--       the Gentiles / Greeks (John 7:35; Mark 7:26), the Uncircumcision
--       (Galatians 2:7; Ephesians 2:11-12), the unclean (Hosea 9:3), the
--       strangers / sojourners / outcasts (Isaiah 56:3,6,8; Ephesians 2:19;
--       1 Chronicles 29:15), and the address on the letters themselves —
--       the twelve tribes scattered abroad (James 1:1) and the strangers of
--       the dispersion (1 Peter 1:1). The card carried only Hosea 8:8 before.
--   (2) NAZARETH PAIRING — Luke 4:25-27 (Elijah to Sarepta / Naaman the
--       Syrian) + 4:29 (the home assembly rising to throw him off the cliff)
--       woven into the four-spheres section: the Shepherd pairs the seed
--       ABROAD and the seed in the HOSTILE LAND with his own mouth while the
--       house in the land rejects him.
--   (3) 2 KINGS 5:2 — the captive maid of Yashar'el in Naaman's house quoted
--       in sphere (b) (session419 quoted only 5:15).
--   (4) JEW-FIRST AXIS — *to the Jew first, and also to the Greek*
--       (Romans 1:16) stated explicitly as the frame of the four spheres:
--       the one seed in two locations, those in Judea first then those
--       scattered abroad.
--   (5) EZEKIEL 33 cross-ref — Luke 21:24 -> Ezekiel 33:6 (the watchman set
--       for the hour the sword comes) and Ezekiel 33:28 (the land laid most
--       desolate). 33 was quoted in the desolation card but never linked the
--       way Ezek 9 / Zech 13 / Zech 14 were.
-- ---------------------------------------------------------------------
-- Holds the corrections locked with Yoshi 2026-06-26:
--   * NO individual-mercy cases. The four spheres are SEED REVEALED, not
--     foreigners helped. This migration only deepens that reading.
--   * Marriage-women are a SEPARATE mechanism (converted by who the husband
--     is) and are NOT touched here. Nothing in this card collapses the two.
--   * The counterfeit is INSIDE the assembly (carried on the session419
--     desolation card); untouched here.
--   * Desolation chain stays Luke 21 <-> Ezek 33 / Ezek 9 / Zech 13-14 only.
--     This migration adds the Ezek 33 *links* that were missing; it adds no
--     Daniel 9 and no Deuteronomy 28.
--
-- Idempotent: the Romans 11 card re-upserts ON CONFLICT (verse_id) with the
-- FULL session419 body reproduced verbatim plus the new passages, so nothing
-- session418/419 landed is lost. cross_references guarded with WHERE NOT EXISTS.
--
-- Run: python3 api/apply_migration.py data-schema/migrations/session420_exile_names_nazareth_pairing_jewfirst_axis.sql
-- ---------------------------------------------------------------------

BEGIN;

-- =====================================================================
-- 1. Romans 11:13/14/15/25 — RE-UPSERT the gathering card. Body =
--    session419 body, verbatim, with (a) the full exile-name list, (b) the
--    Jew-first axis framing the four spheres, (c) the 2 Kings 5:2 captive
--    maid in sphere (b), and (d) the Nazareth pairing woven in.
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

Every name on her marks the ground of her exile, not a verdict on her blood. She is a daughter of the divorced house, dispersed into Canaan and called by the coast she was scattered to — a lost sheep, not a stranger let in.

And her three names are only one chapter of a longer vocabulary. The scattered house lost its land, and then it lost its name; and wherever scripture follows it into exile, it is wearing the name of the place that swallowed it. The house in the land knew there were brethren out past the borders they could not reach, and they named them by their dispersion:

*Then said the Yahudim (Jews) among themselves, Whither will he go, that we shall not find him? will he go unto the dispersed among the Gentiles, and teach the Gentiles?* (John 7:35)

The dispersed among the Gentiles — the Greeks. The woman of the coast is called a Greek by Mark for that very reason:

*The woman was a Greek, a Syrophenician by nation; and she besought him that he would cast forth the devil out of her daughter.* (Mark 7:26)

They are named by their uncircumcision — the mark the flesh let go in exile — and Paul is sent to them under exactly that name:

*But contrariwise, when they saw that the gospel of the uncircumcision was committed unto me, as the gospel of the circumcision was unto Peter;* (Galatians 2:7)

*Wherefore remember, that ye being in time past Gentiles in the flesh, who are called Uncircumcision by that which is called the Circumcision in the flesh made by hands; That at that time ye were without Messiah (Christ), being aliens from the commonwealth of Yashar'el (Israel), and strangers from the covenants of promise, having no hope, and without Elohim (God) in the world:* (Ephesians 2:11-12)

Aliens from the commonwealth, strangers from the covenants — and Paul says it to the very people he is gathering home. They are named by the unclean food the exile drove them to eat in the land of their captivity:

*They shall not dwell in Yahuah's (the LORD's) land; but Ephraim shall return to Egypt, and they shall eat unclean things in Assyria.* (Hosea 9:3)

And most often they are named simply strangers and sojourners — the son of the stranger who is not a foreigner by blood but an outcast by exile, whom Yahuah is gathering back to the mountain he was scattered from:

*Neither let the son of the stranger, that hath joined himself to Yahuah (the LORD), speak, saying, Yahuah (the LORD) hath utterly separated me from his people.* (Isaiah 56:3)

*Also the sons of the stranger, that join themselves to Yahuah (the LORD), to serve him, and to love the name of Yahuah (the LORD), to be his servants, every one that keepeth the sabbath from polluting it, and taketh hold of my covenant.* (Isaiah 56:6)

*Adonai Yahuah (the Lord GOD) which gathereth the outcasts of Yashar'el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him.* (Isaiah 56:8)

The outcasts of Yashar'el (Israel), and the others yet to be gathered to them: the son of the stranger and the outcast are the same scattered seed under two names. Paul says they cease to be strangers the moment they are brought home:

*Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God).* (Ephesians 2:19)

It is the old confession of the fathers, who knew the whole house was sojourning even while it stood in the land:

*For we are strangers before thee, and sojourners, as were all our fathers: our days on the earth are as a shadow, and there is none abiding.* (1 Chronicles 29:15)

And it is the address written on the letters themselves. James writes to the scattered tribes by name; Peter writes to the strangers of the dispersion:

*James, a servant of Elohim (God) and of the Lord Yahusha HaMashiach (the Lord Jesus Christ), to the twelve tribes which are scattered abroad, greeting.* (James 1:1)

*Peter, an apostle of Yahusha HaMashiach (Jesus Christ), to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia.* (1 Peter 1:1)

The twelve tribes scattered abroad. The strangers of the dispersion. The dispersed among the Gentiles, the Greeks, the Uncircumcision, the unclean, the outcasts, the sons of the stranger — every name is a place on the map of the exile, and every one of them is the lost sheep of the house of Yashar'el (Israel) under the name of the land that swallowed it.

This is the same axis Paul drew at the very head of his letter — the gospel going first to the house in the land, then to the same seed scattered abroad:

*For I am not ashamed of the gospel of Messiah (Christ): for it is the power of Elohim (God) unto salvation to every one that believeth; to the Yahudi (Jew) first, and also to the Greek.* (Romans 1:16)

To the Yahudi (Jew) first, and also to the Greek: not two peoples, but the one seed in two locations — those in Judea first, and then the same seed scattered abroad among the nations. The seed of promise is found in four spheres, and the same Shepherd sought it in every one. In the assembly and the land — the returned house of Yahudah (Judah). In the lands the land was set against — Naaman the Syrian, commander of the army of Yashar'el's (Israel's) enemy, in whose own house a captive daughter of the seed already waited:

*And the Syrians had gone out by companies, and had brought away captive out of the land of Yashar'el (Israel) a little maid; and she waited on Naaman's wife.* (2 Kings 5:2)

It was that little maid who sent her master to the prophet, and he came up out of the water confessing:

*Behold, now I know that there is no Elohim (God) in all the earth, but in Yashar'el (Israel).* (2 Kings 5:15)

Scattered abroad — the widow *which belongeth to Zidon* (1 Kings 17:9), and the woman of the Canaan coast. And in rulership under Rome — the centurion, of whom he said:

*When Yahusha (Jesus) heard it, he marvelled, and said to them that followed, Verily I say unto you, I have not found so great faith, no, not in Yashar'el (Israel).* (Matthew 8:10)

And he had pointed to these very spheres himself, in his own synagogue at Nazareth, the day the home assembly turned on him. Over the heads of all the widows and all the lepers in the land, he named the widow abroad and the leper out of the hostile land — the two the prophets were sent to:

*But I tell you of a truth, many widows were in Yashar'el (Israel) in the days of Elias, when the heaven was shut up three years and six months, when great famine was throughout all the land; But unto none of them was Elias sent, save unto Sarepta, a city of Sidon, unto a woman that was a widow. And many lepers were in Yashar'el (Israel) in the time of Eliseus the prophet; and none of them was cleansed, saving Naaman the Syrian.* (Luke 4:25-27)

The widow of Sidon — the seed scattered abroad. Naaman the Syrian — the seed in the hostile land. The same two spheres, named by the Shepherd's own mouth. And the house in the land, hearing that the prophets had been sent past them to the scattered seed, rose up to kill him:

*And rose up, and thrust him out of the city, and led him unto the brow of the hill whereon their city was built, that they might cast him down headlong.* (Luke 4:29)

The seed abroad and the seed in the hostile land received the prophets; the house in the land tried to throw the prophet off a cliff. That is the same reversal he named over the centurion, the seed come home from every sphere and the visible house that would not hear, cast out:

*And I say unto you, That many shall come from the east and west, and shall sit down with Abraham, and Isaac, and Jacob, in the kingdom of heaven. But the children of the kingdom shall be cast out into outer darkness: there shall be weeping and gnashing of teeth.* (Matthew 8:11-12)

Many, from the east and the west, sat down with the fathers — the scattered seed gathered home from every land the exile drove them to. The fulness of the Gentiles is not strangers admitted to the covenant. It is the lost sheep of the house of Yashar'el (Israel), found in every sphere of the scattering, sat down at last with Abraham, Isaac, and Jacob.$card$::TEXT AS card_md,
        '{"Genesis 48:16","Genesis 48:19","Romans 11:13-15","Romans 11:25","Romans 11:26","Jeremiah 16:13-16","Matthew 4:19","Matthew 15:24","Hosea 8:8","John 7:35","Mark 7:26","Galatians 2:7","Ephesians 2:11-12","Hosea 9:3","Isaiah 56:3","Isaiah 56:6","Isaiah 56:8","Ephesians 2:19","1 Chronicles 29:15","James 1:1","1 Peter 1:1","Romans 1:16","2 Kings 5:2","2 Kings 5:15","1 Kings 17:9","Matthew 8:10","Luke 4:25-27","Luke 4:29","Matthew 8:11-12"}'::TEXT[] AS anchor_refs
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
-- 2. cross_references — the Ezekiel 33 ties session419 left unlinked.
--    33 was quoted in the desolation card (33:6 watchman + 33:28-29 land
--    most desolate) but never linked the way Ezek 9 / Zech 13 / Zech 14 were.
-- =====================================================================

-- 2a. Luke 21:24 -> Ezekiel 33:6 (the watchman set for the hour the sword comes)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='ezekiel' AND c.chapter_number=33 AND v.verse_number=6),
    'manual',
    $note$*But if the watchman see the sword come, and blow not the trumpet, and the people be not warned... his blood will I require at the watchman's hand* (Ezekiel 33:6). When ye see Jerusalem compassed with armies (Luke 21:20), the sword Ezekiel's watchman was set to warn of has come. The treading-down of Luke 21:24 is the desolation the watchman was posted for; the trumpet is the warning the remnant hears before the field is cleared.$note$,
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='ezekiel' AND c.chapter_number=33 AND v.verse_number=6)
);

-- 2b. Luke 21:24 -> Ezekiel 33:28 (the land laid most desolate for its abominations)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='ezekiel' AND c.chapter_number=33 AND v.verse_number=28),
    'manual',
    $note$*For I will lay the land most desolate... because of all their abominations which they have committed* (Ezekiel 33:28-29). Jerusalem trodden down of the Gentiles (Luke 21:24) is the same desolation Ezekiel named — the land laid most desolate for the abominations done in it. The treading-down is not random ruin; it is the judgment Ezekiel saw, clearing the field before the scattered seed is gathered home.$note$,
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='luke' AND c.chapter_number=21 AND v.verse_number=24)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='ezekiel' AND c.chapter_number=33 AND v.verse_number=28)
);

COMMIT;
