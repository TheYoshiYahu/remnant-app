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
