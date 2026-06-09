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
