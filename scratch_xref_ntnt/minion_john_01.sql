-- =====================================================================
-- S216 minion — John 1 (the prologue) NT-to-NT cross-references
-- =====================================================================
-- Range:  JOHN 1 only (the prologue — Word/Logos, Word made flesh,
--         light, the Lamb of Elohim, witness of John, calling of
--         disciples, "come and see", the Son of Adam at v.51).
-- Tag:    j01    (temp view: _s216_j01_lookup)
-- Sort band: 4000-4029
-- Output: scratch_xref_ntnt/minion_john_01.sql
--
-- SOURCE is always a canon John 1 verse.
-- TARGETS are other New-Testament books only (tier 'free').
--
-- WHAT IS ALREADY DONE (S181 session181_john_xref_threads.sql):
--   John 1:1  → 1 John 1:1   (word-made-flesh-formed-of-the-formless thread)
--   John 1:12 → Revelation 13:8  (born-not-of-blood thread)
--   John 1:13 → Romans 9:7, 9:8, Galatians 6:15, 1 Peter 1:23
--   John 1:18 → 1 Corinthians 11:3
--   John 14:9 → Colossians 1:15, Hebrews 1:3  (different source verse — not John 1)
--
-- FIVE NEW NT-TO-NT THREADS (all tier='free'):
--   1. john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1
--        (sort 4000) — John 1:1,3,14,16 → Colossians 1:15,16,17,19; Hebrews 1:1,2,3
--        Formed-one Christology: the Word/image/firstborn/creator/brightness of glory.
--
--   2. john-1-the-word-of-life-and-elohim-is-light-in-1-john-1
--        (sort 4001) — John 1:4,5,14 → 1 John 1:2,3,5,7
--        Light/life/fellowship: 1 John 1's epistle-opening extends the prologue register.
--        (John 1:1 → 1 John 1:1 already exists in S181; this thread adds v.4-5,14 rows.)
--
--   3. john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1
--        (sort 4002) — John 1:29,36 → Revelation 5:6,9,10; 1 Peter 1:19,20
--        The Lamb named at the Jordan; the Lamb slain and enthroned in Revelation 5;
--        foreordained before the foundation per 1 Peter 1.
--
--   4. john-1-the-spirit-descending-and-the-voice-from-heaven-in-matthew-mark-and-luke
--        (sort 4003) — John 1:32,33,34 → Matthew 3:16,17; Mark 1:10,11; Luke 3:21,22
--        The synoptic witness to the Spirit descending like a dove and the Father's voice.
--
--   5. john-1-heaven-open-and-the-son-of-adam-in-revelation-1
--        (sort 4004) — John 1:51 → Revelation 1:13
--        The open-heaven Son of Adam promise and its Revelation 1:13 fulfillment-vision
--        (the kaph-comparative "like unto the Son of Adam" — incarnation-honoring per Red Line #12).
--
-- 20 cross_reference rows, 20 thread_member rows.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- No BEGIN/COMMIT — orchestrator wraps the transaction.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the j01 S216 tag).
CREATE TEMP VIEW _s216_j01_lookup AS
SELECT
    e.slug  AS edition_slug,
    b.slug  AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id    AS verse_id
  FROM verses v
  JOIN chapters c  ON v.chapter_id  = c.id
  JOIN books    b  ON c.book_id     = b.id
  JOIN editions e  ON b.edition_id  = e.id
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
       'ascension-isaiah',
       'sonnini-acts-29'
   );

-- =====================================================================
-- cross_references INSERT
-- Source is always 'canon','john',1,v.
-- All targets are canon NT books.  tier_required = 'free'.
-- =====================================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- ---------------------------------------------------------------
  -- Thread 1: john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1
  -- Formed-one Christology — the prologue and its two clearest apostolic echoes.
  -- ---------------------------------------------------------------

  -- John 1:1 → Colossians 1:17
  ('canon', 'john', 1, 1,
   'canon', 'colossians', 1, 17,
   E'*And he is before all things, and by him all things consist.* (Colossians 1:17)\n\n*In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) The Word who was before all things and by whom all things hold together is the same Word who was in the beginning — not one of many co-eternal beings, but the Formed expression through whom the Formless sustains what he made.'),

  -- John 1:3 → Colossians 1:16
  ('canon', 'john', 1, 3,
   'canon', 'colossians', 1, 16,
   E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* (Colossians 1:16)\n\n*All things were made by him; and without him was not any thing made that was made.* (John 1:3) The gospel prologue and the apostle speak with one voice: the Formed one is not a created intermediary but the agent through whom every category of created thing — visible and invisible — came into being.'),

  -- John 1:14 → Colossians 1:15
  ('canon', 'john', 1, 14,
   'canon', 'colossians', 1, 15,
   E'*Who is the image of the invisible Elohim (God), the firstborn of every creature.* (Colossians 1:15)\n\n*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14) The glory that the disciples beheld in the Word made flesh is the glory of the one who is the image of the invisible Elohim (God). What John names as the glory of the only begotten, the apostle names as the image of the invisible source. The Formless has no visible image; the Formed is that image.'),

  -- John 1:16 → Colossians 1:19
  ('canon', 'john', 1, 16,
   'canon', 'colossians', 1, 19,
   E'*For it pleased the Father that in him should all fulness dwell.* (Colossians 1:19)\n\n*And of his fulness have all we received, and grace for grace.* (John 1:16) The fulness the Formed one received from the Father — named in the prologue as the fullness of grace and truth — is the same fullness the apostle names as all fulness dwelling in the Son by the Father''s will. Those who receive from that fullness receive from what the Formless has wholly deposited in the Formed.'),

  -- John 1:1 → Hebrews 1:2
  ('canon', 'john', 1, 1,
   'canon', 'hebrews', 1, 2,
   E'*Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds.* (Hebrews 1:2)\n\nThe Word who was in the beginning with Elohim (God) is the one through whom Elohim (God) made the worlds — the same agent named in John 1:1-3. The prologue says *all things were made by him*; Hebrews says the Father made the worlds *by him*. Both name the same reality: the Formless source expressed himself through the Formed one at creation.'),

  -- John 1:3 → Hebrews 1:3
  ('canon', 'john', 1, 3,
   'canon', 'hebrews', 1, 3,
   E'*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* (Hebrews 1:3)\n\nThe Word who made all things (John 1:3) upholds all things by the word of his power — the same creating Word who sustains. And the one who made, sustains, and purges sin is the brightness of the Father''s glory and the express image of his person: the Formed drawn from the Formless, visible and speakable where the Formless is not.'),

  -- ---------------------------------------------------------------
  -- Thread 2: john-1-the-word-of-life-and-elohim-is-light-in-1-john-1
  -- The light/life/fellowship register carried from prologue into epistle.
  -- (John 1:1 → 1 John 1:1 already in S181; these rows add v.4,5,14 pairings.)
  -- ---------------------------------------------------------------

  -- John 1:4 → 1 John 1:2
  ('canon', 'john', 1, 4,
   'canon', '1-john', 1, 2,
   E'*(For the life was manifested, and we have seen it, and bear witness, and shew unto you that eternal life, which was with the Father, and was manifested unto us;)* (1 John 1:2) John 1:4''s *in him was life; and the life was the light of men* — the prologue declares that life was in the Word; the epistle opening declares that this life was manifested — seen, witnessed, and now testified. The two voices belong to the same writer at two moments: the prologue names the architecture, the epistle confirms the witnesses who met the life in flesh.'),

  -- John 1:4 → 1 John 1:5
  ('canon', 'john', 1, 4,
   'canon', '1-john', 1, 5,
   E'*This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all.* (1 John 1:5)\n\nThe life that was the light of men (John 1:4) is rooted in the Formless source who is light without any admixture of darkness. The prologue establishes the light-in-the-Word; the epistle names the source: Elohim (God) himself is light. The chain is: the Formless is all-light; the Formed Word is that light expressed; in him is life, and that life is the light of men.'),

  -- John 1:5 → 1 John 1:7
  ('canon', 'john', 1, 5,
   'canon', '1-john', 1, 7,
   E'*But if we walk in the light, as he is in the light, we have fellowship one with another, and the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin.* (1 John 1:7)\n\n*And the light shineth in darkness; and the darkness comprehended it not.* (John 1:5) The light that the darkness could not comprehend is now the light in which the walking happens. The darkness of the world''s incomprehension at the prologue''s open becomes the arena the epistle calls the community to leave — walking into the light the darkness refused, into the fellowship the darkness cannot share.'),

  -- John 1:14 → 1 John 1:3
  ('canon', 'john', 1, 14,
   'canon', '1-john', 1, 3,
   E'*That which we have seen and heard declare we unto you, that ye also may have fellowship with us: and truly our fellowship is with the Father, and with his Son Yahusha HaMashiach (Jesus Christ).* (1 John 1:3)\n\nThe Word made flesh who *dwelt among us* (John 1:14) and whose glory the disciples beheld is the substance the epistle''s *we have seen and heard* testifies to. The fellowship offered — with the Father and with his Son — is available only because the Formed one took on flesh and was beheld. *We beheld his glory* (John 1:14) is the credential behind *we have seen and heard* (1 John 1:3).'),

  -- ---------------------------------------------------------------
  -- Thread 3: john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1
  -- The Lamb named at the Jordan and the Lamb who redeems by blood.
  -- ---------------------------------------------------------------

  -- John 1:29 → Revelation 5:6
  ('canon', 'john', 1, 29,
   'canon', 'revelation', 5, 6,
   E'*And I beheld, and, lo, in the midst of the throne and of the four beasts, and in the midst of the elders, stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth.* (Revelation 5:6)\n\n*Behold the Lamb of Elohim (God), which taketh away the sin of the world.* (John 1:29) Yochanan (John) the Witness names the Lamb at the Jordan; the Revelation shows the same Lamb at the throne — still bearing the marks of slaughter, but standing, seven-horned, full of the seven Spirits of Elohim (God). The one pointed out at the river is the one enthroned at the center of all things.'),

  -- John 1:29 → Revelation 5:9
  ('canon', 'john', 1, 29,
   'canon', 'revelation', 5, 9,
   E'*And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation.* (Revelation 5:9)\n\nThe Lamb who *taketh away the sin of the world* (John 1:29) is heard praised in the new song: redeemed out of every people and nation by his blood. The universal scope Yochanan (John) the Witness named — *of the world* — is the same scope the heavenly assembly celebrates. And the *out of every kindred* is not the false-inclusion gospel; it is the scattered seed of Yashar''el (Israel) dispersed among every kindred and tongue, gathered home through the blood of the Lamb.'),

  -- John 1:36 → Revelation 5:10
  ('canon', 'john', 1, 36,
   'canon', 'revelation', 5, 10,
   E'*And hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth.* (Revelation 5:10)\n\n*And looking upon Yahusha (Jesus) as he walked, he saith, Behold the Lamb of Elohim (God)!* (John 1:36) The second witness-cry over the Lamb at the Jordan names the one whose blood makes the redeemed kings and priests. The Lamb pointed out twice by Yochanan (John) the Witness is the Lamb whose work produces the priestly kingdom the prophets promised to the gathered remnant of Yashar''el (Israel).'),

  -- John 1:29 → 1 Peter 1:19
  ('canon', 'john', 1, 29,
   'canon', '1-peter', 1, 19,
   E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot.* (1 Peter 1:19)\n\nYochanan (John) the Witness names the Lamb of Elohim (God) without a qualification on the Lamb''s blamelessness; the apostle names the substance: the redemption is by the *blood of Messiah (Christ), as of a lamb without blemish and without spot* — the Pesach-lamb specification (Exodus 12:5) carried in the apostolic preaching. The Lamb without blemish pointed out at the Jordan is the Lamb without blemish whose blood the apostle names as the price of the redemption.'),

  -- John 1:29 → 1 Peter 1:20
  ('canon', 'john', 1, 29,
   'canon', '1-peter', 1, 20,
   E'*Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* (1 Peter 1:20)\n\nThe Lamb of Elohim (God) (John 1:29) did not become the Lamb at the Jordan — he was foreordained before the foundation of the world. The Witness''s recognition was not the beginning of the Lamb''s role but the making-manifest of what was settled before anything was made. The one who was *before me* (John 1:30) was before the world.'),

  -- ---------------------------------------------------------------
  -- Thread 4: john-1-the-spirit-descending-and-the-voice-from-heaven-in-matthew-mark-and-luke
  -- The synoptic witness to the same moment John 1:32-34 testifies.
  -- ---------------------------------------------------------------

  -- John 1:32 → Matthew 3:16
  ('canon', 'john', 1, 32,
   'canon', 'matthew', 3, 16,
   E'*And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him.* (Matthew 3:16)\n\n*And John bare record, saying, I saw the Spirit descending from heaven like a dove, and it abode upon him.* (John 1:32) Two witnesses to the same descent — the evangelist and the witness-voice at the river. The descending Spirit is not a metaphor; the Ruach HaKodesh (Holy Spirit) came upon the Formed one in bodily form at the moment the Witness was positioned to see and testify.'),

  -- John 1:33 → Mark 1:10
  ('canon', 'john', 1, 33,
   'canon', 'mark', 1, 10,
   E'*And straightway coming up out of the water, he saw the heavens opened, and the Spirit like a dove descending upon him.* (Mark 1:10)\n\n*He that sent me to baptize with water, the same said unto me, Upon whom thou shalt see the Spirit descending, and remaining on him, the same is he which baptizeth with the Ruach HaKodesh (Holy Spirit).* (John 1:33) The Witness was told exactly what sign to watch for. Mark records the sign as it happened. The two accounts lock together: the Witness''s testimony in John is the interpretive key for the event Mark records. The Spirit that descended was the Spirit who remained — not a temporary anointing but a permanent abiding.'),

  -- John 1:34 → Luke 3:21
  ('canon', 'john', 1, 34,
   'canon', 'luke', 3, 21,
   E'*Now when all the people were baptized, it came to pass, that Yahusha (Jesus) also being baptized, and praying, the heaven was opened.* (Luke 3:21)\n\n*And I saw, and bare record that this is the Son of Elohim (God).* (John 1:34) The Witness''s testimony — *this is the Son of Elohim (God)* — is the declarative conclusion to the event Luke anchors with the open heaven and prayer. Luke names the setting of the sign; the Witness names the identity the sign confirmed. Heaven opened when Yahusha (Jesus) prayed; the Spirit came; the Witness named what the open heaven disclosed.'),

  -- John 1:34 → Luke 3:22
  ('canon', 'john', 1, 34,
   'canon', 'luke', 3, 22,
   E'*And the Ruach HaKodesh (Holy Spirit) descended in a bodily shape like a dove upon him, and a voice came from heaven, which said, Thou art my beloved Son; in thee I am well pleased.* (Luke 3:22)\n\n*And I saw, and bare record that this is the Son of Elohim (God).* (John 1:34) The Witness''s testimony stands on the same event the Father''s own voice confirmed: *Thou art my beloved Son.* The Witness said *Son of Elohim (God)*; the Father said *my beloved Son*. These are not two different claims — they are the Witness repeating what he heard from the one who sent him, and the Father speaking it directly.'),

  -- ---------------------------------------------------------------
  -- Thread 5: john-1-heaven-open-and-the-son-of-adam-in-revelation-1
  -- The open-heaven Son of Adam promise and its Revelation 1:13 vision.
  -- ---------------------------------------------------------------

  -- John 1:51 → Revelation 1:13
  ('canon', 'john', 1, 51,
   'canon', 'revelation', 1, 13,
   E'*And in the midst of the seven candlesticks one like unto the Son of Adam, clothed with a garment down to the foot, and girt about the paps with a golden girdle.* (Revelation 1:13)\n\n*Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* (John 1:51) Yahusha (Jesus) promises that those who follow will see heaven open and the Son of Adam at the center of the traffic between heaven and earth. The Revelation opens with exactly that vision: heaven open, and one *like unto the Son of Adam* in the midst. The kaph-comparative (*like unto*) honors the incarnation — the Formed cloud-rider who took on flesh and *resembled* mortal-man because he became mortal-man, while remaining the one who walks among the lampstands. The promise of John 1:51 and the vision of Revelation 1:13 are the same sight from two angles.')

)
INSERT INTO cross_references
       (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j01_lookup sv
    ON sv.edition_slug  = i.src_edition
   AND sv.book_slug     = i.src_slug
   AND sv.chapter_number = i.src_ch
   AND sv.verse_number  = i.src_v
  JOIN _s216_j01_lookup tv
    ON tv.edition_slug  = i.tgt_edition
   AND tv.book_slug     = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch
   AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- threads INSERT
-- Five threads, tier='free', sort_order 4000-4004.
-- =====================================================================

-- Thread 1: john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1',
    E'The Word and the image of the invisible — Colossians 1 and Hebrews 1',
    E'The prologue of John and two apostolic letters read the same architecture. The Formless source — no eye has seen him, no ear has heard the Formless directly — expresses himself through the Formed Word: the image of the invisible Elohim (God), the brightness of his glory, the express image of his person. The gospel opens with that architecture in eighteen verses; Colossians 1 and Hebrews 1 confirm it in the apostolic proclamation.\n\n*In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God). ... All things were made by him; and without him was not any thing made that was made.* (John 1:1,3)\n\n*Who is the image of the invisible Elohim (God), the firstborn of every creature: For by him were all things created, that are in heaven, and that are in earth, visible and invisible ... all things were created by him, and for him: And he is before all things, and by him all things consist.* (Colossians 1:15-17)\n\n*Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds; Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power.* (Hebrews 1:2-3)\n\nThese are not independent theological developments. They are three witnesses to the same Formed-one: the maker, the sustainer, the image, the firstborn, the brightness. The fullness of what the prologue says the disciples beheld — the glory of the only begotten — is what the Father deposited wholly in the Son. *For it pleased the Father that in him should all fulness dwell.* (Colossians 1:19) *And of his fulness have all we received, and grace for grace.* (John 1:16)',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4000
  FROM _s216_j01_lookup sv, _s216_j01_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: john-1-the-word-of-life-and-elohim-is-light-in-1-john-1
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-1-the-word-of-life-and-elohim-is-light-in-1-john-1',
    E'The Word of life and Elohim is light — 1 John 1',
    E'The gospel prologue and the epistle opening are two halves of one declaration. The prologue names the architecture: in the Word was life, and that life was the light of men, and the light shines in darkness, and the darkness could not take it. The epistle names the witnesses and makes the invitation: the eternal life that was with the Father was manifested, we saw it, and we declare it to you so that you may have fellowship with the Father and with his Son.\n\n*In him was life; and the life was the light of men. And the light shineth in darkness; and the darkness comprehended it not.* (John 1:4-5)\n\n*(For the life was manifested, and we have seen it, and bear witness, and shew unto you that eternal life, which was with the Father, and was manifested unto us.)* (1 John 1:2)\n\n*This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all.* (1 John 1:5)\n\nElohim (God) is light — no darkness at all. The Formed one who is the brightness of the Father''s glory (Hebrews 1:3) carries light without darkness because the source carries light without darkness. Those who saw the Word made flesh (John 1:14) saw that light. They beheld its glory. And now they declare it: come into fellowship, walk in the light, and the blood of Yahusha HaMashiach (Jesus Christ) cleanses from all sin.\n\n*But if we walk in the light, as he is in the light, we have fellowship one with another, and the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin.* (1 John 1:7)',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4001
  FROM _s216_j01_lookup sv, _s216_j01_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1',
    E'The Lamb of Elohim and the Lamb slain — Revelation 5 and 1 Peter 1',
    E'Yochanan (John) the Witness looks up from his baptizing at the Jordan and names the one walking toward him: *Behold the Lamb of Elohim (God), which taketh away the sin of the world.* (John 1:29) He names him again the next day: *Behold the Lamb of Elohim (God)!* (John 1:36) These two cries at the start of the gospel are two points of entry into a thread that runs through the whole of the apostolic witness.\n\n*And I beheld, and, lo, in the midst of the throne and of the four beasts, and in the midst of the elders, stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth.* (Revelation 5:6)\n\nThe Lamb still bears the marks of slaughter — *as it had been slain* — but stands at the center of the throne. The Jordan witness and the throne vision are the same Lamb, the same marks, the same identity. And the new song names what the Lamb accomplished:\n\n*And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation; And hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth.* (Revelation 5:9-10)\n\nRedeemed *out of every kindred, tongue, people, and nation* — not a false-inclusion gospel that makes any person from any nation a covenant heir by faith-confession, but the scattered seed of Yashar''el (Israel) dispersed through every nation by the exile, gathered home by the blood of the Lamb. The Lamb''s work produces the kingdom of priests the prophets promised to the gathered remnant.\n\nThe apostle names the Lamb''s foreordination:\n\n*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot: Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* (1 Peter 1:19-20)\n\nThe one Yochanan (John) the Witness pointed to was not revealed at the Jordan. He was foreordained before the foundation of the world. The Witness was given a sign to watch for; the Lamb was ready from before there was a Jordan to stand beside.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4002
  FROM _s216_j01_lookup sv, _s216_j01_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 29
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: john-1-the-spirit-descending-and-the-voice-from-heaven-in-matthew-mark-and-luke
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-1-the-spirit-descending-and-the-voice-from-heaven-in-matthew-mark-and-luke',
    E'The Spirit descending and the voice from heaven — Matthew, Mark, and Luke',
    E'Yochanan (John) the Witness did not know Yahusha (Jesus) by sight. He knew the Messiah was coming. He had been told: when you see the Spirit descending and remaining on a man, that is the one who baptizes with the Ruach HaKodesh (Holy Spirit). And then the sign came.\n\n*And John bare record, saying, I saw the Spirit descending from heaven like a dove, and it abode upon him. And I knew him not: but he that sent me to baptize with water, the same said unto me, Upon whom thou shalt see the Spirit descending, and remaining on him, the same is he which baptizeth with the Ruach HaKodesh (Holy Spirit). And I saw, and bare record that this is the Son of Elohim (God).* (John 1:32-34)\n\nThe Witness''s testimony in John 1 is the first-person account. The three synoptics carry the same event from the narrative register:\n\n*And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him: And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.* (Matthew 3:16-17)\n\n*And straightway coming up out of the water, he saw the heavens opened, and the Spirit like a dove descending upon him: And there came a voice from heaven, saying, Thou art my beloved Son, in whom I am well pleased.* (Mark 1:10-11)\n\n*And the Ruach HaKodesh (Holy Spirit) descended in a bodily shape like a dove upon him, and a voice came from heaven, which said, Thou art my beloved Son; in thee I am well pleased.* (Luke 3:22)\n\nFour accounts, one event, one descent, one voice. The Father named the Son. The Spirit confirmed the Son. The Witness testified the Son. The four gospels carry four angles on the moment that opened the ministry. The Witness said *Son of Elohim (God)*; the Father said *my beloved Son*; the Spirit rested on him; and the one the Witness had been sent to identify stood there, having come up out of the water.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4003
  FROM _s216_j01_lookup sv, _s216_j01_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 32
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 34
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: john-1-heaven-open-and-the-son-of-adam-in-revelation-1
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-1-heaven-open-and-the-son-of-adam-in-revelation-1',
    E'Heaven open and the Son of Adam — Revelation 1',
    E'At the close of the first chapter, before the ministry has properly begun, Yahusha (Jesus) gives Nathanael a promise that reaches past anything Nathanael has yet seen:\n\n*And he saith unto him, Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* (John 1:51)\n\nYa''aqov (Jacob) at Bethel saw a ladder set up from earth to heaven, and the angels ascending and descending on it, and Yahuah (the LORD) above it (Genesis 28:12-13). Yahusha (Jesus) names himself as the substance that ladder was a shadow of: heaven will be open and the traffic between heaven and earth will run upon him, the Son of Adam. The lineage-name carries the weight — this is the seed of Adam, the Formed one who took on Adamic flesh, who stands at the point where heaven and earth meet.\n\nThe promise was kept. The seer on Patmos received the fulfillment:\n\n*And in the midst of the seven candlesticks one like unto the Son of Adam, clothed with a garment down to the foot, and girt about the paps with a golden girdle.* (Revelation 1:13)\n\nThe kaph — *like unto* — is not a hedge on identity. It is incarnation-honoring. The Formed cloud-rider who rides Yahuah''s (God''s) clouds, who has always been the one who appears, *resembled* mortal-man because he took on flesh and became mortal-man, while remaining the Formed. The vision says *like unto the Son of Adam* because the Son of Adam is the Standard the figure resembles — the named one the comparison points back to. The same Son of Adam who promised open heaven at the Jordan now walks among the seven lampstands, and the seer who laid his head on his chest at the last supper falls at his feet as dead (Revelation 1:17). Heaven is open. The Son of Adam is there.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4004
  FROM _s216_j01_lookup sv, _s216_j01_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 51
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 51
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- thread_members INSERT
-- =====================================================================

-- ---------------------------------------------------------------
-- Thread 1 members: john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1
-- ---------------------------------------------------------------

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 1:17 — *he is before all things, and by him all things consist.* The Word before all things; John 1:1''s *in the beginning was the Word.*'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'colossians' AND tv.chapter_number = 1 AND tv.verse_number = 17
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:16 — *by him were all things created ... all things were created by him, and for him.* John 1:3''s *all things were made by him* — same naming, same Formed agent.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 3
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'colossians' AND tv.chapter_number = 1 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:15 — *the image of the invisible Elohim (God).* John 1:14''s *we beheld his glory* — the Formed one is the image of the Formless; what the disciples beheld was the image of what no eye sees.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 14
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'colossians' AND tv.chapter_number = 1 AND tv.verse_number = 15
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:19 — *in him should all fulness dwell.* John 1:16''s *of his fulness have all we received* — the fullness the Father deposited in the Son is what those who receive from him draw from.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 16
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'colossians' AND tv.chapter_number = 1 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 1:2 — *by whom also he made the worlds.* John 1:1''s Word in the beginning — same Formed creator-agent, named across the gospel and the epistle to the Hebrews.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'hebrews' AND tv.chapter_number = 1 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Hebrews 1:3 — *the brightness of his glory, and the express image of his person, upholding all things by the word of his power.* John 1:3''s maker-Word; the creating Word is the sustaining Word is the brightness of the Father''s glory.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-the-image-of-the-invisible-in-colossians-1-and-hebrews-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 3
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'hebrews' AND tv.chapter_number = 1 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------
-- Thread 2 members: john-1-the-word-of-life-and-elohim-is-light-in-1-john-1
-- ---------------------------------------------------------------

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 1:2 — *the life was manifested, and we have seen it ... that eternal life, which was with the Father.* John 1:4''s *in him was life* — the life the prologue names is what the Witness-community saw manifested.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-of-life-and-elohim-is-light-in-1-john-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 4
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 1 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 1:5 — *Elohim (God) is light, and in him is no darkness at all.* John 1:4''s *the life was the light of men* — the life-light of the Word flows from a source that is pure light, no darkness at all.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-of-life-and-elohim-is-light-in-1-john-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 4
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 1 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 1:7 — *if we walk in the light ... the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin.* John 1:5''s light that darkness cannot extinguish — the invitation now: walk into the light the darkness refused.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-of-life-and-elohim-is-light-in-1-john-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 5
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 1 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 1:3 — *our fellowship is with the Father, and with his Son Yahusha HaMashiach (Jesus Christ).* John 1:14''s *we beheld his glory* — the beholding produces the testimony; the testimony produces the fellowship.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-of-life-and-elohim-is-light-in-1-john-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 14
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 1 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------
-- Thread 3 members: john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1
-- ---------------------------------------------------------------

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 5:6 — *stood a Lamb as it had been slain, having seven horns and seven eyes.* John 1:29''s *Lamb of Elohim (God)* pointed at the river — the same Lamb, marked and standing, at the center of the throne.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 29
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'revelation' AND tv.chapter_number = 5 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 5:9 — *thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, tongue, people, and nation.* John 1:29''s *taketh away the sin of the world* — the scope named at the Jordan, the redemption declared in the new song.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 29
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'revelation' AND tv.chapter_number = 5 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:10 — *hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth.* John 1:36''s second *Behold the Lamb* — the Lamb''s blood produces the priestly kingdom the gathered remnant enters.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 36
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'revelation' AND tv.chapter_number = 5 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:19 — *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot.* John 1:29''s Lamb named — the blamelessness the Pesach specification required, carried in the apostolic proclamation.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 29
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-peter' AND tv.chapter_number = 1 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 1:20 — *foreordained before the foundation of the world, but was manifest in these last times.* John 1:29''s Lamb walking toward the Witness — not revealed at the Jordan but manifested there; foreordained before the world began.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-lamb-of-elohim-and-the-lamb-slain-in-revelation-5-and-1-peter-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 29
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-peter' AND tv.chapter_number = 1 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------
-- Thread 4 members: john-1-the-spirit-descending-and-the-voice-from-heaven-in-matthew-mark-and-luke
-- ---------------------------------------------------------------

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 3:16 — *the heavens were opened ... the Spirit of Elohim (God) descending like a dove, and lighting upon him.* John 1:32''s Witness-testimony confirmed: same Spirit, same descent, same moment.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-spirit-descending-and-the-voice-from-heaven-in-matthew-mark-and-luke'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 32
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'matthew' AND tv.chapter_number = 3 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 1:10 — *the heavens opened, and the Spirit like a dove descending upon him.* John 1:33''s *Spirit descending and remaining* — Mark records the descent; the Witness names the staying. The sign was given; the Witness saw it hold.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-spirit-descending-and-the-voice-from-heaven-in-matthew-mark-and-luke'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 33
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'mark' AND tv.chapter_number = 1 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 3:21 — *Yahusha (Jesus) also being baptized, and praying, the heaven was opened.* John 1:34''s *this is the Son of Elohim (God)* — Luke names the open heaven; the Witness names the identity the open heaven disclosed.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-spirit-descending-and-the-voice-from-heaven-in-matthew-mark-and-luke'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 34
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'luke' AND tv.chapter_number = 3 AND tv.verse_number = 21
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 3:22 — *a voice came from heaven, which said, Thou art my beloved Son; in thee I am well pleased.* John 1:34''s *this is the Son of Elohim (God)* — the Witness repeated what the Father said; the Father said it first.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-the-spirit-descending-and-the-voice-from-heaven-in-matthew-mark-and-luke'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 34
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'luke' AND tv.chapter_number = 3 AND tv.verse_number = 22
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------
-- Thread 5 members: john-1-heaven-open-and-the-son-of-adam-in-revelation-1
-- ---------------------------------------------------------------

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 1:13 — *one like unto the Son of Adam, clothed with a garment down to the foot.* John 1:51''s *ye shall see heaven open, and the angels ascending and descending upon the Son of Adam* — the promise kept; the kaph honors the incarnation of the Formed cloud-rider who took on flesh.'
  FROM cross_reference_threads t, cross_references x, _s216_j01_lookup sv, _s216_j01_lookup tv
 WHERE t.slug = 'john-1-heaven-open-and-the-son-of-adam-in-revelation-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 51
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'revelation' AND tv.chapter_number = 1 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
