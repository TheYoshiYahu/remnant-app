-- ----- fragment: minion_proverbs_13.sql (Proverbs 13) -----
-- Chapter: Proverbs 13 — a Solomonic antithetic collection of righteous-vs-wicked couplets. The framework weight sits on the WORD/Torah (★13:13 *Whoso despiseth the word shall be destroyed: but he that feareth the commandment shall be rewarded*, sealed by 13:14 *The law of the wise is a fountain of life*), on the tree-of-life figure of fulfilled hope (★13:12), and on the Father's loving discipline (★13:24). Around these run the wealth/righteousness couplets (13:7, 13:11, 13:22), the light-of-the-righteous figure (13:9), and the recompense theme (13:21).
-- Tag: pr13   Temp view: _s304_pr13_lookup
-- Sort band: base 28300, step 3 -> threads at 28300, 28303, 28306, 28309, 28312, 28315 (6 threads)
-- Source of EVERY row: 'canon','proverbs',13,v
--
-- Proverbs 13 coverage:
--   v.1 (A wise son heareth his father's instruction: but a scorner heareth not rebuke)
--        NT/Extras/Tanakh: folded into THREAD 3 prose (the wise son who heareth instruction = the discipline frame); no distinct thread
--   v.2/v.3 (fruit of the mouth / he that keepeth his mouth keepeth his life)
--        NT:     none warranted distinct (tongue-couplets carried by the wider Proverbs corpus already threaded elsewhere)
--        Extras: none warranted   Tanakh: none warranted distinct — merely-prudential, no add
--   v.4 (soul of the sluggard desireth and hath nothing / soul of the diligent made fat)
--        merely-prudential diligence couplet — none warranted (touched in THREAD 5 prose alongside 13:11 labour)
--   v.5/v.6 (righteous hateth lying / righteousness keepeth the upright)
--        none warranted distinct — general righteous/wicked frame, no single weave
--   ★ v.7 (There is that maketh himself rich, yet hath nothing: there is that maketh himself poor, yet hath great riches)
--        NT:     ★ Luke 12:21 (so is he that layeth up treasure for himself, and is not rich toward Elohim); ★ Revelation 3:17 (thou sayest, I am rich... and knowest not that thou art... poor); 2 Corinthians 6:10 (as poor, yet making many rich) — THREAD 5
--        Extras: ★ Sirach 11:18-19 (waxeth rich... and must leave those things to others, and die) — THREAD 5
--        Tanakh: ★ Ecclesiastes 2:18-21 (I leave it unto the man that shall be after me); Proverbs 11:28 (He that trusteth in his riches shall fall) — THREAD 5
--   v.8 (ransom of a man's life are his riches / poor heareth not rebuke) — folded into THREAD 5 prose; no distinct add
--   ★ v.9 (The light of the righteous rejoiceth: but the lamp of the wicked shall be put out)
--        NT:     ★ Matthew 5:14-16 (Ye are the light of the world... let your light so shine before men) — THREAD 4
--        Extras: none warranted (the lamp-of-the-wicked figure is carried whole by Job + Proverbs laterals)
--        Tanakh: ★ Job 18:5-6 (the light of the wicked shall be put out... his candle shall be put out); Job 21:17 (How oft is the candle of the wicked put out); Proverbs 24:20 (the candle of the wicked shall be put out); Psalm 97:11 (Light is sown for the righteous) — THREAD 4
--   v.10 (Only by pride cometh contention) — merely-prudential, none warranted
--   v.11 (Wealth gotten by vanity shall be diminished: but he that gathereth by labour shall increase) — folded into THREAD 5 (the labour/vanity wealth couplet)
--   ★ v.12 (Hope deferred maketh the heart sick: but when the desire cometh, it is a tree of life) + v.19 (The desire accomplished is sweet to the soul)
--        NT:     ★ Revelation 22:2 (the tree of life... and the leaves of the tree were for the healing of the nations); Revelation 22:14 (right to the tree of life) — THREAD 2
--        Extras: none warranted distinct (tree-of-life carried by Genesis + Revelation + Proverbs laterals)
--        Tanakh: ★ Genesis 2:9 (the tree of life also in the midst of the garden); Proverbs 3:18 (She is a tree of life to them that lay hold upon her); Proverbs 11:30 (The fruit of the righteous is a tree of life); Proverbs 15:4 (A wholesome tongue is a tree of life) — THREAD 2 [cross-lateral to ch3 + ch11 tree-of-life threads; this thread keeps its own 13:12 framing, no content duplicated]
--   ★★ v.13 (Whoso despiseth the word shall be destroyed: but he that feareth the commandment shall be rewarded) + v.14 (The law of the wise is a fountain of life, to depart from the snares of death)
--        NT:     none warranted distinct (the despised-word judgment is carried by the Tanakh witnesses; NT Torah-affirmation lives in the ch28 prayer-thread already) — recorded none
--        Extras: none warranted (the word/commandment frame carried whole by Torah + prophets + Proverbs)
--        Tanakh: ★★ Numbers 15:31 (Because he hath despised the word of Yahuah, and hath broken his commandment, that soul shall utterly be cut off); 2 Chronicles 36:16 (they mocked the messengers... and despised his words... till there was no remedy); Proverbs 19:16 (He that keepeth the commandment keepeth his own soul) — THREAD 1 (the anti-antinomian Torah-thread)
--   v.15 (Good understanding giveth favour / way of transgressors is hard) — none warranted distinct
--   v.16/v.17 (prudent man / wicked messenger vs faithful ambassador) — merely-prudential, none warranted
--   v.18 (Poverty and shame to him that refuseth instruction: but he that regardeth reproof shall be honoured) — folded into THREAD 3 prose (the instruction/reproof frame around the rod)
--   v.20 (He that walketh with wise men shall be wise) — none warranted distinct (general companionship couplet)
--   ★ v.21 (Evil pursueth sinners: but to the righteous good shall be repayed)
--        NT:     ★ Romans 2:6-9 (Who will render to every man according to his deeds... tribulation and anguish, upon every soul of man that doeth evil) — weighed, folded contextually
--        Extras: none warranted
--        Tanakh: ★ Proverbs 11:31 (the righteous shall be recompensed in the earth: much more the wicked); Proverbs 11:21 (the wicked shall not be unpunished: but the seed of the righteous shall be delivered); Psalm 32:10 (Many sorrows shall be to the wicked) — THREAD 6 [cross-lateral note to ch11:31 recompense]
--   ★ v.22 (A good man leaveth an inheritance to his children's children: and the wealth of the sinner is laid up for the just)
--        NT/Extras: folded into THREAD 5 (the wealth-of-the-sinner-laid-up-for-the-just clause)
--        Tanakh: ★ Ecclesiastes 2:26 (to the sinner he giveth travail, to gather and to heap up, that he may give to him that is good); Job 27:16-17 (Though he heap up silver as the dust... the just shall put it on); Proverbs 28:8 (He that... by usury... gathereth it for him that will pity the poor) — THREAD 5
--   v.23 (Much food is in the tillage of the poor) — touched in THREAD 5 prose; no distinct add
--   ★ v.24 (He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes)
--        NT:     ★ Hebrews 12:6-7 (whom Yahuah loveth he chasteneth... what son is he whom the father chasteneth not); ★ Ephesians 6:4 (bring them up in the nurture and admonition of Yahuah) — THREAD 3
--        Extras: ★ Sirach 30:1 (He that loves his son causeth him oft to feel the rod); Sirach 30:2 (He that chastiseth his son shall have joy in him) — THREAD 3
--        Tanakh: ★ Proverbs 3:11-12 (despise not the chastening of Yahuah... for whom Yahuah loveth he correcteth; even as a father the son); Proverbs 22:15 (the rod of correction shall drive it far from him); Proverbs 23:13-14 (beat him with the rod... shalt deliver his soul from hell); Proverbs 29:15 (The rod and reproof give wisdom) — THREAD 3 [cross-lateral to ch3 chastening thread; the Father's-chastening pattern]
--   v.25 (The righteous eateth to the satisfying of his soul) — none warranted distinct
--
-- Threads (slug — target libraries):
--   1. proverbs-13-whoso-despiseth-the-word-shall-be-destroyed — Tanakh (Numbers, 2 Chronicles, Proverbs) [free] (★★ the WORD/Torah affirmed; despising the word = utterly cut off; the fear of the commandment rewarded — anti-antinomian)
--   2. proverbs-13-hope-deferred-and-the-tree-of-life — Tanakh (Genesis, Proverbs) + NT (Revelation) [free] (★ fulfilled hope a tree of life; the garden tree barred at Eden, opened again in the City)
--   3. proverbs-13-he-that-spareth-his-rod-hateth-his-son — Tanakh (Proverbs) + NT (Hebrews, Ephesians) + Extras (Sirach) [extras] (★ loving discipline = the Father's-chastening pattern; cross-lateral to ch3)
--   4. proverbs-13-the-light-of-the-righteous-rejoiceth — Tanakh (Job, Proverbs, Psalm) + NT (Matthew) [free] (★ the light of the righteous vs the lamp of the wicked put out)
--   5. proverbs-13-rich-yet-nothing-poor-yet-great-riches — Tanakh (Ecclesiastes, Proverbs, Job) + NT (Luke, Revelation, 2 Corinthians) + Extras (Sirach) [extras] (★ true vs false riches; the wealth of the sinner laid up for the just)
--   6. proverbs-13-evil-pursueth-sinners-the-righteous-good-repaid — Tanakh (Proverbs, Psalm) [free] (★ the recompense; evil pursues the sinner, good is repaid the righteous — cross-lateral to ch11:31)
--
-- Framing notes:
--   ★★ THE WORD / TORAH (THREAD 1): *Whoso despiseth the word shall be destroyed: but he that feareth the commandment shall be rewarded* (13:13), sealed by *The law of the wise is a fountain of life, to depart from the snares of death* (13:14). This is the chapter's anti-antinomian center. To despise the word is no light thing — the Torah itself names the verdict: *Because he hath despised the word of Yahuah (LORD), and hath broken his commandment, that soul shall utterly be cut off* (Numbers 15:31). The Chronicler shows the verdict carried out on a whole nation that *despised his words... till there was no remedy* (2 Chronicles 36:16). And the same book of Proverbs states the reward of the feared commandment: *He that keepeth the commandment keepeth his own soul* (19:16). The word is not abolished; it is a fountain of life, and to despise it is destruction.
--   ★ TREE OF LIFE (THREAD 2): *Hope deferred maketh the heart sick: but when the desire cometh, it is a tree of life* (13:12), echoed by *The desire accomplished is sweet to the soul* (13:19). The tree-of-life figure runs the whole canon — planted in the garden, *the tree of life also in the midst of the garden* (Genesis 2:9), made wisdom's own image in Proverbs (*She is a tree of life to them that lay hold upon her*, 3:18; *The fruit of the righteous is a tree of life*, 11:30; *A wholesome tongue is a tree of life*, 15:4), and opened again at the end: *in the midst of the street of it... was there the tree of life... and the leaves of the tree were for the healing of the nations* (Revelation 22:2). Fulfilled hope is a foretaste of the tree barred at Eden and restored in the City. [Cross-lateral to the ch3 and ch11 tree-of-life threads; this thread keeps its own 13:12 framing and does not duplicate their content.]
--   ★ THE ROD / FATHER'S CHASTENING (THREAD 3): *He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes* (13:24). Discipline is love, not cruelty — the very pattern of the Father with His sons. Proverbs says it again and again: *despise not the chastening of Yahuah (LORD)... for whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (3:11-12); *the rod of correction shall drive it far from him* (22:15); *Thou shalt beat him with the rod, and shalt deliver his soul from hell* (23:14); *The rod and reproof give wisdom* (29:15). The restored witness keeps the same: *He that loves his son causeth him oft to feel the rod* (Sirach 30:1). And the NT lifts the proverb straight up to the Father: *whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth... what son is he whom the father chasteneth not?* (Hebrews 12:6-7) — with the counter-charge to fathers, *bring them up in the nurture and admonition of Yahuah (Lord)* (Ephesians 6:4). [Cross-lateral to the ch3 chastening thread.]
--   ★ LIGHT OF THE RIGHTEOUS (THREAD 4): *The light of the righteous rejoiceth: but the lamp of the wicked shall be put out* (13:9). Job's friends and Job alike know the put-out lamp — *the light of the wicked shall be put out, and the spark of his fire shall not shine... his candle shall be put out with him* (Job 18:5-6); *How oft is the candle of the wicked put out!* (Job 21:17); and Proverbs seals it, *the candle of the wicked shall be put out* (24:20). The righteous light, by contrast, is sown by Yahuah Himself — *Light is sown for the righteous, and gladness for the upright in heart* (Psalm 97:11) — and the NT sets that light on a stand: *Ye are the light of the world... let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* (Matthew 5:14-16).
--   ★ TRUE vs FALSE RICHES (THREAD 5): *There is that maketh himself rich, yet hath nothing: there is that maketh himself poor, yet hath great riches* (13:7), with *Wealth gotten by vanity shall be diminished: but he that gathereth by labour shall increase* (13:11) and *A good man leaveth an inheritance to his children's children: and the wealth of the sinner is laid up for the just* (13:22). Qoheleth groaned over the heaped wealth left to another (*I should leave it unto the man that shall be after me*, Ecclesiastes 2:18) and named the very transfer: *to the sinner he giveth travail, to gather and to heap up, that he may give to him that is good before Elohim (God)* (2:26). Job saw it too — *He may prepare it, but the just shall put it on, and the innocent shall divide the silver* (27:17). The restored witness draws the rich fool's portrait: *now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Sirach 11:19). And Yahusha (Jesus) tells the same parable plain — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21) — while the risen Master rebukes the self-made-rich church: *thou sayest, I am rich, and increased with goods, and have need of nothing; and knowest not that thou art wretched, and miserable, and poor* (Revelation 3:17). Paul holds the paradox whole: *as poor, yet making many rich; as having nothing, and yet possessing all things* (2 Corinthians 6:10).
--   ★ RECOMPENSE (THREAD 6): *Evil pursueth sinners: but to the righteous good shall be repayed* (13:21). The same book states the law of recompense twice over: *Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner* (11:31); *the wicked shall not be unpunished: but the seed of the righteous shall be delivered* (11:21). David sings it, *Many sorrows shall be to the wicked: but he that trusteth in Yahuah (LORD), mercy shall compass him about* (Psalm 32:10). The evil a man sows pursues him; the good repaid the righteous is no chance but Yahuah's settled order. [Cross-lateral to the ch11:31 recompense thread — noted, not duplicated.]
--   EXTRAS: Sirach (Ecclesiasticus) double-written edition 'apocrypha' + book 'ecclesiasticus'. Clean witnesses pulled: 30:1, 30:2 (the rod and the son's discipline) for THREAD 3; 11:18, 11:19 (waxeth rich and must leave it to others and die) for THREAD 5. Sirach 30:3-13 and 11:14-17 weighed; the chosen verses each carry the framework cleanest.

CREATE TEMP VIEW _s304_pr13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Whoso despiseth the word shall be destroyed (★★ the WORD/Torah affirmed)
    ('canon','proverbs',13,13,'canon','numbers',15,31,'free',
      E'*Because he hath despised the word of Yahuah (LORD), and hath broken his commandment, that soul shall utterly be cut off; his iniquity shall be upon him* (Numbers 15:31). The destruction of *Whoso despiseth the word shall be destroyed* (Proverbs 13:13) is the Torah''s own verdict spoken word-for-word: the soul that *hath despised the word of Yahuah (LORD), and hath broken his commandment... shall utterly be cut off*. The proverb is no new sentence but the law of Moses set as a couplet — to despise the word is to be cut off.'),
    ('canon','proverbs',13,13,'canon','2-chronicles',36,16,'free',
      E'*But they mocked the messengers of Elohim (God), and despised his words, and misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy* (2 Chronicles 36:16). Here the destruction of *Whoso despiseth the word shall be destroyed* (Proverbs 13:13) falls on a whole nation: they *despised his words... till there was no remedy*. The Chronicler shows the proverb worked out in history — the despised word brought the exile, the very *destroyed* the couplet names.'),
    ('canon','proverbs',13,13,'canon','proverbs',19,16,'free',
      E'*He that keepeth the commandment keepeth his own soul; but he that despiseth his ways shall die* (Proverbs 19:16). The reward half of *he that feareth the commandment shall be rewarded* (Proverbs 13:13) is stated plain by the same book: *He that keepeth the commandment keepeth his own soul*. The kept commandment is life to the keeper; the despised way is death — the commandment is never the curse but the guard of the soul.'),

    -- THREAD 2: Hope deferred — the tree of life
    ('canon','proverbs',13,12,'canon','genesis',2,9,'free',
      E'*And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil* (Genesis 2:9). The figure of *when the desire cometh, it is a tree of life* (Proverbs 13:12) reaches back to the garden, where *the tree of life* stood *in the midst of the garden*. Fulfilled hope is a foretaste of that very tree — the life Adam was barred from, tasted in the desire that comes.'),
    ('canon','proverbs',13,12,'canon','proverbs',3,18,'free',
      E'*She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). The same book makes wisdom herself *a tree of life to them that lay hold upon her* — and so the desire that comes in *it is a tree of life* (Proverbs 13:12) is wisdom''s own fruit. To grasp wisdom is to grasp the tree; the heart sick with deferred hope is healed when the desire, long laid hold of, at last arrives.'),
    ('canon','proverbs',13,12,'canon','proverbs',11,30,'free',
      E'*The fruit of the righteous is a tree of life; and he that winneth souls is wise* (Proverbs 11:30). The tree-of-life of *when the desire cometh, it is a tree of life* (Proverbs 13:12) is the very fruit the righteous bear: *The fruit of the righteous is a tree of life*. The figure runs all through Proverbs — wisdom, her fruit, the fulfilled desire all carry the same life of the garden tree.'),
    ('canon','proverbs',13,12,'canon','revelation',22,2,'free',
      E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The tree of *when the desire cometh, it is a tree of life* (Proverbs 13:12) is opened again at the end of the book — barred at Eden, it now stands *in the midst of the street* of the City, *the leaves of the tree... for the healing of the nations*. The deferred hope of the whole creation comes at last, and it is the tree of life restored.'),

    -- THREAD 3: He that spareth his rod hateth his son (the Father's chastening)
    ('canon','proverbs',13,24,'canon','proverbs',3,11,'free',
      E'*My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction: For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:11-12). The love behind the rod of *he that loveth him chasteneth him betimes* (Proverbs 13:24) is the Father''s own: *whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth*. Earthly discipline is the small picture of the great one — the Father chastens the son He delights in.'),
    ('canon','proverbs',13,24,'canon','proverbs',22,15,'free',
      E'*Foolishness is bound in the heart of a child; but the rod of correction shall drive it far from him* (Proverbs 22:15). The rod of *He that spareth his rod hateth his son* (Proverbs 13:24) has a purpose named here: *the rod of correction shall drive* the bound foolishness *far from him*. To spare the rod is to leave the folly bound; loving discipline drives it out.'),
    ('canon','proverbs',13,24,'canon','proverbs',23,14,'free',
      E'*Thou shalt beat him with the rod, and shalt deliver his soul from hell* (Proverbs 23:14). The seeming hardness of *He that spareth his rod hateth his son* (Proverbs 13:24) is mercy at its root: the rod is wielded to *deliver his soul from hell*. The father who withholds correction does not love but hates, for he abandons the son to a worse end.'),
    ('canon','proverbs',13,24,'canon','proverbs',29,15,'free',
      E'*The rod and reproof give wisdom: but a child left to himself bringeth his mother to shame* (Proverbs 29:15). The discipline of *he that loveth him chasteneth him betimes* (Proverbs 13:24) is the wisdom-giving rod: *The rod and reproof give wisdom*. The child left undisciplined — spared the rod — comes to shame; the loved child is corrected betimes.'),
    ('canon','proverbs',13,24,'canon','hebrews',12,6,'free',
      E'*For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6). The NT lifts *he that loveth him chasteneth him betimes* (Proverbs 13:24) straight up to the Father: *whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth*. The proverb''s pattern is the Father''s very dealing with His sons — chastening is the proof of sonship, not its denial.'),
    ('canon','proverbs',13,24,'canon','hebrews',12,7,'free',
      E'*If ye endure chastening, Elohim (God) dealeth with you as with sons; for what son is he whom the father chasteneth not?* (Hebrews 12:7). The logic of *He that spareth his rod hateth his son* (Proverbs 13:24) is stated as a question here: *what son is he whom the father chasteneth not?* The unchastened is no true son; the chastened is owned. To spare all discipline is not love but a failure of fatherhood.'),
    ('canon','proverbs',13,24,'canon','ephesians',6,4,'free',
      E'*And, ye fathers, provoke not your children to wrath: but bring them up in the nurture and admonition of Yahuah (Lord)* (Ephesians 6:4). The loving discipline of *he that loveth him chasteneth him betimes* (Proverbs 13:24) is set in its right measure here: fathers are to *bring them up in the nurture and admonition of Yahuah (Lord)* — neither sparing the rod (which is hate) nor provoking to wrath (which is cruelty), but raising the child in the Father''s own admonition.'),
    ('canon','proverbs',13,24,'apocrypha','ecclesiasticus',30,1,'extras',
      E'*He that loves his son causeth him oft to feel the rod, that he may have joy of him in the end* (Sirach 30:1). The restored witness states *He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes* (Proverbs 13:24) almost word for word: *He that loves his son causeth him oft to feel the rod*. Love and the rod are bound together — the end is joy in the son, not harm.'),
    ('canon','proverbs',13,24,'apocrypha','ecclesiasticus',30,2,'extras',
      E'*He that chastiseth his son shall have joy in him, and shall rejoice of him among his acquaintance* (Sirach 30:2). The fruit of the loved-and-chastened son of *he that loveth him chasteneth him betimes* (Proverbs 13:24) is here named: *He that chastiseth his son shall have joy in him*. The discipline aimed at the son''s good returns to the father as joy.'),

    -- THREAD 4: The light of the righteous rejoiceth (the lamp of the wicked put out)
    ('canon','proverbs',13,9,'canon','job',18,5,'free',
      E'*Yea, the light of the wicked shall be put out, and the spark of his fire shall not shine* (Job 18:5). The dark half of *the lamp of the wicked shall be put out* (Proverbs 13:9) is spoken by Bildad word-for-word: *the light of the wicked shall be put out, and the spark of his fire shall not shine*. The wicked man''s lamp has no oil of righteousness to feed it; it gutters and goes dark.'),
    ('canon','proverbs',13,9,'canon','job',21,17,'free',
      E'*How oft is the candle of the wicked put out! and how oft cometh their destruction upon them! Elohim (God) distributeth sorrows in his anger* (Job 21:17). Job himself takes up *the lamp of the wicked shall be put out* (Proverbs 13:9): *How oft is the candle of the wicked put out!* Though the wicked seem to flourish, their light is no abiding flame — it is snuffed, and destruction comes.'),
    ('canon','proverbs',13,9,'canon','proverbs',24,20,'free',
      E'*For there shall be no reward to the evil man; the candle of the wicked shall be put out* (Proverbs 24:20). The same book seals *the lamp of the wicked shall be put out* (Proverbs 13:9): *the candle of the wicked shall be put out*. No reward, no abiding light — the wicked man''s lamp is a borrowed flame with no future.'),
    ('canon','proverbs',13,9,'canon','psalms',97,11,'free',
      E'*Light is sown for the righteous, and gladness for the upright in heart* (Psalm 97:11). The rejoicing light of *The light of the righteous rejoiceth* (Proverbs 13:9) is Yahuah''s own sowing: *Light is sown for the righteous, and gladness for the upright in heart*. The righteous do not kindle their own flame; it is sown for them and springs up to gladness — a light that does not go out.'),
    ('canon','proverbs',13,9,'canon','matthew',5,14,'free',
      E'*Ye are the light of the world. A city that is set on an hill cannot be hid* (Matthew 5:14). The rejoicing light of *The light of the righteous rejoiceth* (Proverbs 13:9) is set on a stand in the NT: *Ye are the light of the world*. The light sown for the righteous is meant to shine — *let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* (5:16) — never hid, never put out like the wicked''s lamp.'),

    -- THREAD 5: Rich yet nothing, poor yet great riches (true vs false riches)
    ('canon','proverbs',13,7,'canon','ecclesiastes',2,18,'free',
      E'*Yea, I hated all my labour which I had taken under the sun: because I should leave it unto the man that shall be after me* (Ecclesiastes 2:18). The hollowness of *There is that maketh himself rich, yet hath nothing* (Proverbs 13:7) is Qoheleth''s grief: the heaped labour must be left *unto the man that shall be after me*. The man who makes himself rich grasps what he cannot keep — he has nothing he can carry through.'),
    ('canon','proverbs',13,22,'canon','ecclesiastes',2,26,'free',
      E'*For Elohim (God) giveth to a man that is good in his sight wisdom, and knowledge, and joy: but to the sinner he giveth travail, to gather and to heap up, that he may give to him that is good before Elohim (God)* (Ecclesiastes 2:26). The transfer of *the wealth of the sinner is laid up for the just* (Proverbs 13:22) is named here exactly: the sinner is given *travail, to gather and to heap up, that he may give to him that is good before Elohim (God)*. The sinner''s heaped wealth is not his own — it is laid up, by Yahuah''s order, for the just.'),
    ('canon','proverbs',13,22,'canon','job',27,17,'free',
      E'*He may prepare it, but the just shall put it on, and the innocent shall divide the silver* (Job 27:17). The clause *the wealth of the sinner is laid up for the just* (Proverbs 13:22) is Job''s very picture of the wicked''s heaped raiment and silver: *the just shall put it on, and the innocent shall divide the silver*. What the sinner prepares he does not keep — it passes to the just.'),
    ('canon','proverbs',13,7,'canon','proverbs',11,28,'free',
      E'*He that trusteth in his riches shall fall: but the righteous shall flourish as a branch* (Proverbs 11:28). The self-made rich man who *hath nothing* (Proverbs 13:7) is the one who trusts his riches: *He that trusteth in his riches shall fall*. The true riches belong to *the righteous* who *shall flourish as a branch* — the poor-yet-rich of the couplet.'),
    ('canon','proverbs',13,7,'canon','luke',12,21,'free',
      E'*So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21). Yahusha (Jesus) tells the parable of *There is that maketh himself rich, yet hath nothing* (Proverbs 13:7): the man who fills his barns *layeth up treasure for himself, and is not rich toward Elohim (God)*. To be rich before men and bare before Yahuah is to have nothing; the desire of the soul is not fed by full barns.'),
    ('canon','proverbs',13,7,'canon','revelation',3,17,'free',
      E'*Because thou sayest, I am rich, and increased with goods, and have need of nothing; and knowest not that thou art wretched, and miserable, and poor, and blind, and naked* (Revelation 3:17). The risen Master rebukes the self-made-rich of *There is that maketh himself rich, yet hath nothing* (Proverbs 13:7): the church that says *I am rich... and have need of nothing* is in truth *wretched, and miserable, and poor*. The boast of riches is the very poverty the proverb exposes.'),
    ('canon','proverbs',13,7,'canon','2-corinthians',6,10,'free',
      E'*As sorrowful, yet alway rejoicing; as poor, yet making many rich; as having nothing, and yet possessing all things* (2 Corinthians 6:10). Paul lives the other half of *there is that maketh himself poor, yet hath great riches* (Proverbs 13:7): *as poor, yet making many rich; as having nothing, and yet possessing all things*. The true wealth is hidden from the world''s eyes — outwardly nothing, inwardly possessing all.'),
    ('canon','proverbs',13,7,'apocrypha','ecclesiasticus',11,18,'extras',
      E'*There is that waxeth rich by his wariness and pinching, and this is the portion of his reward* (Sirach 11:18). The self-made rich of *There is that maketh himself rich, yet hath nothing* (Proverbs 13:7) is the man of Sirach who *waxeth rich by his wariness and pinching* — and the very next verse shows what his hoard comes to.'),
    ('canon','proverbs',13,7,'apocrypha','ecclesiasticus',11,19,'extras',
      E'*Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Sirach 11:19). This is *maketh himself rich, yet hath nothing* (Proverbs 13:7) drawn out to its end: the man boasts *I have found rest, and now will eat continually of my goods*, but *he must leave those things to others, and die*. The same picture Yahusha (Jesus) paints in the rich fool — full barns, an empty soul.')

    -- THREAD 6 below uses its own VALUES rows
    ,
    -- THREAD 6: Evil pursueth sinners (the recompense)
    ('canon','proverbs',13,21,'canon','proverbs',11,31,'free',
      E'*Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner* (Proverbs 11:31). The recompense of *Evil pursueth sinners: but to the righteous good shall be repayed* (Proverbs 13:21) is the same law stated in the prior chapter: *the righteous shall be recompensed in the earth: much more the wicked and the sinner*. The good repaid the righteous and the evil that pursues the sinner are two faces of Yahuah''s settled order.'),
    ('canon','proverbs',13,21,'canon','proverbs',11,21,'free',
      E'*Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered* (Proverbs 11:21). The evil that *pursueth sinners* (Proverbs 13:21) catches them however they league together: *Though hand join in hand, the wicked shall not be unpunished*. And the good repaid the righteous reaches even their line — *the seed of the righteous shall be delivered*.'),
    ('canon','proverbs',13,21,'canon','psalms',32,10,'free',
      E'*Many sorrows shall be to the wicked: but he that trusteth in Yahuah (LORD), mercy shall compass him about* (Psalm 32:10). David sings *Evil pursueth sinners: but to the righteous good shall be repayed* (Proverbs 13:21): *Many sorrows shall be to the wicked*, while the one who trusts Yahuah is compassed about with mercy. The pursuing evil and the repaid good are the two ways the psalm sets side by side.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-13-whoso-despiseth-the-word-shall-be-destroyed',
       E'Whoso despiseth the word shall be destroyed — but he that feareth the commandment shall be rewarded',
       E'The framework weight of the chapter sits on the word: *Whoso despiseth the word shall be destroyed: but he that feareth the commandment shall be rewarded* (Proverbs 13:13), sealed by *The law of the wise is a fountain of life, to depart from the snares of death* (13:14). To despise the word is no small matter — the Torah itself pronounces the verdict word for word: *Because he hath despised the word of Yahuah (LORD), and hath broken his commandment, that soul shall utterly be cut off; his iniquity shall be upon him* (Numbers 15:31). The proverb is not a new sentence but the law of Moses set as a couplet. The Chronicler shows the verdict carried out on a whole nation: *they mocked the messengers of Elohim (God), and despised his words, and misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy* (2 Chronicles 36:16) — the despised word brought the exile, the very *destroyed* the proverb names. And the reward half is stated plain by the same book: *He that keepeth the commandment keepeth his own soul* (19:16). The law is never the curse; it is a fountain of life, the guard of the soul. To despise the word is destruction; to fear the commandment is reward.',
       sv.verse_id, ev.verse_id, 'free', 28300
  FROM _s304_pr13_lookup sv, _s304_pr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-13-hope-deferred-and-the-tree-of-life',
       E'Hope deferred maketh the heart sick — but the desire come is a tree of life',
       E'The chapter turns fulfilled longing into a figure that runs the whole canon: *Hope deferred maketh the heart sick: but when the desire cometh, it is a tree of life* (Proverbs 13:12), echoed by *The desire accomplished is sweet to the soul* (13:19). The tree of life was planted in the garden — *the tree of life also in the midst of the garden* (Genesis 2:9) — and Adam was barred from it; the heart sick with deferred hope is the heart east of Eden, longing for the life it lost. Proverbs makes wisdom herself that tree: *She is a tree of life to them that lay hold upon her* (3:18); *The fruit of the righteous is a tree of life* (11:30); *A wholesome tongue is a tree of life* (15:4). To grasp wisdom is to grasp the tree, and the desire that at last comes is a foretaste of its fruit. And the book closes on the tree restored: *In the midst of the street of it... was there the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* (Revelation 22:2) — barred at Eden, opened again in the City, where *they that do his commandments... may have right to the tree of life* (22:14). The deferred hope of the whole creation comes at last, and it is the tree of life.',
       sv.verse_id, ev.verse_id, 'free', 28303
  FROM _s304_pr13_lookup sv, _s304_pr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=13 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-13-he-that-spareth-his-rod-hateth-his-son',
       E'He that spareth his rod hateth his son — the Father''s loving chastening',
       E'The chapter binds discipline to love: *He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes* (Proverbs 13:24). The rod is not cruelty but care — and the pattern is the Father''s own with His sons. Proverbs says it again and again: *despise not the chastening of Yahuah (LORD)... for whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (3:11-12); *the rod of correction shall drive it far from him* (22:15); *Thou shalt beat him with the rod, and shalt deliver his soul from hell* (23:14); *The rod and reproof give wisdom: but a child left to himself bringeth his mother to shame* (29:15). The seeming hardness is mercy at its root — the rod is wielded to deliver the soul, and the father who withholds it does not love but hates, abandoning the son to a worse end. The restored witness keeps the same word: *He that loves his son causeth him oft to feel the rod, that he may have joy of him in the end* (Sirach 30:1); *He that chastiseth his son shall have joy in him* (30:2). And the NT lifts the proverb straight up to the Father: *whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6); *what son is he whom the father chasteneth not?* (12:7) — the unchastened is no true son. The counter-charge guards the measure: *ye fathers, provoke not your children to wrath: but bring them up in the nurture and admonition of Yahuah (Lord)* (Ephesians 6:4) — neither sparing the rod (which is hate) nor provoking to wrath (which is cruelty), but raising the child in the Father''s own admonition.',
       sv.verse_id, ev.verse_id, 'extras', 28306
  FROM _s304_pr13_lookup sv, _s304_pr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=13 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-13-the-light-of-the-righteous-rejoiceth',
       E'The light of the righteous rejoiceth — but the lamp of the wicked shall be put out',
       E'The chapter sets two lights side by side: *The light of the righteous rejoiceth: but the lamp of the wicked shall be put out* (Proverbs 13:9). Job''s friends and Job alike know the put-out lamp — Bildad: *the light of the wicked shall be put out, and the spark of his fire shall not shine* (Job 18:5); Job: *How oft is the candle of the wicked put out!* (21:17) — and Proverbs seals it: *the candle of the wicked shall be put out* (24:20). The wicked man''s lamp is a borrowed flame with no oil of righteousness to feed it; it gutters and goes dark. The righteous light, by contrast, is Yahuah''s own sowing: *Light is sown for the righteous, and gladness for the upright in heart* (Psalm 97:11) — not a flame they kindle but one sown for them, springing up to gladness, a light that does not go out. And the NT sets that light on a stand: *Ye are the light of the world. A city that is set on an hill cannot be hid* (Matthew 5:14); *let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* (5:16). The righteous light is meant to shine and be seen — never hid, never snuffed like the lamp of the wicked.',
       sv.verse_id, ev.verse_id, 'free', 28309
  FROM _s304_pr13_lookup sv, _s304_pr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-13-rich-yet-nothing-poor-yet-great-riches',
       E'Rich yet nothing, poor yet great riches — and the wealth of the sinner laid up for the just',
       E'The chapter weighs true riches against false: *There is that maketh himself rich, yet hath nothing: there is that maketh himself poor, yet hath great riches* (Proverbs 13:7), with *Wealth gotten by vanity shall be diminished: but he that gathereth by labour shall increase* (13:11) and *A good man leaveth an inheritance to his children''s children: and the wealth of the sinner is laid up for the just* (13:22). Qoheleth groaned over the heaped wealth he must surrender: *I hated all my labour... because I should leave it unto the man that shall be after me* (Ecclesiastes 2:18) — and he named the very transfer the proverb foretells: *to the sinner he giveth travail, to gather and to heap up, that he may give to him that is good before Elohim (God)* (2:26). Job saw the same: *He may prepare it, but the just shall put it on, and the innocent shall divide the silver* (27:17). The self-made rich man trusts what he cannot keep — *He that trusteth in his riches shall fall: but the righteous shall flourish as a branch* (Proverbs 11:28). The restored witness draws the hoarder''s portrait: *now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Sirach 11:19). And Yahusha (Jesus) tells the parable plain — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21) — while the risen Master rebukes the church that boasts its goods: *thou sayest, I am rich, and increased with goods, and have need of nothing; and knowest not that thou art wretched, and miserable, and poor* (Revelation 3:17). Paul holds the whole paradox: *as poor, yet making many rich; as having nothing, and yet possessing all things* (2 Corinthians 6:10). To be rich before men and bare before Yahuah is to have nothing; to be poor before men and rich toward Elohim is to possess all.',
       sv.verse_id, ev.verse_id, 'extras', 28312
  FROM _s304_pr13_lookup sv, _s304_pr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=13 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-13-evil-pursueth-sinners-the-righteous-good-repaid',
       E'Evil pursueth sinners — but to the righteous good shall be repaid',
       E'The chapter states the law of recompense: *Evil pursueth sinners: but to the righteous good shall be repayed* (Proverbs 13:21). This is no random outcome but Yahuah''s settled order, stated by the same book in the prior chapter: *Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner* (11:31); and the evil catches the wicked however they league together — *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered* (11:21) — the good repaid reaching even to the line of the righteous. David sings the two ways side by side: *Many sorrows shall be to the wicked: but he that trusteth in Yahuah (LORD), mercy shall compass him about* (Psalm 32:10). The evil a man sows turns and pursues him; the good repaid the righteous is the mercy that compasses the one who trusts.',
       sv.verse_id, ev.verse_id, 'free', 28315
  FROM _s304_pr13_lookup sv, _s304_pr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=13 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*that soul shall utterly be cut off* (Numbers 15:31) — the destruction of 13:13 is the Torah''s own verdict on him that hath despised the word and broken the commandment.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-whoso-despiseth-the-word-shall-be-destroyed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*despised his words... till there was no remedy* (2 Chronicles 36:16) — the destruction of 13:13 worked out on a whole nation; the despised word brought the exile.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-whoso-despiseth-the-word-shall-be-destroyed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He that keepeth the commandment keepeth his own soul* (Proverbs 19:16) — the reward half of 13:13; the commandment is the guard of the soul, never the curse.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-whoso-despiseth-the-word-shall-be-destroyed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the tree of life also in the midst of the garden* (Genesis 2:9) — the figure of 13:12 reaches back to Eden; fulfilled hope is a foretaste of the tree Adam was barred from.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-hope-deferred-and-the-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*She is a tree of life to them that lay hold upon her* (Proverbs 3:18) — wisdom herself the tree; the desire come in 13:12 is wisdom''s own fruit.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-hope-deferred-and-the-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The fruit of the righteous is a tree of life* (Proverbs 11:30) — the tree-of-life of 13:12 is the very fruit the righteous bear.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-hope-deferred-and-the-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*there the tree of life... the leaves of the tree were for the healing of the nations* (Revelation 22:2) — the tree barred at Eden opened again in the City; the deferred hope of all creation come at last.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-hope-deferred-and-the-tree-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:11-12) — the love behind the rod of 13:24 is the Father''s own.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-he-that-spareth-his-rod-hateth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the rod of correction shall drive it far from him* (Proverbs 22:15) — the rod of 13:24 drives out the foolishness bound in the child''s heart.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-he-that-spareth-his-rod-hateth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*beat him with the rod, and shalt deliver his soul from hell* (Proverbs 23:14) — the seeming hardness of 13:24 is mercy at its root: the rod delivers the soul.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-he-that-spareth-his-rod-hateth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The rod and reproof give wisdom: but a child left to himself bringeth his mother to shame* (Proverbs 29:15) — the loving discipline of 13:24 gives wisdom; the spared child comes to shame.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-he-that-spareth-his-rod-hateth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6) — the NT lifts 13:24 straight up to the Father; chastening is the proof of sonship.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-he-that-spareth-his-rod-hateth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*what son is he whom the father chasteneth not?* (Hebrews 12:7) — the logic of 13:24 as a question; the unchastened is no true son.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-he-that-spareth-his-rod-hateth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*bring them up in the nurture and admonition of Yahuah (Lord)* (Ephesians 6:4) — the right measure of 13:24: neither sparing the rod nor provoking to wrath.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-he-that-spareth-his-rod-hateth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*He that loves his son causeth him oft to feel the rod* (Sirach 30:1) — the restored witness states 13:24 almost word for word; love and the rod bound together.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=30 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-he-that-spareth-his-rod-hateth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*He that chastiseth his son shall have joy in him* (Sirach 30:2) — the fruit of the chastened son of 13:24 is the father''s joy.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=24
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-he-that-spareth-his-rod-hateth-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the light of the wicked shall be put out, and the spark of his fire shall not shine* (Job 18:5) — the dark half of 13:9 spoken word for word by Bildad.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=18 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-the-light-of-the-righteous-rejoiceth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*How oft is the candle of the wicked put out!* (Job 21:17) — Job takes up the lamp-of-the-wicked of 13:9; their light is no abiding flame.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=21 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-the-light-of-the-righteous-rejoiceth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the candle of the wicked shall be put out* (Proverbs 24:20) — the same book seals 13:9; no reward, no abiding light for the wicked.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-the-light-of-the-righteous-rejoiceth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Light is sown for the righteous, and gladness for the upright in heart* (Psalm 97:11) — the rejoicing light of 13:9 is Yahuah''s own sowing, springing up to gladness.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=97 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-the-light-of-the-righteous-rejoiceth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Ye are the light of the world. A city that is set on an hill cannot be hid* (Matthew 5:14) — the rejoicing light of 13:9 set on a stand; meant to shine, never put out.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-the-light-of-the-righteous-rejoiceth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I should leave it unto the man that shall be after me* (Ecclesiastes 2:18) — the hollowness of 13:7; the self-made rich grasps what he cannot keep.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-rich-yet-nothing-poor-yet-great-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*to the sinner he giveth travail, to gather and to heap up, that he may give to him that is good* (Ecclesiastes 2:26) — the transfer of 13:22 named exactly; the sinner''s hoard laid up for the just.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=2 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-rich-yet-nothing-poor-yet-great-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the just shall put it on, and the innocent shall divide the silver* (Job 27:17) — Job''s picture of 13:22; what the sinner prepares passes to the just.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=27 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-rich-yet-nothing-poor-yet-great-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He that trusteth in his riches shall fall: but the righteous shall flourish as a branch* (Proverbs 11:28) — the self-made rich of 13:7 trusts what fails; the true riches belong to the righteous.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-rich-yet-nothing-poor-yet-great-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21) — Yahusha''s parable of 13:7; rich before men, bare before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-rich-yet-nothing-poor-yet-great-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*thou sayest, I am rich... and knowest not that thou art... poor* (Revelation 3:17) — the risen Master rebukes the self-made-rich of 13:7; the boast of riches is the very poverty.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-rich-yet-nothing-poor-yet-great-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*as poor, yet making many rich; as having nothing, and yet possessing all things* (2 Corinthians 6:10) — Paul lives the poor-yet-rich of 13:7; the true wealth hidden from the world''s eyes.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-rich-yet-nothing-poor-yet-great-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*There is that waxeth rich by his wariness and pinching* (Sirach 11:18) — the self-made rich of 13:7 in the restored witness; his hoard''s end follows.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-rich-yet-nothing-poor-yet-great-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*he must leave those things to others, and die* (Sirach 11:19) — 13:7 drawn to its end; the hoarder boasts of rest but leaves it all and dies, as in Yahusha''s rich fool.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-rich-yet-nothing-poor-yet-great-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the righteous shall be recompensed in the earth: much more the wicked and the sinner* (Proverbs 11:31) — the recompense of 13:21 stated in the prior chapter; Yahuah''s settled order.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-evil-pursueth-sinners-the-righteous-good-repaid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the wicked shall not be unpunished: but the seed of the righteous shall be delivered* (Proverbs 11:21) — the evil that pursues sinners in 13:21 catches them however they league; the good reaches even the righteous line.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-evil-pursueth-sinners-the-righteous-good-repaid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Many sorrows shall be to the wicked: but he that trusteth in Yahuah (LORD), mercy shall compass him about* (Psalm 32:10) — David sings the two ways of 13:21 side by side.'
  FROM cross_reference_threads t
  JOIN _s304_pr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s304_pr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-13-evil-pursueth-sinners-the-righteous-good-repaid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
