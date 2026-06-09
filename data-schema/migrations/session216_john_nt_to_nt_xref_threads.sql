-- =====================================================================
-- Session 216 — John New-Testament-to-New-Testament cross-references
-- =====================================================================
-- Fills the NT-to-NT authoring gap identified in S214
-- (S214_JOHN_CANON_XREF_DIAGNOSIS.md): the canon John apparatus carried
-- complete Tanakh-source coverage (S181/S194) and full extras-library
-- coverage (S212), but the New-Testament-to-New-Testament layer was thin
-- (27 of ~265 targets, concentrated in a handful of chapters). This
-- migration adds curated, framework-bearing John <-> other-NT threads
-- across all 21 chapters: SOURCE is always a canon John verse; TARGETS
-- are verses in other NT books (the synoptics, Acts, the Pauline corpus,
-- Hebrews, 1-2 Peter, 1-2-3 John, Revelation), paired by genuine textual
-- fit wherever it falls rather than by any per-family quota.
--
-- Authored on the edition-aware FULL-LIBRARY schema from the start (the
-- lookup view lists every restored edition; input(...) tuples carry
-- src_edition / tgt_edition columns), so it PASSES _xref_audit.py's
-- FULL-LIBRARY guard rather than re-incurring the canon-only regression
-- that put S181/S194 on the back-fill list. All NT-to-NT targets are in
-- the 'canon' edition; tier_required = 'free' (canonical scripture cross-
-- references, visible at every tier).
--
-- Come-and-See posture: every verse quoted IN FULL in italics with the
-- citation in parentheses, in summary_md, per-row note, and member_note.
-- Sacred Names restored; son-of-man -> Son of Adam (kaph-comparative
-- preserved only at Dan 7:13 / Rev 1:13 / Rev 14:14); English book-name
-- slug fragments. Every thread cleared against the 12 Red Lines + the
-- 12-point editorial checklist (S216 voice-gate review).
--
-- Assembled from six per-chapter-range minion fragments (S216 wave):
--   John 1 | John 2-4 | John 5-8 | John 9-12 | John 13-17 | John 18-21.
-- 42 threads, 140 cross_reference rows, 140 thread_member rows; sort
-- band 4000-4318 (no overlap with the S181/S194/S212 John bands).
-- Quote fidelity verified against the parsed canon (verify_fidelity.py:
-- 139 faithful + 1 confirmed-verbatim false positive at 1 John 1:2, a
-- wholly-parenthetical KJV verse the normalizer strips before shingling).
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- Apply (from Yoshi's Mac Terminal):
--   python3 api/apply_migration.py data-schema/migrations/session216_john_nt_to_nt_xref_threads.sql
-- Apply AFTER the canon John baselines (S181 + S194), which the reader
-- still needs applied per S214_JOHN_CANON_XREF_DIAGNOSIS.md.
-- =====================================================================

\echo 'Session 216 — John NT-to-NT cross-references starting...'
BEGIN;


-- ===================== fragment: minion_john_01.sql =====================
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

-- ===================== fragment: minion_john_02_04.sql =====================
-- =====================================================================
-- S216 minion — John 2, 3, 4 NT-to-NT cross-references
-- =====================================================================
-- Range:  John chapters 2, 3, 4
--         (water-to-wine / temple cleansed; born again / new heart /
--         Son of Adam lifted up / belief; Samaritan woman / living
--         water / worship in spirit and truth / harvest white)
-- Tag:    j02_04  (temp view _s216_j02_04_lookup)
-- Sort band: 4030-4089
-- Output: scratch_xref_ntnt/minion_john_02_04.sql
--
-- Nine new NT-to-NT threads (tier='free'), all source John 2/3/4:
--
--   JOHN 2:
--   1. john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple
--        (sort 4030) — Matthew 21:12-13; Mark 11:15-17; Luke 19:45-46;
--                      Acts 7:48; 1 Corinthians 6:19-20
--   2. john-2-destroy-this-temple-and-the-greater-tabernacle-not-made-with-hands-in-hebrews
--        (sort 4031) — Hebrews 9:11-12; Hebrews 10:19-20
--
--   JOHN 3:
--   3. john-3-born-of-water-and-spirit-and-the-washing-of-regeneration-in-titus-3
--        (sort 4040) — Titus 3:5-7
--   4. john-3-born-again-of-incorruptible-seed-in-1-peter-1
--        (sort 4041) — 1 Peter 1:23-25
--   5. john-3-the-son-of-adam-lifted-up-and-the-crucified-messiah-in-1-corinthians-1-and-philippians-2
--        (sort 4042) — 1 Corinthians 1:23-24; Philippians 2:8-9
--   6. john-3-16-18-the-father-sent-the-only-begotten-son-confirmed-in-1-john-4
--        (sort 4043) — 1 John 4:9-10, 14
--
--   JOHN 4:
--   7. john-4-living-water-and-the-water-of-life-in-revelation-7-21-22
--        (sort 4050) — Revelation 7:16-17; Revelation 22:1, 17
--   8. john-4-worship-in-spirit-and-truth-and-the-new-and-living-way-in-hebrews-10
--        (sort 4051) — Hebrews 10:19-22
--   9. john-4-the-fields-white-to-harvest-and-the-harvest-of-the-age-in-matthew-9-and-13
--        (sort 4052) — Matthew 9:37-38; Matthew 13:37-43
--
-- 20 cross_reference rows, 20 thread_member rows, all tier='free'.
-- No BEGIN/COMMIT — orchestrator wraps the transaction.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the j02_04 tag).
CREATE TEMP VIEW _s216_j02_04_lookup AS
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
       'ascension-isaiah',
       'sonnini-acts-29'
   );

-- ---------------------------------------------------------------------
-- Insert 20 free-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- ===== Thread 1: john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple =====

  -- John 2:14-16 → Matthew 21:12-13 (synoptic parallel)
  ('canon', 'john', 2, 14, 'canon', 'matthew', 21, 12,
   E'*And Yahusha (Jesus) went into the temple of Elohim (God), and cast out all them that sold and bought in the temple, and overthrew the tables of the moneychangers, and the seats of them that sold doves* (Matthew 21:12). Matthew''s account of the same cleansing John records: the Formed one entering his own house and driving out those who had turned it into a market. John places the cleansing at the opening of the ministry (John 2:13–16); the synoptics place it in the final week. The act is the same — the One who owns the house arrives and reclaims it.'),

  -- John 2:16 → Mark 11:17 (synoptic parallel — the "house of prayer" declaration)
  ('canon', 'john', 2, 16, 'canon', 'mark', 11, 17,
   E'*And he taught, saying unto them, Is it not written, My house shall be called of all nations the house of prayer? but ye have made it a den of thieves* (Mark 11:17). Mark''s account of the temple declaration carries what John 2:16 compresses to *make not my Father''s house an house of merchandise*: the court turned into a trading floor was the court appointed to receive the gathered from all nations. The cleansing reclaims the house for the gathering it was built for.'),

  -- John 2:15-16 → Luke 19:45-46 (synoptic parallel)
  ('canon', 'john', 2, 15, 'canon', 'luke', 19, 45,
   E'*And he went into the temple, and began to cast out them that sold therein, and them that bought; saying unto them, It is written, My house is the house of prayer: but ye have made it a den of thieves* (Luke 19:45–46). Luke''s account records the same driving-out John''s chapter opens the ministry with. Three witnesses to the same zeal: the Formed one who owns the house will not tolerate the market in the court appointed for the gathered people''s approach to his Father.'),

  -- John 2:21 → Acts 7:48 (the body / the Formed one is the true dwelling — Stephen)
  ('canon', 'john', 2, 21, 'canon', 'acts', 7, 48,
   E'*Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet* (Acts 7:48). Stephen''s defence before the council names the same truth John 2:21 unveils after the cleansing: *he spake of the temple of his body.* The stone house was never the final dwelling; the El Elyon (most High) was always moving toward a habitation not made with hands — the body of the Formed one first, and then the gathered people in whom he takes up residence.'),

  -- John 2:21 → 1 Corinthians 6:19-20 (your body is the temple of the Holy Spirit)
  ('canon', 'john', 2, 21, 'canon', '1-corinthians', 6, 19,
   E'*What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own? For ye are bought with a price: therefore glorify Elohim (God) in your body, and in your spirit, which are Elohim''s (God''s)* (1 Corinthians 6:19–20). The Formed one''s body was the true temple (John 2:21); the Spirit of the Formed one now tabernacles in the bodies of those gathered to him. The temple Yahusha (Jesus) raised in three days is the template for the dwelling the Ruach HaKodesh (Holy Spirit) now occupies.'),

  -- ===== Thread 2: john-2-destroy-this-temple-and-the-greater-tabernacle-not-made-with-hands-in-hebrews =====

  -- John 2:19 → Hebrews 9:11-12 (greater tabernacle not made with hands / own blood)
  ('canon', 'john', 2, 19, 'canon', 'hebrews', 9, 11,
   E'*But Messiah (Christ) being come an high priest of good things to come, by a greater and more perfect tabernacle, not made with hands, that is to say, not of this building; neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us* (Hebrews 9:11–12). *Destroy this temple, and in three days I will raise it up* (John 2:19) is the announcement Hebrews 9 unpacks: the true tabernacle is not of this building; the true high priest enters the true holy place by his own blood, not by bulls and calves. The three-day raising is the entry.'),

  -- John 2:21 → Hebrews 10:19-20 (new and living way through the veil / his flesh)
  ('canon', 'john', 2, 21, 'canon', 'hebrews', 10, 19,
   E'*Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus), by a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh* (Hebrews 10:19–20). The veil is his flesh — the body that was destroyed and raised. John 2:21''s *he spake of the temple of his body* is the same identification Hebrews 10 opens the holiest through: the flesh of the Formed one is both the veil and the new and living way through it. The three-day raising consecrated the path back into the presence.'),

  -- ===== Thread 3: john-3-born-of-water-and-spirit-and-the-washing-of-regeneration-in-titus-3 =====

  -- John 3:5 → Titus 3:5 (washing of regeneration and renewing of the Holy Spirit)
  ('canon', 'john', 3, 5, 'canon', 'titus', 3, 5,
   E'*Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5). Yahusha''s (Jesus''s) *except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God)* (John 3:5) is the same architecture Titus 3:5 names from the inside: the washing of regeneration is the water-and-Spirit birth, given according to his mercy. Not by works of righteousness — not by fleshly credential — but by the mercy that washes and renews. Grace here is the means of return to him: the Spirit who regenerates is the same Spirit who writes the Torah inward.'),

  -- John 3:6-7 → Titus 3:6-7 (shed on us / heirs of eternal life)
  ('canon', 'john', 3, 6, 'canon', 'titus', 3, 6,
   E'*Which he shed on us abundantly through Yahusha HaMashiach (Jesus Christ) our Saviour; that being justified by his grace, we should be made heirs according to the hope of eternal life* (Titus 3:6–7). *That which is born of the flesh is flesh; and that which is born of the Spirit is spirit* (John 3:6) — the new birth is a birth from above, poured out abundantly through Yahusha HaMashiach (Jesus Christ). Justified by his grace to become heirs: the Spirit poured out is the seal of the inheritance, the same inheritance John 3:15-16 names as everlasting life.'),

  -- ===== Thread 4: john-3-born-again-of-incorruptible-seed-in-1-peter-1 =====

  -- John 3:3 → 1 Peter 1:23 (born again of incorruptible seed)
  ('canon', 'john', 3, 3, 'canon', '1-peter', 1, 23,
   E'*Being born again, not of corruptible seed, but of incorruptible, by the word of Elohim (God), which liveth and abideth for ever* (1 Peter 1:23). *Except a man be born again, he cannot see the kingdom of Elohim (God)* (John 3:3) — Kefa (Peter) names the substance of what Yahusha (Jesus) said to Nicodemus: the new birth is by the living and abiding word of Elohim (God), incorruptible seed. Not the corruptible seed of fleshly descent, not the credential of circumcision and lineage alone, but the word that lives and abides — the same word that *lighteth every man* (John 1:9) and calls the scattered home.'),

  -- John 3:7 → 1 Peter 1:25 (the word endureth for ever)
  ('canon', 'john', 3, 7, 'canon', '1-peter', 1, 25,
   E'*But the word of Yahuah (Lord) endureth for ever. And this is the word which by the gospel is preached unto you* (1 Peter 1:25). *Marvel not that I said unto thee, Ye must be born again* (John 3:7) — the necessity of the new birth is grounded in the permanent word that endures forever. The grass withers and the flower falls; the word that births the new creation does not. Kefa (Peter) ties the born-again word directly to the good news being proclaimed: the word of Yahuah (Lord) that endures is the same word by which the scattered are called home and born again.'),

  -- ===== Thread 5: john-3-the-son-of-adam-lifted-up-in-1-corinthians-1-and-philippians-2 =====

  -- John 3:14-15 → 1 Corinthians 1:23-24 (Messiah crucified / the power and wisdom of God)
  ('canon', 'john', 3, 14, 'canon', '1-corinthians', 1, 23,
   E'*But we preach Messiah (Christ) crucified, unto the Yahudim (Jews) a stumblingblock, and unto the Greeks foolishness; but unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:23–24). *And as Moses lifted up the serpent in the wilderness, even so must the Son of Adam be lifted up* (John 3:14) — the lifting up is the crucifixion Paul names plainly in 1 Corinthians 1: the cross that is foolishness to those not hearing the Shepherd''s voice, and the power and wisdom of Elohim (God) to those who are called. The brass serpent was the cure for those who looked; the lifted-up Son of Adam is the cure for those who believe.'),

  -- John 3:14 → Philippians 2:8-9 (obedient unto death / Elohim highly exalted him)
  ('canon', 'john', 3, 14, 'canon', 'philippians', 2, 8,
   E'*And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross. Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:8–9). The *lifting up* of John 3:14 has two movements — the humbling down into death and the exaltation upward into the name above every name. Philippians 2 names both in sequence: the Son of Adam is first lifted up onto the cross in obedience (the downward lifting), then lifted up by the Father to the highest place (the upward exaltation). The same motion the brass serpent enacted — first pole-planted, then the glance of those who look brings life.'),

  -- ===== Thread 6: john-3-16-18-the-father-sent-the-only-begotten-in-1-john-4 =====

  -- John 3:16 → 1 John 4:9-10 (manifested love / only begotten sent)
  ('canon', 'john', 3, 16, 'canon', '1-john', 4, 9,
   E'*In this was manifested the love of Elohim (God) toward us, because that Elohim (God) sent his only begotten Son into the world, that we might live through him. Herein is love, not that we loved Elohim (God), but that he loved us, and sent his Son to be the propitiation for our sins* (1 John 4:9–10). *For Elohim (God) so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life* (John 3:16) — the same sending named from two angles. John 3:16 names the scope: so loved the world. 1 John 4:9-10 names the direction: not that we loved him first; love originated in him and moved toward us. The Father sent the Son — this is the architecture; nothing proceeds from below upward that was not first initiated from above.'),

  -- John 3:17 → 1 John 4:14 (sent to be Saviour of the world)
  ('canon', 'john', 3, 17, 'canon', '1-john', 4, 14,
   E'*And we have seen and do testify that the Father sent the Son to be the Saviour of the world* (1 John 4:14). *For Elohim (God) sent not his Son into the world to condemn the world; but that the world through him might be saved* (John 3:17) — the apostolic testimony of 1 John 4:14 is a direct echo of the declaration John 3:17 records from the Formed one himself. *The Father sent the Son to be the Saviour of the world* — not to judge it down, but to save it through him. The same Formed one, the same mission, named first by the Son and later testified by the eyewitnesses.'),

  -- ===== Thread 7: john-4-living-water-and-the-water-of-life-in-revelation-7-21-22 =====

  -- John 4:10-11 → Revelation 7:16-17 (shall hunger/thirst no more / living fountains of waters)
  ('canon', 'john', 4, 10, 'canon', 'revelation', 7, 16,
   E'*They shall hunger no more, neither thirst any more; neither shall the sun light on them, nor any heat. For the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:16–17). *If thou knewest the gift of Elohim (God), and who it is that saith to thee, Give me to drink; thou wouldest have asked of him, and he would have given thee living water* (John 4:10) — the living water the woman at the well was offered becomes the living fountains the gathered are led to by the Lamb in the throne. The conversation at Jacob''s well is the first announcement; the throne-room scene is its completion: the thirsty are satisfied, the tears wiped away, the fountains flowing for ever.'),

  -- John 4:14 → Revelation 22:1, 17 (water of life / come and take freely)
  ('canon', 'john', 4, 14, 'canon', 'revelation', 22, 1,
   E'*And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). *The water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14) — the well springing up inside the believer is the same water of life that proceeds from the throne of Elohim (God) and of the Lamb. The river of Revelation 22 is not a new water; it is the same gift given at the well at Sychar, now seen at its source: proceeding from the throne of the Lamb who offered it. *And whosoever will, let him take the water of life freely* (Revelation 22:17) — the same open invitation, come and take, come and drink.'),

  -- ===== Thread 8: john-4-worship-in-spirit-and-truth-and-the-new-and-living-way-in-hebrews-10 =====

  -- John 4:23-24 → Hebrews 10:19-22 (draw near with hearts sprinkled / bodies washed)
  ('canon', 'john', 4, 23, 'canon', 'hebrews', 10, 19,
   E'*Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus), by a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh; and having an high priest over the house of Elohim (God); let us draw near with a true heart in full assurance of faith, having our hearts sprinkled from an evil conscience, and our bodies washed with pure water* (Hebrews 10:19–22). *The hour cometh, and now is, when the true worshippers shall worship the Father in spirit and in truth* (John 4:23) — Hebrews 10 names the architecture by which that worship becomes possible: the new and living way through the veil, the high priest over the house, the hearts sprinkled and bodies washed. Worship in spirit and truth is not worship by-passed mountaintop nor temple-precinct; it is worship through the flesh of the Formed one, the veil that opened the way.'),

  -- ===== Thread 9: john-4-the-fields-white-to-harvest-in-matthew-9-and-13 =====

  -- John 4:35-36 → Matthew 9:37-38 (harvest plenteous / labourers few)
  ('canon', 'john', 4, 35, 'canon', 'matthew', 9, 37,
   E'*Then saith he unto his disciples, The harvest truly is plenteous, but the labourers are few; pray ye therefore Yahuah (Lord) of the harvest, that he will send forth labourers into his harvest* (Matthew 9:37–38). *Lift up your eyes, and look on the fields; for they are white already to harvest* (John 4:35) — the same harvest-declaration made to the disciples at the Samaritan well is repeated later to the Twelve in Matthew 9:37-38. The fields are white; the harvest is plenteous. The labourers are few because the work is the Father''s, initiated by the Father, and the workers are sent by him. The Samaritan woman is the first wave of that harvest coming in from the field.'),

  -- John 4:37-38 → Matthew 13:37-39 (the Son of Adam sows / reapers are the angels / the harvest is the end of the age)
  ('canon', 'john', 4, 37, 'canon', 'matthew', 13, 37,
   E'*He answered and said unto them, He that soweth the good seed is the Son of Adam; the field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one; the enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels* (Matthew 13:37–39). *One soweth, and another reapeth. I sent you to reap that whereon ye bestowed no labour: other men laboured, and ye are entered into their labours* (John 4:37–38) — Yahusha (Jesus) speaks of sowers and reapers entering one another''s labour at the Samaritan field; the wheat-and-tares parable of Matthew 13 names the full scope of that sowing and reaping: the Son of Adam sows the good seed across the whole field of the world, and the harvest at the end of the age separates the children of the kingdom from those sown by the enemy. The disciples at Sychar enter a reaping whose sowing stretches back before them.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j02_04_lookup sv ON sv.edition_slug = i.src_edition
                             AND sv.book_slug    = i.src_slug
                             AND sv.chapter_number = i.src_ch
                             AND sv.verse_number  = i.src_v
  JOIN _s216_j02_04_lookup tv ON tv.edition_slug = i.tgt_edition
                             AND tv.book_slug    = i.tgt_slug
                             AND tv.chapter_number = i.tgt_ch
                             AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 9 new free-tier threads.
-- ---------------------------------------------------------------------

-- Thread 1: john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple',
       'The temple cleansed — the synoptic parallels and the body as true temple',
       E'John 2:13-21 records two movements in one scene: Yahusha (Jesus) driving out the merchants and moneychangers from the court of his Father''s house, and then declaring that the destroyed temple will be raised in three days. The synoptic gospels carry the same cleansing. Matthew 21:12-13 records the same overturning of the tables and the moneychangers'' seats, the same driving out, and the same declaration: *My house shall be called the house of prayer; but ye have made it a den of thieves.* Mark 11:15-17 adds that he would not suffer any man to carry a vessel through the temple, and that the house was appointed to be *called of all nations the house of prayer* — the court turned into a market was the court appointed for the gathering of the scattered from all nations. Luke 19:45-46 records the same act with the same words. Three witnesses to the one cleansing: the Formed one arriving at his own house and refusing the defilement of the court meant for his gathered people''s approach to the Father.\n\nAfter the cleansing, the Yahudim (Jews) demand a sign. Yahusha (Jesus) points to his own body: *Destroy this temple, and in three days I will raise it up* (John 2:19); *he spake of the temple of his body* (John 2:21). Two NT voices carry the weight of that declaration. Stephen in Acts 7:48 names the theological spine: *the El Elyon (most High) dwelleth not in temples made with hands* — the stone house was never the final dwelling; the temple movement was always toward a habitation not made with human craft. Paul in 1 Corinthians 6:19-20 names where that movement arrives: *your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own.* The Formed one''s body was the first true temple (John 2:21); the gathered people in whom the same Spirit now dwells are the next temple. The cleansing of the stone house was the announcement; the body raised in three days is the substance.',
       sv.verse_id, ev.verse_id, 'free', 4030
  FROM _s216_j02_04_lookup sv, _s216_j02_04_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 14
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 2 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: john-2-destroy-this-temple-and-the-greater-tabernacle-not-made-with-hands-in-hebrews
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-2-destroy-this-temple-and-the-greater-tabernacle-not-made-with-hands-in-hebrews',
       'Destroy this temple — the greater tabernacle not made with hands in Hebrews',
       E'*Destroy this temple, and in three days I will raise it up* (John 2:19). *He spake of the temple of his body* (John 2:21). The letter to the Hebrews unpacks what that declaration means from inside the high-priestly logic. Hebrews 9:11-12 names the true tabernacle: *Messiah (Christ) being come an high priest of good things to come, by a greater and more perfect tabernacle, not made with hands, that is to say, not of this building; neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us.* The stone temple that took forty-six years to build (John 2:20) is *of this building* — the shadow. The body of the Formed one is the greater and more perfect tabernacle, not made with hands. He entered the true holy place not by the blood of animals but by his own blood, the three-day raising being the entry.\n\nHebrews 10:19-20 completes the architecture: *Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus), by a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh.* The veil is his flesh — the body destroyed and raised. The three-day raising of John 2:19-21 is the consecration of the new and living way. The temple-builders who heard *destroy this temple* could not imagine what he was announcing; Hebrews carries the full declaration forward: the way back into the presence of the Father was opened by the destruction and raising of the body that is the true temple.',
       sv.verse_id, ev.verse_id, 'free', 4031
  FROM _s216_j02_04_lookup sv, _s216_j02_04_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 19
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 2 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: john-3-born-of-water-and-spirit-and-the-washing-of-regeneration-in-titus-3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-3-born-of-water-and-spirit-and-the-washing-of-regeneration-in-titus-3',
       'Born of water and Spirit — the washing of regeneration in Titus 3',
       E'*Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God). That which is born of the flesh is flesh; and that which is born of the Spirit is spirit* (John 3:5–6). The flesh-birth and the Spirit-birth are two different origins: one produces flesh, the other produces spirit. The kingdom of Elohim (God) can only be entered through the second birth.\n\nTitus 3:5-7 names from the inside what Yahusha (Jesus) declared to Nicodemus from the outside: *Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit); which he shed on us abundantly through Yahusha HaMashiach (Jesus Christ) our Saviour; that being justified by his grace, we should be made heirs according to the hope of eternal life.* The washing of regeneration is the water-and-Spirit birth John 3:5 names. The renewing of the Ruach HaKodesh (Holy Spirit) is the being-born-of-the-Spirit John 3:6 identifies as what produces spirit. Not by works of righteousness — not by fleshly credential, not by circumcision, not by natural descent — but according to his mercy, shed abundantly through Yahusha HaMashiach (Jesus Christ). The grace here is not a release from his ways: *that being justified by his grace, we should be made heirs* — heirs of the covenant life, which is the life walked in his statutes by the Spirit who was poured out. The new birth is the gate to the inheritance, not the abolition of the road that leads through it.',
       sv.verse_id, ev.verse_id, 'free', 4040
  FROM _s216_j02_04_lookup sv, _s216_j02_04_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 5
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 7
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: john-3-born-again-of-incorruptible-seed-in-1-peter-1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-3-born-again-of-incorruptible-seed-in-1-peter-1',
       'Born again of incorruptible seed — 1 Peter 1',
       E'*Yahusha (Jesus) answered and said unto him, Verily, verily, I say unto thee, Except a man be born again, he cannot see the kingdom of Elohim (God)* (John 3:3). *Marvel not that I said unto thee, Ye must be born again* (John 3:7). Nicodemus hears *born again* and reaches for natural birth — enter the mother''s womb a second time. Yahusha (Jesus) corrects him: this is not a second natural birth; it is a birth from a different seed altogether.\n\n1 Peter 1:23-25 names the seed: *Being born again, not of corruptible seed, but of incorruptible, by the word of Elohim (God), which liveth and abideth for ever. For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away: but the word of Yahuah (Lord) endureth for ever. And this is the word which by the gospel is preached unto you.* The contrast John 3:6 makes — *that which is born of the flesh is flesh; and that which is born of the Spirit is spirit* — is the same contrast Kefa (Peter) makes between corruptible seed and incorruptible: corruptible seed produces the flesh that withers like grass; incorruptible seed, the word of Elohim (God), produces the spirit-birth that cannot decay. The word Yahuah (Lord) endures forever — it is the word being proclaimed by the gospel, the word that calls the scattered home and births them again from above. The new birth is not another flesh-birth; it is birth by a different, enduring origin.',
       sv.verse_id, ev.verse_id, 'free', 4041
  FROM _s216_j02_04_lookup sv, _s216_j02_04_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 3
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 7
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: john-3-the-son-of-adam-lifted-up-in-1-corinthians-1-and-philippians-2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-3-the-son-of-adam-lifted-up-in-1-corinthians-1-and-philippians-2',
       'The Son of Adam lifted up — 1 Corinthians 1 and Philippians 2',
       E'*And as Moses lifted up the serpent in the wilderness, even so must the Son of Adam be lifted up: that whosoever believeth in him should not perish, but have eternal life* (John 3:14–15). The brass serpent on the pole in Numbers 21 was the cure for the people bitten in the wilderness: look and live. The Son of Adam lifted up is the same pattern at the scale of the whole age: the lifting-up onto the cross is the pole-planting that opens the cure to those who look in faith.\n\n1 Corinthians 1:23-24 names the lifting-up from inside the apostolic proclamation: *But we preach Messiah (Christ) crucified, unto the Yahudim (Jews) a stumblingblock, and unto the Greeks foolishness; but unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The cross is the lifting-up. To those who cannot hear the Shepherd''s voice it is a stumblingblock and foolishness; to those who are called — those who were already his sheep before the foundation of the world — it is the power and wisdom of Elohim (God). Hearing reveals what was already true. The brass serpent in the wilderness did not cure those who refused to look; the lifting-up of the Son of Adam does not save those who will not believe.\n\nPhilippians 2:8-9 names both movements of the lifting-up together: *he humbled himself, and became obedient unto death, even the death of the cross. Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name.* John 3:14''s *must be lifted up* has two senses folded into one word: lifted up onto the cross in humiliation, and lifted up by the Father into the highest name. The exaltation follows the obedience. The pole-planting precedes the looking and the living.',
       sv.verse_id, ev.verse_id, 'free', 4042
  FROM _s216_j02_04_lookup sv, _s216_j02_04_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 14
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

-- Thread 6: john-3-16-18-the-father-sent-the-only-begotten-son-confirmed-in-1-john-4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-3-16-18-the-father-sent-the-only-begotten-son-confirmed-in-1-john-4',
       'John 3:16-18 — the Father sent the only begotten Son, confirmed in 1 John 4',
       E'*For Elohim (God) so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life. For Elohim (God) sent not his Son into the world to condemn the world; but that the world through him might be saved. He that believeth on him is not condemned: but he that believeth not is condemned already, because he hath not believed in the name of the only begotten Son of Elohim (God)* (John 3:16–18). The sentence the Reformation cut in half is here in full: the Father gave and sent the Son — not to condemn, but to save through him — and the one who does not believe is condemned already, not because the Father is eager to condemn, but because the light has come and the refusal of the light is its own verdict. Grace is the means of return to him: the Son was sent as the gate home, not as a cancellation of the consequence-system. The one who believes and passes through the gate is not condemned; the one who refuses the gate remains condemned already.\n\n1 John 4:9-10 confirms the same architecture from the testimony of those who saw: *In this was manifested the love of Elohim (God) toward us, because that Elohim (God) sent his only begotten Son into the world, that we might live through him. Herein is love, not that we loved Elohim (God), but that he loved us, and sent his Son to be the propitiation for our sins.* The direction of the love is the same: not that we loved him first and generated the sending by our response; he loved us and sent the Son before any response. 1 John 4:14 seals the testimony: *the Father sent the Son to be the Saviour of the world* — the same word John 3:17 records from the Formed one''s own lips. The eyewitnesses are testifying what they heard him say; the gospel and the epistle are one voice, one sending, one love that moved from above downward before anything moved from below.',
       sv.verse_id, ev.verse_id, 'free', 4043
  FROM _s216_j02_04_lookup sv, _s216_j02_04_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

-- Thread 7: john-4-living-water-and-the-water-of-life-in-revelation-7-21-22
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-4-living-water-and-the-water-of-life-in-revelation-7-21-22',
       'Living water — the water of life in Revelation 7, 21, and 22',
       E'*Yahusha (Jesus) answered and said unto her, If thou knewest the gift of Elohim (God), and who it is that saith to thee, Give me to drink; thou wouldest have asked of him, and he would have given thee living water* (John 4:10). *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14). The living water offered at Jacob''s well is not the water drawn from a stone cistern; it is the gift of Elohim (God), the water whose source is the Formed one himself, springing up from inside the one who receives it.\n\nRevelation 7:16-17 names where that gift arrives at its completion: *They shall hunger no more, neither thirst any more; neither shall the sun light on them, nor any heat. For the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes.* The woman at the well was thirsty; the gathered around the throne thirst no more — the Lamb who offered the water at Sychar leads them to the living fountains. The well at Jacob''s field points forward to the fountains at the throne.\n\nRevelation 22:1 shows the source: *a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The well springing up inside the believer (John 4:14) proceeds ultimately from the throne of the Lamb who offered it. Revelation 22:17 extends the invitation outward in the same open hand John 4:10 held out at the well: *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* Come and drink: the same invitation, the same Lamb, the same water. The conversation at noon at a Samaritan well is the opening of a river that runs from that moment to the throne of Elohim (God) at the end of the age.',
       sv.verse_id, ev.verse_id, 'free', 4050
  FROM _s216_j02_04_lookup sv, _s216_j02_04_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 10
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 4 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

-- Thread 8: john-4-worship-in-spirit-and-truth-and-the-new-and-living-way-in-hebrews-10
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-4-worship-in-spirit-and-truth-and-the-new-and-living-way-in-hebrews-10',
       'Worship in spirit and truth — the new and living way in Hebrews 10',
       E'*But the hour cometh, and now is, when the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him. Elohim (God) is a Spirit: and they that worship him must worship him in spirit and in truth* (John 4:23–24). The Samaritan woman had framed worship as a place-question: this mountain or Jerusalem. Yahusha (Jesus) names the question that swallows the place-question: not where, but how and in whom. True worship is not tied to a mountain or a city; it is tied to the Spirit and the truth, the life of the Formed one now accessible through the veil that was his flesh.\n\nHebrews 10:19-22 names the architecture that makes this worship possible: *Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus), by a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh; and having an high priest over the house of Elohim (God); let us draw near with a true heart in full assurance of faith, having our hearts sprinkled from an evil conscience, and our bodies washed with pure water.* The new and living way is through the veil — through his flesh — into the holiest. This is worship in spirit and truth: not tied to Gerizim or to the Temple Mount, but drawing near with a true heart through the blood of Yahusha (Jesus), the high priest over the house of Elohim (God). The hearts sprinkled and the bodies washed with pure water echo the water-and-Spirit architecture of John 3:5 and the washing of regeneration of Titus 3:5; the worship John 4:23 calls for is the same drawing-near Hebrews 10:22 maps the path to. The hour the woman was asking about had already come: the veil was the flesh of the Formed one, and when it was torn, the way was opened.',
       sv.verse_id, ev.verse_id, 'free', 4051
  FROM _s216_j02_04_lookup sv, _s216_j02_04_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 23
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 4 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

-- Thread 9: john-4-the-fields-white-to-harvest-and-the-harvest-of-the-age-in-matthew-9-and-13
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-4-the-fields-white-to-harvest-and-the-harvest-of-the-age-in-matthew-9-and-13',
       'The fields white to harvest — Matthew 9 and the harvest of the age in Matthew 13',
       E'*Say not ye, There are yet four months, and then cometh harvest? behold, I say unto you, Lift up your eyes, and look on the fields; for they are white already to harvest. And he that reapeth receiveth wages, and gathereth fruit unto life eternal: that both he that soweth and he that reapeth may rejoice together* (John 4:35–36). The Samaritan woman has gone into the city; the Samaritans are coming out across the field toward Yahusha (Jesus). He points to the moving crowd: there is the harvest, white and ready, and neither the sower''s usual timetable nor the disciples'' assumption about when harvests come governs this field. The scattered coming in toward the voice of the Shepherd — that is the harvest already under way.\n\nMatthew 9:37-38 records the same harvest-declaration made as the Twelve are being sent: *The harvest truly is plenteous, but the labourers are few; pray ye therefore Yahuah (Lord) of the harvest, that he will send forth labourers into his harvest.* The harvest is plenteous in both passages; the shortage is of labourers. The Samaritan field and the Galilean fields and the fields of the world are all the same harvest — the scattered seed of the house of Yashar''el (Israel), ripe and coming in when the Shepherd''s voice reaches them. Neither mountain nor city determines where the field is; the field is wherever the scattered are waiting to hear.\n\nMatthew 13:37-39 names the full scope of the sowing and reaping: *He that soweth the good seed is the Son of Adam; the field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one; the enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels.* The sowing Yahusha (Jesus) and his disciples entered at Sychar, entering a labour others had begun (John 4:38), is part of the long sowing the Son of Adam himself is doing across the whole field of the world. The white fields at Sychar are a glimpse of the harvest the Son of Adam will send his angels to reap at the end of the age — gathering the children of the kingdom out of the field, separating them from the tares sown by the enemy. One soweth, another reapeth; but the harvest belongs to the One who sowed it.',
       sv.verse_id, ev.verse_id, 'free', 4052
  FROM _s216_j02_04_lookup sv, _s216_j02_04_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 35
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 4 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads (20 member rows).
-- ---------------------------------------------------------------------

-- Thread 1: john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 21:12 — *Yahusha (Jesus) went into the temple of Elohim (God), and cast out all them that sold and bought in the temple, and overthrew the tables of the moneychangers, and the seats of them that sold doves.* Matthew''s account of the same cleansing; the Formed one arriving at his own house.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 14
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'matthew' AND tv.chapter_number = 21 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 11:17 — *My house shall be called of all nations the house of prayer? but ye have made it a den of thieves.* Mark names that the court seized by traders was the court appointed for the gathered from all nations — the cleansing reclaims it for the gathering.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 16
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'mark' AND tv.chapter_number = 11 AND tv.verse_number = 17
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 19:45 — *he went into the temple, and began to cast out them that sold therein ... My house is the house of prayer: but ye have made it a den of thieves.* Luke''s account: three synoptic witnesses to the same act and the same declaration.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 15
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'luke' AND tv.chapter_number = 19 AND tv.verse_number = 45
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:48 — *the El Elyon (most High) dwelleth not in temples made with hands.* Stephen names the theological spine: the stone temple was never the final dwelling; John 2:21 names where the final dwelling arrived — the body of the Formed one.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 21
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'acts' AND tv.chapter_number = 7 AND tv.verse_number = 48
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 6:19 — *your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you.* The body of the Formed one was the first true temple (John 2:21); now the gathered people in whom the same Spirit dwells are the next temple.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-2-the-temple-cleansed-the-synoptic-parallels-and-the-body-as-true-temple'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 21
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians' AND tv.chapter_number = 6 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-2-destroy-this-temple-and-the-greater-tabernacle-not-made-with-hands-in-hebrews
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 9:11 — *a greater and more perfect tabernacle, not made with hands, that is to say, not of this building.* The stone temple is *of this building* — the shadow. The body raised in three days is the greater tabernacle; John 2:19''s announcement is Hebrews 9''s subject.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-2-destroy-this-temple-and-the-greater-tabernacle-not-made-with-hands-in-hebrews'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 19
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'hebrews' AND tv.chapter_number = 9 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 10:19 — *boldness to enter into the holiest ... by a new and living way ... through the veil, that is to say, his flesh.* The veil is the flesh destroyed and raised; John 2:21''s body-as-temple is the substance Hebrews 10 opens the holiest through.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-2-destroy-this-temple-and-the-greater-tabernacle-not-made-with-hands-in-hebrews'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 21
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'hebrews' AND tv.chapter_number = 10 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: john-3-born-of-water-and-spirit-and-the-washing-of-regeneration-in-titus-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Titus 3:5 — *by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit).* The water-and-Spirit birth of John 3:5 named from the inside: according to his mercy, not by works of righteousness.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-3-born-of-water-and-spirit-and-the-washing-of-regeneration-in-titus-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 5
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'titus' AND tv.chapter_number = 3 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Titus 3:6 — *which he shed on us abundantly through Yahusha HaMashiach (Jesus Christ) our Saviour; that being justified by his grace, we should be made heirs.* The Spirit shed abundantly is the born-of-the-Spirit of John 3:6; justified by grace to become heirs of everlasting life (John 3:15-16).'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-3-born-of-water-and-spirit-and-the-washing-of-regeneration-in-titus-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 6
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'titus' AND tv.chapter_number = 3 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: john-3-born-again-of-incorruptible-seed-in-1-peter-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 1:23 — *born again, not of corruptible seed, but of incorruptible, by the word of Elohim (God), which liveth and abideth for ever.* The new birth Yahusha (Jesus) declared to Nicodemus (John 3:3) is by incorruptible seed — the living and abiding word of Elohim (God).'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-3-born-again-of-incorruptible-seed-in-1-peter-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 3
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-peter' AND tv.chapter_number = 1 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 1:25 — *the word of Yahuah (Lord) endureth for ever. And this is the word which by the gospel is preached unto you.* The word that produces the new birth (John 3:7 — *ye must be born again*) endures forever; it is the same word now being proclaimed as good news to the scattered.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-3-born-again-of-incorruptible-seed-in-1-peter-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 7
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-peter' AND tv.chapter_number = 1 AND tv.verse_number = 25
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: john-3-the-son-of-adam-lifted-up-in-1-corinthians-1-and-philippians-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 1:23 — *we preach Messiah (Christ) crucified ... unto them which are called, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The lifting-up of John 3:14 is the crucifixion: to those who are called, the power and wisdom of Elohim (God); to those who are not, a stumblingblock.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-3-the-son-of-adam-lifted-up-in-1-corinthians-1-and-philippians-2'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 14
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians' AND tv.chapter_number = 1 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:8 — *he humbled himself, and became obedient unto death, even the death of the cross. Wherefore Elohim (God) also hath highly exalted him.* The two movements of John 3:14''s *lifted up*: down into the cross in obedience, then up into the name above every name by the Father''s exaltation.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-3-the-son-of-adam-lifted-up-in-1-corinthians-1-and-philippians-2'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 14
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'philippians' AND tv.chapter_number = 2 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: john-3-16-18-the-father-sent-the-only-begotten-son-confirmed-in-1-john-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 4:9 — *Elohim (God) sent his only begotten Son into the world, that we might live through him. Herein is love, not that we loved Elohim (God), but that he loved us.* The sending of John 3:16-17 confirmed by those who saw: love moved from above downward first, before any response.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-3-16-18-the-father-sent-the-only-begotten-son-confirmed-in-1-john-4'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 4 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 4:14 — *the Father sent the Son to be the Saviour of the world.* The eyewitnesses seal John 3:17''s own words: not to condemn the world, but to save it through him. The same Formed one, the same mission, named by the Son and then testified by those who saw him.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-3-16-18-the-father-sent-the-only-begotten-son-confirmed-in-1-john-4'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 17
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 4 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: john-4-living-water-and-the-water-of-life-in-revelation-7-21-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 7:16 — *They shall hunger no more, neither thirst any more ... the Lamb shall lead them unto living fountains of waters.* The living water offered at Sychar (John 4:10) arrives at its completion: the Lamb who offered it leads the gathered to the fountains, and they thirst no more.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-4-living-water-and-the-water-of-life-in-revelation-7-21-22'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 10
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'revelation' AND tv.chapter_number = 7 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:1 — *a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The well springing up inside the believer (John 4:14) has its source here: the throne of the Lamb who first offered the water at Jacob''s well.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-4-living-water-and-the-water-of-life-in-revelation-7-21-22'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 14
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'revelation' AND tv.chapter_number = 22 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 8: john-4-worship-in-spirit-and-truth-and-the-new-and-living-way-in-hebrews-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 10:19 — *boldness to enter into the holiest by the blood of Yahusha (Jesus), by a new and living way ... through the veil, that is to say, his flesh ... let us draw near with a true heart.* The architecture that makes worship in spirit and truth (John 4:23-24) possible: through the veil of his flesh, by the blood of the Formed one, drawing near with a true heart.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-4-worship-in-spirit-and-truth-and-the-new-and-living-way-in-hebrews-10'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 23
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'hebrews' AND tv.chapter_number = 10 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 9: john-4-the-fields-white-to-harvest-and-the-harvest-of-the-age-in-matthew-9-and-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 9:37 — *The harvest truly is plenteous, but the labourers are few; pray ye therefore Yahuah (Lord) of the harvest, that he will send forth labourers into his harvest.* The same harvest-declaration made at the Samaritan field (John 4:35) repeated to the Twelve: the harvest is plenteous and ready; the labourers are few because the work is the Father''s.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-4-the-fields-white-to-harvest-and-the-harvest-of-the-age-in-matthew-9-and-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 35
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'matthew' AND tv.chapter_number = 9 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:37 — *He that soweth the good seed is the Son of Adam; the field is the world; the good seed are the children of the kingdom ... the harvest is the end of the world; and the reapers are the angels.* The sowing and reaping at Sychar (John 4:37-38) is part of the long sowing the Son of Adam himself is doing across the whole field of the world.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j02_04_lookup sv, _s216_j02_04_lookup tv
 WHERE t.slug = 'john-4-the-fields-white-to-harvest-and-the-harvest-of-the-age-in-matthew-9-and-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 37
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'matthew' AND tv.chapter_number = 13 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===================== fragment: minion_john_05_08.sql =====================
-- =====================================================================
-- S216 minion — John 5, 6, 7, 8 NT-to-NT cross-references
-- =====================================================================
-- Range:   John 5–8 (healing at Bethesda / the Son does what he sees the
--          Father do / the dead shall hear his voice / witness; the bread of
--          life / feeding the 5000 / I AM the bread / eating his flesh; rivers
--          of living water / the Spirit not yet given / division over him; I AM
--          the light of the world / before Abraham was, I AM / the truth shall
--          make you free / sons of Abraham vs your father the devil).
-- Tag:     j05_08  (temp view: _s216_j05_08_lookup)
-- Sort band: 4090–4159
-- Output:  scratch_xref_ntnt/minion_john_05_08.sql
--
-- Six new free-tier NT-to-NT threads:
--
--   1. john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15
--        (sort 4090) — John 5:25–29 ↔ 1 Thessalonians 4:16 + 1 Corinthians 15:20–23, 52
--
--   2. john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11
--        (sort 4091) — John 6:11,35,53–56 ↔ Matthew 14:19–21, Mark 6:41–44, Luke 9:16–17,
--                      1 Corinthians 10:3–4,16–17, 11:23–26
--
--   3. john-8-12-i-am-the-light-of-the-world-and-elohim-is-light-in-1-john-1-and-2-corinthians-4
--        (sort 4092) — John 8:12 ↔ 1 John 1:5–7, 2 Corinthians 4:6
--
--   4. john-8-44-your-father-the-devil-and-the-children-of-elohim-vs-the-children-of-the-devil-in-1-john-3
--        (sort 4093) — John 8:44 ↔ 1 John 3:8–10, 3:12
--        (Checklist 9 applied: sons of Belial within the covenant community;
--         NOT a Jew-hatred reading; the conflict is seed-war, not ethnic)
--
--   5. john-8-58-before-abraham-was-i-am-the-alpha-and-omega-in-revelation-1-and-1-corinthians-12
--        (sort 4094) — John 8:58 ↔ Revelation 1:8, 1:17–18, 1 Corinthians 12:3
--        (The Formed-one identification; 1 Corinthians 12:3 = Spirit-revealed
--         equation Yahusha is Yahuah; Revelation 1:8 Alpha-Omega)
--
--   6. john-7-39-the-spirit-not-yet-given-poured-out-at-acts-2-and-dwelling-in-romans-8
--        (sort 4095) — John 7:39 ↔ Acts 2:17–18, Romans 8:9–11
--
-- 21 cross_references rows, 21 thread_member rows, all free-tier.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- No BEGIN/COMMIT — orchestrator wraps the transaction.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the j05_08 tag).
CREATE TEMP VIEW _s216_j05_08_lookup AS
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
       'ascension-isaiah',
       'sonnini-acts-29'
   );

-- ---------------------------------------------------------------------
-- Insert 21 free-tier cross_references rows.
-- SOURCE is always a canon John 5–8 verse.
-- TARGET is a canon NT verse in another book.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- -----------------------------------------------------------------------
  -- Thread 1: john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15
  -- John 5:25–29 (the dead shall hear his voice / Son of Adam judges) ↔
  -- 1 Thessalonians 4:16 + 1 Corinthians 15:20-23, 52
  -- -----------------------------------------------------------------------
  ('canon', 'john', 5, 25, 'canon', '1-thessalonians', 4, 16,
   E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). John 5:25 sets the architecture: *the hour is coming, and now is, when the dead shall hear the voice of the Son of Elohim (God): and they that hear shall live.* Paul names the same event from the other side — the descending shout, the trump of Elohim (God), the dead rising first. The dead who *hear* in John 5 are the dead in Messiah (Christ) who rise at the trump of 1 Thessalonians 4; the voice of the Son who calls them up is the shout Paul describes.'),

  ('canon', 'john', 5, 28, 'canon', '1-corinthians', 15, 52,
   E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). John 5:28 names the hour: *all that are in the graves shall hear his voice.* Paul names the same trumpet-hour: the dead raised incorruptible, the living changed, all *in a moment.* The graves giving back their dead at the voice is the trumpet-resurrection Paul describes as a mystery now revealed.'),

  ('canon', 'john', 5, 21, 'canon', '1-corinthians', 15, 20,
   E'*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* (1 Corinthians 15:20). John 5:21 names the principle: *as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will.* The Son who quickens whom he will is the firstfruits Paul names in 1 Corinthians 15:20 — the first to rise, the firstfruits guaranteeing the harvest of the rest. The quickening-power is in the Son because the Father gave him life in himself (John 5:26).'),

  ('canon', 'john', 5, 29, 'canon', '1-corinthians', 15, 22,
   E'*For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). John 5:29 names the two-fold resurrection: *they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* Paul names the same two outcomes through the Adam-Messiah (Christ) typology: all die in Adam; in Messiah (Christ) the seed of Adam is made alive. The two categories are the same two categories; the resurrection of life is the resurrection of those who are *in Messiah (Christ).*'),

  -- -----------------------------------------------------------------------
  -- Thread 2: john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11
  -- John 6:11 / 6:35 / 6:53-56 ↔ Matthew 14:19-21, Mark 6:41-44, Luke 9:16-17,
  -- 1 Corinthians 10:3-4,16-17, 11:23-26
  -- -----------------------------------------------------------------------
  ('canon', 'john', 6, 11, 'canon', 'matthew', 14, 19,
   E'*And he commanded the multitude to sit down on the grass, and took the five loaves, and the two fishes, and looking up to heaven, he blessed, and brake, and gave the loaves to his disciples, and the disciples to the multitude* (Matthew 14:19). John 6:11 records the same act: *Yahusha (Jesus) took the loaves; and when he had given thanks, he distributed to the disciples, and the disciples to them that were set down.* Matthew names the blessing and the breaking before the giving; John names the giving-of-thanks before the distribution. Both accounts share the same structure — took, blessed/gave-thanks, broke, distributed through the twelve — that the table-of-remembrance in 1 Corinthians 11:23-24 walks on the same night Yahusha (Jesus) was betrayed.'),

  ('canon', 'john', 6, 11, 'canon', 'mark', 6, 41,
   E'*And when he had taken the five loaves and the two fishes, he looked up to heaven, and blessed, and brake the loaves, and gave them to his disciples to set before them; and the two fishes divided he among them all* (Mark 6:41). Mark''s account matches John 6:11''s structure precisely: took, looked up to heaven, gave-thanks/blessed, distributed through the disciples. Mark adds that *they all ate and were filled* (v.42) and *twelve baskets full of the fragments* were gathered (v.43) — the same twelve-basket remainder John 6:13 names. Four gospel accounts, one act, one bread.'),

  ('canon', 'john', 6, 11, 'canon', 'luke', 9, 16,
   E'*Then he took the five loaves and the two fishes, and looking up to heaven, he blessed them, and brake, and gave to the disciples to set before the multitude* (Luke 9:16). Luke''s account names the same upward-look, the blessing, the breaking, the giving through the disciples to the five thousand. *And they did eat, and were all filled: and there was taken up of fragments that remained to them twelve baskets* (v.17). Three synoptic accounts alongside John''s — all four testifying to the one act that Yahusha (Jesus) then unfolds as the bread of life discourse: *I am the bread of life* (John 6:35).'),

  ('canon', 'john', 6, 35, 'canon', '1-corinthians', 10, 3,
   E'*And did all eat the same spiritual meat; And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:3-4). John 6:35 names what Paul names: *I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst.* Paul reads the wilderness bread and water as already being Messiah (Christ) — *that Rock was Messiah (Christ)*. John 6 names the same Messiah (Christ) as the bread of life the wilderness bread prefigured. The manna was the sign; the Formed one in flesh is what the sign pointed toward, and Paul and John name the same substance.'),

  ('canon', 'john', 6, 53, 'canon', '1-corinthians', 10, 16,
   E'*The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* (1 Corinthians 10:16). John 6:53-55 carries the same substance: *Except ye eat the flesh of the Son of Adam, and drink his blood, ye have no life in you. Whoso eateth my flesh, and drinketh my blood, hath eternal life ... For my flesh is meat indeed, and my blood is drink indeed.* The cup and the bread Paul names as communion of the body and blood are the eating and drinking Yahusha (Jesus) names in John 6 as the condition of life. The table is not a new institution; it is the covenant meal the bread-of-life discourse was pointing toward.'),

  ('canon', 'john', 6, 56, 'canon', '1-corinthians', 11, 26,
   E'*For as often as ye eat this bread, and drink this cup, ye do shew the death of Yahusha (Lord) till he come* (1 Corinthians 11:26). John 6:56 names the dwelling: *He that eateth my flesh, and drinketh my blood, dwelleth in me, and I in him.* The eating and drinking that Paul names as *shewing the death till he come* is the dwelling-in-him John 6:56 names — the mutual abiding that is the substance of the act. To eat the bread and drink the cup is to confess the death that opened the door, and to dwell in the one whose flesh is meat indeed.'),

  -- -----------------------------------------------------------------------
  -- Thread 3: john-8-12-i-am-the-light-of-the-world-and-elohim-is-light-in-1-john-1-and-2-corinthians-4
  -- John 8:12 ↔ 1 John 1:5-7, 2 Corinthians 4:6
  -- -----------------------------------------------------------------------
  ('canon', 'john', 8, 12, 'canon', '1-john', 1, 5,
   E'*This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all* (1 John 1:5). John 8:12 gives Yahusha''s (Jesus''s) own declaration: *I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* Yochanan (John) in his epistle names what he heard from the Formed one himself: Elohim (God) is light, no darkness at all. The I AM who names himself the light of the world is naming what Elohim (God) is — the Formed drawn from the Formless light, walking among his people. What Yochanan (John) declares in the epistle is what he received at John 8:12 and carries as the central message.'),

  ('canon', 'john', 8, 12, 'canon', '1-john', 1, 7,
   E'*But if we walk in the light, as he is in the light, we have fellowship one with another, and the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin* (1 John 1:7). John 8:12 sets the invitation: *he that followeth me shall not walk in darkness, but shall have the light of life.* The walking in the light of 1 John 1:7 is the following that John 8:12 names — the one who follows the light-of-the-world does not walk in darkness; the one who walks in the light has fellowship and cleansing. The epistle unfolds what the gospel declaration pointed toward.'),

  ('canon', 'john', 8, 12, 'canon', '2-corinthians', 4, 6,
   E'*For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). Paul names exactly what the *I am the light of the world* declaration of John 8:12 carries: the Elohim (God) who first spoke light out of darkness has shone again — this time in the face of Yahusha HaMashiach (Jesus Christ), giving the knowledge of his glory in human flesh. The light of the world is the light of the knowledge of Elohim (God) shining from the Formed one''s face; Paul names the same light in its apostolic proclamation register.'),

  -- -----------------------------------------------------------------------
  -- Thread 4: john-8-44-your-father-the-devil-and-the-children-of-elohim-vs-the-children-of-the-devil-in-1-john-3
  -- John 8:44 ↔ 1 John 3:8, 3:10, 3:12
  -- Checklist 9 applied throughout: sons of Belial within the covenant community;
  -- NOT ethnic Jew-hatred; the seed war runs within all peoples.
  -- -----------------------------------------------------------------------
  ('canon', 'john', 8, 44, 'canon', '1-john', 3, 8,
   E'*He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). John 8:44 names the same identification: *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* Yochanan (John) in the epistle names the same enemy and the same mark: doing the lusts of the father of lies is being *of the devil*; the murderer-from-the-beginning is the same figure in both texts. The identification in John 8 is not ethnic — it targets sons of Belial within the covenant community, the seed-war diagnosis that runs across all peoples (1 John 3:10 names the two categories as present among all who claim Elohim (God)), and the epistle makes that plain.'),

  ('canon', 'john', 8, 44, 'canon', '1-john', 3, 10,
   E'*In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother* (1 John 3:10). John 8:47 names the dividing line: *He that is of Elohim (God) heareth Elohim''s (God''s) words: ye therefore hear them not, because ye are not of Elohim (God).* The hearing-of-the-words marks the children of Elohim (God); the not-hearing marks the children of the adversary. Yochanan (John) in the epistle names the same two-category diagnosis: children of Elohim (God) manifest by doing righteousness; children of the adversary manifest by not doing righteousness and not loving the brother. The seed-war runs through all peoples; 1 John 3:10 universalizes what John 8:44 says to those sons of Belial in the temple court.'),

  ('canon', 'john', 8, 44, 'canon', '1-john', 3, 12,
   E'*Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). John 8:44 names the origin pattern: *He was a murderer from the beginning.* Yochanan (John) in the epistle names Cain as the prototype — *of the wicked one*, murdering the righteous brother because his own works were evil. The murderer-from-the-beginning of John 8:44 is the father whose seed Cain carried in the garden; the sons of Belial in the temple court who seek to kill the one who tells them the truth (John 8:40) are walking the same Cain-pattern the epistle names. The seed war from the garden to the temple court to the epistle is one continuous line.'),

  -- -----------------------------------------------------------------------
  -- Thread 5: john-8-58-before-abraham-was-i-am-the-alpha-and-omega-in-revelation-1-and-1-corinthians-12
  -- John 8:58 ↔ Revelation 1:8, 1:17-18, 1 Corinthians 12:3
  -- The Formed-one identification: Yahusha is Yahuah; the Spirit-revealed equation
  -- -----------------------------------------------------------------------
  ('canon', 'john', 8, 58, 'canon', 'revelation', 1, 8,
   E'*I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty* (Revelation 1:8). John 8:58 names the same eternal self: *Before Abraham was, I am.* The predicate-less *I am* of John 8:58 is the same self-identification that Revelation 1:8 expands as the Alpha-and-Omega, the first and the last, the one who is and was and is to come. The Almighty of Revelation 1:8 is the Formed one who names himself the living-one who was dead and is alive for evermore (Revelation 1:18) — the same I AM whose pre-existence before Avraham (Abraham) is the ground of the temple court claim. The canon names the same figure at both ends.'),

  ('canon', 'john', 8, 58, 'canon', 'revelation', 1, 17,
   E'*And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last: I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death* (Revelation 1:17-18). John 8:58''s *Before Abraham was, I am* is the synagogue-register of the same self-declaration Revelation 1:17-18 names in the glorified-body register: the first and the last, the living one who passed through death and holds the keys of hell and death. The pre-existence named at John 8 and the post-resurrection authority named at Revelation 1 are the same Formed one, from before Avraham (Abraham) to after the grave.'),

  ('canon', 'john', 8, 58, 'canon', '1-corinthians', 12, 3,
   E'*Wherefore I give you to understand, that no man speaking by the Spirit of Elohim (God) calleth Yahusha (Jesus) accursed: and that no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit)* (1 Corinthians 12:3). The I AM of John 8:58 — the predicate-less *egō eimi*, the Septuagint''s rendering of the *Ehyeh* of Exodus 3:14 — names the Formed one as Yahuah (LORD) himself, who spoke from the burning bush. Paul''s Spirit-revealed equation names the same identification: *Yahusha (Jesus) is Yahuah (Lord)* — not merely Lord-as-title, but the revealed Yahuah-identity disclosed by the Ruach HaKodesh (Holy Spirit). No one arrives at this identification by natural reasoning; the Spirit discloses it, as the stoning crowd at John 8:59 shows by their response.'),

  -- -----------------------------------------------------------------------
  -- Thread 6: john-7-39-the-spirit-not-yet-given-poured-out-at-acts-2-and-dwelling-in-romans-8
  -- John 7:39 ↔ Acts 2:17-18, Romans 8:9-11
  -- -----------------------------------------------------------------------
  ('canon', 'john', 7, 39, 'canon', 'acts', 2, 17,
   E'*And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams: And on my servants and on my handmaidens I will pour out in those days of my Spirit; and they shall prophesy* (Acts 2:17-18). John 7:39 names the condition: *for the Ruach HaKodesh (Holy Spirit) was not yet given; because that Yahusha (Jesus) was not yet glorified.* The glorification happened at the cross and the resurrection; the pouring-out of Acts 2:17-18 is the event John 7:39 says was *not yet* — now become *now.* The rivers of living water that Yahusha (Jesus) promised at the feast are the Spirit poured out on the sons and daughters at Pentecost.'),

  ('canon', 'john', 7, 39, 'canon', 'romans', 8, 9,
   E'*But ye are not in the flesh, but in the Spirit, if so be that the Spirit of Elohim (God) dwell in you. Now if any man have not the Spirit of Messiah (Christ), he is none of his* (Romans 8:9). John 7:39 names what John 7:38 promised: the rivers of living water flowing from the belly of the one who believes, which *spake he of the Spirit, which they that believe on him should receive.* Paul names the dwelling of that same Spirit as the mark of belonging — not merely the Spirit poured out upon, but the Spirit *dwelling in* the body of the believer, the same rivers flowing in from within. The condition *not yet* at the feast in John 7 is the condition *now operative* that Paul names in Romans 8 as the ground of the believer''s standing.')

)
INSERT INTO cross_references
       (source_verse_id, target_verse_id, source, tier_required, note)
SELECT sv.verse_id, tv.verse_id, 'manual', 'free'::content_tier, i.note
  FROM input i
  JOIN _s216_j05_08_lookup sv ON sv.edition_slug    = i.src_edition
                              AND sv.book_slug       = i.src_slug
                              AND sv.chapter_number  = i.src_ch
                              AND sv.verse_number    = i.src_v
  JOIN _s216_j05_08_lookup tv ON tv.edition_slug    = i.tgt_edition
                              AND tv.book_slug       = i.tgt_slug
                              AND tv.chapter_number  = i.tgt_ch
                              AND tv.verse_number    = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 6 free-tier threads.
-- ---------------------------------------------------------------------

-- Thread 1: john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15',
       E'The dead shall hear the voice of the Son and rise — 1 Thessalonians 4 and 1 Corinthians 15',
       E'John 5:21-29 hands the entire resurrection to the Son of Adam. The Father raiseth the dead and quickeneth them; *even so the Son quickeneth whom he will* (v.21). The Father commiteth all judgment to the Son (v.22). Then come two resurrection declarations that stand as the NT''s clearest resurrection architecture: *Verily, verily, I say unto you, The hour is coming, and now is, when the dead shall hear the voice of the Son of Elohim (God): and they that hear shall live* (v.25); and *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice, And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation* (vv.28-29). The authority to execute this judgment is given *because he is the Son of Adam* (v.27) — the Adamic-seed identification as the ground of the resurrection-power.\n\nPaul names the same event from both sides. In 1 Thessalonians 4:16 he names the descending shout and the trump that calls the dead in Messiah (Christ) up first: *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first.* The *voice of the Son of Elohim (God)* that John 5:25 names becomes the *shout* and the *voice of the archangel* and the *trump of Elohim (God)* that Paul names — the same event, the same moment, the dead called up by the voice of the one the Father gave the power to quicken.\n\nIn 1 Corinthians 15 Paul names the same mystery at its fullest: *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* (v.20) — the Son who quickens whom he will (John 5:21) is the firstfruits of all the dead who shall follow. *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (v.22) — the two-resurrection categories of John 5:29 (resurrection of life / resurrection of damnation) are the same two outcomes as dying in Adam and being made alive in Messiah (Christ). And at the last: *In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (v.52) — the graves of John 5:28 opened by the voice, named in Paul''s register as the last trump that cannot be resisted.',
       sv.verse_id, ev.verse_id, 'free', 4090
  FROM _s216_j05_08_lookup sv, _s216_j05_08_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 25
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 5 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11',
       E'The feeding of the five thousand and the bread of life — the synoptics and 1 Corinthians 10–11',
       E'John 6 opens with the feeding of the five thousand and moves immediately into the bread-of-life discourse. The act itself — *Yahusha (Jesus) took the loaves; and when he had given thanks, he distributed to the disciples, and the disciples to them that were set down* (v.11) — is the same act that Matthew 14:19, Mark 6:41, and Luke 9:16 each record: took, looked up to heaven, blessed/gave-thanks, broke, distributed through the twelve. Three synoptic witnesses alongside John''s, all testifying to the one act. What is distinctive about John is that the act immediately becomes a discourse: the crowd seeks him the next day not because they saw signs but *because they did eat of the loaves, and were filled* (v.26), and Yahusha (Jesus) turns the feeding into the bread-of-life declaration: *I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (v.35).\n\nPaul reads the same register backward from the wilderness. In 1 Corinthians 10:3-4 he names the wilderness manna and the water from the rock as spiritual meat and spiritual drink: *for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* What John 6:35 names as the true bread from heaven, Paul names as the substance the wilderness sign already was — *that Rock was Messiah (Christ)*. The five thousand ate barley loaves in the wilderness by the sea; the fathers ate manna in the desert; both were eating the same sign, whose substance is the Formed one in flesh.\n\nAnd at the table: *The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* (1 Corinthians 10:16). John 6:53-56 names the condition: *Except ye eat the flesh of the Son of Adam, and drink his blood, ye have no life in you ... He that eateth my flesh, and drinketh my blood, dwelleth in me, and I in him.* The eating and drinking Paul names as communion of the body and blood is the dwelling-in-him of John 6:56; the table of remembrance named in 1 Corinthians 11:23-26 — *For as often as ye eat this bread, and drink this cup, ye do shew the death of Yahusha (Lord) till he come* — is the act that the bread-of-life discourse was pointing toward. From the five thousand in the wilderness to the table of the new covenant, one bread, one body.',
       sv.verse_id, ev.verse_id, 'free', 4091
  FROM _s216_j05_08_lookup sv, _s216_j05_08_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 11
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 6 AND ev.verse_number = 56
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: john-8-12-i-am-the-light-of-the-world-and-elohim-is-light-in-1-john-1-and-2-corinthians-4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-8-12-i-am-the-light-of-the-world-and-elohim-is-light-in-1-john-1-and-2-corinthians-4',
       E'I am the light of the world — Elohim is light in 1 John 1 and 2 Corinthians 4',
       E'John 8:12 carries the I AM in its light register: *I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* The declaration is not abstract — it is the Formed one naming what the Formless source is, made visible in flesh. Two NT texts take this declaration and unfold what the apostolic community carried from it.\n\nYochanan (John) in his first epistle names what he received from the Formed one directly: *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all* (1 John 1:5). The message he heard *of him* is what John 8:12 contains — the I AM of the light is the naming of what Elohim (God) is. The epistle''s declaration is the gospel''s declaration carried forward: Elohim (God) is light, the Formed one is that light walking in the world, and *if we walk in the light, as he is in the light, we have fellowship one with another, and the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin* (1 John 1:7). The following of John 8:12 (*he that followeth me shall not walk in darkness*) is the walking-in-the-light of 1 John 1:7.\n\nPaul in 2 Corinthians 4:6 names the same act in its proclamation register: *For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* The I AM of John 8:12 is the light of the knowledge of Elohim''s (God''s) glory shining in human flesh — the same Elohim (God) who spoke light out of darkness at the beginning has shone again, this time in the face of the Formed one. The world walks in darkness (1 John 1:6) until this light reaches it in proclamation; the light of the world is the light of the knowledge of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).',
       sv.verse_id, ev.verse_id, 'free', 4092
  FROM _s216_j05_08_lookup sv, _s216_j05_08_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 12
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 8 AND ev.verse_number = 12
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: john-8-44-your-father-the-devil-and-the-children-of-elohim-vs-the-children-of-the-devil-in-1-john-3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-8-44-your-father-the-devil-and-the-children-of-elohim-vs-the-children-of-the-devil-in-1-john-3',
       E'Your father the devil — the children of Elohim and the children of the devil in 1 John 3',
       E'John 8:44 is one of the most misread verses in the gospel, and Yochanan''s (John''s) own epistle is the safeguard against the misreading. The verse does not target the Yahudi (Jewish) people as an ethnic group. The discourse of John 8 is addressed to those within the covenant community who had apparently believed (v.31) but whose conduct reveals a different allegiance: they are seeking to kill the one who tells them the truth (v.40), doing the works of the one who was a murderer from the beginning (v.44). The identification is conduct-based, seed-war-based — not ethnic. Sons of Belial within the covenant community, not the Yahudim (Jews) as a people.\n\n1 John 3 makes this plain by universalizing the same two-category diagnosis across all who claim Elohim (God): *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (v.8). The murderer-from-the-beginning of John 8:44 is the devil-who-sinneth-from-the-beginning of 1 John 3:8. The works of the father are the diagnostic — and the works apply to anyone, of any lineage, who abides in them. *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother* (1 John 3:10). The two categories are present among all who name Elohim (God).\n\nYochanan (John) then anchors the pattern in Cain: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). Cain is the prototype — *of the wicked one*, murdering the righteous brother because his own works are evil. The sons of Belial in the temple court who seek to kill the one who tells them the truth are walking the Cain-pattern: their father was a murderer from the beginning, their works are evil, and the one who stands before them is righteous. The seed war runs from the garden through the temple court to the epistle''s audience — not as a racial marker but as a conduct-revealed lineage. The sons of Belial are within the covenant community, not coterminous with any ethnic group. The word of Yahusha (Jesus) and the word of Yochanan (John) hold together.',
       sv.verse_id, ev.verse_id, 'free', 4093
  FROM _s216_j05_08_lookup sv, _s216_j05_08_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 44
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 8 AND ev.verse_number = 47
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: john-8-58-before-abraham-was-i-am-the-alpha-and-omega-in-revelation-1-and-1-corinthians-12
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-8-58-before-abraham-was-i-am-the-alpha-and-omega-in-revelation-1-and-1-corinthians-12',
       E'Before Abraham was, I am — the Alpha and Omega in Revelation 1 and 1 Corinthians 12',
       E'John 8:58 is the I AM at its starkest: *Verily, verily, I say unto you, Before Abraham was, I am.* The predicate-less *egō eimi* is the Septuagint''s rendering of the *Ehyeh* of Exodus 3:14 — the name the Formed one spoke from the burning bush. When Yahusha (Jesus) names himself *I am* without predicate at John 8:58, he is not reaching for a new claim; he is naming who he has always been. The crowd''s response — taking up stones (v.59) — shows they understood exactly what he was saying.\n\nRevelation 1 names the same figure in the post-resurrection register. In v.8 the voice speaks: *I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty.* The *which is, and which was, and which is to come* is the eternal present-tense self-naming of John 8:58 expanded — the one who simply *is* before Avraham (Abraham) is the one who *was, and is, and is to come* across all of time. Then in vv.17-18 the same figure names himself to the prostrate Yochanan (John): *Fear not; I am the first and the last: I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death.* The pre-existence named at John 8:58 and the post-resurrection authority named at Revelation 1:17-18 belong to the same Formed one — from before Avraham (Abraham) to alive for evermore.\n\nAnd Paul in 1 Corinthians 12:3 names the only way this identification is reached: *no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit).* The I AM of John 8:58 is the Formed one naming the same Yahuah (LORD) identity that Revelation 1:8 expands and that the Ruach HaKodesh (Holy Spirit) alone reveals. The stoning crowd at John 8:59 reached the right understanding by natural reading and responded with rage; the community that confesses *Yahusha (Jesus) is Yahuah (Lord)* has received the same identification by the Spirit''s disclosure. Three NT texts — John 8, Revelation 1, 1 Corinthians 12 — naming the one Formed-one identification from three registers: the I AM spoken in flesh, the Alpha-Omega named in the glorified body, and the Spirit-revealed equation declared in the assembly.',
       sv.verse_id, ev.verse_id, 'free', 4094
  FROM _s216_j05_08_lookup sv, _s216_j05_08_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 58
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 8 AND ev.verse_number = 58
ON CONFLICT (slug) DO NOTHING;

-- Thread 6: john-7-39-the-spirit-not-yet-given-poured-out-at-acts-2-and-dwelling-in-romans-8
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-7-39-the-spirit-not-yet-given-poured-out-at-acts-2-and-dwelling-in-romans-8',
       E'The Spirit not yet given — poured out at Acts 2 and dwelling in Romans 8',
       E'John 7:37-39 names the promise and its condition in the same breath. At the last great day of Sukkot (the Feast of Tabernacles), Yahusha (Jesus) stands and cries: *If any man thirst, let him come unto me, and drink. He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* And then the parenthetical that names the timing: *But this spake he of the Spirit, which they that believe on him should receive: for the Ruach HaKodesh (Holy Spirit) was not yet given; because that Yahusha (Jesus) was not yet glorified* (v.39). The Spirit is promised; the condition is the glorification; the glorification is the cross and the resurrection. The rivers of living water are the Ruach HaKodesh (Holy Spirit) after the glorification — held back until the door opens.\n\nActs 2:17-18 names the moment the *not yet* became *now*: *And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams: And on my servants and on my handmaidens I will pour out in those days of my Spirit; and they shall prophesy.* The rivers that Yahusha (Jesus) promised would flow from the belly of the one who believes are the poured-out Spirit of Yo''el (Joel) 2 finally given, because the glorification is accomplished. *All flesh* in Acts 2 is the scattered seed being gathered — sons and daughters, servants and handmaidens, the ones the Spirit was always going to reach when the glorified Formed one sent him from the Father.\n\nRomans 8:9-11 names what the dwelling looks like in the body that has received the rivers: *But ye are not in the flesh, but in the Spirit, if so be that the Spirit of Elohim (God) dwell in you. Now if any man have not the Spirit of Messiah (Christ), he is none of his. And if Messiah (Christ) be in you, the body is dead because of sin; but the Spirit is life because of righteousness. But if the Spirit of him that raised up Yahusha (Jesus) from the dead dwell in you, he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you.* The rivers of living water flowing from within (John 7:38) are the indwelling Spirit of Romans 8:9 — the Spirit of Elohim (God) dwelling in the body, the Spirit of Messiah (Christ) marking the one who belongs to him, the Spirit that raised Yahusha (Jesus) from the dead now quickening the mortal bodies of the scattered seed. What was *not yet* at the feast is fully operative in the body of every believer the Spirit inhabits.',
       sv.verse_id, ev.verse_id, 'free', 4095
  FROM _s216_j05_08_lookup sv, _s216_j05_08_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 7 AND sv.verse_number = 37
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 7 AND ev.verse_number = 39
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads (21 member rows).
-- ---------------------------------------------------------------------

-- Thread 1: john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
       E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first.* The shout and the trump that call the dead in Messiah (Christ) up first is the *voice of the Son of Elohim (God)* John 5:25 names — the same event from the apostolic proclamation side.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 25
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-thessalonians' AND tv.chapter_number = 4 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
       E'1 Corinthians 15:52 — *In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* The graves of John 5:28 opened by the voice; Paul names the same moment as the last trump that cannot be resisted and cannot be delayed.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 28
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians' AND tv.chapter_number = 15 AND tv.verse_number = 52
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3,
       E'1 Corinthians 15:20 — *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* The Son who quickens whom he will (John 5:21) is the firstfruits whose rising guarantees the harvest of all the dead who are his.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 21
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians' AND tv.chapter_number = 15 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4,
       E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The two-resurrection categories of John 5:29 (life and damnation) are the same two outcomes as dying in Adam and being made alive in Messiah (Christ); the Son of Adam who judges (John 5:27) is also the last Adam who makes alive.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 29
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians' AND tv.chapter_number = 15 AND tv.verse_number = 22
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
       E'Matthew 14:19 — *And he commanded the multitude to sit down on the grass, and took the five loaves, and the two fishes, and looking up to heaven, he blessed, and brake, and gave the loaves to his disciples, and the disciples to the multitude.* Matthew''s account of the same act John 6:11 records — took, blessed, broke, distributed; four witnesses to the one act that the bread-of-life discourse unpacks.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 11
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'matthew' AND tv.chapter_number = 14 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
       E'Mark 6:41 — *And when he had taken the five loaves and the two fishes, he looked up to heaven, and blessed, and brake the loaves, and gave them to his disciples to set before them; and the two fishes divided he among them all.* Mark''s account: the same upward-look, the blessing, the breaking, the giving — and the twelve baskets of fragments (v.43) John 6:13 also names.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 11
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'mark' AND tv.chapter_number = 6 AND tv.verse_number = 41
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3,
       E'Luke 9:16 — *Then he took the five loaves and the two fishes, and looking up to heaven, he blessed them, and brake, and gave to the disciples to set before the multitude.* Luke''s account names the same act and the twelve baskets filled (v.17). Three synoptics alongside John — all four witnesses to the one feeding whose substance Yahusha (Jesus) names as himself: *I am the bread of life* (John 6:35).'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 11
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'luke' AND tv.chapter_number = 9 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4,
       E'1 Corinthians 10:3-4 — *And did all eat the same spiritual meat; And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* Paul reads the wilderness backward: the manna was already Messiah (Christ). What John 6:35 names as the true bread from heaven, the wilderness bread already was in substance; Paul names the identity the sign carried.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 35
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians' AND tv.chapter_number = 10 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5,
       E'1 Corinthians 10:16 — *The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* The communion of the body and blood Paul names is the eating and drinking John 6:53-55 names as the condition of life — the table of remembrance is the covenant meal the bread-of-life discourse was pointing toward.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 53
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians' AND tv.chapter_number = 10 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6,
       E'1 Corinthians 11:26 — *For as often as ye eat this bread, and drink this cup, ye do shew the death of Yahusha (Lord) till he come.* The dwelling-in-him of John 6:56 (*he that eateth my flesh, and drinketh my blood, dwelleth in me, and I in him*) is the mutual abiding that the table of remembrance enacts and proclaims — the eating and drinking as a shewing-forth of the death that opened the door, until the one who opened it comes.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-6-the-feeding-of-the-five-thousand-and-the-bread-of-life-in-the-synoptics-and-1-corinthians-10-11'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 56
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians' AND tv.chapter_number = 11 AND tv.verse_number = 26
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: john-8-12-i-am-the-light-of-the-world-and-elohim-is-light-in-1-john-1-and-2-corinthians-4

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
       E'1 John 1:5 — *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all.* Yochanan (John) names what he received from the Formed one''s own declaration at John 8:12 — the I AM of the light is the naming of what Elohim (God) is; the epistle''s central message is the gospel''s central declaration carried forward.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-8-12-i-am-the-light-of-the-world-and-elohim-is-light-in-1-john-1-and-2-corinthians-4'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 12
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 1 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
       E'1 John 1:7 — *But if we walk in the light, as he is in the light, we have fellowship one with another, and the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin.* The following of John 8:12 (*he that followeth me shall not walk in darkness*) is the walking-in-the-light of 1 John 1:7; the epistle names the fellowship and the cleansing that the following of the light-of-the-world produces.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-8-12-i-am-the-light-of-the-world-and-elohim-is-light-in-1-john-1-and-2-corinthians-4'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 12
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 1 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3,
       E'2 Corinthians 4:6 — *For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* The I AM of John 8:12 is this light shining in the face of the Formed one — the same Elohim (God) who spoke light out of darkness at the beginning has shone again in the face of Yahusha HaMashiach (Jesus Christ), and that light is what is proclaimed.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-8-12-i-am-the-light-of-the-world-and-elohim-is-light-in-1-john-1-and-2-corinthians-4'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 12
   AND tv.edition_slug = 'canon' AND tv.book_slug = '2-corinthians' AND tv.chapter_number = 4 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: john-8-44-your-father-the-devil-and-the-children-of-elohim-vs-the-children-of-the-devil-in-1-john-3

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
       E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The murderer-from-the-beginning of John 8:44 is the devil-who-sinneth-from-the-beginning of 1 John 3:8; the epistle universalizes the identification: doing the works of the father of lies marks anyone of any lineage as being *of the devil.*'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-8-44-your-father-the-devil-and-the-children-of-elohim-vs-the-children-of-the-devil-in-1-john-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 44
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 3 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
       E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* The hearing-of-the-words that John 8:47 names as the mark of being *of Elohim (God)* is the doing-of-righteousness 1 John 3:10 names; the two categories run through all who name Elohim (God), not through one ethnic group.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-8-44-your-father-the-devil-and-the-children-of-elohim-vs-the-children-of-the-devil-in-1-john-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 44
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 3 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3,
       E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Cain as the prototype of the murderer-from-the-beginning: *of the wicked one*, murdering the righteous brother. The sons of Belial in the temple court who seek to kill the one who tells them the truth (John 8:40) are walking the Cain-pattern; the seed war runs from the garden through the temple court to the epistle, a conduct-revealed lineage across all peoples.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-8-44-your-father-the-devil-and-the-children-of-elohim-vs-the-children-of-the-devil-in-1-john-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 44
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-john' AND tv.chapter_number = 3 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: john-8-58-before-abraham-was-i-am-the-alpha-and-omega-in-revelation-1-and-1-corinthians-12

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
       E'Revelation 1:8 — *I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty.* The predicate-less *I am* of John 8:58 expands into the Alpha-Omega, the which-is-and-was-and-is-to-come — the same eternal self-naming, now in the glorified register. The Almighty who speaks at Revelation 1:8 is the Formed one who was *I am* before Avraham (Abraham) at John 8:58.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-8-58-before-abraham-was-i-am-the-alpha-and-omega-in-revelation-1-and-1-corinthians-12'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 58
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'revelation' AND tv.chapter_number = 1 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
       E'Revelation 1:17-18 — *Fear not; I am the first and the last: I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death.* The pre-existence of John 8:58 and the post-resurrection authority of Revelation 1:17-18 belong to the same Formed one — from before Avraham (Abraham) to alive for evermore, the first and the last holding the keys of death and Sheol.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-8-58-before-abraham-was-i-am-the-alpha-and-omega-in-revelation-1-and-1-corinthians-12'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 58
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'revelation' AND tv.chapter_number = 1 AND tv.verse_number = 17
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3,
       E'1 Corinthians 12:3 — *no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit).* The Spirit-revealed equation: the I AM of John 8:58 is the Yahuah (LORD) identity disclosed only by the Ruach HaKodesh (Holy Spirit). The crowd that stoned at v.59 reached the right understanding by natural reading and answered with rage; the assembly that confesses *Yahusha (Jesus) is Yahuah (Lord)* has received the same identification by the Spirit''s disclosure alone.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-8-58-before-abraham-was-i-am-the-alpha-and-omega-in-revelation-1-and-1-corinthians-12'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 58
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians' AND tv.chapter_number = 12 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: john-7-39-the-spirit-not-yet-given-poured-out-at-acts-2-and-dwelling-in-romans-8

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
       E'Acts 2:17-18 — *And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy ... And on my servants and on my handmaidens I will pour out in those days of my Spirit.* The rivers of living water that were *not yet* given at the feast (John 7:39) are now poured out at Acts 2 — the glorification accomplished, the condition met, the Spirit given.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-7-39-the-spirit-not-yet-given-poured-out-at-acts-2-and-dwelling-in-romans-8'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 7 AND sv.verse_number = 39
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'acts' AND tv.chapter_number = 2 AND tv.verse_number = 17
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
       E'Romans 8:9 — *But ye are not in the flesh, but in the Spirit, if so be that the Spirit of Elohim (God) dwell in you. Now if any man have not the Spirit of Messiah (Christ), he is none of his.* The rivers of living water flowing from within (John 7:38) are the indwelling Spirit of Romans 8:9 — not just poured upon but dwelling in; the *not yet* of John 7:39 is the *now operative* of Romans 8:9, the Spirit of Messiah (Christ) marking every one who belongs to him.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j05_08_lookup sv, _s216_j05_08_lookup tv
 WHERE t.slug = 'john-7-39-the-spirit-not-yet-given-poured-out-at-acts-2-and-dwelling-in-romans-8'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 7 AND sv.verse_number = 39
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'romans' AND tv.chapter_number = 8 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===================== fragment: minion_john_09_12.sql =====================
-- =====================================================================
-- S216 minion — John 9–12 NT-to-NT cross-references
-- =====================================================================
-- Range:  John 9 (man born blind / spiritual blindness),
--         John 10 (I AM the door / good shepherd / other sheep /
--                  my sheep hear my voice / I and my Father are one),
--         John 11 (raising of Lazarus / I AM the resurrection and the
--                  life / Caiaphas's prophecy to gather the scattered),
--         John 12 (triumphal entry / Greeks seek / grain of wheat must
--                  die / Son of Adam lifted up / voice from heaven /
--                  unbelief foretold).
-- Tag:    j09_12  (temp view: _s216_j09_12_lookup)
-- Sort band: 4160–4229
-- Output: scratch_xref_ntnt/minion_john_09_12.sql
--
-- 7 threads:
--   1. john-9-the-blinding-of-the-seeing-and-the-light-that-shines-in-2-corinthians-4
--        (sort 4160) — John 9:39 ↔ 2 Corinthians 4:4,6
--   2. john-10-the-good-shepherd-lays-down-his-life-and-the-great-shepherd-in-hebrews-13
--        (sort 4161) — John 10:11,14,15 ↔ Hebrews 13:20
--   3. john-10-other-sheep-not-of-this-fold-and-the-lost-sheep-of-the-house-of-yasharel-in-matthew-and-1-peter
--        (sort 4162) — John 10:16,27 ↔ Matthew 15:24; Matthew 18:11-12; 1 Peter 2:25
--   4. john-10-i-and-my-father-are-one-the-formed-one-christology-in-colossians-2-and-1-corinthians-12
--        (sort 4163) — John 10:30 ↔ Colossians 2:9; 1 Corinthians 12:3
--   5. john-11-i-am-the-resurrection-and-the-life-and-the-resurrection-in-1-corinthians-15-and-1-thessalonians-4-and-revelation-20
--        (sort 4164) — John 11:25 ↔ 1 Corinthians 15:20-23; 1 Thessalonians 4:14-16; Revelation 20:4-6
--   6. john-11-caiaphas-gather-the-scattered-children-and-the-ingathering-in-ephesians-1-and-matthew-24
--        (sort 4165) — John 11:52 ↔ Ephesians 1:10; Matthew 24:31
--   7. john-12-the-grain-of-wheat-must-die-and-the-son-of-adam-glorified-in-1-corinthians-15-and-philippians-2
--        (sort 4166) — John 12:24,32 ↔ 1 Corinthians 15:36-38; Philippians 2:6-11
--
-- John 9 NT-to-NT note: The three existing John 9 threads from S194
--   (light-of-the-world-opening-the-blind-eyes, for-judgment-the-seeing-
--   made-blind, cast-out-of-the-synagogue-the-shepherd-receives-the-outcast)
--   carry Tanakh targets only. Thread 1 here adds the NT completion of the
--   blindness architecture via 2 Corinthians 4:4,6.
--
-- Tier: 'free' (canonical NT-to-NT scripture cross-references).
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- No BEGIN/COMMIT — orchestrator wraps the transaction.
-- =====================================================================

-- Verse-lookup temp view (full-library guard, uniquely named j09_12).
CREATE TEMP VIEW _s216_j09_12_lookup AS
SELECT e.slug AS edition_slug,
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
       'ascension-isaiah',
       'sonnini-acts-29'
   );

-- =====================================================================
-- cross_references INSERT — all 7 threads, 19 rows
-- =====================================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- ---------------------------------------------------------------
  -- Thread 1: john-9-the-blinding-of-the-seeing-and-the-light-that-shines-in-2-corinthians-4
  -- Source: John 9:39 — For judgment I am come: that they which see not
  --   might see; and that they which see might be made blind.
  -- ---------------------------------------------------------------
  ('canon', 'john', 9, 39,
   'canon', '2-corinthians', 4, 4,
   E'*In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them.* (2 Corinthians 4:4). The blindness that lands on those who *see* in John 9:39 — the Pharisees whose eyes are stopped by the very claims of the one who heals blind eyes — is named by Paul as the work of the god of this world, who stops the light of the knowledge of the image of Elohim (God) from shining in. The judgment of John 9:39 (*that they which see might be made blind*) and the blindness of 2 Corinthians 4:4 are the same architecture: the one who holds the credential of sight is blinded to the Light he stands in front of.'),

  ('canon', 'john', 9, 39,
   'canon', '2-corinthians', 4, 6,
   E'*For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* (2 Corinthians 4:6). The same voice that commanded *Let there be light* at creation has shined in the hearts of those who receive the gospel — the light of the knowledge of the glory of Elohim (God) given in the face of Yahusha (Jesus). John 9:5''s *I am the light of the world* and the opened eyes of the man born blind are the same light Paul names: it shines in the face of the Formed one, and either opens blind eyes or is stopped by those who will not see. The face of Yahusha HaMashiach (Jesus Christ) in 2 Corinthians 4:6 is the *light of the world* of John 9:5 named in its full weight.'),

  -- ---------------------------------------------------------------
  -- Thread 2: john-10-the-good-shepherd-lays-down-his-life-and-the-great-shepherd-in-hebrews-13
  -- Source: John 10:11 — I am the good shepherd: the good shepherd giveth
  --   his life for the sheep.
  -- John 10:14 — I am the good shepherd, and know my sheep.
  -- John 10:15 — I lay down my life for the sheep.
  -- ---------------------------------------------------------------
  ('canon', 'john', 10, 11,
   'canon', 'hebrews', 13, 20,
   E'*Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant.* (Hebrews 13:20). The *great shepherd of the sheep* who was brought again from the dead through the blood of the everlasting covenant is the good shepherd of John 10:11 who gave his life for the sheep. Hebrews 13:20 names what happened after *the good shepherd giveth his life*: the Elohim (God) of peace brought the great shepherd back through the blood that sealed the everlasting covenant. The laying-down of John 10:11 and the being-brought-again of Hebrews 13:20 are the two sides of the same motion — death and resurrection of the shepherd, for the flock.'),

  ('canon', 'john', 10, 15,
   'canon', 'hebrews', 13, 20,
   E'*Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant.* (Hebrews 13:20). *I lay down my life for the sheep* (John 10:15) declares the act; Hebrews 13:20 names the Father''s answer to it — he brought the great shepherd again from the dead through the blood of the everlasting covenant. The covenant blood that seals the flock''s security is the blood the shepherd spilled when he laid down his life. John 10:15 is the promise; Hebrews 13:20 is the fulfilment named.'),

  -- ---------------------------------------------------------------
  -- Thread 3: john-10-other-sheep-not-of-this-fold-and-the-lost-sheep-of-the-house-of-yasharel-in-matthew-and-1-peter
  -- Source: John 10:16 — And other sheep I have, which are not of this
  --   fold: them also I must bring, and they shall hear my voice; and
  --   there shall be one fold, and one shepherd.
  -- John 10:27 — My sheep hear my voice, and I know them, and they follow me.
  -- ---------------------------------------------------------------
  ('canon', 'john', 10, 16,
   'canon', 'matthew', 15, 24,
   E'*But he answered and said, I am not sent but unto the lost sheep of the house of Yashar''el (Israel).* (Matthew 15:24). The other sheep of John 10:16 — *which are not of this fold* — are not outside-covenant peoples being added to Yashar''el (Israel) by faith-confession. They are the same lost sheep Yahusha (Jesus) names as his entire commission in Matthew 15:24: the lost sheep of the house of Yashar''el (Israel), scattered into the nations through the exile and no longer gathered in one fold. The fold not-yet-brought is the northern house, divorced and scattered beyond the fold of the house of Yahudah (Judah); *them also I must bring* is the shepherd''s mission to the scattered seed. *They shall hear my voice* — the hearing reveals what was already true before the foundation of the world; it does not make them sheep, it discloses them.'),

  ('canon', 'john', 10, 16,
   'canon', 'matthew', 18, 12,
   E'*How think ye? if a man have an hundred sheep, and one of them be gone astray, doth he not leave the ninety and nine, and goeth into the mountains, and seeketh that which is gone astray?* (Matthew 18:12). The other sheep *not of this fold* who *shall hear my voice* (John 10:16) are the gone-astray sheep of Matthew 18:12 whom the shepherd seeks in the mountains. Matthew 18:11 anchors the mission: *for the Son of Adam is come to save that which was lost.* The one fold of John 10:16 — Yahudah (Judah) and the scattered house together, under one shepherd — is assembled by the seeking described in Matthew 18:12, the shepherd leaving the ninety-nine to go after the one gone astray in the mountains of the nations.'),

  ('canon', 'john', 10, 27,
   'canon', '1-peter', 2, 25,
   E'*For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls.* (1 Peter 2:25). Peter writes to the scattered (1 Peter 1:1 — *to the strangers scattered throughout*) and names what has happened: sheep who were going astray have returned to the Shepherd and Bishop of their souls. *My sheep hear my voice* (John 10:27) is the mechanism; the return named in 1 Peter 2:25 is what the hearing produces. The Shepherd and Bishop of souls is the good shepherd of John 10:14 who knows his sheep — and the scattered sheep to whom Peter writes are the same scattered sheep Yahusha (Jesus) named as *other sheep* not yet gathered into one fold. The hearing has revealed them.'),

  -- ---------------------------------------------------------------
  -- Thread 4: john-10-i-and-my-father-are-one-the-formed-one-christology-in-colossians-2-and-1-corinthians-12
  -- Source: John 10:30 — I and my Father are one.
  -- ---------------------------------------------------------------
  ('canon', 'john', 10, 30,
   'canon', 'colossians', 2, 9,
   E'*For in him dwelleth all the fulness of the Godhead bodily.* (Colossians 2:9). John 10:30''s *I and my Father are one* is the Formed one naming his oneness with the Formless source — not two co-equal persons of equal substance in the philosophical Trinitarian sense, and not a collapsed identity in the modalist sense, but the Formed drawn from the Formless in whom all the fulness of the Godhead dwells bodily. Colossians 2:9 names the architecture: the full fulness of the Godhead — Yahuah''s own unconstrained being — is present in the Formed one bodily, because the Formed is drawn from the Formless and carries all of what the Formless is in expressed, embodied form. *I and my Father are one* and *all the fulness of the Godhead bodily* name the same truth from two angles.'),

  ('canon', 'john', 10, 30,
   'canon', '1-corinthians', 12, 3,
   E'*No man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit).* (1 Corinthians 12:3). The Ruach HaKodesh (Holy Spirit) is the spirit of the Formed one, and the Spirit-revealed confession of 1 Corinthians 12:3 — *Yahusha (Jesus) is Yahuah (Lord)* — is the same identification John 10:30 makes from the Formed one''s own mouth: *I and my Father are one.* The Yahudim (Jews) who picked up stones understood the claim (John 10:31-33): he was making himself Elohim (God). The Spirit-given confession of 1 Corinthians 12:3 is the same recognition, given now not by accusation but by revelation — the Ruach HaKodesh (Holy Spirit) opens the eyes to see what John 10:30 named plainly: Yahusha (Jesus) is Yahuah (Lord), the Formed one in whom the Formless dwells fully.'),

  -- ---------------------------------------------------------------
  -- Thread 5: john-11-i-am-the-resurrection-and-the-life-and-the-resurrection-in-1-corinthians-15-and-1-thessalonians-4-and-revelation-20
  -- Source: John 11:25 — I am the resurrection, and the life: he that
  --   believeth in me, though he were dead, yet shall he live.
  -- ---------------------------------------------------------------
  ('canon', 'john', 11, 25,
   'canon', '1-corinthians', 15, 20,
   E'*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* (1 Corinthians 15:20). *I am the resurrection, and the life* (John 11:25) is not a general claim about existence; it is the Formed one naming himself as the agent of the resurrection the Tanakh promised. 1 Corinthians 15:20 names the mechanism of his claim: he is the firstfruits of them that slept — the first raised, whose rising guarantees the rising of all who belong to him. The resurrection of Lazarus in John 11 is the sign that the firstfruits has the power he claims; 1 Corinthians 15:20 is the same power named in its full weight.'),

  ('canon', 'john', 11, 25,
   'canon', '1-corinthians', 15, 23,
   E'*But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* (1 Corinthians 15:23). The order of the resurrection — Messiah (Christ) the firstfruits first, then those who are his at his coming — is the sequence John 11:25 stakes its claim on. *He that believeth in me, though he were dead, yet shall he live* (John 11:25) is the promise; 1 Corinthians 15:23 names the timing: the *yet shall he live* is ordered around his coming, the firstfruits leading the rest into the harvest. Martha''s confession (*I know that he shall rise again in the resurrection at the last day*, John 11:24) is answered by the One who is himself the resurrection: the last day is structured around him.'),

  ('canon', 'john', 11, 25,
   'canon', '1-thessalonians', 4, 16,
   E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first.* (1 Thessalonians 4:16). *I am the resurrection, and the life* (John 11:25) names the agent; 1 Thessalonians 4:16 names the event — Yahuah (Lord) himself descending, the dead in Messiah (Christ) rising first. The *though he were dead, yet shall he live* of John 11:25 is fulfilled at the coming named in 1 Thessalonians 4:16: the voice that called Lazarus out of the tomb (*Lazarus, come forth*, John 11:43) is the same voice that descends with a shout and raises the dead in Messiah (Christ) first.'),

  ('canon', 'john', 11, 25,
   'canon', 'revelation', 20, 6,
   E'*Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* (Revelation 20:6). *I am the resurrection, and the life* (John 11:25) promises what Revelation 20:6 names as the first resurrection: those who are his and rise at his coming have no second death — the second death has no power over them. They are priests of Elohim (God) and of Messiah (Christ). The *shall never die* of John 11:26 is not a spiritual metaphor; it is the literal promise of Revelation 20:6 — the first resurrection exempts from the second death, and the ones raised are set in the priestly office of the millennial reign.'),

  -- ---------------------------------------------------------------
  -- Thread 6: john-11-caiaphas-gather-the-scattered-children-and-the-ingathering-in-ephesians-1-and-matthew-24
  -- Source: John 11:52 — And not for that nation only, but that also he
  --   should gather together in one the children of Elohim (God) that
  --   were scattered abroad.
  -- ---------------------------------------------------------------
  ('canon', 'john', 11, 52,
   'canon', 'ephesians', 1, 10,
   E'*That in the dispensation of the fulness of times he might gather together in one all things in Messiah (Christ), both which are in heaven, and which are on earth; even in him.* (Ephesians 1:10). Caiaphas''s prophecy names the event with precision: *he should gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). Paul names the same gathering as the *dispensation of the fulness of times* — the moment when all things are gathered together in one in Messiah (Christ). The *children of Elohim (God) scattered abroad* of John 11:52 are the covenant seed dispersed through the Assyrian exile and subsequent scatterings, the twelve-tribe paternal blood remnant the prophets named. The gathering is not a metaphor for universal spiritual inclusion; it is the specific ingathering of the specific scattered children, accomplished in the Messiah whose death for that nation opened the way.'),

  ('canon', 'john', 11, 52,
   'canon', 'matthew', 24, 31,
   E'*And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* (Matthew 24:31). Caiaphas prophesies the purpose of Yahusha''s (Jesus'') death: *to gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). Matthew 24:31 names the mechanism: the angels sent with the great trumpet-sound to gather the elect from the four winds, from one end of heaven to the other. The *scattered abroad* of John 11:52 are the *four winds* of Matthew 24:31 — the twelve-tribe remnant dispersed to every corner of the earth and gathered back by the one whose death gathered them in one. The trumpet of Matthew 24:31 is the same ingathering the high priest''s prophecy announced, its execution assigned to the angels at the coming of the Son of Adam.'),

  -- ---------------------------------------------------------------
  -- Thread 7: john-12-the-grain-of-wheat-must-die-and-the-son-of-adam-glorified-in-1-corinthians-15-and-philippians-2
  -- Source: John 12:24 — Except a corn of wheat fall into the ground
  --   and die, it abideth alone: but if it die, it bringeth forth much fruit.
  -- John 12:32 — And I, if I be lifted up from the earth, will draw
  --   all men unto me.
  -- ---------------------------------------------------------------
  ('canon', 'john', 12, 24,
   'canon', '1-corinthians', 15, 36,
   E'*Thou fool, that which thou sowest is not quickened, except it die.* (1 Corinthians 15:36). *Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit* (John 12:24) is the Formed one''s own teaching on the necessity of his death. 1 Corinthians 15:36 applies the same principle to the resurrection body: *that which thou sowest is not quickened, except it die.* Paul is not inventing an analogy; he is deploying the exact seed-principle Yahusha (Jesus) taught in John 12:24. The grain that dies to rise with a body the Father assigns it is the architecture of both the resurrection and the death Yahusha (Jesus) walked into — the one seed that died alone rose and brought forth much fruit.'),

  ('canon', 'john', 12, 24,
   'canon', '1-corinthians', 15, 38,
   E'*But Elohim (God) giveth it a body as it hath pleased him, and to every seed his own body.* (1 Corinthians 15:38). The grain of wheat that dies brings forth *much fruit* (John 12:24) — the one seed multiplied into the many. 1 Corinthians 15:38 names the Father''s role: *Elohim (God) giveth it a body as it hath pleased him, and to every seed his own body.* The Father who gives every seed its own body is the Father who receives the grain of wheat that falls and dies — and raises it in the body that pleases him, multiplied into the much fruit. The architecture runs: the one grain dies (John 12:24), the Father gives it a body (1 Corinthians 15:38), and the harvest is *much fruit* — the gathered many who come forth from the one.'),

  ('canon', 'john', 12, 32,
   'canon', 'philippians', 2, 9,
   E'*Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name.* (Philippians 2:9). *And I, if I be lifted up from the earth, will draw all men unto me* (John 12:32) — the lifting up is both the cross and the glorification that follows it. Philippians 2:9 names the Father''s answer to the humbling-unto-death of Philippians 2:8: Elohim (God) highly exalted him and gave him the name above every name. The being-lifted-up of John 12:32 (the cross, then the exaltation) is the same motion Philippians 2:8-9 walks: the descent into death, then the Father''s exaltation above all. The *draw all men unto me* of John 12:32 is the exaltation in Philippians 2:10-11 made visible — every knee bowing and every tongue confessing at the name above every name.'),

  ('canon', 'john', 12, 32,
   'canon', 'philippians', 2, 11,
   E'*And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* (Philippians 2:11). *I, if I be lifted up from the earth, will draw all men unto me* (John 12:32) — the *all men* drawn by the lifted-up Son of Adam is the *every tongue* of Philippians 2:11 that confesses Yahusha HaMashiach (Jesus Christ) is Lord. The drawing and the confessing are the same event named from two sides: the lifted-up Formed one draws; every tongue answers the draw with the Spirit-given confession. The note of John 12:23 — *the hour is come, that the Son of Adam should be glorified* — is the glory that lands in Philippians 2:11 as *the glory of Elohim (God) the Father*: the Son exalted, every tongue confessing, the Father glorified in the Son''s glorification.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j09_12_lookup sv ON sv.edition_slug = i.src_edition
                              AND sv.book_slug    = i.src_slug
                              AND sv.chapter_number = i.src_ch
                              AND sv.verse_number  = i.src_v
  JOIN _s216_j09_12_lookup tv ON tv.edition_slug = i.tgt_edition
                              AND tv.book_slug    = i.tgt_slug
                              AND tv.chapter_number = i.tgt_ch
                              AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- threads INSERT — 7 threads
-- =====================================================================

-- Thread 1: john-9-the-blinding-of-the-seeing-and-the-light-that-shines-in-2-corinthians-4
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
  'john-9-the-blinding-of-the-seeing-and-the-light-that-shines-in-2-corinthians-4',
  E'The blinding of the seeing and the light that shines — John 9 and 2 Corinthians 4',
  E'John 9''s movement is a reversal: the man born blind receives sight, and the Pharisees who possess the credential of sight are made blind. *For judgment I am come into this world, that they which see not might see; and that they which see might be made blind* (John 9:39). Paul names the same reversal from the other side in 2 Corinthians 4:4-6. The blinding of those who do not believe is the work of the god of this world: *In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them* (2 Corinthians 4:4). The light that the god of this world prevents from shining is the light of the glorious gospel of Messiah (Christ), *who is the image of Elohim (God)* — the same Formed one who stands in front of the Pharisees in John 9 and says *I am the light of the world* (John 9:5). The god of this world blinds against this specific light — the image of Elohim (God) made visible in the face of the Formed one. The positive movement is given in 2 Corinthians 4:6: *Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* The same voice that spoke *Let there be light* at creation has shined the light of the knowledge of the glory of Elohim (God) into hearts — in the face of Yahusha HaMashiach (Jesus Christ). This is the counterpart to the man born blind receiving his sight: the opened eyes are opened to the glory of Elohim (God) in the face of the Formed one. The judgment of John 9:39 does not strip light from those who already have it; it reveals that those who have built their credential on the claim of sight were already blind, because the light they refused to receive was the image of Elohim (God) himself, standing in front of them in flesh.',
  sv.verse_id, ev.verse_id, 'free'::content_tier, 4160
  FROM _s216_j09_12_lookup sv, _s216_j09_12_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 39
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 9 AND ev.verse_number = 39
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: john-10-the-good-shepherd-lays-down-his-life-and-the-great-shepherd-in-hebrews-13
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
  'john-10-the-good-shepherd-lays-down-his-life-and-the-great-shepherd-in-hebrews-13',
  E'The good shepherd gives his life — the great shepherd brought again in Hebrews 13',
  E'John 10''s good-shepherd declaration has two movements: the giving of life (*I am the good shepherd: the good shepherd giveth his life for the sheep*, John 10:11) and the taking it again (*I have power to lay it down, and I have power to take it again*, John 10:18). Hebrews 13:20 is the NT witness to what happened when those two movements completed: *Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant.* The *great shepherd of the sheep* is the same good shepherd of John 10:11 and 14. The *brought again from the dead* is the taking-again of John 10:18. The mechanism that made it possible is named: *through the blood of the everlasting covenant.* The blood the shepherd shed when he gave his life for the sheep is the blood through which the Father of peace brought him back — the everlasting covenant sealed in his own death, confirmed by his resurrection. John 10:11 declares *the good shepherd giveth his life for the sheep;* John 10:15 anchors it: *I lay down my life for the sheep.* Hebrews 13:20 names the result: the shepherd is brought again, the everlasting covenant is ratified in blood, and the great shepherd is alive to *make you perfect in every good work to do his will* (Hebrews 13:21) — the flock now tended by the shepherd who has returned from death as the living evidence that the everlasting covenant holds.',
  sv.verse_id, ev.verse_id, 'free'::content_tier, 4161
  FROM _s216_j09_12_lookup sv, _s216_j09_12_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 11
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 10 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: john-10-other-sheep-not-of-this-fold-and-the-lost-sheep-of-the-house-of-yasharel-in-matthew-and-1-peter
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
  'john-10-other-sheep-not-of-this-fold-and-the-lost-sheep-of-the-house-of-yasharel-in-matthew-and-1-peter',
  E'Other sheep not of this fold — the lost sheep of the house of Yashar''el (Israel) in Matthew and 1 Peter',
  E'John 10:16 is the most misread verse in the good-shepherd discourse: *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The inherited reading treats *other sheep not of this fold* as outside-covenant peoples added to Yashar''el (Israel) by faith-confession — Gentiles included in a newly formed church. That reading is the false-inclusion gospel, and the NT witnesses themselves dismantle it. Matthew 15:24 contains Yahusha''s (Jesus'') own declaration of his entire commission: *I am not sent but unto the lost sheep of the house of Yashar''el (Israel).* The *other sheep not of this fold* are not outside-covenant peoples; they are the other house — the northern kingdom, the house of Yosef and Ephraim, divorced and scattered by the Assyrian captivity and now living as Gentiles among the nations without knowing who they are. The fold of John 10:16 is the fold of Yahudah (Judah); the other sheep are the scattered seed of the northern house. *Them also I must bring* is the must of the prophetic restoration the Tanakh named through Isaiah 11, Jeremiah 31, Ezekiel 37, Hosea 1-2: the two houses gathered into one. *They shall hear my voice* is the mechanism: the hearing reveals what was already true before the foundation of the world. The sheep hear because they are sheep — the hearing does not make them sheep. Matthew 18:12 names the seeking: *if a man have an hundred sheep, and one of them be gone astray, doth he not leave the ninety and nine, and goeth into the mountains, and seeketh that which is gone astray?* — the gone-astray sheep sought in the mountains of the nations, the scattered seed reached in their exile. When the scattered sheep hear and return, 1 Peter 2:25 names where they have arrived: *For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls.* Peter writes to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia (1 Peter 1:1) — he is writing to the scattered house, the sheep who were going astray. They have heard the voice (John 10:27: *my sheep hear my voice, and I know them, and they follow me*) and returned to the Shepherd and Bishop of their souls. The one fold of John 10:16 is not a new creation; it is the restoration of the one covenant people under the one shepherd, the two houses brought together in the one who laid down his life for them.',
  sv.verse_id, ev.verse_id, 'free'::content_tier, 4162
  FROM _s216_j09_12_lookup sv, _s216_j09_12_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 10 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: john-10-i-and-my-father-are-one-the-formed-one-christology-in-colossians-2-and-1-corinthians-12
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
  'john-10-i-and-my-father-are-one-the-formed-one-christology-in-colossians-2-and-1-corinthians-12',
  E'I and my Father are one — the Formed-one Christology in Colossians 2 and 1 Corinthians 12',
  E'*I and my Father are one* (John 10:30). The men who heard it reached for stones, and they named the charge precisely: *because that thou, being a man, makest thyself Elohim (God)* (John 10:33). They understood what was being said. The claim is not the philosophical Trinitarian co-equal-persons claim, and it is not the modalist collapse that makes the Father and the Son the same undifferentiated being. It is the Formed one naming his oneness with the Formless source from which he is drawn — the same Formed one who said before Abraham was, I am (John 8:58), the same who appears through every theophany of the Tanakh, the God of the OT interactions who came in the flesh. The NT carries two witnesses to the same identification. Colossians 2:9 names the Formed-one architecture directly: *For in him dwelleth all the fulness of the Godhead bodily.* All the fulness. Not a portion, not a representation. All the fulness of what Yahuah (God) is — the Godhead, the divine being — dwells in the Formed one bodily. The Formless source expresses itself completely in the Formed; there is no fulness held back from the Son, because the Son is drawn from the Formless as the breath is drawn from the lungs, the brightness from the everlasting light, the image from the mirror. *I and my Father are one* names the completeness of that drawing; Colossians 2:9 names the completeness of what dwells in him. 1 Corinthians 12:3 is the Spirit-given recognition of the same truth from the inside: *no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit).* The confession *Yahusha (Jesus) is Yahuah (Lord)* — that the Formed one is the LORD himself — is what the Ruach HaKodesh (Holy Spirit) gives. The Ruach HaKodesh (Holy Spirit) does not give a partially-true confession; the Spirit-revealed equation is *Yahusha (Jesus) is Yahuah (Lord),* the same identification John 10:30 makes from the Formed one''s own mouth. The Yahudim (Jews) heard it as blasphemy; the Spirit-given confession receives it as the truth the whole Tanakh was building toward.',
  sv.verse_id, ev.verse_id, 'free'::content_tier, 4163
  FROM _s216_j09_12_lookup sv, _s216_j09_12_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 30
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 10 AND ev.verse_number = 30
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: john-11-i-am-the-resurrection-and-the-life-and-the-resurrection-in-1-corinthians-15-and-1-thessalonians-4-and-revelation-20
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
  'john-11-i-am-the-resurrection-and-the-life-and-the-resurrection-in-1-corinthians-15-and-1-thessalonians-4-and-revelation-20',
  E'I am the resurrection and the life — the resurrection order in 1 Corinthians 15, 1 Thessalonians 4, and Revelation 20',
  E'Martha knows the doctrine: *I know that he shall rise again in the resurrection at the last day* (John 11:24). Yahusha (Jesus) does not correct the doctrine; he names himself as its agent and its substance: *I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live: And whosoever liveth and believeth in me shall never die* (John 11:25-26). The claim is that the resurrection is not an event that happens independently of him — it is what he is, and it happens through him in order and at the timing the Tanakh''s prophets named. The NT carries three complementary witnesses that fill in the architecture. 1 Corinthians 15:20-23 names the firstfruits order: *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept ... But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The Formed one rose as the firstfruits — the first of the harvest, whose rising guarantees the rising of all who belong to him in his own order. *I am the resurrection* is the firstfruits standing up from among the dead; *though he were dead, yet shall he live* is the coming harvest named by every man in his own order at the coming. 1 Thessalonians 4:16 names the event of that coming: *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first.* The voice that called *Lazarus, come forth* (John 11:43) is the voice that descends with a shout — the same shepherd''s voice that calls his own sheep by name, the same voice that raised the dead and will raise the dead again at the trump of Elohim (God). Revelation 20:4-6 names what the risen receive: *they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years ... Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power.* *Shall never die* (John 11:26) is the *second death hath no power* of Revelation 20:6 made precise: the first resurrection participants are exempted from the second death — and set in the priestly office of the millennial reign. The I-am-the-resurrection of John 11:25 is not a comfort for one morning in Bethany; it is the entire resurrection architecture of the covenant, named in one sentence by the one who is both its agent and its substance.',
  sv.verse_id, ev.verse_id, 'free'::content_tier, 4164
  FROM _s216_j09_12_lookup sv, _s216_j09_12_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 25
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 11 AND ev.verse_number = 26
ON CONFLICT (slug) DO NOTHING;

-- Thread 6: john-11-caiaphas-gather-the-scattered-children-and-the-ingathering-in-ephesians-1-and-matthew-24
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
  'john-11-caiaphas-gather-the-scattered-children-and-the-ingathering-in-ephesians-1-and-matthew-24',
  E'Caiaphas: gather together the scattered children of Elohim (God) — the ingathering in Ephesians 1 and Matthew 24',
  E'The high priest prophesies truer than he knows. Caiaphas argues expedience — one man die for the people rather than the whole nation perish — and John''s gospel pauses to name what he actually said: *And this spake he not of himself: but being high priest that year, he prophesied that Yahusha (Jesus) should die for that nation; And not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad* (John 11:51-52). The death would accomplish a gathering: the children of Elohim (God) scattered abroad gathered together in one. The phrase *children of Elohim (God) that were scattered abroad* does not mean every human being who might one day confess faith. It is the prophetic language of the Tanakh applied with precision: the scattered seed of the covenant household, the twelve-tribe remnant dispersed through the Assyrian captivity and subsequent exiles, the ones the prophets named as scattered among the nations and promised to be gathered home. The NT carries this gathering forward in two registers. Paul names it as the purpose at the centre of the ages: *That in the dispensation of the fulness of times he might gather together in one all things in Messiah (Christ), both which are in heaven, and which are on earth; even in him* (Ephesians 1:10). The *gather together in one* of Ephesians 1:10 is the same Greek compound — *anakephalaiōsasthai* — that John 11:52 uses for the gathering of the scattered children. Paul is describing the same event: the dispensation of the fulness of times is the season when the scattered covenant children are gathered together in one in the Messiah whose death opened the way for the gathering. Matthew 24:31 names the mechanism and the scope: *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The *four winds* and *one end of heaven to the other* map the geographic reality of the scattering named in John 11:52 — the children of Elohim (God) scattered abroad to every corner of the earth, gathered at the great trumpet-sound by the angels sent out at the Son of Adam''s coming. Caiaphas did not know what he was saying. The text knows exactly what it is saying.',
  sv.verse_id, ev.verse_id, 'free'::content_tier, 4165
  FROM _s216_j09_12_lookup sv, _s216_j09_12_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 51
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 11 AND ev.verse_number = 52
ON CONFLICT (slug) DO NOTHING;

-- Thread 7: john-12-the-grain-of-wheat-must-die-and-the-son-of-adam-glorified-in-1-corinthians-15-and-philippians-2
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
  'john-12-the-grain-of-wheat-must-die-and-the-son-of-adam-glorified-in-1-corinthians-15-and-philippians-2',
  E'The grain of wheat must die — the Son of Adam glorified in 1 Corinthians 15 and Philippians 2',
  E'John 12 opens the hour of glorification. *The hour is come, that the Son of Adam should be glorified* (John 12:23). Yahusha (Jesus) does not explain the glorification as triumph-without-death; he explains it as the seed-principle: *Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit* (John 12:24). The one seed falls and dies alone; the dying releases the many — *much fruit.* Then he names the specific lifting-up: *And I, if I be lifted up from the earth, will draw all men unto me* (John 12:32), signifying the death he would die. The glorification is the lifting-up on the cross and the exaltation that follows — they are one motion, not two separate events. The NT carries the seed-principle and the glorification forward in two complementary witnesses. 1 Corinthians 15:36-38 deploys the exact seed-principle Yahusha (Jesus) taught: *Thou fool, that which thou sowest is not quickened, except it die ... But Elohim (God) giveth it a body as it hath pleased him, and to every seed his own body.* Paul is not borrowing a metaphor from common agriculture; he is building the resurrection argument on the principle Yahusha (Jesus) laid down in John 12:24. The grain of wheat that dies and brings forth much fruit is the same seed that must die in order to be quickened, the same seed to which Elohim (God) gives a body as it pleases him. The one grain — the Formed one — died alone; the body the Father gave him in the resurrection is the firstfruit of the body he will give to every seed in its own order. Philippians 2:6-11 names the motion of the glorification in full: *Who, being in the form of Elohim (God) ... made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men: And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross. Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name: That at the name of Yahusha (Jesus) every knee should bow ... And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The one who was in the form of Elohim (God) descended into death — the grain fell alone. Elohim (God) highly exalted him and gave him the name above every name — the seed rose and brought forth much fruit. The *draw all men unto me* of John 12:32 is the *every knee shall bow* and *every tongue shall confess* of Philippians 2:10-11 named as its result: the lifted-up Son of Adam draws every tongue to the confession that he is Yahuah (Lord), to the glory of the Father who sent him and brought him through.',
  sv.verse_id, ev.verse_id, 'free'::content_tier, 4166
  FROM _s216_j09_12_lookup sv, _s216_j09_12_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 12 AND sv.verse_number = 23
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 12 AND ev.verse_number = 32
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- thread_members INSERT
-- =====================================================================

-- Thread 1: john-9-the-blinding-of-the-seeing-and-the-light-that-shines-in-2-corinthians-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
  E'2 Corinthians 4:4 — *In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them.* The blindness of those who claim to see (John 9:39) is the blinding by the god of this world against the light of the image of Elohim (God).'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-9-the-blinding-of-the-seeing-and-the-light-that-shines-in-2-corinthians-4'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 9 AND sv.verse_number = 39
   AND tv.edition_slug = 'canon' AND tv.book_slug = '2-corinthians'
   AND tv.chapter_number = 4 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
  E'2 Corinthians 4:6 — *Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* The positive movement: the opened eyes receive the light of the knowledge of the glory of Elohim (God) in the face of the Formed one — the same light of the world of John 9:5 named in its full weight.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-9-the-blinding-of-the-seeing-and-the-light-that-shines-in-2-corinthians-4'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 9 AND sv.verse_number = 39
   AND tv.edition_slug = 'canon' AND tv.book_slug = '2-corinthians'
   AND tv.chapter_number = 4 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-10-the-good-shepherd-lays-down-his-life-and-the-great-shepherd-in-hebrews-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
  E'Hebrews 13:20 (from John 10:11) — *Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant.* The good shepherd who gives his life (John 10:11) is brought again from the dead by the Elohim (God) of peace through the blood of the everlasting covenant — the laying-down and the taking-again of John 10:17-18 completed.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-10-the-good-shepherd-lays-down-his-life-and-the-great-shepherd-in-hebrews-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 10 AND sv.verse_number = 11
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'hebrews'
   AND tv.chapter_number = 13 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
  E'Hebrews 13:20 (from John 10:15) — *brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant.* John 10:15''s *I lay down my life for the sheep* is the act; Hebrews 13:20 names the Father''s answer to it — the great shepherd brought again through the blood that sealed the everlasting covenant.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-10-the-good-shepherd-lays-down-his-life-and-the-great-shepherd-in-hebrews-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 10 AND sv.verse_number = 15
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'hebrews'
   AND tv.chapter_number = 13 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: john-10-other-sheep-not-of-this-fold-and-the-lost-sheep-of-the-house-of-yasharel-in-matthew-and-1-peter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
  E'Matthew 15:24 — *I am not sent but unto the lost sheep of the house of Yashar''el (Israel).* The other sheep not of this fold (John 10:16) are the lost sheep of the house of Yashar''el (Israel) — the scattered northern house, not outside-covenant peoples being added. Yahusha''s (Jesus'') own declaration of his commission names who the other sheep are.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-10-other-sheep-not-of-this-fold-and-the-lost-sheep-of-the-house-of-yasharel-in-matthew-and-1-peter'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'matthew'
   AND tv.chapter_number = 15 AND tv.verse_number = 24
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
  E'Matthew 18:12 — *if a man have an hundred sheep, and one of them be gone astray, doth he not leave the ninety and nine, and goeth into the mountains, and seeketh that which is gone astray?* The other sheep brought back (John 10:16) are the gone-astray sheep sought in the mountains — Matthew 18:11 anchors it: *the Son of Adam is come to save that which was lost.*'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-10-other-sheep-not-of-this-fold-and-the-lost-sheep-of-the-house-of-yasharel-in-matthew-and-1-peter'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'matthew'
   AND tv.chapter_number = 18 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3,
  E'1 Peter 2:25 — *For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls.* Peter writes to the scattered (1 Peter 1:1) — the sheep who were going astray have heard the voice (John 10:27) and returned to the Shepherd of their souls. The other sheep brought back into one fold (John 10:16) have arrived.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-10-other-sheep-not-of-this-fold-and-the-lost-sheep-of-the-house-of-yasharel-in-matthew-and-1-peter'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 10 AND sv.verse_number = 27
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-peter'
   AND tv.chapter_number = 2 AND tv.verse_number = 25
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: john-10-i-and-my-father-are-one-the-formed-one-christology-in-colossians-2-and-1-corinthians-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
  E'Colossians 2:9 — *For in him dwelleth all the fulness of the Godhead bodily.* The oneness of John 10:30 (*I and my Father are one*) is the fulness of the Godhead dwelling bodily in the Formed one — all the fulness, not a representation. The Formless source expressed completely in the Formed, who stood before the Yahudim (Jews) as a man and made himself Elohim (God) rightly.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-10-i-and-my-father-are-one-the-formed-one-christology-in-colossians-2-and-1-corinthians-12'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 10 AND sv.verse_number = 30
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'colossians'
   AND tv.chapter_number = 2 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
  E'1 Corinthians 12:3 — *no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit).* The Spirit-given confession names the same identification John 10:30 makes from the Formed one''s own mouth — that Yahusha (Jesus) is Yahuah (Lord), the Formed one in whom the Formless dwells fully. What the Yahudim (Jews) heard as blasphemy (John 10:33) the Ruach HaKodesh (Holy Spirit) reveals as the truth.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-10-i-and-my-father-are-one-the-formed-one-christology-in-colossians-2-and-1-corinthians-12'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 10 AND sv.verse_number = 30
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians'
   AND tv.chapter_number = 12 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: john-11-i-am-the-resurrection-and-the-life-and-the-resurrection-in-1-corinthians-15-and-1-thessalonians-4-and-revelation-20
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
  E'1 Corinthians 15:20 — *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* The Formed one who said *I am the resurrection* (John 11:25) rose as the firstfruits — the first raised, whose rising guarantees the rising of all who belong to him. The sign at Lazarus''s tomb is the firstfruits demonstrating the power it claims.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-11-i-am-the-resurrection-and-the-life-and-the-resurrection-in-1-corinthians-15-and-1-thessalonians-4-and-revelation-20'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 11 AND sv.verse_number = 25
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians'
   AND tv.chapter_number = 15 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
  E'1 Corinthians 15:23 — *Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The order of *I am the resurrection* (John 11:25): the firstfruits first, then those who are his at his coming. Martha''s *at the last day* (John 11:24) is ordered around him — the last day is the coming of the firstfruits to raise the rest.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-11-i-am-the-resurrection-and-the-life-and-the-resurrection-in-1-corinthians-15-and-1-thessalonians-4-and-revelation-20'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 11 AND sv.verse_number = 25
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians'
   AND tv.chapter_number = 15 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3,
  E'1 Thessalonians 4:16 — *Yahuah (Lord) himself shall descend from heaven with a shout ... and the dead in Messiah (Christ) shall rise first.* The voice that called *Lazarus, come forth* (John 11:43) is the voice that descends with a shout at the trump of Elohim (God). *I am the resurrection* (John 11:25) names the agent; 1 Thessalonians 4:16 names the event of the full harvest.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-11-i-am-the-resurrection-and-the-life-and-the-resurrection-in-1-corinthians-15-and-1-thessalonians-4-and-revelation-20'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 11 AND sv.verse_number = 25
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-thessalonians'
   AND tv.chapter_number = 4 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4,
  E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ).* *Shall never die* (John 11:26) is the *second death hath no power* made precise: the first resurrection participants are set in the priestly office and exempted from the second death forever.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-11-i-am-the-resurrection-and-the-life-and-the-resurrection-in-1-corinthians-15-and-1-thessalonians-4-and-revelation-20'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 11 AND sv.verse_number = 25
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'revelation'
   AND tv.chapter_number = 20 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: john-11-caiaphas-gather-the-scattered-children-and-the-ingathering-in-ephesians-1-and-matthew-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
  E'Ephesians 1:10 — *That in the dispensation of the fulness of times he might gather together in one all things in Messiah (Christ), both which are in heaven, and which are on earth; even in him.* The *gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52) is the *gather together in one* of Ephesians 1:10 — the same event named as the purpose at the centre of the ages.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-11-caiaphas-gather-the-scattered-children-and-the-ingathering-in-ephesians-1-and-matthew-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'ephesians'
   AND tv.chapter_number = 1 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
  E'Matthew 24:31 — *he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The *scattered abroad* of John 11:52 are the *four winds* — the twelve-tribe remnant at every corner of the earth, gathered at the great trumpet by the angels sent out at the Son of Adam''s coming.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-11-caiaphas-gather-the-scattered-children-and-the-ingathering-in-ephesians-1-and-matthew-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'matthew'
   AND tv.chapter_number = 24 AND tv.verse_number = 31
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: john-12-the-grain-of-wheat-must-die-and-the-son-of-adam-glorified-in-1-corinthians-15-and-philippians-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1,
  E'1 Corinthians 15:36 — *that which thou sowest is not quickened, except it die.* Paul deploys the exact seed-principle of John 12:24 (*except a corn of wheat fall into the ground and die, it abideth alone*) as the architecture for the resurrection argument: the grain must die to be quickened. The Formed one''s own teaching is the foundation Paul builds on.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-12-the-grain-of-wheat-must-die-and-the-son-of-adam-glorified-in-1-corinthians-15-and-philippians-2'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 12 AND sv.verse_number = 24
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians'
   AND tv.chapter_number = 15 AND tv.verse_number = 36
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
  E'1 Corinthians 15:38 — *Elohim (God) giveth it a body as it hath pleased him, and to every seed his own body.* The grain dies (John 12:24) and the Father gives it the body that pleases him. The one grain became *much fruit* — the Father who gave the Formed one his resurrection body gives every seed its own body in the order and the harvest the Son of Adam opened.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-12-the-grain-of-wheat-must-die-and-the-son-of-adam-glorified-in-1-corinthians-15-and-philippians-2'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 12 AND sv.verse_number = 24
   AND tv.edition_slug = 'canon' AND tv.book_slug = '1-corinthians'
   AND tv.chapter_number = 15 AND tv.verse_number = 38
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3,
  E'Philippians 2:9 — *Elohim (God) also hath highly exalted him, and given him a name which is above every name.* *I, if I be lifted up from the earth* (John 12:32) — the lifting up is the cross and the exaltation in one motion. Philippians 2:9 names the Father''s answer to the humbling-unto-death: highly exalted, name above every name, the exaltation side of the one-grain-that-fell.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-12-the-grain-of-wheat-must-die-and-the-son-of-adam-glorified-in-1-corinthians-15-and-philippians-2'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 12 AND sv.verse_number = 32
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'philippians'
   AND tv.chapter_number = 2 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4,
  E'Philippians 2:11 — *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The *draw all men unto me* of John 12:32 is the *every tongue* of Philippians 2:11 named as its result: the lifted-up Son of Adam draws every tongue to the Spirit-given confession that he is Yahuah (Lord), to the glory of the Father who sent him and brought him through.'
  FROM cross_reference_threads t, cross_references x,
       _s216_j09_12_lookup sv, _s216_j09_12_lookup tv
 WHERE t.slug = 'john-12-the-grain-of-wheat-must-die-and-the-son-of-adam-glorified-in-1-corinthians-15-and-philippians-2'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john'
   AND sv.chapter_number = 12 AND sv.verse_number = 32
   AND tv.edition_slug = 'canon' AND tv.book_slug = 'philippians'
   AND tv.chapter_number = 2 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===================== fragment: minion_john_13_17.sql =====================
-- =====================================================================
-- S216 minion — John 13–17 NT-to-NT cross-references
-- =====================================================================
-- Range:  JOHN 13, 14, 15, 16, 17 (the footwashing / new commandment /
--         love one another; I AM the way, the truth, and the life / he
--         that hath seen me hath seen the Father / the Comforter, the
--         Spirit of truth / I will not leave you comfortless; the true
--         vine / abide in me / the world''s hatred; the Spirit of truth
--         who reproves and guides / sorrow turned to joy / I have
--         overcome the world; the high-priestly prayer / that they all
--         may be one / glorify thy Son / the glory before the world was /
--         keep them from the evil one)
-- Tag:    j13_17   (temp view _s216_j13_17_lookup)
-- Sort band: 4230-4309
--
-- Six threads:
--   1. john-13-15-new-commandment-love-one-another-and-love-as-the-doing-of-torah-in-1-john-and-romans-13
--        (sort 4230)  — targets: 1-john 3:11-16,4:7-11, 2-john 1:5-6, romans 13:8-10
--   2. john-14-9-he-that-hath-seen-me-hath-seen-the-father-and-the-formed-who-images-the-formless-in-colossians-hebrews-2-corinthians
--        (sort 4240)  — targets: colossians 1:15, hebrews 1:3, 2-corinthians 4:4,6
--   3. john-14-16-15-26-16-7-the-comforter-spirit-of-truth-in-acts-2-romans-8-1-john-4-and-5
--        (sort 4250)  — targets: acts 2:33, romans 8:9-14,26-27, 1-john 4:6, 1-john 5:6
--   4. john-15-1-6-the-true-vine-abide-and-the-olive-root-of-yasharel-in-1-john-2-and-romans-11
--        (sort 4260)  — targets: 1-john 2:24-28, romans 11:17-18,23-24,26
--   5. john-17-11-21-that-they-all-may-be-one-in-ephesians-4-and-1-corinthians-12
--        (sort 4270)  — targets: ephesians 4:3-6, 1-corinthians 12:12-13
--   6. john-17-5-24-the-glory-before-the-world-was-in-philippians-2-colossians-1-and-revelation-5
--        (sort 4280)  — targets: philippians 2:5-11, colossians 1:15-17, revelation 5:12-13
--
-- 24 cross_reference rows, 24 thread_member rows, all tier='free'.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- No BEGIN/COMMIT — orchestrator wraps the transaction.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the j13_17 tag).
CREATE TEMP VIEW _s216_j13_17_lookup AS
SELECT
    e.slug  AS edition_slug,
    b.slug  AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id    AS verse_id
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
       'ascension-isaiah',
       'sonnini-acts-29'
   );

-- =====================================================================
-- Thread 1: john-13-15-new-commandment-love-one-another-and-love-as-the-doing-of-torah-in-1-john-and-romans-13
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-13-15-new-commandment-love-one-another-and-love-as-the-doing-of-torah-in-1-john-and-romans-13',
  'The New Commandment — Love One Another — and Love as the Doing of Torah',
  E'*A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.* (John 13:34)\n\nThe word *new* has been used to pitch this commandment against everything that came before it — as if Yahusha (Jesus) arrived to replace the Sinai commandments with one principle that cancels the rest. That reading is not what the text says, and 1 John names it explicitly as a deception: the commandment is old. *Brethren, I write no new commandment unto you, but an old commandment which ye had from the beginning. The old commandment is the word which ye have heard from the beginning.* (1 John 2:7) The *new* is its living embodiment in the Formed one who laid down his life for his friends — and its inscription now in the hearts of those who abide in him. What is new is not the content of the command; what is new is the measure: *as I have loved you.*\n\n*For this is the message that ye heard from the beginning, that we should love one another.* (1 John 3:11)\n\n*Hereby perceive we the love of Elohim (God), because he laid down his life for us: and we ought to lay down our lives for the brethren.* (1 John 3:16)\n\nThe same love-one-another commandment is walked out in 1 John through the test of 1 John 2:3–4 — *hereby we do know that we know him, if we keep his commandments* — and in Romans 13:8–10 it is set explicitly inside Torah, not over against it: *Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law ... Love worketh no ill to his neighbour: therefore love is the fulfilling of the law.* (Romans 13:8,10) Love does not replace the commandments; love is the full doing of them — the heart given by the Ruach HaKodesh (Holy Spirit) moving the member toward the neighbor in the pattern the Torah already named. The commandment to love one another is at once old (from the beginning, from Sinai, from the Shema) and made new (measured now by the Lamb who laid down his life), and it is walked out as the keeping, not the abolishing, of what the Torah commanded.\n\n*And now I beseech thee, lady, not as though I wrote a new commandment unto thee, but that which we had from the beginning, that we love one another. And this is love, that we walk after his commandments.* (2 John 5–6)',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=13 AND verse_number=34),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=15 AND verse_number=17),
  'free'::content_tier,
  4230
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- 1 John 3:11
  ('canon', 'john', 13, 34,
   'canon', '1-john', 3, 11,
   E'*For this is the message that ye heard from the beginning, that we should love one another.* (1 John 3:11) The apostle names the love-one-another command as a message *from the beginning* — directly answering any reading that hears *new commandment* in John 13:34 as a replacement for what came before. The command is not new in substance; it is old, and 1 John grounds it in the same source: the word heard from the beginning.'),
  -- 1 John 3:16
  ('canon', 'john', 13, 34,
   'canon', '1-john', 3, 16,
   E'*Hereby perceive we the love of Elohim (God), because he laid down his life for us: and we ought to lay down our lives for the brethren.* (1 John 3:16) Yahusha''s (Jesus''s) own self-giving is named here as the measure of love among the brethren — the same *as I have loved you* of John 13:34. The standard is not a principle; it is the Lamb''s own act, and the apostle says we ought to walk it out in kind.'),
  -- 1 John 4:7-8
  ('canon', 'john', 15, 12,
   'canon', '1-john', 4, 7,
   E'*Beloved, let us love one another: for love is of Elohim (God); and every one that loveth is born of Elohim (God), and knoweth Elohim (God). He that loveth not knoweth not Elohim (God); for Elohim (God) is love.* (1 John 4:7–8) The love-one-another of John 15:12 — *This is my commandment, That ye love one another, as I have loved you* — is here grounded in the nature of the Most High himself. Love is not a replacement for the covenant; it is the outflow of the nature of the One who gave the covenant. Every one that loveth is born of him; every one that loveth not has not known him — which is the 1 John 2:3–4 test applied.'),
  -- 1 John 4:11
  ('canon', 'john', 15, 12,
   'canon', '1-john', 4, 11,
   E'*Beloved, if Elohim (God) so loved us, we ought also to love one another.* (1 John 4:11) The ought-language echoes John 15:12''s commandment form exactly: the Father''s love in sending the Son is the ground, and the responsive love-one-another is the walking out of that ground among the brethren. The indicative (he loved us) produces the imperative (we ought also to love).'),
  -- 2 John 1:5-6
  ('canon', 'john', 13, 34,
   'canon', '2-john', 1, 5,
   E'*And now I beseech thee, lady, not as though I wrote a new commandment unto thee, but that which we had from the beginning, that we love one another. And this is love, that we walk after his commandments.* (2 John 5–6) This is the most direct NT commentary on John 13:34''s *new commandment*: the commandment is not new, it is the one from the beginning, and its walking-out is the keeping of his commandments. Love is defined here as walking in the commandments — not as their replacement. The sentence cannot be read to mean love dissolved the Torah.'),
  -- Romans 13:8
  ('canon', 'john', 13, 34,
   'canon', 'romans', 13, 8,
   E'*Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law.* (Romans 13:8) Paul names love-one-another as the fulfilling — the full doing — of the Torah, not its cancellation. The Torah commandments of vv.9 (*Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet*) are not swept away by love; they are *briefly comprehended in this saying,* walked out through it. Love is the heart moving toward the neighbor in the fullness of what Torah already required. John 13:34''s *love one another as I have loved you* is the same motion named from the Father''s side.'),
  -- Romans 13:10
  ('canon', 'john', 15, 17,
   'canon', 'romans', 13, 10,
   E'*Love worketh no ill to his neighbour: therefore love is the fulfilling of the law.* (Romans 13:10) The last verse of the Pauline love-as-Torah passage answers permanently the reading that pits John 15:17''s *These things I command you, that ye love one another* against the commandments. Love does not work ill to the neighbor; the Torah''s commandments name in detail what working ill looks like and prohibit it. Love fulfills the Torah because the Torah has always been the instruction in how to love. The two are not in tension; love is the heart of Torah done rightly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 3 AND tv.verse_number = 11
        THEN E'1 John 3:11 — *the message ... from the beginning, that we should love one another* — names the love command as ancient, not novel, answering the misreading of John 13:34.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 3 AND tv.verse_number = 16
        THEN E'1 John 3:16 — *because he laid down his life for us* — names Yahusha''s (Jesus''s) own act as the measure of love among the brethren, grounding the *as I have loved you* of John 13:34 in his sacrifice.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 4 AND tv.verse_number = 7
        THEN E'1 John 4:7–8 — *love is of Elohim (God)* — grounds the love-one-another commandment of John 15:12 in the nature of the Most High himself, and applies the knowing-him test.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 4 AND tv.verse_number = 11
        THEN E'1 John 4:11 — *if Elohim (God) so loved us, we ought also to love one another* — echoes the ought-form of John 15:12''s commandment, grounding the imperative in the indicative of the Father''s love.'
      WHEN tv.book_slug = '2-john'
        THEN E'2 John 5–6 — *not a new commandment ... but that which we had from the beginning ... this is love, that we walk after his commandments* — the most direct NT commentary on John 13:34: love is the walking of the commandments, not their replacement.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 8
        THEN E'Romans 13:8 — *he that loveth another hath fulfilled the law* — Paul names love as the full doing of the Torah, precisely as John 13:34 gives the love-one-another as the new measure of the old command.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 10
        THEN E'Romans 13:10 — *love is the fulfilling of the law* — closes the Pauline passage and confirms that John 15:17''s commandment to love one another is Torah fulfilled, not Torah dissolved.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id IN (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number IN (13,15) AND verse_number IN (34,12,17)
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-13-15-new-commandment-love-one-another-and-love-as-the-doing-of-torah-in-1-john-and-romans-13'
   AND tv.book_slug IN ('1-john','2-john','romans')
   AND tv.chapter_number IN (3,4,1,13)
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 2: john-14-9-he-that-hath-seen-me-hath-seen-the-father-and-the-formed-who-images-the-formless-in-colossians-hebrews-2-corinthians
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-14-9-he-that-hath-seen-me-hath-seen-the-father-and-the-formed-who-images-the-formless-in-colossians-hebrews-2-corinthians',
  'He That Hath Seen Me Hath Seen the Father — The Formed Who Images the Formless',
  E'*Yahusha (Jesus) saith unto him, Have I been so long time with you, and yet hast thou not known me, Philip? he that hath seen me hath seen the Father; and how sayest thou then, Shew us the Father?* (John 14:9)\n\nPhilip asks for a separate sighting of the Father, as if the Father were a second figure behind or beyond the one speaking. Yahusha''s (Jesus''s) answer refuses the separation: to see him is to see the Father, because he is the Formed expression of the Formless source. The Father remains unseen — *No man hath seen Elohim (God) at any time* (1 John 4:12) — not because the Father is absent, but because the Formless does not appear. The Formed is what appears. The Formed is *the image of the invisible Elohim (God)* (Colossians 1:15) and *the brightness of his glory, and the express image of his person* (Hebrews 1:3). These three NT confessions say the same thing from three angles: when the Formed one is seen in flesh, the Formless source is seen in the only form in which the Formless source can be seen.\n\n*Who is the image of the invisible Elohim (God), the firstborn of every creature.* (Colossians 1:15)\n\n*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power.* (Hebrews 1:3)\n\n*In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them ... to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* (2 Corinthians 4:4,6)\n\nThe Formed is the image of the Formless. The Formless does not appear; the Formed does. When the Formed took on flesh, the face of Yahusha HaMashiach (Jesus Christ) became the place where the light of the knowledge of the glory of Elohim (God) shines. Philip''s request — *shew us the Father* — is answered by the forty chapters of visible, touchable, audible ministry that preceded the Upper Room discourse: every healing, every word, every act of the Formed one is the Formless one acting through the image he drew from himself before the world was.',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=14 AND verse_number=9),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=14 AND verse_number=9),
  'free'::content_tier,
  4240
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Colossians 1:15
  ('canon', 'john', 14, 9,
   'canon', 'colossians', 1, 15,
   E'*Who is the image of the invisible Elohim (God), the firstborn of every creature.* (Colossians 1:15) The Formed one named as *the image of the invisible Elohim (God)* — the one who can be seen as the visible expression of the one who cannot be seen. John 14:9''s *he that hath seen me hath seen the Father* is this same architecture: seeing the Formed is seeing the Formless in the only form in which the Formless appears. The invisible Elohim (God) is not absent; he is present through his image.'),
  -- Hebrews 1:3
  ('canon', 'john', 14, 9,
   'canon', 'hebrews', 1, 3,
   E'*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power.* (Hebrews 1:3) The Formed one as the *brightness* of the Father''s glory and the *express image* of his person — not a copy made later, but the radiance that proceeds from the source. John 14:9''s claim rests on this relation: the son is the express image of the Father''s person, so seeing the Son is seeing the Father expressed. The brightness is not the sun; but where the brightness shines, the sun''s own light is what shines.'),
  -- 2 Corinthians 4:4
  ('canon', 'john', 14, 9,
   'canon', '2-corinthians', 4, 4,
   E'*In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them.* (2 Corinthians 4:4) The adversary''s strategy is specifically to blind the mind to the light that shines in the face of the Messiah (Christ) — because that face is *the image of Elohim (God).* Seeing that face is seeing the Father. The blinding targets exactly what John 14:9 names: the recognition that the one standing before Philip is the Father''s image, and therefore the Father''s presence in visible form.'),
  -- 2 Corinthians 4:6
  ('canon', 'john', 14, 9,
   'canon', '2-corinthians', 4, 6,
   E'*For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* (2 Corinthians 4:6) The glory of Elohim (God) — the Father''s own glory — is known in the face of Yahusha HaMashiach (Jesus Christ). This is the same naming John 14:9 carries: the Father is not shown by a separate vision but by the face of the Son. The Creator who said *Let there be light* is the same one who shines the knowledge of his glory into hearts through that face.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = 'colossians'
        THEN E'Colossians 1:15 — *the image of the invisible Elohim (God)* — the Formed one as the visible expression of the Formless, the same architecture John 14:9 names: to see the Son is to see the Father expressed.'
      WHEN tv.book_slug = 'hebrews'
        THEN E'Hebrews 1:3 — *the brightness of his glory, the express image of his person* — the Formed proceeds from and images the Formless; seeing the brightness is seeing the light that radiates it, confirming John 14:9.'
      WHEN tv.book_slug = '2-corinthians' AND tv.verse_number = 4
        THEN E'2 Corinthians 4:4 — *Messiah (Christ), who is the image of Elohim (God)* — the adversary blinds minds precisely to this identification, because recognizing the Messiah''s face as the Father''s image is the whole claim of John 14:9.'
      WHEN tv.book_slug = '2-corinthians' AND tv.verse_number = 6
        THEN E'2 Corinthians 4:6 — *the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* — the Father''s glory known in the Son''s face, the most direct Pauline echo of John 14:9''s *he that hath seen me hath seen the Father.*'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id = (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number=14 AND verse_number=9
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-14-9-he-that-hath-seen-me-hath-seen-the-father-and-the-formed-who-images-the-formless-in-colossians-hebrews-2-corinthians'
   AND tv.book_slug IN ('colossians','hebrews','2-corinthians')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 3: john-14-16-15-26-16-7-the-comforter-spirit-of-truth-in-acts-2-romans-8-1-john-4-and-5
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-14-16-15-26-16-7-the-comforter-spirit-of-truth-in-acts-2-romans-8-1-john-4-and-5',
  'The Comforter, the Spirit of Truth — His Coming, His Witness, His Intercession',
  E'*And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever; Even the Spirit of truth; whom the world cannot receive, because it seeth him not, neither knoweth him: but ye know him; for he dwelleth with you, and shall be in you.* (John 14:16–17)\n\nThe promise of the Comforter — the Ruach HaKodesh (Holy Spirit) — is threaded across John 14, 15, and 16. He is called the Spirit of truth, sent from the Father in Yahusha''s (Jesus''s) name, proceeding from the Father, testifying of the Son, guiding into all truth. The rest of the NT names three specific dimensions of that promise kept:\n\nHis *coming*: Acts 2:33 shows the Father''s promise of the Ruach HaKodesh (Holy Spirit) poured out by the exalted Son — *Therefore being by the right hand of Elohim (God) exalted, and having received of the Father the promise of the Ruach HaKodesh (Holy Spirit), he hath shed forth this, which ye now see and hear.* The pouring-out is the kept word of John 14:16–17.\n\nHis *indwelling and leading*: Romans 8:9–14 names the Spirit of Elohim (God) dwelling in the members, the Spirit of Messiah (Christ), the Spirit who leads the sons of Elohim (God) — exactly what John 14:17 promises: *he dwelleth with you, and shall be in you.* And Romans 8:26–27 names the intercession the Comforter carries: *the Spirit itself maketh intercession for us with groanings which cannot be uttered* — the *another Comforter* of John 14:16, doing now inside the members what he promised to do.\n\nHis *witness and test*: *Hereby know we the spirit of truth, and the spirit of error* (1 John 4:6) — the discernment framework John 16:13 promised (*he will guide you into all truth*) is walking in the community. And *it is the Spirit that beareth witness, because the Spirit is truth* (1 John 5:6) — the Spirit''s testimony is the kept word of John 15:26: *he shall testify of me.*\n\n*But when the Comforter is come, whom I will send unto you from the Father, even the Spirit of truth, which proceedeth from the Father, he shall testify of me.* (John 15:26)',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=14 AND verse_number=16),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=16 AND verse_number=13),
  'free'::content_tier,
  4250
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Acts 2:33
  ('canon', 'john', 14, 16,
   'canon', 'acts', 2, 33,
   E'*Therefore being by the right hand of Elohim (God) exalted, and having received of the Father the promise of the Ruach HaKodesh (Holy Spirit), he hath shed forth this, which ye now see and hear.* (Acts 2:33) Peter at Pentecost names the pouring-out of the Ruach HaKodesh (Holy Spirit) as the kept word of John 14:16''s promise: the exalted Son received the Father''s promise of the Spirit and shed it forth. The *another Comforter* given by the Father at Yahusha''s (Jesus''s) prayer is now shed out from the right hand of the throne.'),
  -- Romans 8:9
  ('canon', 'john', 14, 17,
   'canon', 'romans', 8, 9,
   E'*But ye are not in the flesh, but in the Spirit, if so be that the Spirit of Elohim (God) dwell in you. Now if any man have not the Spirit of Messiah (Christ), he is none of his.* (Romans 8:9) The Spirit of Elohim (God) dwelling in the member is the kept word of John 14:17''s *he dwelleth with you, and shall be in you.* Paul names the same indwelling as the definition of belonging to the Messiah (Christ).'),
  -- Romans 8:14
  ('canon', 'john', 16, 13,
   'canon', 'romans', 8, 14,
   E'*For as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God).* (Romans 8:14) John 16:13 promised the Spirit of truth would guide into all truth — Romans 8:14 names that guidance as the identifying mark of the sons of Elohim (God): to be led by the Spirit is to be his. The two verses name the same motion from different angles.'),
  -- Romans 8:26
  ('canon', 'john', 14, 16,
   'canon', 'romans', 8, 26,
   E'*Likewise the Spirit also helpeth our infirmities: for we know not what we should pray for as we ought: but the Spirit itself maketh intercession for us with groanings which cannot be uttered.* (Romans 8:26) The *another Comforter* of John 14:16 — one who stands alongside, aids, intercedes — is at work here: where the member cannot form the prayer, the Spirit carries it. The Comforter''s name is his function, and Romans 8:26 shows it kept.'),
  -- 1 John 4:6
  ('canon', 'john', 16, 13,
   'canon', '1-john', 4, 6,
   E'*We are of Elohim (God): he that knoweth Elohim (God) heareth us; he that is not of Elohim (God) heareth not us. Hereby know we the spirit of truth, and the spirit of error.* (1 John 4:6) The Spirit of truth who guides into all truth (John 16:13) gives the community the discernment frame 1 John 4:6 names: the spirit of truth and the spirit of error are distinguished by whether they hear the apostolic word. Guiding into all truth is also the guard against every spirit that does not confess the Messiah (Christ) come in the flesh.'),
  -- 1 John 5:6
  ('canon', 'john', 15, 26,
   'canon', '1-john', 5, 6,
   E'*This is he that came by water and blood, even Yahusha HaMashiach (Jesus Christ); not by water only, but by water and blood. And it is the Spirit that beareth witness, because the Spirit is truth.* (1 John 5:6) John 15:26 promised the Comforter *shall testify of me.* Here the apostle names that kept testimony: the Spirit bears witness to the Son — not by water only, but by water and blood — because the Spirit is truth. The Comforter''s testifying is walking.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = 'acts'
        THEN E'Acts 2:33 — the exalted Son *shed forth* the Father''s promised Ruach HaKodesh (Holy Spirit) at Pentecost — the kept word of John 14:16''s *another Comforter.*'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 9
        THEN E'Romans 8:9 — *the Spirit of Elohim (God) dwell in you* — the indwelling kept word of John 14:17''s *he shall be in you.*'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 14
        THEN E'Romans 8:14 — *as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God)* — the guiding-into-all-truth of John 16:13 named as the sons'' defining mark.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 26
        THEN E'Romans 8:26 — *the Spirit itself maketh intercession for us* — the Comforter''s alongside-helping of John 14:16 walking in the member who cannot form the prayer.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 4
        THEN E'1 John 4:6 — *hereby know we the spirit of truth, and the spirit of error* — the discernment fruit of the Spirit who guides into all truth, promised at John 16:13.'
      WHEN tv.book_slug = '1-john' AND tv.chapter_number = 5
        THEN E'1 John 5:6 — *the Spirit that beareth witness, because the Spirit is truth* — the Comforter''s testimony of John 15:26 walking in the apostolic community.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id IN (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number IN (14,15,16) AND verse_number IN (16,17,26,13)
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-14-16-15-26-16-7-the-comforter-spirit-of-truth-in-acts-2-romans-8-1-john-4-and-5'
   AND tv.book_slug IN ('acts','romans','1-john')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 4: john-15-1-6-the-true-vine-abide-and-the-olive-root-of-yasharel-in-1-john-2-and-romans-11
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-15-1-6-the-true-vine-abide-and-the-olive-root-of-yasharel-in-1-john-2-and-romans-11',
  'The True Vine, the Abiding, and the Olive Root of Yashar''el — the Journey Home',
  E'*I am the true vine, and my Father is the husbandman ... Abide in me, and I in you.* (John 15:1,4)\n\nThe vine-and-branches discourse of John 15 is the abiding discourse: the branch that does not abide is cast out; the branch that abides bears much fruit; the condition for fruit is remaining in the vine. 1 John 2:24–28 walks this promise out in the community register: *Let that therefore abide in you, which ye have heard from the beginning. If that which ye have heard from the beginning shall remain in you, ye also shall continue in the Son, and in the Father* (1 John 2:24). Abiding is not a moment of decision sealed forever; it is the ongoing remaining in the word heard from the beginning — the Torah, the covenant instruction, the testimony of the Son.\n\n*And now, little children, abide in him; that, when he shall appear, we may have confidence, and not be ashamed before him at his coming.* (1 John 2:28)\n\nRomans 11:17–24 carries the same architecture in the olive-tree register. The olive tree is Yashar''el (Israel)''s covenant root, planted in Avraham (Abraham), Yitschaq (Isaac), and Ya''aqov (Jacob). Branches were broken off through unbelief; wild olive branches — the scattered seed of the covenant, grown wild through centuries of exile among the nations — are described as graffed among them and partaking of the root and fatness of the tree. This is not the grafting-in of outsiders from unrelated peoples by faith-confession; this is the re-joining of the covenant''s own scattered seed to the root their forefathers stood on. The warning runs in the same direction as John 15:6: *Be not highminded, but fear: For if Elohim (God) spared not the natural branches, take heed lest he also spare not thee* (Romans 11:20–21). And the hope runs in the same direction as John 15:4''s *abide in me*: *And they also, if they abide not still in unbelief, shall be graffed in: for Elohim (God) is able to graff them in again* (Romans 11:23). The abiding and the grafting travel together — both are the journey of the covenant''s own scattered seed coming home to the root they belong to.\n\n*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob.* (Romans 11:26)',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=15 AND verse_number=1),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=15 AND verse_number=6),
  'free'::content_tier,
  4260
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- 1 John 2:24
  ('canon', 'john', 15, 4,
   'canon', '1-john', 2, 24,
   E'*Let that therefore abide in you, which ye have heard from the beginning. If that which ye have heard from the beginning shall remain in you, ye also shall continue in the Son, and in the Father.* (1 John 2:24) The abiding of John 15:4 — *Abide in me, and I in you* — is here named as the remaining of the word heard from the beginning. To abide in the vine is to let the covenant word remain; continuance in the Son and the Father follows from that remaining. The abiding is not abstract; it is the word abiding.'),
  -- 1 John 2:28
  ('canon', 'john', 15, 4,
   'canon', '1-john', 2, 28,
   E'*And now, little children, abide in him; that, when he shall appear, we may have confidence, and not be ashamed before him at his coming.* (1 John 2:28) The apostle echoes John 15:4''s command in the same word — *abide* — and attaches to it the eschatological urgency: the branch that abides will stand before him at his coming unashamed; the branch that does not is the one cast forth of John 15:6. The abiding is the ongoing condition, not a past transaction.'),
  -- Romans 11:17
  ('canon', 'john', 15, 5,
   'canon', 'romans', 11, 17,
   E'*And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree.* (Romans 11:17) The wild olive partaking of the root and fatness of the olive tree is the abiding-in-the-vine of John 15:5 in the olive register. The olive tree is Yashar''el (Israel)''s covenant root. The wild olive branches are the scattered seed of that covenant, grown wild through exile. They are not outsiders by origin; they are covenant seed who lost their branch-connection and are being brought back to the root they belong to.'),
  -- Romans 11:18
  ('canon', 'john', 15, 5,
   'canon', 'romans', 11, 18,
   E'*Boast not against the branches. But if thou boast, thou bearest not the root, but the root thee.* (Romans 11:18) The wild olive branch that partakes of the root does not sustain the root — the root sustains the branch. This is the same order John 15:5 names: *without me ye can do nothing.* The branch abiding in the vine does nothing of itself; the vine''s life is what flows through it. The root of the olive is prior and sovereign; the branch comes home to what was already there.'),
  -- Romans 11:23
  ('canon', 'john', 15, 6,
   'canon', 'romans', 11, 23,
   E'*And they also, if they abide not still in unbelief, shall be graffed in: for Elohim (God) is able to graff them in again.* (Romans 11:23) The condition for grafting in again is the abiding of John 15:4–6 spoken in the negative: if they abide not still in unbelief. The broken-off branch and the cast-forth branch of John 15:6 are in the same posture — disconnected from the root through unbelief. The Father''s power to graff them in again is the same power Yahusha (Jesus) names: the husbandman who purges the branch that it may bring forth more fruit.'),
  -- Romans 11:26
  ('canon', 'john', 15, 1,
   'canon', 'romans', 11, 26,
   E'*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob.* (Romans 11:26) The true vine of John 15:1 — the Formed one who is the covenant''s living root — is the one *out of Sion* who turns away ungodliness from Jacob. The vine discourse ends with the covenant body bearing fruit; Romans 11 ends with all Yashar''el (Israel) saved through the same Deliverer. The two passages are one promise: the covenant seed abiding in the vine is the covenant seed being gathered home.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = '1-john' AND tv.verse_number = 24
        THEN E'1 John 2:24 — *let that abide in you which ye heard from the beginning* — names the abiding of John 15:4 as the remaining of the covenant word; continuance in Son and Father follows.'
      WHEN tv.book_slug = '1-john' AND tv.verse_number = 28
        THEN E'1 John 2:28 — *abide in him, that when he shall appear, we may have confidence* — the same abide-command in eschatological register: the branch that abides stands unashamed at his coming.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 17
        THEN E'Romans 11:17 — *graffed in among them, and partakest of the root and fatness* — the olive''s abiding-in-the-root is John 15:5''s vine-abiding in the covenant register: the scattered seed rejoining the root they belong to.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 18
        THEN E'Romans 11:18 — *thou bearest not the root, but the root thee* — the vine''s sovereignty named in the olive register: *without me ye can do nothing* (John 15:5).'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 23
        THEN E'Romans 11:23 — *if they abide not still in unbelief, shall be graffed in again* — the abiding condition of John 15:4–6 in the olive register: the disconnection from the root is unbelief, and the power to re-graft belongs to the husbandman.'
      WHEN tv.book_slug = 'romans' AND tv.verse_number = 26
        THEN E'Romans 11:26 — *all Yashar''el (Israel) shall be saved ... the Deliverer out of Sion* — the covenant completion that John 15:1''s true vine is the agent of: the vine and the Deliverer are the same.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id IN (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number=15 AND verse_number IN (1,4,5,6)
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-15-1-6-the-true-vine-abide-and-the-olive-root-of-yasharel-in-1-john-2-and-romans-11'
   AND tv.book_slug IN ('1-john','romans')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 5: john-17-11-21-that-they-all-may-be-one-in-ephesians-4-and-1-corinthians-12
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-17-11-21-that-they-all-may-be-one-in-ephesians-4-and-1-corinthians-12',
  'That They All May Be One — the Unity of the Body in Ephesians 4 and 1 Corinthians 12',
  E'*That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us.* (John 17:21)\n\nThe high-priestly prayer of John 17 asks three times for the oneness of those given to the Son: *that they may be one, as we are* (v.11); *that they all may be one; as thou, Father, art in me, and I in thee* (v.21); *that they may be made perfect in one* (v.23). The unity prayed for is modeled on the Formed-Formless relation — the deep oneness in which the Son is in the Father and the Father in the Son. It is not uniformity of practice or institutional merger; it is the unity of those who abide in the same vine, carry the same Spirit, share the same root.\n\nEphesians 4:3–6 names the keeping of that unity as a walking discipline: *Endeavouring to keep the unity of the Spirit in the bond of peace* — and then grounds it in the sevenfold oneness that is already the covenant community''s foundation: *There is one body, and one Spirit, even as ye are called in one hope of your calling; One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all, who is above all, and through all, and in you all.* (Ephesians 4:4–6) The one body, one Spirit, one Father is the same architecture John 17''s *as we are one* names: the community''s unity reflects and participates in the Formed-Formless oneness.\n\n*For as the body is one, and hath many members, and all the members of that one body, being many, are one body: so also is Messiah (Christ). For by one Spirit are we all baptized into one body, whether we be Yahudim (Jews) or Gentiles, whether we be bond or free; and have been all made to drink into one Spirit.* (1 Corinthians 12:12–13)\n\nPaul''s body-of-Messiah (Christ) passage in 1 Corinthians 12 maps the same one-body-many-members reality John 17:21 prays for: the many are made one by the one Spirit, in the one Messiah (Christ), for the one body''s building. The scattered sheep gathered into one fold (John 10:16) and made perfect in one (John 17:23) is the same gathering the body-of-Messiah (Christ) language names in the epistle register.',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=17 AND verse_number=11),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=17 AND verse_number=23),
  'free'::content_tier,
  4270
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Ephesians 4:3
  ('canon', 'john', 17, 21,
   'canon', 'ephesians', 4, 3,
   E'*Endeavouring to keep the unity of the Spirit in the bond of peace.* (Ephesians 4:3) The unity John 17:21 prays for — *that they all may be one* — is here named as something already given by the Spirit and to be *kept* through active endeavour. The unity is not created by agreement; it is created by the one Spirit and maintained by those who walk in it. The Father''s answer to John 17:21 is the Spirit''s bond; the community''s task is not to manufacture unity but to guard it.'),
  -- Ephesians 4:4-6
  ('canon', 'john', 17, 21,
   'canon', 'ephesians', 4, 4,
   E'*There is one body, and one Spirit, even as ye are called in one hope of your calling; One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all, who is above all, and through all, and in you all.* (Ephesians 4:4–6) The sevenfold *one* of Ephesians 4 is the ontological ground of the unity John 17:21 prays for. *As thou, Father, art in me, and I in thee, that they also may be one in us* — the Father above all and through all and in all is the same Father who is *in* the Formed one and in whom the Formed one is. The community''s unity participates in this already-real oneness.'),
  -- 1 Corinthians 12:12
  ('canon', 'john', 17, 21,
   'canon', '1-corinthians', 12, 12,
   E'*For as the body is one, and hath many members, and all the members of that one body, being many, are one body: so also is Messiah (Christ).* (1 Corinthians 12:12) The many-made-one of John 17:21 — *that they all may be one* — is here given its body-of-Messiah (Christ) form: many members, one body, *so also is Messiah (Christ).* The gathering of the scattered sheep into one fold and one shepherd (John 10:16) and the prayer that they be made perfect in one (John 17:23) are the prophetic and petitionary registers of what Paul names in the ecclesial register: this is what the body of Messiah (Christ) is.'),
  -- 1 Corinthians 12:13
  ('canon', 'john', 17, 21,
   'canon', '1-corinthians', 12, 13,
   E'*For by one Spirit are we all baptized into one body, whether we be Yahudim (Jews) or Gentiles, whether we be bond or free; and have been all made to drink into one Spirit.* (1 Corinthians 12:13) The one Spirit who is the agent of the one-body is the same Spirit by whom John 17:21''s *they may be one in us* is made real. The body is not one because its members agreed to be; it is one because one Spirit baptized them in and made them all drink of the one Spirit. The *Yahudim (Jews) or Gentiles* — in this context, both houses of the scattered covenant seed called out from among the nations — are made into one body by the one Spirit, precisely what the high-priestly prayer asked the Father for.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = 'ephesians' AND tv.verse_number = 3
        THEN E'Ephesians 4:3 — *endeavouring to keep the unity of the Spirit* — the unity John 17:21 prays for is given by the Spirit and guarded by the community; it is kept, not created.'
      WHEN tv.book_slug = 'ephesians' AND tv.verse_number = 4
        THEN E'Ephesians 4:4–6 — *one body, one Spirit ... one Elohim (God) and Father of all* — the sevenfold ontological ground of John 17:21''s *that they may be one in us.*'
      WHEN tv.book_slug = '1-corinthians' AND tv.verse_number = 12
        THEN E'1 Corinthians 12:12 — *so also is Messiah (Christ)* — the many-made-one of John 17:21 in the body-of-Messiah (Christ) register: many members, one body.'
      WHEN tv.book_slug = '1-corinthians' AND tv.verse_number = 13
        THEN E'1 Corinthians 12:13 — *by one Spirit are we all baptized into one body* — the Spirit as the agent of the John 17:21 oneness, making one body of Yahudim (Jews) and Gentiles — the scattered covenant seed gathered.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id = (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number=17 AND verse_number=21
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-17-11-21-that-they-all-may-be-one-in-ephesians-4-and-1-corinthians-12'
   AND tv.book_slug IN ('ephesians','1-corinthians')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- =====================================================================
-- Thread 6: john-17-5-24-the-glory-before-the-world-was-in-philippians-2-colossians-1-and-revelation-5
-- =====================================================================

INSERT INTO cross_reference_threads
    (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
VALUES (
  'john-17-5-24-the-glory-before-the-world-was-in-philippians-2-colossians-1-and-revelation-5',
  'The Glory Before the World Was — Philippians 2, Colossians 1, and Revelation 5',
  E'*And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* (John 17:5)\n\n*Father, I will that they also, whom thou hast given me, be with me where I am; that they may behold my glory, which thou hast given me: for thou lovedst me before the foundation of the world.* (John 17:24)\n\nThe high-priestly prayer reaches back past the incarnation to a glory the Son held with the Father before the world was, and a love the Father bore the Son before the foundation of the world. This is not a prayer for something new; it is the Formed one asking the Father to restore in glorified form what was his before flesh was taken on. The NT carries three answering witnesses.\n\nPhilippians 2:5–11 names the before-and-after of the incarnation: the Formed one was in the form of Elohim (God) before he took on the form of a servant and was found in fashion as a man — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God): But made himself of no reputation, and took upon him the form of a servant* (Philippians 2:6–7). The glory prayed for in John 17:5 is the *form of Elohim (God)* that was voluntarily laid aside at the incarnation. The exaltation that follows the cross — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9) — is the Father''s answer to John 17:5''s prayer.\n\nColossians 1:15–17 names the pre-incarnate position: the Formed one as the image of the invisible Elohim (God), the firstborn of every creature, the one in whom and by whom and for whom all things were created, who is before all things, and by whom all things consist. The glory of John 17:5 — *the glory which I had with thee before the world was* — is this position: the Formed was before all things, by him all things consist, and the world was made through him.\n\n*Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* (Revelation 5:12)\n\nRevelation 5:12–13 shows the kept word of John 17:5''s prayer: the Lamb that was slain receives glory and honour from ten thousand times ten thousand before the throne. The glory the Formed one held before the world was is now given back in heavenly acclamation — and every creature under heaven joins it. The before-the-world-was glory and the post-resurrection glory are one and the same glory, from the Father, held before creation and restored after the cross.',
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=17 AND verse_number=5),
  (SELECT verse_id FROM _s216_j13_17_lookup
    WHERE edition_slug='canon' AND book_slug='john' AND chapter_number=17 AND verse_number=24),
  'free'::content_tier,
  4280
)
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Philippians 2:6-7
  ('canon', 'john', 17, 5,
   'canon', 'philippians', 2, 6,
   E'*Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God): But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men.* (Philippians 2:6–7) The Formed one''s pre-incarnate position — *in the form of Elohim (God)* — is what John 17:5''s prayer asks to be restored: *the glory which I had with thee before the world was.* The emptying of that form at the incarnation is the voluntary laying aside of the before-the-world glory; the exaltation that follows the cross is its restoration.'),
  -- Philippians 2:9-11
  ('canon', 'john', 17, 5,
   'canon', 'philippians', 2, 9,
   E'*Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name: That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth; And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* (Philippians 2:9–11) This is the Father''s kept answer to John 17:5 — *glorify thou me with thine own self with the glory which I had with thee before the world was.* The exaltation after the cross, the name above every name, the confession of every tongue — this is the glory restored in the Father''s own doing.'),
  -- Colossians 1:15-16
  ('canon', 'john', 17, 5,
   'canon', 'colossians', 1, 15,
   E'*Who is the image of the invisible Elohim (God), the firstborn of every creature: For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* (Colossians 1:15–16) The glory John 17:5 prays to have restored — *the glory which I had with thee before the world was* — is exactly the glory Colossians 1:15–16 names: the Formed one as the image of the invisible Elohim (God), the firstborn of every creature, the one by whom and for whom all things were made. This position, held before the world was, is what the prayer asks the Father to glorify him with again.'),
  -- Colossians 1:17
  ('canon', 'john', 17, 5,
   'canon', 'colossians', 1, 17,
   E'*And he is before all things, and by him all things consist.* (Colossians 1:17) The Formed one is before all things — before the world was — and all things hold together in him. John 17:5''s *before the world was* is Colossians 1:17''s *before all things.* The glory prayed for is not a new attainment; it is the restoration of the position the Formed one held before creation, in which he was already the sustainer of all that exists.'),
  -- Revelation 5:12
  ('canon', 'john', 17, 24,
   'canon', 'revelation', 5, 12,
   E'*Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* (Revelation 5:12) John 17:24 asks the Father that those given to the Son might behold his glory. Revelation 5:12 shows that glory in heavenly acclamation: ten thousand times ten thousand voicing the Lamb''s worthiness to receive glory. The glory the Son had with the Father before the foundation of the world (John 17:24) is here restored and proclaimed before the throne.'),
  -- Revelation 5:13
  ('canon', 'john', 17, 24,
   'canon', 'revelation', 5, 13,
   E'*And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* (Revelation 5:13) The Father''s throne and the Lamb together receive the glory — the architecture of John 17:1''s *Father, the hour is come; glorify thy Son, that thy Son also may glorify thee* kept in its final form: the Son glorified before all creation, and that glory returning in praise to the Father on the throne. John 17:24''s *that they may behold my glory* is exactly what the Revelation''s great assembly beholds.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'::content_tier
  FROM input i
  JOIN _s216_j13_17_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch   AND sv.verse_number = i.src_v
  JOIN _s216_j13_17_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch   AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (ORDER BY x.id),
    CASE
      WHEN tv.book_slug = 'philippians' AND tv.verse_number = 6
        THEN E'Philippians 2:6–7 — *being in the form of Elohim (God) ... made himself of no reputation* — the pre-incarnate glory of John 17:5 named as *the form of Elohim (God)* voluntarily laid aside at the incarnation.'
      WHEN tv.book_slug = 'philippians' AND tv.verse_number = 9
        THEN E'Philippians 2:9–11 — *highly exalted him, and given him a name above every name* — the Father''s kept answer to John 17:5''s prayer: the before-the-world glory restored in exaltation.'
      WHEN tv.book_slug = 'colossians' AND tv.verse_number = 15
        THEN E'Colossians 1:15–16 — *the firstborn of every creature: for by him were all things created* — the pre-world-creation position of John 17:5''s *before the world was,* the glory of the Formed before all things were made.'
      WHEN tv.book_slug = 'colossians' AND tv.verse_number = 17
        THEN E'Colossians 1:17 — *he is before all things, and by him all things consist* — the sustaining position that is John 17:5''s *before the world was* in its cosmic register.'
      WHEN tv.book_slug = 'revelation' AND tv.verse_number = 12
        THEN E'Revelation 5:12 — *worthy is the Lamb ... to receive ... honour, and glory* — the heavenly acclamation of the glory John 17:24 asked those given to the Son to behold.'
      WHEN tv.book_slug = 'revelation' AND tv.verse_number = 13
        THEN E'Revelation 5:13 — *glory and power be unto him that sitteth upon the throne, and unto the Lamb* — John 17:1''s mutual glorification (Father and Son) kept in its final cosmic form before every creature.'
      ELSE ''
    END
  FROM cross_reference_threads t
  JOIN cross_references x ON x.source_verse_id IN (
        SELECT verse_id FROM _s216_j13_17_lookup
         WHERE edition_slug='canon' AND book_slug='john'
           AND chapter_number=17 AND verse_number IN (5,24)
       )
  JOIN _s216_j13_17_lookup tv ON tv.verse_id = x.target_verse_id
 WHERE t.slug = 'john-17-5-24-the-glory-before-the-world-was-in-philippians-2-colossians-1-and-revelation-5'
   AND tv.book_slug IN ('philippians','colossians','revelation')
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===================== fragment: minion_john_18_21.sql =====================
-- =====================================================================
-- S216 minion — John 18-19-20-21 NT-to-NT cross-references
-- =====================================================================
-- Range:  John 18, 19, 20, 21 (the arrest / "I am he" / Peter's denial /
--         before Pilate / my kingdom is not of this world / what is truth;
--         the scourging / Behold the man / the crucifixion / the seamless
--         garment / "It is finished" / the pierced side blood and water /
--         the bone not broken; the empty tomb / Mary at the garden / the
--         risen Lord / "received ye the Holy Spirit" / Thomas "My Lord and
--         my God"; the catch of fish / "feed my sheep" / the restoration of
--         Peter / the disciple who tarries).
-- Tag:    j18_21   (temp view: _s216_j18_21_lookup)
-- Sort band: 4310-4369
--
-- Nine NT-to-NT threads (SOURCE always a canon John 18/19/20/21 verse;
-- TARGET always a verse in another NT book):
--
--   Thread 4310: john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels
--       (sort 4310) — targets: matthew, mark, luke
--   Thread 4311: john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation
--       (sort 4311) — targets: philippians, luke, revelation
--   Thread 4312: john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke
--       (sort 4312) — targets: matthew, mark, luke
--   Thread 4313: john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews
--       (sort 4313) — targets: hebrews
--   Thread 4314: john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5
--       (sort 4314) — targets: 1-john
--   Thread 4315: john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1
--       (sort 4315) — targets: 1-corinthians, 1-peter
--   Thread 4316: john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15
--       (sort 4316) — targets: 1-corinthians
--   Thread 4317: john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt
--       (sort 4317) — targets: 1-corinthians, colossians, revelation
--   Thread 4318: john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13
--       (sort 4318) — targets: 1-peter, acts, hebrews
--
-- 36 cross_reference rows, 36 thread_member rows, all tier_required='free'.
-- Every target quoted IN FULL in italics with citation in parentheses
-- (come-and-see). Sacred names preserved as the canon pull carries them.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- No BEGIN/COMMIT — orchestrator wraps the transaction.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the j18_21 tag).
CREATE TEMP VIEW _s216_j18_21_lookup AS
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
       'ascension-isaiah',
       'sonnini-acts-29'
   );

-- =====================================================================
-- Thread 4310: john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels',
    E'The arrest and Peter''s denial — John 18 and the synoptic passion parallels',
    E'John 18 opens in a garden at night. Judas arrives with a band of soldiers and officers from the chief priests. Yahusha (Jesus) goes out to meet them and speaks two words that knock them backward: *I am he* — the same predicate-less name he spoke from the burning bush, the same name that will fall upon the arresting party like thunder. All four passion accounts carry this moment; the synoptics and John together are the four witnesses the Torah required.\n\n*Yahusha (Jesus) therefore, knowing all things that should come upon him, went forth, and said unto them, Whom seek ye? They answered him, Yahusha (Jesus) of Nazareth. Yahusha (Jesus) saith unto them, I am he. And Judas also, which betrayed him, stood with them. As soon then as he had said unto them, I am he, they went backward, and fell to the ground.* (John 18:4-6)\n\nMatthew names the same arrest-moment with the same Judas-kiss and the same sword drawn by a disciple: *And, behold, one of them which were with Yahusha (Jesus) stretched out his hand, and drew his sword, and struck a servant of the high priest''s, and smote off his ear. Then said Yahusha (Jesus) unto him, Put up again thy sword into his place: for all they that take the sword shall perish with the sword.* (Matthew 26:51-52)\n\nMark 14 and Luke 22 carry the same architecture. Each account stands as witness to the same event; no one of the four replaces the others. The four accounts together fulfill the mouth-of-two-or-three-witnesses standard the Torah requires for the establishing of any matter — and here the matter being established is the voluntary surrender of the Formed one at the hour the Father appointed.\n\nPeter''s three denials are carried identically across all four accounts. John 18:17, 25-27 name the three denials before the cock crew — the same sequence Matthew 26:69-75, Mark 14:66-72, and Luke 22:56-62 carry. Luke''s account alone adds the devastating detail: *And Yahuah (Lord) turned, and looked upon Peter* (Luke 22:61). The look that falls on Peter after the third denial is the look of the shepherd who knows the sheep. The denial does not end the sheep''s place in the flock; the restoration of John 21:15-17 is already embedded in the look.\n\nThe passion parallels are not redundancy. They are the four-witness establishment of the most load-bearing event in the canon: the Formed cloud-rider laying down his body at the hour the Father appointed, the cup the scattered seed would have drunk instead now on his lips, the arrest and the denial and the trial all moving toward the lifting-up the disciples had been warned about since John 3:14.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4310
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 18 AND sv.verse_number = 4
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 18 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 18, 5,
   'canon', 'matthew', 26, 50,
   E'*And Yahusha (Jesus) said unto him, Friend, wherefore art thou come? Then came they, and laid hands on Yahusha (Jesus), and took him.* (Matthew 26:50). The same arrest-hour in Matthew: the betrayer''s kiss named as *friend*, then the hands laid on the Formed one who stepped out to meet them. John 18:4-6''s *I am he* and the falling backward happen in the same moment Matthew''s account names the taking. Both witnesses establish the voluntary surrender of the Formed one.'),
  ('canon', 'john', 18, 10,
   'canon', 'matthew', 26, 52,
   E'*Then said Yahusha (Jesus) unto him, Put up again thy sword into his place: for all they that take the sword shall perish with the sword.* (Matthew 26:52). John 18:10-11 names Peter as the one who drew the sword and cut off the ear; Matthew 26:52 carries the same rebuke. The sword-rebuke is the Formed one refusing the way of the sword even in his own defense — the cup the Father gave him, not the sword, is what this moment requires.'),
  ('canon', 'john', 18, 17,
   'canon', 'mark', 14, 68,
   E'*But he denied, saying, I know not, neither understand I what thou sayest. And he went out into the porch; and the cock crew.* (Mark 14:68). The first denial in Mark''s account carries the same woman-at-the-door architecture John 18:17 names. The rooster''s crow that John 18:27 and Mark 14:72 both close the denial sequence with is the same prophetic clock-tick — the three denials completed before morning, exactly as Yahusha (Jesus) said.'),
  ('canon', 'john', 18, 27,
   'canon', 'luke', 22, 61,
   E'*And Yahuah (Lord) turned, and looked upon Peter. And Peter remembered the word of Yahuah (Lord), how he had said unto him, Before the cock crow, thou shalt deny me thrice.* (Luke 22:61). Luke''s account adds what the others do not: the look. John 18:27''s cock-crow closes the three denials; Luke 22:61 names the shepherd''s eyes that fell on Peter in that moment. The look is the look of the chief Shepherd who does not abandon the sheep who stumbles.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-18-the-arrest-and-denial-in-the-synoptic-passion-parallels | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4311: john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation',
    E'My kingdom is not of this world — John 18:36 and the not-of-this-world kingdom register',
    E'Pilate asked whether Yahusha (Jesus) was a king. The answer Yahusha (Jesus) gave was not a denial of kingship but a precise naming of the kingdom''s source and nature: *My kingdom is not of this world: if my kingdom were of this world, then would my servants fight, that I should not be delivered to the Yahudim (Jews): but now is my kingdom not from hence.* (John 18:36) The Formed one is a king. The kingdom he rules is real. But it does not arise from the present-age power-structures the *kosmos* administers; it does not advance by the sword; it is not geographically bounded by any empire''s territory. Its citizens are scattered through all the nations, and the kingdom gathers them by the Shepherd''s voice, not by political force.\n\nPhilippians 3:20 places the same architecture in Paul''s register: *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ).* (Philippians 3:20). *Conversation* — the Greek *politeuma,* the colony''s citizenship-register — is in heaven. The citizens of the kingdom live among the nations; their citizenship is not of this world; they look for the King to come and complete the gathering.\n\nLuke 17:20-21 carries the same line from the Formed one''s own mouth: *And when he was demanded of the Pharisees, when the kingdom of Elohim (God) should come, he answered them and said, The kingdom of Elohim (God) cometh not with observation: Neither shall they say, Lo here! or, lo there! for, behold, the kingdom of Elohim (God) is among you.* (Luke 17:20-21). The kingdom is not visible to observation — it does not arrive with the flags and marching columns of a this-world power. It is already present among the scattered citizens wherever the Shepherd''s voice has gathered them.\n\nRevelation 11:15 names the moment when the not-of-this-world kingdom becomes the only kingdom: *The kingdoms of this world are become the kingdoms of our Yahuah (Lord), and of his Messiah (Christ); and he shall reign for ever and ever.* (Revelation 11:15). The not-of-this-world character of the kingdom now is not its permanent character forever — it is the character of the kingdom in the age of the gathering. At the seventh trumpet, the transfer happens: every *kosmos*-administration is absorbed into the kingdom of the Formed one and of the Father. What John 18:36 names as *not from hence* will become the only *hence* there is.\n\nThe kingdom is the news the scattered citizens are being gathered home to. The Formed one told Pilate what kind of king he was: the kind whose servants do not fight to defend him, because the hour was the Father''s appointed hour, and the cup was what that hour required.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4311
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 18 AND sv.verse_number = 36
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 18 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 18, 36,
   'canon', 'philippians', 3, 20,
   E'*For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ).* (Philippians 3:20). The *politeuma* — the citizenship-colony — is in heaven: the same not-of-this-world sourcing of the kingdom John 18:36 names. The citizens of the not-of-this-world kingdom live scattered among the nations; their commonwealth is the kingdom of the Formed one, and they look for the King''s coming to complete what the gathering began.'),
  ('canon', 'john', 18, 36,
   'canon', 'luke', 17, 21,
   E'*Neither shall they say, Lo here! or, lo there! for, behold, the kingdom of Elohim (God) is among you.* (Luke 17:21). The Formed one''s own word to the Pharisees before the passion: the kingdom does not arrive with the observable flags of a this-world power. It is already present among the gathered wherever the Shepherd''s voice has reached them. John 18:36''s *not of this world* and Luke 17:21''s *not with observation* name the same kingdom from two directions.'),
  ('canon', 'john', 18, 36,
   'canon', 'revelation', 11, 15,
   E'*The kingdoms of this world are become the kingdoms of our Yahuah (Lord), and of his Messiah (Christ); and he shall reign for ever and ever.* (Revelation 11:15). The seventh trumpet sounds and every *kosmos*-administration transfers to the Formed one and the Father. What John 18:36 named as *not from hence* — the not-of-this-world kingdom — becomes the only kingdom there is. The scattering-and-gathering age ends; the reign begins.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-18-my-kingdom-is-not-of-this-world-and-the-kingdom-register-in-paul-and-revelation | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4312: john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke',
    E'The seamless garment and the lots — John 19:23-24 and the passion parallels in Matthew, Mark, Luke',
    E'John 19:23-24 records a detail none of the synoptics name as precisely: the coat of the Formed one was woven in one piece from top to bottom — without seam. The soldiers chose not to tear it but to cast lots for it entire, so that the scripture would be fulfilled. All four accounts carry the parting of the garments; only John names the seamless character of the coat and makes the fulfillment-of-scripture notation explicit.\n\n*Then the soldiers, when they had crucified Yahusha (Jesus), took his garments, and made four parts, to every soldier a part; and also his coat: now the coat was without seam, woven from the top throughout. They said therefore among themselves, Let us not rend it, but cast lots for it, whose it shall be: that the scripture might be fulfilled, which saith, They parted my raiment among them, and for my vesture they did cast lots.* (John 19:23-24)\n\nMatthew 27:35, Mark 15:24, and Luke 23:34 all carry the casting of lots for the garments — the Psalm 22:18 fulfillment that the soldiers unwittingly enacted. The four passion accounts together establish the garment-lots as a historical fact witnessed from four angles. The seamlessness of the coat in John''s account adds the layer the synoptics do not: the coat woven from top to bottom without joining is the coat of the high priest, woven after the pattern of Exodus 28 — the one-piece garment of the one serving before Yahuah (the LORD) in the sanctuary.\n\n*And they crucified him, and parted his garments, casting lots: that it might be fulfilled which was spoken by the prophet, They parted my garments among them, and upon my vesture did they cast lots.* (Matthew 27:35). The fulfillment-of-scripture notation here in Matthew names the same Psalm 22:18 that John names — the soldiers'' act was prophetically scripted.\n\n*And they crucified him, and parted his garments, casting lots upon them, what every man should take.* (Mark 15:24)\n\n*And they parted his raiment, and cast lots.* (Luke 23:34)\n\nFour witnesses. One event. The coat woven whole, not torn. The high-priestly garment cast for by lot among the soldiers of Rome, who did not know what they were handling.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4312
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 23
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 19, 24,
   'canon', 'matthew', 27, 35,
   E'*And they crucified him, and parted his garments, casting lots: that it might be fulfilled which was spoken by the prophet, They parted my garments among them, and upon my vesture did they cast lots.* (Matthew 27:35). Matthew names the Psalm 22 fulfillment explicitly, the same notation John 19:24 carries. The four accounts together establish the garment-division as the prophetically-scripted event it was.'),
  ('canon', 'john', 19, 24,
   'canon', 'mark', 15, 24,
   E'*And they crucified him, and parted his garments, casting lots upon them, what every man should take.* (Mark 15:24). Mark''s witness to the same event: the soldiers divide the garments by lot. John 19:23-24 adds the detail that the coat was seamless and woven whole — the high-priestly coat not torn but preserved by the lots the soldiers cast.'),
  ('canon', 'john', 19, 24,
   'canon', 'luke', 23, 34,
   E'*And they parted his raiment, and cast lots.* (Luke 23:34). Luke''s account of the same moment — the raiment parted, the lots cast. Three synoptic witnesses alongside John''s account, all four establishing the same act. The seamless garment John names is the coat Luke''s account does not name as seamless; read together, the four give the full weight of the event.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-19-the-seamless-garment-and-the-lots-in-matthew-mark-luke | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4313: john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews',
    E'It is finished — John 19:30 and the once-for-all offering in Hebrews',
    E'The last word the Formed one spoke from the cross was not a cry of defeat. It was the declaration of a completed transaction: *It is finished.* (John 19:30). The Greek *tetelestai* — a commercial term for a paid-in-full receipt, a craftsman''s word for a work brought to completion, a priest''s word for an offering fully accomplished. The Hebrews letter walks the same completion across its middle chapters: the annual repetition of the Yom Kippur offerings was a sign that the matter was not yet finished; the Formed one''s single offering accomplished what the annual offerings signaled but could not do.\n\n*When Yahusha (Jesus) therefore had received the vinegar, he said, It is finished: and he bowed his head, and gave up the ghost.* (John 19:30)\n\n*But this man, after he had offered one sacrifice for sins for ever, sat down on the right hand of Elohim (God).* (Hebrews 10:12). The sitting down is what makes the finishedness legible. The priests in the temple never sat; they stood because the work was never done. The Formed one sat because *It is finished* was true. Hebrews 10:12 is the NT register''s own gloss on *tetelestai*.\n\n*For by one offering he hath perfected for ever them that are sanctified.* (Hebrews 10:14). One offering. For ever. Perfected. Three words that restate *tetelestai* in the vocabulary of the Yom Kippur-completion architecture.\n\n*Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption.* (Hebrews 9:12). *Once* — the Hebrews emphasis on the single unrepeatable entry into the most holy place is the same emphasis *It is finished* carries from the cross. The veil was rent the moment the Formed one gave up the ghost; the way back into the presence was opened; the annual Yom Kippur repetition was superseded by the single entry that needs no repetition.\n\nThe completion the Formed one declared from the cross is the completion the Hebrews letter walks the scattered seed through: the high-priestly work is done; the blood of the everlasting covenant has been brought into the most holy place; the matter is finished. What remains is the gathering of those for whom it was finished — the scattered seed coming home to the sanctuary whose veil is now gone.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4313
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 30
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 30
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 19, 30,
   'canon', 'hebrews', 10, 12,
   E'*But this man, after he had offered one sacrifice for sins for ever, sat down on the right hand of Elohim (God).* (Hebrews 10:12). The sitting-down is Hebrews'' rendering of *tetelestai* — the work is done; the priest sits because the offering is complete. The priests of the Levitical order never sat; the Formed one sat because *It is finished* was the truth the cross carried to completion.'),
  ('canon', 'john', 19, 30,
   'canon', 'hebrews', 10, 14,
   E'*For by one offering he hath perfected for ever them that are sanctified.* (Hebrews 10:14). One offering. For ever. Perfected. The same *tetelestai* of John 19:30 named in the vocabulary of the once-for-all Yom Kippur-completion architecture. The annual repetition that could never finish the work is over; the single offering of the Formed one has done what the annual cycle was pointing toward.'),
  ('canon', 'john', 19, 30,
   'canon', 'hebrews', 9, 12,
   E'*Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption.* (Hebrews 9:12). The *once* of Hebrews 9:12 is the *finished* of John 19:30 spoken in the high-priestly-entry register. The veil rent at the moment of *It is finished* was the sign that the blood had been brought into the most holy place by the High Priest who entered once, not annually, and obtained eternal redemption.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-19-it-is-finished-and-the-once-for-all-offering-in-hebrews | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4314: john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5',
    E'Blood and water from the pierced side — John 19:34 and the triple witness in 1 John 5:6-8',
    E'When the soldier drove the spear into the side of the already-dead Formed one, what came out was blood and water together — not one, but both. John names himself as the eyewitness: *he that saw it bare record, and his record is true.* (John 19:35). The same Yochanan (John) who watched the blood and water flow from the pierced side wrote, decades later, a letter that returns to the same two fluids and names them as witnesses.\n\n*But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water. And he that saw it bare record, and his record is true: and he knoweth that he saith true, that ye might believe.* (John 19:34-35)\n\n*This is he that came by water and blood, even Yahusha HaMashiach (Jesus Christ); not by water only, but by water and blood. And it is the Spirit that beareth witness, because the Spirit is truth. For there are three that bear record in heaven, the Father, the Word, and the Ruach HaKodesh (Holy Spirit): and these three are one. And there are three that bear witness in earth, the Spirit, and the water, and the blood: and these three agree in one.* (1 John 5:6-8)\n\nThe Formed one *came by water and blood — not by water only, but by water and blood.* The emphasis is on the blood: those who taught that Yahusha (Jesus) was the Formed-one only in his spirit-presence — coming at the water of immersion and departing before the blood of the cross — are ruled out by the apostle''s own eyewitness testimony. He was there when the spear went in. He saw what came out. The Formed one came to the cross in body. The blood is real. The water is real. The two are inseparable.\n\nThe three earthly witnesses the apostle names — the Spirit, the water, and the blood — are the same three that converge in the account of the immersion (John 1:32-34: the Ruach HaKodesh descending, the water of immersion, the blood-line of the Lamb of Elohim) and the cross (John 19:34: the blood and water from the side, the Spirit given up in John 19:30). The Spirit, the water, and the blood agree in one testimony: the Formed one came in flesh, was immersed in water, and gave his blood. The eyewitness of the cross is the same hand that wrote the letter. The record is true.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4314
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 34
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 35
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 19, 34,
   'canon', '1-john', 5, 6,
   E'*This is he that came by water and blood, even Yahusha HaMashiach (Jesus Christ); not by water only, but by water and blood. And it is the Spirit that beareth witness, because the Spirit is truth.* (1 John 5:6). The apostle who watched the blood and water flow from the pierced side names the same two fluids as the earthly witness to the Formed one''s coming in flesh. *Not by water only, but by water and blood* rules out every teaching that the Formed one''s body was not genuinely present at the cross.'),
  ('canon', 'john', 19, 34,
   'canon', '1-john', 5, 8,
   E'*And there are three that bear witness in earth, the Spirit, and the water, and the blood: and these three agree in one.* (1 John 5:8). The Spirit, the water, and the blood — the three earthly witnesses — name the three moments the Formed one''s presence in flesh was most legible: the immersion, the cross, and the outpouring of the Ruach HaKodesh (Holy Spirit) on the gathered. All three agree in one testimony: Yahusha HaMashiach (Jesus Christ) came in flesh, and the blood that came from his side was real blood.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5 | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-19-blood-and-water-from-the-pierced-side-and-the-triple-witness-in-1-john-5 | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4315: john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1',
    E'The bone not broken — John 19:36 and the Passover Lamb in 1 Corinthians 5 and 1 Peter 1',
    E'The soldiers who came to break the legs of those crucified found Yahusha (Jesus) already dead. They did not break his legs. John 19:36 names this as a fulfillment of scripture — *A bone of him shall not be broken* — pointing to the Passover lamb of Exodus 12:46 and Numbers 9:12. Paul and Peter, writing from within the apostolic tradition, read the same event through the same lens, and each names the Formed one as the Pesach (Passover) lamb whose blood marks the household of the gathered.\n\n*But when they came to Yahusha (Jesus), and saw that he was dead already, they brake not his legs... For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken.* (John 19:33, 36)\n\n*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us: Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* (1 Corinthians 5:7-8). Paul names the Formed one plainly as *our Passover* — the lamb slaughtered at the preparation of the Passover, whose bone was not broken, whose blood marks those who are gathered. The *keep the feast* that follows is not a suggestion that the Feast of Unleavened Bread is now spiritualized away — it is an invitation to walk the feast in its substance: the old leaven of malice and wickedness purged; the new lump unleavened before Yahuah (the LORD).\n\n*Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold, from your vain conversation received by tradition from your fathers; But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot: Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* (1 Peter 1:18-20). The Lamb is named as *without blemish and without spot* — the precise Passover-lamb requirement of Exodus 12:5. The foreordination before the foundation of the world names the lamb''s appointment before the scatter that makes the blood necessary.\n\nThe bone-not-broken is not an accident of Roman procedure. It is the sign by which the Formed one''s body was kept according to the pattern of the Passover lamb — the sign that John''s eyewitness preserved, that Paul read as the announcement of the feast, and that Peter named as the blood that redeems from the vain tradition received from the fathers.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4315
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 36
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 36
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 19, 36,
   'canon', '1-corinthians', 5, 7,
   E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us.* (1 Corinthians 5:7). Paul names the Formed one as *our Passover* — the Pesach lamb of Exodus 12 whose bone was not broken at John 19:36 is the same lamb Paul identifies here. The bone-not-broken sign names what the lamb was; Paul names what the lamb accomplished: the old leaven purged, the new lump unleavened.'),
  ('canon', 'john', 19, 36,
   'canon', '1-peter', 1, 19,
   E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot: Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* (1 Peter 1:19-20). The *without blemish and without spot* is the Passover-lamb specification of Exodus 12:5; Peter names the Formed one in the same register John 19:36''s bone-not-broken fulfillment points to. The lamb foreordained before the foundation of the world is the lamb whose bone was preserved intact on the cross.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1 | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-19-the-bone-not-broken-and-the-passover-lamb-in-1-corinthians-5-and-1-peter-1 | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4316: john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15',
    E'The resurrection appearances — John 20 and the gospel tradition in 1 Corinthians 15',
    E'John 20 carries three resurrection appearances on the first day and the eighth day: Mary at the garden, the disciples behind locked doors, and Thomas who was not present the first time. Paul, writing to the Corinthians roughly two decades after these events, delivers a tightly enumerated tradition of resurrection appearances — *I delivered unto you first of all that which I also received* — that names witnesses Paul did not invent and encounters John did not collapse.\n\n*And when he had so said, he shewed unto them his hands and his side. Then were the disciples glad, when they saw Yahuah (Lord). Then said Yahusha (Jesus) to them again, Peace be unto you: as my Father hath sent me, even so send I you.* (John 20:20-21)\n\n*For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures; And that he was buried, and that he rose again the third day according to the scriptures: And that he was seen of Cephas, then of the twelve: After that, he was seen of above five hundred brethren at once; of whom the greater part remain unto this present, but some are fallen asleep. After that, he was seen of James; then of all the apostles. And last of all he was seen of me also, as of one born out of due time.* (1 Corinthians 15:3-8)\n\nPaul''s enumeration sits in the same tradition John 20 carries. The appearance to *the twelve* (1 Corinthians 15:5) is the locked-doors appearance of John 20:19-23 — the night of the first day, Thomas absent, the Formed one standing in the midst and showing his hands and his side. The appearances John 20 records are not private visions; they are the first members of a list Paul is at pains to note as still-verifiable: *the greater part remain unto this present.* The risen body was seen. The appearances were real. The witnesses are named.\n\nThe gospel Paul *received* is the gospel anchored in the historical resurrection: *died for our sins according to the scriptures* — not a spiritual metaphor; *rose again the third day according to the scriptures* — not a later theological construction. The empty tomb and the resurrection appearances in John 20 are the historical ground under the gospel Paul received and delivered. Both the gospel and the historical ground are necessary: the resurrection without the gospel-interpretation is a historical oddity; the gospel without the resurrection is a falsehood. John 20 and 1 Corinthians 15 carry both together.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4316
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 20 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 20 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 20, 20,
   'canon', '1-corinthians', 15, 5,
   E'*And that he was seen of Cephas, then of the twelve.* (1 Corinthians 15:5). The appearance to *the twelve* is the locked-doors appearance John 20:19-23 records — the first-day evening, Thomas absent, the Formed one standing in the midst showing his hands and side. Paul''s enumeration in the tradition he received names the same event John''s eyewitness account preserves.'),
  ('canon', 'john', 20, 19,
   'canon', '1-corinthians', 15, 3,
   E'*For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures; And that he was buried, and that he rose again the third day according to the scriptures.* (1 Corinthians 15:3-4). The tradition Paul received — died, buried, rose the third day — is the historical ground under the appearances John 20 narrates. The empty tomb Mary saw, the linen clothes Peter examined, and the risen one who appeared to the disciples are the *rose again the third day* this tradition names.'),
  ('canon', 'john', 20, 29,
   'canon', '1-corinthians', 15, 6,
   E'*After that, he was seen of above five hundred brethren at once; of whom the greater part remain unto this present, but some are fallen asleep.* (1 Corinthians 15:6). Thomas blessed those who believe without seeing (John 20:29); Paul names the still-living witnesses of the post-resurrection appearances as the check on whether the testimony is fabricated. Both moves point in the same direction: the resurrection is a matter of historical testimony, not private spiritual experience.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15 | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-20-the-resurrection-appearances-and-the-gospel-tradition-in-1-corinthians-15 | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4317: john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt',
    E'My Lord and my God — Thomas''s confession and the Formed-one identification in the NT',
    E'On the eighth day, Yahusha (Jesus) stood in the midst again and addressed Thomas directly. Thomas had set a precise condition: he needed to see the print of the nails and put his hand into the side. The Formed one met the condition without reproach and then asked for belief. Thomas''s answer was not a theological proposition about divine ontology. It was a confession wrung out of a man who had just touched the wounds of someone he had watched die: *My Lord and my Elohim (God).* (John 20:28)\n\nThe confession is the load-bearing moment of Formed-one Christology in the gospel. Thomas was not confused. He was not using hyperbole. He was not groping for vocabulary. He named what was standing in front of him: the one he had known as teacher and Lord was Yahuah (God) in flesh. The Formed drawn from the Formless — the one the prologue named as *the Word was Elohim (God)* (John 1:1) — had met Thomas''s condition and Thomas recognized what he was touching.\n\nThis is the identification the Spirit makes legible. Paul names the Spirit-ruled equation directly: *Wherefore I give you to understand, that no man speaking by the Spirit of Elohim (God) calleth Yahusha (Jesus) accursed: and that no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit).* (1 Corinthians 12:3). The confession *Yahusha (Jesus) is Yahuah (Lord)* is Spirit-revealed; no one arrives at it by argument alone. Thomas arrived at it by touch, by sight, by eight days of doubt resolved in a single moment — and the Ruach HaKodesh (Holy Spirit) made the identification legible.\n\nColossians 2:9 carries the same identification in the vocabulary of fullness: *For in him dwelleth all the fulness of the Godhead bodily.* (Colossians 2:9). All the fullness of the Godhead — not a portion, not a representation, not a mere reflection — dwells bodily in the Formed one. The Thomas moment is the tactile demonstration of this: the fullness that dwells bodily is present in a body that has wounds, a body Thomas''s hands could touch. The Formed one is not an abstraction. The Godhead dwelling bodily is not a metaphor.\n\nRevelation 1:8 places the same name on the same figure: *I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty.* (Revelation 1:8). The Almighty, the beginning and the ending — the Formed one addressing the seven assemblies from the throne he was exalted to after the resurrection Thomas witnessed. What Thomas named with his hands, the Revelation names in the voice that filled the Patmos shore.\n\nThe framework that holds Thomas''s confession without collapsing it: Yahusha (Jesus) is the Formed one drawn from the Formless — the expressed Word, the body the Formless source took on in flesh, the God of every OT theophany who walked in the garden and wrestled at the Yabbok. He is Yahuah (God) and he has a Father. The confession *my Lord and my Elohim (God)* is the right confession. It is not Trinitarian co-equal-persons grammar; it is not modalist collapse. It is the Formed one identified by the Spirit through the testimony of touch.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4317
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 20 AND sv.verse_number = 28
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 20 AND ev.verse_number = 28
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 20, 28,
   'canon', '1-corinthians', 12, 3,
   E'*Wherefore I give you to understand, that no man speaking by the Spirit of Elohim (God) calleth Yahusha (Jesus) accursed: and that no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit).* (1 Corinthians 12:3). The Spirit-revealed equation: Yahusha (Jesus) is Yahuah (Lord). This is the same identification Thomas made at John 20:28 — *my Lord and my Elohim (God)* — and Paul names the Spirit as the one who makes it legible. Thomas arrived by touch; the Spirit made it true in the utterance.'),
  ('canon', 'john', 20, 28,
   'canon', 'colossians', 2, 9,
   E'*For in him dwelleth all the fulness of the Godhead bodily.* (Colossians 2:9). All the fullness of the Godhead — not a portion, not a representation — dwells bodily in the Formed one. The *bodily* is what Thomas''s hands confirmed: the fullness that dwells bodily is present in a body with wounds that can be touched. Thomas''s confession *my Lord and my Elohim (God)* named precisely what Colossians 2:9 names in the vocabulary of fullness.'),
  ('canon', 'john', 20, 28,
   'canon', 'revelation', 1, 8,
   E'*I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty.* (Revelation 1:8). The Almighty, which is and which was and which is to come — the same Formed one Thomas named as *my Elohim (God)* now speaks from the throne of exaltation. What Thomas''s hands touched in the upper room, the Patmos seer heard from the cloud-rider whose voice is as the sound of many waters. Same one.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-20-thomas-my-lord-and-my-god-and-the-formed-one-identification-in-the-nt | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- Thread 4318: john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13
-- =====================================================================
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13',
    E'Feed my sheep — John 21:15-17 and the shepherd of the scattered seed in 1 Peter 5, Acts 20, and Hebrews 13',
    E'The restoration of Peter is the last commissioned act of the risen Formed one in the fourth gospel. Three times he had denied; three times the Formed one asked *Lovest thou me?* Three times the same commission: *Feed my lambs. Feed my sheep. Feed my sheep.* The triple commission corresponds to the triple denial; the shame is not erased by the commission but is redeemed inside it. Kefa (Peter) who could not stand by a charcoal fire and confess is sent back to the same flock by the shores of Tiberias.\n\n*He saith unto him the third time, Simon, son of Jonas, lovest thou me? Peter was grieved because he said unto him the third time, Lovest thou me? And he said unto him, Yahuah (Lord), thou knowest all things; thou knowest that I love thee. Yahusha (Jesus) saith unto him, Feed my sheep.* (John 21:17)\n\nThe flock Kefa (Peter) is commissioned to feed is the same flock the NT letters name when they describe the shepherd-task. 1 Peter 5 carries the charge into the elder-instruction register: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind; Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock. And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away.* (1 Peter 5:2-4). The *chief Shepherd* who will appear is the same Formed one who commissioned Kefa (Peter) at Tiberias; the under-shepherds are not the source of the flock''s life but ensamples who point to the chief Shepherd.\n\nPaul''s charge to the elders of Ephesus in Acts 20 carries the same commission in the vocabulary of the scattered flock: *Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God), which he hath purchased with his own blood. For I know this, that after my departing shall grievous wolves enter in among you, not sparing the flock.* (Acts 20:28-29). The Ruach HaKodesh (Holy Spirit) makes the overseers; the purchase-price is the Formed one''s blood; the threat is the wolves that do not spare the flock. The commission John 21 names as personal restoration and pastoral charge, Acts 20 names as the apostolic tradition to be guarded.\n\nHebrews 13:20 names the Formed one as the Great Shepherd in the language of the everlasting covenant: *Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant, Make you perfect in every good work to do his will.* (Hebrews 13:20-21). The great shepherd of the sheep, brought again from the dead — the same risen Formed one who stood on the shore of Tiberias and restored Kefa (Peter) to the shepherd-task. The blood of the everlasting covenant is what makes the restoration permanent and the commission authoritative.\n\nThe flock these three passages name is not a new institution established for Gentile believers from among all nations. It is the scattered seed of the house of Yashar''el (Israel) — the sheep the Formed one came to gather, the sheep his blood purchased, the sheep the chief Shepherd will appear to at his coming. The pastoral commission of John 21 is the continuation of the lost-sheep gathering that John 10:16 named when the Formed one said *other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The fold is one; the shepherd is one; the flock is the scattered seed coming home.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 4318
  FROM _s216_j18_21_lookup sv, _s216_j18_21_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 21 AND sv.verse_number = 15
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 21 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 21, 15,
   'canon', '1-peter', 5, 2,
   E'*Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind.* (1 Peter 5:2). The elder-instruction Kefa (Peter) himself writes carries the same charge the Formed one gave him at Tiberias: *Feed my lambs. Feed my sheep.* The shepherd-task is not a title but a willing posture toward the flock the chief Shepherd purchased.'),
  ('canon', 'john', 21, 16,
   'canon', '1-peter', 5, 4,
   E'*And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away.* (1 Peter 5:4). The *chief Shepherd* who will appear is the same Formed one who restored Kefa (Peter) at Tiberias and commissioned *Feed my sheep*. The under-shepherd''s work is not the source of the flock''s life; it points toward the chief Shepherd whose appearing is the horizon the shepherd-task is held accountable to.'),
  ('canon', 'john', 21, 17,
   'canon', 'acts', 20, 28,
   E'*Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God), which he hath purchased with his own blood.* (Acts 20:28). The Ruach HaKodesh (Holy Spirit) makes the overseers; the flock was purchased with the Formed one''s blood. Paul''s charge to the Ephesian elders carries the same architecture as John 21''s triple commission: the shepherd-task is not self-appointed, and the flock belongs to the one who bought it.'),
  ('canon', 'john', 21, 17,
   'canon', 'hebrews', 13, 20,
   E'*Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant, Make you perfect in every good work to do his will.* (Hebrews 13:20-21). The great shepherd of the sheep, raised from the dead through the blood of the everlasting covenant — the same risen Formed one who stood on the shore of Tiberias and restored Kefa (Peter). The blood of the everlasting covenant is what makes the restoration and the commission permanent.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
       E'thread:john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13 | ' || i.note,
       'free'::content_tier
  FROM input i
  JOIN _s216_j18_21_lookup sv
    ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
   AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s216_j18_21_lookup tv
    ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
   AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t
    ON t.slug = 'john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:john-21-feed-my-sheep-and-the-shepherd-of-the-scattered-seed-in-1-peter-5-acts-20-hebrews-13 | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'Session 216 — John NT-to-NT cross-references complete.'
