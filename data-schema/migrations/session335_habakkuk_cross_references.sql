-- =====================================================================
-- Session 335 — Habakkuk FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session335_habakkuk_cross_references.sql
-- =====================================================================

\echo 'session335 — Habakkuk cross-references starting...'
BEGIN;

-- ----- fragment: minion_habakkuk_1.sql (Habakkuk 1) -----
-- Chapter: Habakkuk 1 — THE PROPHET'S COMPLAINT and YAHUAH'S ANSWER. The righteous man cries
-- into the silence: *O Yahuah (LORD), how long shall I cry, and thou wilt not hear! even cry out
-- unto thee of violence, and thou wilt not save!* (1:2); *Therefore the law is slacked, and
-- judgment doth never go forth: for the wicked doth compass about the righteous* (1:4) — the Torah
-- itself seems paralysed while injustice triumphs. Yahuah answers with a marvel: *I will work a
-- work in your days, which ye will not believe* (1:5) — *For, lo, I raise up the Chaldeans* (1:6):
-- He is sovereign over the nations, wielding even bitter Babylon as the rod of His judgment. The
-- prophet's faith DARES the harder question: how can the everlasting Holy One USE a more-wicked
-- nation to punish the less-wicked? — *Art thou not from everlasting, O Yahuah (LORD) my Elohim
-- (God), mine Holy One? we shall not die* (1:12); *Thou art of purer eyes than to behold evil, and
-- canst not look on iniquity* (1:13). The theodicy ch2 will answer (*the just shall live by his
-- faith*). The whole chapter is the faith that questions — the honest "how long" of the psalms and
-- of the souls under the altar (Revelation 6:10), grounded in the eternity and holiness of Yahuah.
-- Tag: hab01   Temp view: _s335_hab01_lookup
-- Sort band: base 45550, step 3 -> threads at 45550, 45553, 45556, 45559, 45562 (5 threads)
-- Source of EVERY row: 'canon','habakkuk',1,v
--
-- Habakkuk 1 coverage:
--   v.1  (The burden which Habakkuk the prophet did see)
--        NT/Extras/Tanakh: none warranted (the superscription; the burden unfolds in v.2ff)
--   ★★ v.2-3 (O Yahuah (LORD), how long shall I cry, and thou wilt not hear!... Why dost thou shew
--          me iniquity, and cause me to behold grievance?)
--        NT:     ★★ Revelation 6:10 (they cried with a loud voice... How long, O Yahuah (Lord),
--                holy and true, dost thou not judge?) — THREAD 1
--        Extras: ★★ 2 Esdras 3:30 (you sufferest them sinning... destroyed your people, and have
--                preserved your enemies), ★ 2 Esdras 4:35 (the righteous... How long shall I hope?) — THREAD 1
--        Tanakh: ★ Psalm 13:1-2 (How long wilt thou forget me, O Yahuah?), ★ Psalm 94:3 (how
--                long shall the wicked triumph?) — THREAD 1
--   ★ v.4 (Therefore the law is slacked, and judgment doth never go forth: for the wicked doth
--          compass about the righteous; therefore wrong judgment proceedeth)
--        NT:     none warranted distinct (the Torah-not-enforced lament is carried into THREAD 2's
--                Tanakh+extras weave; Torah AFFIRMED — slacked = unenforced, never abolished)
--        Extras: ★ Sirach 35:18 (Yahuah will not be slack... till he have judged the cause of his
--                people) — THREAD 2 (the answer to "the law is slacked")
--        Tanakh: ★ Psalm 94:2 (Lift up thyself, thou judge of the earth: render a reward to the
--                proud) — THREAD 2
--   ★★ v.5 (Behold ye among the heathen... for I will work a work in your days, which ye will not
--          believe, though it be told you)
--        NT:     ★★★ Acts 13:41 (Behold, ye despisers... for I work a work in your days, a work
--                which ye shall in no wise believe) — THREAD 3 (Paul quotes it at Antioch)
--        Extras: none warranted
--        Tanakh: woven in THREAD 3 prose
--   ★★ v.6 (For, lo, I raise up the Chaldeans, that bitter and hasty nation)
--        NT:     none warranted distinct (the sovereignty-over-nations weave is Tanakh-laden)
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 10:5 (O Assyrian, the rod of mine anger), ★★ Jeremiah 25:9 (Nebuchadrezzar
--                the king of Babylon, my servant) — THREAD 4
--   v.7-11 (terrible and dreadful... swifter than the leopards... imputing this his power unto his god)
--        NT/Extras: none warranted (the proud conqueror; the deified-self note woven in THREAD 4 prose)
--        Tanakh: held in prose (the rod that exalts itself — Isaiah 10:15 sphere; ch2's woe answers)
--   ★★ v.12-13 (Art thou not from everlasting, O Yahuah (LORD) my Elohim (God), mine Holy One? we
--          shall not die... Thou art of purer eyes than to behold evil, and canst not look on iniquity)
--        NT:     none warranted distinct (the everlasting Holy One is the Tanakh's own confession;
--                the theodicy is answered forward in ch2 'the just shall live by his faith' -> Rom1:17)
--        Extras: none warranted (clean Tanakh witness carries it)
--        Tanakh: ★★ Psalm 90:2 (from everlasting to everlasting, thou art Elohim), ★ Deuteronomy
--                33:27 (The eternal Elohim is thy refuge... the everlasting arms), ★ Lamentations
--                3:22 (it is of the LORD'S mercies that we are not consumed), ★ Psalm 5:4 (thou art
--                not a Elohim that hath pleasure in wickedness), ★ Psalm 5:5 (thou hatest all
--                workers of iniquity) — THREAD 5
--   v.14-17 (And makest men as the fishes of the sea... they sacrifice unto their net... not spare
--          continually to slay the nations?)
--        NT/Extras/Tanakh: none warranted (the conqueror worshiping his own net; the second
--                complaint's close, woven into THREAD 5's framing — ch2 answers it)
--
-- Threads (slug — target libraries):
--   1. habakkuk-1-how-long-shall-i-cry-and-thou-wilt-not-hear — NT (Revelation 6) + Extras (2 Esdras) + Tanakh (Psalm 13, 94) [extras]
--      (★★ the honest "how long" complaint; the faith that DARES to question, the souls under the altar)
--   2. habakkuk-1-the-law-is-slacked-wrong-judgment-proceedeth — Extras (Sirach 35) + Tanakh (Psalm 94) [extras]
--      (★ Torah unenforced, not abolished; the cry that Yahuah arise and judge — He will not be slack)
--   3. habakkuk-1-i-will-work-a-work-ye-will-not-believe — NT (Acts 13) [free]
--      (★★★ Yahuah works through unbelievable means; Paul quotes it as a warning at Antioch)
--   4. habakkuk-1-i-raise-up-the-chaldeans-the-rod-of-judgment — Tanakh (Isaiah 10, Jeremiah 25) [free]
--      (★★ Yahuah's sovereignty over the nations; Babylon the rod, as Assyria, as "my servant" Nebuchadrezzar)
--   5. habakkuk-1-art-thou-not-from-everlasting-mine-holy-one — Tanakh (Psalm 90, Deuteronomy 33, Lamentations 3, Psalm 5) [free]
--      (★★ the everlasting Holy One of purer eyes; the covenant ground "we shall not die" — the theodicy ch2 answers)
--
-- Framing notes:
--   ★★ THE HONEST "HOW LONG" (THREAD 1): *O Yahuah (LORD), how long shall I cry, and thou wilt not
--      hear!* (1:2). This is the faith that DARES to question — not unbelief, but the righteous man
--      pressing his unanswered prayer upon the silence of heaven. It is the cry of the psalms (*How
--      long wilt thou forget me, O Yahuah (LORD)?* Psalm 13:1; *how long shall the wicked triumph?*
--      Psalm 94:3) and of the souls under the altar (*How long, O Yahuah (Lord), holy and true,
--      dost thou not judge?* Revelation 6:10). The restored witness has the very lament: *you
--      sufferest them sinning... destroyed your people, and have preserved your enemies* (2 Esdras
--      3:30) and *the righteous ask question... How long shall I hope?* (4:35). One cry across the
--      whole library; the question is permitted, and it is answered.
--   ★ THE LAW IS SLACKED (THREAD 2): *Therefore the law is slacked, and judgment doth never go
--      forth* (1:4). The Torah is not abolished — it is UNENFORCED; justice is not executed, the
--      wicked compass the righteous. The cry is that Yahuah ARISE to judge: *Lift up thyself, thou
--      judge of the earth* (Psalm 94:2); and the answer is sure — *Yahuah (God) will not be slack...
--      till he have judged the cause of his people* (Sirach 35:18-19). The slackness is man's
--      failure to enforce the standing law, never a defect in the law itself.
--   ★★★ I WILL WORK A WORK (THREAD 3): *I will work a work in your days, which ye will not believe,
--      though it be told you* (1:5). Paul takes this verse to the synagogue at Antioch as a warning:
--      *Behold, ye despisers, and wonder, and perish: for I work a work in your days, a work which
--      ye shall in no wise believe, though a man declare it unto you* (Acts 13:41). Yahuah works
--      through the unexpected and the unbelievable; the warning crosses from Habakkuk's Babylon
--      straight into the apostolic age.
--   ★★ I RAISE UP THE CHALDEANS (THREAD 4): *For, lo, I raise up the Chaldeans, that bitter and
--      hasty nation* (1:6). Yahuah is sovereign over the nations — He wields even bitter Babylon as
--      a rod, as He named Assyria *the rod of mine anger* (Isaiah 10:5) and called Nebuchadrezzar
--      *my servant* (Jeremiah 25:9). The proud conqueror who imputes *his power unto his god* (1:11)
--      is still only the instrument in the Holy One's hand; ch2's woes will break the rod.
--   ★★ FROM EVERLASTING, MINE HOLY ONE (THREAD 5): *Art thou not from everlasting, O Yahuah (LORD)
--      my Elohim (God), mine Holy One? we shall not die* (1:12). The prophet grounds the harder
--      complaint in Yahuah's eternity (*from everlasting to everlasting, thou art Elohim* Psalm
--      90:2; *The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms*
--      Deuteronomy 33:27), in the covenant preservation (*it is of the LORD'S mercies that we are
--      not consumed* Lamentations 3:22 — "we shall not die"), and in His holiness (*Thou art of
--      purer eyes than to behold evil* 1:13; *thou art not a Elohim (God) that hath pleasure in
--      wickedness... thou hatest all workers of iniquity* Psalm 5:4-5). The theodicy question this
--      raises — how the pure-eyed Holy One can USE the wicked — is what ch2 answers: *the just shall
--      live by his faith*.
--   VERSES WITH NO SEPARATE ADD: v.1 (the superscription), v.7-11 (the Chaldean cavalry / the
--      deified-self — woven into THREAD 4 prose), v.14-17 (men as fishes, sacrificing to the net —
--      the close of the second complaint, woven into THREAD 5; ch2 answers it). All recorded, none
--      silently skipped.

CREATE TEMP VIEW _s335_hab01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): How long shall I cry — the honest complaint, the faith that questions
    ('canon','habakkuk',1,2,'canon','revelation',6,10,'free',
      E'*And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). The prophet''s *O Yahuah (LORD), how long shall I cry, and thou wilt not hear!* (Habakkuk 1:2) is the same cry the souls under the altar raise at the end of the age — *How long, O Yahuah (Lord), holy and true, dost thou not judge?* The honest "how long" of the righteous over unanswered prayer runs from Habakkuk straight to the fifth seal; the question is permitted, and it is heard.'),
    ('canon','habakkuk',1,3,'apocrypha','2-esdras',3,30,'extras',
      E'*For I have seen how you sufferest them sinning, and have spared wicked doers: and have destroyed your people, and have preserved your enemies, and have not signified it* (2 Esdras 3:30). Habakkuk''s *Why dost thou shew me iniquity, and cause me to behold grievance?* (Habakkuk 1:3) is the very lament Ezra pours out in the restored witness — that Yahuah seems to spare the wicked and let His own suffer. The same theodicy ache: the righteous bewildered that the Holy One holds His tongue while violence triumphs.'),
    ('canon','habakkuk',1,2,'apocrypha','2-esdras',4,35,'extras',
      E'*Did not the souls also of the righteous ask question of these things in their chambers, saying, How long shall I hope on this fashion? when comes the fruit of the floor of our reward?* (2 Esdras 4:35). The cry *how long shall I cry, and thou wilt not hear!* (Habakkuk 1:2) is the question the righteous souls themselves ask — *How long shall I hope on this fashion?* The wrestling with Yahuah''s apparent silence is the saints'' own faithful question, recorded and answered.'),
    ('canon','habakkuk',1,2,'canon','psalms',13,1,'free',
      E'*How long wilt thou forget me, O Yahuah (LORD)? for ever? how long wilt thou hide thy face from me?* (Psalm 13:1). The prophet''s *how long shall I cry, and thou wilt not hear!* (Habakkuk 1:2) is the psalmist''s own fourfold "how long" — the faith that dares to press its grief on the hiding face of Yahuah. This is not unbelief but the honest lament of the covenant-keeper who will not let go.'),
    ('canon','habakkuk',1,2,'canon','psalms',94,3,'free',
      E'*Yahuah (LORD), how long shall the wicked, how long shall the wicked triumph?* (Psalm 94:3). Habakkuk''s *how long shall I cry* (Habakkuk 1:2) against *violence* (1:2-3) is the psalm''s cry against the triumph of the wicked — *how long shall the wicked triumph?* The righteous see the spoiling and the strife and ask the Judge of the earth how long He will hold His peace.'),

    -- THREAD 2 (★): The law is slacked — Torah unenforced, the cry that Yahuah arise and judge
    ('canon','habakkuk',1,4,'canon','psalms',94,2,'free',
      E'*Lift up thyself, thou judge of the earth: render a reward to the proud* (Psalm 94:2). When *the law is slacked, and judgment doth never go forth: for the wicked doth compass about the righteous* (Habakkuk 1:4), the answer the righteous cry is that Yahuah Himself ARISE to judge — *Lift up thyself, thou judge of the earth*. The Torah''s standard stands; it is justice unenforced that the prophet laments, and the cure is the Judge stirring to act.'),
    ('canon','habakkuk',1,4,'apocrypha','ecclesiasticus',35,18,'extras',
      E'*For Yahuah (God) will not be slack, neither will the Mighty be patient toward them, till he have struck in sunder the loins of the unmerciful, and repayed vengeance to the heathen; till he have taken away the multitude of the proud, and broken the sceptre of the unrighteous* (Sirach 35:18). To Habakkuk''s complaint that *the law is slacked* (Habakkuk 1:4), the restored witness answers in kind: *Yahuah (God) will not be slack... till he have judged the cause of his people* (35:18-19). The slackness is man''s, not Yahuah''s; the Judge''s delay is not negligence, and His verdict is sure.'),

    -- THREAD 3 (★★★): I will work a work ye will not believe — quoted by Paul at Antioch
    ('canon','habakkuk',1,5,'canon','acts',13,41,'free',
      E'*Behold, ye despisers, and wonder, and perish: for I work a work in your days, a work which ye shall in no wise believe, though a man declare it unto you* (Acts 13:41). Paul takes Habakkuk''s very word to the synagogue at Antioch as a warning: *I will work a work in your days, which ye will not believe, though it be told you* (Habakkuk 1:5). Yahuah works through the unexpected and the unbelievable; the marvel He raised against Habakkuk''s generation becomes the apostle''s warning to the despisers of his own day.'),

    -- THREAD 4 (★★): I raise up the Chaldeans — Yahuah's sovereignty over the nations, the rod
    ('canon','habakkuk',1,6,'canon','isaiah',10,5,'free',
      E'*O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation* (Isaiah 10:5). *For, lo, I raise up the Chaldeans, that bitter and hasty nation* (Habakkuk 1:6) is the same sovereign hand that named Assyria *the rod of mine anger*. Yahuah wields even the bitter conqueror as the instrument of His judgment — the empire is the rod, not the hand; and the rod that exalts itself (1:11) will itself be broken.'),
    ('canon','habakkuk',1,6,'canon','jeremiah',25,9,'free',
      E'*Behold, I will send and take all the families of the north, saith Yahuah (LORD), and Nebuchadrezzar the king of Babylon, my servant, and will bring them against this land* (Jeremiah 25:9). When Yahuah says *I raise up the Chaldeans* (Habakkuk 1:6), He is doing exactly what Jeremiah declares — sending Babylon, calling even Nebuchadrezzar *my servant* to execute the covenant judgment. The bitter nation is sovereignly raised; the Holy One rules the rod He lifts.'),

    -- THREAD 5 (★★): Art thou not from everlasting, mine Holy One — the eternal pure-eyed Elohim
    ('canon','habakkuk',1,12,'canon','psalms',90,2,'free',
      E'*Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2). The prophet appeals to the eternity of Yahuah — *Art thou not from everlasting, O Yahuah (LORD) my Elohim (God), mine Holy One?* (Habakkuk 1:12) — the same *from everlasting to everlasting, thou art Elohim*. Because Yahuah is before and beyond the nations He raises, the rod cannot outlast Him, and His covenant people *shall not die*.'),
    ('canon','habakkuk',1,12,'canon','deuteronomy',33,27,'free',
      E'*The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms: and he shall thrust out the enemy from before thee; and shall say, Destroy them* (Deuteronomy 33:27). Habakkuk''s confession *Art thou not from everlasting... we shall not die* (Habakkuk 1:12) rests on Moses'' blessing — *The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms*. The everlasting One who bears up His people will also thrust out the enemy; the Chaldean is no final word.'),
    ('canon','habakkuk',1,12,'canon','lamentations',3,22,'free',
      E'*It is of the LORD’S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22). The covenant pledge *we shall not die* (Habakkuk 1:12) is Jeremiah''s own hope amid the ruin Babylon brought — *it is of the LORD’S mercies that we are not consumed*. The rod judges, but the everlasting mercies preserve the remnant; the people are corrected, not consumed.'),
    ('canon','habakkuk',1,13,'canon','psalms',5,4,'free',
      E'*For thou art not a Elohim (God) that hath pleasure in wickedness: neither shall evil dwell with thee* (Psalm 5:4). The prophet''s *Thou art of purer eyes than to behold evil, and canst not look on iniquity* (Habakkuk 1:13) is the psalmist''s same confession of the holy Elohim — *thou art not a Elohim (God) that hath pleasure in wickedness*. The holiness of Yahuah is precisely what makes the question so sharp: how can the pure-eyed One USE the wicked? — the theodicy ch2 answers.'),
    ('canon','habakkuk',1,13,'canon','psalms',5,5,'free',
      E'*The foolish shall not stand in thy sight: thou hatest all workers of iniquity* (Psalm 5:5). Habakkuk presses the contradiction — *wherefore lookest thou upon them that deal treacherously, and holdest thy tongue when the wicked devoureth the man that is more righteous than he?* (Habakkuk 1:13) — against the very truth the psalm declares: *thou hatest all workers of iniquity*. The faith that knows Yahuah hates iniquity is the faith bold enough to ask why He seems to tolerate it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s335_hab01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s335_hab01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-1-how-long-shall-i-cry-and-thou-wilt-not-hear',
       E'How long shall I cry — the honest complaint, the faith that dares to question',
       E'The prophet opens not with praise but with a wound: *O Yahuah (LORD), how long shall I cry, and thou wilt not hear! even cry out unto thee of violence, and thou wilt not save! Why dost thou shew me iniquity, and cause me to behold grievance? for spoiling and violence are before me* (Habakkuk 1:2-3). This is not unbelief — it is the faith that DARES to press its unanswered prayer upon the silence of heaven. It is the cry of the psalms: *How long wilt thou forget me, O Yahuah (LORD)? for ever? how long wilt thou hide thy face from me?* (Psalm 13:1), and *Yahuah (LORD), how long shall the wicked, how long shall the wicked triumph?* (Psalm 94:3). It is the cry of the souls under the altar at the end of the age: *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). And the restored witness has the very same wrestling: *For I have seen how you sufferest them sinning, and have spared wicked doers: and have destroyed your people, and have preserved your enemies* (2 Esdras 3:30); *Did not the souls also of the righteous ask question of these things in their chambers, saying, How long shall I hope on this fashion?* (2 Esdras 4:35). One cry runs the whole library — from Habakkuk to the psalmist to the souls beneath the altar. The question is permitted; the righteous may ask "how long," and Yahuah hears.',
       sv.verse_id, ev.verse_id, 'extras', 45550
  FROM _s335_hab01_lookup sv, _s335_hab01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-1-the-law-is-slacked-wrong-judgment-proceedeth',
       E'The law is slacked — the Torah unenforced, and the cry that Yahuah arise and judge',
       E'The heart of the first complaint is that justice has failed: *Therefore the law is slacked, and judgment doth never go forth: for the wicked doth compass about the righteous; therefore wrong judgment proceedeth* (Habakkuk 1:4). The Torah is not abolished here — it is UNENFORCED. The standard stands; it is the execution of justice that has gone slack, so that the wicked surround the righteous and wrong judgment proceeds. The righteous answer is not to discard the law but to cry that the Judge Himself arise: *Lift up thyself, thou judge of the earth: render a reward to the proud* (Psalm 94:2). And the answer is sure — the restored witness declares that the slackness is never Yahuah''s: *For Yahuah (God) will not be slack, neither will the Mighty be patient toward them, till he have struck in sunder the loins of the unmerciful... Till he have rendered to every man according to his deeds... till he have judged the cause of his people, and made them to rejoice in his mercy* (Sirach 35:18-19). The law slacked in the hands of men is upheld by the hand of the Judge who will not be slack.',
       sv.verse_id, ev.verse_id, 'extras', 45553
  FROM _s335_hab01_lookup sv, _s335_hab01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-1-i-will-work-a-work-ye-will-not-believe',
       E'I will work a work ye will not believe — quoted by Paul to the despisers at Antioch',
       E'Yahuah''s answer to the complaint is a marvel: *Behold ye among the heathen, and regard, and wonder marvellously: for I will work a work in your days, which ye will not believe, though it be told you* (Habakkuk 1:5). He is about to do the unthinkable — to raise bitter Babylon as His rod. The work is so startling that even when told plainly it will not be believed. Paul takes this very verse to the synagogue at Antioch and turns it into a warning for his own generation: *Beware therefore, lest that come upon you, which is spoken of in the prophets; Behold, ye despisers, and wonder, and perish: for I work a work in your days, a work which ye shall in no wise believe, though a man declare it unto you* (Acts 13:40-41). Yahuah works through the unexpected and the unbelievable — and the danger in every age is the same: to despise the declared work because it does not match what men expect. The marvel raised against Habakkuk''s day is the apostle''s warning against the day of Messiah.',
       sv.verse_id, ev.verse_id, 'free', 45556
  FROM _s335_hab01_lookup sv, _s335_hab01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-1-i-raise-up-the-chaldeans-the-rod-of-judgment',
       E'I raise up the Chaldeans — Yahuah''s sovereignty over the nations, the rod in His hand',
       E'The unbelievable work is named: *For, lo, I raise up the Chaldeans, that bitter and hasty nation, which shall march through the breadth of the land, to possess the dwellingplaces that are not theirs* (Habakkuk 1:6). The terrible cavalry follows — *swifter than the leopards... they shall fly as the eagle that hasteth to eat* (1:8) — and the proud conqueror *imputing this his power unto his god* (1:11). Yet the whole terror is the rod in Yahuah''s hand. He had named Assyria the same way: *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation* (Isaiah 10:5). And Jeremiah declares the very Chaldean raising: *Behold, I will send and take all the families of the north, saith Yahuah (LORD), and Nebuchadrezzar the king of Babylon, my servant, and will bring them against this land* (Jeremiah 25:9). The bitter nation that exalts its own strength to a god is still only the instrument — the empire is the rod, never the hand. And the rod that magnifies itself against the One who lifts it (Isaiah 10:15) will itself be broken; the woes of Habakkuk 2 fall on the Chaldean in turn. Yahuah rules the nations He raises.',
       sv.verse_id, ev.verse_id, 'free', 45559
  FROM _s335_hab01_lookup sv, _s335_hab01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-1-art-thou-not-from-everlasting-mine-holy-one',
       E'Art thou not from everlasting, mine Holy One — the eternal, pure-eyed Elohim',
       E'The second complaint is harder than the first: how can the holy Yahuah USE a nation more wicked than the one He judges? The prophet grounds the question in who Yahuah IS — His eternity, His covenant faithfulness, His holiness: *Art thou not from everlasting, O Yahuah (LORD) my Elohim (God), mine Holy One? we shall not die. O Yahuah (LORD), thou hast ordained them for judgment; and, O mighty Elohim (God), thou hast established them for correction* (Habakkuk 1:12). The appeal to eternity is the psalm''s own: *Before the mountains were brought forth... even from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2); and Moses'' blessing — *The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms* (Deuteronomy 33:27). The covenant pledge *we shall not die* is Jeremiah''s hope in the very ruin Babylon brought: *It is of the LORD’S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22) — corrected, never consumed. Then the sharpest edge, His holiness: *Thou art of purer eyes than to behold evil, and canst not look on iniquity: wherefore lookest thou upon them that deal treacherously, and holdest thy tongue when the wicked devoureth the man that is more righteous than he?* (Habakkuk 1:13) — the psalmist''s same confession: *thou art not a Elohim (God) that hath pleasure in wickedness: neither shall evil dwell with thee* (Psalm 5:4); *thou hatest all workers of iniquity* (Psalm 5:5). The faith that KNOWS Yahuah is eternal, faithful, and pure is the faith bold enough to ask why He tolerates the conqueror who *sacrifice[s] unto their net* (1:16) and would *not spare continually to slay the nations* (1:17). The question hangs — and Habakkuk 2 answers it: *the just shall live by his faith*.',
       sv.verse_id, ev.verse_id, 'free', 45562
  FROM _s335_hab01_lookup sv, _s335_hab01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *How long, O Yahuah (Lord), holy and true, dost thou not judge?* (Revelation 6:10) — the souls under the altar raise Habakkuk''s very cry (*how long shall I cry*, Habakkuk 1:2) at the end of the age.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-how-long-shall-i-cry-and-thou-wilt-not-hear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *you sufferest them sinning... destroyed your people, and have preserved your enemies* (2 Esdras 3:30) — the restored witness pours out Habakkuk''s lament (*Why dost thou shew me iniquity?*, Habakkuk 1:3) that the wicked are spared.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-how-long-shall-i-cry-and-thou-wilt-not-hear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the souls... of the righteous... saying, How long shall I hope on this fashion?* (2 Esdras 4:35) — the saints themselves ask Habakkuk''s "how long" (Habakkuk 1:2); the faithful question, recorded.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=4 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-how-long-shall-i-cry-and-thou-wilt-not-hear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *How long wilt thou forget me, O Yahuah (LORD)? for ever?* (Psalm 13:1) — the psalmist''s fourfold "how long" is Habakkuk''s own (*how long shall I cry*, Habakkuk 1:2); the faith that presses the hiding face.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=13 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-how-long-shall-i-cry-and-thou-wilt-not-hear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Yahuah (LORD), how long shall the wicked... triumph?* (Psalm 94:3) — the cry against *violence* (Habakkuk 1:2) is the psalm''s cry against the wicked''s triumph.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-how-long-shall-i-cry-and-thou-wilt-not-hear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Lift up thyself, thou judge of the earth: render a reward to the proud* (Psalm 94:2) — when *the law is slacked* (Habakkuk 1:4), the cure is the Judge Himself arising to act.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-the-law-is-slacked-wrong-judgment-proceedeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (God) will not be slack... till he have judged the cause of his people* (Sirach 35:18) — the answer to *the law is slacked* (Habakkuk 1:4): the slackness is man''s, never Yahuah''s.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-the-law-is-slacked-wrong-judgment-proceedeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Behold, ye despisers... for I work a work in your days, a work which ye shall in no wise believe* (Acts 13:41) — Paul quotes Habakkuk 1:5 to the despisers at Antioch; the marvel of one age, the warning of another.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-i-will-work-a-work-ye-will-not-believe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *O Assyrian, the rod of mine anger* (Isaiah 10:5) — *I raise up the Chaldeans* (Habakkuk 1:6) is the same sovereign hand that wielded Assyria; the empire is the rod, not the hand.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-i-raise-up-the-chaldeans-the-rod-of-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Nebuchadrezzar the king of Babylon, my servant* (Jeremiah 25:9) — Jeremiah declares the very Chaldean raising of Habakkuk 1:6; Yahuah calls even Babylon''s king His servant for judgment.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-i-raise-up-the-chaldeans-the-rod-of-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2) — the prophet''s *Art thou not from everlasting?* (Habakkuk 1:12); the eternal One outlasts the rod He raises.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-art-thou-not-from-everlasting-mine-holy-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms* (Deuteronomy 33:27) — the ground of *we shall not die* (Habakkuk 1:12); the everlasting One bears up His people and thrusts out the enemy.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-art-thou-not-from-everlasting-mine-holy-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *It is of the LORD’S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22) — the covenant *we shall not die* (Habakkuk 1:12) amid the very ruin Babylon brought; corrected, never consumed.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-art-thou-not-from-everlasting-mine-holy-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *thou art not a Elohim (God) that hath pleasure in wickedness: neither shall evil dwell with thee* (Psalm 5:4) — the psalmist''s confession of the holy Elohim, the *purer eyes than to behold evil* of Habakkuk 1:13.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-art-thou-not-from-everlasting-mine-holy-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *thou hatest all workers of iniquity* (Psalm 5:5) — the very holiness Habakkuk presses (*canst not look on iniquity*, Habakkuk 1:13); the faith that knows Yahuah hates iniquity is bold to ask why He seems to tolerate it.'
  FROM cross_reference_threads t
  JOIN _s335_hab01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s335_hab01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-1-art-thou-not-from-everlasting-mine-holy-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_habakkuk_2.sql (Habakkuk 2) -----
-- Chapter: Habakkuk 2 — the prophet on his watch; WRITE THE VISION, MAKE IT PLAIN; *though it tarry,
-- wait for it; because it will surely come, it will not tarry* (2:3); ★★★ the supreme keystone *the
-- just shall live by his faith* (2:4) — living covenant-FAITHFULNESS (emunah), NOT a faith-against-Torah
-- "sola fide"; the proud insatiable as Sheol gathering all nations (2:5); the five woes on the
-- plunderer/the covetous/the blood-builder (2:6-19); ★★★ *the earth shall be filled with the knowledge
-- of the glory of Yahuah (LORD), as the waters cover the sea* (2:14); the dumb idol with *no breath at
-- all in the midst of it* (2:19) vs. *But Yahuah (LORD) is in his holy temple: let all the earth keep
-- silence before him* (2:20) — the Formed/Formless: the living One, not the made-thing.
-- Tag: hab02   Temp view: _s335_hab02_lookup
-- Sort band: base 45565, step 3 -> threads at 45565, 45568, 45571, 45574, 45577, 45580 (6 threads)
-- Source of EVERY row: 'canon','habakkuk',2,v
--
-- Habakkuk 2 coverage:
--   ★ v.1 (I will stand upon my watch, and set me upon the tower, and will watch to see what he will say
--          unto me)
--        NT:     none warranted distinct (the waiting-posture is fulfilled in the patient-endurance weave
--                of Hebrews 10:36-37 carried under THREAD 1 with v.2-3)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 21:8 (I stand continually upon the watchtower in the daytime), ★ Micah 7:7
--                (Therefore I will look unto Yahuah... my Elohim will hear me), Psalm 5:3 (in the morning
--                will I direct my prayer unto thee, and will look up) — THREAD 1 (the watchman waiting)
--   ★★ v.2-3 (Write the vision, and make it plain upon tables... For the vision is yet for an appointed
--          time... though it tarry, wait for it; because it will surely come, it will not tarry)
--        NT:     ★★ Hebrews 10:37 (For yet a little while, and he that shall come will come, and will not
--                tarry), ★ 2 Peter 3:9 (Yahuah is not slack concerning his promise) — THREAD 1
--        Extras: none warranted (2 Esdras appointed-end candidates not pulled clean; held in prose)
--        Tanakh: woven with v.1 the watching
--   ★★★ v.4 (Behold, his soul which is lifted up is not upright in him: but the just shall live by his
--          faith) — THE SUPREME KEYSTONE
--        NT:     ★★★ Romans 1:17, ★★★ Galatians 3:11, ★★★ Hebrews 10:38 (Now the just shall live by
--                faith: but if any man draw back...), Hebrews 10:39 (but of them that believe to the
--                saving of the soul) — THREAD 2
--        Extras: none warranted (clean witness not forced; the keystone is the NT triple-quote)
--        Tanakh/NT: ★★ Genesis 15:6 (he believed in Yahuah; and he counted it to him for righteousness),
--                ★ James 2:22 (faith wrought with his works, and by works was faith made perfect) — THREAD 2
--   ★ v.5 (who enlargeth his desire as hell, and is as death, and cannot be satisfied, but gathereth
--          unto him all nations)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★ Proverbs 27:20 (Hell and destruction are never full; so the eyes of man are never
--                satisfied), ★ Isaiah 5:14 (therefore hell hath enlarged herself... without measure) — THREAD 3
--   ★★ v.6-12 (Woe to him that increaseth that which is not his!... the stone shall cry out of the wall...
--          Woe to him that buildeth a town with blood)
--        NT:     ★★ Luke 19:40 (if these should hold their peace, the stones would immediately cry out) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Micah 3:10 (They build up Zion with blood, and Jerusalem with iniquity) — THREAD 4
--   ★★★ v.13-14 (the people shall labour in the very fire... For the earth shall be filled with the
--          knowledge of the glory of Yahuah, as the waters cover the sea)
--        NT:     ★ Revelation 21:23 (the glory of Elohim did lighten it, and the Lamb is the light
--                thereof) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★★ Isaiah 11:9 (the earth shall be full of the knowledge of Yahuah, as the waters cover
--                the sea), ★ Numbers 14:21 (all the earth shall be filled with the glory of Yahuah), ★
--                Psalm 72:19 (let the whole earth be filled with his glory) — THREAD 5
--   v.15-17 (Woe unto him that giveth his neighbour drink... that thou mayest look on their nakedness)
--        NT:     none warranted (the measure-for-measure cup is woven into the woes-prose of THREAD 4)
--        Extras: none warranted
--        Tanakh: none warranted distinct (the violence-of-Lebanon recompense held in THREAD 4 prose)
--   ★★ v.18-20 (What profiteth the graven image... to make dumb idols?... there is no breath at all in
--          the midst of it. But Yahuah is in his holy temple: let all the earth keep silence before him)
--        NT:     ★ Revelation 8:1 (when he had opened the seventh seal, there was silence in heaven) — THREAD 6
--        Extras: ★ Wisdom of Solomon 15:15 (the idols of the heathen... neither have the use of eyes to
--                see, nor noses to draw breath, nor ears to hear) — THREAD 6
--        Tanakh: ★ Psalm 115:4-8 (their idols... mouths... speak not... they that make them are like unto
--                them), ★ Isaiah 44:9 (they that make a graven image are all of them vanity), ★ Psalm 11:4
--                (Yahuah is in his holy temple), ★ Zephaniah 1:7 (Hold thy peace at the presence of Adonai
--                Yahuah), ★ Zechariah 2:13 (Be silent, O all flesh, before Yahuah) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. habakkuk-2-write-the-vision-it-will-surely-come — NT (Hebrews 10, 2 Peter 3) + Tanakh (Isaiah 21,
--      Micah 7, Psalm 5) [free] (★★ the watchman waiting; the appointed-time vision will not tarry)
--   2. habakkuk-2-the-just-shall-live-by-his-faith — NT (Romans 1, Galatians 3, Hebrews 10) + Tanakh/NT
--      (Genesis 15, James 2) [free] (★★★ THE KEYSTONE; living covenant-faithfulness, NOT sola-fide-vs-Torah)
--   3. habakkuk-2-the-soul-enlarged-as-sheol-never-satisfied — Tanakh (Proverbs 27, Isaiah 5) [free]
--      (★ the proud conqueror insatiable as Sheol)
--   4. habakkuk-2-the-stone-shall-cry-out-of-the-wall — NT (Luke 19) + Tanakh (Micah 3) [free]
--      (★★ the woes; the blood-built city; the very stones testify)
--   5. habakkuk-2-the-earth-filled-with-the-knowledge-of-the-glory — NT (Revelation 21) + Tanakh (Isaiah
--      11, Numbers 14, Psalm 72) [free] (★★★ the Messianic-age consummation, the goal of all history)
--   6. habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol — NT (Revelation 8) + Extras (Wisdom 15) +
--      Tanakh (Psalm 115, Isaiah 44, Psalm 11, Zephaniah 1, Zechariah 2) [extras] (★★ dead idols vs. the
--      living Yahuah enthroned; the Formed/Formless)
--
-- Framing notes:
--   ★★★ THE KEYSTONE (THREAD 2): *Behold, his soul which is lifted up is not upright in him: but the just
--      shall live by his faith* (2:4). This is the verse Paul cites three times — Romans 1:17, Galatians
--      3:11, Hebrews 10:38. FRAME IT YOSHI'S WAY: emunah is faithfulness/steadfast trust, the same root
--      as *he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6) — and
--      that same Abraham was *justified by works, when he had offered Isaac his son upon the altar*
--      (James 2:21), *by works was faith made perfect* (James 2:22). The just live BY faithfulness: trust
--      that endures and obeys, the opposite of the *soul which is lifted up*. NOT a faith-against-Torah/
--      works "sola fide"; faith and obedience are inseparable (1 John 2:3-4). Hebrews keeps the two
--      halves together: *the just shall live by faith: but if any man draw back, my soul shall have no
--      pleasure in him... but of them that believe to the saving of the soul* (Hebrews 10:38-39) — living
--      faithfulness that does not draw back.
--   VERSES WITH NO SEPARATE ADD: v.7-8 (the spoiler spoiled — measure-for-measure, woven into THREAD 4
--      prose), v.9-11 (the covetous nest on high, the stone crying — THREAD 4), v.15-17 (the cup of
--      shame, the violence of Lebanon — THREAD 4 prose, the recompense), v.16 (the cup of the LORD'S
--      right hand — THREAD 4). All recorded, none silently skipped.

CREATE TEMP VIEW _s335_hab02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Write the vision — it will surely come, it will not tarry (the watchman waiting)
    ('canon','habakkuk',2,1,'canon','isaiah',21,8,'free',
      E'*And he cried, A lion: My lord, I stand continually upon the watchtower in the daytime, and I am set in my ward whole nights* (Isaiah 21:8). Habakkuk takes the same posture: *I will stand upon my watch, and set me upon the tower, and will watch to see what he will say unto me* (Habakkuk 2:1). The prophet is the watchman who keeps his ward and will not leave his tower until Yahuah (LORD) answers.'),
    ('canon','habakkuk',2,1,'canon','micah',7,7,'free',
      E'*Therefore I will look unto Yahuah (LORD); I will wait for the Elohim (God) of my salvation: my Elohim (God) will hear me* (Micah 7:7). This is the very stance of Habakkuk on his tower — *I will watch to see what he will say unto me, and what I shall answer when I am reproved* (Habakkuk 2:1). The waiting is not idle; it is the certainty that *my Elohim (God) will hear me*.'),
    ('canon','habakkuk',2,1,'canon','psalms',5,3,'free',
      E'*My voice shalt thou hear in the morning, O Yahuah (LORD); in the morning will I direct my prayer unto thee, and will look up* (Psalm 5:3). To *look up* and wait for the answer is the watchman''s posture of Habakkuk 2:1 — *I will watch to see what he will say unto me*. The righteous direct their cry to Yahuah (LORD) and then watch for his word.'),
    ('canon','habakkuk',2,3,'canon','hebrews',10,37,'free',
      E'*For yet a little while, and he that shall come will come, and will not tarry* (Hebrews 10:37). The writer of Hebrews lifts Habakkuk''s own promise — *though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:3) — and names the appointed-time vision as the COMING ONE: *he that shall come will come.* The vision yet for an appointed time is the Messiah, certain though it seem delayed.'),
    ('canon','habakkuk',2,3,'canon','2-peter',3,9,'free',
      E'*Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The seeming delay of Habakkuk 2:3 — *though it tarry, wait for it; because it will surely come* — is not slackness but longsuffering. The appointed end keeps its time; Yahuah (Lord) is not slow, but patient.'),

    -- THREAD 2 (★★★): THE KEYSTONE — the just shall live by his faith (living covenant-faithfulness)
    ('canon','habakkuk',2,4,'canon','romans',1,17,'free',
      E'*For therein is the righteousness of Elohim (God) revealed from faith to faith: as it is written, The just shall live by faith* (Romans 1:17). Paul builds the gospel on Habakkuk''s word — *but the just shall live by his faith* (Habakkuk 2:4). This is emunah: living, covenant-faithful trust in Yahuah (LORD), the steadfast faith that endures and obeys — NOT a faith opposed to obedience. The righteous live BY faithfulness, the opposite of the *soul which is lifted up*.'),
    ('canon','habakkuk',2,4,'canon','galatians',3,11,'free',
      E'*But that no man is justified by the law in the sight of Elohim (God), it is evident: for, The just shall live by faith* (Galatians 3:11). Paul cites Habakkuk 2:4 again — *the just shall live by his faith.* The point is not faith AGAINST the Torah but that no man earns righteousness as a flesh-credential; the just are accounted righteous through faithful trust, the same trust by which Abraham *believed in Yahuah (LORD)* (Genesis 15:6). Faith and Torah-obedience are inseparable, never opposed (1 John 2:3-4).'),
    ('canon','habakkuk',2,4,'canon','hebrews',10,38,'free',
      E'*Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* (Hebrews 10:38). Hebrews quotes Habakkuk 2:4 and keeps both halves of the verse in view: the just live by FAITHFULNESS — the trust that does NOT draw back. This is the very contrast Habakkuk draws — *his soul which is lifted up is not upright in him: but the just shall live by his faith* (2:4). Steadfast endurance, not a one-time confession; living faith that perseveres.'),
    ('canon','habakkuk',2,4,'canon','hebrews',10,39,'free',
      E'*But we are not of them who draw back unto perdition; but of them that believe to the saving of the soul* (Hebrews 10:39). The just who *live by his faith* (Habakkuk 2:4) are *them that believe to the saving of the soul* — those who endure, not those who draw back. Habakkuk''s emunah is exactly this persevering faithfulness that holds fast to Yahuah (LORD) unto the end.'),
    ('canon','habakkuk',2,4,'canon','genesis',15,6,'free',
      E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). Abraham''s faith is the pattern of Habakkuk 2:4 — *the just shall live by his faith.* The Hebrew root is one: he was FAITHFUL, he trusted Yahuah (LORD) and held to him, and it was counted for righteousness. This is the living covenant-faithfulness by which the just live, not a bare assent against works.'),
    ('canon','habakkuk',2,4,'canon','james',2,22,'free',
      E'*Seest thou how faith wrought with his works, and by works was faith made perfect?* (James 2:22). James shows what the faith of Habakkuk 2:4 looks like alive: the same Abraham who *believed in Yahuah (LORD)* (Genesis 15:6) was *justified by works, when he had offered Isaac his son upon the altar* (James 2:21). *The just shall live by his faith* (Habakkuk 2:4) means a faithfulness perfected in obedience — faith and works inseparable, never a sola-fide against the Torah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s335_hab02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s335_hab02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★): The soul enlarged as Sheol, never satisfied
    ('canon','habakkuk',2,5,'canon','proverbs',27,20,'free',
      E'*Hell and destruction are never full; so the eyes of man are never satisfied* (Proverbs 27:20). The proud conqueror of Habakkuk 2:5 *enlargeth his desire as hell, and is as death, and cannot be satisfied, but gathereth unto him all nations.* His appetite is bottomless as Sheol — the very insatiable eye Proverbs names; the more he devours, the emptier he is.'),
    ('canon','habakkuk',2,5,'canon','isaiah',5,14,'free',
      E'*Therefore hell hath enlarged herself, and opened her mouth without measure: and their glory, and their multitude, and their pomp, and he that rejoiceth, shall descend into it* (Isaiah 5:14). The man who *enlargeth his desire as hell* (Habakkuk 2:5) becomes hell''s own prey: Sheol enlarges to swallow the glory and multitude of the greedy. He who would gather all nations is gathered down himself.'),

    -- THREAD 4 (★★): The woes — the blood-built city; the very stones cry out
    ('canon','habakkuk',2,11,'canon','luke',19,40,'free',
      E'*And he answered and said unto them, I tell you that, if these should hold their peace, the stones would immediately cry out* (Luke 19:40). Habakkuk says the stones of the unjust house testify against it: *For the stone shall cry out of the wall, and the beam out of the timber shall answer it* (Habakkuk 2:11). Yahusha (Jesus) speaks the same truth — creation itself bears witness; the very stones will not be silent.'),
    ('canon','habakkuk',2,12,'canon','micah',3,10,'free',
      E'*They build up Zion with blood, and Jerusalem with iniquity* (Micah 3:10). This is the very woe of Habakkuk 2:12 — *Woe to him that buildeth a town with blood, and stablisheth a city by iniquity!* The city raised on bloodshed and injustice stands condemned; what is *not his* (2:6) and what is built with blood will be torn down, measure for measure.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s335_hab02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s335_hab02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 5 (★★★): The earth filled with the knowledge of the glory of Yahuah
    ('canon','habakkuk',2,14,'canon','isaiah',11,9,'free',
      E'*They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). This is near-identical to Habakkuk''s consummation — *For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14). The Messianic-age goal of all history: the whole earth flooded with the knowledge of Yahuah (LORD) as the sea is full of water.'),
    ('canon','habakkuk',2,14,'canon','numbers',14,21,'free',
      E'*But as truly as I live, all the earth shall be filled with the glory of Yahuah (LORD)* (Numbers 14:21). The promise Habakkuk sings — *the earth shall be filled with the knowledge of the glory of Yahuah (LORD)* (Habakkuk 2:14) — is Yahuah''s own oath sworn in the wilderness: *all the earth shall be filled with the glory of Yahuah (LORD).* The glory will fill the earth; it is as sure as his own life.'),
    ('canon','habakkuk',2,14,'canon','psalms',72,19,'free',
      E'*And blessed be his glorious name for ever: and let the whole earth be filled with his glory; Amen, and Amen* (Psalm 72:19). The Messianic-kingdom psalm closes with the very prayer Habakkuk declares accomplished — *the earth shall be filled with the knowledge of the glory of Yahuah (LORD)* (Habakkuk 2:14). The whole earth filled with his glory is the end toward which all history bends.'),
    ('canon','habakkuk',2,14,'canon','revelation',21,23,'free',
      E'*And the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof* (Revelation 21:23). The earth *filled with the knowledge of the glory of Yahuah (LORD)* (Habakkuk 2:14) reaches its consummation in the New Jerusalem, where the glory itself is the light. The knowledge of his glory covering the sea becomes the glory that lightens the city of the redeemed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s335_hab02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s335_hab02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 6 (★★): The dumb idol with no breath vs. Yahuah in his holy temple (Formed/Formless)
    ('canon','habakkuk',2,18,'canon','isaiah',44,9,'free',
      E'*They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed* (Isaiah 44:9). Habakkuk asks the same: *What profiteth the graven image that the maker thereof hath graven it... to make dumb idols?* (Habakkuk 2:18). The made-thing cannot profit; the maker trusts in the work of his own hands — vanity that sees not nor knows.'),
    ('canon','habakkuk',2,19,'canon','psalms',115,4,'free',
      E'*Their idols are silver and gold, the work of men''s hands* (Psalm 115:4). The idol of Habakkuk 2:19 is *laid over with gold and silver, and there is no breath at all in the midst of it* — the very thing the psalm exposes: silver and gold, the work of men''s hands. A thing men make cannot be a god.'),
    ('canon','habakkuk',2,19,'canon','psalms',115,5,'free',
      E'*They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5). Habakkuk mocks the man who *saith to the wood, Awake; to the dumb stone, Arise, it shall teach!* (Habakkuk 2:19) — yet *there is no breath at all in the midst of it.* The idol that cannot speak nor see is summoned to teach and to wake; the dead cannot give life.'),
    ('canon','habakkuk',2,19,'canon','psalms',115,8,'free',
      E'*They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). The maker who *trusteth therein* (Habakkuk 2:18) becomes as lifeless as his idol — *no breath at all in the midst of it* (2:19). To trust the dumb stone is to be made dumb with it; men become like what they worship.'),
    ('canon','habakkuk',2,20,'canon','psalms',11,4,'free',
      E'*Yahuah (LORD) is in his holy temple, the LORD''S throne is in heaven: his eyes behold, his eyelids try, the children of men* (Psalm 11:4). Against the dead idol, Habakkuk lifts the living One: *But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20) — word for word the psalm''s confession. The Formed and the Formless: not a made-thing, but the living Yahuah (LORD) enthroned, whose eyes behold all flesh.'),
    ('canon','habakkuk',2,20,'canon','zephaniah',1,7,'free',
      E'*Hold thy peace at the presence of Adonai Yahuah (the Lord GOD): for the day of Yahuah (LORD) is at hand* (Zephaniah 1:7). The command of Habakkuk 2:20 — *let all the earth keep silence before him* — is Zephaniah''s same hush before the living Yahuah (LORD). All flesh falls silent at the presence of the enthroned One.'),
    ('canon','habakkuk',2,20,'canon','zechariah',2,13,'free',
      E'*Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:13). Zechariah echoes Habakkuk word for thought — *let all the earth keep silence before him* (Habakkuk 2:20). The living Yahuah (LORD) rises from his holy habitation and all flesh is hushed; the idols are dumb, but he is the One before whom the earth keeps silence.'),
    ('canon','habakkuk',2,20,'canon','revelation',8,1,'free',
      E'*And when he had opened the seventh seal, there was silence in heaven about the space of half an hour* (Revelation 8:1). The hush of Habakkuk 2:20 — *let all the earth keep silence before him* — falls even in heaven before the throne. When Yahuah (LORD) acts from his holy temple, all creation, earth and heaven, keeps silence before him.'),
    ('canon','habakkuk',2,19,'apocrypha','the-wisdom-of-solomon',15,15,'extras',
      E'*For they counted all the idols of the heathen to be gods: which neither have the use of eyes to see, nor noses to draw breath, nor ears to hear, nor fingers of hands to handle; and as for their feet, they are slow to go* (Wisdom of Solomon 15:15). The restored witness names exactly Habakkuk''s charge — the idol with *no breath at all in the midst of it* (Habakkuk 2:19). The made-thing has no breath to draw, no eyes, no ears; it cannot be a god, for *man made them.*')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s335_hab02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s335_hab02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-2-write-the-vision-it-will-surely-come',
       E'Write the vision — though it tarry, wait for it; it will surely come',
       E'The prophet takes the watchman''s post and waits for Yahuah''s answer: *I will stand upon my watch, and set me upon the tower, and will watch to see what he will say unto me, and what I shall answer when I am reproved* (Habakkuk 2:1). It is the same stance Isaiah keeps — *I stand continually upon the watchtower in the daytime, and I am set in my ward whole nights* (Isaiah 21:8) — and the same waiting trust of Micah: *Therefore I will look unto Yahuah (LORD); I will wait for the Elohim (God) of my salvation: my Elohim (God) will hear me* (Micah 7:7), and the psalmist who in the morning will *look up* for the answer (Psalm 5:3). And the answer comes: *Write the vision, and make it plain upon tables, that he may run that readeth it. For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:2-3). The vision is bound to an APPOINTED TIME — a moed — certain though it seem delayed. Hebrews lifts this very word and names the appointed-time vision as the COMING ONE: *For yet a little while, and he that shall come will come, and will not tarry* (Hebrews 10:37). And Peter explains the seeming delay: *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The watchman waits; the vision keeps its time; it will not tarry.',
       sv.verse_id, ev.verse_id, 'free', 45565
  FROM _s335_hab02_lookup sv, _s335_hab02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★) — THE KEYSTONE
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-2-the-just-shall-live-by-his-faith',
       E'The just shall live by his faith — living covenant-faithfulness, not faith against Torah',
       E'This is the supreme keystone of the chapter, the verse Paul cites three times across the New Testament: *Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith* (Habakkuk 2:4). Two souls stand opposed — the PROUD, *lifted up* and *not upright*, and the JUST, who *live by his faith.* The Hebrew is emunah: faithfulness, steadfastness, the trust that endures and holds fast to Yahuah (LORD). It is the same faith by which Abraham *believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6) — and that same believing was made alive in obedience: *Seest thou how faith wrought with his works, and by works was faith made perfect?* (James 2:22). Paul builds his gospel on Habakkuk: *For therein is the righteousness of Elohim (God) revealed from faith to faith: as it is written, The just shall live by faith* (Romans 1:17); *But that no man is justified by the law in the sight of Elohim (God), it is evident: for, The just shall live by faith* (Galatians 3:11) — not faith AGAINST the Torah, but the exclusion of flesh-merit as a credential; no man earns righteousness by self-effort, the just are accounted righteous through faithful trust. And Hebrews keeps BOTH halves of Habakkuk''s verse in view, the enduring faithfulness that does not draw back: *Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him. But we are not of them who draw back unto perdition; but of them that believe to the saving of the soul* (Hebrews 10:38-39). This is no one-time confession set against works — it is living covenant-faithfulness, the steadfast trust that obeys and perseveres. Faith and Torah-obedience are inseparable; any reading that makes commandment-keeping irrelevant is the very thing this verse condemns (1 John 2:3-4). The just live BY faithfulness, the opposite of the soul lifted up in pride.',
       sv.verse_id, ev.verse_id, 'free', 45568
  FROM _s335_hab02_lookup sv, _s335_hab02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-2-the-soul-enlarged-as-sheol-never-satisfied',
       E'Who enlargeth his desire as hell — the proud conqueror never satisfied',
       E'Over against the just who live by faithfulness stands the proud conqueror, his appetite bottomless: *Yea also, because he transgresseth by wine, he is a proud man, neither keepeth at home, who enlargeth his desire as hell, and is as death, and cannot be satisfied, but gathereth unto him all nations, and heapeth unto him all people* (Habakkuk 2:5). He is as insatiable as Sheol itself — the very thing the wisdom of Proverbs names: *Hell and destruction are never full; so the eyes of man are never satisfied* (Proverbs 27:20). The more he devours, the emptier he grows. And the grave that he imitates will swallow him in turn: *Therefore hell hath enlarged herself, and opened her mouth without measure: and their glory, and their multitude, and their pomp, and he that rejoiceth, shall descend into it* (Isaiah 5:14). He who *enlargeth his desire as hell* is gathered down by hell; the proud devourer becomes the devoured.',
       sv.verse_id, ev.verse_id, 'free', 45571
  FROM _s335_hab02_lookup sv, _s335_hab02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-2-the-stone-shall-cry-out-of-the-wall',
       E'The stone shall cry out of the wall — the woes on the blood-built city',
       E'The plundered nations take up a taunting proverb against their oppressor, and the woes fall measure for measure: *Woe to him that increaseth that which is not his!... Because thou hast spoiled many nations, all the remnant of the people shall spoil thee; because of men''s blood, and for the violence of the land* (Habakkuk 2:6, 8) — the spoiler is spoiled. *Woe to him that coveteth an evil covetousness to his house, that he may set his nest on high* (2:9): yet the very house he built betrays him — *For the stone shall cry out of the wall, and the beam out of the timber shall answer it* (2:11). The stones of an unjust house testify against its builder. Yahusha (Jesus) speaks the same truth: *I tell you that, if these should hold their peace, the stones would immediately cry out* (Luke 19:40) — creation itself will not stay silent before injustice. And the third woe: *Woe to him that buildeth a town with blood, and stablisheth a city by iniquity!* (2:12) — which Micah pronounces in the same breath against Zion''s rulers: *They build up Zion with blood, and Jerusalem with iniquity* (Micah 3:10). The cup comes round: *the cup of the LORD''S right hand shall be turned unto thee, and shameful spewing shall be on thy glory* (2:16). What is taken by blood and built by iniquity will be torn down; the very walls cry out for justice.',
       sv.verse_id, ev.verse_id, 'free', 45574
  FROM _s335_hab02_lookup sv, _s335_hab02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-2-the-earth-filled-with-the-knowledge-of-the-glory',
       E'The earth filled with the knowledge of the glory of Yahuah, as the waters cover the sea',
       E'At the heart of the woes Habakkuk lifts the eye to the end of all history. The nations labour and weary themselves for nothing — *Behold, is it not of Yahuah Tseva''ot (LORD of hosts) that the people shall labour in the very fire, and the people shall weary themselves for very vanity?* (Habakkuk 2:13) — because the world is moving toward one consummation: *For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14). This is the Messianic-age goal, sung almost word for word by Isaiah: *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). It is Yahuah''s own oath sworn in the wilderness: *as truly as I live, all the earth shall be filled with the glory of Yahuah (LORD)* (Numbers 14:21); and the closing prayer of the Messianic kingdom-psalm: *let the whole earth be filled with his glory; Amen, and Amen* (Psalm 72:19). It reaches its consummation in the city of the redeemed, where the glory itself is the light: *the city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof* (Revelation 21:23). The oppressor''s violence is a passing vanity; the knowledge of his glory covering the earth as the sea covers its floor is the sure end toward which all things bend.',
       sv.verse_id, ev.verse_id, 'free', 45577
  FROM _s335_hab02_lookup sv, _s335_hab02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol',
       E'Yahuah is in his holy temple — the dumb idol with no breath vs. the living One',
       E'The last woe turns on the idol, and the chapter ends in the great contrast of the Formed and the Formless — the living One against the made-thing. Habakkuk exposes the idol''s nothingness: *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols? Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it* (Habakkuk 2:18-19). It is the same scorn the psalmist pours: *Their idols are silver and gold, the work of men''s hands. They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:4-5), and the dreadful verdict — *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8); men become as lifeless as what they worship. Isaiah names it vanity: *They that make a graven image are all of them vanity... they see not, nor know; that they may be ashamed* (Isaiah 44:9). And the restored witness says it plainest of all — the idols *neither have the use of eyes to see, nor noses to draw breath, nor ears to hear, nor fingers of hands to handle* (Wisdom of Solomon 15:15) — exactly Habakkuk''s *no breath at all in the midst of it.* Then comes the thunder-clap of the living One: *But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20). This is no made-thing but the enthroned Yahuah (LORD): *Yahuah (LORD) is in his holy temple, the LORD''S throne is in heaven: his eyes behold... the children of men* (Psalm 11:4). Before him all flesh is hushed: *Hold thy peace at the presence of Adonai Yahuah (the Lord GOD)* (Zephaniah 1:7); *Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:13) — and the silence falls even in heaven: *when he had opened the seventh seal, there was silence in heaven about the space of half an hour* (Revelation 8:1). The dead idol has no breath; the living Yahuah (LORD) reigns in his holy temple, and all the earth keeps silence before him.',
       sv.verse_id, ev.verse_id, 'extras', 45580
  FROM _s335_hab02_lookup sv, _s335_hab02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I stand continually upon the watchtower in the daytime, and I am set in my ward whole nights* (Isaiah 21:8) — the watchman''s post of Habakkuk 2:1, kept until Yahuah (LORD) answers.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=21 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-write-the-vision-it-will-surely-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will wait for the Elohim (God) of my salvation: my Elohim (God) will hear me* (Micah 7:7) — the same waiting trust as *I will watch to see what he will say unto me* (Habakkuk 2:1).'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-write-the-vision-it-will-surely-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*in the morning will I direct my prayer unto thee, and will look up* (Psalm 5:3) — to look up and wait for the answer is the posture of Habakkuk 2:1.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-write-the-vision-it-will-surely-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *For yet a little while, and he that shall come will come, and will not tarry* (Hebrews 10:37) — Hebrews quotes Habakkuk 2:3 and names the appointed-time vision the COMING ONE.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-write-the-vision-it-will-surely-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Yahuah (Lord) is not slack concerning his promise... but is longsuffering* (2 Peter 3:9) — the seeming delay of Habakkuk 2:3 is not slackness but patience; the appointed end keeps its time.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-write-the-vision-it-will-surely-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★) — THE KEYSTONE
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *as it is written, The just shall live by faith* (Romans 1:17) — Paul builds the gospel on Habakkuk 2:4; emunah, living covenant-faithful trust, NOT a faith opposed to obedience.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-just-shall-live-by-his-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *no man is justified by the law... for, The just shall live by faith* (Galatians 3:11) — flesh-merit excluded as a credential, NOT the Torah; the just accounted righteous through faithful trust.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-just-shall-live-by-his-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* (Hebrews 10:38) — both halves of Habakkuk 2:4: faithfulness that does NOT draw back.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-just-shall-live-by-his-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*of them that believe to the saving of the soul* (Hebrews 10:39) — the just who *live by his faith* (Habakkuk 2:4) are those who endure, not those who draw back.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-just-shall-live-by-his-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6) — Abraham''s faithfulness is the pattern of *the just shall live by his faith* (Habakkuk 2:4).'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-just-shall-live-by-his-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *faith wrought with his works, and by works was faith made perfect* (James 2:22) — *the just shall live by his faith* (Habakkuk 2:4) is faithfulness perfected in obedience; faith and works inseparable.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-just-shall-live-by-his-faith'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Hell and destruction are never full; so the eyes of man are never satisfied* (Proverbs 27:20) — the conqueror who *enlargeth his desire as hell... cannot be satisfied* (Habakkuk 2:5).'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-soul-enlarged-as-sheol-never-satisfied'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *hell hath enlarged herself, and opened her mouth without measure* (Isaiah 5:14) — he who *enlargeth his desire as hell* (Habakkuk 2:5) is swallowed by hell in turn; the devourer devoured.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-soul-enlarged-as-sheol-never-satisfied'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *if these should hold their peace, the stones would immediately cry out* (Luke 19:40) — Yahusha (Jesus) speaks Habakkuk''s truth: *the stone shall cry out of the wall* (Habakkuk 2:11); creation will not stay silent.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-stone-shall-cry-out-of-the-wall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *They build up Zion with blood, and Jerusalem with iniquity* (Micah 3:10) — the very woe of Habakkuk 2:12: *Woe to him that buildeth a town with blood.*'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-stone-shall-cry-out-of-the-wall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9) — near-identical to Habakkuk 2:14; the Messianic-age consummation.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-earth-filled-with-the-knowledge-of-the-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *as truly as I live, all the earth shall be filled with the glory of Yahuah (LORD)* (Numbers 14:21) — Yahuah''s own oath sworn in the wilderness, accomplished in Habakkuk 2:14.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-earth-filled-with-the-knowledge-of-the-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *let the whole earth be filled with his glory; Amen, and Amen* (Psalm 72:19) — the Messianic-kingdom psalm''s closing prayer, the same end as Habakkuk 2:14.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-earth-filled-with-the-knowledge-of-the-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the glory of Elohim (God) did lighten it, and the Lamb is the light thereof* (Revelation 21:23) — the knowledge of his glory covering the sea (Habakkuk 2:14) consummated in the city of the redeemed.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-the-earth-filled-with-the-knowledge-of-the-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *They that make a graven image are all of them vanity... they see not, nor know* (Isaiah 44:9) — the dumb idol of Habakkuk 2:18 that cannot profit its maker.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Their idols are silver and gold, the work of men''s hands* (Psalm 115:4) — the idol *laid over with gold and silver* (Habakkuk 2:19), a thing men make.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5) — the dumb stone summoned to teach and wake (Habakkuk 2:19), with no breath in it.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8) — the maker who *trusteth therein* (Habakkuk 2:18) becomes as lifeless as his idol.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *neither have the use of eyes to see, nor noses to draw breath, nor ears to hear* (Wisdom of Solomon 15:15) — the restored witness names Habakkuk''s charge: *no breath at all in the midst of it* (Habakkuk 2:19).'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=15 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Yahuah (LORD) is in his holy temple, the LORD''S throne is in heaven* (Psalm 11:4) — word for word the confession of Habakkuk 2:20; the living One, not the made-thing.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Hold thy peace at the presence of Adonai Yahuah (the Lord GOD)* (Zephaniah 1:7) — the same hush as *let all the earth keep silence before him* (Habakkuk 2:20).'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:13) — the living Yahuah (LORD) rises and all flesh is hushed, as in Habakkuk 2:20.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*there was silence in heaven about the space of half an hour* (Revelation 8:1) — the hush of Habakkuk 2:20 falls even in heaven before the throne.'
  FROM cross_reference_threads t
  JOIN _s335_hab02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s335_hab02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-2-yahuah-is-in-his-holy-temple-the-dumb-idol'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_habakkuk_3.sql (Habakkuk 3) -----
-- Chapter: Habakkuk 3 — THE PRAYER/PSALM OF HABAKKUK, the book's climactic theodicy answered in song.
-- A prayer *upon Shigionoth* with *Selah* markers and a closing *To the chief singer on my stringed
-- instruments* (3:1,19) — this is liturgy. ★★ The prophet trembles at Yahuah's word and pleads
-- *O Yahuah (LORD), revive thy work in the midst of the years... in wrath remember mercy* (3:2). ★★ Then
-- the SINAI-theophany of the coming Yahuah: *Elohim (God) came from Teman, and the Holy One from mount
-- Paran... His glory covered the heavens* (3:3) — the Formed Son the visible Glory/brightness, drawn from
-- the Formless Father (the Formed and the Formless; NOT trinitarian co-equal grammar, NOT modalist). ★★
-- Yahuah marches out *for the salvation of thy people, even for salvation with thine anointed* and
-- *woundedst the head out of the house of the wicked* (3:13) — the Messianic deliverer and the crushed
-- serpent-head (Genesis 3:15). ★★★ The keystone close: *Although the fig tree shall not blossom... Yet I
-- will rejoice in Yahuah (LORD), I will joy in the Elohim (God) of my salvation* (3:17-18) — the embodiment
-- of 2:4, *the just shall live by his faith*, faith put into song.
-- Tag: hab03   Temp view: _s335_hab03_lookup
-- Sort band: base 45580, step 3 -> threads at 45580, 45583, 45586, 45589 (4 threads)
-- Source of EVERY row: 'canon','habakkuk',3,v
--
-- Habakkuk 3 coverage:
--   v.1  (A prayer of Habakkuk the prophet upon Shigionoth) — superscription; woven into THREAD 1 prose.
--        NT/Extras/Tanakh: none warranted (liturgical heading).
--   ★★ v.2 (O Yahuah, I have heard thy speech, and was afraid... revive thy work in the midst of the years
--          ... in wrath remember mercy)
--        NT:     none warranted distinct (the mercy-in-wrath plea is carried in prose).
--        Extras: none warranted.
--        Tanakh: ★ Psalm 85:6 (Wilt thou not revive us again: that thy people may rejoice in thee?),
--                ★ Psalm 90:13-14 (Return, O Yahuah, how long?... O satisfy us early with thy mercy),
--                ★ Isaiah 51:9 (Awake, awake, put on strength, O arm of Yahuah) — THREAD 1.
--   ★★ v.3-6 (Elohim came from Teman, and the Holy One from mount Paran... His glory covered the heavens
--          ... his brightness was as the light; he had horns coming out of his hand... the everlasting
--          mountains were scattered... his ways are everlasting)
--        NT:     none warranted distinct (the Formed-Glory weave is carried by the Tanakh theophany texts
--                + prose; no single NT verse forced).
--        Extras: none warranted clean for the theophany itself.
--        Tanakh: ★★ Deuteronomy 33:2 (Yahuah came from Sinai... he shined forth from mount Paran),
--                ★ Judges 5:4-5 (Yahuah, when thou wentest out of Seir... the mountains melted),
--                ★ Psalm 18:7-15 (the earth shook... he bowed the heavens also, and came down),
--                ★ Isaiah 63:1 (Who is this that cometh from Edom... mighty to save),
--                ★ Micah 1:3-4 (Yahuah cometh forth out of his place... the mountains shall be molten),
--                ★ Psalm 90:2 (Before the mountains were brought forth... thou art Elohim) — THREAD 2.
--   v.5  (Before him went the pestilence, and burning coals went forth at his feet) — within the theophany,
--        woven into THREAD 2 (Psalm 18:8 coals/fire).
--   v.7-12 (the tents of Cushan... the sun and moon stood still... thou didst thresh the heathen) — the
--        cosmic war-march; v.6/v.10 mountains woven into THREAD 2; v.8-12 held in THREAD 2/3 prose.
--        NT/Extras: none warranted. Tanakh: covered by THREAD 2.
--   ★★ v.13 (Thou wentest forth for the salvation of thy people, even for salvation with thine anointed;
--          thou woundedst the head out of the house of the wicked)
--        NT:     ★★ Romans 16:20 (the Elohim of peace shall bruise Satan under your feet shortly) — THREAD 3.
--        Extras: none warranted clean.
--        Tanakh: ★★ Genesis 3:15 (it shall bruise thy head, and thou shalt bruise his heel),
--                ★ Psalm 110:6 (he shall wound the heads over many countries) — THREAD 3.
--   v.14-16 (Thou didst strike through... When I heard, my belly trembled... that I might rest in the day
--        of trouble) — the trembling that waits in quietness; woven into THREAD 4 prose (the faith that
--        chooses to rest before deliverance comes).
--        NT/Extras/Tanakh: none warranted distinct.
--   ★★★ v.17-19 (Although the fig tree shall not blossom... Yet I will rejoice in Yahuah, I will joy in the
--          Elohim of my salvation. Yahuah Elohim is my strength, and he will make my feet like hinds' feet)
--        NT:     ★★★ Philippians 4:4 (Rejoice in Yahuah alway: and again I say, Rejoice),
--                ★★ Romans 5:3 (we glory in tribulations also: knowing that tribulation worketh patience),
--                ★ James 1:2-3 (count it all joy when ye fall into divers temptations),
--                ★ 2 Corinthians 6:10 (As sorrowful, yet alway rejoicing) — THREAD 4.
--        Extras: ★ Ecclesiasticus 2:5-6 (gold is tried in the fire, and acceptable men in the furnace of
--                adversity... Believe in him, and he will help you) — THREAD 4.
--        Tanakh: ★ Psalm 46:1-3 (Elohim is our refuge... we will not fear, though the earth be removed),
--                ★ Psalm 18:33 (He maketh my feet like hinds' feet, and setteth me upon my high places),
--                ★ Habakkuk 2:4 (the just shall live by his faith) — THREAD 4.
--
-- Threads (slug — target libraries):
--   1. habakkuk-3-revive-thy-work-in-wrath-remember-mercy — Tanakh (Psalm 85, Psalm 90, Isaiah 51) [free]
--      (★★ the trembling plea: reviving of Yahuah's work, mercy remembered within judgment)
--   2. habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens — Tanakh (Deut 33, Judges 5,
--      Psalm 18, Isaiah 63, Micah 1, Psalm 90) [free]
--      (★★ the Sinai-theophany; the Formed Son the visible Glory who comes from the south; the
--       everlasting Judge before whom the ancient mountains bow)
--   3. habakkuk-3-salvation-with-thine-anointed-the-wounded-head — NT (Romans 16) + Tanakh (Genesis 3,
--      Psalm 110) [free]
--      (★★ Yahuah marches out to save with his Anointed; the crushed serpent-head, Genesis 3:15)
--   4. habakkuk-3-yet-i-will-rejoice-in-yahuah — NT (Philippians 4, Romans 5, James 1, 2 Corinthians 6)
--      + Extras (Ecclesiasticus 2) + Tanakh (Psalm 46, Psalm 18, Habakkuk 2) [extras]
--      (★★★ THE KEYSTONE: the choice to rejoice in Yahuah when everything fails — 2:4's living faith in song)
--
-- Framing notes:
--   ★★ REVIVE THY WORK (THREAD 1): *O Yahuah (LORD), I have heard thy speech, and was afraid: O Yahuah
--      (LORD), revive thy work in the midst of the years, in the midst of the years make known; in wrath
--      remember mercy* (3:2). The prophet trembles at Yahuah's word and prays the very prayer the Psalms
--      sing — *Wilt thou not revive us again: that thy people may rejoice in thee?* (Psalm 85:6); *Return,
--      O Yahuah (LORD), how long?... O satisfy us early with thy mercy* (Psalm 90:13-14); *Awake, awake,
--      put on strength, O arm of Yahuah (LORD)* (Isaiah 51:9). Mercy is sought INSIDE the wrath, not
--      instead of it — the covenant heart pleading for the reviving of Yahuah's own work.
--   ★★ THE THEOPHANY (THREAD 2): *Elohim (God) came from Teman, and the Holy One from mount Paran. Selah.
--      His glory covered the heavens, and the earth was full of his praise. And his brightness was as the
--      light; he had horns coming out of his hand* (3:3-4). This is the Sinai-theophany of the coming
--      Yahuah, the SAME southern approach Moses sang: *Yahuah (LORD) came from Sinai... he shined forth
--      from mount Paran* (Deuteronomy 33:2); *Yahuah (LORD), when thou wentest out of Seir... the mountains
--      melted* (Judges 5:4-5). The visible Glory, the brightness as the light, the rays from his hand — the
--      Formed Son, the expressed Word drawn from the Formless Father, the One who appeared at Sinai and
--      shines forth; he is Yahuah and HAS a Father (NOT co-equal trinitarian persons, NOT modalist). Before
--      him *the everlasting mountains were scattered... his ways are everlasting* (3:6) — the eternal Judge
--      of Psalm 90:2, Micah 1:3-4, Psalm 18:7-15, the One of Isaiah 63:1 *mighty to save*.
--   ★★ SALVATION WITH THINE ANOINTED (THREAD 3): *Thou wentest forth for the salvation of thy people, even
--      for salvation with thine anointed; thou woundedst the head out of the house of the wicked* (3:13).
--      Yahuah marches out to SAVE, and he saves *with thine anointed* (et-meshichecha) — the Messianic
--      deliverer who has a Father. *Thou woundedst the head* is the first promise crushed home: *it shall
--      bruise thy head, and thou shalt bruise his heel* (Genesis 3:15); *he shall wound the heads over many
--      countries* (Psalm 110:6). Paul seals it forward: *the Elohim (God) of peace shall bruise Satan under
--      your feet shortly* (Romans 16:20) — the serpent-head finally crushed in the Anointed.
--   ★★★ YET I WILL REJOICE (THREAD 4): *Although the fig tree shall not blossom, neither shall fruit be in
--      the vines; the labour of the olive shall fail, and the fields shall yield no meat; the flock shall be
--      cut off from the fold, and there shall be no herd in the stalls: Yet I will rejoice in Yahuah (LORD),
--      I will joy in the Elohim (God) of my salvation* (3:17-18). This is the answer to the whole book's
--      theodicy — *the just shall live by his faith* (2:4) embodied. The joy is rooted in Yahuah HIMSELF,
--      not in circumstances. Paul says the same word forward: *Rejoice in Yahuah (Lord) alway: and again I
--      say, Rejoice* (Philippians 4:4); *we glory in tribulations also* (Romans 5:3); *count it all joy when
--      ye fall into divers temptations* (James 1:2); *As sorrowful, yet alway rejoicing* (2 Corinthians
--      6:10). The restored witness teaches the furnace-trust: *gold is tried in the fire, and acceptable men
--      in the furnace of adversity... Believe in him, and he will help you* (Ecclesiasticus 2:5-6). And
--      Yahuah makes the rejoicer sure-footed: *he will make my feet like hinds' feet* (3:19) — *He maketh my
--      feet like hinds' feet, and setteth me upon my high places* (Psalm 18:33); the refuge of Psalm 46:1-3,
--      *though the earth be removed*.
--   EXTRAS: Ecclesiasticus 2:5-6 (the furnace of adversity, trust him to help) — a clean wisdom witness on
--      rejoicing/trusting through trial, parse verified. No extras forced on the plea, the theophany, or the
--      wounded head.
--   VERSES WITH NO SEPARATE ADD: v.1 (superscription — woven into THREAD 1), v.5/v.7-12 (the war-march,
--      pestilence, sun/moon stood still — the cosmic theophany, woven into THREAD 2), v.14-16 (the trembling
--      that rests in the day of trouble — woven into THREAD 4 as the faith that waits). All recorded, none
--      silently skipped.

CREATE TEMP VIEW _s335_hab03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Revive thy work — in wrath remember mercy
    ('canon','habakkuk',3,2,'canon','psalms',85,6,'free',
      E'*Wilt thou not revive us again: that thy people may rejoice in thee?* (Psalm 85:6). The prophet''s plea *revive thy work in the midst of the years* (Habakkuk 3:2) is the very prayer the sons of Korah sing — *Wilt thou not revive us again*. The reviving of Yahuah''s (LORD''s) work is sought so *that thy people may rejoice in thee*: judgment is real, but the cry is for life to be poured back into the covenant.'),
    ('canon','habakkuk',3,2,'canon','psalms',90,13,'free',
      E'*Return, O Yahuah (LORD), how long? and let it repent thee concerning thy servants* (Psalm 90:13). Habakkuk''s *in wrath remember mercy* (Habakkuk 3:2) echoes Moses'' own prayer — *Return, O Yahuah (LORD), how long?* — the appeal that Yahuah''s anger turn to compassion toward his servants. Mercy is sought INSIDE the wrath, not instead of it.'),
    ('canon','habakkuk',3,2,'canon','psalms',90,14,'free',
      E'*O satisfy us early with thy mercy; that we may rejoice and be glad all our days* (Psalm 90:14). The *mercy* Habakkuk asks Yahuah (LORD) to *remember* in wrath (Habakkuk 3:2) is the same mercy Moses begs to be satisfied with — *satisfy us early with thy mercy; that we may rejoice and be glad*. The reviving of Yahuah''s work and the remembering of mercy issue in the very rejoicing the chapter ends on (3:18).'),
    ('canon','habakkuk',3,2,'canon','isaiah',51,9,'free',
      E'*Awake, awake, put on strength, O arm of Yahuah (LORD); awake, as in the ancient days, in the generations of old* (Isaiah 51:9). Habakkuk''s cry *revive thy work in the midst of the years* (Habakkuk 3:2) is Isaiah''s *Awake, awake, put on strength, O arm of Yahuah (LORD)* — the plea that Yahuah act now *as in the ancient days*, that the saving arm of the old theophanies stir again in the present hour.'),

    -- THREAD 2 (★★): Eloah came from Teman — the theophany, the Formed Son the visible Glory
    ('canon','habakkuk',3,3,'canon','deuteronomy',33,2,'free',
      E'*And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them* (Deuteronomy 33:2). Habakkuk''s *Elohim (God) came from Teman, and the Holy One from mount Paran... His glory covered the heavens* (Habakkuk 3:3) is the SAME Sinai-theophany Moses sang — the coming Yahuah *from mount Paran*, the southern approach, the Glory shining forth. The visible One who came from Sinai with the fiery law is the Formed Son, drawn from the Formless Father, who is Yahuah and has a Father.'),
    ('canon','habakkuk',3,3,'canon','judges',5,4,'free',
      E'*Yahuah (LORD), when thou wentest out of Seir, when thou marchedst out of the field of Edom, the earth trembled, and the heavens dropped, the clouds also dropped water* (Judges 5:4). Deborah sings the same march Habakkuk beholds — Yahuah (LORD) coming *out of Seir... out of the field of Edom*, the same southern theophany of *Elohim (God) came from Teman* (Habakkuk 3:3). The earth trembles before the coming Glory.'),
    ('canon','habakkuk',3,3,'canon','judges',5,5,'free',
      E'*The mountains melted from before Yahuah (LORD), even that Sinai from before Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Judges 5:5). The *everlasting mountains* that *were scattered* before the coming One (Habakkuk 3:6) are the mountains that *melted from before Yahuah (LORD), even that Sinai* — the same Sinai-Glory, the same trembling creation, before whom Habakkuk''s theophany advances.'),
    ('canon','habakkuk',3,4,'canon','psalms',18,7,'free',
      E'*Then the earth shook and trembled; the foundations also of the hills moved and were shaken, because he was wroth* (Psalm 18:7). Habakkuk''s *brightness was as the light; he had horns coming out of his hand* (Habakkuk 3:4) is the same storm-theophany David sings — the earth shaking, the hills moved, when Yahuah (LORD) comes down in his glory. The visible Glory descends and creation reels.'),
    ('canon','habakkuk',3,5,'canon','psalms',18,8,'free',
      E'*There went up a smoke out of his nostrils, and fire out of his mouth devoured: coals were kindled by it* (Psalm 18:8). *Before him went the pestilence, and burning coals went forth at his feet* (Habakkuk 3:5) is the same fire of the descending Glory — *fire out of his mouth devoured: coals were kindled by it*. The coming One advances wreathed in the consuming fire of the theophany.'),
    ('canon','habakkuk',3,6,'canon','micah',1,3,'free',
      E'*For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth* (Micah 1:3). Habakkuk''s *He stood, and measured the earth: he beheld, and drove asunder the nations* (Habakkuk 3:6) is Micah''s *Yahuah (LORD) cometh forth out of his place... and tread upon the high places of the earth* — the cosmic Judge descending to measure and shake the whole earth.'),
    ('canon','habakkuk',3,6,'canon','micah',1,4,'free',
      E'*And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place* (Micah 1:4). The *everlasting mountains were scattered, the perpetual hills did bow* (Habakkuk 3:6) is Micah''s *the mountains shall be molten under him... as wax before the fire* — the ancient mountains melting before the One whose *ways are everlasting*.'),
    ('canon','habakkuk',3,6,'canon','psalms',90,2,'free',
      E'*Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2). When Habakkuk says *the everlasting mountains were scattered... his ways are everlasting* (Habakkuk 3:6), he names the One older than the mountains themselves — *from everlasting to everlasting, thou art Elohim (God)*. The hills that seem eternal bow before the truly Everlasting.'),
    ('canon','habakkuk',3,3,'canon','isaiah',63,1,'free',
      E'*Who is this that cometh from Edom, with dyed garments from Bozrah? this that is glorious in his apparel, travelling in the greatness of his strength? I that speak in righteousness, mighty to save* (Isaiah 63:1). Habakkuk''s One who *came from Teman... from mount Paran* (Habakkuk 3:3) — the southern, Edomite approach — is the same coming One Isaiah sees *from Edom... mighty to save*. The visible Glory who marches from the south is *mighty to save* his people.'),

    -- THREAD 3 (★★): Salvation with thine anointed — the wounded head (Genesis 3:15)
    ('canon','habakkuk',3,13,'canon','genesis',3,15,'free',
      E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). Habakkuk''s *thou woundedst the head out of the house of the wicked* (Habakkuk 3:13) is the first promise crushed home — *it shall bruise thy head*. Yahuah (LORD) goes forth *for salvation with thine anointed*, and the saving stroke falls on the serpent''s head, the seed-war of Eden ending in the wounding of the enemy''s head.'),
    ('canon','habakkuk',3,13,'canon','psalms',110,6,'free',
      E'*He shall judge among the heathen, he shall fill the places with the dead bodies; he shall wound the heads over many countries* (Psalm 110:6). The *anointed* of Habakkuk 3:13 who *woundedst the head out of the house of the wicked* is the Melek-Tsadiq King of Psalm 110 who *shall wound the heads over many countries* — the Messianic deliverer who breaks the head of the wicked in the day of his power.'),
    ('canon','habakkuk',3,13,'canon','romans',16,20,'free',
      E'*And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen* (Romans 16:20). Habakkuk''s *thou woundedst the head out of the house of the wicked* (Habakkuk 3:13) is sealed forward by Paul — *the Elohim (God) of peace shall bruise Satan under your feet shortly*. The head wounded in the theophany, the serpent-head of Genesis 3:15, is finally crushed in the Anointed and under the feet of his people.'),

    -- THREAD 4 (★★★): Yet I will rejoice in Yahuah — the keystone of faith (2:4 in song)
    ('canon','habakkuk',3,18,'canon','philippians',4,4,'free',
      E'*Rejoice in Yahuah (Lord) alway: and again I say, Rejoice* (Philippians 4:4). Habakkuk''s climax *Yet I will rejoice in Yahuah (LORD), I will joy in the Elohim (God) of my salvation* (Habakkuk 3:18) is the very heart of Paul''s charge — *Rejoice in Yahuah (Lord) alway*. The joy is rooted in Yahuah HIMSELF, not in fig tree or vine or fold; when all fails, the just still rejoice in the Elohim of their salvation.'),
    ('canon','habakkuk',3,17,'canon','romans',5,3,'free',
      E'*And not only so, but we glory in tribulations also: knowing that tribulation worketh patience* (Romans 5:3). Habakkuk''s *Although the fig tree shall not blossom... the fields shall yield no meat... the flock shall be cut off* (Habakkuk 3:17) — and yet rejoicing — is Paul''s *we glory in tribulations also*. The stripped life that still rejoices in Yahuah (LORD) is the faith that knows *tribulation worketh patience*.'),
    ('canon','habakkuk',3,18,'canon','james',1,2,'free',
      E'*My brethren, count it all joy when ye fall into divers temptations* (James 1:2). Habakkuk''s *Yet I will rejoice in Yahuah (LORD)* in the midst of total loss (Habakkuk 3:18) is James''s *count it all joy when ye fall into divers temptations* — *Knowing this, that the trying of your faith worketh patience* (James 1:3). The choice to rejoice when everything fails is the living faith of 2:4, *the just shall live by his faith*, put into song.'),
    ('canon','habakkuk',3,18,'canon','2-corinthians',6,10,'free',
      E'*As sorrowful, yet alway rejoicing; as poor, yet making many rich; as having nothing, and yet possessing all things* (2 Corinthians 6:10). Habakkuk''s paradox — the fields barren, the stalls empty, *Yet I will rejoice in Yahuah (LORD)* (Habakkuk 3:17-18) — is Paul''s *as sorrowful, yet alway rejoicing; as having nothing, and yet possessing all things*. The one who has Yahuah as his portion possesses all, though the harvest fails.'),
    ('canon','habakkuk',3,17,'apocrypha','ecclesiasticus',2,5,'extras',
      E'*For gold is tried in the fire, and acceptable men in the furnace of adversity* (Ecclesiasticus 2:5). Habakkuk''s stripped season — *the labour of the olive shall fail, and the fields shall yield no meat* (Habakkuk 3:17) — is the furnace the wise son is told to expect: *gold is tried in the fire, and acceptable men in the furnace of adversity*. The barren year is the testing in which faith is proved acceptable.'),
    ('canon','habakkuk',3,18,'apocrypha','ecclesiasticus',2,6,'extras',
      E'*Believe in him, and he will help you; order your way aright, and trust in him* (Ecclesiasticus 2:6). Habakkuk''s *I will joy in the Elohim (God) of my salvation* (Habakkuk 3:18) is the furnace-trust the restored wisdom teaches — *Believe in him, and he will help you... trust in him*. The rejoicing rests on Yahuah himself, the Elohim who helps and saves, not on the circumstances that have failed.'),
    ('canon','habakkuk',3,18,'canon','psalms',46,1,'free',
      E'*Elohim (God) is our refuge and strength, a very present help in trouble* (Psalm 46:1). Habakkuk''s *Yahuah Elohim (The LORD God) is my strength* (Habakkuk 3:19) and his joy *in the Elohim (God) of my salvation* (3:18) is the confidence of Psalm 46 — *Elohim (God) is our refuge and strength, a very present help in trouble*. The strength is in Yahuah, the present help when all else fails.'),
    ('canon','habakkuk',3,17,'canon','psalms',46,2,'free',
      E'*Therefore will not we fear, though the earth be removed, and though the mountains be carried into the midst of the sea* (Psalm 46:2). Habakkuk''s *though the fig tree shall not blossom... and there shall be no herd in the stalls* (Habakkuk 3:17) is the same unshaken faith as Psalm 46 — *we will not fear, though the earth be removed*. When the whole creation seems to give way, the trust in Yahuah (LORD) does not.'),
    ('canon','habakkuk',3,19,'canon','psalms',18,33,'free',
      E'*He maketh my feet like hinds'' feet, and setteth me upon my high places* (Psalm 18:33). Habakkuk''s close *he will make my feet like hinds'' feet, and he will make me to walk upon mine high places* (Habakkuk 3:19) is David''s own word — *He maketh my feet like hinds'' feet, and setteth me upon my high places*. Yahuah (LORD) makes the rejoicing one sure-footed, lifting him above the ruin to walk on the heights.'),
    ('canon','habakkuk',3,18,'canon','habakkuk',2,4,'free',
      E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith* (Habakkuk 2:4). The keystone the whole book turns on, *the just shall live by his faith*, is here put into song: *Yet I will rejoice in Yahuah (LORD), I will joy in the Elohim (God) of my salvation* (Habakkuk 3:18). Living by faith is not mere assent — it is the choice to rejoice in Yahuah when every visible support has failed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s335_hab03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s335_hab03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-3-revive-thy-work-in-wrath-remember-mercy',
       E'Revive thy work — in wrath remember mercy',
       E'The prayer opens in trembling: *O Yahuah (LORD), I have heard thy speech, and was afraid: O Yahuah (LORD), revive thy work in the midst of the years, in the midst of the years make known; in wrath remember mercy* (Habakkuk 3:2). The prophet has heard the verdict and is afraid — yet his plea is not for the wrath to pass but for Yahuah''s own work to be revived within it, and for mercy to be remembered in the very judgment. This is the prayer the Psalms sing: *Wilt thou not revive us again: that thy people may rejoice in thee?* (Psalm 85:6) — the reviving sought so the covenant people may rejoice; *Return, O Yahuah (LORD), how long? and let it repent thee concerning thy servants. O satisfy us early with thy mercy; that we may rejoice and be glad all our days* (Psalm 90:13-14) — Moses'' own appeal that anger turn to compassion. And it is Isaiah''s cry for the saving arm to stir again: *Awake, awake, put on strength, O arm of Yahuah (LORD); awake, as in the ancient days, in the generations of old* (Isaiah 51:9). Mercy is sought INSIDE the wrath, not instead of it — the covenant heart pleading for life to be poured back into Yahuah''s work, and that very mercy issues in the rejoicing the chapter ends upon (3:18).',
       sv.verse_id, ev.verse_id, 'free', 45580
  FROM _s335_hab03_lookup sv, _s335_hab03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens',
       E'Eloah came from Teman — his glory covered the heavens (the theophany)',
       E'The vision breaks open into the Sinai-theophany of the coming Yahuah: *Elohim (God) came from Teman, and the Holy One from mount Paran. Selah. His glory covered the heavens, and the earth was full of his praise. And his brightness was as the light; he had horns coming out of his hand: and there was the hiding of his power* (Habakkuk 3:3-4). This is the SAME southern approach Moses sang at his death: *Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them* (Deuteronomy 33:2) — and Deborah: *Yahuah (LORD), when thou wentest out of Seir... the earth trembled... The mountains melted from before Yahuah (LORD), even that Sinai* (Judges 5:4-5). The brightness as the light, the rays from his hand — this is the visible Glory, the Formed Son, the expressed Word drawn from the Formless Father; the One who appeared at Sinai and shines forth, who is Yahuah and HAS a Father (not co-equal trinitarian persons, not a modalist collapse). David sings the same descent: *Then the earth shook and trembled... There went up a smoke out of his nostrils, and fire out of his mouth devoured* (Psalm 18:7-8) — and Habakkuk: *Before him went the pestilence, and burning coals went forth at his feet* (3:5). Before him *He stood, and measured the earth: he beheld, and drove asunder the nations; and the everlasting mountains were scattered, the perpetual hills did bow: his ways are everlasting* (3:6) — the cosmic Judge of *Yahuah (LORD) cometh forth out of his place... the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire* (Micah 1:3-4); the One older than the hills, *from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2); the One Isaiah sees coming *from Edom... mighty to save* (Isaiah 63:1). The ancient mountains bow; only his ways are everlasting.',
       sv.verse_id, ev.verse_id, 'free', 45583
  FROM _s335_hab03_lookup sv, _s335_hab03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-3-salvation-with-thine-anointed-the-wounded-head',
       E'Salvation with thine anointed — thou woundedst the head of the wicked',
       E'The theophany has a purpose: deliverance. *Thou wentest forth for the salvation of thy people, even for salvation with thine anointed; thou woundedst the head out of the house of the wicked, by discovering the foundation unto the neck. Selah* (Habakkuk 3:13). Yahuah (LORD) marches out to SAVE — and he saves *with thine anointed* (et-meshichecha), the Messianic deliverer who has a Father, the Formed-Son deliverer through whom the saving stroke falls. And the stroke lands on the head: *thou woundedst the head out of the house of the wicked*. This is the first promise of Eden crushed home — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — the seed-war ending in the wounding of the serpent''s head. It is the Melek-Tsadiq King of the Psalms: *He shall judge among the heathen, he shall fill the places with the dead bodies; he shall wound the heads over many countries* (Psalm 110:6). And Paul seals it forward to the people of the Anointed: *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen* (Romans 16:20). The head wounded in Habakkuk''s theophany, the serpent-head of Genesis 3:15, is the same head finally crushed in the Anointed and under the feet of his redeemed.',
       sv.verse_id, ev.verse_id, 'free', 45586
  FROM _s335_hab03_lookup sv, _s335_hab03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'habakkuk-3-yet-i-will-rejoice-in-yahuah',
       E'Yet I will rejoice in Yahuah — the just live by faith, put into song',
       E'The book that opened in anguish — *how long shall I cry, and thou wilt not hear?* (1:2) — closes in a song no circumstance can silence: *Although the fig tree shall not blossom, neither shall fruit be in the vines; the labour of the olive shall fail, and the fields shall yield no meat; the flock shall be cut off from the fold, and there shall be no herd in the stalls: Yet I will rejoice in Yahuah (LORD), I will joy in the Elohim (God) of my salvation* (Habakkuk 3:17-18). Every visible support is stripped — orchard, vine, field, fold, stall — and STILL the prophet rejoices, because the joy is rooted in Yahuah himself, not in the harvest. This is *the just shall live by his faith* (Habakkuk 2:4) embodied: faith is not mere assent but the choice to rejoice in Yahuah (LORD) when everything fails. The New Testament carries the very word forward: *Rejoice in Yahuah (Lord) alway: and again I say, Rejoice* (Philippians 4:4); *we glory in tribulations also: knowing that tribulation worketh patience* (Romans 5:3); *count it all joy when ye fall into divers temptations* (James 1:2); *As sorrowful, yet alway rejoicing; as poor, yet making many rich; as having nothing, and yet possessing all things* (2 Corinthians 6:10). The restored wisdom names the barren year for what it is — a furnace that proves the faithful: *For gold is tried in the fire, and acceptable men in the furnace of adversity... Believe in him, and he will help you... trust in him* (Ecclesiasticus 2:5-6). And the same unshaken trust sings in the Psalms: *Elohim (God) is our refuge and strength, a very present help in trouble. Therefore will not we fear, though the earth be removed* (Psalm 46:1-2). Then the close: *Yahuah Elohim (The LORD God) is my strength, and he will make my feet like hinds'' feet, and he will make me to walk upon mine high places* (Habakkuk 3:19) — David''s own word, *He maketh my feet like hinds'' feet, and setteth me upon my high places* (Psalm 18:33). Yahuah makes the rejoicing one sure-footed, lifting him above the ruin to walk on the heights — the just living by faith, joying in the Elohim of his salvation.',
       sv.verse_id, ev.verse_id, 'extras', 45589
  FROM _s335_hab03_lookup sv, _s335_hab03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='habakkuk' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Wilt thou not revive us again: that thy people may rejoice in thee?* (Psalm 85:6) — the same plea as *revive thy work in the midst of the years* (Habakkuk 3:2); reviving sought that the people may rejoice.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=85 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-revive-thy-work-in-wrath-remember-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Return, O Yahuah (LORD), how long? and let it repent thee concerning thy servants* (Psalm 90:13) — Moses'' prayer behind *in wrath remember mercy* (Habakkuk 3:2); anger turned to compassion.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-revive-thy-work-in-wrath-remember-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *O satisfy us early with thy mercy; that we may rejoice and be glad all our days* (Psalm 90:14) — the *mercy* of Habakkuk 3:2 issuing in the very rejoicing of 3:18.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-revive-thy-work-in-wrath-remember-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Awake, awake, put on strength, O arm of Yahuah (LORD)... as in the ancient days* (Isaiah 51:9) — *revive thy work* (Habakkuk 3:2) is the plea that the saving arm stir again now.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-revive-thy-work-in-wrath-remember-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah (LORD) came from Sinai... he shined forth from mount Paran... from his right hand went a fiery law* (Deuteronomy 33:2) — the SAME southern theophany as *Elohim came from Teman... from mount Paran* (Habakkuk 3:3); the Formed Son the visible Glory.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (LORD), when thou wentest out of Seir... the earth trembled* (Judges 5:4) — Deborah sings the same march from the south as Habakkuk 3:3.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *The mountains melted from before Yahuah (LORD), even that Sinai* (Judges 5:5) — the *everlasting mountains were scattered* (Habakkuk 3:6) before the same Sinai-Glory.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Then the earth shook and trembled; the foundations also of the hills moved* (Psalm 18:7) — the same storm-theophany as Habakkuk''s brightness and rays (3:4); creation reels before the descending Glory.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *fire out of his mouth devoured: coals were kindled by it* (Psalm 18:8) — *burning coals went forth at his feet* (Habakkuk 3:5); the consuming fire of the coming One.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Yahuah (LORD) cometh forth out of his place... and tread upon the high places of the earth* (Micah 1:3) — the cosmic Judge of *He stood, and measured the earth* (Habakkuk 3:6).'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *the mountains shall be molten under him... as wax before the fire* (Micah 1:4) — the *perpetual hills did bow* (Habakkuk 3:6); the ancient mountains melt before him.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Before the mountains were brought forth... from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2) — the One older than the hills whose *ways are everlasting* (Habakkuk 3:6).'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *Who is this that cometh from Edom... mighty to save* (Isaiah 63:1) — the same coming One from the south (*from Teman... from mount Paran*, Habakkuk 3:3), mighty to save his people.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-eloah-came-from-teman-his-glory-covered-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — the first promise behind *thou woundedst the head out of the house of the wicked* (Habakkuk 3:13); the serpent-head crushed.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-salvation-with-thine-anointed-the-wounded-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *he shall wound the heads over many countries* (Psalm 110:6) — the Anointed of Habakkuk 3:13 is the Melek-Tsadiq King who wounds the head of the wicked.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-salvation-with-thine-anointed-the-wounded-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20) — the head wounded in Habakkuk 3:13, the serpent of Genesis 3:15, finally crushed in the Anointed.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-salvation-with-thine-anointed-the-wounded-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Rejoice in Yahuah (Lord) alway: and again I say, Rejoice* (Philippians 4:4) — the heart of *Yet I will rejoice in Yahuah* (Habakkuk 3:18); joy rooted in Yahuah himself, not circumstances.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *we glory in tribulations also: knowing that tribulation worketh patience* (Romans 5:3) — the stripped life of Habakkuk 3:17 that still rejoices.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *count it all joy when ye fall into divers temptations* (James 1:2) — the choice to rejoice in trial; the living faith of 2:4 (Habakkuk 3:18).'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *As sorrowful, yet alway rejoicing... as having nothing, and yet possessing all things* (2 Corinthians 6:10) — the paradox of Habakkuk 3:17-18: barren fields, yet rejoicing in Yahuah.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *gold is tried in the fire, and acceptable men in the furnace of adversity* (Ecclesiasticus 2:5) — the barren year of Habakkuk 3:17 is the furnace that proves faith acceptable.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Believe in him, and he will help you... trust in him* (Ecclesiasticus 2:6) — *I will joy in the Elohim (God) of my salvation* (Habakkuk 3:18); the furnace-trust that rests on Yahuah himself.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Elohim (God) is our refuge and strength, a very present help in trouble* (Psalm 46:1) — *Yahuah Elohim is my strength* (Habakkuk 3:19); strength in Yahuah when all else fails.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *we will not fear, though the earth be removed* (Psalm 46:2) — the same unshaken trust as *though the fig tree shall not blossom... Yet I will rejoice* (Habakkuk 3:17-18).'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *He maketh my feet like hinds'' feet, and setteth me upon my high places* (Psalm 18:33) — David''s own word behind *he will make my feet like hinds'' feet* (Habakkuk 3:19); sure-footed above the ruin.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★ *the just shall live by his faith* (Habakkuk 2:4) — the book''s keystone embodied: *Yet I will rejoice in Yahuah* (Habakkuk 3:18); living by faith is rejoicing when all support has failed.'
  FROM cross_reference_threads t
  JOIN _s335_hab03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='habakkuk' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s335_hab03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='habakkuk-3-yet-i-will-rejoice-in-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session335 — Habakkuk cross-references complete.'
