-- =====================================================================
-- S212 — Luke 5-8 extras-library (outside-canon) cross-references
-- =====================================================================
-- Range:  Luke 5, 6, 7, 8
-- Tag:    l0508  (temp view _s212_l0508_lookup)
-- Sort band: 3430-3459
--
-- Adds the MISSING outside-canon (extras-tier) cross-references for
-- Luke 5-8. The session185 Luke canon migration carries canon->canon
-- threads only (zero extras-edition targets); Luke 5 & 6 had no canon
-- threads of their own and Luke 6's tree/fruit and builders rows in
-- session185 only PARALLEL-POINT (via thread-tag) into the existing
-- Matt-anchored Sirach threads without ever linking the Luke verses to
-- the actual Sirach extras verses. This fragment promotes those into
-- real edition-aware member rows, and adds two new framework-bearing
-- Luke-anchored extras threads (the sower and the Legion).
--
-- NEW threads created here (slug -> target editions):
--   1. luke-8-the-word-sown-and-the-law-bringing-fruit-in-2-esdras
--        (sort 3430) -> apocrypha (2 Esdras)
--   2. luke-8-legion-into-the-deep-and-the-spirits-of-the-giants-bound-
--      in-the-place-of-condemnation-in-1-enoch-and-jubilees
--        (sort 3431) -> enoch (1 Enoch), jubilees (Jubilees)
--
-- COMPLEMENTED (no new thread — members appended to EXISTING Matt-
-- anchored threads so the Luke verses gain real extras rows):
--   - by-their-fruits-and-the-utterance-of-the-heart-in-sirach
--       Luke 6:43, 6:44 -> apocrypha Sirach 27:6
--   - wise-and-foolish-builders-and-the-heart-stablished-in-sirach
--       Luke 6:48, 6:49 -> apocrypha Sirach 22:16, 22:18
--   (ON CONFLICT (slug) DO NOTHING on the safety re-insert of those
--    two threads; the canonical definitions live in S137.)
--
-- Chapters with NO extras add (and why):
--   - Luke 5 (miraculous catch / fishers of men, the leper, the
--     paralytic forgiven, calling of Levi, new wine in new bottles):
--     the framework-bearing weight here (the Son-of-Adam authority to
--     forgive sins, the fishers-of-men gathering, the new-wine/new-
--     bottle covenant-renewal) lands on canon (Daniel 7, Jeremiah 31,
--     Jeremiah 16:16 fishers) and on the EXISTING Matt-anchored extras
--     thread `new-wine-and-the-old-friend-inverse-in-sirach` (Sirach
--     9:10). No NET-NEW framework-bearing extras connection for Luke 5
--     at the rigour the migration requires that is not already carried
--     by canon or by an existing thread.
--   - Luke 7 centurion (vv.2-10): INDIVIDUAL-MERCY case (Red Line #7).
--     The centurion receives mercy WITHOUT absorption into the seed of
--     promise — the contrast-case that proves the directional non-
--     symmetry, NOT a Gentile-inclusion paradigm. This is already
--     carried by the existing thread `nazareth-scroll-the-acceptable-
--     year-stopped-mid-verse-and-the-individual-mercy-contrast-cases`.
--     No extras add; the framework note is the load-bearing content and
--     it lives on the canon thread. (The Nain raising and the sinful
--     woman in Luke 7 already carry canon threads in S185.)
--
-- Editions used: canon (source), apocrypha (2 Esdras, Sirach/
-- Ecclesiasticus), enoch (1 Enoch), jubilees (Jubilees). Historical-
-- witness texts excluded per the one-way rule.
--
-- Every member-note quotes its verse in full, in italics, with the
-- citation in parentheses (come-and-see). Sacred Names restored in the
-- quoted text; son of man -> Son of Adam. Idempotent: ON CONFLICT
-- DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (uniquely named for this tag).
CREATE TEMP VIEW _s212_l0508_lookup AS
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
-- Insert extras-tier cross_references rows (source is always the canon
-- Luke verse; target is the extras verse).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- Thread 1: luke-8-the-word-sown-and-the-law-bringing-fruit-in-2-esdras
  ('canon', 'luke', 8, 11, 'apocrypha', '2-esdras', 9, 31,
   E'*For, behold, I sow my law in you, and it shall bring fruit in you, and you shall be honoured in it for ever.* (2 Esdras 9:31) The Hebrew library names the seed as the law (the word) of Yahuah (God) sown INTO the hearer to bring fruit — the precise architecture Luke 8:11 names: *Now the parable is this: The seed is the word of Elohim (God).* The sower does not sow grain into ground only; the Father sows His word-law into the heart, and the bringing-forth-of-fruit is the heart''s keeping of what was sown. The wisdom-apocalyptic stream had named the word-sown-to-bring-fruit register before the King spoke the parable.'),
  ('canon', 'luke', 8, 13, 'apocrypha', '2-esdras', 8, 41,
   E'*For as the husbandman sows much seed upon the ground, and planteth many trees, and yet the thing that is sown good in his season comes not up, neither does all that is planted take root: even so is it of them that are sown in the world; they shall not all be saved.* (2 Esdras 8:41) The Hebrew library names the not-all-the-seed-takes-root architecture explicitly — the husbandman sows much, but not all comes up. Luke 8:13''s rock-ground hearers — *which for a while believe, and in time of temptation fall away* — walk the same architecture: the seed sprang up but had no root, and what has no root does not endure. The wisdom-apocalyptic stream had named the no-root failure as the not-all-saved diagnostic before the parable named it in the King''s own grammar.'),
  ('canon', 'luke', 8, 15, 'apocrypha', '2-esdras', 9, 33,
   E'*Yet they that received it perished, because they kept not the thing that was sown in them.* (2 Esdras 9:33) The Hebrew library names the keeping-of-the-sown-word as the dividing line — those who received the law-seed but kept it not perished. Luke 8:15''s good-ground hearers are the inverse: *that on the good ground are they, which in an honest and good heart, having heard the word, keep it, and bring forth fruit with patience.* The fruit is the keeping; the perishing is the not-keeping. The wisdom-apocalyptic stream named the keep-it-or-perish architecture that Luke 8:15 lands as the good-ground verdict.')

  ,

  -- Thread 2: luke-8-legion-into-the-deep-and-the-spirits-of-the-giants-bound-in-the-place-of-condemnation-in-1-enoch-and-jubilees
  ('canon', 'luke', 8, 29, 'enoch', '1-enoch', 15, 8,
   E'*As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling.* (1 Enoch 15:8) The Hebrew library names the demon-origin and earth-dwelling architecture: the unclean spirits are the earthbound spirits born of the giants, the offspring of the Watcher-rebellion of Genesis 6. Luke 8:29''s unclean spirit — the one that *oftentimes had caught him* and drove the man *into the wilderness* — is an earth-dwelling spirit of exactly the order 1 Enoch names. The library carried the demon-origin diagnostic for centuries; the King''s casting-out at Luke 8 walks the same architecture.'),
  ('canon', 'luke', 8, 31, 'enoch', '1-enoch', 15, 11,
   E'*From the days of the slaughter and destruction and death of the giants, from the souls of whose flesh the spirits, having gone forth, shall destroy without incurring judgement—thus shall they destroy until the day of the consummation, the great judgement in which the age shall be consummated, over the Watchers and the godless, yea, shall be wholly consummated.* (1 Enoch 15:11) The Hebrew library names the appointed-consummation the spirits operate under — they destroy until the great judgement, and they fear its premature arrival. Luke 8:31''s Legion *besought him that he would not command them to go out into the deep* — the abussos, the place of confinement appointed against the day of consummation. The spirits beg to be spared the very binding 1 Enoch names as appointed; the King''s arrival is the appointed authority they dread.'),
  ('canon', 'luke', 8, 28, 'enoch', '1-enoch', 16, 1,
   E'*And from the beginning thus have I been shown concerning you, and written concerning you.* (1 Enoch 16:1) The Hebrew library names the written-from-the-beginning judgment-sentence on the spirits of the giants — the verdict is already recorded, the day is already appointed. Luke 8:28''s demoniac cries *What have I to do with thee, Yahusha (Jesus), thou Son of Elohim (God) most high? I beseech thee, torment me not* — the spirits recognize the King and recognize that the torment written-from-the-beginning has drawn near in His presence. The library named the recorded-sentence; the gospel shows the spirits trembling before the One who holds it.'),
  ('canon', 'luke', 8, 31, 'jubilees', 'jubilees', 10, 5,
   E'*And You know how Your Watchers, the fathers of these spirits, acted in my day: and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant.* (Jubilees 10:5) The Hebrew library names the place of condemnation into which the spirits are imprisoned and held fast — Noach''s (Noah''s) prayer asks the Father to bind them there. Luke 8:31''s Legion *besought him that he would not command them to go out into the deep* — the deep is the place of condemnation Jubilees names. The spirits beg the King not to send them to the binding the library had already named as their appointed end. The Father alone exercises dominion over them (Jubilees 10:6); the King exercises it in flesh at Luke 8.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l0508_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_l0508_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- COMPLEMENT rows: Luke 6 tree/fruit and builders -> Sirach extras.
-- These attach to the EXISTING Matt-anchored Sirach threads (defined in
-- S137); the rows below give the Luke verses real edition-aware extras
-- targets the S185 parallel-pointers never created.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'luke', 6, 43, 'apocrypha', 'ecclesiasticus', 27, 6,
   E'*The fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* (Sirach 27:6) The Hebrew library names the fruit-declares-the-tree / utterance-declares-the-heart architecture directly. Luke 6:43-45 walks the same: *for a good tree bringeth not forth corrupt fruit; neither doth a corrupt tree bring forth good fruit ... for of the abundance of the heart his mouth speaketh.* The fruit is the tree''s utterance; the mouth is the heart''s. The wisdom-stream named the diagnostic before the King bound it.'),
  ('canon', 'luke', 6, 44, 'apocrypha', 'ecclesiasticus', 27, 6,
   E'*The fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* (Sirach 27:6) Luke 6:44 names the fruit-test as the means of knowing: *for every tree is known by his own fruit. For of thorns men do not gather figs, nor of a bramble bush gather they grapes.* The Hebrew library''s Sirach 27:6 names the same architecture — the fruit declares the husbandry, the utterance declares the heart. The tree is known by what it brings forth; the heart by what its mouth speaks.'),
  ('canon', 'luke', 6, 48, 'apocrypha', 'ecclesiasticus', 22, 16,
   E'*As timber girt and bound together in a building cannot be loosed with shaking: so the heart that is stablished by advised counsel shall fear at no time.* (Sirach 22:16) The Hebrew library names the heart-stablished-by-counsel architecture as the building that cannot be shaken. Luke 6:48 names the wise builder uniquely with the DEEP: *he is like a man which built an house, and digged deep, and laid the foundation on a rock: and when the flood arose, the stream beat vehemently upon that house, and could not shake it.* The wisdom-stream had named the unshakeable-because-stablished architecture; the King walks it at the hearer-and-doer level — the doing IS the digging-deep that stablishes the heart against the flood.'),
  ('canon', 'luke', 6, 49, 'apocrypha', 'ecclesiasticus', 22, 18,
   E'*Pales set on an high place will never stand against the wind: so a fearful heart in the imagination of a fool cannot stand against any fear.* (Sirach 22:18) The Hebrew library names the inverse — the unstablished heart that cannot stand against the wind. Luke 6:49 names the foolish builder: *he that heareth, and doeth not, is like a man that without a foundation built an house upon the earth; against which the stream did beat vehemently, and immediately it fell; and the ruin of that house was great.* The wisdom-stream had named the no-foundation collapse; the King walks the same architecture — the hearer-without-the-doing is the house without a foundation, and the ruin is great.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l0508_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_l0508_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 2 new extras-tier threads.
-- ---------------------------------------------------------------------

-- Thread 1 (sort 3430): luke-8-the-word-sown-and-the-law-bringing-fruit-in-2-esdras
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-8-the-word-sown-and-the-law-bringing-fruit-in-2-esdras',
       'The word sown and the law bringing fruit — 2 Esdras and the parable of the sower',
       E'Luke 8:4-15''s parable of the sower walks an architecture the Hebrew library''s 2 Esdras had named explicitly: the seed is the word-law of the Father sown into the heart, and the bringing-forth-of-fruit is the heart''s keeping of what was sown. Luke 8:11 names the seed: *Now the parable is this: The seed is the word of Elohim (God).* 2 Esdras 9:31 names the same word-law-sown-to-bring-fruit register: *for, behold, I sow my law in you, and it shall bring fruit in you, and you shall be honoured in it for ever.* 2 Esdras 8:41 names the not-all-the-seed-takes-root diagnostic of the rock-ground and the wayside: *for as the husbandman sows much seed upon the ground ... yet the thing that is sown good in his season comes not up, neither does all that is planted take root: even so is it of them that are sown in the world; they shall not all be saved.* 2 Esdras 9:33 names the keeping-or-perishing verdict that Luke 8:15 lands as the good-ground outcome: *yet they that received it perished, because they kept not the thing that was sown in them* — the inverse of Luke 8:15''s *honest and good heart, having heard the word, keep it, and bring forth fruit with patience.* The fruit is the keeping; the perishing is the not-keeping. The wisdom-apocalyptic stream had named the word-sown-to-bring-fruit and the keep-it-or-perish architecture before the King spoke the parable; the gospel walks the same architecture at the kingdom-citizens hearer-level. This is the word-seed received-and-kept register, distinct from the good-and-evil-seed-in-the-heart-of-Adam register that the existing 2 Esdras 4 thread carries.',
       sv.verse_id, ev.verse_id, 'extras', 3430
  FROM _s212_l0508_lookup sv, _s212_l0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 4
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 8 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

-- Thread 2 (sort 3431): luke-8-legion-into-the-deep-and-the-spirits-of-the-giants-bound-in-the-place-of-condemnation-in-1-enoch-and-jubilees
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-8-legion-into-the-deep-and-the-spirits-of-the-giants-bound-in-the-place-of-condemnation-in-1-enoch-and-jubilees',
       'Legion into the deep — the spirits of the giants and the place of condemnation in 1 Enoch and Jubilees',
       E'Luke 8:26-33''s Gerasene Legion walks the Hebrew library''s demon-origin and appointed-binding architecture, with the distinctively Lukan detail that the spirits *besought him that he would not command them to go out into the deep* (Luke 8:31) — the abussos, the place of confinement appointed against the day of the great judgment. 1 Enoch 15:8 names the earth-dwelling demon-origin: *as for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* — the unclean spirits are the earthbound offspring of the giants, born of the Watcher-rebellion of Genesis 6. 1 Enoch 15:11 names the appointed-consummation they operate under and dread: *thus shall they destroy until the day of the consummation, the great judgement in which the age shall be consummated, over the Watchers and the godless.* 1 Enoch 16:1 names the written-from-the-beginning verdict: *and from the beginning thus have I been shown concerning you, and written concerning you* — the judgment is already recorded. Jubilees 10:5 names the place of condemnation into which Noach''s (Noah''s) prayer asks the spirits be imprisoned: *imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant.* The Legion begs the King not to send them to the very binding the library names as their appointed end — the deep, the place of condemnation. The spirits recognize the King (*thou Son of Elohim (God) most high*) and recognize that the One who holds the recorded-sentence has drawn near; their cry *torment me not* is the dread of premature consummation. The Father alone exercises dominion over them (Jubilees 10:6); the King exercises it in flesh at the eastern shore. This is the into-the-deep / place-of-condemnation register, distinct from the demon-origin / Mastema-partial-restraint register the existing Matt-anchored 1 Enoch / Jubilees thread carries.',
       sv.verse_id, ev.verse_id, 'extras', 3431
  FROM _s212_l0508_lookup sv, _s212_l0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 26
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 8 AND ev.verse_number = 33
ON CONFLICT (slug) DO NOTHING;

-- Safety re-insert of the two EXISTING Matt-anchored Sirach threads the
-- Luke 6 complement-rows attach to (canonical definitions live in S137;
-- these are no-ops under ON CONFLICT (slug) DO NOTHING and exist only so
-- the thread_members INSERTs below resolve even if S137 has not run).
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'by-their-fruits-and-the-utterance-of-the-heart-in-sirach',
       'By their fruits — Sirach 27:6-7 and the false-prophet diagnostic',
       E'The fruit-as-utterance-of-the-heart diagnostic: Sirach 27:6 names *the fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* (Canonical thread definition and full summary live in S137; this is a no-op safety re-insert so the Luke 6:43-44 complement-members resolve.)',
       sv.verse_id, ev.verse_id, 'extras', 229
  FROM _s212_l0508_lookup sv, _s212_l0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 15
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 7 AND ev.verse_number = 20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wise-and-foolish-builders-and-the-heart-stablished-in-sirach',
       'Wise and foolish builders — Sirach 22:16-18 and the heart stablished',
       E'The heart-stablished-by-counsel foundation architecture: Sirach 22:16 names *the heart that is stablished by advised counsel shall fear at no time*; Sirach 22:18 names the inverse fool''s heart that cannot stand against the wind. (Canonical thread definition and full summary live in S137; this is a no-op safety re-insert so the Luke 6:48-49 complement-members resolve.)',
       sv.verse_id, ev.verse_id, 'extras', 230
  FROM _s212_l0508_lookup sv, _s212_l0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 24
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 7 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: luke-8-the-word-sown-and-the-law-bringing-fruit-in-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 9:31 — *for, behold, I sow my law in you, and it shall bring fruit in you, and you shall be honoured in it for ever.* The Hebrew library names the seed as the word-law of the Father sown into the heart; Luke 8:11''s *the seed is the word of Elohim (God)* walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'luke-8-the-word-sown-and-the-law-bringing-fruit-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 11
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 9 AND tv.verse_number = 31
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 8:41 — *the husbandman sows much seed upon the ground ... yet the thing that is sown good in his season comes not up, neither does all that is planted take root ... they shall not all be saved.* The not-all-the-seed-takes-root diagnostic; Luke 8:13''s rock-ground hearers who *for a while believe, and in time of temptation fall away* walk the same no-root failure.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'luke-8-the-word-sown-and-the-law-bringing-fruit-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 8 AND tv.verse_number = 41
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 9:33 — *yet they that received it perished, because they kept not the thing that was sown in them.* The keeping-or-perishing verdict; Luke 8:15''s good-ground hearers who *in an honest and good heart, having heard the word, keep it, and bring forth fruit with patience* are the inverse — the fruit is the keeping.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'luke-8-the-word-sown-and-the-law-bringing-fruit-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 15
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 9 AND tv.verse_number = 33
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: luke-8-legion-into-the-deep-...
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:8 — *as for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling.* The earth-dwelling demon-origin; Luke 8:29''s unclean spirit that drove the man into the wilderness is an earthbound spirit of the order 1 Enoch names.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'luke-8-legion-into-the-deep-and-the-spirits-of-the-giants-bound-in-the-place-of-condemnation-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 29
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 15 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 16:1 — *and from the beginning thus have I been shown concerning you, and written concerning you.* The written-from-the-beginning verdict; Luke 8:28''s demoniac cries *thou Son of Elohim (God) most high ... torment me not* — recognizing the One who holds the recorded sentence.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'luke-8-legion-into-the-deep-and-the-spirits-of-the-giants-bound-in-the-place-of-condemnation-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 28
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 16 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 15:11 — *thus shall they destroy until the day of the consummation, the great judgement in which the age shall be consummated.* The appointed-consummation the spirits dread; Luke 8:31''s Legion *besought him that he would not command them to go out into the deep* — the confinement appointed against the day of judgment.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'luke-8-legion-into-the-deep-and-the-spirits-of-the-giants-bound-in-the-place-of-condemnation-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 31
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 15 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:5 — *imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant.* Noach''s (Noah''s) prayer names the place of condemnation; Luke 8:31''s *not ... go out into the deep* is the same binding the library names as the spirits'' appointed end. The Father alone exercises dominion (Jubilees 10:6); the King exercises it in flesh.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'luke-8-legion-into-the-deep-and-the-spirits-of-the-giants-bound-in-the-place-of-condemnation-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 31
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Complement members: Luke 6:43-44 -> by-their-fruits-...-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Luke 6:43 -> Sirach 27:6 — *the fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* The Lukan good-tree / corrupt-tree teaching ties the fruit-diagnostic to the heart-utterance; the wisdom-stream named the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'by-their-fruits-and-the-utterance-of-the-heart-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 6 AND sv.verse_number = 43
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 27 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Luke 6:44 -> Sirach 27:6 — *the fruit declareth if the tree have been dressed.* Luke 6:44''s *every tree is known by his own fruit. For of thorns men do not gather figs* names the fruit-test as the means of knowing; the Hebrew library named the fruit-declares-the-tree diagnostic.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'by-their-fruits-and-the-utterance-of-the-heart-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 6 AND sv.verse_number = 44
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 27 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Complement members: Luke 6:48-49 -> wise-and-foolish-builders-...-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Luke 6:48 -> Sirach 22:16 — *the heart that is stablished by advised counsel shall fear at no time.* Luke 6:48 names the wise builder who *digged deep, and laid the foundation on a rock*; the doing is the digging-deep that stablishes the heart against the flood, the architecture the wisdom-stream named.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'wise-and-foolish-builders-and-the-heart-stablished-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 6 AND sv.verse_number = 48
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 22 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Luke 6:49 -> Sirach 22:18 — *a fearful heart in the imagination of a fool cannot stand against any fear.* Luke 6:49 names the foolish builder *without a foundation* whose house fell and *the ruin of that house was great*; the wisdom-stream named the no-foundation collapse of the unstablished heart.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0508_lookup sv, _s212_l0508_lookup tv
 WHERE t.slug = 'wise-and-foolish-builders-and-the-heart-stablished-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 6 AND sv.verse_number = 49
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 22 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- End S212 — Luke 5-8 extras-library cross-references
-- =====================================================================
