-- ----- fragment: minion_romans_01.sql (S219 Romans 1) -----
-- =====================================================================
-- S219 minion — ROMANS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 1.  Tag: r01 (temp view _s219_r01_lookup).  Sort band: 6000-6024, step 3.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #2/#4/#5/#7/#10/#11): Paul, a Torah-keeping Yashar'elite, writes
-- to the mixed assembly at Rome — the believing remnant of Yahudah and the scattered/dispersed
-- of the ten tribes being gathered. The gospel is *promised afore by his prophets in the holy
-- scriptures* (1:2) — rooted in the Tanakh, not a new religion. *To the Jew first* (1:16) is
-- the deliverance through the house of Yahudah, reaching the dispersed (the Greek). *The just
-- shall live by faith* (1:17) = Habakkuk 2:4 (emunah, covenant faithfulness — NOT mental
-- assent). The wrath/idolatry descent (1:18-32) is the indictment of all flesh that SETS UP
-- the gathering — read as Wisdom-of-Solomon's creation-worship → idolatry → moral collapse,
-- never as a license-prooftext.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   gospel promised afore / seed of David  Tanakh: Isaiah 40:9 (good tidings, Behold your Elohim)  Extras: none warranted  NT: Galatians 3:8 (scripture preached the gospel before unto Abraham)
--   v.5-7   grace and apostleship for obedience     Tanakh: none added (carried at 1:17)  Extras: none warranted  NT: none added (Lord-Yahusha title carried elsewhere)
--   v.8-15  thanksgiving / longing / debtor         Tanakh: none warranted  Extras: none warranted  NT: none warranted (epistolary)
--   v.16    to the Yahudi (Jew) first               Tanakh: Hosea 1:10 (the scattered made sons of the living Elohim)  Extras: none warranted  NT: none added (two-house gathering carried by Hosea target)
--   v.17    the just shall live by his faith         Tanakh: Habakkuk 2:4 (emunah)  Extras: none warranted  NT: Hebrews 10:38, Galatians 3:11 (same Habakkuk citation)
--   v.18-20 invisible things clearly seen           Tanakh: Psalm 19:1  Extras: Wisdom of Solomon 13:1, 13:5  NT: none warranted
--   v.21-25 changed the glory into an image          Tanakh: Psalm 106:20, Deuteronomy 4:16, Deuteronomy 4:19  Extras: Wisdom of Solomon 14:11, 14:12  NT: none warranted
--   v.26-32 given up to a reprobate mind / collapse   Tanakh: none added (Deuteronomy/Psalm carried at 1:21-25)  Extras: Wisdom of Solomon 14:22, 14:25, 14:27  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   6000 romans-1-the-gospel-promised-afore-by-his-prophets-in-the-holy-scriptures   (Tanakh + NT)
--   6003 romans-1-to-the-jew-first-the-scattered-made-sons-of-the-living-elohim       (Tanakh)
--   6006 romans-1-the-just-shall-live-by-his-faith-habakkuk                            (Tanakh + NT)
--   6009 romans-1-the-invisible-things-clearly-seen-the-heavens-declare-his-glory      (Tanakh + Extras)
--   6012 romans-1-changed-the-glory-into-an-image-the-idolatry-descent                 (Tanakh + Extras)
--   6015 romans-1-given-over-to-a-reprobate-mind-the-collapse-into-uncleanness         (Extras)
-- =====================================================================

CREATE TEMP VIEW _s219_r01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-1-the-gospel-promised-afore-by-his-prophets-in-the-holy-scriptures
  ('canon', 'romans', 1, 2, 'canon', 'isaiah', 40, 9, 'free', E'*O Zion, that bringest good tidings, get thee up into the high mountain; O Jerusalem, that bringest good tidings, lift up thy voice with strength; lift it up, be not afraid; say unto the cities of Yahudah (Judah), Behold your Elohim (God)!* (Isaiah 40:9). Paul is *separated unto the gospel of Elohim (God)* (Romans 1:1), the gospel *which he had promised afore by his prophets in the holy scriptures* (Romans 1:2). The good tidings are not a new religion announced in Rome — they are the good tidings the prophet already cried to the cities of Yahudah: *Behold your Elohim (God).* The gospel is the Tanakh''s own promise come to pass.'),
  ('canon', 'romans', 1, 2, 'canon', 'galatians', 3, 8, 'free', E'*And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed.* (Galatians 3:8). The gospel Paul serves was *promised afore by his prophets in the holy scriptures* (Romans 1:2) — the same gospel the scripture *preached before* unto Abraham. The good news was sown in the promise to the fathers; it does not arrive apart from the prophets but as the unsealing of what they already carried.'),
  ('canon', 'romans', 1, 3, 'canon', 'isaiah', 40, 11, 'free', E'*He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom, and shall gently lead those that are with young.* (Isaiah 40:11). The Son *was made of the seed of David according to the flesh* (Romans 1:3) — the Formed drawn from the Formless, who came in flesh as David''s seed. The prophet saw him as the Shepherd who comes with strong hand to *gather the lambs* — the same gathering Paul''s gospel announces, the seed of David come to feed the scattered flock.'),
  -- thread: romans-1-to-the-jew-first-the-scattered-made-sons-of-the-living-elohim
  ('canon', 'romans', 1, 16, 'canon', 'hosea', 1, 10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). The gospel is *the power of Elohim (God) unto salvation to every one that believeth; to the Yahudi (Jew) first, and also to the Greek* (Romans 1:16). The deliverance comes through the house of Yahudah first, then reaches the Greek — the dispersed of the northern house, the Lo-Ammi made Ammi, the scattered seed in the place where it was said *Ye are not my people* now told *Ye are the sons of the living Elohim (God).* Not outsiders newly admitted, but the two houses gathered.'),
  ('canon', 'romans', 1, 16, 'canon', 'hosea', 1, 11, 'free', E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* (Hosea 1:11). *To the Yahudi (Jew) first, and also to the Greek* (Romans 1:16) is the order of one gathering, not two peoples: the children of Yahudah and the children of Yashar''el gathered together under one head. The gospel''s reach to the Greek is the dispersed of the north coming up out of the land of their scattering — the day of Jezreel, the two sticks made one.'),
  -- thread: romans-1-the-just-shall-live-by-his-faith-habakkuk
  ('canon', 'romans', 1, 17, 'canon', 'habakkuk', 2, 4, 'free', E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4). *For therein is the righteousness of Elohim (God) revealed from faith to faith: as it is written, The just shall live by faith* (Romans 1:17). Paul quotes Habakkuk word for word. The faith by which the just live is the prophet''s emunah — covenant faithfulness, the steadfast trust that holds fast and waits for the vision that *will surely come* (Habakkuk 2:3), set against the proud soul *lifted up* and *not upright.* It is not bare mental assent but the faithful clinging of the righteous to Yahuah (LORD) and his ways.'),
  ('canon', 'romans', 1, 17, 'canon', 'hebrews', 10, 38, 'free', E'*Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him.* (Hebrews 10:38). The same Habakkuk word stands behind Romans — *the just shall live by faith* (Romans 1:17) — and Hebrews carries the fuller line: the faith that is life is the faith that does not *draw back.* The living by faith is an enduring, faithful walk; the one who draws back unto perdition is set against the one who *believes to the saving of the soul* (Hebrews 10:39). Emunah is faithfulness that holds, not a single moment of assent.'),
  ('canon', 'romans', 1, 17, 'canon', 'galatians', 3, 11, 'free', E'*But that no man is justified by the law in the sight of Elohim (God), it is evident: for, The just shall live by faith.* (Galatians 3:11). Twice Paul reaches for the same prophet — here and at *the just shall live by faith* (Romans 1:17). The point is not that the law is set aside but that no man is brought into right standing by a system of flesh-performance apart from the faithfulness of Messiah (Christ); the righteous are justified by emunah and then *the man that doeth them shall live in them* (Galatians 3:12). Faith and the doing of the commandments are not enemies — the faithful are set to walk.'),
  -- thread: romans-1-the-invisible-things-clearly-seen-the-heavens-declare-his-glory
  ('canon', 'romans', 1, 20, 'canon', 'psalms', 19, 1, 'free', E'*The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalm 19:1). *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse* (Romans 1:20). What the psalmist sang Paul presses as testimony: the heavens themselves *declare the glory of Elohim (God),* so the eternal power and Godhead are plainly seen in the things made. The creation is a witness that leaves the suppressor of the truth *without excuse.*'),
  ('canon', 'romans', 1, 19, 'apocrypha', 'the-wisdom-of-solomon', 13, 1, 'extras', E'*Surely vain are all men by nature, who are ignorant of Yahuah (God), and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* (Wisdom of Solomon 13:1). *Because that which may be known of Elohim (God) is manifest in them; for Elohim (God) hath shewed it unto them* (Romans 1:19). The wisdom-writer named the same indictment Paul presses: from *the good things that are seen* the workmaster is to be known, yet they would not *acknowledge the workmaster.* What may be known of Elohim is manifest — the failure is not lack of witness but the refusal to read it.'),
  ('canon', 'romans', 1, 20, 'apocrypha', 'the-wisdom-of-solomon', 13, 5, 'extras', E'*For by the greatness and beauty of the creatures proportionably the maker of them is seen.* (Wisdom of Solomon 13:5). *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made* (Romans 1:20). Paul and the wisdom-writer say one thing: the Maker is seen *by the greatness and beauty of the creatures,* clearly seen *by the things that are made.* The creation points past itself to the Creator; to stop at the creature and miss the Maker is the turn that leaves men without excuse.'),
  -- thread: romans-1-changed-the-glory-into-an-image-the-idolatry-descent
  ('canon', 'romans', 1, 23, 'canon', 'psalms', 106, 20, 'free', E'*Thus they changed their glory into the similitude of an ox that eateth grass.* (Psalm 106:20). *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:23). Paul echoes the psalm''s very verb: Yashar''el at Horeb *changed their glory into the similitude of an ox,* and the nations changed the glory of the uncorruptible Elohim into images of beast and bird and creeping thing. The exchange is the same sin — the worship due the Creator turned toward the made thing.'),
  ('canon', 'romans', 1, 23, 'canon', 'deuteronomy', 4, 16, 'free', E'*Lest ye corrupt yourselves, and make you a graven image, the similitude of any figure, the likeness of male or female,* (Deuteronomy 4:16). The descent Paul names — the glory of Elohim changed *into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:23) — is exactly what Moses forbade: the graven image, *the likeness of any beast that is on the earth, the likeness of any winged fowl … the likeness of any thing that creepeth on the ground* (Deuteronomy 4:17-18). The list is the same list; the warning Moses gave is the indictment Paul brings.'),
  ('canon', 'romans', 1, 25, 'canon', 'deuteronomy', 4, 19, 'free', E'*And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* (Deuteronomy 4:19). Those Paul indicts *worshipped and served the creature more than the Creator, who is blessed for ever* (Romans 1:25). Moses had named the very turn: to worship and serve the host of heaven — the creature — rather than the One who made and divided them. The creation-worship Moses forbade is the lie into which the truth of Elohim is changed.'),
  ('canon', 'romans', 1, 25, 'apocrypha', 'the-wisdom-of-solomon', 14, 12, 'extras', E'*For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* (Wisdom of Solomon 14:12). They *changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator* (Romans 1:25). The wisdom-writer traces the same root: the devising of idols is *the beginning of spiritual fornication,* the very corruption that follows the exchange Paul names. The lie that serves the creature is not a small error but the headwaters of the whoredom that defiles life.'),
  ('canon', 'romans', 1, 23, 'apocrypha', 'the-wisdom-of-solomon', 14, 11, 'extras', E'*Therefore even upon the idols of the Gentiles shall there be a visitation: because in the creature of Yahuah (God) they are become an abomination, and stumblingblocks to the souls of men, and a snare to the feet of the unwise.* (Wisdom of Solomon 14:11). The images of *corruptible man, and … birds, and fourfooted beasts, and creeping things* (Romans 1:23) are what the wisdom-writer calls *the idols of the Gentiles* — the creature made an *abomination,* a *snare to the feet of the unwise.* The made thing set in the Creator''s place becomes the stumblingblock, and a visitation is sure upon it.'),
  -- thread: romans-1-given-over-to-a-reprobate-mind-the-collapse-into-uncleanness
  ('canon', 'romans', 1, 28, 'apocrypha', 'the-wisdom-of-solomon', 14, 22, 'extras', E'*Moreover this was not enough for them, that they erred in the knowledge of Yahuah (God); but whereas they lived in the great war of ignorance, those so great plagues called they peace.* (Wisdom of Solomon 14:22). *And even as they did not like to retain Elohim (God) in their knowledge, Elohim (God) gave them over to a reprobate mind, to do those things which are not convenient* (Romans 1:28). The wisdom-writer names the same root Paul names: they *erred in the knowledge of Yahuah,* refusing to retain him, and so were given to a darkened mind that calls the great plagues peace. The reprobate mind is the fruit of the rejected knowledge of Elohim.'),
  ('canon', 'romans', 1, 29, 'apocrypha', 'the-wisdom-of-solomon', 14, 25, 'extras', E'*So that there reigned in all men without exception blood, manslaughter, theft, and dissimulation, corruption, unfaithfulness, tumults, perjury,* (Wisdom of Solomon 14:25). Paul''s catalogue — *being filled with all unrighteousness, fornication, wickedness, covetousness, maliciousness; full of envy, murder, debate, deceit, malignity* (Romans 1:29) — walks the same road the wisdom-writer walked: idolatry loosed *blood, manslaughter … corruption, unfaithfulness … perjury* over all men. The moral collapse follows the worship of the creature; the two indictments name one descent.'),
  ('canon', 'romans', 1, 32, 'apocrypha', 'the-wisdom-of-solomon', 14, 27, 'extras', E'*For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil.* (Wisdom of Solomon 14:27). Those Paul indicts, *knowing the judgment of Elohim (God), that they which commit such things are worthy of death, not only do the same, but have pleasure in them that do them* (Romans 1:32). The wisdom-writer set the whole descent under one verdict: idol-worship is *the beginning, the cause, and the end, of all evil.* From the exchanged glory to the reprobate mind to the pleasure taken in death — it is all one collapse, traced to the worship of the creature, and it sets up the indictment of all flesh that the gathering answers.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-1-the-gospel-promised-afore-by-his-prophets-in-the-holy-scriptures',
       E'The gospel promised afore by his prophets in the holy scriptures',
       E'Paul opens not by announcing a new religion but by binding the gospel to the prophets: he is *separated unto the gospel of Elohim (God)* (Romans 1:1), *which he had promised afore by his prophets in the holy scriptures* (Romans 1:2), *concerning his Son … which was made of the seed of David according to the flesh* (Romans 1:3). The good tidings were already cried in the Tanakh — *O Zion, that bringest good tidings … say unto the cities of Yahudah (Judah), Behold your Elohim (God)!* (Isaiah 40:9) — and the One announced is the Shepherd the prophet saw, who *shall feed his flock like a shepherd: he shall gather the lambs with his arm* (Isaiah 40:11), the Formed come in flesh as the seed of David. The gospel did not begin in Rome. The scripture itself *preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* (Galatians 3:8). What Paul serves is the unsealing of the promise the fathers and the prophets carried — the Tanakh''s own word come to pass.',
       sv.verse_id, ev.verse_id, 'free', 6000
  FROM _s219_r01_lookup sv, _s219_r01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-1-to-the-jew-first-the-scattered-made-sons-of-the-living-elohim',
       E'To the Yahudi (Jew) first — the scattered made sons of the living Elohim (God)',
       E'*For I am not ashamed of the gospel of Messiah (Christ): for it is the power of Elohim (God) unto salvation to every one that believeth; to the Yahudi (Jew) first, and also to the Greek* (Romans 1:16). This is not two peoples but the order of one gathering. The deliverance comes through the house of Yahudah first; then it reaches *the Greek* — the dispersed of the northern house, the scattered seed living among the nations, the lost sheep who had forgotten the covenant. Hosea named them and named their homecoming in the same breath: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The Lo-Ammi made Ammi — not outsiders newly admitted by confession, but the divorced house of the north regathered. And the end of the gathering is the two houses made one: *then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land* (Hosea 1:11). The gospel''s reach to the Greek is the scattered seed coming home.',
       sv.verse_id, ev.verse_id, 'free', 6003
  FROM _s219_r01_lookup sv, _s219_r01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-1-the-just-shall-live-by-his-faith-habakkuk',
       E'The just shall live by his faith — Habakkuk',
       E'*For therein is the righteousness of Elohim (God) revealed from faith to faith: as it is written, The just shall live by faith* (Romans 1:17). Paul reaches for the prophet and quotes him word for word: *Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith* (Habakkuk 2:4). The faith by which the just live is Habakkuk''s emunah — covenant faithfulness, the steadfast trust that holds fast and waits for the vision that *will surely come* (Habakkuk 2:3) — set against the proud soul lifted up and not upright. It is not a single moment of bare mental assent but a faithful clinging. Hebrews carries the fuller line and proves it: *Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* (Hebrews 10:38) — the faith that is life is the faith that does not draw back. And Paul reaches for the same word again to show no man is brought into right standing by a system of flesh-performance apart from the faithfulness of Messiah (Christ): *that no man is justified by the law in the sight of Elohim (God), it is evident: for, The just shall live by faith* (Galatians 3:11) — and then *the man that doeth them shall live in them* (Galatians 3:12). The righteous are justified by emunah and set to walk; faith and the doing of the commandments are never enemies.',
       sv.verse_id, ev.verse_id, 'free', 6006
  FROM _s219_r01_lookup sv, _s219_r01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-1-the-invisible-things-clearly-seen-the-heavens-declare-his-glory',
       E'The invisible things clearly seen — the heavens declare his glory',
       E'Paul''s charge against all flesh begins not with a verdict but with a witness: *the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse* (Romans 1:20), *because that which may be known of Elohim (God) is manifest in them; for Elohim (God) hath shewed it unto them* (Romans 1:19). The psalmist sang the same testimony: *the heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1). And the wisdom-writer pressed the identical indictment long before Paul: men *could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster* (Wisdom of Solomon 13:1), though *by the greatness and beauty of the creatures proportionably the maker of them is seen* (Wisdom of Solomon 13:5). The creation points past itself to the Creator. The failure is never lack of witness — the heavens declare it, the works reveal it — but the refusal to read what is plainly shown, and that refusal leaves men without excuse.',
       sv.verse_id, ev.verse_id, 'extras', 6009
  FROM _s219_r01_lookup sv, _s219_r01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-1-changed-the-glory-into-an-image-the-idolatry-descent',
       E'Changed the glory into an image — the idolatry descent',
       E'From the suppressed witness Paul traces the turn: *they glorified him not as Elohim (God), neither were thankful … and changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:21-23), and so *worshipped and served the creature more than the Creator, who is blessed for ever* (Romans 1:25). The verb is the psalmist''s own: at Horeb Yashar''el *changed their glory into the similitude of an ox that eateth grass* (Psalm 106:20). The catalogue is Moses'' own warning — *make you a graven image, the similitude of any figure, the likeness of male or female* (Deuteronomy 4:16), *the likeness of any beast … any winged fowl … any thing that creepeth* (Deuteronomy 4:17-18) — and the creation-worship he forbade: *lest thou … when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them* (Deuteronomy 4:19). The wisdom-writer named the same images *the idols of the Gentiles … an abomination, and stumblingblocks to the souls of men, and a snare to the feet of the unwise* (Wisdom of Solomon 14:11), and traced the root: *the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life* (Wisdom of Solomon 14:12). The exchange of the Creator''s glory for the made thing is one sin across Tanakh, library, and apostle — the headwaters of the whoredom that defiles.',
       sv.verse_id, ev.verse_id, 'extras', 6012
  FROM _s219_r01_lookup sv, _s219_r01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=1 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-1-given-over-to-a-reprobate-mind-the-collapse-into-uncleanness',
       E'Given over to a reprobate mind — the collapse into uncleanness',
       E'The descent reaches its floor: *even as they did not like to retain Elohim (God) in their knowledge, Elohim (God) gave them over to a reprobate mind, to do those things which are not convenient* (Romans 1:28), *being filled with all unrighteousness, fornication, wickedness, covetousness, maliciousness; full of envy, murder, debate, deceit, malignity* (Romans 1:29). The wisdom-writer had already walked this exact road from idolatry to moral collapse: men *erred in the knowledge of Yahuah (God) … and those so great plagues called they peace* (Wisdom of Solomon 14:22), until *there reigned in all men without exception blood, manslaughter, theft, and dissimulation, corruption, unfaithfulness, tumults, perjury* (Wisdom of Solomon 14:25) — and he set the whole descent under one verdict: *the worshipping of idols … is the beginning, the cause, and the end, of all evil* (Wisdom of Solomon 14:27). Paul ends where the wisdom-writer ended, with men *knowing the judgment of Elohim (God), that they which commit such things are worthy of death, not only do the same, but have pleasure in them that do them* (Romans 1:32). This is the indictment of all flesh — the reprobate mind that is the fruit of the rejected knowledge of Elohim — and it is read not as a license-prooftext but as the charge that sets up the gathering: the whole world shut up under sin, that mercy might gather the scattered home.',
       sv.verse_id, ev.verse_id, 'extras', 6015
  FROM _s219_r01_lookup sv, _s219_r01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=1 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-1-the-gospel-promised-afore-by-his-prophets-in-the-holy-scriptures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:9 — *O Zion, that bringest good tidings … say unto the cities of Yahudah (Judah), Behold your Elohim (God)!* the good tidings already cried by the prophet, the gospel promised afore (Romans 1:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-the-gospel-promised-afore-by-his-prophets-in-the-holy-scriptures'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 3:8 — *the scripture … preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* the gospel sown in the promise to the fathers, not arriving apart from the prophets (Romans 1:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-the-gospel-promised-afore-by-his-prophets-in-the-holy-scriptures'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 40:11 — *he shall feed his flock like a shepherd: he shall gather the lambs with his arm* the seed of David the prophet saw, the Shepherd come to gather the scattered (Romans 1:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-the-gospel-promised-afore-by-his-prophets-in-the-holy-scriptures'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-1-to-the-jew-first-the-scattered-made-sons-of-the-living-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 1:10 — *there it shall be said unto them, Ye are the sons of the living Elohim (God)* the Lo-Ammi made Ammi, the scattered of the north regathered, not outsiders admitted (Romans 1:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-to-the-jew-first-the-scattered-made-sons-of-the-living-elohim'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 1:11 — *then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together … one head* the two houses made one, the end of the gathering Paul''s order reaches (Romans 1:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-to-the-jew-first-the-scattered-made-sons-of-the-living-elohim'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-1-the-just-shall-live-by-his-faith-habakkuk
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 2:4 — *the just shall live by his faith* the prophet''s emunah, covenant faithfulness against the proud soul lifted up, quoted word for word (Romans 1:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-the-just-shall-live-by-his-faith-habakkuk'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 10:38 — *the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* the faith that is life is the faith that does not draw back, the fuller Habakkuk line (Romans 1:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-the-just-shall-live-by-his-faith-habakkuk'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 3:11 — *no man is justified by the law … for, The just shall live by faith* the same prophet pressed: not the law set aside, but no flesh-performance justifies; emunah and the doing of the commandments are not enemies (Romans 1:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-the-just-shall-live-by-his-faith-habakkuk'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-1-the-invisible-things-clearly-seen-the-heavens-declare-his-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:1 — *the heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* the witness that leaves the suppressor without excuse (Romans 1:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-the-invisible-things-clearly-seen-the-heavens-declare-his-glory'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 13:1 — *neither by considering the works did they acknowledge the workmaster* the same indictment Paul presses: the failure is the refusal to read the witness (Romans 1:19).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-the-invisible-things-clearly-seen-the-heavens-declare-his-glory'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:5 — *by the greatness and beauty of the creatures proportionably the maker of them is seen* the creation points past itself to the Creator, clearly seen by the things made (Romans 1:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-the-invisible-things-clearly-seen-the-heavens-declare-his-glory'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-1-changed-the-glory-into-an-image-the-idolatry-descent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 106:20 — *thus they changed their glory into the similitude of an ox that eateth grass* the psalm''s very verb: the worship due the Creator turned toward the made thing (Romans 1:23).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-changed-the-glory-into-an-image-the-idolatry-descent'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:16 — *make you a graven image, the similitude of any figure, the likeness of male or female* the catalogue Paul echoes; Moses'' warning is the apostle''s indictment (Romans 1:23).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-changed-the-glory-into-an-image-the-idolatry-descent'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 4:19 — *the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them* the creation-worship Moses forbade: serving the creature, not the Creator (Romans 1:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-changed-the-glory-into-an-image-the-idolatry-descent'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 14:11 — *the idols of the Gentiles … an abomination, and stumblingblocks to the souls of men* the images of beast and bird Paul names, the made thing become the snare (Romans 1:23).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-changed-the-glory-into-an-image-the-idolatry-descent'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 14:12 — *the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life* the root of the exchange: the lie that serves the creature is the headwaters of the whoredom (Romans 1:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-changed-the-glory-into-an-image-the-idolatry-descent'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-1-given-over-to-a-reprobate-mind-the-collapse-into-uncleanness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 14:22 — *they erred in the knowledge of Yahuah (God) … those so great plagues called they peace* the reprobate mind is the fruit of the rejected knowledge of Elohim (Romans 1:28).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-given-over-to-a-reprobate-mind-the-collapse-into-uncleanness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=28
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 14:25 — *there reigned … blood, manslaughter, theft … corruption, unfaithfulness … perjury* the same catalogue Paul walks; the moral collapse follows the worship of the creature (Romans 1:29).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-given-over-to-a-reprobate-mind-the-collapse-into-uncleanness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 14:27 — *the worshipping of idols … is the beginning, the cause, and the end, of all evil* the whole descent under one verdict; the charge of all flesh that sets up the gathering (Romans 1:32).'
  FROM cross_reference_threads t, cross_references x, _s219_r01_lookup sv, _s219_r01_lookup tv
 WHERE t.slug='romans-1-given-over-to-a-reprobate-mind-the-collapse-into-uncleanness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=1 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
