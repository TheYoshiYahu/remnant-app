-- =====================================================================
-- Session 243 — 2 John FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session243_2john_cross_references.sql
-- =====================================================================

\echo 'session243 — 2 John cross-references starting...'
BEGIN;

-- ----- fragment: minion_2john_01.sql (S243 2 John) -----
-- =====================================================================
-- S243 minion — 2 JOHN (Yochanan Bet) 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Book: 2 JOHN — one chapter, 13 verses. Tag: t243 (temp view _s243_2john_lookup).
-- Sort band: floor 10150, step 3 (10150, 10153, 10156, 10159 used).
-- Source is ALWAYS the canon 2 John verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: 2 John is the miniature of 1 John, and its center is THE COMMANDMENT FROM THE
-- BEGINNING. The elder writes to *the elect lady and her children* — the scattered covenant
-- assembly — and presses the same master-test as 1 John: love is to *walk after his commandments*,
-- the OLD commandment, *not... a new commandment* (v.5-6). The Torah is in force; love and obedience
-- are one. The deceiver who confesses not that Yahusha (Jesus) is come in the flesh is the antichrist,
-- tried by the Torah's own test of the false prophet (v.7); abide in the doctrine, for whosoever
-- *transgresseth* (anomia, the law-breaking root) hath not Elohim (v.9). No replacement theology,
-- no law-vs-grace antithesis. Christology: the Father the source, the Son the Son of the Father (v.3,9);
-- no co-equal-persons grammar.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   greeting: the elect lady; Grace, mercy, peace from the Father and the Son
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (greeting, no load-bearing root)
--   v.4     walking in truth, as we received commandment from the Father
--           Tanakh: Psalm 86:11 (teach me thy way... I will walk in thy truth), Psalm 119:1 (walk in the law of Yahuah)
--           Extras: none warranted   NT: none warranted
--   v.5-6   the commandment from the beginning: love is to walk after his commandments [LOAD-BEARING ***]
--           Tanakh: Deuteronomy 6:5 (love Yahuah... with all thine heart), Deuteronomy 6:6 (these words... in thine heart),
--                   Leviticus 19:18 (love thy neighbour as thyself), Deuteronomy 5:33 (walk in all the ways which Yahuah... commanded),
--                   Deuteronomy 10:12 (to walk in all his ways, and to love him)
--           Extras: Sirach 2:15 (they that love him will keep his ways), Sirach 2:16 (they that love him shall be filled with the law)
--           NT: 1 John 2:7 (no new commandment, but an old commandment — self-link, LIVE),
--               1 John 5:3 (the love of Elohim, that we keep his commandments — self-link, LIVE)
--   v.7     deceivers who confess not Yahusha is come in the flesh = antichrist [LOAD-BEARING **]
--           Tanakh: Deuteronomy 13:1-3 / 13:5 (the false prophet who entices to other gods, put to death),
--                   Deuteronomy 18:20 / 18:22 (the prophet who presumes to speak), Isaiah 8:20 (to the law and to the testimony)
--           Extras: none warranted   NT: 1 John 4:1 / 4:3 (try the spirits / antichrist — self-link, LIVE)
--   v.8     look to yourselves, that ye receive a full reward
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.9-11  abide in the doctrine; transgresseth (anomia); receive not him that bringeth not this doctrine
--           Tanakh: Deuteronomy 13:6 / 13:8 (consent not to the one who entices to other gods), Psalm 1:1 (walk not in the counsel of the ungodly)
--           Extras: none warranted   NT: 1 John 3:4 (sin is the transgression of the law — self-link, LIVE)
--   v.12-13 closing; the children of thy elect sister greet thee
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (closing, no load-bearing root)
--
-- THREADS (slug -> target libraries):
--   10150 2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19  (Tanakh + Extras + NT)  [LOAD-BEARING ***]
--   10153 2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8  (Tanakh + NT)  [LOAD-BEARING **]
--   10156 2-john-1-abide-in-the-doctrine-deuteronomy-13-psalm-1  (Tanakh + NT)
--   10159 2-john-1-walking-in-truth-as-we-received-commandment-psalm-86-119  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s243_2john_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ---------------------------------------------------------------------
-- B. cross_references INSERT  (column is tier_required, NOT tier)
-- ---------------------------------------------------------------------
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
FROM (VALUES
  -- thread: 2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19  [LOAD-BEARING ***]
  ('canon','2-john',1,5,'canon','deuteronomy',6,5,'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). The elder protests that he writes *not... a new commandment unto thee, but that which we had from the beginning, that we love one another* (2 John 5). The commandment *from the beginning* is the Shema''s own word — love is the first and oldest charge, given in the Torah; John adds no new law but recalls the one that was always there.'),
  ('canon','2-john',1,6,'canon','deuteronomy',6,6,'free', E'*And these words, which I command thee this day, shall be in thine heart.* (Deuteronomy 6:6). *And this is love, that we walk after his commandments. This is the commandment, That, as ye have heard from the beginning, ye should walk in it* (2 John 6). The *words... in thine heart* are the very commandments John says love walks after; the commandment heard *from the beginning* is Moses'' *this day* — one Torah, written on the heart, walked in.'),
  ('canon','2-john',1,6,'canon','leviticus',19,18,'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). John defines *love one another* (2 John 5) as walking *after his commandments* (2 John 6) — and *love thy neighbour as thyself* is that commandment from of old, a statute of Yahuah (LORD), not a sentiment that replaces the Torah but a clause within it.'),
  ('canon','2-john',1,6,'canon','deuteronomy',5,33,'free', E'*Ye shall walk in all the ways which Yahuah Elohaychem (the LORD your God) hath commanded you, that ye may live, and that it may be well with you, and that ye may prolong your days in the land which ye shall possess.* (Deuteronomy 5:33). When John says *we walk after his commandments... ye should walk in it* (2 John 6), he speaks Moses'' own idiom — to *walk in all the ways* Yahuah commanded. Love is not a feeling untethered from obedience; it is the walking-after itself.'),
  ('canon','2-john',1,6,'canon','deuteronomy',10,12,'free', E'*And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul.* (Deuteronomy 10:12). To *walk in all his ways* AND *to love him* stand together in Moses, as they do in John: *this is love, that we walk after his commandments* (2 John 6). The love and the walking are one charge, from the beginning.'),
  ('canon','2-john',1,5,'apocrypha','ecclesiasticus',2,15,'extras', E'*They that fear Yahuah (God) will not disobey his Word; and they that love him will keep his ways.* (Sirach 2:15). The wisdom of the second-Temple sages already joins what John joins — *they that love him will keep his ways* is *this is love, that we walk after his commandments* (2 John 6) centuries before the elder wrote it. Love and obedience were never two things.'),
  ('canon','2-john',1,6,'apocrypha','ecclesiasticus',2,16,'extras', E'*They that fear Yahuah (God) will seek that which is well, pleasing to him; and they that love him shall be filled with the law.* (Sirach 2:16). *They that love him shall be filled with the law* — the very fusion John presses: *this is love, that we walk after his commandments* (2 John 6). To love is to be filled with the Torah and to walk in it, not freed from it.'),
  ('canon','2-john',1,5,'canon','1-john',2,7,'free', E'*Brethren, I write no new commandment unto you, but an old commandment which ye had from the beginning. The old commandment is the word which ye have heard from the beginning.* (1 John 2:7). The elder''s own first letter says it plainly, and 2 John echoes it word for word: *not as though I wrote a new commandment unto thee, but that which we had from the beginning* (2 John 5). One author, one doctrine — the commandment is old, from the beginning, never superseded.'),
  ('canon','2-john',1,6,'canon','1-john',5,3,'free', E'*For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* (1 John 5:3). The 1 John twin of 2 John 6: *this is love, that we walk after his commandments.* John defines love the same way in both letters — keeping and walking-after the commandments — and adds that *his commandments are not grievous,* no burden cast off but a yoke gladly borne.'),

  -- thread: 2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8  [LOAD-BEARING **]
  ('canon','2-john',1,7,'canon','deuteronomy',13,1,'free', E'*If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder.* (Deuteronomy 13:1). John warns that *many deceivers are entered into the world... This is a deceiver and an antichrist* (2 John 7). The Torah set the test long before: a prophet is not proved true by a sign, but by whether he turns you toward or away from Yahuah — the deceiver is the one who leads astray.'),
  ('canon','2-john',1,7,'canon','deuteronomy',13,3,'free', E'*Thou shalt not hearken unto the words of that prophet, or that dreamer of dreams: for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul.* (Deuteronomy 13:3). The deceivers of 2 John 7 are the false prophets of Deuteronomy 13 — those who *confess not that Yahusha HaMashiach (Jesus Christ) is come in the flesh.* The trial is the same: do they hold you to Yahuah, or draw you away?'),
  ('canon','2-john',1,7,'canon','deuteronomy',13,5,'free', E'*And that prophet, or that dreamer of dreams, shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)... So shalt thou put the evil away from the midst of thee.* (Deuteronomy 13:5). The *deceiver and an antichrist* (2 John 7) stands condemned by the Torah''s sentence on the false prophet — he who turns the people from Yahuah is *put... away from the midst.* John''s *receive him not* (2 John 10) is this same separating.'),
  ('canon','2-john',1,7,'canon','deuteronomy',18,20,'free', E'*But the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak, or that shall speak in the name of other gods, even that prophet shall die.* (Deuteronomy 18:20). The deceiver who *confess not that Yahusha... is come in the flesh* (2 John 7) speaks falsely in the Name — the presumptuous prophet of Deuteronomy 18, whose word does not stand because Yahuah did not speak it.'),
  ('canon','2-john',1,7,'canon','deuteronomy',18,22,'free', E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* (Deuteronomy 18:22). 2 John 7''s antichrist is tested by this rule: the confession of *Yahusha... come in the flesh* is the word that came to pass; the deceiver who denies it speaks presumptuously and is not to be feared but refused.'),
  ('canon','2-john',1,7,'canon','isaiah',8,20,'free', E'*To the law and to the testimony: if they speak not according to this word, it is because there is no light in them.* (Isaiah 8:20). This is the measuring-line laid against every deceiver of 2 John 7 — *to the law and to the testimony.* The one who *confess not that Yahusha... is come in the flesh* speaks not according to this word; in him there is no light.'),
  ('canon','2-john',1,7,'canon','1-john',4,1,'free', E'*Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* (1 John 4:1). The 1 John twin of 2 John 7''s warning: *many deceivers are entered into the world.* Same elder, same alarm — *many false prophets are gone out* — and the same Torah-rooted command to try them rather than believe every spirit.'),
  ('canon','2-john',1,7,'canon','1-john',4,3,'free', E'*And every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh is not of Elohim (God): and this is that spirit of antichrist, whereof ye have heard that it should come; and even now already is it in the world.* (1 John 4:3). 2 John 7 names what 1 John 4:3 named: the one *who confess not that Yahusha HaMashiach... is come in the flesh* is *a deceiver and an antichrist.* The two letters speak with one voice; the test of the flesh-come Messiah is the test of the spirits.'),

  -- thread: 2-john-1-abide-in-the-doctrine-deuteronomy-13-psalm-1
  ('canon','2-john',1,9,'canon','deuteronomy',13,6,'free', E'*If thy brother, the son of thy mother, or thy son, or thy daughter, or the wife of thy bosom, or thy friend, which is as thine own soul, entice thee secretly, saying, Let us go and serve other gods, which thou hast not known, thou, nor thy fathers.* (Deuteronomy 13:6). John says *whosoever transgresseth, and abideth not in the doctrine of Messiah (Christ), hath not Elohim* (2 John 9) — and bids *receive him not into your house* (2 John 10). The Torah taught this refusal first: not even the nearest enticer is to be followed when he draws you from Yahuah.'),
  ('canon','2-john',1,10,'canon','deuteronomy',13,8,'free', E'*Thou shalt not consent unto him, nor hearken unto him; neither shall thine eye pity him, neither shalt thou spare, neither shalt thou conceal him.* (Deuteronomy 13:8). *If there come any unto you, and bring not this doctrine, receive him not into your house, neither bid him Elohim (God) speed* (2 John 10). John''s refusal to harbour the false teacher is Moses'' *thou shalt not consent... nor conceal him* — the same guarding of the assembly against the one who would lead it astray.'),
  ('canon','2-john',1,9,'canon','psalms',1,1,'free', E'*Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* (Psalm 1:1). To *abide... in the doctrine of Messiah* (2 John 9) is to walk *not... in the counsel of the ungodly.* The one who *transgresseth* has stepped out of the way; the blessed man keeps his footing in the Torah and does not sit down with the scornful teacher.'),
  ('canon','2-john',1,9,'canon','1-john',3,4,'free', E'*Whosoever committeth sin transgresseth also the law: for sin is the transgression of the law.* (1 John 3:4). John''s word *whosoever transgresseth, and abideth not in the doctrine* (2 John 9) carries the same anomia his first letter defines: *sin is the transgression of the law.* To leave the doctrine is to break the Torah; the doctrine and the law are not at odds but of one piece.'),

  -- thread: 2-john-1-walking-in-truth-as-we-received-commandment-psalm-86-119
  ('canon','2-john',1,4,'canon','psalms',86,11,'free', E'*Teach me thy way, O Yahuah (LORD); I will walk in thy truth: unite my heart to fear thy name.* (Psalm 86:11). The elder rejoiced *that I found of thy children walking in truth, as we have received a commandment from the Father* (2 John 4). To *walk in truth* is the psalmist''s own prayer — *I will walk in thy truth* — the truth being Yahuah''s taught way, kept with an undivided heart.'),
  ('canon','2-john',1,4,'canon','psalms',119,1,'free', E'*Blessed are the undefiled in the way, who walk in the law of Yahuah (LORD).* (Psalm 119:1). *Walking in truth, as we have received a commandment from the Father* (2 John 4) is *to walk in the law of Yahuah.* The truth John''s children walk in is the commandment received from the Father — the undefiled way of the Torah, not a path apart from it.')
) AS i(src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note)
JOIN _s243_2john_lookup sv ON sv.edition_slug = i.src_edition AND sv.book_slug = i.src_slug
  AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
JOIN _s243_2john_lookup tv ON tv.edition_slug = i.tgt_edition AND tv.book_slug = i.tgt_slug
  AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- C. threads INSERT
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT i.slug, i.title, i.summary_md, a1.verse_id, a2.verse_id, i.tier::content_tier, i.sort_order
FROM (VALUES
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19',
   'The commandment from the beginning: love is to walk after His commandments (Deuteronomy 6 / Leviticus 19)',
   E'2 John''s center: *not as though I wrote a new commandment unto thee, but that which we had from the beginning, that we love one another. And this is love, that we walk after his commandments. This is the commandment, That, as ye have heard from the beginning, ye should walk in it* (2 John 5-6). The elder EXPRESSLY denies a new law — the commandment is *that which we had from the beginning,* and love itself is defined as walking after His commandments. The root is the Shema and the love-command of the Torah: *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deuteronomy 6:5), *these words... shall be in thine heart* (Deuteronomy 6:6), *thou shalt love thy neighbour as thyself* (Leviticus 19:18), *ye shall walk in all the ways which Yahuah... hath commanded you* (Deuteronomy 5:33), *to walk in all his ways, and to love him* (Deuteronomy 10:12). The second-Temple sages had already fused the two: *they that love him will keep his ways* (Sirach 2:15), *they that love him shall be filled with the law* (Sirach 2:16). And the elder''s own first letter says it twice over — *an old commandment which ye had from the beginning* (1 John 2:7), *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3). Love is not a sentiment that replaces the Torah; love IS walking after His commandments. The commandment is old, from the beginning, the Torah — and it stands.',
   'canon','2-john',1,5,'canon','2-john',1,6,'free',10150),

  ('2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8',
   'Deceivers who confess not Yahusha come in the flesh = antichrist (Deuteronomy 13 / Isaiah 8)',
   E'*For many deceivers are entered into the world, who confess not that Yahusha HaMashiach (Jesus Christ) is come in the flesh. This is a deceiver and an antichrist* (2 John 7). The Torah gave the test of the false prophet long before: he is not proved by a sign or wonder but by whether he turns the people toward or away from Yahuah — *thou shalt not hearken unto the words of that prophet... for Yahuah Elohaychem (the LORD your God) proveth you* (Deuteronomy 13:1,3), and the one who *hath spoken to turn you away from Yahuah... shall be put to death* (Deuteronomy 13:5). The presumptuous prophet who speaks a word Yahuah has not commanded *shall die* (Deuteronomy 18:20), and is known when *the thing follow not* (Deuteronomy 18:22). The measuring-line is Isaiah''s: *to the law and to the testimony: if they speak not according to this word, it is because there is no light in them* (Isaiah 8:20). The elder''s first letter says the same — *try the spirits* (1 John 4:1), for *every spirit that confesseth not that Yahusha... is come in the flesh... is that spirit of antichrist* (1 John 4:3). The deceiver is tried by the law and the testimony, not believed for his signs.',
   'canon','2-john',1,7,'canon','2-john',1,7,'free',10153),

  ('2-john-1-abide-in-the-doctrine-deuteronomy-13-psalm-1',
   'Abide in the doctrine; whosoever transgresseth (anomia) hath not Elohim (Deuteronomy 13 / Psalm 1)',
   E'*Whosoever transgresseth, and abideth not in the doctrine of Messiah (Christ), hath not Elohim (God)... If there come any unto you, and bring not this doctrine, receive him not into your house* (2 John 9-10). The word *transgresseth* is the same anomia — law-breaking — that the elder''s first letter defines: *sin is the transgression of the law* (1 John 3:4). To leave the doctrine is to break the Torah. And the refusal to harbour the false teacher is Moses'' own: when even the nearest *entice thee secretly... thou shalt not consent unto him, nor hearken unto him... neither shalt thou conceal him* (Deuteronomy 13:6,8). The blessed man *walketh not in the counsel of the ungodly, nor... sitteth in the seat of the scornful* (Psalm 1:1) — he keeps his footing in the doctrine and does not sit down with the one who would lead the assembly astray. The doctrine and the law are of one piece.',
   'canon','2-john',1,9,'canon','2-john',1,11,'free',10156),

  ('2-john-1-walking-in-truth-as-we-received-commandment-psalm-86-119',
   'Walking in truth, as we received commandment from the Father (Psalm 86 / Psalm 119)',
   E'*I rejoiced greatly that I found of thy children walking in truth, as we have received a commandment from the Father* (2 John 4). To walk in truth is the psalmist''s prayer and the psalmist''s blessing: *teach me thy way, O Yahuah (LORD); I will walk in thy truth: unite my heart to fear thy name* (Psalm 86:11), and *blessed are the undefiled in the way, who walk in the law of Yahuah (LORD)* (Psalm 119:1). The truth John''s children walk in is the commandment received from the Father — Yahuah''s taught way, the undefiled path of the Torah, kept with an undivided heart. Walking *in truth* and walking *in the law* are one walk.',
   'canon','2-john',1,4,'canon','2-john',1,4,'free',10159)
) AS i(slug, title, summary_md, a1_ed, a1_slug, a1_ch, a1_v, a2_ed, a2_slug, a2_ch, a2_v, tier, sort_order)
JOIN _s243_2john_lookup a1 ON a1.edition_slug = i.a1_ed AND a1.book_slug = i.a1_slug
  AND a1.chapter_number = i.a1_ch AND a1.verse_number = i.a1_v
JOIN _s243_2john_lookup a2 ON a2.edition_slug = i.a2_ed AND a2.book_slug = i.a2_slug
  AND a2.chapter_number = i.a2_ch AND a2.verse_number = i.a2_v
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- D. cross_reference_thread_members INSERT
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
FROM (VALUES
  -- thread 10150: commandment from the beginning
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19','canon','2-john',1,5,'canon','deuteronomy',6,5,1, E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). The commandment *from the beginning, that we love one another* (2 John 5) is the Shema''s own oldest word — no new law.'),
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19','canon','2-john',1,6,'canon','deuteronomy',6,6,2, E'*And these words, which I command thee this day, shall be in thine heart.* (Deuteronomy 6:6). The *words... in thine heart* are the commandments love walks after — *this is love, that we walk after his commandments* (2 John 6).'),
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19','canon','2-john',1,6,'canon','leviticus',19,18,3, E'*...thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). John''s *love one another* IS this commandment of old — a statute of Yahuah, not a sentiment replacing the Torah.'),
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19','canon','2-john',1,6,'canon','deuteronomy',5,33,4, E'*Ye shall walk in all the ways which Yahuah Elohaychem (the LORD your God) hath commanded you...* (Deuteronomy 5:33). To *walk after his commandments* (2 John 6) is Moses'' *walk in all the ways* Yahuah commanded.'),
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19','canon','2-john',1,6,'canon','deuteronomy',10,12,5, E'*...to walk in all his ways, and to love him...* (Deuteronomy 10:12). The walking and the loving stand together in Moses as in John — one charge, from the beginning.'),
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19','canon','2-john',1,5,'apocrypha','ecclesiasticus',2,15,6, E'*...they that love him will keep his ways.* (Sirach 2:15). The second-Temple sages already joined love and obedience — what John presses in 2 John 6.'),
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19','canon','2-john',1,6,'apocrypha','ecclesiasticus',2,16,7, E'*...they that love him shall be filled with the law.* (Sirach 2:16). To love is to be *filled with the law* — the very fusion of 2 John 6, not freedom from it.'),
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19','canon','2-john',1,5,'canon','1-john',2,7,8, E'*...no new commandment... but an old commandment which ye had from the beginning.* (1 John 2:7). The elder''s first letter says it word for word — the commandment is old, never superseded.'),
  ('2-john-1-the-commandment-from-the-beginning-that-we-walk-after-his-commandments-deuteronomy-6-leviticus-19','canon','2-john',1,6,'canon','1-john',5,3,9, E'*For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* (1 John 5:3). The 1 John twin — love defined as keeping the commandments, no burden cast off.'),

  -- thread 10153: deceivers / antichrist
  ('2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8','canon','2-john',1,7,'canon','deuteronomy',13,1,1, E'*If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder.* (Deuteronomy 13:1). The deceiver of 2 John 7 is not proved by signs — the Torah''s test is whether he turns you from Yahuah.'),
  ('2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8','canon','2-john',1,7,'canon','deuteronomy',13,3,2, E'*Thou shalt not hearken unto the words of that prophet... for Yahuah Elohaychem (the LORD your God) proveth you...* (Deuteronomy 13:3). The trial of the deceiver who *confess not... Yahusha... come in the flesh* (2 John 7) is the trial of Deuteronomy 13.'),
  ('2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8','canon','2-john',1,7,'canon','deuteronomy',13,5,3, E'*And that prophet... shall be put to death; because he hath spoken to turn you away from Yahuah...* (Deuteronomy 13:5). The *deceiver and an antichrist* (2 John 7) is condemned by the Torah''s sentence; John''s *receive him not* is this separating.'),
  ('2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8','canon','2-john',1,7,'canon','deuteronomy',18,20,4, E'*But the prophet, which shall presume to speak a word in my name, which I have not commanded him... shall die.* (Deuteronomy 18:20). The deceiver who denies the flesh-come Messiah speaks falsely in the Name.'),
  ('2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8','canon','2-john',1,7,'canon','deuteronomy',18,22,5, E'*...if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken...* (Deuteronomy 18:22). The confession of *Yahusha... come in the flesh* is the word that came to pass; the denier speaks presumptuously.'),
  ('2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8','canon','2-john',1,7,'canon','isaiah',8,20,6, E'*To the law and to the testimony: if they speak not according to this word, it is because there is no light in them.* (Isaiah 8:20). The measuring-line against every deceiver of 2 John 7 — the law and the testimony.'),
  ('2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8','canon','2-john',1,7,'canon','1-john',4,1,7, E'*...try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* (1 John 4:1). The 1 John twin of 2 John 7 — *many deceivers are entered into the world.*'),
  ('2-john-1-deceivers-who-confess-not-yahusha-come-in-the-flesh-deuteronomy-13-isaiah-8','canon','2-john',1,7,'canon','1-john',4,3,8, E'*And every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh... is that spirit of antichrist...* (1 John 4:3). 2 John 7 names what 1 John 4:3 named; one voice, one test.'),

  -- thread 10156: abide in the doctrine
  ('2-john-1-abide-in-the-doctrine-deuteronomy-13-psalm-1','canon','2-john',1,9,'canon','deuteronomy',13,6,1, E'*If thy brother... or thy friend... entice thee secretly, saying, Let us go and serve other gods...* (Deuteronomy 13:6). *Whosoever transgresseth, and abideth not in the doctrine... hath not Elohim* (2 John 9); the Torah taught the refusal of even the nearest enticer.'),
  ('2-john-1-abide-in-the-doctrine-deuteronomy-13-psalm-1','canon','2-john',1,10,'canon','deuteronomy',13,8,2, E'*Thou shalt not consent unto him, nor hearken unto him... neither shalt thou conceal him.* (Deuteronomy 13:8). John''s *receive him not into your house* (2 John 10) is Moses'' *thou shalt not consent... nor conceal him.*'),
  ('2-john-1-abide-in-the-doctrine-deuteronomy-13-psalm-1','canon','2-john',1,9,'canon','psalms',1,1,3, E'*Blessed is the man that walketh not in the counsel of the ungodly... nor sitteth in the seat of the scornful.* (Psalm 1:1). To *abide... in the doctrine* (2 John 9) is to keep one''s footing in the Torah, not to sit with the scornful teacher.'),
  ('2-john-1-abide-in-the-doctrine-deuteronomy-13-psalm-1','canon','2-john',1,9,'canon','1-john',3,4,4, E'*...sin is the transgression of the law.* (1 John 3:4). The *transgresseth* of 2 John 9 carries the same anomia — to leave the doctrine is to break the Torah.'),

  -- thread 10159: walking in truth
  ('2-john-1-walking-in-truth-as-we-received-commandment-psalm-86-119','canon','2-john',1,4,'canon','psalms',86,11,1, E'*Teach me thy way, O Yahuah (LORD); I will walk in thy truth: unite my heart to fear thy name.* (Psalm 86:11). To *walk in truth* (2 John 4) is the psalmist''s prayer — Yahuah''s taught way, kept with an undivided heart.'),
  ('2-john-1-walking-in-truth-as-we-received-commandment-psalm-86-119','canon','2-john',1,4,'canon','psalms',119,1,2, E'*Blessed are the undefiled in the way, who walk in the law of Yahuah (LORD).* (Psalm 119:1). *Walking in truth, as we have received a commandment from the Father* (2 John 4) is to *walk in the law of Yahuah* — the undefiled way of the Torah.')
) AS m(slug, src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
JOIN cross_reference_threads t ON t.slug = m.slug
JOIN _s243_2john_lookup sv ON sv.edition_slug = m.src_edition AND sv.book_slug = m.src_slug
  AND sv.chapter_number = m.src_ch AND sv.verse_number = m.src_v
JOIN _s243_2john_lookup tv ON tv.edition_slug = m.tgt_edition AND tv.book_slug = m.tgt_slug
  AND tv.chapter_number = m.tgt_ch AND tv.verse_number = m.tgt_v
JOIN cross_references cr ON cr.source_verse_id = sv.verse_id AND cr.target_verse_id = tv.verse_id AND cr.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session243 — 2 John cross-references complete.'
