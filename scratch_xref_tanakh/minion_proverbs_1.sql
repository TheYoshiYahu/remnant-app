-- ----- fragment: minion_proverbs_1.sql (Proverbs 1) -----
-- Chapter: Proverbs 1 — THE PROLOGUE OF WISDOM, THE PROGRAMMATIC MOTTO: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (1:7) — the gate of the whole book, the covenant-reverence that keeps the commandments, never terror and never abolished. The chapter opens the call (1:1-6), sets the motto (1:7), grounds it in the father's instruction and the mother's torah (1:8-9), warns off the enticement of the blood-lusting sinners whose snare recoils on themselves (1:10-19), and lifts the first cry of Wisdom personified in the streets — *Wisdom crieth without; she uttereth her voice in the streets* (1:20) — who pours out her spirit (1:23), is refused, and laughs at the calamity of those who *hated knowledge, and did not choose the fear of Yahuah* (1:29), while *whoso hearkeneth unto me shall dwell safely* (1:33).
-- Tag: pr01   Temp view: _s304_pr01_lookup   Session prefix: s304
-- Sort band: base 28000, step 3 -> threads at 28000, 28003, 28006, 28009, 28012 (5 threads)
-- Source of EVERY row: 'canon','proverbs',1,v
--
-- Proverbs 1 coverage:
--   v.1-6 (the proverbs of Solomon... to know wisdom and instruction... the fear of Yahuah is the beginning)
--        NT:     none warranted (prologue/purpose statement; the motto weave belongs to v.7 — THREAD 1)
--        Extras: none warranted distinct (Sirach 1's wisdom-prologue is bound to v.7 — THREAD 1)
--        Tanakh: none warranted distinct (purpose-list carried into THREAD 1)
--   ★★ v.7 (The fear of Yahuah is the beginning of knowledge: but fools despise wisdom and instruction)
--        NT:     1 John 2:3-4 (hereby we do know that we know him, if we keep his commandments) — THREAD 1 (the filter: knowing Him = keeping commandments; the fear that keeps the Torah)
--        Extras: Sirach 1:14 (To fear Yahuah (God) is the beginning of wisdom) + 1:11/1:16/1:26 (near-verbatim; keep the commandments and Yahuah shall give her) — THREAD 1
--        Tanakh: ★ Proverbs 9:10 (the fear of Yahuah is the beginning of wisdom — the twin), Psalm 111:10 (a good understanding have all they that do his commandments), Job 28:28 (the fear of Yahuah, that is wisdom; and to depart from evil is understanding), Ecclesiastes 12:13 (Fear Elohim, and keep his commandments: for this is the whole duty of man) — THREAD 1 (load-bearing)
--   ★ v.8-9 (My son, hear the instruction of thy father, and forsake not the law of thy mother... an ornament of grace unto thy head)
--        NT:     Ephesians 6:1-3 (Children, obey your parents... Honour thy father and mother; which is the first commandment with promise) — THREAD 2
--        Extras: none warranted distinct (the honour-of-parents weave is fully carried by Exodus 20:12 and Ephesians 6 — THREAD 2)
--        Tanakh: ★ Exodus 20:12 (Honour thy father and thy mother: that thy days may be long upon the land) — THREAD 2 (load-bearing; the Torah of v.8 IS the fifth word)
--   ★ v.10-19 (My son, if sinners entice thee, consent thou not... they lay wait for their own blood... the ways of every one that is greedy of gain)
--        NT:     Galatians 6:7 (Be not deceived; Elohim is not mocked: for whatsoever a man soweth, that shall he also reap) — THREAD 3 (the snare recoils on the sower)
--        Extras: none warranted distinct (the recoil/two-ways motif carried by Psalm 7 and Galatians 6 — THREAD 3)
--        Tanakh: ★ Psalm 7:15-16 (He made a pit... and is fallen into the ditch which he made. His mischief shall return upon his own head) — THREAD 3 (load-bearing; the snare-recoils-on-itself)
--   ★★ v.20-23 (Wisdom crieth without; she uttereth her voice in the streets... behold, I will pour out my spirit unto you)
--        NT:     Acts 2:17 (I will pour out of my Spirit upon all flesh) — THREAD 4 (the Spirit poured = Wisdom's promise kept at Shavuot)
--        Extras: Wisdom of Solomon 6:12 (Wisdom is glorious, and never fadeth away... easily seen of them that love her) + 6:13-16 (she preventeth them that desire her... meeteth them in every thought) — THREAD 4 (Wisdom seeking, crying, found of those who seek her early)
--        Tanakh: ★ Joel 2:28 (I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy) — THREAD 4 (load-bearing; the source Acts quotes — Wisdom's "I will pour out my spirit" of 1:23)
--   ★★ v.24-33 (Because I have called, and ye refused... they hated knowledge, and did not choose the fear of Yahuah... I also will laugh at your calamity... But whoso hearkeneth unto me shall dwell safely)
--        NT:     Matthew 23:37-38 (how often would I have gathered thy children... and ye would not! Behold, your house is left unto you desolate); Luke 11:49 (Therefore also said the wisdom of Elohim, I will send them prophets) — THREAD 5 (the rejection of Wisdom; the house left desolate; "the wisdom of God said")
--        Extras: none warranted distinct (the rejection-and-desolation weave is carried by the Gospels — THREAD 5)
--        Tanakh: none warranted distinct (the calling-and-refusing is held within the chapter and forward to the Gospels — THREAD 5)
--
-- Threads (slug — target libraries):
--   1. proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge — Tanakh (Prov 9, Ps 111, Job 28, Eccl 12) + Extras (Sirach 1) + NT (1 John 2) [extras] (★★ THE MOTTO; covenant-reverence that keeps the commandments)
--   2. proverbs-1-hear-the-instruction-of-thy-father-forsake-not-the-law-of-thy-mother — Tanakh (Exodus 20) + NT (Ephesians 6) [free] (★ the Torah of v.8 = the fifth word, honouring father+mother)
--   3. proverbs-1-if-sinners-entice-thee-consent-thou-not — Tanakh (Psalm 7) + NT (Galatians 6) [free] (★ the snare recoils on the sower; greed takes the life of its owners)
--   4. proverbs-1-wisdom-crieth-in-the-streets — Tanakh (Joel 2) + NT (Acts 2) + Extras (Wisdom of Solomon 6) [extras] (★★ Wisdom personified, first appearance; "I will pour out my spirit" = Shavuot)
--   5. proverbs-1-they-hated-knowledge-and-the-house-left-desolate — NT (Matthew 23, Luke 11) [free] (★★ the rejection of Wisdom; the house left desolate; "the wisdom of God said")
--
-- Framing notes:
--   ★★ THE FEAR OF YAHUAH (THREAD 1): *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (1:7) is the programmatic motto of the whole book, restated as its keystone in *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). The fear of Yahuah is NOT terror but covenant reverence — and the Tanakh itself defines it as commandment-keeping: *a good understanding have all they that do his commandments* (Psalm 111:10), *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13), *the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28). Yochanan (John) supplies the filter: *hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:3-4) — the fear that begins knowledge is the same fear that keeps the Torah, never the lawless religion that despises instruction. The restored witness says it near-verbatim and ties it to the same root: *To fear Yahuah (God) is the beginning of wisdom* (Sirach 1:14), *If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26).
--   ★ THE FATHER'S INSTRUCTION AND THE MOTHER'S TORAH (THREAD 2): *My son, hear the instruction of thy father, and forsake not the law of thy mother: for they shall be an ornament of grace unto thy head, and chains about thy neck* (1:8-9). The parse reads the mother's teaching as her *law* — her torah — and the commandment to receive it is the fifth word: *Honour thy father and thy mother: that thy days may be long upon the land* (Exodus 20:12), which Sha'ul (Paul) names *the first commandment with promise* (Ephesians 6:2). The instruction is not a yoke but an ornament of grace; the Torah from father and mother is the inheritance that crowns the son.
--   ★ IF SINNERS ENTICE THEE (THREAD 3): *My son, if sinners entice thee, consent thou not* (1:10) — the blood-lusting greedy who *lay wait for their own blood; they lurk privily for their own lives* (1:18), for *so are the ways of every one that is greedy of gain; which taketh away the life of the owners thereof* (1:19). The snare recoils on the one who sets it, the very pattern of Psalm 7: *He made a pit, and digged it, and is fallen into the ditch which he made. His mischief shall return upon his own head* (Psalm 7:15-16). Sha'ul names the law of it: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The way of violence devours its own walkers.
--   ★★ WISDOM CRIETH IN THE STREETS (THREAD 4): *Wisdom crieth without; she uttereth her voice in the streets* (1:20) — the FIRST appearance of the Wisdom-figure who becomes the agent of creation in chapter 8 (*Yahuah (LORD) possessed me in the beginning of his way, before his works of old* — Proverbs 8:22). Her promise to those who turn at her reproof — *behold, I will pour out my spirit unto you, I will make known my words unto you* (1:23) — is the very word Yahuah speaks through Joel: *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28), kept at Shavuot when Kepha (Peter) quotes it: *I will pour out of my Spirit upon all flesh* (Acts 2:17). The restored witness sees the same seeking Wisdom: *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her* (Wisdom of Solomon 6:12). Wisdom cries, pours out her spirit, and is found by those who seek her early.
--   ★★ THEY HATED KNOWLEDGE / THE HOUSE LEFT DESOLATE (THREAD 5): *Because I have called, and ye refused; I have stretched out my hand, and no man regarded* (1:24) — and so *I also will laugh at your calamity; I will mock when your fear cometh* (1:26), *for that they hated knowledge, and did not choose the fear of Yahuah (LORD)* (1:29). This rejection of the calling-Wisdom is exactly what Yahusha (Jesus) laments over the city: *how often would I have gathered thy children together... and ye would not! Behold, your house is left unto you desolate* (Matthew 23:37-38). Luke even names the speaker as Wisdom herself: *Therefore also said the wisdom of Elohim (God), I will send them prophets and apostles, and some of them they shall slay and persecute* (Luke 11:49). The chapter ends with the only safe answer to the cry: *But whoso hearkeneth unto me shall dwell safely, and shall be quiet from fear of evil* (1:33).
--   EXTRAS DOUBLE-WRITE: Sirach = edition 'apocrypha' + book 'ecclesiasticus'; Wisdom of Solomon = edition 'apocrypha' + book 'the-wisdom-of-solomon'. Both editions differ from book slug — uniform 10-column VALUES arity maintained throughout.
--   VERSES WITH NO STANDALONE THREAD: v.1-6 (the prologue/purpose-list) is the frame the motto of v.7 caps — carried within THREAD 1 rather than given its own thread. The Wisdom self-link to Proverbs 8:22 (agent-of-creation) is named in the THREAD 4 summary but not threaded as a cross_reference (chapter-8 apparatus is its own minion's work).

CREATE TEMP VIEW _s304_pr01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: The fear of Yahuah is the beginning of knowledge (the motto of the whole book)
    ('canon','proverbs',1,7,'canon','proverbs',9,10,'free',
      E'*The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). The motto of *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) is restated as the book''s keystone, the door at the head and the hinge at the heart of Proverbs. Knowledge and wisdom alike begin in the one place: the reverent fear of Yahuah, which is the knowledge of the Holy One Himself.'),
    ('canon','proverbs',1,7,'canon','psalms',111,10,'free',
      E'*The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever* (Psalm 111:10). The psalm sings the very motto of *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) and then DEFINES the fear by conduct: *a good understanding have all they that do his commandments*. The fear that begins wisdom is not terror but the reverence that keeps the Torah — the doers of His commandments are the understanding.'),
    ('canon','proverbs',1,7,'canon','job',28,28,'free',
      E'*And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28). After the long search for where wisdom may be found, the answer is the same as the motto *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7): *the fear of Yahuah, that is wisdom; and to depart from evil is understanding*. Wisdom is not mined from the earth but given to the man who fears Yahuah and turns from evil.'),
    ('canon','proverbs',1,7,'canon','ecclesiastes',12,13,'free',
      E'*Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). The Preacher''s final word folds the motto of *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) into a single charge: *Fear Elohim (God), and keep his commandments*. The fear and the commandment-keeping are one whole duty — the beginning of knowledge is the keeping of the Torah, never its despising.'),
    ('canon','proverbs',1,7,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments* (1 John 2:3). Yochanan (John) gives the filter for *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7): the knowledge of Him is proven by keeping His commandments. The fear that begins knowledge is the same reverence that walks in the Torah; to claim the knowledge without the commandments is the fool''s despising.'),
    ('canon','proverbs',1,7,'canon','1-john',2,4,'free',
      E'*He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). The fools who *despise wisdom and instruction* (Proverbs 1:7) are named again by Yochanan (John): the one who claims to know Him yet keeps not His commandments *is a liar, and the truth is not in him*. The fear of Yahuah and commandment-keeping cannot be severed; the lawless claim to knowledge is the lie the motto forbids.'),
    ('canon','proverbs',1,7,'apocrypha','ecclesiasticus',1,14,'extras',
      E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Sirach 1:14). The restored witness carries the motto of *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) almost word for word: *To fear Yahuah (God) is the beginning of wisdom*. The same root runs the whole wisdom library — the fear of Yahuah is where wisdom begins, planted in the faithful from the womb.'),
    ('canon','proverbs',1,7,'apocrypha','ecclesiasticus',1,26,'extras',
      E'*If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26). The restored witness binds the motto of *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) to the Torah outright: *If you desire wisdom, keep the commandments*. Wisdom is not earned apart from the commandments nor against them — the fear of Yahuah and the keeping of His word are the one path to her.'),

    -- THREAD 2: Hear the instruction of thy father, forsake not the law of thy mother (the fifth word)
    ('canon','proverbs',1,8,'canon','exodus',20,12,'free',
      E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). The call to *hear the instruction of thy father, and forsake not the law of thy mother* (Proverbs 1:8) is the fifth word of the Ten given at Sinai: *Honour thy father and thy mother*. The instruction and the *law of thy mother* are the Torah received in the home; to honour father and mother is to receive the covenant taught at the family hearth.'),
    ('canon','proverbs',1,8,'canon','ephesians',6,2,'free',
      E'*Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2). Sha''ul (Paul) names the very commandment standing behind *hear the instruction of thy father, and forsake not the law of thy mother* (Proverbs 1:8): *Honour thy father and mother*, which he calls *the first commandment with promise*. The Torah of the home is not abolished but affirmed — the son who receives the father''s instruction and the mother''s law keeps the word that carries the promise of long life.'),

    -- THREAD 3: If sinners entice thee, consent thou not (the snare recoils on the sower)
    ('canon','proverbs',1,18,'canon','psalms',7,15,'free',
      E'*He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15). The blood-lusting of *they lay wait for their own blood; they lurk privily for their own lives* (Proverbs 1:18) is the same recoil the psalm sings: the wicked *made a pit, and digged it, and is fallen into the ditch which he made*. The snare laid for the innocent closes upon its own setter; the violence comes home to the violent.'),
    ('canon','proverbs',1,18,'canon','psalms',7,16,'free',
      E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16). The greedy who *lay wait for their own blood* (Proverbs 1:18) reap the law of Psalm 7: *His mischief shall return upon his own head*. The way of violence devours its own walkers — the harm devised for others falls back on the head that devised it.'),
    ('canon','proverbs',1,19,'canon','galatians',6,7,'free',
      E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The verdict on *the ways of every one that is greedy of gain; which taketh away the life of the owners thereof* (Proverbs 1:19) is the law Sha''ul (Paul) states plainly: *whatsoever a man soweth, that shall he also reap*. The greedy man''s gain takes his own life; the seed of violence is reaped by the one who sowed it.'),

    -- THREAD 4: Wisdom crieth in the streets (the first appearance; I will pour out my spirit)
    ('canon','proverbs',1,23,'canon','joel',2,28,'free',
      E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions* (Joel 2:28). Wisdom''s promise to those who turn at her reproof — *behold, I will pour out my spirit unto you, I will make known my words unto you* (Proverbs 1:23) — is the very word Yahuah speaks through Joel: *I will pour out my spirit upon all flesh*. The crying Wisdom and the outpoured Spirit are one promise, held out to all who will turn.'),
    ('canon','proverbs',1,23,'canon','acts',2,17,'free',
      E'*And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy* (Acts 2:17). The promise of Wisdom — *I will pour out my spirit unto you* (Proverbs 1:23) — is kept at Shavuot, when Kepha (Peter) declares it fulfilled: *I will pour out of my Spirit upon all flesh*. The Wisdom who cried in the streets pours out her spirit at last on the feast of the firstfruits of the Spirit.'),
    ('canon','proverbs',1,20,'apocrypha','the-wisdom-of-solomon',6,12,'extras',
      E'*Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her* (Wisdom of Solomon 6:12). The Wisdom who *crieth without; she uttereth her voice in the streets* (Proverbs 1:20) is the same who is *easily seen of them that love her, and found of such as seek her*. She does not hide — she cries aloud and shows herself to all who will seek; the failure is never in Wisdom''s silence but in the simple ones'' refusal to turn.'),
    ('canon','proverbs',1,20,'apocrypha','the-wisdom-of-solomon',6,16,'extras',
      E'*For she goes about seeking such as are worthy of her, sheweth herself favourably to them in the ways, and meeteth them in every thought* (Wisdom of Solomon 6:16). The crying Wisdom of *she uttereth her voice in the streets* (Proverbs 1:20) is the seeking Wisdom who *goes about seeking such as are worthy of her... and meeteth them in every thought*. She is not waited upon in a temple but walks the streets seeking — the same Wisdom-figure who in chapter 8 was the Father''s delight before the world was.'),

    -- THREAD 5: They hated knowledge / the house left desolate (the rejection of Wisdom)
    ('canon','proverbs',1,24,'canon','matthew',23,37,'free',
      E'*O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37). Wisdom''s lament — *Because I have called, and ye refused; I have stretched out my hand, and no man regarded* (Proverbs 1:24) — is the very cry of Yahusha (Jesus) over the city: *how often would I have gathered thy children together... and ye would not!* The calling Wisdom and the gathering Messiah are refused alike; the stretched-out hand is the same hand spread to the unwilling.'),
    ('canon','proverbs',1,29,'canon','matthew',23,38,'free',
      E'*Behold, your house is left unto you desolate* (Matthew 23:38). The end of those who *hated knowledge, and did not choose the fear of Yahuah (LORD)* (Proverbs 1:29) is the desolation Yahusha (Jesus) pronounces: *Behold, your house is left unto you desolate*. The calamity Wisdom warned of — *I also will laugh at your calamity* (Proverbs 1:26) — falls as the house left empty; the rejection of the fear of Yahuah ends in desolation.'),
    ('canon','proverbs',1,20,'canon','luke',11,49,'free',
      E'*Therefore also said the wisdom of Elohim (God), I will send them prophets and apostles, and some of them they shall slay and persecute* (Luke 11:49). Luke names the speaker who *crieth without; she uttereth her voice in the streets* (Proverbs 1:20) outright: *the wisdom of Elohim (God)* — the same Wisdom who calls, sends, and is refused. The crying Wisdom of Proverbs 1 is the Wisdom of Elohim who sends the prophets the rejecters slay.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge',
       E'The fear of Yahuah is the beginning of knowledge — the motto of the whole book',
       E'The prologue of Proverbs gathers its whole purpose — *to know wisdom and instruction... to receive the instruction of wisdom, justice, and judgment, and equity* (Proverbs 1:2-3) — into a single programmatic motto: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7). This is the door of the book, restated as its keystone — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). The fear of Yahuah is not terror but covenant reverence, and the Tanakh defines it by conduct: *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments* (Psalm 111:10); *Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28); and the Preacher folds it into the whole duty of man — *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). Yochanan (John) supplies the filter that exposes every lawless counterfeit: *hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:3-4). The fear that begins knowledge is the same reverence that keeps the Torah, never the religion that despises instruction. The restored witness says it near-verbatim and ties it to the commandments: *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Sirach 1:14); *If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26). From its first principle the book binds knowledge to the fear of Yahuah, and the fear of Yahuah to the keeping of His word.',
       sv.verse_id, ev.verse_id, 'extras', 28000
  FROM _s304_pr01_lookup sv, _s304_pr01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-1-hear-the-instruction-of-thy-father-forsake-not-the-law-of-thy-mother',
       E'Hear the instruction of thy father, forsake not the law of thy mother',
       E'The first counsel after the motto turns to the home: *My son, hear the instruction of thy father, and forsake not the law of thy mother: for they shall be an ornament of grace unto thy head, and chains about thy neck* (Proverbs 1:8-9). The mother''s teaching is named her *law* — her torah — and the instruction is not a burden but an ornament of grace, a chain of honour about the neck. This is the fifth word of the Ten, given at Sinai with a promise: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). Sha''ul (Paul) affirms it unbroken in the new covenant assembly: *Honour thy father and mother; (which is the first commandment with promise;) that it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:2-3). The Torah taught at the family hearth is the covenant inheritance passed from parent to child — never abolished, but the very ornament that crowns the son who keeps it.',
       sv.verse_id, ev.verse_id, 'free', 28003
  FROM _s304_pr01_lookup sv, _s304_pr01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-1-if-sinners-entice-thee-consent-thou-not',
       E'If sinners entice thee, consent thou not — the snare recoils on the sower',
       E'The father warns the son off the first and oldest enticement — the company of the violent and greedy: *My son, if sinners entice thee, consent thou not* (Proverbs 1:10). They promise blood and spoil — *Come with us, let us lay wait for blood... we shall fill our houses with spoil* (Proverbs 1:11-13) — but the trap they set closes upon themselves: *And they lay wait for their own blood; they lurk privily for their own lives. So are the ways of every one that is greedy of gain; which taketh away the life of the owners thereof* (Proverbs 1:18-19). This is the snare-recoils-on-itself law sung in the Psalms: *He made a pit, and digged it, and is fallen into the ditch which he made. His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:15-16). Sha''ul (Paul) names the principle outright: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The way of violence devours its own walkers; the gain that takes another''s life takes the greedy man''s own. This is the two-ways read by conduct — consent not, walk not in their path, and refrain thy foot from the way that ends in its own ditch.',
       sv.verse_id, ev.verse_id, 'free', 28006
  FROM _s304_pr01_lookup sv, _s304_pr01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=1 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-1-wisdom-crieth-in-the-streets',
       E'Wisdom crieth in the streets — I will pour out my spirit',
       E'Here Wisdom takes her own voice for the first time in the book — the figure who in chapter 8 is revealed as the Father''s delight before the world was (*Yahuah (LORD) possessed me in the beginning of his way, before his works of old* — Proverbs 8:22): *Wisdom crieth without; she uttereth her voice in the streets: she crieth in the chief place of concourse, in the openings of the gates* (Proverbs 1:20-21). She does not hide in a temple but calls aloud in the open, and to those who will turn at her reproof she makes a promise: *Turn you at my reproof: behold, I will pour out my spirit unto you, I will make known my words unto you* (Proverbs 1:23). That outpouring is the very word Yahuah speaks through Joel: *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28) — and it is kept at Shavuot, when Kepha (Peter) declares it fulfilled: *And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh* (Acts 2:17). The restored witness sees the same seeking, crying Wisdom: *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her* (Wisdom of Solomon 6:12); *For she goes about seeking such as are worthy of her... and meeteth them in every thought* (Wisdom of Solomon 6:16). Wisdom cries, pours out her spirit, and is found by all who seek her early — the failure is never her silence but the simple ones'' refusal to turn.',
       sv.verse_id, ev.verse_id, 'extras', 28009
  FROM _s304_pr01_lookup sv, _s304_pr01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=1 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-1-they-hated-knowledge-and-the-house-left-desolate',
       E'They hated knowledge — the rejection of Wisdom and the house left desolate',
       E'The cry of Wisdom is met with refusal, and the chapter turns to the calamity of those who will not turn: *Because I have called, and ye refused; I have stretched out my hand, and no man regarded; but ye have set at nought all my counsel, and would none of my reproof* (Proverbs 1:24-25). Her warning is severe — *I also will laugh at your calamity; I will mock when your fear cometh* (Proverbs 1:26) — and the root of the ruin is named: *For that they hated knowledge, and did not choose the fear of Yahuah (LORD)* (Proverbs 1:29). This is exactly the rejection Yahusha (Jesus) laments over the city, the stretched-out hand refused by the unwilling: *O Jerusalem, Jerusalem... how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not! Behold, your house is left unto you desolate* (Matthew 23:37-38). And Luke names the speaker who cried in the streets outright — *Therefore also said the wisdom of Elohim (God), I will send them prophets and apostles, and some of them they shall slay and persecute* (Luke 11:49). The crying Wisdom of Proverbs 1 is the Wisdom of Elohim whose prophets are slain, whose call is refused, whose house is left desolate. Yet the chapter does not close on judgment but on the one safe answer to the cry: *But whoso hearkeneth unto me shall dwell safely, and shall be quiet from fear of evil* (Proverbs 1:33). To hear Wisdom is to dwell safe; to hate knowledge is to inherit the empty house.',
       sv.verse_id, ev.verse_id, 'free', 28012
  FROM _s304_pr01_lookup sv, _s304_pr01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=1 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10) — the twin of 1:7; the motto at the head and the hinge of the book.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a good understanding have all they that do his commandments* (Psalm 111:10) — the fear of 1:7 defined by conduct; the doers of the commandments are the understanding.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28) — after the long search, wisdom is given to the man who fears Yahuah and turns from evil (1:7).'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13) — the Preacher folds the motto of 1:7 into one charge: the fear IS the commandment-keeping.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*hereby we do know that we know him, if we keep his commandments* (1 John 2:3) — the filter for 1:7; the knowledge of Him is proven by keeping His commandments.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:4) — the fools who despise instruction (1:7); the lawless claim to knowledge is the lie the motto forbids.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Sirach 1:14) — the restored witness carries the motto of 1:7 near-verbatim.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26) — the restored witness binds the motto of 1:7 to the Torah outright.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-the-fear-of-yahuah-is-the-beginning-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Honour thy father and thy mother: that thy days may be long upon the land* (Exodus 20:12) — the instruction and the law of the mother (1:8) is the fifth word given at Sinai.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-hear-the-instruction-of-thy-father-forsake-not-the-law-of-thy-mother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2) — Sha''ul affirms the Torah behind 1:8; the home-taught commandment unbroken in the new covenant.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-hear-the-instruction-of-thy-father-forsake-not-the-law-of-thy-mother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15) — the blood-lust of 1:18 recoils; the snare closes on its own setter.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-if-sinners-entice-thee-consent-thou-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16) — the harm devised in 1:18 falls back on the head that devised it.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-if-sinners-entice-thee-consent-thou-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — the verdict on the greedy of gain (1:19); the seed of violence is reaped by its sower.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-if-sinners-entice-thee-consent-thou-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Wisdom is glorious, and never fadeth away... found of such as seek her* (Wisdom of Solomon 6:12) — the crying Wisdom of 1:20 shows herself to all who seek her.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=20
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-wisdom-crieth-in-the-streets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*she goes about seeking such as are worthy of her... and meeteth them in every thought* (Wisdom of Solomon 6:16) — the Wisdom who cries in the streets (1:20) walks seeking, not waited upon in a temple.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=20
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-wisdom-crieth-in-the-streets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28) — Wisdom''s promise of 1:23 is the very word Yahuah speaks through Joel.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=23
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-wisdom-crieth-in-the-streets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will pour out of my Spirit upon all flesh* (Acts 2:17) — Wisdom''s promise (1:23) kept at Shavuot, the feast of the firstfruits of the Spirit.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=23
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-wisdom-crieth-in-the-streets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Therefore also said the wisdom of Elohim (God), I will send them prophets and apostles* (Luke 11:49) — Luke names the speaker who cried in the streets (1:20): the Wisdom of Elohim whose prophets are slain.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=20
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-they-hated-knowledge-and-the-house-left-desolate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*how often would I have gathered thy children together... and ye would not!* (Matthew 23:37) — the refused call and stretched-out hand of 1:24, lamented by Yahusha over the city.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=24
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-they-hated-knowledge-and-the-house-left-desolate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Behold, your house is left unto you desolate* (Matthew 23:38) — the calamity Wisdom warned of (1:29) falls as the empty house; rejecting the fear of Yahuah ends in desolation.'
  FROM cross_reference_threads t
  JOIN _s304_pr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=1 AND sv.verse_number=29
  JOIN _s304_pr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-1-they-hated-knowledge-and-the-house-left-desolate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
