-- =====================================================================
-- S212 minion — JOHN 9-12 outside-canon (extras-library) cross-references
-- =====================================================================
-- Range:   John 9, 10, 11, 12
-- Tag:     j0912   (temp view _s212_j0912_lookup)
-- Band:    sort_order 3090-3119
--
-- Promotes framework-bearing extras-library connections into real
-- edition-aware member rows for the John 9-12 reading. John 9 already
-- carries canon threads from session194 (light-of-the-world, for-judgment,
-- cast-out-of-the-synagogue); this fragment ADDS extras threads only and
-- does not duplicate those. Mark/Luke/John carried ZERO outside-canon
-- xrefs before this S212 pass; this is the John 9-12 slice.
--
-- The reading: John 9 (the man born blind washes and comes seeing, then
-- worships the Son of Elohim — *one thing I know, that, whereas I was
-- blind, now I see*); John 10 (the Good Shepherd, *my sheep hear my
-- voice*, and the *other sheep I have, which are not of this fold* — the
-- gathering of the scattered house); John 11 (the raising of Lazaros and
-- *I am the resurrection, and the life*; Caiaphas prophesying that he
-- should *gather together in one the children of Elohim that were
-- scattered abroad*); John 12 (the triumphal entry, *the hour is come,
-- that the Son of Adam should be glorified*, the corn of wheat that dies,
-- and *I, if I be lifted up from the earth, will draw all men unto me*).
--
-- Five NEW extras-tier threads:
--   1. john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit       (3090)
--        target editions: apocrypha (Tobit)
--   2. john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13     (3091)
--        target editions: apocrypha (2 Esdras / 4 Ezra)
--   3. john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch  (3092)
--        target editions: apocrypha (2 Esdras), enoch (1 Enoch)
--   4. john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach (3093)
--        target editions: apocrypha (Baruch, Ecclesiasticus / Sirach)
--   5. john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables (3094)
--        target editions: enoch (1 Enoch)
--
-- 16 new cross_references rows + 16 new thread_member rows, all at
-- tier_required='extras'. Every member-note passes the 12 Red Lines and
-- the 12-point editorial checklist.
--
-- CHAPTER WITH NO EXTRAS ADD: John 12's *corn of wheat* (v.24) warrants
-- NO extras thread. The seed-that-dies-to-bear-much-fruit is a death-
-- yields-resurrection-fruit substance; the extras-library's seed material
-- (2 Esdras 4 / 8 / 9) is sown-word-and-harvest substance, framed toward
-- who-is-saved at the threshing, not toward a single seed dying to
-- multiply — and that harvest substance is already carried in existing
-- threads (seed-of-good-and-evil-sown-in-the-heart-of-adam-in-2-esdras,
-- and the harvest/sifting cluster). Forcing a corn-of-wheat extras pairing
-- would be a TSK-style dump, not a framework-bearing connection. John 12's
-- framework-bearing extras add lands instead at v.23 (the Son of Adam
-- glorified) where the Enochic Parables carry the exact enthronement
-- substance.
--
-- Quote-don't-cite: every verse quoted in full, in italics, citation in
-- parentheses. Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- No BEGIN/COMMIT/\echo — the orchestrator wraps one transaction per gospel.
-- =====================================================================

-- Verse-lookup temp view. Every scripture-level extras edition seeded for
-- V1, plus canon.
CREATE TEMP VIEW _s212_j0912_lookup AS
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
-- Insert 16 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- Thread 1: john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit
  ('canon', 'john', 9, 7, 'apocrypha', 'tobit', 11, 11,
   E'*And took hold of his father: and he strake of the gall on his fathers'' eyes, saying, Be of good hope, my father.* Tobit 11:11 names the eyes-opened architecture in the Hebrew library — the blind father whose sight is restored by the appointed means. John 9:7''s *Go, wash in the pool of Siloam ... He went his way therefore, and washed, and came seeing* walks the same architecture: the Formed one applies clay and sends to the water, and the man born blind comes seeing. The Hebrew library carries the eyes-opened pattern; the gospel walks it as the messianic credential — *since the world began was it not heard that any man opened the eyes of one that was born blind* (John 9:32).'),
  ('canon', 'john', 9, 7, 'apocrypha', 'tobit', 11, 13,
   E'*And the whiteness pilled away from the corners of his eyes: and when he saw his son, he fell upon his neck.* Tobit 11:13 names the whiteness-peeled-away moment the sight is given. John 9 walks the same in the man who *received sight* and would not be talked out of what he knew: *one thing I know, that, whereas I was blind, now I see* (John 9:25). The Hebrew library names the restored sight; the gospel names the restored sight that the restored man defends against the whole court.'),
  ('canon', 'john', 9, 38, 'apocrypha', 'tobit', 11, 14,
   E'*And he wept, and said, Blessed art you, O Yahuah (God), and blessed is your name for ever; and blessed are all yours holy angels.* Tobit 11:14 names the response to the opened eyes — the blessing of the name of Yahuah (God) the moment sight is restored. John 9:38''s *Lord, I believe. And he worshipped him* walks the same architecture: the man whose eyes were opened falls in worship before the Son of Elohim (God) who opened them. The Hebrew library blesses the name at the restored sight; the gospel worships the Formed one who restored it.'),
  ('canon', 'john', 9, 38, 'apocrypha', 'tobit', 11, 15,
   E'*For you have scourged, and have taken pity on me: for, behold, I see my son Tobias. And his son went in rejoicing.* Tobit 11:15 names the scourged-then-pitied architecture — the affliction borne, then the mercy of the opened eyes, then rejoicing. John 9 walks the same arc: the man born blind, who *neither hath this man sinned, nor his parents: but that the works of Elohim (God) should be made manifest in him* (John 9:3), receives the mercy of sight and ends in worship. The Hebrew library names the pity in the restored sight; the gospel names the works of Elohim (God) made manifest in it.'),

  -- Thread 2: john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13
  ('canon', 'john', 10, 16, 'apocrypha', '2-esdras', 13, 40,
   E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land.* 2 Esdras 13:40 names the ten tribes of the scattered house explicitly — the very sheep John 10:16''s *other sheep I have, which are not of this fold* names. The *other sheep* are not the nations grafted in by confession; they are the scattered house of Yashar''el (Israel) carried over the waters in the Assyrian captivity, named tribe-by-tribe in the Hebrew library. The Shepherd says *them also I must bring* — the gathering of the carried-away ten tribes the vision names.'),
  ('canon', 'john', 10, 16, 'apocrypha', '2-esdras', 13, 47,
   E'*The Highest shall stay the springs of the stream again, that they may go through: therefore sawest you the multitude with peace.* 2 Esdras 13:47 names the gathering-home of the scattered ten tribes — the Most High staying the river so the carried-away may cross back. John 10:16''s *them also I must bring; and they shall hear my voice; and there shall be one fold, and one shepherd* walks the same gathering: the scattered house brought home into one fold under one Shepherd. The Hebrew library names the road home for the ten tribes; the gospel names the Shepherd who brings them and the one fold they are gathered into.'),
  ('canon', 'john', 10, 27, 'apocrypha', '2-esdras', 13, 33,
   E'*And when all the people hear his voice, every man shall in their own land leave the battle they have one against another.* 2 Esdras 13:33 names the hearing-of-the-voice of the Son who is declared — the people hearing his voice and turning. John 10:27''s *my sheep hear my voice, and I know them, and they follow me* walks the same architecture: the hearing reveals the sheep. The Hebrew library names the voice of the declared Son that the people hear; the gospel names the same voice the sheep hear and follow, because the hearing discloses what they already were.'),

  -- Thread 3: john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch
  ('canon', 'john', 11, 24, 'apocrypha', '2-esdras', 7, 32,
   E'*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* 2 Esdras 7:32 names the resurrection-at-the-last-day architecture — the earth restoring the sleeping, the dust giving back those in silence. Martha''s *I know that he shall rise again in the resurrection at the last day* (John 11:24) names the same Hebrew library hope. The earth giving back its dead is the resurrection the Hebrew library held; the raising of Lazaros at John 11:43-44 is the firstfruit-sign of it — *Lazarus, come forth.*'),
  ('canon', 'john', 11, 25, 'enoch', '1-enoch', 51, 1,
   E'*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. For in those days the Elect One shall arise.* 1 Enoch 51:1 names the earth-and-Sheol-give-back-their-dead architecture, and the arising of the Elect One at the resurrection. John 11:25''s *I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live* walks the same architecture: the Formed one is himself the resurrection the Hebrew library awaited, the Elect One whose arising brings the dead back from the earth, from Sheol, from death''s keeping.'),
  ('canon', 'john', 11, 25, 'enoch', '1-enoch', 51, 2,
   E'*And he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved.* 1 Enoch 51:2 names the choosing-of-the-righteous at the resurrection — the day of salvation drawn nigh. John 11:25-26''s *he that believeth in me, though he were dead, yet shall he live: and whosoever liveth and believeth in me shall never die* walks the same architecture: the resurrection-and-the-life chooses the believing from among the dead. The Hebrew library names the Elect One choosing the righteous at the resurrection; the gospel names the Formed one who is the resurrection doing the same choosing.'),

  -- Thread 4: john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach
  ('canon', 'john', 11, 52, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37,
   E'*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* Baruch 4:37 names the gathering-of-the-scattered-children architecture — the sons sent away in the scattering, gathered home from east to west by the word of the Holy One. John 11:52''s *and not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad* walks the same architecture: the death of the Formed one gathers the scattered children home. The Hebrew library names the children gathered by the word of the Holy One; the gospel names the One whose death gathers them into one.'),
  ('canon', 'john', 11, 52, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5,
   E'*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch 5:5 names the children-gathered-from-the-west-to-the-east architecture again, doubled with Baruch 4:37 for emphasis — the scattered children brought home by the word of the Holy One. John 11:52''s *gather together in one the children of Elohim (God) that were scattered abroad* walks the same Hebrew library gathering: the scattered children of the covenant brought home into one.'),
  ('canon', 'john', 11, 52, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 9,
   E'*For Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory with the mercy and righteousness that comes from him.* Baruch 5:9 names the leading-home-of-Yashar''el (Israel) — the gathering completed, the scattered led home in the light of the glory. John 11:52''s gathering of the scattered children into one is the gospel-form of the same homecoming the Hebrew library names: Yashar''el (Israel) led home with joy in the glory, the children scattered abroad gathered into one.'),
  ('canon', 'john', 11, 52, 'apocrypha', 'ecclesiasticus', 36, 11,
   E'*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* Sirach (Ecclesiasticus) 36:11 names the gather-all-the-tribes-of-Jacob prayer in the Hebrew library''s wisdom-stream — the explicit petition for the gathering of the scattered tribes back into the inheritance, *as from the beginning.* John 11:52''s *gather together in one the children of Elohim (God) that were scattered abroad* walks the same architecture: the gathering Caiaphas prophesies without understanding is the gathering of all the tribes of Jacob the Hebrew library was already praying for. The wisdom-stream prays it; the gospel names the death that accomplishes it.'),

  -- Thread 5: john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables
  ('canon', 'john', 12, 23, 'enoch', '1-enoch', 62, 7,
   E'*And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.* 1 Enoch 62:7 names the Son of Adam declared by Yahuah (God) of Spirits — the named Son of Adam, born unto righteousness, standing in the Parables. John 12:23''s *the hour is come, that the Son of Adam should be glorified* walks the same architecture: the Son of Adam the Hebrew library names is the Formed one whose hour of glorification has come. The Hebrew library names the Son of Adam beside the Head of Days; the gospel names the hour that Son of Adam is glorified — through the lifting-up of the cross.'),
  ('canon', 'john', 12, 23, 'enoch', '1-enoch', 62, 2,
   E'*And when he shall lift up his face To judge their secret ways by the word of the name of Yahuah (God) of Spirits ... Then shall they all speak with one voice, And bless and glorify and extol and laud the name of Yahuah (God) of Spirits.* 1 Enoch 62:2 names the glorifying-of-the-name architecture at the Son of Adam''s enthronement. John 12:23 and 12:28''s *the hour is come, that the Son of Adam should be glorified ... Father, glorify thy name. Then came there a voice from heaven, saying, I have both glorified it, and will glorify it again* walk the same architecture: the hour of the Son of Adam''s glorifying is the hour the Father''s name is glorified. The Hebrew library names the name glorified at the Son of Adam''s investiture; the gospel names the Father''s voice glorifying the name at the hour of the Son of Adam.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_j0912_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_j0912_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 5 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit',
       E'The eyes opened and the blessing of the name in Tobit',
       E'The man born blind washes in the pool of Siloam — *which is by interpretation, Sent* — and comes seeing; and when the Formed one finds him after the court has cast him out, he worships. The inherited reading treats the healing as a stand-alone wonder. The Hebrew library''s own eyes-opened narrative reads it as a known pattern carried forward: the blindness borne, the appointed means applied, the sight restored, and the name of Yahuah (God) blessed in worship.\n\n*And said unto him, Go, wash in the pool of Siloam, (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.* (John 9:7)\n\n*And he said, Lord, I believe. And he worshipped him.* (John 9:38)\n\n*And took hold of his father: and he strake of the gall on his fathers'' eyes ... And the whiteness pilled away from the corners of his eyes ... And he wept, and said, Blessed art you, O Yahuah (God), and blessed is your name for ever.* (Tobit 11:11, 13, 14)\n\nTobit''s blindness is borne and then healed by the appointed means — the gall applied, the whiteness peeled away, the sight restored — and the first thing the seeing man does is bless the name of Yahuah (God) for ever. The man born blind walks the same arc: his blindness is *that the works of Elohim (God) should be made manifest in him* (John 9:3), the clay and the washing are the appointed means, and the seeing man ends not in self-congratulation but in worship of the Son of Elohim (God) who opened his eyes. The Hebrew library names the eyes-opened pattern and the blessing of the name that answers it; the gospel walks the same pattern and names the Formed one as the One the restored sight worships. *One thing I know, that, whereas I was blind, now I see* (John 9:25) is the testimony the whole court cannot talk the seeing man out of — the restored sight defending itself against the credential-system that cast him out.',
       sv.verse_id, ev.verse_id, 'extras', 3090
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 7
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 9 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13',
       E'The other sheep and the ten tribes gathered in 2 Esdras 13',
       E'The Good Shepherd names sheep beyond the fold standing in front of him: *and other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The inherited reading hears *other sheep* as the nations brought into the church by confession. The framework hears the Tanakh''s own scattered-house language — and the Hebrew library names the scattered house tribe-by-tribe: the ten tribes carried away in the Assyrian captivity, gathered home by the Most High.\n\n*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* (John 10:16)\n\n*My sheep hear my voice, and I know them, and they follow me.* (John 10:27)\n\n*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive ... The Highest shall stay the springs of the stream again, that they may go through ... And when all the people hear his voice, every man shall in their own land leave the battle they have one against another.* (2 Esdras 13:40, 47, 33)\n\nThe *other sheep* are not the nations grafted in by a new mechanism; they are the scattered house of Yashar''el (Israel) — the ten northern tribes the Assyrian captivity carried over the waters, named explicitly in the Hebrew library''s vision of the Son who is declared. The Shepherd says *them also I must bring,* and the vision names the road home: the Most High staying the river so the carried-away may cross back into one fold. And the mechanism is the same in both: *when all the people hear his voice* they turn — the hearing reveals the sheep, exactly as John 10:27 names it. *My sheep hear my voice* is not a creating but a disclosing; the scattered house hears because the scattered house was always the Shepherd''s. The gathering of the carried-away ten tribes is the gathering the Good Shepherd discourse walks.',
       sv.verse_id, ev.verse_id, 'extras', 3091
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 10 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch',
       E'The resurrection and the life — the earth giving back its dead in 2 Esdras and 1 Enoch',
       E'At the grave of Lazaros, Martha confesses the resurrection-at-the-last-day, and the Formed one answers with a name: *I am the resurrection, and the life.* The inherited reading treats the raising of Lazaros as a stand-alone miracle and the saying as a comfort. The Hebrew library names the architecture the saying stands on: the earth, Sheol, and death itself giving back the dead at the resurrection, and the Elect One arising to choose the righteous from among them.\n\n*Martha saith unto him, I know that he shall rise again in the resurrection at the last day. Yahusha (Jesus) said unto her, I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live: and whosoever liveth and believeth in me shall never die.* (John 11:24-26)\n\n*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* (2 Esdras 7:32)\n\n*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. For in those days the Elect One shall arise, And he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved.* (1 Enoch 51:1-2)\n\nMartha''s hope — *the resurrection at the last day* — is the Hebrew library''s own hope: the earth restoring the sleeping, the dust giving back those in silence, Sheol and death giving back what they hold. And the Hebrew library binds that resurrection to a person: the Elect One who arises and chooses the righteous from among the raised. John 11:25 lands the same architecture in the first person — the Formed one is himself the resurrection the Hebrew library awaited, the Elect One whose arising brings the dead back from the earth, from Sheol, from death''s keeping. The raising of Lazaros — *Lazarus, come forth* — is the firstfruit-sign of it: the head doing in one grave what the whole gathered body will follow him through at the last day.',
       sv.verse_id, ev.verse_id, 'extras', 3092
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 24
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 11 AND ev.verse_number = 26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach',
       E'Gather together the scattered children — from east to west in Baruch and Sirach',
       E'Caiaphas, meaning only to engineer a death that will protect the nation, prophesies more than he knows: the Formed one will die *not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad.* The inherited reading reads *scattered abroad* as the dispersion of believers generally. The framework hears the prophets'' own gathering-language — and the Hebrew library names it precisely: the scattered children sent away in the exile, gathered home from east to west by the word of the Holy One.\n\n*And this spake he not of himself: but being high priest that year, he prophesied that Yahusha (Jesus) should die for that nation; And not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad.* (John 11:51-52)\n\n*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* (Baruch 4:37)\n\n*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One ... For Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory.* (Baruch 5:5, 9)\n\n*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* (Sirach 36:11)\n\nThe children Caiaphas unwittingly names are the scattered children of the covenant — the sons sent away in the scattering, whom the Hebrew library sees gathered home from east to west by the word of the Holy One, led home in the light of the glory. The wisdom-stream prays the petition outright: *gather all the tribes of Jacob together ... as from the beginning.* The gathering John 11:52 names is not the inclusion of unrelated peoples by a new mechanism; it is the homecoming of the scattered children of Elohim (God) the prophets and the wisdom-stream had been awaiting and praying for. The high priest engineers a death; the death he engineers is the very thing that gathers the scattered tribes of Jacob into one.',
       sv.verse_id, ev.verse_id, 'extras', 3093
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 51
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 11 AND ev.verse_number = 52
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables',
       E'The hour is come — the Son of Adam glorified and enthroned in the Enochic Parables',
       E'When the Greeks at the feast ask to see him, the Formed one answers not with an audience but with the hour: *the hour is come, that the Son of Adam should be glorified.* The inherited reading hears *glorified* as a euphemism for the crucifixion. The framework hears the full weight: the Son of Adam is a named figure in the Hebrew library — declared by Yahuah (God) of Spirits, enthroned beside the Head of Days — and his glorifying is the investiture the Parables already wrote, reached by way of the lifting-up.\n\n*And Yahusha (Jesus) answered them, saying, The hour is come, that the Son of Adam should be glorified.* (John 12:23)\n\n*Father, glorify thy name. Then came there a voice from heaven, saying, I have both glorified it, and will glorify it again.* (John 12:28)\n\n*And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.* (1 Enoch 62:7)\n\n*And when he shall lift up his face To judge their secret ways by the word of the name of Yahuah (God) of Spirits ... Then shall they all speak with one voice, And bless and glorify and extol and laud the name of Yahuah (God) of Spirits.* (1 Enoch 62:2)\n\nThe Son of Adam is not a veil over a generic human; the Hebrew library names him — *this is the Son of Adam who is born unto righteousness* — declared by Yahuah (God) of Spirits, the righteousness of the Head of Days never forsaking him. The Parables glorify the name at the Son of Adam''s enthronement; John 12:28 lands the same architecture in the Father''s own voice from heaven: *Father, glorify thy name ... I have both glorified it, and will glorify it again.* The hour of the Son of Adam''s glorifying is the hour the Father''s name is glorified. And the path to the enthronement the Parables describe runs through the lifting-up: *I, if I be lifted up from the earth, will draw all men unto me* (John 12:32). The Son of Adam the Hebrew library names beside the Head of Days is the Formed one whose hour has come — glorified through the cross, drawing the gathered home.',
       sv.verse_id, ev.verse_id, 'extras', 3094
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 12 AND sv.verse_number = 23
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 12 AND ev.verse_number = 28
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 11:11 — *he strake of the gall on his fathers'' eyes, saying, Be of good hope, my father.* The eyes-opened-by-the-appointed-means architecture; John 9:7''s *go, wash in the pool of Siloam ... and came seeing* walks the same.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 7
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 11 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 11:13 — *the whiteness pilled away from the corners of his eyes.* The whiteness-peeled-away moment of restored sight; John 9:25''s *whereas I was blind, now I see* names the same restored sight, defended against the court.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 7
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 11 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 11:14 — *Blessed art you, O Yahuah (God), and blessed is your name for ever.* The blessing-of-the-name at the restored sight; John 9:38''s *Lord, I believe. And he worshipped him* walks the same — worship of the Son of Elohim (God) who opened the eyes.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 38
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 11 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 11:15 — *you have scourged, and have taken pity on me ... And his son went in rejoicing.* The scourged-then-pitied arc ending in rejoicing; John 9''s man born blind, that the works of Elohim (God) be made manifest, ends in worship.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 38
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 11 AND tv.verse_number = 15
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 13:40 — *those are the ten tribes, which were carried away prisoners ... and he carried them over the waters.* The scattered house named tribe-by-tribe; John 10:16''s *other sheep ... not of this fold* are the carried-away ten tribes, not the nations grafted in.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 40
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 13:47 — *the Highest shall stay the springs of the stream again, that they may go through.* The road home for the scattered ten tribes; John 10:16''s *them also I must bring ... one fold, and one shepherd* names the Shepherd who brings them home.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 47
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 13:33 — *when all the people hear his voice ... every man shall in their own land leave the battle.* The hearing-of-the-voice that turns the people; John 10:27''s *my sheep hear my voice ... and they follow me* walks the same — hearing discloses the sheep.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 33
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 7:32 — *the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence.* The resurrection-at-the-last-day Martha confesses (John 11:24); the raising of Lazaros is its firstfruit-sign.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 7 AND tv.verse_number = 32
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 51:1 — *the earth also give back that which has been entrusted to it, And Sheol also shall give back ... For in those days the Elect One shall arise.* The earth-and-Sheol-give-back-their-dead at the Elect One''s arising; John 11:25''s *I am the resurrection, and the life* names the Formed one as that resurrection.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 25
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 51 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 51:2 — *he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved.* The Elect One choosing the righteous at the resurrection; John 11:25-26''s *though he were dead, yet shall he live* walks the same choosing.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 25
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 51 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Baruch 4:37 — *your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* The scattered children gathered home; John 11:52''s *gather together in one the children of Elohim (God) that were scattered abroad* walks the same.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 5:5 — *behold your children gathered from the west to the east by the word of the Holy One.* The gathering-of-the-children doubled with Baruch 4:37; John 11:52''s scattered children gathered into one walks the same Hebrew library homecoming.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 5:9 — *Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory.* The leading-home of Yashar''el (Israel); John 11:52''s gathering of the scattered children into one is the gospel-form of the same homecoming.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The wisdom-stream''s explicit gathering-prayer; John 11:52''s gathering Caiaphas prophesies is the gathering of all the tribes of Jacob the Hebrew library prays for.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 62:7 — *This is the Son of Adam who is born unto righteousness ... the righteousness of the Head of Days forsakes him not.* The named Son of Adam declared by Yahuah (God) of Spirits; John 12:23''s *the hour is come, that the Son of Adam should be glorified* names the hour that Son of Adam is glorified.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 12 AND sv.verse_number = 23
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 62:2 — *then shall they all ... bless and glorify and extol and laud the name of Yahuah (God) of Spirits.* The glorifying-of-the-name at the Son of Adam''s enthronement; John 12:28''s *Father, glorify thy name ... I have both glorified it, and will glorify it again* walks the same — the hour of the Son of Adam is the hour the name is glorified.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 12 AND sv.verse_number = 23
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- CHAPTERS 9-12 COMPLETE
