-- =====================================================================
-- Session 229 — 2 Corinthians FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session229_2corinthians_cross_references.sql
-- =====================================================================

\echo 'session229 — 2 Corinthians cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_2corinthians_02.sql (S229 2 Corinthians 2) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 2 (17 verses).
-- Tag: 2c02 (temp view _s229_2c02_lookup).
-- Sort band: floor 7025, step 3 (7025, 7028, 7031 used; under 7050).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul writes to the same divided, afflicted assembly of called-out ones at Corinth.
-- Chapter 2 is pastoral and allusive — it carries no *as-it-is-written* citation. Two load-bearing
-- pulses: (1) the forgiveness and restoration of the disciplined offender, *lest Satan should get an
-- advantage of us: for we are not ignorant of his devices* (2:11) — the same man and the same
-- adversary of 1 Corinthians 5, now to be received back so the serpent who beguiled Eve cannot devour
-- him with overmuch sorrow; (2) the triumphal procession and the incense-savour, *thanks be unto
-- Elohim (God), which always causeth us to triumph in Messiah, and maketh manifest the savour of his
-- knowledge by us in every place* (2:14), *a sweet savour of Messiah* (2:15) — the knowledge of Yahuah
-- (LORD) that shall fill the earth as the waters cover the sea (Isaiah 11:9, Habakkuk 2:14), and the
-- burnt-offering sweet savour that ascends to Yahuah (LORD) (Genesis 8:21, Exodus 29:18). No
-- replacement theology, no law-vs-grace antithesis. The savour of life and death is the same gospel
-- word working two ways in the saved and the perishing.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   I would not come again to you in heaviness; out of much affliction I wrote with tears
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral; no
--                   load-bearing parallel — the tears are Paul's own, not a quoted text)
--   v.5-11  forgive and comfort the offender, lest he be swallowed up; lest Satan get an advantage
--           Tanakh: Genesis 3:1,13 (the serpent more subtil... the serpent beguiled me — Satan's
--                   devices)   Extras: none warranted (no clean witness adds load here)
--           NT: 1 Corinthians 5:5 (deliver such an one unto Satan... that the spirit may be saved —
--               the SAME offender now restored), Matthew 18:15,21-22 (gain thy brother; forgive until
--               seventy times seven)
--   v.12-13 a door opened at Troas; no rest in my spirit, found not Titus
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (travel narrative;
--                   the open door is real but not a load-bearing quoted root)
--   v.14    God causeth us to triumph in Messiah, maketh manifest the savour of his knowledge in
--           every place
--           Tanakh: Isaiah 11:9 (the earth shall be full of the knowledge of Yahuah), Habakkuk 2:14
--                   (the earth shall be filled with the knowledge of the glory of Yahuah)
--           Extras: none warranted   NT: none warranted (the knowledge-filling root is the Tanakh)
--   v.15-16 a sweet savour of Messiah... savour of death unto death, savour of life unto life
--           Tanakh: Genesis 8:21 (Yahuah smelled a sweet savour), Exodus 29:18 (a sweet savour, an
--                   offering made by fire unto Yahuah)
--           Extras: none warranted   NT: none warranted
--   v.17    we corrupt not the word of God, but as of sincerity speak we in Messiah
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (carried in prose)
--
-- THREADS (slug -> target libraries):
--   7025 2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3   (Tanakh + NT)
--   7028 2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11   (Tanakh)
--   7031 2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8   (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s229_2c02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3
  ('canon', '2-corinthians', 2, 11, 'canon', 'genesis', 3, 1, 'free', E'*Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1). Paul forgives the disciplined offender *lest Satan should get an advantage of us: for we are not ignorant of his devices* (2 Corinthians 2:11). The serpent''s *subtil* questioning of Eden is the oldest of those devices — the adversary works by twisting and by accusation. To leave the penitent man *swallowed up with overmuch sorrow* (2:7) would hand the serpent his advantage; so the assembly is not ignorant of his subtilty, and forgives.'),
  ('canon', '2-corinthians', 2, 11, 'canon', 'genesis', 3, 13, 'free', E'*And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* (Genesis 3:13). *The serpent beguiled me* — the first naming of the adversary''s craft. Paul writes *we are not ignorant of his devices* (2 Corinthians 2:11), and chief among them is this beguiling. The same serpent who deceived Eve would devour the sorrowing offender through despair; the assembly forgives and comforts him *lest perhaps such a one should be swallowed up with overmuch sorrow* (2:7), and so refuses the serpent his prey.'),
  ('canon', '2-corinthians', 2, 6, 'canon', '1-corinthians', 5, 5, 'free', E'*To deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus).* (1 Corinthians 5:5). The discipline Paul commanded in the first letter — *deliver such an one unto Satan... that the spirit may be saved* — has done its work: *Sufficient to such a man is this punishment, which was inflicted of many* (2 Corinthians 2:6). The whole aim was never destruction but salvation; now that the man has repented, the same Paul who handed him over for the destruction of the flesh calls the assembly to *forgive him, and comfort him* (2:7), that the spirit indeed be saved.'),
  ('canon', '2-corinthians', 2, 7, 'canon', 'matthew', 18, 15, 'free', E'*Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother.* (Matthew 18:15). Yahusha (Jesus) made the whole purpose of discipline the gaining of a brother — *thou hast gained thy brother.* Paul walks that same path to its end: the offender has heard, and so the assembly is *contrariwise* to *forgive him, and comfort him... and confirm your love toward him* (2 Corinthians 2:7-8). The trespass that was confronted is now the brother regained.'),
  ('canon', '2-corinthians', 2, 10, 'canon', 'matthew', 18, 21, 'free', E'*Then came Peter to him, and said, Yahuah (Lord), how oft shall my brother sin against me, and I forgive him? till seven times?* (Matthew 18:21). Peter asked the limit of forgiveness; Yahusha (Jesus) answered there is none — *Until seventy times seven* (Matthew 18:22). Paul embodies that boundless forgiving: *To whom ye forgive any thing, I forgive also: for if I forgave any thing, to whom I forgave it, for your sakes forgave I it in the person of Messiah (Christ)* (2 Corinthians 2:10). He forgives not by his own measure but *in the person of Messiah,* who set no limit on the brother forgiven.'),
  -- thread: 2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11
  ('canon', '2-corinthians', 2, 14, 'canon', 'isaiah', 11, 9, 'free', E'*They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* (Isaiah 11:9). Isaiah foresaw the day when *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* Paul says that knowledge is already going forth through the apostles'' ministry: Elohim (God) *maketh manifest the savour of his knowledge by us in every place* (2 Corinthians 2:14). The triumphal procession of the Messiah spreads the fragrance of the knowledge of Yahuah (LORD) — the very knowledge the prophet said would fill the earth — to every place the gospel is carried.'),
  ('canon', '2-corinthians', 2, 14, 'canon', 'habakkuk', 2, 14, 'free', E'*For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea.* (Habakkuk 2:14). Habakkuk repeats the promise: *the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea.* This filling is what Paul names when he gives *thanks be unto Elohim (God), which always causeth us to triumph in Messiah, and maketh manifest the savour of his knowledge by us in every place* (2 Corinthians 2:14). The knowledge of the glory of Yahuah (LORD) that the prophets said would cover the earth is the savour the apostles diffuse — *in every place* the procession of Messiah advances.'),
  -- thread: 2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8
  ('canon', '2-corinthians', 2, 15, 'canon', 'genesis', 8, 21, 'free', E'*And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* (Genesis 8:21). When Noah''s burnt offering ascended, *Yahuah (LORD) smelled a sweet savour* and stayed his judgment. Paul takes up that altar-language for the gospel ministry: *we are unto Elohim (God) a sweet savour of Messiah (Christ), in them that are saved, and in them that perish* (2 Corinthians 2:15). The offering that pleased Yahuah (LORD) and turned away wrath is the figure of Messiah and of those who bear his fragrance into all the world.'),
  ('canon', '2-corinthians', 2, 15, 'canon', 'exodus', 29, 18, 'free', E'*And thou shalt burn the whole ram upon the altar: it is a burnt offering unto Yahuah (LORD): it is a sweet savour, an offering made by fire unto Yahuah (LORD).* (Exodus 29:18). The Torah''s consecration offering is *a sweet savour, an offering made by fire unto Yahuah (LORD).* Paul names the apostolic ministry with the same priestly word: *we are unto Elohim (God) a sweet savour of Messiah (Christ)* (2 Corinthians 2:15). As the ram ascended in fire and was a sweet savour to Yahuah (LORD), so the proclamation of Messiah rises as a fragrance — *to the one we are the savour of death unto death; and to the other the savour of life unto life* (2:16), the one offering smelled two ways.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3',
       E'Forgive and restore the offender, lest Satan get an advantage (Genesis 3, 1 Corinthians 5, Matthew 18)',
       E'The man disciplined in the first letter has repented, and Paul turns the whole assembly to mercy: *Sufficient to such a man is this punishment, which was inflicted of many. So that contrariwise ye ought rather to forgive him, and comfort him, lest perhaps such a one should be swallowed up with overmuch sorrow. Wherefore I beseech you that ye would confirm your love toward him* (2 Corinthians 2:6-8). The discipline he had commanded was never for destruction but for salvation — *To deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus)* (1 Corinthians 5:5) — and now that aim is reached, so the man is received back. Paul forgives without measure and not in his own name: *To whom ye forgive any thing, I forgive also: for if I forgave any thing, to whom I forgave it, for your sakes forgave I it in the person of Messiah (Christ)* (2 Corinthians 2:10). This is the very forgiving Yahusha (Jesus) taught — *if thy brother shall trespass against thee... if he shall hear thee, thou hast gained thy brother* (Matthew 18:15), and when Peter asked how oft, *I say not unto thee, Until seven times: but, Until seventy times seven* (Matthew 18:22). And there is an enemy in the matter: *lest Satan should get an advantage of us: for we are not ignorant of his devices* (2 Corinthians 2:11). The adversary''s craft is as old as the garden — *the serpent was more subtil than any beast of the field* (Genesis 3:1), and *the serpent beguiled me, and I did eat* (Genesis 3:13). To leave a penitent brother drowning in sorrow would hand the serpent the advantage; the assembly is not ignorant of his subtilty, and so it forgives, comforts, and confirms its love, refusing the accuser his prey.',
       sv.verse_id, ev.verse_id, 'free', 7025
  FROM _s229_2c02_lookup sv, _s229_2c02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11',
       E'The savour of his knowledge in every place — the earth full of the knowledge of Yahuah (Isaiah 11, Habakkuk 2)',
       E'Paul breaks into thanksgiving for the spreading gospel: *Now thanks be unto Elohim (God), which always causeth us to triumph in Messiah, and maketh manifest the savour of his knowledge by us in every place* (2 Corinthians 2:14). The image is the triumphal procession with its trail of incense — but the fragrance is *the savour of his knowledge,* carried *in every place.* That knowledge going out to all the earth is exactly what the prophets foretold of the Messiah''s reign. Isaiah, having spoken of the Branch out of Jesse upon whom rests *the spirit of knowledge and of the fear of Yahuah (LORD),* declares: *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). Habakkuk says it again: *For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14). The knowledge the prophets promised would cover the earth like the sea is the very savour the apostles diffuse from place to place; the triumph of Messiah is the filling of the earth with the knowledge of Yahuah (LORD), beginning now through those he leads in his procession.',
       sv.verse_id, ev.verse_id, 'free', 7028
  FROM _s229_2c02_lookup sv, _s229_2c02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8',
       E'A sweet savour of Messiah — the offering made by fire (Genesis 8, Exodus 29)',
       E'Paul presses the incense-figure further: the apostles are not merely the bearers of the savour but are themselves the offering. *For we are unto Elohim (God) a sweet savour of Messiah (Christ), in them that are saved, and in them that perish: To the one we are the savour of death unto death; and to the other the savour of life unto life* (2 Corinthians 2:15-16). The phrase *sweet savour* is the altar-language of the Torah. When Noah''s burnt offering rose, *Yahuah (LORD) smelled a sweet savour* and pledged not to smite all living again (Genesis 8:21); and the consecration of the priests was *a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:18). As the burnt offering ascended in fire and pleased Yahuah (LORD), so the proclamation of Messiah rises as a fragrance before Elohim (God). And as one fire-borne savour, it is smelled two ways: life to those being saved, death to those who perish — not two offerings but one gospel, working according to the heart that receives it. *And who is sufficient for these things?* (2:16) — only those who, *as of sincerity... in the sight of Elohim (God) speak we in Messiah (Christ)* (2:17), do not corrupt the word but offer it pure as a sweet savour unto Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 7031
  FROM _s229_2c02_lookup sv, _s229_2c02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 5:5 — *deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved* the discipline aimed all along at salvation; now *Sufficient to such a man is this punishment* (2 Corinthians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 18:15 — *if he shall hear thee, thou hast gained thy brother* discipline''s whole aim; the assembly is *contrariwise* to *forgive him, and comfort him* (2 Corinthians 2:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 18:21 — *how oft shall my brother sin against me, and I forgive him?* answered *Until seventy times seven*; Paul forgives *in the person of Messiah (Christ)* (2 Corinthians 2:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:1 — *the serpent was more subtil than any beast of the field* the oldest of the adversary''s devices; *we are not ignorant of his devices* (2 Corinthians 2:11).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 3:13 — *the serpent beguiled me, and I did eat* the first naming of his craft; the same beguiler would swallow up the offender *with overmuch sorrow* (2 Corinthians 2:7,11).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:9 — *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* the prophesied filling; manifested *the savour of his knowledge by us in every place* (2 Corinthians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:14 — *the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* the same promise; the triumph in Messiah that *maketh manifest the savour of his knowledge* (2 Corinthians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:21 — *Yahuah (LORD) smelled a sweet savour* the burnt offering that turned away wrath; *we are unto Elohim (God) a sweet savour of Messiah (Christ)* (2 Corinthians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 29:18 — *it is a sweet savour, an offering made by fire unto Yahuah (LORD)* the priestly consecration; the apostolic word rises the same way, *the savour of life unto life* (2 Corinthians 2:15-16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2corinthians_03.sql (S229 2 Corinthians 3) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 3 (18 verses) — THE HIGH-WATCHPOINT CHAPTER of the book.
--   The new-covenant ministry: letter vs spirit, the SAME Torah written on the heart, the veil on Moses.
-- Tag: 2c03 (temp view _s229_2c03_lookup).
-- Sort band: floor 7050, step 3 (7050, 7053, 7056 used; under 7075).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME / WATCHPOINT (the most important guard in the whole book): this chapter is NOT
-- "the Torah is abolished" and NOT "law vs grace." *The letter killeth, but the spirit giveth life*
-- (3:6) means the externally-graven code WITHOUT the new heart — the old administration of Deuteronomy
-- 27-28 that brings the curse on a people who have the commandment graven on stone but a heart of stone
-- (Ezekiel 36:26). The *spirit that gives life* writes the SAME Torah on the heart: Jeremiah 31:33
-- *I will put my law in their inward parts, and write it in their hearts*; Ezekiel 36:26-27 *a new
-- heart... and cause you to walk in my statutes.* The glory of Moses' face (Exodus 34:29-35) was real
-- and from Yahuah; *that which is done away* (3:11) is the fading-glory ministration of condemnation
-- under the old administration, not the commandment of Yahuah; the veil is *upon their heart* in the
-- reading (3:15), not a defect in the Torah. Build the centerpiece thread on Jeremiah 31:33 + Ezekiel
-- 36:26 (+ Exodus 31:18, Proverbs 7:3, Ezekiel 11:19). NEVER render Torah-against-Spirit or
-- letter-against-grace.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   ye are the epistle of Messiah, written not in tables of stone but in fleshy tables of the heart
--           Tanakh: Exodus 31:18 (two tables of stone, written with the finger of Elohim), Jeremiah
--                   31:33 (write it in their hearts), Ezekiel 36:26 (heart of flesh), Ezekiel 11:19
--                   (the stony heart taken away), Proverbs 7:3 (write them upon the table of thine heart)
--           Extras: none warranted (the new-covenant root is wholly canon)   NT: none warranted
--   v.4-6   able ministers of the new testament; the letter killeth, but the spirit giveth life
--           Tanakh: Jeremiah 31:33 (the new covenant, the law written within), Ezekiel 36:27
--                   (the new spirit, caused to walk in the statutes)
--           Extras: none warranted   NT: none warranted (the new-covenant root is the Tanakh promise)
--   v.7-11  the ministration of death written and engraven in stones, the glory done away
--           Tanakh: Exodus 34:29 / 34:30 (the skin of Moses' face shone; they were afraid)
--           Extras: none warranted   NT: none warranted
--   v.12-15 Moses put a vail over his face; the vail is upon their heart in the reading
--           Tanakh: Exodus 34:33 / 34:35 (he put a vail on his face; removed only before Yahuah)
--           Extras: none warranted   NT: none warranted
--   v.16-18 when it shall turn to the Lord the vail is taken away; where the Spirit is, there is liberty;
--           changed from glory to glory
--           Tanakh: Ezekiel 36:27 (cause you to walk in my statutes — the Spirit that gives the liberty),
--                   Jeremiah 31:34 (they shall all know me — the unveiled knowledge), Ezekiel 36:26
--                   (the new heart that transforms from glory to glory)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7050 2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31  (Tanakh)  [CENTERPIECE / BLESSING]
--   7053 2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34          (Tanakh)
--   7056 2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s229_2c03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31  [CENTERPIECE]
  ('canon', '2-corinthians', 3, 3, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). This is the new covenant Paul ministers. When he says the assembly is *the epistle of Messiah (Christ)... written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3), he is naming exactly Jeremiah''s promise: the SAME law, no longer only graven on stone but now *put in their inward parts* and *written in their hearts.* The new place of the writing is the heart, and the One who writes is the Spirit of the living Elohim (God).'),
  ('canon', '2-corinthians', 3, 6, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). Paul is *made... able ministers of the new testament; not of the letter, but of the spirit: for the letter killeth, but the spirit giveth life* (2 Corinthians 3:6). The *spirit that giveth life* is the very thing Jeremiah promised — the law *written in their hearts.* The *letter that killeth* is that same law graven only on stone, an external code without the inward writing — it condemns a people whose heart is unchanged; the law put *in their inward parts* gives life. The Torah is not the death; the death is the commandment on stone without the heart of flesh.'),
  ('canon', '2-corinthians', 3, 3, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). Paul''s *fleshy tables of the heart* (2 Corinthians 3:3) are Ezekiel''s *heart of flesh.* The old administration wrote the commandment on *tables of stone* and met a *stony heart*; the new covenant takes away the stony heart and gives *an heart of flesh* on which the Spirit writes. The *living Elohim (God)* who writes the epistle of Messiah on the heart (3:3) is the One who said *I will take away the stony heart out of your flesh.*'),
  ('canon', '2-corinthians', 3, 6, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). Here is the *spirit* that *giveth life* (2 Corinthians 3:6): Yahuah (LORD) puts his Spirit within his people and *cause[s] you to walk in my statutes.* The Spirit does not abolish the statutes — it writes them on the heart and makes the people keep them and do them. The new covenant Paul ministers is the covenant in which *my spirit* and *my statutes* are joined: the law obeyed from the inside, the letter become life.'),
  ('canon', '2-corinthians', 3, 3, 'canon', 'exodus', 31, 18, 'free', E'*And he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God).* (Exodus 31:18). At Sinai the covenant was *written with the finger of Elohim (God)* on *tables of stone.* Paul sets the new covenant against this very picture: *written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). The same finger of Elohim (God), the same law — but the writing-surface is changed from stone to the living heart. The glory at Sinai was real; the promise is that the writing moves inward.'),
  ('canon', '2-corinthians', 3, 3, 'canon', 'proverbs', 7, 3, 'free', E'*Bind them upon thy fingers, write them upon the table of thine heart.* (Proverbs 7:3). The wisdom-call already knew the goal: the commandments are to be *written upon the table of thine heart.* This is what the Spirit accomplishes in the new covenant — Paul''s *fleshy tables of the heart* (2 Corinthians 3:3) are the very *table of thine heart* on which Proverbs bids the law be written. The same commandments (*keep my commandments, and live; and my law as the apple of thine eye,* Proverbs 7:2) are not erased but inscribed where they were always meant to live.'),
  ('canon', '2-corinthians', 3, 3, 'canon', 'ezekiel', 11, 19, 'free', E'*And I will give them one heart, and I will put a new spirit within you; and I will take the stony heart out of their flesh, and will give them an heart of flesh:* (Ezekiel 11:19). Ezekiel''s earlier promise joins the same gift to the same purpose: *That they may walk in my statutes, and keep mine ordinances, and do them: and they shall be my people, and I will be their Elohim (God)* (Ezekiel 11:20). The *heart of flesh* that replaces *the stony heart* is Paul''s *fleshy tables of the heart* (2 Corinthians 3:3); and its end is not lawlessness but to *walk in my statutes, and keep mine ordinances, and do them.* The new heart is given so the Torah may finally be kept.'),
  -- thread: 2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34
  ('canon', '2-corinthians', 3, 7, 'canon', 'exodus', 34, 29, 'free', E'*And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses'' hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* (Exodus 34:29). The glory on Moses'' face was real and from Yahuah (LORD): *the skin of his face shone* because he had spoken with Yahuah (LORD). Paul grants it fully — *the ministration of death, written and engraven in stones, was glorious, so that the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7). The point is not that the Sinai glory was false but that it was a fading glory; the glory of the ministration of the spirit *exceed[s] in glory* (3:9).'),
  ('canon', '2-corinthians', 3, 7, 'canon', 'exodus', 34, 30, 'free', E'*And when Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him.* (Exodus 34:30). The children of Yashar''el (Israel) *were afraid to come nigh* because of the shining of Moses'' face — they *could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7). The glory was so weighty they could not look on it. Paul names this to set the contrast: under the new covenant *we all, with open face beholding... the glory of Yahuah (Lord), are changed into the same image from glory to glory* (3:18) — no longer afraid, no longer veiled, but transformed by the glory they now behold.'),
  ('canon', '2-corinthians', 3, 13, 'canon', 'exodus', 34, 33, 'free', E'*And till Moses had done speaking with them, he put a vail on his face.* (Exodus 34:33). Moses *put a vail on his face* after speaking the words of Yahuah (LORD) to the people. Paul reads the vail: *And not as Moses, which put a vail over his face, that the children of Yashar''el (Israel) could not stedfastly look to the end of that which is abolished* (2 Corinthians 3:13). The vail belongs to the fading-glory ministration — what is *abolished* is that fading administration of condemnation, not the commandment of Yahuah (LORD); and the vail now lies *upon their heart* (3:15) in the reading, until it is turned to the Lord.'),
  ('canon', '2-corinthians', 3, 13, 'canon', 'exodus', 34, 35, 'free', E'*And the children of Yashar''el (Israel) saw the face of Moses, that the skin of Moses'' face shone: and Moses put the vail upon his face again, until he went in to speak with him.* (Exodus 34:35). Moses unveiled his face *when [he] went in before Yahuah (LORD) to speak with him* (Exodus 34:34) and veiled it again before the people. Paul makes this the figure of the whole reading: the vail remains *in the reading of the old testament; which vail is done away in Messiah (Christ)* (2 Corinthians 3:14), and *when Moses is read, the vail is upon their heart* (3:15) — but *when it shall turn to Yahuah (Lord), the vail shall be taken away* (3:16), as Moses'' own vail came off when he turned in to Yahuah (LORD).'),
  -- thread: 2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36
  ('canon', '2-corinthians', 3, 17, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). *Now Yahuah (Lord) is that Spirit: and where the Spirit of Yahuah (Lord) is, there is liberty* (2 Corinthians 3:17). The liberty is not freedom from the statutes but the Spirit-given freedom to walk in them — exactly Ezekiel''s gift, *my spirit within you,* which *cause[s] you to walk in my statutes.* The Spirit that liberates is the Spirit that writes the law on the heart and makes the people keep the judgments and do them; liberty and obedience are one gift.'),
  ('canon', '2-corinthians', 3, 16, 'canon', 'jeremiah', 31, 34, 'free', E'*And they shall teach no more every man his neighbour, and every man his brother, saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more.* (Jeremiah 31:34). The new covenant promised an unveiled knowing — *they shall all know me, from the least of them unto the greatest.* This is what happens when the vail is removed: *when it shall turn to Yahuah (Lord), the vail shall be taken away* (2 Corinthians 3:16), and the heart sees what was hidden in the reading. The forgiven, Spirit-taught people of Jeremiah''s covenant are the ones who behold *with open face* the glory of Yahuah (Lord) (3:18).'),
  ('canon', '2-corinthians', 3, 18, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). *But we all, with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord)* (2 Corinthians 3:18). The transformation *from glory to glory* is the new heart at work: the *new spirit* Yahuah (LORD) puts within remakes the beholder into the image he beholds. The same Spirit that gives *an heart of flesh* changes the unveiled face into the image of the glory of Yahuah (Lord).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31',
       E'The new covenant written on the heart, not in tables of stone (Jeremiah 31, Ezekiel 36)',
       E'This is the heart of the chapter, and it must not be misread. Paul tells the assembly they are *the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3), and that he and his fellows are *made... able ministers of the new testament; not of the letter, but of the spirit: for the letter killeth, but the spirit giveth life* (2 Corinthians 3:6). This is NOT "the Torah is abolished" and NOT "law against grace." It is precisely the new covenant Yahuah (LORD) promised through Jeremiah: *But this shall be the covenant that I will make with the house of Yashar''el (Israel)... I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The same law — now written in a new place. The *letter that killeth* is that same law graven only on *tables of stone, written with the finger of Elohim (God)* (Exodus 31:18) and met by a *stony heart* — an external code without the inward writing, which can only condemn a people whose heart is unchanged. The *spirit that giveth life* writes that same Torah on the heart: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26), *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The new heart is given so the statutes may finally be kept — Ezekiel had said it before: *I will take the stony heart out of their flesh, and will give them an heart of flesh: That they may walk in my statutes, and keep mine ordinances, and do them* (Ezekiel 11:19-20). And the wisdom-call had named the goal long before: *write them upon the table of thine heart* (Proverbs 7:3). Paul''s *fleshy tables of the heart* are Ezekiel''s *heart of flesh* and Proverbs'' *table of thine heart* — the very surface on which the new covenant inscribes the law. The death is never the commandment of Yahuah (LORD); the death is the commandment on stone without the heart of flesh. The Spirit gives life by writing the SAME Torah within.',
       sv.verse_id, ev.verse_id, 'free', 7050
  FROM _s229_2c03_lookup sv, _s229_2c03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34',
       E'The vail on the face of Moses and the glory that fades (Exodus 34)',
       E'Paul reads the story of Moses'' shining face with care, and he grants the Sinai glory its full weight. When Moses came down from the mount, *the skin of his face shone while he talked with him* (Exodus 34:29) — a real glory, given by Yahuah (LORD) — so that *Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him* (Exodus 34:30). Paul says exactly this: *the ministration of death, written and engraven in stones, was glorious, so that the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7). The Sinai glory was not false — it was a fading glory, *which glory was to be done away.* So *if the ministration of condemnation be glory, much more doth the ministration of righteousness exceed in glory* (3:9). Then the vail: *And till Moses had done speaking with them, he put a vail on his face* (Exodus 34:33), and *the children of Yashar''el (Israel) saw the face of Moses, that the skin of Moses'' face shone: and Moses put the vail upon his face again, until he went in to speak with him* (Exodus 34:35) — taking it off only when he *went in before Yahuah (LORD) to speak with him* (Exodus 34:34). Paul makes the vail the figure of the reading: Moses *put a vail over his face, that the children of Yashar''el (Israel) could not stedfastly look to the end of that which is abolished* (2 Corinthians 3:13). What is *abolished* is the fading-glory ministration of condemnation, not the commandment of Yahuah (LORD); and the vail now lies *upon their heart* (3:15) — until, like Moses turning in to Yahuah (LORD), the heart turns to the Lord and the vail is taken away (3:16).',
       sv.verse_id, ev.verse_id, 'free', 7053
  FROM _s229_2c03_lookup sv, _s229_2c03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36',
       E'When it shall turn to the Lord the vail is taken away, and the Spirit of liberty (Ezekiel 36, Jeremiah 31)',
       E'The chapter ends in glory: *Nevertheless when it shall turn to Yahuah (Lord), the vail shall be taken away. Now Yahuah (Lord) is that Spirit: and where the Spirit of Yahuah (Lord) is, there is liberty. But we all, with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord)* (2 Corinthians 3:16-18). The liberty here is not freedom FROM the statutes; it is the Spirit-given freedom to walk in them — exactly Ezekiel''s promise: *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit that liberates is the Spirit that writes the law on the heart; liberty and obedience are one gift. And the unveiled beholding is the new covenant''s promised knowing: *they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34) — when the vail is taken away, the heart at last sees what was hidden in the reading. Finally, the transformation *from glory to glory* is the new heart at work: *A new heart also will I give you, and a new spirit will I put within you... and I will give you an heart of flesh* (Ezekiel 36:26). The same Spirit that gives the heart of flesh changes the unveiled face into the image of the glory of Yahuah (Lord). This is the new-covenant ministry in its fullness — the SAME Torah, written within, beheld with open face, working its own glory into the beholder.',
       sv.verse_id, ev.verse_id, 'free', 7056
  FROM _s229_2c03_lookup sv, _s229_2c03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the new covenant Paul ministers; the assembly *written... in fleshy tables of the heart* (2 Corinthians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the *spirit that giveth life*; the *letter killeth, but the spirit giveth life* (2 Corinthians 3:6) — the SAME law written within, not abolished.'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *I will take away the stony heart out of your flesh, and I will give you an heart of flesh* Paul''s *fleshy tables of the heart* (2 Corinthians 3:3); the stony heart replaced by flesh.'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the *spirit that giveth life* (2 Corinthians 3:6); the Spirit writes the statutes on the heart, not abolishes them.'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 31:18 — *two tables of testimony, tables of stone, written with the finger of Elohim (God)* the Sinai writing; the new covenant *not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Proverbs 7:3 — *write them upon the table of thine heart* the goal named long before; Paul''s *fleshy tables of the heart* (2 Corinthians 3:3), the law inscribed where it was meant to live.'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Ezekiel 11:19 — *I will take the stony heart out of their flesh, and will give them an heart of flesh* given *that they may walk in my statutes* (Ezekiel 11:20); the *fleshy tables of the heart* so the Torah may be kept (2 Corinthians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:29 — *the skin of his face shone while he talked with him* the real Sinai glory; *the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:30 — *the skin of his face shone; and they were afraid to come nigh him* the glory too weighty to look on; they *could not stedfastly behold the face of Moses* (2 Corinthians 3:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:33 — *Moses... put a vail on his face* the vail Paul reads; Moses *put a vail over his face, that the children of Yashar''el (Israel) could not stedfastly look to the end of that which is abolished* (2 Corinthians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 34:35 — *Moses put the vail upon his face again, until he went in to speak with him* the vail removed only when he turned in to Yahuah (LORD); *when it shall turn to Yahuah (Lord), the vail shall be taken away* (2 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the liberty is freedom to walk in the statutes; *where the Spirit of Yahuah (Lord) is, there is liberty* (2 Corinthians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:34 — *they shall all know me, from the least of them unto the greatest* the unveiled knowing; *when it shall turn to Yahuah (Lord), the vail shall be taken away* (2 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *a new heart... and I will give you an heart of flesh* the new heart that transforms; *changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord)* (2 Corinthians 3:18).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2corinthians_04.sql (S229 2 Corinthians 4) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 4 (18 verses).
-- Tag: 2c04 (temp view _s229_2c04_lookup).
-- Sort band: floor 7075, step 3 (7075, 7078, 7081 used; under 7100).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the same divided, afflicted assembly of called-out ones — Israel and the grafted-in
-- seed gathered at Corinth — to whom Paul ministers the new covenant of Jeremiah 31 and Ezekiel 36,
-- the SAME Torah written now on the heart). Chapter 4 carries the ministry of light: the same Elohim
-- (God) who spoke the first light out of darkness at creation has shined in the heart with the
-- knowledge of his glory in the face of Yahusha HaMashiach (Jesus Christ). The treasure is in earthen
-- vessels — the apostles afflicted on every side yet not destroyed, always bearing about the dying of
-- Yahusha (Jesus) so his life is made manifest. Paul speaks the believing speech of Psalm 116:10
-- ('I believed, therefore have I spoken'), and rests on the resurrection hope: he which raised up the
-- Lord Yahusha shall raise up us also. The Christology is the Formed: Messiah is *the image of Elohim
-- (God)* (4:4), and the knowledge of the glory of Elohim (God) is seen *in the face of Yahusha
-- HaMashiach (Jesus Christ)* (4:6) — the Formed Son who bears the divine glory, not a co-equal-persons
-- grammar and not a mere man. No platonic hope: the unseen-and-eternal of 4:18 is the resurrection
-- weight of glory, not a disembodied escape (the bodily hope is spelled out in ch5). The outward man
-- perishes; the inward man is renewed day by day toward that resurrection.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the ministry received; renouncing the hidden things of dishonesty
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral)
--   v.3-5   the gospel hid; the god of this world hath blinded the minds; Messiah the image of Elohim
--           Tanakh: none warranted (the image/glory weight carried in the v.6 light thread)
--           Extras: none warranted   NT: none warranted
--   v.6     God who commanded the light to shine out of darkness hath shined in our hearts
--           Tanakh: Genesis 1:3 (Let there be light: and there was light), Isaiah 9:2 (the people that
--                   walked in darkness have seen a great light)
--           Extras: none warranted   NT: Matthew 5:16 (let your light so shine before men)
--   v.7-9   this treasure in earthen vessels; troubled, perplexed, persecuted, cast down — not destroyed
--           Tanakh: none warranted (carried in the dying-of-the-Lord thread at v.10-11)
--           Extras: none warranted   NT: none warranted (carried at v.10-11)
--   v.10-12 always bearing about the dying of the Lord Yahusha, that his life be made manifest
--           Tanakh: Psalm 44:22 (for thy sake are we killed all the day long; sheep for the slaughter)
--           Extras: none warranted   NT: Romans 8:36 (for thy sake we are killed all the day long)
--   v.13    I believed, and therefore have I spoken [explicit citation of Psalm 116:10]
--           Tanakh: Psalm 116:10 (I believed, therefore have I spoken: I was greatly afflicted)
--           Extras: none warranted   NT: none warranted (the Tanakh citation is the load-bearing root)
--   v.14    he which raised up the Lord Yahusha shall raise up us also by Yahusha
--           Tanakh: none warranted (the resurrection root carried in the dying-of-the-Lord thread)
--           Extras: none warranted   NT: Romans 8:11 (shall also quicken your mortal bodies),
--                   1 Corinthians 6:14 (Elohim hath raised up the Lord, and will also raise up us)
--   v.15-18 the inward man renewed; the light affliction a weight of glory; the unseen eternal
--           Tanakh: none warranted   Extras: none warranted (Wisdom 9:15 on the perishable body
--                   belongs to ch5''s house-not-made-with-hands, not here)   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7075 2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1  (Tanakh + NT)
--   7078 2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116  (Tanakh)
--   7081 2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s229_2c04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1
  ('canon', '2-corinthians', 4, 6, 'canon', 'genesis', 1, 3, 'free', E'*And Elohim (God) said, Let there be light: and there was light.* (Genesis 1:3). The first word over the dark and formless deep was a word of light: *Let there be light.* Paul reaches all the way back to that creation morning to name what happens in the heart: *For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The same Elohim (God) who *commanded the light to shine out of darkness* at the beginning shines again in the inward man — a new creation by the same creating word. The light that scattered the primal darkness is the light of *the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ),* the Formed Son who is *the image of Elohim (God)* (2 Corinthians 4:4).'),
  ('canon', '2-corinthians', 4, 6, 'canon', 'isaiah', 9, 2, 'free', E'*The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined.* (Isaiah 9:2). Isaiah promised a people in darkness who would see a great light — *upon them hath the light shined.* That promised shining is what Paul declares accomplished in the heart: Elohim (God) *who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The light that dawns on those who *dwell in the land of the shadow of death* is the knowledge of the glory of Elohim (God) shining in the face of the Formed Son; the very thing the god of this world labors to keep hidden, *lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them* (2 Corinthians 4:4).'),
  ('canon', '2-corinthians', 4, 6, 'canon', 'matthew', 5, 16, 'free', E'*Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven.* (Matthew 5:16). Yahusha (Jesus) sends the gathered out as bearers of the light: *Let your light so shine before men.* That light is not their own — it is the light Elohim (God) *hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The creation-light kindled within is meant to shine back out before men, that they may *glorify your Father which is in heaven*; the treasure shines through the earthen vessel so the praise returns to the Father, the One.'),
  -- thread: 2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116
  ('canon', '2-corinthians', 4, 13, 'canon', 'psalms', 116, 10, 'free', E'*I believed, therefore have I spoken: I was greatly afflicted:* (Psalm 116:10). Paul cites the psalmist word for word: *We having the same spirit of faith, according as it is written, I believed, and therefore have I spoken; we also believe, and therefore speak* (2 Corinthians 4:13). The psalmist''s confession joins believing to speaking in the very midst of affliction — *I believed, therefore have I spoken: I was greatly afflicted* — and Paul claims that same spirit of faith for the afflicted ministry he has just described, *troubled on every side... persecuted... cast down* yet not silenced. The one who believes the Elohim (God) that raiseth the dead cannot but speak; the believing speech of the Tanakh is the apostle''s own under the dying he bears about.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- second cross_references batch: the dying-of-the-Lord thread (separate VALUES for clarity)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44
  ('canon', '2-corinthians', 4, 11, 'canon', 'psalms', 44, 22, 'free', E'*Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter.* (Psalm 44:22). The psalmist names the lot of the faithful under affliction: *for thy sake are we killed all the day long; we are counted as sheep for the slaughter.* Paul lives that very word in his ministry: *For we which live are alway delivered unto death for Yahusha''s (Jesus'') sake, that the life also of Yahusha (Jesus) might be made manifest in our mortal flesh* (2 Corinthians 4:11). The daily dying *for thy sake* of the psalm becomes the daily dying *for Yahusha''s (Jesus'') sake* of the apostle — *always bearing about in the body the dying of the Lord Yahusha (Lord Jesus)* (2 Corinthians 4:10) — that the life of Yahusha (Jesus) might be made manifest through the earthen vessel.'),
  ('canon', '2-corinthians', 4, 11, 'canon', 'romans', 8, 36, 'free', E'*As it is written, For thy sake we are killed all the day long; we are accounted as sheep for the slaughter.* (Romans 8:36). To the same assembly''s sister letter Paul quotes the same psalm of the slaughtered faithful — *for thy sake we are killed all the day long* — and there it stands inside the love from which nothing can separate. Here he says he lives it: *For we which live are alway delivered unto death for Yahusha''s (Jesus'') sake, that the life also of Yahusha (Jesus) might be made manifest in our mortal flesh* (2 Corinthians 4:11). The killing all the day long is no defeat but the very means by which the life of Yahusha (Jesus) is shown forth in mortal flesh.'),
  ('canon', '2-corinthians', 4, 14, 'canon', 'romans', 8, 11, 'free', E'*But if the Spirit of him that raised up Yahusha (Jesus) from the dead dwell in you, he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you.* (Romans 8:11). The dying borne about in the body rests on a resurrection certainty: *he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies.* Paul says the same to Corinth: *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you* (2 Corinthians 4:14). The One who raised the Lord will raise his people too — and quicken these same *mortal bodies,* not abandon them; the hope is bodily, the resurrection of the earthen vessel, not a flight from it.'),
  ('canon', '2-corinthians', 4, 14, 'canon', '1-corinthians', 6, 14, 'free', E'*And Elohim (God) hath both raised up Yahuah (Lord), and will also raise up us by his own power.* (1 Corinthians 6:14). In the first letter to this same congregation Paul stated the rule plainly: *Elohim (God) hath both raised up Yahuah (Lord), and will also raise up us by his own power.* He repeats it here as the ground of his courage under the daily dying: *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you* (2 Corinthians 4:14). The raising of the Lord guarantees the raising of his own; this is why the outward man may perish while the inward man is renewed day by day toward *a far more exceeding and eternal weight of glory* (2 Corinthians 4:16-17).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1',
       E'The light to shine out of darkness hath shined in our hearts (Genesis 1, Isaiah 9)',
       E'Against the god of this world who *hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them* (2 Corinthians 4:4), Paul sets the creating word of light: *For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The phrase reaches back to the first morning of creation. Over the dark and formless deep the first word was a word of light: *And Elohim (God) said, Let there be light: and there was light* (Genesis 1:3). The same Elohim (God) who *commanded the light to shine out of darkness* then shines again now — in the heart, a fresh creation by the same word. And it is the light Isaiah promised to a people sitting in darkness: *The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined* (Isaiah 9:2). What dawns is *the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* — the glory of the Father shining in the Formed Son who is *the image of Elohim (God).* And this kindled light is meant to shine outward: Yahusha (Jesus) charged the gathered, *Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* (Matthew 5:16). The creation-light scattered the first darkness; the gospel-light scatters the darkness the god of this world casts over blinded minds; the same light shines through the earthen vessel before men, that the praise return to the Father, the One.',
       sv.verse_id, ev.verse_id, 'free', 7075
  FROM _s229_2c04_lookup sv, _s229_2c04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116',
       E'I believed, and therefore have I spoken — the same spirit of faith (Psalm 116)',
       E'In the midst of his afflicted ministry — *troubled on every side, yet not distressed; we are perplexed, but not in despair; persecuted, but not forsaken; cast down, but not destroyed* (2 Corinthians 4:8-9) — Paul names what holds his tongue open: *We having the same spirit of faith, according as it is written, I believed, and therefore have I spoken; we also believe, and therefore speak* (2 Corinthians 4:13). The citation is the psalmist''s own confession, spoken from the depths of trouble: *I believed, therefore have I spoken: I was greatly afflicted* (Psalm 116:10). That psalm comes out of *the sorrows of death* and *the pains of hell,* and yet the sufferer believes and therefore speaks, vowing to *take the cup of salvation, and call upon the name of Yahuah (LORD).* Paul lays claim to *the same spirit of faith.* Believing and speaking are bound together: the one who believes the Elohim (God) that raiseth the dead cannot keep silent, even when *greatly afflicted.* The apostle who bears about the dying of the Lord speaks the believing speech of the Tanakh, *knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also* (2 Corinthians 4:14) — for that hope is the very thing he believes and therefore speaks.',
       sv.verse_id, ev.verse_id, 'free', 7078
  FROM _s229_2c04_lookup sv, _s229_2c04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44',
       E'Bearing about the dying of the Lord Yahusha, that his life be manifest (Psalm 44, Romans 8)',
       E'The treasure is *in earthen vessels, that the excellency of the power may be of Elohim (God), and not of us* (2 Corinthians 4:7), and the vessel is hard-pressed: *Always bearing about in the body the dying of the Lord Yahusha (Lord Jesus), that the life also of Yahusha (Jesus) might be made manifest in our body. For we which live are alway delivered unto death for Yahusha''s (Jesus'') sake, that the life also of Yahusha (Jesus) might be made manifest in our mortal flesh* (2 Corinthians 4:10-11). This is the lot the psalmist named long before: *Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter* (Psalm 44:22) — the daily dying *for thy sake* that Paul also quotes to this congregation''s sister assembly, *For thy sake we are killed all the day long; we are accounted as sheep for the slaughter* (Romans 8:36), where it stands inside the love from which nothing can separate. The killing all the day long is no defeat: it is the very means by which *the life also of Yahusha (Jesus)* is made manifest in mortal flesh. And it rests on resurrection: *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you* (2 Corinthians 4:14). The same word Paul gave the first letter — *Elohim (God) hath both raised up Yahuah (Lord), and will also raise up us by his own power* (1 Corinthians 6:14) — and the same Spirit-given hope of Romans, *he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* (Romans 8:11). The hope is bodily: the very mortal flesh that bears the dying will be quickened. So the outward man may perish while *the inward man is renewed day by day* (2 Corinthians 4:16) toward *a far more exceeding and eternal weight of glory* (2 Corinthians 4:17).',
       sv.verse_id, ev.verse_id, 'free', 7081
  FROM _s229_2c04_lookup sv, _s229_2c04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:3 — *And Elohim (God) said, Let there be light: and there was light* the first creating word over the darkness; the same Elohim (God) *who commanded the light to shine out of darkness, hath shined in our hearts* (2 Corinthians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:2 — *The people that walked in darkness have seen a great light... upon them hath the light shined* the promised dawning on those in the shadow of death; the light of *the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:16 — *Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* the kindled light shining outward; the heart-light Elohim (God) *hath shined in our hearts* shines back before men to the Father''s glory (2 Corinthians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-the-light-to-shine-out-of-darkness-hath-shined-in-our-hearts-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 116:10 — *I believed, therefore have I spoken: I was greatly afflicted* the believing speech out of the depths; Paul claims *the same spirit of faith, according as it is written, I believed, and therefore have I spoken* (2 Corinthians 4:13).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-i-believed-and-therefore-have-i-spoken-the-same-spirit-of-faith-psalm-116'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=116 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:22 — *for thy sake are we killed all the day long; we are counted as sheep for the slaughter* the daily dying of the faithful; *we which live are alway delivered unto death for Yahusha''s (Jesus'') sake, that the life also of Yahusha (Jesus) might be made manifest* (2 Corinthians 4:11).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:36 — *For thy sake we are killed all the day long; we are accounted as sheep for the slaughter* the same Psalm 44 quoted to the sister assembly inside the love nothing can separate; the killing all day long the means *the life also of Yahusha (Jesus) might be made manifest in our mortal flesh* (2 Corinthians 4:11).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:11 — *he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* the bodily resurrection hope; *he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus)* (2 Corinthians 4:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 6:14 — *Elohim (God) hath both raised up Yahuah (Lord), and will also raise up us by his own power* the same rule from the first letter to this congregation; *he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also* (2 Corinthians 4:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c04_lookup sv, _s229_2c04_lookup tv
 WHERE t.slug='2-corinthians-4-bearing-about-the-dying-of-the-lord-yahusha-that-his-life-be-manifest-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2corinthians_05.sql (S229 2 Corinthians 5) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 5 (21 verses) — the house not made with hands, the new creature/new
--   creation, the ministry of reconciliation. WATCHPOINT chapter.
-- Tag: 2c05 (temp view _s229_2c05_lookup).
-- Sort band: floor 7100, step 3 (7100, 7103, 7106, 7109 used; under 7125).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME. The *house not made with hands, eternal in the heavens* (5:1) and the longing
-- *not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of
-- life* (5:4) are the BODILY resurrection hope — NOT a disembodied/platonic escape from the body.
-- Paul does not want to be UNCLOTHED (stripped of the body) but CLOTHED UPON (the mortal swallowed
-- by life) — the same hope as Isaiah 25:8 (*he will swallow up death in victory*) and 1 Corinthians
-- 15:53-54 (*this mortal must put on immortality... Death is swallowed up in victory*). Wisdom 9:15
-- (*the corruptible body presseth down the soul*) names the present groaning that 5:4 answers — it
-- is weighed as an extras witness to the burden, NOT as a platonic flight from the body; Paul's
-- answer is resurrection, the mortal clothed upon. The *new creature / new creation* (5:17) is the
-- prophets' renewal: Isaiah 43:18-19 (*behold, I will do a new thing*) and Isaiah 65:17 (*I create
-- new heavens and a new earth*); the new creature walks in the renewed obedience the prophets
-- promised, not a lawless liberty. The *ministry of reconciliation* (5:18-19) is the same
-- reconciliation Romans names — Elohim reconciling enemies by the death of his Son. *He hath made
-- him to be sin for us, who knew no sin* (5:21) is the Isaiah 53 servant who *bore their iniquities*
-- (Christology: the Formed Son who knew no sin, on whom Yahuah laid the iniquity of us all). No
-- replacement theology, no law-vs-grace antithesis, no platonic hope.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   earthly house dissolved / house not made with hands / mortality swallowed up of life /
--           the earnest of the Spirit
--           Tanakh: Isaiah 25:8 (he will swallow up death in victory); Ezekiel 36:27 (the earnest of
--                   the Spirit / I will put my spirit within you) — carried in prose at v.5, the
--                   load-bearing root is Isaiah 25:8
--           Extras: Wisdom 9:15 (the corruptible body presseth down the soul — the groaning 5:4
--                   answers; VERIFIED clean by dump_canon)
--           NT: 1 Corinthians 15:53-54 (this mortal must put on immortality... Death is swallowed up
--               in victory — the same Isaiah 25 hope, same congregation)
--   v.6-10  we walk by faith not by sight / present with the Lord / the judgment seat of Messiah
--           Tanakh: none warranted (allusive; faith-walk root carried elsewhere in the book)
--           Extras: none warranted   NT: none warranted (the bodily-hope weight sits at v.1-4)
--   v.11-16 the love of Messiah constraineth / one died for all / know no man after the flesh
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral/allusive)
--   v.17    if any man be in Messiah he is a new creature: behold all things are become new
--           Tanakh: Isaiah 43:18-19 (behold, I will do a new thing); Isaiah 65:17 (I create new
--                   heavens and a new earth)
--           Extras: none warranted   NT: none warranted (the new-creation root is the Tanakh witness)
--   v.18-20 the ministry/word of reconciliation / Elohim reconciling the world / ambassadors
--           Tanakh: none warranted   Extras: none warranted
--           NT: Romans 5:10-11 (when we were enemies, we were reconciled to Elohim by the death of
--               his Son... received the atonement)
--   v.21    he hath made him to be sin for us, who knew no sin
--           Tanakh: Isaiah 53:6 (Yahuah hath laid on him the iniquity of us all); 53:9 (he had done
--                   no violence, neither was any deceit in his mouth — who knew no sin); 53:11 (by his
--                   knowledge shall my righteous servant justify many; for he shall bear their
--                   iniquities)
--           Extras: none warranted   NT: none warranted (the servant-Christology root is Isaiah 53)
--
-- THREADS (slug -> target libraries):
--   7100 2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25  (Tanakh + Extras + NT)
--   7103 2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43  (Tanakh)
--   7106 2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5  (NT)
--   7109 2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s229_2c05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25
  ('canon', '2-corinthians', 5, 4, 'canon', 'isaiah', 25, 8, 'free', E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* (Isaiah 25:8). Paul''s groaning is not a wish to be rid of the body but to have it overtaken by life: *not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of life* (2 Corinthians 5:4). The word is Isaiah''s own — Yahuah (LORD) *will swallow up death in victory.* The hope is bodily: the mortal not stripped away but swallowed by the life Yahuah (LORD) gives, the tears wiped from every face. This is resurrection, not escape.'),
  ('canon', '2-corinthians', 5, 4, 'canon', '1-corinthians', 15, 54, 'free', E'*So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory.* (1 Corinthians 15:54). To the same assembly Paul had already named the hope in the same words: *this mortal must put on immortality,* and so *Death is swallowed up in victory* — Isaiah 25:8 again. It answers exactly the longing of *that mortality might be swallowed up of life* (2 Corinthians 5:4): not the soul fleeing an evil body, but *this* mortal putting on incorruption, *clothed upon* with the building of Elohim (God) that is *an house not made with hands, eternal in the heavens* (2 Corinthians 5:1).'),
  ('canon', '2-corinthians', 5, 4, 'apocrypha', 'the-wisdom-of-solomon', 9, 15, 'extras', E'*For the corruptible body presseth down the soul, and the earthy tabernacle weigheth down the mind that museth upon many things.* (Wisdom of Solomon 9:15). The wisdom of Solomon names the present burden of the perishable body — the *corruptible body* that *presseth down,* the *earthy tabernacle* that *weigheth down.* This is the very groaning Paul owns: *we that are in this tabernacle do groan, being burdened* (2 Corinthians 5:4). But Paul does not answer the burden with a platonic flight from the flesh — he answers it with resurrection: *not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of life.* The earthy tabernacle is not despised and abandoned; it is *clothed upon* with the house from heaven.'),
  -- thread: 2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43
  ('canon', '2-corinthians', 5, 17, 'canon', 'isaiah', 43, 19, 'free', E'*Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert.* (Isaiah 43:19). When Paul writes *if any man be in Messiah (Christ), he is a new creature: old things are passed away; behold, all things are become new* (2 Corinthians 5:17), he speaks the prophet''s own promise. Yahuah (LORD) said *Behold, I will do a new thing,* and bid Yashar''el (Israel) *Remember ye not the former things, neither consider the things of old* (Isaiah 43:18) — the very pattern of *old things are passed away; behold, all things are become new.* The new creature is the springing-forth of the new thing Yahuah (LORD) promised, the way made in the wilderness for his people.'),
  ('canon', '2-corinthians', 5, 17, 'canon', 'isaiah', 65, 17, 'free', E'*For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* (Isaiah 65:17). The new creature in Messiah (Christ) is the firstfruit of the whole new creation Yahuah (LORD) promised: *I create new heavens and a new earth: and the former shall not be remembered.* Paul echoes the prophet exactly — *old things are passed away; behold, all things are become new* (2 Corinthians 5:17). The renewal of the man who is in Messiah (Christ) and the renewal of heaven and earth are one work of the one Creator; the former things not remembered, all things become new.'),
  -- thread: 2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5
  ('canon', '2-corinthians', 5, 19, 'canon', 'romans', 5, 10, 'free', E'*For if, when we were enemies, we were reconciled to Elohim (God) by the death of his Son, much more, being reconciled, we shall be saved by his life.* (Romans 5:10). Paul tells the Romans the same reconciliation he ministers to Corinth: *when we were enemies, we were reconciled to Elohim (God) by the death of his Son.* It is the work of *the ministry of reconciliation* (2 Corinthians 5:18) — *that Elohim (God) was in Messiah (Christ), reconciling the world unto himself, not imputing their trespasses unto them* (2 Corinthians 5:19). Reconciliation is from Elohim (God)''s side, while we were yet enemies; the not-imputing of trespasses at Corinth is the being-reconciled-by-his-death at Rome.'),
  ('canon', '2-corinthians', 5, 20, 'canon', 'romans', 5, 11, 'free', E'*And not only so, but we also joy in Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ), by whom we have now received the atonement.* (Romans 5:11). The atonement *received* in Romans is the reconciliation Paul pleads in his embassy: *Now then we are ambassadors for Messiah (Christ), as though Elohim (God) did beseech you by us: we pray you in Messiah''s (Christ''s) stead, be ye reconciled to Elohim (God)* (2 Corinthians 5:20). The same atonement, the same Lord Yahusha HaMashiach (Lord Jesus Christ) through whom it comes — at Rome it is joy already received, at Corinth it is the appeal still pressed: be ye reconciled.'),
  -- thread: 2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53
  ('canon', '2-corinthians', 5, 21, 'canon', 'isaiah', 53, 6, 'free', E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all.* (Isaiah 53:6). *He hath made him to be sin for us, who knew no sin* (2 Corinthians 5:21) is the servant of Isaiah on whom *Yahuah (LORD) hath laid... the iniquity of us all.* The one *made... to be sin* did not become a sinner — he bore what was laid on him; the iniquity of the straying sheep was set upon the Formed Son who himself *knew no sin,* that *we might be made the righteousness of Elohim (God) in him.*'),
  ('canon', '2-corinthians', 5, 21, 'canon', 'isaiah', 53, 9, 'free', E'*And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* (Isaiah 53:9). The one who *knew no sin* (2 Corinthians 5:21) is the servant of whom Isaiah testifies *he had done no violence, neither was any deceit in his mouth.* This is the Christology of the Formed Son: sinless himself, *made... to be sin for us* — numbered with the wicked though guiltless, that the righteousness of Elohim (God) might be ours in him.'),
  ('canon', '2-corinthians', 5, 21, 'canon', 'isaiah', 53, 11, 'free', E'*He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* (Isaiah 53:11). The exchange of 2 Corinthians 5:21 — *made him to be sin for us... that we might be made the righteousness of Elohim (God) in him* — is the work of Isaiah''s righteous servant who *shall justify many; for he shall bear their iniquities.* He bears the iniquities; the many are justified; the righteous servant makes the unrighteous the righteousness of Elohim (God). The bearing and the justifying are the two sides of the one cross.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25',
       E'The house not made with hands: mortality swallowed up of life (Isaiah 25)',
       E'*For we know that if our earthly house of this tabernacle were dissolved, we have a building of Elohim (God), an house not made with hands, eternal in the heavens* (2 Corinthians 5:1). The hope is not a soul escaping an evil body — it is bodily. Paul is careful: *For in this we groan, earnestly desiring to be clothed upon with our house which is from heaven... not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of life* (2 Corinthians 5:2,4). He does not long to be UNCLOTHED, stripped of the body, but CLOTHED UPON — the mortal overtaken by life. The word *swallowed up* is the prophet''s: *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces... for Yahuah (LORD) hath spoken it* (Isaiah 25:8). Death itself is swallowed; the tears are wiped from every face. To the same assembly Paul had already spoken the same hope in the same words: *this corruptible must put on incorruption, and this mortal must put on immortality... then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:53-54). The present burden is real — the Hebrew library names it: *the corruptible body presseth down the soul, and the earthy tabernacle weigheth down the mind* (Wisdom of Solomon 9:15), and Paul owns it, *we that are in this tabernacle do groan, being burdened.* But the answer to the pressing-down body is not flight from it; it is resurrection — the earthy tabernacle *clothed upon* with the building of Elohim (God), the mortal swallowed up of life. And the pledge of it is already given: *he that hath wrought us for the selfsame thing is Elohim (God), who also hath given unto us the earnest of the Spirit* (2 Corinthians 5:5) — the down-payment of the body to come.',
       sv.verse_id, ev.verse_id, 'extras', 7100
  FROM _s229_2c05_lookup sv, _s229_2c05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43',
       E'A new creature: behold, all things are become new (Isaiah 43, 65)',
       E'*Therefore if any man be in Messiah (Christ), he is a new creature: old things are passed away; behold, all things are become new* (2 Corinthians 5:17). The new creature is no novelty Paul invented — it is the prophets'' promised renewal breaking into a man. Yahuah (LORD) said through Isaiah, *Remember ye not the former things, neither consider the things of old. Behold, I will do a new thing; now it shall spring forth* (Isaiah 43:18-19) — the very shape of *old things are passed away; behold, all things are become new.* And the new thing is no less than a new creation: *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* (Isaiah 65:17). The renewal of the one who is in Messiah (Christ) is the firstfruit of that whole new creation; the former things not remembered in the man are the former things not remembered in the cosmos. This new creature is not loosed from the renewed obedience the prophets promised — the same Spirit that makes him new writes the law on his heart and causes him to walk in the statutes (Ezekiel 36:26-27). The new creation is the springing-forth of the new thing Yahuah (LORD) spoke; the man in Messiah (Christ) is where it begins.',
       sv.verse_id, ev.verse_id, 'free', 7103
  FROM _s229_2c05_lookup sv, _s229_2c05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=5 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5',
       E'The ministry of reconciliation: be ye reconciled to Elohim (God) (Romans 5)',
       E'*And all things are of Elohim (God), who hath reconciled us to himself by Yahusha HaMashiach (Jesus Christ), and hath given to us the ministry of reconciliation; To wit, that Elohim (God) was in Messiah (Christ), reconciling the world unto himself, not imputing their trespasses unto them; and hath committed unto us the word of reconciliation* (2 Corinthians 5:18-19). The reconciliation is wholly from Elohim (God)''s side, and Paul names it to the Romans in the same breath: *if, when we were enemies, we were reconciled to Elohim (God) by the death of his Son, much more, being reconciled, we shall be saved by his life* (Romans 5:10). We were enemies; Elohim (God) reconciled us by the death of his Son; the trespasses are not imputed. And the thing the Romans have already received is the thing Paul still pleads at Corinth: *we also joy in Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ), by whom we have now received the atonement* (Romans 5:11). So the apostle takes up his embassy: *Now then we are ambassadors for Messiah (Christ), as though Elohim (God) did beseech you by us: we pray you in Messiah''s (Christ''s) stead, be ye reconciled to Elohim (God)* (2 Corinthians 5:20). The atonement received at Rome is the reconciliation pressed at Corinth — one work of the one Elohim (God), through the one Lord Yahusha HaMashiach (Lord Jesus Christ), the Formed Son by whose death the enemies are brought near.',
       sv.verse_id, ev.verse_id, 'free', 7106
  FROM _s229_2c05_lookup sv, _s229_2c05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53',
       E'He made him to be sin who knew no sin: the servant of Isaiah 53',
       E'*For he hath made him to be sin for us, who knew no sin; that we might be made the righteousness of Elohim (God) in him* (2 Corinthians 5:21). The whole verse is the servant-song of Isaiah 53 in a sentence. The one *made... to be sin* did not become a sinner — he bore what was laid upon him: *All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). And the one who bore it *knew no sin,* for of the servant Isaiah testified *he had done no violence, neither was any deceit in his mouth* (Isaiah 53:9). The exchange — our sin laid on him, his righteousness made ours — is the servant''s own work: *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). He bears the iniquities; the many are justified; the sinless one is made sin that the sinners might be made *the righteousness of Elohim (God) in him.* This is the Christology of the Formed Son: not a guilty man, but the spotless servant on whom Yahuah (LORD) laid the iniquity of us all, that we might stand righteous in him.',
       sv.verse_id, ev.verse_id, 'free', 7109
  FROM _s229_2c05_lookup sv, _s229_2c05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 25:8 — *He will swallow up death in victory... will wipe away tears from off all faces* the bodily hope behind *that mortality might be swallowed up of life* (2 Corinthians 5:4); the mortal overtaken by life, not the soul escaping the body.'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:54 — *this mortal must put on immortality... Death is swallowed up in victory* the same Isaiah 25 hope spoken to the same assembly; this mortal clothed upon, not unclothed (2 Corinthians 5:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 9:15 — *the corruptible body presseth down the soul, and the earthy tabernacle weigheth down the mind* names the present groaning of *we that are in this tabernacle do groan, being burdened* (2 Corinthians 5:4) — answered not by escape but by the body clothed upon.'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:19 — *Behold, I will do a new thing; now it shall spring forth* the prophet''s promise behind *behold, all things are become new* (2 Corinthians 5:17); the new creature is the springing-forth of the new thing Yahuah (LORD) spoke.'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:17 — *I create new heavens and a new earth: and the former shall not be remembered* the whole new creation whose firstfruit is the man in Messiah (Christ): *old things are passed away; behold, all things are become new* (2 Corinthians 5:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:10 — *when we were enemies, we were reconciled to Elohim (God) by the death of his Son* the same reconciliation Paul ministers: *Elohim (God) was in Messiah (Christ), reconciling the world unto himself, not imputing their trespasses* (2 Corinthians 5:19).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:11 — *we have now received the atonement* through *our Lord Yahusha HaMashiach (Lord Jesus Christ)*; the atonement received at Rome is the reconciliation pleaded at Corinth: *be ye reconciled to Elohim (God)* (2 Corinthians 5:20).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:6 — *Yahuah (LORD) hath laid on him the iniquity of us all* the servant bore what was laid on him; *he hath made him to be sin for us, who knew no sin* (2 Corinthians 5:21).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:9 — *he had done no violence, neither was any deceit in his mouth* the sinless servant, the One *who knew no sin* yet *made... to be sin for us* (2 Corinthians 5:21).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:11 — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* the exchange of *that we might be made the righteousness of Elohim (God) in him* (2 Corinthians 5:21); he bears, the many are justified.'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2corinthians_06.sql (S229 2 Corinthians 6) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 6 (18 verses) — COME OUT AND BE SEPARATE / the temple of
--   the living Elohim (God) — a HIGH-WATCHPOINT / BLESSING chapter (the gathering/separation).
-- Tag: 2c06 (temp view _s229_2c06_lookup).
-- Sort band: floor 7125, step 3 (7125, 7128, 7131 used; under 7150). One sort_order per thread.
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: 2 Corinthians 6:14-18 is the GATHERING/SEPARATION of the covenant people —
-- the regathered, separated Yashar'el (Israel) and the grafted-in seed, the temple of the living
-- Elohim (God) — NOT a new institution replacing Israel. The centerpiece weaves a Tanakh catena:
-- *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my
-- people* (6:16) re-speaks the covenant-presence promise of Leviticus 26:11-12 (*I will set my
-- tabernacle among you... and I will walk among you, and will be your Elohim*) and Ezekiel 37:27
-- (*My tabernacle also shall be with them... and they shall be my people*) — the new-covenant
-- regathering of the two sticks made one. *Come out from among them, and be ye separate... touch
-- not the unclean thing* (6:17) re-speaks Isaiah 52:11 (*touch no unclean thing; go ye out of the
-- midst of her... ye that bear the vessels of Yahuah*) and Ezekiel 20:34 (*I will bring you out
-- from the people, and will gather you out of the countries*). *I will be a Father unto you, and ye
-- shall be my sons and daughters* (6:18) re-speaks the Davidic adoption of 2 Samuel 7:14 (*I will
-- be his father, and he shall be my son*) widened to all the regathered by Isaiah 43:6 (*bring my
-- sons from far, and my daughters from the ends of the earth*). And 6:2 (*now is the accepted time;
-- behold, now is the day of salvation*) cites Isaiah 49:8 (*In an acceptable time have I heard thee,
-- and in a day of salvation have I helped thee*). Sacred names are quoted EXACTLY as dump_canon
-- returns them; in the 6:17-18 catena the pull gives *Yahuah (Lord)* for the cited YHWH text.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   now is the accepted time, the day of salvation
--           Tanakh: Isaiah 49:8 (in an acceptable time have I heard thee, and in a day of salvation)
--           Extras: none warranted   NT: none warranted (the citation IS the Tanakh root)
--   v.3-10  the ministers' endurance catalogue (afflictions, stripes, as poor yet making many rich)
--           Tanakh: none warranted (a pastoral self-commendation, no load-bearing single root)
--           Extras: none warranted   NT: none warranted
--   v.11-13 our heart is enlarged, be ye also enlarged
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.14-15 be ye not unequally yoked; what communion hath light with darkness; Messiah with Belial
--           Tanakh: Leviticus 26:1 (make you no idols... I am Yahuah Elohaychem); Deuteronomy roots
--                   allusive only — built on the no-idols separation of Leviticus 26:1 with the
--                   light/darkness contrast as the lead-in to the catena
--           Extras: none warranted   NT: none warranted (held in the separation thread)
--   v.16    the temple of the living Elohim; I will dwell in them and walk in them; they my people
--           Tanakh: Leviticus 26:11-12 (I will set my tabernacle among you... and walk among you),
--                   Ezekiel 37:27 (my tabernacle also shall be with them; they shall be my people)
--           Extras: none warranted   NT: none warranted (the citation IS the Tanakh root)
--   v.17    come out from among them, be ye separate, touch not the unclean thing
--           Tanakh: Isaiah 52:11 (touch no unclean thing; go ye out of the midst of her),
--                   Ezekiel 20:34 (I will bring you out from the people, and gather you)
--           Extras: none warranted   NT: none warranted
--   v.18    I will be a Father unto you, ye shall be my sons and daughters
--           Tanakh: 2 Samuel 7:14 (I will be his father, and he shall be my son),
--                   Isaiah 43:6 (bring my sons from far, and my daughters from the ends of the earth)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7125 2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26  (Tanakh)  [BLESSING CENTERPIECE]
--   7128 2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49  (Tanakh)
--   7131 2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s229_2c06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26  [BLESSING CENTERPIECE]
  ('canon', '2-corinthians', 6, 16, 'canon', 'leviticus', 26, 11, 'free', E'*And I will set my tabernacle among you: and my soul shall not abhor you.* (Leviticus 26:11). When Paul says *ye are the temple of the living Elohim (God); as Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16), he is citing Yahuah''s (LORD''s) own covenant-presence promise to Yashar''el (Israel). The promise *I will set my tabernacle among you* is not retired; it is the very word the apostle hears fulfilled in the gathered, separated people who are now the dwelling-place of the living Elohim (God). The temple is not exchanged for another people — it is the covenant of Sinai brought to its purpose.'),
  ('canon', '2-corinthians', 6, 16, 'canon', 'leviticus', 26, 12, 'free', E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people.* (Leviticus 26:12). This is the sentence Paul quotes almost word for word: *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16). The *I will walk among you* of Leviticus becomes *walk in them*; the *ye shall be my people* stands unchanged. The indwelling-and-walking presence promised to Yashar''el (Israel) in the land is the presence dwelling now in the regathered congregation — the same covenant formula, *I will be their Elohim (God), and they shall be my people,* that runs from Sinai to the consummation.'),
  ('canon', '2-corinthians', 6, 16, 'canon', 'ezekiel', 37, 27, 'free', E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people.* (Ezekiel 37:27). The same promise Paul cites is spoken by Ezekiel over the regathering of the two sticks made one — Yahudah (Judah) and Yashar''el (Israel) joined, *one nation in the land* under *one shepherd.* When Paul names the assembly *the temple of the living Elohim (God)* in whom Yahuah (LORD) says *I will dwell in them... and they shall be my people* (2 Corinthians 6:16), he is announcing that this new-covenant regathering has come: the tabernacle promised to the reunited house is set among the called-out at Corinth — the gathering, not the replacement, of Yashar''el (Israel).'),
  ('canon', '2-corinthians', 6, 17, 'canon', 'isaiah', 52, 11, 'free', E'*Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD).* (Isaiah 52:11). Paul''s *come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17) is this very word to the captives. Isaiah called the people to go out from Babylon clean, *that bear the vessels of Yahuah (LORD)* — set apart to carry the holy things. The apostle hears the same summons sounding over the assembly: the separated people are the ones who bear the vessels, the temple-bearers called out of all uncleanness to be received by Yahuah (LORD).'),
  ('canon', '2-corinthians', 6, 17, 'canon', 'ezekiel', 20, 34, 'free', E'*And I will bring you out from the people, and will gather you out of the countries wherein ye are scattered, with a mighty hand, and with a stretched out arm, and with fury poured out.* (Ezekiel 20:34). The *come out from among them, and be ye separate* of 2 Corinthians 6:17 is the regathering Yahuah (LORD) promised through Ezekiel: *I will bring you out from the people, and will gather you out of the countries.* The separation Paul commands is not a withdrawal into a new sect but obedience to the gathering hand of Yahuah (LORD) — the scattered brought out from the nations, purged of the rebels, *I will receive you* answering *I will bring you out.*'),
  ('canon', '2-corinthians', 6, 18, 'canon', '2-samuel', 7, 14, 'free', E'*I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men, and with the stripes of the children of men:* (2 Samuel 7:14). Paul''s closing word of the catena, *And will be a Father unto you, and ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* (2 Corinthians 6:18), widens the Davidic adoption Yahuah (LORD) spoke to David''s seed: *I will be his father, and he shall be my son.* The sonship promised to the throne of David is extended to the whole separated people — the regathered made sons and daughters of the Almighty, the household of the One who said he would build David an house for ever.'),
  ('canon', '2-corinthians', 6, 18, 'canon', 'isaiah', 43, 6, 'free', E'*I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* (Isaiah 43:6). The *sons and daughters* of 2 Corinthians 6:18 are the very sons and daughters Yahuah (LORD) promised to regather: *bring my sons from far, and my daughters from the ends of the earth.* Paul''s *ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* gathers up the scattered children Isaiah saw brought home from the four winds — *every one that is called by my name: for I have created him for my glory.* The Father-and-children promise is the promise of the ingathering, the separated people received as the sons and daughters of the living Elohim (God).'),
  -- thread: 2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49
  ('canon', '2-corinthians', 6, 2, 'canon', 'isaiah', 49, 8, 'free', E'*Thus saith Yahuah (LORD), In an acceptable time have I heard thee, and in a day of salvation have I helped thee: and I will preserve thee, and give thee for a covenant of the people, to establish the earth, to cause to inherit the desolate heritages;* (Isaiah 49:8). Paul cites this verse outright: *(For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.)* (2 Corinthians 6:2). The *acceptable time* and *day of salvation* are the appointed season of Yahuah''s (LORD''s) Servant — the One *given for a covenant of the people* to restore the desolate heritages and bring the prisoners out. Paul announces that the appointed day has dawned: *now is the accepted time,* the season of the covenant-Servant''s saving work, the call not to receive the grace of Elohim (God) in vain.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- A second small INSERT for the third thread (Leviticus 26:1 idols; reuses the catena's Isaiah 52:11 row is avoided — distinct target).
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26
  ('canon', '2-corinthians', 6, 14, 'canon', 'leviticus', 26, 1, 'free', E'*Ye shall make you no idols nor graven image, neither rear you up a standing image, neither shall ye set up any image of stone in your land, to bow down unto it: for I am Yahuah Elohaychem (the LORD your God).* (Leviticus 26:1). The chapter whose covenant-presence promise Paul cites at v.16 opens with this very command of separation from idols. Paul''s *Be ye not unequally yoked together with unbelievers... what agreement hath the temple of Elohim (God) with idols?* (2 Corinthians 6:14,16) is the same line drawn at the head of Leviticus 26: the people in whom Yahuah (LORD) sets his tabernacle are the people who set up no idols. The *no concord... with Belial,* *no communion of light with darkness,* is the holiness that flows straight from *I am Yahuah Elohaychem (the LORD your God).*'),
  ('canon', '2-corinthians', 6, 16, 'canon', 'leviticus', 26, 1, 'free', E'*Ye shall make you no idols nor graven image... for I am Yahuah Elohaychem (the LORD your God).* (Leviticus 26:1). When Paul asks *what agreement hath the temple of Elohim (God) with idols? for ye are the temple of the living Elohim (God)* (2 Corinthians 6:16), he sets the indwelling promise of Leviticus 26:11-12 against the idol-prohibition of Leviticus 26:1 — the two ends of the same chapter. The dwelling of Yahuah (LORD) among his people and the casting-out of every idol are one covenant: the temple of the living Elohim (God) can hold no graven image, and the separated people bow to none but *Yahuah Elohaychem (the LORD your God).*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26',
       E'I will dwell in them — the temple of the living Elohim (God): come out and be separate (Leviticus 26, Ezekiel 37, Isaiah 52, 2 Samuel 7)',
       E'At the heart of the chapter Paul gathers a Tanakh catena into one call: *And what agreement hath the temple of Elohim (God) with idols? for ye are the temple of the living Elohim (God); as Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people. Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you, And will be a Father unto you, and ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* (2 Corinthians 6:16-18). Every clause is a quoted promise to Yashar''el (Israel), and reading them together shows what Paul means: this is the regathered, separated covenant people — the temple of the living Elohim (God) — NOT a new institution replacing Israel. The indwelling word is Yahuah''s (LORD''s) own covenant-presence promise: *And I will set my tabernacle among you... And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:11-12), and again over the regathering of the two sticks made one, *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27). The *I will walk among you* of Sinai becomes *walk in them*; the covenant formula *they shall be my people* stands unchanged. The come-out word is Isaiah''s summons to the captives: *Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* (Isaiah 52:11) — the separated people are the temple-bearers, called out clean to carry the holy things — joined to Ezekiel''s regathering, *I will bring you out from the people, and will gather you out of the countries wherein ye are scattered* (Ezekiel 20:34). The *separation* Paul commands is not withdrawal into a sect but obedience to the gathering hand of Yahuah (LORD): *I will bring you out* answered by *I will receive you.* And the closing adoption widens the Davidic promise to the whole people: *I will be his father, and he shall be my son* (2 Samuel 7:14), the sonship of David''s seed, spread to all the regathered as Isaiah foresaw — *bring my sons from far, and my daughters from the ends of the earth* (Isaiah 43:6), *every one that is called by my name.* So the come-out-and-be-separate is the gathering/separation of the one covenant people: dwelt-in by the living Elohim (God), called clean out of the nations, made sons and daughters of *Yahuah (Lord) Almighty.* This is the consummation of Sinai and the prophets, not their abolition; the temple of the living Elohim (God) is Yashar''el (Israel) and the grafted-in seed brought home.',
       sv.verse_id, ev.verse_id, 'free', 7125
  FROM _s229_2c06_lookup sv, _s229_2c06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=6 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49',
       E'Now is the accepted time, now is the day of salvation (Isaiah 49)',
       E'Paul opens the chapter pleading that the assembly *receive not the grace of Elohim (God) in vain,* and grounds the urgency in a quoted prophecy: *(For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.)* (2 Corinthians 6:2). The verse he cites is Yahuah''s (LORD''s) word to his Servant: *Thus saith Yahuah (LORD), In an acceptable time have I heard thee, and in a day of salvation have I helped thee: and I will preserve thee, and give thee for a covenant of the people, to establish the earth, to cause to inherit the desolate heritages* (Isaiah 49:8). The *acceptable time* and *day of salvation* are the appointed season of the covenant-Servant — the One given *for a covenant of the people,* sent to say to the prisoners *Go forth,* to restore the preserved of Yashar''el (Israel) and be *a light to the Gentiles... my salvation unto the end of the earth.* Paul announces that this appointed day has dawned: *behold, now is the accepted time.* The season Isaiah foretold is present, the Servant''s saving work is at hand, and therefore the grace of Elohim (God) is not to be received in vain.',
       sv.verse_id, ev.verse_id, 'free', 7128
  FROM _s229_2c06_lookup sv, _s229_2c06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26',
       E'What communion hath light with darkness — the unequal yoke and the no-idols of the covenant (Leviticus 26)',
       E'Before the come-out catena Paul draws the line of separation in a string of contrasts: *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness? And what concord hath Messiah (Christ) with Belial?... And what agreement hath the temple of Elohim (God) with idols?* (2 Corinthians 6:14-16). The chapter whose covenant-presence promise he is about to cite opens with this very command: *Ye shall make you no idols nor graven image, neither rear you up a standing image, neither shall ye set up any image of stone in your land, to bow down unto it: for I am Yahuah Elohaychem (the LORD your God)* (Leviticus 26:1). The two ends of Leviticus 26 are the two halves of Paul''s thought: the people in whom Yahuah (LORD) sets his tabernacle (Leviticus 26:11-12) are the people who set up no idols (Leviticus 26:1). The *no concord with Belial,* the *no communion of light with darkness,* is not a new asceticism but the old holiness — the temple of the living Elohim (God) can hold no graven image, and the separated people bow to none but *Yahuah Elohaychem (the LORD your God).* The unequal yoke is forbidden because the dwelling of Yahuah (LORD) among his people and the casting-out of every idol are one and the same covenant.',
       sv.verse_id, ev.verse_id, 'free', 7131
  FROM _s229_2c06_lookup sv, _s229_2c06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:11 — *I will set my tabernacle among you: and my soul shall not abhor you* the covenant-presence promise; *ye are the temple of the living Elohim (God)... I will dwell in them* (2 Corinthians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:12 — *I will walk among you, and will be your Elohim (God), and ye shall be my people* quoted almost word for word: *walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:27 — *My tabernacle also shall be with them... and they shall be my people* the same promise over the two sticks made one; the temple-presence in the regathered congregation (2 Corinthians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 52:11 — *touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* the summons to the captives; *come out from among them, and be ye separate... touch not the unclean thing* (2 Corinthians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 20:34 — *I will bring you out from the people, and will gather you out of the countries wherein ye are scattered* the regathering; *I will receive you* answers *I will bring you out* (2 Corinthians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Samuel 7:14 — *I will be his father, and he shall be my son* the Davidic adoption; widened to the separated people, *I will be a Father unto you, and ye shall be my sons and daughters* (2 Corinthians 6:18).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Isaiah 43:6 — *bring my sons from far, and my daughters from the ends of the earth* the ingathering of the scattered children; *ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* (2 Corinthians 6:18).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-i-will-dwell-in-them-the-temple-of-the-living-god-come-out-and-be-separate-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:8 — *In an acceptable time have I heard thee, and in a day of salvation have I helped thee... give thee for a covenant of the people* the Servant''s appointed season; cited outright, *behold, now is the accepted time; behold, now is the day of salvation* (2 Corinthians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-now-is-the-accepted-time-the-day-of-salvation-isaiah-49'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:1 — *Ye shall make you no idols nor graven image... for I am Yahuah Elohaychem (the LORD your God)* the no-idols command opening the chapter; *Be ye not unequally yoked... what communion hath light with darkness?* (2 Corinthians 6:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:1 — *Ye shall make you no idols... for I am Yahuah Elohaychem (the LORD your God)* set against the indwelling promise of the same chapter; *what agreement hath the temple of Elohim (God) with idols? for ye are the temple of the living Elohim (God)* (2 Corinthians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c06_lookup sv, _s229_2c06_lookup tv
 WHERE t.slug='2-corinthians-6-what-communion-hath-light-with-darkness-the-unequal-yoke-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2corinthians_07.sql (S229 2 Corinthians 7) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 7 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 7 (16 verses) — godly sorrow worketh repentance; perfecting holiness.
-- Tag: 2c07 (temp view _s229_2c07_lookup).
-- Sort band: floor 7150, step 3 (7150, 7153 used; under 7175). One sort_order per thread.
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME — this is a pastoral chapter, and a thin one for parallels. 7:1 *let us cleanse
-- ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of Elohim
-- (God)* flows straight out of the 6:16-18 indwelling/separation promises — *I will dwell in them,
-- and walk in them... be ye separate.* Having those promises, the called-out people answer the
-- Leviticus holiness call: *ye shall be holy; for I am holy* (Leviticus 11:44-45, 19:2, 20:26). The
-- fear of Elohim (God) in which holiness is perfected is the very fear of Yahuah (God) the restored
-- library names as the heart's preparation (Sirach 2:17, 1:14). Then 7:9-11 unfolds the two sorrows:
-- *godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world
-- worketh death* (7:10) — the turning-of-the-heart the prophets called Yashar'el (Israel) to: the
-- broken and contrite heart Elohim (God) will not despise (Psalm 51:17), the rent heart and the
-- turning unto Yahuah (LORD) (Joel 2:12-13), the contrite spirit that trembleth at his word (Isaiah
-- 66:2), and the repentance shewn in the time of sins (Sirach 18:21). Two curated threads; the
-- comfort/Titus narrative (vv.2-8,12-16) is pastoral report with no load-bearing root — none warranted.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     having these promises, cleanse ourselves... perfecting holiness in the fear of Elohim (God)
--           Tanakh: Leviticus 11:44, 11:45, 19:2, 20:26 (be ye holy, for I am holy)
--           Extras: Sirach 2:17 (they that fear Yahuah will prepare their hearts, and humble their
--                   souls), Sirach 1:14 (to fear Yahuah is the beginning of wisdom)
--           NT: none warranted (the holiness-call root is the Leviticus catena)
--   v.2-8   receive us... comforted by the coming of Titus... made you sorry with a letter
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (pastoral narrative — Paul's defense and the report of Titus; no load-bearing parallel)
--   v.9-11  ye sorrowed to repentance; godly sorrow worketh repentance to salvation; the sorrow of
--           the world worketh death
--           Tanakh: Psalm 51:17 (a broken and a contrite heart), Joel 2:12 (turn ye even to me with
--                   all your heart... with weeping, and with mourning), Joel 2:13 (rend your heart...
--                   and turn unto Yahuah Elohaychem), Isaiah 66:2 (poor and of a contrite spirit, and
--                   trembleth at my word)
--           Extras: Sirach 18:21 (in the time of sins shew repentance)
--           NT: none warranted (the godly-sorrow root is the Tanakh repentance call)
--   v.12-16 our care for you... comforted in your comfort... the joy of Titus... confidence in you
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (pastoral close — Paul's confidence and Titus' refreshment; no parallel)
--
-- THREADS (slug -> target libraries):
--   7150 2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11  (Tanakh + Extras)
--   7153 2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51  (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s229_2c07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11
  ('canon', '2-corinthians', 7, 1, 'canon', 'leviticus', 11, 44, 'free', E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth.* (Leviticus 11:44). The holiness Paul calls for is the holiness Yahuah (LORD) commanded at Sinai — *ye shall be holy; for I am holy.* Having the indwelling promise of 6:16-18, the called-out people *cleanse ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1). The cleansing and the holiness are not new commandments but the old call answered: the people in whom Elohim (God) dwells *sanctify yourselves, and ye shall be holy,* for he who walks among them is holy.'),
  ('canon', '2-corinthians', 7, 1, 'canon', 'leviticus', 11, 45, 'free', E'*For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy.* (Leviticus 11:45). The ground of the holiness call is that Yahuah (LORD) made himself their Elohim (God) — *to be your Elohim (God): ye shall therefore be holy.* This is the very promise Paul has just rehearsed, *I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16); so *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1) is the indwelt people becoming what their indwelling God is. Because *I am holy,* his redeemed are to *be holy.*'),
  ('canon', '2-corinthians', 7, 1, 'canon', 'leviticus', 19, 2, 'free', E'*Speak unto all the congregation of the children of Yashar''el (Israel), and say unto them, Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy.* (Leviticus 19:2). The whole congregation of Yashar''el (Israel) is summoned to holiness on one ground — *for I Yahuah Elohaychem (the LORD your God) am holy.* Paul speaks the same word to the gathered assembly: *let us cleanse ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1). The Corinthian assembly is that congregation called to *be holy,* the holiness of the covenant people grounded in the holiness of their God.'),
  ('canon', '2-corinthians', 7, 1, 'canon', 'leviticus', 20, 26, 'free', E'*And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* (Leviticus 20:26). Holiness and separation are one word: Yahuah (LORD) *severed you from other people, that ye should be mine,* and therefore *ye shall be holy unto me.* This is exactly the movement of Paul''s plea — out of the *come out from among them, and be ye separate* of 6:17 flows *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1). The severed, separated people *that ye should be mine* are the same called-out ones cleansing themselves *from all filthiness of the flesh and spirit,* holy because their God is holy.'),
  ('canon', '2-corinthians', 7, 1, 'apocrypha', 'ecclesiasticus', 2, 17, 'extras', E'*They that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight,* (Sirach 2:17). The restored library knows the *fear of Elohim (God)* in which holiness is perfected as the heart''s own preparation: *they that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight.* This is the inward work behind Paul''s *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1) — the cleansing *from all filthiness of the flesh and spirit* is a prepared heart and a humbled soul before the One who dwells among his people. The fear of Yahuah (God) is not dread but the reverent self-cleansing of those who would be holy unto him.'),
  ('canon', '2-corinthians', 7, 1, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* (Sirach 1:14). The library roots all true wisdom in the fear Paul names — *to fear Yahuah (God) is the beginning of wisdom.* When Paul bids the assembly *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1), he sets the whole pursuit of holiness in that beginning: the reverence of the indwelling God is the soil in which a clean and sanctified life grows. The fear of Yahuah (God), the first thing and the deepest thing, is the very fear in which the called-out people cleanse themselves and are made holy.'),
  -- thread: 2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51
  ('canon', '2-corinthians', 7, 10, 'canon', 'psalms', 51, 17, 'free', E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* (Psalm 51:17). David''s repentance names the godly sorrow Paul commends: not a sacrifice of beasts but *a broken and a contrite heart,* which *thou wilt not despise.* Paul rejoices that the Corinthians *sorrowed to repentance,* for *godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:9-10). The broken spirit Elohim (God) receives is the godly sorrow that works repentance unto salvation — the heart turned toward him, not the world''s remorse that ends in death.'),
  ('canon', '2-corinthians', 7, 10, 'canon', 'joel', 2, 12, 'free', E'*Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* (Joel 2:12). Yahuah (LORD) calls his people to the very sorrow that turns: *turn ye even to me with all your heart, and with... weeping, and with mourning.* This is *godly sorrow* — the weeping and mourning that move the heart back to him — and it *worketh repentance to salvation not to be repented of* (2 Corinthians 7:10). Paul saw it in the Corinthians'' *mourning* and *earnest desire* (7:7); the sorrow that turns the whole heart to Yahuah (LORD) is the sorrow unto life, not the sorrow of the world that *worketh death.*'),
  ('canon', '2-corinthians', 7, 10, 'canon', 'joel', 2, 13, 'free', E'*And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* (Joel 2:13). True repentance is inward — *rend your heart, and not your garments,* and *turn unto Yahuah Elohaychem (the LORD your God).* This is the difference between the two sorrows Paul sets side by side: *godly sorrow worketh repentance to salvation... but the sorrow of the world worketh death* (2 Corinthians 7:10). The rent heart that turns to the gracious and merciful Yahuah (LORD) is the godly sorrow; mere outward grief, the rent garment without the rent heart, is the world''s sorrow that ends in death.'),
  ('canon', '2-corinthians', 7, 10, 'canon', 'isaiah', 66, 2, 'free', E'*For all those things hath mine hand made, and all those things have been, saith Yahuah (LORD): but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* (Isaiah 66:2). Yahuah (LORD) looks upon one man — *him that is poor and of a contrite spirit, and trembleth at my word.* The contrite spirit that trembles at his word is the *godly sorrow* that *worketh repentance to salvation* (2 Corinthians 7:10), and it is of a piece with the *fear of Elohim (God)* in which the same chapter calls the people to perfect holiness (7:1). The trembling, contrite heart upon which Yahuah (LORD) sets his eye is the heart Paul rejoices to see in the Corinthians — sorrow that draws near to God, not the world''s grief that drives toward death.'),
  ('canon', '2-corinthians', 7, 10, 'apocrypha', 'ecclesiasticus', 18, 21, 'extras', E'*Humble thyself before you be sick, and in the time of sins shew repentance.* (Sirach 18:21). The restored library counsels the very thing Paul commends — *in the time of sins shew repentance,* and *humble thyself.* This is the godly sorrow that does not wait, the turning of the heart in the day of wrongdoing: *godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:10). The humbled soul that shews repentance in the time of its sins is the soul that sorrows unto life; the unhumbled grief of the world is the sorrow that works death.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11',
       E'Perfecting holiness in the fear of Elohim (God) — be ye holy, for I am holy (Leviticus 11)',
       E'*Having therefore these promises, dearly beloved, let us cleanse ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1). The *promises* are the ones just rehearsed — *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (6:16), *come out from among them, and be ye separate* (6:17). Out of the indwelling and the separation flows the holiness; and the holiness Paul calls for is not a new commandment but the old Sinai word answered. Four times Yahuah (LORD) grounds the call on his own holiness: *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44); *I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy* (Leviticus 11:45); *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2); and the holiness that is also separation — *ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). The very logic of 6:16-7:1 is there in Leviticus: he is their Elohim (God), he has severed them to be his own, therefore they are to be holy as he is holy. And the *fear of Elohim (God)* in which holiness is perfected is the fear the restored library names as the heart''s own preparation: *they that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight* (Sirach 2:17), for *to fear Yahuah (God) is the beginning of wisdom* (Sirach 1:14). The cleansing *from all filthiness of the flesh and spirit* is a prepared heart and a humbled soul; the holiness is the indwelt, separated people becoming what their indwelling God is. This is not Torah set aside but Torah''s holiness call brought to its purpose in the people in whom Elohim (God) now dwells.',
       sv.verse_id, ev.verse_id, 'extras', 7150
  FROM _s229_2c07_lookup sv, _s229_2c07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51',
       E'Godly sorrow worketh repentance — the broken and contrite heart that turns to Yahuah (Psalm 51, Joel 2)',
       E'Paul rejoices not that the Corinthians grieved but that *ye sorrowed to repentance: for ye were made sorry after a godly manner* (2 Corinthians 7:9), and he draws the line between two sorrows: *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (7:10). The godly sorrow is the broken heart the prophets and the psalmist knew. David, after his sin, learned that *the sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17) — the sorrow that God receives is the contrite heart, not the spilt blood of beasts. Yahuah (LORD) calls his people into that same sorrow that turns: *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12), and presses it inward — *rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful* (Joel 2:13). There is the whole distinction: the rent heart that turns to the merciful Yahuah (LORD) is godly sorrow unto salvation; the rent garment without the rent heart, the mere remorse of the world, *worketh death.* It is the contrite spirit upon whom Yahuah (LORD) sets his eye — *to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2) — the same trembling reverence as the *fear of Elohim (God)* of 7:1. And the restored library urges the turning without delay: *Humble thyself before you be sick, and in the time of sins shew repentance* (Sirach 18:21). The Corinthians'' *mourning,* their *fear,* their *vehement desire* (7:7,11) are this godly sorrow — the heart broken and turned to God, the sorrow that works life, not the world''s grief that ends in death.',
       sv.verse_id, ev.verse_id, 'extras', 7153
  FROM _s229_2c07_lookup sv, _s229_2c07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=7 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:44 — *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* the Sinai holiness call grounded in God''s own holiness; *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:45 — *to be your Elohim (God): ye shall therefore be holy, for I am holy* the same ground Paul rehearsed (*I will be their Elohim,* 6:16); the indwelt people becoming what their God is (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:2 — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* the whole congregation of Yashar''el (Israel) summoned to holiness; the gathered assembly cleansing itself (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 20:26 — *ye shall be holy unto me... and have severed you from other people, that ye should be mine* holiness as separation, the very movement of 6:17 into 7:1 (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 2:17 — *they that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight* the inward work behind *the fear of Elohim (God)* in which holiness is perfected (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 1:14 — *to fear Yahuah (God) is the beginning of wisdom* the reverence that is the soil of holiness; *perfecting holiness in the fear of Elohim (God)* (2 Corinthians 7:1).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-perfecting-holiness-in-the-fear-of-elohim-be-ye-holy-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 51:17 — *a broken and a contrite heart, O Elohim (God), thou wilt not despise* the sorrow God receives; *godly sorrow worketh repentance to salvation* (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:12 — *turn ye even to me with all your heart, and with... weeping, and with mourning* the sorrow that turns; the *mourning* Paul saw working repentance unto salvation (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:13 — *rend your heart, and not your garments, and turn unto Yahuah Elohaychem* the rent heart that turns is godly sorrow; the rent garment alone is the world''s sorrow that *worketh death* (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 66:2 — *him that is poor and of a contrite spirit, and trembleth at my word* the contrite, trembling heart God looks upon; the same reverence as the *fear of Elohim* of 7:1 (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 18:21 — *Humble thyself before you be sick, and in the time of sins shew repentance* the turning without delay; the godly sorrow that works life, not the world''s grief unto death (2 Corinthians 7:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c07_lookup sv, _s229_2c07_lookup tv
 WHERE t.slug='2-corinthians-7-godly-sorrow-worketh-repentance-the-broken-and-contrite-heart-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session229 — 2 Corinthians cross-references complete.'
