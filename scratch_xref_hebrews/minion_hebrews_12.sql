-- ----- fragment: minion_hebrews_12.sql (S222 Hebrews 12) -----
-- =====================================================================
-- S222 minion — HEBREWS 12 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 12.  Tag: h12 (temp view _s222_h12_lookup).  Sort band: 7980, step 1 (<=7986).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Hebrews 12 sets the run of the race surrounded by the cloud of witnesses
-- (ch.11) against the terror of approach under the old mediation and the access opened in
-- Messiah. The Sinai/Zion contrast is NOT Sinai or the Torah denigrated as evil — Sinai's
-- holiness is real, and the chapter QUOTES Deuteronomy approvingly at the close (*our Elohim is
-- a consuming fire*, 12:29 / Deuteronomy 4:24). The fire that burned on the mount is the same
-- fire that guards the holiness of the unshakable kingdom; what changed is the mediation by
-- which one approaches it. The chastening is the Father dealing with sons (Proverbs 3:11-12,
-- quoted in full at 12:5-6); the warnings (Esau, the root of bitterness, refuse not him that
-- speaketh) all press toward enduring obedience, not licence.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   cloud of witnesses / looking unto Yahusha author and finisher / set down at the right hand
--           Tanakh: Psalm 110:1 (sit at my right hand)  Extras: none warranted (the witness-cloud is Hebrews 11 internal; extras carried there)  NT: none added (the witnesses are ch.11, same hand)
--   v.4-11  the chastening of sons — whom Yahuah loveth he chasteneth
--           Tanakh: Proverbs 3:11 + 3:12 (quoted in full at 12:5-6)  Extras: none warranted  NT: none warranted
--   v.12-13 lift up the hands which hang down / make straight paths for your feet
--           Tanakh: Isaiah 35:3 (strengthen the weak hands, confirm the feeble knees), Proverbs 4:26 (ponder the path of thy feet)  Extras: none warranted  NT: none warranted
--   v.14-15 follow peace and holiness / lest any root of bitterness springing up
--           Tanakh: Deuteronomy 29:18 (a root that beareth gall and wormwood)  Extras: none warranted  NT: none warranted
--   v.16-17 Esau who for one morsel of meat sold his birthright / found no place of repentance
--           Tanakh: Genesis 25:33 + 25:34 (sold and despised his birthright), Genesis 27:34 + 27:38 (the bitter cry, no blessing left)  Extras: none warranted  NT: none warranted
--   v.18-24 the mount that burned vs Mount Sion / the blood of sprinkling better than Abel
--           Tanakh: Exodus 19:12 + 19:13 + 19:18 (the bounded burning mount), Deuteronomy 9:19 (I exceedingly fear), Genesis 4:10 (the blood crying from the ground)  Extras: none warranted  NT: none warranted
--   v.25-29 Yet once more I shake heaven / the unshakable kingdom / a consuming fire
--           Tanakh: Haggai 2:6 (yet once, I will shake the heavens), Deuteronomy 4:24 (the LORD thy God is a consuming fire)  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7980 hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110          (Tanakh)
--   7981 hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3     (Tanakh)
--   7982 hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35     (Tanakh)
--   7983 hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29            (Tanakh)
--   7984 hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27           (Tanakh)
--   7985 hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19      (Tanakh)
--   7986 hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2      (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110
  ('canon', 'hebrews', 12, 2, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). The runner is told to look away to the goal: *Looking unto Yahusha (Jesus) the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of Elohim (God)* (Hebrews 12:2). The enthronement at the close of his endurance is the very seat David saw — the Formed bidden by Yahuah (LORD) to *Sit thou at my right hand.* He ran the race first, despised the shame, and sat down at the right hand; the cloud of witnesses and the runners behind him follow the one who has already finished and is enthroned.'),
  -- thread: hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3
  ('canon', 'hebrews', 12, 5, 'canon', 'proverbs', 3, 11, 'free', E'*My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* (Proverbs 3:11). The exhortation Hebrews says they had forgotten is this proverb, quoted nearly word for word: *My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him* (Hebrews 12:5). The wisdom spoken to a son in the proverbs is read as the Father''s living word to the assembly — the chastening is not wrath but fatherly correction, not to be despised and not to be fainted under.'),
  ('canon', 'hebrews', 12, 6, 'canon', 'proverbs', 3, 12, 'free', E'*For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* (Proverbs 3:12). *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6). The proverb supplies the very ground of the argument that follows — *what son is he whom the father chasteneth not?* (Hebrews 12:7). Correction is the mark of a received son, the token of the Father''s delight, not of his rejection; the love and the chastening are one motion, *even as a father the son in whom he delighteth.*'),
  -- thread: hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35
  ('canon', 'hebrews', 12, 12, 'canon', 'isaiah', 35, 3, 'free', E'*Strengthen ye the weak hands, and confirm the feeble knees.* (Isaiah 35:3). *Wherefore lift up the hands which hang down, and the feeble knees;* (Hebrews 12:12). Hebrews takes up the prophet''s charge almost in his own words. Isaiah spoke it to the fearful-hearted on the way of holiness, the highway home where *the ransomed of Yahuah (LORD) shall return … to Zion with songs and everlasting joy* (Isaiah 35:10) — and Hebrews sets it on the lips of the assembly that has come *unto mount Sion* (Hebrews 12:22). The drooping hands and feeble knees of the weary runner are lifted by the same word that strengthened the returning remnant.'),
  ('canon', 'hebrews', 12, 13, 'canon', 'proverbs', 4, 26, 'free', E'*Ponder the path of thy feet, and let all thy ways be established.* (Proverbs 4:26). *And make straight paths for your feet, lest that which is lame be turned out of the way; but let it rather be healed* (Hebrews 12:13). The making of straight paths is the proverb''s counsel to weigh and steady the path of the feet, the chapter that promises *the path of the just is as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18). The runner straightens his way so the lame limb is healed rather than turned out — the established path of the wise, walked under correction toward the goal.'),
  -- thread: hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29
  ('canon', 'hebrews', 12, 15, 'canon', 'deuteronomy', 29, 18, 'free', E'*Lest there should be among you man, or woman, or family, or tribe, whose heart turneth away this day from Yahuah Eloheinu (the LORD our God), to go and serve the gods of these nations; lest there should be among you a root that beareth gall and wormwood;* (Deuteronomy 29:18). *Looking diligently lest any man fail of the grace of Elohim (God); lest any root of bitterness springing up trouble you, and thereby many be defiled* (Hebrews 12:15). The warning of the root is Moses'' own, spoken as the people stood to enter the covenant: a heart turning away becomes *a root that beareth gall and wormwood* — and the one poisoned root defiles the many. Hebrews sets the covenant assembly the same watch, to look diligently lest such a root spring up among them.'),
  -- thread: hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27
  ('canon', 'hebrews', 12, 16, 'canon', 'genesis', 25, 33, 'free', E'*And Jacob said, Swear to me this day; and he sware unto him: and he sold his birthright unto Jacob.* (Genesis 25:33). *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). The profane despiser is named from the narrative itself: Esau came faint from the field, and for a bowl of pottage *sold his birthright unto Jacob* under oath. The inheritance of the firstborn — the covenant line of Abraham and Isaac — was bartered for a single meal; this is the profanity Hebrews holds up as the warning.'),
  ('canon', 'hebrews', 12, 16, 'canon', 'genesis', 25, 34, 'free', E'*Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright.* (Genesis 25:34). *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). The verdict of the narrative is the word Hebrews leans on: *thus Esau despised his birthright.* He ate and drank and went his way, counting the inheritance as nothing — the *one morsel of meat* of Hebrews is the *bread and pottage of lentiles* of the account. To despise the birthright is the profanity warned against in the running of the race.'),
  ('canon', 'hebrews', 12, 17, 'canon', 'genesis', 27, 34, 'free', E'*And when Esau heard the words of his father, he cried with a great and exceeding bitter cry, and said unto his father, Bless me, even me also, O my father.* (Genesis 27:34). *For ye know how that afterward, when he would have inherited the blessing, he was rejected: for he found no place of repentance, though he sought it carefully with tears* (Hebrews 12:17). The tears Hebrews names are the *great and exceeding bitter cry* of Esau when the blessing had already gone to Jacob. He sought the blessing he had bartered away, but the thing was done; the bitter weeping could not undo the despising. What was sold for a morsel could not be wept back.'),
  ('canon', 'hebrews', 12, 17, 'canon', 'genesis', 27, 38, 'free', E'*And Esau said unto his father, Hast thou but one blessing, my father? bless me, even me also, O my father. And Esau lifted up his voice, and wept.* (Genesis 27:38). *For ye know how that afterward, when he would have inherited the blessing, he was rejected: for he found no place of repentance, though he sought it carefully with tears* (Hebrews 12:17). Esau *lifted up his voice, and wept,* pleading *bless me, even me also* — but the blessing was spoken and would stand. Hebrews reads this as finding *no place of repentance:* the careful tears could not recover the inheritance the profane man had already despised and sold.'),
  -- thread: hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19
  ('canon', 'hebrews', 12, 18, 'canon', 'exodus', 19, 18, 'free', E'*And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly.* (Exodus 19:18). *For ye are not come unto the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest* (Hebrews 12:18). The mount that *burned with fire* is Sinai, *altogether on a smoke, because Yahuah (LORD) descended upon it in fire.* The burning and the quaking were real and holy — Yahuah (LORD) himself came down upon it; Hebrews sets that terror of approach against the access now opened, not against the holiness of the mount.'),
  ('canon', 'hebrews', 12, 20, 'canon', 'exodus', 19, 12, 'free', E'*And thou shalt set bounds unto the people round about, saying, Take heed to yourselves, that ye go not up into the mount, or touch the border of it: whosoever toucheth the mount shall be surely put to death:* (Exodus 19:12). *(For they could not endure that which was commanded, And if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart:* (Hebrews 12:20). The commandment they could not endure is this charge to set bounds: *whosoever toucheth the mount shall be surely put to death.* The fence around the burning mount marked how unapproachable the holy fire was under that mediation — the very weight Hebrews recalls to magnify the nearness now given.'),
  ('canon', 'hebrews', 12, 20, 'canon', 'exodus', 19, 13, 'free', E'*There shall not an hand touch it, but he shall surely be stoned, or shot through; whether it be beast or man, it shall not live: when the trumpet soundeth long, they shall come up to the mount.* (Exodus 19:13). *(For they could not endure that which was commanded, And if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart:* (Hebrews 12:20). Hebrews quotes the charge closely — *if so much as a beast touch the mountain, it shall be stoned, or thrust through* — straight from the command that *whether it be beast or man, it shall not live.* Even the brute that strayed across the border died; such was the guarded holiness of the mount that burned.'),
  ('canon', 'hebrews', 12, 21, 'canon', 'deuteronomy', 9, 19, 'free', E'*For I was afraid of the anger and hot displeasure, wherewith Yahuah (LORD) was wroth against you to destroy you. But Yahuah (LORD) hearkened unto me at that time also.* (Deuteronomy 9:19). *And so terrible was the sight, that Moses said, I exceedingly fear and quake:* (Hebrews 12:21). Even Moses, the mediator on the mount, confessed his dread: *I was afraid of the anger and hot displeasure* of Yahuah (LORD). Hebrews gathers that fear into a single line — *I exceedingly fear and quake* — to set the trembling of the old approach beside the joy of those now come unto mount Sion.'),
  ('canon', 'hebrews', 12, 24, 'canon', 'genesis', 4, 10, 'free', E'*And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* (Genesis 4:10). *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). Abel''s blood *crieth unto me from the ground* — a cry for justice against the one who shed it. The blood of sprinkling speaks *better things:* not vengeance crying up from the earth, but the blood of the mediator that brings the worshipper near. The two bloods both speak; the better blood speaks reconciliation where Abel''s cried for recompense.'),
  -- thread: hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2
  ('canon', 'hebrews', 12, 26, 'canon', 'haggai', 2, 6, 'free', E'*For thus saith Yahuah Tseva''ot (LORD of hosts); Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land;* (Haggai 2:6). *Whose voice then shook the earth: but now he hath promised, saying, Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26). The promise Hebrews cites is Haggai''s — *Yet once … I will shake the heavens, and the earth.* The voice that once shook the earth at Sinai will shake heaven too, *the removing of those things that are shaken … that those things which cannot be shaken may remain* (Hebrews 12:27). What remains is the kingdom which cannot be moved.'),
  ('canon', 'hebrews', 12, 29, 'canon', 'deuteronomy', 4, 24, 'free', E'*For Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God).* (Deuteronomy 4:24). *For our Elohim (God) is a consuming fire* (Hebrews 12:29). Hebrews closes by quoting Moses straight: *Yahuah Elohayka (the LORD thy God) is a consuming fire.* The fire that burned on Sinai is not left behind as a discarded terror — it is named approvingly as the unchanged character of the Elohim (God) whose unshakable kingdom we receive. We serve *with reverence and godly fear* (Hebrews 12:28) precisely because our Elohim is still the consuming fire of the mount.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110',
       E'Looking unto Yahusha, set down at the right hand — Psalm 110',
       E'The cloud of witnesses of chapter 11 surrounds the runner, and the charge is to *lay aside every weight, and the sin which doth so easily beset us, and let us run with patience the race that is set before us* (Hebrews 12:1). The eyes do not turn to the witnesses but past them to the goal: *Looking unto Yahusha (Jesus) the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of Elohim (God)* (Hebrews 12:2). The seat at the close of his race is the throne David saw: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). He is the one who ran first and finished — the Formed who endured the cross and was bidden by Yahuah (LORD) to sit at the right hand. The runner behind him fixes his eyes on the one already enthroned, and so does not grow *wearied and faint in his mind* (Hebrews 12:3).',
       sv.verse_id, ev.verse_id, 'free', 7980
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3',
       E'Whom Yahuah loveth he chasteneth — the sons corrected (Proverbs 3)',
       E'Hebrews says the assembly had forgotten *the exhortation which speaketh unto you as unto children* (Hebrews 12:5), and then quotes it nearly word for word: *My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him: For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:5-6). The exhortation is the proverb: *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction: For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:11-12). The wisdom a father speaks to a son becomes the living word of the Father to the whole house. The argument turns on it: *If ye endure chastening, Elohim (God) dealeth with you as with sons; for what son is he whom the father chasteneth not?* (Hebrews 12:7). Correction is the token of a received son and the proof of the Father''s delight, not the sign of his wrath — and it *yieldeth the peaceable fruit of righteousness unto them which are exercised thereby* (Hebrews 12:11).',
       sv.verse_id, ev.verse_id, 'free', 7981
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35',
       E'Lift up the hands which hang down, make straight paths — Isaiah 35',
       E'The weary runner is roused with the prophet''s own words: *Wherefore lift up the hands which hang down, and the feeble knees; And make straight paths for your feet, lest that which is lame be turned out of the way; but let it rather be healed* (Hebrews 12:12-13). Isaiah had spoken the charge to the fearful-hearted on the highway home: *Strengthen ye the weak hands, and confirm the feeble knees* (Isaiah 35:3) — the way of holiness on which *the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads* (Isaiah 35:10). And the making of straight paths is the counsel of the wise: *Ponder the path of thy feet, and let all thy ways be established* (Proverbs 4:26), the chapter whose just man walks the path that *is as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18). The drooping hands are lifted, the feeble knees confirmed, the path made straight — so the lame limb is healed rather than turned out, and the runner comes with the returning remnant unto mount Sion.',
       sv.verse_id, ev.verse_id, 'free', 7982
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29',
       E'Lest any root of bitterness springing up — Deuteronomy 29',
       E'The charge to *Follow peace with all men, and holiness, without which no man shall see Yahuah (Lord)* (Hebrews 12:14) carries a watch against one poisoned root: *Looking diligently lest any man fail of the grace of Elohim (God); lest any root of bitterness springing up trouble you, and thereby many be defiled* (Hebrews 12:15). The image is Moses'', spoken as Yashar''el (Israel) stood to enter the covenant: the warning *lest there should be among you man, or woman, or family, or tribe, whose heart turneth away this day from Yahuah Eloheinu (the LORD our God), to go and serve the gods of these nations; lest there should be among you a root that beareth gall and wormwood* (Deuteronomy 29:18). A heart turned away from the covenant becomes a bitter root, and the one root defiles the many. Hebrews sets the same watch on the assembly that has come unto mount Sion — to look diligently lest such a root spring up and trouble the whole.',
       sv.verse_id, ev.verse_id, 'free', 7983
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27',
       E'Esau who sold his birthright for one morsel — Genesis 25 and 27',
       E'The warning against the profane is named from the patriarchal account: *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). Esau came faint from the field, and *Jacob said, Swear to me this day; and he sware unto him: and he sold his birthright unto Jacob* (Genesis 25:33). The verdict of the narrative is the word Hebrews leans on: *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright* (Genesis 25:34). The inheritance of the firstborn — the covenant line of Abraham and Isaac — was counted as nothing and bartered for a single meal. And the end of it was bitter: *For ye know how that afterward, when he would have inherited the blessing, he was rejected: for he found no place of repentance, though he sought it carefully with tears* (Hebrews 12:17). When the blessing had gone to Jacob, *Esau heard the words of his father, he cried with a great and exceeding bitter cry* (Genesis 27:34), and *lifted up his voice, and wept* (Genesis 27:38) — but the thing was done and would stand. The careful tears could not weep back what the profane man had already despised and sold. This is the warning held over the runner: do not, for a present appetite, despise the inheritance.',
       sv.verse_id, ev.verse_id, 'free', 7984
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19',
       E'The mount that burned and the blood better than Abel — Exodus 19, Genesis 4',
       E'Hebrews sets the terror of the old approach against the access now opened: *For ye are not come unto the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest* (Hebrews 12:18). That mount is Sinai, *altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly* (Exodus 19:18). The bounds set around it marked how unapproachable the holy fire was: *Take heed to yourselves, that ye go not up into the mount, or touch the border of it: whosoever toucheth the mount shall be surely put to death* (Exodus 19:12) — *whether it be beast or man, it shall not live* (Exodus 19:13), which Hebrews echoes: *if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart* (Hebrews 12:20). Even Moses the mediator trembled: *I was afraid of the anger and hot displeasure, wherewith Yahuah (LORD) was wroth* (Deuteronomy 9:19), gathered into the one line *I exceedingly fear and quake* (Hebrews 12:21). The burning and the quaking were real and holy — Yahuah (LORD) himself came down upon the mount; what Hebrews contrasts is the mediation, not the holiness. For now *ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem* (Hebrews 12:22), *and to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). Abel''s blood *crieth unto me from the ground* (Genesis 4:10) for justice against the one who shed it; the blood of the mediator speaks better — not vengeance crying up from the earth, but reconciliation that brings the worshipper near.',
       sv.verse_id, ev.verse_id, 'free', 7985
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2',
       E'Yet once more I shake, and our Elohim a consuming fire — Haggai 2, Deuteronomy 4',
       E'The same voice that thundered at the mount has not fallen silent: *See that ye refuse not him that speaketh … if we turn away from him that speaketh from heaven* (Hebrews 12:25). *Whose voice then shook the earth: but now he hath promised, saying, Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26) — the promise of Haggai: *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* (Haggai 2:6). The shaking is *the removing of those things that are shaken, as of things that are made, that those things which cannot be shaken may remain* (Hebrews 12:27), and what remains is *a kingdom which cannot be moved* (Hebrews 12:28). The chapter closes by quoting Moses straight: *For our Elohim (God) is a consuming fire* (Hebrews 12:29) — *For Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* (Deuteronomy 4:24). The fire that burned on Sinai is not a discarded terror but the unchanged character of the Elohim (God) whose unshakable kingdom we receive. We *serve Elohim (God) acceptably with reverence and godly fear* precisely because our Elohim is still the consuming fire of the mount.',
       sv.verse_id, ev.verse_id, 'free', 7986
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Sit thou at my right hand, until I make thine enemies thy footstool* the seat at the close of his race is the throne David saw; Yahusha endured the cross and is *set down at the right hand* (Hebrews 12:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction* the forgotten exhortation, quoted nearly word for word (Hebrews 12:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 3:12 — *whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* correction is the token of a received son, the Father''s delight not his wrath (Hebrews 12:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:3 — *Strengthen ye the weak hands, and confirm the feeble knees* the prophet''s charge to the fearful on the way home, taken up for the weary runner (Hebrews 12:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 4:26 — *Ponder the path of thy feet, and let all thy ways be established* the making of straight paths is the wise man''s established way, so the lame is healed (Hebrews 12:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 29:18 — *lest there should be among you a root that beareth gall and wormwood* a heart turned from the covenant becomes a bitter root that defiles the many (Hebrews 12:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:33 — *he sware unto him: and he sold his birthright unto Jacob* the inheritance of the firstborn bartered under oath for a single meal (Hebrews 12:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:34 — *he did eat and drink, and rose up, and went his way: thus Esau despised his birthright* the verdict of the narrative Hebrews leans on — he counted the inheritance as nothing (Hebrews 12:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 27:34 — *he cried with a great and exceeding bitter cry* the tears Hebrews names — sought the blessing already given to Jacob (Hebrews 12:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 27:38 — *Esau lifted up his voice, and wept* the careful tears could not recover the inheritance the profane man had despised and sold — no place of repentance (Hebrews 12:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:18 — *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire* the mount that *burned with fire* — real and holy, Yahuah himself came down (Hebrews 12:18).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:12 — *whosoever toucheth the mount shall be surely put to death* the commandment they could not endure; the fence marked the unapproachable holy fire (Hebrews 12:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 19:13 — *whether it be beast or man, it shall not live* Hebrews quotes it closely: *if so much as a beast touch the mountain, it shall be stoned, or thrust through* (Hebrews 12:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 9:19 — *I was afraid of the anger and hot displeasure, wherewith Yahuah (LORD) was wroth* even Moses the mediator trembled; Hebrews gathers it into *I exceedingly fear and quake* (Hebrews 12:21).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 4:10 — *the voice of thy brother''s blood crieth unto me from the ground* Abel''s blood cries for justice; the blood of sprinkling speaks better — reconciliation, not vengeance (Hebrews 12:24).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Haggai 2:6 — *Yet once, it is a little while, and I will shake the heavens, and the earth* the promise Hebrews cites: the voice that shook the earth will shake heaven, removing the shakable (Hebrews 12:26).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:24 — *Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* quoted approvingly: the fire of Sinai is the unchanged character of the Elohim of the unshakable kingdom (Hebrews 12:29).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
