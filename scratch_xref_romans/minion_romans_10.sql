-- ----- fragment: minion_romans_10.sql (S219 Romans 10) -----
-- =====================================================================
-- S219 minion — ROMANS 10 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 10.  Tag: r10 (temp view _s219_r10_lookup).  Sort band: 6225-6249, step 3.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #2/#4/#5/#6/#7/#10/#11): Paul, a Torah-keeping Yashar'elite, pours
-- out his heart for Yashar'el — *that they might be saved* (10:1). Their failure is not the Torah
-- but a zeal *not according to knowledge* (10:2): *going about to establish their own righteousness*
-- (10:3), a system of self-justification apart from the faithfulness of Messiah. The watchpoint
-- verse — *Messiah (Christ) is the end of the law for righteousness to every one that believeth*
-- (10:4) — is read with telos as GOAL / AIM / DESTINATION: Messiah is where the Torah was always
-- leading, its fulfillment and purpose, NEVER its termination. Paul proves it by quoting the law
-- itself: the word Moses gave about KEEPING the commandment (Deuteronomy 30:11-14) is *the word
-- of faith* (10:8) — the Torah brought near, not replaced. Confession and belief (10:9-13) are the
-- response of the covenant-faithful heart, not a magic formula; *whosoever shall call upon the
-- name of Yahuah (Lord) shall be saved* (10:13) is Joel 2:32, the NT-Lord rule rendering Yahuah
-- where the underlying Hebrew is YHWH. *No difference between the Yahudi (Jew) and the Greek*
-- (10:12) is the two houses, one Master over both. The chapter closes with Yashar'el still longed
-- for, not cast off: *all day long I have stretched forth my hands unto a disobedient and gainsaying
-- people* (10:21 / Isaiah 65:2).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   zeal not by knowledge / their own righteousness  Tanakh: Isaiah 28:16 (the foundation stone, he that believeth shall not make haste)  Extras: none warranted  NT: none added (stone carried by Isaiah target)
--   v.4     Messiah the end (goal) of the law                Tanakh: Psalm 19:7 (the law perfect, converting the soul — the goal it aims at); Leviticus 18:5 (which if a man do, he shall live in them)  Extras: none warranted  NT: none added (Torah-fulfilled carried at Rom 8 / 3:31 elsewhere)
--   v.5-8   the word brought near (Deuteronomy 30)           Tanakh: Deuteronomy 30:11, 30:12, 30:14; Leviticus 18:5  Extras: Baruch 3:29, 3:30, 3:37 (the ascend/descend-for-wisdom rhetoric; wisdom given to Jacob, then he shewed himself upon earth)  NT: none warranted
--   v.9-13  confess and believe / call upon the name         Tanakh: Joel 2:32 (whosoever shall call on the name shall be delivered); Isaiah 28:16 again (he that believeth shall not be ashamed, v.11)  Extras: none warranted  NT: none added
--   v.15-16 beautiful feet / who believed our report          Tanakh: Isaiah 52:7 (beautiful feet, good tidings); Isaiah 53:1 (who hath believed our report)  Extras: none warranted  NT: none warranted
--   v.18-21 heard? / jealousy / hands stretched forth         Tanakh: Psalm 19:4 (their sound went into all the earth); Deuteronomy 32:21 (provoke to jealousy by no-people); Isaiah 65:1 (found of them that sought me not), Isaiah 65:2 (stretched forth my hands unto a rebellious people)  Extras: none warranted  NT: none warranted
--   v.14, 17  faith cometh by hearing / how shall they hear   none warranted (the preaching-chain is internal to the argument; load-bearing roots carried at 10:15-16)
--
-- THREADS (slug -> target libraries):
--   6225 romans-10-going-about-to-establish-their-own-righteousness-the-foundation-stone   (Tanakh)
--   6228 romans-10-messiah-the-goal-of-the-law-for-righteousness                            (Tanakh)
--   6231 romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30       (Tanakh + Extras)
--   6234 romans-10-whosoever-shall-call-upon-the-name-shall-be-saved-joel                   (Tanakh)
--   6237 romans-10-how-beautiful-are-the-feet-who-hath-believed-our-report-isaiah           (Tanakh)
--   6240 romans-10-i-have-stretched-forth-my-hands-yashar-el-provoked-to-jealousy-not-cast-off  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s219_r10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-10-going-about-to-establish-their-own-righteousness-the-foundation-stone
  ('canon', 'romans', 10, 3, 'canon', 'isaiah', 28, 16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16). Paul mourns his people who, *being ignorant of Elohim''s (God''s) righteousness, and going about to establish their own righteousness, have not submitted themselves unto the righteousness of Elohim (God)* (Romans 10:3). The prophet had already laid the answer in Zion: a sure foundation, and *he that believeth shall not make haste* — shall not run about establishing his own. To build one''s own righteousness is to refuse the stone Yahuah himself laid; to rest on it is the submission Yashar''el lacked. The righteousness of Elohim is received at the foundation he set, not manufactured beside it.'),
  ('canon', 'romans', 10, 2, 'canon', 'isaiah', 28, 12, 'free', E'*To whom he said, This is the rest wherewith ye may cause the weary to rest; and this is the refreshing: yet they would not hear.* (Isaiah 28:12). Paul bears his people record *that they have a zeal of Elohim (God), but not according to knowledge* (Romans 10:2). The prophet named the same wound centuries before: the rest and the refreshing were set before them, *yet they would not hear.* The zeal is real; the hearing is what fails. Yashar''el''s tragedy is not that she has no fervor for Elohim but that the fervor runs ahead of the knowledge the prophets pressed on her, the rest she would not enter.'),
  -- thread: romans-10-messiah-the-goal-of-the-law-for-righteousness
  ('canon', 'romans', 10, 4, 'canon', 'psalms', 19, 7, 'free', E'*The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalm 19:7). *For Messiah (Christ) is the end of the law for righteousness to every one that believeth* (Romans 10:4) — the end as the aim and destination the law was always pressing toward. The psalmist sang that *the law of Yahuah is perfect, converting the soul*: a perfect instruction does not abolish at its goal but arrives at it. The Torah converts the soul toward the very righteousness Messiah is and gives; he is where its every precept was pointing, the completion the perfect law was made to reach, not the cancellation of it.'),
  ('canon', 'romans', 10, 4, 'canon', 'leviticus', 18, 5, 'free', E'*Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* (Leviticus 18:5). Paul sets Messiah as *the end of the law for righteousness to every one that believeth* (Romans 10:4) and then, in the next breath, quotes this very verse: *the man which doeth those things shall live by them* (Romans 10:5). The law''s own promise was life through the doing; Messiah is the destination that life always aimed at, the one in whom the doing and the living are joined and fulfilled. The end of the law is not the silencing of *live in them* but its arrival in the One who is the life the statutes promised.'),
  -- thread: romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30
  ('canon', 'romans', 10, 6, 'canon', 'deuteronomy', 30, 12, 'free', E'*It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* (Deuteronomy 30:12). *But the righteousness which is of faith speaketh on this wise, Say not in thine heart, Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above:)* (Romans 10:6). Paul takes Moses'' own words about the commandment and reads them of Messiah. Moses said the commandment is not so far off that one must climb to heaven to fetch it; Paul says you need not ascend to fetch Messiah down, for the word is already here. The word of faith is the Torah brought near — the same nearness Moses preached, now embodied in the One the commandment was leading to.'),
  ('canon', 'romans', 10, 7, 'canon', 'deuteronomy', 30, 13, 'free', E'*Neither is it beyond the sea, that thou shouldest say, Who shall go over the sea for us, and bring it unto us, that we may hear it, and do it?* (Deuteronomy 30:13). *Or, Who shall descend into the deep? (that is, to bring up Messiah (Christ) again from the dead.)* (Romans 10:7). Moses said no man need cross the sea to bring the commandment near; Paul says no man need descend into the deep to raise Messiah, for he is risen and the word is here. The structure is Moses'' structure exactly — not heaven, not the sea, not the deep — because Paul is preaching the very nearness of the word that Deuteronomy preached, the Torah''s own testimony that what Elohim asks is not unreachable but at hand.'),
  ('canon', 'romans', 10, 8, 'canon', 'deuteronomy', 30, 14, 'free', E'*But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14). *But what saith it? The word is nigh thee, even in thy mouth, and in thy heart: that is, the word of faith, which we preach;* (Romans 10:8). Paul quotes Moses almost word for word. The clause Moses ends with — *that thou mayest do it* — is the whole point: the nearness is given so the word may be done, in the mouth and in the heart and then in the hand. *The word of faith* is not a different word that replaces the commandment; it is the same word brought near, the Torah in the mouth and the heart, that the faithful may walk in it.'),
  ('canon', 'romans', 10, 8, 'canon', 'deuteronomy', 30, 11, 'free', E'*For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* (Deuteronomy 30:11). When Paul says *the word is nigh thee, even in thy mouth, and in thy heart* (Romans 10:8), he is preaching Moses'' own opening claim: *this commandment … is not hidden from thee, neither is it far off.* The thing Moses calls *this commandment* is the thing Paul calls *the word of faith* — not two opposed words but one. The righteousness of faith does not abolish the commandment that is near; it announces that the nearness Moses promised has come, the word at hand to be believed and done.'),
  ('canon', 'romans', 10, 5, 'canon', 'leviticus', 18, 5, 'free', E'*Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* (Leviticus 18:5). *For Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them* (Romans 10:5). Paul cites the law''s own word — *which if a man do, he shall live in them* — not to set it against faith but to show that the doing and the living were always joined. The righteousness of faith that follows (Romans 10:6-8) is the same Deuteronomy promise of the word brought near *that thou mayest do it;* Moses'' two passages stand together, the doing-and-living of the statutes leading to the word of faith near at hand.'),
  ('canon', 'romans', 10, 6, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 29, 'extras', E'*Who has gone up into heaven, and taken her, and brought her down from the clouds?* (Baruch 3:29). *Say not in thine heart, Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above:)* (Romans 10:6). The wisdom-writer asked the very question Paul echoes — who shall go up to heaven to fetch what Elohim has near? — reading the same Deuteronomy logic generations before Rome. In Baruch the thing sought in heaven is wisdom; Paul names the One who is that wisdom in flesh. The library and the apostle stand on one Mosaic ground: what is sought as if it were far off has been brought near.'),
  ('canon', 'romans', 10, 7, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 30, 'extras', E'*Who has gone over the sea, and found her, and will bring her for pure gold?* (Baruch 3:30). *Or, Who shall descend into the deep? (that is, to bring up Messiah (Christ) again from the dead.)* (Romans 10:7). Baruch pairs the heaven-question with the sea-question, exactly as Deuteronomy paired them and exactly as Paul reaches for the deep. The point in Baruch is that no man crosses the sea to win wisdom by his own going; *he that knoweth all things knoweth her* and gives her. So Paul: no man descends to raise Messiah by his own striving; he is risen and given, the word brought near.'),
  ('canon', 'romans', 10, 8, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 37, 'extras', E'*Afterward did he shew himself upon earth, and conversed with men.* (Baruch 3:37). After Baruch declares that wisdom was *given … to Jacob his servant, and to Yashar''el (Israel) his beloved* (Baruch 3:36), it says *he shew himself upon earth, and conversed with men.* This is the very motion Paul preaches when he says *the word is nigh thee … that is, the word of faith, which we preach* (Romans 10:8): the wisdom of Elohim, near to Jacob in the commandment, came down and walked among men — the Formed who took on flesh, the word brought all the way near, no longer to be fetched from heaven or the deep.'),
  -- thread: romans-10-whosoever-shall-call-upon-the-name-shall-be-saved-joel
  ('canon', 'romans', 10, 13, 'canon', 'joel', 2, 32, 'free', E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* (Joel 2:32). *For whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13). Paul quotes Joel, and the name called upon is the name Joel named — Yahuah. The deliverance is *in mount Zion and in Jerusalem,* and *in the remnant whom Yahuah shall call:* the calling is two-directional, the people calling on his name and Yahuah calling out his remnant. This is no magic formula but the cry of the covenant-faithful heart, met by the One who summons his own home.'),
  ('canon', 'romans', 10, 12, 'canon', 'joel', 2, 32, 'free', E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* (Joel 2:32). *For there is no difference between the Yahudi (Jew) and the Greek: for the same Yahuah (Lord) over all is rich unto all that call upon him* (Romans 10:12). Joel''s *whosoever* is the ground of Paul''s *no difference:* the same Yahuah is over all, the one Master of both houses, *rich unto all that call.* The Yahudi and the Greek are not two peoples saved two ways but the house of Yahudah and the scattered seed of the north calling on one name, gathered to one Lord over both.'),
  ('canon', 'romans', 10, 11, 'canon', 'isaiah', 28, 16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16). *For the scripture saith, Whosoever believeth on him shall not be ashamed* (Romans 10:11). Paul cites the prophet''s stone again: the one who believes on the sure foundation Yahuah laid in Zion *shall not make haste,* shall not be put to shame. The believing of the heart unto righteousness (Romans 10:10) rests on the tried stone; the *whosoever* of this verse opens straight into the *whosoever* who calls on the name and is saved (Romans 10:13).'),
  -- thread: romans-10-how-beautiful-are-the-feet-who-hath-believed-our-report-isaiah
  ('canon', 'romans', 10, 15, 'canon', 'isaiah', 52, 7, 'free', E'*How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). *And how shall they preach, except they be sent? as it is written, How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15). Paul quotes Isaiah''s herald: the beautiful feet are the feet of the sent one who publishes peace and salvation and cries to Zion *Thy Elohim reigneth.* The gospel of peace Paul''s preachers carry is the very good tidings the prophet saw running over the mountains — the announcement to Zion that her Elohim reigns, the King come to gather and to save.'),
  ('canon', 'romans', 10, 16, 'canon', 'isaiah', 53, 1, 'free', E'*Who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?* (Isaiah 53:1). *But they have not all obeyed the gospel. For Esaias saith, Yahuah (Lord), who hath believed our report?* (Romans 10:16). Paul answers the herald''s beautiful feet with the herald''s grief: the same prophet who saw the good tidings published also cried *who hath believed our report?* The good tidings of Isaiah 52 and the rejected report of Isaiah 53 are one passage — the herald announces, and the suffering Servant is despised and not esteemed (Isaiah 53:3). That not all obeyed is no surprise to the prophet; he wept the unbelief in the same breath he sang the salvation.'),
  -- thread: romans-10-i-have-stretched-forth-my-hands-yashar-el-provoked-to-jealousy-not-cast-off
  ('canon', 'romans', 10, 18, 'canon', 'psalms', 19, 4, 'free', E'*Their line is gone out through all the earth, and their words to the end of the world. In them hath he set a tabernacle for the sun,* (Psalm 19:4). *But I say, Have they not heard? Yes verily, their sound went into all the earth, and their words unto the ends of the world* (Romans 10:18). Paul borrows the psalmist''s words for the witness gone out: as the heavens'' *line is gone out through all the earth,* so the sound of the preaching has reached the ends of the world. The question is never whether the witness was given — like the silent testimony of the heavens, it has gone everywhere — but whether Yashar''el would hear what was placed before her.'),
  ('canon', 'romans', 10, 19, 'canon', 'deuteronomy', 32, 21, 'free', E'*They have moved me to jealousy with that which is not Elohim (God); they have provoked me to anger with their vanities: and I will move them to jealousy with those which are not a people; I will provoke them to anger with a foolish nation.* (Deuteronomy 32:21). *But I say, Did not Yashar''el (Israel) know? First Moses saith, I will provoke you to jealousy by them that are no people, and by a foolish nation I will anger you* (Romans 10:19). Paul quotes Moses'' song. The *no people* and *foolish nation* who provoke Yashar''el to jealousy are not strangers admitted in her place but the scattered seed of the north — the house made Lo-Ammi, *not a people,* now stirring the jealousy of Yahudah as they turn back to the covenant. The provoking is the homecoming of the divorced house, meant to wake her own.'),
  ('canon', 'romans', 10, 20, 'canon', 'isaiah', 65, 1, 'free', E'*I am sought of them that asked not for me; I am found of them that sought me not: I said, Behold me, behold me, unto a nation that was not called by my name.* (Isaiah 65:1). *But Esaias is very bold, and saith, I was found of them that sought me not; I was made manifest unto them that asked not after me* (Romans 10:20). Paul quotes Isaiah. The ones who *sought me not* and were yet found are the scattered who had lost the covenant identity, *a nation that was not called by my name* — the house of the north grown wild among the nations, now found by the One they had forgotten. Not outsiders newly admitted, but the lost sheep sought out and made manifest, the divorced seed gathered.'),
  ('canon', 'romans', 10, 21, 'canon', 'isaiah', 65, 2, 'free', E'*I have spread out my hands all the day unto a rebellious people, which walketh in a way that was not good, after their own thoughts;* (Isaiah 65:2). *But to Yashar''el (Israel) he saith, All day long I have stretched forth my hands unto a disobedient and gainsaying people* (Romans 10:21). Paul lets the prophet have the last word, and it is a word of longing, not rejection: *all day long I have stretched forth my hands.* The hands are still spread out, all the day, unto Yashar''el — disobedient and gainsaying, yes, but never cast off. The posture of Elohim toward his people at the close of the chapter is the open arms of a Father who has not stopped reaching, which is why chapter eleven opens *Hath Elohim cast away his people? God forbid.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-10-going-about-to-establish-their-own-righteousness-the-foundation-stone',
       E'Going about to establish their own righteousness — the foundation stone',
       E'Paul''s heart''s desire and prayer for Yashar''el is *that they might be saved* (Romans 10:1), for he bears them record *that they have a zeal of Elohim (God), but not according to knowledge* (Romans 10:2). The wound is not the Torah but a fervor that runs ahead of hearing — exactly the wound the prophet named: *this is the rest wherewith ye may cause the weary to rest; and this is the refreshing: yet they would not hear* (Isaiah 28:12). And the failure has a precise shape: *being ignorant of Elohim''s (God''s) righteousness, and going about to establish their own righteousness, have not submitted themselves unto the righteousness of Elohim (God)* (Romans 10:3). To build one''s own righteousness is to refuse the stone Yahuah already laid in Zion. The prophet set the answer down long before: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The one who rests on the foundation Yahuah set does not run about establishing his own — does not make haste, is not put to shame. The righteousness of Elohim is received at the stone he laid, never manufactured beside it.',
       sv.verse_id, ev.verse_id, 'free', 6225
  FROM _s219_r10_lookup sv, _s219_r10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-10-messiah-the-goal-of-the-law-for-righteousness',
       E'Messiah the goal of the law for righteousness',
       E'*For Messiah (Christ) is the end of the law for righteousness to every one that believeth* (Romans 10:4). Read the end as the aim, the goal, the destination the law was always pressing toward — for the very next verses prove Paul means arrival, not abolition. The psalmist sang the law''s own perfection: *the law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7). A perfect instruction does not cancel at its goal; it converts the soul toward the righteousness it was made to reach. And Paul immediately quotes the law''s own promise of life: *the man which doeth those things shall live by them* (Romans 10:5), the very word of *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5). The doing and the living were always joined; Messiah is where that life arrives, the One in whom the statutes'' promise is fulfilled. He is not the silencing of *live in them* but its destination — the goal toward which every precept of the perfect law was leading, the righteousness the Torah pointed to from the first.',
       sv.verse_id, ev.verse_id, 'free', 6228
  FROM _s219_r10_lookup sv, _s219_r10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=10 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30',
       E'The word is nigh thee, in thy mouth and in thy heart — Deuteronomy 30',
       E'When Paul describes the righteousness of faith, he does not reach for a new word — he quotes Moses, the very passage Moses gave about keeping the commandment. *Say not in thine heart, Who shall ascend into heaven? … Or, Who shall descend into the deep?* (Romans 10:6-7), *but the word is nigh thee, even in thy mouth, and in thy heart: that is, the word of faith, which we preach* (Romans 10:8). The structure is Deuteronomy''s exactly: *this commandment which I command thee this day, it is not hidden from thee, neither is it far off* (Deuteronomy 30:11); *it is not in heaven, that thou shouldest say, Who shall go up for us to heaven … ?* (Deuteronomy 30:12); *neither is it beyond the sea …* (Deuteronomy 30:13); *but the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). Moses ends with *that thou mayest do it* — the nearness is given for the doing. Paul calls that same near word *the word of faith;* it is not a different word replacing the commandment but the Torah brought near, in the mouth and the heart and then the hand. The Second-Temple library read Deuteronomy the same way: *Who has gone up into heaven, and taken her, and brought her down from the clouds? Who has gone over the sea …?* (Baruch 3:29-30) — the ascend-and-descend rhetoric pressed in search of wisdom, which *he hath given … to Jacob his servant, and to Yashar''el (Israel) his beloved* (Baruch 3:36), and then *afterward did he shew himself upon earth, and conversed with men* (Baruch 3:37). The wisdom near to Jacob in the commandment came down and walked among men — the Formed who took on flesh, the word brought all the way near, no longer to be fetched from heaven or the deep but believed and done.',
       sv.verse_id, ev.verse_id, 'extras', 6231
  FROM _s219_r10_lookup sv, _s219_r10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-10-whosoever-shall-call-upon-the-name-shall-be-saved-joel',
       E'Whosoever shall call upon the name shall be saved — Joel',
       E'The confession of the mouth and the belief of the heart (Romans 10:9-10) are not a magic formula but the response of the covenant-faithful, resting on the stone Yahuah laid: *the scripture saith, Whosoever believeth on him shall not be ashamed* (Romans 10:11) — the prophet''s sure foundation, *he that believeth shall not make haste* (Isaiah 28:16). And that *whosoever* opens onto the whole gathering: *for there is no difference between the Yahudi (Jew) and the Greek: for the same Yahuah (Lord) over all is rich unto all that call upon him* (Romans 10:12), *for whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13). Paul is quoting the prophet word for word: *whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). The name called upon is Yahuah''s own. And the calling runs both ways — the people calling on his name, and Yahuah calling out his remnant. The *no difference* between the Yahudi and the Greek is not two peoples saved two ways but the house of Yahudah and the scattered seed of the north, both calling on one name, both gathered to the one Master over all.',
       sv.verse_id, ev.verse_id, 'free', 6234
  FROM _s219_r10_lookup sv, _s219_r10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-10-how-beautiful-are-the-feet-who-hath-believed-our-report-isaiah',
       E'How beautiful are the feet — who hath believed our report — Isaiah',
       E'The gathering needs a herald, and Paul reaches for the prophet who saw him: *how shall they preach, except they be sent? as it is written, How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15). The herald is Isaiah''s: *how beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace … that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). The gospel of peace carried by the sent ones is the very good tidings the prophet saw running over the mountains — the announcement to Zion that her Elohim reigns, the King come to gather and to save. But Paul knows the herald''s grief belongs to the same prophet: *they have not all obeyed the gospel. For Esaias saith, Yahuah (Lord), who hath believed our report?* (Romans 10:16) — *who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?* (Isaiah 53:1). The good tidings published in Isaiah 52 and the report unbelieved in Isaiah 53 are one passage, and the One announced is the Servant *despised and rejected of men* (Isaiah 53:3). That not all obeyed was no surprise to the prophet; he wept the unbelief in the same breath he sang the salvation.',
       sv.verse_id, ev.verse_id, 'free', 6237
  FROM _s219_r10_lookup sv, _s219_r10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=10 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-10-i-have-stretched-forth-my-hands-yashar-el-provoked-to-jealousy-not-cast-off',
       E'I have stretched forth my hands — Yashar''el provoked to jealousy, not cast off',
       E'Paul closes the chapter not with rejection but with longing, and he builds it on a chain of Tanakh. *Have they not heard? Yes verily, their sound went into all the earth, and their words unto the ends of the world* (Romans 10:18) — the psalmist''s witness gone out, *their line is gone out through all the earth, and their words to the end of the world* (Psalm 19:4). The witness was given everywhere; the question is whether Yashar''el would hear it. *Did not Yashar''el (Israel) know? First Moses saith, I will provoke you to jealousy by them that are no people, and by a foolish nation I will anger you* (Romans 10:19), quoting *I will move them to jealousy with those which are not a people; I will provoke them to anger with a foolish nation* (Deuteronomy 32:21). The *no people* are not strangers admitted in her place but the scattered seed of the north — the house made Lo-Ammi, *not a people,* turning back to the covenant and stirring Yahudah''s jealousy; the provoking is the homecoming of the divorced house, meant to wake her own. *Esaias is very bold … I was found of them that sought me not* (Romans 10:20) — *I am found of them that sought me not … unto a nation that was not called by my name* (Isaiah 65:1), the lost sheep grown wild who forgot the covenant identity, now sought out and found. And the last word is open arms: *all day long I have stretched forth my hands unto a disobedient and gainsaying people* (Romans 10:21), Isaiah''s *I have spread out my hands all the day unto a rebellious people* (Isaiah 65:2). The hands are still spread out, all the day, unto Yashar''el — never cast off — which is why the next chapter opens *Hath Elohim cast away his people? God forbid.*',
       sv.verse_id, ev.verse_id, 'free', 6240
  FROM _s219_r10_lookup sv, _s219_r10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=10 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-10-going-about-to-establish-their-own-righteousness-the-foundation-stone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:12 — *this is the rest wherewith ye may cause the weary to rest … yet they would not hear* the zeal that runs ahead of hearing, the rest Yashar''el would not enter (Romans 10:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-going-about-to-establish-their-own-righteousness-the-foundation-stone'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 28:16 — *I lay in Zion for a foundation a stone … he that believeth shall not make haste* the stone Yahuah laid; resting on it is the submission Yashar''el lacked (Romans 10:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-going-about-to-establish-their-own-righteousness-the-foundation-stone'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-10-messiah-the-goal-of-the-law-for-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *the law of Yahuah (LORD) is perfect, converting the soul* a perfect instruction arrives at its goal, it does not abolish; Messiah is the righteousness it converts the soul toward (Romans 10:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-messiah-the-goal-of-the-law-for-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 18:5 — *which if a man do, he shall live in them* the law''s own promise of life through the doing; Messiah is the destination that life always aimed at (Romans 10:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-messiah-the-goal-of-the-law-for-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:5 — *which if a man do, he shall live in them* the righteousness of the law Moses described, the doing and the living joined (Romans 10:5).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:12 — *Who shall go up for us to heaven … ?* Moses'' own heaven-question; Paul reads it of Messiah brought down (Romans 10:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 3:29 — *Who has gone up into heaven, and taken her, and brought her down from the clouds?* the library reading the same Deuteronomy logic, the heaven-question pressed for wisdom (Romans 10:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 30:13 — *Neither is it beyond the sea … ?* Moses'' own sea-question; Paul reads it of Messiah raised from the deep (Romans 10:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Baruch 3:30 — *Who has gone over the sea, and found her … ?* the sea-question paired with the heaven-question, exactly as Deuteronomy and Paul pair them (Romans 10:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 30:11 — *this commandment … is not hidden from thee, neither is it far off* Moses'' opening claim; *this commandment* is what Paul calls *the word of faith* (Romans 10:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Deuteronomy 30:14 — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* the clause Paul quotes; the nearness given so the word may be done (Romans 10:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Baruch 3:37 — *afterward did he shew himself upon earth, and conversed with men* wisdom given to Jacob came down and walked among men — the Formed in flesh, the word brought all the way near (Romans 10:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-the-word-is-nigh-thee-in-thy-mouth-and-in-thy-heart-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-10-whosoever-shall-call-upon-the-name-shall-be-saved-joel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:16 — *he that believeth shall not make haste* the believing of the heart rests on the tried stone; *whosoever believeth on him shall not be ashamed* (Romans 10:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-whosoever-shall-call-upon-the-name-shall-be-saved-joel'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:32 — *whosoever shall call on the name of Yahuah (LORD) shall be delivered* the ground of Paul''s *no difference:* one Yahuah over both houses, rich unto all that call (Romans 10:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-whosoever-shall-call-upon-the-name-shall-be-saved-joel'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:32 — *whosoever shall call on the name of Yahuah (LORD) shall be delivered … and in the remnant whom Yahuah (LORD) shall call* quoted word for word; the people call, and Yahuah calls out his remnant (Romans 10:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-whosoever-shall-call-upon-the-name-shall-be-saved-joel'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-10-how-beautiful-are-the-feet-who-hath-believed-our-report-isaiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 52:7 — *how beautiful upon the mountains are the feet of him that bringeth good tidings … that saith unto Zion, Thy Elohim (God) reigneth!* the herald Paul quotes, the gospel of peace announcing the King come to gather (Romans 10:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-how-beautiful-are-the-feet-who-hath-believed-our-report-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:1 — *Who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?* the herald''s grief in the same prophet; the Servant despised, the report unbelieved (Romans 10:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-how-beautiful-are-the-feet-who-hath-believed-our-report-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-10-i-have-stretched-forth-my-hands-yashar-el-provoked-to-jealousy-not-cast-off
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:4 — *their line is gone out through all the earth, and their words to the end of the world* the witness gone out everywhere; the question is whether Yashar''el would hear (Romans 10:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-i-have-stretched-forth-my-hands-yashar-el-provoked-to-jealousy-not-cast-off'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:21 — *I will move them to jealousy with those which are not a people* the no-people are the scattered house made Lo-Ammi, turning home to wake Yahudah''s jealousy (Romans 10:19).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-i-have-stretched-forth-my-hands-yashar-el-provoked-to-jealousy-not-cast-off'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 65:1 — *I am found of them that sought me not … a nation that was not called by my name* the lost sheep grown wild, who forgot the covenant identity, now sought out and found (Romans 10:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-i-have-stretched-forth-my-hands-yashar-el-provoked-to-jealousy-not-cast-off'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 65:2 — *I have spread out my hands all the day unto a rebellious people* the open arms of the Father, still reaching, never cast off — why chapter eleven opens *Hath Elohim cast away his people? God forbid* (Romans 10:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r10_lookup sv, _s219_r10_lookup tv
 WHERE t.slug='romans-10-i-have-stretched-forth-my-hands-yashar-el-provoked-to-jealousy-not-cast-off'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
