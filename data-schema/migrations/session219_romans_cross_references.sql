-- =====================================================================
-- Session 219 — Romans FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session219_romans_cross_references.sql
-- =====================================================================

\echo 'session219 — Romans cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_romans_02.sql (S219 Romans 2) -----
-- =====================================================================
-- S219 minion — ROMANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 2.  Tag: r02 (temp view _s219_r02_lookup).  Sort band: 6025-6049, step 3.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
-- thread tier_required = 'extras' if any member is extras, else 'free'.
--
-- WATCHPOINTS (per brief / Red Lines):
--  * 2:6-11 — *who will render to every man according to his deeds* and judgment *of the
--    Yahudi (Jew) first, and also of the Gentile* (2:9-10): the impartial recompense the
--    Tanakh and the Hebrew library proclaim with one voice — never reward-by-flesh-credential,
--    never reward-by-bare-confession, but *according to his deeds.* No respect of persons.
--  * 2:13 — *not the hearers of the law are just before Elohim (God), but the doers of the law
--    shall be justified.* The anti-sola-fide hinge of the whole book: hearing/saying is not
--    enough; the doer is justified. The Master said the same — not the sayer of *Lord, Lord*
--    but the doer of the Father's will enters the kingdom. NOT a freedom-from-Torah verse;
--    its plain force is the opposite.
--  * 2:14-15 — *a law unto themselves … the work of the law written in their hearts.* The
--    dispersed seed with the law written on the heart (Jeremiah 31:33 / Deut 30 promise), NOT
--    Torah-free morality. Carried within the circumcision-of-the-heart thread; not isolated.
--  * 2:25-29 — circumcision *of the heart, in the spirit, and not in the letter.* The promise
--    of Deuteronomy 30:6 and Jeremiah 4:4 — the inward fulfillment of the covenant sign the
--    prophets foretold (Deut 10:16; Jer 9:25-26), NOT the abolition of the sign. The true
--    Yahudi (Jew) is the one circumcised inwardly; *whose praise is not of men, but of
--    Elohim (God).*
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  v.1-5   goodness leadeth to repentance / wrath treasured up
--          Tanakh: none added (forbearance theme carried by extras witnesses below)
--          Extras: Wisdom of Solomon 12:19-21 (forbearance teaches repentance); Ecclesiasticus 5:4-6 (presume not on mercy)
--          NT:     none warranted
--  v.6-11  render according to deeds / to the Jew first / no respect of persons
--          Tanakh: Psalm 62:12; Proverbs 24:12; Deuteronomy 10:17
--          Extras: Ecclesiasticus 16:12; Ecclesiasticus 35:12
--          NT:     none added (the deeds-judgment echoed at Matthew 7 carried in the doers thread)
--  v.12-13 doers, not hearers, justified
--          Tanakh: none added (Deut 30:14 "do it" carried in circumcision thread)
--          Extras: none warranted
--          NT:     Matthew 7:21; Matthew 7:23 (doers vs sayers; *I never knew you*)
--  v.14-16 the work of the law written in their hearts
--          Tanakh: none added (heart-Torah carried in v.25-29 circumcision-of-heart thread)
--          Extras: none warranted
--          NT:     none added
--  v.17-24 boast in the law / dishonour by breaking it / the name blasphemed
--          Tanakh: none warranted (rhetorical indictment; the name-blasphemed echo at v.24 is Isaiah/Ezekiel but not load-bearing as a curated pairing here)
--          Extras: none warranted
--          NT:     none warranted
--  v.25-29 circumcision of the heart, in the spirit
--          Tanakh: Deuteronomy 30:6; Jeremiah 4:4; Jeremiah 9:25-26; Deuteronomy 10:16
--          Extras: none warranted
--          NT:     none added
--
-- THREADS (slug -> target libraries):
--   6025 romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance        (Extras)
--   6028 romans-2-who-will-render-to-every-man-according-to-his-deeds          (Tanakh + Extras)
--   6031 romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified  (NT)
--   6034 romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter    (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s219_r02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance
  ('canon', 'romans', 2, 4, 'apocrypha', 'the-wisdom-of-solomon', 12, 19, 'extras', E'*But by such works have you taught your people that the just man should be merciful, and have made your children to be of a good hope that you give repentance for sins.* (Wisdom of Solomon 12:19). Paul asks, *despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). The Hebrew library already taught it: the forbearance of Elohim (God) is not indifference to sin but the patient space *that you give repentance* — his deliberate longsuffering with his own sons (Wisdom of Solomon 12:21, *with how great circumspection did you judge your own sons*) is the very goodness meant to lead them home, not a license to presume.'),
  ('canon', 'romans', 2, 5, 'apocrypha', 'ecclesiasticus', 5, 5, 'extras', E'*Concerning propitiation, be not without fear to add sin to sin: And say not His mercy is great; he will be pacified for the multitude of my sins: for mercy and wrath come from him, and his indignation resteth upon sinners.* (Ecclesiasticus 5:5-6). This is the very heart Paul rebukes: *after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath* (Romans 2:5). To take the longsuffering of Elohim (God) as permission — *His mercy is great, he will be pacified* — is to add sin to sin and store up wrath; for *mercy and wrath come from him,* and the goodness was given to lead to repentance, not to excuse the impenitent.'),
  -- thread: romans-2-who-will-render-to-every-man-according-to-his-deeds
  ('canon', 'romans', 2, 6, 'canon', 'psalms', 62, 12, 'free', E'*Also unto thee, O Yahuah (Lord), belongeth mercy: for thou renderest to every man according to his work.* (Psalm 62:12). Paul states the standard of the judgment plainly — *who will render to every man according to his deeds* (Romans 2:6) — and it is David''s own confession of how Elohim (God) judges. Mercy belongs to Yahuah (Lord), and so does the rendering according to the work; the two are not opposed. The recompense is by deeds, not by claim.'),
  ('canon', 'romans', 2, 6, 'canon', 'proverbs', 24, 12, 'free', E'*If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* (Proverbs 24:12). The judge *that pondereth the heart* renders *to every man according to his works* — the same standard Paul names: *who will render to every man according to his deeds* (Romans 2:6). No plea of ignorance and no boast of standing moves the One who weighs the heart; the deeds are read, and the recompense follows them.'),
  ('canon', 'romans', 2, 11, 'canon', 'deuteronomy', 10, 17, 'free', E'*For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward:* (Deuteronomy 10:17). *For there is no respect of persons with Elohim (God)* (Romans 2:11) is not a new doctrine but the Torah''s own word: Yahuah Elohaychem (the LORD your God) *regardeth not persons.* This is why judgment falls *of the Yahudi (Jew) first, and also of the Gentile* (Romans 2:9) — the covenant standing of the house of Yahudah (Judah) does not exempt it; the same impartial Judge weighs all by their deeds.'),
  ('canon', 'romans', 2, 6, 'apocrypha', 'ecclesiasticus', 16, 12, 'extras', E'*As his mercy is great, so is his correction also: he judges a man according to his works.* (Ecclesiasticus 16:12). The Hebrew library says it with Paul: *he judges a man according to his works,* as *Elohim (God) … will render to every man according to his deeds* (Romans 2:6). Mercy and correction are both great in him, set side by side — the same Elohim (God) whose goodness leads to repentance is the one who weighs the deeds; the judgment is not arbitrary nor partial but measured to the work.'),
  ('canon', 'romans', 2, 11, 'apocrypha', 'ecclesiasticus', 35, 12, 'extras', E'*Do not think to corrupt with gifts; for such he will not receive: and trust not to unrighteous sacrifices; for Yahuah (God) is judge, and with him is no respect of persons.* (Ecclesiasticus 35:12). Paul''s *there is no respect of persons with Elohim (God)* (Romans 2:11) is the settled word of the Hebrew library — *with him is no respect of persons.* He cannot be bought with gifts nor moved by standing; he hears the oppressed and weighs the deeds. The judgment *to the Yahudi (Jew) first, and also to the Gentile* (Romans 2:10) flows from this impartiality.'),
  -- thread: romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified
  ('canon', 'romans', 2, 13, 'canon', 'matthew', 7, 21, 'free', E'*Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* (Matthew 7:21). Paul''s hinge — *not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified* (Romans 2:13) — is the Master''s own teaching. It is not the one who says *Yahuah (Lord), Yahuah (Lord),* nor the one who merely hears, but the one who *doeth the will of my Father* who enters. Saying and hearing are not the standing; doing is.'),
  ('canon', 'romans', 2, 13, 'canon', 'matthew', 7, 23, 'free', E'*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.* (Matthew 7:23). To the many who said *Yahuah (Lord), Yahuah (Lord)* and prophesied in his name, the word is *I never knew you: depart from me, ye that work iniquity* — workers of lawlessness, hearers and sayers who were not doers. This is exactly the line Paul draws: *the doers of the law shall be justified* (Romans 2:13). The claim of the name without the doing is the iniquity the Master sends away.'),
  -- thread: romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter
  ('canon', 'romans', 2, 29, 'canon', 'deuteronomy', 30, 6, 'free', E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6). When Paul says *circumcision is that of the heart, in the spirit, and not in the letter* (Romans 2:29), he is naming the promise Moses gave at the return from scattering: Yahuah Elohayka (the LORD thy God) himself *will circumcise thine heart … to love* him. The heart-circumcision is not the abolition of the sign but its inward fulfillment — the covenant cut into the heart of the seed so that they may live.'),
  ('canon', 'romans', 2, 29, 'canon', 'jeremiah', 4, 4, 'free', E'*Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart, ye men of Yahudah (Judah) and inhabitants of Jerusalem: lest my fury come forth like fire* (Jeremiah 4:4). The prophet already commanded the inward circumcision Paul preaches — *take away the foreskins of your heart.* So *he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh* (Romans 2:28); the true circumcision is *of the heart* that Jeremiah demanded of the men of Yahudah (Judah) long before, lest the fury of Yahuah (LORD) fall on the uncircumcised heart.'),
  ('canon', 'romans', 2, 28, 'canon', 'jeremiah', 9, 26, 'free', E'*Egypt, and Yahudah (Judah), and Edom, and the children of Ammon, and Moab, and all that are in the utmost corners, that dwell in the wilderness: for all these nations are uncircumcised, and all the house of Yashar''el (Israel) are uncircumcised in the heart.* (Jeremiah 9:26). Jeremiah names the very condition Paul exposes: the house of Yashar''el (Israel) bears the sign in the flesh yet is *uncircumcised in the heart.* So *he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh* (Romans 2:28) — the flesh-mark without the heart-mark is no circumcision at all, the very thing Yahuah (LORD) said he would punish.'),
  ('canon', 'romans', 2, 25, 'canon', 'deuteronomy', 10, 16, 'free', E'*Circumcise therefore the foreskin of your heart, and be no more stiffnecked.* (Deuteronomy 10:16). Paul says *circumcision verily profiteth, if thou keep the law: but if thou be a breaker of the law, thy circumcision is made uncircumcision* (Romans 2:25). The flesh-sign was never meant to stand alone — Moses commanded in the same breath *circumcise … the foreskin of your heart.* The outward sign profits only with the inward reality; without the circumcised heart and the kept law, the flesh-circumcision is counted as uncircumcision.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance',
       E'The riches of his goodness leadeth thee to repentance',
       E'Paul turns on the one who judges another while doing the same, and presses the question: *despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). The longsuffering of Elohim (God) is not indifference; it is the patient space given for return. The Hebrew library taught this plainly: *by such works have you taught your people that the just man should be merciful, and have made your children to be of a good hope that you give repentance for sins* (Wisdom of Solomon 12:19), for *with how great circumspection did you judge your own sons* (Wisdom of Solomon 12:21). But the same library warns against turning that mercy into a license: *say not His mercy is great; he will be pacified for the multitude of my sins: for mercy and wrath come from him, and his indignation resteth upon sinners* (Ecclesiasticus 5:6). To do so is the hardness Paul names: *after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God)* (Romans 2:5). The goodness is real and it has a direction — it leads to repentance; refuse the direction and the same goodness becomes stored-up wrath.',
       sv.verse_id, ev.verse_id, 'extras', 6025
  FROM _s219_r02_lookup sv, _s219_r02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-2-who-will-render-to-every-man-according-to-his-deeds',
       E'Who will render to every man according to his deeds',
       E'Paul states the rule of the judgment without softening it: Elohim (God) *will render to every man according to his deeds* (Romans 2:6), with *tribulation and anguish, upon every soul of man that doeth evil, of the Yahudi (Jew) first, and also of the Gentile* (Romans 2:9) and *glory, honour, and peace, to every man that worketh good, to the Yahudi (Jew) first, and also to the Gentile* (Romans 2:10) — *for there is no respect of persons with Elohim (God)* (Romans 2:11). None of this is new. David confessed it: *thou renderest to every man according to his work* (Psalm 62:12). The proverb pressed it on the one who pleads ignorance: *he that pondereth the heart … shall not he render to every man according to his works?* (Proverbs 24:12). The Torah grounded the impartiality: Yahuah Elohaychem (the LORD your God) *regardeth not persons, nor taketh reward* (Deuteronomy 10:17). And the Hebrew library said it with one voice: *he judges a man according to his works* (Ecclesiasticus 16:12), *for Yahuah (God) is judge, and with him is no respect of persons* (Ecclesiasticus 35:12). The covenant standing of Yahudah (Judah) does not exempt — judgment comes *to the Yahudi (Jew) first* — because the Judge is no respecter of persons and reads the deeds, not the claim.',
       sv.verse_id, ev.verse_id, 'extras', 6028
  FROM _s219_r02_lookup sv, _s219_r02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified',
       E'Not the hearers but the doers of the law shall be justified',
       E'Here is the hinge of the whole book, and it cuts against every reading that makes standing a matter of claim rather than walk: *not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified* (Romans 2:13). To hear is not to be justified; to say is not to be justified; the doer is justified. This is the Master''s own teaching, word for word in substance: *not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven* (Matthew 7:21). And to those who pile up the right words and the works done in his name, yet were hearers and sayers and not doers, the verdict is *I never knew you: depart from me, ye that work iniquity* (Matthew 7:23). The lawlessness is precisely the gap between the saying and the doing. Paul and the Master draw the same line: the law heard, the name confessed, the boast made — none of it justifies; *the doers of the law shall be justified.*',
       sv.verse_id, ev.verse_id, 'free', 6031
  FROM _s219_r02_lookup sv, _s219_r02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter',
       E'Circumcision of the heart, in the spirit, not in the letter',
       E'Paul ends the chapter by distinguishing the outward sign from the inward reality: *circumcision verily profiteth, if thou keep the law: but if thou be a breaker of the law, thy circumcision is made uncircumcision* (Romans 2:25), and *he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God)* (Romans 2:29). This is not the abolition of the covenant sign — it is the inward fulfillment the prophets foretold. Moses commanded it in the same breath as the flesh-sign: *circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). At the return from scattering he promised Yahuah Elohayka (the LORD thy God) would do it himself: *Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart … that thou mayest live* (Deuteronomy 30:6). Jeremiah pressed the same on Yahudah (Judah): *take away the foreskins of your heart, ye men of Yahudah (Judah)* (Jeremiah 4:4), and named the failure exactly — *all the house of Yashar''el (Israel) are uncircumcised in the heart* (Jeremiah 9:26). The flesh-mark without the heart-mark is no circumcision at all. Paul is not cutting the sign away; he is naming the heart-circumcision the whole library always demanded.',
       sv.verse_id, ev.verse_id, 'free', 6034
  FROM _s219_r02_lookup sv, _s219_r02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=2 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 12:19 — *you give repentance for sins* the forbearance of Elohim (God) is the space for return, his goodness leading to repentance (Romans 2:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 5:5-6 — *say not His mercy is great; he will be pacified … for mercy and wrath come from him* the warning against the impenitent heart that treasures up wrath (Romans 2:5).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-2-who-will-render-to-every-man-according-to-his-deeds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 62:12 — *thou renderest to every man according to his work* David''s confession of the standard Paul names (Romans 2:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=62 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 24:12 — *shall not he render to every man according to his works?* the One who ponders the heart reads the deeds, no plea of ignorance availing (Romans 2:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 10:17 — *which regardeth not persons, nor taketh reward* the Torah''s ground for *no respect of persons* and judgment to the Yahudi (Jew) first (Romans 2:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 16:12 — *he judges a man according to his works* mercy and correction both great in him, the deeds weighed (Romans 2:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 35:12 — *Yahuah (God) is judge, and with him is no respect of persons* the impartiality Paul names, unbought by gifts or standing (Romans 2:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:21 — *not every one that saith unto me, Yahuah (Lord), Yahuah (Lord) … but he that doeth the will of my Father* the Master''s line: the doer, not the sayer, enters (Romans 2:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:23 — *I never knew you: depart from me, ye that work iniquity* the verdict on hearers and sayers who were not doers (Romans 2:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:6 — *Yahuah Elohayka (the LORD thy God) will circumcise thine heart … that thou mayest live* the promise of heart-circumcision at the return, the inward fulfillment of the sign (Romans 2:29).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 4:4 — *take away the foreskins of your heart, ye men of Yahudah (Judah)* the prophet''s command for the very heart-circumcision Paul preaches (Romans 2:29).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 9:26 — *all the house of Yashar''el (Israel) are uncircumcised in the heart* the flesh-mark without the heart-mark, exactly what Paul exposes (Romans 2:28).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 10:16 — *circumcise therefore the foreskin of your heart, and be no more stiffnecked* the heart-sign Moses commanded alongside the flesh-sign, without which circumcision profits nothing (Romans 2:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_romans_03.sql (S219 Romans 3) -----
-- =====================================================================
-- S219 minion — ROMANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 3.  Tag: r03 (temp view _s219_r03_lookup).  Sort band: 6050, step 3 (<6075).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #2/#4/#5/#6/#7/#10): Paul, a Torah-keeping Yashar'elite, presses
-- the indictment of all flesh — *both Yahudim (Jews) and Gentiles, that they are all under sin*
-- (3:9) — by stringing a chain of his own Tanakh (Psalm 14/53, Psalm 5, Psalm 140, Psalm 10,
-- Isaiah 59, Psalm 36). The advantage of the Yahudi (Jew) is real: *unto them were committed the
-- oracles of Elohim (God)* (3:2) — the dispersed seed still entrusted with the word. "The law"
-- that justifies no flesh (3:20) is the law as a system of self-justification apart from the
-- faithfulness of Messiah — NEVER the law as Yahuah's righteous instruction to be discarded.
-- *Justified freely by his grace* (3:24) is grace as the means of return, never a standalone
-- freedom-from-Torah formula. The righteousness of Elohim is *witnessed by the law and the
-- prophets* (3:21) — rooted in the Tanakh. And the verse that governs the whole book seals it:
-- *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law*
-- (3:31) — faith establishes Torah, it never abolishes it.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   advantage of the Yahudi / oracles committed   Tanakh: Deuteronomy 4:7-8, Psalm 147:19-20  Extras: none warranted  NT: none added (entrusting carried by Tanakh targets)
--   v.5-8   shall their unbelief make Elohim's faith void  Tanakh: Psalm 51:4 (justified in thy sayings, judged)  Extras: none warranted  NT: none warranted (rhetorical objection answered in-chapter)
--   v.9-18  none righteous — the catena                    Tanakh: Psalm 14:1-3 / Psalm 53, Psalm 5:9, Psalm 140:3, Psalm 10:7, Isaiah 59:7-8, Psalm 36:1  Extras: none warranted  NT: none warranted
--   v.19-20 no flesh justified by deeds of the law         Tanakh: Psalm 143:2  Extras: none warranted  NT: Galatians 2:16 (no flesh justified by works of law)
--   v.21-26 righteousness witnessed by law and prophets / justified freely by grace / propitiation  Tanakh: Psalm 51:1, Psalm 32:1-2 weighed→carried at Romans 4 by sibling; Psalm 51 chosen  Extras: none warranted  NT: none added (kept Tanakh + the grace/propitiation read in summary)
--   v.27-30 boasting excluded / one Elohim of both          Tanakh: Deuteronomy 6:4 (one Elohim) weighed; Deuteronomy 9:5 (not for thy righteousness)  Extras: none warranted  NT: none added (two-house one-Elohim read carried in prose)
--   v.31    do we make void the law? we establish the law   Tanakh: none added (the establishing is of the Tanakh law itself)  Extras: none warranted  NT: Romans 6:15, Romans 8:4, Matthew 5:17
--
-- THREADS (slug -> target libraries):
--   6050 romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage          (Tanakh)
--   6053 romans-3-there-is-none-righteous-no-not-one-the-catena                      (Tanakh)
--   6056 romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight            (Tanakh + NT)
--   6059 romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets  (Tanakh)
--   6062 romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both     (Tanakh)
--   6065 romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law            (NT / Romans-Romans + Matthew)
-- =====================================================================

CREATE TEMP VIEW _s219_r03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage
  ('canon', 'romans', 3, 2, 'canon', 'deuteronomy', 4, 8, 'free', E'*And what nation is there so great, that hath statutes and judgments so righteous as all this law, which I set before you this day?* (Deuteronomy 4:8). Paul answers his own question — *What advantage then hath the Yahudi (Jew)?* (Romans 3:1) — with *Much every way: chiefly, because that unto them were committed the oracles of Elohim (God)* (Romans 3:2). The advantage is precisely the thing Moses named: the righteous statutes and judgments of the law, given to no other nation. The word entrusted to Yashar''el (Israel) is the dignity, not a thing outgrown.'),
  ('canon', 'romans', 3, 2, 'canon', 'deuteronomy', 4, 7, 'free', E'*For what nation is there so great, who hath Elohim (God) so nigh unto them, as Yahuah Eloheinu (the LORD our God) is in all things that we call upon him for?* (Deuteronomy 4:7). The oracles *committed* to the Yahudi (Jew) (Romans 3:2) are the nearness Moses celebrated — no nation had Elohim so nigh, because no nation was given his word. The advantage of the Yahudi is the covenant nearness carried in the entrusted oracles.'),
  ('canon', 'romans', 3, 2, 'canon', 'psalms', 147, 19, 'free', E'*He sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel).* (Psalm 147:19). The oracles *committed* to the Yahudi (Jew) (Romans 3:2) are this very gift — the word, the statutes, the judgments shewn to Jacob and to no nation besides (Psalm 147:20). The dispersed seed remains the keeper of the deposit; the entrusting is not revoked by some who *did not believe* (Romans 3:3).'),
  -- thread: romans-3-shall-their-unbelief (woven into the oracles thread via 3:4)
  ('canon', 'romans', 3, 4, 'canon', 'psalms', 51, 4, 'free', E'*Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest.* (Psalm 51:4). *Let Elohim (God) be true, but every man a liar; as it is written, That thou mightest be justified in thy sayings, and mightest overcome when thou art judged* (Romans 3:4). Paul quotes David''s confession word for word: the unbelief of men cannot *make the faith of Elohim (God) without effect* (Romans 3:3) — Elohim stands justified in his sayings, true though every man be a liar.'),
  -- thread: romans-3-there-is-none-righteous-no-not-one-the-catena
  ('canon', 'romans', 3, 10, 'canon', 'psalms', 14, 1, 'free', E'*The fool hath said in his heart, There is no Elohim (God). They are corrupt, they have done abominable works, there is none that doeth good.* (Psalm 14:1). *As it is written, There is none righteous, no, not one* (Romans 3:10). Paul opens his chain with the psalm''s own verdict: the heart that says *There is no Elohim* leaves none that doeth good. The indictment falls on all flesh, *both Yahudim (Jews) and Gentiles* (Romans 3:9).'),
  ('canon', 'romans', 3, 11, 'canon', 'psalms', 14, 2, 'free', E'*Yahuah (LORD) looked down from heaven upon the children of men, to see if there were any that did understand, and seek Elohim (God).* (Psalm 14:2). *There is none that understandeth, there is none that seeketh after Elohim (God)* (Romans 3:11). Paul presses the psalm''s search: Yahuah looked down to find the understanding heart that seeks him, and the verdict is the one Paul carries — none that understandeth, none that seeketh.'),
  ('canon', 'romans', 3, 12, 'canon', 'psalms', 14, 3, 'free', E'*They are all gone aside, they are all together become filthy: there is none that doeth good, no, not one.* (Psalm 14:3). *They are all gone out of the way, they are together become unprofitable; there is none that doeth good, no, not one* (Romans 3:12). Paul takes the psalm''s words nearly intact — all gone aside, none that doeth good, no, not one. The sweep is total, that *every mouth may be stopped* (Romans 3:19).'),
  ('canon', 'romans', 3, 12, 'canon', 'psalms', 53, 3, 'free', E'*Every one of them is gone back: they are altogether become filthy; there is none that doeth good, no, not one.* (Psalm 53:3). The twin psalm carries the same verdict Paul cites — *there is none that doeth good, no, not one* (Romans 3:12) — and ends, like its companion, longing for *the salvation of Yashar''el (Israel) … out of Zion* (Psalm 53:6). The universal indictment is the ground on which the gathering of the scattered is announced.'),
  ('canon', 'romans', 3, 13, 'canon', 'psalms', 5, 9, 'free', E'*For there is no faithfulness in their mouth; their inward part is very wickedness; their throat is an open sepulchre; they flatter with their tongue.* (Psalm 5:9). *Their throat is an open sepulchre; with their tongues they have used deceit* (Romans 3:13). Paul lifts the psalm''s figure straight off the page — the open sepulchre, the deceiving tongue — to show the corruption that reaches even the mouth.'),
  ('canon', 'romans', 3, 13, 'canon', 'psalms', 140, 3, 'free', E'*They have sharpened their tongues like a serpent; adders'' poison is under their lips. Selah.* (Psalm 140:3). *the poison of asps is under their lips* (Romans 3:13). Paul joins David''s next image to the open sepulchre: the serpent''s venom under the lips. The tongue that flatters and the lips that poison are one witness against all flesh.'),
  ('canon', 'romans', 3, 14, 'canon', 'psalms', 10, 7, 'free', E'*His mouth is full of cursing and deceit and fraud: under his tongue is mischief and vanity.* (Psalm 10:7). *Whose mouth is full of cursing and bitterness* (Romans 3:14). Paul draws the cursing mouth from the psalm of the wicked who says *Elohim (God) hath forgotten* (Psalm 10:11). The bitterness on the lips is the overflow of the heart that will not seek Elohim.'),
  ('canon', 'romans', 3, 15, 'canon', 'isaiah', 59, 7, 'free', E'*Their feet run to evil, and they make haste to shed innocent blood: their thoughts are thoughts of iniquity; wasting and destruction are in their paths.* (Isaiah 59:7). *Their feet are swift to shed blood: Destruction and misery are in their ways* (Romans 3:15-16). Paul moves from the psalms to the prophet, and Isaiah''s words become his — feet that run to blood, destruction in the paths. The same indictment the prophet brought against Yashar''el''s own sins Paul brings against all flesh.'),
  ('canon', 'romans', 3, 17, 'canon', 'isaiah', 59, 8, 'free', E'*The way of peace they know not; and there is no judgment in their goings: they have made them crooked paths: whosoever goeth therein shall not know peace.* (Isaiah 59:8). *And the way of peace have they not known* (Romans 3:17). Paul carries Isaiah''s very phrase. And Isaiah''s chapter ends where Paul''s whole letter is heading: *the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob* (Isaiah 59:20) — the indictment is the ground of the redemption, not the last word.'),
  ('canon', 'romans', 3, 18, 'canon', 'psalms', 36, 1, 'free', E'*The transgression of the wicked saith within my heart, that there is no fear of Elohim (God) before his eyes.* (Psalm 36:1). *There is no fear of Elohim (God) before their eyes* (Romans 3:18). Paul seals the catena with the psalm''s diagnosis: the root of the whole descent is the missing fear of Elohim. From the corrupt heart to the poisoned tongue to the bloody feet, it all traces to eyes that hold no fear of him.'),
  -- thread: romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight
  ('canon', 'romans', 3, 20, 'canon', 'psalms', 143, 2, 'free', E'*And enter not into judgment with thy servant: for in thy sight shall no man living be justified.* (Psalm 143:2). *Therefore by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin* (Romans 3:20). Paul echoes David''s plea: no man living is justified in Yahuah''s sight by his own performance. The law gives the *knowledge of sin* — it shows the man his guilt; it was never the ladder by which flesh climbs into right standing.'),
  ('canon', 'romans', 3, 20, 'canon', 'galatians', 2, 16, 'free', E'*Knowing that a man is not justified by the works of the law, but by the faith of Yahusha HaMashiach (Jesus Christ), even we have believed in HaMashiach Yahusha (Christ Jesus), that we might be justified by the faith of Messiah (Christ), and not by the works of the law: for by the works of the law shall no flesh be justified.* (Galatians 2:16). The same word stands here as at *by the deeds of the law there shall no flesh be justified in his sight* (Romans 3:20). The *works of the law* that justify no flesh are the flesh-performance system of self-justification apart from the faithfulness of Messiah — not the righteous instruction of Yahuah, which the same Paul will say faith *establishes* (Romans 3:31).'),
  -- thread: romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets
  ('canon', 'romans', 3, 21, 'canon', 'isaiah', 59, 16, 'free', E'*And he saw that there was no man, and wondered that there was no intercessor: therefore his arm brought salvation unto him; and his righteousness, it sustained him.* (Isaiah 59:16). *But now the righteousness of Elohim (God) without the law is manifested, being witnessed by the law and the prophets* (Romans 3:21). Isaiah saw it: when there was no man, Yahuah''s own arm brought salvation and his own righteousness sustained him. The righteousness manifested apart from law-as-self-justification is the very righteousness the prophet witnessed — Yahuah himself supplying what no flesh could.'),
  ('canon', 'romans', 3, 24, 'canon', 'psalms', 51, 1, 'free', E'*Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions.* (Psalm 51:1). *Being justified freely by his grace through the redemption that is in HaMashiach Yahusha (Christ Jesus)* (Romans 3:24). David already knew the ground of pardon was not his merit but Elohim''s lovingkindness — *blot out my transgressions* by tender mercy. Grace is the means of return to him: the unmerited mercy that brings the guilty home, not a license to walk on.'),
  ('canon', 'romans', 3, 25, 'canon', 'psalms', 51, 17, 'free', E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* (Psalm 51:17). Elohim *set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins that are past* (Romans 3:25). The propitiation does not bypass the broken and contrite heart the psalm names — it is the blood that declares Elohim''s righteousness even as he remits, so that he is *just, and the justifier* (Romans 3:26), receiving the contrite without winking at the sin.'),
  -- thread: romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both
  ('canon', 'romans', 3, 27, 'canon', 'deuteronomy', 9, 5, 'free', E'*Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land … that he may perform the word which Yahuah (LORD) sware unto thy fathers, Abraham, Isaac, and Jacob.* (Deuteronomy 9:5). *Where is boasting then? It is excluded* (Romans 3:27). The exclusion of boasting is no new doctrine — Moses already told Yashar''el (Israel) the land was not earned by their righteousness but given on the oath to the fathers. The covenant was always grace toward the seed of promise; the flesh never had ground to boast.'),
  ('canon', 'romans', 3, 30, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (the LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). *Seeing it is one Elohim (God), which shall justify the circumcision by faith, and uncircumcision through faith* (Romans 3:30). Paul grounds the justifying of both in the Shema''s own confession: there is one Elohim. The circumcision (the house of Yahudah) and the uncircumcision (the scattered seed living among the nations) are justified by the one Elohim through one faithfulness — not two gods, not two gospels, the one covenant Elohim gathering his own.'),
  -- thread: romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law
  ('canon', 'romans', 3, 31, 'canon', 'romans', 6, 15, 'free', E'*What then? shall we sin, because we are not under the law, but under grace? Elohim (God) forbid.* (Romans 6:15). The same *Elohim (God) forbid* answers the same false inference: faith does not *make void the law* (Romans 3:31), and grace does not license sin (Romans 6:15). *Not under the law* means not under the law''s condemnation as a justifying system — never freedom to transgress it. The faithful are *made free from sin* to *become servants to Elohim (God)* (Romans 6:22).'),
  ('canon', 'romans', 3, 31, 'canon', 'romans', 8, 4, 'free', E'*That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* (Romans 8:4). This is how faith *establishes the law* (Romans 3:31): the Spirit writes and fulfils the righteousness of the law in the one who walks after the Spirit. What the law could not do through weak flesh, Elohim does by sending his Son and his Spirit — the Torah is not abolished but fulfilled in the walker. Faith and Spirit-led obedience are one work.'),
  ('canon', 'romans', 3, 31, 'canon', 'matthew', 5, 17, 'free', E'*Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* (Matthew 5:17). The Master said it first, and Paul echoes it exactly: *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31). The gospel does not destroy the law — not one jot or tittle passes (Matthew 5:18). Faith confirms the very instruction the King came to fulfil; to read Paul as voiding Torah is to set him against his own Master and his own word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage',
       E'The oracles of Elohim (God) committed to the Yahudi (Jew) — the advantage',
       E'Paul opens the chapter with the question the whole book must answer: *What advantage then hath the Yahudi (Jew)? or what profit is there of circumcision?* (Romans 3:1). His answer is emphatic: *Much every way: chiefly, because that unto them were committed the oracles of Elohim (God)* (Romans 3:2). The advantage is the deposit of the word — the very thing Moses celebrated: *what nation is there so great, who hath Elohim (God) so nigh unto them, as Yahuah Eloheinu (the LORD our God) is in all things that we call upon him for?* (Deuteronomy 4:7), and *what nation is there so great, that hath statutes and judgments so righteous as all this law?* (Deuteronomy 4:8). The psalmist named the same gift to no nation besides: *he sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* (Psalm 147:19). And the unbelief of some does not annul the trust: *shall their unbelief make the faith of Elohim (God) without effect? Elohim (God) forbid* (Romans 3:3-4) — *let Elohim (God) be true, but every man a liar; as it is written, That thou mightest be justified in thy sayings* (Romans 3:4), David''s own confession: *that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4). The entrusted word stands; the dispersed seed remains its keeper.',
       sv.verse_id, ev.verse_id, 'free', 6050
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-there-is-none-righteous-no-not-one-the-catena',
       E'There is none righteous, no, not one — the catena',
       E'Having *before proved both Yahudim (Jews) and Gentiles, that they are all under sin* (Romans 3:9), Paul proves it not by his own authority but by stringing together his own Tanakh — a chain of psalms and the prophet, every link quoted from the scriptures Yashar''el (Israel) already held. *As it is written, There is none righteous, no, not one* (Romans 3:10): the psalm''s verdict, *the fool hath said in his heart, There is no Elohim (God) … there is none that doeth good* (Psalm 14:1). *There is none that understandeth, there is none that seeketh after Elohim (God)* (Romans 3:11) — *Yahuah (LORD) looked down from heaven … to see if there were any that did understand, and seek Elohim (God)* (Psalm 14:2). *They are all gone out of the way … there is none that doeth good, no, not one* (Romans 3:12) — *they are all gone aside … there is none that doeth good, no, not one* (Psalm 14:3), the twin of *every one of them is gone back* (Psalm 53:3). Then the mouth: *their throat is an open sepulchre; with their tongues they have used deceit* (Romans 3:13) — *their throat is an open sepulchre; they flatter with their tongue* (Psalm 5:9) — *the poison of asps is under their lips* — *adders'' poison is under their lips* (Psalm 140:3). *Whose mouth is full of cursing and bitterness* (Romans 3:14) — *his mouth is full of cursing and deceit and fraud* (Psalm 10:7). Then the feet and the way: *their feet are swift to shed blood* (Romans 3:15) — *their feet run to evil, and they make haste to shed innocent blood* (Isaiah 59:7); *the way of peace have they not known* (Romans 3:17) — *the way of peace they know not* (Isaiah 59:8). And the root of it all: *there is no fear of Elohim (God) before their eyes* (Romans 3:18) — *there is no fear of Elohim (God) before his eyes* (Psalm 36:1). The indictment is total and it is the Tanakh''s own — and the psalms and the prophet that carry it each end looking toward home: *oh that the salvation of Yashar''el (Israel) were come out of Zion!* (Psalm 53:6); *the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob* (Isaiah 59:20). The charge of all flesh is the ground on which the gathering is announced.',
       sv.verse_id, ev.verse_id, 'free', 6053
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight',
       E'By the deeds of the law no flesh justified in his sight',
       E'*Now we know that what things soever the law saith, it saith to them who are under the law: that every mouth may be stopped, and all the world may become guilty before Elohim (God)* (Romans 3:19). The catena has done its work — every mouth stopped — and Paul draws the conclusion: *therefore by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin* (Romans 3:20). This is David''s own plea: *enter not into judgment with thy servant: for in thy sight shall no man living be justified* (Psalm 143:2). No man stands acquitted before Yahuah on the strength of his own performance — the law''s work here is to *give the knowledge of sin,* to show the man his guilt, never to be the ladder flesh climbs into right standing. Paul says the same word to the Galatians: *a man is not justified by the works of the law … for by the works of the law shall no flesh be justified* (Galatians 2:16). The *works of the law* that justify no flesh are the flesh-performance system of self-justification apart from the faithfulness of Messiah (Christ) — not the righteous instruction of Yahuah, which the same Paul will say faith *establishes* (Romans 3:31). The deeds-of-the-law that cannot justify and the law that faith establishes are not the same thing read two ways; they are self-justification rejected and the covenant instruction upheld.',
       sv.verse_id, ev.verse_id, 'free', 6056
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets',
       E'The righteousness of Elohim (God) witnessed by the law and the prophets',
       E'*But now the righteousness of Elohim (God) without the law is manifested, being witnessed by the law and the prophets* (Romans 3:21). The righteousness that justifies is *without the law* — apart from the system of flesh-performance — yet it is *witnessed by the law and the prophets:* it is no new thing, but the very righteousness the Tanakh foretold. Isaiah saw it: when *there was no man, and … no intercessor: therefore his arm brought salvation unto him; and his righteousness, it sustained him* (Isaiah 59:16) — Yahuah himself supplying what no flesh could. And so *all have sinned, and come short of the glory of Elohim (God); being justified freely by his grace through the redemption that is in HaMashiach Yahusha (Christ Jesus)* (Romans 3:23-24). The grace is not a standalone freedom-from-Torah formula — it is the means of return, the unmerited mercy that brings the guilty home, which David already knew: *have mercy upon me, O Elohim (God), according to thy lovingkindness … blot out my transgressions* (Psalm 51:1). Elohim *set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins that are past* (Romans 3:25) — and the propitiation does not bypass the contrite heart the psalm names: *the sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart … thou wilt not despise* (Psalm 51:17). The blood declares Elohim''s righteousness even as he remits, so that he is *just, and the justifier of him which believeth in Yahusha (Jesus)* (Romans 3:26) — receiving the contrite without ever winking at the sin.',
       sv.verse_id, ev.verse_id, 'free', 6059
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both',
       E'Not for thy righteousness — boasting excluded, one Elohim (God) of both',
       E'*Where is boasting then? It is excluded. By what law? of works? Nay: but by the law of faith* (Romans 3:27). The exclusion of boasting is no novelty Paul invents — Moses had already told Yashar''el (Israel) the inheritance was never earned: *not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land … that he may perform the word which Yahuah (LORD) sware unto thy fathers, Abraham, Isaac, and Jacob* (Deuteronomy 9:5). The covenant was always grace toward the seed of promise; the flesh never had ground to boast. *Therefore we conclude that a man is justified by faith without the deeds of the law* (Romans 3:28) — justified by the faithfulness that lays hold of the promise, not by a performance-credential. And the one Elohim justifies both houses: *is he the Elohim (God) of the Yahudim (Jews) only? is he not also of the Gentiles?* (Romans 3:29) — *seeing it is one Elohim (God), which shall justify the circumcision by faith, and uncircumcision through faith* (Romans 3:30). This is the Shema''s own confession: *Yahuah Eloheinu (the LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4). The circumcision is the house of Yahudah (Judah); the uncircumcision is the scattered seed living among the nations, the dispersed of the ten tribes. One covenant Elohim justifies them by one faithfulness — not two gods, not two gospels, but the one Elohim gathering his own from both houses.',
       sv.verse_id, ev.verse_id, 'free', 6062
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law',
       E'Do we make void the law? Elohim (God) forbid — we establish the law',
       E'This single verse governs the entire epistle: *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31). Paul anticipates the lie that has been read into him for seventeen centuries — that faith abolishes the Torah — and he slams the door on it with the same *Elohim (God) forbid* he uses against every false inference in the letter. Faith does not void the law; faith *establishes* it. The Master said it first and Paul echoes him exactly: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* (Matthew 5:17) — *one jot or one tittle shall in no wise pass from the law, till all be fulfilled* (Matthew 5:18). To read Paul as voiding Torah is to set him against his own Master and his own word. And Paul walks the same ground again: when the inference returns — *shall we sin, because we are not under the law, but under grace?* — the answer is the same, *Elohim (God) forbid* (Romans 6:15); *not under the law* means not under its condemnation as a justifying system, never freedom to transgress, for the faithful are *made free from sin* to *become servants to Elohim (God)* (Romans 6:22). And he shows how faith establishes the law: *that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). The Spirit writes and fulfils the very Torah in the walker — what the law could not do through weak flesh, Elohim does by his Son and his Spirit. Faith establishes the law; grace is the means of return to it; the Spirit fulfils it. The book never abolishes the commandments — it brings the faithful home to walk in them.',
       sv.verse_id, ev.verse_id, 'free', 6065
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:8 — *what nation … hath statutes and judgments so righteous as all this law?* the advantage of the Yahudi (Jew): the righteous law given to no other nation (Romans 3:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:7 — *what nation … hath Elohim (God) so nigh unto them, as Yahuah Eloheinu (the LORD our God)* the covenant nearness carried in the entrusted oracles (Romans 3:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 147:19 — *he sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* the oracles committed: the word shewn to Jacob and no nation besides (Romans 3:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 51:4 — *that thou mightest be justified when thou speakest, and be clear when thou judgest* quoted at Romans 3:4: Elohim true though every man a liar; unbelief cannot void his faith (Romans 3:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-there-is-none-righteous-no-not-one-the-catena
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 14:1 — *the fool hath said in his heart, There is no Elohim (God) … there is none that doeth good* the catena''s opening verdict (Romans 3:10).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 14:2 — *Yahuah (LORD) looked down … to see if there were any that did understand, and seek Elohim (God)* none that understandeth, none that seeketh (Romans 3:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 14:3 — *they are all gone aside … there is none that doeth good, no, not one* taken nearly intact: the total sweep (Romans 3:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 53:3 — *every one of them is gone back … there is none that doeth good, no, not one* the twin psalm, ending toward salvation out of Zion (Romans 3:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 5:9 — *their throat is an open sepulchre; they flatter with their tongue* the open sepulchre and deceiving tongue (Romans 3:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 140:3 — *adders'' poison is under their lips* the serpent''s venom joined to the open sepulchre (Romans 3:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=140 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Psalm 10:7 — *his mouth is full of cursing and deceit and fraud* the cursing mouth of the wicked who says Elohim hath forgotten (Romans 3:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Isaiah 59:7 — *their feet run to evil, and they make haste to shed innocent blood … destruction are in their paths* feet swift to blood, destruction in the ways (Romans 3:15-16).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Isaiah 59:8 — *the way of peace they know not* the prophet''s phrase carried; his chapter ends with the Redeemer come to Zion (Romans 3:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Psalm 36:1 — *there is no fear of Elohim (God) before his eyes* the root of the whole descent, sealing the catena (Romans 3:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=36 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 143:2 — *in thy sight shall no man living be justified* David''s plea: no flesh acquitted by its own performance (Romans 3:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=143 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 2:16 — *by the works of the law shall no flesh be justified* the same word: works-of-law is self-justification, not Torah, which faith establishes (Romans 3:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 59:16 — *his arm brought salvation unto him; and his righteousness, it sustained him* the righteousness the prophet witnessed: Yahuah supplying what no flesh could (Romans 3:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 51:1 — *have mercy upon me … according to thy lovingkindness … blot out my transgressions* grace as the means of return: pardon grounded in mercy, not merit (Romans 3:24).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:17 — *a broken and a contrite heart … thou wilt not despise* the propitiation does not bypass the contrite heart; just and justifier together (Romans 3:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 9:5 — *not for thy righteousness … but … that he may perform the word which Yahuah (LORD) sware unto thy fathers* boasting excluded: the inheritance was always grace, not merit (Romans 3:27).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:4 — *Yahuah Eloheinu (the LORD our God) is one Yahuah (LORD)* the Shema: one Elohim justifies circumcision and uncircumcision, both houses, by one faithfulness (Romans 3:30).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:17 — *I am not come to destroy, but to fulfil* the Master said it first; Paul echoes him: faith does not void the law (Romans 3:31).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 6:15 — *shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* the same false inference, the same answer; not-under-law is not freedom to transgress (Romans 3:31).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:4 — *that the righteousness of the law might be fulfilled in us, who walk … after the Spirit* how faith establishes the law: the Spirit fulfils the Torah in the walker (Romans 3:31).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_romans_04.sql (S219 Romans 4) -----
-- =====================================================================
-- S219 minion — ROMANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ROMANS 4.  Tag: r04 (temp view _s219_r04_lookup).  Sort band: 6075-6099, step 3.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#7/#10, faith = faithfulness):
--  Paul is a Torah-keeping Israelite holding up Abraham as the pattern for the gathered
--  assembly at Rome. Abraham *believed Elohim (God), and it was counted unto him for
--  righteousness* (4:3) — but Abraham's faith WAS faithfulness: he *obeyed my voice, and kept
--  my charge, my commandments, my statutes, and my laws* (Genesis 26:5), and *when he was
--  proved, he was found faithful* (Sirach 44:20; 1 Maccabees 2:52). The *not of works* of
--  Romans 4 is against self-justification (the flesh-credential boast, 4:2), NEVER against
--  obedience and never the abolition of Torah. Circumcision is *a seal of the righteousness
--  of the faith* (4:11) — the token of the covenant (Genesis 17:11), not the cause of the
--  righteousness. Abraham is *the father of us all* (4:16), *a father of many nations*
--  (4:17 / Genesis 17:5), and his seed — scattered as the stars and the sand — are reckoned
--  his children, the two houses gathered. The chapter closes on the Formed *raised again for
--  our justification* (4:25): the One who *quickeneth the dead* (4:17) is the God who returned
--  Isaac to Abraham as from the dead (Genesis 22) and who raised up Yahusha (Jesus).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  v.1-5   Abraham believed / counted for righteousness / justifieth the ungodly
--          Tanakh: Genesis 15:6 (believed and counted), Genesis 26:5 (kept my commandments — faith as faithfulness)
--          Extras: Sirach 44:19-21 (kept the law, found faithful when proved); 1 Maccabees 2:52 (found faithful in temptation, imputed for righteousness)
--          NT:     Romans 4:22 (Romans<->Romans, the same imputed-for-righteousness restated)
--  v.6-8   the blessedness David describes / Yahuah imputeth not sin
--          Tanakh: Psalm 32:1, Psalm 32:2 (the exact citation, blessed/forgiven/covered/imputeth not iniquity)
--          Extras: none warranted   NT: none warranted
--  v.9-12  reckoned in uncircumcision / a seal of the righteousness of the faith
--          Tanakh: Genesis 17:10, Genesis 17:11 (circumcision a token of the covenant — the seal, not the cause)
--          Extras: none warranted (Sirach 44:20 *established the covenant in his flesh* carried in thread 1)   NT: none warranted
--  v.13-17a the promise to the seed / heir of the world / a father of many nations
--          Tanakh: Genesis 17:4, Genesis 17:5 (a father of many nations); Genesis 15:5 (so shall thy seed be — carried v.18 block); Genesis 22:18 (in thy seed all nations blessed, because thou hast obeyed)
--          Extras: none warranted   NT: none warranted (the law-worketh-wrath / Deut-28-curse weighed; carried in Romans 3 & 5 packs, not re-added)
--  v.17b-22 quickeneth the dead / against hope believed / so shall thy seed be / fully persuaded
--          Tanakh: Genesis 15:5 (look toward heaven, so shall thy seed be); Genesis 17:17 (Abraham's own body / Sarah's deadness)
--          Extras: none warranted   NT: none warranted (4:22 imputed-for-righteousness carried in thread 1)
--  v.23-25 for us also / raised up Yahusha / delivered for offences, raised for justification
--          Tanakh: Genesis 22:8 (Elohim will provide himself a lamb), Genesis 22:13 (the ram in the stead) — the bound son received back as from the dead, the Aqedah figure of the resurrection
--          Extras: none warranted   NT: none added (Isaiah 53 / the Lamb carried in the Isaiah and gospel packs, not re-imported here)
--
-- THREADS (slug -> target libraries):
--   6075 romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness  (Tanakh + Extras + NT)
--   6078 romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth          (Tanakh)
--   6081 romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause                (Tanakh)
--   6084 romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children     (Tanakh)
--   6087 romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification          (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s219_r04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness
  ('canon', 'romans', 4, 3, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). This is the very scripture Paul reaches for: *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3). The word stands at the moment Yahuah (LORD) brought Abraham forth to number the stars and promised him a seed — Abraham took Yahuah (LORD) at his word, and that trust was reckoned righteousness. Not a flesh-credential earned, but a heart that held fast to the One who spoke.'),
  ('canon', 'romans', 4, 3, 'canon', 'genesis', 26, 5, 'free', E'*Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* (Genesis 26:5). The faith that *was counted unto him for righteousness* (Romans 4:3) was no bare assent: Yahuah (LORD) himself names what Abraham''s believing looked like — he *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* Abraham''s faith was his faithfulness. When Paul says Abraham was not justified *by works* (Romans 4:2), he strikes at the boast of self-justification, never at the obedience Yahuah (LORD) here records with his own mouth.'),
  ('canon', 'romans', 4, 5, 'apocrypha', '1-maccabees', 2, 52, 'extras', E'*Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). Mattathias, charging his sons to give their lives for the covenant, reads Abraham exactly as Paul does — but names the testing the believing endured: Abraham was *found faithful in temptation, and it was imputed to him for righteousness.* This is the same imputing Paul presses — *his faith is counted for righteousness* (Romans 4:5) — and the Maccabean witness shows the faith counted was a faithfulness proved under trial, the binding of Isaac its furnace.'),
  ('canon', 'romans', 4, 3, 'apocrypha', 'ecclesiasticus', 44, 20, 'extras', E'*Who kept the law of the Most High, and was in covenant with him: he established the covenant in his flesh; and when he was proved, he was found faithful.* (Sirach 44:20). Ben Sira praises Abraham as one who *kept the law of the Most High* and *when he was proved, he was found faithful* — and *established the covenant in his flesh,* the circumcision Paul calls a seal. The faith Paul says was *counted unto him for righteousness* (Romans 4:3) is here spelled as law-keeping, covenant-faithfulness, and a faithfulness tested and found true. The Hebrew library knows no faith that is not faithfulness.'),
  ('canon', 'romans', 4, 22, 'canon', 'romans', 4, 3, 'free', E'*Abraham believed Elohim (God), and it was counted unto him for righteousness.* (Romans 4:3). Paul opened the chapter with the scripture and now closes the argument by returning to it: *And therefore it was imputed to him for righteousness* (Romans 4:22). The whole weave — believing the promise, staggering not, being fully persuaded — is gathered back into the single reckoning of Genesis. What was *counted* at the start is *imputed* at the end: one faithfulness, one righteousness, the pattern for all who are reckoned Abraham''s children.'),
  -- thread: romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth
  ('canon', 'romans', 4, 7, 'canon', 'psalms', 32, 1, 'free', E'*Blessed is he whose transgression is forgiven, whose sin is covered.* (Psalm 32:1). Paul says David *describeth the blessedness of the man, unto whom Elohim (God) imputeth righteousness without works* (Romans 4:6), and quotes him: *Blessed are they whose iniquities are forgiven, and whose sins are covered* (Romans 4:7). It is David''s own cry after his sin — the blessedness is not innocence earned but transgression forgiven and covered by the mercy of Yahuah (LORD), the return of the one who confessed.'),
  ('canon', 'romans', 4, 8, 'canon', 'psalms', 32, 2, 'free', E'*Blessed is the man unto whom Yahuah (LORD) imputeth not iniquity, and in whose spirit there is no guile.* (Psalm 32:2). Paul completes the citation: *Blessed is the man to whom Yahuah (Lord) will not impute sin* (Romans 4:8). David''s blessedness is the man whose iniquity Yahuah (LORD) does not reckon against him — and the psalm names the other half David lived out, *in whose spirit there is no guile,* the honesty of the one who *acknowledged my sin … and thou forgavest* (Psalm 32:5). Forgiveness reckoned, and a heart turned back without guile: the blessedness Paul sets beside Abraham''s righteousness.'),
  -- thread: romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause
  ('canon', 'romans', 4, 11, 'canon', 'genesis', 17, 11, 'free', E'*And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* (Genesis 17:11). Yahuah (LORD) gave circumcision as *a token of the covenant* — the sign, not the source. Paul reads it just so: Abraham *received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised* (Romans 4:11). The righteousness was reckoned in Genesis 15, years before the sign of Genesis 17 was given; the token sealed a righteousness already standing. The covenant sign is honored, not abolished — but it never was the cause of the standing it sealed.'),
  ('canon', 'romans', 4, 11, 'canon', 'genesis', 17, 10, 'free', E'*This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* (Genesis 17:10). The command Yahuah (LORD) gave is *my covenant, which ye shall keep* — a covenant kept, *in your flesh for an everlasting covenant* (Genesis 17:13). Paul does not strike at this; he names what it was for: that Abraham *might be the father of all them that believe, though they be not circumcised … and the father of circumcision to them who … walk in the steps of that faith of our father Abraham* (Romans 4:11-12). The sign marks the covenant; the faithfulness it seals reaches both the circumcised seed and the scattered who walk in Abraham''s steps.'),
  -- thread: romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children
  ('canon', 'romans', 4, 17, 'canon', 'genesis', 17, 5, 'free', E'*Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* (Genesis 17:5). Paul quotes it directly — *(As it is written, I have made thee a father of many nations,)* (Romans 4:17). The new name itself carried the promise: the seed of Abraham would not stay one household but become *many nations,* scattered as the stars across the earth and gathered back as his children. The two houses dispersed among the nations are reckoned to the father whose very name means the multitude of his seed.'),
  ('canon', 'romans', 4, 16, 'canon', 'genesis', 17, 4, 'free', E'*As for me, behold, my covenant is with thee, and thou shalt be a father of many nations.* (Genesis 17:4). The promise was that the seed should *be sure to all the seed … of the faith of Abraham; who is the father of us all* (Romans 4:16) — and Yahuah (LORD) had said it from the first: *my covenant is with thee, and thou shalt be a father of many nations.* The inheritance comes *by grace* through the faithfulness of the father, that it might hold sure for all the seed — the remnant of Yahudah (Judah) and the scattered of the ten tribes alike, the whole multitude promised to Abraham.'),
  ('canon', 'romans', 4, 18, 'canon', 'genesis', 15, 5, 'free', E'*And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* (Genesis 15:5). Paul points straight to this night: Abraham *against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be* (Romans 4:18). Yahuah (LORD) set the childless man under the stars and named the innumerable seed; Abraham believed the One who *calleth those things which be not as though they were* (Romans 4:17). The seed as the stars is the gathered multitude the prophets traced home.'),
  ('canon', 'romans', 4, 13, 'canon', 'genesis', 22, 18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). The promise that Abraham *should be the heir of the world* (Romans 4:13) came not *through the law* as a system of earning but *through the righteousness of faith* — and Yahuah (LORD) sealed it after the binding of Isaac: *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* The promise and the obedience stand together in one breath; the heir-of-the-world blessing rests on the faithfulness of the father who did not withhold his son.'),
  -- thread: romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification
  ('canon', 'romans', 4, 17, 'canon', 'genesis', 22, 13, 'free', E'*And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* (Genesis 22:13). Paul names the God Abraham believed as the One *who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17). On Moriah Abraham received Isaac back as from the dead — the knife already raised — when the ram was given *in the stead of his son.* The father who trusted that Yahuah (LORD) could quicken the dead is the pattern for those who trust the God who raised up Yahusha (Jesus).'),
  ('canon', 'romans', 4, 24, 'canon', 'genesis', 22, 8, 'free', E'*And Abraham said, My son, Elohim (God) will provide himself a lamb for a burnt offering: so they went both of them together.* (Genesis 22:8). Abraham climbed Moriah saying *Elohim (God) will provide himself a lamb* — trusting the provision before he saw it, as those now believe *on him that raised up Yahusha (Jesus) our Lord from the dead* (Romans 4:24). The lamb Abraham trusted Yahuah (LORD) to provide, and the son received back alive, foreshadow the One *delivered for our offences, and … raised again for our justification* (Romans 4:25) — the provided sacrifice and the life given back.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness',
       E'Abraham believed Elohim (God) — the faith that was faithfulness',
       E'Paul holds up Abraham as the pattern: *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3), and *to him that worketh not, but believeth on him that justifieth the ungodly, his faith is counted for righteousness* (Romans 4:5). The default reading hears this as faith against obedience — but the Hebrew library knows no such split. The word Paul quotes is the night Yahuah (LORD) brought the childless man out to number the stars: *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). And Yahuah (LORD) himself names what that believing was: Abraham *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5). Abraham''s faith was his faithfulness. The restored library says the same with one voice: Ben Sira praises him as one *who kept the law of the Most High … he established the covenant in his flesh; and when he was proved, he was found faithful* (Sirach 44:20), and Mattathias asks his sons, *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52) — the very imputing Paul presses, named as a faithfulness proved in testing, the binding of Isaac its furnace. So when Paul says Abraham was not justified *by works* (Romans 4:2), he strikes at the boast of self-justification — the flesh-credential that would have *whereof to glory* — never at the obedience Yahuah (LORD) records with his own mouth. And the argument closes where it began: *And therefore it was imputed to him for righteousness* (Romans 4:22). One faithfulness, one righteousness, the pattern for all who are reckoned his children.',
       sv.verse_id, ev.verse_id, 'extras', 6075
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth',
       E'Blessed is the man to whom Yahuah (Lord) will not impute sin',
       E'Beside Abraham, Paul sets David: *Even as David also describeth the blessedness of the man, unto whom Elohim (God) imputeth righteousness without works* (Romans 4:6). The words he quotes are David''s own song after his sin: *Blessed are they whose iniquities are forgiven, and whose sins are covered. Blessed is the man to whom Yahuah (Lord) will not impute sin* (Romans 4:7-8). They come straight from the psalm — *Blessed is he whose transgression is forgiven, whose sin is covered. Blessed is the man unto whom Yahuah (LORD) imputeth not iniquity, and in whose spirit there is no guile* (Psalm 32:1-2). The blessedness is not innocence earned but transgression forgiven and covered by the mercy of Yahuah (LORD). And the psalm shows the man who receives it: the one who stopped hiding — *I acknowledged my sin unto thee … and thou forgavest the iniquity of my sin* (Psalm 32:5) — the spirit *in whom there is no guile.* Forgiveness reckoned, and a heart turned back without guile. This is the grace that imputes righteousness: the homecoming of the one who confesses and returns, never a covering that leaves the man where he lay.',
       sv.verse_id, ev.verse_id, 'free', 6078
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause',
       E'A seal of the righteousness of the faith — the token, not the cause',
       E'Paul asks whether the blessedness comes *upon the circumcision only, or upon the uncircumcision also* (Romans 4:9), and answers by the timing: the righteousness was reckoned to Abraham *not in circumcision, but in uncircumcision* (Romans 4:10) — in Genesis 15, years before the sign was given in Genesis 17. So circumcision was *the sign … a seal of the righteousness of the faith which he had yet being uncircumcised* (Romans 4:11). This is exactly what Yahuah (LORD) called it: *it shall be a token of the covenant betwixt me and you* (Genesis 17:11) — the sign of *my covenant, which ye shall keep* (Genesis 17:10), *in your flesh for an everlasting covenant* (Genesis 17:13). The token seals; it does not cause. Paul does not throw down the covenant sign — he names its purpose: that Abraham *might be the father of all them that believe, though they be not circumcised … and the father of circumcision to them who are not of the circumcision only, but who also walk in the steps of that faith of our father Abraham* (Romans 4:11-12). The sign marks the covenant; the faithfulness it seals reaches both the circumcised seed and the scattered who walk in Abraham''s steps and come home to it.',
       sv.verse_id, ev.verse_id, 'free', 6081
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children',
       E'A father of many nations — the promise to the seed, the scattered reckoned his children',
       E'The promise that Abraham *should be the heir of the world* came not *through the law* as a system of earning *but through the righteousness of faith* (Romans 4:13), *that it might be by grace; to the end the promise might be sure to all the seed … who is the father of us all* (Romans 4:16). Paul anchors it in the word Yahuah (LORD) spoke when he changed the name: *(As it is written, I have made thee a father of many nations,)* (Romans 4:17) — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee* (Genesis 17:5), *my covenant is with thee, and thou shalt be a father of many nations* (Genesis 17:4). The new name carried the multitude inside it. It was sealed under the stars — *Look now toward heaven, and tell the stars, if thou be able to number them … So shall thy seed be* (Genesis 15:5) — so that Abraham *against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be* (Romans 4:18). And after the binding of Isaac Yahuah (LORD) sealed it again: *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18) — promise and obedience in one breath. The seed scattered as the innumerable stars across the nations are reckoned the children of the father whose very name means the multitude of his seed: the remnant of Yahudah (Judah) and the dispersed of the ten tribes alike, gathered home as the sure inheritance of the promise.',
       sv.verse_id, ev.verse_id, 'free', 6084
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification',
       E'Who quickeneth the dead — the bound son received back, and raised for our justification',
       E'The God Abraham believed is named by what he does: *even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17). Abraham knew that God on Moriah. He climbed the mountain saying *My son, Elohim (God) will provide himself a lamb for a burnt offering* (Genesis 22:8), trusting the provision before he saw it; and with the knife already raised he received Isaac back as from the dead when *a ram caught in a thicket by his horns* was offered *in the stead of his son* (Genesis 22:13). The father who trusted that Yahuah (LORD) could quicken the dead — and got his son back alive — is the pattern for the faith now reckoned to us: *if we believe on him that raised up Yahusha (Jesus) our Lord from the dead* (Romans 4:24). The provided lamb and the son given back foreshadow the One *who was delivered for our offences, and was raised again for our justification* (Romans 4:25). The God who quickeneth the dead is the same in both: he who returned Isaac to Abraham, and he who raised Yahusha (Jesus) — the Formed who took on flesh, was delivered up, and was given back from the grave that the faithful might be set in right standing.',
       sv.verse_id, ev.verse_id, 'free', 6087
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* the scripture Paul quotes, the night of the stars (Romans 4:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:5 — *Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* Yahuah (LORD) names the believing as faithfulness; the *not of works* strikes self-justification, not obedience (Romans 4:2-3).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 44:20 — *who kept the law of the Most High … when he was proved, he was found faithful* the Hebrew library spells the faith as law-keeping and tested faithfulness (Romans 4:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 2:52 — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* the same imputing Paul presses, named as a faithfulness proved in testing (Romans 4:5).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:3 — *Abraham believed Elohim (God), and it was counted unto him for righteousness* the argument closes by returning to the scripture it opened with: *therefore it was imputed to him for righteousness* (Romans 4:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 32:1 — *Blessed is he whose transgression is forgiven, whose sin is covered* David''s blessedness, transgression forgiven and covered (Romans 4:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 32:2 — *Blessed is the man unto whom Yahuah (LORD) imputeth not iniquity, and in whose spirit there is no guile* iniquity not reckoned, the heart turned back without guile (Romans 4:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:11 — *it shall be a token of the covenant betwixt me and you* circumcision the sign, not the source; the righteousness was reckoned years before in uncircumcision (Romans 4:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:10 — *This is my covenant, which ye shall keep … Every man child among you shall be circumcised* the covenant kept in the flesh; Paul names its purpose, that Abraham be father of both the circumcised and the scattered who walk in his steps (Romans 4:11-12).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* the heir-of-the-world promise, sealed on promise and obedience together after the binding (Romans 4:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:4 — *my covenant is with thee, and thou shalt be a father of many nations* the inheritance sure to all the seed through the father of us all (Romans 4:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:5 — *a father of many nations have I made thee* the name itself carried the multitude; Paul quotes it directly (Romans 4:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 15:5 — *tell the stars, if thou be able to number them … So shall thy seed be* the innumerable seed sealed under the stars, believed against hope (Romans 4:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:13 — *a ram caught in a thicket by his horns … offered him up … in the stead of his son* Abraham received Isaac back as from the dead, knowing the God *who quickeneth the dead* (Romans 4:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:8 — *Elohim (God) will provide himself a lamb for a burnt offering* the provision trusted before it was seen; the provided lamb and the son given back foreshadow the One raised for our justification (Romans 4:24-25).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_romans_05.sql (S219 Romans 5) -----
-- =====================================================================
-- S219 minion — ROMANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 5.  Tag: r05 (temp view _s219_r05_lookup).  Sort band: 6100, step 3 (<6125).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
-- Thread tier_required = 'extras' if any member is extras, else 'free'.
--
-- WATCHPOINTS (Red Lines, Christology, false-inclusion diagnostic):
--  * THE SECOND ADAM (5:12-19): *as by one man sin entered into the world, and death by sin*
--    (5:12) is undone by the one Man — the Formed drawn from the Formless, who took on flesh
--    and undoes the first Adam's fall. *The first man Adam was made a living soul; the last
--    Adam was made a quickening spirit … the second man is Yahuah (Lord) from heaven*
--    (1 Corinthians 15:45,47): the second Adam is the Formed who came down, not a created
--    co-equal third person and not the Father — Yahusha who is Yahuah and has a Father.
--  * GRACE THROUGH RIGHTEOUSNESS (5:20-21): grace reigns *through righteousness* (5:21), NEVER
--    through lawlessness. The law that *entered, that the offence might abound* (5:20) is the
--    law's exposing work — not its condemnation as a thing to discard. Grace is the means of
--    return to right standing, the homecoming, not a release from the commandments (Red Line #10).
--  * RECONCILIATION (5:6-11): *while we were yet sinners, Messiah (Christ) died for us* (5:8) —
--    the chastisement of our peace upon him (Isaiah 53:5), the iniquity of us all laid on him
--    (Isaiah 53:6); reconciliation by the death of his Son, not a flesh-credential confession.
--  * EXTRAS ON ADAM: Wisdom 2:23-24 (death entered through the envy of the devil); 2 Esdras
--    (4 Ezra) 3:7,21-22 and 7:11-12,46-48,118 (the first Adam's wicked heart; in Adam all that
--    come of him fall) — the Second-Temple witness to the very fall Paul names.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (Tanakh/Extras/NT weighed for every block):
--  v.1-2   justified by faith, peace, access into grace
--          Tanakh: peace/healing carried in the reconciliation thread (Isaiah 53:5) — not re-added here
--          Extras: none warranted
--          NT:     1 Corinthians 15:1-2 (the gospel wherein ye stand, by which ye are saved)
--  v.3-5   tribulation worketh patience; hope; love shed abroad by the Spirit
--          Tanakh: none warranted (the Spirit/new-heart Tanakh roots belong to Romans 8, not added here)
--          Extras: 2 Esdras 7:14,18 (the strait things suffered, then the wide hoped for)
--          NT:     none warranted
--  v.6-11  while we were yet sinners reconciled by the death of his Son
--          Tanakh: Isaiah 53:5 (chastisement of our peace), Isaiah 53:6 (iniquity of us all laid on him)
--          Extras: none warranted
--          NT:     none added (the once-for-all reconciliation carried by the Tanakh servant-song here)
--  v.12-14 by one man sin entered, death passed upon all; death reigned from Adam to Moses
--          Tanakh: Genesis 2:17 (the day thou eatest thou shalt surely die), Genesis 3:19 (dust to dust)
--          Extras: Wisdom 2:23-24 (death entered through the devil's envy); 2 Esdras 3:7 (death appointed in Adam), 3:21 (the first Adam's wicked heart)
--          NT:     1 Corinthians 15:21-22 (by man came death; as in Adam all die)
--  v.15-19 the free gift, the one Man Yahusha, the obedience of one made many righteous
--          Tanakh: none warranted (the Adamic root carried in the 5:12 thread)
--          Extras: 2 Esdras 7:48 (O Adam, thou art not fallen alone, but we all that come of thee)
--          NT:     1 Corinthians 15:45 (the last Adam a quickening spirit), 15:47 (the second man, Lord from heaven)
--  v.20-21 the law entered that the offence might abound; grace reigns through righteousness
--          Tanakh: none warranted (the law's exposing work carried by the extras heart-witness)
--          Extras: 2 Esdras 3:20 (the wicked heart not taken away, that the law might bring forth fruit), 3:22 (the law in the heart with the malignity of the root)
--          NT:     none warranted
--
-- THREADS (slug -> target libraries):
--   6100 romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace   (NT)
--   6103 romans-5-tribulation-worketh-patience-the-strait-then-the-wide           (Extras)
--   6106 romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son    (Tanakh)
--   6109 romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell (Tanakh + Extras + NT)
--   6112 romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit (Extras + NT)
--   6115 romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness (Extras)
-- =====================================================================

CREATE TEMP VIEW _s219_r05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace
  ('canon', 'romans', 5, 1, 'canon', '1-corinthians', 15, 1, 'free', E'*Moreover, brethren, I declare unto you the gospel which I preached unto you, which also ye have received, and wherein ye stand;* (1 Corinthians 15:1). *Therefore being justified by faith, we have peace with Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ)* (Romans 5:1), and *by whom also we have access by faith into this grace wherein we stand* (Romans 5:2). The same grace *wherein we stand* in Romans is the gospel *wherein ye stand* in Corinth — not a mental assent that purchases entry, but the faithful brought into the standing where they may now walk. The faith is the door home; the standing is the place of the gathered.'),
  ('canon', 'romans', 5, 2, 'canon', '1-corinthians', 15, 2, 'free', E'*By which also ye are saved, if ye keep in memory what I preached unto you, unless ye have believed in vain.* (1 Corinthians 15:2). *We have access by faith into this grace wherein we stand, and rejoice in hope of the glory of Elohim (God)* (Romans 5:2). The salvation is held by those who *keep in memory* and do not believe *in vain* — the standing in grace is a standing to be kept, the hope of the glory of Elohim (God) the destination of those who endure in it. Grace is the entrance and the walk, not a release from the keeping.'),
  -- thread: romans-5-tribulation-worketh-patience-the-strait-then-the-wide
  ('canon', 'romans', 5, 3, 'apocrypha', '2-esdras', 7, 18, 'extras', E'*Nevertheless the righteous shall suffer strait things, and hope for wide: for they that have done wickedly have suffered the strait things, and yet shall not see the wide.* (2 Esdras 7:18). *We glory in tribulations also: knowing that tribulation worketh patience* (Romans 5:3). The same shape stands in the older witness: the righteous *suffer strait things, and hope for wide* — the narrow pressure now is the very road to the breadth hoped for. The tribulation is not the contradiction of the hope but the working of it.'),
  ('canon', 'romans', 5, 4, 'apocrypha', '2-esdras', 7, 14, 'extras', E'*If then they that live labour not to enter these strait and vain things, they can never receive those that are laid up for them.* (2 Esdras 7:14). *And patience, experience; and experience, hope* (Romans 5:4). The older word makes the same demand: there is no receiving the things *laid up* without labouring to enter through *these strait* things. Patience tried in the strait becomes the experience that bears hope — the pressure endured is the path to the inheritance.'),
  -- thread: romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son
  ('canon', 'romans', 5, 8, 'canon', 'isaiah', 53, 5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). *Elohim (God) commendeth his love toward us, in that, while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8). The love commended *while we were yet sinners* is the very thing Isaiah saw: the *chastisement of our peace* laid upon him, the wounding for transgressions not yet repented of. The peace we now have (Romans 5:1) was bought by his stripes before we sought it.'),
  ('canon', 'romans', 5, 10, 'canon', 'isaiah', 53, 6, 'free', E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all.* (Isaiah 53:6). *For if, when we were enemies, we were reconciled to Elohim (God) by the death of his Son, much more, being reconciled, we shall be saved by his life* (Romans 5:10). We were the sheep gone astray, every one turned to his own way — enemies — yet *the iniquity of us all* was laid on him. The reconciliation by the death of his Son is the laying-on Isaiah named; and being reconciled, we are kept by his life.'),
  -- thread: romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell
  ('canon', 'romans', 5, 12, 'canon', 'genesis', 2, 17, 'free', E'*But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* (Genesis 2:17). *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The one man is Adam, and the death is the sentence spoken at the tree: *in the day that thou eatest thereof thou shalt surely die.* Sin entered, and death by sin, exactly where Yahuah Elohim (the LORD God) said it would — and it passed upon all who came of him.'),
  ('canon', 'romans', 5, 12, 'canon', 'genesis', 3, 19, 'free', E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). *Death passed upon all men, for that all have sinned* (Romans 5:12). The death that passed upon all is the dust-return spoken over Adam: *dust thou art, and unto dust shalt thou return.* Paul names the entrance of the thing Genesis enacts — the ground cursed, the man returned to the dust he was taken from, the whole race carried into the sentence.'),
  ('canon', 'romans', 5, 12, 'apocrypha', 'the-wisdom-of-solomon', 2, 24, 'extras', E'*Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* (Wisdom of Solomon 2:24). *By one man sin entered into the world, and death by sin* (Romans 5:12). The older witness names the deeper root: death came into the world *through envy of the devil* — for *Elohim (God) created man to be immortal, and made him to be an image of his own eternity* (Wisdom of Solomon 2:23). The serpent of the garden is the envy behind the one man''s fall; death is the intruder, not the Maker''s design.'),
  ('canon', 'romans', 5, 14, 'apocrypha', '2-esdras', 3, 7, 'extras', E'*And to him you gavest commandment to love your way: which he transgressed, and immediately you appointedst death in him and in his generations, of whom came nations, tribes, people, and kindreds, out of number.* (2 Esdras 3:7). *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression* (Romans 5:14). The reign of death from Adam is what the older word already saw: death *appointed in him and in his generations,* spreading to the nations and tribes *out of number.* The transgression of the one set death reigning over all his seed.'),
  ('canon', 'romans', 5, 14, 'apocrypha', '2-esdras', 3, 21, 'extras', E'*For the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him.* (2 Esdras 3:21). *Death reigned from Adam to Moses … who is the figure of him that was to come* (Romans 5:14). The first Adam *bearing a wicked heart transgressed … and so be all they that are born of him* — the very inheritance Paul names, the figure of the one to come who would reverse it. Adam is the figure; the wicked-hearted seed is the field the second Adam comes to redeem.'),
  ('canon', 'romans', 5, 12, 'canon', '1-corinthians', 15, 21, 'free', E'*For since by man came death, by man came also the resurrection of the dead.* (1 Corinthians 15:21). *By one man sin entered into the world, and death by sin* (Romans 5:12). The same hand that wrote Romans wrote this: death by one man, life by one Man. *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). The reign of death entered by the first man is met and undone by the resurrection that comes by the second.'),
  -- thread: romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit
  ('canon', 'romans', 5, 15, 'canon', '1-corinthians', 15, 45, 'free', E'*And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit.* (1 Corinthians 15:45). *For if through the offence of one many be dead, much more the grace of Elohim (God), and the gift by grace, which is by one man, Yahusha HaMashiach (Jesus Christ), hath abounded unto many* (Romans 5:15). The one man whose gift abounds is *the last Adam,* the *quickening spirit* — over against *the first man Adam … made a living soul.* The two Adams stand at the head of two races: the first carrying death, the last carrying the gift of life.'),
  ('canon', 'romans', 5, 17, 'canon', '1-corinthians', 15, 47, 'free', E'*The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven.* (1 Corinthians 15:47). *They which receive abundance of grace and of the gift of righteousness shall reign in life by one, Yahusha HaMashiach (Jesus Christ)* (Romans 5:17). The one by whom they reign in life is *the second man … Yahuah (Lord) from heaven* — the Formed drawn from the Formless, who came down and took on flesh. The first Adam is *of the earth, earthy;* the second is from heaven, and those who bear his image reign in life by him.'),
  ('canon', 'romans', 5, 18, 'apocrypha', '2-esdras', 7, 48, 'extras', E'*O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you.* (2 Esdras 7:48). *Therefore as by the offence of one judgment came upon all men to condemnation; even so by the righteousness of one the free gift came upon all men unto justification of life* (Romans 5:18). The older lament names the offence of the one upon all: *you are not fallen alone, but we all that come of you.* Against that whole fallen race stands *the righteousness of one* — the free gift that came upon all unto justification of life, the second Adam answering the first.'),
  -- thread: romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness
  ('canon', 'romans', 5, 20, 'apocrypha', '2-esdras', 3, 20, 'extras', E'*And yet tookest you not away from them a wicked heart, that your law might bring forth fruit in them.* (2 Esdras 3:20). *Moreover the law entered, that the offence might abound. But where sin abounded, grace did much more abound* (Romans 5:20). The law given at Sinai met a heart not yet taken away — the law could not *bring forth fruit* in the wicked heart, but only make the offence visible. The law entered to expose the abounding sin, that grace might abound the more; the heart still wanting the new heart the prophets promised.'),
  ('canon', 'romans', 5, 20, 'apocrypha', '2-esdras', 3, 22, 'extras', E'*Thus infirmity was made permanent; and the law (also) in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still.* (2 Esdras 3:22). *The law entered, that the offence might abound* (Romans 5:20). The older word names the very condition: the law standing *in the heart of the people with the malignity of the root,* the offence laid bare while the evil *abode still.* The law is holy and the law exposes — but the law atop the wicked heart only makes the offence abound, until grace abounds more and the root itself is dealt with.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace',
       E'Being justified by faith — we have peace, access into this grace',
       E'*Therefore being justified by faith, we have peace with Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ): by whom also we have access by faith into this grace wherein we stand* (Romans 5:1-2). The faith here is not a mental assent that purchases entry; it is the faithfulness by which the brought-home are set in their standing — *this grace wherein we stand.* Paul says the same of the gospel to the assembly at Corinth: *the gospel which I preached unto you, which also ye have received, and wherein ye stand* (1 Corinthians 15:1), *by which also ye are saved, if ye keep in memory what I preached unto you, unless ye have believed in vain* (1 Corinthians 15:2). The standing is a standing to be kept — those who *keep in memory* and do not believe *in vain.* Grace is the door home and the place of the gathered; the access is into a standing where they may now walk, rejoicing *in hope of the glory of Elohim (God)* (Romans 5:2). Faith opens the door; the keeping is the walk within.',
       sv.verse_id, ev.verse_id, 'free', 6100
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-tribulation-worketh-patience-the-strait-then-the-wide',
       E'Tribulation worketh patience — the strait, then the wide',
       E'*And not only so, but we glory in tribulations also: knowing that tribulation worketh patience; and patience, experience; and experience, hope* (Romans 5:3-4). The pressure is not the contradiction of the hope but the working of it. The older witness saw the same shape in the road of the righteous: *the righteous shall suffer strait things, and hope for wide: for they that have done wickedly have suffered the strait things, and yet shall not see the wide* (2 Esdras 7:18). The narrow pressure now is the very road to the breadth hoped for — and there is no shortcut around it: *if then they that live labour not to enter these strait and vain things, they can never receive those that are laid up for them* (2 Esdras 7:14). Patience tried in the strait becomes the experience that bears hope; and *hope maketh not ashamed; because the love of Elohim (God) is shed abroad in our hearts by the Ruach HaKodesh (Holy Spirit) which is given unto us* (Romans 5:5). The tribulation endured is the path to the inheritance laid up — the strait that opens into the wide.',
       sv.verse_id, ev.verse_id, 'extras', 6103
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son',
       E'While we were yet sinners — reconciled by the death of his Son',
       E'*For when we were yet without strength, in due time Messiah (Christ) died for the ungodly* (Romans 5:6), and *Elohim (God) commendeth his love toward us, in that, while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8). The love is commended before the turning — *while we were yet sinners,* *when we were enemies* (Romans 5:10). This is the very thing Isaiah saw long before: *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5). The peace we now have through our Lord Yahusha HaMashiach (Lord Jesus Christ) (Romans 5:1) was bought by his stripes before we sought it. And the reconciliation is the laying-on the prophet named: *all we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). We were the sheep gone astray, every one turned to his own way, enemies — yet the iniquity of us all was laid on him. *Being reconciled, we shall be saved by his life* (Romans 5:10): the death reconciled the enemy; the life keeps the reconciled.',
       sv.verse_id, ev.verse_id, 'free', 6106
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell',
       E'By one man sin entered — death passed upon all, the first Adam fell',
       E'*Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The one man is Adam, and the death is the sentence spoken at the tree: *of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17), enacted in the dust-return over the fallen man — *dust thou art, and unto dust shalt thou return* (Genesis 3:19). The older witnesses saw the same fall and named its deeper root: *Elohim (God) created man to be immortal, and made him to be an image of his own eternity. Nevertheless through envy of the devil came death into the world* (Wisdom of Solomon 2:23-24) — the serpent of the garden the envy behind the one man''s fall. And the reign of death over all his seed was already lamented: death *appointed in him and in his generations, of whom came nations, tribes, people, and kindreds, out of number* (2 Esdras 3:7), for *the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him* (2 Esdras 3:21). So *death reigned from Adam to Moses … who is the figure of him that was to come* (Romans 5:14). Adam is the figure; and the figure is answered, for the same hand wrote: *since by man came death, by man came also the resurrection of the dead. For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:21-22). Death by one man; life by one Man.',
       sv.verse_id, ev.verse_id, 'extras', 6109
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit',
       E'The free gift — the one Man, and the last Adam a quickening spirit',
       E'*For if through the offence of one many be dead, much more the grace of Elohim (God), and the gift by grace, which is by one man, Yahusha HaMashiach (Jesus Christ), hath abounded unto many* (Romans 5:15). The one man whose gift abounds is the second Adam, and Paul names him plainly elsewhere: *the first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). The two Adams stand at the head of two races — the first carrying death, the last carrying the gift of life. And the last Adam is not another earthy man: *the first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven* (1 Corinthians 15:47) — the Formed drawn from the Formless, who came down and took on flesh, who is Yahuah and has a Father. By him *they which receive abundance of grace and of the gift of righteousness shall reign in life* (Romans 5:17). Against the whole fallen race the older lament cried — *O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you* (2 Esdras 7:48) — stands *the righteousness of one,* for *as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous* (Romans 5:18-19). The first Adam''s disobedience; the second Adam''s obedience. One free gift answering one offence.',
       sv.verse_id, ev.verse_id, 'extras', 6112
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness',
       E'The law entered that the offence might abound — grace reigns through righteousness',
       E'*Moreover the law entered, that the offence might abound. But where sin abounded, grace did much more abound* (Romans 5:20). This is not the law''s condemnation as a thing to be discarded; it is the law''s exposing work upon a heart not yet made new. The older witness names the very condition: at Sinai the law was given, *and yet tookest you not away from them a wicked heart, that your law might bring forth fruit in them* (2 Esdras 3:20) — so *the law (also) in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still* (2 Esdras 3:22). The law atop the wicked heart could not bring forth fruit; it could only make the offence visible, that grace might abound the more and the root itself at last be dealt with by the new heart the prophets promised. And the grace that abounds does not reign by lawlessness: *that as sin hath reigned unto death, even so might grace reign through righteousness unto eternal life by Yahusha HaMashiach (Jesus Christ) our Lord* (Romans 5:21). Grace reigns *through righteousness* — the means of return to right standing and to the walk, never a release from the commandments. The offence abounded that grace might abound; and grace reigns that righteousness might stand.',
       sv.verse_id, ev.verse_id, 'extras', 6115
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:1 — *the gospel which I preached unto you … wherein ye stand* the same standing in grace into which faith gives access (Romans 5:1-2).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:2 — *by which also ye are saved, if ye keep in memory … unless ye have believed in vain* the standing in grace is a standing to be kept, not a release (Romans 5:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-tribulation-worketh-patience-the-strait-then-the-wide
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 7:18 — *the righteous shall suffer strait things, and hope for wide* the narrow pressure now is the road to the breadth hoped for (Romans 5:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-tribulation-worketh-patience-the-strait-then-the-wide'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 7:14 — *if then they that live labour not to enter these strait … things, they can never receive those that are laid up* no inheritance without the strait endured (Romans 5:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-tribulation-worketh-patience-the-strait-then-the-wide'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:5 — *the chastisement of our peace was upon him; and with his stripes we are healed* the love commended while we were yet sinners (Romans 5:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:6 — *Yahuah (LORD) hath laid on him the iniquity of us all* the reconciliation of the enemy by the death of his Son (Romans 5:10).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *in the day that thou eatest thereof thou shalt surely die* the death-sentence at the tree, entered by the one man (Romans 5:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *dust thou art, and unto dust shalt thou return* the death that passed upon all men enacted over the fallen Adam (Romans 5:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 2:24 — *through envy of the devil came death into the world* the deeper root behind the one man''s fall; death the intruder, not the Maker''s design (Romans 5:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 3:7 — death *appointed in him and in his generations, of whom came nations, tribes, people … out of number* the reign of death from Adam over all his seed (Romans 5:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 3:21 — *the first Adam bearing a wicked heart transgressed … and so be all they that are born of him* the inherited fall, the figure of the one to come (Romans 5:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 15:21 — *by man came death, by man came also the resurrection … as in Adam all die, even so in Messiah (Christ) shall all be made alive* the first Adam answered by the second (Romans 5:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:45 — *the first man Adam was made a living soul; the last Adam was made a quickening spirit* the two Adams at the head of two races (Romans 5:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:47 — *the second man is Yahuah (Lord) from heaven* the one Man is the Formed who came down and took on flesh (Romans 5:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 7:48 — *O you Adam … you are not fallen alone, but we all that come of you* the whole fallen race answered by the righteousness of one (Romans 5:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 3:20 — *tookest you not away from them a wicked heart, that your law might bring forth fruit* the law atop the unchanged heart, exposing not fruiting (Romans 5:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 3:22 — *the law … in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still* the offence laid bare until the root is dealt with (Romans 5:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_romans_06.sql (S219 Romans 6) -----
-- =====================================================================
-- S219 minion — ROMANS 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 6.  Tag: r06 (temp view _s219_r06_lookup).  Sort band: 6125, step 3 (<6150).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#6/#10): Romans 6 is the anti-license core of the epistle.
-- *Shall we continue in sin, that grace may abound? Elohim (God) forbid* (6:1-2); *shall we sin,
-- because we are not under the law, but under grace? Elohim (God) forbid* (6:15). "Not under the
-- law" (6:14) is NOT freedom to transgress — it is the believer no longer under the law's
-- condemnation/penalty as a justifying system; the curse-verdict of death no longer holds dominion
-- over the one made alive in Messiah. Grace is the MEANS OF RETURN to walking in obedience, never
-- a license against the commandments. The dead-to-sin / alive-unto-Elohim reckoning issues in
-- *servants of righteousness unto holiness* (6:16-22). The Tanakh roots of the new-heart, new-spirit
-- walk — *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27),
-- *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33), the
-- choose-life of Deuteronomy 30 — are exactly the obedience-unto-holiness Paul names. The Master's
-- own *Whosoever committeth sin is the servant of sin* and *go, and sin no more* (John 8:34, 8:11)
-- are the NT root of the servant-of-sin teaching. *The wages of sin is death* (6:23) is Ezekiel's
-- *the soul that sinneth, it shall die* (18:4) and Deuteronomy's *life and death, blessing and
-- cursing: therefore choose life* (30:19) — the operative consequence-system, never annulled.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   shall we continue in sin / dead to sin  Tanakh: Ezekiel 18:30-31, Deuteronomy 30:19  Extras: none warranted  NT: John 8:11 (go, and sin no more)
--   v.3-5   baptized into his death / newness of life  Tanakh: Ezekiel 36:25 (sprinkle clean water)  Extras: none warranted  NT: Colossians 2:12 (buried with him in baptism, risen with him)
--   v.6-7   old man crucified / body of sin destroyed  Tanakh: none warranted  Extras: none warranted  NT: Galatians 2:20, Colossians 3:9-10 (put off the old man, put on the new)
--   v.8-11  dead with Messiah / alive unto Elohim     Tanakh: none added (carried at 6:3-5)  Extras: none warranted  NT: none added (carried at 6:3-5 baptism thread)
--   v.12-15 not under law but under grace / shall we sin  Tanakh: Ezekiel 18:21, Deuteronomy 30:8  Extras: none warranted  NT: John 8:34 (whosoever committeth sin is the servant of sin)
--   v.16-19 servants of righteousness unto holiness     Tanakh: Ezekiel 36:27, Jeremiah 31:33  Extras: none warranted  NT: John 8:36 (if the Son make you free, ye shall be free indeed)
--   v.20-23 wages of sin is death / gift is eternal life  Tanakh: Ezekiel 18:4, Deuteronomy 30:19  Extras: none warranted  NT: John 8:51 (if a man keep my saying, he shall never see death)
--
-- Extras: NONE warranted for Romans 6. The chapter's weave is Tanakh new-heart/choose-life roots
-- and the Master's own servant-of-sin teaching; no extra-canonical witness adds load-bearing weight
-- over those. (Curated, not a dump — "none warranted" recorded per the brief.)
--
-- THREADS (slug -> target libraries):
--   6125 romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid            (Tanakh + NT)
--   6128 romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life (Tanakh + NT)
--   6131 romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed        (NT)
--   6134 romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid            (Tanakh + NT)
--   6137 romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk          (Tanakh + NT)
--   6140 romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life     (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s219_r06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid
  ('canon', 'romans', 6, 2, 'canon', 'ezekiel', 18, 30, 'free', E'*Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* (Ezekiel 18:30). Paul answers his own question — *shall we continue in sin, that grace may abound?* (Romans 6:1) — with *Elohim (God) forbid. How shall we, that are dead to sin, live any longer therein?* (Romans 6:2). The prophet had already set the only true posture toward sin: not continuance under cover of mercy but *repent, and turn yourselves from all your transgressions.* Grace is the call to turn from iniquity, never the permission to abide in it.'),
  ('canon', 'romans', 6, 2, 'canon', 'ezekiel', 18, 31, 'free', E'*Cast away from you all your transgressions, whereby ye have transgressed; and make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 18:31). To be *dead to sin* and to *live any longer therein* (Romans 6:2) are contraries — and the prophet names the same contradiction: the one given a new heart casts away his transgressions, for clinging to them is to choose death. *Why will ye die?* is Yahuah''s (the LORD''s) own answer to anyone who would continue in sin that grace might abound.'),
  ('canon', 'romans', 6, 2, 'canon', 'john', 8, 11, 'free', E'*She said, No man, Yahuah (Lord). And Yahusha (Jesus) said unto her, Neither do I condemn thee: go, and sin no more.* (John 8:11). The Master''s mercy to the woman is the very shape of Romans 6: the one not condemned is sent *to sin no more* — not loosed to continue. *How shall we, that are dead to sin, live any longer therein?* (Romans 6:2) unfolds what the King''s pardon already commanded; the grace that does not condemn is the grace that says sin no more.'),
  -- thread: romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life
  ('canon', 'romans', 6, 4, 'canon', 'colossians', 2, 12, 'free', E'*Buried with him in baptism, wherein also ye are risen with him through the faith of the operation of Elohim (God), who hath raised him from the dead.* (Colossians 2:12). Paul says the same thing twice: *we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life* (Romans 6:4). The burial and the rising are one passage — and the rising is unto a walk, *newness of life,* not a return to the old. Baptism is death to the old way and entrance on the new walk.'),
  ('canon', 'romans', 6, 4, 'canon', 'ezekiel', 36, 25, 'free', E'*Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* (Ezekiel 36:25). The cleansing water of the prophet stands behind the baptism Paul names: *we are buried with him by baptism into death … even so we also should walk in newness of life* (Romans 6:4). Yahuah (the LORD) promised to sprinkle clean water and cleanse from all filthiness — and the very next breath gives the new heart and the new spirit that walks in his statutes (Ezekiel 36:26-27). The washing is never an end in itself; it opens onto the new walk.'),
  ('canon', 'romans', 6, 5, 'canon', 'colossians', 3, 1, 'free', E'*If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God).* (Colossians 3:1). *For if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection* (Romans 6:5). The likeness of his resurrection is no idle status — Paul makes it the ground of a command: those risen with Messiah seek the things above. To share his rising is to be set on a new course, the affection lifted from the old life to the life now hid with Messiah in Elohim (God).'),
  -- thread: romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed
  ('canon', 'romans', 6, 6, 'canon', 'galatians', 2, 20, 'free', E'*I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me.* (Galatians 2:20). *Our old man is crucified with him, that the body of sin might be destroyed, that henceforth we should not serve sin* (Romans 6:6). The crucifixion of the old man is not the end of living but the beginning of a new life — *nevertheless I live; yet not I, but Messiah (Christ) liveth in me.* The self that served sin is put to death precisely so that the Formed One who took on flesh may live his life in the believer, the life lived by the faithfulness of the Son of Elohim.'),
  ('canon', 'romans', 6, 6, 'canon', 'colossians', 3, 9, 'free', E'*Lie not one to another, seeing that ye have put off the old man with his deeds;* (Colossians 3:9). The *old man* who *is crucified with him, that the body of sin might be destroyed* (Romans 6:6) is the old man Paul elsewhere says is *put off* — and the putting off is concrete, naming the deeds laid down. The crucifixion of the old self is not an abstraction but the end of the old deeds: the lying, the wrath, the uncleanness left behind because the old man who did them is dead.'),
  ('canon', 'romans', 6, 6, 'canon', 'colossians', 3, 10, 'free', E'*And have put on the new man, which is renewed in knowledge after the image of him that created him:* (Colossians 3:10). *That henceforth we should not serve sin* (Romans 6:6) is the destination Paul names again as putting on *the new man, which is renewed … after the image of him that created him.* The old man crucified and the new man put on are one motion: the body of sin destroyed so that the renewed self, remade after the Creator''s image, walks no longer in the service of sin.'),
  -- thread: romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid
  ('canon', 'romans', 6, 15, 'canon', 'ezekiel', 18, 21, 'free', E'*But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die.* (Ezekiel 18:21). *Shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* (Romans 6:15). To be under grace and not under the law''s condemnation is exactly the turning the prophet describes — the wicked who turns from his sins to *keep all my statutes, and do that which is lawful and right* and so lives. Grace does not loose the believer from the statutes; it is the mercy that turns him toward keeping them, that he may live and not die.'),
  ('canon', 'romans', 6, 14, 'canon', 'deuteronomy', 30, 8, 'free', E'*And thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments which I command thee this day.* (Deuteronomy 30:8). *Sin shall not have dominion over you: for ye are not under the law, but under grace* (Romans 6:14). When the heart is circumcised and the captivity turned (Deuteronomy 30:6), the fruit is the return that *obeys the voice of Yahuah (LORD), and does all his commandments* — sin no longer reigning. Being under grace, freed from sin''s dominion, is the very state in which the commandments are kept, not the state in which they are discarded.'),
  ('canon', 'romans', 6, 15, 'canon', 'john', 8, 34, 'free', E'*Yahusha (Jesus) answered them, Verily, verily, I say unto you, Whosoever committeth sin is the servant of sin.* (John 8:34). The Master''s word exposes the lie behind *shall we sin, because we are not under the law, but under grace?* (Romans 6:15). The one who returns to sin does not enter freedom but bondage — *whosoever committeth sin is the servant of sin.* To sin under cover of grace is to crawl back under the very mastery grace delivered from; it is no liberty at all.'),
  -- thread: romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk
  ('canon', 'romans', 6, 16, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). *Being then made free from sin, ye became the servants of righteousness* (Romans 6:18) — and the service of righteousness is precisely the walk the prophet promised: the Spirit put within, causing the believer to *walk in my statutes,* to *keep my judgments, and do them.* The freedom from sin is freedom INTO obedience; the same Spirit who raises from sin''s death is the Spirit who writes and keeps the statutes in the walker.'),
  ('canon', 'romans', 6, 17, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). *Ye have obeyed from the heart that form of doctrine which was delivered you* (Romans 6:17). The obedience *from the heart* is the new-covenant promise come to pass: the law written in the inward parts, in the heart, so that obedience flows from within rather than from an outward yoke. The doctrine obeyed from the heart is the Torah inscribed there by the Spirit.'),
  ('canon', 'romans', 6, 18, 'canon', 'john', 8, 36, 'free', E'*If the Son therefore shall make you free, ye shall be free indeed.* (John 8:36). *Being then made free from sin, ye became the servants of righteousness* (Romans 6:18). The freedom the Son gives is not freedom from all service but freedom from sin into the service of righteousness — the only true freedom, for the alternative is bondage to sin (John 8:34). To be made free indeed by the Son is to be loosed from sin''s mastery and bound to righteousness unto holiness.'),
  -- thread: romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life
  ('canon', 'romans', 6, 23, 'canon', 'ezekiel', 18, 4, 'free', E'*Behold, all souls are mine; as the soul of the father, so also the soul of the son is mine: the soul that sinneth, it shall die.* (Ezekiel 18:4). *For the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord* (Romans 6:23). Paul''s *wages of sin is death* is the prophet''s standing verdict — *the soul that sinneth, it shall die.* The consequence-system is not annulled by grace; it stands. What grace adds is the gift set over against the wage: eternal life given through the Master, where sin earns only death.'),
  ('canon', 'romans', 6, 21, 'canon', 'deuteronomy', 30, 19, 'free', E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). *What fruit had ye then in those things whereof ye are now ashamed? for the end of those things is death* (Romans 6:21). The two ends Paul sets before his readers — death as the end of sin, everlasting life as the end of holiness (Romans 6:22) — are the very choice Moses laid before Yashar''el (Israel): *life and death, blessing and cursing: therefore choose life.* The gospel does not erase the two ways; it presses the same choice, that the seed may live.'),
  ('canon', 'romans', 6, 22, 'canon', 'john', 8, 51, 'free', E'*Verily, verily, I say unto you, If a man keep my saying, he shall never see death.* (John 8:51). *But now being made free from sin, and become servants to Elohim (God), ye have your fruit unto holiness, and the end everlasting life* (Romans 6:22). The Master had already named the end of the keeping walk: the one who keeps his saying *shall never see death.* The fruit unto holiness whose end is everlasting life is the keeping of the King''s word — life, not death, the portion of the servant of Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid',
       E'Shall we continue in sin, that grace may abound? Elohim (God) forbid',
       E'Romans 6 opens by slamming the door on the lie that grace licenses sin: *What shall we say then? Shall we continue in sin, that grace may abound? Elohim (God) forbid. How shall we, that are dead to sin, live any longer therein?* (Romans 6:1-2). The question is not idle — it is the very abuse the false gospel makes of grace, and Paul answers it with horror. The prophets had already set the only true posture toward sin: not continuance under cover of mercy but turning. *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30); *cast away from you all your transgressions … and make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 18:31). To be dead to sin and to go on living in it are contraries — and the one given a new heart casts his transgressions away, for clinging to them is to choose death. The Master himself gave the shape of grace in one sentence to the woman not condemned: *Neither do I condemn thee: go, and sin no more* (John 8:11). The grace that does not condemn is the grace that says sin no more. Mercy is the call to turn, never the permission to abide.',
       sv.verse_id, ev.verse_id, 'free', 6125
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life',
       E'Baptized into his death — buried and raised to walk in newness of life',
       E'Paul grounds the death-to-sin in baptism: *so many of us as were baptized into Yahusha HaMashiach (Jesus Christ) were baptized into his death* (Romans 6:3), *therefore we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life* (Romans 6:4), *for if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection* (Romans 6:5). The burial and the rising are one passage, and the rising is unto a walk — *newness of life* — never a return to the old. The prophet''s cleansing water stands behind the washing: *then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25), and the very next breath gives the new heart and the new spirit that walks in his statutes. Paul says the same thing twice elsewhere: *buried with him in baptism, wherein also ye are risen with him through the faith of the operation of Elohim (God)* (Colossians 2:12) — and the rising lays an obligation: *if ye then be risen with Messiah (Christ), seek those things which are above* (Colossians 3:1). The washing is never an end in itself; it is death to the old way and entrance on the new walk.',
       sv.verse_id, ev.verse_id, 'free', 6128
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed',
       E'The old man crucified — that the body of sin might be destroyed',
       E'*Knowing this, that our old man is crucified with him, that the body of sin might be destroyed, that henceforth we should not serve sin. For he that is dead is freed from sin* (Romans 6:6-7). The crucifixion of the old man is not the end of living but its beginning under a new master. Paul says it of himself: *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me* (Galatians 2:20). The self that served sin is put to death precisely so the Formed One who took on flesh may live his life in the believer. And the death is concrete, naming the deeds laid down: *seeing that ye have put off the old man with his deeds; and have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:9-10). The old man crucified and the new man put on are one motion — the body of sin destroyed so the renewed self, remade after the Creator''s image, walks no longer in the service of sin.',
       sv.verse_id, ev.verse_id, 'free', 6131
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid',
       E'Not under the law but under grace — shall we sin? Elohim (God) forbid',
       E'*Sin shall not have dominion over you: for ye are not under the law, but under grace* (Romans 6:14). The false gospel hears in this a license: *what then? shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* (Romans 6:15). Paul recoils. To be *not under the law* is to be no longer under the law''s condemnation and death-penalty as a justifying system — not loosed to transgress. The prophet names the very turn that grace works: *if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die* (Ezekiel 18:21). And Moses had named the fruit of the circumcised heart and the turned captivity: *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments which I command thee this day* (Deuteronomy 30:8) — sin no longer reigning, the commandments kept, not discarded. The Master exposes the lie behind the question: *Whosoever committeth sin is the servant of sin* (John 8:34). To sin under cover of grace is to crawl back under the very mastery grace delivered from; it is no liberty at all. Grace breaks sin''s dominion so that the freed walk in the statutes.',
       sv.verse_id, ev.verse_id, 'free', 6134
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk',
       E'Servants of righteousness unto holiness — the new-heart walk',
       E'Freedom from sin in Romans 6 is freedom INTO obedience, never freedom from the standard: *to whom ye yield yourselves servants to obey, his servants ye are to whom ye obey; whether of sin unto death, or of obedience unto righteousness* (Romans 6:16); *being then made free from sin, ye became the servants of righteousness* (Romans 6:18); *yield your members servants to righteousness unto holiness* (Romans 6:19). This service of righteousness is precisely the walk the prophets promised. *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the same Spirit who raises from sin''s death is the Spirit who keeps the statutes in the walker. The obedience Paul praises is *from the heart*: *ye have obeyed from the heart that form of doctrine which was delivered you* (Romans 6:17), the new-covenant promise come to pass — *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33), so obedience flows from within rather than from an outward yoke. And the Son who frees does not free into idleness but into this very service: *if the Son therefore shall make you free, ye shall be free indeed* (John 8:36) — loosed from sin''s mastery, bound to righteousness unto holiness.',
       sv.verse_id, ev.verse_id, 'free', 6137
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life',
       E'The wages of sin is death — but the gift of Elohim (God) is eternal life',
       E'The chapter closes by setting the two ends side by side: *what fruit had ye then in those things whereof ye are now ashamed? for the end of those things is death* (Romans 6:21); *but now being made free from sin, and become servants to Elohim (God), ye have your fruit unto holiness, and the end everlasting life* (Romans 6:22); *for the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord* (Romans 6:23). The wage of sin is the prophet''s standing verdict, not annulled by grace: *the soul that sinneth, it shall die* (Ezekiel 18:4). The consequence-system stands; what grace adds is the gift set over against the wage. Moses had laid the same two ways before Yashar''el (Israel): *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). And the Master named the end of the keeping walk: *if a man keep my saying, he shall never see death* (John 8:51). The gospel does not erase the two ways or the death that sin earns; it presses the same choice the Torah and the prophets pressed — and holds out the gift of eternal life through the Master to the one who chooses life and bears fruit unto holiness.',
       sv.verse_id, ev.verse_id, 'free', 6140
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:30 — *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* the only true posture toward sin is turning, not continuance under cover of grace (Romans 6:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:31 — *make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* the new-heart soul casts away transgressions; to cling to them is to choose death (Romans 6:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:11 — *Neither do I condemn thee: go, and sin no more* the Master''s pardon sends to sin no more; the grace that does not condemn says sin no more (Romans 6:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 2:12 — *buried with him in baptism, wherein also ye are risen with him* the burial and rising are one passage, the rising unto a new walk (Romans 6:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:25 — *then will I sprinkle clean water upon you, and ye shall be clean* the prophet''s cleansing water, opening onto the new heart and the statute-walk (Romans 6:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 3:1 — *if ye then be risen with Messiah (Christ), seek those things which are above* the likeness of his resurrection grounds a command: seek the things above (Romans 6:5).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 2:20 — *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me* the old self put to death so the Formed One may live his life in the believer (Romans 6:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 3:9 — *ye have put off the old man with his deeds* the crucified old man is the old man put off, the old deeds left behind (Romans 6:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 3:10 — *have put on the new man, which is renewed in knowledge after the image of him that created him* the renewed self walks no longer in the service of sin (Romans 6:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:21 — *if the wicked will turn from all his sins … and keep all my statutes … he shall surely live* grace is the mercy that turns toward keeping the statutes, that he may live and not die (Romans 6:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:8 — *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments* the fruit of the circumcised heart: sin no longer reigning, the commandments kept (Romans 6:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:34 — *Whosoever committeth sin is the servant of sin* to sin under cover of grace is to crawl back under sin''s mastery; it is no liberty (Romans 6:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit who frees from sin is the Spirit who keeps the statutes in the walker (Romans 6:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* obedience from the heart is the Torah inscribed there by the Spirit (Romans 6:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:36 — *if the Son therefore shall make you free, ye shall be free indeed* the Son frees not into idleness but into the service of righteousness unto holiness (Romans 6:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:4 — *the soul that sinneth, it shall die* the prophet''s standing verdict; the wage of sin is death, not annulled by grace (Romans 6:23).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life* the same two ways Paul presses; the gospel does not erase the choice (Romans 6:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:51 — *If a man keep my saying, he shall never see death* the fruit unto holiness whose end is everlasting life is the keeping of the King''s word (Romans 6:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_romans_07.sql (S219 Romans 7) -----
-- =====================================================================
-- S219 minion — ROMANS 7 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 7.  Tag: r07 (temp view _s219_r07_lookup).  Sort band: 6150, step 3 (<6175).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#6/#10): Romans 7 EXONERATES the law and locates the problem
-- in the flesh/sin, never in Torah. *The law is holy, and the commandment holy, and just, and
-- good* (7:12); *the law is spiritual* (7:14); *I delight in the law of Elohim (God) after the
-- inward man* (7:22). The commandment Paul cites is *Thou shalt not covet* (7:7) = Exodus 20:17 /
-- Deuteronomy 5:21 — the tenth word, the law itself naming the sin. The "dead to the law" /
-- "married to another" (7:1-6) is release from the law's CONDEMNING VERDICT to serve *in newness
-- of spirit* — NOT Torah-abolition; it is the believer freed to keep the law from the heart, the
-- promise of Jeremiah 31:33 internalised. Delight-in-the-law echoes Psalm 119 / Psalm 1 / Psalm
-- 40:8. The inner war — the wretched-man cry — is the war between the inward man that loves Torah
-- and the flesh sold under sin; the Second-Temple library names the same diagnosis (the wicked
-- heart of the first Adam, not the law). The cry resolves in Romans 8: the Spirit FULFILS the
-- righteousness of the law in the walker. Never read this chapter as the law being the enemy.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   dead to the law / married to another / newness of spirit
--           Tanakh: Jeremiah 31:33 (law written on the heart — the newness of spirit)
--           Extras: none warranted
--           NT: Romans 6:14 (not under the law as condemning system), Romans 8:2 (free from the law of sin and death)
--   v.7-12  Is the law sin? God forbid / Thou shalt not covet / the law is holy and good
--           Tanakh: Exodus 20:17, Deuteronomy 5:21 (the very commandment Paul cites)
--           Extras: none warranted
--           NT: none added (the vindication carried by the cited commandment + the delight thread)
--   v.13-23 the law is spiritual / I delight in the law of Elohim after the inward man / inner war
--           Tanakh: Psalm 1:2, Psalm 40:8, Psalm 119:97 (delight in the law)
--           Extras: 2 Esdras 3:21-22 + 7:48 (the wicked heart of the first Adam is the problem, not the law)
--           NT: none added (the inner-war resolution carried by the Romans 8 thread)
--   v.24-25 O wretched man / who shall deliver me / the resolution
--           Tanakh: none warranted
--           Extras: none warranted
--           NT: Romans 8:1, 8:2, 8:4 (no condemnation; the Spirit fulfils the righteousness of the law)
--
-- THREADS (slug -> target libraries):
--   6150 romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart   (Tanakh + NT)
--   6153 romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet                                (Tanakh)
--   6156 romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good                    (Tanakh)
--   6159 romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man                           (Tanakh)
--   6162 romans-7-the-wicked-heart-of-the-first-adam-not-the-law                                (Extras)
--   6165 romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8               (NT)
-- =====================================================================

CREATE TEMP VIEW _s219_r07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart
  ('canon', 'romans', 7, 6, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). *But now we are delivered from the law, that being dead wherein we were held; that we should serve in newness of spirit, and not in the oldness of the letter* (Romans 7:6). The deliverance is not from the law but from the bondage of the letter that held and condemned; the *newness of spirit* is exactly the covenant the prophet promised — the law no longer outside as a verdict against the flesh but *in their inward parts,* written on the heart. To serve in newness of spirit is to keep the law from within, not to be loosed from it.'),
  ('canon', 'romans', 7, 4, 'canon', 'romans', 6, 14, 'free', E'*For sin shall not have dominion over you: for ye are not under the law, but under grace.* (Romans 6:14). *Wherefore, my brethren, ye also are become dead to the law by the body of Messiah (Christ); that ye should be married to another, even to him who is raised from the dead, that we should bring forth fruit unto Elohim (God)* (Romans 7:4). To be *dead to the law* and *not under the law* is one thing said twice: released from the law''s condemning dominion over the flesh — its verdict of death against the transgressor — so that, joined to the risen One, the believer *should bring forth fruit unto Elohim.* It is not freedom to transgress but freedom from condemnation, that the law might be kept in fruitfulness instead of death.'),
  ('canon', 'romans', 7, 4, 'canon', 'romans', 8, 2, 'free', E'*For the law of the Spirit of life in HaMashiach Yahusha (Christ Jesus) hath made me free from the law of sin and death.* (Romans 8:2). Joined *to him who is raised from the dead, that we should bring forth fruit unto Elohim (God)* (Romans 7:4), the believer is set free — but the freedom is named precisely: *free from the law of sin and death,* not free from the holy commandment. The dominion broken is sin''s death-grip on the flesh; the marriage is to the living One, that the fruit unto Elohim might come where only death came before.'),
  -- thread: romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet
  ('canon', 'romans', 7, 7, 'canon', 'exodus', 20, 17, 'free', E'*Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s.* (Exodus 20:17). *Is the law sin? Elohim (God) forbid. Nay, I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7). The very commandment Paul names is the tenth word spoken from Sinai. The law is not sin — it is the lamp that exposes sin; without *Thou shalt not covet* the covetousness in the flesh would never be known for what it is. The commandment diagnoses the disease; it does not cause it.'),
  ('canon', 'romans', 7, 7, 'canon', 'deuteronomy', 5, 21, 'free', E'*Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house, his field, or his manservant, or his maidservant, his ox, or his ass, or any thing that is thy neighbour''s.* (Deuteronomy 5:21). Paul cites this same word — *except the law had said, Thou shalt not covet* (Romans 7:7) — the tenth commandment that reaches past the hand to the heart, naming desire itself. It is the commandment that lays the inward man bare; by it Paul *had not known lust.* The law that names the hidden sin is the law that is *holy, and the commandment holy, and just, and good* (Romans 7:12).'),
  -- thread: romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good
  ('canon', 'romans', 7, 12, 'canon', 'psalms', 19, 7, 'free', E'*The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalm 19:7). *Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12). The verdict Paul reaches is the psalmist''s own: the law of Yahuah is *perfect,* the testimony *sure,* the statutes *right,* the commandment *pure* (Psalm 19:7-8). Where men would put the law on trial, both psalm and apostle acquit it utterly and put the flesh on trial instead — the law converts the soul; sin works death by that which is good.'),
  ('canon', 'romans', 7, 14, 'canon', 'nehemiah', 9, 13, 'free', E'*Thou camest down also upon mount Sinai, and spakest with them from heaven, and gavest them right judgments, and true laws, good statutes and commandments:* (Nehemiah 9:13). *For we know that the law is spiritual: but I am carnal, sold under sin* (Romans 7:14). What came down at Sinai were *true laws, good statutes and commandments* — the law is spiritual because it is from heaven, given by the Spirit''s own hand. The fault Paul confesses is never in the law but in the carnal man *sold under sin;* the spiritual law meets the carnal flesh, and the flesh is found wanting, not the law.'),
  -- thread: romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man
  ('canon', 'romans', 7, 22, 'canon', 'psalms', 1, 2, 'free', E'*But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* (Psalm 1:2). *For I delight in the law of Elohim (God) after the inward man* (Romans 7:22). Paul''s inward man is the blessed man of the first psalm — the one whose *delight is in the law of Yahuah,* who meditates in it day and night, planted like a tree by the rivers of water. The Torah is not the enemy of the regenerate heart but its joy; the believer delights in the very law the flesh wars against.'),
  ('canon', 'romans', 7, 22, 'canon', 'psalms', 40, 8, 'free', E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* (Psalm 40:8). *For I delight in the law of Elohim (God) after the inward man* (Romans 7:22). The psalmist speaks Paul''s inward man exactly: *thy law is within my heart.* This is the law internalised, the delight of the renewed man — the same law-within-the-heart that Jeremiah promised and that Romans 7 confesses against the warring flesh. To delight in the law after the inward man is to carry the law within, not to stand outside it.'),
  ('canon', 'romans', 7, 22, 'canon', 'psalms', 119, 97, 'free', E'*O how love I thy law! it is my meditation all the day.* (Psalm 119:97). *For I delight in the law of Elohim (God) after the inward man* (Romans 7:22). The whole of the great psalm is the inward man''s love of the Torah, and this verse is its cry: *O how love I thy law!* Paul''s delight is no new posture but the ancient love of the righteous for the commandment. The man at war in Romans 7 is at war precisely because he loves the law the flesh resists — the conflict proves the love, and the love proves the law good.'),
  -- thread: romans-7-the-wicked-heart-of-the-first-adam-not-the-law
  ('canon', 'romans', 7, 17, 'apocrypha', '2-esdras', 3, 21, 'extras', E'*For the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him.* (2 Esdras 3:21). *Now then it is no more I that do it, but sin that dwelleth in me* (Romans 7:17). The library names the same diagnosis Paul confesses: the wicked heart inherited from the first Adam, *and so be all they that are born of him* — the indwelling sin, the flesh sold under sin, not the law. The transgression came of the wicked heart that was *not taken away,* and that heart, not the holy commandment, is the thing that *dwelleth in me.*'),
  ('canon', 'romans', 7, 18, 'apocrypha', '2-esdras', 3, 22, 'extras', E'*Thus infirmity was made permanent; and the law (also) in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still.* (2 Esdras 3:22). *For I know that in me (that is, in my flesh,) dwelleth no good thing: for to will is present with me; but how to perform that which is good I find not* (Romans 7:18). Here is Romans 7 in the older book: the law set in the heart, yet *the malignity of the root* remaining, *so that the good departed away, and the evil abode still.* The will to good is present; the flesh with its inherited root will not perform it. The law is good; the infirmity made permanent in the flesh is the failure.'),
  ('canon', 'romans', 7, 24, 'apocrypha', '2-esdras', 7, 48, 'extras', E'*O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you.* (2 Esdras 7:48). *O wretched man that I am! who shall deliver me from the body of this death?* (Romans 7:24). The wretched cry has the same root the library names: the fall of the first Adam carried into all who come of him, *the body of this death.* It is not the law that holds the man captive to death but the Adamic flesh; the deliverance sought is from the body, not from the commandment — and the answer comes in the One who undoes what Adam did.'),
  -- thread: romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8
  ('canon', 'romans', 7, 24, 'canon', 'romans', 8, 1, 'free', E'*There is therefore now no condemnation to them which are in HaMashiach Yahusha (Christ Jesus), who walk not after the flesh, but after the Spirit.* (Romans 8:1). *O wretched man that I am! who shall deliver me from the body of this death?* (Romans 7:24). The cry of the wretched man is answered in the next breath: the deliverance from *the body of this death* is that there is *now no condemnation* to those in the Messiah who *walk not after the flesh, but after the Spirit.* The captivity to the law of sin in the members is broken — not by abolishing the law of Elohim, but by the Spirit setting the man free to walk.'),
  ('canon', 'romans', 7, 25, 'canon', 'romans', 8, 2, 'free', E'*For the law of the Spirit of life in HaMashiach Yahusha (Christ Jesus) hath made me free from the law of sin and death.* (Romans 8:2). *I thank Elohim (God) through Yahusha HaMashiach (Jesus Christ) our Lord. So then with the mind I myself serve the law of Elohim (God); but with the flesh the law of sin* (Romans 7:25). The thanks is the turn of the whole chapter: the divided man who serves the law of Elohim with the mind while the flesh serves the law of sin is set free by *the law of the Spirit of life* — freed from *the law of sin and death* that warred in his members. The Spirit does not loose him from the law of Elohim he loves but from the sin that captured him.'),
  ('canon', 'romans', 7, 25, 'canon', 'romans', 8, 4, 'free', E'*That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* (Romans 8:4). *So then with the mind I myself serve the law of Elohim (God); but with the flesh the law of sin* (Romans 7:25). The mind that serves *the law of Elohim* is brought through to its end in the Spirit: *the righteousness of the law … fulfilled in us, who walk … after the Spirit.* What the inward man delighted in but the flesh could not perform, the Spirit now fulfils in the walker. The Spirit and the Torah are one work — the chapter that confessed the war ends with the law of Elohim kept, not cast off.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart',
       E'Dead to the law — to serve in newness of spirit, the law written on the heart',
       E'The opening of Romans 7 is the most twisted passage in the chapter, and the marriage figure governs it: as a woman is loosed from the law of her husband when he dies, so *ye also are become dead to the law by the body of Messiah (Christ); that ye should be married to another, even to him who is raised from the dead, that we should bring forth fruit unto Elohim (God)* (Romans 7:4). What is broken is not the holy commandment but the law''s condemning verdict against the flesh — the death-grip under which the transgressor stood. Paul says the same thing two ways: *for sin shall not have dominion over you: for ye are not under the law, but under grace* (Romans 6:14), and *the law of the Spirit of life in HaMashiach Yahusha (Christ Jesus) hath made me free from the law of sin and death* (Romans 8:2). The dominion broken is sin''s, the death-grip broken is death''s; the marriage is to the living One that fruit might come where only death came before. And the end of the matter is the covenant the prophet promised: *now we are delivered from the law, that being dead wherein we were held; that we should serve in newness of spirit, and not in the oldness of the letter* (Romans 7:6) — exactly *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). To serve in newness of spirit is not to be loosed from the law but to keep it from within, the letter that condemned now written on the heart that loves it.',
       sv.verse_id, ev.verse_id, 'free', 6150
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet',
       E'Is the law sin? Elohim (God) forbid — Thou shalt not covet',
       E'Paul asks the question the antichrist reading wants answered yes, and he slams the door on it: *What shall we say then? Is the law sin? Elohim (God) forbid* (Romans 7:7). Far from being sin, the law is what reveals sin: *Nay, I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7). The commandment he names is the tenth word spoken from Sinai — *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife … nor any thing that is thy neighbour''s* (Exodus 20:17), repeated in the second giving: *neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house … or any thing that is thy neighbour''s* (Deuteronomy 5:21). This is the commandment that reaches past the hand to the heart, naming desire itself. Sin took occasion *by the commandment* and wrought all manner of concupiscence, but the commandment did not make the sin — it exposed it. The lamp is not the darkness it reveals. The law that lays the inward man bare is the holy diagnostic of the disease in the flesh, never its cause.',
       sv.verse_id, ev.verse_id, 'free', 6153
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good',
       E'The law is holy, and the commandment holy, and just, and good',
       E'This is the verse the whole chapter is built to reach, and it is the verdict no twisting can overturn: *Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12). And again, lest it be missed: *for we know that the law is spiritual: but I am carnal, sold under sin* (Romans 7:14). Where men would put the Torah on trial, Paul acquits it utterly and arraigns the flesh instead. The psalmist had already pronounced the same acquittal: *the law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7). And the law is spiritual because of where it came from — *thou camest down also upon mount Sinai, and spakest with them from heaven, and gavest them right judgments, and true laws, good statutes and commandments* (Nehemiah 9:13). The law is holy because the One who gave it is holy; it is spiritual because it descended from heaven by the Spirit''s own hand. The fault is never in the commandment but in the carnal man sold under sin. Sin worked death *by that which is good* — and so the good is proved good, and sin proved exceeding sinful, the law standing innocent over the grave it never dug.',
       sv.verse_id, ev.verse_id, 'free', 6156
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man',
       E'I delight in the law of Elohim (God) after the inward man',
       E'At the heart of the inner war stands the line that settles which side the regenerate man is on: *I delight in the law of Elohim (God) after the inward man* (Romans 7:22). The man at war does not hate the law — he loves it; the war is between the inward man that delights in the Torah and *another law in my members, warring against the law of my mind* (Romans 7:23). This delight is the ancient posture of the righteous. The first psalm opens with it: *his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2). David carried it within: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8) — the law internalised, the very law-in-the-heart Jeremiah promised. And the great psalm cries it outright: *O how love I thy law! it is my meditation all the day* (Psalm 119:97). The inward man of Romans 7 is the blessed man of Psalm 1, the law-loving heart of Psalm 40, the lover of the commandment in Psalm 119. The conflict proves the love, and the love proves the law good: a man does not war against his flesh to keep what is evil. He wars to keep what he delights in — the holy, just, and good law of Elohim.',
       sv.verse_id, ev.verse_id, 'free', 6159
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-the-wicked-heart-of-the-first-adam-not-the-law',
       E'The wicked heart of the first Adam — not the law',
       E'Romans 7 locates the captivity precisely: *now then it is no more I that do it, but sin that dwelleth in me* (Romans 7:17); *for I know that in me (that is, in my flesh,) dwelleth no good thing* (Romans 7:18). The diagnosis is the indwelling sin of the flesh, never the law — and the restored library names the same root in the same terms. The wicked heart inherited from the first Adam is the thing that dwells in the man: *for the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him* (2 Esdras 3:21). The library even sets the law within the heart and still finds the flesh failing: *the law (also) in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still* (2 Esdras 3:22) — the will to good present, the flesh with its inherited root refusing to perform it, which is Romans 7:18 word for word in an older book. And the wretched cry has the same Adamic root: *O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you* (2 Esdras 7:48) — *the body of this death* (Romans 7:24) is the Adamic flesh carried into all who come of him. The law set in the heart is good; the malignity of the root is the failure; the deliverance sought is from the body of death, not from the commandment — and it comes in the One who undoes what the first Adam did.',
       sv.verse_id, ev.verse_id, 'extras', 6162
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8',
       E'O wretched man — who shall deliver me — the resolution in Romans 8',
       E'The chapter ends not in despair but in thanksgiving, and the cry is answered before the page turns: *O wretched man that I am! who shall deliver me from the body of this death? I thank Elohim (God) through Yahusha HaMashiach (Jesus Christ) our Lord. So then with the mind I myself serve the law of Elohim (God); but with the flesh the law of sin* (Romans 7:24-25). The divided man — mind serving the law of Elohim, flesh serving the law of sin — is delivered in the very next breath. *There is therefore now no condemnation to them which are in HaMashiach Yahusha (Christ Jesus), who walk not after the flesh, but after the Spirit* (Romans 8:1). The captivity to the law of sin in the members is broken: *the law of the Spirit of life in HaMashiach Yahusha (Christ Jesus) hath made me free from the law of sin and death* (Romans 8:2) — freed not from the law of Elohim he loves but from the sin that captured him. And the deliverance has a destination that vindicates the whole chapter: *that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). What the inward man delighted in but the flesh could not perform, the Spirit now fulfils in the walker. The Spirit and the Torah are one work. The chapter that confessed the war ends with the law of Elohim kept — not cast off — by the power of the Spirit of life.',
       sv.verse_id, ev.verse_id, 'free', 6165
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:14 — *ye are not under the law, but under grace* the same thing as dead to the law: released from the law''s condemning dominion over the flesh, not freed to transgress (Romans 7:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:2 — *made me free from the law of sin and death* the freedom named precisely: from sin''s death-grip on the flesh, not from the holy commandment (Romans 7:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the newness of spirit is the law internalised, not abolished — the covenant promised (Romans 7:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:17 — *Thou shalt not covet thy neighbour''s house … nor any thing that is thy neighbour''s* the tenth word from Sinai, the very commandment Paul cites; the law exposes sin, it is not sin (Romans 7:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:21 — *neither shalt thou desire thy neighbour''s wife … or any thing that is thy neighbour''s* the same commandment in the second giving, reaching past the hand to the heart, naming desire itself (Romans 7:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *the law of Yahuah (LORD) is perfect, converting the soul* the psalmist''s acquittal of the law that Paul reaches: holy, just, and good (Romans 7:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:13 — *gavest them … true laws, good statutes and commandments* the law is spiritual because it came down from heaven by the Spirit''s hand; the fault is in the carnal flesh (Romans 7:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:2 — *his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* the inward man of Romans 7 is the blessed man of the first psalm (Romans 7:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 40:8 — *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* the law internalised, the inward man''s delight Paul confesses (Romans 7:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:97 — *O how love I thy law! it is my meditation all the day* the ancient love of the righteous for the commandment; the war proves the love (Romans 7:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=97
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-the-wicked-heart-of-the-first-adam-not-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 3:21 — *the first Adam bearing a wicked heart transgressed … and so be all they that are born of him* the indwelling sin Paul confesses, the inherited wicked heart, not the law (Romans 7:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-wicked-heart-of-the-first-adam-not-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 3:22 — *the law (also) in the heart … with the malignity of the root; so that the good departed away, and the evil abode still* the will to good present, the flesh''s root refusing to perform it (Romans 7:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-wicked-heart-of-the-first-adam-not-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 7:48 — *O you Adam, what have you done? … you are not fallen alone, but we all that come of you* the Adamic flesh carried into all, the body of this death (Romans 7:24).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-wicked-heart-of-the-first-adam-not-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 8:1 — *there is therefore now no condemnation to them which are in HaMashiach Yahusha (Christ Jesus), who walk not after the flesh, but after the Spirit* the wretched cry answered: deliverance from the body of this death (Romans 7:24).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:2 — *the law of the Spirit of life … hath made me free from the law of sin and death* the divided man freed from the sin that captured him, not from the law of Elohim he loves (Romans 7:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:4 — *that the righteousness of the law might be fulfilled in us, who walk … after the Spirit* what the inward man delighted in but the flesh could not perform, the Spirit fulfils; the law kept, not cast off (Romans 7:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_romans_08.sql (S219 Romans 8) -----
-- =====================================================================
-- S219 minion — ROMANS 8 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 8.  Tag: r08 (temp view _s219_r08_lookup).  Sort band: 6175, step 3 (<6200).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#6/#7): Romans 8 is the chapter most weaponized against the
-- law, and the weapon is the misreading of *no condemnation … who walk not after the flesh, but
-- after the Spirit* (8:1) as freedom-from-Torah. The chapter says the opposite. *That the
-- righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the
-- Spirit* (8:4) — the Spirit WRITES and FULFILLS the Torah in the walker; the two are one work,
-- never opposed. The carnal mind *is not subject to the law of Elohim (God)* (8:7) — the flesh is
-- the enemy of the law, the Spirit its fulfilment. This is exactly the new-covenant promise of
-- the prophets: *I will put my law in their inward parts, and write it in their hearts*
-- (Jeremiah 31:33); *I will put my spirit within you, and cause you to walk in my statutes, and
-- ye shall keep my judgments, and do them* (Ezekiel 36:27). Led by the Spirit = sons (8:14); the
-- Spirit of adoption, heirs (8:15-17). Creation groans for the redemption / the manifestation of
-- the sons (8:19-23) — the ground cursed at Eden (Genesis 3:17) waiting for the restoration the
-- prophet saw (Isaiah 11). *For thy sake we are killed all the day long* (8:36) = Psalm 44:22,
-- and the psalm names the slain as the covenant-faithful whose *steps declined* not from his way.
-- Nothing separates from the love of Elohim (8:35-39).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   no condemnation / righteousness of the law fulfilled by the Spirit
--           Tanakh: Jeremiah 31:33 (law in inward parts), Ezekiel 36:27 (Spirit causes walking)  Extras: none warranted  NT: none added (Romans 7:22-25 carried in prose; same hand)
--   v.5-8   carnal mind enmity, not subject to the law of Elohim
--           Tanakh: none added (carried at v.1-4)  Extras: none warranted  NT: none warranted
--   v.9-14  Spirit dwells / quickens mortal bodies / led by the Spirit are sons
--           Tanakh: Ezekiel 36:26 (new heart), Ezekiel 37:14 (Spirit put in you, ye shall live)  Extras: none warranted  NT: none added (Galatians carried at v.14-17)
--   v.14-17 Spirit of adoption, Abba, heirs, joint-heirs
--           Tanakh: none warranted  Extras: none warranted  NT: Galatians 4:6 (Spirit of his Son, Abba), Galatians 5:18 (led of the Spirit, not under the law)
--   v.18-23 creation groaneth, waiteth for the manifestation of the sons / redemption of the body
--           Tanakh: Genesis 3:17 (ground cursed), Isaiah 11:6 (the restored creation), Isaiah 11:9 (none hurt nor destroy)  Extras: none warranted  NT: none warranted
--   v.24-30 hope, the Spirit's intercession, foreknown, predestinate, glorified
--           Tanakh: none warranted (the chain is internal)  Extras: none warranted  NT: none warranted
--   v.31-34 if Elohim be for us / who shall lay charge / who condemneth
--           Tanakh: Isaiah 50:8 (who will contend with me), Isaiah 50:9 (who is he that shall condemn me)  Extras: none warranted  NT: none warranted
--   v.35-39 killed all the day long / nothing separates from the love of Elohim
--           Tanakh: Psalm 44:22 (quoted verbatim), Psalm 44:18 (steps declined not from thy way)  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   6175 romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit        (Tanakh)
--   6178 romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks          (Tanakh)
--   6181 romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons                  (NT)
--   6184 romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons      (Tanakh)
--   6187 romans-8-who-shall-lay-charge-who-condemneth-isaiah                          (Tanakh)
--   6190 romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44               (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s219_r08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit
  ('canon', 'romans', 8, 4, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The whole purpose of the Son sent and sin condemned in the flesh is *that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). This is the new covenant the prophet foretold: not the law abolished but the law *put in their inward parts* and *written in their hearts.* The Spirit who fulfils the righteousness of the law in the walker is the Spirit who writes that very law within — the two are one work, never opposed.'),
  ('canon', 'romans', 8, 4, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The Spirit-walk Paul names — *who walk not after the flesh, but after the Spirit* (Romans 8:4) — is exactly what the prophet promised the Spirit would do: *cause you to walk in my statutes,* that *ye shall keep my judgments, and do them.* The indwelling Spirit does not lead away from the commandments; he is given precisely to bring about their doing. The righteousness of the law fulfilled in us is the Spirit keeping the statutes through us.'),
  ('canon', 'romans', 8, 7, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). *Because the carnal mind is enmity against Elohim (God): for it is not subject to the law of Elohim (God), neither indeed can be* (Romans 8:7). It is the flesh, not the Spirit, that cannot be subject to the law. The promised Spirit is the One who causes the walk in the statutes; the carnal mind is its enemy. The chapter pits the flesh against the law, never the Spirit against the law.'),
  -- thread: romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks
  ('canon', 'romans', 8, 11, 'canon', 'ezekiel', 37, 14, 'free', E'*And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it, saith Yahuah (LORD).* (Ezekiel 37:14). *But if the Spirit of him that raised up Yahusha (Jesus) from the dead dwell in you, he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* (Romans 8:11). The prophet stood in the valley of dry bones and heard the promise: *I will put my spirit in you, and ye shall live.* Paul names the same Spirit, now indwelling, who quickens the mortal body — the resurrection-life of the whole house of Yashar''el (Israel) the prophet saw, worked by the Spirit that raised the Messiah.'),
  ('canon', 'romans', 8, 13, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). *For if ye live after the flesh, ye shall die: but if ye through the Spirit do mortify the deeds of the body, ye shall live* (Romans 8:13). The mortifying of the deeds of the body *through the Spirit* is the new heart at work — the stony heart taken away, the heart of flesh given, the new spirit put within. Death follows the old flesh; life follows the Spirit that the prophet said Yahuah (LORD) would put within his people.'),
  ('canon', 'romans', 8, 14, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). *For as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God)* (Romans 8:14). To be *led by the Spirit* is to be caused to *walk in my statutes* and to *keep my judgments, and do them.* The leading and the walking are one motion. The sons of Elohim are marked not by escape from the commandments but by the Spirit''s work of keeping them — the promise of the new heart bearing its fruit.'),
  -- thread: romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons
  ('canon', 'romans', 8, 15, 'canon', 'galatians', 4, 6, 'free', E'*And because ye are sons, Elohim (God) hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father.* (Galatians 4:6). *For ye have not received the spirit of bondage again to fear; but ye have received the Spirit of adoption, whereby we cry, Abba, Father* (Romans 8:15). Paul says the same thing twice: the Spirit poured into the heart is the Spirit of the Son, and he cries *Abba, Father.* The order is the framework''s own — *because ye are sons,* the Spirit is sent; the Spirit reveals the sonship that was already true, the scattered seed brought to know the Father who was always theirs.'),
  ('canon', 'romans', 8, 14, 'canon', 'galatians', 5, 18, 'free', E'*But if ye be led of the Spirit, ye are not under the law.* (Galatians 5:18). *For as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God)* (Romans 8:14). To be *led of the Spirit* is to be no longer *under the law* — under its condemnation and penalty as a system that holds the transgressor; it is never freedom to transgress. The same Spirit who leads the sons is the One who causes the walk in the statutes. Led by the Spirit, the son is lifted out from under the law''s sentence and set to keep it from the heart.'),
  -- thread: romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons
  ('canon', 'romans', 8, 20, 'canon', 'genesis', 3, 17, 'free', E'*And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* (Genesis 3:17). *For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20). The subjection of the creature to vanity is the curse spoken in the garden: *cursed is the ground for thy sake.* The ground was bound to thorn and sorrow not for its own fault but by reason of Adam''s fall — subjected, yet *in hope,* groaning toward the day the curse is lifted.'),
  ('canon', 'romans', 8, 21, 'canon', 'isaiah', 11, 6, 'free', E'*The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them.* (Isaiah 11:6). *Because the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God)* (Romans 8:21). The deliverance of the creature from the bondage of corruption is the restored creation the prophet saw: wolf with lamb, leopard with kid, a little child leading them. The same root of Jesse who fulfils the law by the Spirit unbinds the very ground from the curse — the creation set free with the children of Elohim.'),
  ('canon', 'romans', 8, 22, 'canon', 'isaiah', 11, 9, 'free', E'*They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* (Isaiah 11:9). *For we know that the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). The travail of the whole creation strains toward the mountain where *they shall not hurt nor destroy,* where the earth is *full of the knowledge of Yahuah (LORD), as the waters cover the sea.* The groaning is birth-pain, not despair — the creation labouring toward the day the prophet promised, the manifestation of the sons.'),
  -- thread: romans-8-who-shall-lay-charge-who-condemneth-isaiah
  ('canon', 'romans', 8, 33, 'canon', 'isaiah', 50, 8, 'free', E'*He is near that justifieth me; who will contend with me? let us stand together: who is mine adversary? let him come near to me.* (Isaiah 50:8). *Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth* (Romans 8:33). Paul presses the prophet''s own challenge: with Yahuah (LORD) *near that justifieth,* who dares contend? The adversary who would lay a charge is summoned to come near — and falls silent, for the One who justifies has spoken. The elect stand because Elohim himself is their justifier.'),
  ('canon', 'romans', 8, 34, 'canon', 'isaiah', 50, 9, 'free', E'*Behold, Adonai Yahuah (the Lord GOD) will help me; who is he that shall condemn me? lo, they all shall wax old as a garment; the moth shall eat them up.* (Isaiah 50:9). *Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again, who is even at the right hand of Elohim (God), who also maketh intercession for us* (Romans 8:34). The prophet''s cry — *who is he that shall condemn me?* — is answered in the risen Messiah at the right hand, interceding. The condemners *wax old as a garment;* the One who died and rose abides to plead for his own. No condemnation stands where he is the advocate.'),
  -- thread: romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44
  ('canon', 'romans', 8, 36, 'canon', 'psalms', 44, 22, 'free', E'*Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter.* (Psalm 44:22). *As it is written, For thy sake we are killed all the day long; we are accounted as sheep for the slaughter* (Romans 8:36). Paul quotes the psalm word for word. The suffering of the faithful is not a sign of separation from the love of Elohim but the very portion of those who belong to him — slain *for thy sake,* counted as sheep for the slaughter, yet held fast.'),
  ('canon', 'romans', 8, 35, 'canon', 'psalms', 44, 18, 'free', E'*Our heart is not turned back, neither have our steps declined from thy way;* (Psalm 44:18). *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35). The psalm Paul quotes names the slaughtered plainly: those whose *heart is not turned back, neither have our steps declined from thy way.* The sheep for the slaughter are the covenant-faithful walking in his way — not the lawless. Tribulation and sword fall on the faithful and cannot separate them; their steps had not declined, and the love of Messiah holds them through every peril.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit',
       E'The righteousness of the law fulfilled in us by the Spirit',
       E'This is the chapter most often turned into a weapon against the law, and the turning rests on misreading *who walk not after the flesh, but after the Spirit* (Romans 8:1) as freedom from the commandments. The chapter says the opposite. The Son was sent and sin was condemned in the flesh *that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). The Spirit-walk is the law fulfilled, not the law set aside. And it is the carnal mind, not the Spirit, that stands against the commandments: *the carnal mind is enmity against Elohim (God): for it is not subject to the law of Elohim (God), neither indeed can be* (Romans 8:7). The flesh is the law''s enemy; the Spirit is its fulfilment. This is precisely the new covenant the prophets promised — not Torah abolished but Torah internalised: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). And the Spirit given is given to do this very thing: *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit who writes the law within is the Spirit who keeps it through the walker. The Spirit and the Torah are one work, never opposed.',
       sv.verse_id, ev.verse_id, 'free', 6175
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks',
       E'I will put my spirit within you — the new heart that walks',
       E'The indwelling Spirit of Romans 8 is the Spirit the prophets said Yahuah (LORD) would put within his people. *But if the Spirit of him that raised up Yahusha (Jesus) from the dead dwell in you, he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* (Romans 8:11) — and Ezekiel had stood in the valley of dry bones and heard the same promise to the whole house of Yashar''el (Israel): *I will put my spirit in you, and ye shall live* (Ezekiel 37:14). The mortifying of the deeds of the body is the new heart at work: *if ye through the Spirit do mortify the deeds of the body, ye shall live* (Romans 8:13) — the heart of stone taken away, the heart of flesh given, *a new heart also will I give you, and a new spirit will I put within you* (Ezekiel 36:26). And to be *led by the Spirit of Elohim (God)* and so be *the sons of Elohim (God)* (Romans 8:14) is to be caused to *walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The leading, the new heart, the resurrection-life, and the walking in the statutes are one promise — the Spirit given precisely to bring the commandments to their doing.',
       sv.verse_id, ev.verse_id, 'free', 6178
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons',
       E'The Spirit of adoption — led by the Spirit are sons',
       E'*For as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God)* (Romans 8:14); *ye have received the Spirit of adoption, whereby we cry, Abba, Father* (Romans 8:15); *and if children, then heirs; heirs of Elohim (God), and joint-heirs with Messiah (Christ)* (Romans 8:17). Paul says the same in his letter to the Galatians, and the order there is the framework''s own: *because ye are sons, Elohim (God) hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father* (Galatians 4:6). The Spirit is sent *because* they are sons — he reveals the sonship that was already theirs, the scattered seed brought home to the Father who was always their Father. And the leading of this Spirit is no licence: *if ye be led of the Spirit, ye are not under the law* (Galatians 5:18) — lifted out from under the law''s condemnation and penalty, the son is set to keep the law from the heart, for the same Spirit who leads is the One who causes the walk in the statutes. Led by the Spirit, crying Abba, the heir walks as a son.',
       sv.verse_id, ev.verse_id, 'free', 6181
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons',
       E'The whole creation groaneth for the manifestation of the sons',
       E'*For the earnest expectation of the creature waiteth for the manifestation of the sons of Elohim (God)* (Romans 8:19); *the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20); *the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). The subjection of the creation to vanity is the curse spoken over Adam in the garden: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). The ground was bound to thorn and sorrow not for its own fault but by reason of the fall — subjected, yet in hope. And the hope is the restored creation the prophet saw under the root of Jesse: *the wolf also shall dwell with the lamb, and the leopard shall lie down with the kid … and a little child shall lead them* (Isaiah 11:6), the mountain where *they shall not hurt nor destroy … for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). The groaning is birth-pain, not despair: *the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God)* (Romans 8:21). The same root of Jesse who fulfils the law by the Spirit will unbind the ground itself from the curse, and the creation labours toward that day — the manifestation of the sons.',
       sv.verse_id, ev.verse_id, 'free', 6184
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-who-shall-lay-charge-who-condemneth-isaiah',
       E'Who shall lay a charge, who condemneth — the prophet''s challenge answered',
       E'*Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth. Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again, who is even at the right hand of Elohim (God), who also maketh intercession for us* (Romans 8:33-34). Paul is pressing the prophet''s own courtroom challenge. *He is near that justifieth me; who will contend with me? let us stand together: who is mine adversary? let him come near to me* (Isaiah 50:8) — with Yahuah (LORD) near to justify, the adversary who would lay a charge is summoned forward, and falls silent. *Behold, Adonai Yahuah (the Lord GOD) will help me; who is he that shall condemn me? lo, they all shall wax old as a garment; the moth shall eat them up* (Isaiah 50:9). The condemners wax old as a garment; the One who died and rose abides at the right hand, interceding for his own. There is therefore now no condemnation (Romans 8:1) — not because the law is silenced, but because the elect''s justifier is Elohim himself and their advocate is the risen Messiah.',
       sv.verse_id, ev.verse_id, 'free', 6187
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44',
       E'For thy sake we are killed all the day long — Psalm 44',
       E'*Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35). Paul answers with the psalm, quoted word for word: *As it is written, For thy sake we are killed all the day long; we are accounted as sheep for the slaughter* (Romans 8:36) — *Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter* (Psalm 44:22). And the psalm names plainly who the slaughtered are: *our heart is not turned back, neither have our steps declined from thy way* (Psalm 44:18). The sheep for the slaughter are the covenant-faithful, those whose steps had not declined from his way — not the lawless. Suffering is no sign of separation from the love of Elohim; it is the very portion of those who belong to him and walk in his way. *Nay, in all these things we are more than conquerors through him that loved us* (Romans 8:37), and *neither death, nor life … nor any other creature, shall be able to separate us from the love of Elohim (God), which is in HaMashiach Yahusha (Christ Jesus) our Lord* (Romans 8:38-39). The faithful are slain and held fast at once — nothing severs them from his love.',
       sv.verse_id, ev.verse_id, 'free', 6190
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the new covenant is Torah internalised, not abolished; the Spirit fulfils the very law he writes within (Romans 8:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit-walk Paul names is the Spirit causing the keeping of the statutes (Romans 8:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:27 — *cause you to walk in my statutes, and ye shall keep my judgments, and do them* it is the carnal mind, not the Spirit, that *is not subject to the law of Elohim (God)* (Romans 8:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:14 — *I will put my spirit in you, and ye shall live* the valley of dry bones: the indwelling Spirit quickens the mortal body (Romans 8:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:26 — *a new heart also will I give you … I will give you an heart of flesh* the mortifying of the deeds of the body through the Spirit is the new heart at work (Romans 8:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:27 — *cause you to walk in my statutes* to be led by the Spirit and be a son is to be caused to walk in the statutes (Romans 8:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 4:6 — *because ye are sons, Elohim (God) hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father* the Spirit reveals the sonship already true, the scattered seed brought home (Romans 8:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:18 — *if ye be led of the Spirit, ye are not under the law* led out from under the law''s sentence, the son is set to keep it from the heart — never freedom to transgress (Romans 8:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 — *cursed is the ground for thy sake; in sorrow shalt thou eat of it* the creature subjected to vanity is the ground bound by the curse, in hope (Romans 8:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:6 — *the wolf also shall dwell with the lamb … and a little child shall lead them* the deliverance of the creature from corruption is the restored creation under the root of Jesse (Romans 8:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:9 — *they shall not hurt nor destroy in all my holy mountain … the earth shall be full of the knowledge of Yahuah (LORD)* the groaning is birth-pain straining toward that mountain (Romans 8:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-who-shall-lay-charge-who-condemneth-isaiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 50:8 — *He is near that justifieth me; who will contend with me?* the adversary who would lay a charge is summoned forward and falls silent (Romans 8:33).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-who-shall-lay-charge-who-condemneth-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 50:9 — *who is he that shall condemn me? lo, they all shall wax old as a garment* the condemners wax old; the risen Messiah at the right hand intercedes (Romans 8:34).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-who-shall-lay-charge-who-condemneth-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:22 — *for thy sake are we killed all the day long; we are counted as sheep for the slaughter* quoted word for word; suffering is the portion of those who belong to him (Romans 8:36).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 44:18 — *our heart is not turned back, neither have our steps declined from thy way* the slaughtered sheep are the covenant-faithful, not the lawless; the love of Messiah holds them through every peril (Romans 8:35).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session219 — Romans cross-references complete.'
