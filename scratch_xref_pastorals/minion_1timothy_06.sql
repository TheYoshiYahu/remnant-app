-- ----- fragment: minion_1timothy_06.sql (S235 1 Timothy 6) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 6 (21 verses) — servants and masters, godliness with contentment,
--   the love of money, the good fight, the King of kings, the charge to the rich.
-- Tag: t235c6 (temp view _s235_t235c6_lookup).
-- Sort band: floor 8525, 25-wide (8525, 8526, 8527, 8528 used; under 8550).
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Paul's charge to a shepherd; sound doctrine, the one olive tree, no law-vs-grace
--   antithesis, no replacement theology). Chapter 6 closes the letter: contentment over covetousness,
--   the love of money as the root of all evil, the good fight, and the doxology to the blessed and only
--   Potentate — the King of kings and Lord of lords, who only hath immortality, dwelling in the light
--   which no man can approach unto, whom no man hath seen nor can see. This last is the INVISIBLE,
--   IMMORTAL FATHER, the one Elohim of the Shema: keep the Father the one invisible Elohim and source;
--   no co-equal-persons grammar. The charge to the rich re-speaks the Torah's own warning (Deut 8:17-18)
--   and the gospel treasure-in-heaven (Matt 6:19-21).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   servants under the yoke count masters worthy of honour
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (the household-code root is carried in Ephesians/Colossians; no load-bearing single root here)
--   v.3-5   if any teach otherwise... supposing that gain is godliness
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (the "teach otherwise" rebuke is intra-letter; covered by ch1's sound-doctrine apparatus)
--   v.6-8   godliness with contentment is great gain; we brought nothing into this world
--           Tanakh: Job 1:21 (naked came I out of my mother's womb), Ecclesiastes 5:15 (naked shall he return)
--           Extras: none warranted   NT: Hebrews 13:5 (be content; I will never leave thee)
--   v.9-10  they that will be rich fall into a snare; the love of money the root of all evil [STAR]
--           Tanakh: Proverbs 23:4-5 (labour not to be rich; riches make wings), Ecclesiastes 5:10
--                   (he that loveth silver shall not be satisfied)
--           Extras: Sirach/Ecclesiasticus 31:5 (he that loves gold shall not be justified)
--           NT: none warranted (the root-of-evil saying is itself the NT locus)
--   v.11-14 flee these things; fight the good fight; keep this commandment
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (exhortation language; no single load-bearing root)
--   v.15-16 the King of kings, and Lord of lords; Who only hath immortality, dwelling in the light
--           Tanakh: Deuteronomy 10:17 (Lord of lords... a great Elohim), Daniel 2:47 (a Lord of kings),
--                   Psalm 104:2 (who coverest thyself with light), Exodus 33:20 (no man see me, and live),
--                   Psalm 136:3 (the Lord of lords)
--           Extras: none warranted   NT: none warranted (the invisible Father is the Tanakh root)
--   v.17-19 charge the rich; trust in the living Elohim; lay up a good foundation
--           Tanakh: Psalm 62:10 (if riches increase, set not your heart upon them),
--                   Deuteronomy 8:17-18 (it is he that giveth thee power to get wealth)
--           Extras: Tobit 4:7-9 (give alms; thou layest up a good treasure against the day of necessity)
--           NT: Matthew 6:19-21 (lay up treasures in heaven; where your treasure is)
--   v.20-21 keep that which is committed; avoid profane babblings
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (intra-letter charge)
--
-- THREADS (slug -> target libraries):
--   8525 1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5  (Tanakh + NT)
--   8526 1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31      (Tanakh + Extras)
--   8527 1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104  (Tanakh)
--   8528 1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4   (Tanakh + Extras + NT)
-- =====================================================================

CREATE TEMP VIEW _s235_t235c6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5
  ('canon', '1-timothy', 6, 7, 'canon', 'job', 1, 21, 'free', E'*And said, Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* (Job 1:21). Stripped of all his substance in a single day, Job confesses the bare truth of every life: *Naked came I out of my mother''s womb, and naked shall I return thither.* Paul says the same to Timothy: *For we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). The man who feared Elohim (God) and lost everything still blessed the name of Yahuah (LORD); his contentment in the dust is the very *godliness with contentment* (1 Timothy 6:6) Paul calls *great gain.* What we cannot carry out we must not set our hearts upon.'),
  ('canon', '1-timothy', 6, 7, 'canon', 'ecclesiastes', 5, 15, 'free', E'*As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand.* (Ecclesiastes 5:15). The Preacher draws the same lesson Paul draws: the man who heaps up riches *shall take nothing of his labour, which he may carry away in his hand.* Paul writes *we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). Because the grave receives us as naked as the womb sent us forth, *having food and raiment let us be therewith content* (1 Timothy 6:8) — the wisdom of Qoheleth become the apostle''s charge.'),
  ('canon', '1-timothy', 6, 8, 'canon', 'hebrews', 13, 5, 'free', E'*Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee.* (Hebrews 13:5). The same apostolic doctrine sounds in Hebrews: *be content with such things as ye have,* and the ground of that contentment is the abiding presence of Yahuah (LORD) himself — *I will never leave thee, nor forsake thee.* Paul tells Timothy *having food and raiment let us be therewith content* (1 Timothy 6:8). The one who has the living Elohim (God) needs no hedge of riches; contentment rests not on what is in the hand but on the One who never departs.'),
  -- thread: 1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31
  ('canon', '1-timothy', 6, 9, 'canon', 'proverbs', 23, 4, 'free', E'*Labour not to be rich: cease from thine own wisdom. Wilt thou set thine eyes upon that which is not? for riches certainly make themselves wings; they fly away as an eagle toward heaven.* (Proverbs 23:4-5). Wisdom warns against the very craving Paul names: *Labour not to be rich,* for riches *fly away as an eagle toward heaven.* Paul says *they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition* (1 Timothy 6:9). The eyes set upon what takes wings are the eyes that fall into the snare; the apostle and the proverb sound one warning against the will to be rich.'),
  ('canon', '1-timothy', 6, 10, 'canon', 'ecclesiastes', 5, 10, 'free', E'*He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* (Ecclesiastes 5:10). The Preacher exposes the bottomless thirst of greed: *He that loveth silver shall not be satisfied with silver.* This is the root Paul names: *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10). The love that cannot be satisfied draws a man off the path; the never-filled craving of Qoheleth becomes, in Paul, the wandering from the faith and the self-inflicted sorrows of the covetous.'),
  ('canon', '1-timothy', 6, 10, 'apocrypha', 'ecclesiasticus', 31, 5, 'extras', E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* (Ecclesiasticus 31:5). The Hebrew library says it plainly: *He that loves gold shall not be justified.* For *Gold has been the ruin of many, and their destruction was present* (Ecclesiasticus 31:6), and the love of it *is a stumblingblock to them that sacrifice to it* (Ecclesiasticus 31:7). Paul gathers the same wisdom into one phrase: *the love of money is the root of all evil... they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10). The covetous man is not justified but ruined; the apostle does not invent the warning but re-speaks what the wisdom of the fathers already knew.'),
  -- thread: 1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104
  ('canon', '1-timothy', 6, 15, 'canon', 'deuteronomy', 10, 17, 'free', E'*For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward:* (Deuteronomy 10:17). Moses names Yahuah (LORD) *Elohim (God) of gods, and Lord of lords.* Paul gives the same titles to *the blessed and only Potentate, the King of kings, and Lord of lords* (1 Timothy 6:15). The *Lord of lords* of the Torah is the one Elohim (God) Paul magnifies — the invisible Father, the only Potentate, before whom every crowned head is a subject; the doxology of the apostle is the confession of Moses.'),
  ('canon', '1-timothy', 6, 15, 'canon', 'daniel', 2, 47, 'free', E'*The king answered unto Daniel, and said, Of a truth it is, that your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings, and a revealer of secrets, seeing thou couldest reveal this secret.* (Daniel 2:47). Nebuchadnezzar, greatest of earthly monarchs, falls before the One who is *a Yahuah (Lord) of kings.* This is the title Paul renders *the King of kings, and Lord of lords* (1 Timothy 6:15) — the *blessed and only Potentate* who outranks every potentate. The pagan king confessed what the apostle declares: there is one above all kings, the Elohim (God) of gods, the only wise Elohim (God) of 1 Timothy 1:17.'),
  ('canon', '1-timothy', 6, 15, 'canon', 'psalms', 136, 3, 'free', E'*O give thanks to the Lord of lords: for his mercy endureth for ever.* (Psalm 136:3). The Psalm calls Yahuah (LORD) *the Lord of lords,* the Maker of heaven and earth whose mercy endureth for ever. Paul takes up the same name for *the blessed and only Potentate, the King of kings, and Lord of lords* (1 Timothy 6:15). The One whom the Psalmist thanks as Lord of lords is the One to whom Paul ascribes *honour and power everlasting* (1 Timothy 6:16) — the same enthroned Elohim (God), praised in the sanctuary and confessed in the apostle''s doxology.'),
  ('canon', '1-timothy', 6, 16, 'canon', 'psalms', 104, 2, 'free', E'*Who coverest thyself with light as with a garment: who stretchest out the heavens like a curtain:* (Psalm 104:2). The Psalmist beholds Yahuah (LORD) *clothed with honour and majesty,* who *coverest thyself with light as with a garment.* Paul says of him that he is the One *Who only hath immortality, dwelling in the light which no man can approach unto* (1 Timothy 6:16). The light that is the garment of Yahuah (LORD) in the Psalm is the unapproachable light in which the invisible Father dwells; the apostle does not name a new Elohim (God) but the One the Psalmist already clothed in light.'),
  ('canon', '1-timothy', 6, 16, 'canon', 'exodus', 33, 20, 'free', E'*And he said, Thou canst not see my face: for there shall no man see me, and live.* (Exodus 33:20). When Moses begged to see the glory, Yahuah (LORD) answered *there shall no man see me, and live.* Paul speaks of the same hidden majesty: the One *whom no man hath seen, nor can see: to whom be honour and power everlasting* (1 Timothy 6:16). The Father no man can see and live is the invisible Elohim (God) of 1 Timothy 1:17, the King eternal, immortal, invisible; the unseeable Yahuah (LORD) of the mount is the One who only hath immortality, dwelling in the light no man can approach.'),
  -- thread: 1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4
  ('canon', '1-timothy', 6, 17, 'canon', 'psalms', 62, 10, 'free', E'*Trust not in oppression, and become not vain in robbery: if riches increase, set not your heart upon them.* (Psalm 62:10). The Psalmist charges the heart not to fasten on wealth: *if riches increase, set not your heart upon them.* Paul charges the rich in the same spirit: *that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God)* (1 Timothy 6:17). Riches are *uncertain* — they make themselves wings — so the heart is to rest not on them but on the living Elohim (God) who *giveth us richly all things to enjoy.*'),
  ('canon', '1-timothy', 6, 17, 'canon', 'deuteronomy', 8, 18, 'free', E'*But thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth, that he may establish his covenant which he sware unto thy fathers, as it is this day.* (Deuteronomy 8:18). Moses warns Yashar''el (Israel) against the proud heart that says *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17), and answers it: *it is he that giveth thee power to get wealth.* Paul charges the rich *that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God), who giveth us richly all things to enjoy* (1 Timothy 6:17). The wealth is a gift, not a self-made trophy; the Giver, not the gift, is to be trusted — the Torah''s charge become the apostle''s.'),
  ('canon', '1-timothy', 6, 18, 'apocrypha', 'tobit', 4, 9, 'extras', E'*For you layest up a good treasure for thyself against the day of necessity.* (Tobit 4:9). Tobit counsels his son to give alms — *If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little* (Tobit 4:8) — for by it *you layest up a good treasure for thyself against the day of necessity.* Paul charges the rich *That they do good, that they be rich in good works, ready to distribute, willing to communicate; Laying up in store for themselves a good foundation against the time to come* (1 Timothy 6:18-19). The good treasure laid up against the day of necessity is the good foundation laid up against the time to come; the Hebrew library''s wisdom of almsgiving is the apostle''s charge to the rich.'),
  ('canon', '1-timothy', 6, 19, 'canon', 'matthew', 6, 20, 'free', E'*But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* (Matthew 6:20). Yahusha (Jesus) commanded *lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:20-21). Paul gives the rich the very same instruction: *Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life* (1 Timothy 6:19). The good works of the rich are the heavenly treasure of the gospel; what is given away is not lost but laid up where neither moth nor rust corrupts, a foundation that lays hold on eternal life.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5',
       E'Godliness with contentment is great gain — we brought nothing into this world (Job 1, Ecclesiastes 5)',
       E'Paul sets contentment over covetousness: *But godliness with contentment is great gain. For we brought nothing into this world, and it is certain we can carry nothing out. And having food and raiment let us be therewith content* (1 Timothy 6:6-8). The root of that contentment is the bare truth Job confessed when he was stripped of everything in a single day: *Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21). The Preacher draws the same lesson over the man who heaps up riches: *As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand* (Ecclesiastes 5:15). Because the grave receives us as naked as the womb sent us forth, the heart must not be fastened on what cannot be carried out. The same apostolic doctrine sounds in Hebrews: *be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5) — the ground of contentment is not the fullness of the hand but the abiding presence of Yahuah (LORD), who is himself the believer''s portion. Godliness with contentment is great gain precisely because the One who never departs is gain that no thief can take and no death can strip away.',
       sv.verse_id, ev.verse_id, 'free', 8525
  FROM _s235_t235c6_lookup sv, _s235_t235c6_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31',
       E'The love of money is the root of all evil (Proverbs 23, Ecclesiastes 5, Sirach 31)',
       E'Paul names the deadly craving: *But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition. For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:9-10). This is no new saying — it gathers up the whole witness of the wisdom of the fathers. Proverbs warned against the very will to be rich: *Labour not to be rich: cease from thine own wisdom. Wilt thou set thine eyes upon that which is not? for riches certainly make themselves wings; they fly away as an eagle toward heaven* (Proverbs 23:4-5). The Preacher exposed its bottomless thirst: *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity* (Ecclesiastes 5:10). And the Hebrew library says it plainest of all: *He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Ecclesiasticus 31:5), for *Gold has been the ruin of many, and their destruction was present* (Ecclesiasticus 31:6). The eyes set on what takes wings fall into the snare; the love that can never be satisfied draws a man off the path; the lover of gold is not justified but ruined. Paul does not invent the warning but re-speaks it — the never-filled craving becomes, in him, the wandering from the faith and the self-inflicted sorrows of the covetous.',
       sv.verse_id, ev.verse_id, 'extras', 8526
  FROM _s235_t235c6_lookup sv, _s235_t235c6_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104',
       E'The King of kings, and Lord of lords — who only hath immortality, dwelling in unapproachable light (Deuteronomy 10, Psalm 104, Exodus 33)',
       E'The letter closes on a great doxology to *the blessed and only Potentate, the King of kings, and Lord of lords; Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen* (1 Timothy 6:15-16). This is the invisible, immortal Father, the one Elohim (God) of the Shema — the *King eternal, immortal, invisible, the only wise Elohim (God)* of 1 Timothy 1:17. Every title is the Tanakh''s own. Moses named Yahuah (LORD) *Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible* (Deuteronomy 10:17); the Psalm gives thanks *to the Lord of lords: for his mercy endureth for ever* (Psalm 136:3); and Nebuchadnezzar, greatest of earthly monarchs, confessed Daniel''s Elohim (God) to be *a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47). The unapproachable light is the Psalmist''s vision of Yahuah (LORD), *Who coverest thyself with light as with a garment* (Psalm 104:2). And the One *whom no man hath seen, nor can see* is the very Yahuah (LORD) who told Moses *Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). Paul names no new Elohim (God): the King of kings and Lord of lords, who only hath immortality and dwells in light no man can approach, is the invisible Father of the Tanakh, to whom alone be honour and power everlasting.',
       sv.verse_id, ev.verse_id, 'free', 8527
  FROM _s235_t235c6_lookup sv, _s235_t235c6_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4',
       E'The charge to the rich — laying up a good foundation against the time to come (Deuteronomy 8, Psalm 62, Tobit 4, Matthew 6)',
       E'Paul turns to those with much: *Charge them that are rich in this world, that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God), who giveth us richly all things to enjoy; That they do good, that they be rich in good works, ready to distribute, willing to communicate; Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life* (1 Timothy 6:17-19). The charge re-speaks the Torah''s own warning against the proud heart: Moses cautioned Yashar''el (Israel) lest it say *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17), answering, *thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth* (Deuteronomy 8:18) — the wealth is a gift, not a self-made trophy. The Psalmist charged the heart not to fasten on it: *if riches increase, set not your heart upon them* (Psalm 62:10). The Hebrew library taught that alms are treasure laid up: *If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little: For you layest up a good treasure for thyself against the day of necessity* (Tobit 4:8-9). And Yahusha (Jesus) gave the same instruction the apostle now gives the rich: *lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:20-21). The good works of the rich are the heavenly treasure; what is given away is not lost but laid up as a good foundation against the time to come, that they may lay hold on eternal life.',
       sv.verse_id, ev.verse_id, 'extras', 8528
  FROM _s235_t235c6_lookup sv, _s235_t235c6_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=6 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    -- godliness with contentment (8525)
    ('1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5', 'canon','1-timothy',6,7, 'canon','job',1,21, 1, E'*Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21) — Job stripped of all yet blessing Yahuah (LORD) is the godliness with contentment behind *we brought nothing into this world* (1 Timothy 6:7).'),
    ('1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5', 'canon','1-timothy',6,7, 'canon','ecclesiastes',5,15, 2, E'*As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand* (Ecclesiastes 5:15) — the Preacher''s witness behind *it is certain we can carry nothing out* (1 Timothy 6:7).'),
    ('1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5', 'canon','1-timothy',6,8, 'canon','hebrews',13,5, 3, E'*be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5) — the same apostolic charge, the abiding presence of Yahuah (LORD) the ground of *having food and raiment let us be therewith content* (1 Timothy 6:8).'),
    -- love of money (8526)
    ('1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31', 'canon','1-timothy',6,9, 'canon','proverbs',23,4, 1, E'*Labour not to be rich... for riches certainly make themselves wings; they fly away as an eagle toward heaven* (Proverbs 23:4-5) — the will to be rich that *fall[s] into temptation and a snare* (1 Timothy 6:9).'),
    ('1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31', 'canon','1-timothy',6,10, 'canon','ecclesiastes',5,10, 2, E'*He that loveth silver shall not be satisfied with silver* (Ecclesiastes 5:10) — the bottomless craving behind *the love of money is the root of all evil* (1 Timothy 6:10).'),
    ('1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31', 'canon','1-timothy',6,10, 'apocrypha','ecclesiasticus',31,5, 3, E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Ecclesiasticus 31:5) — the Hebrew library''s witness that the lover of gold is ruined, not justified, behind *the love of money is the root of all evil* (1 Timothy 6:10).'),
    -- King of kings (8527)
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,15, 'canon','deuteronomy',10,17, 1, E'*Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords* (Deuteronomy 10:17) — Moses'' title for the invisible Father behind *the King of kings, and Lord of lords* (1 Timothy 6:15).'),
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,15, 'canon','daniel',2,47, 2, E'*your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47) — Nebuchadnezzar''s confession behind *the King of kings* (1 Timothy 6:15).'),
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,15, 'canon','psalms',136,3, 3, E'*O give thanks to the Lord of lords: for his mercy endureth for ever* (Psalm 136:3) — the Psalm''s title behind *Lord of lords* (1 Timothy 6:15).'),
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,16, 'canon','psalms',104,2, 4, E'*Who coverest thyself with light as with a garment* (Psalm 104:2) — the light that is Yahuah (LORD)''s garment behind *dwelling in the light which no man can approach unto* (1 Timothy 6:16).'),
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,16, 'canon','exodus',33,20, 5, E'*there shall no man see me, and live* (Exodus 33:20) — the unseeable Yahuah (LORD) of the mount behind *whom no man hath seen, nor can see* (1 Timothy 6:16).'),
    -- charge to the rich (8528)
    ('1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4', 'canon','1-timothy',6,17, 'canon','psalms',62,10, 1, E'*if riches increase, set not your heart upon them* (Psalm 62:10) — the heart not fastened on wealth behind *nor trust in uncertain riches, but in the living Elohim (God)* (1 Timothy 6:17).'),
    ('1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4', 'canon','1-timothy',6,17, 'canon','deuteronomy',8,18, 2, E'*it is he that giveth thee power to get wealth* (Deuteronomy 8:18) — wealth as gift, not self-made trophy, behind *the living Elohim (God), who giveth us richly all things to enjoy* (1 Timothy 6:17).'),
    ('1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4', 'canon','1-timothy',6,18, 'apocrypha','tobit',4,9, 3, E'*you layest up a good treasure for thyself against the day of necessity* (Tobit 4:9) — alms as treasure laid up, behind *ready to distribute... Laying up in store for themselves a good foundation* (1 Timothy 6:18-19).'),
    ('1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4', 'canon','1-timothy',6,19, 'canon','matthew',6,20, 4, E'*lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:20-21) — Yahusha (Jesus)'' instruction behind *Laying up in store for themselves a good foundation against the time to come* (1 Timothy 6:19).')
  ) AS m(slug, src_edition,src_slug,src_ch,src_v, tgt_edition,tgt_slug,tgt_ch,tgt_v, sort_order, member_note)
  JOIN cross_reference_threads t ON t.slug = m.slug
  JOIN _s235_t235c6_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s235_t235c6_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
