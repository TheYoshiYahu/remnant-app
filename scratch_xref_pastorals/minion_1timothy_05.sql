-- ----- fragment: minion_1timothy_05.sql (S235 1 Timothy 5) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 5 (25 verses) — the honour of elders and widows, with the TORAH'S OWN WITNESSES.
-- Tag: t235c5 (temp view _s235_t235c5_lookup).
-- Sort band: floor 8500 (25-wide: 8500, 8501, 8502 used; under 8525).
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the apostle's charge to a shepherd; the law is GOOD, used lawfully — NOT abolished).
-- This chapter is the clearest place in the letter where Paul reaches straight into the Torah and binds
-- it on the assembly AS SCRIPTURE. He orders the household of Elohim by the same statutes Yahuah (LORD)
-- gave at Sinai: rise up before the hoary head (5:1 / Leviticus 19:32); defend the widow (5:3 / Exodus
-- 22:22, Deuteronomy 10:18); and — the load-bearing center — *For the scripture saith, Thou shalt not
-- muzzle the ox that treadeth out the corn. And, The labourer is worthy of his reward* (5:18), a DIRECT
-- quotation of Deuteronomy 25:4 with the wage-law of Leviticus 19:13, the Torah called *scripture* and
-- made the rule for the elders' double honour; and *Against an elder receive not an accusation, but
-- before two or three witnesses* (5:19), the witness-rule of Deuteronomy 19:15 bound on the church.
-- NO replacement theology, no law-vs-grace antithesis: the Torah is the apostle's authority here, quoted
-- by name and applied to the gathered. NT-Lord rule preserved exactly as the pull renders each place.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   rebuke not an elder, but intreat him as a father; elder women as mothers
--           Tanakh: Leviticus 19:32 (rise up before the hoary head, honour the face of the old man)
--           Extras: Sirach 3:8 (honour father and mother in word and deed), Sirach 3:12 (help thy
--                   father in his age), Tobit 4:3 (honour thy mother all the days of thy life)
--           NT: none warranted (the honour-the-elder root is the Torah's; carried in prose)
--   v.3-8   honour widows that are widows indeed; provide for thine own or deny the faith
--           Tanakh: Exodus 22:22 (ye shall not afflict any widow), Deuteronomy 10:18 (he doth execute
--                   the judgment of the fatherless and widow)
--           Extras: Sirach 4:10 (be as a father to the fatherless, and instead of an husband to their
--                   mother), Tobit 4:7 (give alms... turn not thy face from any poor)
--           NT: none warranted (the widow-defence root is the Torah's)
--   v.9-16  the widow's roll / good works / the younger widows / let the household relieve them
--           Tanakh: none warranted (washed-the-saints'-feet / good-works are described, not quoting a
--                   single Torah verse; the widow-care weight is carried at 5:3-8)
--           Extras: none warranted   NT: none warranted
--   v.17-19 the elders worthy of double honour; muzzle not the ox; two or three witnesses  [BLESSING]
--           Tanakh: Deuteronomy 25:4 (thou shalt not muzzle the ox when he treadeth out the corn),
--                   Leviticus 19:13 (the wages of him that is hired shall not abide... till morning),
--                   Deuteronomy 19:15 (at the mouth of two or three witnesses shall the matter be
--                   established)
--           Extras: Tobit 4:14 (let not the wages of any man... tarry with thee), Sirach 7:20 (defraud
--                   not... the hireling that bestoweth himself wholly for thee)
--           NT: 1 Corinthians 9:9 (thou shalt not muzzle the mouth of the ox — Paul's own twin quote),
--               Luke 10:7 (the labourer is worthy of his hire), Matthew 18:16 (two or three witnesses),
--               2 Corinthians 13:1 (in the mouth of two or three witnesses)
--   v.20-25 rebuke before all / charge without partiality / lay hands suddenly on no man / wine / sins
--           Tanakh: none warranted (general pastoral charge; no single load-bearing Torah quotation —
--                   5:21 "without partiality" echoes Leviticus 19:15 thematically but is carried in
--                   the honour-the-elder weave, not a distinct quote-thread)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8500 1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19  (Tanakh + Extras + NT)  [BLESSING CENTERPIECE]
--   8501 1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19  (Tanakh + Extras)
--   8502 1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10  (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s235_t235c5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19  [BLESSING CENTERPIECE]
  ('canon', '1-timothy', 5, 18, 'canon', 'deuteronomy', 25, 4, 'free', E'*Thou shalt not muzzle the ox when he treadeth out the corn.* (Deuteronomy 25:4). Paul quotes this Torah commandment by name and calls it *scripture*: *For the scripture saith, Thou shalt not muzzle the ox that treadeth out the corn* (1 Timothy 5:18), making it the ground for honouring *the elders that rule well... especially they who labour in the word and doctrine* (1 Timothy 5:17). The ox that labours eats of the threshing-floor; the elder who labours in the word is worthy of his keep. Far from setting the law aside, the apostle reaches into Deuteronomy and binds it on the assembly as the living rule for the support of those who serve it.'),
  ('canon', '1-timothy', 5, 18, 'canon', 'leviticus', 19, 13, 'free', E'*Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* (Leviticus 19:13). The Torah''s wage-law stands behind the second half of Paul''s charge: *The labourer is worthy of his reward* (1 Timothy 5:18). The hired man''s wage must not be held back; the one who labours is owed his due without delay. When Paul presses that the labouring elder be *counted worthy of double honour* (1 Timothy 5:17), he is speaking the heart of Leviticus — the worker''s wage withheld is robbery, and the assembly owes its labourers honestly and promptly.'),
  ('canon', '1-timothy', 5, 19, 'canon', 'deuteronomy', 19, 15, 'free', E'*One witness shall not rise up against a man for any iniquity, or for any sin, in any sin that he sinneth: at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established.* (Deuteronomy 19:15). Paul takes the Torah''s witness-rule straight into the order of the assembly: *Against an elder receive not an accusation, but before two or three witnesses* (1 Timothy 5:19). No charge may stand on a single tongue; a matter is established only *at the mouth of two or three witnesses.* The same statute Moses gave for the courts of Yashar''el (Israel) governs how an elder may be accused — the Torah quoted as binding scripture for the household of Elohim (God).'),
  ('canon', '1-timothy', 5, 18, 'apocrypha', 'tobit', 4, 14, 'extras', E'*Let not the wages of any man, which has wrought for you, tarry with you, but give him it out of hand: for if you serve Yahuah (God), he will also repay you* (Tobit 4:14). Tobit charges his son with the very wage-justice behind Paul''s *The labourer is worthy of his reward* (1 Timothy 5:18): the worker''s wage must not be made to *tarry,* but paid *out of hand.* The Hebrew library held the same Torah-rooted conscience that Paul applies to the labouring elder — the one who works is owed his due promptly, and Yahuah (God) himself stands surety for the wage honestly paid.'),
  ('canon', '1-timothy', 5, 17, 'apocrypha', 'ecclesiasticus', 7, 20, 'extras', E'*Whereas your servant works truly, entreat him not evil, nor the hireling that bestoweth himself wholly for you* (Sirach 7:20). The wise man guards the hireling *that bestoweth himself wholly* in the work — exactly the labourer Paul has in view when he asks that *the elders that rule well be counted worthy of double honour, especially they who labour in the word and doctrine* (1 Timothy 5:17). The one who spends himself fully in the service is not to be dealt with grudgingly; the assembly owes its labouring elders the honour their toil has earned.'),
  ('canon', '1-timothy', 5, 18, 'canon', '1-corinthians', 9, 9, 'free', E'*For it is written in the law of Moses, Thou shalt not muzzle the mouth of the ox that treadeth out the corn. Doth Elohim (God) take care for oxen?* (1 Corinthians 9:9). Paul cites the same Torah verse in both letters to make the same point: the labourer in the gospel may live of the gospel. Here he names its source — *it is written in the law of Moses* — and to Timothy he names its authority — *For the scripture saith* (1 Timothy 5:18). The apostle''s settled habit is to ground the support of the Lord''s workers in Deuteronomy 25:4, treating the law of Moses as the living word that *altogether for our sakes* was written.'),
  ('canon', '1-timothy', 5, 18, 'canon', 'luke', 10, 7, 'free', E'*And in the same house remain, eating and drinking such things as they give: for the labourer is worthy of his hire. Go not from house to house.* (Luke 10:7). Paul''s second clause, *The labourer is worthy of his reward* (1 Timothy 5:18), repeats the very words of Yahusha (Jesus) to the seventy: *the labourer is worthy of his hire.* The Master sent his labourers out to be kept by those they served; Paul builds the elders'' double honour on that same word, set beside the Torah''s muzzle-not-the-ox — the saying of the Lord and the commandment of Moses standing together as one rule.'),
  ('canon', '1-timothy', 5, 19, 'canon', 'matthew', 18, 16, 'free', E'*But if he will not hear thee, then take with thee one or two more, that in the mouth of two or three witnesses every word may be established.* (Matthew 18:16). Yahusha (Jesus) made the Torah''s witness-rule the pattern for discipline in the assembly, *that in the mouth of two or three witnesses every word may be established* — the very rule Paul lays on accusations against an elder: *before two or three witnesses* (1 Timothy 5:19). The Master and the apostle alike take Deuteronomy 19:15 as the standing law for how a charge is brought among the gathered.'),
  ('canon', '1-timothy', 5, 19, 'canon', '2-corinthians', 13, 1, 'free', E'*This is the third time I am coming to you. In the mouth of two or three witnesses shall every word be established.* (2 Corinthians 13:1). Paul invokes Deuteronomy 19:15 to govern his own dealing with the Corinthians, *In the mouth of two or three witnesses shall every word be established* — the same Torah-rule he binds on Timothy for the accusation of an elder, *before two or three witnesses* (1 Timothy 5:19). Across his letters the apostle treats the witness-law of Moses as the unbroken standard for establishing any matter in the household of Elohim (God).'),
  -- thread: 1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19
  ('canon', '1-timothy', 5, 1, 'canon', 'leviticus', 19, 32, 'free', E'*Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* (Leviticus 19:32). The Torah commands reverence for the aged, *rise up before the hoary head, and honour the face of the old man* — and Paul speaks the same honour into the assembly: *Rebuke not an elder, but intreat him as a father* (1 Timothy 5:1). The old man is not to be sharply reproved but entreated as a father; the apostle''s pastoral order is the living shape of Leviticus 19:32, reverence for the elder grounded in the fear of Elohim (God).'),
  ('canon', '1-timothy', 5, 1, 'apocrypha', 'ecclesiasticus', 3, 8, 'extras', E'*Honour your father and mother both in word and deed, that a blessing may come upon you from them* (Sirach 3:8). The wise man unfolds the honour due to father and mother *both in word and deed* — and Paul orders the same posture toward the elders of the assembly: *Rebuke not an elder, but intreat him as a father; and the younger men as brethren; The elder women as mothers; the younger as sisters, with all purity* (1 Timothy 5:1-2). The household of Elohim (God) is ordered as a family, every age honoured in its place, the elder treated with the very reverence the Torah and the wisdom of the fathers command toward a parent.'),
  ('canon', '1-timothy', 5, 1, 'apocrypha', 'ecclesiasticus', 3, 12, 'extras', E'*My son, help your father in his age, and grieve him not as long as he lives* (Sirach 3:12). The counsel to *help your father in his age, and grieve him not* is the very tenderness Paul commands toward the aged in the assembly: *Rebuke not an elder, but intreat him as a father* (1 Timothy 5:1). The elder is not to be grieved with sharp rebuke but borne with as one bears with an aging father; the framework''s ordering of the household keeps the honour of the old man the wisdom of the fathers taught.'),
  ('canon', '1-timothy', 5, 2, 'apocrypha', 'tobit', 4, 3, 'extras', E'*My son, when I am dead, bury me; and despise not your mother, but honour her all the days of your life, and do that which shall please her, and grieve her not* (Tobit 4:3). Tobit charges his son to *honour her all the days of your life* and *grieve her not* — the very reverence Paul commands toward the older women of the assembly: *The elder women as mothers; the younger as sisters, with all purity* (1 Timothy 5:2). The aged woman of the congregation is to be honoured as a man honours his own mother; the apostle orders the household by the same reverence for parents the Hebrew library held sacred.'),
  -- thread: 1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10
  ('canon', '1-timothy', 5, 3, 'canon', 'exodus', 22, 22, 'free', E'*Ye shall not afflict any widow, or fatherless child.* (Exodus 22:22). The Torah sets the widow and the fatherless under Yahuah''s (LORD''s) own protection — *ye shall not afflict any widow* — with the warning that he will surely hear their cry. Paul takes up that same defence in the assembly: *Honour widows that are widows indeed* (1 Timothy 5:3). The widow Moses guarded from affliction is the widow Paul commands the household to honour and relieve; the apostle''s care for the desolate widow is the Torah''s care brought into the gathered people.'),
  ('canon', '1-timothy', 5, 3, 'canon', 'deuteronomy', 10, 18, 'free', E'*He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment.* (Deuteronomy 10:18). Yahuah (LORD) himself *doth execute the judgment of the fatherless and widow* — he is the widow''s defender, feeding and clothing the helpless. Paul calls the assembly to share that very work: *Honour widows that are widows indeed* (1 Timothy 5:3), and *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day* (1 Timothy 5:5). The desolate widow trusts the Elohim (God) who executes her judgment; the household honours her because Yahuah (LORD) himself loves and provides for her.'),
  ('canon', '1-timothy', 5, 3, 'apocrypha', 'ecclesiasticus', 4, 10, 'extras', E'*Be as a father to the fatherless, and instead of an husband to their mother: so shall you be as the son of the Most High, and he shall love you more than your mother does* (Sirach 4:10). The wise man calls the righteous to stand *instead of an husband* to the widow and *as a father* to the fatherless — the very ministry Paul lays on the assembly: *Honour widows that are widows indeed* (1 Timothy 5:3), and *let them relieve them, and let not the church be charged; that it may relieve them that are widows indeed* (1 Timothy 5:16). The household becomes husband and father to the widow and orphan, taking up the care the Hebrew library taught is the mark of a son of the Most High.'),
  ('canon', '1-timothy', 5, 16, 'apocrypha', 'tobit', 4, 7, 'extras', E'*Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7). Tobit''s charge to give alms and *turn not your face from any poor* is the open-handed care Paul orders the believing household to extend to its widows: *If any man or woman that believeth have widows, let them relieve them, and let not the church be charged; that it may relieve them that are widows indeed* (1 Timothy 5:16). The believer relieves his own widows so the assembly''s care is kept for the truly desolate — the same generosity the library blesses, the face never turned from the poor.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19',
       E'Muzzle not the ox, and two or three witnesses — the Torah quoted as scripture (Deuteronomy 25, 19)',
       E'Here Paul reaches straight into the Torah and binds it on the assembly AS SCRIPTURE. Ordering the support and the discipline of the elders, he writes: *Let the elders that rule well be counted worthy of double honour, especially they who labour in the word and doctrine. For the scripture saith, Thou shalt not muzzle the ox that treadeth out the corn. And, The labourer is worthy of his reward* (1 Timothy 5:17-18). The first half is a direct quotation of Moses: *Thou shalt not muzzle the ox when he treadeth out the corn* (Deuteronomy 25:4) — the labouring ox eats of the threshing-floor, and so the labouring elder is worthy of his keep. Mark the word Paul uses: *the scripture saith.* The Torah is not abolished; it is the apostle''s authority, quoted by name as the living rule for the household of Elohim (God). The second half, *The labourer is worthy of his reward,* speaks the heart of the Torah''s wage-law — *the wages of him that is hired shall not abide with thee all night until the morning* (Leviticus 19:13) — the worker owed his due without delay. The Hebrew library held the same conscience: *Let not the wages of any man, which has wrought for you, tarry with you, but give him it out of hand* (Tobit 4:14), and *entreat him not evil, nor the hireling that bestoweth himself wholly for you* (Sirach 7:20). And Paul did not invent the application; he cites the very same Torah verse to the Corinthians — *For it is written in the law of Moses, Thou shalt not muzzle the mouth of the ox that treadeth out the corn* (1 Corinthians 9:9) — setting it beside the word of the Master himself: *the labourer is worthy of his hire* (Luke 10:7). The commandment of Moses and the saying of Yahusha (Jesus) stand together as one rule for the keeping of the Lord''s workers. Then comes the second Torah-quotation, governing how an elder may be accused: *Against an elder receive not an accusation, but before two or three witnesses* (1 Timothy 5:19). This is the witness-rule of Deuteronomy: *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* (Deuteronomy 19:15). No charge may stand on a single tongue. Yahusha (Jesus) had already made that statute the pattern for the assembly — *that in the mouth of two or three witnesses every word may be established* (Matthew 18:16) — and Paul applied it to himself before the Corinthians — *In the mouth of two or three witnesses shall every word be established* (2 Corinthians 13:1). From the support of the elders to the accusation of an elder, the law of Moses is the apostle''s standing scripture; the Torah quoted as binding, not set aside.',
       sv.verse_id, ev.verse_id, 'extras', 8500
  FROM _s235_t235c5_lookup sv, _s235_t235c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=5 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19',
       E'Intreat an elder as a father — rise up before the hoary head (Leviticus 19)',
       E'Paul orders the household of Elohim (God) as a family, every age honoured in its place: *Rebuke not an elder, but intreat him as a father; and the younger men as brethren; The elder women as mothers; the younger as sisters, with all purity* (1 Timothy 5:1-2). The elder is not to be sharply reproved but entreated as a father; the older woman honoured as a mother. This is the living shape of the Torah''s command for the aged: *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:32). Reverence for the elder is grounded in the fear of Elohim (God), and the wisdom of the fathers carried that same charge: *Honour your father and mother both in word and deed, that a blessing may come upon you from them* (Sirach 3:8), and *My son, help your father in his age, and grieve him not as long as he lives* (Sirach 3:12) — the aged not grieved with sharp rebuke but borne with as one bears with an aging father. So too for the older woman: *honour her all the days of your life, and do that which shall please her, and grieve her not* (Tobit 4:3). The apostle does not loose the assembly from this honour; he binds it on the gathered people, ordering the church by the very reverence for the elder the Torah and the wisdom of the fathers command toward a parent.',
       sv.verse_id, ev.verse_id, 'extras', 8501
  FROM _s235_t235c5_lookup sv, _s235_t235c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10',
       E'Honour widows that are widows indeed — the widow defended (Exodus 22, Deuteronomy 10)',
       E'*Honour widows that are widows indeed* (1 Timothy 5:3). Paul takes up into the assembly the defence of the widow that runs through the whole Torah. At Sinai Yahuah (LORD) set the widow under his own protection: *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22), with the warning that he will surely hear their cry. And he names himself their defender: *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment* (Deuteronomy 10:18). The desolate widow Paul describes is the one who casts herself on that very Elohim (God): *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day* (1 Timothy 5:5). Because Yahuah (LORD) himself loves and provides for her, the household must honour and relieve her. The wisdom of the fathers laid the same charge on the righteous: *Be as a father to the fatherless, and instead of an husband to their mother: so shall you be as the son of the Most High* (Sirach 4:10), and *turn not your face from any poor* (Tobit 4:7). Paul orders that the believing family bear its own widows first — *If any man or woman that believeth have widows, let them relieve them, and let not the church be charged; that it may relieve them that are widows indeed* (1 Timothy 5:16) — so the assembly''s care is kept for the truly desolate. The widow Moses guarded from affliction is the widow the household is commanded to honour; the apostle''s care for the desolate is the Torah''s care brought into the gathered people.',
       sv.verse_id, ev.verse_id, 'extras', 8502
  FROM _s235_t235c5_lookup sv, _s235_t235c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 25:4 — *Thou shalt not muzzle the ox when he treadeth out the corn* the Torah Paul quotes by name as *scripture* for the elders'' double honour (1 Timothy 5:17-18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:13 — *the wages of him that is hired shall not abide with thee all night until the morning* the Torah''s wage-law behind *The labourer is worthy of his reward* (1 Timothy 5:18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 19:15 — *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* the witness-rule Paul binds on accusations against an elder: *before two or three witnesses* (1 Timothy 5:19).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:14 — *Let not the wages of any man, which has wrought for you, tarry with you, but give him it out of hand* the library''s same wage-justice behind *The labourer is worthy of his reward* (1 Timothy 5:18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 7:20 — *entreat him not evil, nor the hireling that bestoweth himself wholly for you* the labourer who spends himself fully, owed the honour of the elders who *labour in the word and doctrine* (1 Timothy 5:17).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 9:9 — *For it is written in the law of Moses, Thou shalt not muzzle the mouth of the ox that treadeth out the corn* Paul''s own twin quote of Deuteronomy 25:4 grounding the worker''s keep in the law of Moses (1 Timothy 5:18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Luke 10:7 — *the labourer is worthy of his hire* the word of Yahusha (Jesus) to the seventy, repeated by Paul beside muzzle-not-the-ox: *The labourer is worthy of his reward* (1 Timothy 5:18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Matthew 18:16 — *that in the mouth of two or three witnesses every word may be established* Yahusha (Jesus) making Deuteronomy 19:15 the assembly''s rule, the same rule Paul lays on accusing an elder (1 Timothy 5:19).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'2 Corinthians 13:1 — *In the mouth of two or three witnesses shall every word be established* Paul invoking the same Torah witness-rule, the unbroken standard he binds on Timothy (1 Timothy 5:19).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:32 — *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God)* the Torah''s reverence for the aged behind *intreat him as a father* (1 Timothy 5:1).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 3:8 — *Honour your father and mother both in word and deed* the wisdom of the fathers behind ordering the assembly as a family, the elder entreated as a father (1 Timothy 5:1).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 3:12 — *help your father in his age, and grieve him not* the aged not grieved with sharp rebuke, the heart of *Rebuke not an elder, but intreat him as a father* (1 Timothy 5:1).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:3 — *honour her all the days of your life... and grieve her not* the reverence for an aging mother behind *The elder women as mothers* (1 Timothy 5:2).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 22:22 — *Ye shall not afflict any widow, or fatherless child* the widow set under Yahuah''s (LORD''s) own protection, honoured now in the assembly (1 Timothy 5:3).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 10:18 — *He doth execute the judgment of the fatherless and widow... in giving him food and raiment* Yahuah (LORD) himself the widow''s defender, the Elohim (God) on whom the desolate widow trusts (1 Timothy 5:3,5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 4:10 — *Be as a father to the fatherless, and instead of an husband to their mother* the library''s charge to stand for the widow and orphan, the ministry laid on the household (1 Timothy 5:3,16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:7 — *when you give alms... turn not your face from any poor* the open-handed care Paul orders the believing household to extend to its widows (1 Timothy 5:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
