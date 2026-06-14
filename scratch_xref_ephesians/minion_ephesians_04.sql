-- ----- fragment: minion_ephesians_04.sql (S230 Ephesians 4) -----
-- =====================================================================
-- S230 minion — EPHESIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 4 (32 verses) — the one body / one Spirit / one Yahuah / one faith / one
--   baptism / One Elohim and Father of all (the Shema); he ascended up on high, led captivity
--   captive, gave gifts unto men (Psalm 68:18); put off the old man, put on the new man created
--   in righteousness; be ye angry and sin not; grieve not the holy Spirit.
-- Tag: ep04 (temp view _s230_ep04_lookup).
-- Sort band: floor 7475, step 3 (7475, 7478, 7481, 7484 used; under 7500).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Ephesians = the re-gathering of the one olive tree, Israel + the grafted-in seed
-- of the nations into ONE covenant people; same Yahuah, same Torah, same Yashar'el restored). Chapter
-- 4 is the unity charge built on the Shema: *One Elohim (God) and Father of all* (4:6) — the Father is
-- the One; Yahusha (Jesus) is the Formed Son who *ascended up far above all heavens* (4:10), bearing
-- the Psalm-68 ascent of Yahuah himself. No co-equal-persons grammar, no modalist collapse. The new
-- man *which after Elohim (God) is created in righteousness and true holiness* (4:24) is the renewed
-- obedience of the gathered, the image-of-Elohim restored — NOT a Torah abolished. The walk of unity
-- (lowliness, longsuffering, truth in love, putting away wrath, forgiving one another) is the
-- covenant ethic of the called-out ones, not a new morality replacing the old.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   walk worthy / keep the unity of the Spirit in the bond of peace
--           Tanakh: none warranted (the unity is carried by the Shema thread at v.4-6)
--           Extras: none warranted   NT: none warranted (Col 3:12-14 the same ethic, carried in prose)
--   v.4-6   one body, one Spirit, One Yahuah, one faith, one baptism, One Elohim and Father of all
--           Tanakh: Deuteronomy 6:4 (the Shema, Yahuah our Elohim is one Yahuah), Zechariah 14:9
--                   (one Yahuah, and his name one), Malachi 2:10 (have we not all one father?)
--           Extras: none warranted   NT: Mark 12:29 (the first commandment is the Shema)
--   v.7-10  he ascended up on high, led captivity captive, gave gifts unto men [EXPLICIT CITATION]
--           Tanakh: Psalm 68:18 (thou hast ascended on high, thou hast led captivity captive, thou
--                   hast received gifts for men)
--           Extras: none warranted   NT: none warranted (the citation is the Tanakh root)
--   v.11-16 he gave apostles, prophets... the body fitly joined, growing up into the head
--           Tanakh: none warranted (the body-as-one is carried by the Shema/one-body thread)
--           Extras: none warranted   NT: none warranted (1 Cor 12 the body already cross-linked
--                   from that book to Ephesians 4; not re-built here)
--   v.17-19 walk not as other Gentiles, the understanding darkened, alienated from the life of Elohim
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.20-24 put off the old man... put on the new man, created in righteousness and true holiness
--           Tanakh: Genesis 1:27 (Elohim created man in his own image)
--           Extras: none warranted   NT: Colossians 3:9-10 (put off the old man... put on the new
--                   man, renewed after the image of him that created him)
--   v.25-32 putting away lying / be ye angry and sin not / grieve not the Spirit / forgiving one another
--           Tanakh: Psalm 4:4 (Stand in awe, and sin not), Isaiah 63:10 (they vexed his holy Spirit)
--           Extras: Sirach (Ecclesiasticus) 28:2,6-7 (forgive your neighbour... abide in the
--                   commandments) and 28:8-12 (a furious man kindles strife; the spark of the mouth)
--           NT: none warranted (Col 3:8,13 the same put-away-wrath / forgive, carried in prose)
--
-- THREADS (slug -> target libraries):
--   7475 ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6   (Tanakh + NT)
--   7478 ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68  (Tanakh)
--   7481 ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1 (Tanakh + NT)
--   7484 ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4   (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s230_ep04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6
  ('canon', 'ephesians', 4, 6, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). This is the Shema, the bedrock confession of Yashar''el (Israel) — Yahuah is one. Paul builds the unity of the gathered upon it: *One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:6). The oneness of the body, the Spirit, the faith, and the baptism (Ephesians 4:4-5) flows from the oneness of the One — *One Yahuah (Lord)... One Elohim (God) and Father of all.* The Father is the One of the Shema; the Formed Son who *ascended up far above all heavens* (Ephesians 4:10) bears his name, not a second God beside him.'),
  ('canon', 'ephesians', 4, 5, 'canon', 'zechariah', 14, 9, 'free', E'*And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one.* (Zechariah 14:9). The prophet looks to the day when *there shall be one Yahuah (LORD), and his name one* — the whole earth gathered to the worship of the One. Paul declares that day''s confession already binding upon the called-out: *One Yahuah (Lord), one faith, one baptism* (Ephesians 4:5). The *one Yahuah (Lord)* of the assembly is the *one Yahuah (LORD)* whose name shall be one over all the earth; the unity of the gathered is the firstfruits of the kingdom Zechariah saw.'),
  ('canon', 'ephesians', 4, 6, 'canon', 'malachi', 2, 10, 'free', E'*Have we not all one father? hath not one Elohim (God) created us? why do we deal treacherously every man against his brother, by profaning the covenant of our fathers?* (Malachi 2:10). Malachi grounds the duty of brotherhood in the oneness of the Maker: *one father... one Elohim (God) created us.* Paul makes the same move toward unity: *One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:6). Because there is *one father,* the brethren must not deal treacherously but *keep the unity of the Spirit in the bond of peace* (Ephesians 4:3); the one Father is the ground of the one body.'),
  ('canon', 'ephesians', 4, 5, 'canon', 'mark', 12, 29, 'free', E'*And Yahusha (Jesus) answered him, The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord):* (Mark 12:29). When asked the first commandment, Yahusha (Jesus) named the Shema: *Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord).* Paul speaks from the same first commandment when he sets *One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all* (Ephesians 4:5-6) as the ground of the body''s unity. The Master''s first word and the apostle''s charge are one confession — the oneness of Yahuah, the foundation of the one people.'),
  -- thread: ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68
  ('canon', 'ephesians', 4, 8, 'canon', 'psalms', 68, 18, 'free', E'*Thou hast ascended on high, thou hast led captivity captive: thou hast received gifts for men; yea, for the rebellious also, that Yahuah Elohim (the LORD God) might dwell among them.* (Psalm 68:18). This is the very verse Paul cites: *Wherefore he saith, When he ascended up on high, he led captivity captive, and gave gifts unto men* (Ephesians 4:8). The Psalm sings the triumphal ascent of Yahuah (LORD) up the holy hill, leading captivity captive and receiving gifts — *that Yahuah Elohim (the LORD God) might dwell among them.* Paul reads the ascent as the Formed Son''s: *He that descended is the same also that ascended up far above all heavens, that he might fill all things* (Ephesians 4:10). The One who ascends in the Psalm to dwell among his people is the One who ascends in Ephesians to *fill all things,* and the gifts received are now given — *he gave some, apostles; and some, prophets* (Ephesians 4:11) — for the building of the one body.'),
  -- thread: ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1
  ('canon', 'ephesians', 4, 24, 'canon', 'genesis', 1, 27, 'free', E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). At the beginning *Elohim (God) created man in his own image.* The new man Paul calls the gathered to put on is that image restored: *that ye put on the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:24). The *new man* is no novelty but the original — man as Elohim (God) first made him, the image renewed in *righteousness and true holiness.* This is the renewed obedience of the covenant people, the creation-image brought back, not a law abolished.'),
  ('canon', 'ephesians', 4, 22, 'canon', 'colossians', 3, 9, 'free', E'*Lie not one to another, seeing that ye have put off the old man with his deeds;* (Colossians 3:9). The twin letter speaks the same charge: *put off the old man with his deeds; And have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:9-10). Paul tells the Ephesians the same — *put off concerning the former conversation the old man, which is corrupt according to the deceitful lusts* (Ephesians 4:22) and *put on the new man* (Ephesians 4:24). Both letters root the new man in *the image of him that created him* — the Genesis image restored; the old man put off, the renewed obedience put on.'),
  ('canon', 'ephesians', 4, 24, 'canon', 'colossians', 3, 10, 'free', E'*And have put on the new man, which is renewed in knowledge after the image of him that created him:* (Colossians 3:10). Colossians names the new man *renewed... after the image of him that created him* — pointing straight back to the creation image of Genesis. Ephesians says the same: *the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:24). The two letters are one teaching: the new man is the created image of Elohim (God) renewed in the called-out ones, the righteousness and holiness for which man was first made.'),
  -- thread: ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4
  ('canon', 'ephesians', 4, 26, 'canon', 'psalms', 4, 4, 'free', E'*Stand in awe, and sin not: commune with your own heart upon your bed, and be still. Selah.* (Psalm 4:4). Paul takes up the Psalm''s very words: *Be ye angry, and sin not: let not the sun go down upon your wrath* (Ephesians 4:26). The Psalmist''s charge — *stand in awe, and sin not... commune with your own heart upon your bed, and be still* — is the discipline of anger that does not pass into sin, the heart quieted before the day is done. The apostle binds it to the unity of the body: wrath unchecked *give[s] place to the devil* (Ephesians 4:27); the Psalm''s stillness is the covenant ethic of the gathered.'),
  ('canon', 'ephesians', 4, 30, 'canon', 'isaiah', 63, 10, 'free', E'*But they rebelled, and vexed his holy Spirit: therefore he was turned to be their enemy, and he fought against them.* (Isaiah 63:10). Isaiah remembers how Yashar''el (Israel) *rebelled, and vexed his holy Spirit.* Paul warns the gathered not to do the same: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30). The Spirit that was *put... within* the people of old (Isaiah 63:11) is the same Spirit of the sealing; to grieve him is to repeat the rebellion of the wilderness. The bitterness, wrath, and evil speaking of Ephesians 4:31 are the very grieving Isaiah names.'),
  ('canon', 'ephesians', 4, 32, 'apocrypha', 'ecclesiasticus', 28, 2, 'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Ecclesiasticus 28:2). The Hebrew library teaches the forgiveness Paul commands: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven.* Ephesians says the same — *be ye kind one to another, tenderhearted, forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you* (Ephesians 4:32). The forgiven forgive; the measure of mercy received is the measure shown to the neighbour, as Sirach (Ecclesiasticus) had long taught the gathered.'),
  ('canon', 'ephesians', 4, 31, 'apocrypha', 'ecclesiasticus', 28, 8, 'extras', E'*Abstain from strife, and you shall diminish your sins: for a furious man will kindle strife,* (Ecclesiasticus 28:8). Sirach (Ecclesiasticus) warns against the furious man who *will kindle strife,* and against the tongue: *If you blow the spark, it shall burn: if you spit upon it, it shall be quenched: and both these come out of your mouth* (Ecclesiasticus 28:12). Paul gathers the same wrath and the same mouth into his charge: *Let all bitterness, and wrath, and anger, and clamour, and evil speaking, be put away from you, with all malice* (Ephesians 4:31), and *Let no corrupt communication proceed out of your mouth* (Ephesians 4:29). The kindled strife and the burning spark of the tongue are what the new man puts away.'),
  ('canon', 'ephesians', 4, 26, 'apocrypha', 'ecclesiasticus', 28, 6, 'extras', E'*Remember your end, and let enmity cease; remember corruption and death, and abide in the commandments.* (Ecclesiasticus 28:6). The library counsels: *let enmity cease... and abide in the commandments,* and *Remember the commandments, and bear no malice to your neighbour* (Ecclesiasticus 28:7). Paul''s *Be ye angry, and sin not: let not the sun go down upon your wrath* (Ephesians 4:26) is the same wisdom — let the enmity cease before the day ends, abiding in the commandments. The covenant ethic of the gathered is no innovation; it is the Instruction the Hebrew library had long pressed upon the heart.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6',
       E'One body, one Spirit, One Yahuah, One Elohim and Father of all — the Shema (Deuteronomy 6, Zechariah 14, Malachi 2)',
       E'Paul grounds the unity of the gathered in the oneness of the One: *There is one body, and one Spirit, even as ye are called in one hope of your calling; One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:4-6). This is the Shema, the bedrock confession of Yashar''el (Israel): *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4). The prophet sang of the day it would fill the earth: *Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9) — and the unity of the called-out is the firstfruits of that kingdom. Malachi draws the duty of brotherhood from the same root: *Have we not all one father? hath not one Elohim (God) created us? why do we deal treacherously every man against his brother, by profaning the covenant of our fathers?* (Malachi 2:10) — because there is one Father, the brethren must *keep the unity of the Spirit in the bond of peace* (Ephesians 4:3). Yahusha (Jesus) himself named the Shema the first of all the commandments: *Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord)* (Mark 12:29). The Master''s first word and the apostle''s charge are one confession. Mark the Christology: the Father is the One — *One Elohim (God) and Father of all* — and the Formed Son who *ascended up far above all heavens, that he might fill all things* (Ephesians 4:10) bears his name and his work; not a second God beside him, not a co-equal-persons grammar, but the Formed drawn from the Formless. The oneness of Yahuah is the ground of the one body; the gathered are one because their Elohim (God) is one.',
       sv.verse_id, ev.verse_id, 'free', 7475
  FROM _s230_ep04_lookup sv, _s230_ep04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68',
       E'When he ascended up on high, he led captivity captive, and gave gifts unto men (Psalm 68)',
       E'Paul cites a Psalm by name to declare the ascent of the Formed Son: *Wherefore he saith, When he ascended up on high, he led captivity captive, and gave gifts unto men* (Ephesians 4:8). The verse is Psalm 68: *Thou hast ascended on high, thou hast led captivity captive: thou hast received gifts for men; yea, for the rebellious also, that Yahuah Elohim (the LORD God) might dwell among them* (Psalm 68:18). The Psalm sings the triumphal ascent of Yahuah (LORD) up the holy hill — leading captivity captive, receiving gifts, *that Yahuah Elohim (the LORD God) might dwell among them.* Paul reads that ascent as the Son''s own, framed by descent and ascent: *Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens, that he might fill all things* (Ephesians 4:9-10). The One who ascends in the Psalm to dwell among his people is the One who ascends in Ephesians to fill all things; and the gifts received above are now poured out below — *And he gave some, apostles; and some, prophets; and some, evangelists; and some, pastors and teachers; For the perfecting of the saints... for the edifying of the body of Messiah (Christ)* (Ephesians 4:11-12). The ascended Formed Son, bearing the very ascent Psalm 68 sang of Yahuah, gives the gifts that build the one body.',
       sv.verse_id, ev.verse_id, 'free', 7478
  FROM _s230_ep04_lookup sv, _s230_ep04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1',
       E'Put off the old man, put on the new man created in righteousness — the image restored (Genesis 1, Colossians 3)',
       E'Paul calls the gathered to a change of nature: *That ye put off concerning the former conversation the old man, which is corrupt according to the deceitful lusts; And be renewed in the spirit of your mind; And that ye put on the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:22-24). The new man is no novelty — it is the original image restored. At the beginning *Elohim (God) created man in his own image, in the image of Elohim (God) created he him* (Genesis 1:27); the new man *after Elohim (God) is created in righteousness and true holiness* is that creation-image renewed. The twin letter says the same in the same words, and names the source plainly: *Lie not one to another, seeing that ye have put off the old man with his deeds; And have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:9-10). Both letters root the new man in *the image of him that created him* — the Genesis image. This is the renewed obedience of the covenant people, the righteousness and holiness for which man was first made, brought back in the called-out ones — not a law abolished, but the image of Elohim (God) restored.',
       sv.verse_id, ev.verse_id, 'free', 7481
  FROM _s230_ep04_lookup sv, _s230_ep04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4',
       E'Be ye angry, and sin not; grieve not the holy Spirit; forgive one another (Psalm 4, Isaiah 63, Sirach 28)',
       E'The walk of the new man is the covenant ethic of the gathered, drawn straight from the Hebrew library. Paul charges, *Be ye angry, and sin not: let not the sun go down upon your wrath: Neither give place to the devil* (Ephesians 4:26-27) — the very words of the Psalm: *Stand in awe, and sin not: commune with your own heart upon your bed, and be still. Selah* (Psalm 4:4), the anger that does not pass into sin, the heart quieted before the day is done. He warns, *grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30), echoing Isaiah''s memory of the wilderness rebellion: *But they rebelled, and vexed his holy Spirit: therefore he was turned to be their enemy* (Isaiah 63:10) — the Spirit *put... within* the people then is the Spirit of the sealing now. And the put-away of *all bitterness, and wrath, and anger, and clamour, and evil speaking* (Ephesians 4:31) and the *forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you* (Ephesians 4:32) are the wisdom Sirach (Ecclesiasticus) had long pressed: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* (Ecclesiasticus 28:2); *Remember your end, and let enmity cease... and abide in the commandments* (Ecclesiasticus 28:6); and of the kindled strife and the burning tongue, *for a furious man will kindle strife* (Ecclesiasticus 28:8), *If you blow the spark, it shall burn... and both these come out of your mouth* (Ecclesiasticus 28:12). The forgiven forgive; the enmity ceases before the sun goes down; the new man abides in the commandments. None of this is innovation — it is the Instruction the whole library had long written upon the heart.',
       sv.verse_id, ev.verse_id, 'extras', 7484
  FROM _s230_ep04_lookup sv, _s230_ep04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=4 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* the Shema, ground of the body''s unity; *One Elohim (God) and Father of all* (Ephesians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 14:9 — *one Yahuah (LORD), and his name one* the day the One fills the earth; *One Yahuah (Lord), one faith, one baptism* (Ephesians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 2:10 — *Have we not all one father? hath not one Elohim (God) created us?* the one Father the ground of brotherhood; *keep the unity of the Spirit in the bond of peace* (Ephesians 4:3,6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 12:29 — *Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord)* Yahusha (Jesus) naming the Shema the first commandment; the same confession behind *One Yahuah (Lord)... One Elohim (God)* (Ephesians 4:5-6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 68:18 — *Thou hast ascended on high, thou hast led captivity captive: thou hast received gifts for men* the verse Paul cites; *When he ascended up on high, he led captivity captive, and gave gifts unto men* (Ephesians 4:8).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:27 — *Elohim (God) created man in his own image* the original the new man restores; *the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:24).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 3:9 — *put off the old man with his deeds* the twin letter''s same charge; *put off... the old man, which is corrupt according to the deceitful lusts* (Ephesians 4:22).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 3:10 — *the new man, which is renewed in knowledge after the image of him that created him* the Genesis image named; *created in righteousness and true holiness* (Ephesians 4:24).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 4:4 — *Stand in awe, and sin not: commune with your own heart upon your bed, and be still* the anger that does not pass into sin; *Be ye angry, and sin not: let not the sun go down upon your wrath* (Ephesians 4:26).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 63:10 — *they rebelled, and vexed his holy Spirit* the wilderness rebellion; *grieve not the holy Spirit of Elohim (God), whereby ye are sealed* (Ephesians 4:30).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 28:2 — *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven* the forgiven forgive; *forgiving one another, even as Elohim (God)... hath forgiven you* (Ephesians 4:32).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 28:8 — *for a furious man will kindle strife* and *both these come out of your mouth* (28:12); *Let all bitterness, and wrath... and evil speaking, be put away* (Ephesians 4:31).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=31
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 28:6 — *let enmity cease... and abide in the commandments* and *bear no malice to your neighbour* (28:7); *let not the sun go down upon your wrath* (Ephesians 4:26).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
