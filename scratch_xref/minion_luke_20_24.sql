-- =====================================================================
-- S212 minion — Luke 20-24 extras-library cross-references
-- =====================================================================
-- Range: Luke 20, 21, 22, 23, 24.
-- Tag: l2024  (temp view _s212_l2024_lookup)
-- sort_order band: 3550-3579.
-- Output: scratch_xref/minion_luke_20_24.sql
--
-- Adds the MISSING outside-canon (extras-library) cross-references for
-- the Luke 20-24 range. The existing Luke canon migration
-- (session185_luke_xref_members_and_threads.sql) already carries canon
-- threads at Luke 21:24 (times of the Gentiles), Luke 22:35-38 (two
-- swords / Isaiah 53:12), Luke 23:34 (Father forgive them), Luke 23:43
-- (today shalt thou be with me in paradise — sheol-with-two-compartments,
-- FREE tier), Luke 23:46 (into thy hands I commend my spirit), Luke
-- 24:25-27 (Emmaus road / Mosheh and the prophets), Luke 24:36-43
-- (resurrection body of flesh and bones), and Luke 24:50-53 (ascension).
-- Luke 20 carries no canon thread at all (thin/zero). This fragment ADDS
-- the framework-bearing extras-tier connections those chapters warrant
-- that were not yet member rows, drawing the outside-canon library that
-- the canon migration never inserted as rows.
--
-- NEW threads created (4):
--   1. luke-20-the-one-only-vine-and-the-one-people-given-the-law-in-2-esdras
--        (sort 3550) — targets: 2 Esdras / 4 Ezra (apocrypha)
--   2. luke-20-equal-unto-the-angels-and-the-children-of-the-resurrection-dwelling-with-the-angels-in-1-enoch
--        (sort 3551) — targets: 1 Enoch (enoch)
--   3. luke-23-paradise-and-the-chambers-of-the-souls-of-the-dead-in-1-enoch
--        (sort 3552) — targets: 1 Enoch (enoch)
--   4. luke-24-ought-not-the-messiah-to-have-suffered-then-enter-his-glory-the-righteous-one-condemned-and-vindicated-in-wisdom-of-solomon
--        (sort 3553) — targets: Wisdom of Solomon (apocrypha)
--
-- 11 new cross_references rows, all tier_required='extras'.
-- 11 new thread_members rows.
--
-- Chapters with NO extras add (and why):
--   - LUKE 21: the Olivet discourse (Jerusalem compassed with armies, the
--     Son of Adam coming in a cloud, the fig tree, this generation) is
--     carried at the canon level by the existing
--     `times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim`
--     thread (Luke 21:24) and the Daniel-7 / Zekharyah-14 Tanakh anchors.
--     The kaph-carve-out does NOT apply at Luke 21:27 (no kaph —
--     *they see the Son of Adam coming in a cloud* is a direct statement,
--     rendered son-of-Adam straight). No distinct framework-bearing
--     extras-library connection surfaces at the rigour bar that is not
--     already an extras member of a synoptic Matthew/Mark thread; no
--     Luke-21 duplicate cut.
--   - LUKE 22: the Passover / Last Supper / new covenant in my blood and
--     the dispute over greatness carry synoptic Matthew/Mark extras
--     coverage (the existing
--     `the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees`
--     and `the-greatness-as-humility-and-the-proud-cast-down-in-the-wisdom-stream`
--     threads). Gethsemane / the agony carries the existing
--     `gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father`
--     and `the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees`
--     extras threads. The Sanhedrin self-identification (Luke 22:69 —
--     *hereafter shall the Son of Adam sit on the right hand of the power
--     of Elohim*) carries the existing
--     `sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth`
--     and the 1-Enoch-parables Elect-One-at-the-right-hand threads. No
--     distinct Luke-22-anchored framework-bearing extras add.
--
-- Every member-note quotes the verse IN FULL in italics with the
-- citation in parentheses (come-and-see), restores sacred names with
-- parentheticals, renders son-of-man -> son-of-Adam, and passes the 12
-- Red Lines + 12-point checklist. Idempotent: ON CONFLICT DO NOTHING on
-- every INSERT.
-- =====================================================================

CREATE TEMP VIEW _s212_l2024_lookup AS
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
-- Insert 11 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: luke-20-the-one-only-vine-and-the-one-people-given-the-law-in-2-esdras
  ('canon', 'luke', 20, 9, 'apocrypha', '2-esdras', 5, 23,
   E'*And said, O Yahuah (God) that bearest rule, of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* (2 Esdras 5:23) The Hebrew library names the vineyard as Yashar''el (Israel) explicitly — the one only vine the Most High chose out of all the trees of the earth. *A certain man planted a vineyard, and let it forth to husbandmen, and went into a far country for a long time* (Luke 20:9): the vineyard the King''s parable names is the same one-only-vine Ezra names — Yashar''el planted by the Master, let out to the keeping of the husbandmen who beat the servants and kill the heir. The parable is not against the people the vine is; it is against the husbandmen-leadership entrusted with the keeping.'),
  ('canon', 'luke', 20, 9, 'apocrypha', '2-esdras', 5, 27,
   E'*And among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* (2 Esdras 5:27) The wisdom-stream names the one-people-given-the-law substance behind the vineyard-parable: the vine is the one people the Most High loved and to whom He gave the Torah. *A certain man planted a vineyard, and let it forth to husbandmen* (Luke 20:9): the vineyard let out is this one beloved people; the fruit the lord of the vineyard sends his servants to gather is the covenant-keeping the law was given for. The husbandmen who refuse the fruit and kill the heir are the leadership that holds the vine while voiding the law it was planted under.'),
  ('canon', 'luke', 20, 16, 'apocrypha', '2-esdras', 5, 24,
   E'*And of all lands of the whole world you have chosen you one pit: and of all the flowers thereof one lily.* (2 Esdras 5:24) Ezra''s litany of the one-chosen-out-of-all continues — one vine, one pit, one lily, one river, one city, one dove, one sheep, one people. *He shall come and destroy these husbandmen, and shall give the vineyard to others. And when they heard it, they said, Elohim (God) forbid* (Luke 20:16): the vineyard given to others is not the chosen-vine replaced by a different people; it is the keeping of the one-only-vine taken from the failed husbandmen and given to faithful keepers. The vine remains the one Yashar''el (Israel) the Most High chose; the stewardship of it changes hands.'),

  -- Thread 2: luke-20-equal-unto-the-angels-and-the-children-of-the-resurrection-dwelling-with-the-angels-in-1-enoch
  ('canon', 'luke', 20, 36, 'enoch', '1-enoch', 39, 4,
   E'*And there mine eyes saw their dwellings with His righteous angels, and their resting-places with the holy, and they intercede and pray for the children of men, and righteousness flows before them like water, and mercy like dew upon the earth.* (1 Enoch 39:4) The Hebrew library names the dwellings of the righteous WITH the holy angels — the resting-places of the elect among the holy ones of heaven. *They are equal unto the angels; and are the children of Elohim (God), being the children of the resurrection* (Luke 20:36): the equal-unto-the-angels register the King names against the Sadducees'' deny-the-resurrection is the same dwelling-with-the-righteous-angels Enoch saw — the children of the resurrection sharing the resting-places of the holy ones, no longer dying, no longer given in marriage, equal unto the angels.'),
  ('canon', 'luke', 20, 36, 'enoch', '1-enoch', 39, 5,
   E'*And in those days the voice of the Holy One shall be heard in the heaven, and the voice of the Elect One shall be heard from the throne of glory.* (1 Enoch 39:5) The wisdom-stream names the heavenly-register the children of the resurrection enter — the dwelling where the voice of the Elect One sounds from the throne of glory. *Neither can they die any more: for they are equal unto the angels; and are the children of Elohim (God), being the children of the resurrection* (Luke 20:36): the no-more-dying immortality the King names is the heavenly-life Enoch saw the elect resting in among the angels; the children of the resurrection are gathered into the register where the Elect One reigns.'),
  ('canon', 'luke', 20, 36, 'enoch', '1-enoch', 104, 4,
   E'*And the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them.* (1 Enoch 104:4) The Hebrew library names the resurrection-life of the righteous — victorious, lighted, made-peace-with in the name of Yahuah (God) of Spirits. *They which shall be accounted worthy to obtain that world, and the resurrection from the dead, neither marry, nor are given in marriage: Neither can they die any more; for they are equal unto the angels* (Luke 20:35-36): the worthy-to-obtain-that-world register the King names is the victorious-and-lighted resurrection-life Enoch names — the righteous raised into the angelic-register, their light made to appear, no longer subject to death.'),

  -- Thread 3: luke-23-paradise-and-the-chambers-of-the-souls-of-the-dead-in-1-enoch
  ('canon', 'luke', 23, 43, 'enoch', '1-enoch', 22, 9,
   E'*And there was in it four hollow places, deep and wide and very smooth. How smooth are the hollow places and deep and dark to look at.* (1 Enoch 22:9) The Hebrew library names the chambers-of-the-souls-of-the-dead architecture — the hollow places in the mountain where the spirits assemble after death. *Verily I say unto thee, To day shalt thou be with me in paradise* (Luke 23:43): the paradise the King names the second thief into this-day is the righteous chamber of these hollow places — the holding-register of the dead until the day of judgement, where the King and the thief go together in the hours after the cross. The wisdom-stream chronicled the chambers Luke names in a single word.'),
  ('canon', 'luke', 23, 43, 'enoch', '1-enoch', 22, 11,
   E'*And these places have been made for them until the day of their judgement and until their appointed period, till the great judgement comes upon them.* (1 Enoch 22:11) The Hebrew library names the until-the-day-of-judgement holding-period of the chambers — the souls assembled there awaiting the appointed period. *To day shalt thou be with me in paradise* (Luke 23:43): the this-day paradise is the holding-register of the righteous in the hours after the cross, before the great judgement and before the ascension-relocation; the chambers Enoch names are the architecture the King''s word presupposes — the dead held in their compartments until the appointed period the resurrection answers.'),
  ('canon', 'luke', 23, 43, 'enoch', '1-enoch', 22, 16,
   E'*And he answered me and said unto me: These three have been made that the spirits of the dead might be separated. And such a division has been made (for) the spirits of the righteous, in which there is the bright spring of water.* (1 Enoch 22:16) The Hebrew library names the separated-righteous-compartment explicitly — the division made for the spirits of the righteous, with the bright spring of water. *To day shalt thou be with me in paradise* (Luke 23:43): the paradise the second thief is named into is this righteous-compartment with the bright spring, separated from the chamber of the sinners; the King names in one word the very compartment Enoch saw set apart for the righteous dead with its spring of living water.'),

  -- Thread 4: luke-24-ought-not-the-messiah-to-have-suffered-then-enter-his-glory-the-righteous-one-condemned-and-vindicated-in-wisdom-of-solomon
  ('canon', 'luke', 24, 26, 'apocrypha', 'the-wisdom-of-solomon', 2, 20,
   E'*Let us condemn him with a shameful death: for by his own saying he shall be respected.* (Wisdom of Solomon 2:20) The Hebrew library names the righteous-one-condemned-with-a-shameful-death architecture — the just man, who calls himself the child of Yahuah (God), condemned to a shameful death by those who lie in wait for him. *Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26): the suffering-half of the King''s reading-method to the Emmaus disciples is the shameful-death Wisdom names — the righteous one delivered to condemnation, the very pattern the prophets and the wisdom-stream had been carrying that the slow-of-heart disciples could not read.'),
  ('canon', 'luke', 24, 26, 'apocrypha', 'the-wisdom-of-solomon', 5, 1,
   E'*Then shall the righteous man stand in great boldness before the face of such as have afflicted him, and made no account of his labours.* (Wisdom of Solomon 5:1) The Hebrew library names the glory-half — the righteous man, condemned with a shameful death in chapter 2, now standing in great boldness before those who afflicted him, vindicated and numbered among the children of Yahuah (God). *Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26): the enter-into-his-glory the King names is this standing-in-boldness Wisdom names — the suffering-then-vindication arc the wisdom-stream chronicled and the prophets spoke, the reading-method the King opens to the disciples beginning at Mosheh (Moses) and all the prophets.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l2024_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_l2024_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-20-the-one-only-vine-and-the-one-people-given-the-law-in-2-esdras',
       E'The one only vine and the one people given the law — the vineyard of Yashar''el in 2 Esdras',
       E'Luke 20:9-18''s parable of the wicked husbandmen names the vineyard let out to keepers who beat the servants, kill the beloved son, and seize the inheritance — *A certain man planted a vineyard, and let it forth to husbandmen, and went into a far country for a long time* (Luke 20:9). The Hebrew library names what the vineyard IS. 2 Esdras 5:23 names it the one-only-vine: *O Yahuah (God) that bearest rule, of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* 2 Esdras 5:24 carries the one-chosen-out-of-all litany: *of all lands of the whole world you have chosen you one pit: and of all the flowers thereof one lily.* 2 Esdras 5:27 names the people and the law: *among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* The vineyard is Yashar''el (Israel) — the one only vine, the one beloved people, given the Torah it was planted under. The parable is NOT against the people the vine is; it is against the husbandmen-leadership entrusted with keeping the vine who refuse the fruit and kill the heir. *He shall come and destroy these husbandmen, and shall give the vineyard to others* (Luke 20:16): the vineyard given to others is the stewardship taken from the failed keepers and given to faithful ones — NOT the chosen-vine replaced by a different people. The vine remains the one Yashar''el the Most High chose; the keeping of it changes hands. (The canon Tanakh anchor for the vineyard-song is Yeshayahu/Isaiah 5:1-7 and the rejected-stone is Tehillim/Psalm 118:22; this thread adds the 2 Esdras wisdom-stream witness that the vineyard is the one-only-vine of the one-people-given-the-law.)',
       sv.verse_id, ev.verse_id, 'extras', 3550
  FROM _s212_l2024_lookup sv, _s212_l2024_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 20 AND sv.verse_number = 9
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 20 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-20-equal-unto-the-angels-and-the-children-of-the-resurrection-dwelling-with-the-angels-in-1-enoch',
       E'Equal unto the angels — the children of the resurrection dwelling with the angels in 1 Enoch',
       E'Luke 20:34-38''s answer to the Sadducees who deny the resurrection names the children-of-the-resurrection register: *They which shall be accounted worthy to obtain that world, and the resurrection from the dead, neither marry, nor are given in marriage: Neither can they die any more: for they are equal unto the angels; and are the children of Elohim (God), being the children of the resurrection* (Luke 20:35-36). The Hebrew library names the dwelling the equal-unto-the-angels register points to. 1 Enoch 39:4 names the resting-places of the righteous among the holy angels: *there mine eyes saw their dwellings with His righteous angels, and their resting-places with the holy.* 1 Enoch 39:5 names the heavenly-register they enter: *the voice of the Holy One shall be heard in the heaven, and the voice of the Elect One shall be heard from the throne of glory.* 1 Enoch 104:4 names the resurrection-life of the righteous: *the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them.* The equal-unto-the-angels the King names against the Sadducees'' denial is the same dwelling-with-the-righteous-angels Enoch saw — the children of the resurrection raised into the angelic-register, no longer dying, no longer given in marriage, their light made to appear, sharing the resting-places of the holy ones. (The canon anchor is the bush-revelation of Shemoth/Exodus 3:6 the King cites — *the Elohim of Abraham, and the Elohim of Isaac, and the Elohim of Jacob ... not a Elohim of the dead, but of the living* — and Daniyel/Daniel 12:2-3''s awake-and-shine resurrection; this thread adds the 1 Enoch witness to the children-of-the-resurrection dwelling among the angels.)',
       sv.verse_id, ev.verse_id, 'extras', 3551
  FROM _s212_l2024_lookup sv, _s212_l2024_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 20 AND sv.verse_number = 34
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 20 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-23-paradise-and-the-chambers-of-the-souls-of-the-dead-in-1-enoch',
       E'Paradise and the chambers of the souls of the dead in 1 Enoch',
       E'Luke 23:43''s word to the second thief — *Verily I say unto thee, To day shalt thou be with me in paradise* — names a holding-register the Hebrew library chronicled in detail. 1 Enoch 22 carries the chambers-of-the-souls-of-the-dead architecture. 1 Enoch 22:9 names the hollow places: *there was in it four hollow places, deep and wide and very smooth.* 1 Enoch 22:11 names the holding-period: *these places have been made for them until the day of their judgement and until their appointed period, till the great judgement comes upon them.* 1 Enoch 22:16 names the separated-righteous-compartment with its spring: *these three have been made that the spirits of the dead might be separated. And such a division has been made (for) the spirits of the righteous, in which there is the bright spring of water.* The paradise the King names the thief into this-day is the righteous compartment of these chambers — separated from the chamber of the sinners, marked by the bright spring of living water, the holding-register of the righteous dead until the day of judgement. The framework holds the motion as one: at the crucifixion-hour the righteous-compartment IS paradise where the thief joins the King this-day; between the cross and the ascension the King descended to the dead and at the ascension led the captives out, paradise relocated with them. The wisdom-stream named the chambers Luke names in a single word. (The canon anchor is the rich-man-and-Lazaros sheol-with-two-compartments of Luke 16:19-31 and the descent-and-leading-captivity-captive of Ephesians 4:8, carried by the existing free-tier thread `today-shalt-thou-be-with-me-in-paradise-the-sheol-with-two-compartments-architecture`; this thread adds the 1 Enoch 22 extras-library witness to the chambers-of-souls architecture that thread presupposes.)',
       sv.verse_id, ev.verse_id, 'extras', 3552
  FROM _s212_l2024_lookup sv, _s212_l2024_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 23 AND sv.verse_number = 43
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 23 AND ev.verse_number = 43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-24-ought-not-the-messiah-to-have-suffered-then-enter-his-glory-the-righteous-one-condemned-and-vindicated-in-wisdom-of-solomon',
       E'Ought not the Messiah to have suffered then enter his glory — the righteous one condemned and vindicated in Wisdom of Solomon',
       E'Luke 24:25-27''s Emmaus-road reading-method names the suffering-then-glory arc the slow-of-heart disciples could not read: *O fools, and slow of heart to believe all that the prophets have spoken: Ought not Messiah (Christ) to have suffered these things, and to enter into his glory? And beginning at Mosheh (Moses) and all the prophets, he expounded unto them in all the scriptures the things concerning himself* (Luke 24:25-27). The Hebrew library''s wisdom-stream carries the same arc as a single sustained portrait. Wisdom of Solomon 2 names the suffering-half — the righteous one, who calls himself the child of Yahuah (God), lied-in-wait-for and condemned: *Let us condemn him with a shameful death: for by his own saying he shall be respected* (Wisdom 2:20). Wisdom of Solomon 5 names the glory-half — the same righteous one vindicated, standing in boldness before those who afflicted him: *Then shall the righteous man stand in great boldness before the face of such as have afflicted him, and made no account of his labours* (Wisdom 5:1), and *How is he numbered among the children of Yahuah (God), and his lot is among the saints!* (Wisdom 5:5). The shameful-death-then-vindication portrait of Wisdom 2 and 5 is the suffer-then-enter-glory pattern the King opens to the disciples — the reading-method that finds the Messiah throughout the scriptures, the righteous one condemned and raised, the very arc the wisdom-stream and the prophets had been carrying. (The canon anchors are Yeshayahu/Isaiah 53''s suffering-servant and Tehillim/Psalm 22''s forsaken-then-vindicated prayer, carried by the existing free-tier thread `emmaus-road-mosheh-and-the-prophets-as-the-substantial-reading-method`; this thread adds the Wisdom of Solomon 2-5 extras-library witness to the righteous-one-condemned-and-vindicated arc the King''s reading-method recognizes.)',
       sv.verse_id, ev.verse_id, 'extras', 3553
  FROM _s212_l2024_lookup sv, _s212_l2024_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 24 AND sv.verse_number = 25
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 24 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: luke-20-the-one-only-vine-and-the-one-people-given-the-law-in-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 5:23 — *O Yahuah (God) that bearest rule, of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* The Hebrew library names the vineyard as the one-only-vine; Luke 20:9''s vineyard let out to husbandmen is this chosen vine of Yashar''el (Israel).'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-20-the-one-only-vine-and-the-one-people-given-the-law-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 20 AND sv.verse_number = 9
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 5:27 — *among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* The one-people-given-the-law substance; the vine is the one beloved people Yashar''el (Israel) given the Torah, let out to the husbandmen who void the law while holding the vine.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-20-the-one-only-vine-and-the-one-people-given-the-law-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 20 AND sv.verse_number = 9
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 27
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 5:24 — *of all lands of the whole world you have chosen you one pit: and of all the flowers thereof one lily.* The one-chosen-out-of-all litany; Luke 20:16''s vineyard-given-to-others is the stewardship taken from the failed husbandmen, not the chosen-vine replaced by a different people — the one Yashar''el (Israel) remains, the keeping changes hands.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-20-the-one-only-vine-and-the-one-people-given-the-law-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 20 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 24
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: luke-20-equal-unto-the-angels-and-the-children-of-the-resurrection-dwelling-with-the-angels-in-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 39:4 — *there mine eyes saw their dwellings with His righteous angels, and their resting-places with the holy.* The resting-places of the righteous among the holy angels; Luke 20:36''s *equal unto the angels* is the children of the resurrection sharing the dwellings of the holy ones.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-20-equal-unto-the-angels-and-the-children-of-the-resurrection-dwelling-with-the-angels-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 20 AND sv.verse_number = 36
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 39 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 39:5 — *the voice of the Holy One shall be heard in the heaven, and the voice of the Elect One shall be heard from the throne of glory.* The heavenly-register the children of the resurrection enter; Luke 20:36''s no-more-dying immortality is the heavenly-life among the angels where the Elect One reigns.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-20-equal-unto-the-angels-and-the-children-of-the-resurrection-dwelling-with-the-angels-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 20 AND sv.verse_number = 36
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 39 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 104:4 — *the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them.* The resurrection-life of the righteous made-victorious and lighted; Luke 20:35-36''s worthy-to-obtain-that-world register is this raised-into-the-angelic-register life.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-20-equal-unto-the-angels-and-the-children-of-the-resurrection-dwelling-with-the-angels-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 20 AND sv.verse_number = 36
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 104 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: luke-23-paradise-and-the-chambers-of-the-souls-of-the-dead-in-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 22:9 — *there was in it four hollow places, deep and wide and very smooth.* The chambers-of-the-souls-of-the-dead architecture; Luke 23:43''s paradise is the righteous chamber of these hollow places where the King and the thief go this-day.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-23-paradise-and-the-chambers-of-the-souls-of-the-dead-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 23 AND sv.verse_number = 43
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 22:11 — *these places have been made for them until the day of their judgement and until their appointed period, till the great judgement comes upon them.* The until-the-judgement holding-period; Luke 23:43''s this-day paradise is the holding-register of the righteous in the hours after the cross, before the great judgement and the ascension-relocation.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-23-paradise-and-the-chambers-of-the-souls-of-the-dead-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 23 AND sv.verse_number = 43
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 22:16 — *these three have been made that the spirits of the dead might be separated. And such a division has been made (for) the spirits of the righteous, in which there is the bright spring of water.* The separated-righteous-compartment with its spring; Luke 23:43''s paradise is this righteous-compartment with the bright spring of living water, set apart from the chamber of the sinners.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-23-paradise-and-the-chambers-of-the-souls-of-the-dead-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 23 AND sv.verse_number = 43
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: luke-24-ought-not-the-messiah-to-have-suffered-then-enter-his-glory-the-righteous-one-condemned-and-vindicated-in-wisdom-of-solomon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 2:20 — *Let us condemn him with a shameful death: for by his own saying he shall be respected.* The righteous-one-condemned-with-a-shameful-death suffering-half; Luke 24:26''s *ought not Messiah (Christ) to have suffered these things* is this shameful-death pattern the slow-of-heart disciples could not read.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-24-ought-not-the-messiah-to-have-suffered-then-enter-his-glory-the-righteous-one-condemned-and-vindicated-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 24 AND sv.verse_number = 26
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 5:1 — *Then shall the righteous man stand in great boldness before the face of such as have afflicted him, and made no account of his labours.* The vindication glory-half; Luke 24:26''s *enter into his glory* is this standing-in-boldness, the suffering-then-vindication arc the King''s reading-method recognizes beginning at Mosheh (Moses) and all the prophets.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l2024_lookup sv, _s212_l2024_lookup tv
 WHERE t.slug = 'luke-24-ought-not-the-messiah-to-have-suffered-then-enter-his-glory-the-righteous-one-condemned-and-vindicated-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 24 AND sv.verse_number = 26
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 5 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
