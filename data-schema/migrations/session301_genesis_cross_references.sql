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


COMMIT;
\echo 'session301 — Genesis cross-references complete.'
