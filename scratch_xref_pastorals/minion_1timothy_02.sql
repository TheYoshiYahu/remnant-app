-- ----- fragment: minion_1timothy_02.sql (S235 1 Timothy 2) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 2 (15 verses) — prayer for all men and for kings; the one
--   Elohim and the one Mediator; men and women in the assembly; the Adam-Eve order.
-- Tag: t235c2 (temp view _s235_t235c2_lookup).
-- Sort band: floor 8425 (25-wide); used 8425, 8426, 8427, 8428.
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul orders the assembly. First, prayer is to be made for ALL men, for
--   kings and all in authority (2:1-2) — the exile's charge to seek the peace of the city and
--   pray for the king. Elohim *will have all men to be saved* (2:4) — the Tanakh's own heart,
--   *I have no pleasure in the death of the wicked.* ★★ The load-bearing center: *there is one
--   Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha
--   (Christ Jesus)* (2:5). This is the Shema's ONE Elohim (Deuteronomy 6:4) — the FATHER is the
--   one Elohim — and the one Mediator is the MAN, the Formed, who stands BETWEEN, as Moses stood
--   between (Deuteronomy 5:5) and as Job longed for a daysman (Job 9:33). The verse itself names
--   him *the man HaMashiach Yahusha* — keep the Father the one Elohim and the Son the Formed
--   Mediator; the verse DISTINGUISHES them; NOT co-equal persons. ★★ And 2:13-14: *Adam was
--   first formed, then Eve* — the creation ORDER of Genesis 2-3, the forming of the man first
--   and the woman drawn from him, the woman deceived in the transgression; framed as the order
--   of creation, NOT misogyny. No replacement theology, no law-vs-grace antithesis.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   prayer, supplication for all men; for kings and all in authority
--           Tanakh: Jeremiah 29:7 (seek the peace of the city... pray unto Yahuah for it),
--                   Ezra 6:10 (pray for the life of the king, and of his sons)
--           Extras: none warranted (no clean load-bearing witness; the Tanakh roots carry it)
--           NT: none warranted (carried in prose)
--   v.3-4   Elohim our Saviour, who will have all men to be saved
--           Tanakh: Ezekiel 18:23 (Have I any pleasure that the wicked should die?),
--                   Ezekiel 18:32 (I have no pleasure in the death of him that dieth),
--                   Ezekiel 33:11 (I have no pleasure in the death of the wicked... turn ye)
--           Extras: none warranted   NT: none warranted
--   v.5-6   one Elohim, one mediator, the man HaMashiach Yahusha [★★ BLESSING]
--           Tanakh: Deuteronomy 6:4 (Yahuah Eloheinu is one Yahuah), Deuteronomy 5:5 (I stood
--                   between Yahuah and you), Job 9:33 (neither is there any daysman betwixt us)
--           Extras: none warranted (verified Wisdom/Sirach; no clean load-bearing one-Mediator
--                   witness — the Shema + Moses + the daysman carry it)
--           NT: Galatians 3:19-20 (ordained by angels in the hand of a mediator... Elohim is one)
--   v.7     ordained a preacher and apostle, a teacher of the Gentiles
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.8     men pray every where, lifting up holy hands, without wrath
--           Tanakh: none warranted (lifting holy hands a single recurring posture, not a
--                   load-bearing thread for this chapter)   Extras: none warranted   NT: none
--   v.9-10  women adorn in modest apparel, with good works, not gold or pearls
--           Tanakh: none warranted (no single load-bearing parallel; would be a verbal echo)
--           Extras: none warranted   NT: none warranted
--   v.11-12 the woman learn in silence, in subjection
--           Tanakh: carried in the creation-order thread at v.13-14
--           Extras: none warranted   NT: carried in 1 Corinthians 11 at v.13
--   v.13-14 Adam first formed, then Eve; the woman deceived [★★ creation order, NOT misogyny]
--           Tanakh: Genesis 2:7 (Yahuah Elohim formed man of the dust), Genesis 2:21-22 (took
--                   one of his ribs... made he a woman), Genesis 3:6 (the woman... took of the
--                   fruit), Genesis 3:13 (the serpent beguiled me, and I did eat)
--           Extras: none warranted   NT: 1 Corinthians 11:8-9 (the woman of the man; the woman
--                   for the man)
--   v.15    she shall be saved in childbearing, if they continue in faith
--           Tanakh: none warranted (the childbearing promise here is too distinct to bind
--                   cleanly to Genesis 3:15/3:16 without forcing)   Extras: none   NT: none
--
-- THREADS (slug -> target libraries):
--   8425 1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6                    (Tanakh)
--   8426 1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33                      (Tanakh)
--   8427 1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9                  (Tanakh + NT)  [★★ BLESSING]
--   8428 1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3        (Tanakh + NT)  [★★]
-- =====================================================================

CREATE TEMP VIEW _s235_t235c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6
  ('canon', '1-timothy', 2, 1, 'canon', 'jeremiah', 29, 7, 'free', E'*And seek the peace of the city whither I have caused you to be carried away captives, and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace.* (Jeremiah 29:7). When Yahuah (LORD) sent his people into exile he charged them to pray for the very city that held them captive, *for in the peace thereof shall ye have peace.* Paul lays the same charge on the assembly: *I exhort therefore, that, first of all, supplications, prayers, intercessions, and giving of thanks, be made for all men* (1 Timothy 2:1). The intercession that begins the ordered assembly is the exile''s old commission — to seek the welfare of all, and to pray for the place where the gathered now sojourn, *that we may lead a quiet and peaceable life in all godliness and honesty* (1 Timothy 2:2).'),
  ('canon', '1-timothy', 2, 2, 'canon', 'ezra', 6, 10, 'free', E'*That they may offer sacrifices of sweet savours unto the Elohim (God) of heaven, and pray for the life of the king, and of his sons.* (Ezra 6:10). The decree of Cyrus and Darius bound the returning remnant to *pray for the life of the king,* the very ruler under whose authority they lived. Paul says the same prayer is to rise from the assembly: *For kings, and for all that are in authority; that we may lead a quiet and peaceable life in all godliness and honesty* (1 Timothy 2:2). Intercession for the king is not a new thing under the apostle but the standing practice of Yahuah (LORD)''s people in every age — prayer offered for those set over them, that the gathered may serve their Elohim (God) in peace.'),
  -- thread: 1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33
  ('canon', '1-timothy', 2, 4, 'canon', 'ezekiel', 18, 23, 'free', E'*Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* (Ezekiel 18:23). The heart of Elohim (God) revealed through Ezekiel takes no pleasure in the death of the wicked but longs for him to *return from his ways, and live.* This is the very heart Paul names of *Elohim (God) our Saviour; Who will have all men to be saved, and to come unto the knowledge of the truth* (1 Timothy 2:3-4). The Saviour who would have all men saved is the same Yahuah (LORD) who pleaded with the house of Yashar''el (Israel) to turn and live; the gospel''s wide mercy is the Tanakh''s own longing made plain.'),
  ('canon', '1-timothy', 2, 4, 'canon', 'ezekiel', 18, 32, 'free', E'*For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* (Ezekiel 18:32). Adonai Yahuah (the Lord GOD) declares plainly, *I have no pleasure in the death of him that dieth,* and calls, *turn yourselves, and live ye.* So Paul says Elohim (God) our Saviour *will have all men to be saved, and to come unto the knowledge of the truth* (1 Timothy 2:4). The Elohim (God) who desires that all be saved is no different in the apostle than in the prophet: he wills life, not death, and calls all to turn — which is why the assembly is to pray *for all men* (1 Timothy 2:1).'),
  ('canon', '1-timothy', 2, 4, 'canon', 'ezekiel', 33, 11, 'free', E'*Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 33:11). With an oath upon his own life Yahuah (LORD) swears, *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live.* This sworn mercy is the ground of Paul''s confidence that Elohim (God) our Saviour *will have all men to be saved* (1 Timothy 2:4). The God who pressed *turn ye, turn ye* upon the house of Yashar''el (Israel) is the God whose saving will now reaches *all men* through the one Mediator — the same heart, the same call to come *unto the knowledge of the truth.*'),
  -- thread: 1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9  [★★ BLESSING]
  ('canon', '1-timothy', 2, 5, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). The Shema confesses the one Elohim (God) of Yashar''el (Israel): *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* Paul speaks from that same confession: *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). Mark how the verse holds the two apart — the ONE Elohim (God) is the Father, the unseen source; and the one Mediator is *the man HaMashiach Yahusha (Christ Jesus),* the Formed who stands between Elohim (God) and men. The Shema is not broken but kept: there is one Elohim (God), and the Mediator is the man who brings men to him.'),
  ('canon', '1-timothy', 2, 5, 'canon', 'deuteronomy', 5, 5, 'free', E'*(I stood between Yahuah (LORD) and you at that time, to shew you the word of Yahuah (LORD): for ye were afraid by reason of the fire, and went not up into the mount;) saying,* (Deuteronomy 5:5). At Horeb Moses describes his office in one phrase: *I stood between Yahuah (LORD) and you... to shew you the word of Yahuah (LORD).* That is the mediator''s work — to stand between the one Elohim (God) and the people and bring the word across. Paul names the greater One who fills that office: *one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). As Moses stood between Yahuah (LORD) and Yashar''el (Israel), so the Formed Man stands between the one Elohim (God) and all men — not a co-equal of the Father but the appointed go-between, the man who shows men the Father and brings them near.'),
  ('canon', '1-timothy', 2, 5, 'canon', 'job', 9, 33, 'free', E'*Neither is there any daysman betwixt us, that might lay his hand upon us both.* (Job 9:33). Job, crushed before the Almighty, longs for what he cannot find — *any daysman betwixt us, that might lay his hand upon us both,* an umpire who could touch both the Holy One and the man and bring them together. Paul announces that the longed-for daysman has come: *one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus); Who gave himself a ransom for all* (1 Timothy 2:5-6). The Mediator must be able to lay his hand on both — and so he is *the man,* the Formed, who shares our flesh and is sent of the one Elohim (God); the daysman Job could not find is given to all men in the Man who ransomed them.'),
  ('canon', '1-timothy', 2, 5, 'canon', 'galatians', 3, 20, 'free', E'*Now a mediator is not a mediator of one, but Elohim (God) is one.* (Galatians 3:20). Paul reasons from the same truth twice. The law *was ordained by angels in the hand of a mediator* (Galatians 3:19), and *a mediator is not a mediator of one, but Elohim (God) is one* — a mediator by definition stands between two parties, and the one party is the one Elohim (God). It is the very logic of 1 Timothy: *there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). The Father is the one Elohim (God); the men are the other party; and *the man HaMashiach Yahusha (Christ Jesus)* is the one standing between — the Formed Mediator, distinguished from the one Elohim (God) he mediates toward, not collapsed into him.'),
  -- thread: 1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3  [★★]
  ('canon', '1-timothy', 2, 13, 'canon', 'genesis', 2, 7, 'free', E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7). The forming of the man came first: *Yahuah Elohim (the LORD God) formed man of the dust of the ground.* Paul grounds his order in this very act: *For Adam was first formed, then Eve* (1 Timothy 2:13). The word reaches back to the beginning — Adam was *formed* of the dust before the woman was made; the apostle reasons not from custom but from the order of creation, the way Yahuah Elohim (the LORD God) himself set things in Genesis.'),
  ('canon', '1-timothy', 2, 13, 'canon', 'genesis', 2, 22, 'free', E'*And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* (Genesis 2:22). The woman was made after the man and from the man: *the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman.* This is the *then Eve* of Paul''s words: *For Adam was first formed, then Eve* (1 Timothy 2:13). The order is the order of Genesis itself — the man formed of the dust, the woman built from his side and brought to him; Paul appeals to the creation account, not to any disdain for the woman whom Yahuah Elohim (the LORD God) himself fashioned and gave.'),
  ('canon', '1-timothy', 2, 14, 'canon', 'genesis', 3, 6, 'free', E'*And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6). In the garden *the woman... took of the fruit thereof, and did eat.* Paul recalls this moment: *And Adam was not deceived, but the woman being deceived was in the transgression* (1 Timothy 2:14). The point is the account as written — the serpent came to the woman, and the deception entered there. The apostle is not weighing the worth of the woman but reading the history of Genesis, where the deceiving and the transgression took their recorded course.'),
  ('canon', '1-timothy', 2, 14, 'canon', 'genesis', 3, 13, 'free', E'*And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* (Genesis 3:13). The woman''s own confession names the deception: *The serpent beguiled me, and I did eat.* This is exactly the word Paul uses: *the woman being deceived was in the transgression* (1 Timothy 2:14) — *beguiled,* *deceived,* the same garden event. Paul stands on the Genesis record of how sin entered, not on any judgment of the woman''s nature; the verse that follows holds out hope, that *she shall be saved in childbearing, if they continue in faith and charity and holiness with sobriety* (1 Timothy 2:15).'),
  ('canon', '1-timothy', 2, 13, 'canon', '1-corinthians', 11, 8, 'free', E'*For the man is not of the woman; but the woman of the man.* (1 Corinthians 11:8). Paul had already drawn the creation order in the same way to the Corinthians: *the man is not of the woman; but the woman of the man,* and *Neither was the man created for the woman; but the woman for the man* (1 Corinthians 11:8-9). It is the same appeal he makes to Timothy: *For Adam was first formed, then Eve* (1 Timothy 2:13). The order of forming — the man first, the woman drawn from and made for the man — is the consistent ground of the apostle''s teaching, rooted not in misogyny but in the way Yahuah Elohim (the LORD God) ordered the man and the woman in the beginning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6',
       E'Prayer and intercession for all men, for kings and all in authority (Jeremiah 29, Ezra 6)',
       E'Paul orders the assembly by setting prayer first: *I exhort therefore, that, first of all, supplications, prayers, intercessions, and giving of thanks, be made for all men; For kings, and for all that are in authority; that we may lead a quiet and peaceable life in all godliness and honesty* (1 Timothy 2:1-2). This is no innovation but the standing charge of Yahuah (LORD) to his people. When he carried Yashar''el (Israel) into exile he commanded, *seek the peace of the city whither I have caused you to be carried away captives, and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace* (Jeremiah 29:7). And the decree that restored the remnant bound them to *offer sacrifices of sweet savours unto the Elohim (God) of heaven, and pray for the life of the king, and of his sons* (Ezra 6:10). Intercession for the city and for the king is the old commission of the sojourning people, renewed in the assembly — that the gathered may live quietly under those set over them and serve their Elohim (God) in peace.',
       sv.verse_id, ev.verse_id, 'free', 8425
  FROM _s235_t235c2_lookup sv, _s235_t235c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33',
       E'Elohim (God) our Saviour, who will have all men to be saved (Ezekiel 18, 33)',
       E'Paul gives the ground of the assembly''s wide-armed prayer: *For this is good and acceptable in the sight of Elohim (God) our Saviour; Who will have all men to be saved, and to come unto the knowledge of the truth* (1 Timothy 2:3-4). The saving will of Elohim (God) is no new thing in the gospel; it is the very heart Yahuah (LORD) bared through Ezekiel. *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* (Ezekiel 18:23). *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye* (Ezekiel 18:32). And he swears it upon his own life: *As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 33:11). The Elohim (God) our Saviour who would have all men saved is the same Yahuah (LORD) who pressed *turn ye, turn ye* upon his people — one heart that wills life and not death, now reaching out to *all men* through the one Mediator, that they may *come unto the knowledge of the truth.*',
       sv.verse_id, ev.verse_id, 'free', 8426
  FROM _s235_t235c2_lookup sv, _s235_t235c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9',
       E'One Elohim (God), one mediator between Elohim (God) and men, the man (Deuteronomy 6, Deuteronomy 5, Job 9)',
       E'The load-bearing confession of the chapter: *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus); Who gave himself a ransom for all* (1 Timothy 2:5-6). Hold the two apart as the verse holds them. The ONE Elohim (God) is the Shema''s own: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) — the Father, the unseen source, the one Elohim (God) beside whom there is no other. And the one Mediator is *the man HaMashiach Yahusha (Christ Jesus),* the Formed who stands BETWEEN the one Elohim (God) and men. A mediator''s office is to stand between: as Moses said, *I stood between Yahuah (LORD) and you at that time, to shew you the word of Yahuah (LORD)* (Deuteronomy 5:5) — the go-between who carries the word across. It is the very office Job longed for and could not find: *Neither is there any daysman betwixt us, that might lay his hand upon us both* (Job 9:33), an umpire who could touch both the Holy One and the man. That daysman is now given — *the man,* who shares our flesh and is sent of the one Elohim (God), and *gave himself a ransom for all.* Paul reasons the same way to the Galatians: the law was *ordained by angels in the hand of a mediator. Now a mediator is not a mediator of one, but Elohim (God) is one* (Galatians 3:19-20) — a mediator by definition stands between two parties, and the one party is the one Elohim (God). So keep the grammar of the verse: the Father is the one Elohim (God); the Son is the man, the Formed Mediator, distinguished from the one Elohim (God) he mediates toward — not a co-equal person collapsed into the Father, but the appointed go-between who brings men near, the daysman who lays his hand on both.',
       sv.verse_id, ev.verse_id, 'free', 8427
  FROM _s235_t235c2_lookup sv, _s235_t235c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3',
       E'Adam was first formed, then Eve: the order of creation in Genesis 2-3 (1 Corinthians 11)',
       E'Paul grounds his charge to the assembly not in custom but in the account of the beginning: *For Adam was first formed, then Eve. And Adam was not deceived, but the woman being deceived was in the transgression* (1 Timothy 2:13-14). Both halves reach straight back to Genesis. The forming order: *Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7) — the man first; and then *the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* (Genesis 2:22) — the woman built from the man and brought to him. This is the *first formed, then Eve.* And the deception: in the garden *the woman... took of the fruit thereof, and did eat* (Genesis 3:6), and her own word names it, *The serpent beguiled me, and I did eat* (Genesis 3:13) — *beguiled,* *deceived,* the same event Paul recalls. The apostle reads the recorded history of Genesis, the same appeal he made to the Corinthians: *the man is not of the woman; but the woman of the man. Neither was the man created for the woman; but the woman for the man* (1 Corinthians 11:8-9). This is the order of creation as Yahuah Elohim (the LORD God) set it — the man formed first, the woman drawn from and made for the man — not a verdict on the worth of the woman whom Yahuah Elohim (the LORD God) himself fashioned and gave. And the word does not end in condemnation: *Notwithstanding she shall be saved in childbearing, if they continue in faith and charity and holiness with sobriety* (1 Timothy 2:15).',
       sv.verse_id, ev.verse_id, 'free', 8428
  FROM _s235_t235c2_lookup sv, _s235_t235c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 29:7 — *seek the peace of the city... and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace* the exile''s charge to pray for the city; *supplications, prayers, intercessions... be made for all men* (1 Timothy 2:1).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 6:10 — *pray for the life of the king, and of his sons* the remnant''s standing charge to pray for the ruler; *For kings, and for all that are in authority* (1 Timothy 2:2).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:23 — *Have I any pleasure at all that the wicked should die?... and not that he should return from his ways, and live?* the heart of Elohim (God) that wills life; *Who will have all men to be saved* (1 Timothy 2:4).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:32 — *I have no pleasure in the death of him that dieth... wherefore turn yourselves, and live ye* the same saving will; *Elohim (God) our Saviour; Who will have all men to be saved* (1 Timothy 2:3-4).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 33:11 — *As I live... I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye* the sworn mercy of Yahuah (LORD); the ground of *Who will have all men to be saved* (1 Timothy 2:4).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* the Shema''s one Elohim (God), the Father; *there is one Elohim (God), and one mediator... the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:5 — *I stood between Yahuah (LORD) and you at that time, to shew you the word of Yahuah (LORD)* Moses the go-between; the Formed Man who stands *between Elohim (God) and men* (1 Timothy 2:5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 9:33 — *Neither is there any daysman betwixt us, that might lay his hand upon us both* the daysman Job longed for; given in *the man HaMashiach Yahusha (Christ Jesus); Who gave himself a ransom for all* (1 Timothy 2:5-6).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=9 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:20 — *a mediator is not a mediator of one, but Elohim (God) is one* the mediator stands between two parties, the one party being the one Elohim (God); *one Elohim (God), and one mediator... the man* (1 Timothy 2:5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *Yahuah Elohim (the LORD God) formed man of the dust of the ground... and man became a living soul* the man formed first; *For Adam was first formed, then Eve* (1 Timothy 2:13).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:22 — *the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* the woman made after and from the man; the *then Eve* of *Adam was first formed, then Eve* (1 Timothy 2:13).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:6 — *the woman... took of the fruit thereof, and did eat* the deception in the garden; *the woman being deceived was in the transgression* (1 Timothy 2:14).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:13 — *The serpent beguiled me, and I did eat* the woman''s own confession of the deception; *the woman being deceived was in the transgression* (1 Timothy 2:14).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 11:8 — *the man is not of the woman; but the woman of the man* the same creation-order appeal Paul makes; *For Adam was first formed, then Eve* (1 Timothy 2:13).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
