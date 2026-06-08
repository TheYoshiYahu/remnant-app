-- =====================================================================
-- S212 Gospel extras-library cross-references — JOHN 2, 3, 4
-- =====================================================================
-- Range: John 2 (temple cleansing), John 3 (Nicodemus / born-again /
--   new heart, the Son of Adam come down from heaven), John 4 (the
--   woman of Samaria / living water / worship in spirit and truth).
-- Tag: j0204    Temp view: _s212_j0204_lookup
-- sort_order band: 3030-3059
--
-- John 2 already carries canon threads (session194: cana-new-wine,
-- zeal-for-thine-house, destroy-this-temple) and John 3/4 carry canon
-- threads (session181: born-from-above v3-8, lifted-up v14, son-of-
-- adam-as-judge-and-ladder, salvation-is-of-the-yahudim v22). Those
-- migrations targeted canon only and never inserted extras-library
-- member rows. This fragment ADDS the missing outside-canon (extras)
-- threads the three chapters warrant — it does not duplicate the canon
-- threads.
--
-- FOUR new extras-tier threads:
--   1. john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1
--        target editions: jubilees (Jubilees 1)                 (sort 3030)
--   2. john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3
--        target editions: apocrypha (Baruch 3-4)                (sort 3031)
--   3. john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24
--        target editions: apocrypha (Ecclesiasticus / Sirach 24) (sort 3032)
--   4. john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees
--        target editions: apocrypha (1 Maccabees 4, 2 Maccabees 10) (sort 3033)
--
-- 13 extras-tier cross_references rows; 13 thread_member rows.
-- John 2 receives ONE extras thread (the Maccabean rededication) — its
-- water-to-wine + body-as-temple material is canon-substantial and
-- adds no framework-bearing extras connection at the required rigour,
-- so only the cleansing draws an extras add. No chapter in the range
-- was found to warrant zero extras.
--
-- Every quoted verse pulled live from the parsed editions; sacred names
-- restored per the voice convention; son-of-man -> Son of Adam applied.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (edition-aware, S135 pattern).
CREATE TEMP VIEW _s212_j0204_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id  = e.id
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

  -- Thread 1: john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1
  ('canon', 'john', 3, 3, 'jubilees', 'jubilees', 1, 20,
   '*Let Your mercy, O Yahuah (God), be lifted up upon Your people, and create in them an upright spirit, and let not the spirit of Beliar rule over them ... create in them a clean heart and a holy spirit, and let them not be ensnared in their sins from henceforth until eternity.* (Jubilees 1:20) Mosheh (Moses) prays for the very thing Yahusha (Jesus) tells Nicodemus is required to *see the kingdom of Elohim (God)* — a clean heart and a holy spirit created in the people from above. The new birth of John 3:3 is not a new religion but the clean-heart-and-holy-spirit creation the Hebrew library names as the work of mercy lifted upon the covenant people, not a credential the flesh can manufacture.'),
  ('canon', 'john', 3, 5, 'jubilees', 'jubilees', 1, 23,
   '*And after this they will turn to Me in all uprightness and with all (their) heart and with all (their) soul, and I shall circumcise the foreskin of their heart and the foreskin of the heart of their seed, and I shall create in them a holy spirit, and I shall cleanse them so that they shall not turn away from Me from that day to eternity.* (Jubilees 1:23) *Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God)* (John 3:5) walks the same architecture the Hebrew library already named: the cleansing (water) and the created holy spirit (Spirit) are one act of Yahuah (God) upon the circumcised heart. The born-of-water-and-Spirit of John 3 is the heart-circumcision and holy-spirit-creation of Jubilees 1, not a sacrament severed from the heart-Torah it writes.'),
  ('canon', 'john', 3, 6, 'jubilees', 'jubilees', 1, 24,
   '*And their souls will cleave to Me and to all My commandments, and they will fulfil My commandments, and I shall be their Father and they will be My children.* (Jubilees 1:24) *That which is born of the Spirit is spirit* (John 3:6) names the Spirit-wrought life the Hebrew library describes as the soul that cleaves to Yahuah (God) and fulfils His commandments. The Spirit-birth does not lead away from the commandments; it produces the soul that cleaves to them — the same Spirit who spoke at Sinai writing the Torah inward and making the born-again a child of the Father.'),
  ('canon', 'john', 3, 7, 'jubilees', 'jubilees', 1, 25,
   '*And they will all be called children of the living Elohim (God), and every angel and every spirit will know ... that these are My children, and that I am their Father.* (Jubilees 1:25) *Ye must be born again* (John 3:7) is the doorway into the *children of the living Elohim (God)* the Hebrew library names as the destination of the heart-circumcision. The new birth makes the willing into the children-of-the-living the prophets promised the gathered house — the same sonship Hoshea (Hosea) named for the scattered who were once *not my people.*'),

  -- Thread 2: john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3
  ('canon', 'john', 3, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 29,
   '*Who has gone up into heaven, and taken her, and brought her down from the clouds?* (Baruch 3:29) The Hebrew library asks the rhetorical question — no son of Adam can ascend to heaven to fetch the wisdom of Elohim (God) down. *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven* (John 3:13) is the answer the question waited for: the One who came down is the only One who was ever up there to bring it. The ascent the wisdom-stream says no man can make is the descent the Formed Son already made.'),
  ('canon', 'john', 3, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 30,
   '*Who has gone over the sea, and found her, and will bring her for pure gold?* (Baruch 3:30) The wisdom-stream stacks the impossibility — wisdom cannot be reached over the sea any more than up to heaven; she is past the searching of the son of Adam. John 3:13''s *no man hath ascended up to heaven, but he that came down from heaven* names the One who did not have to search for her because He came down from where she dwells. The reaching the Hebrew library forecloses to man is answered by the descent of the Son of Adam.'),
  ('canon', 'john', 3, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 37,
   '*Afterward did he shew himself upon earth, and conversed with men.* (Baruch 3:37) The Hebrew library closes the wisdom-search by naming the descent: the One who alone knows wisdom *shewed himself upon earth, and conversed with men.* This is the substance of John 3:13 — the Son of Adam who *came down from heaven* is the One Baruch says shewed himself on earth and walked among men, the wisdom no man could fetch down now standing in flesh in front of Nicodemus.'),
  ('canon', 'john', 3, 12, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1,
   '*This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* (Baruch 4:1) The wisdom Baruch 3 says no man could ascend to fetch is here named plainly as the Torah, *the law that endureth for ever.* Yahusha''s (Jesus'') rebuke at John 3:12 — *if I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things?* — falls on a *master of Yashar''el (Israel)* who held the book of the commandments yet could not see the heavenly thing the book pointed toward. The Torah endures for ever; the One who came down from heaven is the wisdom it was always carrying.'),

  -- Thread 3: john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24
  ('canon', 'john', 4, 14, 'apocrypha', 'ecclesiasticus', 24, 21,
   '*They that eat me shall yet be hungry, and they that drink me shall yet be thirsty.* (Ecclesiasticus / Sirach 24:21) Wisdom names her own limit in the Hebrew library: the one who drinks of her *shall yet be thirsty* — the study returns one again and again to the well. *Whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14) is the answer to the wisdom-stream''s own confession. The Formed one is not the abolition of the wisdom that left the drinker thirsty; He is the well springing up within, the substance the Torah-wisdom drew the thirsty toward.'),
  ('canon', 'john', 4, 10, 'apocrypha', 'ecclesiasticus', 24, 19,
   '*Come to me, all you that be desirous of me, and fill yourselves with my fruits.* (Ecclesiasticus / Sirach 24:19) Wisdom calls the desirous to come and be filled — the same invitation Yahusha (Jesus) extends at the well: *if thou knewest the gift of Elohim (God) ... thou wouldest have asked of him, and he would have given thee living water* (John 4:10). The Hebrew library''s *come to me ... and fill yourselves* is the wisdom-call the living-water offer fulfils; the gift of Elohim (God) the woman did not yet know is the wisdom-fountain standing at Ya''aqov''s (Jacob''s) well asking her for a drink.'),
  ('canon', 'john', 4, 22, 'apocrypha', 'ecclesiasticus', 24, 23,
   '*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* (Ecclesiasticus / Sirach 24:23) The Hebrew library identifies wisdom as the Torah given as a heritage to the congregations of Ya''aqov (Jacob) — the covenant-knowledge the house of the covenant carries. *Salvation is of the Yahudim (Jews)* (John 4:22) names the same thing to the woman of Samaria: the wisdom, the covenant, the heritage was kept in the line of Yahudah (Judah), and the well of living water now offered to the scattered northern house flows from that kept inheritance, not from a rival mountain.'),

  -- Thread 4: john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees
  ('canon', 'john', 2, 16, 'apocrypha', '1-maccabees', 4, 36,
   '*Then said Judas and his brothers, Behold, our enemies are discomfited: let us go up to cleanse and dedicate the sanctuary.* (1 Maccabees 4:36) The Hebrew library carries the prior cleansing of the defiled house — the Hasmonean *go up to cleanse and dedicate the sanctuary.* *Make not my Father''s house an house of merchandise* (John 2:16) is the same purging-of-the-defiled-house motion, now in the hand of the One whose house it is. The Maccabees cleansed the sanctuary the heathen profaned; the Formed one cleanses the court the traders profaned, the Lord of the house returning to purge His own.'),
  ('canon', 'john', 2, 15, 'apocrypha', '2-maccabees', 10, 2,
   '*But the altars which the heathen had built in the open street, and also the chapels, they pulled down.* (2 Maccabees 10:2) The rededication tears down what defiled the holy ground. *And when he had made a scourge of small cords, he drove them all out of the temple* (John 2:15) walks the same architecture: the casting-out of the defilement that had encroached on the house of prayer. The Hebrew library''s pulling-down of the heathen altars is the prior enacted purging the Formed one recapitulates with the scourge, reclaiming the gathering-court for the gathering it was built for.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_j0204_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_j0204_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1',
       'Born again — the new heart and clean spirit of Jubilees 1',
       E'Yahusha (Jesus) tells Nicodemus, a *master of Yashar''el (Israel),* that he must be *born again ... of water and of the Spirit* to enter the kingdom of Elohim (God) — and is met with bewilderment that a teacher of the covenant should not already know this. The inherited reading hears a new-religion entry-rite. The Hebrew library hears the new-heart promise Mosheh (Moses) prayed for and Yahuah (God) answered on Sinai: the clean heart and holy spirit created in the willing, the foreskin of the heart circumcised, the soul made to cleave to the commandments, the people called children of the living Elohim (God).\n\n*Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God). That which is born of the flesh is flesh; and that which is born of the Spirit is spirit ... Ye must be born again.* (John 3:5-7)\n\n*Create in them a clean heart and a holy spirit, and let them not be ensnared in their sins ... And after this they will turn to Me in all uprightness and with all (their) heart and with all (their) soul, and I shall circumcise the foreskin of their heart and the foreskin of the heart of their seed, and I shall create in them a holy spirit, and I shall cleanse them ... And their souls will cleave to Me and to all My commandments ... And they will all be called children of the living Elohim (God).* (Jubilees 1:20, 23-25)\n\nThe born-of-water-and-Spirit of John 3 is the cleansing-and-holy-spirit-creation Jubilees 1 already names as a single act of Yahuah (God) upon the circumcised heart. The new birth is not a credential the flesh can manufacture — *that which is born of the flesh is flesh* — and it is not a severing from the Torah. The same Spirit-creation that makes the new heart makes *the soul cleave to all My commandments;* the Spirit-birth writes the Torah inward, it does not abolish it. And the destination is the *children of the living Elohim (God)* the prophets promised the gathered house, the sonship Hoshea (Hosea) named for the scattered who were once *not my people.* Nicodemus held the book that promised this; the new birth is the heart-Torah of the covenant he taught coming to pass in the willing.',
       sv.verse_id, ev.verse_id, 'extras', 3030
  FROM _s212_j0204_lookup sv, _s212_j0204_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 3
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3',
       'No man ascended to bring wisdom down — the Son of Adam came down (Baruch 3)',
       E'Pressing past Nicodemus'' bewilderment, Yahusha (Jesus) says the heavenly things are beyond a teacher who will not believe the earthly, and grounds it in a claim about who alone has been in heaven: *no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The Hebrew library had asked the matching question for centuries — who can go up to heaven and bring the wisdom of Elohim (God) down? — and answered that no son of Adam can; she is past the searching of man, until the One who alone knows her *shewed himself upon earth.*\n\n*If I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things? And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* (John 3:12-13)\n\n*Who has gone up into heaven, and taken her, and brought her down from the clouds? Who has gone over the sea, and found her, and will bring her for pure gold? ... Afterward did he shew himself upon earth, and conversed with men. This is the book of the commandments of Yahuah (God), and the law that endureth for ever.* (Baruch 3:29-30, 37; 4:1)\n\nBaruch stacks the impossibility — wisdom cannot be fetched down from the clouds or found over the sea by the reach of the son of Adam — and then names the descent that answered it: the One who alone knows her *shewed himself upon earth, and conversed with men.* That is the substance of John 3:13. The ascent the wisdom-stream forecloses to man is the descent the Formed Son already made; no man went up to bring wisdom down, because the wisdom *came down from heaven* of Himself. And the wisdom Baruch names is no abstraction — it is *the book of the commandments ... the law that endureth for ever.* The *master of Yashar''el (Israel)* held that enduring book and still could not see the heavenly thing it carried, because the wisdom it pointed toward was the Son of Adam standing in flesh in front of him.',
       sv.verse_id, ev.verse_id, 'extras', 3031
  FROM _s212_j0204_lookup sv, _s212_j0204_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 12
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24',
       'Living water that ends the thirst — the wisdom-well of Sirach 24',
       E'At Ya''aqov''s (Jacob''s) well in Samaria — the heartland of the scattered northern house — Yahusha (Jesus) offers a woman *living water,* a *well of water springing up into everlasting life* that ends thirst forever. The Hebrew library''s wisdom-stream had named both the call and its own limit: wisdom invites the desirous to come and be filled, yet confesses that *they that drink me shall yet be thirsty* — the study returns the drinker again and again to the well. The living water Yahusha (Jesus) gives is the answer to that confession.\n\n*Whosoever drinketh of this water shall thirst again: But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* (John 4:13-14)\n\n*Come to me, all you that be desirous of me, and fill yourselves with my fruits ... They that eat me shall yet be hungry, and they that drink me shall yet be thirsty ... All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* (Ecclesiasticus / Sirach 24:19, 21, 23)\n\nWisdom''s *come to me ... and fill yourselves* is the same call Yahusha (Jesus) extends — *if thou knewest the gift of Elohim (God) ... he would have given thee living water.* But the wisdom-stream says her drinkers *shall yet be thirsty,* and the Formed one says His water means the drinker *shall never thirst,* a well springing up within. He is not the abolition of the wisdom that left the drinker thirsty; Sirach 24:23 names that wisdom as *the law which Moses commanded for an heritage to the congregations of Jacob,* and Yahusha (Jesus) is the substance the Torah-wisdom drew the thirsty toward. *Salvation is of the Yahudim (Jews)* — the covenant-heritage was kept in the line of Yahudah (Judah), and the living water now offered to the scattered northern house at the well flows from that kept inheritance, not from a rival mountain. The wisdom that left them thirsty pointed to the well that does not.',
       sv.verse_id, ev.verse_id, 'extras', 3032
  FROM _s212_j0204_lookup sv, _s212_j0204_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 10
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 4 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees',
       'The temple cleansed — the Maccabean rededication of the defiled house',
       E'Yahusha (Jesus) drives the traders out of the temple courts with a scourge of cords and forbids that His *Father''s house* be made *an house of merchandise.* The inherited reading frames a protest against commerce. The Hebrew library carries the prior enacted purging the cleansing recapitulates: the Hasmonean rededication, when the defiled sanctuary was cleansed, the heathen altars torn down, and the house given back to the worship it was built for.\n\n*And when he had made a scourge of small cords, he drove them all out of the temple ... and said unto them that sold doves, Take these things hence; make not my Father''s house an house of merchandise.* (John 2:15-16)\n\n*Then said Judas and his brothers, Behold, our enemies are discomfited: let us go up to cleanse and dedicate the sanctuary.* (1 Maccabees 4:36)\n\n*But the altars which the heathen had built in the open street, and also the chapels, they pulled down. And having cleansed the temple they made another altar.* (2 Maccabees 10:2-3)\n\nThe Maccabees *went up to cleanse and dedicate the sanctuary* the heathen had profaned, pulling down the altars that defiled the holy ground. The Formed one walks the same purging-of-the-defiled-house motion — but where the Hasmoneans cleansed a sanctuary defiled from outside by the heathen, the Lord of the house returns to purge a court defiled from inside by a credential-merchandise that had taken over the very space appointed to receive the gathered outcasts of Yashar''el (Israel). The scourge of cords is the rededication in the hand of the One whose house it is: the prior cleansing was a shadow; the cleansing at the feast is the Owner of the house reclaiming the gathering-court for the gathering.',
       sv.verse_id, ev.verse_id, 'extras', 3033
  FROM _s212_j0204_lookup sv, _s212_j0204_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 13
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 2 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 1:20 — *create in them a clean heart and a holy spirit, and let them not be ensnared in their sins from henceforth until eternity.* Mosheh (Moses) prays for the clean-heart-and-holy-spirit creation John 3:3 names as required to see the kingdom; the new birth is the work of mercy lifted on the people, not a flesh-credential.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 3
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 1 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 1:23 — *I shall circumcise the foreskin of their heart ... and I shall create in them a holy spirit, and I shall cleanse them.* The born-of-water-and-Spirit of John 3:5 is the heart-circumcision (water/cleansing) and holy-spirit-creation (Spirit) named as one act upon the heart in the Hebrew library.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 5
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 1 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 1:24 — *their souls will cleave to Me and to all My commandments, and they will fulfil My commandments, and I shall be their Father and they will be My children.* *That which is born of the Spirit is spirit* (John 3:6): the Spirit-birth produces the soul that cleaves to the commandments — the Spirit writes the Torah inward, never away from it.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 6
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 1 AND tv.verse_number = 24
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 1:25 — *they will all be called children of the living Elohim (God) ... and I am their Father.* *Ye must be born again* (John 3:7) is the doorway into the children-of-the-living the Hebrew library names as the destination of the heart-circumcision — the sonship promised the gathered who were once *not my people.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 7
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 1 AND tv.verse_number = 25
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Baruch 3:29 — *Who has gone up into heaven, and taken her, and brought her down from the clouds?* The Hebrew library''s rhetorical question; John 3:13''s *no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam* is the answer — the descent that no ascent could accomplish.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 3 AND tv.verse_number = 29
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 3:30 — *Who has gone over the sea, and found her, and will bring her for pure gold?* Wisdom is past the reach of the son of Adam over the sea as well as up to heaven; John 3:13 names the One who did not have to search because He came down from where she dwells.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 3 AND tv.verse_number = 30
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 3:37 — *Afterward did he shew himself upon earth, and conversed with men.* The Hebrew library names the descent that answered the wisdom-search; this is the substance of John 3:13''s Son of Adam who *came down from heaven* — the wisdom no man could fetch down now standing in flesh.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 3 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever.* The wisdom Baruch 3 says no man could ascend to fetch is named plainly as the Torah; John 3:12''s rebuke falls on a *master of Yashar''el (Israel)* who held that enduring book yet could not see the heavenly thing it carried.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 12
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 24:19 — *Come to me, all you that be desirous of me, and fill yourselves with my fruits.* Wisdom''s come-and-be-filled call is the same invitation Yahusha (Jesus) extends at John 4:10 — *if thou knewest the gift of Elohim (God) ... he would have given thee living water.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 10
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 24:21 — *they that eat me shall yet be hungry, and they that drink me shall yet be thirsty.* Wisdom confesses her own limit; John 4:14''s *whosoever drinketh of the water that I shall give him shall never thirst ... a well of water springing up into everlasting life* is the answer the wisdom-stream waited for.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 14
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 21
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Wisdom is the Torah-heritage kept in the covenant line; John 4:22''s *salvation is of the Yahudim (Jews)* names the same kept inheritance the living water now flows from to the scattered house.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 22
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 4:36 — *let us go up to cleanse and dedicate the sanctuary.* The Hasmonean cleansing of the defiled house; John 2:16''s *make not my Father''s house an house of merchandise* is the same purging motion, now in the hand of the One whose house it is.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '1-maccabees' AND tv.chapter_number = 4 AND tv.verse_number = 36
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 10:2 — *the altars which the heathen had built ... they pulled down.* The rededication tears down the defilement; John 2:15''s *he drove them all out of the temple* with the scourge of cords walks the same casting-out of what encroached on the house of prayer.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 15
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-maccabees' AND tv.chapter_number = 10 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- END S212 JOHN 2/3/4 extras fragment
-- =====================================================================
