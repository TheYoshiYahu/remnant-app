-- ---------------------------------------------------------------------
-- Session 418 — Extend the Romans 11 "fulness of the nations" kingdom card
--               with vv.13-15 (the apostle to the cast-away) + add the
--               seed-promise verses Gen 17:4-5 and Gen 35:11.
-- ---------------------------------------------------------------------
-- Yoshi: "which is why i just wanted to add to it" — the existing Romans
-- 11:25 kingdom card ("The First Redeeming and the Fulness of the Nations",
-- strand 'gathering') is EXTENDED here, not duplicated. The extended card
-- now also carries Romans 11:13-15: Paul names the Gentiles he is apostle to
-- as "them which are my flesh" (v.14 — his own kinsmen, the cast-away house),
-- defined by their "casting away" and whose "receiving" is "life from the
-- dead" (v.15 — the gospel of their return), tied to Jeremiah 16:13-16 (the
-- casting-out and the regathering from the land of the north) which Yahusha
-- (Jesus) quoted as "I will make you fishers of men" (Matthew 4:19).
--
-- The same extended card is applied to Romans 11:13, 11:14, 11:15 AND 11:25,
-- so all four verses surface it and render with the kingdom-gospel two-tone
-- underline (the default kingdom style). Genesis 17:4-5 (av hamon goyim) and
-- Genesis 35:11 (qehal goyim) are added to the same 'gathering' strand so the
-- whole seed-promise family is underlined by default. One cross-reference gap
-- (Gen 35:11 -> Rom 11:25) and the Romans 11:15 -> Jeremiah 16 ties are filled.
--
-- Idempotent: kingdom_verses upserts ON CONFLICT (verse_id); cross_references
-- guarded with WHERE NOT EXISTS.
--
-- Run: python3 api/apply_migration.py data-schema/migrations/session418_romans11_castaway_return_and_fulness_of_nations_kingdom.sql
-- ---------------------------------------------------------------------

BEGIN;

-- =====================================================================
-- 1. Romans 11:13/14/15/25 — extend the existing fulness-of-the-nations
--    card with the apostle-to-the-cast-away reading. One card, four verses.
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

When Yahusha (Jesus) made fishermen into fishers of men, he was not coining a fond image — he was quoting Jeremiah, the fishers Yahuah promised to send to gather the cast-away house from the land of the north. Paul's apostleship to the Gentiles is that fishing. The casting away of his flesh was the reconciling of the world; their receiving back is life from the dead. The fulness of the Gentiles coming in (v.25) is the receiving of them (v.15): the cast-away seed of Ephraim, fished home.$card$::TEXT AS card_md,
        '{"Genesis 48:16","Genesis 48:19","Romans 11:13-15","Romans 11:25","Jeremiah 16:13-16","Matthew 4:19"}'::TEXT[] AS anchor_refs
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
-- 2. Genesis 17:4-5 — av hamon goyim, a father of a multitude of nations.
--    One card, two verses.
-- =====================================================================
WITH card AS (
    SELECT
        'A father of a multitude of nations — av hamon goyim, the seed-promise Paul carries into Romans'::TEXT AS card_title,
        $card$*As for me, behold, my covenant is with thee, and thou shalt be a father of many nations.* (Genesis 17:4)

*Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* (Genesis 17:5)

The Hebrew is av hamon goyim — a father of a multitude of nations. The covenant does not promise Abraham one nation but a fulness of them, carried in his own seed. Paul quotes this very word in Romans:

*(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* (Romans 4:17)

*And his father refused, and said, I know it, my son, I know it: he also shall become a people, and he also shall be great: but truly his younger brother shall be greater than he, and his seed shall become a multitude of nations.* (Genesis 48:19)

The multitude of nations sworn to Abraham is the same seed Jacob names over Ephraim — melo ha-goyim, the fulness of the nations — and the same fulness Paul says comes in:

*...that blindness in part is happened to Yashar'el (Israel), until the fulness of the Gentiles be come in.* (Romans 11:25)

The fulness of the Gentiles is not nations spliced in from outside the covenant. It is Abraham's own seed, multiplied into the nations and gathered home — the promise of Genesis 17 reaching its harvest.$card$::TEXT AS card_md,
        '{"Genesis 17:4-5","Romans 4:17","Genesis 48:19","Romans 11:25"}'::TEXT[] AS anchor_refs
),
verselist AS (
    SELECT v.id AS verse_id
    FROM verses v
    JOIN chapters c ON c.id = v.chapter_id
    JOIN books b ON b.id = c.book_id
    JOIN editions e ON e.id = b.edition_id
    WHERE e.slug = 'canon' AND b.slug = 'genesis' AND c.chapter_number = 17
      AND v.verse_number IN (4, 5)
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
-- 3. Genesis 35:11 — qehal goyim, a nation and a company of nations.
-- =====================================================================
INSERT INTO kingdom_verses (verse_id, strand, strand_label, card_title, card_md, anchor_refs, tier_required, last_reviewed_at)
VALUES ((SELECT v.id FROM verses v JOIN chapters c ON c.id = v.chapter_id JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id WHERE e.slug = 'canon' AND b.slug = 'genesis' AND c.chapter_number = 35 AND v.verse_number = 11), 'gathering', 'The gathering', 'A nation and a company of nations — qehal goyim, the Bethel promise that becomes the fulness of the Gentiles', $card$*And Elohim (God) said unto him, I am El Shaddai (God Almighty): be fruitful and multiply; a nation and a company of nations shall be of thee, and kings shall come out of thy loins.* (Genesis 35:11)

The Hebrew is qehal goyim — a company of nations. The El-Shaddai promise to Abraham, av hamon goyim, is renewed to Jacob at Bethel: not a single nation only, but *a nation and a company of nations*. The promise passes down the paternal line and gathers toward one head:

*And his father refused, and said, I know it, my son, I know it: he also shall become a people, and he also shall be great: but truly his younger brother shall be greater than he, and his seed shall become a multitude of nations.* (Genesis 48:19)

The company of nations promised at Bethel finds its name in Ephraim, of whom *his seed shall become a multitude of nations* — melo ha-goyim. And that is the fulness Paul names:

*...that blindness in part is happened to Yashar'el (Israel), until the fulness of the Gentiles be come in.* (Romans 11:25)

The company of nations is not strangers added to Yashar'el (Israel). It is the northern house of Joseph, the scattered seed grown wild among the Gentiles — the fulness of the Gentiles that is itself the covenant seed, coming home.$card$, '{"Genesis 35:11","Genesis 48:19","Romans 11:25"}'::TEXT[], 'free', NOW())
ON CONFLICT (verse_id) DO UPDATE SET
    strand = EXCLUDED.strand,
    strand_label = EXCLUDED.strand_label,
    card_title = EXCLUDED.card_title,
    card_md = EXCLUDED.card_md,
    anchor_refs = EXCLUDED.anchor_refs,
    last_reviewed_at = NOW(),
    updated_at = NOW();

-- =====================================================================
-- 4. cross_references — fill the gaps in the seed-promise family.
-- =====================================================================

-- 4a. Genesis 35:11 (qehal goyim) -> Romans 11:25 (the fulness of the Gentiles)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='genesis' AND c.chapter_number=35 AND v.verse_number=11),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25),
    'manual',
    E'*...that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25). The *company of nations* sworn to Jacob at Bethel — *a nation and a company of nations shall be of thee* (Genesis 35:11), qehal goyim — runs through Ephraim, whose seed becomes a multitude of nations (Genesis 48:19, melo ha-goyim), and arrives as the *fulness of the Gentiles*. Not nations grafted in from outside, but the covenant seed scattered among the nations and gathered home.',
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='genesis' AND c.chapter_number=35 AND v.verse_number=11)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=25)
);

-- 4b. Romans 11:15 (the receiving of them, life from the dead) -> Jeremiah 16:15 (brought up from the land of the north)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=15),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='jeremiah' AND c.chapter_number=16 AND v.verse_number=15),
    'manual',
    E'*But, Yahuah (LORD) liveth, that brought up the children of Yashar''el (Israel) from the land of the north, and from all the lands whither he had driven them: and I will bring them again into their land that I gave unto their fathers* (Jeremiah 16:15). Paul''s *what shall the receiving of them be, but life from the dead?* (Romans 11:15) is this same regathering: the cast-away house, driven into the lands of the north, brought again home. The receiving of them IS the return Jeremiah promised.',
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=15)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='jeremiah' AND c.chapter_number=16 AND v.verse_number=15)
);

-- 4c. Romans 11:15 -> Jeremiah 16:16 (the fishers sent to gather them — the fishers of men)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=15),
    (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='jeremiah' AND c.chapter_number=16 AND v.verse_number=16),
    'manual',
    E'*Behold, I will send for many fishers, saith Yahuah (LORD), and they shall fish them* (Jeremiah 16:16). The *receiving of them* that is *life from the dead* (Romans 11:15) is worked by the fishers Yahuah promised to send — the same fishers Yahusha (Jesus) named when he said *I will make you fishers of men* (Matthew 4:19). Paul, apostle to the cast-away Gentiles who are his own flesh, is sent in that fishing: gathering the scattered house home.',
    'free'::content_tier
WHERE NOT EXISTS (
    SELECT 1 FROM cross_references x
    WHERE x.source_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='romans' AND c.chapter_number=11 AND v.verse_number=15)
      AND x.target_verse_id = (SELECT v.id FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug='canon' AND b.slug='jeremiah' AND c.chapter_number=16 AND v.verse_number=16)
);

COMMIT;
