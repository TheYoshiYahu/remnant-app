-- ----- fragment: minion_proverbs_11.sql (Proverbs 11) -----
-- Chapter: Proverbs 11 — the Solomonic antithetic collection (righteous-vs-wicked), opening on the Torah weights-and-measures law set as a proverb (11:1) and closing on two framework keystones: the fruit of the righteous as a tree of life and the soul-winner's wisdom (11:30), and the righteous recompensed in the earth (11:31) — the verse 1 Peter 4:18 quotes nearly verbatim. Between them run the integrity/righteousness-delivereth cluster (riches profit not in the day of wrath, but righteousness delivereth from death), the pride-bringeth-shame couplet, and the open-handed liberal soul.
-- Tag: pr11   Temp view: _s304_pr11_lookup
-- Sort band: base 28250, step 3 -> threads at 28250, 28253, 28256, 28259, 28262, 28265 (6 threads)
-- Source of EVERY row: 'canon','proverbs',11,v
--
-- Proverbs 11 coverage:
--   ★ v.1 (A false balance is abomination to Yahuah: but a just weight is his delight)
--        NT:     none warranted (the weights law is carried whole by Torah + prophets)
--        Extras: none warranted (clean Torah/prophet witness suffices; Sirach noise on the topic)
--        Tanakh: ★ Leviticus 19:35-36 (no unrighteousness in weight; just balances, just weights); Deuteronomy 25:13-16 (divers weights an abomination; a perfect and just weight); Proverbs 20:10,23 (divers weights both abomination; a false balance not good); Micah 6:11 (the bag of deceitful weights); Amos 8:5 (making the ephah small, falsifying the balances) — THREAD 1 (Torah affirmed: honest weights as covenant righteousness)
--   v.2 (When pride cometh, then cometh shame: but with the lowly is wisdom)
--        NT:     none warranted distinct (humility/grace carried in ch3's grace-to-humble thread; cross-lateral not dup)
--        Extras: ★ Sirach 10:7 (pride hateful before Yahuah and man); 10:12-13 (the beginning of pride is when one departs from Yahuah; pride is the beginning of sin) — THREAD 2
--        Tanakh: ★ Proverbs 16:18 (Pride goeth before destruction) — THREAD 2
--   ★ v.4 / v.6 / v.18-19 / v.28 (Riches profit not in the day of wrath: but righteousness delivereth from death; the righteousness of the upright shall deliver them; to him that soweth righteousness shall be a sure reward; he that trusteth in his riches shall fall)
--        NT:     ★ Galatians 6:7-8 (whatsoever a man soweth, that shall he also reap) — THREAD 3
--        Extras: none warranted distinct (the riches-cannot-deliver figure carried whole by Ezekiel/Zephaniah/Psalm)
--        Tanakh: ★ Ezekiel 7:19 (silver and gold not able to deliver in the day of the wrath of Yahuah); Zephaniah 1:18 (neither silver nor gold able to deliver in the day of the LORD'S wrath); Psalm 49:6-8 (they that trust in their wealth... none can redeem his brother) — THREAD 3
--   v.13 (A talebearer revealeth secrets), v.14 (in the multitude of counsellors there is safety), v.15 (surety for a stranger), v.16, v.17 (the merciful man doeth good to his own soul): merely-prudential, no framework-bearing weave warranted (v.17 mercy touched in THREAD 4 prose)
--   ★ v.24-25 (There is that scattereth, and yet increaseth... The liberal soul shall be made fat: and he that watereth shall be watered also himself)
--        NT:     ★ 2 Corinthians 9:6,8 (soweth bountifully shall reap bountifully; Elohim able to make all grace abound); Luke 6:38 (Give, and it shall be given... with the same measure) — THREAD 4
--        Extras: ★ Sirach 7:32 (stretch your hand to the poor, that your blessing may be perfected); Sirach 35:10 (give with a cheerful eye) — THREAD 4
--        Tanakh: ★ Proverbs 19:17 (He that hath pity upon the poor lendeth unto Yahuah) — THREAD 4 (cross-lateral to ch28's open-hand thread, not dup)
--   v.22 (As a jewel of gold in a swine's snout, so is a fair woman without discretion): folly's incongruity, stands alone, no framework weave warranted (none)
--   ★★ v.30 (The fruit of the righteous is a tree of life; and he that winneth souls is wise) — KEYSTONE
--        NT:     ★ Revelation 22:2 (the tree of life... the leaves for the healing of the nations); 22:14 (right to the tree of life by doing his commandments); ★ Daniel 12:3 (they that turn many to righteousness as the stars); James 5:20 (he which converteth the sinner shall save a soul); 1 Corinthians 9:22 (that I might by all means save some) — THREAD 5
--        Extras: none warranted distinct (1 Enoch ch25 tree-of-life parse is bad per brief — AVOID; the figure carried whole by Genesis + Revelation)
--        Tanakh: ★ Genesis 2:9 (the tree of life in the midst of the garden); 3:22-24 (lest he take of the tree of life; the way of the tree of life kept); Proverbs 3:18 (She is a tree of life) — THREAD 5
--   ★★ v.31 (Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner) — KEYSTONE
--        NT:     ★★ 1 Peter 4:18 (if the righteous scarcely be saved, where shall the ungodly and the sinner appear?) — quotes 11:31 nearly verbatim from the LXX shape — THREAD 6
--        Extras: ★ Wisdom of Solomon 3:1 (the souls of the righteous are in the hand of Yahuah); 5:15-16 (the righteous live for evermore; their reward with Yahuah) — THREAD 6
--        Tanakh: ★ Proverbs 13:21 (Evil pursueth sinners: but to the righteous good shall be repayed); Psalm 1:5-6 (the ungodly shall not stand in the judgment; the way of the ungodly shall perish) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight — Tanakh (Leviticus, Deuteronomy, Proverbs, Micah, Amos) [free] (the Torah weights-and-measures law set as a proverb; honest weights as covenant righteousness)
--   2. proverbs-11-when-pride-cometh-then-cometh-shame — Tanakh (Proverbs) + Extras (Sirach) [extras] (pride goeth before destruction; the beginning of pride is departing from Yahuah)
--   3. proverbs-11-riches-profit-not-in-the-day-of-wrath-righteousness-delivereth — Tanakh (Ezekiel, Zephaniah, Psalm) + NT (Galatians) [free] (riches cannot deliver in the day of wrath; righteousness delivereth from death; sow/reap)
--   4. proverbs-11-the-liberal-soul-shall-be-made-fat — Tanakh (Proverbs) + NT (2 Corinthians, Luke) + Extras (Sirach) [extras] (the scattering that increaseth; the watered waterer; the open hand)
--   5. proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life — Tanakh (Genesis, Proverbs) + NT (Revelation, Daniel, James, 1 Corinthians) [free] (★★ KEYSTONE: tree-of-life figure Eden-to-New-Jerusalem + the soul-winner's wisdom)
--   6. proverbs-11-the-righteous-recompensed-in-the-earth — Tanakh (Proverbs, Psalm) + NT (1 Peter) + Extras (Wisdom of Solomon) [extras] (★★ KEYSTONE: 1 Peter 4:18 quotes it; the righteous and the sinner each recompensed)
--
-- Framing notes:
--   ★ TORAH WEIGHTS (THREAD 1): *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (11:1) is the Leviticus/Deuteronomy weights-and-measures law set as a proverb — *Just balances, just weights, a just ephah, and a just hin, shall ye have* (Leviticus 19:36); *Thou shalt not have in thy bag divers weights... For all that do such things... are an abomination unto Yahuah Elohayka* (Deuteronomy 25:13,16). The same book repeats it (Proverbs 20:10,23), and the prophets prosecute its breach (Micah 6:11; Amos 8:5). Torah affirmed: honest dealing IS covenant righteousness, an abomination to break.
--   ★★ TREE OF LIFE / SOUL-WINNER (THREAD 5, KEYSTONE): *The fruit of the righteous is a tree of life; and he that winneth souls is wise* (11:30). The tree-of-life figure runs Eden to New Jerusalem — *the tree of life also in the midst of the garden* (Genesis 2:9), barred after the fall (Genesis 3:22-24), reopened in the consummation *the leaves of the tree were for the healing of the nations* (Revelation 22:2), entered by *they that do his commandments* (Revelation 22:14) — and Wisdom herself is that tree (Proverbs 3:18). The soul-winner's wisdom is filled by Daniel — *they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3) — and the apostles — *he which converteth the sinner from the error of his way shall save a soul* (James 5:20).
--   ★★ RECOMPENSED IN THE EARTH (THREAD 6, KEYSTONE): *Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner* (11:31). Peter quotes it nearly verbatim from the LXX shape — *And if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:18) — the "much more" of the wicked becoming the "where shall they appear." The same book restates it (Proverbs 13:21), the Psalter opens with it (Psalm 1:5-6), and the restored witness keeps the reward sure (Wisdom 3:1; 5:15-16).
--   EXTRAS: Sirach (edition 'apocrypha' + book 'ecclesiasticus') on pride (10:7,12,13) and the open hand (7:32, 35:10); Wisdom of Solomon (edition 'apocrypha' + book 'the-wisdom-of-solomon') on the righteous recompensed (3:1, 5:15-16). 1 Enoch ch25 tree-of-life is the bad-parse the brief flags — DELIBERATELY not used in THREAD 5.

CREATE TEMP VIEW _s304_pr11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: A false balance is abomination — a just weight his delight (the Torah weights law)
    ('canon','proverbs',11,1,'canon','leviticus',19,35,'free',
      E'*Ye shall do no unrighteousness in judgment, in meteyard, in weight, or in measure* (Leviticus 19:35). The proverb *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1) is the Torah''s own commerce-law set as a couplet: *Ye shall do no unrighteousness... in weight, or in measure*. Honest dealing is not mere prudence but covenant obedience, written into the holiness code itself.'),
    ('canon','proverbs',11,1,'canon','leviticus',19,36,'free',
      E'*Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt* (Leviticus 19:36). The *just weight* that is Yahuah''s *delight* (Proverbs 11:1) is the Torah''s direct command — *Just balances, just weights... shall ye have* — sealed with the Name and the deliverance from Egypt. The merchant''s scale is a matter of the covenant.'),
    ('canon','proverbs',11,1,'canon','deuteronomy',25,13,'free',
      E'*Thou shalt not have in thy bag divers weights, a great and a small* (Deuteronomy 25:13). The *false balance* that is an *abomination* (Proverbs 11:1) is the bag of divers weights the Torah forbids — *a great and a small* — one for buying and one for selling. The proverb names as abomination exactly what Deuteronomy commands against.'),
    ('canon','proverbs',11,1,'canon','deuteronomy',25,15,'free',
      E'*But thou shalt have a perfect and just weight, a perfect and just measure shalt thou have: that thy days may be lengthened in the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Deuteronomy 25:15). The *just weight* of Yahuah''s *delight* (Proverbs 11:1) is here joined to the land-promise: *a perfect and just weight... that thy days may be lengthened in the land*. Honest weights are bound to the covenant inheritance itself.'),
    ('canon','proverbs',11,1,'canon','deuteronomy',25,16,'free',
      E'*For all that do such things, and all that do unrighteously, are an abomination unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 25:16). The very word of Proverbs 11:1 — *A false balance is abomination to Yahuah (LORD)* — is the Torah''s own verdict: *all that do unrighteously, are an abomination unto Yahuah Elohayka*. The proverb is quoting the law''s judgment back, not softening it.'),
    ('canon','proverbs',11,1,'canon','proverbs',20,10,'free',
      E'*Divers weights, and divers measures, both of them are alike abomination to Yahuah (LORD)* (Proverbs 20:10). The same book sets the weights-law down twice more: as *A false balance is abomination to Yahuah (LORD)* (11:1), so *Divers weights, and divers measures, both of them are alike abomination to Yahuah (LORD)* (20:10). The repetition marks how weighty the matter is to Yahuah.'),
    ('canon','proverbs',11,1,'canon','proverbs',20,23,'free',
      E'*Divers weights are an abomination unto Yahuah (LORD); and a false balance is not good* (Proverbs 20:23). Proverbs echoes 11:1 almost word for word — *a false balance is not good* — binding the divers weights and the false balance together as one abomination. Twice over the book makes honest scales a test of the covenant heart.'),
    ('canon','proverbs',11,1,'canon','micah',6,11,'free',
      E'*Shall I count them pure with the wicked balances, and with the bag of deceitful weights?* (Micah 6:11). Micah prosecutes the breach of Proverbs 11:1 in a covenant lawsuit: Yahuah will not *count them pure with the wicked balances, and with the bag of deceitful weights*. The *false balance* that is His abomination is the very thing the prophet arraigns the city for.'),
    ('canon','proverbs',11,1,'canon','amos',8,5,'free',
      E'*Saying, When will the new moon be gone, that we may sell corn? and the sabbath, that we may set forth wheat, making the ephah small, and the shekel great, and falsifying the balances by deceit?* (Amos 8:5). Amos shows the *false balance* of Proverbs 11:1 in the marketplace — *making the ephah small, and the shekel great, and falsifying the balances by deceit* — joined to contempt for the new moon and the sabbath. The dishonest scale and the despised appointed-times are one corruption Yahuah judges.'),

    -- THREAD 2: When pride cometh, then cometh shame
    ('canon','proverbs',11,2,'canon','proverbs',16,18,'free',
      E'*Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). The shame that follows pride in *When pride cometh, then cometh shame* (Proverbs 11:2) is the same sequence the book states again — *Pride goeth before destruction, and an haughty spirit before a fall*. Pride is no small fault but the harbinger of ruin; *with the lowly is wisdom*.'),
    ('canon','proverbs',11,2,'apocrypha','ecclesiasticus',10,7,'extras',
      E'*Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity* (Sirach 10:7). The restored witness sets pride where Proverbs 11:2 does — *Pride is hateful before Yahuah (God) and man* — the very thing that brings shame. What is hateful before Yahuah cannot but end in the shame the proverb foretells.'),
    ('canon','proverbs',11,2,'apocrypha','ecclesiasticus',10,12,'extras',
      E'*The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker* (Sirach 10:12). Sirach traces the pride of Proverbs 11:2 to its root: *the beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker*. The lowly, by contrast, keep near their Maker — and *with the lowly is wisdom*.'),
    ('canon','proverbs',11,2,'apocrypha','ecclesiasticus',10,13,'extras',
      E'*For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly* (Sirach 10:13). The shame of *When pride cometh, then cometh shame* (Proverbs 11:2) is here drawn to its end — *Yahuah (God) brought upon them strange calamities, and overthrew them utterly*. Pride is named *the beginning of sin*, and its wage is the overthrow the proverb warns of.'),

    -- THREAD 3: Riches profit not in the day of wrath — righteousness delivereth from death
    ('canon','proverbs',11,4,'canon','ezekiel',7,19,'free',
      E'*They shall cast their silver in the streets, and their gold shall be removed: their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD): they shall not satisfy their souls, neither fill their bowels: because it is the stumblingblock of their iniquity* (Ezekiel 7:19). Ezekiel draws out *Riches profit not in the day of wrath* (Proverbs 11:4) in full: *their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah*. What cannot deliver in that day is righteousness'' opposite; only *righteousness delivereth from death*.'),
    ('canon','proverbs',11,4,'canon','zephaniah',1,18,'free',
      E'*Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath; but the whole land shall be devoured by the fire of his jealousy* (Zephaniah 1:18). Zephaniah names the same day Proverbs 11:4 names — *the day of the LORD''S wrath* — and the same powerlessness of wealth: *Neither their silver nor their gold shall be able to deliver them*. Riches profit not; the only thing that delivers from death is righteousness.'),
    ('canon','proverbs',11,4,'canon','psalms',49,7,'free',
      E'*None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7). The Psalter sings the futility of riches of Proverbs 11:4 — *They that trust in their wealth, and boast themselves in the multitude of their riches* (49:6) — and shows their limit: *None of them can by any means redeem his brother*. Wealth cannot buy back a soul; *righteousness delivereth from death*.'),
    ('canon','proverbs',11,18,'canon','galatians',6,7,'free',
      E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The sowing of *to him that soweth righteousness shall be a sure reward* (Proverbs 11:18) is the law Paul states whole: *whatsoever a man soweth, that shall he also reap*. The sure reward of the righteous sower and the death of him that *pursueth evil* (11:19) are one harvest-principle, never abolished.'),
    ('canon','proverbs',11,19,'canon','galatians',6,8,'free',
      E'*For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:8). Paul draws out the two ends of *As righteousness tendeth to life: so he that pursueth evil pursueth it to his own death* (Proverbs 11:19): *he that soweth to his flesh shall... reap corruption; but he that soweth to the Spirit shall... reap life everlasting*. Righteousness to life, evil to death — the same two roads.'),

    -- THREAD 4: The liberal soul shall be made fat (the open hand)
    ('canon','proverbs',11,24,'canon','2-corinthians',9,6,'free',
      E'*But this I say, He which soweth sparingly shall reap also sparingly; and he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6). Paul states the paradox of *There is that scattereth, and yet increaseth* (Proverbs 11:24): *he which soweth bountifully shall reap also bountifully*. The scattering hand is the sowing hand; the one who gives freely is the one who increases.'),
    ('canon','proverbs',11,25,'canon','2-corinthians',9,8,'free',
      E'*And Elohim (God) is able to make all grace abound toward you; that ye, always having all sufficiency in all things, may abound to every good work* (2 Corinthians 9:8). The watered waterer of *he that watereth shall be watered also himself* (Proverbs 11:25) is kept by Paul: *Elohim (God) is able to make all grace abound toward you... that ye... may abound to every good work*. The liberal soul is made fat because Yahuah Himself fills again the hand that pours out.'),
    ('canon','proverbs',11,25,'canon','luke',6,38,'free',
      E'*Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over, shall men give into your bosom. For with the same measure that ye mete withal it shall be measured to you again* (Luke 6:38). Yahusha (Jesus) speaks *The liberal soul shall be made fat* (Proverbs 11:25) plainly: *Give, and it shall be given unto you; good measure... running over*. The measure poured out returns; the watering hand is watered.'),
    ('canon','proverbs',11,25,'canon','proverbs',19,17,'free',
      E'*He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). The same book tells WHY *he that watereth shall be watered also himself* (Proverbs 11:25): the gift to the poor is a loan to Yahuah — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again*. The liberal soul is made fat because Yahuah is no man''s debtor.'),
    ('canon','proverbs',11,25,'apocrypha','ecclesiasticus',7,32,'extras',
      E'*And stretch yours hand to the poor, that your blessing may be perfected* (Sirach 7:32). The restored witness joins the open hand of *The liberal soul shall be made fat* (Proverbs 11:25) to a perfected blessing: *stretch yours hand to the poor, that your blessing may be perfected*. The scattering that increaseth is the hand stretched out, and the blessing it draws back is made full.'),
    ('canon','proverbs',11,25,'apocrypha','ecclesiasticus',35,10,'extras',
      E'*Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye* (Sirach 35:10). The liberal soul of Proverbs 11:25 gives as the restored witness charges — *with a cheerful eye* — out of what the Most High has given. The withholder who *tendeth to poverty* (11:24) gives grudgingly or not at all; the cheerful giver is the watered waterer.'),

    -- THREAD 5: The fruit of the righteous is a tree of life (KEYSTONE)
    ('canon','proverbs',11,30,'canon','genesis',2,9,'free',
      E'*And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil* (Genesis 2:9). The figure of *The fruit of the righteous is a tree of life* (Proverbs 11:30) reaches back to Eden — *the tree of life also in the midst of the garden*. The righteous bears the fruit of that very tree; his life feeds others as the garden-tree fed Adam.'),
    ('canon','proverbs',11,30,'canon','genesis',3,22,'free',
      E'*And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22). The *tree of life* of Proverbs 11:30 is the one barred after the fall — *lest he put forth his hand, and take also of the tree of life, and eat, and live for ever*. What was guarded from the fallen man, the fruit of the righteous now extends toward again.'),
    ('canon','proverbs',11,30,'canon','genesis',3,24,'free',
      E'*So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24). The way to the *tree of life* (Proverbs 11:30) was kept by *Cherubims, and a flaming sword*; the whole canon moves toward reopening it. The righteous, bearing its fruit, points the way back that was barred.'),
    ('canon','proverbs',11,30,'canon','proverbs',3,18,'free',
      E'*She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). The same book names Wisdom herself the tree: *She is a tree of life to them that lay hold upon her*. The fruit of the righteous (11:30) is the fruit of laying hold on Wisdom — the tree-of-life figure binds the righteous man and Wisdom into one.'),
    ('canon','proverbs',11,30,'canon','revelation',22,2,'free',
      E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The *tree of life* of Proverbs 11:30 is restored in the consummation — *the leaves of the tree were for the healing of the nations*. The fruit the righteous bears now is a foretaste of the tree barred in Eden and reopened in the New Jerusalem.'),
    ('canon','proverbs',11,30,'canon','revelation',22,14,'free',
      E'*Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). Access to the *tree of life* (Proverbs 11:30) is for *they that do his commandments* — the same Torah-keeping righteousness whose fruit the proverb calls a tree of life. The righteous bears the fruit and gains the right; commandment-keeping and the tree are joined end to end.'),
    ('canon','proverbs',11,30,'canon','daniel',12,3,'free',
      E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). Daniel fills the second half of Proverbs 11:30 — *he that winneth souls is wise* — with everlasting glory: *they that turn many to righteousness as the stars for ever and ever*. The soul-winner''s wisdom shines forever; the fruit of the righteous becomes a harvest of stars.'),
    ('canon','proverbs',11,30,'canon','james',5,20,'free',
      E'*Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* (James 5:20). Yaaqob (James) states *he that winneth souls is wise* (Proverbs 11:30) as a saving work: *he which converteth the sinner from the error of his way shall save a soul from death*. The wise soul-winner does the very thing the tree of life does — turns death toward life.'),
    ('canon','proverbs',11,30,'canon','1-corinthians',9,22,'free',
      E'*To the weak became I as weak, that I might gain the weak: I am made all things to all men, that I might by all means save some* (1 Corinthians 9:22). Paul lives out *he that winneth souls is wise* (Proverbs 11:30): *I am made all things to all men, that I might by all means save some*. The winning of souls is the wisdom that spends itself for others, bearing the fruit of the tree of life.'),

    -- THREAD 6: The righteous recompensed in the earth (KEYSTONE — 1 Peter 4:18)
    ('canon','proverbs',11,31,'canon','1-peter',4,18,'free',
      E'*And if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:18). Peter quotes Proverbs 11:31 nearly word for word from the Greek shape: where the proverb says *the righteous shall be recompensed in the earth: much more the wicked and the sinner*, Peter draws the "much more" out as a question — *if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* The recompense of the righteous measures the far heavier reckoning of the wicked.'),
    ('canon','proverbs',11,31,'canon','proverbs',13,21,'free',
      E'*Evil pursueth sinners: but to the righteous good shall be repayed* (Proverbs 13:21). The same book states the recompense of Proverbs 11:31 plainly: *Evil pursueth sinners: but to the righteous good shall be repayed*. Each is paid in his own coin — good to the righteous, evil hunting down the sinner.'),
    ('canon','proverbs',11,31,'canon','psalms',1,5,'free',
      E'*Therefore the ungodly shall not stand in the judgment, nor sinners in the congregation of the righteous* (Psalm 1:5). The Psalter opens on the recompense of Proverbs 11:31: *the ungodly shall not stand in the judgment, nor sinners in the congregation of the righteous*. The *much more* owed to the wicked is their not standing; the righteous, recompensed, stand.'),
    ('canon','proverbs',11,31,'canon','psalms',1,6,'free',
      E'*For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). The two recompenses of Proverbs 11:31 are the two ways of Psalm 1: *Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish*. The righteous recompensed and the wicked answered are the known way and the perishing way.'),
    ('canon','proverbs',11,31,'apocrypha','the-wisdom-of-solomon',3,1,'extras',
      E'*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1). The restored witness keeps the recompense of *the righteous shall be recompensed in the earth* (Proverbs 11:31): *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them*. The recompense of the righteous is safe-keeping in Yahuah''s own hand.'),
    ('canon','proverbs',11,31,'apocrypha','the-wisdom-of-solomon',5,15,'extras',
      E'*But the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High* (Wisdom of Solomon 5:15). The recompense of Proverbs 11:31 is here made everlasting: *the righteous live for evermore; their reward also is with Yahuah (God)*. The "recompensed in the earth" opens onto a reward kept with the Most High Himself.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight',
       E'A false balance is abomination — a just weight his delight',
       E'The chapter opens with the Torah''s weights-and-measures law set as a proverb: *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1). This is no mere business maxim — it is the holiness code quoted back: *Ye shall do no unrighteousness in judgment, in meteyard, in weight, or in measure* (Leviticus 19:35); *Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:36). Deuteronomy forbids the very *false balance* the proverb names — *Thou shalt not have in thy bag divers weights, a great and a small* (25:13) — and ties honest weights to the land-promise: *thou shalt have a perfect and just weight... that thy days may be lengthened in the land* (25:15), pronouncing the proverb''s own verdict, *all that do unrighteously, are an abomination unto Yahuah Elohayka (the LORD thy God)* (25:16). The same book repeats the law twice more — *Divers weights, and divers measures, both of them are alike abomination to Yahuah (LORD)* (20:10), *a false balance is not good* (20:23) — and the prophets prosecute its breach as covenant treason: *Shall I count them pure with the wicked balances, and with the bag of deceitful weights?* (Micah 6:11); *making the ephah small, and the shekel great, and falsifying the balances by deceit* (Amos 8:5), joined there to contempt for the new moon and the sabbath. Torah affirmed: honest dealing IS covenant righteousness, an abomination to break, and Yahuah''s delight to keep.',
       sv.verse_id, ev.verse_id, 'free', 28250
  FROM _s304_pr11_lookup sv, _s304_pr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-11-when-pride-cometh-then-cometh-shame',
       E'When pride cometh, then cometh shame — with the lowly is wisdom',
       E'*When pride cometh, then cometh shame: but with the lowly is wisdom* (Proverbs 11:2). The book states the same sequence elsewhere with the end made plain — *Pride goeth before destruction, and an haughty spirit before a fall* (16:18) — pride is no small fault but the harbinger of ruin. The restored witness traces it to its root and its end: *Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity* (Sirach 10:7); *The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker* (Sirach 10:12); *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly* (Sirach 10:13). The shame the proverb foretells is the overthrow Sirach describes, and the lowly — who keep near their Maker rather than departing from Him — are the ones with whom wisdom dwells. (The grace given to the humble runs as its own thread at Proverbs 3; here the couplet stands on pride''s certain shame.)',
       sv.verse_id, ev.verse_id, 'extras', 28253
  FROM _s304_pr11_lookup sv, _s304_pr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=11 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-11-riches-profit-not-in-the-day-of-wrath-righteousness-delivereth',
       E'Riches profit not in the day of wrath — righteousness delivereth from death',
       E'The chapter''s great antithesis runs through several couplets: *Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4); *The righteousness of the upright shall deliver them* (11:6); *to him that soweth righteousness shall be a sure reward* (11:18); *As righteousness tendeth to life: so he that pursueth evil pursueth it to his own death* (11:19); *He that trusteth in his riches shall fall: but the righteous shall flourish as a branch* (11:28). The prophets draw out the futility of wealth in the day of wrath in full: *their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD)* (Ezekiel 7:19); *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath* (Zephaniah 1:18). The Psalter sings the same limit: *They that trust in their wealth, and boast themselves in the multitude of their riches* (Psalm 49:6) cannot redeem a soul — *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (49:7). And the New Testament keeps the sowing-and-reaping principle whole, never abolishing it: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7); *he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (6:8). Riches cannot deliver from death; only righteousness — the sowing to the Spirit — tends to life.',
       sv.verse_id, ev.verse_id, 'free', 28256
  FROM _s304_pr11_lookup sv, _s304_pr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=11 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-11-the-liberal-soul-shall-be-made-fat',
       E'The liberal soul shall be made fat — the open hand watered',
       E'The chapter sets down one of the great paradoxes of the open hand: *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty. The liberal soul shall be made fat: and he that watereth shall be watered also himself* (Proverbs 11:24-25). The scattering hand is the sowing hand — Paul states it whole: *He which soweth sparingly shall reap also sparingly; and he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6), for *Elohim (God) is able to make all grace abound toward you... that ye... may abound to every good work* (9:8). Yahusha (Jesus) speaks it plainly: *Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over, shall men give into your bosom. For with the same measure that ye mete withal it shall be measured to you again* (Luke 6:38). And the same book of Proverbs tells WHY the waterer is watered: the gift to the poor is a loan to Yahuah Himself — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (19:17). The restored witness joins the open hand to a perfected blessing and a cheerful eye: *stretch yours hand to the poor, that your blessing may be perfected* (Sirach 7:32); *Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye* (Sirach 35:10). The liberal soul is made fat because Yahuah is no man''s debtor; the withholder, hoarding more than is meet, tends to poverty.',
       sv.verse_id, ev.verse_id, 'extras', 28259
  FROM _s304_pr11_lookup sv, _s304_pr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=11 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life',
       E'The fruit of the righteous is a tree of life — and he that winneth souls is wise',
       E'A keystone closes the chapter: *The fruit of the righteous is a tree of life; and he that winneth souls is wise* (Proverbs 11:30). The tree-of-life figure runs the whole canon from Eden to the New Jerusalem. It stood *in the midst of the garden* (Genesis 2:9); it was barred after the fall — *lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22) — its way kept by *Cherubims, and a flaming sword which turned every way* (3:24); the same book names Wisdom herself that tree — *She is a tree of life to them that lay hold upon her* (Proverbs 3:18); and it is reopened in the consummation — *the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* (Revelation 22:2), entered by *they that do his commandments* (22:14). The righteous, bearing the fruit of that tree, feeds others and points the way back that was barred. The second half — *he that winneth souls is wise* — is filled by Daniel and the apostles: *they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3); *he which converteth the sinner from the error of his way shall save a soul from death* (James 5:20); *I am made all things to all men, that I might by all means save some* (1 Corinthians 9:22). The soul-winner''s wisdom does the very work of the tree of life — turning death toward life — and shines forever.',
       sv.verse_id, ev.verse_id, 'free', 28262
  FROM _s304_pr11_lookup sv, _s304_pr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=11 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-11-the-righteous-recompensed-in-the-earth',
       E'The righteous recompensed in the earth — much more the wicked and the sinner',
       E'The chapter''s final keystone: *Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner* (Proverbs 11:31). Peter quotes it nearly word for word from the Greek shape, turning the "much more" into a question: *And if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:18) — the recompense of the righteous measures the far heavier reckoning of the wicked. The same book states it plainly — *Evil pursueth sinners: but to the righteous good shall be repayed* (Proverbs 13:21) — and the Psalter opens the whole Psalter on it: *the ungodly shall not stand in the judgment, nor sinners in the congregation of the righteous* (Psalm 1:5); *Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (1:6). The restored witness keeps the recompense sure and everlasting: *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1); *the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High* (5:15). Each is paid in his own coin — the righteous recompensed and kept, the wicked and the sinner answered with a far heavier reckoning.',
       sv.verse_id, ev.verse_id, 'extras', 28265
  FROM _s304_pr11_lookup sv, _s304_pr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=11 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Ye shall do no unrighteousness in judgment, in meteyard, in weight, or in measure* (Leviticus 19:35) — the holiness code behind 11:1; honest weights are covenant obedience.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem* (Leviticus 19:36) — the just weight of Yahuah''s delight (11:1) is the Torah''s command, sealed with the Name.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt not have in thy bag divers weights, a great and a small* (Deuteronomy 25:13) — the false balance of 11:1 is the bag of divers weights the Torah forbids.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a perfect and just weight... that thy days may be lengthened in the land* (Deuteronomy 25:15) — the just weight of 11:1 bound to the land-promise.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*all that do unrighteously, are an abomination unto Yahuah Elohayka* (Deuteronomy 25:16) — the very verdict 11:1 quotes back: a false balance is abomination.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Divers weights, and divers measures, both of them are alike abomination to Yahuah (LORD)* (Proverbs 20:10) — the same book sets the weights-law down again.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Divers weights are an abomination unto Yahuah (LORD); and a false balance is not good* (Proverbs 20:23) — Proverbs echoes 11:1 almost word for word.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Shall I count them pure with the wicked balances, and with the bag of deceitful weights?* (Micah 6:11) — the prophet prosecutes the breach of 11:1 as covenant treason.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*making the ephah small, and the shekel great, and falsifying the balances by deceit* (Amos 8:5) — the false balance of 11:1 in the marketplace, joined to despising the new moon and sabbath.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-a-false-balance-is-abomination-a-just-weight-his-delight'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18) — the same sequence as 11:2, with the end made plain.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-when-pride-cometh-then-cometh-shame'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Pride is hateful before Yahuah (God) and man* (Sirach 10:7) — what is hateful before Yahuah cannot but end in the shame 11:2 foretells.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-when-pride-cometh-then-cometh-shame'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The beginning of pride is when one departs from Yahuah (God)* (Sirach 10:12) — the root of the pride 11:2 names; the lowly keep near their Maker.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-when-pride-cometh-then-cometh-shame'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*pride is the beginning of sin... and overthrew them utterly* (Sirach 10:13) — the shame of 11:2 drawn to its end, the overthrow.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-when-pride-cometh-then-cometh-shame'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD)* (Ezekiel 7:19) — 11:4 drawn out in full.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=7 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-riches-profit-not-in-the-day-of-wrath-righteousness-delivereth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath* (Zephaniah 1:18) — the same day, the same powerlessness of wealth, as 11:4.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-riches-profit-not-in-the-day-of-wrath-righteousness-delivereth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7) — wealth cannot buy back a soul; only righteousness delivereth (11:4).'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-riches-profit-not-in-the-day-of-wrath-righteousness-delivereth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — the sowing of 11:18 stated whole; the sure reward never abolished.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=18
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-riches-profit-not-in-the-day-of-wrath-righteousness-delivereth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:8) — the two ends of 11:19: righteousness to life, evil to death.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=19
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-riches-profit-not-in-the-day-of-wrath-righteousness-delivereth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6) — the scattering that increaseth (11:24); the giving hand is the sowing hand.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=24
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-liberal-soul-shall-be-made-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim (God) is able to make all grace abound toward you... that ye... may abound to every good work* (2 Corinthians 9:8) — the watered waterer of 11:25; Yahuah fills the hand that pours out.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=25
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-liberal-soul-shall-be-made-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Give, and it shall be given unto you; good measure... running over* (Luke 6:38) — Yahusha speaks 11:25 plainly; the measure poured out returns.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=25
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-liberal-soul-shall-be-made-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He that hath pity upon the poor lendeth unto Yahuah (LORD)* (Proverbs 19:17) — why the waterer is watered: the gift is a loan to Yahuah, no man''s debtor.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=25
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-liberal-soul-shall-be-made-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*stretch yours hand to the poor, that your blessing may be perfected* (Sirach 7:32) — the open hand of 11:25 draws back a perfected blessing.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=25
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-liberal-soul-shall-be-made-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*give with a cheerful eye* (Sirach 35:10) — the liberal soul of 11:25 gives gladly; the withholder tends to poverty.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=25
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-liberal-soul-shall-be-made-fat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the tree of life also in the midst of the garden* (Genesis 2:9) — the figure of 11:30 reaches back to Eden.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*lest he put forth his hand, and take also of the tree of life... and live for ever* (Genesis 3:22) — the tree of 11:30 barred after the fall.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24) — the way to the tree of 11:30 guarded; the canon moves to reopen it.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*She is a tree of life to them that lay hold upon her* (Proverbs 3:18) — the same book names Wisdom herself the tree; the fruit of 11:30 is the fruit of laying hold on Wisdom.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the tree of life... the leaves of the tree were for the healing of the nations* (Revelation 22:2) — the tree of 11:30 restored in the consummation.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Blessed are they that do his commandments, that they may have right to the tree of life* (Revelation 22:14) — access to the tree of 11:30 is for commandment-keepers.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3) — the soul-winner''s wisdom of 11:30 filled with everlasting glory.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*he which converteth the sinner from the error of his way shall save a soul from death* (James 5:20) — winning souls (11:30) is a saving work.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*I am made all things to all men, that I might by all means save some* (1 Corinthians 9:22) — Paul lives out the soul-winner''s wisdom of 11:30.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-fruit-of-the-righteous-is-a-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:18) — Peter quotes 11:31 nearly verbatim from the Greek shape.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=4 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-righteous-recompensed-in-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Evil pursueth sinners: but to the righteous good shall be repayed* (Proverbs 13:21) — the same book states the recompense of 11:31 plainly.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-righteous-recompensed-in-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the ungodly shall not stand in the judgment, nor sinners in the congregation of the righteous* (Psalm 1:5) — the much-more owed to the wicked (11:31).'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-righteous-recompensed-in-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the way of the ungodly shall perish* (Psalm 1:6) — the two recompenses of 11:31 are the two ways of Psalm 1.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-righteous-recompensed-in-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1) — the recompense of 11:31 is safe-keeping in Yahuah''s hand.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-righteous-recompensed-in-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the righteous live for evermore; their reward also is with Yahuah (God)* (Wisdom of Solomon 5:15) — the recompense of 11:31 made everlasting.'
  FROM cross_reference_threads t
  JOIN _s304_pr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s304_pr11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-11-the-righteous-recompensed-in-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
