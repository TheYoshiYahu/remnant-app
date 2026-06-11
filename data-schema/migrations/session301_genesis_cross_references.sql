-- =====================================================================
-- Session 301 — Genesis FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session301_genesis_cross_references.sql
-- =====================================================================

\echo 'session301 — Genesis cross-references starting...'
BEGIN;

-- ----- fragment: minion_genesis_1.sql (Genesis 1) -----
-- Chapter: Genesis 1 (the FOUNDATION layer of the whole framework)
-- Tag: ge01   Temp view: _s301_ge01_lookup
-- Sort band: base 20000, step 3 -> threads 20000, 20003, 20006, 20009, 20012, 20015 (6 threads)
--
-- Genesis 1 coverage (every meaningful verse-block; all three libraries weighed):
--   v.1  ("In the beginning Elohim created the heaven and the earth")
--        NT:     John 1:1-3 / Colossians 1:16 / Hebrews 1:2 (creation BY the Word, the Formed Son) -> thread 20000
--        Extras: 2 Esdras 6:38 / Wisdom 9:1 (the world made by His word) -> thread 20000
--        Tanakh: Psalm 33:6 (by the word of Yahuah were the heavens made) -> thread 20000
--   v.2  ("the Spirit of Elohim moved upon the face of the waters")
--        NT:     John 1:4-5 (in him was life... the light shineth in darkness) -> thread 20003
--        Extras: 2 Esdras 6:39 (the spirit, and darkness... on every side) -- weighed; thinner than 6:38; folded into 20000 register via 6:38, not added separately here
--        Tanakh: covered with v.3 in thread 20003
--   v.3  ("Let there be light: and there was light" -- light before the sun)
--        NT:     John 1:9 (the true Light which lighteth every man) / 2 Corinthians 4:6 (Elohim who commanded the light to shine out of darkness) -> thread 20003
--        Extras: 2 Esdras 6:40 (a fair light to come forth) -- weighed; 6:38 already carries the register in 20000; none added here
--        Tanakh: Isaiah 60:19 (Yahuah an everlasting light) / Revelation 21:23 (the glory of Elohim did lighten it -- NT close) -> thread 20003
--   v.4-5  (light divided from darkness; Day and Night; first day)
--        NT/Extras/Tanakh: none warranted beyond the light register already in thread 20003
--   v.6-8  (firmament; second day)
--        NT: none warranted   Extras: Jubilees 2:4 / 2 Esdras 6:41 recount the day -- weighed, no framework load; none added   Tanakh: none warranted
--   v.9-10  (waters gathered; dry land; Seas)
--        NT: none warranted   Extras: Jubilees 2:5-6 recount -- weighed; none added   Tanakh: none warranted
--   v.11-12  ("the herb yielding seed... fruit tree... after his kind, whose seed is in itself")
--        NT:     none warranted (the seed principle surfaces canonically in Genesis 3:15)
--        Extras: weighed (Jubilees 2:6 lists the seed sown) -- recount only, no framework load; none added
--        Tanakh: Genesis 3:15 (thy seed and her seed -- the seed-of-promise war that "after his kind" founds) -> thread 20009
--   v.13  (third day) -- none warranted
--   v.14  ("lights... for signs, and for seasons, and for days, and years" -- the appointed-times root)
--        NT:     none direct warranted (Leviticus 23 is the architecture; the luminaries are its root) -- recorded none
--        Extras: Jubilees 2:9 (the sun a great sign... for feasts and for years) / 1 Enoch 2:1 (the luminaries... rise and set in order each in its season) -> thread 20006
--        Tanakh: Psalm 104:19 (he appointed the moon for seasons) / Leviticus 23:2-3 (the feasts of Yahuah; the sabbath) -> thread 20006
--   v.15-19  (lights set; greater/lesser; stars; fourth day) -- folded into thread 20006 (v.16 the two great lights cited inline in summary)
--   v.20-23  (fifth day: sea creatures, fowl, "after their kind")
--        NT: none warranted   Extras: Jubilees 2:11 / 2 Esdras 6:47 recount -- weighed; "after his kind" already carried by thread 20009 via v.11; none added   Tanakh: none warranted
--   v.24-25  (sixth day: living creature "after his kind", cattle, beast) -- "after his kind" carried by thread 20009; none added separately
--   v.26-27  ("Let us make man in our image, after our likeness"; "in the image of Elohim created he him")
--        NT:     Colossians 3:10 (the new man renewed... after the image of him that created him) / 2 Corinthians 4:4 (Messiah, who is the image of Elohim) / Colossians 1:15 (the image of the invisible Elohim, the firstborn) -> thread 20012
--        Extras: weighed (Wisdom 9:2 ordained man) -- placed in the dominion thread 20015 instead; none added to image thread
--        Tanakh: Genesis 2:7 (Yahuah Elohim formed man of the dust -- Adam formed separately to tend the garden; the framework distinction) -> thread 20012
--   v.26-28  (dominion over fish, fowl, cattle, all the earth; "subdue it")
--        NT:     none direct warranted (Psalm 8 is the canonical echo; its NT fulfilment Heb 2 not pulled this chapter) -- recorded none
--        Extras: Wisdom 9:2 (ordained man... that he should have dominion over the creatures) -> thread 20015
--        Tanakh: Psalm 8:4-6 (what is man... the son of Adam... thou madest him to have dominion) -> thread 20015
--   v.29-30  (every herb / fruit for meat) -- NT/Extras/Tanakh: none warranted (dietary instruction; not framework-load for this chapter's threads)
--   v.31  (very good; sixth day) -- none warranted (the "good" refrain is summarized in thread prose, no separate row)
--
-- Threads (slug -> target libraries):
--   20000 genesis-1-and-elohim-said-creation-by-the-word               [Tanakh + NT + Extras]  (EXTRAS tier)
--   20003 genesis-1-the-spirit-moved-and-let-there-be-light            [NT + Tanakh(Isa) ]      (FREE tier)
--   20006 genesis-1-lights-for-signs-and-for-seasons-the-appointed-times-root [Tanakh + Extras] (EXTRAS tier)
--   20009 genesis-1-the-seed-after-his-kind                            [Tanakh]                 (FREE tier)
--   20012 genesis-1-let-us-make-adam-in-our-image                      [NT + Tanakh]            (FREE tier)
--   20015 genesis-1-dominion-and-the-son-of-adam                       [Tanakh + Extras]        (EXTRAS tier)
--
-- Framework-load-bearing / contested framings:
--   * v.3/v.1 Christology headline: creation by the WORD is the Formed Son drawn from the Formless, who HAS a Father
--     (John 1:1-3, Col 1:16, Heb 1:2). Framed as Formed-and-Formless, NO trinitarian co-equal-persons grammar.
--   * v.26 "Let us make": framed as the Formed + the Father (the image-bearing pair), explicitly NOT a proof of three co-equal persons.
--   * v.26-27 vs Genesis 2:7: the broad mankind of Genesis 1 is distinguished from Adam formed separately in Genesis 2:7
--     to tend the garden (the seed-of-promise line). Kept in Genesis 1's own broad-creation register; the distinction is NOTED, not collapsed.
--   * v.14 appointed-times ROOT: the luminaries are set for Yahuah's calendar (moedim) -- the foundation Leviticus 23 builds on. Surfaced as load-bearing.

CREATE TEMP VIEW _s301_ge01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- Thread 20000: And Elohim said -- creation by the Word (the Formed Son)
  ('canon','genesis',1,1,'canon','john',1,1,'free',
   E'*In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) Genesis opens *In the beginning Elohim (God) created the heaven and the earth* -- and John reaches back to the same beginning to name the agent: the Word, the Formed One drawn from the Formless. He is Elohim (God) and is *with* Elohim (God) -- the Son who has a Father, not a second co-equal person.'),
  ('canon','genesis',1,1,'canon','john',1,3,'free',
   E'*All things were made by him; and without him was not any thing made that was made.* (John 1:3) Every *And Elohim (God) said* of Genesis 1 is this making. The heaven and the earth that Elohim *created* (Genesis 1:1) were made BY the Word -- the spoken creation is the work of the Formed Son.'),
  ('canon','genesis',1,1,'canon','colossians',1,16,'free',
   E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible... all things were created by him, and for him.* (Colossians 1:16) Paul reads Genesis 1:1 through the Son: the One who *created the heaven and the earth* is the Formed, *the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15), the agent of the Father''s creating word.'),
  ('canon','genesis',1,1,'canon','hebrews',1,2,'free',
   E'*Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds.* (Hebrews 1:2) The Father *made the worlds* BY the Son. Genesis 1:1''s *In the beginning Elohim (God) created* is thus the Father speaking through the Formed Word -- creation has a Speaker and a Spoken-One, never an undifferentiated trinity of equals.'),
  ('canon','genesis',1,1,'canon','psalms',33,6,'free',
   E'*By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* (Psalm 33:6) The Tanakh itself names the instrument before the NT does: the heavens of Genesis 1:1 were made *by the word* of Yahuah and *by the breath of his mouth* -- the Word and the Spirit (Genesis 1:2) already present at the foundation.'),
  ('canon','genesis',1,1,'apocrypha','2-esdras',6,38,'extras',
   E'*And I said, O Yahuah (God), you spakest from the beginning of the creation, even the first day, and saidst thus; Let heaven and earth be made; and your word was a perfect work.* (2 Esdras 6:38) The restored witness echoes Genesis 1:1 exactly: Yahuah *spakest from the beginning* and *your word was a perfect work* -- creation accomplished by the spoken Word.'),
  ('canon','genesis',1,1,'apocrypha','the-wisdom-of-solomon',9,1,'extras',
   E'*O Yahuah (God) of my fathers, and Yahuah (God) of mercy, who have made all things with your word.* (Wisdom of Solomon 9:1) Solomon''s prayer confesses the same foundation: Yahuah *made all things with your word* -- the Word by whom *Elohim (God) created the heaven and the earth* (Genesis 1:1).'),

  -- Thread 20003: the Spirit moved, and let there be light
  ('canon','genesis',1,2,'canon','john',1,4,'free',
   E'*In him was life; and the life was the light of men.* (John 1:4) Genesis 1:2 sets *the Spirit of Elohim (God)* moving over the deep, and the very next word is light (Genesis 1:3). John names whose light it is: *in him was life; and the life was the light of men* -- the Word who is about to say *Let there be light*.'),
  ('canon','genesis',1,3,'canon','john',1,9,'free',
   E'*That was the true Light, which lighteth every man that cometh into the world.* (John 1:9) Light appears in Genesis 1:3 three days before the sun -- because the source is not the sun. *And Elohim (God) said, Let there be light: and there was light* points to *the true Light* who *lighteth every man*, the Formed Word himself.'),
  ('canon','genesis',1,3,'canon','2-corinthians',4,6,'free',
   E'*For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ).* (2 Corinthians 4:6) Paul quotes Genesis 1:3 directly -- *Elohim (God), who commanded the light to shine out of darkness* -- and lands it in *the face of Yahusha HaMashiach (Jesus Christ)*: the first light and the glory of the Messiah are one shining.'),
  ('canon','genesis',1,3,'canon','isaiah',60,19,'free',
   E'*The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* (Isaiah 60:19) The light of Genesis 1:3 that needed no sun is the everlasting light of the end: Yahuah himself, *an everlasting light*, the glory that opens and closes the canon.'),
  ('canon','genesis',1,3,'canon','revelation',21,23,'free',
   E'*And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof.* (Revelation 21:23) Creation ends where it began: light without sun or moon. The light of *Let there be light* (Genesis 1:3) is the New Jerusalem''s light -- *the glory of Elohim (God)* and *the Lamb*.'),

  -- Thread 20006: lights for signs and for seasons -- the appointed-times root
  ('canon','genesis',1,14,'canon','psalms',104,19,'free',
   E'*He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19) The Psalm sings Genesis 1:14 back: the lights set *for signs, and for seasons* are Yahuah''s timekeepers -- *he appointed the moon for seasons* (mo''edim), the luminaries governing the calendar of the appointed times.'),
  ('canon','genesis',1,14,'canon','leviticus',23,2,'free',
   E'*Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* (Leviticus 23:2) Genesis 1:14 lays the foundation Leviticus 23 builds upon: the lights are *for signs, and for seasons* -- the same word that names *the feasts of Yahuah (LORD)*, the mo''edim appointed at creation and proclaimed at Sinai.'),
  ('canon','genesis',1,14,'canon','leviticus',23,3,'free',
   E'*Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation... it is the sabbath of Yahuah (LORD) in all your dwellings.* (Leviticus 23:3) The first of the appointed times is the seventh day, set in the very rhythm of Genesis 1''s six days and the rest that follows -- the luminaries *for... days, and years* (Genesis 1:14) keeping the week Yahuah ordained.'),
  ('canon','genesis',1,14,'jubilees','jubilees',2,9,'extras',
   E'*And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* (Jubilees 2:9) The restored witness unfolds Genesis 1:14 explicitly: the luminary is *a great sign... for feasts and for years* -- the sun and moon as the engine of the whole appointed-times architecture, sabbaths, feasts, and jubilees together.'),
  ('canon','genesis',1,14,'enoch','1-enoch',2,1,'extras',
   E'*Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* (1 Enoch 2:1) Enoch testifies that the lights of Genesis 1:14 keep *their appointed order* -- *each in its season*, the unwavering luminaries marking the mo''edim of Yahuah.'),

  -- Thread 20009: the seed after his kind
  ('canon','genesis',1,11,'canon','genesis',3,15,'free',
   E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) The seed principle planted in Genesis 1:11 -- *the herb yielding seed... whose seed is in itself... after his kind* -- becomes the spine of the whole canon two chapters on: *thy seed and her seed*, the seed-war that the covenant carries by bloodline-and-promise to its end.'),

  -- Thread 20012: let us make Adam in our image
  ('canon','genesis',1,26,'canon','colossians',1,15,'free',
   E'*Who is the image of the invisible Elohim (God), the firstborn of every creature.* (Colossians 1:15) *Let us make man in our image* (Genesis 1:26) is the Formed and the Father together. The image after which man is made is the Son himself -- *the image of the invisible Elohim (God)* -- not a council of three co-equal persons but the expressed Word in whom the formless Father is seen.'),
  ('canon','genesis',1,26,'canon','2-corinthians',4,4,'free',
   E'*...lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them.* (2 Corinthians 4:4) Man was made *in our image, after our likeness* (Genesis 1:26); the true image is *Messiah (Christ), who is the image of Elohim (God)* -- the pattern from which Adam was drawn and into which the redeemed are restored.'),
  ('canon','genesis',1,27,'canon','colossians',3,10,'free',
   E'*And have put on the new man, which is renewed in knowledge after the image of him that created him.* (Colossians 3:10) *In the image of Elohim (God) created he him* (Genesis 1:27) is the image marred and then *renewed* in Messiah -- the new man remade *after the image of him that created him*, the creation-image restored.'),
  ('canon','genesis',1,27,'canon','genesis',2,7,'free',
   E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7) Genesis 1:27 speaks of mankind made *male and female* in the broad creation; Genesis 2:7 narrows to Adam *formed... of the dust* and given the breath -- the man set apart to tend the garden, the seed-of-promise line. The two are distinguished, not collapsed.'),

  -- Thread 20015: dominion and the son of Adam
  ('canon','genesis',1,26,'canon','psalms',8,4,'free',
   E'*What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4) The dominion granted in Genesis 1:26 is sung in Psalm 8 with the seed-weight intact: *the son of Adam* -- the lineage of the man given rule over the works of Yahuah''s hands.'),
  ('canon','genesis',1,28,'canon','psalms',8,6,'free',
   E'*Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet.* (Psalm 8:6) *Have dominion over the fish of the sea, and over the fowl of the air, and over every living thing* (Genesis 1:28) is exactly Psalm 8''s grant: *dominion over the works of thy hands... all things under his feet* -- the charge to the son of Adam.'),
  ('canon','genesis',1,28,'apocrypha','the-wisdom-of-solomon',9,2,'extras',
   E'*And ordained man through your wisdom, that he should have dominion over the creatures which you have made.* (Wisdom of Solomon 9:2) The restored witness confirms the Genesis 1:28 grant: Yahuah *ordained man... that he should have dominion over the creatures* -- the dominion mandate spoken at creation, given through the same Wisdom by which the world was made.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-1-and-elohim-said-creation-by-the-word',
       E'And Elohim Said -- Creation by the Word',
       E'Genesis opens with a Speaker: *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1), and then ten times over, *And Elohim (God) said* -- creation spoken into being. The New Testament reaches back to this same beginning to name the One spoken through. *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1); *All things were made by him; and without him was not any thing made that was made* (John 1:3). This is the Formed and the Formless: the Word is the expressed Son, drawn from the formless Father, the agent of the creating word -- *with* Elohim and yet Elohim, never a second co-equal person. Paul says it plainly: *For by him were all things created, that are in heaven, and that are in earth... all things were created by him, and for him* (Colossians 1:16), the Son who is *the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15). Hebrews seals it: the Father *made the worlds* *by his Son* (Hebrews 1:2). The Tanakh had already named the instrument -- *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6) -- the Word and the breath/Spirit (Genesis 1:2) both at the foundation. The restored witnesses agree: *you spakest from the beginning of the creation... and your word was a perfect work* (2 Esdras 6:38); *who have made all things with your word* (Wisdom of Solomon 9:1). Creation has a Speaker and a Spoken-One. That is the Christology headline of the first chapter.',
       sv.verse_id, ev.verse_id, 'extras', 20000
  FROM _s301_ge01_lookup sv, _s301_ge01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=1 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-1-the-spirit-moved-and-let-there-be-light',
       E'The Spirit Moved, and Let There Be Light',
       E'Before the first word of light, *the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2) -- the Ruach HaKodesh present at the foundation, hovering over the deep. Then: *And Elohim (God) said, Let there be light: and there was light* (Genesis 1:3). Notice the order -- light comes on day one; the sun is not made until day four (Genesis 1:14-16). The first light is not solar. John names its source: *In him was life; and the life was the light of men* (John 1:4); *That was the true Light, which lighteth every man that cometh into the world* (John 1:9). Paul quotes Genesis 1:3 word for word and lands it on the Messiah: *For Elohim (God), who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of Elohim (God) in the face of Yahusha HaMashiach (Jesus Christ)* (2 Corinthians 4:6). The light of the first day and the glory of the Messiah are one shining. And the canon closes where it opened, with light that needs no sun: *The sun shall be no more thy light by day... but Yahuah (LORD) shall be unto thee an everlasting light* (Isaiah 60:19); *the city had no need of the sun, neither of the moon... for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof* (Revelation 21:23). The first *Let there be light* is the everlasting light of the end.',
       sv.verse_id, ev.verse_id, 'free', 20003
  FROM _s301_ge01_lookup sv, _s301_ge01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-1-lights-for-signs-and-for-seasons-the-appointed-times-root',
       E'Lights for Signs and for Seasons -- The Appointed-Times Root',
       E'On the fourth day Yahuah sets the luminaries with a purpose: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) -- *he made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also* (Genesis 1:16). The word rendered *seasons* is mo''edim -- appointed times. This is the calendar root of the whole framework. The Psalm sings it: *He appointed the moon for seasons: the sun knoweth his going down* (Psalm 104:19). And Leviticus builds its entire feast architecture on this foundation: *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2) -- *feasts* is the same mo''edim, beginning with *the seventh day... the sabbath of Yahuah (LORD)* (Leviticus 23:3), set in the very rhythm of the six days. The restored witnesses make the root explicit: *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years* (Jubilees 2:9); *the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order* (1 Enoch 2:1). The lights are Yahuah''s timepieces. The appointed times were written into the sky before they were written at Sinai.',
       sv.verse_id, ev.verse_id, 'extras', 20006
  FROM _s301_ge01_lookup sv, _s301_ge01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=1 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-1-the-seed-after-his-kind',
       E'The Seed After His Kind',
       E'Three times on the third and later days the creating word fixes a principle: *Let the earth bring forth grass, the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself, upon the earth* (Genesis 1:11), and so the living creatures too, each *after his kind* (Genesis 1:21, 24-25). The seed is in itself; the kind is preserved through the seed. This is not a botanical footnote -- it is the first statement of the seed principle that will run the whole canon. Two chapters later it becomes the spine of the covenant: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). *Thy seed and her seed* -- the seed-war between the serpent''s line and the woman''s, carried *after his kind* by bloodline-and-promise together, all the way to the heel that is bruised and the head that is crushed. The seed in itself of Genesis 1 is the first link in the chain of promise.',
       sv.verse_id, ev.verse_id, 'free', 20009
  FROM _s301_ge01_lookup sv, _s301_ge01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-1-let-us-make-adam-in-our-image',
       E'Let Us Make Adam in Our Image',
       E'*And Elohim (God) said, Let us make man in our image, after our likeness* (Genesis 1:26); *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them* (Genesis 1:27). The *us* is the Formed and the Formless -- the Father and the Son who is *the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15) -- the expressed Word in whom the formless Father is seen, not a council of three co-equal persons. The image after which man is patterned is the Son himself: *Messiah (Christ), who is the image of Elohim (God)* (2 Corinthians 4:4). That image was marred, and in Messiah it is remade: *put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:10) -- the creation-image restored. And a distinction the framework keeps: Genesis 1:27 speaks of mankind made *male and female* in the broad creation, while Genesis 2 narrows to one man -- *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7) -- Adam set apart to tend the garden, the seed-of-promise line. The two are weighed, not collapsed.',
       sv.verse_id, ev.verse_id, 'free', 20012
  FROM _s301_ge01_lookup sv, _s301_ge01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=1 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-1-dominion-and-the-son-of-adam',
       E'Dominion and the Son of Adam',
       E'With the image comes the charge: *let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth* (Genesis 1:26), and again *Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion* (Genesis 1:28). David sings this grant back with the lineage-weight intact: *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4) -- not a generic "son of man" but the son of Adam, the seed of the first man -- *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet* (Psalm 8:6). Psalm 8 is Genesis 1:28 made song: the same fish and fowl and beasts, the same dominion. The restored witness confirms the mandate and names its instrument: *And ordained man through your wisdom, that he should have dominion over the creatures which you have made* (Wisdom of Solomon 9:2) -- dominion given through the same Wisdom by which the world itself was made.',
       sv.verse_id, ev.verse_id, 'extras', 20015
  FROM _s301_ge01_lookup sv, _s301_ge01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=1 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 20000
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (1,1,'john',1,1,1,E'*In the beginning was the Word... and the Word was Elohim (God)* (John 1:1) -- the Formed Son named at the same beginning Genesis opens with.'),
    (1,1,'john',1,3,2,E'*All things were made by him* (John 1:3) -- the spoken creation of Genesis 1 is the work of the Word.'),
    (1,1,'colossians',1,16,3,E'*For by him were all things created... all things were created by him, and for him* (Colossians 1:16) -- Genesis 1:1 read through the Son.'),
    (1,1,'hebrews',1,2,4,E'*by his Son... by whom also he made the worlds* (Hebrews 1:2) -- the Father makes the worlds by the Formed One.'),
    (1,1,'psalms',33,6,5,E'*By the word of Yahuah (LORD) were the heavens made* (Psalm 33:6) -- the Tanakh names the Word and the breath at the foundation.'),
    (1,1,'2-esdras',6,38,6,E'*you spakest from the beginning... and your word was a perfect work* (2 Esdras 6:38) -- the restored echo of creation by the spoken Word.'),
    (1,1,'the-wisdom-of-solomon',9,1,7,E'*who have made all things with your word* (Wisdom 9:1) -- Solomon confesses the same creating Word.')
  ) AS m(thr,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s301_ge01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=m.src_v
  JOIN _s301_ge01_lookup tv ON tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-1-and-elohim-said-creation-by-the-word'
 WHERE m.thr=1
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 20003
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (2,2,'john',1,4,1,E'*In him was life; and the life was the light of men* (John 1:4) -- the Spirit hovers, and the Word''s life is the coming light.'),
    (2,3,'john',1,9,2,E'*That was the true Light, which lighteth every man* (John 1:9) -- the day-one light before the sun is the true Light.'),
    (2,3,'2-corinthians',4,6,3,E'*Elohim (God), who commanded the light to shine out of darkness... in the face of Yahusha HaMashiach* (2 Corinthians 4:6) -- Genesis 1:3 quoted and landed on the Messiah.'),
    (2,3,'isaiah',60,19,4,E'*Yahuah (LORD) shall be unto thee an everlasting light* (Isaiah 60:19) -- the sunless light of the end.'),
    (2,3,'revelation',21,23,5,E'*the glory of Elohim (God) did lighten it, and the Lamb is the light thereof* (Revelation 21:23) -- creation closes where it began, light without sun.')
  ) AS m(thr,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s301_ge01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=m.src_v
  JOIN _s301_ge01_lookup tv ON tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-1-the-spirit-moved-and-let-there-be-light'
 WHERE m.thr=2
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 20006
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (3,14,'psalms',104,19,1,E'*He appointed the moon for seasons* (Psalm 104:19) -- the luminaries as Yahuah''s timekeepers (mo''edim).'),
    (3,14,'leviticus',23,2,2,E'*the feasts of Yahuah (LORD)... even these are my feasts* (Leviticus 23:2) -- the same mo''edim, the feast architecture built on Genesis 1:14.'),
    (3,14,'leviticus',23,3,3,E'*the seventh day is the sabbath of rest* (Leviticus 23:3) -- the first appointed time, set in the rhythm of the six days.'),
    (3,14,'jubilees',2,9,4,E'*a great sign on the earth... for feasts and for years* (Jubilees 2:9) -- the restored witness unfolds the appointed-times root explicitly.'),
    (3,14,'1-enoch',2,1,5,E'*the luminaries... rise and set in order each in its season... their appointed order* (1 Enoch 2:1) -- the unwavering lights marking the mo''edim.')
  ) AS m(thr,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s301_ge01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=m.src_v
  JOIN _s301_ge01_lookup tv ON tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-1-lights-for-signs-and-for-seasons-the-appointed-times-root'
 WHERE m.thr=3
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 20009
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (4,11,'genesis',3,15,1,E'*between thy seed and her seed; it shall bruise thy head* (Genesis 3:15) -- the seed *after his kind* of Genesis 1:11 becomes the seed-war of the covenant.')
  ) AS m(thr,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s301_ge01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=m.src_v
  JOIN _s301_ge01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-1-the-seed-after-his-kind'
 WHERE m.thr=4
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 20012
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (5,26,'colossians',1,15,1,E'*the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15) -- the Son is the image after which man is patterned.'),
    (5,26,'2-corinthians',4,4,2,E'*Messiah (Christ), who is the image of Elohim (God)* (2 Corinthians 4:4) -- the true image, the pattern of Adam.'),
    (5,27,'colossians',3,10,3,E'*the new man, which is renewed... after the image of him that created him* (Colossians 3:10) -- the creation-image restored in Messiah.'),
    (5,27,'genesis',2,7,4,E'*Yahuah Elohim (the LORD God) formed man of the dust* (Genesis 2:7) -- Adam formed separately to tend the garden; the distinction weighed, not collapsed.')
  ) AS m(thr,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s301_ge01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=m.src_v
  JOIN _s301_ge01_lookup tv ON tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-1-let-us-make-adam-in-our-image'
 WHERE m.thr=5
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 20015
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (6,26,'psalms',8,4,1,E'*and the son of Adam, that thou visitest him?* (Psalm 8:4) -- the dominion grant sung with the seed-of-Adam weight intact.'),
    (6,28,'psalms',8,6,2,E'*thou hast put all things under his feet* (Psalm 8:6) -- Genesis 1:28''s dominion made song.'),
    (6,28,'the-wisdom-of-solomon',9,2,3,E'*ordained man... that he should have dominion over the creatures* (Wisdom 9:2) -- the mandate confirmed, given through Wisdom.')
  ) AS m(thr,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s301_ge01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=1 AND sv.verse_number=m.src_v
  JOIN _s301_ge01_lookup tv ON tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-1-dominion-and-the-son-of-adam'
 WHERE m.thr=6
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_2.sql (Genesis 2) -----
-- Chapter: Genesis 2  |  Tag: ge02  |  Temp view: _s301_ge02_lookup
-- Sort band: base 20025, step 3 -> 20025, 20028, 20031, 20034, 20037, 20040 (6 threads)
-- Source of every row: 'canon','genesis',2,v
--
-- ============================================================================
-- GENESIS 2 — PER-CHAPTER COVERAGE CHECKLIST (NT / Extras / Tanakh weighed per block)
-- ============================================================================
-- v.1     (heavens and earth finished, host of them)
--         NT:     none warranted (folded into the Sabbath thread's "works finished" frame, Heb 4:3)
--         Extras: none warranted
--         Tanakh: none warranted (carried by Gen 1 apparatus; v.1 is a hinge)
-- v.2-3   (Elohim rested the seventh day; blessed and sanctified it) — HEADLINE BLOCK
--         NT:     Hebrews 4:4 (God did rest the seventh day), Hebrews 4:9 (there remaineth
--                 a rest), Mark 2:27 (the sabbath was made for man) — ALL TAKEN
--         Extras: Jubilees 2:19, 2:25 (the Sabbath ordained, sanctified to the seed) — TAKEN
--         Tanakh: Exodus 20:11 (Sinai grounds the command on creation), Exodus 31:16-17
--                 (perpetual covenant / sign for ever), Isaiah 66:23 (all flesh, new heavens
--                 and earth) — ALL TAKEN
-- v.4     (these are the generations... Yahuah Elohim made earth and heavens)
--         NT/Extras/Tanakh: none warranted (toledot hinge into the Adam account)
-- v.5-6   (no man to till; a mist watered the ground)
--         none warranted (narrative setup; the river thread carries the water motif at v.10)
-- v.7     (Yahuah Elohim formed man of the dust; breath of life; living soul) — SEED BLOCK
--         NT:     1 Corinthians 15:45 (first Adam living soul / last Adam quickening spirit),
--                 15:47 (the first earthy, the second Yahuah from heaven) — TAKEN
--         Extras: none warranted (Jub 3 places Adam in garden, not the dust-forming; held for v.15/24)
--         Tanakh: none warranted (Job/Psalm dust-return belongs to Gen 3)
-- v.8     (planted a garden eastward in Eden; put the man there)
--         folded into tree-of-life (v.9) and into Jubilees-into-garden note (v.15)
-- v.9     (every tree pleasant... the tree of life... the tree of knowledge) — TREE BLOCK
--         NT:     Revelation 2:7 (tree of life in the paradise of Elohim), Revelation 22:2
--                 (the tree of life, leaves for healing) — TAKEN
--         Extras: NONE — brief forbids 1 Enoch ch25 here (bad parse / watcher material)
--         Tanakh: Proverbs 3:18 (wisdom a tree of life) — TAKEN
-- v.10-14 (a river went out of Eden, parted into four heads) — RIVER BLOCK
--         NT:     Revelation 22:1 (pure river of water of life from the throne) — TAKEN
--         Extras: none warranted (clean witness preferred; canon carries it)
--         Tanakh: Ezekiel 47:12 (river of the sanctuary, trees for medicine), Zechariah 14:8
--                 (living waters out of Jerusalem) — TAKEN
-- v.15    (took the man, put him in the garden to dress and keep it)
--         Extras: Jubilees 3:9 noted in summary (brought into Eden on the 40th day); not a
--                 standalone member — folds under the one-flesh / garden frame
-- v.16-17 (commanded the man... in the day thou eatest thereof thou shalt surely die) — COMMAND BLOCK
--         NT:     Romans 5:12 (by one man sin entered, and death by sin) — TAKEN
--         Extras: none warranted
--         Tanakh: none warranted (the death-sentence is fulfilled-forward in Gen 3; Rom 5 binds it)
-- v.18-20 (not good to be alone; named the beasts; no help meet found)
--         folded into the one-flesh thread (the search that ends in the woman built from the side)
-- v.21-24 (deep sleep; the rib; bone of my bones; one flesh) — COVENANT BLOCK
--         NT:     Matthew 19:4-6 (Messiah quotes it; no more twain), Mark 10:6-8 (one flesh),
--                 Ephesians 5:31-32 (the mystery of Messiah and the assembly) — ALL TAKEN
--         Extras: Jubilees 3:6 (one-flesh ordinance restated; brought to him) — TAKEN
--         Tanakh: none warranted (Mal 2 covenant-of-thy-youth already keyed to 1 Cor 7 elsewhere)
-- v.25    (both naked and not ashamed)
--         none warranted (the hinge into Gen 3's shame; carried there)
--
-- ============================================================================
-- THREADS (slug | anchor | target libraries | tier)
-- ============================================================================
-- 20025 genesis-2-the-seventh-day-blessed-and-hallowed-the-sabbath-of-creation (2:2-3)
--        Tanakh(Exod 20:11; Exod 31:16-17; Isa 66:23) + NT(Heb 4:4,9; Mark 2:27) + Extras(Jub 2:19,2:25) -> EXTRAS
-- 20028 genesis-2-formed-of-the-dust-a-living-soul-the-first-adam-and-the-last (2:7)
--        NT(1 Cor 15:45; 15:47) -> FREE
-- 20031 genesis-2-the-tree-of-life-in-the-midst-of-the-garden (2:9)
--        NT(Rev 2:7; Rev 22:2) + Tanakh(Prov 3:18) -> FREE
-- 20034 genesis-2-a-river-went-out-of-eden-the-waters-of-life (2:10)
--        Tanakh(Ezek 47:12; Zech 14:8) + NT(Rev 22:1) -> FREE
-- 20037 genesis-2-the-commandment-given-in-the-day-thou-eatest-thou-shalt-die (2:16-17)
--        NT(Rom 5:12) -> FREE
-- 20040 genesis-2-bone-of-my-bones-they-shall-be-one-flesh (2:21-24)
--        NT(Matt 19:4-6; Mark 10:6-8; Eph 5:31-32) + Extras(Jub 3:6) -> EXTRAS
--
-- LOAD-BEARING / CONTESTED FRAMING NOTES:
-- * SABBATH (headline): framed as creation-rooted and hallowed by Yahuah BEFORE Sinai — the
--   foundation Exodus 20:11 grounds the command ON, the perpetual sign (Exod 31:17), the rest
--   that REMAINS (Heb 4:9), made for Adam/man (Mark 2:27), kept by all flesh in the new heavens
--   and earth (Isa 66:23). Jubilees 2:19/2:25 witness the seventh-day ordinance. The thread
--   does NOT prescribe practice — the verses dismantle the abolished-Sabbath lie themselves.
--   The training default (Sabbath superseded / "just for the Jews") is the reading overridden.
-- * v.7 ADAM: the SEPARATE forming of the seed-of-promise Adam (distinct from the mankind of
--   Gen 1); woven forward to the last Adam (1 Cor 15:45) — type, not romance/biology trivia.
-- * v.24 ONE FLESH: kept as the marriage-COVENANT joining / seed-absorption mechanism (the
--   wife absorbed into the husband's seed-identity), NOT a generic romance proof-text; Messiah
--   ratifies it (Matt 19) and Paul reads it as Messiah-and-assembly (Eph 5:32).
-- * Tree-of-life thread deliberately carries NO extras member (1 Enoch ch25 forbidden by brief).
-- ============================================================================

CREATE TEMP VIEW _s301_ge02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (
    WITH input(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note) AS (VALUES

    -- ---- Thread 1: Sabbath of creation (2:2-3) ----
    ('canon','genesis',2,2,'canon','exodus',20,11,'free',
     E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). Sinai does not invent the Sabbath — it grounds the fourth word ON this chapter, where *he rested on the seventh day from all his work* (Genesis 2:2). The command points back to creation; the rest was hallowed by Yahuah before there was a Yashar''el (Israel) to keep it.'),
    ('canon','genesis',2,3,'canon','exodus',31,16,'free',
     E'*Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant* (Exodus 31:16). What Genesis 2:3 hallowed — *Elohim (God) blessed the seventh day, and sanctified it* — is bound to the covenant people as a *perpetual* (not provisional, not abolished) sign.'),
    ('canon','genesis',2,3,'canon','exodus',31,17,'free',
     E'*It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed* (Exodus 31:17). The seventh-day rest of Genesis 2 is named the everlasting SIGN, and it carries Genesis'' own ground — *for in six days* — the Creator''s own pattern made the people''s mark.'),
    ('canon','genesis',2,2,'canon','hebrews',4,4,'free',
     E'*For he spake in a certain place of the seventh day on this wise, And Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4). The letter quotes Genesis 2:2 verbatim — *he rested on the seventh day from all his work* — to argue the rest still stands; the seventh day is the certain place the whole argument leans on.'),
    ('canon','genesis',2,3,'canon','hebrews',4,9,'free',
     E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The Sabbath Genesis 2:3 *sanctified* is not spent or retired — it REMAINS; the verb is present, the rest is still open and still belongs to the people of Elohim.'),
    ('canon','genesis',2,2,'canon','mark',2,27,'free',
     E'*And he said unto them, The sabbath was made for man, and not man for the sabbath* (Mark 2:27). Yahusha (Jesus) traces the Sabbath to its making — to this chapter, where it was *made* in the rest of the seventh day — and gives it to man as gift, not yoke; it was made for Adam before it was ever a rule.'),
    ('canon','genesis',2,3,'canon','isaiah',66,23,'free',
     E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The day Genesis 2:3 *blessed* reaches past the cross to the new heavens and the new earth, where *all flesh* keeps it — the Sabbath is not behind us but ahead of us.'),
    ('canon','genesis',2,2,'jubilees','jubilees',2,19,'extras',
     E'*And He said to us: "Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people... as I have sanctified the Sabbath day and do sanctify (it) to Myself, even so shall I bless them"* (Jubilees 2:19). The restored witness ties the people''s sanctification to the Sabbath''s own sanctification — the very *sanctified it* of Genesis 2:3 — the day and the people hallowed by one act.'),
    ('canon','genesis',2,3,'jubilees','jubilees',2,25,'extras',
     E'*He created heaven and earth and everything that He created in six days, and Elohim (God) made the seventh day holy, for all His works* (Jubilees 2:25). Jubilees restates Genesis 2 plainly — *Elohim (God) made the seventh day holy* — placing the seventh-day hallowing at the foundation of creation, exactly where this chapter sets it.'),

    -- ---- Thread 2: formed of the dust, a living soul (2:7) ----
    ('canon','genesis',2,7,'canon','1-corinthians',15,45,'free',
     E'*And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). Genesis 2:7 — *man became a living soul* — is quoted as the FIRST term of a pair; the dust-formed Adam is the type whose answer is the last Adam, the quickening spirit.'),
    ('canon','genesis',2,7,'canon','1-corinthians',15,47,'free',
     E'*The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven* (1 Corinthians 15:47). The man *formed... of the dust of the ground* (Genesis 2:7) is the earthy first; the Formed Son who came from heaven is the second — the dust-origin of Adam frames the heaven-origin of the One who undoes Adam''s death.'),

    -- ---- Thread 3: the tree of life in the midst of the garden (2:9) ----
    ('canon','genesis',2,9,'canon','revelation',2,7,'free',
     E'*To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The very tree of Genesis 2:9 — *the tree of life also in the midst of the garden* — is held out again at the end of the canon; what Adam was barred from, the overcomer is given to eat.'),
    ('canon','genesis',2,9,'canon','revelation',22,2,'free',
     E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). Eden''s *tree of life* (Genesis 2:9) is not lost but restored — replanted by the river in the city, its leaves now healing the nations.'),
    ('canon','genesis',2,9,'canon','proverbs',3,18,'free',
     E'*She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). Wisdom is named with Eden''s own image — *the tree of life* of Genesis 2:9 — the tree that gives life to the one who lays hold; the garden''s gift is offered to the one who keeps Wisdom''s way.'),

    -- ---- Thread 4: a river went out of Eden (2:10-14) ----
    ('canon','genesis',2,10,'canon','ezekiel',47,12,'free',
     E'*And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the leaf thereof for medicine* (Ezekiel 47:12). The river that *went out of Eden to water the garden* (Genesis 2:10) flows again from the sanctuary, lining its banks with the trees of life — Eden''s pattern reopened in the temple vision.'),
    ('canon','genesis',2,10,'canon','revelation',22,1,'free',
     E'*And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). Genesis 2:10''s river *out of Eden* finds its source revealed — the throne itself; the water that watered the first garden is the water of life flowing through the last city.'),
    ('canon','genesis',2,10,'canon','zechariah',14,8,'free',
     E'*And it shall be in that day, that living waters shall go out from Jerusalem; half of them toward the former sea, and half of them toward the hinder sea: in summer and in winter shall it be* (Zechariah 14:8). The single Eden-river that *was parted, and became into four heads* (Genesis 2:10) answers in the living waters going out from Jerusalem to the whole earth — Eden''s geography restored on the day of Yahuah.'),

    -- ---- Thread 5: the commandment given (2:16-17) ----
    ('canon','genesis',2,17,'canon','romans',5,12,'free',
     E'*Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The sentence of Genesis 2:17 — *in the day that thou eatest thereof thou shalt surely die* — is the door death came through; one man, one command, and death passing to all. Torah''s first word names the wage that Messiah will pay.'),

    -- ---- Thread 6: bone of my bones, one flesh (2:21-24) ----
    ('canon','genesis',2,24,'canon','matthew',19,5,'free',
     E'*And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* (Matthew 19:5). Yahusha (Jesus) settles the marriage covenant by quoting Genesis 2:24 word for word — *they shall be one flesh* — anchoring the joining not in custom but in the creation order itself.'),
    ('canon','genesis',2,24,'canon','matthew',19,6,'free',
     E'*Wherefore they are no more twain, but one flesh. What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:6). The *one flesh* of Genesis 2:24 is read by Messiah as a binding act of Elohim — two become one and are *no more twain*; the covenant joining is His work, not man''s to break.'),
    ('canon','genesis',2,24,'canon','mark',10,8,'free',
     E'*And they twain shall be one flesh: so then they are no more twain, but one flesh* (Mark 10:8). The same word of Genesis 2:24 — *they shall be one flesh* — is grounded *from the beginning of the creation* (Mark 10:6); the two-become-one is the original design, the wife absorbed into one shared flesh-identity.'),
    ('canon','genesis',2,24,'canon','ephesians',5,31,'free',
     E'*For this cause shall a man leave his father and his mother, and shall be joined unto his wife, and they two shall be one flesh* (Ephesians 5:31). Genesis 2:24 is taken up whole, and then unveiled: *This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:32) — the one-flesh joining is the figure of the assembly absorbed into Messiah.'),
    ('canon','genesis',2,22,'jubilees','jubilees',3,6,'extras',
     E'*"This is now bone of my bones and flesh of my flesh; she will be called my wife; because she was taken from her husband." Therefore shall man and wife be one, and therefore shall a man leave his father and his mother, and cleave to his wife, and they shall be one flesh* (Jubilees 3:6). The restored witness retells Genesis 2:22-24 — the woman *brought... unto the man* and named bone of his bone — sealing the one-flesh ordinance from the first marriage.')

    ) SELECT * FROM input
  ) i
  JOIN _s301_ge02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. threads
-- ============================================================================

-- Thread 1: 20025 — Sabbath of creation (EXTRAS: Jubilees members)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-the-seventh-day-blessed-and-hallowed-the-sabbath-of-creation',
       E'The Seventh Day, Blessed and Hallowed — the Sabbath Rooted in Creation',
       E'Before there was a Sinai, before there was a Yashar''el (Israel) to command, the seventh day was already set apart. *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made. And Elohim (God) blessed the seventh day, and sanctified it* (Genesis 2:2-3). The Sabbath is not an ordinance bolted onto the Law later; it is woven into the architecture of creation itself — Yahuah rested, blessed, sanctified.\n\nWhen the fourth word is spoken at the mountain, it does not invent the day — it points back here: *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The command rests on the creation; the creation hallowed the day. And it is named a covenant without end — *a perpetual covenant* (Exodus 31:16), *a sign between me and the children of Yashar''el (Israel) for ever* (Exodus 31:17). The restored witness says the same: *Elohim (God) made the seventh day holy, for all His works* (Jubilees 2:25), and binds the day''s sanctifying to the people''s — *as I have sanctified the Sabbath day... even so shall I bless them* (Jubilees 2:19).\n\nThe pulpit has taught that this day was nailed to a cross and abolished. Hear the canon read itself. Yahusha (Jesus) does not retire it — he traces it to its making: *The sabbath was made for man, and not man for the sabbath* (Mark 2:27). It was made for Adam, for man, in this very chapter. And the letter to the Hebrews quotes Genesis 2 to prove the rest still stands: *And Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4); *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — present tense, still open, still ours. It reaches all the way to the end, when *from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The Father hallowed the seventh day; only man moved it. The day He blessed remains blessed.',
       sv.verse_id, ev.verse_id, 'extras', 20025
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: 20028 — formed of the dust, a living soul (FREE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-formed-of-the-dust-a-living-soul-the-first-adam-and-the-last',
       E'Formed of the Dust, a Living Soul — the First Adam and the Last',
       E'Genesis 1 spoke mankind into being; Genesis 2 stoops down and FORMS one man by hand. *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). This is the separate forming of the seed-of-promise Adam — the line the whole canon will follow — shaped from the dust and made alive by the breath of the Father.\n\nPaul reaches back to this exact verse and makes Adam the first term of a pair: *And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). The dust-formed man is a type; the last Adam answers him — where the first received life, the last GIVES it. *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven* (1 Corinthians 15:47). The man drawn from the ground is the earthy beginning; the Formed Son drawn from the Formless came from heaven to undo the death the first Adam brought. Read this verse and you are already standing at the foot of the resurrection — the living soul of Genesis 2:7 waiting for the quickening spirit who is its answer.',
       sv.verse_id, ev.verse_id, 'free', 20028
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: 20031 — the tree of life (FREE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-the-tree-of-life-in-the-midst-of-the-garden',
       E'The Tree of Life in the Midst of the Garden',
       E'In the heart of Eden stands a tree the whole canon will circle back to. *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden* (Genesis 2:9). It is set in the midst — central, offered, life-giving.\n\nWisdom wears its image: *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18) — the one who keeps the way of Wisdom lays hold of Eden''s own gift. And the end of the canon does not leave the tree behind in a lost garden; it gives it back. *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7) — the same tree, *in the midst*, held out to the overcomer. And it is replanted by the river in the city: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* (Revelation 22:2). What Adam was shut out from, the redeemed are welcomed to — the tree of Genesis 2:9 is not lost but restored, and its leaves now heal.',
       sv.verse_id, ev.verse_id, 'free', 20031
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: 20034 — a river went out of Eden (FREE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-a-river-went-out-of-eden-the-waters-of-life',
       E'A River Went Out of Eden — the Waters of Life',
       E'*And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads* (Genesis 2:10). One river, watering the garden, branching out to the whole earth — Pison, Gihon, Hiddekel, Euphrates. The geography of Eden is a pattern the prophets and the apocalypse return to.\n\nEzekiel sees the river flowing again, this time from the sanctuary: *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade... and the leaf thereof for medicine* (Ezekiel 47:12). Zechariah sees it on the day of Yahuah: *And it shall be in that day, that living waters shall go out from Jerusalem; half of them toward the former sea, and half of them toward the hinder sea* (Zechariah 14:8) — the single Eden-source splitting to the whole earth once more. And John sees the source itself laid bare: *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). The water that watered the first garden is the water of life flowing from the throne through the last city. Eden was never a closed chapter — it is the seed of the world to come.',
       sv.verse_id, ev.verse_id, 'free', 20034
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: 20037 — the commandment given (FREE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-the-commandment-given-in-the-day-thou-eatest-thou-shalt-die',
       E'The Commandment Given — In the Day Thou Eatest Thou Shalt Surely Die',
       E'Torah does not begin at Sinai; it begins in the garden, with a word and a warning. *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat: But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:16-17). The first commandment is open-handed — *freely eat* — with one boundary, and the boundary carries a wage: death.\n\nPaul names that wage and traces it through the whole race: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The door death came through is this command and its breaking — one man, one tree, and the sentence passing to all. The first word of Torah already names the price the last Adam will pay; *thou shalt surely die* is the debt the cross will answer.',
       sv.verse_id, ev.verse_id, 'free', 20037
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- Thread 6: 20040 — bone of my bones, one flesh (EXTRAS: Jubilees member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-bone-of-my-bones-they-shall-be-one-flesh',
       E'Bone of My Bones — They Shall Be One Flesh',
       E'The first marriage is not a romance — it is a covenant joining, and the canon will read it that way to the very end. *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam... and he took one of his ribs... And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* (Genesis 2:21-22). The woman is built from the man''s own side and brought back to him: *This is now bone of my bones, and flesh of my flesh* (Genesis 2:23). Then the rule of the covenant is stated: *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). Two become one — the wife absorbed into one shared flesh-identity with her husband.\n\nThe restored witness retells it plainly: she is *brought... unto the man*, named bone of his bone, and *therefore shall man and wife be one... and they shall be one flesh* (Jubilees 3:6). And Yahusha (Jesus) settles every marriage question by quoting this verse: *For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* (Matthew 19:5); *Wherefore they are no more twain, but one flesh. What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:6). It is grounded *from the beginning of the creation* (Mark 10:6), *they twain shall be one flesh: so then they are no more twain* (Mark 10:8). And Paul lifts the veil on what the one-flesh always pointed to: *For this cause shall a man leave his father and his mother, and shall be joined unto his wife, and they two shall be one flesh. This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:31-32). The two-become-one of Eden is the figure of the assembly absorbed into Messiah — the covenant joining written into the first marriage.',
       sv.verse_id, ev.verse_id, 'extras', 20040
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. thread_members
-- ============================================================================

-- Thread 1 members: Sabbath of creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (2, 0, 'canon','exodus',20,11, 1, E'Exodus 20:11 — the fourth word grounds itself on this chapter: *for in six days Yahuah (LORD) made heaven and earth... and rested the seventh day*.'),
    (3, 0, 'canon','exodus',31,16, 2, E'Exodus 31:16 — *a perpetual covenant*; what Genesis 2:3 sanctified is bound to the people without end.'),
    (3, 0, 'canon','exodus',31,17, 3, E'Exodus 31:17 — the everlasting *sign*, carrying Genesis'' own ground: *for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested*.'),
    (2, 0, 'canon','hebrews',4,4, 4, E'Hebrews 4:4 — quotes Genesis 2:2 verbatim to argue the rest still stands.'),
    (3, 0, 'canon','hebrews',4,9, 5, E'Hebrews 4:9 — *There remaineth therefore a rest*; present tense, still open.'),
    (2, 0, 'canon','mark',2,27, 6, E'Mark 2:27 — *The sabbath was made for man*; Yahusha (Jesus) traces it to its making in this chapter.'),
    (3, 0, 'canon','isaiah',66,23, 7, E'Isaiah 66:23 — *all flesh* keep it in the new heavens and earth; the day reaches ahead, not behind.'),
    (2, 0, 'jubilees','jubilees',2,19, 8, E'Jubilees 2:19 — the people''s sanctifying tied to the Sabbath''s own (restored witness).'),
    (3, 0, 'jubilees','jubilees',2,25, 9, E'Jubilees 2:25 — *Elohim (God) made the seventh day holy*; the hallowing set at creation''s foundation.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-the-seventh-day-blessed-and-hallowed-the-sabbath-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members: formed of the dust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (7, 0, 'canon','1-corinthians',15,45, 1, E'1 Corinthians 15:45 — *the first man Adam was made a living soul; the last Adam was made a quickening spirit*; Genesis 2:7 quoted as the first term.'),
    (7, 0, 'canon','1-corinthians',15,47, 2, E'1 Corinthians 15:47 — the earthy first man and the second from heaven; the dust-Adam framing the Formed Son.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-formed-of-the-dust-a-living-soul-the-first-adam-and-the-last'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members: tree of life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (9, 0, 'canon','proverbs',3,18, 1, E'Proverbs 3:18 — Wisdom is *a tree of life*; Eden''s image given to the one who lays hold.'),
    (9, 0, 'canon','revelation',2,7, 2, E'Revelation 2:7 — the same tree *in the midst of the paradise of Elohim*, held out to the overcomer.'),
    (9, 0, 'canon','revelation',22,2, 3, E'Revelation 22:2 — the tree restored by the river, its leaves *for the healing of the nations*.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-the-tree-of-life-in-the-midst-of-the-garden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members: river of Eden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (10, 0, 'canon','ezekiel',47,12, 1, E'Ezekiel 47:12 — the river from the sanctuary, trees on its banks *for medicine*; Eden''s pattern reopened.'),
    (10, 0, 'canon','zechariah',14,8, 2, E'Zechariah 14:8 — *living waters shall go out from Jerusalem*; the one Eden-source splitting to the whole earth.'),
    (10, 0, 'canon','revelation',22,1, 3, E'Revelation 22:1 — the river of life *proceeding out of the throne*; Eden''s source revealed.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-a-river-went-out-of-eden-the-waters-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members: the commandment given
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (17, 0, 'canon','romans',5,12, 1, E'Romans 5:12 — *by one man sin entered into the world, and death by sin*; the door death came through is Genesis 2:17''s broken command.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-the-commandment-given-in-the-day-thou-eatest-thou-shalt-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6 members: bone of my bones, one flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (22, 0, 'jubilees','jubilees',3,6, 1, E'Jubilees 3:6 — the restored witness retells Genesis 2:22-24: brought to the man, bone of his bone, *they shall be one flesh*.'),
    (24, 0, 'canon','matthew',19,5, 2, E'Matthew 19:5 — Yahusha (Jesus) quotes Genesis 2:24 word for word: *they twain shall be one flesh*.'),
    (24, 0, 'canon','matthew',19,6, 3, E'Matthew 19:6 — *no more twain*; the joining is the work of Elohim, not man''s to break.'),
    (24, 0, 'canon','mark',10,8, 4, E'Mark 10:8 — the one-flesh grounded *from the beginning of the creation*.'),
    (24, 0, 'canon','ephesians',5,31, 5, E'Ephesians 5:31 — Genesis 2:24 taken up whole, then unveiled as *Messiah (Christ) and the church* (v.32).')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-bone-of-my-bones-they-shall-be-one-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_3.sql (Genesis 3) -----
-- Chapter: Genesis 3 (The Fall, the protoevangelium, the expulsion)
-- Tag: ge03   Temp view: _s301_ge03_lookup
-- Sort band: base 20050, step 3 -> threads at 20050, 20053, 20056, 20059, 20062 (5 threads)
-- Source of EVERY row: 'canon','genesis',3,v
--
-- Genesis 3 coverage:
--   v.1  ("Yea, hath Elohim said?" — the serpent's foundational lie)
--        NT:     2 Corinthians 11:3 (the serpent beguiled Eve through his subtilty); John 8:44 (a liar, and the father of it)
--        Extras: none warranted as MEMBER (Wisdom 2:24 carries a trailing apparatus glyph; not quoted)
--        Tanakh: none warranted (the lie is named forward in the NT)
--   v.2-5 (the dialogue; "ye shall be as gods, knowing good and evil")
--        NT:     2 Corinthians 11:3 (already woven at v.1 — the corrupting of the mind)
--        Extras: none warranted
--        Tanakh: none warranted
--   v.6  (she took, did eat, gave to her husband)
--        NT:     1 Timothy 2:14 considered; the seed-war / fall framing carried at v.15 instead
--        Extras: none warranted
--        Tanakh: none warranted
--   v.7-13 (eyes opened, hid, the LORD God walking, the blame, "the serpent beguiled me")
--        NT:     2 Corinthians 11:3 (beguiled Eve through his subtilty) — woven at v.1 thread, anchored to v.13
--        Extras: none warranted
--        Tanakh: none warranted (theophany — the Formed walking — noted in summary, no add)
--   v.14 (the serpent cursed)
--        NT:     Revelation 12:9 (that old serpent, called the Devil) — woven into the seed thread
--        Extras: none warranted distinct from the protoevangelium thread
--        Tanakh: none warranted
--   ★ v.15 (THE PROTOEVANGELIUM — the seed of the woman bruises the serpent's head)
--        NT:     Romans 16:20; 1 John 3:8; Galatians 4:4; Revelation 12:9; Revelation 12:17; Luke 10:18; Luke 10:19
--        Extras: Wisdom of Solomon 2:24 (through envy of the devil came death) — NOT quoted as member (trailing apparatus glyph); recorded only
--        Tanakh: none added (the seed-war runs forward into the NT)
--   v.16 (sorrow multiplied; bring forth children)
--        NT:     none warranted as its own thread (Jubilees retelling not distinctive)
--        Extras: none warranted
--        Tanakh: none warranted
--   v.17-19 (cursed is the ground; thorns and thistles; dust to dust)
--        NT:     Romans 8:20; Romans 8:21; Romans 8:22 (creation subjected, groaneth); 1 Corinthians 15:21,22,45 (last Adam undoes dust)
--        Extras: none warranted as MEMBER (Jubilees 3:25 is a near-verbatim retelling, not a distinct witness)
--        Tanakh: none warranted
--   v.20 (Adam named his wife Eve, mother of all living)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (a naming note; no forward weave demanded)
--   v.21 (coats of skins — the first covering)
--        NT:     none direct; the covering-of-righteousness type carried by Isaiah 61:10
--        Extras: Jubilees 3:26 (He made for them coats of skin, and clothed them)
--        Tanakh: Isaiah 61:10 (the robe of righteousness, garments of salvation)
--   v.22-24 (driven out; cherubim and flaming sword guard the tree of life)
--        NT:     Revelation 2:7 (to him that overcometh... the tree of life); Revelation 22:2 (leaves for the healing of the nations); Revelation 22:14 (right to the tree of life)
--        Extras: Jubilees 3:26 (sent them forth from the Garden of Eden); Jubilees 3:32 (the new moon of the fourth month — the expulsion date); Jubilees 3:28 (the mouth of all beasts closed)
--        Tanakh: none warranted
--
-- Threads (slug -> target libraries):
--   genesis-3-yea-hath-elohim-said-the-serpents-foundational-lie        [NT]            tier free
--   genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head      [NT]            tier free   ★ CENTERPIECE
--   genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam [NT]            tier free
--   genesis-3-coats-of-skins-the-first-covering-and-the-robe-of-righteousness [NT+Extras+Tanakh] tier extras
--   genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened [NT+Extras]    tier extras
--
-- Framework-load-bearing notes:
--   v.15 PROTOEVANGELIUM: read NOT as a generic good-vs-evil moral but as the institution of the
--     literal seed-war — enmity between the serpent's seed and the woman's seed — that runs the whole
--     canon. The woman's seed is the Formed Son (Galatians 4:4, made of a woman) who crushes the head;
--     the bruised heel is the cross. Romans 16:20 hands the victory to the body (under YOUR feet);
--     Revelation 12:17 names the ongoing war on the remnant of her seed which keep the commandments —
--     the 1 John 2:3-4 filter holds. The wheat/tares fullness (Matthew 13) is NOT pulled here; this is
--     the enmity instituted, not the harvest. Centerpiece thread, richest weave.
--   v.1 "Yea, hath Elohim said?": framed as the FOUNDATIONAL lie — the same "did God really say?"
--     doubt the framework names as the antichrist voice; tied to 2 Corinthians 11:3 and John 8:44.
--   v.8 theophany: the voice of Yahuah Elohim walking in the garden is the Formed Son — noted in
--     summary prose, no separate add.
--   Wisdom of Solomon 2:24 (through envy of the devil came death into the world) was the natural
--     extras member for the seed/death thread, but the parse returns a trailing apparatus glyph (' ⸻')
--     after the sentence; per the brief I do not quote a verse carrying apparatus noise, so it is
--     recorded in coverage only and NOT added as a member.

CREATE TEMP VIEW _s301_ge03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== cross_references ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: "Yea, hath Elohim said?" — the foundational lie
    ('canon','genesis',3,1,'canon','2-corinthians',11,3,'free',
      E'*But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). The serpent''s opening words — *Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1) — are not a question for information but the first assault on the word: the *did Elohim really say?* doubt that hollows the commandment out. Sha''ul names the same *subtilty* still beguiling minds away from the simplicity of the truth; the foundational lie has never changed its method.'),
    ('canon','genesis',3,1,'canon','john',8,44,'free',
      E'*Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The serpent''s *Yea, hath Elohim (God) said* (Genesis 3:1) and his flat contradiction *Ye shall not surely die* (3:4) are the first lie ever spoken; Yahusha (Jesus) traces every lie back to this same father, *a liar, and the father of it* — the diagnostic for the voice that questions the word.'),

    -- THREAD 2 (CENTERPIECE): the seed of the woman bruises the serpent's head
    ('canon','genesis',3,15,'canon','romans',16,20,'free',
      E'*And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). The sentence on the serpent — *it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — is handed forward to the body: the same crushing-of-the-head verb, now *under YOUR feet*, the people sharing the woman''s-seed victory. The enmity instituted in the garden is being finished in those who are in the Seed.'),
    ('canon','genesis',3,15,'canon','1-john',3,8,'free',
      E'*He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). *I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15) is the war declared; *that he might destroy the works of the devil* is the war''s purpose stated plainly. The bruised head is the works of the devil undone at the root.'),
    ('canon','genesis',3,15,'canon','galatians',4,4,'free',
      E'*But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). *Her seed* (Genesis 3:15) is read here exactly — *made of a woman* — the Formed Son drawn into flesh to be the woman''s Seed that crushes the head. The seed-war is not metaphor: it required a Son sent in the fulness of time, born of the woman, keeping the very Torah the serpent told her to doubt.'),
    ('canon','genesis',3,15,'canon','revelation',12,9,'free',
      E'*And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him* (Revelation 12:9). The garden serpent is named at the end of the canon — *that old serpent* — confirming the foe of Genesis 3:15 is one continuous enemy from the first deception to the last. *And I will put enmity between thee and the woman* opens the war that this casting-out begins to close.'),
    ('canon','genesis',3,15,'canon','revelation',12,17,'free',
      E'*And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ)* (Revelation 12:17). Genesis 3:15''s *enmity... between thy seed and her seed* still runs: the dragon wars on *the remnant of her seed*, marked by the very thing the serpent first attacked — they *keep the commandments of Elohim*. The seed-war and the commandment are inseparable to the end.'),
    ('canon','genesis',3,15,'canon','luke',10,18,'free',
      E'*And he said unto them, I beheld Satan as lightning fall from heaven* (Luke 10:18). The Seed who would *bruise thy head* (Genesis 3:15) reports the fall as already in motion; the head-crushing is not deferred to a far horizon but breaking in wherever his authority advances.'),
    ('canon','genesis',3,15,'canon','luke',10,19,'free',
      E'*Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you* (Luke 10:19). The promise that the woman''s seed *shall bruise thy head* (Genesis 3:15) is extended to his sent ones — *power to tread on serpents* — the heel set on the serpent''s head in those who walk in the Seed''s authority.'),

    -- THREAD 3: cursed is the ground — creation subjected, the last Adam
    ('canon','genesis',3,17,'canon','romans',8,20,'free',
      E'*For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20). When Yahuah Elohim (the LORD God) said *cursed is the ground for thy sake* (Genesis 3:17), the whole creation was bent under Adam''s fall — *made subject to vanity*, yet the very wording carries *in hope*, the curse never the last word.'),
    ('canon','genesis',3,18,'canon','romans',8,21,'free',
      E'*Because the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God)* (Romans 8:21). The *thorns also and thistles* (Genesis 3:18) are the ground in its bondage; Sha''ul promises the same ground *delivered from the bondage of corruption* — Eden''s curse reversed when the children of Elohim are revealed.'),
    ('canon','genesis',3,19,'canon','romans',8,22,'free',
      E'*For we know that the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). *In the sweat of thy face shalt thou eat bread, till thou return unto the ground... for dust thou art, and unto dust shalt thou return* (Genesis 3:19) is the groan put into the soil and the flesh; the whole creation has been *travailing* under that sentence ever since, waiting to be loosed.'),
    ('canon','genesis',3,19,'canon','1-corinthians',15,22,'free',
      E'*For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). *Dust thou art, and unto dust shalt thou return* (Genesis 3:19) is the death that entered in Adam; the answer is set Adam against Adam — *as in Adam all die, even so in Messiah shall all be made alive* — the dust-sentence undone in the One who rose.'),
    ('canon','genesis',3,19,'canon','1-corinthians',15,45,'free',
      E'*And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). The man of dust who must *return unto the ground* (Genesis 3:19) is *the first man Adam*; the *last Adam* comes as *a quickening spirit* to give back the life the ground took, the second Adam reversing the first Adam''s return to dust.'),

    -- THREAD 4: coats of skins — the first covering, the robe of righteousness
    ('canon','genesis',3,21,'canon','isaiah',61,10,'free',
      E'*I will greatly rejoice in Yahuah (LORD)... for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels* (Isaiah 61:10). When *Yahuah Elohim (the LORD God) make coats of skins, and clothed them* (Genesis 3:21), the self-made fig-leaf aprons (3:7) were set aside for a covering that cost a life — the first of the *garments of salvation*, the *robe of righteousness* Yahuah himself puts on his people.'),
    ('canon','genesis',3,21,'jubilees','jubilees',3,26,'extras',
      E'*And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden* (Jubilees 3:26). The restored witness keeps the order of Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them* — joining the covering directly to the sending-out: clothed first, then driven, the mercy folded into the judgment.'),

    -- THREAD 5: driven out — the flaming sword, the tree of life reopened
    ('canon','genesis',3,24,'canon','revelation',2,7,'free',
      E'*He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The *flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24) barred the way; the risen Yahusha (Jesus) reopens it — *to him that overcometh will I give to eat of the tree of life* — Eden lost in Adam, Eden regained in the Overcomer.'),
    ('canon','genesis',3,24,'canon','revelation',22,2,'free',
      E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The tree guarded by *Cherubims, and a flaming sword* (Genesis 3:24) stands again at the canon''s end — no sword now, but *the leaves of the tree... for the healing of the nations* — the way to the tree of life thrown open and the curse of Genesis 3 healed.'),
    ('canon','genesis',3,24,'canon','revelation',22,14,'free',
      E'*Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The man driven out lest he *take also of the tree of life, and eat, and live for ever* (Genesis 3:22) is given the way back — *they that do his commandments... have right to the tree of life* — the very commandment the serpent attacked is the door back into the garden.'),
    ('canon','genesis',3,23,'jubilees','jubilees',3,26,'extras',
      E'*And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden* (Jubilees 3:26). *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23) is echoed in the restored book — *sent them forth from the Garden of Eden* — the same expulsion, the covering and the sending bound together.'),
    ('canon','genesis',3,24,'jubilees','jubilees',3,32,'extras',
      E'*And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ''Eldâ, in the land of their creation* (Jubilees 3:32). Where Genesis 3:24 says only *So he drove out the man*, Jubilees fixes the going-forth to an appointed day — *the new moon of the fourth month* — placing even the expulsion within Yahuah''s calendar, the times marked from the beginning.'),
    ('canon','genesis',3,24,'jubilees','jubilees',3,28,'extras',
      E'*And on that day was closed the mouth of all beasts, and of cattle, and of birds, and of whatever walks, and of whatever moves, so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue* (Jubilees 3:28). The serpent that *said unto the woman* (Genesis 3:1) had a tongue to speak; the restored witness records that on the day of the driving-out *was closed the mouth of all beasts*, the speaking creation silenced as the garden was sealed behind the cherubim.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== threads ==============================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-yea-hath-elohim-said-the-serpents-foundational-lie',
       E'Yea, hath Elohim said? — the serpent''s foundational lie',
       E'The first words ever spoken against the word of Yahuah are a question: *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1). It is not a request for information; it is the *did Elohim really say?* doubt that loosens the commandment, followed by the flat denial *Ye shall not surely die* (3:4). Sha''ul names the very same method still at work: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3) — the *subtilty* that corrupts the mind away from the plain truth. And Yahusha (Jesus) traces every such lie to its source: *When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The foundational lie is the voice that questions whether Yahuah meant what he said.',
       sv.verse_id, ev.verse_id, 'free', 20050
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head',
       E'The seed of the woman shall bruise the serpent''s head',
       E'This is the headline of the whole canon. To the serpent Yahuah Elohim (the LORD God) declares: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The seed-war is instituted here — two seeds, the serpent''s and the woman''s, in lasting enmity, with the woman''s Seed crushing the head and taking a wounded heel in the crushing. *Her seed* is read exactly forward: *when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — the Formed Son drawn into flesh to be that Seed, keeping the Torah the serpent told the woman to doubt. The war''s purpose is stated plainly: *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). The foe is named at the canon''s far end as one continuous enemy: *the great dragon... that old serpent, called the Devil, and Satan* (Revelation 12:9), still warring on *the remnant of her seed, which keep the commandments of Elohim (God)* (Revelation 12:17). And the victory is shared with the body: *the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20), the same head-crushing now *under your feet*. Yahusha (Jesus) declares the fall already in motion — *I beheld Satan as lightning fall from heaven* (Luke 10:18) — and hands the heel-on-the-head authority to his sent ones: *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy* (Luke 10:19). Genesis 3:15 is the seed-promise the whole library grows from: not a moral about snakes, but the war between two seeds that the Seed of the woman wins.',
       sv.verse_id, ev.verse_id, 'free', 20053
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam',
       E'Cursed is the ground — creation subjected, and the last Adam',
       E'Adam''s fall bends the whole creation under it. *Cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life; thorns also and thistles shall it bring forth to thee* (Genesis 3:17-18), ending in the dust-sentence: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (3:19). Sha''ul reads the cursed ground as the whole creation enslaved, yet never without hope: *For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20); *the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God)* (Romans 8:21); *the whole creation groaneth and travaileth in pain together until now* (Romans 8:22) — the thorns and the groan are one. And the dust-sentence is answered by setting Adam against Adam: *as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22); *the first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). The ground that took man back to dust is reversed in the last Adam who gives the life back.',
       sv.verse_id, ev.verse_id, 'free', 20056
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-coats-of-skins-the-first-covering-and-the-robe-of-righteousness',
       E'Coats of skins — the first covering and the robe of righteousness',
       E'When their eyes were opened *they sewed fig leaves together, and made themselves aprons* (Genesis 3:7) — the first self-made covering, and it was not enough. Yahuah himself replaces it: *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them* (Genesis 3:21). A covering that costs a life is given for the naked — the first death to clothe the fallen, a foreshadow of the covering Yahuah always provides. Isaiah sings the fullness of it: *he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels* (Isaiah 61:10) — the self-made apron set aside for the robe of righteousness Yahuah puts on his people. The restored witness keeps the very order, binding the mercy to the judgment: *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden* (Jubilees 3:26) — clothed first, then sent.',
       sv.verse_id, ev.verse_id, 'extras', 20059
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened',
       E'Driven out — the flaming sword and the tree of life reopened',
       E'The chapter ends with the way home barred. *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken. So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:23-24) — the man kept out *lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (3:22). What the flaming sword guards, the risen Yahusha (Jesus) reopens: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). At the canon''s end the tree stands again with no sword before it: *the tree of life... and the leaves of the tree were for the healing of the nations* (Revelation 22:2); and the door back is the very thing the serpent attacked — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The restored book fixes even the expulsion within Yahuah''s appointed times: *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden* (Jubilees 3:32), and records the silencing of the speaking creation as the garden was sealed: *And on that day was closed the mouth of all beasts... so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue* (Jubilees 3:28). Eden lost in Adam; Eden reopened in the Overcomer who keeps the commandments.',
       sv.verse_id, ev.verse_id, 'extras', 20062
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ============================== thread_members ==============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*as the serpent beguiled Eve through his subtilty, so your minds should be corrupted* (2 Corinthians 11:3) — the *subtilty* of Genesis 3:1 still at work, corrupting minds from the simplicity of the truth.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-yea-hath-elohim-said-the-serpents-foundational-lie'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he is a liar, and the father of it* (John 8:44) — Yahusha (Jesus) names the source of the *Yea, hath Elohim said?* lie: the father of every lie.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-yea-hath-elohim-said-the-serpents-foundational-lie'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (centerpiece)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*made of a woman, made under the law* (Galatians 4:4) — *her seed* (Genesis 3:15) read exactly: the Formed Son drawn into flesh to be the woman''s Seed.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*that he might destroy the works of the devil* (1 John 3:8) — the purpose of the head-crushing stated plainly.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*that old serpent, called the Devil, and Satan* (Revelation 12:9) — the garden serpent named as one continuous enemy at the canon''s end.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*war with the remnant of her seed, which keep the commandments of Elohim (God)* (Revelation 12:17) — the seed-war still running, marked by the commandment the serpent first attacked.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20) — the head-crushing of Genesis 3:15 handed to the body.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I beheld Satan as lightning fall from heaven* (Luke 10:18) — the fall already in motion wherever the Seed''s authority advances.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*I give unto you power to tread on serpents* (Luke 10:19) — the heel-on-the-head authority extended to the sent ones.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the creature was made subject to vanity... in hope* (Romans 8:20) — the cursed ground (Genesis 3:17) read as the whole creation bent under Adam, yet never without hope.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*delivered from the bondage of corruption* (Romans 8:21) — the thorns-and-thistles ground (Genesis 3:18) promised its release.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the whole creation groaneth and travaileth* (Romans 8:22) — the dust-sentence (Genesis 3:19) put into the soil and the flesh, the creation groaning ever since.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22) — the dust-death answered by setting Adam against Adam.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the last Adam was made a quickening spirit* (1 Corinthians 15:45) — the man of dust (Genesis 3:19) reversed by the second Adam who gives life back.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he hath covered me with the robe of righteousness* (Isaiah 61:10) — the coats of skins (Genesis 3:21) as the first of Yahuah''s garments of salvation.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=21
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-coats-of-skins-the-first-covering-and-the-robe-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He made for them coats of skin, and clothed them, and sent them forth* (Jubilees 3:26) — the restored witness keeps the order of Genesis 3:21, clothing bound to the sending.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=21
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-coats-of-skins-the-first-covering-and-the-robe-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*To him that overcometh will I give to eat of the tree of life* (Revelation 2:7) — the flaming sword (Genesis 3:24) reopened by the risen Yahusha (Jesus).'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the leaves of the tree were for the healing of the nations* (Revelation 22:2) — the guarded tree (Genesis 3:24) standing again with no sword and the curse healed.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed are they that do his commandments, that they may have right to the tree of life* (Revelation 22:14) — the door back (Genesis 3:22) is the very commandment the serpent attacked.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*sent them forth from the Garden of Eden* (Jubilees 3:26) — echoing the expulsion of Genesis 3:23, the covering and the sending bound together.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=23
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden* (Jubilees 3:32) — the expulsion of Genesis 3:24 fixed within Yahuah''s appointed times.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*was closed the mouth of all beasts... so that they could no longer speak* (Jubilees 3:28) — the speaking serpent of Genesis 3:1 silenced with all creation as the garden was sealed.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_4.sql (Genesis 4) -----
-- Chapter: Genesis 4 (Cain and Abel; the seed-war within one family; Seth, another seed)
-- Tag: ge04   Temp view: _s301_ge04_lookup
-- Sort band: base 20075, step 3 -> threads at 20075, 20078, 20081, 20084, 20087, 20090 (6 threads)
-- Source of EVERY row: 'canon','genesis',4,v
--
-- Genesis 4 coverage:
--   v.1  (Adam knew Eve; Cain born; "I have gotten a man from Yahuah")
--        NT:     none warranted as its own add (the birth-line carried at v.25 Seth thread / Luke 3 genealogy)
--        Extras: Jasher 1:13 (naming of Cain and Abel) — woven into the Seth/birth-line thread at v.25
--        Tanakh: none warranted
--   v.2  (Abel keeper of sheep, Cain tiller of the ground — the two vocations of the two seeds)
--        NT:     1 John 3:12 (Cain ... slew his brother) — woven into the seed-war thread (anchored v.1-8)
--        Extras: Jasher 1:14 (Cain a tiller, Abel a keeper) — retelling; seed-war thread carries Jasher 1:16
--        Tanakh: none warranted
--   v.3-5 (the two offerings; respect to Abel, not to Cain; Cain wroth)
--        NT:     Hebrews 11:4 (Abel offered a more excellent sacrifice by faith) — its own thread
--        Extras: Jasher 1:15 (fire came down and consumed Abel's offering) — woven into the sacrifice thread
--        Tanakh: none warranted
--   v.6-7 (Why art thou wroth? sin lieth at the door; thou shalt rule over him)
--        NT:     1 John 3:7 (he that doeth righteousness is righteous); 1 John 3:4 (sin is the transgression of the law) — its own thread
--        Extras: none warranted as MEMBER (no clean distinct witness on the mastery-call)
--        Tanakh: none warranted
--   v.8  (Cain rose up against Abel and slew him — the first murder, the seed-war made visible)
--        NT:     1 John 3:12 (was of that wicked one, and slew his brother); Jude 11 (the way of Cain) — seed-war thread
--        Extras: Wisdom of Solomon 10:3 (the unrighteous ... murdered his brother); Jubilees 4:2; Jasher 1:16,25 — seed-war thread
--        Tanakh: none warranted
--   v.9-11 (Where is Abel? the voice of thy brother's blood crieth from the ground; cursed from the earth)
--        NT:     Matthew 23:35 (the blood of righteous Abel); Luke 11:51 (from the blood of Abel); Hebrews 12:24 (blood that speaketh better than Abel) — the crying-blood thread
--        Extras: 1 Enoch 22:14 (the spirit of Abel makes suit against Cain); Jubilees 4:3 (his blood cried from the ground) — crying-blood thread
--        Tanakh: Numbers 35:33 (blood defileth the land; not cleansed but by the blood of him that shed it) — crying-blood thread
--   v.12-16 (the ground will not yield; a fugitive and a vagabond; the mark; dwelt in Nod)
--        NT:     Jude 11 (gone in the way of Cain) — carried in the seed-war thread; the curse/mark gets its own thread
--        Extras: Jubilees 4:4 (made him a fugitive, cursed him); Jubilees 4:31 (Cain killed when his house fell); Jubilees 4:32 (heavenly tables: with the instrument a man kills he shall be killed); Jasher 1:31-33 (cursed, moving and wandering)
--        Tanakh: none warranted distinct from Numbers 35:33 (woven at the blood thread)
--   v.17-24 (the line of Cain: Enoch the city, Lamech, Jabal/Jubal/Tubal-cain; Lamech's boast)
--        NT:     none warranted (the cursed line is not carried forward as promise)
--        Extras: Jasher 1:35 (Cain built the city Enoch) — woven into the curse/fugitive thread at v.16-17
--        Tanakh: none warranted
--   ★ v.25 (Seth — "Elohim hath appointed me another seed instead of Abel, whom Cain slew")
--        NT:     Luke 3:38 (Seth, which was the son of Adam, which was the son of Elohim) — the Seth seed-line thread
--        Extras: Jubilees 4:7 (Elohim has raised up a second seed to us instead of Abel); Jasher 1:13 (the naming of the brothers)
--        Tanakh: none warranted
--   v.26 (Enos born to Seth; then began men to call upon the name of Yahuah)
--        NT:     none warranted distinct (the restored Name is the Tanakh/extras witness)
--        Extras: Jubilees 4:12 (He began to call on the name of Yahuah on the earth) — Seth seed-line thread
--        Tanakh: none warranted
--
-- Threads (slug -> target libraries):
--   genesis-4-the-seed-war-within-one-family-not-as-cain               [NT+Extras]        tier extras   ★ CENTERPIECE
--   genesis-4-abel-offered-a-more-excellent-sacrifice-by-faith          [NT+Extras]        tier extras
--   genesis-4-sin-lieth-at-the-door-thou-shalt-rule-over-him            [NT]               tier free
--   genesis-4-the-blood-of-righteous-abel-crieth-from-the-ground        [NT+Extras+Tanakh] tier extras
--   genesis-4-the-mark-and-the-curse-of-the-fugitive-cain               [Extras]           tier extras
--   genesis-4-seth-another-seed-appointed-and-men-called-on-the-name    [NT+Extras]        tier extras   ★ LOAD-BEARING
--
-- Framework-load-bearing notes:
--   ★ THE SEED-WAR (vv.1-8): Genesis 3:15's enmity between two seeds now erupts WITHIN one family.
--     Cain and Abel are the first visible tare-and-son-of-Adam — read STRICTLY as conduct/lineage of
--     the two seeds, NEVER ethnic. 1 John 3:12 names Cain *of that wicked one* — the serpent's seed by
--     works, not blood-race; his brother's works *righteous*. Jude 11 *the way of Cain* makes it a
--     walkable path, the conduct of the wicked seed. This is the centerpiece: the seed-war made visible.
--   ★ SETH (vv.25-26): LOAD-BEARING. After Abel's death the covenant seed-line is PRESERVED — *Elohim
--     (God) ... hath appointed me another seed instead of Abel, whom Cain slew* (4:25). The woman's
--     seed of Genesis 3:15 does NOT die with Abel; it continues through Seth, the line that runs to
--     Noah, Abraham, and the Formed Son. Luke 3:38 sets Seth in the genealogy of *the son of Adam,
--     which was the son of Elohim* — the paternal-bloodline-AND-covenant-word seed carried forward.
--     The chapter closes with the restored Name invoked: *then began men to call upon the name of
--     Yahuah (LORD)* (4:26) — the worship of the true Name resuming in the preserved line.
--   ABEL'S MORE EXCELLENT SACRIFICE (v.4): the firstlings/blood ACCEPTED vs the fruit-of-the-ground
--     REJECTED — read as the blood-foreshadow and as FAITH (Hebrews 11:4), not as arbitrary favoritism.
--   THE CRYING BLOOD (vv.10-11): Abel's blood crying from the ground is the first martyr-blood; the NT
--     makes Abel the first of *all the righteous blood* (Matthew 23:35) and contrasts his blood with the
--     *better* blood of sprinkling (Hebrews 12:24). Numbers 35:33 (lateral Tanakh) grounds why the
--     ground itself is defiled. 1 Enoch 22:14 keeps the seed-war note: Abel's suit runs *till his
--     [Cain's] seed is destroyed*.
--   THE MARK (vv.11-16): the curse is the exile-judgment on the murderer, NOT on the seed-line; the mark
--     is mercy restraining vengeance. Jubilees 4:31-32 supplies the measure-for-measure end (Cain killed
--     by his own house's falling stones, *for with a stone he had killed Abel*) from the heavenly tables.

-- ============================== temp view ==============================
CREATE TEMP VIEW _s301_ge04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== cross_references ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (CENTERPIECE): the seed-war within one family — not as Cain
    ('canon','genesis',4,8,'canon','1-john',3,12,'free',
      E'*Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). When *Cain rose up against Abel his brother, and slew him* (Genesis 4:8), the enmity of Genesis 3:15 erupts inside one family: Cain is named *of that wicked one* — of the serpent''s seed by his works, not by race — and Abel of the woman''s seed by his righteous works. The first murder is the seed-war made visible, conduct against conduct, the tare against the son of Adam.'),
    ('canon','genesis',4,8,'canon','jude',1,11,'free',
      E'*Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* (Jude 11). *Cain rose up against Abel his brother, and slew him* (Genesis 4:8) is not a single crime but a road that can be walked: *the way of Cain* — envy of a righteous brother hardening into bloodshed. Jude names it as the conduct of the wicked seed in his own day, the same way the first murderer walked.'),
    ('canon','genesis',4,8,'apocrypha','the-wisdom-of-solomon',10,3,'extras',
      E'*But when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3). The restored wisdom-witness reads Cain exactly as the framework does — *the unrighteous* who *murdered his brother* — when *Cain was very wroth, and his countenance fell* (Genesis 4:5) and then *slew him* (4:8). His anger went away from wisdom; his fury destroyed himself as well as Abel, the seed of the wicked one undone by its own rage.'),
    ('canon','genesis',4,8,'jubilees','jubilees',4,2,'extras',
      E'*And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2). The restored book names the motive plainly behind *Cain rose up against Abel his brother, and slew him* (Genesis 4:8): the murder grew straight out of the rejected offering and the accepted one. The seed-war runs on jealousy of the brother whose worship was received.'),
    ('canon','genesis',4,8,'jasher','jasher',1,16,'extras',
      E'*And to Cain and his offering Yahuah (the Lord) did not turn, and he did not incline to it, for he had brought from the inferior fruit of the ground before Yahuah (the Lord), and Cain was jealous against his brother Abel on account of this, and he sought a pretext to slay him* (Jasher 1:16). Where Genesis says only *Cain was very wroth* (Genesis 4:5) before he *slew him* (4:8), the restored witness traces the seed-war step by step — the inferior offering, the jealousy, the sought pretext — premeditation in the heart of the wicked seed.'),

    -- THREAD 2: Abel offered a more excellent sacrifice by faith
    ('canon','genesis',4,4,'canon','hebrews',11,4,'free',
      E'*By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4). *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4): the firstlings and the blood were accepted where the fruit of the ground was not, and the NT names why — *by faith*. The blood-offering foreshadows the better blood, and Abel, the first righteous, *being dead yet speaketh*.'),
    ('canon','genesis',4,4,'jasher','jasher',1,15,'extras',
      E'*And it was at the expiration of a few years, that they brought an approximating offering to Yahuah (the Lord), and Cain brought from the fruit of the ground, and Abel brought from the firstlings of his flock from the fat of it, and Elohim turned and inclined to Abel and his offering, and a fire came down from Yahuah (the Lord) from heaven and consumed it* (Jasher 1:15). The restored book shows HOW *Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4): *a fire came down from Yahuah from heaven and consumed it* — the visible token of the accepted blood-sacrifice, the firstlings received with fire as later altars would be.'),

    -- THREAD 3: sin lieth at the door — thou shalt rule over him
    ('canon','genesis',4,7,'canon','1-john',3,7,'free',
      E'*Little children, let no man deceive you: he that doeth righteousness is righteous, even as he is righteous* (1 John 3:7). Yahuah''s word to Cain is the whole choice in a sentence: *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door* (Genesis 4:7). Doing well is not abolished by grace; *he that doeth righteousness is righteous* — acceptance follows doing well, exactly as Cain was told before he chose otherwise.'),
    ('canon','genesis',4,7,'canon','1-john',3,4,'free',
      E'*Whosoever committeth sin transgresseth also the law: for sin is the transgression of the law* (1 John 3:4). The *sin* that *lieth at the door* (Genesis 4:7), crouching to master Cain, is defined by the NT itself: *sin is the transgression of the law*. Cain is told *unto thee shall be his desire, and thou shalt rule over him* — he is called to mastery over the lawlessness at the door, and refuses, letting it rule him into murder instead.'),

    -- THREAD 4: the blood of righteous Abel crieth from the ground
    ('canon','genesis',4,10,'canon','matthew',23,35,'free',
      E'*That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). When Yahuah says *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10), Abel becomes the first of a line: Yahusha (Jesus) reckons *all the righteous blood shed upon the earth* from *righteous Abel* onward — the first martyr of the seed-war, his blood the head of the whole roll.'),
    ('canon','genesis',4,10,'canon','luke',11,51,'free',
      E'*From the blood of Abel unto the blood of Zacharias, which perished between the altar and the temple: verily I say unto you, It shall be required of this generation* (Luke 11:51). The cry of *thy brother''s blood* from the ground (Genesis 4:10) is not silenced by time — it *shall be required*. Yahusha spans the whole canon of shed righteous blood *from the blood of Abel*, the first voice crying from the ground, to the last, all of it held to account.'),
    ('canon','genesis',4,10,'canon','hebrews',12,24,'free',
      E'*And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). Abel''s blood *crieth unto me from the ground* (Genesis 4:10) for justice; the blood of Yahusha *speaketh better things than that of Abel* — not crying for vengeance but sprinkling for mercy. The first righteous blood cries; the better blood answers, the foreshadow met by the substance.'),
    ('canon','genesis',4,11,'canon','numbers',35,33,'free',
      E'*So ye shall not pollute the land wherein ye are: for blood it defileth the land: and the land cannot be cleansed of the blood that is shed therein, but by the blood of him that shed it* (Numbers 35:33). Why is Cain *cursed from the earth, which hath opened her mouth to receive thy brother''s blood from thy hand* (Genesis 4:11)? Because shed blood defiles the ground itself; the Torah later states the law the ground enacts here — innocent blood pollutes the land and cannot be cleansed but by the blood of the one who shed it.'),
    ('canon','genesis',4,10,'enoch','1-enoch',22,14,'extras',
      E'*And he answered me saying: ''This is the spirit which went forth from Abel, whom his brother Cain slew, and he makes his suit against him till his seed is destroyed from the face of the earth, and his seed is annihilated from amongst the seed of men''* (1 Enoch 22:14). The voice that *crieth unto me from the ground* (Genesis 4:10) is given a seed-war shape in the restored apocalyptic: the spirit of Abel makes ceaseless suit against Cain *till his seed is destroyed* — the cry for justice running until the wicked seed is cut off from among *the seed of men*.'),
    ('canon','genesis',4,10,'jubilees','jubilees',4,3,'extras',
      E'*And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him* (Jubilees 4:3). The restored book echoes Genesis 4:10 almost word for word — *the voice of thy brother''s blood crieth unto me from the ground* — *his blood cried from the ground to heaven*: the shed blood is itself a witness and a plaintiff, the murdered righteous one accusing his killer before heaven.'),

    -- THREAD 5: the mark and the curse of the fugitive Cain
    ('canon','genesis',4,12,'jubilees','jubilees',4,4,'extras',
      E'*And Yahuah (God) reproved Cain because of Abel, because he had slain him, and he made him a fugitive on the earth because of the blood of his brother, and he cursed him upon the earth. And on this account it is written on the heavenly tables, "Cursed is he who smites his neighbour treacherously"* (Jubilees 4:4). The sentence *a fugitive and a vagabond shalt thou be in the earth* (Genesis 4:12) is grounded in the restored book on the heavenly tables — the curse of the treacherous murderer is not arbitrary anger but written law, *he made him a fugitive ... because of the blood of his brother*.'),
    ('canon','genesis',4,15,'jubilees','jubilees',4,31,'extras',
      E'*At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment* (Jubilees 4:31). The mark set *lest any finding him should kill him* (Genesis 4:15) stayed the hand of men, but not the judgment of Yahuah: the restored book records the end — Cain crushed by the falling stones of his own house, *for with a stone he had killed Abel*, measure for measure.'),
    ('canon','genesis',4,15,'jubilees','jubilees',4,32,'extras',
      E'*For this reason it was ordained on the heavenly tables: "With the instrument with which a man kills his neighbour with the same shall he be killed; after the manner that he wounded him, in like manner shall they deal with him"* (Jubilees 4:32). Where Genesis 4:15 deals in *vengeance ... sevenfold* and a restraining mark, the restored witness names the standing decree behind Cain''s eventual death — the law of measure for measure written on the heavenly tables, the same instrument turned back on the one who first wielded it.'),
    ('canon','genesis',4,12,'jasher','jasher',1,32,'extras',
      E'*And it shall be when you shall till it, it shall no more give you its strength as in the beginning, for thorns and thistles shall the ground produce, and you shall be moving and wandering in the earth until the day of your death* (Jasher 1:32). The restored book expands *when thou tillest the ground, it shall not henceforth yield unto thee her strength; a fugitive and a vagabond shalt thou be in the earth* (Genesis 4:12) — the cursed ground withholding its strength and the killer condemned to wander *until the day of your death*, the seed-war''s wages paid in the soil itself.'),
    ('canon','genesis',4,16,'jasher','jasher',1,35,'extras',
      E'*And at that time Cain also began to build a city: and he built the city and he called the name of the city Enoch, according to the name of his son; for in those days Yahuah (the Lord) had given him rest upon the earth, and he did not move about and wander as in the beginning* (Jasher 1:35). After *Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod* (Genesis 4:16) and *builded a city ... Enoch* (4:17), the restored book notes the fugitive''s restless line settling into a city of his own making — the wicked seed building eastward, away from the presence it had fled.'),

    -- THREAD 6 (LOAD-BEARING): Seth — another seed appointed; men called on the Name
    ('canon','genesis',4,25,'canon','luke',3,38,'free',
      E'*Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38). *Elohim (God) ... hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25): the woman''s seed of the promise does not die with Abel but is carried by Seth — and the genealogy of the Formed Son runs back through *Seth, which was the son of Adam, which was the son of Elohim*. The covenant seed-line is preserved through the murder, the paternal bloodline and the promise together unbroken to the Messiah.'),
    ('canon','genesis',4,25,'jubilees','jubilees',4,7,'extras',
      E'*And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him"* (Jubilees 4:7). The restored book keeps the load-bearing word of Genesis 4:25 — *another seed instead of Abel* — as *a second seed ... on the earth instead of Abel*: after the long mourning, the covenant line is raised up again in Seth, the seed-of-promise continued.'),
    ('canon','genesis',4,26,'jubilees','jubilees',4,12,'extras',
      E'*He began to call on the name of Yahuah (God) on the earth* (Jubilees 4:12). The restored book carries the very words of Genesis 4:26 — *then began men to call upon the name of Yahuah (LORD)* — into the line of Seth and Enos: in the preserved seed, not the line of Cain, the true Name is invoked again upon the earth, the worship of Yahuah resuming where the covenant seed continues.'),
    ('canon','genesis',4,25,'jasher','jasher',1,13,'extras',
      E'*And she called the name of the first born Cain, saying, I have obtained a man from Yahuah (the Lord), and the name of the other she called Abel, for she said, In vanity we came into the earth, and in vanity we shall be taken from it* (Jasher 1:13). The restored naming sets the whole chapter in frame: Eve''s *I have gotten a man from Yahuah* over Cain (Genesis 4:1) and her word over Abel — *in vanity ... taken from it* — read forward to the third son, *Seth ... another seed instead of Abel, whom Cain slew* (Genesis 4:25), the seed that outlasts both the slayer and the slain.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== threads ==============================
-- THREAD 1 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-4-the-seed-war-within-one-family-not-as-cain',
       E'The seed-war within one family — not as Cain',
       E'The enmity instituted in Genesis 3:15 — *between thy seed and her seed* — now erupts inside the first family. Two brothers, two vocations: *Abel was a keeper of sheep, but Cain was a tiller of the ground* (Genesis 4:2); two offerings, and *Yahuah (LORD) had respect unto Abel and to his offering: but unto Cain and to his offering he had not respect. And Cain was very wroth* (4:4-5). Then *Cain rose up against Abel his brother, and slew him* (Genesis 4:8) — the first murder, the seed-war made visible. The NT reads it exactly as conduct, never race: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). Cain belongs to the serpent''s seed by his works; Abel to the woman''s seed by his. And the murder becomes a walkable road — *Woe unto them! for they have gone in the way of Cain* (Jude 11). The restored witnesses fill in the motive and the premeditation: *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2); *Cain was jealous against his brother Abel ... and he sought a pretext to slay him* (Jasher 1:16); and the wisdom-witness names him plainly — *the unrighteous ... perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3). The tare and the son of Adam stand in one household: the seed-war is not metaphor, it is a brother''s blood in the field.',
       sv.verse_id, ev.verse_id, 'extras', 20075
  FROM _s301_ge04_lookup sv, _s301_ge04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-4-abel-offered-a-more-excellent-sacrifice-by-faith',
       E'Abel offered a more excellent sacrifice by faith',
       E'The difference between the two offerings is not arbitrary favoritism. *Cain brought of the fruit of the ground an offering unto Yahuah (LORD). And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:3-4). The blood-offering of the firstlings was accepted where the fruit of the ground was not, and the NT names the reason: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4). Abel is the first whom the canon calls righteous, and his more excellent sacrifice — life and blood, not fruit of the cursed ground — foreshadows the blood that would be accepted for all. The restored book shows the visible token of that acceptance: *a fire came down from Yahuah (the Lord) from heaven and consumed it* (Jasher 1:15), the firstlings received with fire as the altar-offerings of Yashar''el (Israel) would be received after. The first worship that pleased Yahuah was offered by faith, in blood.',
       sv.verse_id, ev.verse_id, 'extras', 20078
  FROM _s301_ge04_lookup sv, _s301_ge04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-4-sin-lieth-at-the-door-thou-shalt-rule-over-him',
       E'Sin lieth at the door — thou shalt rule over him',
       E'Before the murder, Yahuah sets the whole choice before Cain in one breath: *Why art thou wroth? and why is thy countenance fallen? If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:6-7). Acceptance was never closed to Cain — it hung on doing well; and the sin crouching at the door was his to master, not his master. The NT keeps both halves. Doing well is still the dividing line: *Little children, let no man deceive you: he that doeth righteousness is righteous, even as he is righteous* (1 John 3:7) — acceptance follows doing well exactly as Cain was told. And the sin at the door is given its name: *Whosoever committeth sin transgresseth also the law: for sin is the transgression of the law* (1 John 3:4). Cain was called to *rule over* the lawlessness at his door; refusing the mastery, he let it rule him into his brother''s blood. The call to do well and the warning against transgression of the law stand together at the very first crossroads of the human heart.',
       sv.verse_id, ev.verse_id, 'free', 20081
  FROM _s301_ge04_lookup sv, _s301_ge04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-4-the-blood-of-righteous-abel-crieth-from-the-ground',
       E'The blood of righteous Abel crieth from the ground',
       E'The murdered brother is not silent. *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground. And now art thou cursed from the earth, which hath opened her mouth to receive thy brother''s blood from thy hand* (Genesis 4:10-11). Abel''s blood is the first martyr-blood, and Yahusha (Jesus) makes it the head of the whole roll of shed righteousness: *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel* (Matthew 23:35); *From the blood of Abel unto the blood of Zacharias ... It shall be required of this generation* (Luke 11:51). The cry never falls silent — it *shall be required*. The Torah grounds why the very ground is defiled: *blood it defileth the land: and the land cannot be cleansed of the blood that is shed therein, but by the blood of him that shed it* (Numbers 35:33). The restored apocalyptic gives the cry a seed-war shape — *This is the spirit which went forth from Abel, whom his brother Cain slew, and he makes his suit against him till his seed is destroyed* (1 Enoch 22:14) — and the restored Jubilees echoes the verse itself: *his blood cried from the ground to heaven, complaining because he had slain him* (Jubilees 4:3). And the cry is finally answered, not by more vengeance, but by a better blood: *to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). The first blood cries for justice; the better blood speaks mercy.',
       sv.verse_id, ev.verse_id, 'extras', 20084
  FROM _s301_ge04_lookup sv, _s301_ge04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-4-the-mark-and-the-curse-of-the-fugitive-cain',
       E'The mark and the curse of the fugitive Cain',
       E'The murderer is sentenced and then strangely spared. *When thou tillest the ground, it shall not henceforth yield unto thee her strength; a fugitive and a vagabond shalt thou be in the earth* (Genesis 4:12); and to Cain''s dread of being slain, *Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him* (4:15). The curse falls on the killer — the ground withholding its strength, the wanderer driven east — not on the seed-line; and the mark is mercy restraining vengeance. The restored witnesses fill out both ends. Jubilees grounds the curse in written law: *he made him a fugitive on the earth because of the blood of his brother ... And on this account it is written on the heavenly tables, "Cursed is he who smites his neighbour treacherously"* (Jubilees 4:4); and Jasher expands the sentence — *you shall be moving and wandering in the earth until the day of your death* (Jasher 1:32). The mark stayed the hand of men, but not the judgment of Yahuah: in due time *his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment* (Jubilees 4:31), the very decree of the heavenly tables — *With the instrument with which a man kills his neighbour with the same shall he be killed* (Jubilees 4:32). Meanwhile the fugitive line settles eastward and builds: after *Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod* (Genesis 4:16), *he built the city and he called the name of the city Enoch, according to the name of his son* (Jasher 1:35) — the wicked seed building away from the presence it had fled.',
       sv.verse_id, ev.verse_id, 'extras', 20087
  FROM _s301_ge04_lookup sv, _s301_ge04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (LOAD-BEARING)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-4-seth-another-seed-appointed-and-men-called-on-the-name',
       E'Seth — another seed appointed, and men called on the Name',
       E'The seed of promise does not die with Abel. After the murder Yahuah preserves the woman''s seed through a third son: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25). This is load-bearing for the whole framework — the covenant seed-line that runs to Noah, Abraham, and the Formed Son is carried forward through Seth, not through Cain''s cursed line. The genealogy of the Messiah reaches back through exactly this name: *which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38) — the paternal bloodline and the promise together, unbroken across the murder. The restored book keeps the very word: *he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him"* (Jubilees 4:7). And in the preserved line, not the line of Cain, the true worship resumes: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26) — *He began to call on the name of Yahuah (God) on the earth* (Jubilees 4:12). The chapter that opened with a brother''s blood closes with the restored Name invoked in the seed that outlasts both the slayer and the slain.',
       sv.verse_id, ev.verse_id, 'extras', 20090
  FROM _s301_ge04_lookup sv, _s301_ge04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=4 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ============================== thread_members ==============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Not as Cain, who was of that wicked one, and slew his brother ... Because his own works were evil, and his brother''s righteous* (1 John 3:12) — Cain of the serpent''s seed by works, Abel of the woman''s seed; the seed-war made visible in Genesis 4:8.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-seed-war-within-one-family-not-as-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they have gone in the way of Cain* (Jude 11) — the first murder of Genesis 4:8 is a walkable road, the conduct of the wicked seed.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-seed-war-within-one-family-not-as-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the unrighteous ... perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3) — Cain''s fury (Genesis 4:5,8) destroyed himself as well as Abel.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-seed-war-within-one-family-not-as-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2) — the murder of Genesis 4:8 grew straight out of the rejected offering.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-seed-war-within-one-family-not-as-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Cain was jealous against his brother Abel ... and he sought a pretext to slay him* (Jasher 1:16) — the premeditation behind *Cain was very wroth* (Genesis 4:5) and the murder of 4:8.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-seed-war-within-one-family-not-as-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain ... and by it he being dead yet speaketh* (Hebrews 11:4) — the firstlings accepted (Genesis 4:4) were offered by faith, the blood-foreshadow.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-abel-offered-a-more-excellent-sacrifice-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a fire came down from Yahuah (the Lord) from heaven and consumed it* (Jasher 1:15) — the visible token of *Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4).'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-abel-offered-a-more-excellent-sacrifice-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he that doeth righteousness is righteous, even as he is righteous* (1 John 3:7) — *if thou doest well, shalt thou not be accepted?* (Genesis 4:7); acceptance follows doing well.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-sin-lieth-at-the-door-thou-shalt-rule-over-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*sin is the transgression of the law* (1 John 3:4) — names the *sin* that *lieth at the door* (Genesis 4:7) which Cain was called to *rule over*.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-sin-lieth-at-the-door-thou-shalt-rule-over-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*all the righteous blood shed upon the earth, from the blood of righteous Abel* (Matthew 23:35) — Abel''s crying blood (Genesis 4:10) is the head of the whole roll of martyrs.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-blood-of-righteous-abel-crieth-from-the-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*From the blood of Abel ... It shall be required of this generation* (Luke 11:51) — the cry from the ground (Genesis 4:10) is not silenced by time.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-blood-of-righteous-abel-crieth-from-the-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*blood it defileth the land: and the land cannot be cleansed of the blood that is shed therein, but by the blood of him that shed it* (Numbers 35:33) — why Cain is *cursed from the earth* that received the blood (Genesis 4:11).'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-blood-of-righteous-abel-crieth-from-the-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*This is the spirit which went forth from Abel ... he makes his suit against him till his seed is destroyed* (1 Enoch 22:14) — the cry of Genesis 4:10 given a seed-war shape, running till the wicked seed is cut off.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=22 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-blood-of-righteous-abel-crieth-from-the-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*his blood cried from the ground to heaven, complaining because he had slain him* (Jubilees 4:3) — the restored echo of *thy brother''s blood crieth unto me from the ground* (Genesis 4:10).'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-blood-of-righteous-abel-crieth-from-the-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24) — Abel''s blood cries for justice (Genesis 4:10); the better blood speaks mercy.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-blood-of-righteous-abel-crieth-from-the-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he made him a fugitive on the earth because of the blood of his brother ... it is written on the heavenly tables, "Cursed is he who smites his neighbour treacherously"* (Jubilees 4:4) — the curse of *a fugitive and a vagabond* (Genesis 4:12) grounded in written law.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-mark-and-the-curse-of-the-fugitive-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*you shall be moving and wandering in the earth until the day of your death* (Jasher 1:32) — the restored expansion of *a fugitive and a vagabond shalt thou be in the earth* (Genesis 4:12).'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-mark-and-the-curse-of-the-fugitive-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*his house fell upon him ... for with a stone he had killed Abel, and by a stone was he killed in righteous judgment* (Jubilees 4:31) — the mark of Genesis 4:15 stayed men, not the measure-for-measure end of Cain.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-mark-and-the-curse-of-the-fugitive-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*With the instrument with which a man kills his neighbour with the same shall he be killed* (Jubilees 4:32) — the heavenly-tables decree behind the *sevenfold* vengeance and mark of Genesis 4:15.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-mark-and-the-curse-of-the-fugitive-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he built the city and he called the name of the city Enoch, according to the name of his son* (Jasher 1:35) — the fugitive line of Genesis 4:16-17 settling eastward, building away from the presence it fled.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-the-mark-and-the-curse-of-the-fugitive-cain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38) — the Messiah''s line runs through *another seed instead of Abel* (Genesis 4:25), the seed of promise preserved.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-seth-another-seed-appointed-and-men-called-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him* (Jubilees 4:7) — the restored echo of *another seed instead of Abel* (Genesis 4:25).'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-seth-another-seed-appointed-and-men-called-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He began to call on the name of Yahuah (God) on the earth* (Jubilees 4:12) — the restored Name invoked in the line of Seth, echoing Genesis 4:26.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=26
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-seth-another-seed-appointed-and-men-called-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*she called the name of the first born Cain ... and the name of the other she called Abel* (Jasher 1:13) — the naming frame of Genesis 4:1, read forward to *Seth ... another seed* (4:25), the seed that outlasts slayer and slain.'
  FROM cross_reference_threads t
  JOIN _s301_ge04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s301_ge04_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-4-seth-another-seed-appointed-and-men-called-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_5.sql (Genesis 5) -----
-- Chapter: Genesis 5 (The book of the generations of Adam — the seed-line from Adam to Noah; Enoch translated)
-- Tag: ge05   Temp view: _s301_ge05_lookup
-- Sort band: base 20100, step 3 -> threads at 20100, 20103, 20106, 20109 (4 threads)
-- Source of EVERY row: 'canon','genesis',5,v
--
-- Genesis 5 coverage:
--   v.1-2  ("This is the book of the generations of Adam... in the likeness of Elohim made he him; Male and female created he them")
--        NT:     Luke 3:38 (which was the son of Seth, which was the son of Adam, which was the son of Elohim) — woven into THREAD 1
--        Extras: none warranted as MEMBER (Jubilees 4 retells the line but its distinctive witness is Enoch, carried in THREAD 2)
--        Tanakh: Genesis 1:26-27 (let us make man in our image); 1 Chronicles 1:1-4 (the same Adam-to-Noah line) — THREAD 1
--   v.3   (Adam begat a son in his own likeness, after his image; Seth)
--        NT:     Luke 3:38 (carried at THREAD 1)
--        Extras: none warranted distinct
--        Tanakh: Genesis 1:26 (the image carried down the seed-line) — THREAD 1
--   v.4-20 (the toledot refrain: Seth/Enos/Cainan/Mahalaleel/Jared — begat... and he died)
--        NT:     Romans 5:14 (death reigned from Adam to Moses) — THREAD 3, anchored across the refrain
--        Extras: none warranted (the year-totals are not a distinct framework witness)
--        Tanakh: Genesis 3:19 (dust to dust); Psalm 90:3 (Thou turnest man to destruction) — THREAD 3
--   v.5,8,11,14,17,20,27,31 ("and he died" — the refrain of death reigning)
--        NT:     Romans 5:14 — THREAD 3
--        Extras: none warranted as MEMBER (Jubilees 4:29-30 reflects on Adam's death lacking 70 of 1000 years; recorded, not quoted — apparatus-laced verse)
--        Tanakh: Genesis 3:19; Psalm 90:3 — THREAD 3
--   ★ v.21-24 (Enoch walked with Elohim; he was not, for Elohim took him — translation)
--        NT:     Hebrews 11:5 (by faith Enoch was translated... he pleased Elohim); Jude 14 (Enoch, the seventh from Adam, prophesied) — THREAD 2
--        Extras: 1 Enoch 12:1 (Enoch was hidden, no one knew where he abode); 1 Enoch 12:3 (Enoch the scribe of righteousness, the Watchers called me);
--                Jubilees 4:17 (first to learn writing, set in order the months/Sabbaths — the Appointed Times); Jubilees 4:22 (testified against the Watchers);
--                Jubilees 4:23 (taken into the Garden of Eden in majesty); Ecclesiasticus 44:16 (Enoch pleased Yahuah and was translated);
--                Ecclesiasticus 49:14 (no man created like Enoch; he was taken from the earth) — THREAD 2 (CENTERPIECE, extras-rich)
--        Tanakh: none warranted distinct (the translation is fulfilled FORWARD and OUT) — AVOIDED 1 Enoch ch25 (bad parse)
--   v.25-27 (Methuselah; the longevity; and he died — the longest-lived man dies the year of the flood by reckoning)
--        NT:     none warranted as its own thread (folded into the death refrain, THREAD 3)
--        Extras: none warranted distinct
--        Tanakh: none warranted distinct
--   v.28-29 (Lamech begat a son, called Noah: This same shall comfort us... because of the ground which Yahuah hath cursed)
--        NT:     none warranted (the hope of relief points to Noah/rest within the Tanakh)
--        Extras: Jubilees 4:28 (This one will comfort me... for the ground which Yahuah has cursed) — THREAD 4
--        Tanakh: Genesis 3:17 (cursed is the ground for thy sake) — THREAD 4
--   v.30-32 (Lamech's remaining years; Noah begat Shem, Ham, and Japheth — bridge to the flood)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (genealogical bridge; the seed-line carried at THREAD 1)
--
-- Threads (slug — target libraries):
--   1. genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line — NT (Luke) + Tanakh (Genesis, 1 Chronicles) [free]
--   2. genesis-5-enoch-walked-with-elohim-and-was-translated — NT (Hebrews, Jude) + Extras (1 Enoch, Jubilees, Ecclesiasticus) [extras] (CENTERPIECE)
--   3. genesis-5-and-he-died-death-reigned-from-adam — NT (Romans) + Tanakh (Genesis, Psalm) [free]
--   4. genesis-5-lamech-named-him-noah-comfort-from-the-cursed-ground — Tanakh (Genesis) + Extras (Jubilees) [extras]
--
-- Framing note: Genesis 5 is a genealogy, so the threads are curated, not name-by-name. The image of
-- Elohim runs down the toledot seed-line to the Son of Adam (Luke 3:38); the "and he died" refrain is the
-- wages of sin (Romans 5:14) read back to the ground-curse (Genesis 3:19); Enoch is the single exception
-- that points beyond death — translated, pleasing Elohim, the witness against the Watchers (Hebrews 11:5,
-- Jude 14, 1 Enoch, Jubilees 4, Ecclesiasticus 44/49) — and Lamech's hope names Noah as comfort from the
-- cursed ground. AVOIDED 1 Enoch ch25 (bad parse). Jubilees double-written 'jubilees','jubilees'.

CREATE TEMP VIEW _s301_ge05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the book of the generations of Adam — the image down the seed-line
    ('canon','genesis',5,1,'canon','luke',3,38,'free',
      E'*Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38). *This is the book of the generations of Adam. In the day that Elohim (God) created man, in the likeness of Elohim (God) made he him* (Genesis 5:1). The toledot that opens here — Adam, Seth, Enos, on down — is the very line the Spirit runs forward to the Son of Adam: the same names, in reverse, climbing back through Seth to Adam to *the son of Elohim (God)*. The book of the generations of Adam is the seed-line of promise, and it is running to Messiah.'),
    ('canon','genesis',5,1,'canon','genesis',1,26,'free',
      E'*And Elohim (God) said, Let us make man in our image, after our likeness* (Genesis 1:26). The toledot heading repeats the creation word: *in the likeness of Elohim (God) made he him* (Genesis 5:1). What was spoken at the beginning is now carried as a heading over the seed-line — the image of Elohim is not lost at the fall; it is handed down the generations of Adam.'),
    ('canon','genesis',5,3,'canon','genesis',1,26,'free',
      E'*And Elohim (God) said, Let us make man in our image, after our likeness* (Genesis 1:26). Adam *begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3) — the same words *likeness* and *image* that named the making of man now name the begetting of the son. The image first stamped on Adam is transmitted by paternal bloodline down the line of promise.'),
    ('canon','genesis',5,3,'canon','1-chronicles',1,1,'free',
      E'*Adam, Sheth, Enosh* (1 Chronicles 1:1). The chronicler opens the whole genealogy of Yashar''el (Israel) by reciting the very line of Genesis 5 — *And Adam... begat a son... and called his name Seth* (Genesis 5:3) — Adam, Seth, Enos, on down to Noah. The seed-line of Genesis 5 is the trunk from which the covenant people are later numbered.'),

    -- THREAD 2 (CENTERPIECE): Enoch walked with Elohim and was translated
    ('canon','genesis',5,24,'canon','hebrews',11,5,'free',
      E'*By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The one man in the whole death-chapter who does not die is read forward as the man of faith: he *was not found* because Elohim *translated him*, and the ground of it was that *he pleased Elohim* — the walk of Genesis 5:24 named as the faith that overcomes death.'),
    ('canon','genesis',5,22,'canon','hebrews',11,5,'free',
      E'*By faith Enoch was translated that he should not see death... he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The verse that *Enoch walked with Elohim (God) after he begat Methuselah three hundred years* (Genesis 5:22) is the walk the NT calls faith that *pleased Elohim* — three centuries of walking, then taken.'),
    ('canon','genesis',5,24,'canon','jude',1,14,'free',
      E'*And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 14). The man who *walked with Elohim (God)* and *was not; for Elohim (God) took him* (Genesis 5:24) is named *the seventh from Adam* — counted right down the Genesis 5 line — and remembered as a prophet whose word stood. His walk was not silent; he testified, and Yahuah is coming as he said.'),
    ('canon','genesis',5,24,'enoch','1-enoch',12,1,'extras',
      E'*Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him* (1 Enoch 12:1). This is the inside of *and he was not; for Elohim (God) took him* (Genesis 5:24): not death but hiddenness — none of the children of men could find where he had gone, because he had been taken.'),
    ('canon','genesis',5,24,'enoch','1-enoch',12,3,'extras',
      E'*And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me* (1 Enoch 12:3). The one who *walked with Elohim (God)* (Genesis 5:24) is the scribe of righteousness, set between heaven and the fallen Watchers to carry the word of judgment — the walk was a commission.'),
    ('canon','genesis',5,22,'jubilees','jubilees',4,17,'extras',
      E'*And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book, that men might know the seasons of the years according to the order of their separate months... and set in order the months and recounted the Sabbaths of the years* (Jubilees 4:17). The walk of *Enoch... with Elohim (God)* (Genesis 5:22) included the keeping of the appointed times: he set in order the months and the Sabbaths so men might know the seasons of Yahuah''s calendar.'),
    ('canon','genesis',5,22,'jubilees','jubilees',4,22,'extras',
      E'*And he testified to the Watchers, who had sinned with the daughters of men... and Enoch testified against (them) all* (Jubilees 4:22). To *walk with Elohim (God)* (Genesis 5:22) in a generation of corruption was to bear witness against it; Enoch''s walk made him the witness against the Watchers.'),
    ('canon','genesis',5,24,'jubilees','jubilees',4,23,'extras',
      E'*And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world* (Jubilees 4:23). *And he was not; for Elohim (God) took him* (Genesis 5:24) — taken not into death but into the Garden, in majesty and honour, to keep writing the testimony.'),
    ('canon','genesis',5,24,'apocrypha','ecclesiasticus',44,16,'extras',
      E'*Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16). The same two words the whole tradition hangs on Genesis 5:24 — *pleased* and *translated* — gathered into one line: *for Elohim (God) took him* is read as an example held up to every generation after.'),
    ('canon','genesis',5,24,'apocrypha','ecclesiasticus',49,14,'extras',
      E'*But upon the earth was no man created like Enoch; for he was taken from the earth* (Ecclesiasticus 49:14). In the long roll of the fathers Enoch stands alone — *no man created like* him — because of the single fact of Genesis 5:24: *Elohim (God) took him*, he was taken from the earth.'),

    -- THREAD 3: and he died — death reigned from Adam
    ('canon','genesis',5,5,'canon','romans',5,14,'free',
      E'*Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come* (Romans 5:14). *And all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5). The refrain that tolls through this chapter — *and he died, and he died* — is the reign Sha''ul names: death ruling *from Adam*, the wages of the one transgression passed down the whole line.'),
    ('canon','genesis',5,5,'canon','genesis',3,19,'free',
      E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). The sentence in the garden is paid out in full in this chapter: *and all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5). The dust-return spoken to Adam becomes the refrain over every name in his line.'),
    ('canon','genesis',5,5,'canon','psalms',90,3,'free',
      E'*Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3). Mosheh''s (Moses'') psalm meditates on the very thing Genesis 5 records — man turned back to destruction, the *Return* of dust to dust — the same word of the ground-curse working itself out across the generations: *and he died* (Genesis 5:5).'),

    -- THREAD 4: Lamech named him Noah — comfort from the cursed ground
    ('canon','genesis',5,29,'canon','genesis',3,17,'free',
      E'*And unto Adam he said... cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). Lamech names his son in the hope of relief from exactly this curse: *This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed* (Genesis 5:29). The toil under the cursed ground of the garden is what Noah is born to comfort — the first reaching toward rest from the fall.'),
    ('canon','genesis',5,29,'jubilees','jubilees',4,28,'extras',
      E'*and in this week she bare him a son and he called his name Noah, saying, "This one will comfort me for my trouble and all my work, and for the ground which Yahuah (God) has cursed."* (Jubilees 4:28). The same naming and the same hope are preserved here word for word: Noah named for comfort *for the ground which Yahuah has cursed* — the cry of Genesis 5:29 echoed in the restored witness.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line',
       E'The book of the generations of Adam — the image down the seed-line',
       E'The chapter opens as a heading over all that follows: *This is the book of the generations of Adam. In the day that Elohim (God) created man, in the likeness of Elohim (God) made he him* (Genesis 5:1). The making-word of the beginning — *Let us make man in our image, after our likeness* (Genesis 1:26) — is repeated, and then handed on by begetting: *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3). The image of Elohim is not erased at the fall; it is carried down the seed-line of promise by paternal bloodline. The chronicler later opens the genealogy of the covenant people with this same trunk — *Adam, Sheth, Enosh* (1 Chronicles 1:1) — and the Spirit runs the line all the way forward to its end: *which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38). The book of the generations of Adam is the line that runs to Messiah.',
       sv.verse_id, ev.verse_id, 'free', 20100
  FROM _s301_ge05_lookup sv, _s301_ge05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-5-enoch-walked-with-elohim-and-was-translated',
       E'Enoch walked with Elohim and was translated',
       E'In a chapter where every name ends *and he died*, one man does not: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24) — the seventh from Adam, who *walked with Elohim (God) after he begat Methuselah three hundred years* (Genesis 5:22). The NT reads this as the faith that overcomes death: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). And his walk was not silent — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 14). The restored witnesses unfold the same man. He was the scribe whose translation was hiddenness, not death: *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him* (1 Enoch 12:1); *the Watchers called me—Enoch the scribe* (1 Enoch 12:3). His walk kept the very calendar of Yahuah — *he was the first among men... who wrote down the signs of heaven according to the order of their months... and set in order the months and recounted the Sabbaths of the years* (Jubilees 4:17) — and made him the witness against the fallen ones: *and Enoch testified against (them) all* (Jubilees 4:22). When *Elohim took him* (Genesis 5:24), he was carried into the garden: *we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23). The fathers'' praise gathers it into a word: *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16); *upon the earth was no man created like Enoch; for he was taken from the earth* (Ecclesiasticus 49:14). Enoch is the exception that points the whole death-chapter beyond death.',
       sv.verse_id, ev.verse_id, 'extras', 20103
  FROM _s301_ge05_lookup sv, _s301_ge05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=5 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-5-and-he-died-death-reigned-from-adam',
       E'And he died — death reigned from Adam',
       E'The toledot of Genesis 5 tolls one phrase over every patriarch: *and all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5) — and Seth died, and Enos died, and so down the line. This is the ground-curse paid out in full: *for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). Mosheh''s (Moses'') psalm names the same turning: *Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3). And Sha''ul gathers the whole refrain into a reign: *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come* (Romans 5:14). Death ruling from Adam down the generations is the wages of the one transgression — and Adam''s very name marks him as *the figure of him that was to come*, the last Adam who would break the reign.',
       sv.verse_id, ev.verse_id, 'free', 20106
  FROM _s301_ge05_lookup sv, _s301_ge05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=5 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-5-lamech-named-him-noah-comfort-from-the-cursed-ground',
       E'Lamech named him Noah — comfort from the cursed ground',
       E'Into the long refrain of death comes a single note of hope, and it reaches straight back to the garden. Lamech *called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed* (Genesis 5:29). The ground he names is the ground of Genesis 3: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). Noah is born under the weight of the curse and named for the comfort of relief from it — the first reaching of the seed-line toward rest. The restored witness preserves the naming word for word: *he called his name Noah, saying, "This one will comfort me for my trouble and all my work, and for the ground which Yahuah (God) has cursed."* (Jubilees 4:28). The hope of comfort from the cursed ground is planted in the line that will carry the promise through the flood.',
       sv.verse_id, ev.verse_id, 'extras', 20109
  FROM _s301_ge05_lookup sv, _s301_ge05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=5 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38) — the Genesis 5 line run forward, reverse, to Messiah and the Son of Elohim.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Let us make man in our image, after our likeness* (Genesis 1:26) — the making-word repeated as the toledot heading: *in the likeness of Elohim made he him* (5:1).'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Let us make man in our image, after our likeness* (Genesis 1:26) — the image transmitted by begetting: Adam *begat a son in his own likeness, after his image* (5:3).'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Adam, Sheth, Enosh* (1 Chronicles 1:1) — the chronicler opens the covenant genealogy with the very Genesis 5 trunk.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-the-book-of-the-generations-of-adam-the-image-down-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By faith Enoch was translated that he should not see death... he pleased Elohim (God)* (Hebrews 11:5) — the walk of 5:22 named as the faith that pleased Elohim.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him* (Hebrews 11:5) — *he was not; for Elohim took him* (5:24) read as the faith that overcomes death.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Enoch also, the seventh from Adam, prophesied* (Jude 14) — counted down the Genesis 5 line, his walk remembered as a standing prophecy.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Enoch was hidden, and no one of the children of men knew where he was hidden* (1 Enoch 12:1) — the inside of *he was not; for Elohim took him* (5:24): hiddenness, not death.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the Watchers called me—Enoch the scribe* (1 Enoch 12:3) — the one who walked with Elohim set as scribe of righteousness between heaven and the fallen.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the first among men... who wrote down the signs of heaven according to the order of their months... and set in order the months and... the Sabbaths of the years* (Jubilees 4:17) — the walk of 5:22 kept the appointed times of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*and Enoch testified against (them) all* (Jubilees 4:22) — to walk with Elohim in a corrupt generation was to be the witness against the Watchers.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23) — *Elohim took him* (5:24) into the garden, not into death.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16) — *pleased* and *translated* gathered into one line.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*upon the earth was no man created like Enoch; for he was taken from the earth* (Ecclesiasticus 49:14) — Enoch stands alone in the roll of the fathers, on the single fact of 5:24.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=49 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-enoch-walked-with-elohim-and-was-translated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*death reigned from Adam to Moses... who is the figure of him that was to come* (Romans 5:14) — the *and he died* refrain named as the reign of death from Adam.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-and-he-died-death-reigned-from-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*dust thou art, and unto dust shalt thou return* (Genesis 3:19) — the ground-curse paid out as *and he died* (5:5).'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-and-he-died-death-reigned-from-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3) — Mosheh''s psalm on the same returning to dust that the chapter records.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-and-he-died-death-reigned-from-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17) — the curse Noah is named to comfort (5:29).'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=29
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-lamech-named-him-noah-comfort-from-the-cursed-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he called his name Noah, saying, "This one will comfort me... for the ground which Yahuah (God) has cursed"* (Jubilees 4:28) — the naming of 5:29 preserved word for word.'
  FROM cross_reference_threads t
  JOIN _s301_ge05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=5 AND sv.verse_number=29
  JOIN _s301_ge05_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-5-lamech-named-him-noah-comfort-from-the-cursed-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_6.sql (Genesis 6) -----
-- Chapter: Genesis 6 (The Watcher-rebellion, the Nephilim, the grief of Yahuah, Noah found grace, the ark commanded)
-- Tag: ge06   Temp view: _s301_ge06_lookup
-- Sort band: base 20125, step 3 -> threads at 20125, 20128, 20131, 20134, 20137 (5 threads)
-- Source of EVERY row: 'canon','genesis',6,v
--
-- Genesis 6 coverage:
--   ★★ v.1-4 (the sons of Elohim, the daughters of men, the Nephilim/giants — THE Watcher-rebellion)
--        NT:     Jude 6 (angels which kept not their first estate, reserved in everlasting chains);
--                2 Peter 2:4 (angels that sinned cast down to hell, chains of darkness, reserved unto judgment);
--                1 Peter 3:19 (the spirits in prison, disobedient in the days of Noah)
--        Extras: 1 Enoch 6:1,6:2 (angels lusted after the daughters of men, chose wives); 1 Enoch 7:1,7:2
--                (defiled themselves, taught charms, bare great giants); 1 Enoch 10:11,10:12 (Semjaza bound
--                seventy generations in the valleys until judgment); 1 Enoch 15:8,15:9 (the giants become evil
--                spirits on the earth); Jubilees 5:1 (the angels took wives, bare giants); Jubilees 5:6
--                (bound in the depths of the earth, their sons smitten with the sword)
--                [AVOID 1 Enoch 10:22 run-together/dup parse; ch25 watcher-mislabel]
--        Tanakh: none warranted as MEMBER (the seed-war institution carried forward to NT + out to Enoch/Jubilees)
--   v.3 (My spirit shall not always strive with man; his days an hundred and twenty years)
--        NT:     1 Peter 3:20 (the longsuffering of Elohim waited in the days of Noah, while the ark was a preparing)
--        Extras: Jubilees 5:8 (Your spirit will not always abide on man... their days shall be one hundred and
--                twenty years); Jasher 5:8 (I give you a period of one hundred and twenty years; if you will turn)
--        Tanakh: none warranted
--   v.5-7 (the wickedness of man great; every imagination evil; it repented Yahuah; it grieved him; the flood decreed)
--        NT:     Matthew 24:37,24:38,24:39 (as the days of Noe were, so shall the coming of the Son of Adam be);
--                Luke 17:26,17:27 (as it was in the days of Noe, so shall it be in the days of the Son of Adam)
--        Extras: Jasher 4:7 (they provoked Yahuah with their evil ways... and repented that he had made man)
--        Tanakh: none warranted
--   ★ v.8-9 (Noah found grace; Noah a just man and perfect in his generations, walked with Elohim)
--        NT:     2 Peter 2:5 (saved Noah the eighth person, a preacher of righteousness); Hebrews 11:7 (by faith
--                Noah prepared an ark, became heir of the righteousness which is by faith)
--        Extras: Jubilees 5:19 (no man's person accepted save Noah alone... his heart was righteous in all his ways);
--                Jasher 4:21 (Noah found grace... Yahuah chose him and his children to raise up seed); Jasher 5:13
--                (Noah was a just man, perfect in his generation, chosen to raise up seed of his seed)
--        Tanakh: none warranted
--   v.10 (Noah begat Shem, Ham, and Japheth)
--        NT:     none warranted (the seed-line preservation carried in the Noah thread)
--        Extras: none warranted as MEMBER (covered by Jasher/Jubilees Noah material in the grace thread)
--        Tanakh: none warranted
--   v.11-13 (the earth corrupt and filled with violence; the end of all flesh; I will destroy them with the earth)
--        NT:     none warranted as own thread (the corruption/judgment is carried with the days-of-Noah thread)
--        Extras: none warranted distinct (Jubilees 5:2-3 / Jasher 4:17-18 are near-verbatim retellings, woven by
--                reference into the Watcher and days-of-Noah threads, not double-added)
--        Tanakh: none warranted
--   v.14-22 (the ark commanded — gopher wood, pitch, dimensions; the first covenant 6:18; two of every sort)
--        NT:     1 Peter 3:21 (the like figure whereunto even baptism doth also now save us... by the resurrection)
--        Extras: Wisdom of Solomon 10:4 (the earth drowned with the flood, wisdom preserved the righteous in a
--                piece of wood of small value); Wisdom of Solomon 14:6 (when the proud giants perished, the hope
--                of the world escaped in a weak vessel, and left a seed of generation)
--        Tanakh: none warranted (the covenant 6:18 — first use of "covenant" in the Tanakh — noted in summary)
--
-- Threads (slug -> target libraries):
--   genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound        [NT+Extras]  tier extras  ★★ CENTERPIECE
--   genesis-6-my-spirit-shall-not-always-strive-the-hundred-and-twenty-years [NT+Extras] tier extras
--   genesis-6-the-wickedness-of-man-and-the-days-of-noah                     [NT+Extras]  tier extras
--   genesis-6-noah-found-grace-just-and-perfect-in-his-generations           [NT+Extras]  tier extras  ★
--   genesis-6-the-ark-the-first-covenant-and-the-water-that-saves            [NT+Extras]  tier extras
--
-- Framework-load-bearing notes:
--   ★★ v.1-4 WATCHER-REBELLION: read as the COSMIC dimension of the seed-war instituted in Genesis 3:15 —
--     not a euphemism for "Sethites marrying Cainites," but the literal descent of the fallen Watchers who
--     corrupted the seed and bred the Nephilim (the tares woven in at the Genesis-6 origin). The extras are
--     LOAD-BEARING, not decorative: 1 Enoch 6-15 is the primary witness (two hundred angels under Shemyaza
--     descend on Hermon, take wives, beget giants, teach forbidden arts, the giants devour and the earth cries
--     out, the Watchers bound in the valleys until the great judgement; the giants' spirits become the evil
--     spirits on the earth). The NT confirms it as historical fact, not myth: Jude 6 and 2 Peter 2:4 set the
--     bound angels right beside Noah's flood and Sodom; 1 Peter 3:19-20 places "the spirits in prison" in the
--     days of Noah. The whole thread is tier 'extras' and is the heaviest weave in the chapter. 1 Enoch 10:22
--     (run-together/duplicated parse) and 1 Enoch ch25 (watcher-mislabel) are AVOIDED.
--   v.9 "perfect in his generations": read as the SEED-LINE kept uncorrupted by the Watcher-mixing — Noah's
--     paternal bloodline preserved pure (tamim in his generations) so the seed of promise could carry through
--     the flood. Tied to Jasher's repeated "chose him... to raise up seed of his seed" and Jubilees' "his
--     person was accepted in behalf of his sons." This is the seed-war preservation, not a generic moral praise.
--   v.18 "with thee will I establish my covenant": the FIRST use of "covenant" (berith) in the Tanakh — the
--     ark-deliverance is covenant deliverance; noted in the ark-thread summary, the type fulfilled in 1 Peter
--     3:21 where the water that drowned the world saves through the resurrection (baptism as covenant-figure).
--   Christology: v.3 "My spirit shall not always strive" and the grieving of Yahuah are framed as the
--     long-suffering of the covenant Yahuah, not a co-equal-persons Spirit; no Trinitarian grammar imported.

CREATE TEMP VIEW _s301_ge06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== cross_references ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★ CENTERPIECE): the sons of Elohim, the Nephilim, the Watchers bound
    ('canon','genesis',6,2,'enoch','1-enoch',6,1,'extras',
      E'*And it came to pass when the children of men had multiplied that in those days were born unto them beautiful and comely daughters* (1 Enoch 6:1). The restored witness opens exactly where Genesis 6 does — *when men began to multiply on the face of the earth, and daughters were born unto them* (Genesis 6:1) — and then names what the Torah states in compressed form: the *sons of Elohim (God)* who *saw the daughters of men that they were fair* (6:2) are the angels of heaven. The same multiplying, the same daughters, the same lust: this is the Watcher-rebellion in full.'),
    ('canon','genesis',6,2,'enoch','1-enoch',6,2,'extras',
      E'*And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children''* (1 Enoch 6:2). This is the unfolding of *the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). The *sons of Elohim* are *the angels, the children of the heaven* — the heavenly ones who left their estate to take earthly wives, the corruption of the seed begun.'),
    ('canon','genesis',6,4,'enoch','1-enoch',7,1,'extras',
      E'*And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants* (1 Enoch 7:1). Genesis 6:4 records only that the sons of Elohim *came in unto the daughters of men, and they bare children to them*; the witness fills in the defilement and the forbidden arts taught — the Watchers did not only mix the seed, they corrupted knowledge itself, the rebellion spreading by teaching.'),
    ('canon','genesis',6,4,'enoch','1-enoch',7,2,'extras',
      E'*And they became pregnant, and they bare great giants, whose height was three thousand ells* (1 Enoch 7:2). *There were giants in the earth in those days... the same became mighty men which were of old, men of renown* (Genesis 6:4). The *giants* — the Nephilim — are the offspring of the heaven-earth mixing, the *great giants* born of the Watchers and the daughters of men: the tares bred into the field at the Genesis-6 origin.'),
    ('canon','genesis',6,4,'enoch','1-enoch',15,8,'extras',
      E'*As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* (1 Enoch 15:8). The *mighty men which were of old, men of renown* (Genesis 6:4) leave a residue after the flesh perishes: the witness teaches that the spirits of these giants remain on the earth — the corruption of the Watcher-mixing outlasting its bodies, the unclean spirits loosed in the world.'),
    ('canon','genesis',6,4,'enoch','1-enoch',15,9,'extras',
      E'*And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble: they take no food, but nevertheless hunger and thirst, and cause offences* (1 Enoch 15:9). The *men of renown* of Genesis 6:4 become, in their spirits, the afflicting powers — the demonic legacy of the Nephilim, the seed-war''s cosmic front continuing to *work destruction on the earth* long after the giants'' flesh has fallen.'),
    ('canon','genesis',6,4,'canon','jude',1,6,'free',
      E'*And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 6). The *sons of Elohim (God)* who *came in unto the daughters of men* (Genesis 6:4) are named by the apostle as *angels which kept not their first estate* — they *left their own habitation*, exactly the descent of the Watchers, and are now *reserved in everlasting chains* for the great-day judgement. The Torah''s compressed verse and the apostolic witness agree.'),
    ('canon','genesis',6,4,'canon','2-peter',2,4,'free',
      E'*For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Kepha sets *the angels that sinned* — the sons of Elohim of Genesis 6:4 — immediately beside the flood and Sodom, treating the Watcher-rebellion as historical fact: they were *cast down to hell* and *delivered into chains of darkness*, the binding that 1 Enoch describes, awaiting judgement.'),
    ('canon','genesis',6,4,'enoch','1-enoch',10,11,'extras',
      E'*And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness''* (1 Enoch 10:11). The binding the apostles report (*everlasting chains*, Jude 6; *chains of darkness*, 2 Peter 2:4) is commanded here by name: *Semjâzâ and his associates who have united themselves with women* — the very *sons of Elohim (God)* who *came in unto the daughters of men* (Genesis 6:4) — are bound for their uncleanness.'),
    ('canon','genesis',6,4,'enoch','1-enoch',10,12,'extras',
      E'*And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated* (1 Enoch 10:12). This is the sentence behind *reserved... unto the judgment of the great day* (Jude 6): the Watchers of Genesis 6:4 *bound fast for seventy generations in the valleys of the earth*, their giant-sons made to slay one another, all held *till the day of their judgement*.'),
    ('canon','genesis',6,2,'jubilees','jubilees',5,1,'extras',
      E'*And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1). Jubilees reads Genesis 6:2 with no ambiguity: *the sons of Elohim (God)* are *the angels of Elohim*, and their offspring are *giants* — one continuous testimony with the Torah and with 1 Enoch that this was the heavenly rebellion, not a marriage of two human families.'),
    ('canon','genesis',6,4,'jubilees','jubilees',5,6,'extras',
      E'*And against the angels whom He had sent upon the earth, He was exceedingly wroth, and He gave commandment to root them out of all their dominion, and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate. And against their sons went forth a command from before His face that they should be smitten with the sword, and be removed from under heaven* (Jubilees 5:6). The fate of the *sons of Elohim (God)* of Genesis 6:4 is sealed: the rebel angels *bound in the depths of the earth* and their giant *sons... smitten with the sword* — the same binding Jude 6 and 2 Peter 2:4 confirm, the seed-corruption purged from the earth.'),
    ('canon','genesis',6,4,'canon','1-peter',3,19,'free',
      E'*By which also he went and preached unto the spirits in prison* (1 Peter 3:19). The *spirits in prison* whom Messiah proclaimed to are, in the very next verse, those *disobedient... in the days of Noah* — the bound powers of the Genesis 6:4 rebellion. The Torah''s *sons of Elohim (God)* who *came in unto the daughters of men*, bound in chains until judgement, are the *spirits in prison* the risen One confronts.'),

    -- THREAD 2: My spirit shall not always strive — the hundred and twenty years
    ('canon','genesis',6,3,'canon','1-peter',3,20,'free',
      E'*Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20). *My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3) is the limit set on the long-suffering: the *hundred and twenty years* are the span in which *the longsuffering of Elohim (God) waited... while the ark was a preparing*, the door of mercy held open before the flood.'),
    ('canon','genesis',6,3,'jubilees','jubilees',5,8,'extras',
      E'*And He said “Your spirit will not always abide on man; for they also are flesh and their days shall be one hundred and twenty years”* (Jubilees 5:8). The restored book carries Genesis 6:3 almost word for word — *My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* — the same decree of the limited span, the long-suffering measured out before the judgement falls.'),
    ('canon','genesis',6,3,'jasher','jasher',5,8,'extras',
      E'*For thus says Yahuah (the Lord), Behold I give you a period of one hundred and twenty years; if you will turn to me and forsake your evil ways, then will I also turn away from the evil which I told you, and it shall not exist, says Yahuah (the Lord)* (Jasher 5:8). Jasher reads the *hundred and twenty years* of Genesis 6:3 as Yahuah''s open offer of repentance, not a bare death-clock: the span is *given* so that *if you will turn... forsake your evil ways*, the threatened destruction *shall not exist* — the long-suffering with a door in it.'),

    -- THREAD 3: the wickedness of man and the days of Noah
    ('canon','genesis',6,5,'canon','matthew',24,37,'free',
      E'*But as the days of Noe were, so shall also the coming of the Son of Adam be* (Matthew 24:37). *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5). Yahusha (Jesus) makes that pre-flood corruption the very pattern of the last days: *as the days of Noe were* — the same heedless wickedness — *so shall also the coming of the Son of Adam be*.'),
    ('canon','genesis',6,7,'canon','matthew',24,38,'free',
      E'*For as in the days that were before the flood they were eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38). When Yahuah resolved *I will destroy man whom I have created from the face of the earth* (Genesis 6:7), the world ate and drank in ignorance to the very day. The Son of Adam names that ignorance — *eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* — as the mark of his own coming.'),
    ('canon','genesis',6,7,'canon','matthew',24,39,'free',
      E'*And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39). The decree *I will destroy man... both man, and beast, and the creeping thing, and the fowls of the air* (Genesis 6:7) fell on a world that *knew not until the flood came*. The judgement of Noah''s day is the template: sudden, total, upon the unready — *so shall also the coming of the Son of Adam be*.'),
    ('canon','genesis',6,5,'canon','luke',17,26,'free',
      E'*And as it was in the days of Noe, so shall it be also in the days of the Son of Adam* (Luke 17:26). *And GOD saw that the wickedness of man was great in the earth* (Genesis 6:5) sets the days of Noe as the figure; Yahusha (Jesus) binds them to his return — *so shall it be also in the days of the Son of Adam* — the same overflowing wickedness met by the same sudden reckoning.'),
    ('canon','genesis',6,7,'canon','luke',17,27,'free',
      E'*They did eat, they drank, they married wives, they were given in marriage, until the day that Noe entered into the ark, and the flood came, and destroyed them all* (Luke 17:27). The sentence *it repenteth me that I have made them* (Genesis 6:7) was carried out *until the day that Noe entered into the ark, and the flood came, and destroyed them all* — the heedless ordinary life of the condemned world, ended in a day.'),
    ('canon','genesis',6,6,'jasher','jasher',4,7,'extras',
      E'*And still the sons of men did not turn from their evil ways, and their hands were still extended to do evil in the sight of Elohim, and they provoked Yahuah (the Lord) with their evil ways, and Yahuah (the Lord) was very wroth, and repented that he had made man* (Jasher 4:7). Jasher echoes *it repented Yahuah (LORD) that he had made man on the earth, and it grieved him at his heart* (Genesis 6:6), naming the cause the Torah leaves implicit: men *would not turn from their evil ways*, and so *provoked Yahuah... and repented that he had made man* — the grief is over a world that refused the long-suffering.'),

    -- THREAD 4 (★): Noah found grace — just and perfect in his generations
    ('canon','genesis',6,8,'canon','2-peter',2,5,'free',
      E'*And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly* (2 Peter 2:5). *But Noah found grace in the eyes of Yahuah (LORD)* (Genesis 6:8). Kepha names what that grace made him — *a preacher of righteousness* — and sets him as the one Yahuah *saved* while he *spared not the old world*: grace received and grace proclaimed, the righteous remnant of one in a drowning generation.'),
    ('canon','genesis',6,9,'canon','hebrews',11,7,'free',
      E'*By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). *Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* (Genesis 6:9). His walking with Elohim is read as faith made visible: *by faith Noah... prepared an ark* — the just man''s righteousness and the obedience of building are one, condemning the world and inheriting the righteousness of faith.'),
    ('canon','genesis',6,9,'jubilees','jubilees',5,19,'extras',
      E'*And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways, according as it was commanded regarding him, and he had not departed from aught that was ordained for him* (Jubilees 5:19). *Noah was a just man and perfect in his generations* (Genesis 6:9) is unfolded: his person *accepted in behalf of his sons*, his heart *righteous in all his ways* because *he had not departed from aught that was ordained for him* — the seed-line preserved through the one man who kept the way uncorrupted.'),
    ('canon','genesis',6,8,'jasher','jasher',4,21,'extras',
      E'*And Noah found grace in the sight of Yahuah (the Lord), and Yahuah (the Lord) chose him and his children to raise up seed from them upon the face of the whole earth* (Jasher 4:21). Jasher carries Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD)* — and names the purpose of the grace: Yahuah *chose him and his children to raise up seed* upon the earth. The grace is seed-grace, the paternal line kept to carry the promise through the flood.'),
    ('canon','genesis',6,9,'jasher','jasher',5,13,'extras',
      E'*And Noah was a just man, he was perfect in his generation, and Yahuah (the Lord) chose him to raise up seed from his seed upon the face of the earth* (Jasher 5:13). Almost verbatim with Genesis 6:9 — *Noah was a just man and perfect in his generations* — Jasher binds the *perfect in his generation* directly to the seed: *chose him to raise up seed from his seed*. Noah''s being uncorrupted in his line is precisely why the seed of promise could pass through him while the Watcher-mixed flesh was swept away.'),

    -- THREAD 5: the ark, the first covenant, and the water that saves
    ('canon','genesis',6,18,'canon','1-peter',3,21,'free',
      E'*The like figure whereunto even baptism doth also now save us (not the putting away of the filth of the flesh, but the answer of a good conscience toward Elohim (God),) by the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:21). *But with thee will I establish my covenant; and thou shalt come into the ark* (Genesis 6:18) — the first covenant in the Tanakh joined to the ark of deliverance. Kepha reads the very water that drowned the world as the figure of the water that now saves: the ark passing through the flood is the covenant-figure fulfilled in the resurrection.'),
    ('canon','genesis',6,14,'apocrypha','the-wisdom-of-solomon',10,4,'extras',
      E'*For whose cause the earth being drowned with the flood, wisdom again preserved it, and directed the course of the righteous in a piece of wood of small value* (Wisdom of Solomon 10:4). The command *Make thee an ark of gopher wood... and shalt pitch it within and without with pitch* (Genesis 6:14) is read as wisdom''s work of preservation: the righteous steered through the drowning of the earth *in a piece of wood of small value* — the humble ark as the vessel of deliverance through judgement.'),
    ('canon','genesis',6,17,'apocrypha','the-wisdom-of-solomon',14,6,'extras',
      E'*For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation* (Wisdom of Solomon 14:6). *I, even I, do bring a flood of waters upon the earth, to destroy all flesh* (Genesis 6:17) — and in that flood *the proud giants perished*, the Nephilim swept away, while *the hope of the world... escaped in a weak vessel*. The ark that carried Noah *left to all ages a seed of generation*: the seed of promise preserved as the corrupted seed of the Watchers was destroyed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== threads ==============================
-- THREAD 1 (★★ CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound',
       E'The sons of Elohim, the Nephilim, and the Watchers bound',
       E'Here the seed-war declared in the garden (Genesis 3:15) opens its cosmic front. *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *There were giants in the earth in those days... the same became mighty men which were of old, men of renown* (Genesis 6:4). The Torah states it in compressed form; the restored witnesses unfold it. *And the angels, the children of the heaven, saw and lusted after them, and said to one another: “Come, let us choose us wives from among the children of men and beget us children”* (1 Enoch 6:2) — two hundred of them descend on Hermon under Shemyaza. They *taught them charms and enchantments* (1 Enoch 7:1) and *they bare great giants* (1 Enoch 7:2), the Nephilim, who *consumed all the acquisitions of men* and devoured mankind until *the earth laid accusation against the lawless ones*. Jubilees reads Genesis 6:2 the same way with no ambiguity: *the angels of Elohim (God) saw them... and they bare to them sons and they were giants* (Jubilees 5:1). This is not a marriage of two human families; it is the heavenly rebellion that corrupted the seed — the tares woven into the field at the Genesis-6 origin. And the judgement on the rebels is precise: *Go, bind Semjâzâ and his associates who have united themselves with women* (1 Enoch 10:11), *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12); *He bade us to bind them in the depths of the earth... and their sons... smitten with the sword* (Jubilees 5:6). The apostles confirm every line as fact, not myth: *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 6); *Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4) — set there beside the flood and Sodom. Even the giants'' residue is named: *the spirits of the giants afflict, oppress, destroy... and cause trouble* (1 Enoch 15:9), the spirits *of the earth* dwelling *on the earth* (1 Enoch 15:8). And the risen One confronts them: *By which also he went and preached unto the spirits in prison* (1 Peter 3:19), *disobedient... in the days of Noah*. The Watcher-rebellion is the seed-war gone cosmic — and it is bound, awaiting the great-day judgement.',
       sv.verse_id, ev.verse_id, 'extras', 20125
  FROM _s301_ge06_lookup sv, _s301_ge06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-6-my-spirit-shall-not-always-strive-the-hundred-and-twenty-years',
       E'My spirit shall not always strive — the hundred and twenty years',
       E'Before the flood Yahuah sets a limit, and the limit is mercy. *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3). The restored book carries it almost word for word: *Your spirit will not always abide on man; for they also are flesh and their days shall be one hundred and twenty years* (Jubilees 5:8). Jasher hears the same decree as an open offer of repentance, not a bare death-clock: *Behold I give you a period of one hundred and twenty years; if you will turn to me and forsake your evil ways, then will I also turn away from the evil which I told you, and it shall not exist* (Jasher 5:8) — the span is a door held open. And the New Testament names exactly that long-suffering: *when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20). The hundred and twenty years are the years the ark was building and the patience of Yahuah waiting — judgement announced, but withheld while the door stood open.',
       sv.verse_id, ev.verse_id, 'extras', 20128
  FROM _s301_ge06_lookup sv, _s301_ge06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-6-the-wickedness-of-man-and-the-days-of-noah',
       E'The wickedness of man and the days of Noah',
       E'The corruption is total and the grief is real. *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5); *And it repented Yahuah (LORD) that he had made man on the earth, and it grieved him at his heart* (Genesis 6:6); *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth* (Genesis 6:7). Jasher names the cause the Torah leaves implicit: men *would not turn from their evil ways... and they provoked Yahuah (the Lord) with their evil ways, and Yahuah... repented that he had made man* (Jasher 4:7) — the grief is over a world that refused the long-suffering. And Yahusha (Jesus) makes that pre-flood world the very pattern of his return. *But as the days of Noe were, so shall also the coming of the Son of Adam be* (Matthew 24:37); *For as in the days that were before the flood they were eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38), *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39). Luke says it twice over: *as it was in the days of Noe, so shall it be also in the days of the Son of Adam* (Luke 17:26), *until the day that Noe entered into the ark, and the flood came, and destroyed them all* (Luke 17:27). The wickedness of Genesis 6 is not a closed chapter; it is the figure of the last generation, and the reckoning is the same — sudden, total, upon the unready.',
       sv.verse_id, ev.verse_id, 'extras', 20131
  FROM _s301_ge06_lookup sv, _s301_ge06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-6-noah-found-grace-just-and-perfect-in-his-generations',
       E'Noah found grace — just and perfect in his generations',
       E'Against a drowning generation, one man is kept. *But Noah found grace in the eyes of Yahuah (LORD)* (Genesis 6:8); *Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* (Genesis 6:9). The grace and the righteousness belong together: Kepha names him *a preacher of righteousness* whom Yahuah *saved* while he *spared not the old world* (2 Peter 2:5), and the letter to the Hebrews reads his walking with Elohim as faith made visible — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). "Perfect in his generations" is the seed-line kept uncorrupted by the Watcher-mixing: Jubilees says *no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons... for his heart was righteous in all his ways* (Jubilees 5:19), and Jasher twice ties his uncorrupted line straight to the seed — *Noah found grace in the sight of Yahuah (the Lord), and Yahuah... chose him and his children to raise up seed* (Jasher 4:21); *Noah was a just man, he was perfect in his generation, and Yahuah (the Lord) chose him to raise up seed from his seed upon the face of the earth* (Jasher 5:13). The grace is seed-grace: the paternal bloodline of promise kept pure through the one man who had not departed from the way, so the seed could pass through the flood while the corrupted flesh was swept away.',
       sv.verse_id, ev.verse_id, 'extras', 20134
  FROM _s301_ge06_lookup sv, _s301_ge06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-6-the-ark-the-first-covenant-and-the-water-that-saves',
       E'The ark, the first covenant, and the water that saves',
       E'The deliverance is built, and it is built on a covenant. *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch* (Genesis 6:14), *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh* (Genesis 6:17), *But with thee will I establish my covenant; and thou shalt come into the ark* (Genesis 6:18) — the first use of "covenant" in the whole Tanakh, joined to the vessel of salvation. The restored wisdom reads the ark as wisdom''s own preserving work: *the earth being drowned with the flood, wisdom again preserved it, and directed the course of the righteous in a piece of wood of small value* (Wisdom of Solomon 10:4); and it ties the ark directly to the destruction of the corrupted seed — *when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation* (Wisdom of Solomon 14:6). The same waters that swept away the Nephilim-mixed world bore the seed of promise through. And the New Testament names the figure: *The like figure whereunto even baptism doth also now save us (not the putting away of the filth of the flesh, but the answer of a good conscience toward Elohim (God),) by the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:21). The covenant-ark passing through the flood is the figure fulfilled — deliverance through the water of judgement, by the resurrection.',
       sv.verse_id, ev.verse_id, 'extras', 20137
  FROM _s301_ge06_lookup sv, _s301_ge06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=6 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ============================== thread_members ==============================
-- THREAD 1 members (★★ centerpiece)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*there were born unto them beautiful and comely daughters* (1 Enoch 6:1) — the witness opens exactly at Genesis 6:1, the multiplying and the daughters the angels lusted after.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the angels, the children of the heaven, saw and lusted after them* (1 Enoch 6:2) — the *sons of Elohim* of Genesis 6:2 named as the angels of heaven who took earthly wives.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they taught them charms and enchantments, and the cutting of roots* (1 Enoch 7:1) — the Watchers corrupted knowledge as well as the seed, the rebellion spreading by teaching.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they bare great giants* (1 Enoch 7:2) — the *giants* of Genesis 6:4 named as the offspring of the heaven-earth mixing, the tares bred into the field.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the angels which kept not their first estate... reserved in everlasting chains* (Jude 6) — the apostle confirms the Genesis 6:4 sons of Elohim as fallen angels, bound for judgement.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the angels that sinned... cast them down to hell, and delivered them into chains of darkness* (2 Peter 2:4) — the Watcher-rebellion treated as historical fact, set beside the flood and Sodom.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*By which also he went and preached unto the spirits in prison* (1 Peter 3:19) — the risen One confronts the bound spirits disobedient in the days of Noah, the powers of the Genesis 6 rebellion.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*bind Semjâzâ and his associates who have united themselves with women* (1 Enoch 10:11) — the chains of Jude 6 and 2 Peter 2:4 commanded by name on the Watchers of Genesis 6:4.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12) — the sentence behind *the judgment of the great day* (Jude 6).'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*the angels of Elohim (God) saw them... and they bare to them sons and they were giants* (Jubilees 5:1) — Genesis 6:2 read with no ambiguity: the sons of Elohim are the angels, their offspring the giants.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*He bade us to bind them in the depths of the earth... and their sons... smitten with the sword* (Jubilees 5:6) — the rebel angels bound and the giant-sons purged, the seed-corruption swept from the earth.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'*as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* (1 Enoch 15:8) — the residue of the *men of renown* (Genesis 6:4): the giants'' spirits left dwelling on the earth.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 13, E'*the spirits of the giants afflict, oppress, destroy... and cause trouble* (1 Enoch 15:9) — the demonic legacy of the Nephilim, the seed-war''s cosmic front continuing after the flesh has fallen.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-sons-of-elohim-the-nephilim-and-the-watchers-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing* (1 Peter 3:20) — the hundred and twenty years of Genesis 6:3 are the years of the waiting patience.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-my-spirit-shall-not-always-strive-the-hundred-and-twenty-years'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*their days shall be one hundred and twenty years* (Jubilees 5:8) — the restored book carries Genesis 6:3 almost word for word.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-my-spirit-shall-not-always-strive-the-hundred-and-twenty-years'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I give you a period of one hundred and twenty years; if you will turn to me... it shall not exist* (Jasher 5:8) — the span read as an open offer of repentance, the long-suffering with a door in it.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-my-spirit-shall-not-always-strive-the-hundred-and-twenty-years'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*as the days of Noe were, so shall also the coming of the Son of Adam be* (Matthew 24:37) — the wickedness of Genesis 6:5 made the figure of the last generation.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-wickedness-of-man-and-the-days-of-noah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38) — the heedless world the decree of Genesis 6:7 fell upon.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-wickedness-of-man-and-the-days-of-noah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*knew not until the flood came, and took them all away* (Matthew 24:39) — the judgement of Genesis 6:7: sudden, total, upon the unready.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-wickedness-of-man-and-the-days-of-noah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*as it was in the days of Noe, so shall it be also in the days of the Son of Adam* (Luke 17:26) — Genesis 6:5''s overflowing wickedness bound to the return.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-wickedness-of-man-and-the-days-of-noah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*until the day that Noe entered into the ark, and the flood came, and destroyed them all* (Luke 17:27) — the sentence *it repenteth me that I have made them* (Genesis 6:7) carried out in a day.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=17 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-wickedness-of-man-and-the-days-of-noah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they provoked Yahuah (the Lord) with their evil ways... and repented that he had made man* (Jasher 4:7) — names the cause of the grief of Genesis 6:6: a world that refused the long-suffering.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-wickedness-of-man-and-the-days-of-noah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*saved Noah the eighth person, a preacher of righteousness* (2 Peter 2:5) — the grace of Genesis 6:8 made Noah a preacher of righteousness, saved while the old world was not spared.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-noah-found-grace-just-and-perfect-in-his-generations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith Noah... prepared an ark to the saving of his house* (Hebrews 11:7) — Noah''s walking with Elohim (Genesis 6:9) read as faith made visible, heir of the righteousness which is by faith.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-noah-found-grace-just-and-perfect-in-his-generations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*no man''s person was accepted save that of Noah alone... for his heart was righteous in all his ways* (Jubilees 5:19) — *perfect in his generations* (Genesis 6:9) unfolded: the one man who had not departed from the way.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-noah-found-grace-just-and-perfect-in-his-generations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (the Lord) chose him and his children to raise up seed* (Jasher 4:21) — the grace of Genesis 6:8 is seed-grace: the paternal line kept to carry the promise through the flood.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=4 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-noah-found-grace-just-and-perfect-in-his-generations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*perfect in his generation, and Yahuah (the Lord) chose him to raise up seed from his seed* (Jasher 5:13) — Noah''s uncorrupted line tied straight to the seed of promise, why it could pass through the flood.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=5 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-noah-found-grace-just-and-perfect-in-his-generations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*even baptism doth also now save us... by the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:21) — the covenant-ark of Genesis 6:18 passing through the flood, the figure fulfilled in the resurrection.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=18
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-ark-the-first-covenant-and-the-water-that-saves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*wisdom again preserved it, and directed the course of the righteous in a piece of wood of small value* (Wisdom of Solomon 10:4) — the gopher-wood ark of Genesis 6:14 as the humble vessel of deliverance through judgement.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-ark-the-first-covenant-and-the-water-that-saves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*when the proud giants perished, the hope of the world... escaped in a weak vessel, and left to all ages a seed of generation* (Wisdom of Solomon 14:6) — the flood of Genesis 6:17 sweeps away the Nephilim and bears the seed of promise through.'
  FROM cross_reference_threads t
  JOIN _s301_ge06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s301_ge06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-6-the-ark-the-first-covenant-and-the-water-that-saves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_7.sql (Genesis 7) -----
-- Chapter: Genesis 7 (Noah and all flesh enter the ark; the clean and unclean by sevens; the
--          fountains of the deep and the windows of heaven broken up; Yahuah shut him in; all flesh died)
-- Tag: ge07   Temp view: _s301_ge07_lookup
-- Sort band: base 20150, step 3 -> threads at 20150, 20153, 20156, 20159 (4 threads)
-- Source of EVERY row: 'canon','genesis',7,v
--
-- Genesis 7 coverage:
--   v.1 (Come thou and all thy house into the ark; thee have I seen righteous before me in this generation)
--        NT:     carried in the "Noah entered / Yahuah shut him in" thread (Heb 11:7, 1 Pet 3:20)
--        Extras: Jubilees 5:19 (no man's person accepted save Noah; saved his sons on his account) — placed in the all-flesh-died thread
--        Tanakh: none warranted as own member (righteousness named again at v.21-23 -> Ezek 14:14)
--   ★ v.2-3 (of every clean beast by sevens, male and female; of beasts not clean by two; fowls by sevens, to keep seed alive)
--        NT:     none warranted (the dietary categories are LAW; Acts 10/Mark 7 are the Christianized-abolition misread, deliberately NOT pulled)
--        Extras: Jasher 6:9 (from the clean animals and clean fowls he brought seven couples, as Elohim had commanded)
--        Tanakh: LEVITICUS 11 (the dietary law NAMED, not invented — the clean/unclean Noah already knew): Lev 11:2,11:3,11:8,11:46,11:47
--   v.4 (yet seven days, and I will cause it to rain forty days and forty nights; destroy every living substance)
--        NT:     none warranted (woven by reference into the fountains-of-the-deep thread)
--        Extras: none warranted distinct (Jasher 6:10 the seven-day delay; quoted by reference in summary)
--        Tanakh: none warranted
--   v.5 (Noah did according unto all that Yahuah commanded him)
--        NT:     Hebrews 11:7 (by faith Noah... prepared an ark to the saving of his house) — placed in the entered/shut-in thread
--        Extras: none warranted
--        Tanakh: none warranted
--   v.6-7 (Noah six hundred years old when the flood was upon the earth; Noah went in, his sons, wife, sons' wives)
--        NT:     none warranted as own thread
--        Extras: none warranted distinct
--        Tanakh: none warranted
--   ★ v.8 (of clean beasts, and of beasts not clean, and of fowls, and of every thing that creepeth) — restates the clean/unclean distinction
--        NT:     none warranted
--        Extras: Jasher 6:9 (covered at v.2-3)
--        Tanakh: LEVITICUS 11:47 (to make a difference between the unclean and the clean) — placed in the by-sevens thread
--   v.9 (there went in two and two unto Noah into the ark, male and female, as Elohim had commanded Noah)
--        NT:     none warranted
--        Extras: none warranted distinct (the pairs; the sevens carry the load)
--        Tanakh: none warranted
--   v.10 (after seven days, the waters of the flood were upon the earth)
--        NT:     none warranted
--        Extras: none warranted distinct
--        Tanakh: none warranted
--   ★ v.11-12 (in the six hundredth year... the same day were all the fountains of the great deep broken up, and the windows of heaven were opened; rain forty days and forty nights) — THE UN-CREATION
--        NT:     Matthew 24:38,24:39 (until the day Noe entered... and knew not until the flood came, and took them all away);
--                Luke 17:27 (the flood came, and destroyed them all); 2 Peter 3:6 (the world that then was, being overflowed with water, perished)
--        Extras: Jubilees 5:23 (Yahuah opened seven flood-gates of heaven and the mouths of the great deep, seven mouths in number);
--                Jasher 6:14 (all the fountains of the deep were broken up, and the windows of heaven were opened, rain forty days and forty nights)
--        Tanakh: Isaiah 24:18 (the windows from on high are open, and the foundations of the earth do shake) — the latter-day un-creation echoing the flood
--   ★ v.13,16 (in the selfsame day entered Noah, Shem, Ham, Japheth... and Yahuah shut him in) — THE DOOR SHUT, THE DELIVERANCE SEALED
--        NT:     1 Peter 3:20 (the longsuffering waited in the days of Noah... eight souls saved by water);
--                Hebrews 11:7 (by faith Noah prepared an ark to the saving of his house)
--        Extras: Jubilees 5:23 (Yahuah God closed it from without on the seventeenth evening);
--                Jasher 6:15 (Noah and his household came into the ark... and Yahuah shut him in)
--        Tanakh: none warranted (the ark-of-safety figure carried forward to NT + out to Jubilees/Jasher)
--   v.14-15,17-20 (every beast after his kind entered; the waters prevailed, the ark lifted up; fifteen cubits; the mountains covered)
--        NT:     none warranted distinct
--        Extras: none warranted distinct (Jubilees 5:23 fifteen cubits / ark lifted up — quoted by reference)
--        Tanakh: none warranted
--   ★ v.21-23 (all flesh died... every man; Noah only remained alive, and they that were with him in the ark) — THE JUDGMENT UNIVERSAL
--        NT:     2 Peter 3:6 (the world that then was, being overflowed with water, perished) — placed in fountains thread; here Matthew 24:39 (took them all away)
--        Extras: Jubilees 5:19 (no man's person accepted save Noah alone); Jasher 6:26 (all flesh that was upon the earth died... there only remained Noah and those with him in the ark)
--        Tanakh: Ezekiel 14:14 (Noah, Daniel, and Job... deliver but their own souls by their righteousness); Isaiah 54:9 (the waters of Noah... should no more go over the earth)
--   v.24 (the waters prevailed upon the earth an hundred and fifty days)
--        NT:     none warranted
--        Extras: Jubilees 5:23 (the water prevailed... one hundred and fifty days) — quoted by reference in summary
--        Tanakh: none warranted
--
-- Threads (slug -> target libraries):
--   genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai   [Tanakh+Extras]  tier extras  ★ creational, pre-Sinai
--   genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven            [NT+Extras+Tanakh] tier extras ★ the un-creation
--   genesis-7-noah-entered-and-yahuah-shut-him-in                            [NT+Extras]      tier extras  ★ the door shut
--   genesis-7-all-flesh-died-and-noah-only-remained                         [NT+Extras+Tanakh] tier extras ★ judgment universal
--
-- Framework-load-bearing notes:
--   ★ v.2-3,8 CLEAN/UNCLEAN BY SEVENS: the clean/unclean distinction is PRESENT BEFORE SINAI — Noah is
--     commanded to take clean beasts by sevens and unclean by twos centuries before Moses. This is
--     CREATIONAL knowledge, not a Mosaic invention and emphatically NOT a temporary/abolished law. The
--     thread weaves LATERALLY to Leviticus 11, where the SAME categories Noah already knew are NAMED and
--     written into the covenant Torah (*to make a difference between the unclean and the clean* — Lev
--     11:47). The Christianized "the dietary law was abolished / invented at Sinai" default is overridden:
--     the law names what was already true. Acts 10 / Mark 7 deliberately NOT pulled (the abolition misread).
--   ★ v.11 THE UN-CREATION: *the fountains of the great deep broken up, and the windows of heaven were
--     opened* is the reversal of Genesis 1 — the waters above and below, divided on day two, let back in.
--     Woven FORWARD as the type of the final reckoning (Matthew 24:38-39, Luke 17:27, 2 Peter 3:6) and OUT
--     to the restored witnesses that count the seven flood-gates (Jubilees 5:23) and repeat the formula
--     verbatim (Jasher 6:14); LATERALLY to Isaiah 24:18 (the windows from on high open in the day of the LORD).
--   ★ v.16 YAHUAH SHUT HIM IN: the door is shut by Yahuah's own hand — the deliverance sealed, the ark of
--     safety. Forward to 1 Peter 3:20 (eight souls saved by water, the figure of baptism) and Hebrews 11:7
--     (by faith, to the saving of his house); out to Jubilees 5:23 (closed from without) and Jasher 6:15.
--   ★ v.21-23 ALL FLESH DIED: the judgment is universal — *Noah only remained alive*. Ezekiel 14:14 reads
--     it as deliverance by personal righteousness (Noah, Daniel, Job deliver but their own souls); Isaiah
--     54:9 names *the waters of Noah* as Yahuah's sworn covenant-mercy. The Formed/Formless lens: it is
--     Yahuah (the visible LORD who shut the door) who judges and who swears the after-mercy.

CREATE TEMP VIEW _s301_ge07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== cross_references ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the clean and unclean by sevens — the distinction before Sinai
    ('canon','genesis',7,2,'canon','leviticus',11,2,'free',
      E'*Speak unto the children of Yashar''el (Israel), saying, These are the beasts which ye shall eat among all the beasts that are on the earth* (Leviticus 11:2). When Noah is told *Of every clean beast thou shalt take to thee by sevens... and of beasts that are not clean by two* (Genesis 7:2), the clean/unclean distinction is already in force — generations before Sinai. Leviticus 11 does not invent the categories; it names in covenant Torah what Noah already knew, the beasts *which ye shall eat* set apart from those *not clean*.'),
    ('canon','genesis',7,2,'canon','leviticus',11,3,'free',
      E'*Whatsoever parteth the hoof, and is clovenfooted, and cheweth the cud, among the beasts, that shall ye eat* (Leviticus 11:3). The *clean beast* Noah took *by sevens* (Genesis 7:2) is here given its marks. The dietary law is not a new yoke laid at Sinai but the spelling-out of a creational distinction the righteous already observed — the same clean kinds, now described so Yashar''el (Israel) may keep them.'),
    ('canon','genesis',7,2,'canon','leviticus',11,8,'free',
      E'*Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* (Leviticus 11:8). Noah''s *beasts that are not clean* taken only *by two* (Genesis 7:2) are the same unclean kinds the Torah names. The category is creational and continuous: what was *not clean* in Noah''s day is *unclean to you* in the covenant Torah — never abolished, never a temporary measure, the difference written into the world before it was written on tablets.'),
    ('canon','genesis',7,8,'canon','leviticus',11,47,'free',
      E'*To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47). Genesis 7:8 quietly repeats the whole categorization — *Of clean beasts, and of beasts that are not clean, and of fowls, and of every thing that creepeth* — proving the distinction stood before the Torah codified it. The very purpose Leviticus states, *to make a difference between the unclean and the clean*, is the difference Noah was already keeping at the ark door.'),
    ('canon','genesis',7,8,'canon','leviticus',11,46,'free',
      E'*This is the law of the beasts, and of the fowl, and of every living creature that moveth in the waters, and of every creature that creepeth upon the earth* (Leviticus 11:46). The four kinds Noah marks at the ark — *clean beasts... beasts that are not clean... fowls... every thing that creepeth* (Genesis 7:8) — are the same four the law of Leviticus 11 governs. The Torah gathers into one *law of the beasts* the distinction Noah obeyed by command, the creational order made covenant instruction.'),
    ('canon','genesis',7,2,'jasher','jasher',6,9,'extras',
      E'*Two and two came to Noah into the ark, but from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9). Jasher carries Genesis 7:2 with the same reckoning — the unclean *two and two*, the *clean animals, and clean fowls... seven couples* — and grounds it in command: *as Elohim (God) had commanded him*. The sevens of the clean are not Noah''s preference but obedience to a clean/unclean order already given, the same order Leviticus 11 will name.'),

    -- THREAD 2 (★): the fountains of the deep and the windows of heaven — the un-creation
    ('canon','genesis',7,11,'jubilees','jubilees',5,23,'extras',
      E'*And Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number. And the flood-gates began to pour down water from the heaven forty days and forty nights, And the fountains of the deep also sent up waters, until the whole world was full of water* (Jubilees 5:23). The Torah''s *all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11) is here counted out — *seven flood-gates of heaven... seven mouths* of the deep — the waters above and the waters below, divided in Genesis 1, let back in at once: the un-creation, the world un-made by the same waters it was framed from.'),
    ('canon','genesis',7,11,'jasher','jasher',6,14,'extras',
      E'*And all the fountains of the deep were broken up, and the windows of heaven were opened, and the rain was upon the earth forty days and forty nights* (Jasher 6:14). Jasher repeats Genesis 7:11 almost word for word — *all the fountains of the great deep broken up, and the windows of heaven were opened* — the double breach of the deep beneath and the heaven above, the ordered separation of the second day undone and the flood loosed for *forty days and forty nights*.'),
    ('canon','genesis',7,11,'canon','isaiah',24,18,'free',
      E'*And it shall come to pass, that he who fleeth from the noise of the fear shall fall into the pit; and he that cometh up out of the midst of the pit shall be taken in the snare: for the windows from on high are open, and the foundations of the earth do shake* (Isaiah 24:18). Isaiah takes up the flood-language of Genesis 7:11 — *the windows of heaven were opened* — for the day of Yahuah: *the windows from on high are open, and the foundations of the earth do shake*. The un-creation of Noah''s day is the prophet''s figure for the final reckoning, the heavens opened once more upon a guilty earth.'),
    ('canon','genesis',7,11,'canon','2-peter',3,6,'free',
      E'*Whereby the world that then was, being overflowed with water, perished* (2 Peter 3:6). When *the fountains of the great deep* were *broken up, and the windows of heaven were opened* (Genesis 7:11), *the world that then was* perished by water. Kepha sets that flood beside the coming judgement by fire — the same word of Elohim (God) that framed the heavens and the earth out of water now keeps them *reserved unto fire* — making the un-creation of Genesis 7 the pledge that the present world too will be judged.'),
    ('canon','genesis',7,12,'canon','matthew',24,38,'free',
      E'*For as in the days that were before the flood they were eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38). The forty days of rain (Genesis 7:12) fell on a world that lived on heedless to the last day. Yahusha (Jesus) names *the days that were before the flood* — the ordinary eating and drinking *until the day that Noe entered into the ark* — as the very pattern of the world at his coming.'),
    ('canon','genesis',7,12,'canon','matthew',24,39,'free',
      E'*And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39). When *the rain was upon the earth forty days and forty nights* (Genesis 7:12), the condemned world *knew not until the flood came, and took them all away*. The Son of Adam makes the suddenness and totality of the flood the figure of his return — *so shall also the coming of the Son of Adam be*.'),
    ('canon','genesis',7,12,'canon','luke',17,27,'free',
      E'*They did eat, they drank, they married wives, they were given in marriage, until the day that Noe entered into the ark, and the flood came, and destroyed them all* (Luke 17:27). Luke''s witness joins the rain of Genesis 7:12 to the return of the Son of Adam: the world ate and drank *until the day that Noe entered into the ark, and the flood came, and destroyed them all* — the un-creation breaking upon a world that read no sign.'),

    -- THREAD 3 (★): Noah entered, and Yahuah shut him in — the door sealed
    ('canon','genesis',7,16,'canon','1-peter',3,20,'free',
      E'*Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20). When *they went in unto Noah into the ark... and Yahuah (LORD) shut him in* (Genesis 7:16), the long-suffering closed and the deliverance sealed — *eight souls were saved by water*. The shut door is the boundary between the saved few and the drowning world, the ark of safety the apostle names as the figure of salvation.'),
    ('canon','genesis',7,13,'canon','hebrews',11,7,'free',
      E'*By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). *In the selfsame day entered Noah, and Shem, and Ham, and Japheth... and Noah''s wife, and the three wives of his sons with them, into the ark* (Genesis 7:13) — the whole house entering is the ark *to the saving of his house*. Noah''s obedience in building and entering is faith made visible, the righteous remnant condemning the world by going in.'),
    ('canon','genesis',7,16,'jubilees','jubilees',5,23,'extras',
      E'*And he entered in the sixth (year) thereof, in the second month, on the new moon of the second month, till the sixteenth; and he entered, and all that we brought to him, into the ark, and Yahuah (God) closed it from without on the seventeenth evening* (Jubilees 5:23). Jubilees carries Genesis 7:16 — *Yahuah (LORD) shut him in* — with the same hand sealing the door from outside: *Yahuah (God) closed it from without on the seventeenth evening*. The deliverance is shut by Yahuah''s own act, the ark sealed against the rising waters.'),
    ('canon','genesis',7,16,'jasher','jasher',6,15,'extras',
      E'*And Noah and his household, and all the living creatures that were with him, came into the ark on account of the waters of the flood, and Yahuah (the Lord) shut him in* (Jasher 6:15). Jasher repeats Genesis 7:16 word for word — *and Yahuah (the Lord) shut him in* — Noah and his household and the creatures gathered inside, and the door closed by Yahuah. The same sealed deliverance: those within preserved, the door shut by the hand that judges.'),

    -- THREAD 4 (★): all flesh died, and Noah only remained
    ('canon','genesis',7,21,'jasher','jasher',6,26,'extras',
      E'*And the rain was still descending upon the earth, and it descended forty days and forty nights, and the waters prevailed greatly upon the earth; and all flesh that was upon the earth or in the waters died, whether men, animals, beasts, creeping things or birds of the air, and there only remained Noah and those that were with him in the ark* (Jasher 6:26). Jasher carries Genesis 7:21 in full — *all flesh died that moved upon the earth* — and names the sole exception the Torah names: *there only remained Noah and those that were with him in the ark*. The judgement is universal; the preserved are only those the door shut in.'),
    ('canon','genesis',7,23,'jubilees','jubilees',5,19,'extras',
      E'*And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways* (Jubilees 5:19). *Noah only remained alive, and they that were with him in the ark* (Genesis 7:23): Jubilees gives the reason — *no man''s person was accepted save that of Noah alone* — and the mechanism of the sons'' survival, *accepted in behalf of his sons*. The seed-line is preserved through the one righteous man while all corrupted flesh is swept away.'),
    ('canon','genesis',7,23,'canon','ezekiel',14,14,'free',
      E'*Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 14:14). *Noah only remained alive* (Genesis 7:23) is read by Ezekiel as the pattern of deliverance by personal righteousness: even *Noah, Daniel, and Job* could *deliver but their own souls by their righteousness*. The flood shows it — Noah''s righteousness saved Noah''s house, not the guilty world; each is answerable for his own standing before Yahuah.'),
    ('canon','genesis',7,23,'canon','isaiah',54,9,'free',
      E'*For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee* (Isaiah 54:9). The universal judgement of Genesis 7:23 — *every living substance was destroyed... and Noah only remained alive* — becomes Yahuah''s standing oath of mercy: *the waters of Noah should no more go over the earth*. The flood that drowned all flesh is named in the covenant of peace, the sworn pledge that such wrath will not return upon his people.'),
    ('canon','genesis',7,21,'canon','matthew',24,39,'free',
      E'*And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39). *And all flesh died that moved upon the earth, both of fowl, and of cattle, and of beast... and every man* (Genesis 7:21): the flood *took them all away*. Yahusha (Jesus) makes that total taking the figure of his coming — the unready world swept off in a day, *so shall also the coming of the Son of Adam be*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== threads ==============================
-- THREAD 1 (★): the clean and unclean by sevens — the distinction before Sinai
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai',
       E'The clean and unclean by sevens — the distinction before Sinai',
       E'Long before Sinai, before any tablet was cut, the clean and the unclean are already two kinds. *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female* (Genesis 7:2), *to keep seed alive upon the face of all the earth* (Genesis 7:3). Genesis 7:8 says it again at the ark door — *Of clean beasts, and of beasts that are not clean, and of fowls, and of every thing that creepeth upon the earth*. Noah does not ask which beasts are clean; he already knows. This is creational knowledge, the difference written into the world. When the Torah later sets it in covenant law, it does not invent the categories — it names them: *Speak unto the children of Yashar''el (Israel), saying, These are the beasts which ye shall eat* (Leviticus 11:2); *Whatsoever parteth the hoof, and is clovenfooted, and cheweth the cud, among the beasts, that shall ye eat* (Leviticus 11:3); *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* (Leviticus 11:8). And the purpose Leviticus states is the very distinction Noah was keeping: *This is the law of the beasts, and of the fowl... To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:46-47). Jasher remembers it as command, not custom: *from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9). The clean/unclean distinction is not a Mosaic novelty and not a temporary measure abolished later — it predates Moses, Noah already knew it, and the Torah merely wrote down what was true before it was written. The dietary law is named at Sinai, never invented there, and never repealed.',
       sv.verse_id, ev.verse_id, 'extras', 20150
  FROM _s301_ge07_lookup sv, _s301_ge07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★): the fountains of the deep and the windows of heaven — the un-creation
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven',
       E'The fountains of the deep and the windows of heaven — the un-creation',
       E'On one day the world is un-made. *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11), *and the rain was upon the earth forty days and forty nights* (Genesis 7:12). This is the reversal of Genesis 1: the waters above and the waters below, divided on the second day, are let back in at once. The restored witnesses count the breach: *Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number... until the whole world was full of water* (Jubilees 5:23); Jasher repeats the Torah almost word for word — *all the fountains of the deep were broken up, and the windows of heaven were opened, and the rain was upon the earth forty days and forty nights* (Jasher 6:14). The prophet takes up the same language for the day of Yahuah: *the windows from on high are open, and the foundations of the earth do shake* (Isaiah 24:18). And the New Testament makes the flood the pledge of the final reckoning: *Whereby the world that then was, being overflowed with water, perished* (2 Peter 3:6); *as in the days that were before the flood they were eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38), *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39); *the flood came, and destroyed them all* (Luke 17:27). The un-creation of Noah''s day is no closed event — it is the figure of the world un-made again, sudden and total, upon a generation that read no sign.',
       sv.verse_id, ev.verse_id, 'extras', 20153
  FROM _s301_ge07_lookup sv, _s301_ge07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★): Noah entered, and Yahuah shut him in
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-7-noah-entered-and-yahuah-shut-him-in',
       E'Noah entered, and Yahuah shut him in',
       E'The deliverance is sealed by Yahuah''s own hand. *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark* (Genesis 7:13), *And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in* (Genesis 7:16). The door is not closed by Noah but by Yahuah — the same visible LORD who walked with the fathers seals the ark from without. The restored books keep that detail: *Yahuah (God) closed it from without on the seventeenth evening* (Jubilees 5:23); *Noah and his household, and all the living creatures that were with him, came into the ark... and Yahuah (the Lord) shut him in* (Jasher 6:15). The shut door is the boundary between the saved few and the drowning world. The apostles read the ark as the figure of salvation itself: *the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20); *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). The whole house entering, the door shut by Yahuah — this is the ark of safety, the few preserved inside while the long-suffering closes and the waters rise.',
       sv.verse_id, ev.verse_id, 'extras', 20156
  FROM _s301_ge07_lookup sv, _s301_ge07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=7 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★): all flesh died, and Noah only remained
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-7-all-flesh-died-and-noah-only-remained',
       E'All flesh died, and Noah only remained',
       E'The judgement is universal, the exception is one household. *And all flesh died that moved upon the earth, both of fowl, and of cattle, and of beast, and of every creeping thing that creepeth upon the earth, and every man* (Genesis 7:21); *All in whose nostrils was the breath of life, of all that was in the dry land, died* (Genesis 7:22); *and Noah only remained alive, and they that were with him in the ark* (Genesis 7:23). The restored witnesses tell it the same: *all flesh that was upon the earth or in the waters died... and there only remained Noah and those that were with him in the ark* (Jasher 6:26); and Jubilees gives the reason — *no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways* (Jubilees 5:19). The seed-line passes through the one righteous man while all corrupted flesh is swept away. Ezekiel reads the flood as the pattern of deliverance by personal righteousness: *Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 14:14) — Noah''s righteousness saved Noah''s house, not the guilty world. And the same waters become Yahuah''s sworn mercy in the covenant of peace: *as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee* (Isaiah 54:9). The flood that drowned all flesh is also the oath that such wrath will not return upon his people — judgement universal, mercy sworn, the seed preserved through the one whom Yahuah shut into the ark.',
       sv.verse_id, ev.verse_id, 'extras', 20159
  FROM _s301_ge07_lookup sv, _s301_ge07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ============================== thread_members ==============================
-- THREAD 1 members (★ clean/unclean before Sinai)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*These are the beasts which ye shall eat* (Leviticus 11:2) — the Torah names, not invents, the clean/unclean kinds Noah took by sevens and twos (Genesis 7:2).'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Whatsoever parteth the hoof... that shall ye eat* (Leviticus 11:3) — the marks of the clean beast Noah took by sevens (Genesis 7:2), the creational distinction spelled out.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they are unclean to you* (Leviticus 11:8) — the *beasts that are not clean* Noah took only by two (Genesis 7:2); the category continuous, never abolished.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*This is the law of the beasts, and of the fowl* (Leviticus 11:46) — the four kinds Genesis 7:8 marks at the ark, gathered into one law of the beasts.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*To make a difference between the unclean and the clean* (Leviticus 11:47) — the very purpose Noah was already keeping when he sorted clean from unclean at the ark (Genesis 7:8).'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9) — the sevens of Genesis 7:2 grounded in command, an order already given.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-clean-and-unclean-by-sevens-the-distinction-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★ the un-creation)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number* (Jubilees 5:23) — the breach of Genesis 7:11 counted out, the waters above and below let in.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all the fountains of the deep were broken up, and the windows of heaven were opened* (Jasher 6:14) — Genesis 7:11 repeated almost verbatim, the double breach of deep and heaven.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the windows from on high are open, and the foundations of the earth do shake* (Isaiah 24:18) — the flood-language of Genesis 7:11 taken up for the day of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the world that then was, being overflowed with water, perished* (2 Peter 3:6) — the un-creation of Genesis 7:11 as the pledge of the coming judgement.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38) — the heedless world of the forty days'' rain (Genesis 7:12) as the pattern of the last days.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be* (Matthew 24:39) — the suddenness of Genesis 7:12 made the figure of the return.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the flood came, and destroyed them all* (Luke 17:27) — the rain of Genesis 7:12 joined again to the coming of the Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=17 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-the-fountains-of-the-deep-and-the-windows-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★ the door shut)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the longsuffering of Elohim (God) waited in the days of Noah... eight souls were saved by water* (1 Peter 3:20) — the door Yahuah shut (Genesis 7:16) as the boundary of the saved few.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-noah-entered-and-yahuah-shut-him-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith Noah... prepared an ark to the saving of his house* (Hebrews 11:7) — the whole house entering (Genesis 7:13) as faith made visible, condemning the world.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-noah-entered-and-yahuah-shut-him-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (God) closed it from without on the seventeenth evening* (Jubilees 5:23) — Genesis 7:16''s *Yahuah shut him in* sealed by his own hand from outside.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-noah-entered-and-yahuah-shut-him-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*and Yahuah (the Lord) shut him in* (Jasher 6:15) — Genesis 7:16 word for word, the household and creatures sealed inside the ark.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-noah-entered-and-yahuah-shut-him-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★ all flesh died)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*all flesh that was upon the earth or in the waters died... there only remained Noah and those that were with him in the ark* (Jasher 6:26) — Genesis 7:21 in full, the sole exception named.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*no man''s person was accepted save that of Noah alone... accepted in behalf of his sons* (Jubilees 5:19) — the reason *Noah only remained alive* (Genesis 7:23), the seed-line preserved.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Noah, Daniel, and Job... should deliver but their own souls by their righteousness* (Ezekiel 14:14) — the flood (Genesis 7:23) read as deliverance by personal righteousness.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the waters of Noah should no more go over the earth* (Isaiah 54:9) — the flood of Genesis 7:23 named as Yahuah''s sworn covenant-mercy.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*knew not until the flood came, and took them all away* (Matthew 24:39) — *all flesh died... every man* (Genesis 7:21), the total taking made the figure of the coming.'
  FROM cross_reference_threads t
  JOIN _s301_ge07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s301_ge07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-7-all-flesh-died-and-noah-only-remained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_8.sql (Genesis 8) -----
-- Chapter: Genesis 8 (Elohim remembered Noah; the waters assuaged; the ark rested on Ararat; the raven and the dove; the olive leaf; Noah's altar and the sweet savour; seedtime and harvest shall not cease)
-- Tag: ge08   Temp view: _s301_ge08_lookup
-- Sort band: base 20175, step 3 -> threads at 20175, 20178, 20181, 20184 (4 threads)
-- Source of EVERY row: 'canon','genesis',8,v
--
-- Genesis 8 coverage:
--   ★ v.1-3 (Elohim REMEMBERED Noah; made a wind/ruach to pass over the earth; the waters asswaged; the fountains/windows stopped)
--        NT:     1 Peter 3:20 (longsuffering of Elohim waited in the days of Noah... eight souls saved by water);
--                1 Peter 3:21 (the like figure whereunto even baptism doth also now save us, by the resurrection)
--        Extras: Jasher 6:32 (Yahuah remembered him); Jasher 6:33 (a wind passed over the earth, the waters were still, the ark rested)
--        Tanakh: Genesis 1:2 (the Spirit/Ruach of Elohim moved upon the face of the waters — the new-creation-through-water echo)
--   v.4-5 (the ark rested in the seventh month on the seventeenth day, on the mountains of Ararat; the tops of the mountains seen)
--        NT:     none warranted (the resting carried in the remembered-Noah thread)
--        Extras: none warranted as MEMBER (Jubilees 6:27 / Jasher 6:35 are near-verbatim retellings, woven by reference)
--        Tanakh: none warranted
--   v.6-12 (Noah opened the window; the raven to and fro; the dove sent thrice; the olive leaf pluckt off; the dove returned no more)
--        NT:     Matthew 3:16 (he saw the Spirit of Elohim descending like a dove, and lighting upon him — the new creation begun)
--        Extras: none warranted distinct (Jasher's flood-narrative does not carry the dove episode cleanly)
--        Tanakh: none warranted as MEMBER (the dove/olive-leaf sign carried FORWARD to the Spirit-dove at the immersion)
--   v.13-19 (the waters dried; Noah removed the covering; Elohim spake "Go forth"; every living thing went forth after their kinds, breed/be fruitful)
--        NT:     none warranted (go-forth/be-fruitful echoes Genesis 1:28, woven by reference in summary)
--        Extras: none warranted as MEMBER (Jasher 6:40-42 retelling of the going-forth and the blessing, woven by reference)
--        Tanakh: none warranted
--   ★ v.20-21 (Noah builded an altar; took of every CLEAN beast/fowl; offered burnt offerings; Yahuah smelled a SWEET SAVOUR; I will not again curse the ground)
--        NT:     Ephesians 5:2 (Messiah... hath given himself for us an offering and a sacrifice to Elohim for a sweetsmelling savour);
--                Hebrews 13:15 (by him let us offer the sacrifice of praise to Elohim continually)
--        Extras: Jubilees 6:1 (on the new moon of the third month he went forth, built an altar); Jubilees 6:3 (placed a burnt
--                sacrifice... caused a goodly savour to arise, acceptable before Yahuah); Jasher 6:9 (of the clean animals/fowls
--                he brought seven couples, as Elohim had commanded — the clean/unclean distinction pre-Sinai)
--        Tanakh: none warranted as MEMBER (the clean-beast/sweet-savour type carried FORWARD to Messiah's offering)
--   ★ v.22 (While the earth remaineth, seedtime and harvest, cold and heat, summer and winter, day and night shall not cease)
--        NT:     none warranted (the covenant-order of the seasons carried OUT to Jubilees + LATERALLY to Jeremiah/Isaiah)
--        Extras: Jubilees 6:4 (He made a covenant... seed-time and harvest should never cease; cold and heat, summer and winter,
--                day and night should not change their order); Jubilees 6:17 (celebrate the feast of weeks... to renew the covenant
--                every year — the moedim rooted in the constant order)
--        Tanakh: Jeremiah 33:20 (my covenant of the day and my covenant of the night); Jeremiah 33:25 (if my covenant be not with
--                day and night, the ordinances of heaven and earth); Isaiah 54:9 (as the waters of Noah... I have sworn);
--                Genesis 9:11 (I will establish my covenant... neither shall there any more be a flood to destroy the earth)
--
-- Threads (slug -> target libraries):
--   genesis-8-elohim-remembered-noah-the-wind-over-the-waters          [NT+Extras+Tanakh]  tier extras  ★
--   genesis-8-the-dove-and-the-olive-leaf-the-spirit-descending        [NT]                tier free
--   genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour        [NT+Extras]         tier extras  ★
--   genesis-8-seedtime-and-harvest-shall-not-cease                     [Extras+Tanakh]     tier extras  ★
--
-- Framework-load-bearing notes:
--   ★ v.1 "Elohim remembered Noah... made a wind to pass over the earth": framed as the TURNING of the flood and as the
--     NEW-CREATION-THROUGH-WATER motif. The ruach (wind) moving over the waters deliberately echoes Genesis 1:2, where *the
--     Spirit of Elohim (God) moved upon the face of the waters* over the same deep — the flood-world re-emerging as a creation
--     re-made through judgement-water. 1 Peter 3:20-21 reads the very water that drowned the world as the figure of the water
--     that now saves by the resurrection. Jasher 6:32-33 carries the same beat verbatim: *Yahuah remembered him... a wind passed
--     over the earth, and the waters were still and the ark rested.* "Remembered" is covenant-faithfulness, not recollection.
--   ★ v.20-21 Noah's altar / clean beasts / sweet savour: the FIRST altar after the flood. The clean/unclean distinction is
--     ALREADY in force (8:20, "every clean beast"; Jasher 6:9, "seven couples" of the clean) — pre-Sinai, against the
--     Christianized "the food/clean laws were a late Jewish invention" default. The *sweet savour* is woven FORWARD to Ephesians
--     5:2, *Messiah... hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* — Noah's
--     accepted offering is the atonement/acceptance foreshadow, fulfilled in the Formed Son's self-offering. Jubilees 6:1-3
--     unfolds the altar and the goodly savour acceptable before Yahuah; Hebrews 13:15 carries the savour forward into the
--     assembly's sacrifice of praise.
--   ★ v.22 "seedtime and harvest... shall not cease": framed as the COVENANT-ORDER of the seasons/appointed times — the
--     faithfulness of Yahuah to the created order He set in Genesis 1:14. The moedim (Leviticus 23) rest on this constancy:
--     Jubilees 6:4 makes the seedtime/harvest promise a COVENANT and Jubilees 6:17 roots the feast of weeks in renewing it;
--     Jeremiah 33:20,25 calls day and night themselves a covenant, the ordinances of heaven — as unbreakable as the throne of
--     David. Isaiah 54:9 swears by "the waters of Noah" that the wrath is past. The order of the seasons is not mere nature; it
--     is the standing pledge the calendar of Yahuah is built upon. (Christianized "seasons = generic providence" default
--     overridden — this is covenant constancy, the ground of the appointed times.)
--   Christology: v.1 the wind/ruach over the waters and v.21 the accepted offering are framed as the work of the covenant
--     Yahuah and the Formed Son's foreshadowed sacrifice; NO Trinitarian co-equal-persons grammar; the Genesis-1:2 Ruach echo
--     is the same Spirit of Elohim over the same waters, not a third co-equal person.
--   Jubilees/Jasher double-write trap honored: every VALUES row writes 'jubilees','jubilees',... and 'jasher','jasher',...
--     (edition AND book slug both literal) to keep 10-column arity. Jubilees 6:7 and several vv. are absent from this parse
--     (the parse jumps 6->8, skips 6:12/18/23/28/33); only clean present verses (6:1,6:3,6:4,6:17) are quoted as members.

CREATE TEMP VIEW _s301_ge08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== cross_references ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Elohim remembered Noah — the wind/ruach over the waters, new creation through water
    ('canon','genesis',8,1,'canon','genesis',1,2,'free',
      E'*And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2). When *Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1), the language of the first creation returns: the same *waters*, the same *deep*, and the breath/Spirit of Elohim moving over them. The flood-world is a creation re-made through judgement-water — the deep covered over and then drawn back, the dry land appearing again, as in the beginning.'),
    ('canon','genesis',8,1,'jasher','jasher',6,32,'extras',
      E'*And Yahuah (the Lord) hearkened to the voice of Noah, and Yahuah (the Lord) remembered him* (Jasher 6:32). Jasher carries the very turning of Genesis 8:1 — *And Elohim (God) remembered Noah* — and names it as answered prayer: Noah cried from the tossed ark, and *Yahuah... remembered him.* The "remembering" is covenant-faithfulness acting, not mere recollection; the deliverance begins the instant Yahuah turns toward the one He has kept.'),
    ('canon','genesis',8,1,'jasher','jasher',6,33,'extras',
      E'*And a wind passed over the earth, and the waters were still and the ark rested* (Jasher 6:33). Almost verbatim with the Torah — *Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1) — Jasher binds the wind, the stilling of the waters, and the resting of the ark into one moment. The ruach passes over the deep and the chaos subsides, the same Spirit-over-the-waters that ordered the first creation now quieting the flood.'),
    ('canon','genesis',8,1,'canon','1-peter',3,20,'free',
      E'*Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20). The waters that *asswaged* (Genesis 8:1) had borne the *eight souls* through: Kepha reads the flood not only as judgement but as the means by which the remnant was *saved by water* — the deep that drowned the old world carried the ark of the new through.'),
    ('canon','genesis',8,3,'canon','1-peter',3,21,'free',
      E'*The like figure whereunto even baptism doth also now save us (not the putting away of the filth of the flesh, but the answer of a good conscience toward Elohim (God),) by the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:21). As *the waters returned from off the earth continually* (Genesis 8:3) and the dry land rose, the world passed through water into new life. Kepha names this the figure of the salvation now given — the new creation through water, fulfilled *by the resurrection of Yahusha HaMashiach (Jesus Christ).*'),

    -- THREAD 2: the dove and the olive leaf — the Spirit descending like a dove
    ('canon','genesis',8,11,'canon','matthew',3,16,'free',
      E'*And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him* (Matthew 3:16). *And the dove came in to him in the evening; and, lo, in her mouth was an olive leaf pluckt off: so Noah knew that the waters were abated from off the earth* (Genesis 8:11). The dove returning over the receding waters with the olive leaf — the sign of peace and renewed earth — is answered when, over the waters of the immersion, *the Spirit of Elohim (God) descending like a dove* lights on the Messiah: the new creation begun, the deep crossed, peace declared from heaven.'),

    -- THREAD 3 (★): Noah's altar — the clean beasts and the sweet savour
    ('canon','genesis',8,21,'canon','ephesians',5,2,'free',
      E'*And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). *And Yahuah (LORD) smelled a sweet savour* (Genesis 8:21) at Noah''s burnt offering, and stayed His hand from the curse. The accepted savour of the first altar after the flood is the foreshadow Sha''ul names fulfilled: the Formed Son *hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* — the offering that finally and fully turns away the wrath.'),
    ('canon','genesis',8,20,'canon','hebrews',13,15,'free',
      E'*By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). *And Noah builded an altar unto Yahuah (LORD)... and offered burnt offerings on the altar* (Genesis 8:20) — the first act of the saved remnant is worship at an altar. That altar-pattern is carried forward into the assembly: *by him* the burnt offering becomes *the sacrifice of praise to Elohim (God) continually*, the same upward-rising savour now borne on the lips of the redeemed.'),
    ('canon','genesis',8,20,'jubilees','jubilees',6,1,'extras',
      E'*And on the new moon of the third month he went forth from the ark, and built an altar on that mountain* (Jubilees 6:1). Jubilees fixes the date of Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD)* — to the new moon of the third month, the very season of Shavuot. The first altar of the cleansed earth is built not at random but on an appointed time, the worship of the remnant already tied to the calendar of Yahuah.'),
    ('canon','genesis',8,21,'jubilees','jubilees',6,3,'extras',
      E'*And he placed the fat thereof on the altar... and placed a burnt sacrifice on the altar, and poured thereon an offering mingled with oil, and sprinkled wine and strewed frankincense over everything, and caused a goodly savour to arise, acceptable before Yahuah (God)* (Jubilees 6:3). The Torah''s *Yahuah (LORD) smelled a sweet savour* (Genesis 8:21) is unfolded here in full liturgy: the fat, the oil, the wine, the frankincense, and the *goodly savour... acceptable before Yahuah (God).* The acceptance of the offering is the ground on which the no-more-curse oath is spoken.'),
    ('canon','genesis',8,20,'jasher','jasher',6,9,'extras',
      E'*Two and two came to Noah into the ark, but from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9). When Noah *took of every clean beast, and of every clean fowl, and offered burnt offerings* (Genesis 8:20), he could do so because the clean had been gathered by sevens — and Jasher names it *as Elohim (God) had commanded him.* The clean/unclean distinction is already in force, pre-Sinai, written into the gathering of the ark and the altar of the new earth.'),

    -- THREAD 4 (★): While the earth remaineth, seedtime and harvest shall not cease
    ('canon','genesis',8,22,'jubilees','jubilees',6,4,'extras',
      E'*And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth; that all the days of the earth seed-time and harvest should never cease; cold and heat, and summer and winter, and day and night should not change their order, nor cease for ever* (Jubilees 6:4). The Torah''s promise — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22) — is here declared to be a COVENANT. The constancy of the seasons is not mere nature; it is a sworn order of Yahuah, the standing pledge beneath all the appointed times.'),
    ('canon','genesis',8,22,'jubilees','jubilees',6,17,'extras',
      E'*For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year* (Jubilees 6:17). The unbroken order of *seedtime and harvest... summer and winter* (Genesis 8:22) is the ground on which the moed stands: the feast of weeks (Shavuot) is set *to renew the covenant every year*, the appointed time growing directly out of the covenant-constancy of the seasons sworn at Noah''s altar.'),
    ('canon','genesis',8,22,'canon','jeremiah',33,20,'free',
      E'*Thus saith Yahuah (LORD); If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season* (Jeremiah 33:20). Genesis 8:22 promises that *day and night shall not cease*; Jeremiah calls that very order *my covenant of the day, and my covenant of the night.* The rhythm of *day and night in their season* is a covenant as binding as any oath — the faithfulness of Yahuah to the created order made the surety of His faithfulness to His people.'),
    ('canon','genesis',8,22,'canon','jeremiah',33,25,'free',
      E'*Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25). The pledge of Genesis 8:22 — *summer and winter, and day and night shall not cease* — Jeremiah names *the ordinances of heaven and earth*, as unbreakable as the throne promised to David. The constancy of the seasons is the measure of covenant-certainty itself: as surely as the seasons keep their order, so surely Yahuah keeps His word.'),
    ('canon','genesis',8,22,'canon','isaiah',54,9,'free',
      E'*For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee* (Isaiah 54:9). The sworn constancy behind *While the earth remaineth... shall not cease* (Genesis 8:22) is taken up by the prophet as the pattern of Yahuah''s mercy: *as I have sworn that the waters of Noah should no more go over the earth*, so He swears everlasting kindness to His people — the oath of the seasons made the figure of the oath of restoration.'),
    ('canon','genesis',8,21,'canon','genesis',9,11,'free',
      E'*And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth* (Genesis 9:11). The resolve spoken in Yahuah''s heart at the altar — *I will not again curse the ground any more for man''s sake... neither will I again smite any more every thing living, as I have done* (Genesis 8:21) — is then sealed openly as covenant: *neither shall there any more be a flood to destroy the earth.* The inward oath of acceptance becomes the standing covenant with all flesh.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== threads ==============================
-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-8-elohim-remembered-noah-the-wind-over-the-waters',
       E'Elohim remembered Noah — the wind over the waters',
       E'The flood turns at a single word: *And Elohim (God) remembered Noah, and every living thing, and all the cattle that was with him in the ark: and Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1); *And the waters returned from off the earth continually* (Genesis 8:3). The "remembering" is not recollection but covenant-faithfulness acting — Jasher hears it as answered prayer: *Yahuah (the Lord) hearkened to the voice of Noah, and Yahuah (the Lord) remembered him* (Jasher 6:32), and then, almost in the Torah''s own words, *a wind passed over the earth, and the waters were still and the ark rested* (Jasher 6:33). And the wind over the waters is no new thing: it is the breath of the first creation returning. *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2) — the same deep, the same waters, the same Spirit-wind, now drawing back the flood so the dry land may rise again. The flood-world is a creation re-made through judgement-water. Kepha names what that water was for: *the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20), *the like figure whereunto even baptism doth also now save us... by the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:21). The deep that drowned the old world bore the ark of the new through — the new creation through water, remembered and brought up by the faithfulness of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 20175
  FROM _s301_ge08_lookup sv, _s301_ge08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-8-the-dove-and-the-olive-leaf-the-spirit-descending',
       E'The dove and the olive leaf — the Spirit descending',
       E'Noah sends out the birds to read the waters. First *a raven, which went forth to and fro, until the waters were dried up from off the earth* (Genesis 8:7); then the dove, who *found no rest for the sole of her foot* (Genesis 8:9) and returned. Seven days later he sent her again: *And the dove came in to him in the evening; and, lo, in her mouth was an olive leaf pluckt off: so Noah knew that the waters were abated from off the earth* (Genesis 8:11). The dove returning over the receding deep with the olive leaf — the sign of peace and a renewed, fruit-bearing earth — is the quiet emblem of the new creation. And it is answered at the Jordan, over another water, at the beginning of another new creation: *And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him* (Matthew 3:16). The dove that found rest on the olive over the abated flood becomes the Spirit who lights upon the Messiah as he rises from the water — peace declared from the opened heavens, the new creation begun.',
       sv.verse_id, ev.verse_id, 'free', 20178
  FROM _s301_ge08_lookup sv, _s301_ge08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=8 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour',
       E'Noah''s altar — the clean beasts and the sweet savour',
       E'The first act of the saved remnant on the cleansed earth is worship: *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar. And Yahuah (LORD) smelled a sweet savour* (Genesis 8:20-21). Two things stand out. First, the clean/unclean distinction is already in force, long before Sinai — Jasher names it plainly: *from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9), the clean gathered by sevens for this very altar. Second, the offering is ACCEPTED — the *sweet savour* turns Yahuah''s heart from the curse. Jubilees fixes the altar to an appointed time and unfolds its liturgy: *on the new moon of the third month he went forth from the ark, and built an altar on that mountain* (Jubilees 6:1); he *placed a burnt sacrifice on the altar... and caused a goodly savour to arise, acceptable before Yahuah (God)* (Jubilees 6:3). And the accepted savour of the first post-flood altar is the foreshadow the apostle names fulfilled: *Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2) — the offering that finally and fully turns away the wrath. The altar-pattern continues in the assembly: *by him therefore let us offer the sacrifice of praise to Elohim (God) continually* (Hebrews 13:15). Noah''s burnt offering is atonement and acceptance in figure; the Formed Son is the savour in full.',
       sv.verse_id, ev.verse_id, 'extras', 20181
  FROM _s301_ge08_lookup sv, _s301_ge08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-8-seedtime-and-harvest-shall-not-cease',
       E'While the earth remaineth — seedtime and harvest shall not cease',
       E'Out of the accepted offering comes a promise about time itself: *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22). This is not a comment on weather; it is the covenant-order of the seasons, the faithfulness of Yahuah to the created order He set when He made the lights *for signs, and for seasons.* Jubilees declares it outright a covenant: *He made a covenant with him... that all the days of the earth seed-time and harvest should never cease; cold and heat, and summer and winter, and day and night should not change their order, nor cease for ever* (Jubilees 6:4) — and roots the appointed times in it, *that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year* (Jubilees 6:17). The prophets reach back to this very constancy as the measure of Yahuah''s reliability: *If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season* (Jeremiah 33:20), *if my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25) — only then could His covenant with David be broken. Isaiah swears by it: *as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee* (Isaiah 54:9). And what was resolved in Yahuah''s heart at the altar — *I will not again curse the ground any more for man''s sake* (Genesis 8:21) — is sealed openly: *neither shall there any more be a flood to destroy the earth* (Genesis 9:11). The unbroken seasons are the standing pledge the whole calendar of the moedim, and every promise of restoration, is built upon.',
       sv.verse_id, ev.verse_id, 'extras', 20184
  FROM _s301_ge08_lookup sv, _s301_ge08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=8 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ============================== thread_members ==============================
-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2) — the wind/ruach over the waters of Genesis 8:1 is the breath of the first creation returning over the same deep.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (the Lord)... remembered him* (Jasher 6:32) — Genesis 8:1''s remembering read as answered prayer, covenant-faithfulness acting.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a wind passed over the earth, and the waters were still and the ark rested* (Jasher 6:33) — almost verbatim with Genesis 8:1, the ruach quieting the deep.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*eight souls were saved by water* (1 Peter 3:20) — the asswaging waters of Genesis 8:1 bore the remnant through; the longsuffering of Elohim fulfilled.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the like figure whereunto even baptism doth also now save us... by the resurrection* (1 Peter 3:21) — the waters returning off the earth (Genesis 8:3) as the figure of the new creation through water.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him* (Matthew 3:16) — the dove with the olive leaf over the abated flood (Genesis 8:11) answered by the Spirit-dove over the immersion, the new creation begun.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-the-dove-and-the-olive-leaf-the-spirit-descending'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9) — the clean/unclean distinction already in force pre-Sinai, the clean gathered for the altar of Genesis 8:20.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=20
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*on the new moon of the third month he went forth from the ark, and built an altar* (Jubilees 6:1) — the first altar (Genesis 8:20) fixed to an appointed time, the season of Shavuot.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=20
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*caused a goodly savour to arise, acceptable before Yahuah (God)* (Jubilees 6:3) — the *sweet savour* of Genesis 8:21 unfolded in full liturgy, the offering accepted.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2) — Noah''s accepted savour (Genesis 8:21) the foreshadow of the Formed Son''s self-offering that turns away the wrath.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*by him... let us offer the sacrifice of praise to Elohim (God) continually* (Hebrews 13:15) — Noah''s altar (Genesis 8:20) the pattern carried into the assembly''s continual upward-rising savour.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=20
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He made a covenant with him... seed-time and harvest should never cease; cold and heat, and summer and winter... should not change their order* (Jubilees 6:4) — Genesis 8:22''s promise declared a COVENANT, the constancy of the seasons a sworn order.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*celebrate the feast of weeks in this month once a year, to renew the covenant every year* (Jubilees 6:17) — the moed (Shavuot) rooted in the season-constancy of Genesis 8:22.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*my covenant of the day, and my covenant of the night... day and night in their season* (Jeremiah 33:20) — the day/night order of Genesis 8:22 named a covenant as binding as the throne of David.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*if my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25) — Genesis 8:22''s seasons named *the ordinances of heaven*, the measure of covenant-certainty.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*as I have sworn that the waters of Noah should no more go over the earth; so have I sworn... everlasting kindness* (Isaiah 54:9) — the oath of the seasons (Genesis 8:22) the figure of the oath of restoration.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*neither shall there any more be a flood to destroy the earth* (Genesis 9:11) — the inward resolve at the altar (Genesis 8:21) sealed openly as the covenant with all flesh.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_9.sql (Genesis 9) -----
-- Chapter: Genesis 9 (The re-commissioning of Noah, the blood prohibition, the murder ban in the image of Elohim, the everlasting covenant of the bow, the blessing of Shem and the enlarging of Japheth)
-- Tag: ge09   Temp view: _s301_ge09_lookup
-- Sort band: base 20200, step 3 -> threads at 20200, 20203, 20206, 20209 (4 threads)
-- Source of EVERY row: 'canon','genesis',9,v
--
-- Genesis 9 coverage:
--   v.1-3,7 (Be fruitful and multiply; the fear of you on every beast; every moving thing for meat)
--        NT:     none warranted (the re-commissioning is an OT/Tanakh-and-extras weave back to Gen 1:28)
--        Extras: Jubilees 6:5 (increase you and multiply... the fear of you and the dread of you I shall inspire);
--                Jubilees 6:6 (I have given to you all beasts... as the green herbs, I have given you all things to eat)
--        Tanakh: Genesis 1:28 (Be fruitful, and multiply, and replenish the earth, and subdue it; have dominion);
--                Genesis 1:27 (held for the image-of-Elohim thread, v.6)
--   ★ v.4-6 (the blood prohibition — flesh with the life thereof; blood for blood; the image of Elohim grounds the murder ban)
--        NT:     Acts 15:20 (that they abstain from... blood); Acts 15:29 (that ye abstain from... blood) — the
--                Jerusalem council keeps the Noahic blood-term for the gathered
--        Extras: Jubilees 6:8 (Whoso sheds man's blood by man shall his blood be shed; for in the image of Elohim
--                made He man); Jubilees 6:10 (Noah and his sons swore that they would not eat any blood)
--        Tanakh: Leviticus 17:11 (the life of the flesh is in the blood; given upon the altar to make atonement);
--                Leviticus 17:14 (the blood of it is for the life thereof; ye shall eat the blood of no manner of flesh);
--                Genesis 1:27 (in the image of Elohim created he him) grounding 9:6
--   ★★ v.8-17 (the everlasting covenant with Noah and ALL FLESH; I do set my bow in the cloud; the waters no more a flood)
--        NT:     Revelation 4:3 (a rainbow round about the throne); Revelation 10:1 (a rainbow was upon his head)
--        Extras: Jubilees 6:15 (He gave to Noah and his sons a sign that there should not again be a flood);
--                Jubilees 6:16 (He set His bow in the cloud for a sign of the eternal covenant)
--        Tanakh: Isaiah 54:9 (as the waters of Noah... so have I sworn that I would not be wroth with thee);
--                Isaiah 54:10 (my kindness shall not depart from thee, neither shall the covenant of my peace be removed)
--   v.18-19 (the sons of Noah — Shem, Ham, Japheth — of them the whole earth overspread)
--        NT:     none warranted (the table-of-nations seed-spread carried by Jasher's genealogy)
--        Extras: Jasher 7:1 (these are the names of the sons of Noah... children born after the flood)
--        Tanakh: none warranted distinct (Genesis 10 develops the table of nations)
--   v.20-27 (Noah's vineyard and drunkenness; Ham; the blessing of Shem and Japheth; the curse on Canaan)
--        NT:     none warranted (CAREFUL: no race-curse reading; conduct/covenant-line only)
--        Extras: Jubilees 7:10 (Cursed be Canaan; an enslaved servant shall he be to his brethren);
--                Jubilees 7:11 (Blessed be Yahuah Elohim of Shem... Elohim shall enlarge Japheth, and shall dwell
--                in the dwelling of Shem)
--        Tanakh: none warranted distinct (the seed-line to Abraham runs through Shem — Gen 11 develops it)
--   v.28-29 (Noah lived after the flood three hundred and fifty years; all his days nine hundred and fifty years)
--        NT:     none warranted
--        Extras: none warranted (the post-flood lifespan is a genealogical close, no framework weight added)
--        Tanakh: none warranted (the Genesis-5/11 longevity pattern; no distinct add)
--
-- Threads (slug -> target libraries):
--   genesis-9-be-fruitful-and-the-fear-of-you-upon-every-beast            [Tanakh+Extras]  tier extras
--   genesis-9-the-life-is-in-the-blood-and-the-image-of-elohim            [Tanakh+NT+Extras]  tier extras  ★
--   genesis-9-the-everlasting-covenant-of-the-bow-in-the-cloud            [Tanakh+NT+Extras]  tier extras  ★★ CENTERPIECE
--   genesis-9-blessed-be-the-elohim-of-shem-and-the-enlarging-of-japheth  [Extras]  tier extras
--
-- Framework-load-bearing notes:
--   v.1-3,7 RE-COMMISSIONING: framed as Genesis 1:28 spoken again over the new world — the SAME blessing
--     (be fruitful, multiply, replenish) and the SAME dominion, now carried through the flood by the preserved
--     seed-line. The fear/dread on the beasts is the dominion renewed after the world's reset, not a new mandate.
--   ★ v.4-6 THE BLOOD: this is load-bearing law. *flesh with the life thereof, which is the blood thereof, shall
--     ye not eat* (9:4) is the Noahic blood-prohibition — the life is in the blood. Woven LATERALLY to Leviticus
--     17:11 (*the life of the flesh is in the blood; and I have given it to you upon the altar to make an
--     atonement for your souls*) and 17:14 (*ye shall eat the blood of no manner of flesh*): the blood is
--     reserved BECAUSE it carries the life and is given for atonement. Woven FORWARD to Acts 15:20,29 — the
--     Jerusalem council, deciding what stands for the gathered from the nations, KEEPS the blood-term: *that
--     they abstain from... blood*. The Noahic blood-law still stands; it was never abolished. Held against the
--     1 John 2:3-4 filter — a reading that makes the blood-command irrelevant is the false reading. v.6 grounds
--     the MURDER ban in the image of Elohim (Genesis 1:27): the sanctity of human life rests on the image, not
--     on sentiment — *for in the image of Elohim (God) made he man*.
--   ★★ v.8-17 THE BOW: the everlasting covenant with Noah AND ALL FLESH — universal, unconditional, sworn by
--     Yahuah and remembered by him (the bow is for HIM to look upon, v.16). The covenant-faithfulness of Yahuah:
--     Isaiah 54:9-10 makes "the waters of Noah" the very oath-pattern of his unbreakable kindness to scattered
--     Yashar'el — *as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that
--     I would not be wroth with thee... my kindness shall not depart from thee, neither shall the covenant of my
--     peace be removed*. The Noah-covenant is the guarantee-figure of the restoration covenant. The rainbow
--     reappears round the throne (Revelation 4:3) and on the head of the mighty cloud-clothed angel (Revelation
--     10:1) — the bow of the flood-covenant standing at the consummation, the sign of mercy held over judgement.
--   v.20-27 SHEM / JAPHETH / CANAAN — CAREFUL FRAMING (read this): this is NOT a race-curse, and the thread
--     refuses any such reading. The blessing/covenant line runs through SHEM — *Blessed be Yahuah Elohim (the
--     LORD God) of Shem* (9:26) — the seed-line that carries to Abraham. Japheth's enlargement is the NATIONS
--     coming to *dwell in the tents of Shem* (9:27) — a foreshadow of the nations gathered into the covenant of
--     Shem (the two-house ingathering, never a replacement). The curse falls on CANAAN (Ham's line) for the
--     CONDUCT (the dishonouring of the father), framed as covenant-line/conduct, NEVER ethnic condemnation; the
--     victims-not-enemies posture is held. No race-curse reading is imported, and the thread says so plainly.
--     Jubilees retells it the same (curse on Canaan, blessing on Shem, Japheth enlarged); Jasher's sons-of-Noah
--     genealogy (clean vv.1-17) carries the seed-spread of the three lines after the flood.
--   GATE NOTE: Jasher 7 in this parse runs together / mis-numbers from v.18 onward (v.18 carries "15 19. ... 20.
--     ..." apparatus and the Nimrod material run into one block); ONLY clean vv.1-17 are quoted. Jubilees 6:7,
--     6:12, 7:7, 7:12 etc. are skipped numbers in this parse (gaps), avoided — only verified-present verses used.
--   Christology: the covenant of the bow is the oath of the covenant Yahuah, kept and remembered by him; no
--     co-equal-persons grammar imported. The rainbow-throne (Revelation 4:3) and the cloud-clothed angel with
--     the bow (Revelation 10:1) show the Formed One bearing the flood-covenant's sign at the end.

CREATE TEMP VIEW _s301_ge09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== cross_references ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: be fruitful and the fear of you upon every beast (the re-commissioning)
    ('canon','genesis',9,1,'canon','genesis',1,28,'free',
      E'*And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth* (Genesis 1:28). The word over Noah is the word over Adam spoken again: *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth* (Genesis 9:1). The very blessing given at the beginning is renewed over the new world — the same be-fruitful, the same multiply, the same replenish — carried through the flood by the preserved seed-line.'),
    ('canon','genesis',9,2,'canon','genesis',1,28,'free',
      E'*And have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth* (Genesis 1:28). The dominion granted at creation is renewed in the fear set upon the beasts: *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air... into your hand are they delivered* (Genesis 9:2). The dominion of Adam is restated over Noah — the creatures *delivered* into man''s hand once more after the world''s reset.'),
    ('canon','genesis',9,1,'jubilees','jubilees',6,5,'extras',
      E'*And you, increase you and multiply upon the earth, and become many upon it, and be a blessing upon it. The fear of you and the dread of you I shall inspire in everything that is on earth and in the sea* (Jubilees 6:5). The restored book carries the re-commissioning of Genesis 9:1-2 nearly word for word — *Be fruitful, and multiply, and replenish the earth* and *the fear of you and the dread of you shall be upon every beast* — one testimony that the Adamic blessing and dominion were spoken again over Noah after the flood.'),
    ('canon','genesis',9,3,'jubilees','jubilees',6,6,'extras',
      E'*And behold I have given to you all beasts, and all winged things, and everything that moves on the earth, and the fish in the waters, and all things for food; as the green herbs, I have given you all things to eat* (Jubilees 6:6). This unfolds *Every moving thing that liveth shall be meat for you; even as the green herb have I given you all things* (Genesis 9:3): the grant of the moving creatures for food, set beside the green herb of the first creation, is carried in the same words — though the very next clause of Jubilees 6:6 holds back the blood, exactly as Genesis 9:4 does.'),

    -- THREAD 2 (★): the life is in the blood, and the image of Elohim
    ('canon','genesis',9,4,'canon','leviticus',17,11,'free',
      E'*For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul* (Leviticus 17:11). The Noahic command *But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4) is given its reason in the Torah of the altar: the blood is not eaten because *the life of the flesh is in the blood*, and that life-bearing blood is *given... upon the altar to make an atonement*. The blood is reserved — it carries the life, and the life is for atonement.'),
    ('canon','genesis',9,4,'canon','leviticus',17,14,'free',
      E'*For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off* (Leviticus 17:14). Genesis 9:4 — *flesh with the life thereof, which is the blood thereof, shall ye not eat* — stands word-for-word with the statute of Leviticus: *the blood of it is for the life thereof*, therefore *ye shall eat the blood of no manner of flesh*. The blood-prohibition given to Noah for all flesh is the same law later written into the covenant of Yashar''el.'),
    ('canon','genesis',9,4,'canon','acts',15,20,'free',
      E'*But that we write unto them, that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood* (Acts 15:20). When the council at Jerusalem weighs what stands for the gathered from among the nations, it keeps the blood-term — *that they... abstain from... blood* — the very prohibition first given to Noah for all flesh in Genesis 9:4. *Things strangled* (the flesh not drained of its blood) and *blood* are named together: the Noahic blood-law was not abolished; it stands for the gathered.'),
    ('canon','genesis',9,4,'canon','acts',15,29,'free',
      E'*That ye abstain from meats offered to idols, and from blood, and from things strangled, and from fornication: from which if ye keep yourselves, ye shall do well. Fare ye well* (Acts 15:29). The decree sent to the assemblies repeats the blood-term of Genesis 9:4: *abstain... from blood, and from things strangled*. The Spirit and the elders lay it as one of the *necessary things* — the blood reserved since Noah still reserved, the standing Noahic blood-law kept for the body gathered out of the nations.'),
    ('canon','genesis',9,4,'jubilees','jubilees',6,10,'extras',
      E'*And Noah and his sons swore that they would not eat any blood that was in any flesh, and he made a covenant before Yahuah Elohim (the LORD God) for ever throughout all the generations of the earth in this month* (Jubilees 6:10). The restored witness binds Genesis 9:4 into an oath: *Noah and his sons swore that they would not eat any blood*, a covenant *for ever throughout all the generations of the earth*. The blood-prohibition is no passing rule but a sworn, perpetual covenant from the days of Noah.'),
    ('canon','genesis',9,6,'canon','genesis',1,27,'free',
      E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them* (Genesis 1:27). The murder ban rests on the image: *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). The sanctity of human life is grounded not in sentiment but in the image stamped at creation — to shed man''s blood is to assault the image of Elohim borne by every man.'),
    ('canon','genesis',9,6,'jubilees','jubilees',6,8,'extras',
      E'*Whoso sheds man''s blood by man shall his blood be shed; for in the image of Elohim (God) made He man* (Jubilees 6:8). Jubilees carries Genesis 9:6 verbatim — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man*. The witness preserves the same grounding of the murder-prohibition in the image, one continuous testimony that the life of man is sacred because man bears the image of Elohim.'),

    -- THREAD 3 (★★ CENTERPIECE): the everlasting covenant of the bow in the cloud
    ('canon','genesis',9,11,'canon','isaiah',54,9,'free',
      E'*For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee* (Isaiah 54:9). The oath of Genesis 9:11 — *neither shall all flesh be cut off any more by the waters of a flood* — becomes the very pattern of Yahuah''s unbreakable word to scattered Yashar''el. As surely as he swore *the waters of Noah should no more go over the earth*, so surely he has sworn *I would not be wroth with thee*: the Noah-covenant is the guarantee-figure of the restoration covenant.'),
    ('canon','genesis',9,13,'canon','isaiah',54,10,'free',
      E'*For the mountains shall depart, and the hills be removed; but my kindness shall not depart from thee, neither shall the covenant of my peace be removed, saith Yahuah (LORD) that hath mercy on thee* (Isaiah 54:10). *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth* (Genesis 9:13) — the bow is the visible token of a covenant that cannot fail. Isaiah reaches back to it: even if the mountains depart, *my kindness shall not depart from thee, neither shall the covenant of my peace be removed*. The covenant-faithfulness sealed by the bow is the same kindness sworn over gathered Yashar''el.'),
    ('canon','genesis',9,13,'canon','revelation',4,3,'free',
      E'*And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3). The bow Yahuah set in the cloud as the token of his covenant — *I do set my bow in the cloud* (Genesis 9:13) — encircles the throne itself: *a rainbow round about the throne*. The sign of the flood-covenant, the mercy held over judgement, stands at the very seat of Yahuah at the consummation.'),
    ('canon','genesis',9,16,'canon','revelation',10,1,'free',
      E'*And I saw another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head, and his face was as it were the sun, and his feet as pillars of fire* (Revelation 10:1). *And the bow shall be in the cloud; and I will look upon it, that I may remember the everlasting covenant* (Genesis 9:16) — the everlasting bow reappears upon the head of the mighty One *clothed with a cloud*. The cloud and the bow are together again: the Formed One bearing the sign of the flood-covenant, the everlasting covenant remembered, at the end as at the beginning.'),
    ('canon','genesis',9,15,'jubilees','jubilees',6,15,'extras',
      E'*And He gave to Noah and his sons a sign that there should not again be a flood on the earth* (Jubilees 6:15). The restored book carries the covenant-sign of Genesis 9:15 — *the waters shall no more become a flood to destroy all flesh* — as the sign *that there should not again be a flood on the earth*. One witness with the Torah that the bow is the pledge against another flood, the mercy sworn over all flesh.'),
    ('canon','genesis',9,16,'jubilees','jubilees',6,16,'extras',
      E'*He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth* (Jubilees 6:16). Jubilees names the bow exactly as Genesis 9:16 does — *the everlasting covenant between Elohim (God) and every living creature of all flesh* — calling it *a sign of the eternal covenant*. The bow in the cloud is the token of a covenant that runs *all the days of the earth*, the unfailing faithfulness of Yahuah toward all flesh.'),

    -- THREAD 4: blessed be the Elohim of Shem and the enlarging of Japheth
    ('canon','genesis',9,19,'jasher','jasher',7,1,'extras',
      E'*And these are the names of the sons of Noah: Japheth, Ham and Shem; and children were born to them after the flood, for they had taken wives before the flood* (Jasher 7:1). *These are the three sons of Noah: and of them was the whole earth overspread* (Genesis 9:19). Jasher opens the table of nations from the same three sons, naming the seed-spread after the flood: *children were born to them after the flood* — the whole earth peopled from the preserved line of Noah, the seed carried forward into the nations.'),
    ('canon','genesis',9,25,'jubilees','jubilees',7,10,'extras',
      E'*And Noah awoke from his sleep and knew all that his younger son had done to him, and he cursed his son and said: "Cursed be Canaan; an enslaved servant shall he be to his brethren"* (Jubilees 7:10). Jubilees carries Genesis 9:25 — *Cursed be Canaan; a servant of servants shall he be unto his brethren* — and frames it as the consequence of *what his younger son had done*: the word falls on Canaan for the dishonouring conduct, a judgement of behaviour within the covenant household, never a curse upon a people for their blood.'),
    ('canon','genesis',9,26,'jubilees','jubilees',7,11,'extras',
      E'*And he blessed Shem, and said: "Blessed be Yahuah Elohim (the LORD God) of Shem, and Canaan shall be his servant. Elohim (God) shall enlarge Japheth, and Elohim (God) shall dwell in the dwelling of Shem, and Canaan shall be his servant"* (Jubilees 7:11). The blessing of Genesis 9:26-27 runs through Shem — *Blessed be Yahuah Elohim (the LORD God) of Shem... Elohim (God) shall enlarge Japheth, and he shall dwell in the tents of Shem*. The covenant-line is Shem''s, the seed that carries to Abraham; Japheth''s enlargement is the nations coming to dwell in Shem''s tents — a foreshadow of the gathering, not a hierarchy of races.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== threads ==============================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-9-be-fruitful-and-the-fear-of-you-upon-every-beast',
       E'Be fruitful and the fear of you upon every beast',
       E'The new world opens with the word of the first. *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth* (Genesis 9:1); *And the fear of you and the dread of you shall be upon every beast of the earth... into your hand are they delivered* (Genesis 9:2); *Every moving thing that liveth shall be meat for you; even as the green herb have I given you all things* (Genesis 9:3). This is the blessing spoken over Adam, spoken again over Noah: *Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth* (Genesis 1:28). The same be-fruitful, the same multiply, the same dominion — the Adamic commission carried through the flood by the preserved seed-line and re-spoken over the man Yahuah kept. The restored book carries it in the same words: *And you, increase you and multiply upon the earth... The fear of you and the dread of you I shall inspire in everything that is on earth and in the sea* (Jubilees 6:5); *behold I have given to you all beasts... as the green herbs, I have given you all things to eat* (Jubilees 6:6). The blessing of the beginning is the blessing of the new beginning — one mandate, renewed.',
       sv.verse_id, ev.verse_id, 'extras', 20200
  FROM _s301_ge09_lookup sv, _s301_ge09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=9 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-9-the-life-is-in-the-blood-and-the-image-of-elohim',
       E'The life is in the blood, and the image of Elohim',
       E'Two commands are given to Noah for all flesh, and both stand. The first reserves the blood: *But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4). The Torah of the altar gives the reason — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul* (Leviticus 17:11); *the blood of it is for the life thereof... Ye shall eat the blood of no manner of flesh* (Leviticus 17:14). The blood is not eaten because it carries the life, and the life is reserved for atonement. This is no abolished rule: when the council at Jerusalem decides what stands for the gathered from the nations, it keeps the blood-term — *that they... abstain from... blood* (Acts 15:20); *abstain... from blood, and from things strangled* (Acts 15:29) — the Noahic blood-law still standing for the body gathered out of the nations. The restored book makes it an oath: *Noah and his sons swore that they would not eat any blood... a covenant before Yahuah Elohim (the LORD God) for ever* (Jubilees 6:10). The second command grounds the sanctity of life in the image: *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6) — resting on the creation word, *in the image of Elohim (God) created he him* (Genesis 1:27). To shed man''s blood is to assault the image of Elohim; Jubilees carries it verbatim — *for in the image of Elohim (God) made He man* (Jubilees 6:8). The blood reserved, and the man honoured for the image he bears.',
       sv.verse_id, ev.verse_id, 'extras', 20203
  FROM _s301_ge09_lookup sv, _s301_ge09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★ CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-9-the-everlasting-covenant-of-the-bow-in-the-cloud',
       E'The everlasting covenant of the bow in the cloud',
       E'Yahuah binds himself, and the bond is universal. *And I, behold, I establish my covenant with you, and with your seed after you* (Genesis 9:9), *And with every living creature that is with you* (Genesis 9:10), *neither shall there any more be a flood to destroy the earth* (Genesis 9:11). The token is the bow: *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth* (Genesis 9:13); *And the bow shall be in the cloud; and I will look upon it, that I may remember the everlasting covenant between Elohim (God) and every living creature of all flesh* (Genesis 9:16) — the sign is for Yahuah himself to look upon, that HE may remember. This covenant is the very oath-pattern of his faithfulness to scattered Yashar''el: *as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee* (Isaiah 54:9), *but my kindness shall not depart from thee, neither shall the covenant of my peace be removed, saith Yahuah (LORD) that hath mercy on thee* (Isaiah 54:10). The Noah-covenant is the guarantee-figure of the restoration covenant — as unbreakable as the pledge against another flood. And the bow stands at the consummation: *there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3); *a rainbow was upon his head, and his face was as it were the sun* (Revelation 10:1), upon the mighty One *clothed with a cloud*. The cloud and the bow together again. The restored book agrees in every line: *He gave to Noah and his sons a sign that there should not again be a flood on the earth* (Jubilees 6:15); *He set His bow in the cloud for a sign of the eternal covenant... all the days of the earth* (Jubilees 6:16). The bow is the covenant-faithfulness of Yahuah — mercy held over judgement, sworn to all flesh and remembered to the end.',
       sv.verse_id, ev.verse_id, 'extras', 20206
  FROM _s301_ge09_lookup sv, _s301_ge09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=9 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-9-blessed-be-the-elohim-of-shem-and-the-enlarging-of-japheth',
       E'Blessed be the Elohim of Shem and the enlarging of Japheth',
       E'The whole earth is overspread from three sons, and the covenant runs through one. *These are the three sons of Noah: and of them was the whole earth overspread* (Genesis 9:19) — Jasher opens the table of nations from the same three: *these are the names of the sons of Noah: Japheth, Ham and Shem; and children were born to them after the flood* (Jasher 7:1). Then comes the vineyard, the drunkenness, the dishonouring, and the word of Noah. Read it carefully, for it is no race-curse. The curse falls on CANAAN — Ham''s line — for the conduct, the dishonouring of the father: *And Noah awoke from his sleep and knew all that his younger son had done to him... "Cursed be Canaan; an enslaved servant shall he be to his brethren"* (Jubilees 7:10), carrying *Cursed be Canaan; a servant of servants shall he be unto his brethren* (Genesis 9:25). It is a judgement of behaviour within the covenant household, never a verdict upon a people for their blood. The BLESSING runs through SHEM: *Blessed be Yahuah Elohim (the LORD God) of Shem* (Genesis 9:26) — the seed-line that carries to Abraham, to the promise, to Messiah. And Japheth''s portion is enlargement INTO Shem''s tents: *Elohim (God) shall enlarge Japheth, and he shall dwell in the tents of Shem* (Genesis 9:27); *Elohim (God) shall enlarge Japheth, and Elohim (God) shall dwell in the dwelling of Shem* (Jubilees 7:11). This is the nations coming to dwell in the covenant of Shem — a foreshadow of the ingathering of the peoples into the tents of the seed-line, never a hierarchy of races. The covenant is Shem''s; the nations are welcomed in.',
       sv.verse_id, ev.verse_id, 'extras', 20209
  FROM _s301_ge09_lookup sv, _s301_ge09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=9 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ============================== thread_members ==============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion* (Genesis 1:28) — the Adamic blessing spoken again over Noah in Genesis 9:1.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-be-fruitful-and-the-fear-of-you-upon-every-beast'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*and have dominion over the fish of the sea, and over the fowl of the air* (Genesis 1:28) — the creation dominion renewed in the fear set on the beasts (Genesis 9:2).'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-be-fruitful-and-the-fear-of-you-upon-every-beast'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*increase you and multiply upon the earth... The fear of you and the dread of you I shall inspire* (Jubilees 6:5) — the restored book carries the re-commissioning of Genesis 9:1-2 nearly verbatim.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-be-fruitful-and-the-fear-of-you-upon-every-beast'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*as the green herbs, I have given you all things to eat* (Jubilees 6:6) — the grant of the creatures for food (Genesis 9:3), the very next clause holding back the blood as Genesis 9:4 does.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-be-fruitful-and-the-fear-of-you-upon-every-beast'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the life of the flesh is in the blood; and I have given it to you upon the altar to make an atonement* (Leviticus 17:11) — the reason the Noahic blood is reserved (Genesis 9:4): the life is for atonement.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-life-is-in-the-blood-and-the-image-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof* (Leviticus 17:14) — the statute stands word-for-word with Genesis 9:4.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-life-is-in-the-blood-and-the-image-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*that they abstain from... blood* (Acts 15:20) — the Jerusalem council keeps the Noahic blood-term for the gathered from the nations.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-life-is-in-the-blood-and-the-image-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*That ye abstain... from blood, and from things strangled* (Acts 15:29) — the decree to the assemblies, the standing Noahic blood-law kept.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-life-is-in-the-blood-and-the-image-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Noah and his sons swore that they would not eat any blood... a covenant before Yahuah Elohim (the LORD God) for ever* (Jubilees 6:10) — the blood-prohibition as a sworn, perpetual covenant from Noah.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-life-is-in-the-blood-and-the-image-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*in the image of Elohim (God) created he him* (Genesis 1:27) — the creation word that grounds the murder ban of Genesis 9:6.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-life-is-in-the-blood-and-the-image-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Whoso sheds man''s blood by man shall his blood be shed; for in the image of Elohim (God) made He man* (Jubilees 6:8) — the restored book carries Genesis 9:6 verbatim.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-life-is-in-the-blood-and-the-image-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★ centerpiece)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee* (Isaiah 54:9) — the flood-oath of Genesis 9:11 as the pattern of Yahuah''s unbreakable word to scattered Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-everlasting-covenant-of-the-bow-in-the-cloud'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*my kindness shall not depart from thee, neither shall the covenant of my peace be removed* (Isaiah 54:10) — the bow-token of Genesis 9:13 as the covenant-faithfulness sworn over gathered Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-everlasting-covenant-of-the-bow-in-the-cloud'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3) — the bow of Genesis 9:13 encircling the throne at the consummation.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-everlasting-covenant-of-the-bow-in-the-cloud'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a rainbow was upon his head... clothed with a cloud* (Revelation 10:1) — the everlasting bow of Genesis 9:16 upon the cloud-clothed mighty One, cloud and bow together at the end.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-everlasting-covenant-of-the-bow-in-the-cloud'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He gave to Noah and his sons a sign that there should not again be a flood on the earth* (Jubilees 6:15) — the covenant-sign of Genesis 9:15, the pledge against another flood.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-everlasting-covenant-of-the-bow-in-the-cloud'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*He set His bow in the cloud for a sign of the eternal covenant... all the days of the earth* (Jubilees 6:16) — the bow of Genesis 9:16 named as the sign of the eternal covenant to all flesh.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-the-everlasting-covenant-of-the-bow-in-the-cloud'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*these are the names of the sons of Noah: Japheth, Ham and Shem; and children were born to them after the flood* (Jasher 7:1) — the table of nations opening from the three sons of Genesis 9:19, the seed-spread into the earth.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=19
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-blessed-be-the-elohim-of-shem-and-the-enlarging-of-japheth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he cursed his son and said: "Cursed be Canaan; an enslaved servant shall he be to his brethren"* (Jubilees 7:10) — the curse on Canaan for the conduct (Genesis 9:25), a judgement of behaviour, never a race-curse.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=25
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-blessed-be-the-elohim-of-shem-and-the-enlarging-of-japheth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed be Yahuah Elohim (the LORD God) of Shem... Elohim (God) shall enlarge Japheth, and Elohim (God) shall dwell in the dwelling of Shem* (Jubilees 7:11) — the covenant-line through Shem and Japheth''s enlargement into Shem''s tents (Genesis 9:26-27), the nations gathered in.'
  FROM cross_reference_threads t
  JOIN _s301_ge09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=9 AND sv.verse_number=26
  JOIN _s301_ge09_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-9-blessed-be-the-elohim-of-shem-and-the-enlarging-of-japheth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_10.sql (Genesis 10) -----
-- Chapter: Genesis 10 (The Table of Nations — the seventy nations from Shem, Ham, and Japheth divided after the flood)
-- Tag: ge10   Temp view: _s301_ge10_lookup
-- Sort band: base 20225, step 3 -> threads at 20225, 20228, 20231 (3 threads)
-- Source of EVERY row: 'canon','genesis',10,v
--
-- This is a genealogical/table chapter — CURATED to 3 framework-bearing threads, NOT name-by-name.
--
-- Genesis 10 coverage:
--   v.1   (the generations of the sons of Noah — Shem, Ham, Japheth — sons born after the flood)
--        NT:     none warranted (the heading; the seed-line forward is carried elsewhere)
--        Extras: Jasher 7:1 / Jubilees 8 retell the same roster (recorded; their distinct witness is the DIVISION, THREAD 3)
--        Tanakh: 1 Chronicles 1:4 (Noah, Shem, Ham, and Japheth) — folded into THREAD 1's 1 Chron mirror
--   ★ v.2-5  (sons of Japheth; the isles of the Gentiles divided in their lands, every one after his tongue, after their families, in their nations)
--        NT:     Acts 17:26 (made of one blood all nations... determined the times... and the bounds of their habitation) — THREAD 1
--        Extras: Jubilees 9 (Japheth's portion divided by lot) — held at THREAD 3 (the division)
--        Tanakh: Deuteronomy 32:8 (divided to the nations their inheritance... set the bounds... by the number of Israel); 1 Chronicles 1:5-7 — THREAD 1
--   v.6-7  (sons of Ham; Cush, Mizraim, Phut, Canaan)
--        NT:     none warranted distinct
--        Extras: none warranted as MEMBER (rosters; THREAD 3 carries the division)
--        Tanakh: 1 Chronicles 1:8-9 (the same Ham line) — folded into THREAD 1's 1 Chron mirror
--   ★ v.8-12 (Cush begat Nimrod, a mighty one / mighty hunter before Yahuah; the beginning of his kingdom was Babel... in the land of Shinar; Nineveh built)
--        NT:     none warranted (the rebel-kingdom archetype runs through the Tanakh prophets)
--        Extras: none warranted as MEMBER (kept text-bound, no over-speculation)
--        Tanakh: Genesis 11:4 (let us build us a city and a tower... and a name); Micah 5:6 (the land of Nimrod) — THREAD 2
--   v.13-20 (Mizraim's and Canaan's lines; the border of the Canaanites; sons of Ham after their tongues, in their nations)
--        NT:     none warranted
--        Extras: none warranted distinct
--        Tanakh: 1 Chronicles 1:11-16 — folded into THREAD 1's 1 Chron mirror (v.20 refrain anchored in THREAD 1)
--   v.21-24 (Shem, father of all the children of Eber; Shem's line to Eber)
--        NT:     none warranted distinct
--        Extras: none warranted as MEMBER
--        Tanakh: 1 Chronicles 1:17-18 — folded into THREAD 1's 1 Chron mirror
--   ★ v.25   (unto Eber two sons: Peleg, for in his days was the earth divided; and Joktan)
--        NT:     none warranted
--        Extras: Jubilees 8:8 (Peleg, for in his days the children of Noah began to divide the earth); Jubilees 8:10 (divided the earth into three parts for Shem, Ham, Japheth) — THREAD 3
--        Tanakh: 1 Chronicles 1:19 (Peleg; because in his days the earth was divided) — THREAD 3
--   v.26-30 (the sons of Joktan; their dwelling)
--        NT:     none warranted
--        Extras: none warranted distinct (Jubilees 9 division held at THREAD 3 via the Peleg anchor)
--        Tanakh: 1 Chronicles 1:20-23 (the same Joktan line) — folded into THREAD 1's 1 Chron mirror
--   v.31-32 (these are the sons of Shem after their tongues, in their nations; the families of the sons of Noah... and by these were the nations divided in the earth after the flood)
--        NT:     Acts 17:26 — THREAD 1 (the summary refrain; the nations divided)
--        Extras: none warranted distinct
--        Tanakh: Deuteronomy 32:8 — THREAD 1; 1 Chronicles 1 (the whole mirror) — THREAD 1
--
-- Threads (slug — target libraries):
--   1. genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations — NT (Acts) + Tanakh (Deuteronomy, 1 Chronicles) [free]
--   2. genesis-10-nimrod-the-mighty-hunter-and-the-beginning-of-his-kingdom-was-babel — Tanakh (Genesis, Micah) [free]
--   3. genesis-10-in-the-days-of-peleg-was-the-earth-divided — Tanakh (1 Chronicles) + Extras (Jubilees) [extras]
--
-- Framing note (nations vs seed; Deuteronomy 32:8): Genesis 10 is THE NATIONS — the Genesis-1 peoples
-- (Category 3), the world enumerated and divided "after their tongues... in their nations" (10:5,20,31,32).
-- Israel is NOT yet called; the seed of promise is not separated out until Genesis 12. So the lateral weight
-- is Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he
-- separated the sons of Adam, he set the bounds of the people according to the number of the children of
-- Yashar''el (Israel)* — the dividing of THESE nations is Yahuah''s own ordering, with Israel-yet-to-come as the
-- MEASURE of the bounds. Forward, Acts 17:26 names the same: one blood, the times appointed, the bounds of
-- their habitation. Nimrod is framed as the rebel-kingdom archetype (Babel begun -> Genesis 11 -> the "land of
-- Nimrod" of Micah), kept text-bound, no over-speculation. Peleg''s "earth divided" is the dispersion the
-- restored Jubilees expands as the division of the three portions by lot. Jubilees double-written
-- 'jubilees','jubilees'. 1 Chronicles 1 is the lateral Tanakh mirror of the whole table.

CREATE TEMP VIEW _s301_ge10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Table of Nations divided after their tongues, in their nations
    ('canon','genesis',10,5,'canon','deuteronomy',32,8,'free',
      E'*When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The first dividing of the nations is recorded here: *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5). The scattering after their tongues is no accident of history — it is the El Elyon apportioning the inheritance of the nations, and the measure he sets the bounds by is the children of Yashar''el (Israel), the people not yet even called. Israel is the ruler laid across the whole Table of Nations before Israel is born.'),
    ('canon','genesis',10,32,'canon','deuteronomy',32,8,'free',
      E'*When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The chapter''s closing word is exactly this dividing: *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). Mosheh''s (Moses'') song reaches back and names the hand behind it — the El Elyon separating the sons of Adam, setting the bounds by the number of Israel — so the whole Table is read as Yahuah''s deliberate ordering, not mere genealogy.'),
    ('canon','genesis',10,32,'canon','acts',17,26,'free',
      E'*And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). Sha''ul (Paul) at Athens preaches the Table of Nations: *by these were the nations divided in the earth after the flood* (Genesis 10:32). All the nations enumerated from Shem, Ham, and Japheth are *of one blood* — one stock from Noah, from Adam — and their dividing into their lands was Yahuah determining *the times before appointed, and the bounds of their habitation*. The dispersion of Genesis 10 is the appointed ordering Acts 17 declares.'),
    ('canon','genesis',10,5,'canon','acts',17,26,'free',
      E'*And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The isles of the nations *divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5) are the very *bounds of their habitation* Sha''ul (Paul) names — one blood scattered to appointed places, each in its land and tongue, by the determining of Yahuah.'),
    ('canon','genesis',10,5,'canon','1-chronicles',1,5,'free',
      E'*The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (1 Chronicles 1:5). The chronicler opens the whole genealogy of the covenant people by reciting the Table of Nations exactly as it stands here: *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2). The nations *divided in their lands... after their families, in their nations* (Genesis 10:5) are carried forward as the trunk on which the line of Yashar''el (Israel) will be numbered.'),
    ('canon','genesis',10,32,'canon','1-chronicles',1,4,'free',
      E'*Noah, Shem, Ham, and Japheth* (1 Chronicles 1:4). The chronicler sets the three fathers of all the nations at the head of his record, just as this chapter does: *These are the families of the sons of Noah... and by these were the nations divided in the earth after the flood* (Genesis 10:32). The whole Table of Nations stands behind the genealogy of the covenant people — the nations of the earth named first, before the seed of promise is drawn out from among them.'),

    -- THREAD 2: Nimrod the mighty hunter and the beginning of his kingdom was Babel
    ('canon','genesis',10,10,'canon','genesis',11,4,'free',
      E'*And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4). The first kingdom of the earth begins here: *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10). Babel, named as the head of Nimrod''s kingdom, is the city of the next chapter — the tower built to make a name and resist the scattering Yahuah had ordained. The mighty-hunter''s empire and the tower of Shinar are one rebellion told twice.'),
    ('canon','genesis',10,9,'canon','micah',5,6,'free',
      E'*And they shall waste the land of Assyria with the sword, and the land of Nimrod in the entrances thereof: thus shall he deliver us from the Assyrian, when he cometh into our land, and when he treadeth within our borders* (Micah 5:6). Nimrod *began to be a mighty one in the earth. He was a mighty hunter before Yahuah (LORD)* (Genesis 10:8-9), and his kingdom went out from Babel into Asshur and Nineveh (Genesis 10:11). Generations later the prophet still calls the empire of the Assyrian *the land of Nimrod* — the rebel-kingdom archetype begun here endures as the name for the oppressor Yahuah will waste, and the Deliverer is the peace against it.'),

    -- THREAD 3: in the days of Peleg was the earth divided
    ('canon','genesis',10,25,'canon','1-chronicles',1,19,'free',
      E'*And unto Eber were born two sons: the name of the one was Peleg; because in his days the earth was divided: and his brother''s name was Joktan* (1 Chronicles 1:19). The chronicler preserves the very note this chapter records: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided* (Genesis 10:25). The name Peleg — division — is set as a marker in the seed-line of Shem at the moment the nations were parted into their lands, the dividing of the whole Table dated by a single birth.'),
    ('canon','genesis',10,25,'jubilees','jubilees',8,8,'extras',
      E'*And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8). The restored witness unfolds *in his days was the earth divided* (Genesis 10:25): the dividing was the sons of Noah parcelling the earth among themselves, and the child born in that hour was named for it. The terse Torah note is given its event.'),
    ('canon','genesis',10,25,'jubilees','jubilees',8,10,'extras',
      E'*And it came to pass in the beginning of the thirty-third jubilee that they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each, in the first year in the first week* (Jubilees 8:10). The earth divided in Peleg''s days — *in his days was the earth divided* (Genesis 10:25) — is the parting of the whole world into three inheritances for the three sons of Noah, the three branches the Table of Nations has just enumerated. The division is by appointed lot, each father to his portion.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations',
       E'The Table of Nations — divided after their tongues, in their nations',
       E'Genesis 10 enumerates the whole world after the flood — the seventy nations born from Shem, Ham, and Japheth — and three times marks them as parted into their lands: *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5); and at the close, *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). These are THE NATIONS — the peoples of the earth — and Israel is not yet called; the seed of promise will not be drawn out from among them until Genesis 12. Yet the dividing is no accident of history. Mosheh''s (Moses'') song names the hand behind it: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — the El Elyon apportioned the nations, and the measure he set their bounds by is the children of Yashar''el (Israel), the people not yet even born. Israel is the ruler laid across the whole Table before Israel exists. Sha''ul (Paul) preaches the same ordering at Athens: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26) — one blood, from Noah, from Adam, scattered to appointed places and times. And the chronicler of the covenant people opens his whole genealogy by reciting this very table — *Noah, Shem, Ham, and Japheth* (1 Chronicles 1:4); *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (1 Chronicles 1:5) — the nations of the earth named first, the trunk from which the seed of promise will be drawn.',
       sv.verse_id, ev.verse_id, 'free', 20225
  FROM _s301_ge10_lookup sv, _s301_ge10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=10 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-10-nimrod-the-mighty-hunter-and-the-beginning-of-his-kingdom-was-babel',
       E'Nimrod the mighty hunter — and the beginning of his kingdom was Babel',
       E'Out of the line of Ham comes the first empire-builder: *And Cush begat Nimrod: he began to be a mighty one in the earth. He was a mighty hunter before Yahuah (LORD)* (Genesis 10:8-9). His was the first kingdom of the earth, and its head was Babel: *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10), and from that land it spread to build Nineveh (Genesis 10:11). Babel here is the city of the very next chapter, where the rebellion is told in full: *let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4) — a name raised in defiance of the scattering Yahuah had ordained over the nations. The kingdom begun here becomes the type of every rebel-empire after it; generations on, the prophet still calls the land of the Assyrian oppressor by its founder''s name: *And they shall waste the land of Assyria with the sword, and the land of Nimrod in the entrances thereof: thus shall he deliver us from the Assyrian, when he cometh into our land* (Micah 5:6). The mighty hunter''s kingdom of Babel and Shinar is the archetype Yahuah will one day waste — and the Deliverer is the peace against it.',
       sv.verse_id, ev.verse_id, 'free', 20228
  FROM _s301_ge10_lookup sv, _s301_ge10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-10-in-the-days-of-peleg-was-the-earth-divided',
       E'In the days of Peleg was the earth divided',
       E'In the line of Shem a child is named for a turning of the whole world: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan* (Genesis 10:25). Peleg means division, and his birth dates the parting of the nations into their lands. The chronicler keeps the same note: *And unto Eber were born two sons: the name of the one was Peleg; because in his days the earth was divided* (1 Chronicles 1:19). The restored witness of Jubilees unfolds what the terse Torah line means: *he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8) — the dividing was the sons of Noah parcelling the world among themselves. And it tells the manner of it: *they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each* (Jubilees 8:10) — the whole earth parted by appointed lot into three inheritances for the three sons the Table of Nations has just enumerated. The dispersion of Genesis 10 is dated by a single name and shown to be a deliberate apportioning, each father to his portion.',
       sv.verse_id, ev.verse_id, 'extras', 20231
  FROM _s301_ge10_lookup sv, _s301_ge10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=10 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When the El Elyon (most High) divided to the nations their inheritance... he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — the dividing of 10:5 is Yahuah''s apportioning, measured by Israel-yet-to-come.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=5
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — the closing *by these were the nations divided* (10:32) named as the El Elyon''s deliberate ordering.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*hath made of one blood all nations of men... and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26) — Sha''ul (Paul) preaches the dividing of the nations (10:32) as Yahuah''s appointed ordering.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26) — the isles divided after their tongues (10:5) are the very bounds of habitation Sha''ul names.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=5
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (1 Chronicles 1:5) — the chronicler opens the covenant genealogy with this Table of Nations (10:2,5).'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=5
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Noah, Shem, Ham, and Japheth* (1 Chronicles 1:4) — the three fathers of all the nations (10:32) set at the head of the covenant record.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*let us build us a city and a tower... and let us make us a name, lest we be scattered* (Genesis 11:4) — Babel, the head of Nimrod''s kingdom (10:10), is the tower-city of the next chapter.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-nimrod-the-mighty-hunter-and-the-beginning-of-his-kingdom-was-babel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they shall waste... the land of Nimrod in the entrances thereof* (Micah 5:6) — the rebel-kingdom of the mighty hunter (10:8-9) endures as the prophet''s name for the oppressor Yahuah will waste.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=9
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-nimrod-the-mighty-hunter-and-the-beginning-of-his-kingdom-was-babel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the name of the one was Peleg; because in his days the earth was divided* (1 Chronicles 1:19) — the chronicler keeps the division-marker of 10:25 in the line of Shem.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-in-the-days-of-peleg-was-the-earth-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8) — the restored witness names the event behind *in his days was the earth divided* (10:25).'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-in-the-days-of-peleg-was-the-earth-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each* (Jubilees 8:10) — the earth divided in Peleg''s days (10:25) parted by lot into three inheritances for the three sons.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-in-the-days-of-peleg-was-the-earth-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_11.sql (Genesis 11) -----
-- Chapter: Genesis 11 (Babel — the one language, the tower, the scattering; the generations of Shem to Abram; Terah, Abram, Sarai, Ur toward Canaan)
-- Tag: ge11   Temp view: _s301_ge11_lookup
-- Sort band: base 20250, step 3 -> threads at 20250, 20253, 20256, 20259 (4 threads)
-- Source of EVERY row: 'canon','genesis',11,v
--
-- Genesis 11 coverage:
--   ★★ v.1-9 (the whole earth one language; let us build us a city and a tower whose top may reach unto heaven; let us make us a name; Yahuah comes down, confounds the tongue, scatters them; Babel)
--        NT:     Acts 2:4,6 (Pentecost/Shavuot — every man heard them speak in his own language; the REVERSAL of the Babel-scattering, firstfruits of the regathering) — THREAD 1 (load-bearing)
--        Extras: Jubilees 10:19 (they built the city and the tower, "let us ascend thereby into heaven"); Jubilees 10:22 (Behold they are one people... let us go down and confound their language); Jubilees 10:25 (called Babel, because Yahuah did there confound the language) — THREAD 1
--        Tanakh: Zephaniah 3:9 (then will I turn to the people a pure language, that they may all call upon the name of Yahuah) — THREAD 1; Genesis 12:2 (I will... make thy name great — contrast: men make their own name vs Yahuah makes Abram's) — THREAD 1
--   v.8-9 (Yahuah scattered them abroad upon the face of all the earth; the confusion as judgment-yet-mercy restraining the rebellion; the nations divided)
--        NT:     none warranted (the scattering's forward weave is the Pentecost reversal at THREAD 1; the calling of one seed-line begins at THREAD 3)
--        Extras: none warranted distinct as MEMBER (Jubilees scattering carried at THREAD 1; Jasher 9 tower-block is a run-together/mis-numbered parse — AVOIDED)
--        Tanakh: Deuteronomy 32:8 (when El Elyon divided to the nations their inheritance... according to the number of the children of Yashar'el); Genesis 10:32 (by these were the nations divided in the earth after the flood); Genesis 10:25 (in his days was the earth divided — Peleg) — THREAD 2
--   ★ v.10-26 (the generations of Shem: Shem, Arphaxad, Salah, Eber, Peleg, Reu, Serug, Nahor, Terah, and Abram — the seed-line NARROWING toward the call of Gen 12)
--        NT:     Luke 3:34-36 (the genealogy of the Son of Adam through Thara/Saruch/Ragau/Phalec/Heber/Sala/Arphaxad/Sem — the same line, run forward to Messiah) — THREAD 3 (load-bearing)
--        Extras: none warranted as MEMBER (Jubilees 10:18/11 retell the Peleg/Reu line; their distinctive witness is Abram's idol-rejection, carried at THREAD 4)
--        Tanakh: Genesis 10:24-25 (Arphaxad begat Salah; Salah begat Eber; Eber's sons Peleg/Joktan) — folded into THREAD 2/3 framing; Genesis 12:1 the line's destination — THREAD 3
--   v.27-32 (the generations of Terah: Abram, Nahor, Haran; Haran begat Lot, died in Ur of the Chaldees; Abram took Sarai; Sarai barren; Terah took them from Ur toward Canaan, stopped in Haran; Terah died in Haran)
--        NT:     Acts 7:2-4 (Stephen: the Elohim of glory appeared to Abraham in Mesopotamia, before he dwelt in Charran; came out of the land of the Chaldaeans) — THREAD 4
--        Extras: Jubilees 11:14 (the child Abram began to understand the errors of the earth... separated himself that he might not worship idols); Jubilees 12:2 (Abram to Terah: what profit from those idols... worship the Elohim of heaven); Jubilees 12:12 (Abram arose by night and burned the house of the idols); Jasher 9:6 (Abram knew Yahuah from three years old... all the sons of the earth served other gods) — THREAD 4
--        Tanakh: Joshua 24:2 (your fathers dwelt on the other side of the flood... Terah... and they served other gods); Genesis 12:1 (the call: get thee out of thy country, from thy kindred, from thy father's house) — THREAD 4
--        Note: Sarai's barrenness (v.30) recorded as the promise-against-barrenness setup; framed within THREAD 4 prose (the call comes against an empty womb), no separate barrenness-thread warranted for this chapter.
--
-- Threads (slug — target libraries):
--   1. genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal — NT (Acts) + Tanakh (Zephaniah, Genesis) + Extras (Jubilees) [extras] (CENTERPIECE)
--   2. genesis-11-yahuah-scattered-them-and-the-nations-were-divided — Tanakh (Deuteronomy, Genesis) [free]
--   3. genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram — NT (Luke) + Tanakh (Genesis) [free]
--   4. genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry — NT (Acts) + Tanakh (Joshua, Genesis) + Extras (Jubilees, Jasher) [extras]
--
-- Framing notes:
--   ★★ BABEL -> PENTECOST REVERSAL (THREAD 1, load-bearing): the men of Shinar make themselves ONE in
--   rebellion and set out to *make us a name* (Genesis 11:4) — unity-in-rebellion, a name seized for self.
--   Yahuah confounds the one tongue and scatters them. The forward weave is Acts 2: at Shavuot the SAME
--   scattered nations *heard them speak in his own language* (Acts 2:6) — the Babel-scattering beginning to be
--   UNDONE, the firstfruits of the regathering of the dispersed (the two-house ingathering in seed form).
--   Zephaniah 3:9 names the consummation — *a pure language, that they may all call upon the name of Yahuah*.
--   And the chapter's own answer to the seized name: the very next chapter, Yahuah MAKES a name for Abram
--   (*make thy name great*, Genesis 12:2) — what man grasps at Babel, Yahuah gives to the one He calls.
--   ★ THE SEED-LINE NARROWING (THREAD 3, load-bearing): the toledot of Shem funnels down through Eber and
--   Peleg to Terah and to ABRAM — the whole seed-of-promise line converging on the man Gen 12 will call;
--   Luke 3:34-36 runs the same names forward to the Son of Adam.
--   ABRAM CALLED OUT OF IDOLATRY (THREAD 4): Joshua 24:2 and Acts 7:2-4 establish that the fathers beyond
--   the river served other gods — Abram is called OUT; the restored witnesses (Jubilees 11-12, Jasher 9)
--   unfold the young Abram rejecting and burning the idols. Sarai's barrenness sets the promise against an
--   empty womb.
--   AVOIDED as MEMBER: Jasher 9 tower-block (verse 7 is a run-together/mis-numbered parse swallowing vv.7-39
--   with embedded verse digits — known-bad-parse rule); used only the clean Jasher 9:6. Jubilees double-written
--   'jubilees','jubilees'; Jasher double-written 'jasher','jasher'.

CREATE TEMP VIEW _s301_ge11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (CENTERPIECE): let us make us a name — Babel and the Pentecost reversal
    ('canon','genesis',11,4,'canon','acts',2,6,'free',
      E'*Now when this was noised abroad, the multitude came together, and were confounded, because that every man heard them speak in his own language* (Acts 2:6). At Babel the men of Shinar said *let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4) — and were scattered, their one tongue confounded. At Shavuot the scattered nations are gathered to Jerusalem and *every man heard them speak in his own language* — the very confounding of Babel beginning to be undone, the firstfruits of the regathering of the dispersed.'),
    ('canon','genesis',11,7,'canon','acts',2,4,'free',
      E'*And they were all filled with the Ruach HaKodesh (Holy Spirit), and began to speak with other tongues, as the Spirit gave them utterance* (Acts 2:4). At Babel Yahuah said *let us go down, and there confound their language, that they may not understand one another''s speech* (Genesis 11:7); at Pentecost the Spirit gives tongues so that men of every nation DO understand — the scattering of the one tongue answered by a Spirit-given hearing across the nations.'),
    ('canon','genesis',11,9,'canon','acts',2,6,'free',
      E'*the multitude came together, and were confounded, because that every man heard them speak in his own language* (Acts 2:6). *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth* (Genesis 11:9). The word over Babel is *confound* and *scatter*; the word over Shavuot is the same crowd *confounded* — but now by hearing, not by losing, the tongues. Babel''s scattering and Pentecost''s gathering stand face to face.'),
    ('canon','genesis',11,9,'canon','zephaniah',3,9,'free',
      E'*For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9). Babel ends with *the language of all the earth* confounded and the peoples scattered (Genesis 11:9); the prophet names the consummation — not a return to one rebel speech, but a *pure language* given so that *they may all call upon the name of Yahuah* with one consent. The undoing of Babel finishes in worship, not in a tower.'),
    ('canon','genesis',11,4,'canon','genesis',12,2,'free',
      E'*And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2). At Babel men say *let us make us a name* (Genesis 11:4) — a name seized by their own hands, raised on a tower toward heaven. The very next breath of the story is Yahuah''s answer: He will *make thy name great* for Abram. What the builders grasp at, Yahuah gives to the one He calls — the made name comes by the promise, not by the brick.'),
    ('canon','genesis',11,4,'jubilees','jubilees',10,19,'extras',
      E'*For they departed from the land of Ararat eastward to Shinar; for in his days they built the city and the tower, saying, "Go to, let us ascend thereby into heaven."* (Jubilees 10:19). The restored witness names the heart of *let us build us a city and a tower, whose top may reach unto heaven* (Genesis 11:4): not a building project but an ascent — men purposing to climb to heaven by their own work.'),
    ('canon','genesis',11,6,'jubilees','jubilees',10,22,'extras',
      E'*And Yahuah our Elohim (the LORD our God) said to us: "Behold, they are one people, and (this) they begin to do, and now nothing will be withholden from them. Go to, let us go down and confound their language, that they may not understand one another''s speech..."* (Jubilees 10:22). The same divine deliberation of *Behold, the people is one, and they have all one language... let us go down, and there confound their language* (Genesis 11:6-7) is preserved word for word — the unity-in-rebellion restrained by the confounding of the tongue.'),
    ('canon','genesis',11,9,'jubilees','jubilees',10,25,'extras',
      E'*For this reason the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation* (Jubilees 10:25). The naming of *Babel* and the *confounding* and *scattering* of Genesis 11:9 are carried in the restored witness with the same cause and the same dispersal — each according to his language and his nation.'),

    -- THREAD 2: Yahuah scattered them, and the nations were divided
    ('canon','genesis',11,8,'canon','deuteronomy',32,8,'free',
      E'*When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The scattering of *Yahuah (LORD) scattered them abroad from thence upon the face of all the earth* (Genesis 11:8) was not chaos but a dividing: the El Elyon set the bounds of the nations — and set them *according to the number of the children of Yashar''el*, the scattering already ordered toward the covenant people who would be called out of it.'),
    ('canon','genesis',11,9,'canon','genesis',10,32,'free',
      E'*These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). The table of nations had already said the peoples were *divided in the earth after the flood*; Genesis 11:9 tells how — *from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth*. The dividing of the nations and the scattering at Babel are one event seen from two sides.'),
    ('canon','genesis',11,8,'canon','genesis',10,25,'free',
      E'*And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan* (Genesis 10:25). The seed-line itself bears the memorial of the scattering: Peleg is named because *in his days was the earth divided* — the dividing of Genesis 11:8, when *Yahuah (LORD) scattered them abroad*, marked into the very genealogy that runs down to Abram.'),

    -- THREAD 3: the generations of Shem — the seed-line narrowing to Abram
    ('canon','genesis',11,10,'canon','luke',3,36,'free',
      E'*Which was the son of Cainan, which was the son of Arphaxad, which was the son of Sem, which was the son of Noe, which was the son of Lamech* (Luke 3:36). *These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood* (Genesis 11:10). The toledot of Shem that opens here — Shem begat Arphaxad — is run forward, in reverse, to the Son of Adam: *the son of Arphaxad, which was the son of Sem*. The line of promise narrowing through Shem is the same line climbing to Messiah.'),
    ('canon','genesis',11,16,'canon','luke',3,35,'free',
      E'*Which was the son of Saruch, which was the son of Ragau, which was the son of Phalec, which was the son of Heber, which was the son of Sala* (Luke 3:35). The middle of the Shem toledot — *Salah... begat Eber... Eber... begat Peleg... Peleg... begat Reu... Reu... begat Serug* (Genesis 11:14-22) — is the very stretch the Spirit recites forward to Messiah: Sala, Heber, Phalec, Ragau, Saruch. Every link of the narrowing seed-line is accounted for in the genealogy of the Son of Adam.'),
    ('canon','genesis',11,26,'canon','luke',3,34,'free',
      E'*Which was the son of Jacob, which was the son of Isaac, which was the son of Abraham, which was the son of Thara, which was the son of Nachor* (Luke 3:34). The Shem toledot reaches its goal: *And Terah lived seventy years, and begat Abram, Nahor, and Haran* (Genesis 11:26). The line that has been funneling down through Eber and Peleg lands on Terah and Abram — and Luke runs it on: *the son of Abraham, which was the son of Thara* — the whole seed-of-promise converging on the man Gen 12 will call.'),

    -- THREAD 4: Terah took Abram from Ur — the call out of idolatry
    ('canon','genesis',11,31,'canon','joshua',24,2,'free',
      E'*Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). When *Terah took Abram his son... and they went forth with them from Ur of the Chaldees, to go into the land of Canaan* (Genesis 11:31), the house leaving Ur was an idolatrous house — Yahushua (Joshua) names it plainly: Terah *served other gods*. Abram is called out of idolatry, not out of righteousness already kept.'),
    ('canon','genesis',11,28,'canon','acts',7,2,'free',
      E'*The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2). Genesis 11 leaves Abram *in Ur of the Chaldees* (Genesis 11:28) and then in Haran; Stephen fills in what the chapter only frames — that the *Elohim of glory* had already appeared to Abraham *in Mesopotamia, before he dwelt in Charran*. The call did not begin in Haran; it found Abram in the land of his idolatrous fathers.'),
    ('canon','genesis',11,31,'canon','acts',7,4,'free',
      E'*Then came he out of the land of the Chaldaeans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land, wherein ye now dwell* (Acts 7:4). The journey of Genesis 11:31 — *from Ur of the Chaldees... and they came unto Haran, and dwelt there* — is read forward by Stephen as the obedience of the call: out of the land of the Chaldaeans to Charran, and from thence, after Terah died (Genesis 11:32), on into the land of promise.'),
    ('canon','genesis',11,31,'canon','genesis',12,1,'free',
      E'*Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). The setting-out of *Terah took Abram his son... to go into the land of Canaan* (Genesis 11:31) is the leading edge of the word that had already come: *Get thee out of thy country, and from thy kindred, and from thy father''s house*. The move from Ur toward Canaan is the first step of the call that gathers force in the next chapter.'),
    ('canon','genesis',11,28,'jubilees','jubilees',11,14,'extras',
      E'*And the child began to understand the errors of the earth that all went astray after graven images and after uncleanness... and he separated himself from his father that he might not worship idols with him* (Jubilees 11:14). While Genesis 11 only names Ur of the Chaldees (Genesis 11:28), the restored witness tells what Abram saw there: a whole earth gone astray after graven images, and the young Abram separating himself from his own father''s idolatry.'),
    ('canon','genesis',11,28,'jubilees','jubilees',12,2,'extras',
      E'*"What help and profit have we from those idols which you do worship... For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth..."* (Jubilees 12:2). The Ur that Abram is called out of (Genesis 11:28,31) was a house of idols, and the restored witness puts Abram''s confession in his mouth: the idols are dumb forms; worship instead the Elohim of heaven who made all things.'),
    ('canon','genesis',11,31,'jubilees','jubilees',12,12,'extras',
      E'*And in the sixtieth year of the life of Abram... Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it* (Jubilees 12:12). Before *they went forth... from Ur of the Chaldees* (Genesis 11:31), the restored witness records Abram''s decisive break with his fathers'' gods — he burned the house of the idols by night. The departure from Ur was a flight from idolatry already renounced.'),
    ('canon','genesis',11,31,'jasher','jasher',9,6,'extras',
      E'*And Abram... knew Yahuah (the Lord) from three years old, and he went in the ways of Yahuah (the Lord) until the day of his death... and all the sons of the earth in those days greatly transgressed against Yahuah (the Lord)... and they served other gods, and they forgot Yahuah (the Lord) who had created them* (Jasher 9:6). Against the backdrop of a whole earth serving *gods of wood and stone*, Abram knew Yahuah from his earliest childhood. When Terah''s house leaves Ur (Genesis 11:31), it is Abram — alone in his generation knowing Yahuah — whom the promise will follow.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal',
       E'Let us make us a name — Babel and the Pentecost reversal',
       E'The whole earth is *of one language, and of one speech* (Genesis 11:1), and the men of Shinar bend that unity to rebellion: *Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4). They grasp at a name for themselves and at heaven by their own brick. Yahuah comes down — *Behold, the people is one, and they have all one language... Go to, let us go down, and there confound their language* (Genesis 11:6-7) — and *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth* (Genesis 11:9). The restored witness tells the same event: they built the tower *saying, "Go to, let us ascend thereby into heaven"* (Jubilees 10:19); Yahuah said *"let us go down and confound their language"* (Jubilees 10:22); and *the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men* (Jubilees 10:25). Now weave forward. At Shavuot the SAME scattered nations are gathered to Jerusalem, and *they were all filled with the Ruach HaKodesh (Holy Spirit), and began to speak with other tongues* (Acts 2:4), so that *every man heard them speak in his own language* (Acts 2:6) — the confounding of Babel beginning to be undone, the firstfruits of the regathering of the dispersed. The prophet names the consummation: *then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9). And the chapter''s own answer to the seized name comes in the next breath of the story: where the builders said *let us make us a name*, Yahuah says to Abram, *I will... make thy name great* (Genesis 12:2). What man grasps at on a tower, Yahuah gives by promise to the one He calls.',
       sv.verse_id, ev.verse_id, 'extras', 20250
  FROM _s301_ge11_lookup sv, _s301_ge11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-11-yahuah-scattered-them-and-the-nations-were-divided',
       E'Yahuah scattered them — and the nations were divided',
       E'*So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8). The scattering looks like pure judgment, but it is judgment-yet-mercy: it restrains the unity-in-rebellion and sets the bounds of the nations. The table of nations had already said it: *by these were the nations divided in the earth after the flood* (Genesis 10:32) — and the seed-line itself bears the memorial, for Peleg is named *for in his days was the earth divided* (Genesis 10:25). Mosheh (Moses) gives the dividing its deepest frame: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The scattering at Babel is not chaos; the El Elyon orders it — and orders it toward the covenant people who will be called out of the divided nations. The restraining of the tower clears the ground for the calling of one seed-line out of the many.',
       sv.verse_id, ev.verse_id, 'free', 20253
  FROM _s301_ge11_lookup sv, _s301_ge11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram',
       E'The generations of Shem — the seed-line narrowing to Abram',
       E'After the nations are scattered, the camera narrows to one line: *These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood* (Genesis 11:10) — and on through Salah, Eber, Peleg, Reu, Serug, Nahor, until *Terah lived seventy years, and begat Abram, Nahor, and Haran* (Genesis 11:26). Out of the divided nations of Babel, Yahuah funnels the promise down a single seed-line to the man He is about to call. The Spirit runs the same names forward to the Son of Adam: *the son of Sem, which was the son of Noe* (Luke 3:36); *the son of Saruch, which was the son of Ragau, which was the son of Phalec, which was the son of Heber, which was the son of Sala* (Luke 3:35); *the son of Abraham, which was the son of Thara, which was the son of Nachor* (Luke 3:34). Every link of the narrowing in Genesis 11 is a link in the genealogy of Messiah. The toledot of Shem is the trunk of the seed of promise, converging on Abram and running on to the Son of Adam.',
       sv.verse_id, ev.verse_id, 'free', 20256
  FROM _s301_ge11_lookup sv, _s301_ge11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=11 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry',
       E'Terah took Abram from Ur — the call out of idolatry',
       E'The chapter ends with a journey begun: *And Terah took Abram his son, and Lot the son of Haran his son''s son, and Sarai his daughter in law, his son Abram''s wife; and they went forth with them from Ur of the Chaldees, to go into the land of Canaan; and they came unto Haran, and dwelt there* (Genesis 11:31) — and *Sarai was barren; she had no child* (Genesis 11:30). The promise sets out against an empty womb, from an idolatrous house. Yahushua (Joshua) names the house plainly: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods* (Joshua 24:2). Abram is called OUT of idolatry, not out of righteousness already his. Stephen fills in the timing the chapter only frames: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2), and *Then came he out of the land of the Chaldaeans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land* (Acts 7:4) — the obedience of the word that had already come: *Get thee out of thy country, and from thy kindred, and from thy father''s house* (Genesis 12:1). The restored witnesses unfold the young Abram in that idolatrous Ur: *the child began to understand the errors of the earth that all went astray after graven images... and he separated himself from his father that he might not worship idols with him* (Jubilees 11:14); he pressed his father, *"Worship the Elohim (God) of heaven... Worship them not"* (Jubilees 12:2); and at last *Abram arose by night, and burned the house of the idols* (Jubilees 12:12). Jasher remembers it the same: *Abram... knew Yahuah (the Lord) from three years old... and all the sons of the earth in those days greatly transgressed against Yahuah... and they served other gods* (Jasher 9:6). When Terah''s house leaves Ur, the promise follows the one man who already knew Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 20259
  FROM _s301_ge11_lookup sv, _s301_ge11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*every man heard them speak in his own language* (Acts 2:6) — the Babel-scattering of *let us make us a name, lest we be scattered* (11:4) beginning to be undone at Shavuot.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*began to speak with other tongues, as the Spirit gave them utterance* (Acts 2:4) — the confounded tongue of *there confound their language* (11:7) answered by a Spirit-given hearing across the nations.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=7
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the multitude... were confounded, because that every man heard them speak in his own language* (Acts 2:6) — Babel''s *confound* and *scatter* (11:9) set face to face with Pentecost''s gathering.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will turn to the people a pure language, that they may all call upon the name of Yahuah (LORD)* (Zephaniah 3:9) — the undoing of Babel''s confounded tongue (11:9) finished in one-consent worship.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will... make thy name great* (Genesis 12:2) — the made name Yahuah gives Abram, against the seized name of *let us make us a name* (11:4).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they built the city and the tower, saying, "Go to, let us ascend thereby into heaven"* (Jubilees 10:19) — the heart of *whose top may reach unto heaven* (11:4): an ascent by men''s own work.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*"Behold, they are one people... let us go down and confound their language"* (Jubilees 10:22) — the divine deliberation of *the people is one... let us go down* (11:6-7) preserved word for word.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language* (Jubilees 10:25) — the naming and scattering of 11:9 carried with the same cause.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When the El Elyon (most High) divided to the nations their inheritance... according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — the scattering of 11:8 ordered toward the covenant people.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-yahuah-scattered-them-and-the-nations-were-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*by these were the nations divided in the earth after the flood* (Genesis 10:32) — the dividing of the nations and the scattering of 11:9 are one event from two sides.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-yahuah-scattered-them-and-the-nations-were-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the name of one was Peleg; for in his days was the earth divided* (Genesis 10:25) — the dividing of 11:8 marked into the seed-line that runs to Abram.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-yahuah-scattered-them-and-the-nations-were-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the son of Arphaxad, which was the son of Sem, which was the son of Noe* (Luke 3:36) — the head of the Shem toledot (11:10) run forward to the Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=10
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the son of Ragau, which was the son of Phalec, which was the son of Heber, which was the son of Sala* (Luke 3:35) — the middle of the Shem line (11:14-22) accounted for in Messiah''s genealogy.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=16
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the son of Abraham, which was the son of Thara, which was the son of Nachor* (Luke 3:34) — the seed-line landing on Terah and Abram (11:26), run on to Messiah.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=26
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Your fathers dwelt on the other side of the flood... even Terah... and they served other gods* (Joshua 24:2) — the house leaving Ur (11:31) was idolatrous; Abram called OUT of it.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2) — the call found Abram in Ur (11:28), not first in Haran.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=28
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then came he out of the land of the Chaldaeans, and dwelt in Charran: and from thence... he removed him into this land* (Acts 7:4) — the journey of 11:31-32 read as the obedience of the call.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Get thee out of thy country, and from thy kindred, and from thy father''s house* (Genesis 12:1) — the word already given, of which the leaving of Ur (11:31) is the first step.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the child began to understand the errors of the earth... and he separated himself from his father that he might not worship idols with him* (Jubilees 11:14) — the young Abram in idolatrous Ur (11:28).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=28
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=11 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*"Worship the Elohim (God) of heaven... Worship them not"* (Jubilees 12:2) — Abram''s confession against the dumb idols of the Ur he is called out of (11:28,31).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=28
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Abram arose by night, and burned the house of the idols* (Jubilees 12:12) — the decisive break with his fathers'' gods before the leaving of Ur (11:31).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Abram... knew Yahuah (the Lord) from three years old... and all the sons of the earth... served other gods* (Jasher 9:6) — the one man in his generation knowing Yahuah, whom the promise follows out of Ur (11:31).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_12.sql (Genesis 12) -----
-- Chapter: Genesis 12 (the call of Abram — the Abrahamic covenant inaugurated; get thee out; I will make of thee a great nation and in thee shall all families of the earth be blessed; Abram obeys and goes; the altars at Shechem and Bethel, calling on the Name; unto thy seed will I give this land; the famine, Egypt, Sarai taken by Pharaoh, Yahuah plagues Pharaoh's house)
-- Tag: ge12   Temp view: _s301_ge12_lookup
-- Sort band: base 20275, step 3 -> threads at 20275, 20278, 20281 (3 threads)
-- Source of EVERY row: 'canon','genesis',12,v
--
-- Genesis 12 coverage:
--   ★★ v.1-3 (Get thee out of thy country, and from thy kindred, and from thy father's house; I will make of thee a great nation, and I will bless thee, and make thy name great; and in thee shall all families of the earth be blessed) — the Abrahamic covenant, the seed-promise begun
--        NT:     Galatians 3:8 (the scripture, foreseeing that Elohim would justify the heathen through faith, preached before the gospel unto Abraham, In thee shall all nations be blessed); Galatians 3:16 (to thy seed... which is Messiah — the seed singular); Galatians 3:29 (if ye be Messiah's, then are ye Abraham's seed); Acts 3:25 (the children of the covenant... in thy seed shall all the kindreds of the earth be blessed); Hebrews 11:8 (by faith Abraham, when he was called... obeyed) — THREAD 1 (load-bearing)
--        Extras: Jubilees 12:22 (the call delivered through the angel: Get you up from your country... and in you will all families of the earth be blessed); Jasher 13:23 (Go forth from your land... in you shall the families of the earth be blessed) — THREAD 1
--        Tanakh: Isaiah 51:2 (Look unto Abraham your father, and unto Sarah... for I called him alone, and blessed him, and increased him); Jeremiah 31:10 (He that scattered Yashar'el will gather him — the seed scattered through the nations, gathered home: the mechanism of the all-families blessing) — THREAD 1
--   ★ v.4-9 (So Abram departed, as Yahuah had spoken; Lot went with him; into Canaan they came; Yahuah appeared, Unto thy seed will I give this land; he builded an altar at Sichem; removed to Beth-el, builded an altar, and called upon the name of Yahuah) — the obedience, the land-promise to the seed, the first altars, calling on the Name
--        NT:     Hebrews 11:9 (by faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles); Hebrews 11:10 (he looked for a city which hath foundations, whose builder and maker is Elohim); Acts 7:5 (he gave him none inheritance in it... yet he promised that he would give it to him for a possession, and to his seed after him) — THREAD 2
--        Extras: Jubilees 13:1 (Abram journeyed from Haran... and proceeded to Shechem); Jubilees 13:7 (he built an altar... and called on the name of Yahuah); Jasher 13:7 (This is the land which I gave to you and to your seed after you forever); Jasher 13:8 (Abram built an altar... and called upon the name of Yahuah); Jasher 13:28 (To your seed will I give this land; and he there built an altar) — THREAD 2
--        Tanakh: Genesis 15:18 (Unto thy seed have I given this land, from the river of Egypt unto the great river Euphrates — the land-grant confirmed by covenant-cutting); Genesis 22:18 (in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice — the oath sealing the call); Psalm 105:8-11 (he hath remembered his covenant... Unto thee will I give the land of Canaan) — THREAD 2
--   v.10-20 (a famine in the land; Abram went down into Egypt; Sarai a fair woman, taken into Pharaoh's house; Yahuah plagued Pharaoh and his house with great plagues because of Sarai; Pharaoh sends them away) — the seed-bearer preserved; the foreshadow of the later Egypt descent and the exodus plagues
--        NT:     Hebrews 11:11 (through faith also Sara herself received strength to conceive seed... because she judged him faithful who had promised — the womb that carries the promise, here preserved in Pharaoh's house) — THREAD 3
--        Extras: Jubilees 13:11 (Abram went into Egypt... before his wife was torn away from him); Jubilees 13:12 (when Pharaoh seized Sarai... Yahuah plagued Pharaoh and his house with great plagues because of Sarai, Abram's wife) — THREAD 3
--        Tanakh: Psalm 105:13-15 (He suffered no man to do them wrong: yea, he reproved kings for their sakes; Touch not mine anointed, and do my prophets no harm — the covenant line shielded against kings, this very episode read as a pattern) — THREAD 3
--        Note: the Egypt-descent / Pharaoh-plagued episode is the SEED of the later Exodus pattern (the chosen line goes down to Egypt, is endangered, and Yahuah strikes Pharaoh with plagues to deliver them); framed here as the preservation of the promise against threat, not yet pulled forward to Exodus 12 as a member (that fulfilment belongs to the Genesis 15:13 / Exodus chapters proper). Recorded so no library is silently skipped.
--
-- Threads (slug — target libraries):
--   1. genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed — NT (Galatians, Acts, Hebrews) + Extras (Jubilees, Jasher) + Tanakh (Isaiah, Jeremiah) [extras] (CENTERPIECE)
--   2. genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name — NT (Hebrews, Acts) + Extras (Jubilees, Jasher) + Tanakh (Genesis, Psalm) [extras]
--   3. genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues — NT (Hebrews) + Extras (Jubilees) + Tanakh (Psalm) [extras]
--
-- Framing notes:
--   ★★ THE CALL OF ABRAM — ALL FAMILIES BLESSED IN THE SEED (THREAD 1, load-bearing; the careful 12:3 framing):
--   The promise *in thee shall all families of the earth be blessed* (12:3) is NOT the false-inclusion graft
--   of non-seed peoples into Yashar'el by faith-confession. It is the seed-of-promise — narrowed to ONE,
--   *to thy seed... which is Messiah* (Galatians 3:16) — through whom the blessing flows out; the scattered
--   covenant line (*He that scattered Yashar'el will gather him*, Jeremiah 31:10) gathered home, and the
--   nations blessed THROUGH the seed. Galatians 3:8's *all nations be blessed* and Acts 3:25's *all the
--   kindreds of the earth* are read in exactly this register: the heathen blessed BY being brought into the
--   one seed (those who *be of faith are blessed with faithful Abraham*, Gal 3:9; *if ye be Messiah's, then
--   are ye Abraham's seed, and heirs according to the promise*, Gal 3:29) — incorporation into the seed-line,
--   never replacement of it, never a parallel people grafted in by confession alone. The seed is singular and
--   personal (Messiah), and through him the many. Abraham's part is FAITH-THAT-OBEYS: *by faith Abraham, when
--   he was called... obeyed* (Hebrews 11:8) — the obedience the brief's 1 John 2:3-4 filter requires, not
--   bare confession. "MAKE THY NAME GREAT" (12:2): Yahuah MAKES the name — the deliberate answer to Babel,
--   where men said *let us make us a name* (Genesis 11:4) and grasped it by their own brick; here the name is
--   GIVEN by promise to the one He calls (carried in this Genesis cross-pack at the Gen 11 thread; surfaced
--   again in the summary here).
--   ★ UNTO THY SEED THIS LAND — THE ALTARS AND THE NAME (THREAD 2): the land-promise is to the SEED
--   (*unto thy seed will I give this land*, 12:7), confirmed by covenant-cutting (Genesis 15:18) and sworn by
--   oath (Genesis 22:18); Abram receives *none inheritance in it* (Acts 7:5) and dwells as a sojourner
--   *looking for a city which hath foundations* (Hebrews 11:10) — the land-promise held by faith, not yet
--   possessed. The first altars and the *calling upon the name of Yahuah* (12:8) are the worship the wandering
--   covenant-man plants in the land.
--   THE SEED-BEARER PRESERVED (THREAD 3): Sarai — the womb that carries the promise (Hebrews 11:11) — is
--   protected in Pharaoh's house by the plagues Yahuah brings; Psalm 105:14-15 reads the very episode as the
--   pattern, *he reproved kings for their sakes; Touch not mine anointed*. The Egypt-descent and Pharaoh-
--   plagued deliverance are the SEED of the Exodus pattern (recorded in coverage; framed as preservation of
--   the covenant line against threat).
--   Jubilees double-written 'jubilees','jubilees'; Jasher double-written 'jasher','jasher'. All extras pulls
--   verified clean (Jubilees 12-13, Jasher 13 — no apparatus noise in the quoted verses).

CREATE TEMP VIEW _s301_ge12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (CENTERPIECE): get thee out — the call of Abram and the seed in whom all families are blessed
    ('canon','genesis',12,3,'canon','galatians',3,8,'free',
      E'*And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* (Galatians 3:8). The word over Abram — *in thee shall all families of the earth be blessed* (Genesis 12:3) — is named here as the gospel preached BEFOREHAND: the heathen are blessed by being justified through the faith of Abraham, brought INTO the one seed-line, not grafted in as a second people. The blessing of all families is the seed of promise flowing out to the nations, never a replacement of the seed by confession.'),
    ('canon','genesis',12,3,'canon','galatians',3,16,'free',
      E'*Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16). The *thee* of *in thee shall all families of the earth be blessed* (Genesis 12:3) is read with exact care: the promise runs to a SEED, and that seed is singular — *to thy seed, which is Messiah*. All families are blessed through the one seed, the personal Messiah drawn out of the covenant line, and not through any opening of the line to many seeds by another door.'),
    ('canon','genesis',12,3,'canon','galatians',3,29,'free',
      E'*And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29). How the nations come into the blessing of *in thee shall all families of the earth be blessed* (Genesis 12:3) is told plainly: they become *Abraham''s seed* — incorporated INTO the one seed-line in Messiah, *heirs according to the promise*. The blessing of all families is membership in the seed, the scattered gathered and the heathen brought in, never a parallel people standing beside Yashar''el.'),
    ('canon','genesis',12,3,'canon','acts',3,25,'free',
      E'*Ye are the children of the prophets, and of the covenant which Elohim (God) made with our fathers, saying unto Abraham, And in thy seed shall all the kindreds of the earth be blessed* (Acts 3:25). Peter sets the covenant of Genesis 12:3 — *in thee shall all families of the earth be blessed* — before the children of the covenant, and reads it *in thy SEED*: the kindreds of the earth are blessed in the seed of Abraham, the covenant line carried forward to those who are its children, the blessing flowing through the seed to the nations.'),
    ('canon','genesis',12,1,'canon','hebrews',11,8,'free',
      E'*By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8). The call of *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1) is answered by faith THAT OBEYS — Abraham *obeyed; and he went out*. The covenant is entered not by confession but by the obedience of faith: he left all and went, *not knowing whither he went*, on the bare word of Yahuah.'),
    ('canon','genesis',12,1,'jubilees','jubilees',12,22,'extras',
      E'*"Get you up from your country, and from your kindred and from the house of your father to a land which I shall show you, and I shall make you a great and numerous nation. And I shall bless you And I shall make your name great, And you will be blessed in the earth, And in you will all families of the earth be blessed..."* (Jubilees 12:22). The restored witness delivers the very call of Genesis 12:1-3 — *Get thee out of thy country... and in thee shall all families of the earth be blessed* — word for word, set after Abram has already turned from his fathers'' idols, so the call falls on a man already given wholly to Yahuah.'),
    ('canon','genesis',12,3,'jasher','jasher',13,23,'extras',
      E'*Behold, I spoke to you these twenty years back saying, Go forth from your land, from your birth-place and from your father''s house, to the land which I have shown you to give it to you and to your children, for there in that land will I bless you, and make you a great nation, and make your name great, and in you shall the families of the earth be blessed* (Jasher 13:23). The restored witness repeats the covenant of Genesis 12:1-3 and binds it to the SEED — *to give it to you and to your children* — the blessing of *the families of the earth* riding on the line of promise, the made name and the great nation given by Yahuah.'),
    ('canon','genesis',12,2,'canon','isaiah',51,2,'free',
      E'*Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him* (Isaiah 51:2). The prophet sends the scattered remnant back to the call of Genesis 12:2 — *I will make of thee a great nation, and I will bless thee* — and reads it as their own origin: Abraham was *called alone* and *blessed and increased*. The great nation is not a metaphor for the world at large; it is the seed of the one man, the covenant people hewn from the rock of Abraham.'),
    ('canon','genesis',12,3,'canon','jeremiah',31,10,'free',
      E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). This is the mechanism behind *in thee shall all families of the earth be blessed* (Genesis 12:3): the seed of promise is scattered THROUGH the nations and then gathered home — *He that scattered Yashar''el will gather him* — and the nations, who hear the word and see the gathering, are blessed in and through the regathered seed, not in place of it.')
    ,
    -- THREAD 2: unto thy seed will I give this land — the altars and the name
    ('canon','genesis',12,7,'canon','acts',7,5,'free',
      E'*And he gave him none inheritance in it, no, not so much as to set his foot on: yet he promised that he would give it to him for a possession, and to his seed after him, when as yet he had no child* (Acts 7:5). When Yahuah said *Unto thy seed will I give this land* (Genesis 12:7), Abram held not a foot of it; Stephen marks the gap — *he gave him none inheritance* — *yet he promised* it to him and *to his seed after him*. The land is the seed''s by promise long before it is possessed, given to a man who *as yet had no child*.'),
    ('canon','genesis',12,8,'canon','hebrews',11,9,'free',
      E'*By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9). Abram pitching his tent and building altars between Beth-el and Hai (Genesis 12:8) is read as faith''s sojourn: he dwelt *in the land of promise, as in a strange country*, in tents — a man who owned the promise and not the soil, the same promise his son and grandson would inherit.'),
    ('canon','genesis',12,8,'canon','hebrews',11,10,'free',
      E'*For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). The altar and the tent of Genesis 12:8 — *he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* — belong to a man who looked past the land itself: *he looked for a city which hath foundations, whose builder and maker is Elohim*. The land-promise to the seed opens onto a deeper inheritance the wandering worshipper already sought.'),
    ('canon','genesis',12,7,'canon','genesis',15,18,'free',
      E'*In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). The word *Unto thy seed will I give this land* (Genesis 12:7) is sealed three chapters on by covenant-cutting — *Yahuah made a covenant with Abram* — and the bounds are drawn out, *from the river of Egypt unto the great river Euphrates*. The land-grant to the seed, first spoken at the altar, is now sworn in blood between the pieces.'),
    ('canon','genesis',12,3,'canon','genesis',22,18,'free',
      E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18). The covenant of Genesis 12:3 — *in thee shall all families of the earth be blessed* — is sworn by oath after the binding of Isaac, and now precisely *in thy SEED*: the blessing of all the nations runs through the seed, and the reason given is obedience — *because thou hast obeyed my voice* — the same faith-that-obeys the call began with.'),
    ('canon','genesis',12,7,'canon','psalms',105,11,'free',
      E'*Saying, Unto thee will I give the land of Canaan, the lot of your inheritance* (Psalm 105:11). The psalmist gathers the land-promise of Genesis 12:7 into the song of the covenant *remembered for ever* (Psalm 105:8): *Unto thee will I give the land of Canaan, the lot of your inheritance*. What was spoken to Abram at the altar is sung over Yashar''el as their settled, sworn inheritance.'),
    ('canon','genesis',12,1,'jubilees','jubilees',13,1,'extras',
      E'*And Abram journeyed from Haran, and he took Sarai, his wife, and Lot his brother Haran''s son, to the land of Canaan, and he came into Asshur, and proceeded to Shechem, and dwelt near a lofty oak* (Jubilees 13:1). The obedience of *So Abram departed, as Yahuah (LORD) had spoken unto him* (Genesis 12:4) and the arrival *unto the place of Sichem* (Genesis 12:6) are carried in the restored witness step for step — Abram journeys from Haran with Sarai and Lot and comes to Shechem.'),
    ('canon','genesis',12,7,'jubilees','jubilees',13,7,'extras',
      E'*And he blessed Yahuah (God) who had led him out of Ur of the Chaldees, and had brought him to this land... he built an altar on this mountain, and called on the name of Yahuah (God): "You, the eternal Elohim (God), are my Elohim (God)."* (Jubilees 13:7). The altar of Genesis 12:7-8 — *there builded he an altar unto Yahuah (LORD)... and called upon the name of Yahuah (LORD)* — is given voice in the restored witness: the worship is a confession, *You, the eternal Elohim, are my Elohim*, the covenant-man planting the Name in the land.'),
    ('canon','genesis',12,7,'jasher','jasher',13,7,'extras',
      E'*And Yahuah (the Lord) appeared to Abram when he came to the land of Canaan, and said to him, This is the land which I gave to you and to your seed after you forever, and I will make your seed like the stars of heaven, and I will give to your seed for an inheritance all the lands which you see* (Jasher 13:7). The restored witness expands *Unto thy seed will I give this land* (Genesis 12:7): the land is to the seed *forever*, and the seed itself is multiplied *like the stars of heaven* — the land-promise and the seed-promise spoken together at the entering of Canaan.'),
    ('canon','genesis',12,8,'jasher','jasher',13,8,'extras',
      E'*And Abram built an altar in the place where Elohim (God) had spoken to him, and Abram there called upon the name of Yahuah (the Lord)* (Jasher 13:8). The first altars and the *calling upon the name of Yahuah* of Genesis 12:7-8 are matched exactly in the restored witness — Abram builds the altar *in the place where Elohim had spoken to him* and calls upon the Name there.'),
    ('canon','genesis',12,7,'jasher','jasher',13,28,'extras',
      E'*And Yahuah (the Lord) again appeared to Abram and said, To your seed will I give this land; and he there built an altar to Yahuah (the Lord) who appeared to him, which is still to this day in the plains of Mamre* (Jasher 13:28). The restored witness echoes Genesis 12:7 nearly word for word — *To your seed will I give this land* followed by the building of an altar *to Yahuah who appeared to him* — the appearing, the land-word to the seed, and the altar bound together as in the canon.')
    ,
    -- THREAD 3: the seed-bearer preserved — Sarai, Pharaoh, and the plagues
    ('canon','genesis',12,17,'canon','hebrews',11,11,'free',
      E'*Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11). Sarai taken into Pharaoh''s house (Genesis 12:15) is the womb that must yet *conceive seed* — and when *Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17), it is the seed-bearer being guarded: the promise hangs on this woman, and Yahuah strikes a king to keep her free for the child of promise.'),
    ('canon','genesis',12,11,'jubilees','jubilees',13,11,'extras',
      E'*And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him* (Jubilees 13:11). The descent of *Abram went down into Egypt to sojourn there* (Genesis 12:10) and the danger near Egypt''s border (Genesis 12:11-13) are carried in the restored witness — the sojourn in Egypt and the seizing of his wife, *before his wife was torn away from him* — the covenant household imperilled in a foreign land.'),
    ('canon','genesis',12,17,'jubilees','jubilees',13,12,'extras',
      E'*And it came to pass when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife* (Jubilees 13:12). The restored witness preserves Genesis 12:17 almost verbatim — *Yahuah plagued Pharaoh and his house with great plagues because of Sarai* — confirming the episode as the protection of the seed-bearer: Pharaoh seizes her, and Yahuah''s plagues pry her loose, a first sketch of the Egypt-and-plagues deliverance to come.'),
    ('canon','genesis',12,17,'canon','psalms',105,14,'free',
      E'*He suffered no man to do them wrong: yea, he reproved kings for their sakes* (Psalm 105:14). The psalm reads this very episode — *Yahuah (LORD) plagued Pharaoh and his house... because of Sarai* (Genesis 12:17) — as the settled pattern of the covenant line''s protection: while they were *strangers* and *few* in the land, Yahuah *suffered no man to do them wrong* and *reproved kings for their sakes*, Pharaoh among them, struck for laying hold of the promise-bearer.'),
    ('canon','genesis',12,17,'canon','psalms',105,15,'free',
      E'*Saying, Touch not mine anointed, and do my prophets no harm* (Psalm 105:15). The plagues on Pharaoh''s house of Genesis 12:17 are the enforcement of this word: Abram and Sarai are *mine anointed* and *my prophets*, the carriers of the covenant, and the king who took the seed-bearer learns by great plagues that to *touch* them is to fall under Yahuah''s own hand.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed',
       E'Get thee out — the call of Abram and the seed in whom all families are blessed',
       E'The covenant of the whole library begins here. *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1); *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2); *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* (Genesis 12:3). Read *in thee shall all families of the earth be blessed* with care, against the false-inclusion reading. The blessing to all families is not a second people grafted into Yashar''el by confession; it is the seed of promise — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16). The seed is singular and personal, and through that one seed the many: *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* (Galatians 3:8), so that *if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29) — the heathen are blessed by being brought INTO the seed, not beside it. Peter says the same to the children of the covenant: *in thy seed shall all the kindreds of the earth be blessed* (Acts 3:25). And the mechanism is the scattering and the regathering: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10) — the covenant line dispersed through the nations and drawn home, the nations blessed in and through the gathered seed. Abram''s part is faith that obeys — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8) — and the restored witnesses repeat the call as it fell: *"Get you up from your country... And in you will all families of the earth be blessed"* (Jubilees 12:22); *Go forth from your land... and in you shall the families of the earth be blessed* (Jasher 13:23). Note too the answer to Babel folded into verse 2: where the builders said *let us make us a name* (Genesis 11:4), Yahuah here says *make thy name great* — what man grasps at on a tower, Yahuah gives by promise to the one He calls. The prophet sends the remnant back to its root: *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him* (Isaiah 51:2).',
       sv.verse_id, ev.verse_id, 'extras', 20275
  FROM _s301_ge12_lookup sv, _s301_ge12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=12 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name',
       E'Unto thy seed will I give this land — the altars and the name',
       E'Abram obeys and goes: *So Abram departed, as Yahuah (LORD) had spoken unto him; and Lot went with him* (Genesis 12:4), *and into the land of Canaan they came* (Genesis 12:5). At Sichem the word comes: *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7); and at Beth-el *there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* (Genesis 12:8). The land is the seed''s by promise long before it is held. Stephen marks the gap: *And he gave him none inheritance in it, no, not so much as to set his foot on: yet he promised that he would give it to him for a possession, and to his seed after him, when as yet he had no child* (Acts 7:5). Abram dwells as a stranger on his own inheritance — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles* (Hebrews 11:9) — because *he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). The land-word at the altar is later sealed by covenant-cutting: *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18); and sworn by oath after the binding of Isaac, *And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18); and sung over Yashar''el as their settled inheritance, *Saying, Unto thee will I give the land of Canaan, the lot of your inheritance* (Psalm 105:11). The restored witnesses walk the same ground: Abram *journeyed from Haran... and proceeded to Shechem* (Jubilees 13:1); he *built an altar... and called on the name of Yahuah (God): "You, the eternal Elohim (God), are my Elohim (God)"* (Jubilees 13:7); *To your seed will I give this land... and I will make your seed like the stars of heaven* (Jasher 13:7); *Abram built an altar in the place where Elohim (God) had spoken to him, and Abram there called upon the name of Yahuah (the Lord)* (Jasher 13:8); *To your seed will I give this land; and he there built an altar to Yahuah (the Lord) who appeared to him* (Jasher 13:28). The land-promise to the seed and the first worship in the land are one act of faith.',
       sv.verse_id, ev.verse_id, 'extras', 20278
  FROM _s301_ge12_lookup sv, _s301_ge12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues',
       E'The seed-bearer preserved — Sarai, Pharaoh, and the plagues',
       E'*And there was a famine in the land: and Abram went down into Egypt to sojourn there* (Genesis 12:10), and at the border he fears for his life because of Sarai''s beauty (Genesis 12:11-13). *The princes also of Pharaoh saw her, and commended her before Pharaoh: and the woman was taken into Pharaoh''s house* (Genesis 12:15). The promise now hangs on a woman inside a king''s house — and Yahuah moves to guard her: *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17), and Pharaoh sends them away (Genesis 12:19-20). This is the preservation of the seed-bearer. Sarai is the womb that must yet bear the child of promise — *Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11) — and Yahuah strikes a king to keep her free for that seed. The restored witness confirms it: Abram *dwelt in Egypt five years before his wife was torn away from him* (Jubilees 13:11), and *when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife* (Jubilees 13:12). The psalmist reads the episode as the fixed pattern of the covenant line''s shielding while it was *few* and *strangers*: *He suffered no man to do them wrong: yea, he reproved kings for their sakes* (Psalm 105:14), *Saying, Touch not mine anointed, and do my prophets no harm* (Psalm 105:15). Pharaoh laid hold of the promise-bearer and was struck — a first sketch of the greater Egypt-descent and the plagues that would one day pry the whole seed free.',
       sv.verse_id, ev.verse_id, 'extras', 20281
  FROM _s301_ge12_lookup sv, _s301_ge12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=12 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*In thee shall all nations be blessed* (Galatians 3:8) — the gospel preached beforehand to Abraham: the heathen blessed by being justified into the one seed, the seed flowing out to the nations.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And to thy seed, which is Messiah (Christ)* (Galatians 3:16) — the *thee* of 12:3 is a SEED, and that seed is singular; all families blessed through the one personal Messiah.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29) — the nations come into the blessing by being incorporated INTO the seed, never as a parallel people.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*In thy seed shall all the kindreds of the earth be blessed* (Acts 3:25) — Peter reads the covenant to the children of the covenant: the blessing rides on the seed.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=3 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*By faith Abraham, when he was called... obeyed; and he went out* (Hebrews 11:8) — the call of 12:1 answered by faith THAT OBEYS, not bare confession.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*"Get you up from your country... And in you will all families of the earth be blessed"* (Jubilees 12:22) — the restored witness delivers the call word for word, after Abram has already left the idols.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Go forth from your land... and in you shall the families of the earth be blessed* (Jasher 13:23) — the restored witness binds the blessing to the seed, *to you and to your children*.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*I called him alone, and blessed him, and increased him* (Isaiah 51:2) — the great nation of 12:2 is the seed of the one man, the rock the remnant is hewn from.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*He that scattered Yashar''el (Israel) will gather him* (Jeremiah 31:10) — the mechanism of 12:3: the seed scattered through the nations and gathered home, the nations blessed through the regathered seed.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He gave him none inheritance in it... yet he promised that he would give it to him... and to his seed after him* (Acts 7:5) — the land is the seed''s by promise before a foot of it is held.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles* (Hebrews 11:9) — the tent of 12:8: he owned the promise, not the soil.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10) — the altar-builder of 12:8 looked past the land to a deeper inheritance.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Unto thy seed have I given this land, from the river of Egypt unto the great river Euphrates* (Genesis 15:18) — the land-word of 12:7 sealed by covenant-cutting, the bounds drawn out.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*In thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18) — the call of 12:3 sworn by oath, precisely *in thy SEED*, sealed by obedience.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Unto thee will I give the land of Canaan, the lot of your inheritance* (Psalm 105:11) — the land-promise of 12:7 sung over Yashar''el as their settled inheritance.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Abram journeyed from Haran... and proceeded to Shechem* (Jubilees 13:1) — the obedience and arrival of 12:4-6 walked step for step in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*He built an altar... and called on the name of Yahuah (God): "You, the eternal Elohim (God), are my Elohim (God)"* (Jubilees 13:7) — the altar-worship of 12:7-8 given voice as confession.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*This is the land which I gave to you and to your seed after you forever, and I will make your seed like the stars of heaven* (Jasher 13:7) — 12:7 expanded: land AND seed-multiplied, spoken together.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*Abram built an altar in the place where Elohim (God) had spoken to him, and Abram there called upon the name of Yahuah (the Lord)* (Jasher 13:8) — the first altars and calling on the Name of 12:7-8.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*To your seed will I give this land; and he there built an altar to Yahuah (the Lord) who appeared to him* (Jasher 13:28) — 12:7 nearly word for word: appearing, land-word to the seed, and altar bound together.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Sara herself received strength to conceive seed... because she judged him faithful who had promised* (Hebrews 11:11) — Sarai in Pharaoh''s house is the womb of the promise, guarded by the plagues of 12:17.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=17
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Abram went into Egypt... before his wife was torn away from him* (Jubilees 13:11) — the descent and danger of 12:10-15 in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=11
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*When Pharaoh seized Sarai... Yahuah (God) plagued Pharaoh and his house with great plagues* (Jubilees 13:12) — 12:17 almost verbatim: the seed-bearer pried loose by the plagues.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=17
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He suffered no man to do them wrong: yea, he reproved kings for their sakes* (Psalm 105:14) — the psalm reads 12:17 as the pattern: Pharaoh struck for laying hold of the promise-bearer.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=17
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Touch not mine anointed, and do my prophets no harm* (Psalm 105:15) — Abram and Sarai are the anointed carriers of the covenant; to touch the seed is to fall under Yahuah''s hand.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=17
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_13.sql (Genesis 13) -----
-- Chapter: Genesis 13 (Abram comes up out of Egypt rich; the strife and the generous separation from Lot; Lot's choice by sight toward Sodom; the land-promise and the seed renewed; walk through the land; the altar at Mamre/Hebron)
-- Tag: ge13   Temp view: _s301_ge13_lookup
-- Sort band: base 20300, step 3 -> threads at 20300, 20303, 20306, 20309, 20312, 20315 (6 threads)
-- Source of EVERY row: 'canon','genesis',13,v
--
-- Genesis 13 coverage:
--   v.1-4 (Abram up out of Egypt very rich; back to Beth-el, to the place of the altar made at the first; there Abram called on the name of Yahuah)
--        NT:     none warranted distinct (the call-on-the-Name forward weave is the patriarchal worship at THREAD 6; the riches are narrative setup)
--        Extras: Jubilees 13:15 (returned to the place of the altar... called on the name of Yahuah: "You, the most high Elohim, are my Elohim for ever and ever") — THREAD 6
--        Tanakh: Genesis 12:8 (the same altar between Beth-el and Hai where he called on the name of Yahuah at the first); Genesis 4:26 (then began men to call upon the name of Yahuah) — THREAD 6
--   v.5-9 (the land could not bear them both; strife between the herdmen; Canaanite and Perizzite in the land; Abram: let there be no strife, we be brethren; is not the whole land before thee? — gives Lot first choice)
--        NT:     Romans 4:13 (the promise that he should be the HEIR OF THE WORLD — Abram can yield the choicest plain because the WHOLE land is already promised him by faith) — THREAD 1 (load-bearing for the framing of the generosity)
--        Extras: none warranted as distinct MEMBER (Jubilees 13:17-18 carries the parting at THREAD 2; the strife/peace-making itself has no clean distinct extras witness here)
--        Tanakh: none warranted distinct (the generosity is framed by the promise via Romans 4:13; no Tanakh lateral adds without dumping)
--   ★ v.10-13 (Lot lifted up his eyes, beheld all the plain of Jordan well watered, even as the garden of Yahuah, like the land of Egypt; chose the plain; pitched toward Sodom; the men of Sodom were wicked and sinners before Yahuah exceedingly)
--        NT:     2 Peter 2:7-8 (just Lot, vexed with the filthy conversation of the wicked; that righteous man vexed his righteous soul from day to day) — THREAD 2 (load-bearing); 2 Peter 2:6 (turning Sodom and Gomorrha into ashes, an ensample) — THREAD 2
--        Extras: Jubilees 13:17 (Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly) — THREAD 2
--        Tanakh: Genesis 19:24-25 (Yahuah rained upon Sodom and Gomorrah brimstone and fire... overthrew those cities, and all the plain) — THREAD 2 (the doom of the well-watered land Lot chose by sight)
--   ★★ v.14-15 (Yahuah to Abram after Lot was separated: lift up thine eyes... all the land which thou seest, to thee will I give it, and to thy seed FOR EVER)
--        NT:     Romans 4:13 (heir of the world); Romans 4:16-17 (the promise sure to ALL the seed... a father of many nations); Hebrews 11:8-10 (called to an inheritance, sojourned in the land of promise, looked for a CITY which hath foundations) — THREAD 3 (centerpiece)
--        Extras: Jubilees 13:20 (all the land which you see I shall give to you and to your seed for ever); Jasher 13:7 (this is the land which I gave to you and to your seed after you forever); Jasher 13:18 (to you and to your seed I will give this land for an inheritance) — THREAD 3
--        Tanakh: Genesis 12:7 (unto thy seed will I give this land); Genesis 15:18 (unto thy seed have I given this land); Genesis 17:8 (the land... for an everlasting possession) — THREAD 3
--   ★ v.16 (I will make thy seed AS THE DUST OF THE EARTH: so that if a man can number the dust... then shall thy seed also be numbered — innumerable)
--        NT:     Romans 4:18 (who against hope believed in hope, that he might become the father of many nations); Hebrews 11:12 (so many as the stars of the sky in multitude, and as the sand by the sea shore innumerable) — THREAD 4
--        Extras: Jubilees 13:20 (I shall make your seed as the sand of the sea: though a man may number the dust of the earth, yet your seed shall not be numbered) — THREAD 4 (note: SAME Jubilees verse anchors THREAD 3 and THREAD 4, distinct source verses 15 vs 16 — distinct cross_reference rows)
--        Tanakh: Genesis 15:5 (look toward heaven, tell the stars... so shall thy seed be); Genesis 22:17 (multiply thy seed as the stars of the heaven, and as the sand upon the sea shore) — THREAD 4
--   ★ v.17 (Arise, walk through the land in the length of it and in the breadth of it; for I will give it unto thee — possession by faith, the walking-out of the inheritance)
--        NT:     Hebrews 11:9 (he sojourned in the land of promise, as in a strange country, dwelling in tabernacles); Hebrews 11:13 (died in faith, not having received the promises, strangers and pilgrims on the earth); Hebrews 11:16 (they desire a better country... he hath prepared for them a city) — THREAD 5 (the "for ever" reaches past this life — the resurrection-hope)
--        Extras: Jubilees 13:20 (Arise, walk through the land in the length of it and the breadth of it... for to your seed shall I give it); Jasher 13:18-19 (walk before me and be perfect... and shall inherit it forever) — THREAD 5
--        Tanakh: none warranted distinct (the walk-by-faith forward weave is Hebrews 11; the land-grant lateral is carried at THREAD 3)
--   v.18 (Abram removed his tent, dwelt in the plain of Mamre, in Hebron, and built there an altar unto Yahuah)
--        NT:     none warranted (patriarchal worship; the city-looked-for forward weave is at THREAD 5)
--        Extras: Jubilees 13:4 (he built an altar there, and offered a burnt sacrifice to Yahuah, who had appeared to him); Jasher 13:28 (he there built an altar to Yahuah who appeared to him, which is still to this day in the plains of Mamre) — THREAD 6
--        Tanakh: Genesis 12:7-8 (the altars at Sichem and between Beth-el and Hai); Genesis 4:26 (men began to call upon the name of Yahuah) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. genesis-13-let-there-be-no-strife-abrams-generous-peace — NT (Romans) [free]
--   2. genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight — NT (2 Peter) + Tanakh (Genesis 19) + Extras (Jubilees) [extras]
--   3. genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed — NT (Romans, Hebrews) + Tanakh (Genesis) + Extras (Jubilees, Jasher) [extras] (CENTERPIECE)
--   4. genesis-13-thy-seed-as-the-dust-of-the-earth — NT (Romans, Hebrews) + Tanakh (Genesis) + Extras (Jubilees) [extras]
--   5. genesis-13-walk-through-the-land-possession-by-faith — NT (Hebrews) + Extras (Jubilees, Jasher) [extras]
--   6. genesis-13-the-altar-at-mamre-calling-on-the-name — Tanakh (Genesis) + Extras (Jubilees, Jasher) [extras]
--
-- Framing notes:
--   THREAD 1 — ABRAM'S GENEROUS PEACE (free): the elder yields the choice to the younger — *Is not the whole land
--   before thee? separate thyself, I pray thee, from me* (13:9). The generosity is NOT mere temperament: Abram can
--   surrender the choicest plain because *the promise, that he should be the heir of the world* (Romans 4:13) is
--   already his by faith — he holds the WHOLE land in promise, so he need not grasp a portion by sight. Walk-by-
--   promise frees the hand to give. (Kept tight: no TSK live-peaceably dump; the one load-bearing weave is the
--   heir-of-the-world logic that grounds the open hand.)
--   ★ THREAD 2 — THE CHOICE BY SIGHT (extras): *Lot lifted up his eyes, and beheld all the plain of Jordan, that
--   it was well watered every where... even as the garden of Yahuah, like the land of Egypt* (13:10) — Eden-like and
--   Egypt-like to the eye, yet *before Yahuah destroyed Sodom and Gomorrah*; the narrator already names the doom.
--   The contrast is walk-by-sight (Lot, *pitched his tent toward Sodom*, 13:12) vs walk-by-promise (Abram, lifting
--   his eyes only when Yahuah says lift them, 13:14). 2 Peter holds Lot as *just Lot, vexed* (2:7) — saved, but
--   vexed day by day in the land his eyes chose; Sodom *turned into ashes* an *ensample* (2:6); Genesis 19:24-25
--   the fire that fell. The well-watered-like-Eden-yet-doomed plain is the whole warning.
--   ★★ THREAD 3 — THE LAND AND THE SEED RENEWED (CENTERPIECE, extras): *all the land which thou seest, to thee
--   will I give it, and to thy seed FOR EVER* (13:15). The "for ever" is load-bearing — it reaches past this life:
--   Abram *looked for a city which hath foundations, whose builder and maker is Elohim* (Hebrews 11:10), the
--   everlasting inheritance held by RESURRECTION-hope, not by this lifetime's deed. Romans reads the grant as the
--   promise that Abram should be *the heir of the world* (4:13) and *a father of many nations* (4:17). Jubilees and
--   Jasher renew the same land-and-seed grant word for word. The land-FOREVER is possessed by faith now and in the
--   body raised.
--   ★ THREAD 4 — SEED AS THE DUST OF THE EARTH (extras): *I will make thy seed as the dust of the earth* (13:16) —
--   the FIRST of the great innumerability figures, paired with the seed-as-STARS of Genesis 15:5 and 22:17 and the
--   sand of the sea. Romans 4:18 — *who against hope believed in hope, that he might become the father of many
--   nations* — and Hebrews 11:12 — *so many as the stars of the sky in multitude, and as the sand which is by the
--   sea shore innumerable* — gather dust, stars, and sand into the one promised multitude of the seed. (NOTE: the
--   single Jubilees 13:20 verse legitimately anchors BOTH this thread and THREAD 3 — distinct SOURCE verses, 13:15
--   land vs 13:16 dust — so they are two distinct cross_reference rows, not a double-write collision.)
--   ★ THREAD 5 — WALK THROUGH THE LAND, POSSESSION BY FAITH (extras): *Arise, walk through the land in the length
--   of it and in the breadth of it; for I will give it unto thee* (13:17). Abram walks the land he does not yet
--   hold by deed — possession by faith. Hebrews 11 reads the whole patriarchal walk: he *sojourned in the land of
--   promise, as in a strange country* (11:9), *died in faith, not having received the promises... strangers and
--   pilgrims on the earth* (11:13), desiring *a better country, that is, an heavenly* (11:16). The walking is the
--   inheriting-in-hope.
--   THREAD 6 — THE ALTAR AT MAMRE, CALLING ON THE NAME (extras): *there Abram called on the name of Yahuah* (13:4);
--   *built there an altar unto Yahuah* (13:18) — the patriarchal worship that began when *men began to call upon
--   the name of Yahuah* (Genesis 4:26) and ran through Abram's altars (Genesis 12:7-8). Jubilees and Jasher remember
--   the altars and the confession: *"You, the eternal Elohim, are my Elohim"* (Jubilees 13:7).
--   PARSE/TRAP NOTES: Jubilees double-written 'jubilees','jubilees'; Jasher double-written 'jasher','jasher' (every
--   VALUES row 10 cols). Jasher's Abram/Lot land material is in JASHER 13 (the call, the land-grant, the altars at
--   Mamre, seed-as-stars) — JASHER 14 is the Rikayon/Egyptian-tax tale, UNRELATED, so it is NOT pulled. Jubilees 13
--   is clean for the verses used (v.4, 7, 15, 17, 20); v.2-3 run together in the parse but v.20 carries the land/
--   seed/walk grant cleanly at its front clause.

CREATE TEMP VIEW _s301_ge13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: let there be no strife — Abram's generous peace
    ('canon','genesis',13,9,'canon','romans',4,13,'free',
      E'*For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith* (Romans 4:13). When Abram says *Is not the whole land before thee? separate thyself, I pray thee, from me: if thou wilt take the left hand, then I will go to the right* (Genesis 13:9), he gives away the choicest plain without grasping — because the WHOLE land is already his by promise. The open hand is the fruit of walking by the promise, not by sight: a man who is *heir of the world* by faith need not seize a portion by his own eyes.'),
    -- THREAD 2: Lot lifted up his eyes — the choice by sight
    ('canon','genesis',13,10,'canon','2-peter',2,8,'extras',
      E'*(For that righteous man dwelling among them, in seeing and hearing, vexed his righteous soul from day to day with their unlawful deeds;)* (2 Peter 2:8). Lot *lifted up his eyes, and beheld all the plain of Jordan, that it was well watered every where... even as the garden of Yahuah (LORD), like the land of Egypt* (Genesis 13:10) — Eden-like and Egypt-like to the eye, and he chose it. The end of the choice-by-sight is a righteous soul vexed *from day to day* in the city his eyes desired; what looked like the garden becomes the daily grief of the just man.'),
    ('canon','genesis',13,12,'canon','2-peter',2,7,'extras',
      E'*And delivered just Lot, vexed with the filthy conversation of the wicked* (2 Peter 2:7). *Lot dwelled in the cities of the plain, and pitched his tent toward Sodom* (Genesis 13:12) — the tent turned by inches toward the wicked city. Scripture still calls him *just Lot*: saved, yet vexed, the believer who chose his dwelling by sight and paid for it in vexation, drawn out at the last only by mercy.'),
    ('canon','genesis',13,13,'canon','2-peter',2,6,'extras',
      E'*And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly* (2 Peter 2:6). The narrator marks the plain Lot chose: *But the men of Sodom were wicked and sinners before Yahuah (LORD) exceedingly* (Genesis 13:13). The well-watered land was already under sentence; its end is *ashes* set up as an *ensample* — the warning written into the very ground Lot beheld.'),
    ('canon','genesis',13,10,'canon','genesis',19,24,'free',
      E'*Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24). The plain was *well watered every where... even as the garden of Yahuah (LORD)* — *before Yahuah (LORD) destroyed Sodom and Gomorrah* (Genesis 13:10); the narrator names the doom in the same breath as the beauty. The garden-to-the-eye becomes fire-from-heaven: the choice by sight chose a land already marked for the overthrow.'),
    ('canon','genesis',13,13,'jubilees','jubilees',13,17,'extras',
      E'*And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17). The restored witness tells the same parting and the same indictment as *the men of Sodom were wicked and sinners before Yahuah (LORD) exceedingly* (Genesis 13:13) — Lot lodged among a people Yahuah had already weighed and found *sinners exceedingly*.'),
    -- THREAD 3 (CENTERPIECE): to thee and to thy seed for ever — the land renewed
    ('canon','genesis',13,15,'canon','romans',4,13,'free',
      E'*For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith* (Romans 4:13). *All the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15) — Romans reads the land-grant as nothing less than the world inherited, and inherited *through the righteousness of faith*. The seest-it-all-given becomes heir-of-the-world: the promise opens past one plot to the whole earth held by the faith of Abram and his seed.'),
    ('canon','genesis',13,15,'canon','romans',4,17,'free',
      E'*(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17). The land given *to thy seed for ever* (Genesis 13:15) is a promise made before the seed exists — and Elohim *calleth those things which be not as though they were*. The everlasting grant rests on the Elohim *who quickeneth the dead*: a forever-inheritance can only be kept by the One who raises the dead to hold it.'),
    ('canon','genesis',13,15,'canon','hebrews',11,10,'free',
      E'*For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). When Yahuah says *to thy seed for ever* (Genesis 13:15), the *for ever* reaches past Abram''s lifetime and past this age: he held the land-promise by looking for *a city which hath foundations*, the everlasting inheritance secured by resurrection-hope, not by a deed signed in his own years. The land FOREVER is possessed by faith now and in the body raised.'),
    ('canon','genesis',13,15,'canon','genesis',12,7,'free',
      E'*And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). The grant first spoken at the entrance to Canaan is now renewed after Lot departs: *all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15). The same word — *unto thy seed... this land* — said again and enlarged with *for ever*: the promise does not move, it deepens.'),
    ('canon','genesis',13,15,'canon','genesis',15,18,'free',
      E'*In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). What is promised in Genesis 13:15 — *to thee will I give it, and to thy seed for ever* — is cut into covenant two chapters on, the boundaries named, the gift sworn. The renewed land-word here is the seed of the sworn covenant there.'),
    ('canon','genesis',13,15,'canon','genesis',17,8,'free',
      E'*And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God)* (Genesis 17:8). The *for ever* of Genesis 13:15 is spelled out as *an everlasting possession* — and bound to the covenant bond *I will be their Elohim*. The land-forever and the Elohim-forever are one promise: the inheritance is held in the One who gives it.'),
    ('canon','genesis',13,15,'jubilees','jubilees',13,20,'extras',
      E'*For all the land which you see I shall give to you and to your seed for ever, and I shall make your seed as the sand of the sea* (Jubilees 13:20). The restored witness renews the land-grant word for word with *all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15) — the same *all the land which you see*, the same *to your seed for ever*. The forever-inheritance stands in both the canon and the witness.'),
    ('canon','genesis',13,15,'jasher','jasher',13,7,'extras',
      E'*This is the land which I gave to you and to your seed after you forever, and I will make your seed like the stars of heaven, and I will give to your seed for an inheritance all the lands which you see* (Jasher 13:7). Jasher renews the same grant as *all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15) — the land *which you see* given *to your seed after you forever*, joined to the seed-as-stars that Genesis 15 will speak.'),
    ('canon','genesis',13,14,'canon','hebrews',11,8,'free',
      E'*By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8). When Yahuah says *Lift up now thine eyes, and look from the place where thou art northward, and southward, and eastward, and westward* (Genesis 13:14), Abram looks on the inheritance he was called to but does not yet hold. Hebrews names the posture: an inheritance received by faith, walked toward in obedience before it is possessed by hand.'),
    -- THREAD 4: thy seed as the dust of the earth
    ('canon','genesis',13,16,'canon','genesis',15,5,'free',
      E'*And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5). The dust-figure of *I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16) is matched by the star-figure: dust below, stars above, both past counting. The innumerable seed is promised first as the dust, then as the stars.'),
    ('canon','genesis',13,16,'canon','genesis',22,17,'free',
      E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies* (Genesis 22:17). The dust of *as the dust of the earth... then shall thy seed also be numbered* (Genesis 13:16) is gathered with the stars of heaven and the sand of the sea — three figures of one innumerable seed, here sworn by oath after the binding of Isaac.'),
    ('canon','genesis',13,16,'canon','romans',4,18,'free',
      E'*Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be* (Romans 4:18). The promise *I will make thy seed as the dust of the earth... then shall thy seed also be numbered* (Genesis 13:16) is the very *so shall thy seed be* Abram believed *against hope* — childless, yet trusting the One who counts a seed as numberless as dust. The faith that took the dust-promise is the faith counted for righteousness.'),
    ('canon','genesis',13,16,'canon','hebrews',11,12,'free',
      E'*Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). The dust-promise of Genesis 13:16 — *so that if a man can number the dust of the earth, then shall thy seed also be numbered* — comes true *of one, and him as good as dead*: the innumerable seed, *stars... and... sand... innumerable*, sprung from the one man who believed the dust could not be counted.'),
    ('canon','genesis',13,16,'jubilees','jubilees',13,20,'extras',
      E'*I shall make your seed as the sand of the sea: though a man may number the dust of the earth, yet your seed shall not be numbered* (Jubilees 13:20). The restored witness carries the same innumerable-seed word as *I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16) — *though a man may number the dust... yet your seed shall not be numbered*. The seed past counting stands in canon and witness alike.'),
    -- THREAD 5: walk through the land — possession by faith
    ('canon','genesis',13,17,'canon','hebrews',11,9,'extras',
      E'*By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9). *Arise, walk through the land in the length of it and in the breadth of it; for I will give it unto thee* (Genesis 13:17) — Abram is told to walk a land he will hold only by promise; Hebrews names the walk a SOJOURN *as in a strange country*, dwelling in tents in the very land deeded to his seed. The walking-through is the possessing-in-hope.'),
    ('canon','genesis',13,17,'canon','hebrews',11,13,'extras',
      E'*These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). Abram walks *the length of it and... the breadth of it* (Genesis 13:17) and yet dies *not having received the promises* — he possesses by faith, *strangers and pilgrims on the earth*, the land seen *afar off* and embraced. The walk measures an inheritance held in hope past this life.'),
    ('canon','genesis',13,17,'canon','hebrews',11,16,'extras',
      E'*But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). The land Abram walks at *Arise, walk through the land... for I will give it unto thee* (Genesis 13:17) opens onto *a better country, that is, an heavenly* — the *for ever* of the grant reaching to the prepared *city*. The walking-out of the land is the first step of an inheritance kept in the resurrection.'),
    ('canon','genesis',13,17,'jubilees','jubilees',13,20,'extras',
      E'*Arise, walk (through the land) in the length of it and the breadth of it, and see it all; for to your seed shall I give it* (Jubilees 13:20). The restored witness gives the same command as *Arise, walk through the land in the length of it and in the breadth of it; for I will give it unto thee* (Genesis 13:17) — the land walked in *the length... and the breadth*, given to the seed. The possession-by-walking stands in both.'),
    ('canon','genesis',13,17,'jasher','jasher',13,18,'extras',
      E'*Now therefore walk before me and be perfect and keep my commands, for to you and to your seed I will give this land for an inheritance, from the river Mitzraim to the great river Euphrates* (Jasher 13:18). Jasher binds the walk of *Arise, walk through the land... for I will give it unto thee* (Genesis 13:17) to covenant-walk: *walk before me and be perfect and keep my commands* — the land-inheritance and the keeping of the commands are one path. The walking is faith-and-obedience together, never one without the other.'),
    -- THREAD 6: the altar at Mamre — calling on the name
    ('canon','genesis',13,4,'canon','genesis',4,26,'free',
      E'*And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). When *Abram called on the name of Yahuah (LORD)* (Genesis 13:4) at the altar he had made at the first, he keeps the worship that began in the line of Seth — *then began men to call upon the name of Yahuah*. The patriarchal altar is the old true worship carried down the seed-line of promise.'),
    ('canon','genesis',13,4,'canon','genesis',12,8,'free',
      E'*And he removed from thence unto a mountain on the east of Beth-el, and pitched his tent, having Beth-el on the west, and Hai on the east: and there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* (Genesis 12:8). Abram returns *unto the place of the altar, which he had made there at the first: and there Abram called on the name of Yahuah (LORD)* (Genesis 13:4) — the very altar between Beth-el and Hai. He comes back from Egypt to the place of worship he had left, and calls on the Name again.'),
    ('canon','genesis',13,18,'canon','genesis',12,7,'free',
      E'*And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). At Mamre Abram *built there an altar unto Yahuah (LORD)* (Genesis 13:18), as he did at Sichem when the land was first promised. Each renewal of the land-word is answered with an altar: the promise heard, the worship raised, the Name confessed in the land of the promise.'),
    ('canon','genesis',13,4,'jubilees','jubilees',13,15,'extras',
      E'*he journeyed to the place where he had pitched his tent at the beginning, to the place of the altar... and called on the name of Yahuah (God), and said: "You, the most high Elohim (God), are my Elohim (God) for ever and ever."* (Jubilees 13:15). The restored witness fills the confession behind *there Abram called on the name of Yahuah (LORD)* (Genesis 13:4): returning to the first altar, he names Yahuah his Elohim *for ever and ever* — the calling-on-the-Name is a covenant confession, not a bare invocation.'),
    ('canon','genesis',13,18,'jubilees','jubilees',13,4,'extras',
      E'*And he built an altar there, and he offered thereon a burnt sacrifice to Yahuah (God), who had appeared to him* (Jubilees 13:4). The same altar-building as *built there an altar unto Yahuah (LORD)* (Genesis 13:18) is remembered with the sacrifice and the reason — *to Yahuah, who had appeared to him*. The altar answers the appearing: Yahuah shows Himself, Abram builds and offers.'),
    ('canon','genesis',13,18,'jasher','jasher',13,28,'extras',
      E'*And Yahuah (the Lord) again appeared to Abram and said, To your seed will I give this land; and he there built an altar to Yahuah (the Lord) who appeared to him, which is still to this day in the plains of Mamre* (Jasher 13:28). Jasher names the very place of *dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD)* (Genesis 13:18) — *an altar... in the plains of Mamre*, raised when Yahuah appeared and renewed *to your seed will I give this land*. The altar at Mamre marks the land-promise renewed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-let-there-be-no-strife-abrams-generous-peace',
       E'Let there be no strife — Abram''s generous peace',
       E'The land cannot hold both households: *the land was not able to bear them, that they might dwell together: for their substance was great* (Genesis 13:6), and *there was a strife between the herdmen of Abram''s cattle and the herdmen of Lot''s cattle* (Genesis 13:7). The elder, who holds the promise, refuses to contend: *Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren* (Genesis 13:8). Then he gives the choice away — *Is not the whole land before thee? separate thyself, I pray thee, from me: if thou wilt take the left hand, then I will go to the right; or if thou depart to the right hand, then I will go to the left* (Genesis 13:9). This open hand is not mere mildness; it is the fruit of faith. *For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith* (Romans 4:13). Abram can surrender the choicest plain because the WHOLE land is already his by promise — a man who is heir of the world by faith need not grasp a portion by sight. Walk-by-promise frees the hand to give.',
       sv.verse_id, ev.verse_id, 'free', 20300
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight',
       E'Lot lifted up his eyes — the choice by sight',
       E'Where Abram waits on the promise, Lot chooses by his eyes: *And Lot lifted up his eyes, and beheld all the plain of Jordan, that it was well watered every where, before Yahuah (LORD) destroyed Sodom and Gomorrah, even as the garden of Yahuah (LORD), like the land of Egypt* (Genesis 13:10). Eden-like and Egypt-like to the eye — and in the same breath the narrator names the doom: *before Yahuah destroyed Sodom and Gomorrah*. He *chose him all the plain of Jordan* (Genesis 13:11) and *pitched his tent toward Sodom* (Genesis 13:12), the tent turned by inches toward the wicked city — *But the men of Sodom were wicked and sinners before Yahuah (LORD) exceedingly* (Genesis 13:13). The restored witness tells it the same: *Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17). The end of the choice-by-sight is written ahead. Scripture still calls him *just Lot, vexed with the filthy conversation of the wicked* (2 Peter 2:7) — saved, yet *that righteous man dwelling among them, in seeing and hearing, vexed his righteous soul from day to day with their unlawful deeds* (2 Peter 2:8). And the land itself is *turned into ashes... an ensample unto those that after should live ungodly* (2 Peter 2:6), for *Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24). Well-watered like Eden, yet doomed: the warning is in the very ground his eyes desired.',
       sv.verse_id, ev.verse_id, 'extras', 20303
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed',
       E'To thee and to thy seed for ever — the land renewed',
       E'After Lot is gone, Yahuah lifts Abram''s eyes — not by his own choosing now, but at the word: *And Yahuah (LORD) said unto Abram, after that Lot was separated from him, Lift up now thine eyes, and look from the place where thou art northward, and southward, and eastward, and westward* (Genesis 13:14). Then the grant: *For all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15). It is the word first spoken at the entrance to Canaan — *Unto thy seed will I give this land* (Genesis 12:7) — now renewed and enlarged with *for ever*, and cut into covenant two chapters on: *Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18); *all the land of Canaan, for an everlasting possession; and I will be their Elohim (God)* (Genesis 17:8). The restored witnesses renew it word for word: *all the land which you see I shall give to you and to your seed for ever* (Jubilees 13:20); *this is the land which I gave to you and to your seed after you forever* (Jasher 13:7). Now hear how far the *for ever* reaches. Romans reads the grant as *the promise, that he should be the heir of the world... through the righteousness of faith* (Romans 4:13), a promise to one *who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17) — for a forever-inheritance can only be kept by the One who raises the dead to hold it. And Abram knew it: *he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10), for *by faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed* (Hebrews 11:8). The *for ever* of Genesis 13:15 does not stop at this lifetime or this age — it is the everlasting land held by resurrection-hope, possessed by faith now and in the body raised.',
       sv.verse_id, ev.verse_id, 'extras', 20306
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-thy-seed-as-the-dust-of-the-earth',
       E'Thy seed as the dust of the earth',
       E'With the land comes the seed, and the seed is past counting: *And I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16). This is the FIRST of the great innumerability figures, and the others answer it. Yahuah will bring Abram out under the night and say *Look now toward heaven, and tell the stars, if thou be able to number them... So shall thy seed be* (Genesis 15:5); and after the binding of Isaac He swears *I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17). Dust of the earth, stars of heaven, sand of the sea — three figures of one numberless seed. The restored witness joins them: *I shall make your seed as the sand of the sea: though a man may number the dust of the earth, yet your seed shall not be numbered* (Jubilees 13:20). And this is the very promise Abram believed against all sight: *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be* (Romans 4:18). It came true from one as good as dead: *Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). The dust-promise, taken by faith, became the innumerable seed.',
       sv.verse_id, ev.verse_id, 'extras', 20309
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-walk-through-the-land-possession-by-faith',
       E'Walk through the land — possession by faith',
       E'The grant ends with a command to walk: *Arise, walk through the land in the length of it and in the breadth of it; for I will give it unto thee* (Genesis 13:17). Abram is told to walk a land he holds only by promise — to measure with his feet an inheritance no deed has yet given him. This is possession by faith, and Hebrews reads the whole patriarchal walk by it: *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9). He walked it and dwelt in tents in it and yet *died in faith, not having received the promises, but having seen them afar off... and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). The walking measures an inheritance held in hope past this life: *they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). The restored witnesses give the same command, and Jasher binds it to covenant-walk: *Arise, walk (through the land) in the length of it and the breadth of it... for to your seed shall I give it* (Jubilees 13:20); *Now therefore walk before me and be perfect and keep my commands, for to you and to your seed I will give this land for an inheritance* (Jasher 13:18). To walk the land is to walk before Yahuah in faith and obedience together — the inheriting-in-hope is never the keeping-of-commands set aside, but the two as one path.',
       sv.verse_id, ev.verse_id, 'extras', 20312
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-13-the-altar-at-mamre-calling-on-the-name',
       E'The altar at Mamre — calling on the name',
       E'The chapter is framed by worship. Coming up from Egypt, Abram returns *unto the place of the altar, which he had made there at the first: and there Abram called on the name of Yahuah (LORD)* (Genesis 13:4) — the very altar between Beth-el and Hai where *he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* (Genesis 12:8). And at the chapter''s close, with the land renewed, *Abram removed his tent, and came and dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD)* (Genesis 13:18). This is the old true worship of the seed-line: *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26), carried down through Abram''s altars, each one answering an appearing of Yahuah — *Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). The restored witnesses remember the altars and fill in the confession: *he built an altar there, and he offered thereon a burnt sacrifice to Yahuah (God), who had appeared to him* (Jubilees 13:4); returning to the first altar he *called on the name of Yahuah (God), and said: "You, the most high Elohim (God), are my Elohim (God) for ever and ever"* (Jubilees 13:15); and Jasher names the place — *he there built an altar to Yahuah (the Lord) who appeared to him, which is still to this day in the plains of Mamre* (Jasher 13:28). The calling-on-the-Name is no bare invocation but a covenant confession: Yahuah appears, renews the land, and Abram raises an altar and names Him his Elohim for ever.',
       sv.verse_id, ev.verse_id, 'extras', 20315
  FROM _s301_ge13_lookup sv, _s301_ge13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the promise, that he should be the heir of the world... through the righteousness of faith* (Romans 4:13) — Abram yields the choicest plain (*separate thyself, I pray thee, from me*, 13:9) because the WHOLE land is already his by faith.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-let-there-be-no-strife-abrams-generous-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*that righteous man... vexed his righteous soul from day to day* (2 Peter 2:8) — the end of Lot''s choice-by-sight (*beheld all the plain of Jordan... even as the garden of Yahuah*, 13:10) is a soul vexed daily in the land his eyes desired.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And delivered just Lot, vexed with the filthy conversation of the wicked* (2 Peter 2:7) — saved yet vexed, the believer who *pitched his tent toward Sodom* (13:12) by sight.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*turning the cities of Sodom and Gomorrha into ashes... an ensample* (2 Peter 2:6) — the plain of *the men of Sodom were wicked and sinners before Yahuah exceedingly* (13:13) was already under sentence.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Then Yahuah rained upon Sodom and upon Gomorrah brimstone and fire* (Genesis 19:24) — the doom named in the same breath as the beauty (*well watered... before Yahuah destroyed Sodom and Gomorrah*, 13:10) falls on the land chosen by sight.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17) — the restored witness names the same parting and indictment as *the men of Sodom were wicked and sinners before Yahuah exceedingly* (13:13).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-lot-lifted-up-his-eyes-the-choice-by-sight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed* (Hebrews 11:8) — Abram looks where Yahuah says *Lift up now thine eyes... northward, and southward, and eastward, and westward* (13:14) upon an inheritance held by faith.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Unto thy seed will I give this land: and there builded he an altar* (Genesis 12:7) — the grant first spoken at the entrance to Canaan, now renewed and enlarged with *for ever* (13:15).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Unto thy seed have I given this land, from the river of Egypt unto the great river* (Genesis 15:18) — the *to thy seed for ever* of 13:15 cut into sworn covenant, the boundaries named.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*all the land of Canaan, for an everlasting possession; and I will be their Elohim* (Genesis 17:8) — the *for ever* of 13:15 spelled out as an everlasting possession bound to the covenant bond.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the promise, that he should be the heir of the world... through the righteousness of faith* (Romans 4:13) — the land-grant of 13:15 read as nothing less than the world inherited by faith.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Elohim, who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17) — the *for ever* grant rests on the One who raises the dead to keep it.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*he looked for a city which hath foundations, whose builder and maker is Elohim* (Hebrews 11:10) — the *for ever* of 13:15 reaches past this life to the everlasting city, held by resurrection-hope.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*all the land which you see I shall give to you and to your seed for ever* (Jubilees 13:20) — the restored witness renews *to thy seed for ever* (13:15) word for word.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*This is the land which I gave to you and to your seed after you forever* (Jasher 13:7) — Jasher renews the same grant, the land *which you see* given *to your seed after you forever*.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-to-thee-and-to-thy-seed-for-ever-the-land-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Look now toward heaven, and tell the stars... So shall thy seed be* (Genesis 15:5) — the dust-figure of 13:16 matched by the star-figure, both past counting.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17) — dust, stars, and sand gathered as one innumerable seed, sworn by oath after the binding of Isaac.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Who against hope believed in hope... So shall thy seed be* (Romans 4:18) — the dust-promise of 13:16 is the very word Abram believed against all sight.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12) — the dust-promise of 13:16 come true from one as good as dead.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*though a man may number the dust of the earth, yet your seed shall not be numbered* (Jubilees 13:20) — the restored witness carries the same innumerable-seed word as 13:16 (distinct row from THREAD 3: source 13:16, not 13:15).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-thy-seed-as-the-dust-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles* (Hebrews 11:9) — Abram walks (*walk through the land in the length of it and in the breadth of it*, 13:17) a land held only by promise.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*These all died in faith, not having received the promises... strangers and pilgrims on the earth* (Hebrews 11:13) — the walk of 13:17 measures an inheritance held in hope past this life.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they desire a better country, that is, an heavenly... he hath prepared for them a city* (Hebrews 11:16) — the walked land of 13:17 opens onto the heavenly country, the *for ever* reaching to the prepared city.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Arise, walk (through the land) in the length of it and the breadth of it... for to your seed shall I give it* (Jubilees 13:20) — the restored witness gives the same possession-by-walking command as 13:17.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*walk before me and be perfect and keep my commands, for to you and to your seed I will give this land for an inheritance* (Jasher 13:18) — Jasher binds the walk of 13:17 to covenant-walk: faith and obedience as one path, never commands set aside.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-walk-through-the-land-possession-by-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*then began men to call upon the name of Yahuah* (Genesis 4:26) — Abram''s *called on the name of Yahuah* (13:4) keeps the worship begun in the line of Seth.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*there he builded an altar unto Yahuah, and called upon the name of Yahuah* (Genesis 12:8) — the very altar between Beth-el and Hai Abram returns to at 13:4.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Unto thy seed will I give this land: and there builded he an altar unto Yahuah, who appeared unto him* (Genesis 12:7) — at Mamre Abram builds an altar (13:18) as at Sichem; each renewed land-word answered by worship.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*called on the name of Yahuah... "You, the most high Elohim, are my Elohim for ever and ever"* (Jubilees 13:15) — the restored witness fills the covenant confession behind *Abram called on the name of Yahuah* (13:4).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he built an altar there, and he offered thereon a burnt sacrifice to Yahuah, who had appeared to him* (Jubilees 13:4) — the same altar-building as *built there an altar unto Yahuah* (13:18), the altar answering the appearing.'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*he there built an altar to Yahuah who appeared to him, which is still to this day in the plains of Mamre* (Jasher 13:28) — Jasher names the very place of *dwelt in the plain of Mamre... and built there an altar* (13:18).'
  FROM cross_reference_threads t
  JOIN _s301_ge13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s301_ge13_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-13-the-altar-at-mamre-calling-on-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_14.sql (Genesis 14) -----
-- Chapter: Genesis 14 (the war of the four kings against five; Lot captured; Abram's rescue with 318 trained servants; ★★ Melek Tsadiq king of Salem, priest of El Elyon, brings bread and wine and blesses Abram, who gives him tithes of all; Abram refuses the king of Sodom's goods)
-- Tag: ge14   Temp view: _s301_ge14_lookup
-- Sort band: base 20325, step 3 -> threads at 20325, 20328, 20331, 20334 (4 threads)
-- Source of EVERY row: 'canon','genesis',14,v
--
-- Genesis 14 coverage:
--   v.1-12 (the four kings — Amraphel, Arioch, Chedorlaomer, Tidal — make war on the five kings of Sodom and the plain; the vale of Siddim full of slimepits; Sodom plundered; Lot, Abram's brother's son, taken captive with his goods)
--        NT:     none warranted (the war's forward weave is borne by the rescue/Melek-Tsadiq threads; no NT passage takes up the four-vs-five war itself)
--        Extras: Jubilees 13:23 (they took captive Lot also, the son of Abram's brother, and all his possessions); Jasher 16:1-6 (the nine kings, the valley of Siddim, the lime pits, Lot and his property taken) — THREAD 1
--        Tanakh: none warranted distinct (the players are named only here; Deut/Sodom-judgment weave belongs to Gen 18-19, not this war)
--   v.13-16 (one that escaped told Abram the Hebrew; Abram armed his 318 trained servants born in his house, pursued by night unto Dan, divided himself against them, smote them, brought back all the goods and Lot)
--        NT:     none warranted as a clean MEMBER (the deliverer-type is carried forward christologically at THREAD 3; Hebrews 7:1 names "the slaughter of the kings" but is woven there)
--        Extras: Jasher 16:7-8 (Abram rose up with about three hundred and eighteen men, that night pursued and smote the kings, recovered Lot and all his property) — THREAD 2
--        Tanakh: Genesis 15:1 (the reward closing the rescue arc — folded into THREAD 4); the covenant-man-as-deliverer prefigure framed in THREAD 2 prose
--   ★★ v.17-20 (the king of Sodom comes out; Melek Tsadiq (Melchizedek) king of Salem brings forth bread and wine, priest of El Elyon; he blesses Abram of the El Elyon, possessor of heaven and earth; blessed be El Elyon who delivered thine enemies; Abram gives him tithes of all) — THE CENTERPIECE
--        NT:     Hebrews 7:1-3 (this Melek Tsadiq, king of Salem, priest of El Elyon... without father, without mother... made like unto the Son of Elohim; abideth a priest continually); Hebrews 7:4 (the patriarch Abraham gave the tenth of the spoils — greater than Levi); Hebrews 6:20 / 5:6 (Yahusha made an high priest for ever after the order of Melek Tsadiq); Matthew 26:26-28 (the bread and the cup — the Melek-Tsadiq priest-king's table fulfilled at the Supper) — THREAD 3 (load-bearing)
--        Extras: Jasher 16:11-12 (Adonizedek king of Jerusalem, the same was Shem, went out with bread and wine, a priest before Elohim, and Abram gave him a tenth); Jubilees 13:26-27 (the tithe ordained an ordinance for ever, of seed and wine and oil and cattle, given to His priests to eat and drink with joy before Him) — THREAD 3
--        Tanakh: Psalm 110:4 (Yahuah hath sworn... Thou art a priest for ever after the order of Melek Tsadiq); Psalm 76:2 (in Salem also is his tabernacle, and his dwelling place in Zion — Salem = Jerusalem/Zion); Genesis 28:22 (Jacob: of all that thou shalt give me I will surely give the tenth unto thee — the tithe rooted in the patriarchs) — THREAD 3
--   v.21-24 (the king of Sodom says, Give me the persons, take the goods; Abram: I have lift up mine hand unto Yahuah, the El Elyon, possessor of heaven and earth, that I will not take from a thread to a shoelatchet, lest thou shouldest say I have made Abram rich; save only the young men's portion)
--        NT:     none warranted (the refusal's reward-frame is OT-internal; Gen 15:1 is the immediate answer — THREAD 4)
--        Extras: Jasher 16:14-16 (As Yahuah lives... I will not take anything belonging to you, that you may not boast... I will not take from a shoetie or thread); Jubilees 13:29 (I lift up my hands to the El Elyon Elohim, that from a thread to a shoe-latchet I shall not take aught that is your, lest you should say I have made Abram rich) — THREAD 4
--        Tanakh: Genesis 15:1 (Fear not, Abram: I am thy shield, and thy exceeding great reward — the refused riches answered by Yahuah Himself as the reward) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. genesis-14-the-war-of-the-kings-and-lot-taken-captive — Extras (Jubilees, Jasher) [extras]
--   2. genesis-14-abram-the-deliverer-the-318-and-the-night-pursuit — Extras (Jasher) [extras]
--   3. genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe — NT (Hebrews, Matthew) + Tanakh (Psalm 110, Psalm 76, Genesis 28) + Extras (Jasher, Jubilees) [extras] (★★ CENTERPIECE)
--   4. genesis-14-i-have-lift-up-mine-hand-unto-el-elyon-abrams-reward-is-yahuah-himself — Tanakh (Genesis 15) + Extras (Jasher, Jubilees) [extras]
--
-- Framing notes:
--   ★★ MELEK TSADIQ — THE ETERNAL PRIESTHOOD (THREAD 3, the heaviest): the priest-king of Salem who meets
--   Abram with *bread and wine* (Genesis 14:18) and blesses him *of the El Elyon (most high God), possessor of
--   heaven and earth* (14:19), receiving *tithes of all* (14:20), is the great Christological type of the
--   Tanakh. Psalm 110:4 makes the oath — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for
--   ever after the order of Melek Tsadiq (Melchizedek)* — and Hebrews unfolds it: *without father, without
--   mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of
--   Elohim (God); abideth a priest continually* (Hebrews 7:3). Messiah's priesthood is NOT Levitical/Aaronic but
--   of the order of Melek Tsadiq — older than Levi (who *payed tithes in Abraham*, Hebrews 7:9-10), sworn by
--   oath, eternal, and priest-AND-king together. The bread and wine prefigure the Supper (Matthew 26:26-28: *Take,
--   eat; this is my body... this is my blood*). Salem is Jerusalem/Zion (Psalm 76:2: *in Salem also is his
--   tabernacle*). The Melek Tsadiq (Melchizedek) parenthetical convention kept on every mention.
--   THE DELIVERER (THREAD 2): Abram the covenant-man arms his own household and rescues his kin — the seed-of-
--   promise man who pursues by night and brings back the captive; the covenant defends its own. Framed as the
--   deliverer-prefigure without forcing a single NT member (the christological weight rides THREAD 3).
--   ABRAM'S REWARD IS YAHUAH (THREAD 4): Abram refuses the king of Sodom's goods with hand lifted to *Yahuah, the
--   El Elyon, possessor of heaven and earth* (14:22) — and the very next word of the story answers him: *I am thy
--   shield, and thy exceeding great reward* (Genesis 15:1). He will not be made rich by Sodom because Yahuah
--   Himself is his portion. Jubilees double-written 'jubilees','jubilees'; Jasher double-written 'jasher','jasher'.
--   AVOIDED: Jubilees 13:25 is a run-together/apparatus-dotted parse (the tithe institution swallowed with
--   "25….….") — used the clean Jubilees 13:26-27 and 13:29 instead. Jasher 14 (the Rikayon/Pharaoh tale) is
--   unrelated to this chapter and not used; the war/Melchizedek material is in Jasher 16.

CREATE TEMP VIEW _s301_ge14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the war of the kings and Lot taken captive
    ('canon','genesis',14,12,'jubilees','jubilees',13,23,'extras',
      E'*And they took captive Sodom and Adam and Zeboim, and they took captive Lot also, the son of Abram''s brother, and all his possessions, and they went to Dan* (Jubilees 13:23). The restored witness carries the same capture as *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed* (Genesis 14:12) — the kinsman of the covenant-man swept off with the spoil of Sodom, the captivity that the rescue will answer.'),
    ('canon','genesis',14,9,'jasher','jasher',16,3,'extras',
      E'*And the five kings of Sodom and Gomorrah, Shinab king of Admah, Shemeber king of Zeboyim, Bera king of Sodom, Bersha king of Gomorrah, and Bela king of Zoar, went out to meet them, and they all joined together in the valley of Siddim* (Jasher 16:3). The same five kings and the same field of *four kings with five* (Genesis 14:9) are named in the restored witness — the war joined in the vale of Siddim, exactly as the chapter records.'),
    ('canon','genesis',14,11,'jasher','jasher',16,6,'extras',
      E'*And they plundered all the cities of Sodom and Gomorrah, and they also took Lot, Abram''s brother''s son, and his property... and Unic, Abram''s servant, who was in the battle... told Abram all that the kings had done* (Jasher 16:6). Genesis 14:11 says only *they took all the goods of Sodom and Gomorrah, and all their victuals, and went their way*; Jasher fills in how the news reached Abram — the escaped servant who told him Lot was taken, setting the rescue in motion.'),

    -- THREAD 2: Abram the deliverer — the 318 and the night pursuit
    ('canon','genesis',14,14,'jasher','jasher',16,7,'extras',
      E'*And Abram heard this, and he rose up with about three hundred and eighteen men that were with him, and he that night pursued these kings and smote them, and they all fell before Abram and his men* (Jasher 16:7). The restored witness keeps the very number and the night-strike of *he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan... by night, and smote them* (Genesis 14:14-15) — the covenant-man taking his own household to deliver his captive kin.'),
    ('canon','genesis',14,16,'jasher','jasher',16,8,'extras',
      E'*And Abram recovered all the property of Sodom, and he also recovered Lot and his property, his wives and little ones and all belonging to him, so that Lot lacked nothing* (Jasher 16:8). The full recovery of *he brought back all the goods, and also brought again his brother Lot, and his goods, and the women also, and the people* (Genesis 14:16) is told again in the restored witness — the deliverer brings every captive home; Lot lacked nothing.'),

    -- ★★ THREAD 3 (CENTERPIECE): Melek Tsadiq — king of Salem, priest of El Elyon, bread and wine, and the tithe
    ('canon','genesis',14,18,'canon','hebrews',7,1,'free',
      E'*For this Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon (most high God), who met Abraham returning from the slaughter of the kings, and blessed him* (Hebrews 7:1). The apostle takes up *Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18) exactly — the same king, the same Salem, the same priest of El Elyon, the same blessing after the slaughter of the kings — and makes him the figure of Messiah''s priesthood.'),
    ('canon','genesis',14,18,'canon','hebrews',7,3,'free',
      E'*Without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually* (Hebrews 7:3). Melek Tsadiq enters the story in Genesis 14:18 with no genealogy, no birth, no death recorded — *priest of the El Elyon* appearing and vanishing — and the apostle reads that silence as the type: a priesthood with *neither beginning of days, nor end of life*, made like the Son of Elohim, who *abideth a priest continually*.'),
    ('canon','genesis',14,18,'canon','matthew',26,26,'free',
      E'*And as they were eating, Yahusha (Jesus) took bread, and blessed it, and brake it, and gave it to the disciples, and said, Take, eat; this is my body* (Matthew 26:26). The priest-king of Salem *brought forth bread and wine* (Genesis 14:18) and blessed; at the table the priest after his order takes the bread, blesses, and gives it as his own body — the bread and wine of Melek Tsadiq carried forward to the Supper.'),
    ('canon','genesis',14,18,'canon','matthew',26,28,'free',
      E'*For this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28). The *wine* the priest of El Elyon brought forth to bless Abram (Genesis 14:18) finds its meaning at the cup: the blood of the covenant. The Melek-Tsadiq table — bread and wine in the hand of the eternal priest-king — is filled when Messiah names the cup his own blood for the remission of sins.'),
    ('canon','genesis',14,20,'canon','hebrews',7,4,'free',
      E'*Now consider how great this man was, unto whom even the patriarch Abraham gave the tenth of the spoils* (Hebrews 7:4). When *he gave him tithes of all* (Genesis 14:20), Abraham — the father of the faithful, carrier of the promises — paid a tenth to Melek Tsadiq; and the apostle weighs it: *the less is blessed of the better* (Hebrews 7:7), so that even Levi, *in the loins of his father* (Hebrews 7:10), tithed in Abraham. The Melek-Tsadiq priesthood stands above the Levitical.'),
    ('canon','genesis',14,18,'canon','hebrews',6,20,'free',
      E'*Whither the forerunner is for us entered, even Yahusha (Jesus), made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). The priest of El Elyon who met Abram (Genesis 14:18) names the order of Messiah''s priesthood: Yahusha is *made an high priest for ever after the order of Melek Tsadiq* — not the dying Aaronic line but the eternal priest-king who entered within the veil as our forerunner.'),
    ('canon','genesis',14,18,'canon','psalms',110,4,'free',
      E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). The lone appearance of the priest-king of Salem in Genesis 14:18 becomes an oath in the psalm: Yahuah swears an everlasting priesthood *after the order of Melek Tsadiq* for the One who sits at His right hand — David''s Lord, priest and king together, the order older and higher than Levi''s.'),
    ('canon','genesis',14,18,'canon','psalms',76,2,'free',
      E'*In Salem also is his tabernacle, and his dwelling place in Zion* (Psalm 76:2). The *Salem* over which Melek Tsadiq reigned as priest-king (Genesis 14:18) is named by the psalm as the place of Yahuah''s own dwelling — Salem is Zion, Jerusalem. The city of the bread-and-wine priest-king is the city where Yahuah sets His tabernacle.'),
    ('canon','genesis',14,20,'canon','genesis',28,22,'free',
      E'*And this stone, which I have set for a pillar, shall be Elohim''s (God''s) house: and of all that thou shalt give me I will surely give the tenth unto thee* (Genesis 28:22). The tithe Abram gives the priest of El Elyon — *he gave him tithes of all* (Genesis 14:20) — is taken up by his grandson Jacob at Bethel, who vows the tenth to Yahuah. The tithe is not first a Levitical law but a patriarchal worship, given to the priest-king of Salem and renewed at the house of Elohim.'),
    ('canon','genesis',14,18,'jasher','jasher',16,11,'extras',
      E'*And Adonizedek king of Jerusalem, the same was Shem, went out with his men to meet Abram and his people, with bread and wine, and they remained together in the valley of Melech* (Jasher 16:11). The restored witness remembers the priest-king of Salem under the name Adonizedek and identifies him as Shem, the surviving son of Noah — coming out with the same *bread and wine* of Genesis 14:18 to meet Abram in the king''s dale. The tradition seats the eternal-priesthood type in the oldest living covenant-father.'),
    ('canon','genesis',14,20,'jasher','jasher',16,12,'extras',
      E'*And Adonizedek blessed Abram, and Abram gave him a tenth from all that he had brought from the spoil of his enemies, for Adonizedek was a priest before Elohim (God)* (Jasher 16:12). The blessing and the tithe of *And he blessed him... And he gave him tithes of all* (Genesis 14:19-20) are kept in the restored witness — the priest before Elohim blesses Abram, and Abram renders him a tenth of the spoil.'),
    ('canon','genesis',14,20,'jubilees','jubilees',13,26,'extras',
      E'*And to this law there is no limit of days; for He has ordained it for the generations for ever that they should give to Yahuah (God) the tenth of everything, of the seed and of the wine and of the oil and of the cattle and of the sheep* (Jubilees 13:26). Where Genesis 14:20 records the single act — *he gave him tithes of all* — the restored witness reads it as the founding of a perpetual ordinance: the tithe of all increase given to Yahuah, set in the patriarch''s deed at Salem.'),
    ('canon','genesis',14,20,'jubilees','jubilees',13,27,'extras',
      E'*And He gave (it) to His priests to eat and to drink with joy before Him* (Jubilees 13:27). The tithe of *he gave him tithes of all* (Genesis 14:20) is given, in the restored witness, to the priests of Yahuah to eat and drink with joy before Him — the priestly portion of Melek Tsadiq''s bread and wine, the worship of the tenth carried to the table of the priest.'),

    -- THREAD 4: I have lift up mine hand unto El Elyon — Abram's reward is Yahuah Himself
    ('canon','genesis',14,23,'canon','genesis',15,1,'free',
      E'*After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward* (Genesis 15:1). Abram has just refused Sodom''s wealth — *I will not take from a thread even to a shoelatchet... lest thou shouldest say, I have made Abram rich* (Genesis 14:23) — and the next word of the story is Yahuah''s answer to that refusal: He Himself is the *exceeding great reward*. Abram would not be enriched by the king of Sodom because his portion is Yahuah.'),
    ('canon','genesis',14,22,'jasher','jasher',16,14,'extras',
      E'*And Abram answered the kings of Sodom, saying, As Yahuah (the Lord) lives who created heaven and earth... I will not take anything belonging to you, that you may not boast tomorrow, saying, Abram became rich from our property that he saved* (Jasher 16:14). The oath of *I have lift up mine hand unto Yahuah (LORD), the El Elyon (most high God), the possessor of heaven and earth* (Genesis 14:22) is kept in the restored witness — Abram swears by Yahuah who made heaven and earth that Sodom shall not be able to claim it made him rich.'),
    ('canon','genesis',14,23,'jasher','jasher',16,16,'extras',
      E'*as Yahuah (the Lord) lives I will not take from you from a living soul down to a shoetie or thread, excepting the expense of the food of those who went out with me to battle... the portions of the men who went with me, Anar, Ashcol, and Mamre* (Jasher 16:16). The refusal *from a thread even to a shoelatchet* and the reservation of the men''s portion (Genesis 14:23-24) are kept verbatim in sense in the restored witness — nothing of Sodom''s for Abram, only the share of those who fought.'),
    ('canon','genesis',14,22,'jubilees','jubilees',13,29,'extras',
      E'*And Abram said to him: "I lift up my hands to the El Elyon (Most High) Elohim (God), that from a thread to a shoe-latchet I shall not take aught that is your, lest you should say I have made Abram rich; save only what the young men have eaten, and the portion of the men who went with me–Aner, Eschol, and Mamre."* (Jubilees 13:29). The lifted hand and oath of Genesis 14:22-24 are preserved almost word for word — Abram binds himself before the El Elyon to take nothing of Sodom''s, that no man might say Sodom made him rich.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-14-the-war-of-the-kings-and-lot-taken-captive',
       E'The war of the kings — and Lot taken captive',
       E'The chapter opens on a war among kings: *Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations* (Genesis 14:1) make war against the five kings of the plain, *four kings with five* (Genesis 14:9), and *the vale of Siddim was full of slimepits; and the kings of Sodom and Gomorrah fled, and fell there* (Genesis 14:10). The victors *took all the goods of Sodom and Gomorrah... and went their way* (Genesis 14:11) — and with the spoil they *took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed* (Genesis 14:12). Lot, who had pitched toward Sodom, is swept off with Sodom''s judgment. The restored witnesses tell the same war. Jasher names the five: *Shinab king of Admah, Shemeber king of Zeboyim, Bera king of Sodom, Bersha king of Gomorrah, and Bela king of Zoar... joined together in the valley of Siddim* (Jasher 16:3), and *they plundered all the cities of Sodom and Gomorrah, and they also took Lot, Abram''s brother''s son, and his property... and Unic, Abram''s servant... told Abram all that the kings had done* (Jasher 16:6) — adding the escaped servant who carried word to Abram. Jubilees records the capture: *they took captive Lot also, the son of Abram''s brother, and all his possessions, and they went to Dan* (Jubilees 13:23). The covenant-man''s kin is in chains; the captivity sets up the rescue, and the rescue sets up the meeting with the priest-king of Salem.',
       sv.verse_id, ev.verse_id, 'extras', 20325
  FROM _s301_ge14_lookup sv, _s301_ge14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=14 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-14-abram-the-deliverer-the-318-and-the-night-pursuit',
       E'Abram the deliverer — the 318 and the night pursuit',
       E'Word reaches the covenant-man: *there came one that had escaped, and told Abram the Hebrew* (Genesis 14:13). Abram does not bargain or wait — *when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan* (Genesis 14:14). He strikes by night: *he divided himself against them, he and his servants, by night, and smote them, and pursued them unto Hobah* (Genesis 14:15), and *he brought back all the goods, and also brought again his brother Lot, and his goods, and the women also, and the people* (Genesis 14:16). The seed-of-promise man takes his own household and delivers his captive kin — the covenant defends its own; the deliverer pursues into the dark and brings every captive home. The restored witness keeps the very number and the night-strike: *Abram... rose up with about three hundred and eighteen men that were with him, and he that night pursued these kings and smote them, and they all fell before Abram and his men* (Jasher 16:7); *and Abram recovered all the property of Sodom, and he also recovered Lot and his property, his wives and little ones and all belonging to him, so that Lot lacked nothing* (Jasher 16:8). The man through whom all families of the earth will be blessed is first shown as a rescuer of the captive — a deliverer-figure who leaves none behind.',
       sv.verse_id, ev.verse_id, 'extras', 20328
  FROM _s301_ge14_lookup sv, _s301_ge14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=14 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ★★ THREAD 3 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe',
       E'Melek Tsadiq — king of Salem, priest of El Elyon, bread and wine, and the tithe',
       E'Returning from the slaughter, Abram is met by a figure who appears once and vanishes, yet carries the whole canon''s priesthood: *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God). And he blessed him, and said, Blessed be Abram of the El Elyon (most high God), possessor of heaven and earth... And he gave him tithes of all* (Genesis 14:18-20). A priest-king — king of Salem and priest of El Elyon together — bread and wine in his hand, a blessing on his lips, a tithe in his receiving. The order of David''s Lord is sworn here. *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4) — an everlasting priesthood for the One at Yahuah''s right hand, priest and king as Melek Tsadiq was. And Salem is no obscure town: *In Salem also is his tabernacle, and his dwelling place in Zion* (Psalm 76:2) — Salem is Jerusalem, the city of Yahuah''s dwelling. The apostle takes the silence of Genesis 14 as the type: *this Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon (most high God), who met Abraham returning from the slaughter of the kings, and blessed him* (Hebrews 7:1), is *without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually* (Hebrews 7:3). This priesthood stands above Levi''s: *consider how great this man was, unto whom even the patriarch Abraham gave the tenth of the spoils* (Hebrews 7:4) — and Levi, yet in Abraham''s loins, tithed in him. So Messiah is *made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20) — not the dying Aaronic line but an eternal priest-king. The bread and wine reach their meaning at the Supper: *Take, eat; this is my body* (Matthew 26:26); *this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28). The tithe, too, is patriarchal worship before it is law — Jacob vows *of all that thou shalt give me I will surely give the tenth unto thee* (Genesis 28:22). The restored witnesses guard the scene: *Adonizedek king of Jerusalem, the same was Shem, went out with his men to meet Abram... with bread and wine* (Jasher 16:11), and *Adonizedek blessed Abram, and Abram gave him a tenth... for Adonizedek was a priest before Elohim (God)* (Jasher 16:12) — seating the eternal-priesthood type in Shem, the oldest living covenant-father; while Jubilees reads the deed as a perpetual ordinance, the tithe *of the seed and of the wine and of the oil and of the cattle and of the sheep* (Jubilees 13:26), given *to His priests to eat and to drink with joy before Him* (Jubilees 13:27). One mind holds it: the priest-king of Salem, the bread and wine, the tithe — Messiah''s eternal priesthood, above the Levitical, prefigured in a single meeting after a battle.',
       sv.verse_id, ev.verse_id, 'extras', 20331
  FROM _s301_ge14_lookup sv, _s301_ge14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-14-i-have-lift-up-mine-hand-unto-el-elyon-abrams-reward-is-yahuah-himself',
       E'I have lift up mine hand unto El Elyon — Abram''s reward is Yahuah Himself',
       E'The king of Sodom offers Abram the spoils: *Give me the persons, and take the goods to thyself* (Genesis 14:21). Abram refuses with an oath: *I have lift up mine hand unto Yahuah (LORD), the El Elyon (most high God), the possessor of heaven and earth, That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich* (Genesis 14:22-23) — reserving only the portion of the men who fought (Genesis 14:24). He will owe Sodom nothing; no pagan king will be able to claim he made the covenant-man rich. And the story''s next word answers the refusal: *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward* (Genesis 15:1). Abram turned down Sodom''s wealth because his reward is Yahuah Himself — the *exceeding great reward* given to the man who would not be enriched by the world. The restored witnesses keep the oath: *As Yahuah (the Lord) lives who created heaven and earth... I will not take anything belonging to you, that you may not boast tomorrow, saying, Abram became rich from our property* (Jasher 16:14); *I will not take from you from a living soul down to a shoetie or thread* (Jasher 16:16); *I lift up my hands to the El Elyon (Most High) Elohim (God), that from a thread to a shoe-latchet I shall not take aught that is your* (Jubilees 13:29). The hand lifted to El Elyon, possessor of heaven and earth, lets go of Sodom''s gold to hold fast to Yahuah, who is the reward.',
       sv.verse_id, ev.verse_id, 'extras', 20334
  FROM _s301_ge14_lookup sv, _s301_ge14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=14 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the five kings of Sodom and Gomorrah... went out to meet them, and they all joined together in the valley of Siddim* (Jasher 16:3) — the same five kings of *four kings with five* (14:9), the war joined in the vale of Siddim.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-the-war-of-the-kings-and-lot-taken-captive'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they plundered all the cities of Sodom and Gomorrah, and they also took Lot... and Unic, Abram''s servant... told Abram* (Jasher 16:6) — the plunder of 14:11 and the escaped servant who carried word to Abram.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=11
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-the-war-of-the-kings-and-lot-taken-captive'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they took captive Lot also, the son of Abram''s brother, and all his possessions, and they went to Dan* (Jubilees 13:23) — the capture of 14:12, the covenant-man''s kin swept off with Sodom''s spoil.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=12
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-the-war-of-the-kings-and-lot-taken-captive'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Abram... rose up with about three hundred and eighteen men... and he that night pursued these kings and smote them* (Jasher 16:7) — the very 318 and the night-strike of 14:14-15.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-abram-the-deliverer-the-318-and-the-night-pursuit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Abram recovered all the property of Sodom, and he also recovered Lot and his property... so that Lot lacked nothing* (Jasher 16:8) — the full recovery of 14:16, the deliverer leaving no captive behind.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-abram-the-deliverer-the-318-and-the-night-pursuit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ★★ THREAD 3 members (CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*this Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon (most high God), who met Abraham... and blessed him* (Hebrews 7:1) — the apostle takes up 14:18 exactly: same king, same Salem, same priest of El Elyon.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*without father, without mother, without descent... but made like unto the Son of Elohim (God); abideth a priest continually* (Hebrews 7:3) — the no-genealogy silence of 14:18 read as the eternal-priesthood type.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD) hath sworn... Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4) — the lone appearance of 14:18 sworn as an everlasting priesthood for David''s Lord.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20) — the priest of El Elyon (14:18) names the order of Messiah''s eternal priesthood.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*In Salem also is his tabernacle, and his dwelling place in Zion* (Psalm 76:2) — the Salem of the priest-king (14:18) is Jerusalem/Zion, Yahuah''s dwelling.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=76 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Take, eat; this is my body* (Matthew 26:26) — the *bread* the priest-king brought forth (14:18) carried to the Supper''s table.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28) — the *wine* of the priest of El Elyon (14:18) filled at the cup of the covenant.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*consider how great this man was, unto whom even the patriarch Abraham gave the tenth of the spoils* (Hebrews 7:4) — the tithe of 14:20 weighed: the Melek-Tsadiq priesthood above Levi, who tithed in Abraham''s loins.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=20
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*of all that thou shalt give me I will surely give the tenth unto thee* (Genesis 28:22) — the tithe of 14:20 renewed by Jacob at Bethel: patriarchal worship, not first Levitical law.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=20
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*Adonizedek king of Jerusalem, the same was Shem, went out... with bread and wine* (Jasher 16:11) — the restored witness names the priest-king of Salem (14:18) as Shem, the oldest living covenant-father.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*Adonizedek blessed Abram, and Abram gave him a tenth... for Adonizedek was a priest before Elohim (God)* (Jasher 16:12) — the blessing and tithe of 14:19-20 kept in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=20
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'*they should give to Yahuah (God) the tenth of everything, of the seed and of the wine and of the oil and of the cattle and of the sheep* (Jubilees 13:26) — the act of 14:20 read as a perpetual tithe-ordinance.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=20
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 13, E'*He gave (it) to His priests to eat and to drink with joy before Him* (Jubilees 13:27) — the tithe of 14:20 as the priestly portion, the worship of the tenth at the priest''s table.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=20
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-melek-tsadiq-king-of-salem-priest-of-el-elyon-bread-and-wine-and-the-tithe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Fear not, Abram: I am thy shield, and thy exceeding great reward* (Genesis 15:1) — the next word after the refusal (14:23): Yahuah Himself the reward of the man who would not be enriched by Sodom.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=23
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-i-have-lift-up-mine-hand-unto-el-elyon-abrams-reward-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*As Yahuah (the Lord) lives who created heaven and earth... I will not take anything belonging to you, that you may not boast... Abram became rich from our property* (Jasher 16:14) — the oath of 14:22 kept in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=22
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-i-have-lift-up-mine-hand-unto-el-elyon-abrams-reward-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will not take from you from a living soul down to a shoetie or thread, excepting... the portions of the men who went with me, Anar, Ashcol, and Mamre* (Jasher 16:16) — the *thread to a shoelatchet* refusal and the men''s reserved portion of 14:23-24.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=23
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-i-have-lift-up-mine-hand-unto-el-elyon-abrams-reward-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I lift up my hands to the El Elyon (Most High) Elohim (God), that from a thread to a shoe-latchet I shall not take aught that is your* (Jubilees 13:29) — the lifted hand and oath of 14:22-24 preserved almost word for word.'
  FROM cross_reference_threads t
  JOIN _s301_ge14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=14 AND sv.verse_number=22
  JOIN _s301_ge14_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-14-i-have-lift-up-mine-hand-unto-el-elyon-abrams-reward-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_genesis_15.sql (Genesis 15) -----
-- Chapter: Genesis 15 (the word of Yahuah comes in a vision — I am thy shield and thy exceeding great reward; the childless Abram and the promised heir of his own bowels; the seed as the stars; "he believed in Yahuah and it was counted to him for righteousness"; the covenant cut — the pieces divided, the smoking furnace and burning lamp passing between; the 400-year sojourn-affliction prophesied; the land-grant from the river of Egypt to the Euphrates)
-- Tag: ge15   Temp view: _s301_ge15_lookup
-- Sort band: base 20350, step 3 -> threads at 20350, 20353, 20356, 20359, 20362 (5 threads)
-- Source of EVERY row: 'canon','genesis',15,v
--
-- Genesis 15 coverage:
--   v.1 (After these things the word of Yahuah came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward)
--        NT:     none warranted as MEMBER (the reward/inheritance forward-weave is carried by Heb 11:8-10,16 at THREAD 4 the covenant-cut; the "fear not / Yahuah himself the reward" theophany is held in the Tanakh laterals here)
--        Extras: Jubilees 14:1 (the word of Yahuah came to Abram in a dream: "Fear not, Abram; I am your defender, and your reward will be exceeding great") — THREAD 1
--        Tanakh: Genesis 14:22-23 (Abram refusing the goods of the king of Sodom — "I will not take... lest thou shouldest say, I have made Abram rich"); Psalm 16:5 (Yahuah the portion of mine inheritance); Deuteronomy 33:29 (Yahuah the shield of thy help); Psalm 84:11 (Yahuah Elohim is a sun and shield) — THREAD 1
--   v.2-4 (Abram childless, Eliezer of Damascus his steward/heir; the word of Yahuah: he that shall come forth out of thine own bowels shall be thine heir)
--        NT:     Romans 4:18-21 (against hope believed in hope... considered not his own body now dead... staggered not at the promise) — folded into THREAD 2 (the promise against barrenness/deadness)
--        Extras: Jubilees 14:2-3 (the son of Mâsêq... Dammasek Eliezer my heir... "This will not be your heir, but one that will come out of your own bowels") — folded into THREAD 1/2 framing (present at THREAD 2 via Jub 14:4-5)
--        Tanakh: none warranted distinct (the childless-to-heir movement is carried into THREAD 2 the seed-as-stars)
--   ★ v.5 (Look now toward heaven, and tell the stars, if thou be able to number them... So shall thy seed be)
--        NT:     Romans 4:18 (according to that which was spoken, So shall thy seed be); Hebrews 11:12 (so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable) — THREAD 2 (load-bearing)
--        Extras: Jubilees 14:4-5 ("Look toward heaven and number the stars, if you are able to number them"... "So shall your seed be") — THREAD 2
--        Tanakh: Genesis 13:16 (I will make thy seed as the dust of the earth); Genesis 22:17 (I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore); Genesis 26:4 (I will make thy seed to multiply as the stars of heaven) — THREAD 2
--   ★★ v.6 (And he believed in Yahuah; and he counted it to him for righteousness) — THE MOST-DISTORTED VERSE
--        NT:     Romans 4:3 (Abraham believed Elohim, and it was counted unto him for righteousness); Romans 4:9 (faith was reckoned to Abraham for righteousness); Romans 4:22 (therefore it was imputed to him for righteousness); Galatians 3:6 (Even as Abraham believed Elohim, and it was accounted to him for righteousness); James 2:23 (Abraham believed Elohim, and it was imputed unto him for righteousness: and he was called the Friend of Elohim — read WITH works, James 2:21-22) — THREAD 3 (load-bearing CENTERPIECE)
--        Extras: Jubilees 14:6 (And he believed in Yahuah, and it was counted to him for righteousness) — THREAD 3
--        Tanakh: ★ Genesis 26:5 (Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws) — FRAMEWORK ANCHOR that completes the sentence; the SAME Abraham whose trust was reckoned righteous is the obedient covenant-keeper — THREAD 3
--   v.7-8 (I am Yahuah that brought thee out of Ur of the Chaldees to give thee this land; whereby shall I know that I shall inherit it?)
--        NT:     none warranted (the Ur-bringing-out is carried at Gen 11/12 packs; the "whereby shall I know" opens the covenant-cut, THREAD 4)
--        Extras: Jubilees 14:6 (I am Yahuah that brought you out of Ur of the Chaldees... for ever); Jubilees 14:8 (whereby shall I know that I shall inherit it?) — folded into THREAD 4 framing (present via Jub 14:11/16/18)
--        Tanakh: none warranted distinct (the land-oath is carried into THREAD 4)
--   ★ v.9-12,17-21 (the heifer/she-goat/ram/turtledove/pigeon divided; the deep sleep and horror of great darkness; the smoking furnace and burning lamp passing between the pieces; the covenant made; the land-grant boundaries and the ten nations)
--        NT:     none warranted as distinct member (Hebrews 11:8-10,16 the inheritance-by-faith / city with foundations folds in at THREAD 4) — see note
--        Extras: Jubilees 14:9-11 (Take Me an heifer of three years... and he divided them in the midst... but the birds divided he not); Jubilees 14:16 (a furnace was smoking, and a flame of fire passed between the pieces); Jubilees 14:18 (Yahuah made a covenant with Abram: to your seed will I give this land, from the river of Egypt to the great river, the Euphrates) — THREAD 4 (load-bearing)
--        Tanakh: Jeremiah 34:18 (the men that... passed between the parts of the calf — the cutting-covenant rite named); Genesis 17:7-8 (the everlasting covenant, the land of Canaan for an everlasting possession); Nehemiah 9:8 (thou madest a covenant with him to give the land... and hast performed thy words; for thou art righteous) — THREAD 4
--   ★ v.13-16 (thy seed shall be a stranger in a land that is not theirs... they shall afflict them four hundred years; and also that nation will I judge: and afterward shall they come out with great substance; in the fourth generation they shall come hither again, for the iniquity of the Amorites is not yet full)
--        NT:     Acts 7:6-7 (Stephen: his seed should sojourn in a strange land... four hundred years; and the nation to whom they shall be in bondage will I judge... after that shall they come forth, and serve me in this place) — THREAD 5 (load-bearing)
--        Extras: Jubilees 14:13-14 (your seed shall be a stranger in a land not theirs... afflict them four hundred years; the nation also to whom they will be in bondage shall I judge, and after that they will come forth thence with much substance) — THREAD 5
--        Tanakh: Exodus 12:40-41 (the sojourning of the children of Yashar'el... four hundred and thirty years... the selfsame day... all the hosts of Yahuah went out from the land of Egypt) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. genesis-15-i-am-thy-shield-and-thy-exceeding-great-reward — Tanakh (Genesis, Psalm, Deuteronomy) + Extras (Jubilees) [extras]
--   2. genesis-15-so-shall-thy-seed-be-the-stars-of-heaven — NT (Romans, Hebrews) + Tanakh (Genesis) + Extras (Jubilees) [extras]
--   3. genesis-15-he-believed-and-it-was-counted-for-righteousness — NT (Romans, Galatians, James) + Tanakh (Genesis 26:5 anchor) + Extras (Jubilees) [extras] (★★ CENTERPIECE — MOST-CONTESTED VERSE)
--   4. genesis-15-the-covenant-cut-the-formed-passed-between-the-pieces — Tanakh (Jeremiah, Genesis, Nehemiah) + Extras (Jubilees) [extras]
--   5. genesis-15-thy-seed-a-stranger-four-hundred-years — NT (Acts) + Tanakh (Exodus) + Extras (Jubilees) [extras]
--
-- Framing notes:
--   ★★ GENESIS 15:6 — "And he believed in Yahuah; and he counted it to him for righteousness" (THREAD 3, the
--   most-contested verse in the whole pack). NON-NEGOTIABLE FRAMING (Red Lines #5, #10; 1 John 2:3-4 filter):
--   Abram's TRUST in Yahuah's promise was reckoned to him as righteousness — this is covenant-trust that RECEIVES
--   the promise, NOT a sola-fide formula set AGAINST Torah-keeping. The verse is NOT pitting faith against the
--   commandments. The thread completes the sentence with the FRAMEWORK ANCHOR Genesis 26:5 — *Abraham obeyed my
--   voice, and kept my charge, my commandments, my statutes, and my laws* — the SAME Abraham whose belief was
--   counted righteous is named the keeper of Yahuah's charge and laws. Faith and covenant-faithfulness are ONE
--   walk: James 2:21-23 reads 15:6 WITH the offering of Isaac (*by works was faith made perfect... and the
--   scripture was fulfilled which saith, Abraham believed Elohim*) and calls him *the Friend of Elohim*. Romans
--   4:3,9,22 and Galatians 3:6 are quoted as the trust that receives, never as freedom-from-Torah. The default
--   Christian sola-fide-against-the-Law reading is deliberately OVERRIDDEN — trust reckoned righteous that THEN
--   walks in obedience, never instead of it.
--   ★ THE SEED AS THE STARS (THREAD 2): *Look now toward heaven, and tell the stars... So shall thy seed be*
--   (15:5) — the innumerable seed, joined with seed-as-dust (13:16) and seed-as-sand (22:17). Romans 4:18 and
--   Hebrews 11:12 weave it forward; framed as the seed-of-promise multitude carried by bloodline-AND-covenant-word
--   (never lineage-alone, never word-alone), the trust that believes the promise against a dead body and barren womb.
--   ★ THE COVENANT CUT (THREAD 4): *a smoking furnace, and a burning lamp that passed between those pieces*
--   (15:17) — the self-maledictory covenant. Abram is put in a deep sleep; YAHUAH ALONE — the Formed, the visible
--   Glory who appeared and spoke — passes between the divided pieces, binding HIMSELF to the oath (Jeremiah 34:18
--   names the rite; Nehemiah 9:8 names Him faithful who performed it). The Formed-and-the-Formless lens (Red Line
--   #4): the One who passes through the pieces is the Formed Son who bears the Name, never a co-equal-persons or
--   modalist grammar. The land-grant (15:18-21) is the everlasting-possession oath (Genesis 17:7-8).
--   ★ THE 400 YEARS (THREAD 5): *thy seed shall be a stranger in a land that is not theirs... four hundred years...
--   and afterward shall they come out with great substance* (15:13-14) — the sojourn-and-exodus foretold; Stephen
--   quotes it (Acts 7:6-7); Exodus 12:40-41 records the *selfsame day* fulfillment. The affliction is judgment-
--   bearing prophecy, the bondage and the deliverance both sworn before the seed exists.
--   EXTRAS: Jubilees 14 closely parallels Genesis 15 verse-for-verse (clean parse; vv.7,12,17,21 absent from this
--   parse, AVOIDED — used only present clean verses 14:1,4,5,6,9,11,13,14,16,18). Jubilees DOUBLE-WRITTEN
--   'jubilees','jubilees'. Jasher: NONE WARRANTED — Jasher's Abram material (ch 9 idolatry, ch 15 the Egypt/Sarai
--   famine episode and Lot separation) is the Genesis 11-13 narrative, NOT the covenant-cut of Genesis 15; no
--   distinct Genesis-15 parallel exists in this Jasher parse, so it is deliberately omitted rather than forced.

CREATE TEMP VIEW _s301_ge15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: I am thy shield, and thy exceeding great reward (Yahuah himself the reward)
    ('canon','genesis',15,1,'canon','genesis',14,23,'free',
      E'*That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich* (Genesis 14:23). Just before the vision, Abram refuses every spoil of the king of Sodom, that no man''s hand but Yahuah''s might enrich him. Then comes the word: *I am thy shield, and thy exceeding great reward* (Genesis 15:1). Having turned down Sodom''s goods, Abram is given Yahuah HIMSELF as his reward — not riches the Formed grants, but the Giver.'),
    ('canon','genesis',15,1,'canon','psalms',16,5,'free',
      E'*Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm 16:5). When Yahuah tells Abram *I am... thy exceeding great reward* (Genesis 15:1), He gives Himself as the inheritance — the very thing the psalmist later sings: not lands or spoil as the portion, but *Yahuah is the portion of mine inheritance*. The reward of the covenant is the covenant-Maker.'),
    ('canon','genesis',15,1,'canon','psalms',84,11,'free',
      E'*For Yahuah Elohim (the LORD God) is a sun and shield: Yahuah (LORD) will give grace and glory: no good thing will he withhold from them that walk uprightly* (Psalm 84:11). The first word to Abram in the vision is *Fear not... I am thy shield* (Genesis 15:1); the psalm gathers the same confession — Yahuah Himself is *a sun and shield* who withholds *no good thing from them that walk uprightly*. The shield is not a thing given but a Person who guards.'),
    ('canon','genesis',15,1,'canon','deuteronomy',33,29,'free',
      E'*Happy art thou, O Yashar''el (Israel): who is like unto thee, O people saved by Yahuah (LORD), the shield of thy help, and who is the sword of thy excellency!* (Deuteronomy 33:29). What Yahuah says to the one man — *I am thy shield* (Genesis 15:1) — Mosheh (Moses) sings over the whole nation that came of his seed: Yahuah is *the shield of thy help*. The promise to Abram becomes the standing confession of Yashar''el.'),
    ('canon','genesis',15,1,'jubilees','jubilees',14,1,'extras',
      E'*After these things, in the fourth year of this week, on the new moon of the third month, the word of Yahuah (God) came to Abram in a dream, saying: "Fear not, Abram; I am your defender, and your reward will be exceeding great."* (Jubilees 14:1). The restored witness carries the opening word verse-for-verse with Genesis 15:1 — *Fear not, Abram: I am thy shield, and thy exceeding great reward* — and dates it to the new moon of the third month, the very season of the covenant Yahuah is about to cut.'),

    -- THREAD 2: So shall thy seed be — the stars of heaven (the innumerable seed)
    ('canon','genesis',15,5,'canon','romans',4,18,'free',
      E'*Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be* (Romans 4:18). Sha''ul (Paul) quotes this very verse: when Yahuah brought Abram out and said *Look now toward heaven, and tell the stars... So shall thy seed be* (Genesis 15:5), Abram *against hope believed in hope*. The star-promise is the ground of the seed of promise — believed before a single child was born.'),
    ('canon','genesis',15,5,'canon','hebrews',11,12,'free',
      E'*Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). The star-count of Genesis 15:5 — *tell the stars, if thou be able to number them* — is read as fulfilled out of *one, and him as good as dead*: the innumerable seed, *as the stars of the sky... and as the sand which is by the sea shore*, gathering the heaven-promise of 15:5 with the sand-promise of 22:17 into one multitude.'),
    ('canon','genesis',15,5,'canon','genesis',13,16,'free',
      E'*And I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16). Two chapters before the stars, Yahuah had already set the seed beyond counting as *the dust of the earth*. Now He lifts Abram''s eyes from the dust to the heaven: *tell the stars, if thou be able to number them: ... So shall thy seed be* (Genesis 15:5). Dust below and stars above — the same innumerable seed measured against earth and sky.'),
    ('canon','genesis',15,5,'canon','genesis',22,17,'free',
      E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies* (Genesis 22:17). On the mount, after the binding of Isaac, the star-promise of *So shall thy seed be* (Genesis 15:5) is sworn again and joined to the sand: *as the stars of the heaven, and as the sand which is upon the sea shore*. The promise believed in chapter 15 is confirmed by oath in chapter 22 — and now carries the gate of the enemies, the seed-war victory.'),
    ('canon','genesis',15,5,'canon','genesis',26,4,'free',
      E'*And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed* (Genesis 26:4). The star-promise of Genesis 15:5 is handed down to Isaac: *I will make thy seed to multiply as the stars of heaven*. The innumerable-seed word is not a single saying but the covenant refrain carried to the next generation — and joined to the blessing of all nations in the one seed.'),
    ('canon','genesis',15,5,'jubilees','jubilees',14,5,'extras',
      E'*And he looked toward heaven, and beheld the stars. And He said to him: "So shall your seed be."* (Jubilees 14:5). The restored witness keeps the scene whole — Abram lifting his eyes, beholding the stars, and the word *So shall your seed be* — the same star-reckoning of *Look now toward heaven, and tell the stars... So shall thy seed be* (Genesis 15:5).'),

    -- THREAD 3 (★★ CENTERPIECE): He believed in Yahuah, and it was counted to him for righteousness
    ('canon','genesis',15,6,'canon','romans',4,3,'free',
      E'*For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3). Sha''ul (Paul) reaches back to this exact verse — *he believed in Yahuah; and he counted it to him for righteousness* (Genesis 15:6) — to say that Abram''s trust in the promise was reckoned as righteousness. This is covenant-trust RECEIVING the promise, the believing that lays hold of what Yahuah swore; it is not faith set against the commandments, for the same Abraham *kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5).'),
    ('canon','genesis',15,6,'canon','romans',4,9,'free',
      E'*Cometh this blessedness then upon the circumcision only, or upon the uncircumcision also? for we say that faith was reckoned to Abraham for righteousness* (Romans 4:9). The reckoning of Genesis 15:6 came while Abram was yet uncircumcised — so the righteousness of *he believed in Yahuah; and he counted it to him for righteousness* rests on trust, not on the mark of flesh as a boast. The order is trust first, then the sign, then the walk — never trust instead of the walk.'),
    ('canon','genesis',15,6,'canon','romans',4,22,'free',
      E'*And therefore it was imputed to him for righteousness* (Romans 4:22). Sha''ul closes the argument on the same verse: because Abram *staggered not at the promise... but was strong in faith* (Romans 4:20), *it was imputed to him for righteousness* — the imputing of Genesis 15:6. The faith that is reckoned righteous is the faith *fully persuaded that, what he had promised, he was able also to perform* (Romans 4:21): trust that holds Yahuah''s word, which then obeys His voice.'),
    ('canon','genesis',15,6,'canon','galatians',3,6,'free',
      E'*Even as Abraham believed Elohim (God), and it was accounted to him for righteousness* (Galatians 3:6). Sha''ul quotes Genesis 15:6 a second time to name *they which are of faith* as *the children of Abraham* (Galatians 3:7). The childship is by sharing Abraham''s trust — but Abraham''s trust was never trust-alone-against-Torah: it is *faithful Abraham* (Galatians 3:9), the believing that obeyed when called and kept Yahuah''s charge (Genesis 26:5).'),
    ('canon','genesis',15,6,'canon','james',2,23,'free',
      E'*And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God)* (James 2:23). Ya''aqob (James) reads Genesis 15:6 WITH the works, not against them: the verse was *fulfilled* when Abraham *offered Isaac his son upon the altar* (James 2:21), for *by works was faith made perfect* (James 2:22). The believing of 15:6 and the obeying of the binding are one walk — the trust reckoned righteous is the trust that acts, and Abraham is named *the Friend of Elohim*.'),
    ('canon','genesis',15,6,'canon','genesis',26,5,'free',
      E'*Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5). This is the sentence Genesis 15:6 begins and Genesis 26:5 completes. The SAME Abraham whose *believed in Yahuah* was *counted to him for righteousness* (Genesis 15:6) is the man Yahuah names as the one who *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws*. Trust reckoned righteous and a life of covenant-keeping are not two roads but one — faith that receives the promise and then walks in obedience, never freedom from the commandments.'),
    ('canon','genesis',15,6,'jubilees','jubilees',14,6,'extras',
      E'*And he believed in Yahuah (God), and it was counted to him for righteousness* (Jubilees 14:6). The restored witness carries Genesis 15:6 word for word — *he believed in Yahuah; and he counted it to him for righteousness* — and sets it in the mouth of the covenant: in the same breath Yahuah says *"I am Yahuah that brought you out of Ur of the Chaldees, to give you the land... and I shall be Elohim to you and to your seed after you."* The reckoned trust stands inside the covenant, not outside it.'),

    -- THREAD 4: The covenant cut — the Formed passed between the pieces
    ('canon','genesis',15,17,'canon','jeremiah',34,18,'free',
      E'*And I will give the men that have transgressed my covenant, which have not performed the words of the covenant which they had made before me, when they cut the calf in twain, and passed between the parts thereof* (Jeremiah 34:18). The prophet names the very rite of Genesis 15: a beast cut in two, the parties passing *between the parts* — a self-maledictory oath, calling the fate of the divided animal upon any who break the word. But at Abram''s covenant only *a smoking furnace, and a burning lamp... passed between those pieces* (Genesis 15:17): Yahuah ALONE walks the path, binding Himself, not Abram, to the curse.'),
    ('canon','genesis',15,18,'canon','genesis',17,8,'free',
      E'*And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God)* (Genesis 17:8). The land-grant cut here — *Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18) — is sealed two chapters on as *an everlasting possession*. The covenant of the pieces and the covenant of circumcision are one oath, the land given to the seed for ever.'),
    ('canon','genesis',15,18,'canon','nehemiah',9,8,'free',
      E'*And foundest his heart faithful before thee, and madest a covenant with him to give the land of the Canaanites... to give it, I say, to his seed, and hast performed thy words; for thou art righteous* (Nehemiah 9:8). Centuries later Yashar''el remembers this very covenant — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land* (Genesis 15:18) — and confesses that Yahuah *hast performed thy words; for thou art righteous*. The self-bound oath of the burning lamp was kept; the One who passed between the pieces proved faithful.'),
    ('canon','genesis',15,17,'jubilees','jubilees',14,16,'extras',
      E'*And you will go to your fathers in peace, and be buried in a good old age. But in the fourth generation they will return hither; for the iniquity of the Amorites is not yet full." And he awoke from his sleep, and he arose, and the sun had set; and there was a flame, and behold! a furnace was smoking, and a flame of fire passed between the pieces* (Jubilees 14:16). The restored witness keeps the heart of the sign: *a furnace was smoking, and a flame of fire passed between the pieces* — the smoking furnace and burning lamp of *passed between those pieces* (Genesis 15:17), Yahuah alone moving through the divided sacrifice.'),
    ('canon','genesis',15,9,'jubilees','jubilees',14,11,'extras',
      E'*And he built there an altar, and sacrificed all these; and he poured their blood upon the altar, and divided them in the midst, and laid them over against each other; but the birds divided he not. And birds came down upon the pieces, and Abram drove them away* (Jubilees 14:11). The restored witness gathers the cutting of the covenant-beasts — *divided them in the midst... but the birds divided he not* — matching *divided them in the midst, and laid each piece one against another: but the birds divided he not* (Genesis 15:10), and Abram driving off the fowls that came down (Genesis 15:11).'),
    ('canon','genesis',15,18,'jubilees','jubilees',14,18,'extras',
      E'*And on that day Yahuah (God) made a covenant with Abram, saying: "To your seed will I give this land, from the river of Egypt to the great river, the river Euphrates..."* (Jubilees 14:18). The land-grant of the covenant is preserved entire — *To your seed will I give this land, from the river of Egypt to the great river, the river Euphrates* — the same boundaries and the same oath of *Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18).'),

    -- THREAD 5: Thy seed a stranger four hundred years — the sojourn and exodus foretold
    ('canon','genesis',15,13,'canon','acts',7,6,'free',
      E'*And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6). Stephen quotes the prophecy spoken over the sleeping Abram — *thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13) — naming it as the word Yahuah had sworn before the seed existed: the bondage in Egypt foretold to Abram in the horror of great darkness.'),
    ('canon','genesis',15,14,'canon','acts',7,7,'free',
      E'*And the nation to whom they shall be in bondage will I judge, said Elohim (God): and after that shall they come forth, and serve me in this place* (Acts 7:7). The second half of the oath — *also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14) — is read forward by Stephen to the exodus: the judging of Egypt and the coming-forth of the seed to *serve me in this place*. The affliction was sworn, and so was the deliverance.'),
    ('canon','genesis',15,13,'canon','exodus',12,40,'free',
      E'*Now the sojourning of the children of Yashar''el (Israel), who dwelt in Egypt, was four hundred and thirty years* (Exodus 12:40). The word over the sleeping Abram — *thy seed shall be a stranger in a land that is not theirs... four hundred years* (Genesis 15:13) — comes due: *the sojourning of the children of Yashar''el... was four hundred and thirty years*. What was prophesied to one childless man in a vision is dated and fulfilled to the very generation.'),
    ('canon','genesis',15,14,'canon','exodus',12,41,'free',
      E'*And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt* (Exodus 12:41). The promise *afterward shall they come out with great substance* (Genesis 15:14) is kept *the selfsame day*: the hosts of Yahuah marching out of Egypt, the seed coming forth from the bondage Abram was shown — the oath of the burning lamp performed to the day.'),
    ('canon','genesis',15,13,'jubilees','jubilees',14,13,'extras',
      E'*Know of a surety that your seed shall be a stranger in a land (that is) not theirs, and they will bring them into bondage, and afflict them four hundred years* (Jubilees 14:13). The restored witness keeps the prophecy of the great darkness — *your seed shall be a stranger in a land not theirs... and afflict them four hundred years* — verse-for-verse with *thy seed shall be a stranger in a land that is not theirs... they shall afflict them four hundred years* (Genesis 15:13).'),
    ('canon','genesis',15,14,'jubilees','jubilees',14,14,'extras',
      E'*And the nation also to whom they will be in bondage shall I judge, and after that they will come forth thence with much substance* (Jubilees 14:14). The deliverance half of the oath is carried entire — *the nation... shall I judge, and after that they will come forth... with much substance* — matching *that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-15-i-am-thy-shield-and-thy-exceeding-great-reward',
       E'I am thy shield, and thy exceeding great reward',
       E'After Abram refuses every spoil of the king of Sodom — *I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich* (Genesis 14:23) — the word of Yahuah comes to him in a vision: *Fear not, Abram: I am thy shield, and thy exceeding great reward* (Genesis 15:1). This is the Formed appearing and speaking — the visible Glory who bears the Name, the One who met Abram. And the reward He names is not riches the Formed would grant; it is Yahuah HIMSELF. Having turned down Sodom''s goods, Abram is given the Giver. The psalmist sings the same portion: *Yahuah (LORD) is the portion of mine inheritance and of my cup* (Psalm 16:5), and *Yahuah Elohim (the LORD God) is a sun and shield... no good thing will he withhold from them that walk uprightly* (Psalm 84:11). What is spoken to the one man becomes the standing confession of his seed: *who is like unto thee, O people saved by Yahuah (LORD), the shield of thy help* (Deuteronomy 33:29). The restored witness keeps the opening word and dates it to the season of the covenant: *the word of Yahuah (God) came to Abram in a dream, saying: "Fear not, Abram; I am your defender, and your reward will be exceeding great"* (Jubilees 14:1). The shield is not a thing given but a Person who guards; the reward is the covenant-Maker Himself.',
       sv.verse_id, ev.verse_id, 'extras', 20350
  FROM _s301_ge15_lookup sv, _s301_ge15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=15 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-15-so-shall-thy-seed-be-the-stars-of-heaven',
       E'So shall thy seed be — the stars of heaven',
       E'Abram is childless, and reckons his steward Eliezer his heir; but the word of Yahuah answers, *he that shall come forth out of thine own bowels shall be thine heir* (Genesis 15:4). Then Yahuah brings him outside: *Look now toward heaven, and tell the stars, if thou be able to number them... So shall thy seed be* (Genesis 15:5). The seed of promise is set beyond all counting — and this is the same innumerable seed measured already against the earth, *I will make thy seed as the dust of the earth* (Genesis 13:16), and sworn again on the mount, *as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17), and handed to Isaac, *I will make thy seed to multiply as the stars of heaven* (Genesis 26:4). It is one promise, carried by paternal bloodline and covenant-word together. Now weave forward. Sha''ul (Paul) quotes this very verse: Abram *against hope believed in hope... according to that which was spoken, So shall thy seed be* (Romans 4:18). And the writer to the Hebrews names the count fulfilled out of one as-good-as-dead man: *so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). The restored witness keeps the scene whole — *he looked toward heaven, and beheld the stars. And He said to him: "So shall your seed be"* (Jubilees 14:5). The star-promise is believed before a single child is born; it is the ground the next verse rests on.',
       sv.verse_id, ev.verse_id, 'extras', 20353
  FROM _s301_ge15_lookup sv, _s301_ge15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=15 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★ CENTERPIECE — MOST-CONTESTED VERSE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-15-he-believed-and-it-was-counted-for-righteousness',
       E'He believed in Yahuah — and it was counted to him for righteousness',
       E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). This is the most-distorted verse in the Scriptures, and the framework reads it exactly as it stands. Abram TRUSTED Yahuah''s promise of the innumerable seed, and that trust was reckoned to him as righteousness. This is covenant-trust that RECEIVES the promise — the believing that lays hold of what Yahuah swore — not a sola-fide formula set against the commandments. The verse does not pit faith against Torah; it begins a sentence that the same Abraham''s life completes: *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5). The man whose belief was counted righteous is the very man Yahuah names as the keeper of His charge and His laws. Trust reckoned righteous and a life of covenant-keeping are one walk, never two roads. Sha''ul (Paul) reaches back to this verse three times — *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3), *faith was reckoned to Abraham for righteousness* (Romans 4:9), *and therefore it was imputed to him for righteousness* (Romans 4:22) — to show that the reckoning rested on trust in the promise, while Abram was yet uncircumcised, the trust *fully persuaded that, what he had promised, he was able also to perform* (Romans 4:21). He quotes it again in Galatians — *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness* (Galatians 3:6) — naming *they which are of faith* the children of *faithful Abraham* (Galatians 3:9): the faith that obeyed when called. And Ya''aqob (James) reads the verse WITH the works, not against them: *the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness* when he *offered Isaac his son upon the altar*, for *by works was faith made perfect* — *and he was called the Friend of Elohim (God)* (James 2:21-23). The restored witness sets the reckoning inside the covenant itself: *And he believed in Yahuah (God), and it was counted to him for righteousness* (Jubilees 14:6), in the same breath as the land-oath and *I shall be Elohim to you and to your seed after you*. Abram''s trust receives the promise — and then walks in obedience. Never freedom from the commandments; the believing and the keeping are one.',
       sv.verse_id, ev.verse_id, 'extras', 20356
  FROM _s301_ge15_lookup sv, _s301_ge15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=15 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-15-the-covenant-cut-the-formed-passed-between-the-pieces',
       E'The covenant cut — the Formed passed between the pieces',
       E'*Whereby shall I know that I shall inherit it?* (Genesis 15:8), Abram asks — and Yahuah answers not with an argument but with a covenant. He commands the beasts taken and cut: *an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon* (Genesis 15:9), and Abram *divided them in the midst, and laid each piece one against another: but the birds divided he not* (Genesis 15:10). This is the cutting-rite the prophet later names — *when they cut the calf in twain, and passed between the parts thereof* (Jeremiah 34:18) — a self-maledictory oath: the one who passes between the pieces calls the fate of the divided animal upon himself if he breaks the word. Then *a deep sleep fell upon Abram; and, lo, an horror of great darkness fell upon him* (Genesis 15:12) — Abram is put OUT, made only a witness. And when the sun is down, *behold a smoking furnace, and a burning lamp that passed between those pieces* (Genesis 15:17). YAHUAH ALONE walks the bloody path — the Formed, the visible Glory who bears the Name, binding HIMSELF, not Abram, to the curse. The oath is His to keep: *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18), sealed two chapters on *for an everlasting possession* (Genesis 17:8). The restored witness keeps the sign — *a furnace was smoking, and a flame of fire passed between the pieces* (Jubilees 14:16) — and the land-grant entire (Jubilees 14:18). And Yashar''el confesses, long after, that the self-bound oath was kept: *thou... madest a covenant with him to give the land... and hast performed thy words; for thou art righteous* (Nehemiah 9:8). The One who passed between the pieces proved faithful.',
       sv.verse_id, ev.verse_id, 'extras', 20359
  FROM _s301_ge15_lookup sv, _s301_ge15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=15 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-15-thy-seed-a-stranger-four-hundred-years',
       E'Thy seed a stranger four hundred years — the sojourn and exodus foretold',
       E'Into the horror of great darkness Yahuah speaks the whole future of the seed: *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). The bondage in Egypt is foretold to a still-childless man — and so is the deliverance: *also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14), and *in the fourth generation they shall come hither again: for the iniquity of the Amorites is not yet full* (Genesis 15:16). Affliction and exodus are both sworn before the seed exists. Stephen quotes the oath entire: *his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6), and *the nation to whom they shall be in bondage will I judge... and after that shall they come forth, and serve me in this place* (Acts 7:7). And Exodus dates the fulfillment to the day: *the sojourning of the children of Yashar''el (Israel), who dwelt in Egypt, was four hundred and thirty years* (Exodus 12:40), and *at the end of the four hundred and thirty years, even the selfsame day... all the hosts of Yahuah (LORD) went out from the land of Egypt* (Exodus 12:41). The restored witness carries the prophecy verse-for-verse — *your seed shall be a stranger in a land not theirs... and afflict them four hundred years* (Jubilees 14:13), *the nation... shall I judge, and after that they will come forth... with much substance* (Jubilees 14:14). What was shown to Abram in a vision was performed to the generation, the selfsame day.',
       sv.verse_id, ev.verse_id, 'extras', 20362
  FROM _s301_ge15_lookup sv, _s301_ge15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=15 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich* (Genesis 14:23) — Abram refuses Sodom''s goods just before *I am thy... exceeding great reward* (15:1) gives him the Giver instead.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=1
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-i-am-thy-shield-and-thy-exceeding-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) is the portion of mine inheritance and of my cup* (Psalm 16:5) — the reward of *I am... thy exceeding great reward* (15:1) is Yahuah Himself, the portion the psalmist sings.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=1
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-i-am-thy-shield-and-thy-exceeding-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah Elohim (the LORD God) is a sun and shield... no good thing will he withhold from them that walk uprightly* (Psalm 84:11) — the *shield* of 15:1 is a Person who guards.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=1
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=84 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-i-am-thy-shield-and-thy-exceeding-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*who is like unto thee, O people saved by Yahuah (LORD), the shield of thy help* (Deuteronomy 33:29) — what is said to Abram (*I am thy shield*, 15:1) becomes the confession of his seed Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=1
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-i-am-thy-shield-and-thy-exceeding-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the word of Yahuah (God) came to Abram in a dream... "Fear not, Abram; I am your defender, and your reward will be exceeding great"* (Jubilees 14:1) — the opening word of 15:1 carried verse-for-verse, dated to the covenant season.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=1
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-i-am-thy-shield-and-thy-exceeding-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*against hope believed in hope... according to that which was spoken, So shall thy seed be* (Romans 4:18) — Sha''ul quotes the star-promise of 15:5 as the ground of Abram''s faith.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-so-shall-thy-seed-be-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12) — the star-count of 15:5 fulfilled out of one as-good-as-dead man, joined to the sand of 22:17.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-so-shall-thy-seed-be-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will make thy seed as the dust of the earth* (Genesis 13:16) — the same innumerable seed measured against the dust below before the stars above (15:5).'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-so-shall-thy-seed-be-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17) — the star-promise of 15:5 sworn again by oath on the mount, joined to the sand.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-so-shall-thy-seed-be-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will make thy seed to multiply as the stars of heaven* (Genesis 26:4) — the star-promise of 15:5 handed down to Isaac, the covenant refrain carried on.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-so-shall-thy-seed-be-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*he looked toward heaven, and beheld the stars. And He said to him: "So shall your seed be"* (Jubilees 14:5) — the restored witness keeps the star-scene of 15:5 whole.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-so-shall-thy-seed-be-the-stars-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★ CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3) — Sha''ul quotes 15:6: trust in the promise reckoned righteous, the believing that receives, not faith against the commandments.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-he-believed-and-it-was-counted-for-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*faith was reckoned to Abraham for righteousness* (Romans 4:9) — the reckoning of 15:6 came while Abram was yet uncircumcised: trust first, then sign, then walk.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-he-believed-and-it-was-counted-for-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And therefore it was imputed to him for righteousness* (Romans 4:22) — the imputing of 15:6, resting on the trust *fully persuaded that, what he had promised, he was able also to perform* (Romans 4:21).'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-he-believed-and-it-was-counted-for-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Even as Abraham believed Elohim (God), and it was accounted to him for righteousness* (Galatians 3:6) — *faithful Abraham* (Galatians 3:9), the believing that obeyed when called; the children of faith share his trust, not trust-against-Torah.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-he-believed-and-it-was-counted-for-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the scripture was fulfilled... Abraham believed Elohim... and he was called the Friend of Elohim (God)* (James 2:23) — Ya''aqob reads 15:6 WITH the works: faith made perfect by offering Isaac (James 2:21-22), the believing and the obeying one walk.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-he-believed-and-it-was-counted-for-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5) — the framework anchor that COMPLETES 15:6: the same Abraham whose trust was reckoned righteous is the covenant-keeper. Faith and faithfulness, one walk.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-he-believed-and-it-was-counted-for-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*And he believed in Yahuah (God), and it was counted to him for righteousness* (Jubilees 14:6) — the restored witness sets the reckoning of 15:6 inside the covenant itself, beside *I shall be Elohim to you and to your seed after you*.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-he-believed-and-it-was-counted-for-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*divided them in the midst, and laid them over against each other; but the birds divided he not... And birds came down upon the pieces, and Abram drove them away* (Jubilees 14:11) — the cutting of the covenant-beasts of 15:10-11 carried in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=9
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-the-covenant-cut-the-formed-passed-between-the-pieces'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*when they cut the calf in twain, and passed between the parts thereof* (Jeremiah 34:18) — the prophet names the self-maledictory cutting-rite of 15:17, the oath called down on the one who passes between.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=17
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=34 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-the-covenant-cut-the-formed-passed-between-the-pieces'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a furnace was smoking, and a flame of fire passed between the pieces* (Jubilees 14:16) — the smoking furnace and burning lamp of 15:17, Yahuah alone moving through the divided sacrifice.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=17
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-the-covenant-cut-the-formed-passed-between-the-pieces'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession* (Genesis 17:8) — the land-grant of 15:18 sealed as an everlasting possession; the pieces-covenant and circumcision-covenant one oath.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=18
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-the-covenant-cut-the-formed-passed-between-the-pieces'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*To your seed will I give this land, from the river of Egypt to the great river, the river Euphrates* (Jubilees 14:18) — the land-grant boundaries of 15:18 preserved entire in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=18
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-the-covenant-cut-the-formed-passed-between-the-pieces'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*madest a covenant with him to give the land... and hast performed thy words; for thou art righteous* (Nehemiah 9:8) — Yashar''el confesses the self-bound oath of 15:18 was kept; the One who passed between the pieces proved faithful.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=18
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-the-covenant-cut-the-formed-passed-between-the-pieces'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*his seed should sojourn in a strange land... entreat them evil four hundred years* (Acts 7:6) — Stephen quotes the prophecy of 15:13, the bondage foretold to the still-childless Abram.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-thy-seed-a-stranger-four-hundred-years'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the nation to whom they shall be in bondage will I judge... after that shall they come forth, and serve me in this place* (Acts 7:7) — the deliverance half of the oath of 15:14, read forward to the exodus.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=14
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-thy-seed-a-stranger-four-hundred-years'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the sojourning of the children of Yashar''el (Israel), who dwelt in Egypt, was four hundred and thirty years* (Exodus 12:40) — the *four hundred years* of 15:13 come due, dated to the generation.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-thy-seed-a-stranger-four-hundred-years'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the selfsame day... all the hosts of Yahuah (LORD) went out from the land of Egypt* (Exodus 12:41) — *afterward shall they come out with great substance* (15:14) kept to the day.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=14
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-thy-seed-a-stranger-four-hundred-years'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*your seed shall be a stranger in a land not theirs... and afflict them four hundred years* (Jubilees 14:13) — the prophecy of 15:13 carried verse-for-verse in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-thy-seed-a-stranger-four-hundred-years'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the nation... shall I judge, and after that they will come forth... with much substance* (Jubilees 14:14) — the deliverance of 15:14 carried entire in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=15 AND sv.verse_number=14
  JOIN _s301_ge15_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-15-thy-seed-a-stranger-four-hundred-years'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session301 — Genesis cross-references complete.'
