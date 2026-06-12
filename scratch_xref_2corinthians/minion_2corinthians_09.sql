-- ----- fragment: minion_2corinthians_09.sql (S229 2 Corinthians 9) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 9 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 9 (15 verses) — THE CHEERFUL GIVER / he hath dispersed to the poor.
-- Tag: 2c09 (temp view _s229_2c09_lookup).
-- Sort band: floor 7200, step 3 (7200, 7203, 7206, 7209 used; under 7225).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: This is the Jerusalem relief continued from chapter 8 — the nations ministering
-- material things to the poor saints at Jerusalem, the grafted-in seed pouring back to Israel out of
-- the spiritual riches they received. Paul grounds the whole exhortation in the Torah and the
-- prophets: *Elohim (God) loveth a cheerful giver* is the Torah's *thine heart shall not be grieved
-- when thou givest* (Deuteronomy 15:10) and Proverbs' *bountiful eye... blessed* (22:9); the
-- sowing-and-reaping is Proverbs 11:24 *there is that scattereth, and yet increaseth* and Hosea 10:12
-- *sow to yourselves in righteousness*; and 9:9 is an explicit *as it is written* citation of Psalm
-- 112:9. The seed for the sower is Isaiah 55:10's rain that gives seed to the sower. The Hebrew
-- library carries the same righteousness-of-almsgiving: Sirach 35 (*give with a cheerful eye... for
-- Yahuah recompenseth*) and Tobit 4 and 12 (*alms do deliver from death*). No replacement theology:
-- the giving is the nations ministering to Israel, not a new people; the righteousness that
-- *remaineth for ever* is the same covenant righteousness of the man who *delighteth greatly in his
-- commandments* (Psalm 112:1).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   the ministering to the saints, the bounty made ready beforehand
--           Tanakh: none warranted (the substance is carried in the v.6-12 threads)
--           Extras: none warranted   NT: carried in the v.12 Jerusalem-relief thread (Rom 15 / 1 Cor 16)
--   v.6     he which soweth sparingly shall reap sparingly; he which soweth bountifully shall reap bountifully
--           Tanakh: Proverbs 11:24 (there is that scattereth, and yet increaseth), Proverbs 11:25
--                   (the liberal soul shall be made fat), Hosea 10:12 (sow to yourselves in righteousness)
--           Extras: carried in the cheerful-giver thread   NT: none warranted (Gal 6:7 in another book)
--   v.7     Elohim (God) loveth a cheerful giver
--           Tanakh: Deuteronomy 15:10 (thine heart shall not be grieved when thou givest),
--                   Proverbs 22:9 (he that hath a bountiful eye shall be blessed)
--           Extras: Sirach 35:9-10 (give with a cheerful eye), Tobit 4:7-8 (let not your eye be envious)
--           NT: none warranted
--   v.8-9   Elohim able to make all grace abound; as it is written, He hath dispersed... given to the poor
--           Tanakh: Psalm 112:9 (he hath dispersed, he hath given to the poor; his righteousness
--                   endureth for ever) [EXPLICIT CITATION], Psalm 112:3 (his righteousness endureth for ever)
--           Extras: none warranted   NT: none warranted (the citation IS the Tanakh root)
--   v.10    he that ministereth seed to the sower... multiply your seed sown
--           Tanakh: Isaiah 55:10 (the rain... that it may give seed to the sower, and bread to the
--                   eater), Hosea 10:12 (break up your fallow ground... rain righteousness)
--           Extras: none warranted   NT: none warranted
--   v.11-15 the administration supplieth the want of the saints; thanksgiving; unspeakable gift
--           Tanakh: none warranted (the want-of-the-saints is the Jerusalem relief, carried in NT thread)
--           Extras: Tobit 12:9 (alms do deliver from death), Sirach 35:2 (he that gives alms
--                   sacrificeth praise)
--           NT: Romans 15:25-27 (minister to the saints at Jerusalem... in carnal things),
--                   1 Corinthians 16:1-4 (the collection for the saints... your liberality unto Jerusalem)
--
-- THREADS (slug -> target libraries):
--   7200 2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15   (Tanakh + Extras)  [CENTERPIECE]
--   7203 2-corinthians-9-he-hath-dispersed-and-given-to-the-poor-psalm-112          (Tanakh)
--   7206 2-corinthians-9-he-that-ministereth-seed-to-the-sower-isaiah-55            (Tanakh)
--   7209 2-corinthians-9-the-ministration-that-supplieth-the-want-of-the-saints-romans-15  (Extras + NT)
-- =====================================================================

CREATE TEMP VIEW _s229_2c09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15  [CENTERPIECE]
  ('canon', '2-corinthians', 9, 6, 'canon', 'proverbs', 11, 24, 'free', E'*There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty.* (Proverbs 11:24). Paul''s law of the harvest — *He which soweth sparingly shall reap also sparingly; and he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6) — is straight out of the proverb: the open hand that *scattereth* is the hand that *increaseth,* and the closed hand that *withholdeth* comes to want. The bountiful sower of the collection for Jerusalem reaps bountifully because Yahuah (LORD) made the giver to flourish, not the hoarder.'),
  ('canon', '2-corinthians', 9, 6, 'canon', 'proverbs', 11, 25, 'free', E'*The liberal soul shall be made fat: and he that watereth shall be watered also himself.* (Proverbs 11:25). The proverb seals the harvest-law Paul sets down: *he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6). The *liberal soul* — the one who waters others with his substance — is himself *watered,* *made fat;* the giving that ministers to the poor saints returns upon the giver as the abounding grace of the next verse.'),
  ('canon', '2-corinthians', 9, 6, 'canon', 'hosea', 10, 12, 'free', E'*Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you.* (Hosea 10:12). The prophet''s sowing-and-reaping is the very figure Paul uses for the collection: *he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6). To *sow... in righteousness* is to *reap in mercy* — and the harvest is Yahuah (LORD) himself raining righteousness on the sower, which Paul names as the *fruits of your righteousness* increased (9:10).'),
  ('canon', '2-corinthians', 9, 7, 'canon', 'deuteronomy', 15, 10, 'free', E'*Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto.* (Deuteronomy 15:10). Here is the Torah-root of *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). The commandment is not merely to give but to give without a grieved heart — *not grudgingly, or of necessity* — and the promise attached is exactly Paul''s promise: Yahuah (LORD) *shall bless thee in all thy works.* The cheerful giver Elohim (God) loves is the open-handed Israelite of Deuteronomy 15, and the grace that abounds to *every good work* (9:8) is the blessing on *all that thou puttest thine hand unto.*'),
  ('canon', '2-corinthians', 9, 7, 'canon', 'proverbs', 22, 9, 'free', E'*He that hath a bountiful eye shall be blessed; for he giveth of his bread to the poor.* (Proverbs 22:9). The *bountiful eye* of the proverb is the *cheerful giver* of Paul: *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). The single-hearted, generous eye that *giveth of his bread to the poor* is the eye Elohim (God) loves; the blessing pronounced on it in Proverbs is the all-sufficiency and abounding grace Paul promises to the Corinthian givers.'),
  ('canon', '2-corinthians', 9, 7, 'apocrypha', 'ecclesiasticus', 35, 9, 'extras', E'*In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness. Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye.* (Sirach 35:9-10). The Hebrew library says exactly what Paul says: *shew a cheerful countenance... give with a cheerful eye.* This is *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7) in the wisdom of the fathers — the gift offered with gladness, measured *according as he has enriched you* (the very rule of 1 Corinthians 16:2), to which the next verse promises Yahuah (God) *will give you seven times as much* — Paul''s *able to make all grace abound* (9:8).'),
  ('canon', '2-corinthians', 9, 7, 'apocrypha', 'tobit', 4, 7, 'extras', E'*Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you. If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little.* (Tobit 4:7-8). Tobit''s charge to his son is the cheerful giver before the letter: give *let not your eye be envious* — the opposite of *grudgingly, or of necessity* — and give *according as he purposeth in his heart,* whether of abundance or of little. This is the heart-posture Paul commands and Elohim (God) loves (2 Corinthians 9:7), with the same promise that the giver''s own face is not turned away from the favour of the Most High.'),
  -- thread: 2-corinthians-9-he-hath-dispersed-and-given-to-the-poor-psalm-112
  ('canon', '2-corinthians', 9, 9, 'canon', 'psalms', 112, 9, 'free', E'*He hath dispersed, he hath given to the poor; his righteousness endureth for ever; his horn shall be exalted with honour.* (Psalm 112:9). This is the verse Paul quotes outright — *As it is written, He hath dispersed abroad; he hath given to the poor: his righteousness remaineth for ever* (2 Corinthians 9:9). The man of the psalm who scatters his goods to the poor is the model of the Corinthian giver; and the *righteousness* that *endureth for ever* is not a credit earned but the abiding covenant-righteousness of the one who fears Yahuah (LORD) and gives — the deed that is *in everlasting remembrance* (112:6).'),
  ('canon', '2-corinthians', 9, 9, 'canon', 'psalms', 112, 3, 'free', E'*Wealth and riches shall be in his house: and his righteousness endureth for ever.* (Psalm 112:3). The psalm twice declares of the giving, God-fearing man that *his righteousness endureth for ever* (112:3, 112:9) — the very clause Paul lifts into *his righteousness remaineth for ever* (2 Corinthians 9:9). The one who *delighteth greatly in his commandments* (112:1) and disperses to the poor is enriched in his house precisely so that he may abound to every good work; the enduring righteousness is the covenant-life of the commandment-keeper, not a wage of merit.'),
  -- thread: 2-corinthians-9-he-that-ministereth-seed-to-the-sower-isaiah-55
  ('canon', '2-corinthians', 9, 10, 'canon', 'isaiah', 55, 10, 'free', E'*For as the rain cometh down, and the snow from heaven, and returneth not thither, but watereth the earth, and maketh it bring forth and bud, that it may give seed to the sower, and bread to the eater:* (Isaiah 55:10). Paul''s *Now he that ministereth seed to the sower both minister bread for your food, and multiply your seed sown* (2 Corinthians 9:10) is Isaiah''s rain that *give seed to the sower, and bread to the eater.* Elohim (God) is the one who supplies both the seed to sow and the bread to eat; he multiplies the giver''s seed and increases the *fruits of your righteousness* as surely as the rain from heaven makes the earth bring forth, his word never returning void.'),
  ('canon', '2-corinthians', 9, 10, 'canon', 'hosea', 10, 12, 'free', E'*Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you.* (Hosea 10:12). The prophet joins the seed and the rain and the righteousness exactly as Paul does: the sower who *minister seed to the sower* sees Elohim (God) *increase the fruits of your righteousness* (2 Corinthians 9:10). To sow in righteousness is to have Yahuah (LORD) *rain righteousness upon you* — the harvest of the cheerful giving is a righteousness watered from heaven and multiplied in its fruit.'),
  -- thread: 2-corinthians-9-the-ministration-that-supplieth-the-want-of-the-saints-romans-15
  ('canon', '2-corinthians', 9, 12, 'canon', 'romans', 15, 27, 'free', E'*It hath pleased them verily; and their debtors they are. For if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things.* (Romans 15:27). Paul names the same collection in Romans: Macedonia and Achaia making *a certain contribution for the poor saints which are at Jerusalem* (Romans 15:26). This is the *administration of this service* that *supplieth the want of the saints* (2 Corinthians 9:12) — the nations who received Israel''s *spiritual things* now ministering back *in carnal things.* The cheerful giving is the grafted-in seed paying its glad debt to the household from which salvation came, not a new people but the nations brought near, ministering to Israel.'),
  ('canon', '2-corinthians', 9, 12, 'canon', '1-corinthians', 16, 1, 'free', E'*Now concerning the collection for the saints, as I have given order to the churches of Galatia, even so do ye.* (1 Corinthians 16:1). The same collection stands behind both letters to Corinth: *Upon the first day of the week let every one of you lay by him in store, as Elohim (God) hath prospered him* (1 Corinthians 16:2), the gift carried *unto Jerusalem* (16:3). What the first letter ordered, the second sees ripening into *the administration of this service* that *supplieth the want of the saints* (2 Corinthians 9:12) — each giving *as Elohim (God) hath prospered him,* the same measure Paul commands here (9:7-8).'),
  ('canon', '2-corinthians', 9, 12, 'apocrypha', 'tobit', 12, 9, 'extras', E'*For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* (Tobit 12:9). The angel Raphael''s word binds alms and righteousness exactly as Paul does — the *liberal distribution* that yields *thanksgivings unto Elohim (God)* (2 Corinthians 9:12-13). In the Hebrew library, *alms do deliver from death* and those who join alms to righteousness *shall be filled with life;* this is the abiding *righteousness* that *remaineth for ever* of the dispersing giver (9:9), the ministration that does far more than relieve want — it abounds in thanksgiving to Elohim (God).'),
  ('canon', '2-corinthians', 9, 13, 'apocrypha', 'ecclesiasticus', 35, 2, 'extras', E'*He that requiteth a goodturn offers fine flour; and he that gives alms sacrificeth praise.* (Sirach 35:2). The wisdom of the fathers counts almsgiving as a sacrifice of praise — *he that gives alms sacrificeth praise.* Paul sees the same: the Corinthians'' *liberal distribution* makes the saints *glorify Elohim (God)* and is *abundant also by many thanksgivings unto Elohim (God)* (2 Corinthians 9:12-13). The gift to the poor rises as worship; the relief of Jerusalem becomes the praise of Elohim (God) on the lips of those relieved, the alms that *sacrificeth praise.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15',
       E'Sowing bountifully and the cheerful giver Elohim (God) loveth (Deuteronomy 15, Proverbs 11 & 22)',
       E'Paul presses the Corinthians to make good their gift for the poor saints at Jerusalem, and he grounds the whole appeal in the Torah and the proverbs. First the law of the harvest: *He which soweth sparingly shall reap also sparingly; and he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6). This is the wisdom of Proverbs, where the open hand and the closed hand are weighed against each other: *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty* (Proverbs 11:24); *The liberal soul shall be made fat: and he that watereth shall be watered also himself* (Proverbs 11:25). It is the prophet''s sowing too: *Sow to yourselves in righteousness, reap in mercy... till he come and rain righteousness upon you* (Hosea 10:12). Then the heart of the matter: *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). That is no new teaching but the very command of the Torah — *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto* (Deuteronomy 15:10). The cheerful giver Elohim (God) loves is the open-handed Israelite who gives without a grieved heart; and the proverb names him too — *He that hath a bountiful eye shall be blessed; for he giveth of his bread to the poor* (Proverbs 22:9). The Hebrew library says the same in the wisdom of the fathers: *In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness. Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye* (Sirach 35:9-10); and Tobit''s charge, *when you give alms, let not your eye be envious, neither turn your face from any poor... If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little* (Tobit 4:7-8). The whole counsel converges: give as you have purposed, with a glad and bountiful eye, measured to what Elohim (God) has given you — and the promise of the Torah follows, that Yahuah (LORD) will bless you in all the work of your hands, and *make all grace abound toward you* (9:8). This is the grafted-in seed ministering to Israel out of the riches it received, the cheerful giving that the God of the fathers has always loved.',
       sv.verse_id, ev.verse_id, 'extras', 7200
  FROM _s229_2c09_lookup sv, _s229_2c09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-9-he-hath-dispersed-and-given-to-the-poor-psalm-112',
       E'As it is written, He hath dispersed and given to the poor (Psalm 112)',
       E'When Paul promises that Elohim (God) *is able to make all grace abound toward you,* he reaches for the scripture and quotes it by name: *As it is written, He hath dispersed abroad; he hath given to the poor: his righteousness remaineth for ever* (2 Corinthians 9:9). The verse is Psalm 112:9 — *He hath dispersed, he hath given to the poor; his righteousness endureth for ever; his horn shall be exalted with honour* — a portrait of the God-fearing man whose generosity is the mark of his covenant-life. The psalm opens, *Blessed is the man that feareth Yahuah (LORD), that delighteth greatly in his commandments* (112:1), and twice declares of him *his righteousness endureth for ever* (112:3, 112:9). So the *righteousness* that *remaineth for ever* in Paul''s citation is no merit-wage earned by alms; it is the abiding covenant-righteousness of the commandment-keeper who scatters his bread to the poor, the deed that is held *in everlasting remembrance* (112:6). The Corinthian giver, dispersing his goods to the saints at Jerusalem, stands in the line of this man — enriched in his house (112:3) not to hoard but to abound to every good work, his horn exalted with honour because he gave.',
       sv.verse_id, ev.verse_id, 'free', 7203
  FROM _s229_2c09_lookup sv, _s229_2c09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-9-he-that-ministereth-seed-to-the-sower-isaiah-55',
       E'He that ministereth seed to the sower, and the rain of righteousness (Isaiah 55, Hosea 10)',
       E'Paul names Elohim (God) as the one who supplies both the seed and the harvest: *Now he that ministereth seed to the sower both minister bread for your food, and multiply your seed sown, and increase the fruits of your righteousness* (2 Corinthians 9:10). The words are Isaiah''s: *For as the rain cometh down, and the snow from heaven, and returneth not thither, but watereth the earth, and maketh it bring forth and bud, that it may give seed to the sower, and bread to the eater* (Isaiah 55:10). The God who sends the rain that *give seed to the sower, and bread to the eater* is the God who multiplies the giver''s seed and increases the fruits of his righteousness; the same heaven-sent supply stands behind the cheerful giving. And the prophet Hosea binds the seed, the rain, and the righteousness into one word: *Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you* (Hosea 10:12). To sow in righteousness is to have Yahuah (LORD) rain righteousness upon you — so the harvest of the Corinthians'' liberality is not their own accomplishment but a righteousness watered from heaven, the seed Elohim (God) himself ministers and multiplies, that they may be *enriched in every thing to all bountifulness* (9:11).',
       sv.verse_id, ev.verse_id, 'free', 7206
  FROM _s229_2c09_lookup sv, _s229_2c09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-9-the-ministration-that-supplieth-the-want-of-the-saints-romans-15',
       E'The ministration that supplieth the want of the saints at Jerusalem (Romans 15, 1 Corinthians 16, Tobit 12)',
       E'The collection Paul gathers is no abstract charity but a named, concrete relief: *the administration of this service not only supplieth the want of the saints, but is abundant also by many thanksgivings unto Elohim (God)* (2 Corinthians 9:12). The same gathering runs through his other letters. In Romans he writes, *now I go unto Jerusalem to minister unto the saints. For it hath pleased them of Macedonia and Achaia to make a certain contribution for the poor saints which are at Jerusalem* — and he names what it means: *if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things* (Romans 15:25-27). The nations who received Israel''s spiritual riches now minister back to Israel in material things; this is the grafted-in seed paying its glad debt to the household from which salvation came, not a new people replacing the old. In the first Corinthian letter he had already ordered it: *Now concerning the collection for the saints... Upon the first day of the week let every one of you lay by him in store, as Elohim (God) hath prospered him* (1 Corinthians 16:1-2), the gift carried *unto Jerusalem* (16:3) — each giving by the very measure Paul names here, *according as he purposeth in his heart* (9:7). And the Hebrew library knows the worth of such giving: *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life* (Tobit 12:9); *he that gives alms sacrificeth praise* (Sirach 35:2). So the relief of Jerusalem rises as worship — the *liberal distribution* makes the saints *glorify Elohim (God)* (9:13), the alms that sacrifices praise, the ministration that supplies want and abounds in thanksgiving to Elohim (God), crowned by Paul''s own praise: *Thanks be unto Elohim (God) for his unspeakable gift* (9:15).',
       sv.verse_id, ev.verse_id, 'extras', 7209
  FROM _s229_2c09_lookup sv, _s229_2c09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:24 — *There is that scattereth, and yet increaseth... but it tendeth to poverty* the open hand increaseth, the closed hand wants; *he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:25 — *The liberal soul shall be made fat: and he that watereth shall be watered also himself* the giver watered in return; *soweth bountifully shall reap also bountifully* (2 Corinthians 9:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 10:12 — *Sow to yourselves in righteousness, reap in mercy... till he come and rain righteousness upon you* the prophet''s sowing-and-reaping; *he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 15:10 — *thine heart shall not be grieved when thou givest unto him... Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works* the Torah-root of the ungrieved heart; *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 22:9 — *He that hath a bountiful eye shall be blessed; for he giveth of his bread to the poor* the bountiful eye is the cheerful giver; *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 35:9-10 — *shew a cheerful countenance... give with a cheerful eye* the wisdom of the fathers; *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Tobit 4:7-8 — *let not your eye be envious, neither turn your face from any poor... be not afraid to give according to that little* give without a grudging eye, of abundance or of little; *not grudgingly, or of necessity* (2 Corinthians 9:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-sowing-bountifully-and-the-cheerful-giver-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-9-he-hath-dispersed-and-given-to-the-poor-psalm-112
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 112:9 — *He hath dispersed, he hath given to the poor; his righteousness endureth for ever* the verse Paul quotes; *As it is written, He hath dispersed abroad; he hath given to the poor* (2 Corinthians 9:9).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-he-hath-dispersed-and-given-to-the-poor-psalm-112'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=112 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 112:3 — *Wealth and riches shall be in his house: and his righteousness endureth for ever* the enduring covenant-righteousness of the God-fearing giver; *his righteousness remaineth for ever* (2 Corinthians 9:9).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-he-hath-dispersed-and-given-to-the-poor-psalm-112'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=112 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-9-he-that-ministereth-seed-to-the-sower-isaiah-55
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:10 — *the rain... that it may give seed to the sower, and bread to the eater* Elohim (God) supplies both seed and bread; *he that ministereth seed to the sower both minister bread for your food* (2 Corinthians 9:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-he-that-ministereth-seed-to-the-sower-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 10:12 — *Sow to yourselves in righteousness... till he come and rain righteousness upon you* seed, rain, and righteousness joined; *increase the fruits of your righteousness* (2 Corinthians 9:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-he-that-ministereth-seed-to-the-sower-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-9-the-ministration-that-supplieth-the-want-of-the-saints-romans-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 15:27 — *if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things* the nations ministering back to Israel; *the administration of this service... supplieth the want of the saints* (2 Corinthians 9:12).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-the-ministration-that-supplieth-the-want-of-the-saints-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 16:1 — *Now concerning the collection for the saints... even so do ye* the same collection ordered in the first letter, carried unto Jerusalem; *the administration of this service* (2 Corinthians 9:12).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-the-ministration-that-supplieth-the-want-of-the-saints-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=16 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 12:9 — *alms does deliver from death... Those that exercise alms and righteousness shall be filled with life* alms bound to righteousness; the liberal distribution yielding *thanksgivings unto Elohim (God)* (2 Corinthians 9:12).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-the-ministration-that-supplieth-the-want-of-the-saints-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 35:2 — *he that gives alms sacrificeth praise* the gift to the poor rises as worship; the *liberal distribution* making the saints *glorify Elohim (God)* (2 Corinthians 9:13).'
  FROM cross_reference_threads t, cross_references x, _s229_2c09_lookup sv, _s229_2c09_lookup tv
 WHERE t.slug='2-corinthians-9-the-ministration-that-supplieth-the-want-of-the-saints-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
