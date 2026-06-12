-- ----- fragment: minion_2corinthians_01.sql (S229 2 Corinthians 1) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 1 (24 verses).
-- Tag: 2c01 (temp view _s229_2c01_lookup).
-- Sort band: floor 7000, step 3 (7000, 7003, 7006, 7009 used; under 7025).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul opens his second letter to the afflicted, called-out assembly at Corinth —
-- Yashar'el (Israel) and the grafted-in seed — blessing *the Father of mercies, and the Elohim (God)
-- of all comfort* (1:3), the same Yahuah (LORD) who comforts his afflicted people in the prophets.
-- The sentence of death drives them off self-trust onto *Elohim (God) which raiseth the dead* (1:9) —
-- the Tanakh resurrection hope. The Formed Son is named: *all the promises of Elohim (God) in him are
-- yea, and in him Amen* (1:20) — Yahusha (Jesus) the Formed in whom the Father's unaltered covenant-word
-- is established; the Father is the One who establishes and anoints and seals (1:21-22). The *earnest
-- of the Spirit* (1:22) is the down-payment of the promised indwelling of Ezekiel 36. No Trinitarian
-- co-equal-persons grammar; the Father is the One, Yahusha (Jesus) the Formed Son in whom the promises
-- are Amen.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the greeting (Paul, Timothy, the church, grace and peace)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (epistolary opening)
--   v.3-7   the Father of mercies and the Elohim (God) of all comfort / comfort in affliction
--           Tanakh: Isaiah 49:13 (Yahuah hath comforted his people, and will have mercy upon his afflicted)
--           Extras: Sirach 2:5 (acceptable men in the furnace of adversity), Sirach 2:11 (full of
--                   compassion and mercy... saves in time of affliction)
--           NT: none warranted (the consolation Christology carried in prose)
--   v.8-10  the sentence of death / trust in Elohim (God) which raiseth the dead
--           Tanakh: Isaiah 26:19 (thy dead men shall live... the earth shall cast out the dead)
--           Extras: none warranted   NT: none warranted (the resurrection root is the Tanakh hope)
--   v.11-17 prayer-help, sincerity of conversation, the travel plans, yea-yea / nay-nay
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral self-defense)
--   v.18-20 our word was not yea and nay / all the promises of Elohim (God) in him are yea, and Amen
--           Tanakh: Psalm 89:34 (My covenant will I not break, nor alter the thing... gone out of my lips)
--           Extras: none warranted   NT: Romans 15:8 (to confirm the promises made unto the fathers)
--   v.21-22 he stablisheth, anointed us, sealed us, given the earnest of the Spirit in our hearts
--           Tanakh: Ezekiel 36:27 (I will put my spirit within you, and cause you to walk in my statutes)
--           Extras: none warranted   NT: Ephesians 1:13-14 (sealed with that holy Spirit of promise,
--                   Which is the earnest of our inheritance)
--   v.23-24 I call Elohim (God) for a record / helpers of your joy / by faith ye stand
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral close)
--
-- THREADS (slug -> target libraries):
--   7000 2-corinthians-1-the-father-of-mercies-and-the-elohim-of-all-comfort-isaiah-49   (Tanakh + Extras)
--   7003 2-corinthians-1-the-sentence-of-death-and-elohim-which-raiseth-the-dead-isaiah-26   (Tanakh)
--   7006 2-corinthians-1-all-the-promises-of-god-in-him-are-yea-and-amen-psalm-89-romans-15   (Tanakh + NT)
--   7009 2-corinthians-1-the-earnest-of-the-spirit-sealed-in-our-hearts-ezekiel-36-ephesians-1   (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s229_2c01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-1-the-father-of-mercies-and-the-elohim-of-all-comfort-isaiah-49
  ('canon', '2-corinthians', 1, 3, 'canon', 'isaiah', 49, 13, 'free', E'*Sing, O heavens; and be joyful, O earth; and break forth into singing, O mountains: for Yahuah (LORD) hath comforted his people, and will have mercy upon his afflicted.* (Isaiah 49:13). Paul blesses *the Father of mercies, and the Elohim (God) of all comfort* (2 Corinthians 1:3) — the very God Isaiah names, who *hath comforted his people, and will have mercy upon his afflicted.* The comfort poured out on the afflicted assembly at Corinth is the same covenant mercy spoken over Yashar''el (Israel); the Elohim (God) of all comfort is not a new God but the One who from of old comforts his people in their affliction.'),
  ('canon', '2-corinthians', 1, 4, 'apocrypha', 'ecclesiasticus', 2, 5, 'extras', E'*For gold is tried in the fire, and acceptable men in the furnace of adversity.* (Sirach 2:5). The Hebrew library knew that the affliction of the godly is a refining, not an abandonment: *acceptable men in the furnace of adversity.* Paul writes that Elohim (God) *comforteth us in all our tribulation, that we may be able to comfort them which are in any trouble* (2 Corinthians 1:4) — the furnace itself becomes the school of comfort, the tried man made able to comfort others by the comfort wherewith he himself was comforted of Elohim (God).'),
  ('canon', '2-corinthians', 1, 3, 'apocrypha', 'ecclesiasticus', 2, 11, 'extras', E'*For Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction.* (Sirach 2:11). The library names the God Paul blesses: *full of compassion and mercy... and saves in time of affliction.* This is *the Father of mercies, and the Elohim (God) of all comfort* (2 Corinthians 1:3), the One who delivers in the very hour of trouble; the mercy that saves in affliction is the comfort Paul has tasted and now hands on to the assembly.'),
  -- thread: 2-corinthians-1-the-sentence-of-death-and-elohim-which-raiseth-the-dead-isaiah-26
  ('canon', '2-corinthians', 1, 9, 'canon', 'isaiah', 26, 19, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). When Paul says *we had the sentence of death in ourselves, that we should not trust in ourselves, but in Elohim (God) which raiseth the dead* (2 Corinthians 1:9), he leans on the Tanakh''s own resurrection hope: *thy dead men shall live... the earth shall cast out the dead.* The God who answers despair of life is the God who raises the dead from the dust; the sentence of death drives the trust off self and onto the One whom Isaiah declares will make the dead to live.'),
  -- thread: 2-corinthians-1-all-the-promises-of-god-in-him-are-yea-and-amen-psalm-89-romans-15
  ('canon', '2-corinthians', 1, 20, 'canon', 'psalms', 89, 34, 'free', E'*My covenant will I not break, nor alter the thing that is gone out of my lips.* (Psalm 89:34). Yahuah (LORD) swears his promise will not be revoked: *My covenant will I not break, nor alter the thing that is gone out of my lips.* Paul says of the Formed Son, *all the promises of Elohim (God) in him are yea, and in him Amen, unto the glory of Elohim (God) by us* (2 Corinthians 1:20). The unaltered covenant-word of the psalm is established and confirmed in Yahusha (Jesus); every promise that went out of Yahuah''s (LORD''s) lips finds its yea and its Amen in the Formed, who does not waver between yea and nay.'),
  ('canon', '2-corinthians', 1, 20, 'canon', 'romans', 15, 8, 'free', E'*Now I say that Yahusha HaMashiach (Jesus Christ) was a minister of the circumcision for the truth of Elohim (God), to confirm the promises made unto the fathers:* (Romans 15:8). Paul writes elsewhere that the Messiah came *to confirm the promises made unto the fathers.* It is the same word he gives to Corinth: *all the promises of Elohim (God) in him are yea, and in him Amen* (2 Corinthians 1:20). The Formed Son does not bring a new and rival set of promises; he confirms the promises made to the fathers of Yashar''el (Israel), and in him they are made yea — the covenant of old established, not abolished.'),
  -- thread: 2-corinthians-1-the-earnest-of-the-spirit-sealed-in-our-hearts-ezekiel-36-ephesians-1
  ('canon', '2-corinthians', 1, 22, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The promised gift of the gathering is the indwelling Spirit that writes obedience into the heart: *I will put my spirit within you, and cause you to walk in my statutes.* Paul says Elohim (God) *hath also sealed us, and given the earnest of the Spirit in our hearts* (2 Corinthians 1:22). The *earnest of the Spirit* is the down-payment of Ezekiel''s promise — the new spirit put within, the first installment of the new-covenant heart that walks in the statutes of Yahuah (LORD).'),
  ('canon', '2-corinthians', 1, 22, 'canon', 'ephesians', 1, 13, 'free', E'*In whom ye also trusted, after that ye heard the word of truth, the gospel of your salvation: in whom also after that ye believed, ye were sealed with that holy Spirit of promise,* (Ephesians 1:13). Paul names the same sealing to the Ephesians: *ye were sealed with that holy Spirit of promise.* To Corinth he writes that Elohim (God) *hath also sealed us, and given the earnest of the Spirit in our hearts* (2 Corinthians 1:22). The seal of the Spirit marks the gathered as the Father''s own; it is the *holy Spirit of promise,* the down-payment of the inheritance, the same earnest given to believing Yashar''el (Israel) and the grafted-in.'),
  ('canon', '2-corinthians', 1, 22, 'canon', 'ephesians', 1, 14, 'free', E'*Which is the earnest of our inheritance until the redemption of the purchased possession, unto the praise of his glory.* (Ephesians 1:14). The Spirit, Paul says, *is the earnest of our inheritance until the redemption of the purchased possession.* This is the very phrase he gives to Corinth: *the earnest of the Spirit in our hearts* (2 Corinthians 1:22). The earnest is a first installment guaranteeing the whole; the indwelling Spirit is the pledge that the inheritance promised to the gathered people will be redeemed in full, unto the praise of the glory of Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-1-the-father-of-mercies-and-the-elohim-of-all-comfort-isaiah-49',
       E'The Father of mercies and the Elohim (God) of all comfort (Isaiah 49; Sirach 2)',
       E'Paul opens his letter with a blessing: *Blessed be Elohim (God), even the Father of our Lord Yahusha HaMashiach (Lord Jesus Christ), the Father of mercies, and the Elohim (God) of all comfort; Who comforteth us in all our tribulation, that we may be able to comfort them which are in any trouble, by the comfort wherewith we ourselves are comforted of Elohim (God)* (2 Corinthians 1:3-4). The God of all comfort is no new God: he is the Yahuah (LORD) of Isaiah, who over his afflicted people cries *Sing, O heavens; and be joyful, O earth; and break forth into singing, O mountains: for Yahuah (LORD) hath comforted his people, and will have mercy upon his afflicted* (Isaiah 49:13). The comfort poured out on the called-out assembly is the same covenant mercy spoken of old over Yashar''el (Israel). The Hebrew library held the same wisdom of affliction: *gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5) — the trouble is a refining, not an abandonment, and the one who is tried is made able to comfort others. And the God who saves in it is *full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction* (Sirach 2:11). So the sufferings of the Messiah abound, and *so our consolation also aboundeth by Messiah (Christ)* (2 Corinthians 1:5); the furnace becomes the school of comfort, the comfort received handed on to all who are in any trouble — the Father of mercies turning every tribulation into the means of mercy to others.',
       sv.verse_id, ev.verse_id, 'extras', 7000
  FROM _s229_2c01_lookup sv, _s229_2c01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-1-the-sentence-of-death-and-elohim-which-raiseth-the-dead-isaiah-26',
       E'The sentence of death and Elohim (God) which raiseth the dead (Isaiah 26)',
       E'Paul tells of an affliction in Asia so crushing that *we were pressed out of measure, above strength, insomuch that we despaired even of life: But we had the sentence of death in ourselves, that we should not trust in ourselves, but in Elohim (God) which raiseth the dead* (2 Corinthians 1:8-9). The despair of life is driven to its only refuge: the God who raises the dead. That refuge is the Tanakh''s own resurrection hope, sung by Isaiah over the dust: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19). The God who answers the sentence of death is the God who makes the dead to live and the earth to cast them out; Paul''s trust off self and onto *Elohim (God) which raiseth the dead* is the same hope Isaiah held — *Who delivered us from so great a death, and doth deliver: in whom we trust that he will yet deliver us* (2 Corinthians 1:10). The resurrection that delivered him in Asia is the pledge of the resurrection at the last.',
       sv.verse_id, ev.verse_id, 'free', 7003
  FROM _s229_2c01_lookup sv, _s229_2c01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-1-all-the-promises-of-god-in-him-are-yea-and-amen-psalm-89-romans-15',
       E'All the promises of Elohim (God) in him are yea, and in him Amen (Psalm 89; Romans 15)',
       E'Against the charge that he wavers between yea and nay, Paul points to the steadfastness of the Formed Son: *For the Son of Elohim (God), Yahusha HaMashiach (Jesus Christ), who was preached among you by us... was not yea and nay, but in him was yea. For all the promises of Elohim (God) in him are yea, and in him Amen, unto the glory of Elohim (God) by us* (2 Corinthians 1:19-20). The promises do not waver because the covenant-word of Yahuah (LORD) does not waver: *My covenant will I not break, nor alter the thing that is gone out of my lips* (Psalm 89:34). What went out of Yahuah''s (LORD''s) lips is unaltered, and in the Formed Son it is established — every promise made yea, sealed with the Amen. This is no new and rival covenant: the Messiah came *to confirm the promises made unto the fathers* (Romans 15:8), the same promises sworn to the fathers of Yashar''el (Israel) now brought to their yea in him. Mark the Christology: the Father is the One whose covenant-word stands; Yahusha (Jesus) is the Formed Son in whom that word is established and Amen, *unto the glory of Elohim (God)* — distinguished from the Father, yet the One in whom all the Father has promised is made sure.',
       sv.verse_id, ev.verse_id, 'free', 7006
  FROM _s229_2c01_lookup sv, _s229_2c01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-1-the-earnest-of-the-spirit-sealed-in-our-hearts-ezekiel-36-ephesians-1',
       E'The earnest of the Spirit sealed in our hearts (Ezekiel 36; Ephesians 1)',
       E'Paul closes the chapter on the seal and the down-payment of the Spirit: *Now he which stablisheth us with you in Messiah (Christ), and hath anointed us, is Elohim (God); Who hath also sealed us, and given the earnest of the Spirit in our hearts* (2 Corinthians 1:21-22). The Father is the One who establishes, anoints, and seals; the *earnest of the Spirit* is the first installment of the promise spoken to the gathered people through Ezekiel: *A new heart also will I give you, and a new spirit will I put within you... And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:26-27). The Spirit given as earnest is the indwelling Spirit of the new covenant, the pledge of the new heart that walks in the statutes of Yahuah (LORD) — not a Spirit that abolishes the commandment but one that writes obedience into the heart. Paul names the same sealing to the Ephesians: *ye were sealed with that holy Spirit of promise, Which is the earnest of our inheritance until the redemption of the purchased possession* (Ephesians 1:13-14). The earnest guarantees the whole; the Spirit in the heart is the Father''s mark upon his own and the down-payment of the inheritance promised to Yashar''el (Israel) and the grafted-in, until the redemption of the purchased possession is brought in full.',
       sv.verse_id, ev.verse_id, 'free', 7009
  FROM _s229_2c01_lookup sv, _s229_2c01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=1 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-1-the-father-of-mercies-and-the-elohim-of-all-comfort-isaiah-49
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:13 — *Yahuah (LORD) hath comforted his people, and will have mercy upon his afflicted* the covenant comfort over Yashar''el (Israel); the same *Father of mercies, and the Elohim (God) of all comfort* (2 Corinthians 1:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c01_lookup sv, _s229_2c01_lookup tv
 WHERE t.slug='2-corinthians-1-the-father-of-mercies-and-the-elohim-of-all-comfort-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 2:11 — *full of compassion and mercy... and saves in time of affliction* the God who delivers in the hour of trouble; *the Father of mercies, and the Elohim (God) of all comfort* (2 Corinthians 1:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c01_lookup sv, _s229_2c01_lookup tv
 WHERE t.slug='2-corinthians-1-the-father-of-mercies-and-the-elohim-of-all-comfort-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 2:5 — *gold is tried in the fire, and acceptable men in the furnace of adversity* the affliction a refining; the tribulation becomes the school of comfort, *that we may be able to comfort them which are in any trouble* (2 Corinthians 1:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c01_lookup sv, _s229_2c01_lookup tv
 WHERE t.slug='2-corinthians-1-the-father-of-mercies-and-the-elohim-of-all-comfort-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-1-the-sentence-of-death-and-elohim-which-raiseth-the-dead-isaiah-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 26:19 — *Thy dead men shall live... the earth shall cast out the dead* the Tanakh resurrection hope; the refuge of *Elohim (God) which raiseth the dead* (2 Corinthians 1:9).'
  FROM cross_reference_threads t, cross_references x, _s229_2c01_lookup sv, _s229_2c01_lookup tv
 WHERE t.slug='2-corinthians-1-the-sentence-of-death-and-elohim-which-raiseth-the-dead-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-1-all-the-promises-of-god-in-him-are-yea-and-amen-psalm-89-romans-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 89:34 — *My covenant will I not break, nor alter the thing that is gone out of my lips* the unaltered covenant-word; established in the Formed, *all the promises of Elohim (God) in him are yea, and in him Amen* (2 Corinthians 1:20).'
  FROM cross_reference_threads t, cross_references x, _s229_2c01_lookup sv, _s229_2c01_lookup tv
 WHERE t.slug='2-corinthians-1-all-the-promises-of-god-in-him-are-yea-and-amen-psalm-89-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 15:8 — *to confirm the promises made unto the fathers* the Messiah confirming, not replacing, the promises to the fathers of Yashar''el (Israel); in him they are *yea, and... Amen* (2 Corinthians 1:20).'
  FROM cross_reference_threads t, cross_references x, _s229_2c01_lookup sv, _s229_2c01_lookup tv
 WHERE t.slug='2-corinthians-1-all-the-promises-of-god-in-him-are-yea-and-amen-psalm-89-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-1-the-earnest-of-the-spirit-sealed-in-our-hearts-ezekiel-36-ephesians-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the promised indwelling Spirit of the gathering; the *earnest of the Spirit in our hearts* (2 Corinthians 1:22).'
  FROM cross_reference_threads t, cross_references x, _s229_2c01_lookup sv, _s229_2c01_lookup tv
 WHERE t.slug='2-corinthians-1-the-earnest-of-the-spirit-sealed-in-our-hearts-ezekiel-36-ephesians-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 1:13 — *ye were sealed with that holy Spirit of promise* the same sealing of the gathered; *hath also sealed us, and given the earnest of the Spirit in our hearts* (2 Corinthians 1:22).'
  FROM cross_reference_threads t, cross_references x, _s229_2c01_lookup sv, _s229_2c01_lookup tv
 WHERE t.slug='2-corinthians-1-the-earnest-of-the-spirit-sealed-in-our-hearts-ezekiel-36-ephesians-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 1:14 — *Which is the earnest of our inheritance until the redemption of the purchased possession* the Spirit the pledge guaranteeing the whole; *the earnest of the Spirit in our hearts* (2 Corinthians 1:22).'
  FROM cross_reference_threads t, cross_references x, _s229_2c01_lookup sv, _s229_2c01_lookup tv
 WHERE t.slug='2-corinthians-1-the-earnest-of-the-spirit-sealed-in-our-hearts-ezekiel-36-ephesians-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
