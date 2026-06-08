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
