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
