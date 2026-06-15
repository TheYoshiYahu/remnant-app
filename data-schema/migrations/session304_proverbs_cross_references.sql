-- =====================================================================
-- Session 304 — Proverbs FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/proverbs-xref-wt/data-schema/migrations/session304_proverbs_cross_references.sql
-- =====================================================================

\echo 'session304 — Proverbs cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_proverbs_3.sql (Proverbs 3) -----
-- Chapter: Proverbs 3 — A FRAMEWORK HEAVYWEIGHT. The father-to-son wisdom charge that fuses
--   Torah-on-the-heart (3:1), mercy-and-truth on the tables of the heart (3:3-4), the keystone
--   trust-not-the-flesh verse (3:5-6), the firstfruits/appointed-giving (3:9-10), the Father's
--   chastening quoted at length in Hebrews (3:11-12), Wisdom as the tree of life (3:18), Wisdom
--   as the agent/instrument of creation (3:19, anticipating ch 8 and the Formed Son), and the
--   much-cited grace-to-the-lowly verse (3:34, quoted in BOTH James and 1 Peter).
-- Tag: pr03   Session prefix: s304   Temp view: _s304_pr03_lookup
-- Sort band: base 28050, step 3 -> 28050, 28053, 28056, 28059, 28062, 28065, 28068, 28071 (8 threads)
-- Source of EVERY row: 'canon','proverbs',3,v
-- NOTE: existing FROM-Hebrews thread 'hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3'
--   is the REVERSE direction; THIS chapter's source thread is distinct ('proverbs-3-whom-yahuah-loveth-...').
--
-- Proverbs 3 coverage:
--   ★ v.1-2 (My son, forget not my law; but let thine heart keep my commandments... length of days, and long life, and peace)
--        NT:     1 John 2:3-4 (hereby we do know that we know him, if we keep his commandments) — THREAD 1 (the keep-commandments filter)
--        Extras: none warranted distinct (the Torah-on-the-heart witness carried by Sirach 2 in THREAD 3; Torah-keeping covered by Tanakh laterals here)
--        Tanakh: ★ Jeremiah 31:33 (I will put my law in their inward parts, and write it in their hearts); Ezekiel 36:27 (I will put my spirit within you, and cause you to walk in my statutes); Deuteronomy 6:6 (these words... shall be in thine heart) — THREAD 1 (load-bearing: Torah-on-the-heart, the new-covenant root)
--   ★ v.3-4 (Let not mercy and truth forsake thee... write them upon the table of thine heart: So shalt thou find favour... in the sight of Elohim and man)
--        NT:     2 Corinthians 3:3 (written... in fleshy tables of the heart); Luke 2:52 (Yahusha increased in wisdom and stature, and in favour with Elohim and man) — THREAD 2 (tables-of-the-heart + the boy who found favour)
--        Extras: none warranted distinct (chesed-and-emeth carried by Jeremiah/2 Cor; no closer clean extras witness than the trust witnesses gathered elsewhere)
--        Tanakh: Jeremiah 31:33 (carried in THREAD 1, the same writing-on-the-heart) — cross-referenced, not duplicated here
--   ★★ v.5-6 (Trust in Yahuah with all thine heart; and lean not unto thine own understanding. In all thy ways acknowledge him, and he shall direct thy paths) — KEYSTONE
--        NT:     1 Corinthians 1:19 (I will destroy the wisdom of the wise); 1 Corinthians 1:25 (the foolishness of God is wiser than men) — THREAD 3 (the wisdom-of-this-world confounded)
--        Extras: Sirach 2:6 (Believe in him, and he will help you; order your way aright, and trust in him); Wisdom of Solomon 9:13-14 (what man... can know the counsel of God?... our devices are but uncertain) — THREAD 3 (lean-not-on-own-understanding)
--        Tanakh: ★ Isaiah 55:8-9 (my thoughts are not your thoughts); Jeremiah 9:23-24 (let not the wise man glory in his wisdom... but... that he understandeth and knoweth me); Jeremiah 10:23 (the way of man is not in himself: it is not in man... to direct his steps) — THREAD 3 (load-bearing keystone)
--   ★ v.7 (Be not wise in thine own eyes: fear Yahuah, and depart from evil)
--        NT:     Romans 12:16 (Be not wise in your own conceits) — THREAD 3 (member; same lean-not-on-the-flesh)
--        Extras: none warranted distinct
--        Tanakh: ★ Isaiah 5:21 (Woe unto them that are wise in their own eyes, and prudent in their own sight) — THREAD 3 (member; verbatim parallel)
--   ★ v.9-10 (Honour Yahuah with thy substance, and with the firstfruits of all thine increase: So shall thy barns be filled with plenty)
--        NT:     Malachi 3:10 [Tanakh] (Bring ye all the tithes into the storehouse... I will... open you the windows of heaven); 2 Corinthians 9:7 (God loveth a cheerful giver); Matthew 6:33 (seek ye first the kingdom... and all these things shall be added) — THREAD 4
--        Extras: Sirach 35:8-9 (Give God his honour... diminish not the firstfruits... dedicate your tithes with gladness) — THREAD 4
--        Tanakh: ★ Exodus 23:19 (The first of the firstfruits of thy land thou shalt bring into the house of Yahuah); Malachi 3:10 — THREAD 4 (load-bearing: appointed-giving, Torah-affirmed)
--   ★★ v.11-12 (My son, despise not the chastening of Yahuah... For whom Yahuah loveth he correcteth; even as a father the son in whom he delighteth) — KEYSTONE (quoted at length in Hebrews)
--        NT:     Hebrews 12:5-6 (verbatim: My son, despise not thou the chastening of the Lord... For whom the Lord loveth he chasteneth); Revelation 3:19 (As many as I love, I rebuke and chasten) — THREAD 5
--        Extras: Sirach 2:5 (gold is tried in the fire, and acceptable men in the furnace of adversity) — THREAD 5
--        Tanakh: ★ Deuteronomy 8:5 (as a man chasteneth his son, so Yahuah Elohayka chasteneth thee); Job 5:17 (happy is the man whom Elohim correcteth: therefore despise not... the chastening of the Almighty) — THREAD 5 (load-bearing)
--   ★★ v.18 (She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her)
--        NT:     Revelation 2:7 (the tree of life, which is in the midst of the paradise of Elohim); Revelation 22:2 (the tree of life... the leaves... for the healing of the nations); Revelation 22:14 (right to the tree of life) — THREAD 6
--        Extras: none warranted distinct (the tree-of-life image carried by Genesis/Revelation; Wisdom-as-life witnesses gathered in THREAD 3/7)
--        Tanakh: ★ Genesis 2:9 (the tree of life also in the midst of the garden); Genesis 3:22 (lest he... take also of the tree of life, and eat, and live for ever) — THREAD 6 (load-bearing: Wisdom is the Eden tree of life regained)
--   ★ v.19-20 (Yahuah by wisdom hath founded the earth; by understanding hath he established the heavens. By his knowledge the depths are broken up)
--        NT:     John 1:1-3 (In the beginning was the Word... All things were made by him); Colossians 1:16 (by him were all things created) — THREAD 7 (Formed/Formless: Wisdom = the expressed Word the Father created BY)
--        Extras: Wisdom of Solomon 9:9 (wisdom was with you... and was present when you madest the world) — THREAD 7
--        Tanakh: ★ Psalm 33:6 (By the word of Yahuah were the heavens made); Jeremiah 10:12 (he hath established the world by his wisdom, and hath stretched out the heavens by his discretion) — THREAD 7 (load-bearing)
--   ★ v.34 (Surely he scorneth the scorners: but he giveth grace unto the lowly)
--        NT:     James 4:6 (God resisteth the proud, but giveth grace unto the humble); 1 Peter 5:5 (God resisteth the proud, and giveth grace to the humble); Matthew 23:12 (whosoever shall humble himself shall be exalted) — THREAD 8 (quoted in BOTH James and 1 Peter)
--        Extras: none warranted distinct (the grace-to-the-humble verse carried whole by James/1 Peter; clean enough without an extras member)
--        Tanakh: ★ Isaiah 57:15 (I dwell in the high and holy place, with him also that is of a contrite and humble spirit) — THREAD 8 (load-bearing)
--   v.8,13-17,21-33,35 — carried within the threads above (8 fruit of 7; 13-17 the worth of wisdom carried into the tree-of-life thread; 21-33 the way kept safe / dealings with the neighbour, no standalone thread warranted; 35 the wise inherit glory carried into the grace-to-lowly contrast)
--
-- Threads (slug — target libraries):
--   1. proverbs-3-forget-not-my-torah-but-let-thine-heart-keep-my-commandments — Tanakh (Jeremiah, Ezekiel, Deuteronomy) + NT (1 John) [free] (★ Torah-on-the-heart, new-covenant root)
--   2. proverbs-3-bind-mercy-and-truth-write-them-upon-the-table-of-thine-heart — NT (2 Corinthians, Luke) [free] (★ tables-of-the-heart; favour with Elohim and man = the boy Yahusha)
--   3. proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding — Tanakh (Isaiah, Jeremiah) + NT (1 Corinthians, Romans) + Extras (Sirach, Wisdom of Solomon) [extras] (★★ KEYSTONE trust-not-the-flesh)
--   4. proverbs-3-honour-yahuah-with-thy-substance-and-the-firstfruits — Tanakh (Exodus, Malachi) + NT (2 Corinthians, Matthew) + Extras (Sirach) [extras] (★ firstfruits/appointed-giving, Torah-affirmed)
--   5. proverbs-3-whom-yahuah-loveth-he-correcteth-the-fathers-chastening — Tanakh (Deuteronomy, Job) + NT (Hebrews, Revelation) + Extras (Sirach) [extras] (★★ KEYSTONE Father's chastening, quoted in Hebrews)
--   6. proverbs-3-she-is-a-tree-of-life-to-them-that-lay-hold-upon-her — Tanakh (Genesis) + NT (Revelation) [free] (★★ Wisdom = the Eden tree of life regained)
--   7. proverbs-3-yahuah-by-wisdom-hath-founded-the-earth — Tanakh (Psalm, Jeremiah) + NT (John, Colossians) + Extras (Wisdom of Solomon) [extras] (★ Wisdom as agent of creation; Formed/Formless lens)
--   8. proverbs-3-he-giveth-grace-unto-the-lowly — Tanakh (Isaiah) + NT (James, 1 Peter, Matthew) [free] (★ grace-to-the-humble, quoted in BOTH James and 1 Peter)
--
-- Framing notes:
--   ★★ KEYSTONE TRUST (THREAD 3): *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (3:5). The whole framework's posture against the wisdom-of-this-world — the flesh's own understanding set aside for Yahuah's direction. Isaiah names the gulf (*my thoughts are not your thoughts*, 55:8), Jeremiah the only boast (*let him that glorieth glory in this, that he understandeth and knoweth me*, 9:24) and the helplessness of self-direction (*the way of man is not in himself*, 10:23), and Sha'ul (Paul) brings it forward to the cross that confounds the wise (1 Cor 1:19,25). v.7 (*Be not wise in thine own eyes*) and Isaiah 5:21 / Romans 12:16 fold in as the same lean-not-on-the-flesh.
--   ★★ KEYSTONE CHASTENING (THREAD 5): *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (3:12) — covenant SONSHIP, the Father disciplining a true son, never wrath on a cast-off. Hebrews 12:5-6 quotes it verbatim; Deuteronomy 8:5 is the Torah root (*as a man chasteneth his son*); Revelation 3:19 the Formed Son's own word (*As many as I love, I rebuke and chasten*). THIS is the FROM-Proverbs source thread, distinct from the existing FROM-Hebrews thread.
--   ★ FORMED/FORMLESS (THREAD 7): *Yahuah (LORD) by wisdom hath founded the earth* (3:19) — Wisdom is the instrument/agent BY which the Father created, anticipating ch 8:22-31 and the Formed Son. John 1:3 (*All things were made by him*) and Colossians 1:16 (*by him were all things created*) carry it forward to the Word/Son who is the agent of creation — the expressed Word the Father created BY, not a co-equal second person, nor a created thing. Psalm 33:6 and Jeremiah 10:12 keep the Tanakh ground (*By the word of Yahuah were the heavens made*).
--   EXTRAS: Sirach DOUBLE-WRITTEN edition 'apocrypha' + book 'ecclesiasticus'; Wisdom of Solomon DOUBLE-WRITTEN edition 'apocrypha' + book 'the-wisdom-of-solomon'. Sirach 2:5-6 (furnace + trust) serves both the trust and the chastening threads cleanly; Sirach 35:8-9 the firstfruits; Wisdom 9:9 the creation-by-wisdom, 9:13-14 the uncertainty of mortal devices. All clean witnesses.

CREATE TEMP VIEW _s304_pr03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Forget not my torah; let thine heart keep my commandments (Torah-on-the-heart)
    ('canon','proverbs',3,1,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The father''s charge — *forget not my law; but let thine heart keep my commandments* (Proverbs 3:1) — is the very thing the new covenant promises to do in every son: *I will put my law in their inward parts, and write it in their hearts*. The Torah is not set aside but moved inward; the heart that keeps the commandments is the heart the covenant writes upon.'),
    ('canon','proverbs',3,1,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). To *let thine heart keep my commandments* (Proverbs 3:1) is exactly what the Spirit is given to accomplish: *I will put my spirit within you, and cause you to walk in my statutes*. The Ruach and the Torah are inseparable — the new heart is the keeping heart, walking in the statutes, never freed from them.'),
    ('canon','proverbs',3,1,'canon','deuteronomy',6,6,'free',
      E'*And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6). The wisdom-father echoes Moshe (Moses): *forget not my law; but let thine heart keep my commandments* (Proverbs 3:1) is the Shema''s own demand — *these words, which I command thee this day, shall be in thine heart*. The commandments are to live in the heart, taught to the children, bound and written, not stored away as a dead letter.'),
    ('canon','proverbs',3,1,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments* (1 John 2:3). The charge to *let thine heart keep my commandments* (Proverbs 3:1) is the same test Yochanan (John) lays down — the proof of knowing Him is keeping His commandments. *He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4); the wisdom of Proverbs 3 and the filter of 1 John are one: love and knowledge are shown by the kept commandment.'),

    -- THREAD 2: Mercy and truth — write them upon the table of thine heart (tables of the heart; favour)
    ('canon','proverbs',3,3,'canon','2-corinthians',3,3,'free',
      E'*Forasmuch as ye are manifestly declared to be the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). The father''s image — *bind them about thy neck; write them upon the table of thine heart* (Proverbs 3:3) — is taken up whole by Sha''ul (Paul): the Spirit writes *not in tables of stone, but in fleshy tables of the heart*. The same Torah Jeremiah promised on the inward parts is the writing on the heart''s table; the new covenant is the old law inscribed in a new place.'),
    ('canon','proverbs',3,4,'canon','luke',2,52,'free',
      E'*And Yahusha (Jesus) increased in wisdom and stature, and in favour with Elohim (God) and man* (Luke 2:52). The fruit of mercy and truth kept — *So shalt thou find favour and good understanding in the sight of Elohim (God) and man* (Proverbs 3:4) — is fulfilled to the letter in the boy Yahusha (Jesus): he *increased in wisdom and stature, and in favour with Elohim (God) and man*. The Formed Son walks the very path the wisdom-father sets before the son, growing in the favour of Elohim and man that mercy and truth secure.'),

    -- THREAD 3: KEYSTONE — Trust in Yahuah; lean not to thine own understanding
    ('canon','proverbs',3,5,'canon','isaiah',55,8,'free',
      E'*For my thoughts are not your thoughts, neither are your ways my ways, saith Yahuah (LORD)* (Isaiah 55:8). To *lean not unto thine own understanding* (Proverbs 3:5) is to bow before the gulf Isaiah names: *my thoughts are not your thoughts, neither are your ways my ways*. The flesh''s understanding cannot reach Yahuah''s; the trust that leans not on itself is the only path that does not stumble.'),
    ('canon','proverbs',3,5,'canon','isaiah',55,9,'free',
      E'*For as the heavens are higher than the earth, so are my ways higher than your ways, and my thoughts than your thoughts* (Isaiah 55:9). The reason for *lean not unto thine own understanding* (Proverbs 3:5) is the measureless height of Yahuah''s mind: *as the heavens are higher than the earth, so are my ways higher than your ways*. To trust with all the heart is to set one''s own low understanding beneath the high thoughts of Yahuah and let Him direct the paths.'),
    ('canon','proverbs',3,6,'canon','jeremiah',10,23,'free',
      E'*O Yahuah (LORD), I know that the way of man is not in himself: it is not in man that walketh to direct his steps* (Jeremiah 10:23). *In all thy ways acknowledge him, and he shall direct thy paths* (Proverbs 3:6) rests on the very confession Jeremiah makes: *the way of man is not in himself: it is not in man that walketh to direct his steps*. Man cannot direct his own steps; the acknowledged Yahuah directs the paths — the path-making belongs to Him, not to the leaning of one''s own understanding.'),
    ('canon','proverbs',3,5,'canon','jeremiah',9,23,'free',
      E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches* (Jeremiah 9:23). To *lean not unto thine own understanding* (Proverbs 3:5) is to refuse the glorying Jeremiah forbids — the wise man in his wisdom, the mighty in his might. The flesh''s self-confidence is exactly what the trust of Proverbs 3 lays down.'),
    ('canon','proverbs',3,5,'canon','jeremiah',9,24,'free',
      E'*But let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness, in the earth: for in these things I delight, saith Yahuah (LORD)* (Jeremiah 9:24). The positive of *Trust in Yahuah (LORD) with all thine heart* (Proverbs 3:5) is Jeremiah''s one permitted boast: *that he understandeth and knoweth me*. The heart that trusts Yahuah glories not in its own understanding but in the knowing of Him.'),
    ('canon','proverbs',3,5,'canon','1-corinthians',1,19,'free',
      E'*For it is written, I will destroy the wisdom of the wise, and will bring to nothing the understanding of the prudent* (1 Corinthians 1:19). The warning to *lean not unto thine own understanding* (Proverbs 3:5) is carried forward to the cross, where Yahuah *will destroy the wisdom of the wise, and... bring to nothing the understanding of the prudent*. The understanding the flesh leans on is the very thing brought to nothing; the trust of Proverbs 3 is vindicated against the wisdom of this world.'),
    ('canon','proverbs',3,5,'canon','1-corinthians',1,25,'free',
      E'*Because the foolishness of Elohim (God) is wiser than men; and the weakness of Elohim (God) is stronger than men* (1 Corinthians 1:25). To trust Yahuah and not one''s *own understanding* (Proverbs 3:5) is to know that *the foolishness of Elohim (God) is wiser than men* — what the flesh calls folly outweighs all its own wisdom. The heart that leans on Yahuah leans on a wisdom no human understanding can match.'),
    ('canon','proverbs',3,7,'canon','isaiah',5,21,'free',
      E'*Woe unto them that are wise in their own eyes, and prudent in their own sight!* (Isaiah 5:21). *Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil* (Proverbs 3:7) is the wisdom against which Isaiah pronounces woe: *Woe unto them that are wise in their own eyes, and prudent in their own sight*. The self-wise are under the prophet''s lament; the fear of Yahuah is the only true sight.'),
    ('canon','proverbs',3,7,'canon','romans',12,16,'free',
      E'*Be of the same mind one toward another. Mind not high things, but condescend to men of low estate. Be not wise in your own conceits* (Romans 12:16). Sha''ul (Paul) repeats the proverb almost word for word: *Be not wise in thine own eyes* (Proverbs 3:7) becomes *Be not wise in your own conceits*. The lowly mind that fears Yahuah and departs from evil is the same mind that minds not high things — self-wisdom set down in both.'),

    -- THREAD 4: Honour Yahuah with thy substance and the firstfruits (appointed-giving)
    ('canon','proverbs',3,9,'canon','exodus',23,19,'free',
      E'*The first of the firstfruits of thy land thou shalt bring into the house of Yahuah Elohayka (the LORD thy God). Thou shalt not seethe a kid in his mother''s milk* (Exodus 23:19). To *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* (Proverbs 3:9) is the Torah''s own command of firstfruits: *The first of the firstfruits of thy land thou shalt bring into the house of Yahuah*. The proverb does not invent a new piety but presses the appointed giving — the first and best brought to His house.'),
    ('canon','proverbs',3,10,'canon','malachi',3,10,'free',
      E'*Bring ye all the tithes into the storehouse, that there may be meat in mine house, and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it* (Malachi 3:10). The promise that *thy barns be filled with plenty* (Proverbs 3:10) is Malachi''s open windows of heaven: bring the tithes and *prove me now... if I will not open you the windows of heaven, and pour you out a blessing*. Honouring Yahuah with the substance opens the storehouse of heaven over the giver.'),
    ('canon','proverbs',3,9,'canon','2-corinthians',9,7,'free',
      E'*Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). The honouring of Yahuah *with thy substance* (Proverbs 3:9) is carried forward to the heart of the giver: *Elohim (God) loveth a cheerful giver*. The firstfruits brought in honour are brought gladly, purposed in the heart, not grudgingly.'),
    ('canon','proverbs',3,9,'canon','matthew',6,33,'free',
      E'*But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33). To *Honour Yahuah (LORD) with thy substance, and with the firstfruits* (Proverbs 3:9) is to seek Him first — and the *barns... filled with plenty* (Proverbs 3:10) is the *all these things shall be added unto you*. Put Yahuah and His firstfruits first, and the increase follows; the order of the proverb is the order of the kingdom.'),
    ('canon','proverbs',3,9,'apocrypha','ecclesiasticus',35,8,'extras',
      E'*Give Yahuah (God) his honour with a good eye, and diminish not the firstfruits of yours hands* (Sirach 35:8). The restored witness keeps the proverb exactly: *Honour Yahuah (LORD) with thy substance, and with the firstfruits* (Proverbs 3:9) is *Give Yahuah (God) his honour with a good eye, and diminish not the firstfruits of yours hands*. The firstfruits are not to be cut short; the honour of Yahuah is shown in the unstinted giving of the first and best.'),

    -- THREAD 5: KEYSTONE — Whom Yahuah loveth he correcteth (the Father's chastening)
    ('canon','proverbs',3,11,'canon','hebrews',12,5,'free',
      E'*And ye have forgotten the exhortation which speaketh unto you as unto children, My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him* (Hebrews 12:5). The proverb is quoted verbatim as the very word the sons had forgotten: *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction* (Proverbs 3:11) is cited word for word — *My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him*. The wisdom-father''s charge becomes the apostle''s exhortation, unchanged.'),
    ('canon','proverbs',3,12,'canon','hebrews',12,6,'free',
      E'*For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6). The keystone — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:12) — is quoted as the ground of covenant sonship: *whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth*. The chastening is the mark of a received son, not of wrath; the Father corrects the son in whom He delights.'),
    ('canon','proverbs',3,12,'canon','revelation',3,19,'free',
      E'*As many as I love, I rebuke and chasten: be zealous therefore, and repent* (Revelation 3:19). The Formed Son speaks the proverb in His own voice: *whom Yahuah (LORD) loveth he correcteth* (Proverbs 3:12) is His own *As many as I love, I rebuke and chasten*. The rebuke is the proof of His love, calling the loved to zeal and repentance — the same delighting Father correcting the son.'),
    ('canon','proverbs',3,12,'canon','deuteronomy',8,5,'free',
      E'*Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5). The Torah root of *even as a father the son in whom he delighteth* (Proverbs 3:12) is Moshe''s (Moses'') word in the wilderness: *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee*. The forty-years discipline of the son Yashar''el (Israel) is the same fatherly correction the proverb sets before the son.'),
    ('canon','proverbs',3,11,'canon','job',5,17,'free',
      E'*Behold, happy is the man whom Elohim (God) correcteth: therefore despise not thou the chastening of the Almighty* (Job 5:17). The very command of the proverb — *despise not the chastening of Yahuah (LORD)* (Proverbs 3:11) — is Eliphaz''s counsel to Job: *despise not thou the chastening of the Almighty*, for *happy is the man whom Elohim (God) correcteth*. The corrected man is the happy man; the chastening is a blessing not to be despised.'),
    ('canon','proverbs',3,11,'apocrypha','ecclesiasticus',2,5,'extras',
      E'*For gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). The restored witness gives the reason not to *despise... the chastening* (Proverbs 3:11): *gold is tried in the fire, and acceptable men in the furnace of adversity*. The correction is the refining furnace that proves the son acceptable, as gold is proved in the fire — adversity is the Father''s assaying, not His rejection.'),

    -- THREAD 6: She is a tree of life to them that lay hold upon her (Wisdom = Eden tree regained)
    ('canon','proverbs',3,18,'canon','genesis',2,9,'free',
      E'*And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil* (Genesis 2:9). Wisdom is named with the very tree of Eden: *She is a tree of life to them that lay hold upon her* (Proverbs 3:18) reaches back to *the tree of life also in the midst of the garden*. To lay hold on Wisdom is to lay hold on the life Eden held — the tree of life set in the garden''s midst.'),
    ('canon','proverbs',3,18,'canon','genesis',3,22,'free',
      E'*And Yahuah Elohim (the LORD God) said, Behold, the man is become as one of us, to know good and evil: and now, lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22). The tree Adam was barred from — *lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* — is the tree Wisdom restores: *She is a tree of life to them that lay hold upon her* (Proverbs 3:18). What the flaming sword guarded, Wisdom gives back to the one who retains her.'),
    ('canon','proverbs',3,18,'canon','revelation',2,7,'free',
      E'*He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The tree of life of *She is a tree of life to them that lay hold upon her* (Proverbs 3:18) is promised again to the overcomer: *I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)*. The Wisdom laid hold of in Proverbs is the tree eaten in the paradise restored.'),
    ('canon','proverbs',3,18,'canon','revelation',22,2,'free',
      E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The tree of life Wisdom is — *a tree of life to them that lay hold upon her* (Proverbs 3:18) — comes to its consummation by the river of the throne: *the tree of life... and the leaves of the tree were for the healing of the nations*. From the garden, through Wisdom, to the New Jerusalem, the tree of life is one.'),
    ('canon','proverbs',3,18,'canon','revelation',22,14,'free',
      E'*Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The happiness of *happy is every one that retaineth her* (Proverbs 3:18) is the blessing of those who keep the commandments and so gain *right to the tree of life*. Laying hold on Wisdom and doing His commandments are one walk; both give right to the tree of life and entrance to the city.'),

    -- THREAD 7: Yahuah by wisdom hath founded the earth (Wisdom as agent of creation; Formed/Formless)
    ('canon','proverbs',3,19,'canon','psalms',33,6,'free',
      E'*By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6). That *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens* (Proverbs 3:19) is sung by the psalmist as creation by the spoken word: *By the word of Yahuah (LORD) were the heavens made*. The wisdom that founds the earth is the expressed Word by which the heavens were made — the instrument of the Father''s creating.'),
    ('canon','proverbs',3,19,'canon','jeremiah',10,12,'free',
      E'*He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12). Jeremiah repeats the proverb almost verbatim: *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens* (Proverbs 3:19) is *he hath established the world by his wisdom, and hath stretched out the heavens by his discretion*. The earth is founded and the heavens stretched out by Wisdom — the same agent of creation in both books.'),
    ('canon','proverbs',3,19,'canon','john',1,3,'free',
      E'*All things were made by him; and without him was not any thing made that was made* (John 1:3). The Wisdom *by* which Yahuah *founded the earth* (Proverbs 3:19) is the Word of whom Yochanan (John) writes: *All things were made by him; and without him was not any thing made that was made*. The Wisdom of Proverbs 3 — anticipating the Wisdom personified in chapter 8 — is the Formed Word, the expressed One the Father created BY; not a co-equal second person, nor a created thing, but the agent of all that was made.'),
    ('canon','proverbs',3,19,'canon','colossians',1,16,'free',
      E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him* (Colossians 1:16). That Yahuah founded the earth *by wisdom* (Proverbs 3:19) is carried to the Formed Son: *by him were all things created... all things were created by him, and for him*. He is the image of the invisible Elohim, the Word drawn from the Formless, the One through whom the Father made the heavens and the earth.'),
    ('canon','proverbs',3,19,'apocrypha','the-wisdom-of-solomon',9,9,'extras',
      E'*And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments* (Wisdom of Solomon 9:9). The restored witness sees the same Wisdom at the founding of the earth: *Yahuah (LORD) by wisdom hath founded the earth* (Proverbs 3:19) is *wisdom... was present when you madest the world*. Wisdom stood with the Father at creation, knowing His works — the expressed agent through whom the world was made.'),

    -- THREAD 8: He giveth grace unto the lowly (quoted in BOTH James and 1 Peter)
    ('canon','proverbs',3,34,'canon','james',4,6,'free',
      E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). Ya''aqov (James) quotes the proverb as scripture: *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34) is cited — *Elohim (God) resisteth the proud, but giveth grace unto the humble*. The scorned scorner is the proud whom Elohim resists; the lowly is the humble to whom grace is given.'),
    ('canon','proverbs',3,34,'canon','1-peter',5,5,'free',
      E'*Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Kepha (Peter) quotes the same proverb as Ya''aqov (James): *he giveth grace unto the lowly* (Proverbs 3:34) is *Elohim (God) resisteth the proud, and giveth grace to the humble*. Both apostles reach back to this one verse — the clothing of humility draws the very grace the proverb promises the lowly.'),
    ('canon','proverbs',3,34,'canon','matthew',23,12,'free',
      E'*And whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted* (Matthew 23:12). The two ways of *he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34) are Yahusha''s (Jesus'') own law of the kingdom: *whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted*. The scorner who exalts himself is abased; the lowly who humbles himself is given grace and exalted.'),
    ('canon','proverbs',3,34,'canon','isaiah',57,15,'free',
      E'*For thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble, and to revive the heart of the contrite ones* (Isaiah 57:15). The grace given *unto the lowly* (Proverbs 3:34) is Isaiah''s dwelling of the Most High with the contrite: the high and lofty One dwells *with him also that is of a contrite and humble spirit*. The lowly are not scorned but housed with the Holy One Himself, their spirit revived.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-3-forget-not-my-torah-but-let-thine-heart-keep-my-commandments',
       E'Forget not my torah — but let thine heart keep my commandments',
       E'The wisdom-father opens his charge with the Torah set in the heart: *My son, forget not my law; but let thine heart keep my commandments: For length of days, and long life, and peace, shall they add to thee* (Proverbs 3:1-2). The commandments are not a yoke to be shed but a treasure to be kept in the heart, and their fruit is length of days and peace. This is the very root of the new covenant. Moshe (Moses) had already demanded it in the Shema: *And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6). Jeremiah promised Yahuah would do it Himself: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Ezekiel named the Spirit as the means: *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Torah is never set aside — it is moved inward, written on the heart, kept by the Spirit. And Yochanan (John) lays down the same proof: *hereby we do know that we know him, if we keep his commandments* (1 John 2:3), for *He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). From Proverbs to the prophets to the apostle, the heart that knows Yahuah is the heart that keeps His commandments.',
       sv.verse_id, ev.verse_id, 'free', 28050
  FROM _s304_pr03_lookup sv, _s304_pr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-3-bind-mercy-and-truth-write-them-upon-the-table-of-thine-heart',
       E'Mercy and truth — written upon the table of thine heart',
       E'The father binds chesed and emeth — mercy and truth — to the son as an inward inscription: *Let not mercy and truth forsake thee: bind them about thy neck; write them upon the table of thine heart: So shalt thou find favour and good understanding in the sight of Elohim (God) and man* (Proverbs 3:3-4). The same image of a heart written upon as a tablet runs forward to Sha''ul (Paul), who sees the believers themselves as the letter so inscribed: *ye are manifestly declared to be the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). The Torah Jeremiah promised on the inward parts is this writing on the heart''s table. And the fruit of mercy and truth kept — *favour... in the sight of Elohim (God) and man* — is fulfilled to the letter in the boy Yahusha (Jesus): *And Yahusha (Jesus) increased in wisdom and stature, and in favour with Elohim (God) and man* (Luke 2:52). The Formed Son walks the very path the wisdom-father sets before the son, growing in the favour with Elohim and man that mercy and truth secure.',
       sv.verse_id, ev.verse_id, 'free', 28053
  FROM _s304_pr03_lookup sv, _s304_pr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding',
       E'Trust in Yahuah with all thine heart — lean not unto thine own understanding',
       E'Here stands the keystone of the chapter, the whole framework''s posture against the wisdom of the flesh: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding. In all thy ways acknowledge him, and he shall direct thy paths* (Proverbs 3:5-6). The heart''s whole trust is given to Yahuah, and the flesh''s own understanding is laid down. Isaiah names the gulf that makes this the only sane course: *For my thoughts are not your thoughts, neither are your ways my ways, saith Yahuah (LORD)* (Isaiah 55:8), *for as the heavens are higher than the earth, so are my ways higher than your ways, and my thoughts than your thoughts* (Isaiah 55:9). Jeremiah confesses that self-direction is impossible — *the way of man is not in himself: it is not in man that walketh to direct his steps* (Jeremiah 10:23) — and forbids the only glorying the flesh wants: *Let not the wise man glory in his wisdom* (Jeremiah 9:23), permitting one boast alone, *that he understandeth and knoweth me, that I am Yahuah (LORD)* (Jeremiah 9:24). Sha''ul (Paul) carries it to the cross, where the leaned-upon understanding is undone: *I will destroy the wisdom of the wise, and will bring to nothing the understanding of the prudent* (1 Corinthians 1:19), for *the foolishness of Elohim (God) is wiser than men* (1 Corinthians 1:25). The next verse presses the same lesson — *Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil* (Proverbs 3:7) — against which Isaiah pronounces woe, *Woe unto them that are wise in their own eyes, and prudent in their own sight!* (Isaiah 5:21), and which Sha''ul repeats almost verbatim, *Be not wise in your own conceits* (Romans 12:16). The restored witnesses keep the same counsel: *Believe in him, and he will help you; order your way aright, and trust in him* (Sirach 2:6), and *the thoughts of mortal men are miserable, and our devices are but uncertain* (Wisdom of Solomon 9:14). From end to end of the library, the trusting heart leans not on its own understanding but lets Yahuah direct the path.',
       sv.verse_id, ev.verse_id, 'extras', 28056
  FROM _s304_pr03_lookup sv, _s304_pr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-3-honour-yahuah-with-thy-substance-and-the-firstfruits',
       E'Honour Yahuah with thy substance — and with the firstfruits',
       E'The wisdom-father presses the appointed giving of the Torah: *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase: So shall thy barns be filled with plenty, and thy presses shall burst out with new wine* (Proverbs 3:9-10). This is no new piety but the firstfruits command of the law: *The first of the firstfruits of thy land thou shalt bring into the house of Yahuah Elohayka (the LORD thy God)* (Exodus 23:19). Malachi turns it to a promise the giver may prove: *Bring ye all the tithes into the storehouse... and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it* (Malachi 3:10) — the windows of heaven for the barns filled with plenty. Sha''ul (Paul) keeps the heart of the giver in view: *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7); and Yahusha (Jesus) sets the order plain — *seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33), the firstfruits first and the increase added. The restored witness keeps the very command: *Give Yahuah (God) his honour with a good eye, and diminish not the firstfruits of yours hands* (Sirach 35:8). The first and best brought in gladness to His house — the appointed giving, Torah-affirmed, with the open windows of heaven for its reward.',
       sv.verse_id, ev.verse_id, 'extras', 28059
  FROM _s304_pr03_lookup sv, _s304_pr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-3-whom-yahuah-loveth-he-correcteth-the-fathers-chastening',
       E'Whom Yahuah loveth he correcteth — the Father''s chastening',
       E'The chapter''s second keystone is the Father''s discipline of a true son: *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction: For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:11-12). The chastening is covenant sonship, not wrath — the Father correcting the son in whom He delights. The writer to the Hebrews quotes it verbatim as the word the sons had forgotten: *My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him* (Hebrews 12:5), *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6) — for *what son is he whom the father chasteneth not?* The Formed Son speaks the same word in His own voice: *As many as I love, I rebuke and chasten: be zealous therefore, and repent* (Revelation 3:19). Its Torah root is Moshe''s (Moses'') word over the forty years: *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5); and Job''s comforter names the corrected man blessed: *happy is the man whom Elohim (God) correcteth: therefore despise not thou the chastening of the Almighty* (Job 5:17). The restored witness gives the reason: *gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). The correction is the refining furnace that proves the son — the Father''s assaying, never His rejection. (This is the FROM-Proverbs source thread; the reverse FROM-Hebrews thread stands distinct.)',
       sv.verse_id, ev.verse_id, 'extras', 28062
  FROM _s304_pr03_lookup sv, _s304_pr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-3-she-is-a-tree-of-life-to-them-that-lay-hold-upon-her',
       E'She is a tree of life to them that lay hold upon her',
       E'Wisdom is named with the very tree of Eden: *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). This reaches back to the garden — *the tree of life also in the midst of the garden* (Genesis 2:9) — the tree from which Adam was barred when he fell: *lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22), guarded thereafter by the cherubim and the flaming sword. What Eden lost, Wisdom gives back to the one who lays hold of her. And the tree runs forward to its consummation in the Revelation: it is promised to the overcomer — *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7) — and seen at last by the river of the throne, *the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The right to it belongs to the commandment-keepers: *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14) — the same blessing as *happy is every one that retaineth her*. From the garden, through Wisdom laid hold of, to the New Jerusalem, the tree of life is one; and this verse anticipates the Wisdom personified in chapter 8.',
       sv.verse_id, ev.verse_id, 'free', 28065
  FROM _s304_pr03_lookup sv, _s304_pr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-3-yahuah-by-wisdom-hath-founded-the-earth',
       E'Yahuah by wisdom hath founded the earth — Wisdom the agent of creation',
       E'*Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens. By his knowledge the depths are broken up, and the clouds drop down the dew* (Proverbs 3:19-20). Wisdom is the instrument by which the Father created — the truth that opens into chapter 8''s Wisdom standing beside Yahuah at the founding of the world, and through the Formed/Formless lens this is the expressed Word the Father created BY. The psalmist sings it as creation by the spoken word: *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6); Jeremiah repeats the proverb almost verbatim: *he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12). Yochanan (John) carries it to the Word: *All things were made by him; and without him was not any thing made that was made* (John 1:3); and Sha''ul (Paul) to the Formed Son, the image of the invisible Elohim: *by him were all things created, that are in heaven, and that are in earth, visible and invisible... all things were created by him, and for him* (Colossians 1:16). He is the Word drawn from the Formless, the One through whom the Father made the heavens and the earth — not a co-equal second person, nor a created thing, but the agent of all that was made. The restored witness sees the same Wisdom present at the work: *wisdom was with you: which knoweth your works, and was present when you madest the world* (Wisdom of Solomon 9:9). The earth founded by Wisdom is the earth founded by the expressed Word of the Father.',
       sv.verse_id, ev.verse_id, 'extras', 28068
  FROM _s304_pr03_lookup sv, _s304_pr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 8
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-3-he-giveth-grace-unto-the-lowly',
       E'He giveth grace unto the lowly — scorned scorners, exalted humble',
       E'The proverb that the two apostles would both quote as scripture stands here: *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34). Ya''aqov (James) cites it against the friendship of the world: *he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6); and Kepha (Peter) cites the very same words to clothe the flock in humility: *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). The scorned scorner is the proud whom Elohim resists; the lowly is the humble to whom grace is given. Yahusha (Jesus) makes it the law of the kingdom: *whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted* (Matthew 23:12). And Isaiah shows where the lowly are housed — not cast off but dwelt-with by the Most High: *I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble, and to revive the heart of the contrite ones* (Isaiah 57:15). The closing contrast of the chapter — *The wise shall inherit glory: but shame shall be the promotion of fools* (Proverbs 3:35) — runs the same fork: the lowly given grace and glory, the scorner given shame.',
       sv.verse_id, ev.verse_id, 'free', 28071
  FROM _s304_pr03_lookup sv, _s304_pr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=3 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6) — the Shema''s demand behind 3:1; the commandments to live in the heart, not as a dead letter.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-forget-not-my-torah-but-let-thine-heart-keep-my-commandments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — the new-covenant root of 3:1; the Torah moved inward, not abolished.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-forget-not-my-torah-but-let-thine-heart-keep-my-commandments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — the keeping heart of 3:1 is the Spirit-wrought walk in the statutes; Ruach and Torah inseparable.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-forget-not-my-torah-but-let-thine-heart-keep-my-commandments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*hereby we do know that we know him, if we keep his commandments* (1 John 2:3) — the filter on 3:1; knowing Him is shown by the kept commandment.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-forget-not-my-torah-but-let-thine-heart-keep-my-commandments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3) — the table-of-the-heart of 3:3 taken up whole; the Torah inscribed in a new place.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-bind-mercy-and-truth-write-them-upon-the-table-of-thine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahusha (Jesus) increased in wisdom and stature, and in favour with Elohim (God) and man* (Luke 2:52) — the favour of 3:4 fulfilled to the letter in the boy Yahusha, the Formed Son walking the wisdom-father''s path.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-bind-mercy-and-truth-write-them-upon-the-table-of-thine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*my thoughts are not your thoughts, neither are your ways my ways, saith Yahuah (LORD)* (Isaiah 55:8) — the gulf behind 3:5; the flesh''s understanding cannot reach Yahuah''s.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*as the heavens are higher than the earth, so are my ways higher than your ways* (Isaiah 55:9) — why lean-not on own understanding (3:5): Yahuah''s mind is measurelessly higher.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the way of man is not in himself: it is not in man that walketh to direct his steps* (Jeremiah 10:23) — 3:6''s ground: man cannot direct his own steps; the acknowledged Yahuah directs the paths.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Let not the wise man glory in his wisdom* (Jeremiah 9:23) — the self-confidence 3:5 lays down; the flesh''s glorying forbidden.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*let him that glorieth glory in this, that he understandeth and knoweth me* (Jeremiah 9:24) — the positive of 3:5; the trusting heart glories only in knowing Yahuah.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I will destroy the wisdom of the wise, and will bring to nothing the understanding of the prudent* (1 Corinthians 1:19) — the leaned-upon understanding of 3:5 undone at the cross.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the foolishness of Elohim (God) is wiser than men* (1 Corinthians 1:25) — what 3:5''s flesh calls folly outweighs all its own wisdom.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Woe unto them that are wise in their own eyes, and prudent in their own sight!* (Isaiah 5:21) — the self-wise of 3:7 under the prophet''s woe; verbatim parallel.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*Be not wise in your own conceits* (Romans 12:16) — Sha''ul repeats 3:7 almost word for word; the lowly mind that minds not high things.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-trust-in-yahuah-with-all-thine-heart-lean-not-to-thine-own-understanding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The first of the firstfruits of thy land thou shalt bring into the house of Yahuah Elohayka (the LORD thy God)* (Exodus 23:19) — the Torah command behind 3:9; the first and best to His house.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-honour-yahuah-with-thy-substance-and-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Bring ye all the tithes into the storehouse... if I will not open you the windows of heaven, and pour you out a blessing* (Malachi 3:10) — the barns filled of 3:10 as Malachi''s open windows of heaven.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-honour-yahuah-with-thy-substance-and-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7) — the heart of the honouring of 3:9; the firstfruits brought gladly, not grudgingly.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-honour-yahuah-with-thy-substance-and-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*seek ye first the kingdom of Elohim (God)... and all these things shall be added unto you* (Matthew 6:33) — the order of 3:9-10: Yahuah and firstfruits first, the increase added.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-honour-yahuah-with-thy-substance-and-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Give Yahuah (God) his honour with a good eye, and diminish not the firstfruits of yours hands* (Sirach 35:8) — the restored witness keeps 3:9 exactly; firstfruits not cut short.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-honour-yahuah-with-thy-substance-and-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him* (Hebrews 12:5) — 3:11 quoted verbatim as the word the sons forgot.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-whom-yahuah-loveth-he-correcteth-the-fathers-chastening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6) — 3:12 quoted as the ground of covenant sonship; chastening the mark of a received son.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-whom-yahuah-loveth-he-correcteth-the-fathers-chastening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*As many as I love, I rebuke and chasten: be zealous therefore, and repent* (Revelation 3:19) — the Formed Son speaks 3:12 in His own voice; the rebuke is the proof of His love.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-whom-yahuah-loveth-he-correcteth-the-fathers-chastening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5) — the Torah root of 3:12; the wilderness discipline of the son Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-whom-yahuah-loveth-he-correcteth-the-fathers-chastening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*happy is the man whom Elohim (God) correcteth: therefore despise not thou the chastening of the Almighty* (Job 5:17) — the command of 3:11 in Job; the corrected man is the happy man.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=5 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-whom-yahuah-loveth-he-correcteth-the-fathers-chastening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5) — the reason not to despise the chastening of 3:11; the refining furnace that proves the son.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-whom-yahuah-loveth-he-correcteth-the-fathers-chastening'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the tree of life also in the midst of the garden* (Genesis 2:9) — Wisdom of 3:18 named with the very tree set in Eden''s midst.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-she-is-a-tree-of-life-to-them-that-lay-hold-upon-her'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (Genesis 3:22) — the tree Adam was barred from; Wisdom (3:18) gives back what the flaming sword guarded.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-she-is-a-tree-of-life-to-them-that-lay-hold-upon-her'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7) — the tree of 3:18 promised to the overcomer in the paradise restored.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-she-is-a-tree-of-life-to-them-that-lay-hold-upon-her'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* (Revelation 22:2) — the tree of 3:18 consummated by the river of the throne.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-she-is-a-tree-of-life-to-them-that-lay-hold-upon-her'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Blessed are they that do his commandments, that they may have right to the tree of life* (Revelation 22:14) — the happiness of retaining her (3:18) as the blessing of the commandment-keepers'' right to the tree.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-she-is-a-tree-of-life-to-them-that-lay-hold-upon-her'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6) — 3:19''s wisdom-founding as creation by the spoken word.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-yahuah-by-wisdom-hath-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12) — 3:19 repeated almost verbatim; the same Wisdom-agent of creation.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-yahuah-by-wisdom-hath-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*All things were made by him; and without him was not any thing made that was made* (John 1:3) — the Wisdom by which 3:19 founds the earth is the Formed Word, the expressed One the Father created BY.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-yahuah-by-wisdom-hath-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*by him were all things created... all things were created by him, and for him* (Colossians 1:16) — 3:19 carried to the Formed Son, image of the invisible Elohim, agent of creation, not co-equal nor created.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-yahuah-by-wisdom-hath-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*wisdom was with you... and was present when you madest the world* (Wisdom of Solomon 9:9) — the restored witness sees the same Wisdom of 3:19 standing with the Father at creation.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-yahuah-by-wisdom-hath-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 8 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) — Ya''aqov quotes 3:34 as scripture; the scorner is the proud resisted, the lowly the humble graced.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=34
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-he-giveth-grace-unto-the-lowly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5) — Kepha quotes the same 3:34; the clothing of humility draws the grace promised the lowly.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=34
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-he-giveth-grace-unto-the-lowly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted* (Matthew 23:12) — the two ways of 3:34 as Yahusha''s law of the kingdom.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=34
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-he-giveth-grace-unto-the-lowly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I dwell in the high and holy place, with him also that is of a contrite and humble spirit* (Isaiah 57:15) — the lowly of 3:34 not cast off but housed with the Most High, their spirit revived.'
  FROM cross_reference_threads t
  JOIN _s304_pr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=3 AND sv.verse_number=34
  JOIN _s304_pr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-3-he-giveth-grace-unto-the-lowly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_proverbs_8.sql (Proverbs 8) -----
-- Chapter: Proverbs 8 — THE FRAMEWORK CORNERSTONE OF THE BOOK. Wisdom personified speaks, and at 8:22-31 she is
--   the Formed Son — the expressed Word drawn from the Formless Father, brought-forth/set-up before the works of old,
--   then "by him" as the master-workman at creation: *Yahuah (LORD) possessed me in the beginning of his way, before his
--   works of old. I was set up from everlasting... When there were no depths, I was brought forth... Then I was by him, as
--   one brought up with him: and I was daily his delight* (8:22-30). The chapter opens with Wisdom crying publicly
--   (8:1-11, better than rubies), claims counsel/strength/reciprocal love (8:12-21, *I love them that love me*), unfolds
--   the creation-Christology (8:22-31), and closes on the life/death two-ways (8:32-36, *whoso findeth me findeth life...
--   all they that hate me love death*).
-- Tag: pr08   Temp view: _s304_pr08_lookup
-- Sort band: base 28175, step 3 -> threads at 28175, 28178, 28181, 28184, 28187, 28190 (6 threads)
-- Source of EVERY row: 'canon','proverbs',8,v
--
-- Proverbs 8 coverage:
--   ★ v.1-11 (Doth not wisdom cry?... wisdom is better than rubies; and all the things that may be desired are not to be compared to it)
--        NT:     Matthew 13:45-46 (the merchant seeking goodly pearls, sold all that he had, and bought one pearl of great price) — THREAD 1
--        Extras: none warranted distinct (the public-cry / better-than-rubies figure carried by Job 28 + Prov 3 laterals and Matt 13 forward)
--        Tanakh: ★ Job 28:18 (the price of wisdom is above rubies); Prov 3:15 (She is more precious than rubies) — THREAD 1
--   ★ v.12-21 (I wisdom dwell with prudence... By me kings reign... I love them that love me; and those that seek me early shall find me)
--        NT:     Matthew 7:7 (Ask... seek, and ye shall find); James 1:5 (If any of you lack wisdom, let him ask of Elohim); John 14:21 (he that loveth me shall be loved of my Father) — THREAD 2
--        Extras: none warranted distinct (the reciprocity / seek-and-find figure carried by Exod 20:6 lateral + the NT forward)
--        Tanakh: ★ Exodus 20:6 (shewing mercy unto thousands of them that love me, and keep my commandments) — THREAD 2 (the love-reciprocity = covenant-keeping, 1 John 2:3-4 filter)
--   ★★★ v.22-31 (Yahuah (LORD) possessed me in the beginning of his way... I was set up from everlasting... I was brought forth... Then I was by him, as one brought up with him: and I was daily his delight) — THE FORMED/FORMLESS CHRISTOLOGY
--        NT:     ★★★ John 1:1-3 (In the beginning was the Word... all things were made by him); ★★★ Colossians 1:15-17 (image of the invisible... firstborn of every creature... by him were all things created); 1 Corinthians 1:24,30 (Messiah the wisdom of Elohim; made unto us wisdom); ★★ Revelation 3:14 (the Amen... the beginning of the creation of Elohim); Hebrews 1:2-3 (by whom also he made the worlds) — THREAD 3 (forward-weave, the LOAD-BEARING members)
--        Extras: ★ Wisdom of Solomon 7:25-26 (she is the breath of the power of Yahuah... the brightness of the everlasting light, the unspotted mirror... the image of his goodness); Wisdom 9:9 (wisdom was with thee... present when thou madest the world); ★ Sirach 24:3,9 (I came out of the mouth of the Most High... he created me from the beginning before the world) — THREAD 3
--        Tanakh: ★ Psalm 33:6 (By the word of Yahuah were the heavens made); Prov 3:19 (Yahuah by wisdom hath founded the earth); Job 28:12,23 (where shall wisdom be found... Elohim understandeth the way thereof); Jeremiah 10:12 (He hath made the earth by his power, he hath established the world by his wisdom) — THREAD 4 (lateral Tanakh creation-by-wisdom)
--   ★ v.32-36 (Now therefore hearken unto me... blessed are they that keep my ways... For whoso findeth me findeth life... all they that hate me love death)
--        NT:     John 8:51 (If a man keep my saying, he shall never see death) — THREAD 5
--        Extras: none warranted distinct (the life/death two-ways close carried by Deut 30 + Prov 3 laterals and John 8 forward)
--        Tanakh: ★ Deuteronomy 30:19-20 (I have set before you life and death... therefore choose life... for he is thy life); Prov 3:18 (She is a tree of life to them that lay hold upon her) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. proverbs-8-wisdom-crieth-better-than-rubies — Tanakh (Job, Proverbs) + NT (Matthew) [free] (Wisdom's public cry; better than rubies; the pearl of great price)
--   2. proverbs-8-i-love-them-that-love-me-and-those-that-seek-me-early-shall-find-me — Tanakh (Exodus) + NT (Matthew, James, John) [free] (★ reciprocal covenant-love = keeping the commandments; seek and find)
--   3. proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation — NT (John, Colossians, 1 Corinthians, Revelation, Hebrews) + Extras (Wisdom of Solomon, Sirach) [extras] (★★★ THE CHRISTOLOGY — the Formed Son brought-forth-not-created, not-co-equal, the master-workman of creation)
--   4. proverbs-8-yahuah-by-wisdom-founded-the-earth — Tanakh (Psalm, Proverbs, Job, Jeremiah) [free] (★★ lateral: the heavens made by the word/wisdom; the same Formed agent of creation across the Tanakh)
--   5. proverbs-8-whoso-findeth-me-findeth-life-all-they-that-hate-me-love-death — Tanakh (Deuteronomy, Proverbs) + NT (John) [free] (the life/death two-ways close; keep my ways = keep my saying = life)
--
-- ★★★ FRAMEWORK POINT 4 — THE FORMED AND THE FORMLESS (THREAD 3, flagged for Yoshi):
--   Proverbs 8:22-31 is Wisdom speaking, and the framework reads her as the FORMED SON — the expressed Word drawn from
--   the Formless Father, the One THROUGH whom Yahuah made all things. *Yahuah (LORD) possessed me in the beginning of his
--   way, before his works of old. I was set up from everlasting... When there were no depths, I was brought forth...
--   Then I was by him, as one brought up with him: and I was daily his delight* (8:22-30). He is NOT a created creature
--   (the Arian error guarded: "possessed / brought forth / set up" is BEGOTTEN-from-the-Father's-own-being, the Word the
--   Father always had and expressed — not the manufacture of a finite thing). He is NOT a co-equal Trinitarian second
--   person (guarded too: he is brought forth BY the Father and is DAILY the Father's delight — subordinate-in-origin, the
--   Son who HAS a Father). This is the SAME figure as the "Elohim said" of Genesis 1, *By the word of Yahuah were the
--   heavens made* (Ps 33:6), and the foundation-laying Son of Ps 102 / Heb 1:10. The forward-weave is load-bearing:
--   John 1:1-3 (the Word in the beginning, all things made by him), Col 1:15-17 (firstborn of every creature, by him all
--   things created and consist), 1 Cor 1:24,30 (Messiah the wisdom of Elohim), Rev 3:14 (the beginning of the creation of
--   Elohim — the same "beginning of his way" language), Heb 1:2-3 (by whom he made the worlds, the brightness of his
--   glory). The extras (Wis 7:25-26 "breath of the power... brightness of the everlasting light... image of his goodness";
--   Sirach 24:3,9 "I came out of the mouth of the Most High... he created me from the beginning before the world") carry
--   the same brought-forth-from-the-Father witness. summary_md walks brought-forth-not-created AND not-co-equal explicitly.
--   ⚠ Apocrypha "Wisdom" is feminine grammatical personification; the framework reads the FIGURE (the expressed Word) as
--   the Formed Son — the prose names this plainly so the grammatical "she" is not read as a goddess/separate hypostasis.
--
-- VERSES WITH NO STANDALONE THREAD: v.12-16 (I wisdom dwell with prudence... By me kings reign) are carried within
--   THREAD 2 (anchored 8:12-21) as the preface to the reciprocal-love claim, not given a separate thread (the kings-reign
--   sovereignty is the same Wisdom whose love is reciprocal). v.4-9 (the truth/righteousness of Wisdom's words) carried
--   within THREAD 1's public-cry frame. No Jubilees/Jasher/Enoch witness warranted for a wisdom-poem.

CREATE TEMP VIEW _s304_pr08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Wisdom crieth — better than rubies (the public cry; the pearl of great price)
    ('canon','proverbs',8,11,'canon','job',28,18,'free',
      E'*No mention shall be made of coral, or of pearls: for the price of wisdom is above rubies* (Job 28:18). The very scale Wisdom sets for herself — *For wisdom is better than rubies; and all the things that may be desired are not to be compared to it* (Proverbs 8:11) — is Job''s: *the price of wisdom is above rubies*. The treasure that cannot be bought with silver or gold is the same in both songs; the receiving of *my instruction, and not silver* (8:10) is the buying of what is above all rubies.'),
    ('canon','proverbs',8,11,'canon','proverbs',3,15,'free',
      E'*She is more precious than rubies: and all the things thou canst desire are not to be compared unto her* (Proverbs 3:15). The earlier word of this same book frames Wisdom in the identical scale she now claims of herself — *wisdom is better than rubies; and all the things that may be desired are not to be compared to it* (Proverbs 8:11). The figure is fixed across the book: Wisdom is the one possession worth more than every desirable thing, and the man who lays hold of her holds the surpassing treasure.'),
    ('canon','proverbs',8,11,'canon','matthew',13,45,'free',
      E'*Again, the kingdom of heaven is like unto a merchant man, seeking goodly pearls* (Matthew 13:45). Wisdom''s cry to receive her *rather than choice gold* (8:10), she being *better than rubies* (8:11), is answered in the merchant who seeks the one supreme treasure. The seeking-merchant of the kingdom is the man who hears Wisdom''s public cry and goes after the pearl above all rubies.'),
    ('canon','proverbs',8,11,'canon','matthew',13,46,'free',
      E'*Who, when he had found one pearl of great price, went and sold all that he had, and bought it* (Matthew 13:46). Wisdom counts herself above all desirable things — *all the things that may be desired are not to be compared to it* (Proverbs 8:11) — and Yahusha (Jesus) names the man who has grasped it: he *sold all that he had, and bought it*. To receive Wisdom''s *instruction, and not silver* (8:10) is to sell all for the one pearl of great price; she is worth the whole exchange.'),

    -- THREAD 2: I love them that love me, and those that seek me early shall find me (reciprocal covenant-love)
    ('canon','proverbs',8,17,'canon','exodus',20,6,'free',
      E'*And shewing mercy unto thousands of them that love me, and keep my commandments* (Exodus 20:6). Wisdom''s reciprocity — *I love them that love me; and those that seek me early shall find me* (Proverbs 8:17) — is the covenant''s own grammar, spoken from Sinai: Yahuah shews mercy *unto thousands of them that love me, and keep my commandments*. To love is to keep; the love that Wisdom returns is the love that walks in the commandments, never a bare affection severed from obedience.'),
    ('canon','proverbs',8,17,'canon','john',14,21,'free',
      E'*He that hath my commandments, and keepeth them, he it is that loveth me: and he that loveth me shall be loved of my Father, and I will love him, and will manifest myself to him* (John 14:21). The reciprocal *I love them that love me* (Proverbs 8:17) is fulfilled in the Formed Son''s own word: *he that loveth me shall be loved of my Father, and I will love him*. And he names the love-test exactly as Wisdom does — *He that hath my commandments, and keepeth them, he it is that loveth me*. The love that finds Wisdom is the love that keeps the commandments.'),
    ('canon','proverbs',8,17,'canon','matthew',7,7,'free',
      E'*Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you* (Matthew 7:7). Wisdom''s promise — *those that seek me early shall find me* (Proverbs 8:17) — is the promise of the Sermon: *seek, and ye shall find*. The seeking is never in vain; Wisdom answers the one who seeks her, and the Son confirms that the seeker finds.'),
    ('canon','proverbs',8,17,'canon','james',1,5,'free',
      E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). Wisdom said *those that seek me early shall find me* (Proverbs 8:17); Ya''aqov (James) names how she is sought and found — *let him ask of Elohim (God), that giveth to all men liberally*. The wisdom that cries in the street is the wisdom given to the one who asks; the early seeker is the asker, and to him she is given.'),

    -- THREAD 3: Wisdom the Formed Son — brought forth, the agent of creation (THE CHRISTOLOGY)
    ('canon','proverbs',8,22,'canon','john',1,1,'free',
      E'*In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1). Wisdom''s *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:22) is the Formed Son — the expressed Word drawn from the Formless Father — declared at the head of the gospel: *In the beginning was the Word, and the Word was with Elohim (God)*. The Word the Father always had and expressed is the Wisdom set up from everlasting; he is WITH Elohim and IS Elohim, yet has a Father whose he is — brought forth, not made.'),
    ('canon','proverbs',8,30,'canon','john',1,3,'free',
      E'*All things were made by him; and without him was not any thing made that was made* (John 1:3). Wisdom standing at creation as *one brought up with him* — *I was by him, as one brought up with him* (Proverbs 8:30) — is the master-workman through whom the worlds came: *All things were made by him; and without him was not any thing made that was made*. The Formed Son is the agent of creation, the hand by which the Formless Father made all; nothing was made apart from him.'),
    ('canon','proverbs',8,22,'canon','colossians',1,15,'free',
      E'*Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15). The One *possessed... in the beginning of his way, before his works of old* (Proverbs 8:22) is the *firstborn of every creature* — not the first creature made, but the One who is before and over all creation, the visible image of the invisible Father. Firstborn is rank and origin from the Father, not membership among the things created; he is the brought-forth Son, not a fashioned creature.'),
    ('canon','proverbs',8,30,'canon','colossians',1,16,'free',
      E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him* (Colossians 1:16). Wisdom *by him, as one brought up with him* (Proverbs 8:30), the master-workman at creation, is the One *by him were all things created... all things were created by him, and for him*. The Formed Son is the agent THROUGH whom the Formless Father made everything — the very office Wisdom claims at the founding of the earth.'),
    ('canon','proverbs',8,30,'canon','colossians',1,17,'free',
      E'*And he is before all things, and by him all things consist* (Colossians 1:17). The Wisdom *set up from everlasting, from the beginning, or ever the earth was* (Proverbs 8:23) is the One *before all things, and by him all things consist*. He is not within the creation but before it, and the same hand that framed it holds it together; the brought-forth Son both made and sustains the works of old.'),
    ('canon','proverbs',8,22,'canon','1-corinthians',1,24,'free',
      E'*But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24). The Wisdom who speaks in Proverbs 8 — *Yahuah (LORD) possessed me in the beginning of his way* (8:22) — is named outright: Messiah is *the wisdom of Elohim (God)*. The personified Wisdom of the proverb is no mere figure of speech but the Formed Son himself, the power and wisdom of the Father made manifest.'),
    ('canon','proverbs',8,30,'canon','1-corinthians',1,30,'free',
      E'*But of him are ye in HaMashiach Yahusha (Christ Jesus), who of Elohim (God) is made unto us wisdom, and righteousness, and sanctification, and redemption* (1 Corinthians 1:30). Wisdom who was *daily his delight, rejoicing always before him* (Proverbs 8:30) is the One *who of Elohim (God) is made unto us wisdom*. The Wisdom that was with the Father before the works of old is given to his people as their wisdom; the master-workman of creation is the Messiah in whom they stand.'),
    ('canon','proverbs',8,22,'canon','revelation',3,14,'free',
      E'*And unto the angel of the church of the Laodiceans write; These things saith the Amen, the faithful and true witness, the beginning of the creation of Elohim (God)* (Revelation 3:14). The Formed Son names himself in the very language of Wisdom''s *the beginning of his way, before his works of old* (Proverbs 8:22): he is *the beginning of the creation of Elohim (God)* — the One who stands at the head of all creation as its source and its faithful witness. Not the first thing created, but the beginning FROM which the creation came; the brought-forth Word who was there before the depths.'),
    ('canon','proverbs',8,30,'canon','hebrews',1,2,'free',
      E'*Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds* (Hebrews 1:2). Wisdom *by him, as one brought up with him* at the founding of the earth (Proverbs 8:30) is the Son *by whom also he made the worlds*. The Father made the worlds BY the Son — the Formless Source acting through the Formed agent — exactly the office Wisdom held when the heavens were prepared and the foundations of the earth appointed (8:27-29).'),
    ('canon','proverbs',8,30,'canon','hebrews',1,3,'free',
      E'*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power* (Hebrews 1:3). Wisdom who was *daily his delight* beside the Father (Proverbs 8:30) is *the brightness of his glory, and the express image of his person*. The Son is the radiance OF the Father''s glory and the exact imprint of his being — brought forth from him, bearing his very image, upholding the worlds he helped to make.'),
    ('canon','proverbs',8,30,'apocrypha','the-wisdom-of-solomon',7,25,'extras',
      E'*For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her* (Wisdom of Solomon 7:25). The restored witness frames Wisdom — the One who was *by him, as one brought up with him* (Proverbs 8:30) — as *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty*. She proceeds FROM the Almighty''s own glory, the expressed breath of the Formless Source: brought forth from the Father''s being, not fashioned beside it.'),
    ('canon','proverbs',8,30,'apocrypha','the-wisdom-of-solomon',7,26,'extras',
      E'*For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness* (Wisdom of Solomon 7:26). The Wisdom *daily his delight, rejoicing always before him* (Proverbs 8:30) is *the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness* — the very language the gospel takes up of the Son, *the brightness of his glory* (Hebrews 1:3). The Formed One is the radiance and exact mirror of the Formless Father, his image perfectly drawn.'),
    ('canon','proverbs',8,27,'apocrypha','the-wisdom-of-solomon',9,9,'extras',
      E'*And wisdom was with thee: which knoweth thy works, and was present when thou madest the world, and knew what was acceptable in thy sight, and right in thy commandments* (Wisdom of Solomon 9:9). When Wisdom says *When he prepared the heavens, I was there* (Proverbs 8:27), the restored witness agrees: she *was present when thou madest the world*. The Formed Son was there at the making — present at the founding, the workman who knew the Father''s works because he wrought them with him.'),
    ('canon','proverbs',8,22,'apocrypha','ecclesiasticus',24,3,'extras',
      E'*I came out of the mouth of the Most High, and covered the earth as a cloud* (Sirach 24:3). Wisdom''s *Yahuah (LORD) possessed me in the beginning of his way* (Proverbs 8:22) is sung again as *I came out of the mouth of the Most High* — the expressed Word PROCEEDING from the Formless Father, drawn out of his own mouth. She is not made beside him but brought forth FROM him, the utterance of the Most High going out to cover the earth.'),
    ('canon','proverbs',8,23,'apocrypha','ecclesiasticus',24,9,'extras',
      E'*He created me from the beginning before the world, and I shall never fail* (Sirach 24:9). Wisdom''s *I was set up from everlasting, from the beginning, or ever the earth was* (Proverbs 8:23) is echoed in *He created me from the beginning before the world, and I shall never fail*. The "created/set up" is the bringing-forth before all worlds of the One who never fails — begotten of the Father before time, not a perishable thing fashioned within it; the everlasting Word who was there before the earth was.'),

    -- THREAD 4: Yahuah by wisdom founded the earth (lateral Tanakh creation-by-wisdom)
    ('canon','proverbs',8,27,'canon','psalms',33,6,'free',
      E'*By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6). When Wisdom says *When he prepared the heavens, I was there* (Proverbs 8:27), the Psalter names the means: *By the word of Yahuah (LORD) were the heavens made*. The Word and the Wisdom are one — the expressed utterance of the Father by which the heavens and all their host came to be; the same Formed agent stands behind both phrases.'),
    ('canon','proverbs',8,29,'canon','proverbs',3,19,'free',
      E'*Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens* (Proverbs 3:19). Wisdom''s presence *when he appointed the foundations of the earth* (Proverbs 8:29) is stated plainly earlier in the book: *Yahuah (LORD) by wisdom hath founded the earth*. The Father founded the earth BY wisdom — through the very One who here testifies she was beside him as the foundations were laid; the master-workman is the means of the founding.'),
    ('canon','proverbs',8,12,'canon','job',28,12,'free',
      E'*But where shall wisdom be found? and where is the place of understanding?* (Job 28:12). Wisdom''s self-claim *I wisdom dwell with prudence, and find out knowledge of witty inventions* (Proverbs 8:12) answers Job''s great question — *where shall wisdom be found?* What the miner cannot dig up nor the merchant buy, Wisdom here freely proclaims of herself: she dwells with prudence, and is found by the one who seeks her early.'),
    ('canon','proverbs',8,27,'canon','job',28,23,'free',
      E'*Elohim (God) understandeth the way thereof, and he knoweth the place thereof* (Job 28:23). Wisdom present at the making — *When he prepared the heavens, I was there: when he set a compass upon the face of the depth* (Proverbs 8:27) — is the Wisdom whose place only Elohim knows: *Elohim (God) understandeth the way thereof, and he knoweth the place thereof*. She was with him at the founding, the one beside the Father whose place is hid from all the living save him whose delight she is.'),
    ('canon','proverbs',8,29,'canon','jeremiah',10,12,'free',
      E'*He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12). Wisdom''s presence *when he gave to the sea his decree... when he appointed the foundations of the earth* (Proverbs 8:29) is matched by Jeremiah: he *established the world by his wisdom, and hath stretched out the heavens by his discretion*. The world is established BY wisdom — through the Formed One who was there as the decree was given to the sea and the foundations were set.'),

    -- THREAD 5: Whoso findeth me findeth life — all they that hate me love death (the life/death close)
    ('canon','proverbs',8,35,'canon','deuteronomy',30,19,'free',
      E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). Wisdom''s close — *For whoso findeth me findeth life... all they that hate me love death* (Proverbs 8:35-36) — is the two ways Moshe (Moses) set before the covenant people: *I have set before you life and death... therefore choose life*. To find Wisdom is to choose life; to hate her is to love death. The fork of the Torah is the fork of the proverb.'),
    ('canon','proverbs',8,35,'canon','deuteronomy',30,20,'free',
      E'*That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days* (Deuteronomy 30:20). Wisdom said *whoso findeth me findeth life, and shall obtain favour of Yahuah (LORD)* (Proverbs 8:35); Moshe (Moses) names the life found — Yahuah himself, *for he is thy life, and the length of thy days*. To find Wisdom and obtain Yahuah''s favour is to cleave to the One who IS life; the finding and the loving and the obeying are one.'),
    ('canon','proverbs',8,35,'canon','proverbs',3,18,'free',
      E'*She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). Wisdom''s promise *whoso findeth me findeth life* (Proverbs 8:35) is the earlier word of this book: she is *a tree of life to them that lay hold upon her*. The one who finds and holds Wisdom holds the tree of life; the finding of her is the laying hold of life itself.'),
    ('canon','proverbs',8,34,'canon','john',8,51,'free',
      E'*Verily, verily, I say unto you, If a man keep my saying, he shall never see death* (John 8:51). Wisdom''s blessing — *Blessed is the man that heareth me, watching daily at my gates... For whoso findeth me findeth life* (Proverbs 8:34-35) — is sealed by the Formed Son: *If a man keep my saying, he shall never see death*. To hear Wisdom and keep her ways is to keep his saying; the hearer who watches at her gates is the one who shall never see death, while they that hate her love death.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-8-wisdom-crieth-better-than-rubies',
       E'Wisdom crieth — better than rubies, the pearl of great price',
       E'The chapter opens with Wisdom calling aloud in the most public places, hiding nothing: *Doth not wisdom cry? and understanding put forth her voice? She standeth in the top of high places, by the way in the places of the paths. She crieth at the gates, at the entry of the city, at the coming in at the doors* (Proverbs 8:1-3). Her words are *truth* and *righteousness*, with *nothing froward or perverse in them* (8:7-8), and she sets her own worth above every earthly treasure: *Receive my instruction, and not silver; and knowledge rather than choice gold. For wisdom is better than rubies; and all the things that may be desired are not to be compared to it* (8:10-11). This scale is fixed across the wisdom books. Job''s great hymn weighed Wisdom against every precious thing and found her above them all: *No mention shall be made of coral, or of pearls: for the price of wisdom is above rubies* (Job 28:18). And the earlier word of this same book had already said it: *She is more precious than rubies: and all the things thou canst desire are not to be compared unto her* (Proverbs 3:15). When the Formed Son taught the kingdom, he framed the same surpassing treasure as the pearl a man sells everything to buy: *the kingdom of heaven is like unto a merchant man, seeking goodly pearls: who, when he had found one pearl of great price, went and sold all that he had, and bought it* (Matthew 13:45-46). To hear Wisdom''s cry in the street and receive *her instruction, and not silver* is to sell all for the one pearl above all rubies.',
       sv.verse_id, ev.verse_id, 'free', 28175
  FROM _s304_pr08_lookup sv, _s304_pr08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-8-i-love-them-that-love-me-and-those-that-seek-me-early-shall-find-me',
       E'I love them that love me — and those that seek me early shall find me',
       E'Wisdom now claims her gifts and her reign: *I wisdom dwell with prudence, and find out knowledge of witty inventions... Counsel is mine, and sound wisdom: I am understanding; I have strength. By me kings reign, and princes decree justice* (Proverbs 8:12-15). And at the heart of it she names her covenant with those who turn to her: *I love them that love me; and those that seek me early shall find me* (8:17). This is no bare sentiment — it is the reciprocity of the covenant itself, spoken from Sinai: Yahuah shews mercy *unto thousands of them that love me, and keep my commandments* (Exodus 20:6). To love is to keep; the love Wisdom returns is the love that walks in the commandments. The Formed Son makes the same test and the same promise his own: *He that hath my commandments, and keepeth them, he it is that loveth me: and he that loveth me shall be loved of my Father, and I will love him, and will manifest myself to him* (John 14:21) — the love that finds Wisdom is the love that keeps the word, never an affection severed from obedience (1 John 2:3-4). And the seeking is never in vain. *those that seek me early shall find me*, Wisdom says, and the Son confirms it: *Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you* (Matthew 7:7). Ya''aqov (James) names exactly how she is sought: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). The wisdom that cries in the street is given to the one who asks; the early seeker is the asker, and to him she is found.',
       sv.verse_id, ev.verse_id, 'free', 28178
  FROM _s304_pr08_lookup sv, _s304_pr08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (THE CHRISTOLOGY)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation',
       E'Wisdom the Formed Son — brought forth, the agent of creation',
       E'Here is the cornerstone of the whole book, and one of the great Christological seams of the Tanakh. Wisdom speaks of her origin and her place at the making of all things: *Yahuah (LORD) possessed me in the beginning of his way, before his works of old. I was set up from everlasting, from the beginning, or ever the earth was. When there were no depths, I was brought forth; when there were no fountains abounding with water... When he prepared the heavens, I was there: when he set a compass upon the face of the depth... when he appointed the foundations of the earth: Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him* (Proverbs 8:22-30). Read in the framework, this Wisdom is the **Formed Son** — the expressed Word drawn from the Formless Father, the One THROUGH whom Yahuah made all things, *brought forth* and *set up* before the works of old, then standing *by him* as the master-workman at creation.\n\nGuard the reading on both sides. He is **not a created creature** — the Arian error reads *possessed / brought forth / set up* as the manufacture of a finite thing, the first and highest of the works. But Wisdom is not numbered among the works; she is there *before his works of old*, *brought forth* from the Father''s own being as a son is begotten, the Word the Father always had and at last expressed. And he is **not a co-equal second person** of a tri-personal deity — for he is *brought forth* BY the Father and is *daily his delight*, subordinate in origin, the Son who HAS a Father whose he is. He is Yahuah and has a Father: the Formed drawn from the Formless.\n\nThe forward witness is plain and full. *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)... All things were made by him; and without him was not any thing made that was made* (John 1:1,3) — the Word in the beginning is the Wisdom set up from everlasting, the agent by whom all was made. *Who is the image of the invisible Elohim (God), the firstborn of every creature: for by him were all things created... and by him all things consist* (Colossians 1:15-17) — firstborn is rank and origin from the Father, not membership among the creatures; the master-workman of Proverbs 8 is the One by whom and for whom all things were made and in whom they hold together. Paul names her outright: Messiah is *the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24), *who of Elohim (God) is made unto us wisdom* (1:30). The Son takes up Wisdom''s very phrase for himself — *the Amen, the faithful and true witness, the beginning of the creation of Elohim (God)* (Revelation 3:14), the same *beginning of his way* — not the first thing created, but the beginning FROM which the creation came. And the Hebrews hymn seals it: the Father *by whom also he made the worlds* (Hebrews 1:2), the Son *being the brightness of his glory, and the express image of his person* (1:3).\n\nThe restored witnesses sing the same brought-forth-from-the-Father glory. *For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty... For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness* (Wisdom of Solomon 7:25-26) — she proceeds FROM the Almighty''s glory, the radiance and exact mirror of the Formless Father, the very language Hebrews takes up of the Son. She *was present when thou madest the world* (Wisdom 9:9). And Sirach sings her procession from the Father''s own mouth: *I came out of the mouth of the Most High, and covered the earth as a cloud* (Sirach 24:3), *He created me from the beginning before the world, and I shall never fail* (24:9) — begotten before all worlds, the everlasting Word who never fails. (The personification is grammatically feminine; the framework reads the FIGURE — the expressed Word — as the Formed Son, not a goddess nor a separate hypostasis.) From Proverbs to the gospel to the restored library, one figure stands: the Word brought forth from the Father, the delight beside him, the hand by which the heavens were prepared and the foundations of the earth were laid.',
       sv.verse_id, ev.verse_id, 'extras', 28181
  FROM _s304_pr08_lookup sv, _s304_pr08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=8 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-8-yahuah-by-wisdom-founded-the-earth',
       E'Yahuah by wisdom founded the earth — the Formed agent across the Tanakh',
       E'The same testimony — that Wisdom stood beside the Father at the making — runs as a thread through the whole Tanakh. Wisdom says *When he prepared the heavens, I was there: when he set a compass upon the face of the depth... when he appointed the foundations of the earth* (Proverbs 8:27-29), and the Scriptures name again and again that the Father created BY wisdom, BY his word. The Psalter: *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6) — the Word and the Wisdom are one, the expressed utterance by which the heavens came to be. The earlier word of this very book: *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens* (Proverbs 3:19) — the founding was done THROUGH the One who here testifies she was beside him. Job''s hymn asks where this Wisdom is found — *But where shall wisdom be found? and where is the place of understanding?* (Job 28:12) — and answers that her place is known to Elohim alone: *Elohim (God) understandeth the way thereof, and he knoweth the place thereof* (28:23); what the miner cannot dig nor the merchant buy, Wisdom in Proverbs 8 freely proclaims of herself. And Jeremiah: *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12). Across Psalm, Proverbs, Job, and Jeremiah the confession is one — the world was founded and the heavens stretched out BY wisdom, through the Formed agent who was *by him, as one brought up with him* (8:30).',
       sv.verse_id, ev.verse_id, 'free', 28184
  FROM _s304_pr08_lookup sv, _s304_pr08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=8 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-8-whoso-findeth-me-findeth-life-all-they-that-hate-me-love-death',
       E'Whoso findeth me findeth life — all they that hate me love death',
       E'Wisdom closes on the two ways, the fork of life and death: *Now therefore hearken unto me, O ye children: for blessed are they that keep my ways... Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors. For whoso findeth me findeth life, and shall obtain favour of Yahuah (LORD). But he that sinneth against me wrongeth his own soul: all they that hate me love death* (Proverbs 8:32-36). This is the very charge Moshe (Moses) set before the covenant people in the plains of Moab: *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19) — and he named the life that is found, Yahuah himself: *for he is thy life, and the length of thy days* (30:20). To find Wisdom and obtain Yahuah''s favour is to cleave to the One who IS life. The earlier word of this book had already called her the tree of life: *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18) — the finding of her is the laying hold of life itself. And the Formed Son seals the blessing of the one who hears and keeps her ways: *If a man keep my saying, he shall never see death* (John 8:51). To hear Wisdom and keep her ways is to keep his saying; the hearer who watches daily at her gates shall never see death, while they that hate her love death. The cornerstone-chapter ends where the Torah and the gospel end — on the choosing of life.',
       sv.verse_id, ev.verse_id, 'free', 28187
  FROM _s304_pr08_lookup sv, _s304_pr08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=8 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the price of wisdom is above rubies* (Job 28:18) — the scale Wisdom sets for herself in 8:11 is Job''s; the treasure no silver can buy.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-crieth-better-than-rubies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*She is more precious than rubies* (Proverbs 3:15) — the earlier word of the book fixes the same scale Wisdom now claims of herself in 8:11.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-crieth-better-than-rubies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a merchant man, seeking goodly pearls* (Matthew 13:45) — Wisdom''s cry to receive her above choice gold (8:10-11) answered in the merchant who seeks the supreme treasure.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-crieth-better-than-rubies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*one pearl of great price, went and sold all that he had, and bought it* (Matthew 13:46) — to receive Wisdom''s instruction and not silver (8:10) is to sell all for the one pearl.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-crieth-better-than-rubies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*them that love me, and keep my commandments* (Exodus 20:6) — Wisdom''s *I love them that love me* (8:17) is the covenant''s own grammar from Sinai; to love is to keep.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-i-love-them-that-love-me-and-those-that-seek-me-early-shall-find-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he that loveth me shall be loved of my Father* (John 14:21) — the Formed Son fulfils Wisdom''s reciprocity and names the love-test as keeping the commandments.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-i-love-them-that-love-me-and-those-that-seek-me-early-shall-find-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*seek, and ye shall find* (Matthew 7:7) — Wisdom''s *those that seek me early shall find me* (8:17) confirmed by the Son; the seeking is never in vain.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-i-love-them-that-love-me-and-those-that-seek-me-early-shall-find-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*If any of you lack wisdom, let him ask of Elohim* (James 1:5) — Ya''aqov names how the early seeker of 8:17 finds her: by asking; to him she is given.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-i-love-them-that-love-me-and-those-that-seek-me-early-shall-find-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (THE CHRISTOLOGY)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*In the beginning was the Word... and the Word was Elohim* (John 1:1) — Wisdom possessed in the beginning of his way (8:22) is the Formed Word, with the Father and yet his.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*All things were made by him* (John 1:3) — Wisdom *by him, as one brought up with him* (8:30) is the master-workman through whom all was made.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the image of the invisible Elohim, the firstborn of every creature* (Colossians 1:15) — possessed before the works of old (8:22): firstborn is rank from the Father, not a creature among creatures.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*by him were all things created... all things were created by him, and for him* (Colossians 1:16) — the very office Wisdom claims as the workman at the founding (8:30).'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he is before all things, and by him all things consist* (Colossians 1:17) — set up before the earth was (8:23), he both made and sustains the works of old.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Messiah... the wisdom of Elohim* (1 Corinthians 1:24) — the personified Wisdom of 8:22 named outright as the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*who of Elohim is made unto us wisdom* (1 Corinthians 1:30) — the delight beside the Father (8:30) given to his people as their wisdom.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*the beginning of the creation of Elohim* (Revelation 3:14) — the Son takes Wisdom''s *beginning of his way* (8:22): the source FROM which creation came, not the first thing made.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*by whom also he made the worlds* (Hebrews 1:2) — the Father made the worlds BY the Son, the office Wisdom held when the heavens were prepared (8:27).'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*the brightness of his glory, and the express image of his person* (Hebrews 1:3) — the daily delight of 8:30 is the radiance and exact imprint of the Formless Father.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*the breath of the power of Yahuah... flowing from the glory of the Almighty* (Wisdom of Solomon 7:25) — brought forth FROM the Father''s glory (8:24), not fashioned beside it.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'*the brightness of the everlasting light, the unspotted mirror... and the image of his goodness* (Wisdom of Solomon 7:26) — the radiance and exact mirror of the Formless Father; the language Hebrews takes up of the Son.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 13, E'*was present when thou madest the world* (Wisdom of Solomon 9:9) — *When he prepared the heavens, I was there* (8:27): the Formed Son present at the making.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 14, E'*I came out of the mouth of the Most High* (Sirach 24:3) — *possessed me in the beginning of his way* (8:22): the expressed Word proceeding FROM the Father, not made beside him.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 15, E'*He created me from the beginning before the world, and I shall never fail* (Sirach 24:9) — *set up from everlasting... or ever the earth was* (8:23): begotten before all worlds, the Word who never fails.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-wisdom-the-formed-son-brought-forth-the-agent-of-creation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By the word of Yahuah were the heavens made* (Psalm 33:6) — *When he prepared the heavens, I was there* (8:27): the Word and the Wisdom are one means of the making.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-yahuah-by-wisdom-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah by wisdom hath founded the earth* (Proverbs 3:19) — the founding done THROUGH the One present *when he appointed the foundations of the earth* (8:29).'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=29
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-yahuah-by-wisdom-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*where shall wisdom be found?* (Job 28:12) — Wisdom''s self-claim *I wisdom dwell with prudence* (8:12) answers Job''s great question.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-yahuah-by-wisdom-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Elohim understandeth the way thereof, and he knoweth the place thereof* (Job 28:23) — the Wisdom present at the founding (8:27) whose place is known to Elohim alone.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-yahuah-by-wisdom-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12) — the world established BY wisdom, through the One there *when he appointed the foundations* (8:29).'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=29
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-yahuah-by-wisdom-founded-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I have set before you life and death... therefore choose life* (Deuteronomy 30:19) — Wisdom''s life/death close (8:35-36) is the two ways Moshe set before the covenant people.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=35
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-whoso-findeth-me-findeth-life-all-they-that-hate-me-love-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*for he is thy life, and the length of thy days* (Deuteronomy 30:20) — to find Wisdom and obtain Yahuah''s favour (8:35) is to cleave to the One who IS life.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=35
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-whoso-findeth-me-findeth-life-all-they-that-hate-me-love-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*She is a tree of life to them that lay hold upon her* (Proverbs 3:18) — *whoso findeth me findeth life* (8:35): the finding of Wisdom is the laying hold of life itself.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=35
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-whoso-findeth-me-findeth-life-all-they-that-hate-me-love-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*If a man keep my saying, he shall never see death* (John 8:51) — the hearer who watches at Wisdom''s gates (8:34) keeps the Son''s saying and shall never see death.'
  FROM cross_reference_threads t
  JOIN _s304_pr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=8 AND sv.verse_number=34
  JOIN _s304_pr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-8-whoso-findeth-me-findeth-life-all-they-that-hate-me-love-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_proverbs_9.sql (Proverbs 9) -----
-- Chapter: Proverbs 9 — THE TWO BANQUETS, THE TWO HOSTESSES (the close of the great wisdom prologue, ch 1-9). Wisdom — the Formed Son personified from ch 8 — builds her house and spreads her table: *Wisdom hath builded her house, she hath hewn out her seven pillars... Come, eat of my bread, and drink of the wine which I have mingled* (9:1,5), the gospel-feast invitation to the covenant. At the heart stands THE MOTTO restated: *The fear of Yahuah (LORD) is the beginning of wisdom* (9:10), the inclusio with 1:7, the covenant-reverence that keeps the commandments. Against Wisdom's table sits the counterfeit hostess, Dame Folly, who also cries from her seat: *Stolen waters are sweet... But he knoweth not that the dead are there; and that her guests are in the depths of hell* (9:17-18) — the two banquets, the two ways, death at the end of her table.
-- Tag: pr09   Temp view: _s304_pr09_lookup
-- Sort band: base 28200, step 3 -> threads at 28200, 28203, 28206, 28209 (4 threads)
-- Source of EVERY row: 'canon','proverbs',9,v
--
-- Proverbs 9 coverage:
--   ★★ v.1-6 (Wisdom hath builded her house, she hath hewn out her seven pillars... Come, eat of my bread, and drink of the wine which I have mingled... Forsake the foolish, and live; and go in the way of understanding)
--        NT:     ★ Matthew 22:2-4 (a marriage for his son... all things are ready: come unto the marriage); Luke 14:16-17,23 (a great supper... Come; for all things are now ready... compel them to come in); John 6:35,51 (I am the bread of life... the living bread which came down from heaven) — THREAD 1 (the gospel feast, the bread + wine, the bidding to the table)
--        Extras: ★ Sirach 24:19-21 (Come to me, all you that be desirous of me, and fill yourselves with my fruits... They that eat me shall yet be hungry) — THREAD 1 (Wisdom's banquet, the come-and-eat in the restored witness)
--        Tanakh: ★ Isaiah 55:1 (come ye to the waters... come, buy wine and milk without money) — THREAD 1 (load-bearing: the free covenant feast of wine and bread)
--   ★★★ v.10 (The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding)
--        NT:     1 John 2:3-4 (hereby we do know that we know him, if we keep his commandments) — THREAD 2 (the knowledge-of-the-holy as commandment-keeping; the filter)
--        Extras: ★ Sirach 1:14 (To fear Yahuah (God) is the beginning of wisdom) — THREAD 2 (verbatim restated in the restored witness)
--        Tanakh: ★★ Proverbs 1:7 (The fear of Yahuah is the beginning of knowledge) the inclusio twin; ★ Psalm 111:10 (The fear of Yahuah is the beginning of wisdom: a good understanding have all they that do his commandments) verbatim; Job 28:28 (the fear of Yahuah, that is wisdom); Ecclesiastes 12:13 (Fear Elohim, and keep his commandments: for this is the whole duty of man) — THREAD 2 (load-bearing: the motto + the Torah-keeping it names)
--   ★ v.11-12 (by me thy days shall be multiplied, and the years of thy life shall be increased... if thou be wise, thou shalt be wise for thyself)
--        NT:     none warranted distinct (the length-of-days promise is carried by the Proverbs laterals; no NT witness closer than the wisdom-feast forward-weave already in THREAD 1)
--        Extras: ★ Sirach 1:20 (The root of wisdom is to fear Yahuah, and the branches thereof are long life) — THREAD 3 (the long-life fruit of the fear of Yahuah)
--        Tanakh: ★ Proverbs 3:2 (length of days, and long life, and peace, shall they add to thee); Proverbs 3:16 (Length of days is in her right hand) — THREAD 3 (load-bearing: wisdom's gift of multiplied days)
--   ★★ v.13-18 (A foolish woman is clamorous... Stolen waters are sweet, and bread eaten in secret is pleasant. But he knoweth not that the dead are there; and that her guests are in the depths of hell)
--        NT:     ★ Matthew 7:13-14 (wide is the gate, and broad is the way, that leadeth to destruction... strait is the gate, and narrow is the way, which leadeth unto life) — THREAD 4 (the two ways, the broad way to destruction = Folly's table)
--        Extras: none warranted distinct (the counterfeit-hostess / death-at-the-table image is carried whole by the Proverbs strange-woman laterals and the Matthew two-ways forward-weave; no clean extras witness closer)
--        Tanakh: ★ Proverbs 7:27 (Her house is the way to hell, going down to the chambers of death); Proverbs 2:18 (her house inclineth unto death, and her paths unto the dead); Proverbs 5:5 (Her feet go down to death; her steps take hold on hell) — THREAD 4 (load-bearing: the strange-woman whose house is the way to death; the deliberate counter-image of Wisdom's feast)
--   v.7-9 (He that reproveth a scorner getteth to himself shame... rebuke a wise man, and he will love thee... Give instruction to a wise man, and he will be yet wiser)
--        NT/Extras/Tanakh: none warranted distinct — the scorner-vs-wise-man interlude is wisdom-instruction proper to its own context; carried within THREAD 2's wisdom-frame (the wise receive instruction; the scorner is the fool of Folly's table) rather than given its own thread.
--
-- Threads (slug — target libraries):
--   1. proverbs-9-wisdom-hath-builded-her-house-come-eat-of-my-bread — Tanakh (Isaiah) + NT (Matthew, Luke, John) + Extras (Sirach) [extras] (★★ Wisdom's banquet; the bread + wine bidding; the marriage supper; the bread of life)
--   2. proverbs-9-the-fear-of-yahuah-is-the-beginning-of-wisdom — Tanakh (Proverbs 1, Psalm 111, Job, Ecclesiastes) + NT (1 John) + Extras (Sirach) [extras] (★★★ THE MOTTO; the inclusio with 1:7; covenant-reverence that keeps the commandments)
--   3. proverbs-9-by-me-thy-days-shall-be-multiplied — Tanakh (Proverbs 3) + Extras (Sirach) [extras] (★ wisdom's gift of multiplied days; long life the branch of the fear of Yahuah)
--   4. proverbs-9-the-foolish-woman-and-the-depths-of-hell — Tanakh (Proverbs 7, 2, 5) + NT (Matthew) [free] (★★ Dame Folly's counterfeit table; the two ways; death in the depths of sheol)
--
-- Framing notes:
--   ★★ WISDOM'S BANQUET (THREAD 1): *Wisdom hath builded her house, she hath hewn out her seven pillars... Come, eat of my bread, and drink of the wine which I have mingled* (9:1,5). Wisdom personified is the Formed Son of ch 8 (*Yahuah possessed me in the beginning of his way*), who builds the perfected house (seven pillars) and spreads the table. The come-and-eat is the bidding to the covenant feast: Isaiah's free table — *come ye to the waters... come, buy wine and milk without money* (Isaiah 55:1); the marriage the King made for his Son — *all things are ready: come unto the marriage* (Matthew 22:4); the great supper — *Come; for all things are now ready... compel them to come in* (Luke 14:17,23); and the bread itself made flesh — *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever* (John 6:51). The restored witness keeps Wisdom's same cry — *Come to me, all you that be desirous of me, and fill yourselves with my fruits* (Sirach 24:19). The bread + wine anticipate the Messiah's table.
--   ★★★ THE FEAR OF YAHUAH (THREAD 2): *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (9:10). The motto of the whole prologue, restated as the inclusio with *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7). Psalm 111:10 sings it verbatim and names what it IS — *a good understanding have all they that do his commandments*; Ecclesiastes seals it — *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (12:13). The fear of Yahuah is not terror but covenant reverence that KEEPS the Torah, and the filter holds: *hereby we do know that we know him, if we keep his commandments* (1 John 2:3). Sirach restates it verbatim — *To fear Yahuah (God) is the beginning of wisdom* (1:14). The knowledge of the holy IS the kept commandment.
--   ★ MULTIPLIED DAYS (THREAD 3): *For by me thy days shall be multiplied, and the years of thy life shall be increased* (9:11). Wisdom's own gift, lateral to her hands in ch 3 — *length of days, and long life, and peace, shall they add to thee* (3:2), *Length of days is in her right hand* (3:16) — and the restored witness binds it to the fear of Yahuah of v.10: *The root of wisdom is to fear Yahuah (God), and the branches thereof are long life* (Sirach 1:20). The long life is the branch growing from the root that is the fear of Yahuah.
--   ★★ DAME FOLLY (THREAD 4): *A foolish woman is clamorous... Stolen waters are sweet, and bread eaten in secret is pleasant. But he knoweth not that the dead are there; and that her guests are in the depths of hell* (9:13,17-18). The deliberate counter-image of Wisdom's feast — the counterfeit hostess who also cries from her seat in the high places, but whose table ends in death. She is the strange-woman of the prologue: *Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27); *her house inclineth unto death* (2:18); *Her feet go down to death; her steps take hold on hell* (5:5). Two banquets, two ways — and Yahusha (Jesus) names the two: *wide is the gate, and broad is the way, that leadeth to destruction... strait is the gate, and narrow is the way, which leadeth unto life* (Matthew 7:13-14). Folly's broad, easy table is the way to the depths of sheol; framed as the seed-war by conduct, her guests victims of the lie, not enemies.
--   EXTRAS: Sirach (clean parse) carries Wisdom's banquet (24:19-21), the motto verbatim (1:14), and the long-life branch (1:20) — fit witnesses; Sirach DOUBLE-WRITTEN edition 'apocrypha' + book 'ecclesiasticus'. No Jubilees/Jasher/Enoch warranted for a wisdom-poem.
--   VERSES WITH NO STANDALONE THREAD: v.7-9 (the scorner-vs-wise-man interlude) carried within the wisdom-frame of THREAD 2 (the wise receive instruction; the scorner is the fool of Folly's table), not given its own thread.

CREATE TEMP VIEW _s304_pr09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Wisdom hath builded her house — come, eat of my bread (the gospel feast)
    ('canon','proverbs',9,5,'canon','isaiah',55,1,'free',
      E'*Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price* (Isaiah 55:1). Wisdom''s bidding — *Come, eat of my bread, and drink of the wine which I have mingled* (Proverbs 9:5) — is Isaiah''s free covenant feast: *come ye to the waters... come, buy wine and milk without money*. The table is spread, the wine mingled, and the only price is to come and eat; the invitation is the covenant itself, given without money to all who thirst.'),
    ('canon','proverbs',9,5,'canon','matthew',22,4,'free',
      E'*Again, he sent forth other servants, saying, Tell them which are bidden, Behold, I have prepared my dinner: my oxen and my fatlings are killed, and all things are ready: come unto the marriage* (Matthew 22:4). Wisdom who *hath killed her beasts; she hath mingled her wine; she hath also furnished her table* (Proverbs 9:2) and bids *Come, eat of my bread* (9:5) is the King who makes the marriage for his Son: *my oxen and my fatlings are killed, and all things are ready: come unto the marriage*. The furnished table of Wisdom becomes the marriage feast of the kingdom — all things ready, the bidding gone forth.'),
    ('canon','proverbs',9,3,'canon','luke',14,17,'free',
      E'*And sent his servant at supper time to say to them that were bidden, Come; for all things are now ready* (Luke 14:17). Wisdom who *hath sent forth her maidens: she crieth upon the highest places of the city* (Proverbs 9:3) is the host of the great supper who sends his servant: *Come; for all things are now ready*. The maidens crying from the high places and the servant sent at supper time bear the one bidding — the table is furnished, come.'),
    ('canon','proverbs',9,4,'canon','luke',14,23,'free',
      E'*And the lord said unto the servant, Go out into the highways and hedges, and compel them to come in, that my house may be filled* (Luke 14:23). Wisdom''s cry to the simple — *Whoso is simple, let him turn in hither* (Proverbs 9:4) — opens into the lord''s charge to fill the house: *Go out into the highways and hedges, and compel them to come in, that my house may be filled*. The house Wisdom built (9:1) is the house to be filled; the simple turned in are the highways and hedges gathered to the feast.'),
    ('canon','proverbs',9,5,'canon','john',6,51,'free',
      E'*I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51). The bread Wisdom sets out — *Come, eat of my bread* (Proverbs 9:5) — is the Formed Son made flesh: *I am the living bread which came down from heaven... and the bread that I will give is my flesh*. Wisdom personified from ch 8 spreads her own table, and the bread of that table is at last the Word made flesh, given for the life of the world.'),
    ('canon','proverbs',9,5,'apocrypha','ecclesiasticus',24,19,'extras',
      E'*Come to me, all you that be desirous of me, and fill yourselves with my fruits* (Sirach 24:19). The restored witness keeps Wisdom''s same banquet-cry as *Come, eat of my bread, and drink of the wine which I have mingled* (Proverbs 9:5): *Come to me, all you that be desirous of me, and fill yourselves with my fruits*. Wisdom spreads her table in both books and bids the desirous come and eat; the next verses — *they that eat me shall yet be hungry, and they that drink me shall yet be thirsty* (Sirach 24:21) — make the feast inexhaustible, the same table John''s bread of life never empties.'),

    -- THREAD 2: The fear of Yahuah is the beginning of wisdom (THE MOTTO; the inclusio)
    ('canon','proverbs',9,10,'canon','proverbs',1,7,'free',
      E'*The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7). The motto of *The fear of Yahuah (LORD) is the beginning of wisdom* (Proverbs 9:10) closes the inclusio it opened: *The fear of Yahuah (LORD) is the beginning of knowledge*. The whole prologue of nine chapters is bracketed by the one truth — the fear of Yahuah is where wisdom and knowledge begin, and the fools who despise it sit at Folly''s table.'),
    ('canon','proverbs',9,10,'canon','psalms',111,10,'free',
      E'*The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever* (Psalm 111:10). The psalm sings the motto verbatim and names what the *beginning of wisdom* of Proverbs 9:10 IS: *a good understanding have all they that do his commandments*. The fear of Yahuah is no abstract dread but the covenant reverence that DOES the commandments; understanding and the kept Torah are one.'),
    ('canon','proverbs',9,10,'canon','job',28,28,'free',
      E'*And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28). Where Proverbs 9:10 sets *the fear of Yahuah (LORD)* as *the beginning of wisdom* and *the knowledge of the holy* as understanding, Job seals the same equation: *the fear of Yahuah, that is wisdom; and to depart from evil is understanding*. The fear of Yahuah IS wisdom; the departing from evil IS the understanding — reverence and obedience, not speculation, are the whole of it.'),
    ('canon','proverbs',9,10,'canon','ecclesiastes',12,13,'free',
      E'*Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). The motto of Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom* — is brought to its conclusion in Qoheleth: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man*. The fear of Yahuah and the kept commandment are bound as one duty; the beginning of wisdom is the whole of man''s calling — to revere and to obey.'),
    ('canon','proverbs',9,10,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments* (1 John 2:3). The *knowledge of the holy* that is *understanding* in Proverbs 9:10 is bound by Yochanan (John) to the kept commandment: *hereby we do know that we know him, if we keep his commandments*. The knowledge of the Holy One is not a claim but a walk; to know Him is to keep His Torah — the same filter the fear of Yahuah opens, that any knowing without commandment-keeping is a lie (1 John 2:4).'),
    ('canon','proverbs',9,10,'apocrypha','ecclesiasticus',1,14,'extras',
      E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Sirach 1:14). The restored witness restates Proverbs 9:10 nearly verbatim — *To fear Yahuah (God) is the beginning of wisdom* — and roots it deeper still: *it was created with the faithful in the womb*. The fear of Yahuah as the beginning of wisdom is the one foundation the whole wisdom-library is built upon, planted in the faithful from the start.'),

    -- THREAD 3: By me thy days shall be multiplied (wisdom's gift of long life)
    ('canon','proverbs',9,11,'canon','proverbs',3,2,'free',
      E'*For length of days, and long life, and peace, shall they add to thee* (Proverbs 3:2). Wisdom''s promise — *by me thy days shall be multiplied, and the years of thy life shall be increased* (Proverbs 9:11) — is the same gift her keeping bestows in the prologue: *length of days, and long life, and peace, shall they add to thee*. The multiplied days and increased years are wisdom''s own dowry to the one who heeds her.'),
    ('canon','proverbs',9,11,'canon','proverbs',3,16,'free',
      E'*Length of days is in her right hand; and in her left hand riches and honour* (Proverbs 3:16). The increase of years in *by me thy days shall be multiplied* (Proverbs 9:11) is held in Wisdom''s own hand: *Length of days is in her right hand; and in her left hand riches and honour*. Wisdom does not merely point to long life; she carries it in her right hand to give to those who take hold of her.'),
    ('canon','proverbs',9,11,'apocrypha','ecclesiasticus',1,20,'extras',
      E'*The root of wisdom is to fear Yahuah (God), and the branches thereof are long life* (Sirach 1:20). The multiplied days of *by me thy days shall be multiplied* (Proverbs 9:11) are bound by the restored witness to the fear of Yahuah of the verse just before (9:10): *The root of wisdom is to fear Yahuah (God), and the branches thereof are long life*. The long life is the branch that grows from the root — fear Yahuah, and the years are increased.'),

    -- THREAD 4: The foolish woman — and the depths of hell (Dame Folly's counterfeit table)
    ('canon','proverbs',9,18,'canon','proverbs',7,27,'free',
      E'*Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27). The end of Folly''s table — *he knoweth not that the dead are there; and that her guests are in the depths of hell* (Proverbs 9:18) — is the strange-woman''s house of the prologue: *Her house is the way to hell, going down to the chambers of death*. The clamorous woman who builds no house but borrows a seat in the high places leads her guests by the same road; her banquet ends in the chambers of death.'),
    ('canon','proverbs',9,18,'canon','proverbs',2,18,'free',
      E'*For her house inclineth unto death, and her paths unto the dead* (Proverbs 2:18). The depths of sheol where Folly''s guests lie — *that her guests are in the depths of hell* (Proverbs 9:18) — are the incline of the strange-woman''s house: *her house inclineth unto death, and her paths unto the dead*. Every path of the counterfeit hostess slopes downward to the dead; the sweet stolen waters (9:17) are the bait at the head of that road.'),
    ('canon','proverbs',9,18,'canon','proverbs',5,5,'free',
      E'*Her feet go down to death; her steps take hold on hell* (Proverbs 5:5). The deadly destination of Folly''s table — *the dead are there; and that her guests are in the depths of hell* (Proverbs 9:18) — is the strange-woman''s own walk: *Her feet go down to death; her steps take hold on hell*. The two hostesses of the chapter are the two ways read by conduct — Wisdom''s feet stand in her builded house, Folly''s feet go down to death.'),
    ('canon','proverbs',9,17,'canon','matthew',7,13,'free',
      E'*Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13). Folly''s easy, stolen sweetness — *Stolen waters are sweet, and bread eaten in secret is pleasant* (Proverbs 9:17) — is the broad way Yahusha (Jesus) names: *wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat*. The two banquets of the chapter are the two ways: Folly''s broad, pleasant table leading to the depths of hell, set against Wisdom''s narrow, builded house.'),
    ('canon','proverbs',9,6,'canon','matthew',7,14,'free',
      E'*Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). Wisdom''s charge — *Forsake the foolish, and live; and go in the way of understanding* (Proverbs 9:6) — is the narrow way of life: *strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it*. To forsake the foolish (Folly''s broad table) and go in the way of understanding is to enter the strait gate; the two ways of the Sermon are the two hostesses of Proverbs 9.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s304_pr09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s304_pr09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-9-wisdom-hath-builded-her-house-come-eat-of-my-bread',
       E'Wisdom hath builded her house — come, eat of my bread',
       E'The great prologue closes with a feast. Wisdom — the Formed Son personified through chapter 8, *Yahuah possessed me in the beginning of his way* — builds her house and spreads her table: *Wisdom hath builded her house, she hath hewn out her seven pillars: She hath killed her beasts; she hath mingled her wine; she hath also furnished her table* (Proverbs 9:1-2). Then she sends out the bidding: *She hath sent forth her maidens: she crieth upon the highest places of the city, Whoso is simple, let him turn in hither... Come, eat of my bread, and drink of the wine which I have mingled* (9:3-5). The seven pillars are the perfected house; the killed beasts and mingled wine are the furnished feast; the come-and-eat is the invitation to the covenant itself. This is Isaiah''s free table — *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price* (Isaiah 55:1) — the feast that costs nothing but the coming. It is the marriage the King made for his Son: *Behold, I have prepared my dinner: my oxen and my fatlings are killed, and all things are ready: come unto the marriage* (Matthew 22:4); and the great supper whose servant cries *Come; for all things are now ready* (Luke 14:17), whose lord charges *compel them to come in, that my house may be filled* (Luke 14:23) — the house Wisdom built, at last filled. And the bread of that table is the Formed Son made flesh: *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51). The restored witness keeps Wisdom''s very cry — *Come to me, all you that be desirous of me, and fill yourselves with my fruits... they that eat me shall yet be hungry, and they that drink me shall yet be thirsty* (Sirach 24:19,21) — the inexhaustible table. From Proverbs to Isaiah to the gospel feast, Wisdom''s bread and mingled wine anticipate the Messiah''s own table, the bidding to the covenant gone out into the highways.',
       sv.verse_id, ev.verse_id, 'extras', 28200
  FROM _s304_pr09_lookup sv, _s304_pr09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-9-the-fear-of-yahuah-is-the-beginning-of-wisdom',
       E'The fear of Yahuah is the beginning of wisdom',
       E'At the heart of the chapter stands the motto of the whole prologue, restated: *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). This closes the inclusio that opened nine chapters before — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7) — so that the entire prologue is bracketed by the one truth: wisdom and knowledge begin in the fear of Yahuah, and the fools who despise it are the very guests of Folly''s table. But the fear of Yahuah is no abstract dread; it is the covenant reverence that KEEPS the commandments. The psalm sings the motto verbatim and names what it is: *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments* (Psalm 111:10). Job seals the equation: *Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28). And Qoheleth brings it to its conclusion: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). The fear of Yahuah and the kept Torah are bound as one. The filter holds it fast in the apostolic word — *hereby we do know that we know him, if we keep his commandments* (1 John 2:3) — for the *knowledge of the holy* that is understanding is not a claim but a walk; to know the Holy One is to keep His commandments. The restored witness restates it nearly verbatim and roots it from the womb: *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Sirach 1:14). From Genesis-old reverence to the last apostle, the beginning of all wisdom is the fear of Yahuah that does His Torah.',
       sv.verse_id, ev.verse_id, 'extras', 28203
  FROM _s304_pr09_lookup sv, _s304_pr09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-9-by-me-thy-days-shall-be-multiplied',
       E'By me thy days shall be multiplied — wisdom''s gift of long life',
       E'Wisdom names her own dowry, the gift she carries to the one who heeds her: *For by me thy days shall be multiplied, and the years of thy life shall be increased* (Proverbs 9:11). This is the same length of days promised in the prologue, where keeping the Torah and embracing Wisdom are one — *For length of days, and long life, and peace, shall they add to thee* (Proverbs 3:2) — and where Wisdom holds the gift in her own hand: *Length of days is in her right hand; and in her left hand riches and honour* (Proverbs 3:16). Wisdom does not merely point to long life; she carries it in her right hand to give. And the restored witness binds the multiplied days directly to the fear of Yahuah named in the verse just before (9:10): *The root of wisdom is to fear Yahuah (God), and the branches thereof are long life* (Sirach 1:20). The long life is the branch that grows from the root — fear Yahuah, take hold of Wisdom, and the years are increased. The personal stakes follow: *if thou be wise, thou shalt be wise for thyself: but if thou scornest, thou alone shalt bear it* (9:12) — each man reaps his own choosing at the two tables.',
       sv.verse_id, ev.verse_id, 'extras', 28206
  FROM _s304_pr09_lookup sv, _s304_pr09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'proverbs-9-the-foolish-woman-and-the-depths-of-hell',
       E'The foolish woman — and the depths of hell',
       E'Against Wisdom''s builded house and furnished table sits the counterfeit hostess, the deliberate counter-image of everything the chapter has set out: *A foolish woman is clamorous: she is simple, and knoweth nothing. For she sitteth at the door of her house, on a seat in the high places of the city, To call passengers who go right on their ways* (Proverbs 9:13-15). She builds nothing and hews no pillars; she borrows a seat in the same high places where Wisdom cries, and she steals Wisdom''s very words — *Whoso is simple, let him turn in hither* (9:16) — to bait the unwary. Then comes her offer: *Stolen waters are sweet, and bread eaten in secret is pleasant. But he knoweth not that the dead are there; and that her guests are in the depths of hell* (9:17-18). Her table ends in death. She is the strange-woman of the whole prologue: *Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27); *her house inclineth unto death, and her paths unto the dead* (Proverbs 2:18); *Her feet go down to death; her steps take hold on hell* (Proverbs 5:5). Two hostesses, two banquets, two ways — and Yahusha (Jesus) names them at the close of the Sermon: *wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat: Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:13-14). Folly''s broad, easy, stolen sweetness is the way to the depths of sheol; Wisdom''s charge — *Forsake the foolish, and live; and go in the way of understanding* (9:6) — is the strait gate to life. This is the seed-war read by conduct, never by ethnicity: two ways set before every passer-by, the guests of the counterfeit table victims of the lie, not enemies, called still to forsake the foolish and live.',
       sv.verse_id, ev.verse_id, 'free', 28209
  FROM _s304_pr09_lookup sv, _s304_pr09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='proverbs' AND ev.chapter_number=9 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*come ye to the waters... come, buy wine and milk without money and without price* (Isaiah 55:1) — Wisdom''s bread + mingled wine of 9:5 is Isaiah''s free covenant feast; the only price is to come and eat.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-wisdom-hath-builded-her-house-come-eat-of-my-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*my oxen and my fatlings are killed, and all things are ready: come unto the marriage* (Matthew 22:4) — Wisdom''s killed beasts and furnished table (9:2) become the King''s marriage feast for his Son; all things ready, the bidding gone forth.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-wisdom-hath-builded-her-house-come-eat-of-my-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Come; for all things are now ready* (Luke 14:17) — Wisdom''s maidens crying from the high places (9:3) and the servant sent at supper time bear the one bidding: the table is furnished, come.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-wisdom-hath-builded-her-house-come-eat-of-my-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*compel them to come in, that my house may be filled* (Luke 14:23) — Wisdom''s cry to the simple (9:4) opens into the lord''s charge; the house Wisdom built (9:1) is the house to be filled.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-wisdom-hath-builded-her-house-come-eat-of-my-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I am the living bread which came down from heaven... the bread that I will give is my flesh* (John 6:51) — the bread Wisdom sets out (9:5) is the Formed Son made flesh, given for the life of the world.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-wisdom-hath-builded-her-house-come-eat-of-my-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Come to me, all you that be desirous of me, and fill yourselves with my fruits* (Sirach 24:19) — the restored witness keeps Wisdom''s same banquet-cry of 9:5; the inexhaustible table the bread of life never empties.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-wisdom-hath-builded-her-house-come-eat-of-my-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7) — the inclusio twin of 9:10; the whole nine-chapter prologue bracketed by the one motto.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-fear-of-yahuah-is-the-beginning-of-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments* (Psalm 111:10) — the motto verbatim, naming what it IS: the kept commandments.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-fear-of-yahuah-is-the-beginning-of-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28) — Job seals the equation of 9:10: reverence IS wisdom, obedience IS understanding.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-fear-of-yahuah-is-the-beginning-of-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13) — Qoheleth brings 9:10 to its conclusion: the fear of Yahuah and the kept commandment bound as one duty.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-fear-of-yahuah-is-the-beginning-of-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*hereby we do know that we know him, if we keep his commandments* (1 John 2:3) — the knowledge of the holy (9:10) bound to the kept commandment; to know the Holy One is to keep His Torah, the filter.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-fear-of-yahuah-is-the-beginning-of-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Sirach 1:14) — the restored witness restates 9:10 nearly verbatim and roots it from the womb.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-fear-of-yahuah-is-the-beginning-of-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For length of days, and long life, and peace, shall they add to thee* (Proverbs 3:2) — the multiplied days of 9:11 are wisdom''s same dowry from the prologue.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-by-me-thy-days-shall-be-multiplied'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Length of days is in her right hand; and in her left hand riches and honour* (Proverbs 3:16) — Wisdom carries the increase of years (9:11) in her own right hand to give.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-by-me-thy-days-shall-be-multiplied'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The root of wisdom is to fear Yahuah (God), and the branches thereof are long life* (Sirach 1:20) — the restored witness binds the multiplied days of 9:11 to the fear of Yahuah of 9:10: long life the branch of the root.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-by-me-thy-days-shall-be-multiplied'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Her house is the way to hell, going down to the chambers of death* (Proverbs 7:27) — the end of Folly''s table (9:18) is the strange-woman''s house of the prologue; her guests led by the same road.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=18
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-foolish-woman-and-the-depths-of-hell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For her house inclineth unto death, and her paths unto the dead* (Proverbs 2:18) — the depths of sheol where Folly''s guests lie (9:18); every path of the counterfeit hostess slopes to the dead.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=18
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-foolish-woman-and-the-depths-of-hell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Her feet go down to death; her steps take hold on hell* (Proverbs 5:5) — the deadly destination of Folly''s table (9:18) is the strange-woman''s own walk; Wisdom''s feet stand, Folly''s go down.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=18
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-foolish-woman-and-the-depths-of-hell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*wide is the gate, and broad is the way, that leadeth to destruction* (Matthew 7:13) — Folly''s easy, stolen sweetness (9:17) is the broad way; the two banquets are the two ways.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-foolish-woman-and-the-depths-of-hell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*strait is the gate, and narrow is the way, which leadeth unto life* (Matthew 7:14) — Wisdom''s charge to forsake the foolish and live (9:6) is the strait gate to life; the two ways of the Sermon are the two hostesses.'
  FROM cross_reference_threads t
  JOIN _s304_pr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='proverbs' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s304_pr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='proverbs-9-the-foolish-woman-and-the-depths-of-hell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session304 — Proverbs cross-references complete.'
