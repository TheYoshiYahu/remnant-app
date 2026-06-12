-- ----- fragment: minion_genesis_18.sql (Genesis 18) -----
-- Chapter: Genesis 18 (Yahuah appears to Abraham by the oaks of Mamre as three men — the Formed One and two angels; Abraham's hospitality; the promise "Sarah shall have a son" at the set time; Sarah laughs within the tent; "Is any thing too hard for Yahuah?"; the men look toward Sodom; "Shall I hide from Abraham that thing which I do?"; the cry of Sodom and Gomorrah; Abraham's intercession — "Shall not the Judge of all the earth do right?" — the bargaining down from fifty to ten righteous)
-- Tag: ge18   Temp view: _s301_ge18_lookup
-- Sort band: base 20425, step 3 -> threads at 20425, 20428, 20431, 20434, 20437, 20440 (6 threads)
-- Source of EVERY row: 'canon','genesis',18,v
--
-- Genesis 18 coverage:
--   ★ v.1-2,8 (And Yahuah appeared unto him in the plains of Mamre... lo, three men stood by him... he stood by them under the tree, and they did eat)
--        NT:     John 8:56 (Abraham rejoiced to see my day: and he saw it, and was glad) — the One Abraham met = the Formed Son; Hebrews 13:2 (entertained angels unawares) — the hospitality — THREAD 1 (load-bearing)
--        Extras: Jubilees 16:1 (on the new moon of the fourth month we appeared to Abraham, at the oak of Mamre... a son would be given to him by Sarah his wife) — THREAD 1
--        Tanakh: (the theophany frame carried within THREAD 1 via vv.13,17,22 quoted inline; no distinct lateral warranted as a separate member)
--   v.3-7 (My Lord, if now I have found favour... a little water... wash your feet... a morsel of bread... Abraham hastened... fetcht a calf tender and good)
--        NT:     Hebrews 13:2 (entertain strangers... entertained angels unawares) — held at THREAD 1 (the hospitality)
--        Extras: none warranted distinct (the meal is folded into the Mamre-appearance frame, THREAD 1)
--        Tanakh: none warranted distinct
--   ★ v.10,14b (I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son... At the time appointed... Sarah shall have a son)
--        NT:     Romans 9:9 (For this is the word of promise, At this time will I come, and Sara shall have a son) — the elect seed by promise — THREAD 2 (load-bearing)
--        Extras: Jubilees 16:4 (when we returned to her at a set time, she would have conceived a son) — THREAD 2
--        Tanakh: Genesis 17:21 (my covenant will I establish with Isaac, which Sarah shall bear unto thee at this set time in the next year); Genesis 21:2 (Sarah conceived, and bare Abraham a son... at the set time of which Elohim had spoken) — THREAD 2
--   ★ v.14a (Is any thing too hard for Yahuah?)
--        NT:     Luke 1:37 (For with Elohim nothing shall be impossible) — the Annunciation echo — THREAD 3 (load-bearing)
--        Extras: none warranted distinct (Jubilees carries the set-time return at 16:4, THREAD 2; the "too hard" question itself is not its own Jubilees line)
--        Tanakh: Jeremiah 32:17 (there is nothing too hard for thee); Jeremiah 32:27 (is there any thing too hard for me?) — THREAD 3
--   ★ v.11-13,15 (Abraham and Sarah were old... Sarah laughed within herself... Wherefore did Sarah laugh... Then Sarah denied, saying, I laughed not; for she was afraid)
--        NT:     Hebrews 11:11 (Through faith also Sara herself received strength to conceive seed... because she judged him faithful who had promised) — THREAD 4 (load-bearing)
--        Extras: Jubilees 16:2 (And Sarah laughed, for she heard that we had spoken these words... and she became afraid, and denied that she had laughed) — THREAD 4
--        Tanakh: Genesis 21:6 (Elohim hath made me to laugh, so that all that hear will laugh with me) — the laugh turned to joy at Isaac's birth — THREAD 4
--   v.16,20-22 (the men rose up... looked toward Sodom... Because the cry of Sodom and Gomorrah is great... I will go down now, and see... the men turned their faces from thence, and went toward Sodom: but Abraham stood yet before Yahuah)
--        NT:     none warranted distinct as MEMBER (the Sodom-going frame is carried at the Genesis 19 sibling; the "Abraham stood yet before Yahuah" intercession-stance is the hinge into THREADS 5/6)
--        Extras: Jubilees 16:5 (in this month Yahuah executed his judgments on Sodom, and Gomorrah... and He burned them with fire and brimstone) — THREAD 5 (the cry/judgment)
--        Tanakh: (the descent-to-see and the cry are carried into THREADS 5/6 via the intercession)
--   ★ v.17-19 (Shall I hide from Abraham that thing which I do... For I know him, that he will command his children and his household after him, and they shall keep the way of Yahuah, to do justice and judgment)
--        NT:     James 2:23 (Abraham... was called the Friend of Elohim) — the Friend whom Yahuah will not hide from — THREAD 6
--        Extras: none warranted distinct
--        Tanakh: 2 Chronicles 20:7 (the seed of Abraham thy friend for ever); Isaiah 41:8 (the seed of Abraham my friend) — THREAD 6
--   ★★ v.23-25 (Wilt thou also destroy the righteous with the wicked... Shall not the Judge of all the earth do right?)
--        NT:     none warranted distinct as MEMBER (the intercessor-pattern is woven into the prose; the Friend-frame held at THREAD 6)
--        Extras: Jubilees 16:5-6 (Yahuah executed his judgments on Sodom... But Lot we saved; for Elohim remembered Abraham) — THREAD 5
--        Tanakh: Ezekiel 22:30 (I sought for a man... that should make up the hedge, and stand in the gap before me for the land); Psalm 106:23 (Moses his chosen stood before him in the breach, to turn away his wrath) — THREAD 5
--   v.26-33 (the bargaining from fifty to forty-five to forty to thirty to twenty to ten; Yahuah went his way... and Abraham returned unto his place)
--        NT:     none warranted distinct (the standing-in-the-gap intercession carried by THREAD 5)
--        Extras: none warranted distinct
--        Tanakh: (carried by THREAD 5 via Ezekiel 22:30 / Psalm 106:23)
--
-- Threads (slug — target libraries):
--   1. genesis-18-yahuah-appeared-the-formed-at-the-oaks-of-mamre — NT (John, Hebrews) + Extras (Jubilees) [extras] (★ THEOPHANY — the Formed Son)
--   2. genesis-18-sarah-shall-have-a-son-at-the-set-time — NT (Romans) + Tanakh (Genesis) + Extras (Jubilees) [extras]
--   3. genesis-18-is-any-thing-too-hard-for-yahuah — NT (Luke) + Tanakh (Jeremiah) [free]
--   4. genesis-18-sarah-laughed-and-through-faith-received-strength — NT (Hebrews) + Tanakh (Genesis) + Extras (Jubilees) [extras]
--   5. genesis-18-shall-not-the-judge-of-all-the-earth-do-right — Tanakh (Ezekiel, Psalm) + Extras (Jubilees) [extras] (★★ INTERCESSION — stand in the gap)
--   6. genesis-18-abraham-the-friend-stood-in-the-breach — NT (James) + Tanakh (2 Chronicles, Isaiah) [free]
--
-- Framing notes:
--   ★ THE FORMED AT MAMRE (THREAD 1, Red Line #4 — the Formed and the Formless). *And Yahuah (LORD) appeared
--   unto him in the plains of Mamre* (18:1): the One who appears as three men, who EATS (*they did eat*, 18:8),
--   who SPEAKS and is named *Yahuah* (18:13,17,22), while two angels go on to Sodom and *Abraham stood yet before
--   Yahuah* (18:22) — this is the Formed Son, the visible One who bears the Name, NOT a created angel, NOT a
--   co-equal-persons Trinity, NOT modalism. The two who go on to Sodom ARE the angels (Genesis 19:1); the One who
--   stays is Yahuah Himself. Yahusha names Him: *Abraham rejoiced to see my day: and he saw it, and was glad*
--   (John 8:56) — the day Abraham saw was this One. Hebrews 13:2 reads the hospitality forward: *entertained
--   angels unawares*. NO trinitarian grammar is used; the Father is the Formless Source, the Son the Formed who
--   appeared and ate.
--   ★ THE SET-TIME PROMISE (THREAD 2). *At the time appointed I will return... and Sarah shall have a son*
--   (18:14): the elect seed-line BY PROMISE, not by flesh — Sha'ul reads it exactly so: *the children of the
--   promise are counted for the seed... At this time will I come, and Sara shall have a son* (Romans 9:8-9). The
--   set time is named in 17:21 and kept in 21:2. Framed by bloodline-AND-covenant-word together (Red Line #1):
--   the heir is given by the Formed's own returning word.
--   ★ IS ANY THING TOO HARD FOR YAHUAH (THREAD 3). *Is any thing too hard for Yahuah?* (18:14) — Jeremiah twice
--   confesses *there is nothing too hard for thee* (32:17), *is there any thing too hard for me?* (32:27); and the
--   messenger to Miriam (Mary) echoes it at the second impossible conception: *with Elohim nothing shall be
--   impossible* (Luke 1:37). The dead womb of Sarah and the virgin womb both answer the same question.
--   ★ SARAH LAUGHED (THREAD 4). *Sarah laughed within herself* (18:12) — the promise heard against the dead womb;
--   Hebrews 11:11 frames the faith that followed: *through faith also Sara herself received strength to conceive
--   seed... because she judged him faithful who had promised*. The unbelieving laugh becomes the believing laugh
--   of joy at the birth: *Elohim hath made me to laugh* (21:6). Ties to the Gen 15 seed-as-stars / Romans 4
--   promise-against-deadness already live.
--   ★★ SHALL NOT THE JUDGE OF ALL THE EARTH DO RIGHT (THREAD 5, the intercession). *Shall not the Judge of all
--   the earth do right?* (18:25): Yahuah's judgment is never arbitrary — Abraham appeals to His righteousness, not
--   against it. The intercessor stands in the breach for the wicked — the very pattern Yahuah later seeks in vain:
--   *I sought for a man... that should... stand in the gap before me for the land, that I should not destroy it*
--   (Ezekiel 22:30); Mosheh *stood before him in the breach, to turn away his wrath* (Psalm 106:23). The pattern is
--   fulfilled in the Messiah who makes intercession. Jubilees 16:5-6 records the judgment executed AND Lot spared
--   *for Elohim remembered Abraham* — the intercession bore fruit (carried to the Gen 19 sibling). NOTE: the
--   bargaining (vv.26-32) is summarized in the thread prose, not given its own members.
--   ★ ABRAHAM THE FRIEND (THREAD 6). *Shall I hide from Abraham that thing which I do?* (18:17) — Yahuah will not
--   hide His counsel from His friend. *The seed of Abraham thy friend for ever* (2 Chronicles 20:7); *the seed of
--   Abraham my friend* (Isaiah 41:8); *he was called the Friend of Elohim* (James 2:23). And 18:19 names WHY he is
--   the Friend: *he will command his children... and they shall keep the way of Yahuah, to do justice and judgment*
--   — the covenant-keeping friend (Red Line #6; 1 John 2:3-4 filter): the friendship is bound to keeping the way.
--   EXTRAS: Jubilees 16 is a clean parse covering the Mamre visit (16:1), the set-time return (16:4), Sarah's laugh
--   (16:2), and Sodom's judgment + Lot's deliverance (16:5-6). Jubilees DOUBLE-WRITTEN 'jubilees','jubilees'.
--   JASHER: NONE WARRANTED — this Jasher parse (ch 22 Beersheba/Abimelech well + open-house hospitality, ch 23 the
--   Akedah) is the Genesis 21-22 narrative, NOT the Genesis-18 Mamre theophany; no distinct Genesis-18 parallel
--   exists, so Jasher is deliberately omitted rather than forced. WISDOM OF SOLOMON ch10 (the righteous delivered /
--   Lot escaping the fire) fits the Genesis 19 SIBLING (the actual deliverance), not a clean Genesis-18 parallel,
--   so it is held for ch19 rather than forced here.

CREATE TEMP VIEW _s301_ge18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Yahuah appeared — the Formed at the oaks of Mamre
    ('canon','genesis',18,1,'canon','john',8,56,'free',
      E'*Your father Abraham rejoiced to see my day: and he saw it, and was glad* (John 8:56). When Yahusha (Jesus) says this, the Yahudim (Jews) are astonished — *Thou art not yet fifty years old, and hast thou seen Abraham?* (John 8:57) — and He answers *Before Abraham was, I am* (John 8:58). The day Abraham saw was THIS One: *And Yahuah (LORD) appeared unto him in the plains of Mamre* (Genesis 18:1). The visible One who came to the tent door, who ate and spoke and bore the Name, is the Formed Son — the One Abraham met and was glad.'),
    ('canon','genesis',18,1,'canon','hebrews',13,2,'free',
      E'*Be not forgetful to entertain strangers: for thereby some have entertained angels unawares* (Hebrews 13:2). The pattern is set here: *lo, three men stood by him: and when he saw them, he ran to meet them from the tent door* (Genesis 18:2), and Abraham washed their feet and set a meal before them (Genesis 18:4-8). He did not know at first that Yahuah and His two angels stood at his tent — the welcomed strangers were the Formed One and the messengers bound for Sodom. The hospitality of *they did eat* (Genesis 18:8) is the very entertaining of angels unawares.'),
    ('canon','genesis',18,2,'jubilees','jubilees',16,1,'extras',
      E'*And on the new moon of the fourth month we appeared to Abraham, at the oak of Mamre, and we talked with him, and we announced to him that a son would be given to him by Sarah his wife* (Jubilees 16:1). The restored witness keeps the scene — the appearing *at the oak of Mamre* and the announcement of *a son... by Sarah his wife* — matching *Yahuah (LORD) appeared unto him in the plains of Mamre* (Genesis 18:1) and *Sarah thy wife shall have a son* (Genesis 18:10), and dates it to the new moon of the fourth month.'),

    -- THREAD 2: Sarah shall have a son at the set time — the seed by promise
    ('canon','genesis',18,10,'canon','romans',9,9,'free',
      E'*For this is the word of promise, At this time will I come, and Sara shall have a son* (Romans 9:9). Sha''ul (Paul) quotes the very word spoken at the tent — *I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son* (Genesis 18:10) — to prove that the seed is reckoned by PROMISE, not by flesh: *the children of the promise are counted for the seed* (Romans 9:8). Isaac is the elect heir given by the Formed''s own returning word, not by the strength of an aged body.'),
    ('canon','genesis',18,14,'canon','genesis',17,21,'free',
      E'*But my covenant will I establish with Isaac, which Sarah shall bear unto thee at this set time in the next year* (Genesis 17:21). The set time is already named one chapter before: the covenant fixed to Isaac *at this set time in the next year*. So when Yahuah says at Mamre *At the time appointed I will return... and Sarah shall have a son* (Genesis 18:14), it is the same appointed time — the promise is not vague but dated, the heir bound to a season Yahuah set.'),
    ('canon','genesis',18,14,'canon','genesis',21,2,'free',
      E'*For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him* (Genesis 21:2). The word *At the time appointed I will return... and Sarah shall have a son* (Genesis 18:14) comes due exactly: *at the set time of which Elohim had spoken*. Yahuah (LORD) *visited Sarah as he had said* (Genesis 21:1) — the returning One kept His own appointment, and the promised seed was born to the day.'),
    ('canon','genesis',18,10,'jubilees','jubilees',16,4,'extras',
      E'*And (that) when we returned to her at a set time, she would have conceived a son* (Jubilees 16:4). The restored witness carries the set-time return — *when we returned to her at a set time, she would have conceived a son* — matching *I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son* (Genesis 18:10) and *At the time appointed I will return* (Genesis 18:14).'),

    -- THREAD 3: Is any thing too hard for Yahuah?
    ('canon','genesis',18,14,'canon','jeremiah',32,17,'free',
      E'*Ah Yahuah (Lord) GOD! behold, thou hast made the heaven and the earth by thy great power and stretched out arm, and there is nothing too hard for thee* (Jeremiah 32:17). The question Yahuah puts to Abraham — *Is any thing too hard for Yahuah (LORD)?* (Genesis 18:14) — becomes the prophet''s confession: the One who made heaven and earth has *nothing too hard for thee*. The dead womb is no harder to Him than the founding of the world.'),
    ('canon','genesis',18,14,'canon','jeremiah',32,27,'free',
      E'*Behold, I am Yahuah (LORD), the Elohim (God) of all flesh: is there any thing too hard for me?* (Jeremiah 32:27). Yahuah turns His own question of Genesis 18:14 — *Is any thing too hard for Yahuah?* — back upon Jeremiah in the same words: *is there any thing too hard for me?* As *the Elohim of all flesh* He opens the barren womb at His set time; the rhetorical question expects one answer — nothing.'),
    ('canon','genesis',18,14,'canon','luke',1,37,'free',
      E'*For with Elohim (God) nothing shall be impossible* (Luke 1:37). The messenger speaks this to Miriam (Mary) at the second impossible conception, echoing the word at Mamre: *Is any thing too hard for Yahuah (LORD)?* (Genesis 18:14). The dead womb of Sarah and the virgin womb both answer the same question the same way — with Elohim *nothing shall be impossible*. The set-time son and the promised seed are each given against every barrier of the flesh.'),

    -- THREAD 4: Sarah laughed — through faith received strength
    ('canon','genesis',18,12,'canon','hebrews',11,11,'free',
      E'*Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11). The laugh of the tent — *Therefore Sarah laughed within herself, saying, After I am waxed old shall I have pleasure, my lord being old also?* (Genesis 18:12) — is not the last word. The faith that followed is reckoned: *Sara herself received strength to conceive seed... because she judged him faithful who had promised*. The promise was believed against the dead womb, and the One who promised was found faithful.'),
    ('canon','genesis',18,12,'canon','genesis',21,6,'free',
      E'*And Sarah said, Elohim (God) hath made me to laugh, so that all that hear will laugh with me* (Genesis 21:6). The doubting laugh of *Sarah laughed within herself* (Genesis 18:12) — the laugh she then denied for fear (Genesis 18:15) — is turned at last into the laugh of joy. When the set-time son is born she names the laughter Yahuah''s own gift: *Elohim hath made me to laugh*. The unbelief that laughed becomes the wonder that laughs with all who hear.'),
    ('canon','genesis',18,12,'jubilees','jubilees',16,2,'extras',
      E'*And Sarah laughed, for she heard that we had spoken these words with Abraham, and we admonished her, and she became afraid, and denied that she had laughed on account of the words* (Jubilees 16:2). The restored witness keeps the whole movement — Sarah hearing, laughing, being admonished, growing afraid, and denying — matching *Sarah laughed within herself* (Genesis 18:12) and *Then Sarah denied, saying, I laughed not; for she was afraid* (Genesis 18:15).'),

    -- THREAD 5 (★★ INTERCESSION): Shall not the Judge of all the earth do right? — stand in the breach
    ('canon','genesis',18,23,'canon','ezekiel',22,30,'free',
      E'*And I sought for a man among them, that should make up the hedge, and stand in the gap before me for the land, that I should not destroy it: but I found none* (Ezekiel 22:30). What Abraham DOES here is the very thing Yahuah later seeks and cannot find. Abraham *drew near, and said, Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23) — he stands in the gap for a doomed city, pleading that it be spared. He is the man Ezekiel could not find: the intercessor who stands before Yahuah for the land that it should not be destroyed.'),
    ('canon','genesis',18,23,'canon','psalms',106,23,'free',
      E'*Therefore he said that he would destroy them, had not Moses his chosen stood before him in the breach, to turn away his wrath, lest he should destroy them* (Psalm 106:23). The pattern Abraham opens — drawing near to plead *Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23) — is the pattern Mosheh (Moses) takes up at Sinai: *stood before him in the breach, to turn away his wrath*. The friend of Yahuah standing in the breach for the guilty runs from Abraham to Mosheh and finds its fullness in the Messiah who makes intercession.'),
    ('canon','genesis',18,20,'jubilees','jubilees',16,5,'extras',
      E'*And in this month Yahuah (God) executed his judgments on Sodom, and Gomorrah, and Zeboim, and all the region of the Jordan, and He burned them with fire and brimstone, and destroyed them until this day... that they are wicked and sinners exceedingly* (Jubilees 16:5). The restored witness names the cause and the sentence — the cities *wicked and sinners exceedingly*, judged with *fire and brimstone* — matching *the cry of Sodom and Gomorrah is great, and... their sin is very grievous* (Genesis 18:20). The Judge of all the earth saw the cry and did right.'),
    ('canon','genesis',18,23,'jubilees','jubilees',16,6,'extras',
      E'*And, in like manner, Elohim (God) will execute judgment on the places where they have done according to the uncleanness of the Sodomites, like to the judgment of Sodom. But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow* (Jubilees 16:6). The intercession of *Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23) bore fruit: *Lot we saved; for Elohim remembered Abraham*. The Judge who does right does not slay the righteous with the wicked — He remembers the intercessor and draws the one righteous man out of the fire.'),

    -- THREAD 6: Abraham the Friend — Shall I hide from Abraham that thing which I do?
    ('canon','genesis',18,17,'canon','james',2,23,'free',
      E'*And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God)* (James 2:23). Because Abraham is the Friend of Elohim, Yahuah will not keep His counsel from him: *Shall I hide from Abraham that thing which I do?* (Genesis 18:17). The friendship that James names is the reason the Judge tells His friend before He acts — and Genesis 18:19 names why: Abraham *will command his children... and they shall keep the way of Yahuah*.'),
    ('canon','genesis',18,17,'canon','2-chronicles',20,7,'free',
      E'*Art not thou our Elohim (God), who didst drive out the inhabitants of this land before thy people Yashar''el (Israel), and gavest it to the seed of Abraham thy friend for ever?* (2 Chronicles 20:7). Yehoshaphat pleads on the ground of *the seed of Abraham thy friend for ever* — the friendship first shown when Yahuah would not hide His purpose from him: *Shall I hide from Abraham that thing which I do?* (Genesis 18:17). The Friend of Elohim and his seed inherit the land by that very friendship.'),
    ('canon','genesis',18,17,'canon','isaiah',41,8,'free',
      E'*But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend* (Isaiah 41:8). The whole nation is named for the friendship begun here — *the seed of Abraham my friend* — the friend from whom Yahuah would not hide His doing: *Shall I hide from Abraham that thing which I do?* (Genesis 18:17). And the friendship is bound to a walk: Abraham *will command his children and his household after him, and they shall keep the way of Yahuah, to do justice and judgment* (Genesis 18:19).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-18-yahuah-appeared-the-formed-at-the-oaks-of-mamre',
       E'Yahuah appeared — the Formed at the oaks of Mamre',
       E'*And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day* (Genesis 18:1). Then *he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground* (Genesis 18:2). Abraham washes their feet, sets meal-cakes and a dressed calf before them, *and he stood by them under the tree, and they did eat* (Genesis 18:8). This is the lens of the Formed and the Formless: the One who appears, who EATS, who SPEAKS and is named *Yahuah* (Genesis 18:13,17,22) — while two of the three go on toward Sodom and *Abraham stood yet before Yahuah* (Genesis 18:22). The two who go on are the angels who reach Sodom at evening (Genesis 19:1); the One who stays and bears the Name is the Formed Son, the visible Glory who met Abraham — not a created angel, not a co-equal-persons grammar, not modalism. Yahusha (Jesus) names this very meeting: *Your father Abraham rejoiced to see my day: and he saw it, and was glad* (John 8:56), and when challenged, *Before Abraham was, I am* (John 8:58). The day Abraham saw was the day the Formed stood at his tent. And the hospitality is read forward: *Be not forgetful to entertain strangers: for thereby some have entertained angels unawares* (Hebrews 13:2) — the welcomed strangers were Yahuah and His messengers. The restored witness keeps the scene whole: *on the new moon of the fourth month we appeared to Abraham, at the oak of Mamre, and we talked with him, and we announced to him that a son would be given to him by Sarah his wife* (Jubilees 16:1).',
       sv.verse_id, ev.verse_id, 'extras', 20425
  FROM _s301_ge18_lookup sv, _s301_ge18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=18 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-18-sarah-shall-have-a-son-at-the-set-time',
       E'Sarah shall have a son — at the set time, by promise',
       E'At the tent door the Formed speaks the heir into the future: *I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son* (Genesis 18:10), and again *At the time appointed I will return unto thee, according to the time of life, and Sarah shall have a son* (Genesis 18:14). This is the elect seed BY PROMISE, not by flesh — Sha''ul (Paul) quotes this very word to prove it: *For this is the word of promise, At this time will I come, and Sara shall have a son* (Romans 9:9), for *the children of the promise are counted for the seed* (Romans 9:8). The son is given by the returning word of the Formed, carried by paternal bloodline AND covenant-word together, never by the strength of an aged body. And the time is not vague but FIXED: *my covenant will I establish with Isaac, which Sarah shall bear unto thee at this set time in the next year* (Genesis 17:21). The appointment is kept exactly: *Yahuah (LORD) visited Sarah as he had said* (Genesis 21:1), and *Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him* (Genesis 21:2). The restored witness carries the set-time return: *when we returned to her at a set time, she would have conceived a son* (Jubilees 16:4). The promised seed comes to the day Yahuah set.',
       sv.verse_id, ev.verse_id, 'extras', 20428
  FROM _s301_ge18_lookup sv, _s301_ge18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-18-is-any-thing-too-hard-for-yahuah',
       E'Is any thing too hard for Yahuah?',
       E'When Sarah laughs at the promise of a son from a dead womb, the Formed answers her not with proof but with a question: *Is any thing too hard for Yahuah (LORD)? At the time appointed I will return unto thee, according to the time of life, and Sarah shall have a son* (Genesis 18:14). The question runs the length of Scripture as a settled confession. Jeremiah, buying a field while the city falls, prays it back: *Ah Yahuah (Lord) GOD! behold, thou hast made the heaven and the earth by thy great power and stretched out arm, and there is nothing too hard for thee* (Jeremiah 32:17). And Yahuah turns His own Mamre question on the prophet in the same words: *Behold, I am Yahuah (LORD), the Elohim (God) of all flesh: is there any thing too hard for me?* (Jeremiah 32:27). Centuries on, the messenger speaks the same word over the virgin womb of Miriam (Mary): *For with Elohim (God) nothing shall be impossible* (Luke 1:37). The dead womb of Sarah and the virgin womb both answer the one question the one way — nothing is too hard for Yahuah, who keeps His set-time word against every barrier of the flesh.',
       sv.verse_id, ev.verse_id, 'free', 20431
  FROM _s301_ge18_lookup sv, _s301_ge18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-18-sarah-laughed-and-through-faith-received-strength',
       E'Sarah laughed — and through faith received strength',
       E'*Now Abraham and Sarah were old and well stricken in age; and it ceased to be with Sarah after the manner of women. Therefore Sarah laughed within herself, saying, After I am waxed old shall I have pleasure, my lord being old also?* (Genesis 18:11-12). The Formed hears the laugh no ear caught — *Wherefore did Sarah laugh...?* (Genesis 18:13) — and when she denies it, *Then Sarah denied, saying, I laughed not; for she was afraid. And he said, Nay; but thou didst laugh* (Genesis 18:15). But the doubting laugh is not the end of her story. The faith that followed is reckoned to her: *Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11). The promise was believed against the dead womb — the same trust-against-deadness reckoned to Abraham when he believed the seed would be as the stars. And the unbelieving laugh is turned at last to the laugh of joy: when the set-time son is born, *Sarah said, Elohim (God) hath made me to laugh, so that all that hear will laugh with me* (Genesis 21:6). The restored witness keeps the whole movement of hearing, laughing, fearing, denying: *And Sarah laughed, for she heard that we had spoken these words with Abraham, and we admonished her, and she became afraid, and denied that she had laughed on account of the words* (Jubilees 16:2).',
       sv.verse_id, ev.verse_id, 'extras', 20434
  FROM _s301_ge18_lookup sv, _s301_ge18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=18 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★ INTERCESSION)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-18-shall-not-the-judge-of-all-the-earth-do-right',
       E'Shall not the Judge of all the earth do right? — Abraham stands in the breach',
       E'The men turn toward Sodom, *but Abraham stood yet before Yahuah (LORD)* (Genesis 18:22) — and there he becomes the intercessor. *And Abraham drew near, and said, Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23). He pleads not against Yahuah''s justice but FROM it: *That be far from thee to do after this manner, to slay the righteous with the wicked... Shall not the Judge of all the earth do right?* (Genesis 18:25). The Judge''s judgment is never arbitrary — the cry of Sodom is real, *Because the cry of Sodom and Gomorrah is great, and because their sin is very grievous* (Genesis 18:20) — yet the righteous must not perish with the guilty. So Abraham stands in the gap, bargaining the city down from fifty righteous to forty-five to forty to thirty to twenty, until *Peradventure ten shall be found there. And he said, I will not destroy it for ten''s sake* (Genesis 18:32). This is the pattern Yahuah later seeks and cannot find: *I sought for a man among them, that should make up the hedge, and stand in the gap before me for the land, that I should not destroy it: but I found none* (Ezekiel 22:30). It is the pattern Mosheh (Moses) takes up at Sinai: *Moses his chosen stood before him in the breach, to turn away his wrath, lest he should destroy them* (Psalm 106:23). The friend who stands in the breach for the guilty runs from Abraham to Mosheh and finds its fullness in the Messiah who makes intercession. And the intercession bore fruit: the restored witness records the sentence — *Yahuah (God) executed his judgments on Sodom, and Gomorrah... and He burned them with fire and brimstone* (Jubilees 16:5) — yet *But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow* (Jubilees 16:6). The Judge of all the earth did right: He did not slay the righteous with the wicked, but remembered the intercessor and drew the one righteous man out of the fire.',
       sv.verse_id, ev.verse_id, 'extras', 20437
  FROM _s301_ge18_lookup sv, _s301_ge18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=18 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-18-abraham-the-friend-stood-in-the-breach',
       E'Shall I hide from Abraham? — the Friend of Elohim who keeps the way',
       E'Before He acts, Yahuah opens His counsel to Abraham: *And Yahuah (LORD) said, Shall I hide from Abraham that thing which I do?* (Genesis 18:17). He will not keep His purpose from His friend — and He names plainly WHY Abraham is the friend He confides in: *For I know him, that he will command his children and his household after him, and they shall keep the way of Yahuah (LORD), to do justice and judgment; that Yahuah (LORD) may bring upon Abraham that which he hath spoken of him* (Genesis 18:19). The friendship is bound to a walk — to commanding his house to keep the way of Yahuah, to do justice and judgment. This is the friend named across the Scriptures: *the seed of Abraham thy friend for ever* (2 Chronicles 20:7), on which ground Yehoshaphat pleads for the land; *thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend* (Isaiah 41:8), the whole nation named for that friendship; and *the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God)* (James 2:23). The Judge does not hide His doing from the friend who keeps His way — the friendship and the keeping of the commandments are one. The very next thing the Friend does with the counsel he is given is to stand in the breach and plead for Sodom.',
       sv.verse_id, ev.verse_id, 'free', 20440
  FROM _s301_ge18_lookup sv, _s301_ge18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=18 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Your father Abraham rejoiced to see my day: and he saw it, and was glad* (John 8:56) — Yahusha names the One Abraham met at Mamre (18:1); *Before Abraham was, I am* (John 8:58). The Formed Son is the day Abraham saw.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-yahuah-appeared-the-formed-at-the-oaks-of-mamre'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*entertain strangers: for thereby some have entertained angels unawares* (Hebrews 13:2) — the hospitality of the three men at the tent (18:2-8) is the very entertaining of angels unawares: Yahuah and His two messengers.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-yahuah-appeared-the-formed-at-the-oaks-of-mamre'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*we appeared to Abraham, at the oak of Mamre... a son would be given to him by Sarah his wife* (Jubilees 16:1) — the restored witness keeps the Mamre appearance (18:1) and the announcement (18:10), dated to the new moon of the fourth month.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=2
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-yahuah-appeared-the-formed-at-the-oaks-of-mamre'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*this is the word of promise, At this time will I come, and Sara shall have a son* (Romans 9:9) — Sha''ul quotes 18:10 to prove the seed is reckoned by PROMISE not flesh: *the children of the promise are counted for the seed* (Romans 9:8).'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=10
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-sarah-shall-have-a-son-at-the-set-time'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*my covenant will I establish with Isaac... at this set time in the next year* (Genesis 17:21) — the appointed time of 18:14 is already named one chapter before; the promise is dated, not vague.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-sarah-shall-have-a-son-at-the-set-time'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim had spoken* (Genesis 21:2) — the word of 18:14 comes due exactly; the returning One kept His own appointment.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-sarah-shall-have-a-son-at-the-set-time'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*when we returned to her at a set time, she would have conceived a son* (Jubilees 16:4) — the restored witness carries the set-time return of 18:10,14.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=10
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-sarah-shall-have-a-son-at-the-set-time'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*there is nothing too hard for thee* (Jeremiah 32:17) — the question of 18:14 becomes the prophet''s confession: the Maker of heaven and earth has nothing too hard for Him.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=32 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-is-any-thing-too-hard-for-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*is there any thing too hard for me?* (Jeremiah 32:27) — Yahuah turns His own Mamre question (18:14) back on the prophet in the same words, as *the Elohim of all flesh*.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=32 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-is-any-thing-too-hard-for-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*with Elohim nothing shall be impossible* (Luke 1:37) — the Annunciation echo of 18:14: the dead womb of Sarah and the virgin womb both answer the one question the one way.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-is-any-thing-too-hard-for-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Through faith also Sara herself received strength to conceive seed... because she judged him faithful who had promised* (Hebrews 11:11) — the laugh of 18:12 is not the end; the faith that followed is reckoned, the promise believed against the dead womb.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=12
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-sarah-laughed-and-through-faith-received-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim hath made me to laugh, so that all that hear will laugh with me* (Genesis 21:6) — the doubting laugh of 18:12 (denied for fear, 18:15) is turned at the birth into the laugh of joy.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=12
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-sarah-laughed-and-through-faith-received-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Sarah laughed... and she became afraid, and denied that she had laughed* (Jubilees 16:2) — the restored witness keeps the whole movement of hearing, laughing, fearing, denying (18:12,15).'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=12
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-sarah-laughed-and-through-faith-received-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★ INTERCESSION)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I sought for a man... that should... stand in the gap before me for the land, that I should not destroy it: but I found none* (Ezekiel 22:30) — what Abraham DOES at 18:23 is the very thing Yahuah later seeks and cannot find: the intercessor in the gap.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=23
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=22 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-shall-not-the-judge-of-all-the-earth-do-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Moses his chosen stood before him in the breach, to turn away his wrath* (Psalm 106:23) — the standing-in-the-breach pattern Abraham opens at 18:23, taken up by Mosheh at Sinai, fulfilled in the Messiah who makes intercession.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=23
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-shall-not-the-judge-of-all-the-earth-do-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah executed his judgments on Sodom, and Gomorrah... He burned them with fire and brimstone... wicked and sinners exceedingly* (Jubilees 16:5) — the restored witness names the cause and sentence behind the cry of 18:20.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=20
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-shall-not-the-judge-of-all-the-earth-do-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*But Lot we saved; for Elohim remembered Abraham, and sent him out from the midst of the overthrow* (Jubilees 16:6) — the intercession of 18:23 bore fruit: the Judge did not slay the righteous with the wicked but remembered the friend.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=23
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-shall-not-the-judge-of-all-the-earth-do-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Abraham believed Elohim... and he was called the Friend of Elohim* (James 2:23) — because Abraham is the Friend, Yahuah will not hide His doing from him (18:17); the friendship is the reason the Judge confides.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=17
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-abraham-the-friend-stood-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*gavest it to the seed of Abraham thy friend for ever* (2 Chronicles 20:7) — Yehoshaphat pleads on the ground of the friendship first shown when Yahuah would not hide His purpose (18:17).'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=17
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-abraham-the-friend-stood-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the seed of Abraham my friend* (Isaiah 41:8) — the whole nation named for the friendship of 18:17, bound to the walk of 18:19: *they shall keep the way of Yahuah, to do justice and judgment*.'
  FROM cross_reference_threads t
  JOIN _s301_ge18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=18 AND sv.verse_number=17
  JOIN _s301_ge18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-18-abraham-the-friend-stood-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
