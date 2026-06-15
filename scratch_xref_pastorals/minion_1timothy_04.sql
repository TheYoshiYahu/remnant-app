-- ----- fragment: minion_1timothy_04.sql (S235 1 Timothy 4) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 4 (16 verses) — THE HIGHEST WATCHPOINT CHAPTER.
-- Tag: t235c4 (temp view _s235_t235c4_lookup).
-- Sort band: floor 8475 (25-wide: 8475, 8476, 8477, 8478 used; under 8500).
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Paul's charge to a shepherd; sound doctrine against the strivers; one olive
-- tree, the household of Elohim; NO replacement theology, NO law-vs-grace antithesis). Chapter 4
-- warns of the LATTER-TIME APOSTASY — *seducing spirits, and doctrines of devils* (4:1) — whose
-- mark is the GNOSTIC/ascetic ban that FORBIDS marriage and COMMANDS abstinence from foods, as if
-- matter were evil. Paul's answer is creation-good: *every creature of Elohim (God) is good, and
-- nothing to be refused, if it be received with thanksgiving* (4:4), for it is *sanctified by the
-- word of Elohim (God) and prayer* (4:5). ★★ THIS IS NOT THE ABOLITION OF CLEAN AND UNCLEAN. The
-- food *sanctified by the word of Elohim* is the food the WORD already names as food — the creatures
-- Leviticus 11 / Deuteronomy 14 give for meat — now received with thanksgiving rather than under the
-- ascetic's superstitious ban. *Leviticus 11 / Deuteronomy 14 STAND.* The rebuke is the heresy that
-- calls Elohim's good provision evil, not a repeal of the difference between clean and unclean.
-- Christology kept the Formed frame (no co-equal-persons grammar); v.10 the *living Elohim, who is
-- the Saviour of all men* is the one Elohim of Isaiah 45 *a just Elohim (God) and a Saviour; there
-- is none beside me.*
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the latter times, depart from the faith, seducing spirits and doctrines of devils
--           Tanakh: none warranted (the deceiving-spirits weight is carried by the Hebrew library;
--                   no single Tanakh verse is the load-bearing root of the seducing-spirits motif)
--           Extras: 1 Enoch 19:1 (spirits leading mankind astray into sacrificing to demons as gods),
--                   1 Enoch 99:2 (pervert the words of uprightness, transgress the eternal law,
--                   transform themselves into what they were not), 2 Esdras 5:1-2 (the way of truth
--                   hidden, the land barren of faith, iniquity increased)
--           NT: none warranted (carried in prose; the apostasy thread is extras-bearing)
--   v.3-5   forbidding to marry / abstain from meats; every creature good; sanctified by the word [BLESSING]
--           Tanakh: Genesis 1:31 (it was very good), Genesis 9:3 (every moving thing shall be meat),
--                   Psalm 24:1 (the earth is Yahuah's, and the fulness thereof); GUARD Leviticus 11:47
--                   / Deuteronomy 14:3 STAND (the difference between clean and unclean)
--           Extras: none warranted (the creation-good answer is canon-rooted; extras would dilute)
--           NT: 1 Corinthians 10:30-31 (give thanks; do all to the glory of Elohim)
--   v.6-10  good minister nourished in faith; godliness profitable; the living Elohim Saviour of all
--           Tanakh: Isaiah 45:21-22 (a just Elohim and a Saviour; there is none beside me; be ye
--                   saved, all the ends of the earth), Psalm 145:9 (Yahuah is good to all)
--           Extras: none warranted (Sirach 1:14 fear-of-Yahuah weighed; the godliness here is the
--                   Saviour-of-all motif, not the wisdom-incipit; held back to avoid forcing)
--           NT: none warranted (carried in prose)
--   v.11-12 command and teach; let no man despise thy youth; be an example
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.13-16 give attendance to reading; meditate; give thyself wholly; take heed to the doctrine
--           Tanakh: Joshua 1:8 (this book of the law... meditate therein day and night),
--                   Psalm 1:2-3 (his delight is in the law of Yahuah... meditate day and night)
--           Extras: none warranted   NT: none warranted (the Scriptures Timothy read = the Tanakh)
--
-- THREADS (slug -> target libraries):
--   8475 1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras  (Extras)
--   8476 1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1               (Tanakh + NT)  [BLESSING]
--   8477 1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45                                  (Tanakh)
--   8478 1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1                  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s235_t235c4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras
  ('canon', '1-timothy', 4, 1, 'enoch', '1-enoch', 19, 1, 'extras', E'*And Uriel said to me: ''Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* (1 Enoch 19:1). The restored library already named the engine of the latter-time error: spirits *assuming many different forms* that *lead them astray into sacrificing to demons as gods.* Paul writes that *in the latter times some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils* (1 Timothy 4:1). The *seducing spirits* and *doctrines of devils* are these very deceiving spirits of Enoch''s vision — not a new threat but the old work of the fallen, leading men to honour demons under a show of doctrine, until the day of the great judgement makes an end of them.'),
  ('canon', '1-timothy', 4, 1, 'enoch', '1-enoch', 99, 2, 'extras', E'*Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not [into sinners]: They shall be trodden under foot upon the earth.* (1 Enoch 99:2). The library marks the apostates of the last days as those who *pervert the words of uprightness* and *transgress the eternal law* — who *transform themselves into what they were not.* This is exactly the departure Paul foresees: *some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils; Speaking lies in hypocrisy; having their conscience seared with a hot iron* (1 Timothy 4:1-2). The conscience *seared* and the lies spoken *in hypocrisy* are the marks of those who pervert the words of uprightness and transgress the eternal law — the same latter-day falling-away, told twice across the one library.'),
  ('canon', '1-timothy', 4, 1, 'apocrypha', '2-esdras', 5, 1, 'extras', E'*Nevertheless as concerning the tokens, behold, the days shall come, that they which dwell upon earth shall be taken in a great number, and the way of truth shall be hidden, and the land shall be barren of faith.* (2 Esdras 5:1). The Hebrew library foretells the same sign of the end: *the way of truth shall be hidden, and the land shall be barren of faith.* Paul speaks of that very season — *in the latter times some shall depart from the faith* (1 Timothy 4:1). The land *barren of faith* is the field in which the *seducing spirits, and doctrines of devils* do their work; the hiding of the way of truth and the departing from the faith are one and the same latter-day apostasy.'),
  ('canon', '1-timothy', 4, 1, 'apocrypha', '2-esdras', 5, 2, 'extras', E'*But iniquity shall be increased above that which now you see, or that you have heard long ago.* (2 Esdras 5:2). The library tells of iniquity *increased above that which now you see* in the last days — the rising tide against which Paul warns Timothy that *in the latter times some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils* (1 Timothy 4:1). The multiplied iniquity and the departure from the faith belong to the same foretold hour; Paul charges the shepherd to hold the assembly in sound doctrine while the deceiving spirits press their lies.'),
  -- thread: 1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1  [BLESSING]
  ('canon', '1-timothy', 4, 4, 'canon', 'genesis', 1, 31, 'free', E'*And Elohim (God) saw every thing that he had made, and, behold, it was very good. And the evening and the morning were the sixth day.* (Genesis 1:31). At the close of creation *Elohim (God) saw every thing that he had made, and, behold, it was very good.* This is the ground of Paul''s answer to the ascetics: *For every creature of Elohim (God) is good, and nothing to be refused, if it be received with thanksgiving* (1 Timothy 4:4). The very-good creation cannot be the evil thing the doctrine of devils makes it; what the Maker pronounced good no man may call defiled. Mark the guard carefully — this rebukes the heresy that calls Elohim''s good provision evil; it does NOT abolish the difference between clean and unclean. The creation is good, and the food the word of Elohim names as food is received now with thanksgiving, not under the ascetic''s superstitious ban.'),
  ('canon', '1-timothy', 4, 3, 'canon', 'genesis', 9, 3, 'free', E'*Every moving thing that liveth shall be meat for you; even as the green herb have I given you all things.* (Genesis 9:3). To Noah, Elohim (God) gave the creatures for food: *every moving thing that liveth shall be meat for you.* Paul rebukes those *commanding to abstain from meats, which Elohim (God) hath created to be received with thanksgiving of them which believe and know the truth* (1 Timothy 4:3). The meats are Elohim''s own gift, *created to be received* — so the ascetic ban that forbids them despises the Giver. This is not a charter to eat what the word forbids; *them which believe and know the truth* are those who receive Elohim''s appointed provision with thanksgiving, the food the word already names for meat.'),
  ('canon', '1-timothy', 4, 4, 'canon', 'psalms', 24, 1, 'free', E'*The earth is the LORD''S, and the fulness thereof; the world, and they that dwell therein.* (Psalm 24:1). *The earth is the LORD''S, and the fulness thereof* — all that fills it is his, and his is good. So Paul declares *every creature of Elohim (God) is good, and nothing to be refused, if it be received with thanksgiving* (1 Timothy 4:4). Because the earth and its fulness belong to Yahuah (LORD), what he gives for food is received as from his hand with thanks; the slander of the ascetic, who calls Elohim''s fulness evil, is overturned by the simple confession that the earth is his.'),
  ('canon', '1-timothy', 4, 4, 'canon', '1-corinthians', 10, 30, 'free', E'*For if I by grace be a partaker, why am I evil spoken of for that for which I give thanks?* (1 Corinthians 10:30). Paul had already bound eating to thanksgiving: *if I by grace be a partaker,* the food is received *for that for which I give thanks.* The same principle answers the ascetics here — *every creature of Elohim (God) is good, and nothing to be refused, if it be received with thanksgiving* (1 Timothy 4:4). The thanksgiving is the key: the partaker who blesses Elohim (God) over the food the word gives him receives it as the good gift it is, not as the defilement the doctrine of devils pretends.'),
  ('canon', '1-timothy', 4, 5, 'canon', '1-corinthians', 10, 31, 'free', E'*Whether therefore ye eat, or drink, or whatsoever ye do, do all to the glory of Elohim (God).* (1 Corinthians 10:31). The whole of life, eating and drinking included, is to be done *to the glory of Elohim (God).* This is why food is *sanctified by the word of Elohim (God) and prayer* (1 Timothy 4:5): received to his glory, with the word that names it for food and the prayer of thanksgiving over it, the meal becomes a holy thing. To eat to his glory with thanks is the opposite of the superstitious abstinence Paul rebukes — and the opposite, too, of treating the word''s own distinctions as nothing.'),
  -- thread: 1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45
  ('canon', '1-timothy', 4, 10, 'canon', 'isaiah', 45, 21, 'free', E'*Tell ye, and bring them near; yea, let them take counsel together: who hath declared this from ancient time? who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me.* (Isaiah 45:21). Yahuah (LORD) names himself *a just Elohim (God) and a Saviour; there is none beside me.* Paul trusts in this same One: *we trust in the living Elohim (God), who is the Saviour of all men, specially of those that believe* (1 Timothy 4:10). The *Saviour of all men* is the *just Elohim and a Saviour* of Isaiah — the one living Elohim beside whom there is no other, whose salvation reaches out to all the ends of the earth and rests upon those who believe.'),
  ('canon', '1-timothy', 4, 10, 'canon', 'isaiah', 45, 22, 'free', E'*Look unto me, and be ye saved, all the ends of the earth: for I am Elohim (God), and there is none else.* (Isaiah 45:22). The call goes out to the whole world: *Look unto me, and be ye saved, all the ends of the earth.* This is the breadth Paul confesses — *the living Elohim (God), who is the Saviour of all men, specially of those that believe* (1 Timothy 4:10). The Saviour of all men is the One who bids all the ends of the earth look to him and be saved; the *specially of those that believe* is the *be ye saved* answered by those who turn and look. One Elohim, none else, the Saviour held out to all and laid hold of by faith.'),
  ('canon', '1-timothy', 4, 10, 'canon', 'psalms', 145, 9, 'free', E'*Yahuah (LORD) is good to all: and his tender mercies are over all his works.* (Psalm 145:9). *Yahuah (LORD) is good to all,* his mercies *over all his works.* So Paul names him *the living Elohim (God), who is the Saviour of all men, specially of those that believe* (1 Timothy 4:10). The goodness that reaches all his works is the saving goodness reaching all men; the living Elohim whose tender mercies cover creation is the Saviour in whom the labouring and reproached servant trusts.'),
  -- thread: 1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1
  ('canon', '1-timothy', 4, 13, 'canon', 'joshua', 1, 8, 'free', E'*This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* (Joshua 1:8). To Joshua, Yahuah (LORD) charged that *this book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night.* Paul lays the same charge on Timothy: *Till I come, give attendance to reading, to exhortation, to doctrine* (1 Timothy 4:13), and *Meditate upon these things; give thyself wholly to them* (1 Timothy 4:15). The reading Timothy attends to is the Scriptures he had — the book of the law and the prophets; the meditation Paul commands is the meditation Joshua was given, the unbroken attending to the word that makes the way prosperous.'),
  ('canon', '1-timothy', 4, 15, 'canon', 'psalms', 1, 2, 'free', E'*But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* (Psalm 1:2). The blessed man''s *delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* Paul charges Timothy, *Meditate upon these things; give thyself wholly to them; that thy profiting may appear to all* (1 Timothy 4:15). The meditation that profits is the meditation of the first psalm — delighting in the law of Yahuah (LORD) without ceasing — for the man who so meditates *shall be like a tree planted by the rivers of water... and whatsoever he doeth shall prosper* (Psalm 1:3), the very profiting Paul says will appear to all.'),
  ('canon', '1-timothy', 4, 16, 'canon', 'psalms', 1, 3, 'free', E'*And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* (Psalm 1:3). The man who meditates in the law is *like a tree planted by the rivers of water... and whatsoever he doeth shall prosper.* Paul promises the like fruit to the shepherd who attends to the word: *Take heed unto thyself, and unto the doctrine; continue in them: for in doing this thou shalt both save thyself, and them that hear thee* (1 Timothy 4:16). The continuing in the doctrine is the planting by the rivers; the saving of self and hearers is the fruit that does not wither — the prospering of the one whose delight is in the law of Yahuah (LORD).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras',
       E'Seducing spirits and doctrines of devils: the latter-time apostasy (1 Enoch, 2 Esdras)',
       E'Paul opens the chapter with a warning the whole library had already sounded: *Now the Spirit speaketh expressly, that in the latter times some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils; Speaking lies in hypocrisy; having their conscience seared with a hot iron* (1 Timothy 4:1-2). The *seducing spirits* are no new menace. The restored library names their work plainly: *their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods* (1 Enoch 19:1) — the fallen, leading men to honour demons under a show of doctrine, *till the day of the great judgement.* And the library marks the apostates of the last days as those who *pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not* (1 Enoch 99:2) — the perverted word and the seared conscience are one. The signs of the season match as well: *the days shall come... and the way of truth shall be hidden, and the land shall be barren of faith* (2 Esdras 5:1), for *iniquity shall be increased above that which now you see* (2 Esdras 5:2). The land barren of faith is the field where the doctrines of devils take root, and the departing from the faith is the hiding of the way of truth. Against this foretold hour Paul charges the shepherd to hold the assembly in sound doctrine — for the latter-time deceit is the old work of deceiving spirits, told across the one library and now pressing upon Timothy''s own day.',
       sv.verse_id, ev.verse_id, 'extras', 8475
  FROM _s235_t235c4_lookup sv, _s235_t235c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1',
       E'Every creature of Elohim is good, received with thanksgiving (Genesis 1)',
       E'Against the doctrine of devils that is *Forbidding to marry, and commanding to abstain from meats* (1 Timothy 4:3), Paul sets the creation itself. The meats are *which Elohim (God) hath created to be received with thanksgiving of them which believe and know the truth* (1 Timothy 4:3), *For every creature of Elohim (God) is good, and nothing to be refused, if it be received with thanksgiving: For it is sanctified by the word of Elohim (God) and prayer* (1 Timothy 4:4-5). The root is the verdict spoken at the close of the sixth day: *And Elohim (God) saw every thing that he had made, and, behold, it was very good* (Genesis 1:31). What the Maker pronounced *very good* no man may call defiled; the ascetic ban that names Elohim''s good provision evil is the slander Paul rebukes. The creatures were given for food to Noah — *Every moving thing that liveth shall be meat for you; even as the green herb have I given you all things* (Genesis 9:3) — and *The earth is the LORD''S, and the fulness thereof* (Psalm 24:1), so what he gives is received as from his hand. Paul had already bound eating to thanksgiving: *if I by grace be a partaker, why am I evil spoken of for that for which I give thanks?* (1 Corinthians 10:30), and *Whether therefore ye eat, or drink, or whatsoever ye do, do all to the glory of Elohim (God)* (1 Corinthians 10:31). Mark the guard with care. This is NOT the abolition of clean and unclean. The food *sanctified by the word of Elohim* is the food the WORD already names as food — the creatures Yahuah (LORD) gave for meat, the difference between clean and unclean still standing: *To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47), *Thou shalt not eat any abominable thing* (Deuteronomy 14:3). Leviticus 11 and Deuteronomy 14 stand. What Paul overturns is the heresy that calls creation evil and forbids what Elohim made good; *them which believe and know the truth* are those who receive Elohim''s appointed provision with thanksgiving, sanctified by the word that names it for food and by the prayer of blessing over it.',
       sv.verse_id, ev.verse_id, 'free', 8476
  FROM _s235_t235c4_lookup sv, _s235_t235c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45',
       E'The living Elohim, the Saviour of all men (Isaiah 45)',
       E'Paul gives the reason he and his fellows labour and endure reproach: *For therefore we both labour and suffer reproach, because we trust in the living Elohim (God), who is the Saviour of all men, specially of those that believe* (1 Timothy 4:10). The *Saviour of all men* is no new name for Elohim. Yahuah (LORD) declared it through Isaiah: *there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me* (Isaiah 45:21), and his salvation is held out to the whole world — *Look unto me, and be ye saved, all the ends of the earth: for I am Elohim (God), and there is none else* (Isaiah 45:22). The one living Elohim, beside whom there is no other, is the Saviour whose call reaches all the ends of the earth and whose salvation rests upon those who look and believe — Paul''s *specially of those that believe.* And the breadth of his goodness is the breadth the psalmist sang: *Yahuah (LORD) is good to all: and his tender mercies are over all his works* (Psalm 145:9). The goodness over all his works is the saving goodness offered to all men; the living Elohim whose mercies cover creation is the One in whom the labouring servant trusts.',
       sv.verse_id, ev.verse_id, 'free', 8477
  FROM _s235_t235c4_lookup sv, _s235_t235c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1',
       E'Give attendance to reading; meditate day and night (Joshua 1, Psalm 1)',
       E'Paul charges the young shepherd to live in the word: *Till I come, give attendance to reading, to exhortation, to doctrine* (1 Timothy 4:13); *Meditate upon these things; give thyself wholly to them; that thy profiting may appear to all* (1 Timothy 4:15); *Take heed unto thyself, and unto the doctrine; continue in them: for in doing this thou shalt both save thyself, and them that hear thee* (1 Timothy 4:16). The reading Timothy attends to is the Scriptures he had — the law and the prophets — and the charge to meditate is the charge given of old. To Joshua, Yahuah (LORD) said *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous* (Joshua 1:8). And the blessed man of the first psalm is the man whose *delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2), who *shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season... and whatsoever he doeth shall prosper* (Psalm 1:3). The meditation that profits Timothy and saves his hearers is the unbroken meditation in the word that made Joshua''s way prosperous and made the psalmist''s man fruitful — the same word, the same delight, the same fruit that does not wither.',
       sv.verse_id, ev.verse_id, 'free', 8478
  FROM _s235_t235c4_lookup sv, _s235_t235c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    -- seducing spirits / latter-time apostasy
    ('1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras', 'canon','1-timothy',4,1, 'enoch','1-enoch',19,1, 1, E'1 Enoch 19:1 — the deceiving spirits *assuming many different forms... lead them astray into sacrificing to demons as gods,* the very *seducing spirits, and doctrines of devils* of 1 Timothy 4:1.'),
    ('1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras', 'canon','1-timothy',4,1, 'enoch','1-enoch',99,2, 2, E'1 Enoch 99:2 — the apostates *pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not,* matching the *lies in hypocrisy* and *conscience seared* of 1 Timothy 4:1-2.'),
    ('1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras', 'canon','1-timothy',4,1, 'apocrypha','2-esdras',5,1, 3, E'2 Esdras 5:1 — *the way of truth shall be hidden, and the land shall be barren of faith,* the same departing from the faith Paul names at 1 Timothy 4:1.'),
    ('1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras', 'canon','1-timothy',4,1, 'apocrypha','2-esdras',5,2, 4, E'2 Esdras 5:2 — *iniquity shall be increased above that which now you see,* the rising tide of the latter-time apostasy of 1 Timothy 4:1.'),
    -- every creature good [BLESSING]
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,4, 'canon','genesis',1,31, 1, E'Genesis 1:31 — *behold, it was very good,* the creation-verdict that grounds *every creature of Elohim (God) is good* (1 Timothy 4:4). The very-good creation cannot be the evil thing the ascetics make it.'),
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,3, 'canon','genesis',9,3, 2, E'Genesis 9:3 — *every moving thing that liveth shall be meat for you,* Elohim''s own gift of the creatures for food, against those *commanding to abstain from meats* (1 Timothy 4:3).'),
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,4, 'canon','psalms',24,1, 3, E'Psalm 24:1 — *the earth is the LORD''S, and the fulness thereof,* so his good gift is received from his hand, never refused as defiled (1 Timothy 4:4).'),
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,4, 'canon','1-corinthians',10,30, 4, E'1 Corinthians 10:30 — *for that for which I give thanks,* the thanksgiving that receives the food as Elohim''s good gift (1 Timothy 4:4).'),
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,5, 'canon','1-corinthians',10,31, 5, E'1 Corinthians 10:31 — *do all to the glory of Elohim (God),* why the food is *sanctified by the word of Elohim (God) and prayer* (1 Timothy 4:5).'),
    -- saviour of all men
    ('1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45', 'canon','1-timothy',4,10, 'canon','isaiah',45,21, 1, E'Isaiah 45:21 — *a just Elohim (God) and a Saviour; there is none beside me,* the one living Elohim who is *the Saviour of all men* (1 Timothy 4:10).'),
    ('1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45', 'canon','1-timothy',4,10, 'canon','isaiah',45,22, 2, E'Isaiah 45:22 — *be ye saved, all the ends of the earth,* the breadth of the Saviour of all men, answered by those who believe (1 Timothy 4:10).'),
    ('1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45', 'canon','1-timothy',4,10, 'canon','psalms',145,9, 3, E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works,* the saving goodness reaching all men (1 Timothy 4:10).'),
    -- meditate / reading
    ('1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1', 'canon','1-timothy',4,13, 'canon','joshua',1,8, 1, E'Joshua 1:8 — *thou shalt meditate therein day and night,* the charge to live in the book of the law that lies behind *give attendance to reading* (1 Timothy 4:13).'),
    ('1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1', 'canon','1-timothy',4,15, 'canon','psalms',1,2, 2, E'Psalm 1:2 — *in his law doth he meditate day and night,* the delight-meditation behind *Meditate upon these things; give thyself wholly to them* (1 Timothy 4:15).'),
    ('1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1', 'canon','1-timothy',4,16, 'canon','psalms',1,3, 3, E'Psalm 1:3 — *whatsoever he doeth shall prosper,* the fruit of the man planted by the word, matching *thou shalt both save thyself, and them that hear thee* (1 Timothy 4:16).')
  ) AS m(thread_slug, src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN cross_reference_threads t ON t.slug = m.thread_slug
  JOIN _s235_t235c4_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s235_t235c4_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
