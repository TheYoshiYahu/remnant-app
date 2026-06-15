-- ----- fragment: minion_proverbs_2.sql (Proverbs 2) -----
-- Chapter: Proverbs 2 — THE SEEKING-AND-FINDING OF WISDOM AND THE TWO HOUSES OF DEATH AND LIFE:
--   *My son, if thou wilt receive my words, and hide my commandments with thee... If thou seekest her
--   as silver, and searchest for her as for hid treasures; Then shalt thou understand the fear of Yahuah
--   (LORD), and find the knowledge of Elohim (God). For Yahuah (LORD) giveth wisdom: out of his mouth
--   cometh knowledge and understanding* (2:1-6). Wisdom is sought as treasure and GIVEN out of Yahuah's
--   mouth; she guards the covenant-path, delivers from the way of evil men and from the strange woman who
--   *forsaketh the guide of her youth, and forgetteth the covenant of her Elohim (God)* (2:17); and ends in
--   the land-inheritance promise: *the upright shall dwell in the land... But the wicked shall be cut off
--   from the earth* (2:21-22). The strange woman = covenant-abandonment (NOT misogyny); the two paths are
--   read by conduct; the land-promise is restored covenant inheritance, two-house, never replacement.
-- Tag: pr02   Temp view: _s304_pr02_lookup   Session prefix: s304
-- Sort band: base 28025, step 3 -> threads at 28025, 28028, 28031, 28034, 28037, 28040 (6 threads)
-- Source of EVERY row: 'canon','proverbs',2,v
--
-- Proverbs 2 coverage:
--   ★★ v.1-5 (if thou seekest her as silver, and searchest for her as for hid treasures; Then shalt thou
--        understand the fear of Yahuah, and find the knowledge of Elohim)
--        NT:     ★ Matthew 7:7 (seek, and ye shall find) — THREAD 1 (the seek-and-find promise)
--        Extras: Sirach 6:27 (Search, and seek, and she shall be made known to you); WisSol 7:7-8 (I prayed,
--                and understanding was given me... esteemed riches nothing in comparison of her) — THREAD 1
--        Tanakh: ★ Jeremiah 29:13 (ye shall seek me, and find me, when ye shall search for me with all your
--                heart); Deuteronomy 4:29 (if thou seek him with all thy heart and with all thy soul) — THREAD 1
--   ★★ v.5b + v.1 (the fear of Yahuah; receive my words, hide my commandments)
--        NT:     none warranted distinct (the fear-motif is carried laterally by 1:7/9:10 and by Sirach;
--                no closer NT witness than the wisdom-gift forward-weave at THREAD 3)
--        Extras: ★ Sirach 1:14 (To fear Yahuah is the beginning of wisdom); Sirach 1:26 (If you desire wisdom,
--                keep the commandments) — THREAD 2
--        Tanakh: ★★ Proverbs 1:7 (The fear of Yahuah is the beginning of knowledge); Proverbs 9:10 (The fear
--                of Yahuah is the beginning of wisdom) — THREAD 2 (the book's own twin refrain)
--   ★★ v.6 (For Yahuah giveth wisdom: out of his mouth cometh knowledge and understanding)
--        NT:     ★ James 1:5 (If any of you lack wisdom, let him ask of Elohim, that giveth to all men
--                liberally); 1 Corinthians 1:30 (Messiah, who of Elohim is made unto us wisdom) — THREAD 3
--        Extras: ★ Sirach 1:1 (All wisdom comes from Yahuah, and is with him for ever) — THREAD 3
--        Tanakh: ★ Deuteronomy 8:3 (by every word that proceedeth out of the mouth of Yahuah doth man live);
--                Isaiah 55:11 (So shall my word be that goeth forth out of my mouth) — THREAD 3
--   ★ v.7-9 (He layeth up sound wisdom for the righteous... he keepeth the paths of judgment, and preserveth
--        the way of his saints; Then shalt thou understand righteousness, and judgment, and equity)
--        NT:     none warranted distinct (the guardian-of-the-path motif is carried by the Psalm laterals;
--                forced NT weave would dilute)
--        Extras: Sirach 2:15-16 weighed (they that fear Yahuah will keep his ways / be filled with the law) —
--                folded into THREAD 4 prose-witness via member, but kept as Tanakh-led thread
--        Tanakh: ★ Psalm 37:28 (Yahuah loveth judgment, and forsaketh not his saints; they are preserved for
--                ever); Psalm 84:11 weighed — THREAD 4 (the guardian of the covenant-path)
--   ★★ v.10-19 (deliverance from the evil man and from the strange woman, which forsaketh the guide of her
--        youth, and forgetteth the covenant of her Elohim; her house inclineth unto death)
--        NT:     none warranted distinct (the strange-woman/covenant figure is carried by Hosea/Jeremiah
--                laterally and Proverbs' own 5/7; no clean NT witness closer)
--        Extras: none warranted distinct (no clean extras witness on the covenant-marriage figure;
--                Sirach material on the harlot is not as load-bearing as the Hosea covenant weave)
--        Tanakh: ★★ Hosea 2:19-20 (I will betroth thee unto me for ever... in faithfulness); Jeremiah 2:2
--                (the kindness of thy youth, the love of thine espousals); Proverbs 5:5 / 7:27 (her house the
--                way to hell) — THREAD 5 (covenant-faithfulness vs the forsaken covenant; the two-house bride)
--   ★★ v.20-22 (That thou mayest walk in the way of good men... For the upright shall dwell in the land, and
--        the perfect shall remain in it. But the wicked shall be cut off from the earth)
--        NT:     ★★ Matthew 5:5 (Blessed are the meek: for they shall inherit the earth) — THREAD 6
--        Extras: none warranted distinct (the land-inheritance is carried by Psalm 37 + Deut 30 + Matt 5;
--                no extras witness warranted)
--        Tanakh: ★★ Psalm 37:9,11,29 (the meek shall inherit the earth... the righteous shall inherit the
--                land); Deuteronomy 30:19-20 (choose life... that thou mayest dwell in the land) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. proverbs-2-seek-her-as-silver-then-shalt-thou-find-the-knowledge-of-elohim — Tanakh (Jeremiah, Deuteronomy) + NT (Matthew) + Extras (Sirach, WisSol) [extras] (★★ wisdom sought as treasure; seek-and-find)
--   2. proverbs-2-the-fear-of-yahuah-the-beginning-of-knowledge — Tanakh (Proverbs 1, 9) + Extras (Sirach) [extras] (★★ the fear-of-Yahuah twin refrain)
--   3. proverbs-2-yahuah-giveth-wisdom-out-of-his-mouth — Tanakh (Deuteronomy, Isaiah) + NT (James, 1 Corinthians) + Extras (Sirach) [extras] (★★ wisdom the GIFT proceeding from Yahuah's mouth)
--   4. proverbs-2-he-keepeth-the-paths-of-judgment-and-preserveth-his-saints — Tanakh (Psalm 37) [free] (★ the guardian of the covenant-path)
--   5. proverbs-2-the-strange-woman-which-forgetteth-the-covenant-of-her-elohim — Tanakh (Hosea, Jeremiah, Proverbs 5/7) [free] (★★ covenant-faithfulness vs the forsaken covenant; the two-house bride)
--   6. proverbs-2-the-upright-shall-dwell-in-the-land — Tanakh (Psalm 37, Deuteronomy) + NT (Matthew) [free] (★★ inherit-the-land covenant promise; restored, two-house)
--
-- Framing notes:
--   ★★ SEEK-AND-FIND (THREAD 1): *If thou seekest her as silver, and searchest for her as for hid treasures;
--      Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* (2:4-5).
--      The seek-and-find promise runs forward to *seek, and ye shall find* (Matthew 7:7) and back to *ye shall
--      seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13) and Deut 4:29.
--      The restored witnesses keep it: *Search, and seek, and she shall be made known to you* (Sirach 6:27),
--      *I prayed, and understanding was given me* (WisSol 7:7). Wisdom is treasure sought with the whole heart.
--   ★★ FEAR OF YAHUAH (THREAD 2): the book's own twin refrain — *The fear of Yahuah (LORD) is the beginning
--      of knowledge* (1:7), *the beginning of wisdom* (9:10) — and Sirach keeps the SAME root while binding it
--      to commandment-keeping: *If you desire wisdom, keep the commandments* (Sirach 1:26). Torah-affirming,
--      never antinomian.
--   ★★ WISDOM THE GIFT (THREAD 3): *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and
--      understanding* (2:6). Wisdom PROCEEDS from Yahuah's mouth — the same mouth-of-Yahuah word that man
--      lives by (Deut 8:3) and that does not return void (Isa 55:11). James 1:5 keeps the gift (*ask of
--      Elohim, that giveth to all men liberally*); 1 Cor 1:30 names the Formed Son *made unto us wisdom* — the
--      Word drawn from the Formless, never a co-equal second person. Sirach 1:1: *All wisdom comes from Yahuah*.
--   ★ THE GUARDIAN OF THE PATH (THREAD 4): *He keepeth the paths of judgment, and preserveth the way of his
--      saints* (2:8). Psalm 37:28 sings the same keeping — *Yahuah (LORD) loveth judgment, and forsaketh not
--      his saints; they are preserved for ever*. The covenant-path is guarded by Yahuah Himself.
--   ★★ THE STRANGE WOMAN (THREAD 5): *the strange woman... Which forsaketh the guide of her youth, and
--      forgetteth the covenant of her Elohim (God). For her house inclineth unto death* (2:16-18). This is NOT
--      misogyny — the figure is COVENANT-ABANDONMENT, the forsaking of the covenant of one's youth. Hosea
--      reads the covenant as marriage — *I will betroth thee unto me for ever* (Hosea 2:19) — and Jeremiah
--      names *the kindness of thy youth, the love of thine espousals* (Jer 2:2): the very "guide of her youth"
--      and "covenant of her Elohim" the strange woman forsakes. Proverbs' own 5:5 and 7:27 trace her house to
--      death. The contrast is the faithful covenant-bride (the two-house people restored) vs. the forsaken
--      covenant; victims/systems framing, never a slur on women.
--   ★★ INHERIT THE LAND (THREAD 6): *For the upright shall dwell in the land, and the perfect shall remain in
--      it. But the wicked shall be cut off from the earth* (2:21-22). The land-inheritance covenant promise —
--      Psalm 37:11 *the meek shall inherit the earth*, 37:29 *the righteous shall inherit the land, and dwell
--      therein for ever*; Deut 30:19-20 *choose life... that thou mayest dwell in the land*. Yahusha (Jesus)
--      keeps it word-for-word: *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5). Restored
--      covenant inheritance, two-house — never replacement.
--   VERSES WITH NO STANDALONE THREAD: v.9 (understand righteousness, judgment, equity) folded into THREAD 4;
--      v.10-15 (discretion preserve thee / the way of the evil man) folded into THREAD 5 (the two paths the
--      strange-woman thread frames); these are carried within their bounding threads, not given their own.

CREATE TEMP VIEW _s304_pr02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Seek her as silver — then shalt thou find the knowledge of Elohim
    ('canon','proverbs',2,4,'canon','matthew',7,7,'free',
      E'*Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you* (Matthew 7:7). The treasure-seeking of *If thou seekest her as silver, and searchest for her as for hid treasures* (Proverbs 2:4) is the very promise Yahusha (Jesus) gives: *seek, and ye shall find*. Wisdom does not hide from the one who searches her out — the seeking is met by the finding.'),
    ('canon','proverbs',2,4,'canon','jeremiah',29,13,'free',
      E'*And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). The searching *as for hid treasures* of Proverbs 2:4 is the searching with the whole heart Yahuah promises to meet: *ye shall seek me, and find me, when ye shall search for me with all your heart*. To search out wisdom is to search out Yahuah Himself, and He is found of those who seek with all the heart.'),
    ('canon','proverbs',2,5,'canon','deuteronomy',4,29,'free',
      E'*But if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29). The promise *Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* (Proverbs 2:5) is the Torah''s own seek-and-find pledge, given to the covenant people in exile: *thou shalt find him, if thou seek him with all thy heart and with all thy soul*. The knowledge of Elohim is found by the whole-hearted seeker.'),
    ('canon','proverbs',2,4,'apocrypha','ecclesiasticus',6,27,'extras',
      E'*Search, and seek, and she shall be made known to you: and when you have got hold of her, let her not go* (Sirach 6:27). The restored witness keeps the same charge as *If thou seekest her as silver, and searchest for her as for hid treasures* (Proverbs 2:4): *Search, and seek, and she shall be made known to you*. Wisdom is found by the diligent searcher, and once found she is to be held fast.'),
    ('canon','proverbs',2,4,'apocrypha','the-wisdom-of-solomon',7,8,'extras',
      E'*I preferred her before sceptres and thrones, and esteemed riches nothing in comparison of her* (Wisdom of Solomon 7:8). To seek wisdom *as silver* and *as for hid treasures* (Proverbs 2:4) is to esteem her above all treasure, as the restored witness does: *esteemed riches nothing in comparison of her*. The one who counts wisdom the true treasure has already begun to find her.'),

    -- THREAD 2: The fear of Yahuah the beginning of knowledge (the book's twin refrain)
    ('canon','proverbs',2,5,'canon','proverbs',1,7,'free',
      E'*The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7). The end of the seeking — *Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* (Proverbs 2:5) — is the book''s own opening refrain: *The fear of Yahuah (LORD) is the beginning of knowledge*. The fear of Yahuah is both the door and the goal; what wisdom seeks, it finds in the reverence of Yahuah.'),
    ('canon','proverbs',2,5,'canon','proverbs',9,10,'free',
      E'*The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). The twin of 1:7 seals the same truth that *Then shalt thou understand the fear of Yahuah (LORD)* (Proverbs 2:5) points to: *The fear of Yahuah (LORD) is the beginning of wisdom*. Knowledge, understanding, and wisdom all begin and end in the fear of Yahuah.'),
    ('canon','proverbs',2,5,'apocrypha','ecclesiasticus',1,14,'extras',
      E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Sirach 1:14). The restored witness keeps the very refrain Proverbs 2:5 reaches for — *Then shalt thou understand the fear of Yahuah (LORD)* — naming it *the beginning of wisdom*. The fear of Yahuah is the root the faithful are born to.'),
    ('canon','proverbs',2,1,'apocrypha','ecclesiasticus',1,26,'extras',
      E'*If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26). The opening charge to *receive my words, and hide my commandments with thee* (Proverbs 2:1) is kept whole by the restored witness: *If you desire wisdom, keep the commandments*. Wisdom is not loosed from the commandments but given through their keeping — the Torah is the path to her, never the burden laid aside.'),

    -- THREAD 3: Yahuah giveth wisdom — out of his mouth cometh knowledge (the gift)
    ('canon','proverbs',2,6,'canon','james',1,5,'free',
      E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). The promise *For Yahuah (LORD) giveth wisdom* (Proverbs 2:6) is the very ground of the apostolic charge: wisdom is the GIFT, asked and freely given — *let him ask of Elohim (God), that giveth to all men liberally*. The giver of wisdom in Proverbs is the giver of wisdom in James.'),
    ('canon','proverbs',2,6,'canon','1-corinthians',1,30,'free',
      E'*But of him are ye in HaMashiach Yahusha (Christ Jesus), who of Elohim (God) is made unto us wisdom, and righteousness, and sanctification, and redemption* (1 Corinthians 1:30). The wisdom that comes *out of his mouth* (Proverbs 2:6) is at last named in the Formed Son, *who of Elohim (God) is made unto us wisdom* — the Word drawn from the Formless, the expressed wisdom of the Father given to His people.'),
    ('canon','proverbs',2,6,'canon','deuteronomy',8,3,'free',
      E'*...that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). That *out of his mouth cometh knowledge and understanding* (Proverbs 2:6) is the same mouth-of-Yahuah word that is the life of man: *by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live*. Wisdom and life alike proceed from the mouth of Yahuah.'),
    ('canon','proverbs',2,6,'canon','isaiah',55,11,'free',
      E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). The knowledge that comes *out of his mouth* (Proverbs 2:6) is the word that *goeth forth out of my mouth* and does not return void — the wisdom Yahuah speaks accomplishes what He pleases. The mouth of Yahuah pours out both wisdom and the word that does His will.'),
    ('canon','proverbs',2,6,'apocrypha','ecclesiasticus',1,1,'extras',
      E'*All wisdom comes from Yahuah (God), and is with him for ever* (Sirach 1:1). The restored witness opens on the very truth of *For Yahuah (LORD) giveth wisdom* (Proverbs 2:6): *All wisdom comes from Yahuah (God), and is with him for ever*. There is no wisdom apart from its Source; she is His to give.'),

    -- THREAD 4: He keepeth the paths of judgment and preserveth his saints
    ('canon','proverbs',2,8,'canon','psalms',37,28,'free',
      E'*For Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever: but the seed of the wicked shall be cut off* (Psalm 37:28). That *He keepeth the paths of judgment, and preserveth the way of his saints* (Proverbs 2:8) is sung whole in the psalm: *Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever*. Yahuah Himself is the keeper of the covenant-path, and His saints are never forsaken.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 5: The strange woman — which forgetteth the covenant of her Elohim
    ('canon','proverbs',2,17,'canon','hosea',2,19,'free',
      E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). The strange woman *forsaketh the guide of her youth, and forgetteth the covenant of her Elohim (God)* (Proverbs 2:17) — and the covenant she forsakes is read by Hosea as a marriage: *I will betroth thee unto me for ever... in righteousness, and in judgment*. The figure is covenant-faithfulness against covenant-abandonment; the faithful bride is the two-house people Yahuah betroths to Himself for ever.'),
    ('canon','proverbs',2,17,'canon','hosea',2,20,'free',
      E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20). Against the woman who *forgetteth the covenant of her Elohim (God)* (Proverbs 2:17) stands Yahuah''s own betrothal *in faithfulness* — the covenant kept where hers is broken. To know Yahuah is to keep the covenant of one''s youth, not to forget it.'),
    ('canon','proverbs',2,17,'canon','jeremiah',2,2,'free',
      E'*...Thus saith Yahuah (LORD); I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest after me in the wilderness, in a land that was not sown* (Jeremiah 2:2). The *guide of her youth* the strange woman forsakes (Proverbs 2:17) answers to *the kindness of thy youth, the love of thine espousals* — the covenant-marriage of the wilderness. The forsaking of the guide of youth is the very faithlessness Jeremiah laments; the covenant of Elohim is the espousal remembered.'),
    ('canon','proverbs',2,18,'canon','proverbs',7,27,'free',
      E'*Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27). That *her house inclineth unto death, and her paths unto the dead* (Proverbs 2:18) is the same warning the book sounds again of the strange woman: *Her house is the way to hell, going down to the chambers of death*. The path of covenant-abandonment runs only one way — down to death.'),
    ('canon','proverbs',2,18,'canon','proverbs',5,5,'free',
      E'*Her feet go down to death; her steps take hold on hell* (Proverbs 5:5). The strange woman whose *house inclineth unto death* (Proverbs 2:18) is traced again in *Her feet go down to death; her steps take hold on hell*. The end of the forsaken covenant is the chambers of death — not a slur on women, but the wage of forsaking the covenant of one''s Elohim.'),

    -- THREAD 6: The upright shall dwell in the land (inherit-the-land covenant promise)
    ('canon','proverbs',2,21,'canon','psalms',37,11,'free',
      E'*But the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11). *For the upright shall dwell in the land, and the perfect shall remain in it* (Proverbs 2:21) is the land-inheritance promise the psalm sings: *the meek shall inherit the earth*. The covenant inheritance is for the upright and the meek — to dwell and remain in the land.'),
    ('canon','proverbs',2,21,'canon','psalms',37,29,'free',
      E'*The righteous shall inherit the land, and dwell therein for ever* (Psalm 37:29). The dwelling and remaining of *the upright shall dwell in the land, and the perfect shall remain in it* (Proverbs 2:21) is the everlasting inheritance: *The righteous shall inherit the land, and dwell therein for ever*. The land-promise is no temporary lease but the everlasting portion of the covenant-keeper.'),
    ('canon','proverbs',2,22,'canon','psalms',37,9,'free',
      E'*For evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth* (Psalm 37:9). That *the wicked shall be cut off from the earth, and the transgressors shall be rooted out of it* (Proverbs 2:22) is the psalm''s own sentence: *evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth*. The two ends of the land — inheritance and cutting-off — are read by conduct, not by lineage alone.'),
    ('canon','proverbs',2,21,'canon','deuteronomy',30,19,'free',
      E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The dwelling in the land of Proverbs 2:21 is the Torah''s own land-covenant — *choose life, that both thou and thy seed may live* — set before the people in the plains of Moab. To dwell in the land is to choose the way of life and walk it.'),
    ('canon','proverbs',2,21,'canon','matthew',5,5,'free',
      E'*Blessed are the meek: for they shall inherit the earth* (Matthew 5:5). Yahusha (Jesus) keeps the land-promise word-for-word: the *upright* who *shall dwell in the land* (Proverbs 2:21) are the meek who *shall inherit the earth*. The Beatitude is not a new promise but the covenant inheritance renewed — restored, two-house, never replaced.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-2-seek-her-as-silver-then-shalt-thou-find-the-knowledge-of-elohim',
       E'Seek her as silver — then shalt thou find the knowledge of Elohim',
       E'Wisdom is laid up as treasure, and she is found only by the one who searches her out: *My son, if thou wilt receive my words, and hide my commandments with thee... If thou seekest her as silver, and searchest for her as for hid treasures; Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* (Proverbs 2:1-5). The seeking is met by the finding — and that promise runs the whole canon. Yahusha (Jesus) gives it plain: *Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you* (Matthew 7:7). The prophet pledges it to the covenant people in exile: *And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). And the Torah set it first: *if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29). The restored witnesses keep the same charge: *Search, and seek, and she shall be made known to you: and when you have got hold of her, let her not go* (Sirach 6:27); *I preferred her before sceptres and thrones, and esteemed riches nothing in comparison of her* (Wisdom of Solomon 7:8). To search for wisdom as for hid treasure is to search for Yahuah Himself — and He is found of those who seek with the whole heart.',
       sv.verse_id, ev.verse_id, 'extras', 28025
  FROM _s304_pr02_lookup sv, _s304_pr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-2-the-fear-of-yahuah-the-beginning-of-knowledge',
       E'The fear of Yahuah — the beginning of knowledge',
       E'The whole search of Proverbs 2 ends where the book began: in the fear of Yahuah. *Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* (Proverbs 2:5) — and that is the book''s own twin refrain, set at its head and its centre: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7); *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). The fear of Yahuah is both the door wisdom is sought through and the treasure found at the end. The restored witness keeps the same root and binds it where it belongs — to the commandments: *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Sirach 1:14); *If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26). This is the answer to the opening charge *receive my words, and hide my commandments with thee* (Proverbs 2:1): wisdom is not loosed from the commandments but given through their keeping. The Torah is the path to her, never the burden laid aside.',
       sv.verse_id, ev.verse_id, 'extras', 28028
  FROM _s304_pr02_lookup sv, _s304_pr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-2-yahuah-giveth-wisdom-out-of-his-mouth',
       E'Yahuah giveth wisdom — out of his mouth cometh knowledge',
       E'Wisdom is not won by the seeker''s own strength; she is the GIFT of Yahuah, proceeding from His own mouth: *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6). The same mouth-of-Yahuah word is the life of man — *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3) — and the word that does His will and does not fail: *So shall my word be that goeth forth out of my mouth: it shall not return unto me void* (Isaiah 55:11). The apostolic charge keeps the gift whole: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). And the wisdom that comes out of Yahuah''s mouth is at last named in the Formed Son — *HaMashiach Yahusha (Christ Jesus), who of Elohim (God) is made unto us wisdom, and righteousness, and sanctification, and redemption* (1 Corinthians 1:30): the expressed Word drawn from the Formless Source, the wisdom of the Father given to His people, who is Yahuah and has a Father. The restored witness opens on the same ground: *All wisdom comes from Yahuah (God), and is with him for ever* (Sirach 1:1). There is no wisdom apart from its Source; she is His to give.',
       sv.verse_id, ev.verse_id, 'extras', 28031
  FROM _s304_pr02_lookup sv, _s304_pr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-2-he-keepeth-the-paths-of-judgment-and-preserveth-his-saints',
       E'He keepeth the paths of judgment — and preserveth his saints',
       E'The wisdom given out of Yahuah''s mouth is laid up as a shield for the covenant-keeper, and Yahuah Himself guards the path: *He layeth up sound wisdom for the righteous: he is a buckler to them that walk uprightly. He keepeth the paths of judgment, and preserveth the way of his saints. Then shalt thou understand righteousness, and judgment, and equity; yea, every good path* (Proverbs 2:7-9). The keeping and the preserving are sung whole in the psalm of the inheritance: *For Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever: but the seed of the wicked shall be cut off* (Psalm 37:28). Yahuah loves the judgment Proverbs says He keeps; He preserves the saints Proverbs says walk His way; and He is the buckler to them that walk uprightly. The path of righteousness, judgment, and equity is not walked alone — its keeper is Yahuah, who forsakes not His own.',
       sv.verse_id, ev.verse_id, 'free', 28034
  FROM _s304_pr02_lookup sv, _s304_pr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-2-the-strange-woman-which-forgetteth-the-covenant-of-her-elohim',
       E'The strange woman — which forgetteth the covenant of her Elohim',
       E'Wisdom delivers from two dangers — the way of the evil man and the strange woman — and the heart of the second is named plainly as covenant-abandonment: *To deliver thee from the strange woman, even from the stranger which flattereth with her words; Which forsaketh the guide of her youth, and forgetteth the covenant of her Elohim (God). For her house inclineth unto death, and her paths unto the dead* (Proverbs 2:16-18). This is no slur on women but a figure of forsaking the covenant of one''s Elohim — and Hosea reads that very covenant as a marriage Yahuah keeps faithfully: *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19), *I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20). Jeremiah names the very *guide of her youth* the strange woman forsakes — *I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest after me in the wilderness* (Jeremiah 2:2): the covenant-marriage of the wilderness, the espousal that the faithless forget. The book itself traces her house only one way — *Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27); *Her feet go down to death; her steps take hold on hell* (Proverbs 5:5). The contrast stands: the faithful covenant-bride — the two-house people Yahuah betroths to Himself for ever — against the forsaken covenant whose paths incline unto death.',
       sv.verse_id, ev.verse_id, 'free', 28037
  FROM _s304_pr02_lookup sv, _s304_pr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=2 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-2-the-upright-shall-dwell-in-the-land',
       E'The upright shall dwell in the land — the inheritance promise',
       E'The chapter closes on the covenant land-promise, the inheritance read by conduct: *That thou mayest walk in the way of good men, and keep the paths of the righteous. For the upright shall dwell in the land, and the perfect shall remain in it. But the wicked shall be cut off from the earth, and the transgressors shall be rooted out of it* (Proverbs 2:20-22). The psalm of the inheritance sings the same two ends — *the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11), *The righteous shall inherit the land, and dwell therein for ever* (Psalm 37:29), *evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth* (Psalm 37:9). The Torah set the promise first, bound to the choosing of life: *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). And Yahusha (Jesus) keeps it word-for-word: *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5). The Beatitude is no new promise but the covenant inheritance renewed — restored, two-house, never replaced. The upright dwell in the land; the wicked are cut off from it; and the inheritance turns on the walk, not on lineage alone.',
       sv.verse_id, ev.verse_id, 'free', 28040
  FROM _s304_pr02_lookup sv, _s304_pr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=2 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*seek, and ye shall find; knock, and it shall be opened unto you* (Matthew 7:7) — the treasure-seeking of 2:4 met by Yahusha''s own promise; the seeking is answered by the finding.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-seek-her-as-silver-then-shalt-thou-find-the-knowledge-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13) — to search out wisdom (2:4) as for hid treasure is to search out Yahuah, found of the whole-hearted seeker.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-seek-her-as-silver-then-shalt-thou-find-the-knowledge-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29) — the Torah''s own seek-and-find pledge behind *find the knowledge of Elohim* (2:5).'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-seek-her-as-silver-then-shalt-thou-find-the-knowledge-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Search, and seek, and she shall be made known to you* (Sirach 6:27) — the restored witness keeps the searching of 2:4; once found, wisdom is held fast.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-seek-her-as-silver-then-shalt-thou-find-the-knowledge-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*esteemed riches nothing in comparison of her* (Wisdom of Solomon 7:8) — to seek wisdom *as silver* (2:4) is to count her above all treasure.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-seek-her-as-silver-then-shalt-thou-find-the-knowledge-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) — the book''s opening refrain, the door and the goal of the search that ends in *the fear of Yahuah* (2:5).'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-fear-of-yahuah-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The fear of Yahuah (LORD) is the beginning of wisdom* (Proverbs 9:10) — the twin refrain sealing the truth 2:5 points to; wisdom begins and ends in the fear of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-fear-of-yahuah-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Sirach 1:14) — the restored witness keeps the very refrain of 2:5; the root the faithful are born to.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-fear-of-yahuah-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26) — the charge to *hide my commandments with thee* (2:1) kept whole; wisdom is given through the commandments, not apart from them.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-fear-of-yahuah-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3) — the mouth-of-Yahuah word of 2:6 is the very life of man.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-yahuah-giveth-wisdom-out-of-his-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void* (Isaiah 55:11) — the knowledge *out of his mouth* (2:6) is the word that accomplishes Yahuah''s will.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-yahuah-giveth-wisdom-out-of-his-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally* (James 1:5) — the gift of 2:6 kept whole; wisdom is asked and freely given.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-yahuah-giveth-wisdom-out-of-his-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*HaMashiach Yahusha (Christ Jesus), who of Elohim (God) is made unto us wisdom* (1 Corinthians 1:30) — the wisdom out of Yahuah''s mouth (2:6) named in the Formed Son, the Word drawn from the Formless.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-yahuah-giveth-wisdom-out-of-his-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*All wisdom comes from Yahuah (God), and is with him for ever* (Sirach 1:1) — the restored witness opens on the truth of 2:6; there is no wisdom apart from its Source.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-yahuah-giveth-wisdom-out-of-his-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever* (Psalm 37:28) — the keeping and preserving of 2:8 sung whole; Yahuah Himself guards the covenant-path.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-he-keepeth-the-paths-of-judgment-and-preserveth-his-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment* (Hosea 2:19) — the covenant the strange woman forgets (2:17) read as Yahuah''s faithful marriage to the two-house people.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-strange-woman-which-forgetteth-the-covenant-of-her-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20) — Yahuah''s covenant kept in faithfulness against the woman who forgets it (2:17); to know Yahuah is to keep the covenant.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-strange-woman-which-forgetteth-the-covenant-of-her-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I remember thee, the kindness of thy youth, the love of thine espousals* (Jeremiah 2:2) — the *guide of her youth* the strange woman forsakes (2:17) is the covenant-espousal of the wilderness.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-strange-woman-which-forgetteth-the-covenant-of-her-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27) — the same warning of *her house inclineth unto death* (2:18); the path of covenant-abandonment runs only to death.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-strange-woman-which-forgetteth-the-covenant-of-her-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Her feet go down to death; her steps take hold on hell* (Proverbs 5:5) — the strange woman whose *house inclineth unto death* (2:18); the wage of forsaking the covenant of one''s Elohim, not a slur on women.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-strange-woman-which-forgetteth-the-covenant-of-her-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11) — the land-promise of 2:21 sung in the psalm of the inheritance.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-upright-shall-dwell-in-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The righteous shall inherit the land, and dwell therein for ever* (Psalm 37:29) — the dwelling and remaining of 2:21 as the everlasting inheritance.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-upright-shall-dwell-in-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth* (Psalm 37:9) — the cutting-off of 2:22; the two ends of the land read by conduct.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=22
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-upright-shall-dwell-in-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19) — the land-covenant behind 2:21; to dwell in the land is to choose the way of life and walk it.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-upright-shall-dwell-in-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Blessed are the meek: for they shall inherit the earth* (Matthew 5:5) — Yahusha keeps the land-promise of 2:21 word-for-word; the covenant inheritance renewed, restored, never replaced.'
  FROM cross_reference_threads t
  JOIN _s304_pr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s304_pr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-2-the-upright-shall-dwell-in-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
