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
