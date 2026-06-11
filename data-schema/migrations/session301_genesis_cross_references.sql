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


COMMIT;
\echo 'session301 — Genesis cross-references complete.'
