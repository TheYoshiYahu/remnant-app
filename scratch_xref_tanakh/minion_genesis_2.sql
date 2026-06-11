-- ----- fragment: minion_genesis_2.sql (Genesis 2) -----
-- Chapter: Genesis 2  |  Tag: ge02  |  Temp view: _s301_ge02_lookup
-- Sort band: base 20025, step 3 -> 20025, 20028, 20031, 20034, 20037, 20040 (6 threads)
-- Source of every row: 'canon','genesis',2,v
--
-- ============================================================================
-- GENESIS 2 — PER-CHAPTER COVERAGE CHECKLIST (NT / Extras / Tanakh weighed per block)
-- ============================================================================
-- v.1     (heavens and earth finished, host of them)
--         NT:     none warranted (folded into the Sabbath thread's "works finished" frame, Heb 4:3)
--         Extras: none warranted
--         Tanakh: none warranted (carried by Gen 1 apparatus; v.1 is a hinge)
-- v.2-3   (Elohim rested the seventh day; blessed and sanctified it) — HEADLINE BLOCK
--         NT:     Hebrews 4:4 (God did rest the seventh day), Hebrews 4:9 (there remaineth
--                 a rest), Mark 2:27 (the sabbath was made for man) — ALL TAKEN
--         Extras: Jubilees 2:19, 2:25 (the Sabbath ordained, sanctified to the seed) — TAKEN
--         Tanakh: Exodus 20:11 (Sinai grounds the command on creation), Exodus 31:16-17
--                 (perpetual covenant / sign for ever), Isaiah 66:23 (all flesh, new heavens
--                 and earth) — ALL TAKEN
-- v.4     (these are the generations... Yahuah Elohim made earth and heavens)
--         NT/Extras/Tanakh: none warranted (toledot hinge into the Adam account)
-- v.5-6   (no man to till; a mist watered the ground)
--         none warranted (narrative setup; the river thread carries the water motif at v.10)
-- v.7     (Yahuah Elohim formed man of the dust; breath of life; living soul) — SEED BLOCK
--         NT:     1 Corinthians 15:45 (first Adam living soul / last Adam quickening spirit),
--                 15:47 (the first earthy, the second Yahuah from heaven) — TAKEN
--         Extras: none warranted (Jub 3 places Adam in garden, not the dust-forming; held for v.15/24)
--         Tanakh: none warranted (Job/Psalm dust-return belongs to Gen 3)
-- v.8     (planted a garden eastward in Eden; put the man there)
--         folded into tree-of-life (v.9) and into Jubilees-into-garden note (v.15)
-- v.9     (every tree pleasant... the tree of life... the tree of knowledge) — TREE BLOCK
--         NT:     Revelation 2:7 (tree of life in the paradise of Elohim), Revelation 22:2
--                 (the tree of life, leaves for healing) — TAKEN
--         Extras: NONE — brief forbids 1 Enoch ch25 here (bad parse / watcher material)
--         Tanakh: Proverbs 3:18 (wisdom a tree of life) — TAKEN
-- v.10-14 (a river went out of Eden, parted into four heads) — RIVER BLOCK
--         NT:     Revelation 22:1 (pure river of water of life from the throne) — TAKEN
--         Extras: none warranted (clean witness preferred; canon carries it)
--         Tanakh: Ezekiel 47:12 (river of the sanctuary, trees for medicine), Zechariah 14:8
--                 (living waters out of Jerusalem) — TAKEN
-- v.15    (took the man, put him in the garden to dress and keep it)
--         Extras: Jubilees 3:9 noted in summary (brought into Eden on the 40th day); not a
--                 standalone member — folds under the one-flesh / garden frame
-- v.16-17 (commanded the man... in the day thou eatest thereof thou shalt surely die) — COMMAND BLOCK
--         NT:     Romans 5:12 (by one man sin entered, and death by sin) — TAKEN
--         Extras: none warranted
--         Tanakh: none warranted (the death-sentence is fulfilled-forward in Gen 3; Rom 5 binds it)
-- v.18-20 (not good to be alone; named the beasts; no help meet found)
--         folded into the one-flesh thread (the search that ends in the woman built from the side)
-- v.21-24 (deep sleep; the rib; bone of my bones; one flesh) — COVENANT BLOCK
--         NT:     Matthew 19:4-6 (Messiah quotes it; no more twain), Mark 10:6-8 (one flesh),
--                 Ephesians 5:31-32 (the mystery of Messiah and the assembly) — ALL TAKEN
--         Extras: Jubilees 3:6 (one-flesh ordinance restated; brought to him) — TAKEN
--         Tanakh: none warranted (Mal 2 covenant-of-thy-youth already keyed to 1 Cor 7 elsewhere)
-- v.25    (both naked and not ashamed)
--         none warranted (the hinge into Gen 3's shame; carried there)
--
-- ============================================================================
-- THREADS (slug | anchor | target libraries | tier)
-- ============================================================================
-- 20025 genesis-2-the-seventh-day-blessed-and-hallowed-the-sabbath-of-creation (2:2-3)
--        Tanakh(Exod 20:11; Exod 31:16-17; Isa 66:23) + NT(Heb 4:4,9; Mark 2:27) + Extras(Jub 2:19,2:25) -> EXTRAS
-- 20028 genesis-2-formed-of-the-dust-a-living-soul-the-first-adam-and-the-last (2:7)
--        NT(1 Cor 15:45; 15:47) -> FREE
-- 20031 genesis-2-the-tree-of-life-in-the-midst-of-the-garden (2:9)
--        NT(Rev 2:7; Rev 22:2) + Tanakh(Prov 3:18) -> FREE
-- 20034 genesis-2-a-river-went-out-of-eden-the-waters-of-life (2:10)
--        Tanakh(Ezek 47:12; Zech 14:8) + NT(Rev 22:1) -> FREE
-- 20037 genesis-2-the-commandment-given-in-the-day-thou-eatest-thou-shalt-die (2:16-17)
--        NT(Rom 5:12) -> FREE
-- 20040 genesis-2-bone-of-my-bones-they-shall-be-one-flesh (2:21-24)
--        NT(Matt 19:4-6; Mark 10:6-8; Eph 5:31-32) + Extras(Jub 3:6) -> EXTRAS
--
-- LOAD-BEARING / CONTESTED FRAMING NOTES:
-- * SABBATH (headline): framed as creation-rooted and hallowed by Yahuah BEFORE Sinai — the
--   foundation Exodus 20:11 grounds the command ON, the perpetual sign (Exod 31:17), the rest
--   that REMAINS (Heb 4:9), made for Adam/man (Mark 2:27), kept by all flesh in the new heavens
--   and earth (Isa 66:23). Jubilees 2:19/2:25 witness the seventh-day ordinance. The thread
--   does NOT prescribe practice — the verses dismantle the abolished-Sabbath lie themselves.
--   The training default (Sabbath superseded / "just for the Jews") is the reading overridden.
-- * v.7 ADAM: the SEPARATE forming of the seed-of-promise Adam (distinct from the mankind of
--   Gen 1); woven forward to the last Adam (1 Cor 15:45) — type, not romance/biology trivia.
-- * v.24 ONE FLESH: kept as the marriage-COVENANT joining / seed-absorption mechanism (the
--   wife absorbed into the husband's seed-identity), NOT a generic romance proof-text; Messiah
--   ratifies it (Matt 19) and Paul reads it as Messiah-and-assembly (Eph 5:32).
-- * Tree-of-life thread deliberately carries NO extras member (1 Enoch ch25 forbidden by brief).
-- ============================================================================

CREATE TEMP VIEW _s301_ge02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (
    WITH input(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note) AS (VALUES

    -- ---- Thread 1: Sabbath of creation (2:2-3) ----
    ('canon','genesis',2,2,'canon','exodus',20,11,'free',
     E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). Sinai does not invent the Sabbath — it grounds the fourth word ON this chapter, where *he rested on the seventh day from all his work* (Genesis 2:2). The command points back to creation; the rest was hallowed by Yahuah before there was a Yashar''el (Israel) to keep it.'),
    ('canon','genesis',2,3,'canon','exodus',31,16,'free',
     E'*Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant* (Exodus 31:16). What Genesis 2:3 hallowed — *Elohim (God) blessed the seventh day, and sanctified it* — is bound to the covenant people as a *perpetual* (not provisional, not abolished) sign.'),
    ('canon','genesis',2,3,'canon','exodus',31,17,'free',
     E'*It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed* (Exodus 31:17). The seventh-day rest of Genesis 2 is named the everlasting SIGN, and it carries Genesis'' own ground — *for in six days* — the Creator''s own pattern made the people''s mark.'),
    ('canon','genesis',2,2,'canon','hebrews',4,4,'free',
     E'*For he spake in a certain place of the seventh day on this wise, And Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4). The letter quotes Genesis 2:2 verbatim — *he rested on the seventh day from all his work* — to argue the rest still stands; the seventh day is the certain place the whole argument leans on.'),
    ('canon','genesis',2,3,'canon','hebrews',4,9,'free',
     E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The Sabbath Genesis 2:3 *sanctified* is not spent or retired — it REMAINS; the verb is present, the rest is still open and still belongs to the people of Elohim.'),
    ('canon','genesis',2,2,'canon','mark',2,27,'free',
     E'*And he said unto them, The sabbath was made for man, and not man for the sabbath* (Mark 2:27). Yahusha (Jesus) traces the Sabbath to its making — to this chapter, where it was *made* in the rest of the seventh day — and gives it to man as gift, not yoke; it was made for Adam before it was ever a rule.'),
    ('canon','genesis',2,3,'canon','isaiah',66,23,'free',
     E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The day Genesis 2:3 *blessed* reaches past the cross to the new heavens and the new earth, where *all flesh* keeps it — the Sabbath is not behind us but ahead of us.'),
    ('canon','genesis',2,2,'jubilees','jubilees',2,19,'extras',
     E'*And He said to us: "Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people... as I have sanctified the Sabbath day and do sanctify (it) to Myself, even so shall I bless them"* (Jubilees 2:19). The restored witness ties the people''s sanctification to the Sabbath''s own sanctification — the very *sanctified it* of Genesis 2:3 — the day and the people hallowed by one act.'),
    ('canon','genesis',2,3,'jubilees','jubilees',2,25,'extras',
     E'*He created heaven and earth and everything that He created in six days, and Elohim (God) made the seventh day holy, for all His works* (Jubilees 2:25). Jubilees restates Genesis 2 plainly — *Elohim (God) made the seventh day holy* — placing the seventh-day hallowing at the foundation of creation, exactly where this chapter sets it.'),

    -- ---- Thread 2: formed of the dust, a living soul (2:7) ----
    ('canon','genesis',2,7,'canon','1-corinthians',15,45,'free',
     E'*And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). Genesis 2:7 — *man became a living soul* — is quoted as the FIRST term of a pair; the dust-formed Adam is the type whose answer is the last Adam, the quickening spirit.'),
    ('canon','genesis',2,7,'canon','1-corinthians',15,47,'free',
     E'*The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven* (1 Corinthians 15:47). The man *formed... of the dust of the ground* (Genesis 2:7) is the earthy first; the Formed Son who came from heaven is the second — the dust-origin of Adam frames the heaven-origin of the One who undoes Adam''s death.'),

    -- ---- Thread 3: the tree of life in the midst of the garden (2:9) ----
    ('canon','genesis',2,9,'canon','revelation',2,7,'free',
     E'*To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The very tree of Genesis 2:9 — *the tree of life also in the midst of the garden* — is held out again at the end of the canon; what Adam was barred from, the overcomer is given to eat.'),
    ('canon','genesis',2,9,'canon','revelation',22,2,'free',
     E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). Eden''s *tree of life* (Genesis 2:9) is not lost but restored — replanted by the river in the city, its leaves now healing the nations.'),
    ('canon','genesis',2,9,'canon','proverbs',3,18,'free',
     E'*She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). Wisdom is named with Eden''s own image — *the tree of life* of Genesis 2:9 — the tree that gives life to the one who lays hold; the garden''s gift is offered to the one who keeps Wisdom''s way.'),

    -- ---- Thread 4: a river went out of Eden (2:10-14) ----
    ('canon','genesis',2,10,'canon','ezekiel',47,12,'free',
     E'*And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... and the leaf thereof for medicine* (Ezekiel 47:12). The river that *went out of Eden to water the garden* (Genesis 2:10) flows again from the sanctuary, lining its banks with the trees of life — Eden''s pattern reopened in the temple vision.'),
    ('canon','genesis',2,10,'canon','revelation',22,1,'free',
     E'*And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). Genesis 2:10''s river *out of Eden* finds its source revealed — the throne itself; the water that watered the first garden is the water of life flowing through the last city.'),
    ('canon','genesis',2,10,'canon','zechariah',14,8,'free',
     E'*And it shall be in that day, that living waters shall go out from Jerusalem; half of them toward the former sea, and half of them toward the hinder sea: in summer and in winter shall it be* (Zechariah 14:8). The single Eden-river that *was parted, and became into four heads* (Genesis 2:10) answers in the living waters going out from Jerusalem to the whole earth — Eden''s geography restored on the day of Yahuah.'),

    -- ---- Thread 5: the commandment given (2:16-17) ----
    ('canon','genesis',2,17,'canon','romans',5,12,'free',
     E'*Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The sentence of Genesis 2:17 — *in the day that thou eatest thereof thou shalt surely die* — is the door death came through; one man, one command, and death passing to all. Torah''s first word names the wage that Messiah will pay.'),

    -- ---- Thread 6: bone of my bones, one flesh (2:21-24) ----
    ('canon','genesis',2,24,'canon','matthew',19,5,'free',
     E'*And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* (Matthew 19:5). Yahusha (Jesus) settles the marriage covenant by quoting Genesis 2:24 word for word — *they shall be one flesh* — anchoring the joining not in custom but in the creation order itself.'),
    ('canon','genesis',2,24,'canon','matthew',19,6,'free',
     E'*Wherefore they are no more twain, but one flesh. What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:6). The *one flesh* of Genesis 2:24 is read by Messiah as a binding act of Elohim — two become one and are *no more twain*; the covenant joining is His work, not man''s to break.'),
    ('canon','genesis',2,24,'canon','mark',10,8,'free',
     E'*And they twain shall be one flesh: so then they are no more twain, but one flesh* (Mark 10:8). The same word of Genesis 2:24 — *they shall be one flesh* — is grounded *from the beginning of the creation* (Mark 10:6); the two-become-one is the original design, the wife absorbed into one shared flesh-identity.'),
    ('canon','genesis',2,24,'canon','ephesians',5,31,'free',
     E'*For this cause shall a man leave his father and his mother, and shall be joined unto his wife, and they two shall be one flesh* (Ephesians 5:31). Genesis 2:24 is taken up whole, and then unveiled: *This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:32) — the one-flesh joining is the figure of the assembly absorbed into Messiah.'),
    ('canon','genesis',2,22,'jubilees','jubilees',3,6,'extras',
     E'*"This is now bone of my bones and flesh of my flesh; she will be called my wife; because she was taken from her husband." Therefore shall man and wife be one, and therefore shall a man leave his father and his mother, and cleave to his wife, and they shall be one flesh* (Jubilees 3:6). The restored witness retells Genesis 2:22-24 — the woman *brought... unto the man* and named bone of his bone — sealing the one-flesh ordinance from the first marriage.')

    ) SELECT * FROM input
  ) i
  JOIN _s301_ge02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. threads
-- ============================================================================

-- Thread 1: 20025 — Sabbath of creation (EXTRAS: Jubilees members)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-the-seventh-day-blessed-and-hallowed-the-sabbath-of-creation',
       E'The Seventh Day, Blessed and Hallowed — the Sabbath Rooted in Creation',
       E'Before there was a Sinai, before there was a Yashar''el (Israel) to command, the seventh day was already set apart. *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made. And Elohim (God) blessed the seventh day, and sanctified it* (Genesis 2:2-3). The Sabbath is not an ordinance bolted onto the Law later; it is woven into the architecture of creation itself — Yahuah rested, blessed, sanctified.\n\nWhen the fourth word is spoken at the mountain, it does not invent the day — it points back here: *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The command rests on the creation; the creation hallowed the day. And it is named a covenant without end — *a perpetual covenant* (Exodus 31:16), *a sign between me and the children of Yashar''el (Israel) for ever* (Exodus 31:17). The restored witness says the same: *Elohim (God) made the seventh day holy, for all His works* (Jubilees 2:25), and binds the day''s sanctifying to the people''s — *as I have sanctified the Sabbath day... even so shall I bless them* (Jubilees 2:19).\n\nThe pulpit has taught that this day was nailed to a cross and abolished. Hear the canon read itself. Yahusha (Jesus) does not retire it — he traces it to its making: *The sabbath was made for man, and not man for the sabbath* (Mark 2:27). It was made for Adam, for man, in this very chapter. And the letter to the Hebrews quotes Genesis 2 to prove the rest still stands: *And Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4); *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — present tense, still open, still ours. It reaches all the way to the end, when *from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The Father hallowed the seventh day; only man moved it. The day He blessed remains blessed.',
       sv.verse_id, ev.verse_id, 'extras', 20025
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: 20028 — formed of the dust, a living soul (FREE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-formed-of-the-dust-a-living-soul-the-first-adam-and-the-last',
       E'Formed of the Dust, a Living Soul — the First Adam and the Last',
       E'Genesis 1 spoke mankind into being; Genesis 2 stoops down and FORMS one man by hand. *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). This is the separate forming of the seed-of-promise Adam — the line the whole canon will follow — shaped from the dust and made alive by the breath of the Father.\n\nPaul reaches back to this exact verse and makes Adam the first term of a pair: *And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). The dust-formed man is a type; the last Adam answers him — where the first received life, the last GIVES it. *The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven* (1 Corinthians 15:47). The man drawn from the ground is the earthy beginning; the Formed Son drawn from the Formless came from heaven to undo the death the first Adam brought. Read this verse and you are already standing at the foot of the resurrection — the living soul of Genesis 2:7 waiting for the quickening spirit who is its answer.',
       sv.verse_id, ev.verse_id, 'free', 20028
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: 20031 — the tree of life (FREE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-the-tree-of-life-in-the-midst-of-the-garden',
       E'The Tree of Life in the Midst of the Garden',
       E'In the heart of Eden stands a tree the whole canon will circle back to. *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden* (Genesis 2:9). It is set in the midst — central, offered, life-giving.\n\nWisdom wears its image: *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18) — the one who keeps the way of Wisdom lays hold of Eden''s own gift. And the end of the canon does not leave the tree behind in a lost garden; it gives it back. *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7) — the same tree, *in the midst*, held out to the overcomer. And it is replanted by the river in the city: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* (Revelation 22:2). What Adam was shut out from, the redeemed are welcomed to — the tree of Genesis 2:9 is not lost but restored, and its leaves now heal.',
       sv.verse_id, ev.verse_id, 'free', 20031
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: 20034 — a river went out of Eden (FREE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-a-river-went-out-of-eden-the-waters-of-life',
       E'A River Went Out of Eden — the Waters of Life',
       E'*And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads* (Genesis 2:10). One river, watering the garden, branching out to the whole earth — Pison, Gihon, Hiddekel, Euphrates. The geography of Eden is a pattern the prophets and the apocalypse return to.\n\nEzekiel sees the river flowing again, this time from the sanctuary: *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade... and the leaf thereof for medicine* (Ezekiel 47:12). Zechariah sees it on the day of Yahuah: *And it shall be in that day, that living waters shall go out from Jerusalem; half of them toward the former sea, and half of them toward the hinder sea* (Zechariah 14:8) — the single Eden-source splitting to the whole earth once more. And John sees the source itself laid bare: *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). The water that watered the first garden is the water of life flowing from the throne through the last city. Eden was never a closed chapter — it is the seed of the world to come.',
       sv.verse_id, ev.verse_id, 'free', 20034
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: 20037 — the commandment given (FREE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-the-commandment-given-in-the-day-thou-eatest-thou-shalt-die',
       E'The Commandment Given — In the Day Thou Eatest Thou Shalt Surely Die',
       E'Torah does not begin at Sinai; it begins in the garden, with a word and a warning. *And Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat: But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:16-17). The first commandment is open-handed — *freely eat* — with one boundary, and the boundary carries a wage: death.\n\nPaul names that wage and traces it through the whole race: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The door death came through is this command and its breaking — one man, one tree, and the sentence passing to all. The first word of Torah already names the price the last Adam will pay; *thou shalt surely die* is the debt the cross will answer.',
       sv.verse_id, ev.verse_id, 'free', 20037
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- Thread 6: 20040 — bone of my bones, one flesh (EXTRAS: Jubilees member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-2-bone-of-my-bones-they-shall-be-one-flesh',
       E'Bone of My Bones — They Shall Be One Flesh',
       E'The first marriage is not a romance — it is a covenant joining, and the canon will read it that way to the very end. *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam... and he took one of his ribs... And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* (Genesis 2:21-22). The woman is built from the man''s own side and brought back to him: *This is now bone of my bones, and flesh of my flesh* (Genesis 2:23). Then the rule of the covenant is stated: *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). Two become one — the wife absorbed into one shared flesh-identity with her husband.\n\nThe restored witness retells it plainly: she is *brought... unto the man*, named bone of his bone, and *therefore shall man and wife be one... and they shall be one flesh* (Jubilees 3:6). And Yahusha (Jesus) settles every marriage question by quoting this verse: *For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* (Matthew 19:5); *Wherefore they are no more twain, but one flesh. What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:6). It is grounded *from the beginning of the creation* (Mark 10:6), *they twain shall be one flesh: so then they are no more twain* (Mark 10:8). And Paul lifts the veil on what the one-flesh always pointed to: *For this cause shall a man leave his father and his mother, and shall be joined unto his wife, and they two shall be one flesh. This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:31-32). The two-become-one of Eden is the figure of the assembly absorbed into Messiah — the covenant joining written into the first marriage.',
       sv.verse_id, ev.verse_id, 'extras', 20040
  FROM _s301_ge02_lookup sv, _s301_ge02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=2 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. thread_members
-- ============================================================================

-- Thread 1 members: Sabbath of creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (2, 0, 'canon','exodus',20,11, 1, E'Exodus 20:11 — the fourth word grounds itself on this chapter: *for in six days Yahuah (LORD) made heaven and earth... and rested the seventh day*.'),
    (3, 0, 'canon','exodus',31,16, 2, E'Exodus 31:16 — *a perpetual covenant*; what Genesis 2:3 sanctified is bound to the people without end.'),
    (3, 0, 'canon','exodus',31,17, 3, E'Exodus 31:17 — the everlasting *sign*, carrying Genesis'' own ground: *for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested*.'),
    (2, 0, 'canon','hebrews',4,4, 4, E'Hebrews 4:4 — quotes Genesis 2:2 verbatim to argue the rest still stands.'),
    (3, 0, 'canon','hebrews',4,9, 5, E'Hebrews 4:9 — *There remaineth therefore a rest*; present tense, still open.'),
    (2, 0, 'canon','mark',2,27, 6, E'Mark 2:27 — *The sabbath was made for man*; Yahusha (Jesus) traces it to its making in this chapter.'),
    (3, 0, 'canon','isaiah',66,23, 7, E'Isaiah 66:23 — *all flesh* keep it in the new heavens and earth; the day reaches ahead, not behind.'),
    (2, 0, 'jubilees','jubilees',2,19, 8, E'Jubilees 2:19 — the people''s sanctifying tied to the Sabbath''s own (restored witness).'),
    (3, 0, 'jubilees','jubilees',2,25, 9, E'Jubilees 2:25 — *Elohim (God) made the seventh day holy*; the hallowing set at creation''s foundation.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-the-seventh-day-blessed-and-hallowed-the-sabbath-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members: formed of the dust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (7, 0, 'canon','1-corinthians',15,45, 1, E'1 Corinthians 15:45 — *the first man Adam was made a living soul; the last Adam was made a quickening spirit*; Genesis 2:7 quoted as the first term.'),
    (7, 0, 'canon','1-corinthians',15,47, 2, E'1 Corinthians 15:47 — the earthy first man and the second from heaven; the dust-Adam framing the Formed Son.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-formed-of-the-dust-a-living-soul-the-first-adam-and-the-last'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members: tree of life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (9, 0, 'canon','proverbs',3,18, 1, E'Proverbs 3:18 — Wisdom is *a tree of life*; Eden''s image given to the one who lays hold.'),
    (9, 0, 'canon','revelation',2,7, 2, E'Revelation 2:7 — the same tree *in the midst of the paradise of Elohim*, held out to the overcomer.'),
    (9, 0, 'canon','revelation',22,2, 3, E'Revelation 22:2 — the tree restored by the river, its leaves *for the healing of the nations*.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-the-tree-of-life-in-the-midst-of-the-garden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members: river of Eden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (10, 0, 'canon','ezekiel',47,12, 1, E'Ezekiel 47:12 — the river from the sanctuary, trees on its banks *for medicine*; Eden''s pattern reopened.'),
    (10, 0, 'canon','zechariah',14,8, 2, E'Zechariah 14:8 — *living waters shall go out from Jerusalem*; the one Eden-source splitting to the whole earth.'),
    (10, 0, 'canon','revelation',22,1, 3, E'Revelation 22:1 — the river of life *proceeding out of the throne*; Eden''s source revealed.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-a-river-went-out-of-eden-the-waters-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members: the commandment given
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (17, 0, 'canon','romans',5,12, 1, E'Romans 5:12 — *by one man sin entered into the world, and death by sin*; the door death came through is Genesis 2:17''s broken command.')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-the-commandment-given-in-the-day-thou-eatest-thou-shalt-die'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6 members: bone of my bones, one flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (22, 0, 'jubilees','jubilees',3,6, 1, E'Jubilees 3:6 — the restored witness retells Genesis 2:22-24: brought to the man, bone of his bone, *they shall be one flesh*.'),
    (24, 0, 'canon','matthew',19,5, 2, E'Matthew 19:5 — Yahusha (Jesus) quotes Genesis 2:24 word for word: *they twain shall be one flesh*.'),
    (24, 0, 'canon','matthew',19,6, 3, E'Matthew 19:6 — *no more twain*; the joining is the work of Elohim, not man''s to break.'),
    (24, 0, 'canon','mark',10,8, 4, E'Mark 10:8 — the one-flesh grounded *from the beginning of the creation*.'),
    (24, 0, 'canon','ephesians',5,31, 5, E'Ephesians 5:31 — Genesis 2:24 taken up whole, then unveiled as *Messiah (Christ) and the church* (v.32).')
  ) AS m(src_v, _unused, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN _s301_ge02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=2 AND sv.verse_number=m.src_v
  JOIN _s301_ge02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='genesis-2-bone-of-my-bones-they-shall-be-one-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
