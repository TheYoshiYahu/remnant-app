-- =====================================================================
-- S212 minion — Mark 9-12 outside-canon (extras-library) cross-references
-- =====================================================================
-- Range:      Mark 9, 10, 11, 12
-- Tag:        m0912  (temp view _s212_m0912_lookup)
-- Sort band:  3260-3289
-- Output:     scratch_xref/minion_mark_09_12.sql
--
-- Mark, Luke, and John carry ZERO outside-canon cross-references at the
-- member-row level; the S183 canon migration quotes Tanakh anchors but
-- never inserts extras-library member rows. This fragment adds the
-- framework-bearing extras connections Mark 9-12 warrants, promoting the
-- Hebrew library's own witness onto the chapter cards.
--
-- Four new PROPOSED threads at tier_required='extras':
--   1. mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch   (sort 3260)
--        targets: apocrypha (Judith), enoch (1 Enoch)
--   2. mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach                    (sort 3261)
--        targets: apocrypha (Ecclesiasticus / Sirach)
--   3. mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras             (sort 3262)
--        targets: apocrypha (2 Esdras)
--   4. mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon  (sort 3263)
--        targets: apocrypha (Wisdom of Solomon)
--
-- 12 new cross_references rows, 12 thread_members rows, all tier_required='extras'.
--
-- Deliberately NOT duplicated (already covered elsewhere in the corpus):
--   * Mark 10:45 ransom-for-many — the extras thread
--     `the-son-of-adam-came-to-give-his-life-a-ransom-for-many-in-1-enoch-testaments-and-sirach`
--     (S155, anchored Matt 20:28) already exists, and S183 already wires Mark 10:45
--     into it as a canon-side member (Isaiah 53:10). Adding a second Mark-anchored
--     ransom extras thread would duplicate the framework connection — skipped.
--   * Mark 12:17 render-unto-Caesar — `render-unto-caesar-and-the-image-of-elohim-stamped-
--     on-man-in-sirach-and-wisdom-of-solomon` (S155, Matt 22:21) already carries the
--     image-of-Elohim-stamped-on-man extras architecture with the same target verses.
--   * Mark 12:30-31 Shema / love of Yahuah and neighbour —
--     `love-of-yahuah-and-love-of-neighbor-as-the-shema-walked-out-in-sirach-and-wisdom-of-solomon`
--     (S155, Matt 22:37) already covers the greatest-commandment extras stream.
--   * Mark 12:36 David's Lord — `tehillim-110-1-davids-lord-formed-at-the-right-hand`
--     already exists canon-side (S183). No framework-bearing extras add the chapter
--     warrants beyond what the canon thread carries.
--   Mark 11 (triumphal entry, fig tree, temple cleansing, wicked-husbandmen authority
--   question) surfaced no NEW framework-bearing extras connection at the rigour the
--   migration requires beyond the cursed-fig-tree link S183 already places onto the
--   existing `leaves-without-fruit-judged-in-wisdom-of-solomon-sirach-and-1-enoch`
--   thread (Mark 11:20). No Mark-11-anchored add.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (uniquely named — m0912 tag).
CREATE TEMP VIEW _s212_m0912_lookup AS
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
  -- Thread 1: mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch
  ('canon', 'mark', 9, 48, 'apocrypha', 'judith', 16, 17,
   E'*Woe to the nations that rise up against my kindred! Yahuah (God) Almighty will take vengeance of them in the day of judgment, in putting fire and worms in their flesh; and they shall feel them, and weep for ever.* Judith 16:17 names the fire-and-worms judgment register in the same breath the gospel uses at Mark 9:48 — *where their worm dieth not, and the fire is not quenched.* The Hebrew library''s victory-song already pairs the unquenched fire with the deathless worm and the everlasting feeling of it; the King reads the same Tanakh-rooted Gehenna-image (Isaiah 66:24) that Judith''s song carries. The day-of-judgment frame and the *weep for ever* duration are the architecture Mark 9:48 walks.'),
  ('canon', 'mark', 9, 48, 'enoch', '1-enoch', 22, 11,
   E'*And these places have been made for them until the day of their judgement and until their appointed period, till the great judgement comes upon them.* 1 Enoch 22:11 names the place where the spirits of the dead are set apart against the great judgement — the framework-honest holding of the dead until the day, the architecture behind Mark 9:43-48''s *hell* (Gehenna). 1 Enoch 22 carries the same two-compartment structure the King names elsewhere; the place of punishment Mark warns against is the place 1 Enoch had already mapped, not the inherited eternal-torment caricature.'),
  ('canon', 'mark', 9, 43, 'enoch', '1-enoch', 27, 2,
   E'*And there was a holy mountain, and under the mountain to the east there was a stream flowing, and to the south another stream.* 1 Enoch 27:1-3 places the accursed valley — the Hinnom-shaped place of punishment for the godless — beside the holy mountain, the very Ge-Hinnom topography the gospel''s *hell* (Gehenna) draws its name from. The King''s *cut it off ... than having two hands to go into hell* (Mark 9:43) walks the same place-of-judgment architecture 1 Enoch maps at the middle of the earth: the accursed valley appointed for the day of judgment.'),

  -- Thread 2: mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach
  ('canon', 'mark', 10, 21, 'apocrypha', 'ecclesiasticus', 31, 8,
   E'*Blessed is the rich that is found without blemish, and has not gone after gold.* Sirach (Ecclesiasticus) 31:8 names the rare-blessing of the rich-who-has-not-gone-after-gold — the exact test the rich young ruler fails at Mark 10:21-22. The King''s *one thing thou lackest: go thy way, sell whatsoever thou hast, and give to the poor* lays the wisdom-stream''s diagnostic bare: the man''s riches have his heart, and he goes away grieved *for he had great possessions.* The Hebrew library had already named the blessedness of the rich who is not held by his gold; the gospel names the man held.'),
  ('canon', 'mark', 10, 23, 'apocrypha', 'ecclesiasticus', 31, 5,
   E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* Sirach (Ecclesiasticus) 31:5 names the gold-love-disqualifies architecture directly. Mark 10:23''s *how hardly shall they that have riches enter into the kingdom of Elohim (God)!* walks the same architecture at the kingdom-entry level: the gold-lover the wisdom-stream says shall not be justified is the rich man the gospel says hardly enters the kingdom.'),
  ('canon', 'mark', 10, 24, 'apocrypha', 'ecclesiasticus', 31, 6,
   E'*Gold has been the ruin of many, and their destruction was present.* Sirach (Ecclesiasticus) 31:6 names the gold-as-ruin diagnostic. Mark 10:24''s clarifying word — *how hard is it for them that trust in riches to enter into the kingdom of Elohim (God)!* — lands the diagnostic exactly where the wisdom-stream lands it: not on the riches themselves but on the trust-in-riches that has been the ruin of many. The closed hand that trusts in gold is the heart the gospel warns cannot pass through the needle''s eye.'),
  ('canon', 'mark', 10, 25, 'apocrypha', 'ecclesiasticus', 31, 7,
   E'*It is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* Sirach (Ecclesiasticus) 31:7 names gold-as-stumblingblock-for-those-who-sacrifice-to-it — wealth as an object of worship that captures its devotees. Mark 10:25''s *it is easier for a camel to go through the eye of a needle, than for a rich man to enter into the kingdom of Elohim (God)* walks the same architecture: the one taken by the gold he sacrifices to cannot pass into the kingdom while the gold holds him.'),

  -- Thread 3: mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras
  ('canon', 'mark', 12, 1, 'apocrypha', '2-esdras', 5, 23,
   E'*O Yahuah (God) that bearest rule, of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* 2 Esdras 5:23 names the one-chosen-vine architecture — Yahuah''s singular election of one vine out of all the trees of the earth, the wisdom-stream''s own naming of the vineyard the King plants in the parable of Mark 12:1. The vineyard *let out to husbandmen* is the one-only-vine 2 Esdras names: the covenant body Yashar''el (Israel), chosen out of all the peoples, set with hedge and tower and winefat, then entrusted to the keepers who fail it.'),
  ('canon', 'mark', 12, 9, 'apocrypha', '2-esdras', 5, 27,
   E'*And among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* 2 Esdras 5:27 names the one-chosen-people-given-the-law architecture the wicked-husbandmen parable presupposes — the vineyard is the one people loved and given the Torah. Mark 12:9''s *what shall therefore the lord of the vineyard do? he will come and destroy the husbandmen, and will give the vineyard unto others* turns on the same election: the vineyard belongs to the lord who chose it, not to the keepers; the keepers who slay the heir forfeit the stewardship, but the one-only-vine remains the lord''s own.'),
  ('canon', 'mark', 12, 9, 'apocrypha', '2-esdras', 5, 29,
   E'*And they which did gainsay your promises, and believed not your covenants, have trodden them down.* 2 Esdras 5:29 names the covenant-trodden-down by those who gainsay the promises — the wisdom-stream''s lament over the very failure the wicked husbandmen embody at Mark 12. The keepers who beat the servants, kill the heir, and seize the inheritance are those who gainsaid the promises and believed not the covenants; the lord''s coming to destroy them and give the vineyard to others (Mark 12:9) answers the 2 Esdras lament with the master''s own judgment.'),

  -- Thread 4: mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon
  ('canon', 'mark', 12, 27, 'apocrypha', 'the-wisdom-of-solomon', 3, 1,
   E'*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Wisdom of Solomon 3:1 names the souls-of-the-righteous-in-the-Father''s-hand architecture the King invokes at Mark 12:27 — *he is not the Elohim (God) of the dead, but the Elohim (God) of the living.* The patriarchs Avraham (Abraham), Yitschaq (Isaac), and Ya''aqov (Jacob) are alive to the Father because the souls of the righteous are held in his hand against the resurrection; the Sadducees who deny the resurrection know neither the scriptures nor the power of Elohim. The Hebrew library had already named the righteous as living in the Father''s hand; the gospel names the same in the bush-revelation.'),
  ('canon', 'mark', 12, 26, 'apocrypha', 'the-wisdom-of-solomon', 3, 4,
   E'*For though they be punished in the sight of men, yet is their hope full of immortality.* Wisdom of Solomon 3:4 names the hope-full-of-immortality the resurrection-argument of Mark 12:26 grounds itself in. The King reads the bush-revelation — *I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob* — as the Father''s standing relation to the living, not to the perished. The wisdom-stream had already named the righteous as carrying a hope full of immortality though they die in the sight of men; the gospel names the resurrection that hope reaches toward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_m0912_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_m0912_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch',
       'The worm dieth not and the place of punishment in Judith and 1 Enoch',
       E'Mark 9:43-48''s thrice-repeated warning — *it is better for thee to enter into life maimed, than having two hands to go into hell, into the fire that never shall be quenched: where their worm dieth not, and the fire is not quenched* — draws its image from Isaiah 66:24 (canon), and the Hebrew library carries the same architecture. Judith 16:17 pairs the deathless worm with the unquenched fire in the day-of-judgment register: *Yahuah (God) Almighty will take vengeance of them in the day of judgment, in putting fire and worms in their flesh; and they shall feel them, and weep for ever.* 1 Enoch maps the place itself: 1 Enoch 22:11 names the holding of the spirits of the dead *until the day of their judgement and until their appointed period, till the great judgement comes upon them* — the framework-honest two-compartment Sheol behind the gospel''s *hell* (Gehenna), not the inherited eternal-torment caricature; 1 Enoch 27:1-3 places the accursed valley beside the holy mountain, the Ge-Hinnom topography the word Gehenna draws its name from. The King names the place of judgment the Hebrew library had already mapped: the deathless worm, the unquenched fire, the accursed valley appointed for the day.',
       sv.verse_id, ev.verse_id, 'extras', 3260
  FROM _s212_m0912_lookup sv, _s212_m0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 9 AND sv.verse_number = 43
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 9 AND ev.verse_number = 48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach',
       'The rich young ruler and riches as snare in Sirach',
       E'Mark 10:17-25''s rich young ruler — who keeps the commandments from his youth yet goes away grieved at the one thing he lacks, *for he had great possessions* — and the King''s following word, *how hardly shall they that have riches enter into the kingdom of Elohim (God)! ... it is easier for a camel to go through the eye of a needle, than for a rich man to enter into the kingdom of Elohim (God),* walk an architecture the Hebrew library''s wisdom-stream had already named at the gold-as-snare level. Sirach (Ecclesiasticus) 31:8 names the rare blessing of the rich-who-is-not-held: *blessed is the rich that is found without blemish, and has not gone after gold.* Sirach 31:5 names the disqualification: *he that loves gold shall not be justified.* Sirach 31:6 names the ruin: *gold has been the ruin of many, and their destruction was present.* Sirach 31:7 names the worship-trap: *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* The diagnostic is not riches-as-such but the heart held by gold — the King''s clarifying word lands it exactly where the wisdom-stream lands it: *how hard is it for them that trust in riches.* The Hebrew library had already named the blessedness of the rich who is not held and the ruin of the one who is; the gospel names the man held, and names the impossibility-made-possible only with Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 3261
  FROM _s212_m0912_lookup sv, _s212_m0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 21
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 10 AND ev.verse_number = 25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras',
       'The wicked husbandmen and the one chosen vine in 2 Esdras',
       E'Mark 12:1-11''s parable of the wicked husbandmen — the vineyard *planted ... and set an hedge about it, and digged a place for the winefat, and built a tower, and let it out to husbandmen,* whose keepers beat the servants, kill the heir, and seize the inheritance until the lord *will come and destroy the husbandmen, and will give the vineyard unto others* — turns on the election of the vineyard the wisdom-stream had already named. 2 Esdras 5:23 names the one chosen vine: *of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* 2 Esdras 5:27 names the one chosen people given the law: *among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* 2 Esdras 5:29 laments the covenant trodden down: *they which did gainsay your promises, and believed not your covenants, have trodden them down.* The vineyard is Yashar''el (Israel), the one-only-vine chosen out of all the trees and the one people given the Torah; the wicked husbandmen are the keepers who gainsay the promises and tread the covenant down, slaying the servants and the heir. The lord''s coming to destroy them and give the vineyard to others answers the 2 Esdras lament: the vineyard belongs to the lord who chose it, and the stewardship passes from the keepers who failed it — not the inheritance taken from the vine, but the keeping taken from the faithless keepers. The rejected stone become the head of the corner (Mark 12:10-11) is Yahuah''s own doing over the same chosen vine.',
       sv.verse_id, ev.verse_id, 'extras', 3262
  FROM _s212_m0912_lookup sv, _s212_m0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 12 AND ev.verse_number = 11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon',
       'The Elohim of the living and the souls of the righteous in Wisdom of Solomon',
       E'Mark 12:18-27''s resurrection-argument against the Sadducees — who say there is no resurrection — turns on the bush-revelation: *have ye not read in the book of Moses, how in the bush Elohim (God) spake unto him, saying, I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob? He is not the Elohim (God) of the dead, but the Elohim (God) of the living.* The Hebrew library''s Wisdom of Solomon had already named the architecture the King reads. Wisdom 3:1 names the souls-of-the-righteous-in-the-Father''s-hand: *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Wisdom 3:4 names the hope-full-of-immortality the resurrection reaches toward: *though they be punished in the sight of men, yet is their hope full of immortality.* The patriarchs are alive to the Father because the souls of the righteous are held in his hand against the resurrection; the Sadducees err because they know neither the scriptures nor the power of Elohim. The wisdom-stream had already named the righteous as living in the Father''s hand and carrying a hope full of immortality; the gospel names the same in the bush-revelation, and names the resurrection that hope reaches toward.',
       sv.verse_id, ev.verse_id, 'extras', 3263
  FROM _s212_m0912_lookup sv, _s212_m0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 26
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 12 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judith 16:17 — *Yahuah (God) Almighty will take vengeance of them in the day of judgment, in putting fire and worms in their flesh; and they shall feel them, and weep for ever.* The Hebrew library''s victory-song pairs the deathless worm with the unquenched fire in the day-of-judgment register; Mark 9:48''s *where their worm dieth not, and the fire is not quenched* walks the same Isaiah-66-rooted image.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 9 AND sv.verse_number = 48
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'judith' AND tv.chapter_number = 16 AND tv.verse_number = 17
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 27:1-3 — the accursed valley beside the holy mountain, the Ge-Hinnom topography the word *hell* (Gehenna) draws its name from; Mark 9:43''s *cut it off ... than having two hands to go into hell* walks the same place-of-judgment architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 9 AND sv.verse_number = 43
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 27 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 22:11 — *these places have been made for them until the day of their judgement ... till the great judgement comes upon them.* The framework-honest two-compartment holding of the dead behind the gospel''s *hell* (Gehenna); Mark 9:48 names the place 1 Enoch had already mapped, not the inherited eternal-torment caricature.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-9-the-worm-dieth-not-and-the-place-of-punishment-in-judith-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 9 AND sv.verse_number = 48
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 31:8 — *blessed is the rich that is found without blemish, and has not gone after gold.* The rare blessing of the rich-who-is-not-held; the rich young ruler of Mark 10:21-22 fails the test and goes away grieved *for he had great possessions.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 21
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 31:5 — *he that loves gold shall not be justified.* The gold-love-disqualifies architecture; Mark 10:23''s *how hardly shall they that have riches enter into the kingdom of Elohim (God)!* walks the same at the kingdom-entry level.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 23
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 31:6 — *gold has been the ruin of many, and their destruction was present.* The gold-as-ruin diagnostic; Mark 10:24''s clarifying *how hard is it for them that trust in riches* lands the diagnostic on the trust-in-riches, exactly where the wisdom-stream lands it.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 31:7 — *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* Wealth as an object of worship that captures its devotees; Mark 10:25''s camel-and-needle names the impossibility for the one taken by the gold he sacrifices to.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-10-the-rich-young-ruler-and-riches-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 10 AND sv.verse_number = 25
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 5:23 — *of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* The one-chosen-vine architecture; the vineyard let out to husbandmen at Mark 12:1 is the one-only-vine Yashar''el (Israel), chosen out of all the trees.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 5:27 — *among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law.* The one-chosen-people-given-the-law; Mark 12:9''s *the lord of the vineyard ... will give the vineyard unto others* turns on the same election — the vineyard belongs to the lord who chose it, the keeping passes from the keepers who failed.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 9
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 27
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 5:29 — *they which did gainsay your promises, and believed not your covenants, have trodden them down.* The covenant-trodden-down lament; the wicked husbandmen who slay the servants and the heir are the keepers who gainsaid the promises, and the lord''s judgment at Mark 12:9 answers the 2 Esdras lament.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-wicked-husbandmen-and-the-one-chosen-vine-in-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 9
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 29
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 3:1 — *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The souls-of-the-righteous-in-the-Father''s-hand; Mark 12:27''s *he is not the Elohim (God) of the dead, but the Elohim (God) of the living* names the patriarchs alive to the Father who holds them against the resurrection.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 3 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:4 — *though they be punished in the sight of men, yet is their hope full of immortality.* The hope-full-of-immortality the resurrection reaches toward; Mark 12:26''s bush-revelation reads the Father''s standing relation to the living, not the perished.'
  FROM cross_reference_threads t, cross_references x,
       _s212_m0912_lookup sv, _s212_m0912_lookup tv
 WHERE t.slug = 'mark-12-the-elohim-of-the-living-and-the-souls-of-the-righteous-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 12 AND sv.verse_number = 26
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 3 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
