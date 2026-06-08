-- =====================================================================
-- S212 minion fragment — Mark 13-16 outside-canon (extras) cross-references
-- =====================================================================
-- Range:    Mark 13, 14, 15, 16 (Olivet discourse / the gathering of the
--           elect from the four winds; the anointing at Bethany; the Last
--           Supper / the blood of the covenant; Gethsemane; the trial /
--           "I am" / "ye shall see the Son of Adam sitting on the right
--           hand of power"; Peter's denial; the crucifixion / "my Elohim
--           my Elohim why hast thou forsaken me" / the veil rent; the
--           resurrection).
-- Tag:      m1316   (temp view _s212_m1316_lookup)
-- Band:     sort_order 3290-3319
--
-- Mark already carries FULL canon coverage for this range in S183
-- (abomination-of-desolation, no-man-knoweth-the-day, like-the-son-of-
-- adam-coming-with-the-clouds at 13:26 & 14:62 [canon Daniel/Rev/Zech],
-- wheat-and-tares post-harvest sifting at 13:27 [canon Ezekiel/Deut],
-- abba-father at 14:36, last-supper / barabbas / his-blood-be / eli-eli /
-- veil-of-the-temple / sanhedrin-trial-Tehillim-110-and-Daniel-7 /
-- substantial-crucifixion / women-as-first-witnesses). Mark had ZERO
-- outside-canon member rows. This fragment ADDS three framework-bearing
-- extras threads that the existing Matthew extras threads carry only at
-- Matthew anchors (Matthew slugs are globally taken; these are NEW
-- Mark-prefixed slugs so they complement, never duplicate):
--
--   1. mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach   (sort 3290)
--        targets: apocrypha 2-esdras 13:39,40,47 ; baruch-with-the-letter-of-jeremiah 4:37 & 5:5 ; ecclesiasticus 36:11
--   2. mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables                              (sort 3291)
--        targets: enoch 1-enoch 46:1,3,4 ; 62:1,7,9
--   3. mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees               (sort 3292)
--        targets: apocrypha 1-maccabees 1:63 & 2:50 ; 2-maccabees 7:36
--
-- 15 cross_references rows (all tier_required='extras'); 15 thread_members.
--
-- Kaph note (Red Line #12): Mark 13:26 and 14:62 are DIRECT attribution
-- ("the Son of Adam coming in the clouds", "ye shall see the Son of Adam
-- sitting on the right hand of power") — NO kaph. The kaph-comparative
-- carve-out applies only to Daniel 7:13 / Revelation 1:13 / Revelation
-- 14:14, none of which is touched here. 1 Enoch 46-62 names the Son of
-- Adam as a title (the Elect One seated on the throne of glory) — this is
-- title-naming, NOT the kaph-comparative, and it harmonizes with the
-- direct-attribution Markan self-identification at 14:62. Thread 2 keeps
-- that distinction explicit.
--
-- No-add chapters: Mark 15 and Mark 16 warrant no NEW extras thread. The
-- crucifixion substance (Tehillim 22 citation, Yeshayahu 53, the veil
-- rent) and the resurrection-witness substance are already carried at
-- canon tier in S183, and the framework-bearing extras already in the
-- corpus for the veil (the-temple-veil-rent...-in-2-baruch-and-
-- testaments-xii) and the cup of suffering / vindication of the righteous
-- (the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-
-- of-solomon-and-2-maccabees) and the resurrection-substance are anchored
-- elsewhere; no distinct Mark 15/16 outside-canon connection rises to the
-- rigour the migration requires without re-treading those threads.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view. Same edition filter family as S135 / the brief.
CREATE TEMP VIEW _s212_m1316_lookup AS
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
-- Insert 14 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach
  ('canon', 'mark', 13, 27, 'apocrypha', '2-esdras', 13, 39,
   E'*And whereas you sawest that he gathered another peaceable multitude to him.* 2 Esdras (4 Ezra) 13:39 names the peaceable-multitude the Most High gathers to the man who ascends — and the verses that follow (13:40-47) identify them by name: the ten tribes of the house of Yashar''el (Israel) carried away captive. Mark 13:27''s *he shall send his angels, and shall gather together his elect from the four winds* walks the same architecture the Hebrew library had already named: the gathering is the homecoming of the scattered paternal-blood remnant, not the assembling of a self-selected community. The wisdom-stream names whom the gathering gathers.'),
  ('canon', 'mark', 13, 27, 'apocrypha', '2-esdras', 13, 40,
   E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land.* 2 Esdras (4 Ezra) 13:40 names the ten tribes of the house of Yashar''el (Israel) by the precise history of their scattering — the Assyrian captivity under Hoshea and Shalmaneser. Mark 13:27''s gathering *from the uttermost part of the earth to the uttermost part of heaven* is the answering-act to this scattering: the same tribes the Hebrew library traced into the further country are the elect the angels gather at the end.'),
  ('canon', 'mark', 13, 27, 'apocrypha', '2-esdras', 13, 47,
   E'*The Highest shall stay the springs of the stream again, that they may go through: therefore sawest you the multitude with peace.* 2 Esdras (4 Ezra) 13:47 names the return-passage the Most High opens for the ten tribes at the latter time — the same Most High who held the flood for them at the going-out holds it again for the coming-home. Mark 13:27''s gathering of the elect from the four winds is the gospel-form of this homecoming the wisdom-stream had already named: the scattered seed brought back by the act of the Most High, not by their own contriving.'),
  ('canon', 'mark', 13, 27, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37,
   E'*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* Baruch 4:37 names the four-quarters gathering directly — the sons who were sent away come *from the east to the west by the word of the Holy One.* Mark 13:27''s *gather together his elect from the four winds* walks the same Hebrew library architecture: the gathering is of those who were sent away (the scattered), and it is accomplished by the word of the Holy One — the Son of Adam who has just been named coming in the clouds (13:26).'),
  ('canon', 'mark', 13, 27, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5,
   E'*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch 5:5 names the gathering from the opposite quarter — *from the west to the east* — so that Baruch 4:37 and 5:5 together name the gathering from every direction, the four-winds substance Mark 13:27 carries. The children gathered are the scattered children of Yerushalayim (Jerusalem) brought home by the word of the Holy One; Mark''s *from the four winds, from the uttermost part of the earth* is the same paternal-blood ingathering at the end of the age.'),
  ('canon', 'mark', 13, 27, 'apocrypha', 'ecclesiasticus', 36, 11,
   E'*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* Sirach (Ecclesiasticus) 36:11 prays the gathering as the petition of the wisdom-stream — *gather all the tribes of Jacob together* — and names whom: not a believing remnant of any people, but *all the tribes of Jacob,* the twelve-tribe inheritance *as from the beginning.* Mark 13:27''s gathering of the elect from the four winds is the answered form of this prayer: the Son of Adam sends his angels to gather the very tribes the Hebrew library had been praying home.'),

  -- Thread 2: mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 46, 1,
   E'*And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man, and his face was full of graciousness, like one of the holy angels.* 1 Enoch 46:1 names the throne-room scene the King invokes under oath at Mark 14:62 — *ye shall see the Son of Adam sitting on the right hand of power.* The Parables of Enoch place the Son of Adam beside the Head of Days: the Formed beside the Formless source. Mark 14:62 is direct attribution (no kaph); 1 Enoch 46 names the Son of Adam as a title, the figure beside the Head of Days — title-naming, distinct from the kaph-comparative of Daniel 7:13 / Revelation 1:13 / Revelation 14:14. The two harmonize: the King names himself the one the Parables saw beside the Head of Days.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 46, 3,
   E'*This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* 1 Enoch 46:3 names the Son of Adam as the chosen one whose lot has the pre-eminence before Yahuah (God) of Spirits for ever. Mark 14:62''s *the Son of Adam sitting on the right hand of power* names the same pre-eminence-at-the-right-hand the Parables had already given the chosen Son of Adam. The wisdom-stream named the enthroned, chosen Son of Adam; the King names himself as that figure at the Sanhedrin''s own question.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 46, 4,
   E'*And this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, and shall loosen the reins of the strong, and break the teeth of the sinners.* 1 Enoch 46:4 names the judging-act of the enthroned Son of Adam — he raises the kings and the mighty from their thrones. Mark 14:62''s *ye shall see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* carries the same architecture: the figure the Sanhedrin condemns is the figure who will raise the mighty from their seats. The wisdom-stream had already named the reversal — the condemned Son of Adam is the one enthroned to judge those who condemn him.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 62, 1,
   E'*And thus Yahuah (God) of Spirits named the Elect One, and seated him on the throne of His glory, and he shall judge all the works of the holy in heaven above, and weigh their deeds in the balance.* 1 Enoch 62:1 names the seating directly — the Elect One *seated on the throne of His glory.* Mark 14:62''s *sitting on the right hand of power* walks the same enthronement the Parables had already named. The Hebrew library names the throne of glory the Son of Adam is seated upon; the King names himself seated at the right hand of power before the very court that thinks it judges him.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 62, 7,
   E'*And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, and righteousness abides over him, and the righteousness of the Head of Days forsakes him not.* 1 Enoch 62:7 names the Son of Adam born unto righteousness, over whom the righteousness of the Head of Days never fails. Mark 14:62''s self-identification — *I am: and ye shall see the Son of Adam sitting on the right hand of power* — names the same figure the Parables named: the righteous one whom the Head of Days does not forsake, enthroned at the right hand. The title-naming of the Parables and the direct attribution of the King land on one figure.'),
  ('canon', 'mark', 14, 62, 'enoch', '1-enoch', 62, 9,
   E'*And this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, and the strong from their thrones, and shall loosen the reins of the strong, and break the teeth of the sinners.* 1 Enoch 62:9 names again the judging-reversal of the enthroned Son of Adam — the kings and the mighty raised from their thrones before him. Mark 14:62''s *coming in the clouds of heaven* binds the enthronement to the return: the same Son of Adam seated at the right hand of power comes to judge those who condemned him. The wisdom-stream named the kings-and-mighty-cast-down architecture the King invokes at the trial.'),

  -- Thread 3: mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees
  ('canon', 'mark', 14, 24, 'apocrypha', '1-maccabees', 1, 63,
   E'*Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* 1 Maccabees 1:63 names the faithful who chose death rather than profane the holy covenant. Mark 14:24''s *this is my blood of the new testament, which is shed for many* names the covenant sealed in blood — the King''s own blood given for the covenant. The Hebrew library had named the faithful dying for the covenant; the King names the covenant itself sealed by the blood he is about to shed.'),
  ('canon', 'mark', 14, 24, 'apocrypha', '1-maccabees', 2, 50,
   E'*Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* 1 Maccabees 2:50 names Mattathias'' charge — give your lives for the covenant of your fathers. Mark 14:24''s *my blood of the new testament, which is shed for many* is the King giving his own life for the covenant, the substance the Hebrew library named at the martyr-register. The covenant the Maccabean faithful died for is the covenant the King seals in his blood shed for many — the blood-of-the-covenant architecture the wisdom-stream had already carried.'),
  ('canon', 'mark', 14, 24, 'apocrypha', '2-maccabees', 7, 36,
   E'*For our brothers, who now have suffered a short pain, are dead under the covenant of Yahuah (God) of everlasting life.* 2 Maccabees 7:36 names the brothers dead *under the covenant of Yahuah (God) of everlasting life* — the faithful-unto-death-for-the-covenant whose dying is held within the covenant of everlasting life. Mark 14:24''s blood *shed for many* is the covenant-of-everlasting-life sealed in the King''s blood; the Hebrew library named the everlasting-life covenant the martyrs died under, and the King names the blood that seals it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_m1316_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug      = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number   = i.src_v
  JOIN _s212_m1316_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug      = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number   = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 3 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach',
       E'The gathering of the elect from the four winds and the ten tribes in 2 Esdras, Baruch, and Sirach',
       E'Mark 13:27 — *and then shall he send his angels, and shall gather together his elect from the four winds, from the uttermost part of the earth to the uttermost part of heaven* — names the ingathering that answers the scattering. The canon anchors (Ezekiel 37:21, Deuteronomy 30:4) are carried at the free tier in S183; the Hebrew library names whom the gathering gathers. 2 Esdras (4 Ezra) 13:39-47 identifies the *peaceable multitude* the man-who-ascends gathers as the ten tribes of the house of Yashar''el (Israel): *those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive* (13:40), and the Most High *shall stay the springs of the stream again, that they may go through* at the latter time (13:47) — the same act that held the flood at the going-out opens the passage at the coming-home. Baruch names the four-quarters gathering directly: *your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One* (4:37), and *behold your children gathered from the west to the east by the word of the Holy One* (5:5) — the two together naming the gathering from every direction, accomplished by the word of the Holy One (the Son of Adam just named coming in the clouds at 13:26). Sirach (Ecclesiasticus) 36:11 prays it as petition: *gather all the tribes of Jacob together, and inherit you them, as from the beginning* — not a believing remnant of any people, but all twelve tribes, the inheritance as from the beginning. The gathering of the elect from the four winds is the homecoming of the scattered paternal-blood remnant the prophets and the wisdom-stream named — accomplished by the act of the Most High, not by a self-selected community''s contriving.',
       sv.verse_id, ev.verse_id, 'extras', 3290
  FROM _s212_m1316_lookup sv, _s212_m1316_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 13 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables',
       E'The Son of Adam enthroned on the throne of glory in the Parables of Enoch',
       E'Mark 14:62 — the King''s answer under oath at the Sanhedrin: *I am: and ye shall see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* This is direct attribution — no kaph. (The kaph-comparative carve-out of Red Line #12 applies only to Daniel 7:13 / Revelation 1:13 / Revelation 14:14, none of which is in view here.) The Parables of Enoch name the same figure as a title, the Son of Adam beside the Head of Days: *with Him was another being whose countenance had the appearance of a man... this is the Son of Adam who hath righteousness, with whom dwelleth righteousness... whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever* (1 Enoch 46:1, 3), and *this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats* (46:4). 1 Enoch 62 names the seating directly: *Yahuah (God) of Spirits named the Elect One, and seated him on the throne of His glory* (62:1); *this is the Son of Adam who is born unto righteousness, and righteousness abides over him, and the righteousness of the Head of Days forsakes him not* (62:7); and again the judging-reversal — *this Son of Adam... shall raise up the kings and the mighty from their seats, and the strong from their thrones* (62:9). The Parables'' Son of Adam is title-naming, not the kaph-comparative — the named, chosen figure beside the Head of Days (the Formed beside the Formless source), seated on the throne of glory, who raises the mighty from their thrones. Mark 14:62''s direct self-identification lands on the same figure: the condemned one at the Sanhedrin''s bar is the enthroned Son of Adam who will raise the very court that condemns him from its seat. The wisdom-stream named the enthroned Son of Adam and the kings-and-mighty-cast-down reversal the King invokes at his trial.',
       sv.verse_id, ev.verse_id, 'extras', 3291
  FROM _s212_m1316_lookup sv, _s212_m1316_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 14 AND ev.verse_number = 62
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees',
       E'The blood of the covenant and the faithful unto death for the covenant in Maccabees',
       E'Mark 14:24 — *this is my blood of the new testament, which is shed for many.* The cup names the covenant sealed in blood. The Hebrew library''s Maccabean register names the faithful-unto-death-for-the-covenant the King''s own blood now fulfills. 1 Maccabees 1:63 names those who chose death rather than profane the covenant: *they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* 1 Maccabees 2:50 names Mattathias'' charge to his sons: *be you zealous for the law, and give your lives for the covenant of your fathers.* 2 Maccabees 7:36 names the brothers *dead under the covenant of Yahuah (God) of everlasting life* — the dying held within the everlasting-life covenant. The Maccabean faithful gave their lives for the covenant of their fathers; the King gives his own life for the covenant, and his blood shed for many is the covenant-of-everlasting-life the martyrs died under, now sealed. The blood-of-the-covenant the wisdom-stream carried at the martyr-register is the blood the King pours out at the Last Supper.',
       sv.verse_id, ev.verse_id, 'extras', 3292
  FROM _s212_m1316_lookup sv, _s212_m1316_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 24
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'mark' AND ev.chapter_number = 14 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras (4 Ezra) 13:39 — *and whereas you sawest that he gathered another peaceable multitude to him.* The peaceable multitude the man-who-ascends gathers, named in the verses following as the ten tribes; Mark 13:27''s gathering of the elect from the four winds walks the same homecoming-of-the-scattered architecture.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 39
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras (4 Ezra) 13:40 — *those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive.* The wisdom-stream names the scattered by the precise history of the Assyrian captivity; Mark 13:27 gathers the same tribes home from the uttermost parts.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 40
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras (4 Ezra) 13:47 — *the Highest shall stay the springs of the stream again, that they may go through.* The Most High opens the return-passage for the ten tribes at the latter time; Mark 13:27''s gathering of the elect is the act of the Most High, not the scattered''s own contriving.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 47
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Baruch 4:37 — *lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* The four-quarters gathering accomplished by the word of the Holy One; Mark 13:27''s *gather together his elect from the four winds* walks the same architecture, the gathering of those who were sent away.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Baruch 5:5 — *behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* The gathering from the opposite quarter; with 4:37 it names the gathering from every direction — the four-winds substance Mark 13:27 carries.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach (Ecclesiasticus) 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The gathering prayed as petition in the wisdom-stream, naming all twelve tribes; Mark 13:27''s gathering of the elect from the four winds is the answered form of the prayer.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-13-the-gathering-of-the-elect-from-the-four-winds-and-the-ten-tribes-in-2-esdras-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 13 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 46:1 — *with Him was another being whose countenance had the appearance of a man... like one of the holy angels.* The Son of Adam beside the Head of Days (the Formed beside the Formless source); Mark 14:62''s direct attribution (*the Son of Adam sitting on the right hand of power*, no kaph) names himself the figure the Parables saw beside the Head of Days. Title-naming, distinct from the kaph-comparative of Daniel 7:13.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 46:3 — *this is the Son of Adam who hath righteousness... whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* The chosen Son of Adam whose lot has the pre-eminence; Mark 14:62''s *sitting on the right hand of power* names the same pre-eminence-at-the-right-hand.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 46:4 — *this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats.* The judging-reversal of the enthroned Son of Adam; Mark 14:62''s *coming in the clouds of heaven* binds the enthronement to the judgment of those who condemn him.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 62:1 — *Yahuah (God) of Spirits named the Elect One, and seated him on the throne of His glory.* The seating named directly; Mark 14:62''s *sitting on the right hand of power* walks the same enthronement on the throne of glory.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 62:7 — *this is the Son of Adam who is born unto righteousness... and the righteousness of the Head of Days forsakes him not.* The righteous Son of Adam whom the Head of Days never forsakes; Mark 14:62''s *I am: and ye shall see the Son of Adam sitting on the right hand of power* names the same figure enthroned at the right hand.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 62:9 — *this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, and the strong from their thrones.* The kings-and-mighty-cast-down reversal named again; Mark 14:62''s enthroned-and-coming Son of Adam is the figure who raises the very court that condemns him from its seat.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-son-of-adam-enthroned-on-the-throne-of-glory-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 62
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:63 — *they chose rather to die, that they might not... profane the holy covenant: so then they died.* The faithful dying rather than profane the covenant; Mark 14:24''s *my blood of the new testament, which is shed for many* names the covenant itself sealed by the King''s own blood.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '1-maccabees' AND tv.chapter_number = 1 AND tv.verse_number = 63
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 2:50 — *be you zealous for the law, and give your lives for the covenant of your fathers.* Mattathias'' charge to give their lives for the covenant; Mark 14:24''s blood shed for many is the King giving his own life for the covenant the faithful died for.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '1-maccabees' AND tv.chapter_number = 2 AND tv.verse_number = 50
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:36 — *our brothers... are dead under the covenant of Yahuah (God) of everlasting life.* The martyrs dead under the covenant of everlasting life; Mark 14:24''s blood shed for many seals the covenant-of-everlasting-life the wisdom-stream named the faithful dying under.'
  FROM cross_reference_threads t, cross_references x, _s212_m1316_lookup sv, _s212_m1316_lookup tv
 WHERE t.slug = 'mark-14-the-blood-of-the-covenant-and-the-faithful-unto-death-for-the-covenant-in-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'mark' AND sv.chapter_number = 14 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-maccabees' AND tv.chapter_number = 7 AND tv.verse_number = 36
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
