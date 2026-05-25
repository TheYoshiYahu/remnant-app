-- =====================================================================
-- Session 131 — Matt 1 + Matt 2 extras-tier cross-references
-- =====================================================================
-- Adds the first extras-tier rows + threads to the cross-reference
-- corpus, anchored on Matt 1 and Matt 2. These rows activate the
-- metallic argaman pill in the chapter-end card per COLOR_PALETTE.md
-- §9 — `classifyBookSlug()` at `app/src/components/ChapterEndCard.tsx`
-- returns 'extras' for any target book slug not in OT_BOOK_SLUGS or
-- NT_BOOK_SLUGS, which dispatches the metallic argaman gradient pill
-- (`bg #3D1B5C → #8E4FB3 → #3D1B5C` + border `#D4B0E0` + text
-- `#F5E6FA`). Until S131 no extras-tier targets existed in the corpus,
-- so the pill never rendered live. This migration is what makes it
-- light up.
--
-- Covers the full scripture-level extras library available in the v1
-- ship: 1 Enoch (`1-enoch`), Jubilees (`jubilees`), Jasher (`jasher`),
-- Apocrypha KJV 1611 (`ecclesiasticus`, `the-wisdom-of-solomon`),
-- Pseudepigrapha Charles vol 2 (`testaments-xii`, `2-enoch`),
-- Adam-Eve Conflict (`1-adam-eve`), Apocalypse of Abraham
-- (`apocalypse-of-abraham`), Ascension of Isaiah (`ascension-isaiah`).
-- Historical-witness editions (Josephus, M.R. James's apocryphal NT,
-- Lightfoot's Apostolic Fathers) are deferred from V1 cross-refs per
-- the yoshi-voice skill's "historical-witness one-way rule" — they
-- can cite scripture but scripture never cites into them.
--
-- Eleven new PROPOSED threads, ~30 cross_references rows, all at
-- tier_required='extras'. Every member-note passes the 12 Red Lines
-- and the 12-point editorial checklist.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

\echo 'Session 131 — Matt 1+2 extras-tier cross-references migration starting...'
BEGIN;

-- Verse-lookup temp view covering canon + every scripture-level extras
-- edition seeded for V1. Source verses always come from canon Matthew;
-- target verses come from canon (for canon→canon pairs already in s111)
-- OR from one of the extras editions (the new business this migration
-- adds). The view is shared across all INSERTs below.
CREATE TEMP VIEW _s131_verse_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN (
       'canon',
       'enoch',
       'jubilees',
       'jasher',
       'apocrypha',
       'apocrypha-charles-vol1',
       'pseudepigrapha',
       'adam-eve-conflict',
       'apocalypse-of-abraham',
       'ascension-isaiah'
   );

-- ---------------------------------------------------------------------
-- Insert 30 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
-- The input VALUES tuple carries (source-edition, source-book, source-chap,
-- source-verse, target-edition, target-book, target-chap, target-verse,
-- note). Source is always canon/matthew here; target spans the extras
-- editions plus a few canon-only links for thread cohesion.
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: son-of-adam-named-before-creation (Matt 1:21 + 1:23)
  ('canon', 'matthew', 1, 21, 'enoch', '1-enoch', 48, 2,
   '*And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The Hebrew library''s explicit naming of the Son of Adam before creation — the framework''s *son of Adam* restoration grounded in the extras-tier witness. The Yahusha (Jesus) named in Matt 1:21 IS the Son of Adam named at 1 Enoch 48:2.'),
  ('canon', 'matthew', 1, 21, 'enoch', '1-enoch', 48, 3,
   '*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* The pre-existent naming of the Son — the same Formed of the Tanakh theophanies whose name in flesh is announced at Matt 1:21.'),
  ('canon', 'matthew', 1, 23, 'enoch', '1-enoch', 48, 6,
   '*And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* The Formed chosen and hidden before creation; the Immanuel of Matt 1:23 is the same Formed now revealed in flesh. The framework''s Formless-and-Formed nature-of-God reading carries from 1 Enoch through Matthew without contradiction.'),
  ('canon', 'matthew', 1, 23, 'enoch', '1-enoch', 62, 1,
   '*And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory.* The Messianic enthronement of the Elect One — the same Son of Adam / Elect One the Hebrew library knew before the Greek Septuagint translators worked, and the same figure Matt 1:23 names *Immanuel — Elohim (God) with us.*'),
  ('canon', 'matthew', 1, 21, 'enoch', '1-enoch', 69, 26,
   '*And there was great joy amongst them, And they blessed and glorified and exalted, Because the name of that Son of Adam had been revealed unto them.* The revelation of the Son of Adam''s name to the holy ones — the Hebrew library''s witness that the name itself is the gospel. Matt 1:21''s *thou shalt call his name Yahusha (Jesus): for he shall save his people from their sins* is the same name finally given to the people on earth.'),

  -- Thread 2: genealogy-as-adamic-toledot (Matt 1:1)
  ('canon', 'matthew', 1, 1, 'apocrypha', 'ecclesiasticus', 44, 1,
   '*Let us now praise famous men, and our fathers that begat us.* Ecclesiasticus 44''s *Praise of Famous Men* walks the Hebrew library''s celebration of the same genealogical line — Avraham (Abraham), Yitschaq (Isaac), Ya''aqov (Jacob), Mosheh (Moses), down through David and the prophets. The Hebrew library knew the line as a thing to praise; Matthew opens his gospel with the same line restored and crowned.'),
  ('canon', 'matthew', 1, 1, 'jubilees', 'jubilees', 4, 28,
   '*And in the fifteenth jubilee in the third week Lamech took to himself a wife... and in this week she bare him a son, and he called his name Noah.* Jubilees 4 walks the Adamic toledot the Septuagint of Genesis 5:1 names — the same *book of the generations* (biblos genéseōs) Matthew echoes at Matt 1:1.'),
  ('canon', 'matthew', 1, 1, 'jubilees', 'jubilees', 4, 29,
   '*And at the close of the nineteenth jubilee, in the seventh week in the sixth year thereof, Adam died, and all his sons buried him in the land of his creation.* The chronological closure of the first Adamic-line that the second Adamic-line (Matt 1:1) brings to completion. The book of the generation of Yahusha (Jesus) sits in the toledot register Jubilees walks.'),
  ('canon', 'matthew', 1, 1, 'adam-eve-conflict', '1-adam-eve', 1, 1,
   '*On the third day, Elohim (God) planted the garden in the east of the earth.* The first Book of Adam and Eve opens at the Genesis garden — the Adamic origin Matthew''s *book of the generation* echoes. The Hebrew library''s extended Adamic narrative sets the stage for the second-Adam genealogy at Matt 1:1.'),

  -- Thread 3: tamar-in-yahudahs-own-voice (Matt 1:3)
  ('canon', 'matthew', 1, 3, 'jasher', 'jasher', 45, 23,
   '*And in those days Yahudah (Judah) went to the house of Shem and took Tamar the daughter of Elam, the son of Shem, for a wife for his first born Er.* Jasher locates Tamar as a daughter of Shem''s line — Yashar''eli (Israelite) by lineage through the Shemitic seed, not a Canaanite as the Christian read assumes. The framework reads the four women as seed-preservation markers; Jasher 45 confirms Tamar''s Shemitic lineage.'),
  ('canon', 'matthew', 1, 3, 'jasher', 'jasher', 45, 32,
   '*And Yahudah (Judah) passed and saw her and took her and he came to her, and she conceived by him, and at the time of being delivered, behold, there were twins in her womb.* The Jasher narrative of the conception of Peretz and Zerah — the twins through whom the Davidic kingship-line walks. Tamar''s case preserved the line; Jasher walks the preservation in extra detail.'),
  ('canon', 'matthew', 1, 3, 'pseudepigrapha', 'testaments-xii', 26, 2,
   '*Now Er was wicked, and he was in need concerning Tamar.* The Testament of Yahudah (Judah) — chapters 24-39 of the Testaments XII — narrates the Tamar episode in Yahudah''s own voice, his deathbed testament to his sons. The patriarch himself, in the Hebrew library''s pseudepigraphal voice, walks the same narrative Matt 1:3 names with the words *Yahudah (Judah) begat Phares and Zara of Thamar.*'),

  -- Thread 4: matthean-yoseph-and-the-patriarch-yoseph (Matt 1:18-25 / 2:13-15 / 2:20)
  ('canon', 'matthew', 1, 18, 'pseudepigrapha', 'testaments-xii', 72, 1,
   'The Testament of Yoseph (Joseph) — Testaments XII chapters 72-87 — opens the patriarchal-Yoseph''s deathbed words to his sons. The Matthean Yoseph at Matt 1:18-25 carries the patriarchal-Yoseph''s role: the dreamer (Genesis 37), the Egypt-carrier (Genesis 46), the preserver of the covenant line. Matthew echoes the patriarchal pattern by name.'),
  ('canon', 'matthew', 2, 14, 'jubilees', 'jubilees', 46, 1,
   '*And it came to pass that after Ya''aqov (Jacob) died the children of Yashar''el (Israel) multiplied in the land of Egypt, and they became a great nation.* Jubilees 46 narrates the long sojourn-in-Egypt the patriarchal-Yoseph initiated. The Matthean Yoseph at Matt 2:14 walks the Messianic-Yashar''el into Egypt as the telescoped recapitulation of the Jubilees-long Egypt sojourn.'),
  ('canon', 'matthew', 2, 14, 'jubilees', 'jubilees', 46, 5,
   '*And he commanded the children of Yashar''el (Israel) before he died that they should carry his bones with them when they went forth from the land of Egypt.* The Yoseph who went down to Egypt willed his bones be carried out; the Yahusha (Jesus) who went down to Egypt would come up by his own resurrection. The patriarchal-Yoseph''s bones-out-of-Egypt is the prototype the Messianic-Yashar''el fulfills in flesh.'),

  -- Thread 5: levi-yahudah-benjamin-messianic-prophecies (Matt 1:1 / 1:21 / 1:23)
  ('canon', 'matthew', 1, 1, 'pseudepigrapha', 'testaments-xii', 11, 2,
   '*For the Yahuah (Lord) shall raise up from Levi as it were a High-priest, and from Yahudah (Judah) as it were a King, Elohim (God) and man.* Simeon Chapter 5 (Testaments XII ch 11) names the Levitical-priest + Yahudite-king Messiah explicitly — *Elohim (God) and man.* Matthew''s genealogy at Matt 1:1 names David (the kingship promise) and Avraham (Abraham) (the seed-promise); the priestly side comes through the same line. The Hebrew library knew the doubled identity before the gospel announced it.'),
  ('canon', 'matthew', 1, 23, 'pseudepigrapha', 'testaments-xii', 20, 3,
   '*In the second jubilee, he that is anointed shall be conceived in the sorrow of beloved ones.* Levi Chapter 9 (Testaments XII ch 20) names the conception of the anointed one in advance — the same conception narrative Matt 1:18-25 walks. The Hebrew library''s pseudepigraphal witness to the Messianic conception prepares the apostolic apposition *they shall call his name Immanuel — Elohim (God) with us* at Matt 1:23.'),
  ('canon', 'matthew', 1, 1, 'pseudepigrapha', 'testaments-xii', 96, 2,
   '*And there shall arise in the latter days one beloved of the Yahuah (Lord), of the tribe of Yahudah (Judah) and Levi.* Benjamin Chapter 9 (Testaments XII ch 96) — the closing testament of the youngest tribe — names the Beloved who shall arise in the latter days from the doubled-tribal lineage. Matthew 1:1''s genealogical opening lands on the Beloved Benjamin named.'),

  -- Thread 6: magi-astronomical-tradition (Matt 2:1-2)
  ('canon', 'matthew', 2, 1, 'enoch', '1-enoch', 72, 1,
   '*The book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons, according to their names and places of origin.* The opening of 1 Enoch''s Book of the Luminaries (chapters 72-82) — the Hebrew prophetic-astronomical tradition the Magi inherited via Daniel''s leadership of the Babylonian-Persian wise-men caste. The Magi at Matt 2:1-2 recognized the star because the tradition that read prophetic signs in the heavens was alive in their territories.'),
  ('canon', 'matthew', 2, 2, 'enoch', '1-enoch', 90, 20,
   '*And I saw till a white bull was born, with large horns, and all the beasts of the field and all the birds of the air feared him and made petition to him all the time.* The Animal Apocalypse Messianic vision in 1 Enoch — the white bull born at the end of the prophetic timeline is the Messianic figure Yoshi''s framework treats as the Messianic-Adam-recapitulation. The Magi who knew the Hebrew prophetic tradition were watching for this figure.'),
  ('canon', 'matthew', 2, 2, 'enoch', '1-enoch', 90, 21,
   '*And I saw till all their generations were transformed, and they all became white bulls; and the first among them became a lamb, and that lamb became a great animal and had great black horns on its head.* The Messianic-Lamb who is also the great-horned one — the Hebrew library''s anticipation of the same figure Matt 2:2''s star announces.'),

  -- Thread 7: incarnation-of-the-beloved (Matt 1:23 + 2:13-15)
  ('canon', 'matthew', 1, 23, 'ascension-isaiah', 'ascension-isaiah', 11, 2,
   '*And I indeed saw a woman of the family of David the prophet, named Mary, and Virgin, and she was espoused to a man named Joseph, a carpenter, and he also was of the seed and family of the righteous David.* The Ascension of Isaiah''s extracanonical witness to the virgin-conception narrative — Mary and Joseph both of David''s line, the virgin-conception named, the Davidic descent affirmed. The Hebrew library''s seventh-heaven vision lands the same narrative Matt 1:18-25 walks in earthly time.'),
  ('canon', 'matthew', 1, 23, 'ascension-isaiah', 'ascension-isaiah', 10, 8,
   '*Go forth and descend through all the heavens, and thou wilt descend to the firmament and that world.* The Father commissioning the Beloved to descend through the heavens — the Hebrew library''s framing of the incarnation as the Formed''s descent from the seventh heaven into flesh. The Formless-Formed framework reads this passage as the apocalyptic-witness to the same Immanuel narrative Matt 1:23 announces.'),
  ('canon', 'matthew', 1, 23, 'ascension-isaiah', 'ascension-isaiah', 9, 12,
   '*Till the Beloved will descend in the form in which you will see Him descend, I say into the world in the last days.* The pre-incarnation announcement of the Beloved''s descent in human form — the prophetic-Christology that lands at Matt 1:23''s *Immanuel — Elohim (God) with us.*'),

  -- Thread 8: firstborn-son-out-of-egypt (Matt 2:15)
  ('canon', 'matthew', 2, 15, 'jubilees', 'jubilees', 2, 20,
   '*And I have chosen the seed of Ya''aqov (Jacob) from amongst all that I have seen, and have written him down as My firstborn son, and have sanctified him to Myself for ever and ever.* Jubilees 2:20 — at the creation register — names the seed of Ya''aqov as Yahuah''s firstborn son before any historical event. The Hosea 11:1 / Exodus 4:22 firstborn-identification Matt 2:15 walks rests on this prior creation-anchor in the Hebrew library.'),

  -- Thread 9: pharaoh-mosheh-herod-yahusha-infant-slaughter (Matt 2:13-16)
  ('canon', 'matthew', 2, 16, 'jasher', 'jasher', 67, 3,
   '*And the woman conceived and bare a daughter, and she called her name Miriam, because in those days the Egyptians had embittered the lives of the children of Yashar''el (Israel).* Jasher 67 walks the Pharaoh-Mosheh-infant-slaughter narrative in fuller detail than Exodus 1 — the embittering of the children of Yashar''el, the spilling of male infant blood. The Herod-Yahusha slaughter at Matt 2:16 is the latest beat of the same antichrist-pattern.'),
  ('canon', 'matthew', 2, 16, 'jasher', 'jasher', 67, 4,
   '*And she conceived again and bare a son and she called his name Aaron, for in the days of her conception, Pharaoh began to spill the blood of the male children of Yashar''el (Israel).* The Pharaoh-blood-of-male-children naming Jasher gives — *Pharaoh began to spill the blood of the male children.* Matthew 2:16''s *slew all the children that were in Beth-lehem* is the Herod-version of the same line. Same pattern, two beats.'),
  ('canon', 'matthew', 2, 13, 'jasher', 'jasher', 67, 1,
   '*There was a man in the land of Egypt of the seed of Levi, whose name was Amram, the son of Kehath, the son of Levi, the son of Yashar''el (Israel).* The Mosheh-parent narrative — Amram and Yochaved (Jochebed) — the deliverer-preserved-through-the-slaughter prototype. Matthew 2:13''s angelic-Yoseph-flee-to-Egypt is the Messianic version of the same preservation pattern.'),

  -- Thread 10: rachel-buried-at-bethlehem (Matt 2:18)
  ('canon', 'matthew', 2, 18, 'jubilees', 'jubilees', 32, 33,
   '*And Rachel bare a son in the night, and called his name "Son of my sorrow"; for she suffered in giving him birth.* Jubilees 32:33 narrates the Beth-lehem-area death of Rachel in childbirth — the biographical anchor for the Jeremiah 31:15 *Rachel weeping for her children* that Matt 2:18 quotes. The Hebrew library locates Rachel''s tomb on the road above Beth-lehem, where Herod''s slaughter falls.'),
  ('canon', 'matthew', 2, 18, 'jubilees', 'jubilees', 32, 34,
   '*And Rachel died there and she was buried in the land of Ephrath, the same is Beth-lehem, and Ya''aqov (Jacob) built a pillar on the grave of Rachel, on the road above her grave.* Jubilees names the Rachel-tomb at Beth-lehem explicitly. The matriarchal weeping Matt 2:18 cites is geographically anchored exactly where the slaughter and the protection-of-the-Messianic-child both occur.'),

  -- Thread 11: plant-of-righteousness-and-the-branch (Matt 2:23)
  ('canon', 'matthew', 2, 23, 'enoch', '1-enoch', 10, 16,
   '*Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing.* 1 Enoch 10:16''s plant of righteousness — the Hebrew library''s witness to the same Messianic-Branch theology Matt 2:23 anchors at Natsareth (Nazareth). The *netser* (branch) of Isaiah 11:1 and the *plant of righteousness* of 1 Enoch 10:16 name the same figure.'),

  -- Thread 2 supplement: seed-promise-anchored-in-apocalypse-of-abraham (Matt 1:1)
  ('canon', 'matthew', 1, 1, 'apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6,
   '*As the number of the stars and their power, so will I make thy seed a nation and a people, set apart for me in my heritage.* The Apocalypse of Abraham extends the seed-promise of Genesis 22:17 / 15:5 — the same seed-promise the Matt 1:1 genealogy traces forward to the Messiah. The Hebrew library''s apocalyptic vision affirms the seed-line architecture Matthew opens his gospel with.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s131_verse_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s131_verse_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 11 extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'son-of-adam-named-before-creation',
       'The Son of Adam named before creation',
       'The Hebrew library''s extras-tier witness names the Son of Adam (called *Son of Man* in the inherited canon, restored to *Son of Adam* per Red Line #12) before the sun and stars were made. 1 Enoch 48:2-7 names him in the presence of Yahuah (God) of Spirits before creation. 1 Enoch 62:1 names his enthronement on the throne of glory. 1 Enoch 69:26 names the revelation of his name to the holy ones. The framework reads these passages as the extracanonical confirmation of the Formless-and-Formed nature-of-God reading the framework holds — the Formed pre-existent, the same figure Tanakh theophanies preserved, the same Yahusha (Jesus) of Matt 1:21 announced by name to Yoseph (Joseph) and by apposition *Immanuel — Elohim (God) with us* at Matt 1:23. The name is the gospel; the Hebrew library knew it before the gospel announced it.',
       sv.verse_id, ev.verse_id, 'extras', 100
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 21
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 1 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genealogy-as-adamic-toledot',
       'The genealogy as Adamic toledot',
       'Matthew''s opening phrase *biblos genéseōs* echoes the Septuagint of Genesis 5:1 — the same toledot the Hebrew library walks at greater chronological depth in Jubilees 4 and at celebratory length in Ecclesiasticus 44 (*Let us now praise famous men, and our fathers that begat us*). The Apocalypse of Abraham 20:6 carries the same seed-promise the genealogy traces. 1 Adam-Eve 1:1 opens at the Genesis-garden register the toledot descends from. The framework reads Matt 1:1 as standing in the Hebrew library''s own genealogical-celebration tradition — not first-century pedigree records, but the canon-opening toledot register the prophets and the Hebrew library always walked.',
       sv.verse_id, ev.verse_id, 'extras', 101
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 1 AND ev.verse_number = 1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tamar-in-yahudahs-own-voice',
       'Tamar in Yahudah''s (Judah''s) own voice',
       'Matt 1:3 names Tamar in the Messianic genealogy. The Hebrew library''s extras-tier witness narrates her story twice over: once in Jasher 45:23-32 with the patriarchal narrative detail Genesis compresses, and once in the Testament of Yahudah (Judah) (Testaments XII chapters 24-39) — the patriarch''s deathbed testament to his sons, in his own voice, walking the same Tamar episode Genesis 38 records. Jasher locates Tamar''s lineage in Shem''s line (a daughter of Elam, son of Shem), confirming the framework''s reading of the four women as seed-preservation markers within or adjacent to the covenant body rather than Gentile-inclusion proof-texts.',
       sv.verse_id, ev.verse_id, 'extras', 102
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 3
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 1 AND ev.verse_number = 3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthean-yoseph-and-the-patriarch-yoseph',
       'The Matthean Yoseph and the patriarch Yoseph',
       'The Yoseph (Joseph) of Matthew 1:18-25 / 2:13-15 / 2:20 carries the role of the patriarchal-Yoseph in Genesis 37-50: the dreamer, the one who carries the seed of promise down into Egypt, the preserver of the covenant line through a hostile king. The Testament of Yoseph (Testaments XII chapters 72-87) — the patriarch''s deathbed testament — supplies the extras-tier Hebrew-library framing for the typological pattern. Jubilees 46 walks the Egypt sojourn the Matthean Yoseph''s flight telescopes. The Matthean Yoseph is named *son of David* by the angel because he carries both lines into the child he will name — Davidic legal lineage and Yoseph-patriarchal preservation role.',
       sv.verse_id, ev.verse_id, 'extras', 103
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 18
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 2 AND ev.verse_number = 20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'levi-yahudah-benjamin-messianic-prophecies',
       'Levi, Yahudah (Judah), Benjamin — Messianic prophecies in the patriarchal testaments',
       'The Testaments XII Patriarchs (extras-tier, pseudepigrapha edition) carry pre-Christian Hebrew-library Messianic prophecies in the voices of the dying patriarchs themselves. Simeon Chapter 5 (Testaments XII ch 11): *the Yahuah (Lord) shall raise up from Levi as it were a High-priest, and from Yahudah (Judah) as it were a King, Elohim (God) and man.* Levi Chapter 9 (ch 20): *In the second jubilee, he that is anointed shall be conceived in the sorrow of beloved ones* — pre-conception prophecy. Benjamin Chapter 9 (ch 96): *there shall arise in the latter days one beloved of the Yahuah (Lord), of the tribe of Yahudah (Judah) and Levi.* Matthew 1:1''s genealogy lands the Hebrew library''s long-named expectation — David''s line plus Avraham''s line plus the doubled-tribal priestly-and-kingly Messianic figure.',
       sv.verse_id, ev.verse_id, 'extras', 104
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 1 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'magi-astronomical-tradition',
       'The Magi and the Book of Luminaries',
       '1 Enoch 72-82 — the Book of Luminaries — is the Hebrew library''s extras-tier astronomical-prophetic witness. The opening verse (*The book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons*) names the prophetic-astronomy tradition the Magi inherited via Daniel''s leadership of the Babylonian-Persian wise-men caste. The Animal Apocalypse of 1 Enoch 89-90 carries the Messianic-figure vision (the white bull / great-horned lamb) the Magi would have known to watch for. Matt 2:1-2''s star and the Magi''s recognition of it sit inside this tradition, not outside it.',
       sv.verse_id, ev.verse_id, 'extras', 105
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 2 AND ev.verse_number = 2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'incarnation-of-the-beloved',
       'The incarnation of the Beloved',
       'The Ascension of Isaiah — extras-tier scripture in the Hebrew library — carries an extracanonical witness to the virgin-conception and the descent-of-the-Formed narrative the framework reads at Matt 1:23. Ascension 11:2: *I saw a woman of the family of David... named Mary, and Virgin, and she was espoused to a man named Joseph, a carpenter, and he also was of the seed and family of the righteous David.* Ascension 10:8: *Go forth and descend through all the heavens.* Ascension 9:12: *till the Beloved will descend in the form in which you will see Him descend.* The Formless-and-Formed nature-of-God reading the framework holds is the same architecture the Ascension walks — the Beloved descending through the heavens into flesh, the Father remaining unseen, the Formed becoming Immanuel.',
       sv.verse_id, ev.verse_id, 'extras', 106
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 23
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 1 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'firstborn-son-out-of-egypt-extras',
       'Yashar''el (Israel) the firstborn — the creation-anchor of the Egypt-call',
       'Jubilees 2:20 — at the creation register — names the seed of Ya''aqov (Jacob) as Yahuah''s firstborn son before any historical event: *I have chosen the seed of Ya''aqov (Jacob) from amongst all that I have seen, and have written him down as My firstborn son, and have sanctified him to Myself for ever and ever.* The Hosea 11:1 / Exodus 4:22 firstborn-identification Matt 2:15 walks rests on this prior creation-anchor in the Hebrew library. Yashar''el is firstborn before the world; the call out of Egypt is the historical actualization of an eternal designation; Yahusha (Jesus) is the firstborn-Yashar''el embodied at every chronological register the Hebrew library carries.',
       sv.verse_id, ev.verse_id, 'extras', 107
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 15
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 2 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'pharaoh-mosheh-herod-yahusha-infant-slaughter',
       'The infant-slaughter pattern — Pharaoh, Herod, the deliverer preserved',
       'Jasher 67 walks the Pharaoh-Mosheh infant-slaughter narrative in greater detail than Exodus 1: *the Egyptians had embittered the lives of the children of Yashar''el (Israel)... Pharaoh began to spill the blood of the male children of Yashar''el (Israel).* Matthew 2:16''s Herod-slaughter at Beth-lehem is the latest beat of the same antichrist-pattern: a king fearing the prophesied deliverer orders the death of the male infants; the deliverer is preserved through a specific intervention; the rest perish; the pattern is named for what it is. The extras-tier Hebrew-library witness shows the typology has been operative across millennia, with the Messianic version at Matt 2 being the recapitulation, not the first instance.',
       sv.verse_id, ev.verse_id, 'extras', 108
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 13
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 2 AND ev.verse_number = 16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rachel-buried-at-bethlehem',
       'Rachel buried at Beth-lehem — the geographic anchor of the weeping',
       'Jubilees 32:33-34 names the death of Rachel in childbirth at Ephrath, *the same is Beth-lehem,* with her tomb on the road above her grave. The Jeremiah 31:15 *Rachel weeping for her children* that Matthew 2:18 quotes is geographically anchored exactly where the Beth-lehem slaughter falls and where the Messianic child is being protected. The matriarchal weeping is not a poetic flourish but a geographic fact: the tomb of the matriarch sits on the road where the children are killed and the deliverer escapes. The extras-tier Hebrew-library witness locks the geography the inherited canon compresses.',
       sv.verse_id, ev.verse_id, 'extras', 109
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 18
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 2 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'plant-of-righteousness-and-the-branch',
       'The plant of righteousness and the Branch',
       '1 Enoch 10:16 — at the close of the Watchers section in the framing of the destruction of all unrighteousness — names *the plant of righteousness and truth* that will appear after the judgment. The framework reads this as the same Messianic-Branch register the prophets walk (Isaiah 11:1''s *netser*, Jeremiah 23:5 / 33:15''s *tsemach*, Zechariah 3:8 / 6:12''s *BRANCH*). Matt 2:23''s settling in Natsareth (Nazareth — *Branch-town*) is the geographic fulfillment of the Branch-tradition the Hebrew library walks across both canon and extras. The extras-tier link surfaces the witness the Reformation''s canon-truncation cut.',
       sv.verse_id, ev.verse_id, 'extras', 110
  FROM _s131_verse_lookup sv, _s131_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 23
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 2 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------
-- Pattern: each row pairs the thread (by slug) with the cross_references
-- row (by source-verse / target-verse / source). The member_note is
-- short and may differ from the cross_references.note where the thread
-- context warrants a per-thread framing.
-- ---------------------------------------------------------------------

-- Thread 1: son-of-adam-named-before-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'The Son of Adam named in the presence of Yahuah (God) of Spirits — before sun and stars. The Yahusha (Jesus) named at Matt 1:21 IS the figure 1 Enoch 48:2 names by title.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'son-of-adam-named-before-creation'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 21
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 48 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'His name was named before the sun and the signs were created. The pre-existent naming the framework reads as the Formed''s existence-before-creation.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'son-of-adam-named-before-creation'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 21
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 48 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Chosen and hidden before the creation of the world — the Formed-pre-existent who becomes Immanuel.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'son-of-adam-named-before-creation'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 23
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 48 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'The enthronement of the Elect One — Yahuah of Spirits named him and seated him. The Messianic-enthronement the apostolic witness will articulate at the resurrection (Acts 13:33, Phil 2:9-11) is named here before the world began.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'son-of-adam-named-before-creation'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 23
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, 'The revelation of the name of the Son of Adam to the holy ones — the name itself is the gospel, and the Hebrew library named it before the angel announced it to Yoseph (Joseph).'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'son-of-adam-named-before-creation'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 21
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 69 AND tv.verse_number = 26
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: genealogy-as-adamic-toledot
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'The Hebrew library''s own celebration of the genealogical line — *Let us now praise famous men, and our fathers that begat us.* Ecclesiasticus 44 walks the same line Matthew opens his gospel with.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'genealogy-as-adamic-toledot'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 44 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Jubilees 4 walks the pre-flood Adamic toledot in chronological detail — Lamech, Methuselah, the Sethite line, Adam''s death at the close of the nineteenth jubilee.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'genealogy-as-adamic-toledot'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 4 AND tv.verse_number = 28
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'The closure of the Adamic-line — Adam''s death at the close of the nineteenth jubilee. The first Adamic toledot ends; the second begins at Matt 1:1.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'genealogy-as-adamic-toledot'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 4 AND tv.verse_number = 29
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'The Hebrew library''s extended Adamic narrative opens at the Genesis-garden register — the same Adamic source the toledot of Matt 1:1 descends from.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'genealogy-as-adamic-toledot'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'adam-eve-conflict' AND tv.book_slug = '1-adam-eve' AND tv.chapter_number = 1 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, 'The seed-promise carried in apocalyptic register — *as the number of the stars and their power, so will I make thy seed.* The seed-line Matt 1:1 traces is the same the Apocalypse of Abraham extends.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'genealogy-as-adamic-toledot'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocalypse-of-abraham' AND tv.book_slug = 'apocalypse-of-abraham' AND tv.chapter_number = 20 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: tamar-in-yahudahs-own-voice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Jasher locates Tamar''s lineage in Shem''s line — *Tamar the daughter of Elam, the son of Shem.* Shemitic by blood; the framework reads the four women as seed-preservation markers within or adjacent to the covenant body.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'tamar-in-yahudahs-own-voice'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 3
   AND tv.edition_slug = 'jasher' AND tv.book_slug = 'jasher' AND tv.chapter_number = 45 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'The conception of Peretz (Perez) and Zerah — *behold, there were twins in her womb.* The Davidic kingship-line walks through Peretz; Tamar''s case preserved the line.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'tamar-in-yahudahs-own-voice'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 3
   AND tv.edition_slug = 'jasher' AND tv.book_slug = 'jasher' AND tv.chapter_number = 45 AND tv.verse_number = 32
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'The patriarch Yahudah (Judah) himself, in his deathbed testament, narrates the Tamar episode — *Now Er was wicked, and he was in need concerning Tamar.* The Hebrew library''s pseudepigraphal voice of Yahudah (Judah) walks the same case Genesis 38 compresses.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'tamar-in-yahudahs-own-voice'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 3
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 26 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: matthean-yoseph-and-the-patriarch-yoseph
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'The Testament of Yoseph (Joseph) — Testaments XII chapters 72-87 — narrates the patriarchal-Yoseph''s deathbed words to his sons. The Matthean Yoseph carries the same role: dreamer, Egypt-carrier, preserver of the covenant line.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'matthean-yoseph-and-the-patriarch-yoseph'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 18
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 72 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Jubilees 46 walks the long sojourn-in-Egypt the patriarchal-Yoseph initiated. The Matthean Yoseph carrying the Messianic-child to Egypt at Matt 2:14 telescopes the same pattern.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'matthean-yoseph-and-the-patriarch-yoseph'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 14
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 46 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'The patriarchal-Yoseph willed his bones be carried out of Egypt — the Tanakh-prototype the Messianic-Yashar''el will fulfill in resurrection.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'matthean-yoseph-and-the-patriarch-yoseph'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 14
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 46 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: levi-yahudah-benjamin-messianic-prophecies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Simeon Chapter 5: *the Yahuah (Lord) shall raise up from Levi as it were a High-priest, and from Yahudah (Judah) as it were a King, Elohim (God) and man.* The doubled-tribal priestly-and-kingly Messiah explicitly named.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'levi-yahudah-benjamin-messianic-prophecies'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 11 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Levi Chapter 9: *In the second jubilee, he that is anointed shall be conceived in the sorrow of beloved ones.* The conception prophecy the Hebrew library walks before Matthew''s Yoseph (Joseph) receives the dream.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'levi-yahudah-benjamin-messianic-prophecies'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 23
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 20 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Benjamin Chapter 9: *there shall arise in the latter days one beloved of the Yahuah (Lord), of the tribe of Yahudah (Judah) and Levi.* The Beloved of the doubled-tribal lineage named by the youngest tribe''s testament.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'levi-yahudah-benjamin-messianic-prophecies'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 96 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: magi-astronomical-tradition
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'The Book of Luminaries opening — *the book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons.* The Hebrew prophetic-astronomy the Magi inherited.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'magi-astronomical-tradition'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 1
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 72 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'The Messianic-figure white-bull vision of the Animal Apocalypse — what the Magi who knew the Hebrew prophetic tradition were watching for.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'magi-astronomical-tradition'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 2
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'The Lamb who is also the great-horned one — *that lamb became a great animal and had great black horns on its head.* The Messianic-Lamb / King doubled identity the Magi recognized in the star.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'magi-astronomical-tradition'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 2
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 21
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: incarnation-of-the-beloved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'The Ascension of Isaiah''s witness to the conception narrative — Mary and Joseph both of David''s line, the virgin-conception named in the seventh-heaven vision.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'incarnation-of-the-beloved'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 23
   AND tv.edition_slug = 'ascension-isaiah' AND tv.book_slug = 'ascension-isaiah' AND tv.chapter_number = 11 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'The Father commissioning the Beloved to descend through the heavens — the framework''s Formless-and-Formed nature-of-God reading carried in apocalyptic register.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'incarnation-of-the-beloved'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 23
   AND tv.edition_slug = 'ascension-isaiah' AND tv.book_slug = 'ascension-isaiah' AND tv.chapter_number = 10 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'The pre-incarnation announcement of the Beloved''s descent in human form — *in the last days.* The Hebrew library''s framing of the incarnation Matt 1:23 announces.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'incarnation-of-the-beloved'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 1 AND sv.verse_number = 23
   AND tv.edition_slug = 'ascension-isaiah' AND tv.book_slug = 'ascension-isaiah' AND tv.chapter_number = 9 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 8: firstborn-son-out-of-egypt-extras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'The seed of Ya''aqov (Jacob) chosen as Yahuah''s firstborn at creation — the eternal designation behind the Hosea 11:1 / Exodus 4:22 / Matt 2:15 historical call.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'firstborn-son-out-of-egypt-extras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 15
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 2 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 9: pharaoh-mosheh-herod-yahusha-infant-slaughter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Jasher 67 walks the Pharaoh-infant-slaughter narrative — *the Egyptians had embittered the lives of the children of Yashar''el (Israel).*'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'pharaoh-mosheh-herod-yahusha-infant-slaughter'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 16
   AND tv.edition_slug = 'jasher' AND tv.book_slug = 'jasher' AND tv.chapter_number = 67 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '*Pharaoh began to spill the blood of the male children of Yashar''el (Israel)* — the same antichrist-pattern Herod walks at Beth-lehem.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'pharaoh-mosheh-herod-yahusha-infant-slaughter'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 16
   AND tv.edition_slug = 'jasher' AND tv.book_slug = 'jasher' AND tv.chapter_number = 67 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'The Mosheh-parent narrative — Amram and Yochaved (Jochebed) — the deliverer-preserved-through-the-slaughter prototype.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'pharaoh-mosheh-herod-yahusha-infant-slaughter'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 13
   AND tv.edition_slug = 'jasher' AND tv.book_slug = 'jasher' AND tv.chapter_number = 67 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 10: rachel-buried-at-bethlehem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Rachel''s death in childbirth at Beth-lehem — *Rachel bare a son in the night, and called his name Son of my sorrow.*'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'rachel-buried-at-bethlehem'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 18
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 32 AND tv.verse_number = 33
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '*She was buried in the land of Ephrath, the same is Beth-lehem* — the geographic anchor of the matriarchal weeping Matt 2:18 cites.'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'rachel-buried-at-bethlehem'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 18
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 32 AND tv.verse_number = 34
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 11: plant-of-righteousness-and-the-branch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '*Let the plant of righteousness and truth appear* — 1 Enoch 10:16''s extracanonical Branch-Messiah register. The *netser* of Isaiah 11:1 and the *plant of righteousness* of 1 Enoch name the same figure; Matt 2:23 anchors the figure geographically at Natsareth (Nazareth) — *Branch-town.*'
  FROM cross_reference_threads t, cross_references x,
       _s131_verse_lookup sv, _s131_verse_lookup tv
 WHERE t.slug = 'plant-of-righteousness-and-the-branch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 2 AND sv.verse_number = 23
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s131_verse_lookup;

\echo 'Session 131 migration complete. Verifying row counts...'

SELECT
    (SELECT count(*) FROM cross_references x WHERE x.tier_required = 'extras') AS extras_xref_rows,
    (SELECT count(*) FROM cross_reference_threads t WHERE t.tier_required = 'extras') AS extras_threads,
    (SELECT count(*) FROM cross_reference_thread_members m
       JOIN cross_reference_threads t ON t.id = m.thread_id
      WHERE t.tier_required = 'extras') AS extras_members;

COMMIT;

\echo 'Session 131 — Matt 1+2 extras-tier cross-references migration done.'
