-- =====================================================================
-- Session 212 — Luke extras-library (outside-canon) cross-references
-- =====================================================================
-- Fills the Luke gap identified at S212: the existing Luke xref
-- migration carried ZERO outside-canon member rows (extras were quoted in
-- summary_md only / never inserted). This migration adds the missing
-- edition-aware cross-references + framework threads connecting Luke
-- verses to the full restored library (Apocrypha, 1 Enoch, Jubilees,
-- Jasher, Testaments XII / Pseudepigrapha, etc.), per the S194 full-library
-- authoring requirement and the Come-and-See posture (quote in full,
-- stand-alone italics, curated + framework-bearing rows only).
--
-- Assembled from per-chapter-range minion fragments (S212 wave). Every
-- target tuple verified against the parsed editions (verify_fidelity.py:
-- 202/202 faithful; verify_offset.py clean). Sacred names restored;
-- son-of-man -> Son of Adam; English book-name slug fragments.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- Apply (from Yoshi's Mac Terminal):
--   python3 api/apply_migration.py data-schema/migrations/session212_luke_extras_cross_references.sql
-- =====================================================================

\echo 'Session 212 — Luke extras-library cross-references starting...'
BEGIN;

-- ----- fragment: minion_luke_01_04.sql -----
-- =====================================================================
-- S212 — Luke 1-4 OUTSIDE-CANON (extras-library) cross-references
-- =====================================================================
-- Range:  Luke 1, 2, 3, 4
-- Tag:    l0104   (temp view _s212_l0104_lookup)
-- Sort band: 3400-3429
--
-- Context: Mark, Luke, and John have ZERO outside-canon cross-references.
-- The S185 Luke canon migration (session185_luke_xref_members_and_threads.sql)
-- inserted canon-only ('canon' edition filter) member rows for the Luke 1-4
-- beats — the Magnificat, the Benedictus, Simeon & Anna, the Nazareth scroll,
-- and the Luke-3 political backdrop — quoting OT canon witnesses but never
-- inserting a single extras-library member row. This fragment ADDS the
-- framework-bearing extras-library connections those chapters warrant, at
-- tier_required='extras'. It does NOT duplicate any S185 canon thread, and
-- it does NOT reuse the Matt-1 thread `genealogy-as-adamic-toledot` (a
-- Matt 1:1 extras thread) — the Luke genealogy gets its own backward-running
-- Adamic-seed thread.
--
-- Six new extras-tier threads:
--   1. luke-1-gabriel-standing-in-the-presence-in-1-enoch                                  (sort 3400)  -> enoch
--   2. luke-1-the-magnificat-gathering-of-the-tribes-of-jacob-in-sirach-36-and-baruch      (sort 3401)  -> apocrypha (ecclesiasticus, baruch)
--   3. luke-2-the-heavenly-host-praising-before-yahuah-of-spirits-in-1-enoch               (sort 3402)  -> enoch
--   4. luke-3-every-valley-filled-the-gathering-highway-in-baruch-and-1-enoch              (sort 3403)  -> apocrypha (baruch), enoch
--   5. luke-3-the-genealogy-back-to-adam-son-of-elohim-in-jubilees-and-1-enoch             (sort 3404)  -> jubilees, enoch
--   6. luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48 (sort 3405) -> apocrypha (ecclesiasticus)
--
-- 19 new cross_references rows, all tier_required='extras'.
-- 19 new thread_members rows.
-- (Per thread: T1=2, T2=4, T3=3, T4=3, T5=4, T6=3.)
--
-- No chapter in the range was found to warrant zero adds; all four carry at
-- least one framework-bearing extras connection (Luke 1: Gabriel, Magnificat;
-- Luke 2: heavenly host; Luke 3: every-valley-filled gathering-highway, the
-- Adamic genealogy; Luke 4: the individual-mercy contrast cases via Sirach 48).
--
-- The wilderness temptation (Luke 4:1-13) is intentionally NOT given a fresh
-- extras thread here: the Mastema/Azazel temptation-architecture already lives
-- in the corpus (azazel-bound-in-the-wilderness-as-the-temptation-ground,
-- temptation-as-mastema-architecture) anchored at the synoptic temptation
-- accounts; re-anchoring it to Luke 4 would duplicate, not add. Likewise the
-- Luke 1:17 John-in-the-spirit-of-Elias / Sirach 48 material is held off: the
-- Elijah-restoration-pattern threads (eliyahu-as-reproof-prophet-turning-the-
-- heart-in-sirach-48, eliyahu-to-restore-the-tribes-in-sirach-48-and-1-
-- maccabees-2, praise-of-elijah-and-the-yochanan-pattern) already carry that
-- Sirach 48 register; the Luke-4 Nazareth contrast-case thread below uses
-- Sirach 48 for the distinct individual-mercy-contrast reading instead.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the l0104 tag).
CREATE TEMP VIEW _s212_l0104_lookup AS
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
-- Insert 17 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- Thread 1: luke-1-gabriel-standing-in-the-presence-in-1-enoch
  ('canon', 'luke', 1, 19, 'enoch', '1-enoch', 40, 2,
   E'*And on the four sides of Yahuah (God) of Spirits I saw four presences, different from those that stand, and I learnt their names: for the angel that went with me made known to me their names, and showed me all the hidden things.* 1 Enoch 40:2 names the four presences who stand on the four sides of Yahuah of Spirits — the angelic standing-before-the-throne architecture. When Gabriel answers Zecharyah (Zacharias) at Luke 1:19 — *I am Gabriel, that stand in the presence of Elohim (God)* — he names the same standing-before-Yahuah office the Hebrew library already named. The Enochic vision had already seen the presences who stand before the throne; Gabriel names himself as one of them.'),
  ('canon', 'luke', 1, 19, 'enoch', '1-enoch', 40, 9,
   E'*And he said unto me: This first is Michael, the merciful and long-suffering: and the second, who is set over all sickness and all wounds, is Raphael: and the third, who is set over all the powers, is Gabriel: and the fourth, who is set over the repentance unto hope of those who inherit eternal life, is named Phanuel.* 1 Enoch 40:9 names Gabriel by name as the third of the four presences who stand before Yahuah (God) of Spirits. Luke 1:19''s *I am Gabriel, that stand in the presence of Elohim (God)* names the same Gabriel in the same standing-before-the-throne office. The Hebrew library carries the named angel of the presence; the gospel sends that same named angel to the priest at the altar of incense. (And the same Phanuel of v.9 is named at the presentation — Anna *the daughter of Phanuel,* Luke 2:36 — the throne-room names threading into the temple-court narrative.)'),

  -- Thread 2: luke-1-the-magnificat-gathering-of-the-tribes-of-jacob-in-sirach-36-and-baruch
  ('canon', 'luke', 1, 54, 'apocrypha', 'ecclesiasticus', 36, 11,
   E'*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* Sirach (Ecclesiasticus) 36:11 names the gathering-of-all-the-tribes-of-Jacob as the prayer of the Hebrew library — the same twelve-tribe ingathering the Magnificat sings when Miriam (Mary) names *he hath holpen his servant Yashar''el (Israel), in remembrance of his mercy* (Luke 1:54). The mercy Miriam names is the keeping of the gathering-prayer Sirach already prayed: gather the tribes, inherit them as from the beginning. This is the seed-of-promise gathering, not a metaphorical-Yashar''el.'),
  ('canon', 'luke', 1, 54, 'apocrypha', 'ecclesiasticus', 36, 12,
   E'*O Yahuah (God), have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* Sirach (Ecclesiasticus) 36:12 names Yashar''el as the firstborn-called-by-the-Name and the object of the mercy. Luke 1:54''s *in remembrance of his mercy* toward *his servant Yashar''el* walks the same architecture — the mercy is on the firstborn-people the prophets named, the seed the gathering brings home. The Hebrew library names the mercy on the firstborn; the Magnificat sings that mercy as the keeping of the oath.'),
  ('canon', 'luke', 1, 55, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 36,
   E'*O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* Baruch 4:36 turns the desolate-and-scattered toward the east to behold the gathering-joy coming from Yahuah. Luke 1:55''s *as he spake to our fathers, to Avraham (Abraham), and to his seed for ever* names the same to-the-fathers-and-the-seed-for-ever promise the gathering keeps. The Hebrew library''s gathering-song and the Magnificat''s seed-promise are the same architecture: the scattered seed of the fathers brought home as the oath is kept.'),
  ('canon', 'luke', 1, 55, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37,
   E'*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* Baruch 4:37 names the sons-sent-away coming gathered from east to west by the word of the Holy One. Luke 1:55''s closing of the Magnificat — *to Avraham (Abraham), and to his seed for ever* — is the seed that is gathered. The Hebrew library names the gathering of the sent-away sons; the Magnificat names the oath-to-the-seed that grounds that gathering. The two songs sing one architecture.'),

  -- Thread 3: luke-2-the-heavenly-host-praising-before-yahuah-of-spirits-in-1-enoch
  ('canon', 'luke', 2, 13, 'enoch', '1-enoch', 40, 1,
   E'*And after that I saw thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits.* 1 Enoch 40:1 names the innumerable host — thousands of thousands and myriads of myriads — standing before Yahuah of Spirits. Luke 2:13''s *suddenly there was with the angel a multitude of the heavenly host praising Elohim (God)* names the same innumerable host, now appearing over the fields of the shepherds at the birth of the Formed-Son. The Hebrew library had already seen the host standing before the throne; at the nativity the host descends to praise the One they stand before.'),
  ('canon', 'luke', 2, 14, 'enoch', '1-enoch', 39, 12,
   E'*And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory.* 1 Enoch 39:12 names the praises uttered before Yahuah of glory by the presences of the throne-room. Luke 2:14''s *Glory to Elohim (God) in the highest, and on earth peace, good will toward men* is the same heavenly-praise register, now sounded on earth. The glory the host gives in the highest is the glory the Hebrew library heard them give before the throne; the nativity brings the throne-room praise down to the shepherds'' field.'),
  ('canon', 'luke', 2, 14, 'enoch', '1-enoch', 39, 13,
   E'*And the first voice blesses Yahuah (God) of Spirits for ever and ever.* 1 Enoch 39:13 names the first voice of the host blessing Yahuah of Spirits for ever and ever. The angelic *Glory to Elohim (God) in the highest* of Luke 2:14 is the same blessing-of-the-Most-High the Hebrew library named in the mouths of the host. The host that blesses Yahuah for ever in the Enochic vision is the host that blesses him over Bethlehem; the praise is one praise, heard first in heaven and now on earth.'),

  -- Thread 4: luke-3-every-valley-filled-the-gathering-highway-in-baruch-and-1-enoch
  ('canon', 'luke', 3, 5, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 7,
   E'*For Yahuah (God) has appointed that every high hill, and banks of long continuance, should be cast down, and valleys filled up, to make even the ground, that Yashar''el (Israel) may go safely in the glory of Yahuah (God).* Baruch 5:7 names the every-high-hill-cast-down and the valleys-filled-up as the making-even-of-the-ground so that Yashar''el may go safely home in the glory of Yahuah — the gathering-highway. Luke 3:5''s *every valley shall be filled, and every mountain and hill shall be brought low... and the rough ways shall be made smooth* (Yochanan/John quoting Yeshayahu/Isaiah 40) walks the same valleys-filled / hills-low architecture. The Hebrew library reads the Yeshayahu-40 highway explicitly as the gathering-road of the scattered seed; Yochanan''s preaching opens that same road.'),
  ('canon', 'luke', 3, 6, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 9,
   E'*For Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory with the mercy and righteousness that comes from him.* Baruch 5:9 names Yahuah leading Yashar''el home with joy in the light of his glory. Luke 3:6''s *and all flesh shall see the salvation of Elohim (God)* names the salvation-of-Elohim seen at the end of the leveled highway. The Hebrew library names the glory-led homecoming the gathering-road opens onto; Yochanan (John) names the all-flesh-seeing-the-salvation the same road arrives at. The road in Baruch and the road in Luke 3 lead to the same glory.'),
  ('canon', 'luke', 3, 5, 'enoch', '1-enoch', 1, 6,
   E'*And the high mountains shall be shaken, And the high hills shall be made low, And shall melt like wax before the flame.* 1 Enoch 1:6 names the high-hills-made-low at the coming of the Holy Great One — the same mountains-and-hills-brought-low language Luke 3:5 carries from Yeshayahu (Isaiah) 40: *every mountain and hill shall be brought low.* The Hebrew library carries the hills-made-low as the topography that gives way before the One who comes; Yochanan (John) names the same leveling as the preparation of the way of Yahuah. The hill brought low before the coming-glory is the same motion in both texts.'),

  -- Thread 5: luke-3-the-genealogy-back-to-adam-son-of-elohim-in-jubilees-and-1-enoch
  ('canon', 'luke', 3, 38, 'jubilees', 'jubilees', 4, 7,
   E'*And Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees 4:7 names Shet (Seth) as the *second seed* Elohim raised up to Adam — the seed-line that carries forward after Hevel (Abel) is slain. Luke 3:38''s *which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* runs the genealogy back through that very Sethite seed to Adam, *the son of Elohim.* The Hebrew library names the raising-up of the seed-of-Adam through Shet; the gospel traces the Formed-Son''s genealogy back through that same seed to the Adam who was Elohim''s own son. FRAMEWORK-CENTRAL: the seed-of-Adam lineage is the spine the whole framework rests on, and Jubilees names its first preservation by name.'),
  ('canon', 'luke', 3, 38, 'enoch', '1-enoch', 85, 3,
   E'*Before I took thy mother Edna, I saw in a vision on my bed, and behold a bull came forth from the earth, and that bull was white; and after it came forth a heifer, and along with this (heifer) two young bulls, one of them black and the other red.* 1 Enoch 85:3 opens the Animal Apocalypse with the white bull (Adam) coming forth from the earth, the heifer (Chavah/Eve), and the two young bulls — the black (Cain) and the red (Hevel/Abel). This is the Adamic toledot in vision-form, the same opening of the seed-line Luke 3:38 closes its backward genealogy on: *the son of Adam, which was the son of Elohim (God).* The Hebrew library sees the first man as the white bull from the earth whom Yahuah created; the gospel names the same Adam as the son of Elohim at the head of the seed-line.'),
  ('canon', 'luke', 3, 38, 'enoch', '1-enoch', 85, 8,
   E'*And I saw in my sleep that white bull likewise grow and become a great white bull, and from Him proceeded many white bulls, and they resembled him. And they began to beget many white bulls, which resembled them, one following the other, (even) many.* 1 Enoch 85:8 names the *another white bull* (Shet/Seth) from whom the many white bulls proceed, each resembling the one before — the seed-of-Adam carried forward through the Sethite line, generation following generation. Luke 3:36-38 traces that same white-bull line backward — *Enos... Seth... Adam, which was the son of Elohim (God).* The Hebrew library sees the seed-line as the white bulls one-following-another from Shet; the gospel names the genealogy of the same seed-line back to its Adamic and divine head.'),
  ('canon', 'luke', 3, 37, 'enoch', '1-enoch', 60, 8,
   E'*...where my great-grandfather was taken up, the seventh from Adam, the first man whom Yahuah (God) of Spirits created.* 1 Enoch 60:8 names Enoch (Chanok) as *the seventh from Adam* and names Adam as *the first man whom Yahuah of Spirits created.* Luke 3:37-38 runs the genealogy through *Enoch... Jared... Adam, which was the son of Elohim (God)* — Enoch standing seventh in the line from Adam, exactly as the Hebrew library counts him (the same count Jude 1:14 carries). The Hebrew library names Adam as the first-created man and Enoch as the seventh from him; the gospel''s backward genealogy lands on the same Adam, the son of the Elohim who created him.'),

  -- Thread 6: luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48
  ('canon', 'luke', 4, 25, 'apocrypha', 'ecclesiasticus', 48, 1,
   E'*Then stood up Elias the prophet as fire, and his word burned like a lamp.* Sirach (Ecclesiasticus) 48:1 names Eliyahu (Elias) the prophet who stood up as fire — the prophet the King names at Natsareth (Nazareth) when he points to *the days of Elias, when the heaven was shut up three years and six months* (Luke 4:25). The Hebrew library''s praise-of-Elias is the witness behind the contrast case: it was to none of the many widows in Yashar''el (Israel) that this fire-prophet was sent, but to the widow of Tsarephath (Zarephath) — individual mercy without absorption into the seed-of-promise.'),
  ('canon', 'luke', 4, 25, 'apocrypha', 'ecclesiasticus', 48, 3,
   E'*By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire.* Sirach (Ecclesiasticus) 48:3 names Eliyahu (Elias) shutting up the heaven by the word of Yahuah — the exact famine the King names at Luke 4:25, *when the heaven was shut up three years and six months, when great famine was throughout all the land.* The Hebrew library carries the heaven-shut famine as the setting; the King carries it as the frame for the individual-mercy contrast: in that famine the prophet was sent to one Tsidonian (Sidonian) widow, not to the many widows of Yashar''el — mercy to the foreign-origin individual without the covenant-absorption the marriage-mechanism alone confers.'),
  ('canon', 'luke', 4, 27, 'apocrypha', 'ecclesiasticus', 48, 12,
   E'*Elias it was, who was covered with a whirlwind: and Eliseus was filled with his spirit: while he lived, he was not moved with the presence of any prince, neither could any bring him into subjection.* Sirach (Ecclesiasticus) 48:12 names Eliseus (Elisha) filled with the spirit of Eliyahu (Elias) — the prophet the King names in the second contrast case at Luke 4:27, *many lepers were in Yashar''el (Israel) in the time of Eliseus the prophet; and none of them was cleansed, saving Naaman the Syrian.* The Hebrew library names the Elisha who carried the double-portion spirit and did the wonders; the King names the Syrian commander cleansed by that prophet — individual mercy to the foreign-origin man without absorption into the seed-of-promise. Naaman receives the cleansing; he is not thereby made covenant-seed. The contrast case proves the directional non-symmetry the framework holds against the false-inclusion gospel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l0104_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_l0104_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 6 new extras-tier threads.
-- ---------------------------------------------------------------------

-- Thread 1: luke-1-gabriel-standing-in-the-presence-in-1-enoch  (sort 3400)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-1-gabriel-standing-in-the-presence-in-1-enoch',
       E'Gabriel, that stand in the presence — the named angel of the presence in 1 Enoch',
       E'When the angel answers Zecharyah (Zacharias) at the altar of incense — *I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings* (Luke 1:19) — he names the standing-before-the-throne office the Hebrew library had already named, and names himself by name. 1 Enoch 40:1-2 names the innumerable host *standing before Yahuah (God) of Spirits* and the *four presences* on the four sides of the throne; 1 Enoch 40:9 names them — *Michael... Raphael... Gabriel... Phanuel.* Gabriel is named as the third of the presences who stand before Yahuah of Spirits. The gospel sends that same named angel of the presence to the priest at the hour of incense. The Hebrew library carries the throne-room roster; the gospel sends one named angel from it into the temple-court — and the same Phanuel of the Enochic roster threads into the very next chapter as Anna *the daughter of Phanuel* (Luke 2:36). The angelic office is not a New Testament novelty; the gospel names the angel the wisdom of Enoch the righteous had already seen standing before the throne.',
       sv.verse_id, ev.verse_id, 'extras', 3400
  FROM _s212_l0104_lookup sv, _s212_l0104_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 19
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 1 AND ev.verse_number = 19
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: luke-1-the-magnificat-gathering-of-the-tribes-of-jacob-in-sirach-36-and-baruch  (sort 3401)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-1-the-magnificat-gathering-of-the-tribes-of-jacob-in-sirach-36-and-baruch',
       E'The Magnificat''s mercy to Abraham''s seed — the gathering of the tribes of Jacob in Sirach 36 and Baruch',
       E'The Magnificat closes on the Avraham-seed-promise — *he hath holpen his servant Yashar''el (Israel), in remembrance of his mercy; as he spake to our fathers, to Avraham (Abraham), and to his seed for ever* (Luke 1:54-55) — naming the gathering as the keeping of the oath to the seed, not the establishment of a metaphorical-Yashar''el. The Hebrew library carries the same gathering-prayer. Sirach (Ecclesiasticus) 36:11-12 prays it explicitly: *gather all the tribes of Jacob together, and inherit you them, as from the beginning... have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* Baruch 4:36-37 names the gathering as accomplished motion: *look about you toward the east... Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* The mercy Miriam (Mary) sings is the mercy on the firstborn-people called by the Name; the gathering she names is the gathering of the tribes of Jacob the Hebrew library prayed for. This is the seed-of-promise ingathering — the twelve tribes the prophets named, brought home as the oath to the fathers is kept.',
       sv.verse_id, ev.verse_id, 'extras', 3401
  FROM _s212_l0104_lookup sv, _s212_l0104_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 54
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 1 AND ev.verse_number = 55
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: luke-2-the-heavenly-host-praising-before-yahuah-of-spirits-in-1-enoch  (sort 3402)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-2-the-heavenly-host-praising-before-yahuah-of-spirits-in-1-enoch',
       E'The multitude of the heavenly host — the innumerable host praising before Yahuah of Spirits in 1 Enoch',
       E'Over the fields of the shepherds, *suddenly there was with the angel a multitude of the heavenly host praising Elohim (God), and saying, Glory to Elohim (God) in the highest, and on earth peace, good will toward men* (Luke 2:13-14). The Hebrew library had already seen and heard this host. 1 Enoch 40:1 names the innumerable multitude — *thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits.* 1 Enoch 39:12-13 names their praise — *I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory... the first voice blesses Yahuah (God) of Spirits for ever and ever.* The host that stands before the throne blessing Yahuah for ever in the Enochic vision is the host that descends to praise him over Bethlehem at the birth of the Formed-Son. The praise is one praise — *Glory to Elohim (God) in the highest* — heard first in the throne-room of the Hebrew library''s vision, now sounded down on earth at the nativity.',
       sv.verse_id, ev.verse_id, 'extras', 3402
  FROM _s212_l0104_lookup sv, _s212_l0104_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 2 AND sv.verse_number = 13
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 2 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: luke-3-every-valley-filled-the-gathering-highway-in-baruch-and-1-enoch  (sort 3403)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-3-every-valley-filled-the-gathering-highway-in-baruch-and-1-enoch',
       E'Every valley filled — the gathering-highway of the scattered seed in Baruch and 1 Enoch',
       E'Yochanan (John) preaches the Yeshayahu (Isaiah) 40 highway: *every valley shall be filled, and every mountain and hill shall be brought low; and the crooked shall be made straight, and the rough ways shall be made smooth; and all flesh shall see the salvation of Elohim (God)* (Luke 3:5-6). The Hebrew library reads that same leveled-highway explicitly as the gathering-road of the scattered seed. Baruch 5:7 names it: *Yahuah (God) has appointed that every high hill, and banks of long continuance, should be cast down, and valleys filled up, to make even the ground, that Yashar''el (Israel) may go safely in the glory of Yahuah (God).* Baruch 5:9 names where the road arrives: *Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory.* 1 Enoch 1:6 carries the same hills-made-low at the coming of the Holy Great One: *the high mountains shall be shaken, And the high hills shall be made low.* The valleys-filled and the hills-brought-low are not landscaping for a parade — they are the making-even of the ground so the scattered seed may go safely home in the glory of Yahuah. Yochanan opens the gathering-road; the Hebrew library had already named where it leads and who walks it home.',
       sv.verse_id, ev.verse_id, 'extras', 3403
  FROM _s212_l0104_lookup sv, _s212_l0104_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 5
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 3 AND ev.verse_number = 6
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: luke-3-the-genealogy-back-to-adam-son-of-elohim-in-jubilees-and-1-enoch  (sort 3404)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-3-the-genealogy-back-to-adam-son-of-elohim-in-jubilees-and-1-enoch',
       E'The genealogy back to Adam, the son of Elohim — the seed-of-Adam toledot in Jubilees and 1 Enoch',
       E'Luke runs his genealogy backward to its head: *the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38). The seed-of-Adam lineage is the spine the whole framework rests on, and the Hebrew library names its preservation by name. Jubilees 4:7 names Shet (Seth) as the *second seed* Elohim raised up to Adam after Hevel (Abel) was slain — the seed-line that carries forward. 1 Enoch''s Animal Apocalypse sees the same toledot in vision-form: the white bull (Adam) comes forth from the earth, the heifer (Chavah/Eve), the black and red young bulls (Cain and Hevel), and then *another white bull* (Shet) from whom *proceeded many white bulls, and they resembled him... one following the other* (1 Enoch 85:3, 85:8) — the seed-of-Adam carried forward generation by generation through the Sethite line. 1 Enoch 60:8 names Adam as *the first man whom Yahuah (God) of Spirits created* and Enoch (Chanok) as *the seventh from Adam* — the same seventh-from-Adam count Luke 3:37 runs through and Jude 1:14 carries. The Hebrew library names the raising-up of the seed-of-Adam through Shet, sees it as the white bulls one-following-another, and counts Adam as the first-created head of the line. Luke''s backward genealogy lands on the same Adam — the son of the Elohim who created him. FRAMEWORK-CENTRAL: this is the paternal seed-line the framework is built on, witnessed in the Hebrew library at the head of the world.',
       sv.verse_id, ev.verse_id, 'extras', 3404
  FROM _s212_l0104_lookup sv, _s212_l0104_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 37
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 3 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

-- Thread 6: luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48  (sort 3405)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48',
       E'The individual-mercy contrast cases — Elias, Eliseus, and the famine in Sirach 48',
       E'At Natsareth (Nazareth) the King names the two contrast cases that turn the synagogue to murder-rage: *many widows were in Yashar''el (Israel) in the days of Elias... but unto none of them was Elias sent, save unto Sarepta, a city of Sidon, unto a woman that was a widow. And many lepers were in Yashar''el (Israel) in the time of Eliseus the prophet; and none of them was cleansed, saving Naaman the Syrian* (Luke 4:25-27). These are the INDIVIDUAL-MERCY-WITHOUT-ABSORPTION cases the framework holds against the false-inclusion gospel: foreign-origin individuals — the Tsidonian (Sidonian) widow, the Syrian commander — receive mercy without being thereby made covenant-seed. Absorption into the seed-of-promise runs through the marriage-covenant alone (Rachav/Rahab, Ruth); the contrast cases prove the directional non-symmetry. The Hebrew library carries the prophets behind both cases. Sirach (Ecclesiasticus) 48:1-3 names Eliyahu (Elias) the fire-prophet who *by the word of Yahuah (God)... shut up the heaven* — the very famine the King names. Sirach 48:12 names *Eliseus* (Elisha) *filled with his spirit* — the prophet who cleansed the Syrian. The crowd hears the contrast cases as a threat to the flesh-credential gospel of *we have Avraham (Abraham) to our father* and wants the King dead for it. The Hebrew library names the prophets; the King reads their individual-mercy cases as the tell that exposes the flesh-credential lie.',
       sv.verse_id, ev.verse_id, 'extras', 3405
  FROM _s212_l0104_lookup sv, _s212_l0104_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 4 AND sv.verse_number = 25
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 4 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: luke-1-gabriel-standing-in-the-presence-in-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 40:2 — *I saw four presences, different from those that stand... for the angel that went with me made known to me their names.* The Hebrew library''s standing-before-the-throne presences; Gabriel names himself one of them at Luke 1:19.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-1-gabriel-standing-in-the-presence-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 19
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 40 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 40:9 — *the third, who is set over all the powers, is Gabriel.* The Hebrew library names Gabriel by name among the four presences before Yahuah (God) of Spirits; Luke 1:19''s *I am Gabriel, that stand in the presence of Elohim (God)* names the same angel in the same office. (Phanuel of the same verse threads into Luke 2:36, Anna the daughter of Phanuel.)'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-1-gabriel-standing-in-the-presence-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 19
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 40 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: luke-1-the-magnificat-gathering-of-the-tribes-of-jacob-in-sirach-36-and-baruch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The Hebrew library''s explicit twelve-tribe gathering-prayer; Luke 1:54''s *he hath holpen his servant Yashar''el (Israel)* names the keeping of that gathering.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-1-the-magnificat-gathering-of-the-tribes-of-jacob-in-sirach-36-and-baruch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 54
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach (Ecclesiasticus) 36:12 — *have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* The mercy on the firstborn-people; Luke 1:54''s *in remembrance of his mercy* toward Yashar''el walks the same architecture.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-1-the-magnificat-gathering-of-the-tribes-of-jacob-in-sirach-36-and-baruch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 54
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 4:36 — *O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* The gathering-joy from the east; Luke 1:55''s *to Avraham (Abraham), and to his seed for ever* names the seed-promise the gathering keeps.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-1-the-magnificat-gathering-of-the-tribes-of-jacob-in-sirach-36-and-baruch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 55
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 36
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Baruch 4:37 — *Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* The sent-away sons gathered home; Luke 1:55''s closing *and to his seed for ever* names the seed that is gathered. The Magnificat and the Baruch gathering-song sing one architecture.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-1-the-magnificat-gathering-of-the-tribes-of-jacob-in-sirach-36-and-baruch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 55
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: luke-2-the-heavenly-host-praising-before-yahuah-of-spirits-in-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 40:1 — *I saw thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits.* The innumerable host before the throne; Luke 2:13''s *multitude of the heavenly host praising Elohim (God)* is the same host, descended over the shepherds.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-2-the-heavenly-host-praising-before-yahuah-of-spirits-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 2 AND sv.verse_number = 13
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 40 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 39:12 — *I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory.* The praise before the throne; Luke 2:14''s *Glory to Elohim (God) in the highest* is the same heavenly-praise register sounded on earth.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-2-the-heavenly-host-praising-before-yahuah-of-spirits-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 2 AND sv.verse_number = 14
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 39 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 39:13 — *the first voice blesses Yahuah (God) of Spirits for ever and ever.* The host blessing the Most High for ever; Luke 2:14''s glory-in-the-highest is the same blessing, now over Bethlehem.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-2-the-heavenly-host-praising-before-yahuah-of-spirits-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 2 AND sv.verse_number = 14
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 39 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: luke-3-every-valley-filled-the-gathering-highway-in-baruch-and-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Baruch 5:7 — *every high hill... should be cast down, and valleys filled up, to make even the ground, that Yashar''el (Israel) may go safely in the glory of Yahuah (God).* The leveled highway read as the gathering-road; Luke 3:5''s *every valley shall be filled, and every mountain and hill shall be brought low* walks the same architecture.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-3-every-valley-filled-the-gathering-highway-in-baruch-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 5
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 5:9 — *Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory.* Where the gathering-road arrives; Luke 3:6''s *all flesh shall see the salvation of Elohim (God)* names the salvation seen at the end of the leveled highway.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-3-every-valley-filled-the-gathering-highway-in-baruch-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 1:6 — *the high mountains shall be shaken, And the high hills shall be made low, And shall melt like wax before the flame.* The hills-made-low at the coming of the Holy Great One; Luke 3:5''s *every mountain and hill shall be brought low* names the same leveling before the way of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-3-every-valley-filled-the-gathering-highway-in-baruch-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 5
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 1 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: luke-3-the-genealogy-back-to-adam-son-of-elohim-in-jubilees-and-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 4:7 — *she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel."* Shet (Seth) named as the second seed raised up to Adam; Luke 3:38''s *son of Seth, son of Adam, son of Elohim (God)* runs the genealogy back through that very seed-line. FRAMEWORK-CENTRAL.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-3-the-genealogy-back-to-adam-son-of-elohim-in-jubilees-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 38
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 4 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 85:3 — *behold a bull came forth from the earth, and that bull was white; and after it came forth a heifer, and along with this (heifer) two young bulls, one of them black and the other red.* The Adamic toledot in vision-form — white bull (Adam), heifer (Eve), black and red bulls (Cain, Abel); Luke 3:38 closes its backward genealogy on the same Adam, the son of Elohim.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-3-the-genealogy-back-to-adam-son-of-elohim-in-jubilees-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 38
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 85 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 85:8 — *another white bull... from Him proceeded many white bulls, and they resembled him... one following the other.* The Sethite seed-line as the white bulls one-following-another; Luke 3:36-38 traces that same line backward to Adam.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-3-the-genealogy-back-to-adam-son-of-elohim-in-jubilees-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 38
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 85 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 60:8 — *the seventh from Adam, the first man whom Yahuah (God) of Spirits created.* Adam named the first-created man, Enoch (Chanok) the seventh from him; Luke 3:37 runs the genealogy through Enoch in the same seventh-from-Adam count Jude 1:14 carries, landing on Adam the son of Elohim.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-3-the-genealogy-back-to-adam-son-of-elohim-in-jubilees-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 37
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 60 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 48:1 — *Then stood up Elias the prophet as fire, and his word burned like a lamp.* The fire-prophet behind the first contrast case; Luke 4:25-26 names Elias sent not to the many widows of Yashar''el but to the one Tsidonian (Sidonian) widow — individual mercy without absorption.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 4 AND sv.verse_number = 25
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 48 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach (Ecclesiasticus) 48:3 — *By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire.* The heaven-shut famine; Luke 4:25''s *when the heaven was shut up three years and six months, when great famine was throughout all the land* names the same famine as the frame for the individual-mercy contrast.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 4 AND sv.verse_number = 25
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 48 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach (Ecclesiasticus) 48:12 — *Eliseus was filled with his spirit.* Eliseus (Elisha) filled with the double-portion spirit — the prophet behind the second contrast case; Luke 4:27 names none of the many lepers in Yashar''el cleansed *saving Naaman the Syrian* — individual mercy to the foreign-origin man without absorption into the seed-of-promise. The contrast case proves the directional non-symmetry the framework holds against the false-inclusion gospel.'
  FROM cross_reference_threads t, cross_references x, _s212_l0104_lookup sv, _s212_l0104_lookup tv
 WHERE t.slug = 'luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 4 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 48 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_05_08.sql -----
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

-- ----- fragment: minion_luke_09_11.sql -----
-- =====================================================================
-- S212 minion — Luke 9-11 extras-library cross-references
-- =====================================================================
-- Range: Luke 9, Luke 10, Luke 11.
-- Tag: l0911  (temp view _s212_l0911_lookup)
-- sort_order band: 3460-3489.
-- Output: scratch_xref/minion_luke_09_11.sql
--
-- Adds the MISSING outside-canon (extras-library) cross-references for
-- the Luke 9-11 range. The existing Luke canon migration
-- (session185_luke_xref_members_and_threads.sql) already carries canon
-- threads at these chapters (the seventy sent out, the Good Samaritan,
-- Martha & Mary, the woes at the Pharisee's table, the Lord's Prayer,
-- the Beelzebub controversy, the single-eye); and the Luke 10:18 / Luke
-- 11:14 verses are already attached as CANON members to existing
-- threads. This fragment ADDS the framework-bearing extras-tier
-- connections those chapters warrant that were not yet member rows.
--
-- NEW threads created (2):
--   1. luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom
--        (sort 3460) — targets: 1 Enoch (enoch), Wisdom of Solomon (apocrypha)
--   2. luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach
--        (sort 3461) — targets: Sirach / Ecclesiasticus (apocrypha)
--
-- EXISTING thread complemented (no new thread — avoids duplicating the
-- Matt-12-anchored watcher-binding thread that already carries 1 Enoch
-- 10 / Jubilees 10 and to which Luke 11:14 is already a canon member):
--   - binding-of-the-watchers-typological-anchor-for-binding-the-strong-man
--        gains two Luke-11:22-source extras members (1 Enoch 10:4 Azazel
--        bound; Jubilees 10:11 the malignant ones bound). The strong-man
--        armed keeping his palace (Luke 11:21-22) is the binding-the-
--        strong-man substance the wisdom-stream named at the watcher-
--        leader register.
--
-- 8 new cross_references rows, all tier_required='extras'.
-- 8 new thread_members rows.
--
-- Chapters with NO extras add (and why):
--   - LUKE 9: the Transfiguration's Mosheh-and-Eliyahu-in-glory is
--     already extras-witnessed via the existing
--     `the-formless-father-and-the-formed-son-witnessed-in-ascension-of-isaiah`
--     thread anchored at Luke 9:28; the feeding-of-the-5000 and Kefa's
--     confession carry synoptic Matthew extras coverage. No additional
--     framework-bearing extras connection surfaces at the rigour bar.
--   - LUKE 11:33-34 (the single eye / the light of the body): already a
--     CANON member of the existing extras thread
--     `the-single-eye-of-issachar-and-the-evil-eye-of-sirach` (which
--     carries Testament of Issachar + Sirach 14/35). A Luke-anchored
--     duplicate would be redundant; no distinct framework-bearing add.
--
-- Every member-note quotes the verse IN FULL in italics with the
-- citation in parentheses (come-and-see), restores sacred names with
-- parentheticals, and passes the 12 Red Lines + 12-point checklist.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

CREATE TEMP VIEW _s212_l0911_lookup AS
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
-- Insert 8 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom
  ('canon', 'luke', 10, 18, 'enoch', '1-enoch', 6, 6,
   E'*And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* (1 Enoch 6:6) The Hebrew library names the watcher-descent — two hundred angels falling from heaven by their own oath on Hermon — as the origin-event of the unclean-spirit administration. Luke 10:18''s *I beheld Satan as lightning fall from heaven* (Luke 10:18) is the King naming the same fall the wisdom-stream had already chronicled: the seventy''s territory-by-territory undoing of the devils'' rule (Luke 10:17) is the working-out of the fall 1 Enoch traces to Yered''s (Jared''s) day.'),
  ('canon', 'luke', 10, 18, 'enoch', '1-enoch', 88, 1,
   E'*And I saw one of those four who had come forth first, and he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss: now that abyss was narrow and deep, and horrible and dark.* (1 Enoch 88:1) The animal-apocalypse vision names the fallen-star seized, bound hand and foot, and cast into the abyss — the same fallen-and-bound architecture the King names in seven words. *I beheld Satan as lightning fall from heaven* (Luke 10:18): the lightning-fall the King saw is the fall 1 Enoch shows ending in the binding-and-abyss, the destination of the watcher-administration the seventy are sent against.'),
  ('canon', 'luke', 10, 18, 'apocrypha', 'the-wisdom-of-solomon', 2, 24,
   E'*Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* (Wisdom of Solomon 2:24) The wisdom-stream names the devil as the envy-source through which death entered the world — the seed-war origin behind the fallen-power the King names at Luke 10:18. *I beheld Satan as lightning fall from heaven. Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy* (Luke 10:18-19): the enemy whose power the seventy are given authority over is the same devil whose envy Wisdom names as the door death came through; the authority-to-tread is the inaugurated reversal of his administration.'),

  -- Thread 2: luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach
  ('canon', 'luke', 11, 43, 'apocrypha', 'ecclesiasticus', 10, 13,
   E'*For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* (Sirach 10:13) The wisdom-stream names pride as the beginning of sin and the overthrow it brings. *Woe unto you, Pharisees! for ye love the uppermost seats in the synagogues, and greetings in the markets* (Luke 11:43): the love-of-the-uppermost-seats the King names is the pride Sirach had already diagnosed as sin''s beginning — the religious-status-architecture the woe falls on, named by the Hebrew library centuries before the Pharisee''s table.'),
  ('canon', 'luke', 11, 46, 'apocrypha', 'ecclesiasticus', 10, 12,
   E'*The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* (Sirach 10:12) The wisdom-stream names pride as the heart turned away from its Maker. *Woe unto you also, ye lawyers! for ye lade men with burdens grievous to be borne, and ye yourselves touch not the burdens with one of your fingers* (Luke 11:46): the burden-lading lawyers build their parallel-Torah on top of the Torah and refuse to bear it — the heart-turned-away-from-the-Maker Sirach names, walking itself out as the Judaizer-system that voids the commandment by addition while keeping the robe of the law.'),
  ('canon', 'luke', 11, 52, 'apocrypha', 'ecclesiasticus', 21, 14,
   E'*The inner parts of a fool are like a broken vessel, and he will hold no knowledge as long as he lives.* (Sirach 21:14) The wisdom-stream names the heart that holds no knowledge. *Woe unto you, lawyers! for ye have taken away the key of knowledge: ye entered not in yourselves, and them that were entering in ye hindered* (Luke 11:52): the lawyers who took away the key are the broken-vessel hearts Sirach names — they hold no knowledge themselves and so cannot open the door, and they hinder those who would enter. The key-of-knowledge taken away is the Torah-read-plainly the system replaced with its own fences.'),
  ('canon', 'luke', 11, 52, 'apocrypha', 'ecclesiasticus', 21, 15,
   E'*If a skilful man hear a wise word, he will commend it, and add to it: but as soon as one of no understanding heareth it, it displeaseth him, and he casteth it behind his back.* (Sirach 21:15) The wisdom-stream names the man-of-no-understanding who casts the wise word behind his back. *Ye have taken away the key of knowledge: ye entered not in yourselves, and them that were entering in ye hindered* (Luke 11:52): the lawyers'' taking-away-the-key is the casting-the-word-behind-the-back Sirach names — the leadership-substance that hears the Word and refuses it, then locks the door from the outside against those entering. The system-not-people diagnostic holds: the woe falls on the leadership-substance, not on the people it kept from the door.'),

  -- Existing thread complement: binding-of-the-watchers-typological-anchor-for-binding-the-strong-man
  ('canon', 'luke', 11, 22, 'enoch', '1-enoch', 10, 4,
   E'*And again Yahuah (God) said to Raphael: Bind Azazel hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dudael, and cast him therein.* (1 Enoch 10:4) The Hebrew library names the binding-of-the-watcher-leader Azazel — bound hand and foot, cast into the darkness. *When a stronger than he shall come upon him, and overcome him, he taketh from him all his armour wherein he trusted, and divideth his spoils* (Luke 11:22): the stronger-than-he who overcomes the armed strong man and divides the spoils is walking the inaugurated form of the binding-architecture the wisdom-stream named at the watcher-leader register; the full binding lands at Revelation 20:1-3''s millennial consummation.'),
  ('canon', 'luke', 11, 22, 'jubilees', 'jubilees', 10, 11,
   E'*And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* (Jubilees 10:11) The Hebrew library names the watchers-bound-with-a-tenth-permitted-to-operate architecture: nine-tenths bound in the place of condemnation, one-tenth left subject before Satan on the earth. *When a stronger than he shall come upon him, and overcome him, he taketh from him all his armour wherein he trusted, and divideth his spoils* (Luke 11:22): the strong man whose goods are spoiled is the partial-binding Jubilees names walking toward its completion — the King''s casting-out of the devil (Luke 11:14) is the inaugurated overcoming that culminates in the full binding the wisdom-stream foretold.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l0911_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_l0911_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 2 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom',
       'Satan fallen as lightning — the watcher-fall in 1 Enoch and Wisdom of Solomon',
       E'Luke 10:18-19''s *I beheld Satan as lightning fall from heaven. Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy* names in seven words the fall the Hebrew library had already chronicled at length. The King speaks it as the seventy return with joy that *even the devils are subject unto us through thy name* (Luke 10:17) — the territory-by-territory undoing of the unclean-spirit administration is the working-out of the lightning-fall the King saw. 1 Enoch 6:6 traces the origin: *they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it* — the watcher-descent by their own oath. 1 Enoch 88:1 shows the destination: *he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss* — the fallen-star bound and abyss-sealed, the same fallen-and-bound architecture. Wisdom of Solomon 2:24 names the seed-war substance behind it: *through envy of the devil came death into the world* — the enemy whose power the seventy are given authority to tread on is the same devil whose envy was the door death came through. The wisdom-stream chronicled the fall, the binding, and the death-bringing envy; the King names the fall in seven words and hands the seventy the inaugurated authority over the administration the fall produced. (The Daniel 7:25 kingdoms-under-the-administration anchor and the Revelation 12:9 dragon-cast-out anchor are carried at the canon level; this thread adds the extras-library witness to the same watcher-fall.)',
       sv.verse_id, ev.verse_id, 'extras', 3460
  FROM _s212_l0911_lookup sv, _s212_l0911_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 18
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 10 AND ev.verse_number = 19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach',
       E'Taken away the key of knowledge — the corrupted-leadership architecture in Sirach',
       E'Luke 11:42-52''s woes at the Pharisee''s table walk the framework-major Judaizer diagnostic in front of the reader: the system that wears Torah''s robes and builds a parallel-Torah on top that contradicts the original. The Hebrew library''s wisdom-stream had already named the architecture. Sirach 10:12 names the root: *the beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker* — the heart-turned-away the King names at *woe unto you also, ye lawyers! for ye lade men with burdens grievous to be borne, and ye yourselves touch not the burdens with one of your fingers* (Luke 11:46). Sirach 10:13 names the fruit: *pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly* — the love-of-the-uppermost-seats the King names at *woe unto you, Pharisees! for ye love the uppermost seats in the synagogues, and greetings in the markets* (Luke 11:43). And Sirach 21:14-15 names the key-of-knowledge inverse: *the inner parts of a fool are like a broken vessel, and he will hold no knowledge as long as he lives ... as soon as one of no understanding heareth it, it displeaseth him, and he casteth it behind his back* — the broken-vessel hearts that hold no knowledge and cast the wise word behind their backs are the lawyers the King names at *woe unto you, lawyers! for ye have taken away the key of knowledge: ye entered not in yourselves, and them that were entering in ye hindered* (Luke 11:52). The system-not-people posture is non-negotiable: the woe falls on the leadership-substance that took away the key and locked the door from the outside, NOT on the people it kept from the door. The contrary-to-Torah test of 1 Yochanan (John) 2:3-4 is the standard operating underneath: the key-of-knowledge taken away is the Torah-read-plainly the system replaced with its own fences. (The synoptic Matthew 23 anchors and the canon Tanakh-witness — Micah 6:8, Genesis 4:10, 2 Chronicles 24:21 — are carried at the canon level; this thread adds the Sirach wisdom-stream witness to the same diagnostic at the Luke woes.)',
       sv.verse_id, ev.verse_id, 'extras', 3461
  FROM _s212_l0911_lookup sv, _s212_l0911_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 42
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 11 AND ev.verse_number = 52
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 6:6 — *they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The watcher-descent by their own oath; Luke 10:18''s *I beheld Satan as lightning fall from heaven* names the same fall the wisdom-stream traced to Yered''s (Jared''s) day.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 18
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 6 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 88:1 — *he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss.* The fallen-star bound and abyss-sealed; the lightning-fall the King saw at Luke 10:18 is the fall 1 Enoch shows ending in the binding-and-abyss.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 18
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 88 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 2:24 — *through envy of the devil came death into the world: and they that do hold of his side do find it.* The seed-war substance behind the fallen-power; the enemy whose power the seventy tread on (Luke 10:19) is the same devil whose envy was the door death came through.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-10-satan-fallen-as-lightning-and-the-watcher-fall-in-1-enoch-and-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 18
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 24
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 10:12 — *the beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* The heart-turned-away root; Luke 11:46''s burden-lading lawyers walk the parallel-Torah-built-on-top the heart-turned-away produces.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 46
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 10 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 10:13 — *pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* The pride-as-sin''s-beginning fruit; Luke 11:43''s love-of-the-uppermost-seats is the religious-status pride Sirach diagnosed.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 43
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 10 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 21:14 — *the inner parts of a fool are like a broken vessel, and he will hold no knowledge as long as he lives.* The broken-vessel heart that holds no knowledge; Luke 11:52''s lawyers took away the key of knowledge because they hold none themselves.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 21 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 21:15 — *as soon as one of no understanding heareth it, it displeaseth him, and he casteth it behind his back.* The man-of-no-understanding casting the wise word behind his back; Luke 11:52''s taking-away-the-key is that casting-the-word-behind-the-back, then locking the door against those entering.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'luke-11-taken-away-the-key-of-knowledge-and-the-corrupted-leadership-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 21 AND tv.verse_number = 15
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Existing thread complement: binding-of-the-watchers-typological-anchor-for-binding-the-strong-man
-- (Luke 11:22 strong-man-armed extras members added to the existing
--  Matt-12-anchored thread; sort_orders 20/21 sit after its existing members.)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 20, E'1 Enoch 10:4 — *Bind Azazel hand and foot, and cast him into the darkness ... and cast him therein.* The binding-of-the-watcher-leader Azazel; Luke 11:22''s *a stronger than he ... taketh from him all his armour wherein he trusted, and divideth his spoils* walks the inaugurated form of the binding-architecture the wisdom-stream named.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'binding-of-the-watchers-typological-anchor-for-binding-the-strong-man'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 22
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jubilees 10:11 — *all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The watchers-bound-with-a-tenth-permitted architecture; Luke 11:22''s spoiled strong man is the partial-binding walking toward its completion — the King''s casting-out (Luke 11:14) the inaugurated overcoming.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l0911_lookup sv, _s212_l0911_lookup tv
 WHERE t.slug = 'binding-of-the-watchers-typological-anchor-for-binding-the-strong-man'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 22
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_12_15.sql -----
-- =====================================================================
-- S212 — Luke 12-15 extras-library cross-references (tag: l1215)
-- =====================================================================
-- Adds the MISSING outside-canon (extras-library) cross-references for
-- Luke 12, 13, 14, 15. The existing canon migration
-- (session185_luke_xref_members_and_threads.sql) already carries canon
-- threads for these chapters — the rich fool (Ecclesiastes/Job/Psalms),
-- the except-ye-repent warning, the daughter-of-Abraham loosing, the
-- lowest-seat recompense, the great supper, count-the-cost, the lost
-- coin, and the prodigal-and-elder-brother two-house gathering — but
-- inserted ZERO extras-library member rows. This migration promotes the
-- framework-bearing extras connections those chapters warrant into real
-- edition-aware member rows. It ADDS to the canon coverage; it does not
-- duplicate it (every source verse is the Luke gospel verse; every
-- target is an extras-edition verse the canon threads never touched).
--
-- The Luke 12-15 reading-target across the four chapters: the rich fool
-- who lays up treasure not toward Elohim (12:16-21) and the sell-and-
-- give-alms treasure-in-the-heavens-that-faileth-not (12:33); the
-- come-from-east-and-west gathering at the strait gate (13:24-30); and
-- the lost-sheep / lost-coin / prodigal-son recovery of the lost
-- (ch.15) — framework-central as the gathering of scattered / lost
-- Yashar'el (Israel) home to the Father. The Hebrew library's extras-
-- tier witness carries each architecture at the verse-level: the
-- rich-fool-who-knows-not-his-time (Sirach 11:18-19); the treasure-
-- laid-up-by-alms-against-the-day (Tobit 4:9-10, Sirach 29:11-12); the
-- look-toward-the-east, your-children-gathered-from-west-to-east
-- gathering (Baruch 4:36-37, 5:5) and the gather-all-the-tribes-of-
-- Jacob prayer (Sirach 36:11); and the shepherd-who-brings-again-his-
-- flock mercy (Sirach 18:13) with the ten-tribes-regathered (2 Esdras
-- 13:39-40) and the bring-out-the-children-and-show-mercy promise
-- (2 Esdras 2:31-32).
--
-- Four new threads at extras-tier (sort band 3490-3519):
--   1. luke-12-the-rich-fool-who-knows-not-his-time-in-sirach
--        targets: apocrypha (Sirach/Ecclesiasticus)                  (sort 3490)
--   2. luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach
--        targets: apocrypha (Tobit, Sirach/Ecclesiasticus)           (sort 3491)
--   3. luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach
--        targets: apocrypha (Baruch, Sirach/Ecclesiasticus)          (sort 3492)
--   4. luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras
--        targets: apocrypha (Sirach/Ecclesiasticus, 2 Esdras)        (sort 3493)
--
-- 13 new cross_references rows + 13 thread_members, all tier_required='extras'.
-- Luke 14: no extras add. The chapter's strongest connections (the
-- lowest-seat wisdom-proverb, the resurrection-of-the-just, the great
-- supper as the gathering, count-the-cost) are canon-anchored and
-- already carried in S185 (Proverbs 25, Deuteronomy 14, Revelation 20,
-- 1 Thessalonians 4, Isaiah 35, Ezekiel 37, Romans 11). No extras-
-- library verse surfaces a framework-bearing connection at the rigour
-- the migration requires that the canon threads do not already carry.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

CREATE TEMP VIEW _s212_l1215_lookup AS
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
-- Insert 13 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: luke-12-the-rich-fool-who-knows-not-his-time-in-sirach
  ('canon', 'luke', 12, 19, 'apocrypha', 'ecclesiasticus', 11, 19,
   E'*Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* Sirach (Ecclesiasticus) 11:19 names the rich-fool architecture word-for-word in the Hebrew library, centuries before the King speaks the parable. The man who says *I have found rest, and now will eat continually of my goods* is the man of Luke 12:19 who says to his soul *take thine ease, eat, drink, and be merry* — and the wisdom-stream had already named the two things he does not reckon with: *he knoweth not what time shall come upon him,* and *he must leave those things to others, and die.* The barns get pulled down; the soul gets required this night; the goods get left to another. The gospel walks the architecture the wisdom-stream already carried.'),
  ('canon', 'luke', 12, 20, 'apocrypha', 'ecclesiasticus', 11, 18,
   E'*There is that waxeth rich by his wariness and pinching, and this is the portion of his reward.* Sirach (Ecclesiasticus) 11:18 names the portion-of-the-reward of the man who waxes rich by hoarding — the verse that sets up the verdict of v.19. Luke 12:20''s *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* lands the same reckoning: the wariness-and-pinching gain is no portion at all when the soul is required. The wisdom-stream names the hollow reward; the gospel names the night it comes due.'),

  -- Thread 2: luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach
  ('canon', 'luke', 12, 33, 'apocrypha', 'tobit', 4, 9,
   E'*For you layest up a good treasure for thyself against the day of necessity.* Tobit 4:9 names the lay-up-treasure-against-the-day architecture directly in the Hebrew library — the verse stands inside Tobit''s charge to give alms (Tobit 4:7-8). Luke 12:33''s *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not* walks the same architecture: the alms given now is the treasure laid up against the day. The wisdom-stream names the treasure laid up by the open hand; the gospel names the heaven-bag that faileth not.'),
  ('canon', 'luke', 12, 33, 'apocrypha', 'tobit', 4, 10,
   E'*Because that alms do deliver from death, and suffers not to come into darkness.* Tobit 4:10 names the alms-as-deliverer-from-death architecture — the treasure laid up by the open hand protects the giver. Luke 12:33''s *a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth* walks the same protection-against-loss architecture at the heavenly-treasure level. The Hebrew library names the deliverance the open hand purchases; the gospel names the storehouse no thief can reach and no moth can corrupt.'),
  ('canon', 'luke', 12, 33, 'apocrypha', 'ecclesiasticus', 29, 11,
   E'*Lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold.* Sirach (Ecclesiasticus) 29:11 names the lay-up-treasure-by-the-commandments architecture explicitly — the treasure laid up by the commandment-keeper who helps the poor for the commandment''s sake (Sirach 29:9). Luke 12:33''s *provide yourselves bags which wax not old, a treasure in the heavens that faileth not* is the gospel-form of the wisdom-stream''s same teaching: the treasure of the open-handed commandment-keeper outlasts gold because it is laid up where gold cannot reach.'),
  ('canon', 'luke', 12, 33, 'apocrypha', 'ecclesiasticus', 29, 12,
   E'*Shut up alms in your storehouses: and it shall deliver you from all affliction.* Sirach (Ecclesiasticus) 29:12 names the storehouse-of-alms architecture — the treasure laid up against affliction. Luke 12:33''s *a treasure in the heavens that faileth not* walks the same Hebrew library architecture: the kingdom-citizen who lays up alms in the heavenly storehouse holds what the earthly storehouse cannot keep. The next verse seals it — *for where your treasure is, there will your heart be also* (Luke 12:34).'),

  -- Thread 3: luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach
  ('canon', 'luke', 13, 29, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 36,
   E'*O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* Baruch 4:36 turns Jerusalem''s face toward the east to behold the gathering-joy — the prophetic-gathering register the King names at Luke 13:29''s *they shall come from the east, and from the west, and from the north, and from the south, and shall sit down in the kingdom of Elohim (God).* The Hebrew library names the direction of the coming; the gospel names the four quarters the scattered seed comes from to sit down in the kingdom. This is not categorical-Gentile-inclusion — it is the gathering of the dispersed children of Yashar''el (Israel) from the territories of their scattering.'),
  ('canon', 'luke', 13, 29, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37,
   E'*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* Baruch 4:37 names the gathering directly: the sons whom Jerusalem *sentest away* — the scattered into exile — *come gathered together from the east to the west.* Luke 13:29''s *they shall come from the east, and from the west* walks the same architecture. The ones gathered are the sent-away sons coming home, not strangers added; the Hebrew library names them as Jerusalem''s own scattered children regathered by the word of the Holy One.'),
  ('canon', 'luke', 13, 29, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5,
   E'*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch 5:5 names the gathering-from-the-quarters in the same register Luke 13:29 walks: *your children gathered from the west to the east.* The children gathered are Jerusalem''s own — *they departed from you on foot, and were led away of their enemies: but Yahuah (God) brings them to you exalted with glory, as children of the kingdom* (Baruch 5:6). The come-from-east-and-west of the gospel IS this prophetic-gathering of the scattered covenant-children home as children of the kingdom.'),
  ('canon', 'luke', 13, 29, 'apocrypha', 'ecclesiasticus', 36, 11,
   E'*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* Sirach (Ecclesiasticus) 36:11 names the gathering as a prayer — *gather all the tribes of Jacob together* — the petition for the regathering of the twelve tribes *as from the beginning.* Luke 13:29''s come-from-the-four-quarters to sit down in the kingdom is the answer to this prayer: the scattered tribes of Jacob gathered home. The wisdom-stream prays the gathering the gospel announces; the firstborn Yashar''el (Israel) whom Yahuah named (Sirach 36:12) is the people gathered, not a substitute people installed in their place.'),

  -- Thread 4: luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras
  ('canon', 'luke', 15, 5, 'apocrypha', 'ecclesiasticus', 18, 13,
   E'*The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* Sirach (Ecclesiasticus) 18:13 names the shepherd-who-brings-again-his-flock architecture in the Hebrew library. Luke 15:5''s *and when he hath found it, he layeth it on his shoulders, rejoicing* is the same shepherd-brings-again substance walked into the lost-sheep parable. The wisdom-stream names the mercy that *brings again, as a shepherd his flock*; the gospel names the shepherd going after the one lost until he finds it and carries it home. The bringing-again is the gathering of the lost.'),
  ('canon', 'luke', 15, 6, 'apocrypha', '2-esdras', 13, 40,
   E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land.* 2 Esdras 13:40 names the ten tribes carried away into the land of their scattering — the lost-of-the-house-of-Yashar''el (Israel) the framework holds. Luke 15:6''s *Rejoice with me; for I have found my sheep which was lost* names the recovery of exactly this lost: the scattered northern house regathered. 2 Esdras names them lost in the further country; the gospel names the joy when the lost is found. *Now when he shall begin to come* (2 Esdras 13:46) is the regathering the parable rejoices over.'),
  ('canon', 'luke', 15, 24, 'apocrypha', '2-esdras', 2, 31,
   E'*Remember your children that sleep, for I shall bring them out of the sides of the earth, and shew mercy to them: for I am merciful, says Yahuah (God) Almighty.* 2 Esdras 2:31 names the bring-out-the-children-and-show-mercy promise — the Father bringing his scattered children home with mercy. Luke 15:24''s *for this my son was dead, and is alive again; he was lost, and is found* walks the same architecture: the son brought out of the far country, the dead made alive, the lost found, the mercy shown. The prodigal''s homecoming is the Father''s own *I will bring them out... and shew mercy to them* in parable-form — the scattered child of Yashar''el (Israel) gathered home.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l1215_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_l1215_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-12-the-rich-fool-who-knows-not-his-time-in-sirach',
       'The rich fool who knows not his time in Sirach',
       E'Luke 12:16-21''s parable of the rich fool — the man whose ground brought forth plentifully, who pulls down his barns to build greater, and who says to his soul *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* — walks an architecture the Hebrew library''s wisdom-stream had already named word-for-word. Sirach (Ecclesiasticus) 11:18 names the hollow reward of the hoarder: *there is that waxeth rich by his wariness and pinching, and this is the portion of his reward.* Sirach 11:19 lands the verdict the parable lands: *whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* The two things the rich fool does not reckon with — *he knoweth not what time shall come upon him,* and *he must leave those things to others, and die* — are exactly the two things Luke 12:20 names: *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The wisdom-stream named the rich fool centuries before the King spoke the parable; the gospel walks the same architecture and seals it with the verdict — *so is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21).',
       sv.verse_id, ev.verse_id, 'extras', 3490
  FROM _s212_l1215_lookup sv, _s212_l1215_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 16
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 12 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach',
       'Treasure in the heavens laid up by alms in Tobit and Sirach',
       E'Luke 12:33-34''s sell-and-give-alms teaching — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth. For where your treasure is, there will your heart be also* — walks an architecture the Hebrew library had already named at the verse-level. Tobit 4:9 names the laid-up-treasure-against-the-day teaching directly: *for you layest up a good treasure for thyself against the day of necessity.* Tobit 4:10 names the protection-economy: *because that alms do deliver from death, and suffers not to come into darkness.* Sirach (Ecclesiasticus) 29:11 names the lay-up-treasure-by-the-commandments architecture: *lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold.* Sirach 29:12 names the storehouse-of-alms protection: *shut up alms in your storehouses: and it shall deliver you from all affliction.* The Hebrew library uses the same *lay up* and *storehouse* and *treasure against the day* images the gospel walks; the gospel names the heaven-bag that faileth not, where no thief approaches and no moth corrupts — the treasure the open hand of the alms-giver lays up where loss cannot reach.',
       sv.verse_id, ev.verse_id, 'extras', 3491
  FROM _s212_l1215_lookup sv, _s212_l1215_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 12 AND ev.verse_number = 34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach',
       'They shall come from east and west — the gathering of the tribes in Baruch and Sirach',
       E'Luke 13:29''s *they shall come from the east, and from the west, and from the north, and from the south, and shall sit down in the kingdom of Elohim (God)* — spoken at the strait gate against those who eat and drink in his presence yet hear *I know you not whence ye are* (Luke 13:25-28) — walks the Hebrew library''s prophetic-gathering of the scattered seed home. This is not categorical-Gentile-inclusion; it is the regathering of the dispersed children of Yashar''el (Israel) from the four quarters of their scattering, and the Hebrew library names them as such. Baruch 4:36 turns the face east: *O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* Baruch 4:37 names who comes: *Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* Baruch 5:5 names the gathering-from-the-quarters again: *behold your children gathered from the west to the east by the word of the Holy One* — *led away of their enemies* but now *brought to you exalted with glory, as children of the kingdom* (Baruch 5:6). Sirach (Ecclesiasticus) 36:11 prays the gathering: *gather all the tribes of Jacob together, and inherit you them, as from the beginning* — the petition for the regathering of the twelve tribes, the firstborn Yashar''el (Israel) whom Yahuah named (Sirach 36:12). The come-from-east-and-west of the gospel IS this prophetic-gathering of the sent-away sons home as children of the kingdom — the scattered seed, not a substitute people installed in their place.',
       sv.verse_id, ev.verse_id, 'extras', 3492
  FROM _s212_l1215_lookup sv, _s212_l1215_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 13 AND ev.verse_number = 30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras',
       'The shepherd bringing again his flock and the gathering of the lost in Sirach and 2 Esdras',
       E'Luke 15''s three parables — the lost sheep, the lost coin, the prodigal son — are one substance: the recovery of the lost, the gathering of scattered / lost Yashar''el (Israel) home to the Father, against the Pharisees'' murmur that *this man receiveth sinners, and eateth with them* (Luke 15:2). The Hebrew library names the architecture directly. Sirach (Ecclesiasticus) 18:13 names the mercy that gathers: *the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock* — the shepherd-who-brings-again-his-flock the King walks at Luke 15:5 when *he layeth it on his shoulders, rejoicing.* 2 Esdras 13:40 names who is lost: *those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive* — the scattered northern house, lost in the further country, *now when he shall begin to come* (2 Esdras 13:46). Luke 15:6''s *Rejoice with me; for I have found my sheep which was lost* names the joy when this lost is found. 2 Esdras 2:31 names the Father''s own promise: *remember your children that sleep, for I shall bring them out of the sides of the earth, and shew mercy to them: for I am merciful, says Yahuah (God) Almighty* — the bring-out-the-children-and-show-mercy promise the prodigal''s homecoming walks: *for this my son was dead, and is alive again; he was lost, and is found* (Luke 15:24). The lost found, the dead made alive, the scattered child gathered home with mercy — the wisdom-stream and the apocalyptic-stream both name the gathering the three parables rejoice over.',
       sv.verse_id, ev.verse_id, 'extras', 3493
  FROM _s212_l1215_lookup sv, _s212_l1215_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 4
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 15 AND ev.verse_number = 32
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: luke-12-the-rich-fool-who-knows-not-his-time-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 11:19 — *whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* The Hebrew library names the rich fool word-for-word; Luke 12:19''s *take thine ease, eat, drink, and be merry* walks the same architecture, and the two things the fool ignores — the unknown hour and the leaving-to-others — are exactly what the verdict names.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-the-rich-fool-who-knows-not-his-time-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 19
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 11 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 11:18 — *there is that waxeth rich by his wariness and pinching, and this is the portion of his reward.* The hollow-reward of the hoarder; Luke 12:20''s *Thou fool, this night thy soul shall be required of thee: then whose shall those things be?* lands the reckoning the wisdom-stream set up.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-the-rich-fool-who-knows-not-his-time-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 11 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 4:9 — *for you layest up a good treasure for thyself against the day of necessity.* The Hebrew library''s *lay up treasure against the day* phrasing inside the charge to give alms; Luke 12:33''s *provide yourselves bags which wax not old, a treasure in the heavens that faileth not* walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 4:10 — *because that alms do deliver from death, and suffers not to come into darkness.* The protection-economy of the open hand; Luke 12:33''s *a treasure in the heavens that faileth not, where no thief approacheth, neither moth corrupteth* walks the same protection-against-loss architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 29:11 — *lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold.* The lay-up-treasure-by-the-commandments architecture; Luke 12:33''s heaven-bag that faileth not walks the same — the open-handed commandment-keeper''s treasure outlasts gold.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 29 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 29:12 — *shut up alms in your storehouses: and it shall deliver you from all affliction.* The Hebrew library''s *storehouse* image; Luke 12:33-34''s *treasure in the heavens... for where your treasure is, there will your heart be also* walks the same storehouse-of-treasure architecture at the heavenly level.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-12-treasure-in-the-heavens-laid-up-by-alms-in-tobit-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 29 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Baruch 4:36 — *O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* The face turned east to behold the gathering-joy; Luke 13:29''s come-from-east-and-west walks the same prophetic-gathering register.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 36
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 4:37 — *Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* The sent-away sons regathered from the quarters; Luke 13:29''s come-from-east-and-west names the same scattered children coming home — not strangers added.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 5:5 — *Arise, O Jerusalem... behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* The children led away of their enemies but brought home as children of the kingdom (Baruch 5:6); Luke 13:29''s gathering to sit down in the kingdom walks the same substance.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The gathering prayed as a petition for the twelve tribes; Luke 13:29''s come-from-the-four-quarters is the answer — the firstborn Yashar''el (Israel) whom Yahuah named (Sirach 36:12) gathered, not a substitute people installed.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-13-they-shall-come-from-east-and-west-the-gathering-of-the-tribes-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 29
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 18:13 — *the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* The shepherd-who-brings-again-his-flock; Luke 15:5''s *he layeth it on his shoulders, rejoicing* walks the same bringing-again-the-lost substance.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 5
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 18 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 13:40 — *those are the ten tribes, which were carried away prisoners out of their own land... whom Salmanasar the king of Assyria led away captive.* The lost-of-the-house-of-Yashar''el (Israel) named; Luke 15:6''s *Rejoice with me; for I have found my sheep which was lost* names the recovery of exactly this lost — the scattered northern house regathered.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 40
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 2:31 — *remember your children that sleep, for I shall bring them out of the sides of the earth, and shew mercy to them: for I am merciful, says Yahuah (God) Almighty.* The bring-out-the-children-and-show-mercy promise; Luke 15:24''s *this my son was dead, and is alive again; he was lost, and is found* walks the same — the scattered child gathered home with mercy.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1215_lookup sv, _s212_l1215_lookup tv
 WHERE t.slug = 'luke-15-the-shepherd-bringing-again-his-flock-and-the-gathering-of-the-lost-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 2 AND tv.verse_number = 31
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_luke_16_19.sql -----
-- =====================================================================
-- S212 extras-library cross-references — LUKE 16-19
-- Minion tag: l1619   Temp view: _s212_l1619_lookup
-- sort_order band: 3520-3549
-- =====================================================================
-- These are the MISSING outside-canon (extras-library) cross-references
-- for Luke 16-19. Mark/Luke/John carried ZERO extras member-rows; the
-- S185 Luke canon migration quoted some of these extras inside summary_md
-- (1 Enoch 22, Sirach 31, the days-of-Noach extras) but never inserted
-- them as edition-aware member rows. This fragment promotes those quoted-
-- but-unlinked extras into real cross_reference + thread_member rows, and
-- adds the framework-bearing gathering-of-the-tribes connection Luke 19:10
-- warrants. The SOURCE is always the canon Luke verse; the TARGET is the
-- extras verse; tier_required='extras'.
--
-- Canon coverage already present in S185 (NOT duplicated here): the
-- rich-man-and-Lazaros sheol thread (canon targets), the unjust-steward
-- thread (canon targets), the kingdom-of-Elohim-within thread, the
-- importunate-widow thread, the Pharisee-and-publican thread, the
-- days-of-Noach canon thread (Matthew parallels), and the Sirach-31
-- thread anchored at MATTHEW 6:24. This fragment ADDS the Luke-anchored
-- extras member-rows those threads were stripped of, under new slugs.
--
-- New threads (slug → target editions):
--   1. luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach
--        → apocrypha (Ecclesiasticus / Sirach 31)                  sort 3520
--   2. luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras
--        → enoch (1 Enoch 22), apocrypha (2 Esdras)                sort 3521
--   3. luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees
--        → enoch (1 Enoch 10), jubilees (Jubilees 5)               sort 3522
--   4. luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch
--        → apocrypha (Ecclesiasticus / Sirach 36), enoch (1 Enoch 90)  sort 3523
--
-- 14 cross_references rows; 14 thread_member rows; 4 threads.
-- Chapter 18 (importunate widow, Pharisee/publican, rich ruler, third
-- passion prediction, blind Bartimaeus): NO extras add. Every framework-
-- bearing extras connection Luke 18 surfaces — the post-harvest sifting
-- standing-question, the flesh-credential register, the woes-on-the-rich
-- (1 Enoch 94-100) — is already carried as a canon-anchored member of an
-- existing thread (`woes-on-the-rich-and-riches-cannot-save-in-1-enoch`,
-- `when-the-son-of-adam-cometh-...`) at the rigour the migration requires;
-- no NEW Luke-18-anchored extras thread clears the 12-point checklist
-- without duplicating an existing thread's target tuples.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

CREATE TEMP VIEW _s212_l1619_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id  = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ---------------------------------------------------------------------
-- A. Insert 11 extras-tier cross_references rows.
--    Source = canon Luke verse; target = extras verse.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach
  ('canon', 'luke', 16, 13, 'apocrypha', 'ecclesiasticus', 31, 5,
   E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Sirach / Ecclesiasticus 31:5). The Lukan placement seals the unjust-steward parable with the mammon-verdict: *Ye cannot serve Elohim (God) and mammon* (Luke 16:13). The wisdom-stream had already named the disqualification at the gold-love level — the gold-lover *shall not be justified.* The King names the same architecture as a forced-choice of masters: the divided heart that holds to mammon cannot stand justified before the Father whose service is whole-heart. The Lukan setting is distinct from the Sermon — here the verdict closes a steward-parable about deploying mammon shrewdly before the books are called.'),
  ('canon', 'luke', 16, 13, 'apocrypha', 'ecclesiasticus', 31, 6,
   E'*Gold has been the ruin of many, and their destruction was present* (Sirach 31:6). The wisdom-stream''s gold-as-ruin diagnostic stands behind Luke 16:13''s either/or. The mammon-servant at Luke 16:13 walks toward the same ruin the wisdom-stream had named; the steward of the parable just before (vv.1-8) is shrewd precisely because he treats mammon as the perishing thing it is, not the master.'),
  ('canon', 'luke', 16, 13, 'apocrypha', 'ecclesiasticus', 31, 7,
   E'*It is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it* (Sirach 31:7). The wisdom-stream identifies gold as an object of worship that captures its devotees — *them that sacrifice to it.* Luke 16:13''s *Ye cannot serve Elohim (God) and mammon* treats mammon as a competing master for exactly this reason: the wisdom-stream had already named gold as the master that takes those who sacrifice to it. To serve mammon is to sacrifice to the stumblingblock.'),

  -- Thread 2: luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras
  ('canon', 'luke', 16, 22, 'enoch', '1-enoch', 22, 9,
   E'*And there was in it four hollow places, deep and wide and very smooth. How smooth are the hollow places and deep and dark to look at* (1 Enoch 22:9). Enoch is shown the holding-places of the dead — distinct compartments hewn in the great mountain. Luke 16:22''s carrying of Lazaros *by the angels into Avraham''s (Abraham''s) bosom* while the rich man is *buried* and lifts his eyes in another place walks the same architecture the Hebrew library named: the dead are held in separated compartments pending the judgment, not annihilated into nothing and not dispatched to a final eternal destination.'),
  ('canon', 'luke', 16, 23, 'enoch', '1-enoch', 22, 10,
   E'*These hollow places have been created for this very purpose, that the spirits of the souls of the dead should assemble therein, yea that all the souls of the children of men should assemble here* (1 Enoch 22:10). The conscious-souls-of-the-dead-assembled register against the inherited soul-sleep misread. Luke 16:23''s rich man *in hell (hadēs) lift up his eyes, being in torments, and seeth Avraham (Abraham) afar off, and Lazaros in his bosom* assumes exactly this architecture — the spirits of the dead are gathered, aware, and identifiable, held in the hollow places the Hebrew library named.'),
  ('canon', 'luke', 16, 26, 'enoch', '1-enoch', 22, 11,
   E'*And these places have been made for them until the day of their judgement and until their appointed period, till the great judgement comes upon them* (1 Enoch 22:11). The hollow places are TEMPORAL — *until the day of their judgement.* This is the framework''s key against both inherited errors: sheol is real and conscious (against soul-sleep) AND it is a holding-state pending the resurrection-and-judgment (against eternal-conscious-torment-as-the-final-destination). Luke 16:26''s *between us and you there is a great gulf fixed* names the separation of the same two compartments the Hebrew library named, held until the great judgment.'),
  ('canon', 'luke', 16, 31, 'apocrypha', '2-esdras', 7, 32,
   E'*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them* (2 Esdras 7:32). The secret-places-deliver-the-committed-souls register — the chambers of the dead give back what was entrusted to them at the resurrection. Luke 16:31''s *neither will they be persuaded, though one rose from the dead* assumes the same resurrection-from-the-holding-state architecture: the souls held in the secret places are restored at the appointed day, the resurrection the rich man''s brothers must be persuaded toward before it comes.'),

  -- Thread 3: luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees
  ('canon', 'luke', 17, 26, 'enoch', '1-enoch', 10, 2,
   E'*Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it* (1 Enoch 10:2). The Hebrew library names the days-of-Noach as the deluge-warning issued against a corrupted earth. Luke 17:26''s *as it was in the days of Noach (Noah), so shall it be also in the days of the Son of Adam* draws the comparison the framework reads in the Watcher-rebellion-judgment pattern: the flood came upon an earth corrupted by the Watchers'' works, and the day of the Son of Adam comes upon an earth corrupted in the same register.'),
  ('canon', 'luke', 17, 27, 'enoch', '1-enoch', 10, 3,
   E'*And now instruct him that he may escape and his seed may be preserved for all the generations of the world* (1 Enoch 10:3). The preservation-of-the-righteous-seed-through-the-flood register. Luke 17:27''s *until the day that Noach (Noah) entered into the ark, and the flood came, and destroyed them all* names the same two-outcome architecture: the seed preserved through the ark, the rest destroyed. The framework reads the days-of-the-Son-of-Adam as the same separation — the gathered-seed preserved, the corrupt judged.'),
  ('canon', 'luke', 17, 27, 'jubilees', 'jubilees', 5, 2,
   E'*And lawlessness increased on the earth and all flesh corrupted its way... and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually* (Jubilees 5:2). The Hebrew library names the days-of-Noach as the total-corruption of all flesh — the Watcher-rebellion''s offspring driving the earth into lawlessness. Luke 17:27''s *they did eat, they drank, they married wives, they were given in marriage* names the ordinary-life surface over the same corruption-judgment the flood answered; the framework reads the eating-and-drinking not as innocence but as obliviousness on the eve of the appointed judgment.'),
  ('canon', 'luke', 17, 27, 'jubilees', 'jubilees', 5, 4,
   E'*And He said: "I shall destroy man and all flesh upon the face of the earth which I have created"* (Jubilees 5:4). The Hebrew library names the flood-decree of total judgment that fell in the days of Noach. Luke 17:27''s *and the flood came, and destroyed them all* walks the same decree; the *destroyed them all* of the gospel is the *I shall destroy... all flesh* of the wisdom of Jubilees. The days-of-the-Son-of-Adam comparison the King draws rests on this flood-judgment pattern the Hebrew library carried in full.'),

  -- Thread 4: luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch
  ('canon', 'luke', 19, 10, 'apocrypha', 'ecclesiasticus', 36, 11,
   E'*Gather all the tribes of Jacob together, and inherit you them, as from the beginning* (Sirach / Ecclesiasticus 36:11). The wisdom-stream''s explicit prayer for the gathering of ALL the tribes of Ya''aqov (Jacob) — not Yahudah (Judah) alone, but all the scattered houses, *as from the beginning.* Luke 19:10''s *the Son of Adam is come to seek and to save that which was lost* names the King''s own programmatic statement of that same gathering-mission: the seeking-and-saving of the lost is the gathering of the scattered tribes the Hebrew library had been praying for, not a categorical-nations inclusion.'),
  ('canon', 'luke', 19, 10, 'apocrypha', 'ecclesiasticus', 36, 12,
   E'*O Yahuah (God), have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn* (Sirach 36:12). The wisdom-stream names the object of the gathering: Yashar''el, the firstborn called by the Name. Luke 19:10''s lost-that-must-be-sought is this firstborn-people scattered and gone Lo-Ammi; the Son of Adam comes to seek and save precisely *the lost sheep of the house of Yashar''el.* The mercy the wisdom-stream prays for the firstborn is the mercy the King enacts in seeking the lost.'),
  ('canon', 'luke', 19, 10, 'enoch', '1-enoch', 90, 3,
   E'*And that great horn cried aloud to the sheep, and the sheep began to gather together to it* (1 Enoch 90:3). The animal-apocalypse names the gathering of the dispersed sheep to the great horn at the appointed time. Luke 19:10''s *the Son of Adam is come to seek and to save that which was lost* names the same shepherd-gathers-the-scattered-sheep architecture in the King''s own programmatic voice — the lost sheep gathered to the one who cries aloud to them, the framework''s seeking-and-saving as the ingathering of the scattered house, not a self-selected community drawn from the nations.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_l1619_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug     = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number   = i.src_v
  JOIN _s212_l1619_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug     = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number   = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- B. Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach',
       E'Ye cannot serve Elohim and mammon — gold as snare in Sirach',
       E'Luke-specific placement. The unjust-steward parable (vv.1-8) closes not with a commendation of dishonesty but with a verdict on masters: *No servant can serve two masters... Ye cannot serve Elohim (God) and mammon* (Luke 16:13). The Hebrew library''s wisdom-stream had already named the architecture at the gold-as-snare level. Sirach (Ecclesiasticus) 31:5 names the disqualification: *he that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* Sirach 31:6 names the ruin: *gold has been the ruin of many, and their destruction was present.* Sirach 31:7 names gold-as-stumblingblock-for-those-who-sacrifice-to-it: *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* The wisdom-stream identifies wealth as an object of worship that captures its devotees; the King names the same at the forced-choice level — the divided heart cannot stand justified before the Father whose service is whole-heart. The Sermon carries the same Sirach material at Matthew 6:24; the Lukan setting is distinct, sealing a steward-parable about deploying mammon shrewdly before the books are called.',
       sv.verse_id, ev.verse_id, 'extras', 3520
  FROM _s212_l1619_lookup sv, _s212_l1619_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 13
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 16 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras',
       E'The rich man and Lazaros — the hollow places of the dead in 1 Enoch and 2 Esdras',
       E'Luke-specific. FRAMEWORK-MAJOR for the framework-honest sheol register the inherited soul-sleep doctrine and the inherited eternal-conscious-torment doctrine BOTH misread. Lazaros is carried by the angels into Avraham''s (Abraham''s) bosom; the rich man is buried, lifts his eyes in torments, and sees across a fixed gulf (Luke 16:22-26). The Hebrew library names the architecture the parable assumes. 1 Enoch 22 shows Enoch the holding-places of the dead: *there was in it four hollow places, deep and wide and very smooth* (22:9); *these hollow places have been created for this very purpose, that the spirits of the souls of the dead should assemble therein* (22:10); *and these places have been made for them until the day of their judgement and until their appointed period* (22:11). Three pieces the framework holds: sheol is real, conscious, and compartmented (against soul-sleep), AND temporal-pending-the-judgment (against eternal-conscious-torment-as-the-final-destination). 2 Esdras 7:32 names the resurrection-from-the-holding-state: *the secret places shall deliver those souls that were committed to them.* Luke 16:31''s *though one rose from the dead* assumes exactly this resurrection from the chambers the Hebrew library named. The S185 canon thread carries the Tanakh anchors and the Mosheh-and-the-prophets standing-test; this thread promotes the Hebrew-library hollow-places witness into edition-aware member-rows.',
       sv.verse_id, ev.verse_id, 'extras', 3521
  FROM _s212_l1619_lookup sv, _s212_l1619_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 19
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 16 AND ev.verse_number = 31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees',
       E'As it was in the days of Noach — the flood judgment in 1 Enoch and Jubilees',
       E'Luke-specific. The King draws the days-of-the-Son-of-Adam comparison from the days-of-Noach: *as it was in the days of Noach (Noah), so shall it be also in the days of the Son of Adam... until the day that Noach (Noah) entered into the ark, and the flood came, and destroyed them all* (Luke 17:26-27). The framework reads the flood not as a generic moral lesson but as the Watcher-rebellion-judgment pattern the Hebrew library carries in full. 1 Enoch 10:2 names the deluge-warning against the corrupted earth: *reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come.* 1 Enoch 10:3 names the preservation of the righteous seed through the flood: *that he may escape and his seed may be preserved for all the generations of the world.* Jubilees 5:2 names the total-corruption that brought the flood: *lawlessness increased on the earth and all flesh corrupted its way.* Jubilees 5:4 names the flood-decree: *I shall destroy man and all flesh upon the face of the earth which I have created.* The eating-and-drinking-and-marrying surface of Luke 17:27 is obliviousness on the eve of the appointed judgment, not innocence; the days-of-the-Son-of-Adam is the same two-outcome separation — the gathered-seed preserved, the corrupt judged. The S185 canon thread carries the Matthew parallel; this thread promotes the 1 Enoch and Jubilees flood-judgment witness into edition-aware member-rows.',
       sv.verse_id, ev.verse_id, 'extras', 3522
  FROM _s212_l1619_lookup sv, _s212_l1619_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 26
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 17 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch',
       E'The Son of Adam is come to seek and save the lost — the gathering of the tribes of Jacob in Sirach and 1 Enoch',
       E'Luke-specific. The King''s programmatic statement at Zakkay''s (Zacchaeus''s) house — *the Son of Adam is come to seek and to save that which was lost* (Luke 19:10) — names the gathering-mission the framework reads as the ingathering of the scattered house of Yashar''el (Israel), not a categorical-nations inclusion. The Hebrew library had already been praying the gathering. Sirach (Ecclesiasticus) 36:11 names it directly: *gather all the tribes of Jacob together, and inherit you them, as from the beginning* — all the tribes, not Yahudah (Judah) alone. Sirach 36:12 names the object: *have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* 1 Enoch 90:3 names the gathering in the animal-apocalypse: *that great horn cried aloud to the sheep, and the sheep began to gather together to it.* The lost that the Son of Adam seeks is the firstborn-people scattered and gone Lo-Ammi; the seeking-and-saving is the shepherd-gathers-the-scattered-sheep architecture the Hebrew library had been praying and seeing in vision. The wisdom-stream''s prayer and Enoch''s vision name the gathering; the King enacts it.',
       sv.verse_id, ev.verse_id, 'extras', 3523
  FROM _s212_l1619_lookup sv, _s212_l1619_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 19 AND sv.verse_number = 10
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'luke' AND ev.chapter_number = 19 AND ev.verse_number = 10
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- C. Link cross_references to their threads (member rows).
-- ---------------------------------------------------------------------

-- Thread 1: luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 31:5 — *he that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* The wisdom-stream''s gold-love-disqualifies architecture; Luke 16:13''s *Ye cannot serve Elohim (God) and mammon* names the same at the forced-choice-of-masters level.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 31:6 — *gold has been the ruin of many, and their destruction was present.* The gold-as-ruin diagnostic; the mammon-servant of Luke 16:13 walks toward the same ruin the wisdom-stream named.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 31:7 — *it is a stumblingblock to them that sacrifice to it, and every fool shall be taken with it.* Gold-as-stumblingblock-for-its-devotees; mammon is a competing master at Luke 16:13 because the wisdom-stream had already named gold as the master that takes those who sacrifice to it.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-cannot-serve-elohim-and-mammon-and-gold-as-snare-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 31 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 22:9 — *there was in it four hollow places, deep and wide and very smooth.* Enoch shown the compartmented holding-places of the dead; Luke 16:22''s carrying of Lazaros into Avraham''s (Abraham''s) bosom while the rich man is held elsewhere walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 22
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 22:10 — *the spirits of the souls of the dead should assemble therein.* The conscious-souls-assembled register against soul-sleep; Luke 16:23''s rich man lifting his eyes and seeing across the gulf assumes exactly this gathered-and-aware architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 23
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 22:11 — *these places have been made for them until the day of their judgement and until their appointed period.* The holding-places are TEMPORAL; the framework''s key against both soul-sleep and eternal-conscious-torment-as-final-destination. Luke 16:26''s *great gulf fixed* names the same compartments held until the great judgment.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 26
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 22 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 7:32 — *the secret places shall deliver those souls that were committed to them.* The resurrection-from-the-holding-state register; Luke 16:31''s *though one rose from the dead* assumes the chambers give back what was committed to them at the appointed day.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-16-the-rich-man-and-lazaros-and-the-hollow-places-of-the-dead-in-1-enoch-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 31
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 7 AND tv.verse_number = 32
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:2 — *reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth.* The deluge-warning against the corrupted earth; Luke 17:26''s days-of-Noach comparison reads in the Watcher-rebellion-judgment pattern.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 26
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:3 — *that he may escape and his seed may be preserved for all the generations of the world.* The preservation-of-the-righteous-seed-through-the-flood; Luke 17:27''s ark-entered-then-flood-came names the same two-outcome architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 27
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 10 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:2 — *lawlessness increased on the earth and all flesh corrupted its way.* The total-corruption that brought the flood; Luke 17:27''s eating-drinking-marrying surface is obliviousness over the same corruption-judgment the flood answered.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 27
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 5 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:4 — *I shall destroy man and all flesh upon the face of the earth which I have created.* The flood-decree of total judgment; Luke 17:27''s *the flood came, and destroyed them all* walks the same decree the Hebrew library carried in full.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-17-as-it-was-in-the-days-of-noach-and-lot-the-flood-judgment-in-1-enoch-and-jubilees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 27
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 5 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach (Ecclesiasticus) 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The wisdom-stream''s prayer for the gathering of ALL the tribes; Luke 19:10''s seek-and-save-the-lost names the King''s enactment of that gathering-mission.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 19 AND sv.verse_number = 10
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 36:12 — *have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* The object of the gathering — the firstborn-people called by the Name; Luke 19:10''s lost-that-must-be-sought is this firstborn scattered Lo-Ammi.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 19 AND sv.verse_number = 10
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 90:3 — *that great horn cried aloud to the sheep, and the sheep began to gather together to it.* The animal-apocalypse gathering of the dispersed sheep; Luke 19:10''s seek-and-save-the-lost names the same shepherd-gathers-the-scattered architecture in the King''s own voice.'
  FROM cross_reference_threads t, cross_references x,
       _s212_l1619_lookup sv, _s212_l1619_lookup tv
 WHERE t.slug = 'luke-19-seek-and-save-the-lost-and-the-gathering-of-the-tribes-of-jacob-in-sirach-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'luke' AND sv.chapter_number = 19 AND sv.verse_number = 10
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s212_l1619_lookup;

-- ----- fragment: minion_luke_20_24.sql -----
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

COMMIT;
\echo 'Session 212 — Luke extras-library cross-references complete.'
