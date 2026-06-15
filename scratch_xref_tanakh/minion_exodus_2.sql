-- ----- fragment: minion_exodus_2.sql (Exodus 2) -----
-- Chapter: Exodus 2 — Moses' birth and the ark of bulrushes; Moses flees to Midian;
--   Elohim hears the groaning and remembers the covenant with Abraham, Isaac, and Jacob.
-- Session prefix: s305   Tag: ex02   Sort band base: 29025 (step 3)
--
-- Exodus 2 coverage:
--   v.1-2 (man of the house of Levi; goodly child hid three months)
--        NT:     Hebrews 11:23 (hid three months by faith); Acts 7:20 (Moses exceeding fair)  [THREAD 1]
--        Extras: Jubilees 47:3; Jasher 68:5 (hid three months)                                [THREAD 1]
--        Tanakh: none warranted (covered by thread frame)
--   v.3 (ark of bulrushes, slime and pitch, by the river's brink)
--        NT:     Hebrews 11:23 (the faith that hid him); Acts 7:21 (cast out, taken up)        [THREAD 1]
--        Extras: Jubilees 47:4 (ark covered with pitch in the flags); Jasher 68:13 (ark of bulrushes daubed) [THREAD 1]
--        Tanakh: none warranted (tebah / Noah's-ark word framed in prose)
--   v.4-10 (sister watches; Pharaoh's daughter draws him out; named Moses)
--        NT:     Acts 7:21 (Pharaoh's daughter took him up, nourished him as her own son)      [THREAD 1]
--        Extras: Jubilees 47:5-6 (Tharmuth bathes, compassion, drawn out)                      [THREAD 1]
--        Tanakh: none warranted
--   v.11-12 (Moses grown, goes out to his brethren, looks on burdens, slays the Egyptian)
--        NT:     Hebrews 11:24-26 (refused Pharaoh's daughter, chose affliction, reproach of Messiah); Acts 7:23-25 (visited brethren, they understood not) [THREAD 2]
--        Extras: Jubilees 47:10 (saw the Egyptian smiting, slew him)                           [THREAD 2]
--        Tanakh: John 1:11 (came unto his own, his own received him not) — first-rejection type [THREAD 2]
--   v.13-14 (the second day; "Who made thee a prince and a judge?"; the thing is known)
--        NT:     Acts 7:26-28 (next day, set them at one, thrust away); Hebrews 11:27 (forsook Egypt) [THREAD 2]
--        Extras: Jubilees 47:11 ("Who made you a prince and a judge over us?")                  [THREAD 2]
--        Tanakh: covered by thread frame
--   v.15 (Pharaoh seeks to slay; Moses flees to Midian; sits by a well)
--        NT:     Acts 7:29 (fled, a stranger in Madian)                                        [THREAD 2 / 3]
--        Extras: Jubilees 47:11 (did fear and flee)                                            [THREAD 2]
--        Tanakh: none warranted
--   v.16-22 (Midian, Reuel's daughters, Zipporah, Gershom "a stranger in a strange land")
--        NT:     Hebrews 11:13 (strangers and pilgrims on the earth)                           [THREAD 3]
--        Extras: none warranted (Jasher/Jubilees Midian material is sprawling; kept restrained)
--        Tanakh: Psalm 39:12 (I am a stranger with thee, a sojourner, as all my fathers were)  [THREAD 3]
--   v.23 (king of Egypt died; Yashar'el sighed, cried, their cry came up unto Elohim)
--        NT:     Luke 1:72-73 (to remember his holy covenant, the oath sworn to Abraham)       [THREAD 4]
--        Extras: none warranted
--        Tanakh: Exodus 6:5 (I have heard their groaning, remembered my covenant)             [THREAD 4]
--   v.24 (Elohim heard their groaning, remembered his covenant with Abraham, Isaac, Jacob)
--        NT:     Luke 1:72-73 (remember his holy covenant)                                     [THREAD 4]
--        Extras: none warranted
--        Tanakh: Genesis 15:13-14 (the four-hundred-year affliction foretold, then judged);
--                Exodus 6:5; Psalm 105:8-10,42 (he hath remembered his covenant for ever)     [THREAD 4]
--   v.25 (Elohim looked upon the children of Yashar'el and had respect unto them)
--        NT:     Luke 1:72-73                                                                  [THREAD 4]
--        Extras: none warranted
--        Tanakh: Psalm 105:42 (he remembered his holy promise, and Abraham his servant)       [THREAD 4]
--
-- Threads (slug — target libraries):
--   1. exodus-2-an-ark-of-bulrushes-drawn-out-of-the-water        — NT (Hebrews, Acts) + Extras (Jubilees, Jasher)   tier=extras
--   2. exodus-2-the-deliverer-rejected-by-his-brethren-at-the-first — NT (Hebrews, Acts) + Tanakh (John) + Extras (Jubilees) tier=extras
--   3. exodus-2-a-stranger-in-a-strange-land                      — NT (Hebrews) + Tanakh (Psalm)                    tier=free
--   4. exodus-2-elohim-remembered-his-covenant-with-abraham       — Tanakh (Genesis, Exodus, Psalm) + NT (Luke)       tier=free
--
-- Framework-load-bearing framing:
--   THREAD 1: the deliverer preserved THROUGH the water by faith — tebah (ark), the same word as
--     Noah's ark, bearing the seed-of-promise through the death-decree: preservation-through-judgment.
--   THREAD 2: the deliverer comes to his own brethren and is REFUSED at the first — the two-visits /
--     first-rejection type (Joseph before him, Messiah after, John 1:11). The reproach of Messiah is
--     already upon Moses (Heb 11:26).
--   THREAD 4 (★★ the heart of the chapter): the covenant REMEMBERED — Yahuah's covenant-faithfulness
--     to Abraham, Yitschaq (Isaac), and Yaaqob (Jacob) is what drives the whole Exodus; not Israel's
--     merit but the oath sworn to the fathers (Gen 15, Ps 105, Luke 1).

CREATE TEMP VIEW _s305_ex02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: an ark of bulrushes, drawn out of the water (vv.2-3, 10)
    ('canon','exodus',2,2,'canon','hebrews',11,23,'free',
     E'*By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment* (Hebrews 11:23). The hiding of *a goodly child* who *she hid... three months* (Exodus 2:2) is read as an act of faith — the parents defying *the king''s commandment* to drown the sons, trusting Yahuah to preserve the seed.'),
    ('canon','exodus',2,2,'canon','acts',7,20,'free',
     E'*In which time Moses was born, and was exceeding fair, and nourished up in his father''s house three months* (Acts 7:20). Stephen reads the same *goodly child* whom *she hid... three months* (Exodus 2:2) — the deliverer cherished and hidden in the father''s house under the death-decree.'),
    ('canon','exodus',2,3,'canon','acts',7,21,'free',
     E'*And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son* (Acts 7:21). The child set adrift in *an ark of bulrushes, and daubed it with slime and with pitch* (Exodus 2:3) is the one *cast out* yet drawn up — preserved through the very water the decree meant to drown him in.'),
    ('canon','exodus',2,3,'jubilees','jubilees',47,4,'extras',
     E'*And she made an ark for you, and covered it with pitch and asphalt, and placed it in the flags on the bank of the river, and she placed you in it seven days, and your mother came by night and suckled you, and by day Miriam, your sister, guarded you from the birds* (Jubilees 47:4). Jubilees retells the same *ark of bulrushes... daubed... with slime and with pitch* in *the flags by the river''s brink* (Exodus 2:3), adding the seven days and the mother''s nightly nursing.'),
    ('canon','exodus',2,3,'jasher','jasher',68,13,'extras',
     E'*And the woman hastened to take away her son before the officers came, and she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child in it, and she laid it in the flags by the river''s brink* (Jasher 68:13). Jasher echoes *an ark of bulrushes... in the flags by the river''s brink* (Exodus 2:3) almost word for word — a second witness to the ark (tebah, Noah''s very word) bearing the seed through the waters of judgment.'),
    ('canon','exodus',2,10,'jubilees','jubilees',47,6,'extras',
     E'*And she took you out of the ark, and she had compassion on you* (Jubilees 47:6). The naming *Because I drew him out of the water* (Exodus 2:10) is mirrored where Pharaoh''s daughter *took you out of the ark* and *had compassion* — the drawn-out one preserved through the water.'),

    -- THREAD 2: the deliverer rejected by his brethren at the first (vv.11-15)
    ('canon','exodus',2,11,'canon','hebrews',11,24,'free',
     E'*By faith Moses, when he was come to years, refused to be called the son of Pharaoh''s daughter; choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season* (Hebrews 11:24-25). When Moses *was grown... went out unto his brethren, and looked on their burdens* (Exodus 2:11), he was refusing Egypt and choosing his afflicted people — the deliverer casting his lot with the bondsmen.'),
    ('canon','exodus',2,11,'canon','hebrews',11,26,'free',
     E'*Esteeming the reproach of Messiah (Christ) greater riches than the treasures in Egypt: for he had respect unto the recompence of the reward* (Hebrews 11:26). Already on Moses, going out *unto his brethren* (Exodus 2:11), rests *the reproach of Messiah* — the type of the Anointed Deliverer who comes to his own in their affliction.'),
    ('canon','exodus',2,11,'canon','acts',7,23,'free',
     E'*And when he was full forty years old, it came into his heart to visit his brethren the children of Yashar''el (Israel)* (Acts 7:23). Stephen frames *he went out unto his brethren, and looked on their burdens* (Exodus 2:11) as the deliverer''s first visit to his own people.'),
    ('canon','exodus',2,12,'jubilees','jubilees',47,10,'extras',
     E'*And you were three weeks of years at court until the time when you did go forth from the royal court and did see an Egyptian smiting your friend who was of the children of Yashar''el (Israel), and you did slay him and hide him in the sand* (Jubilees 47:10). Jubilees retells *he slew the Egyptian, and hid him in the sand* (Exodus 2:12) — the deliverer''s first stroke against the oppressor of his brethren.'),
    ('canon','exodus',2,14,'canon','acts',7,25,'free',
     E'*For he supposed his brethren would have understood how that Elohim (God) by his hand would deliver them: but they understood not* (Acts 7:25). The taunt *Who made thee a prince and a judge over us?* (Exodus 2:14) is the rejection Stephen names — the deliverer refused by the very brethren he came to save: *but they understood not.*'),
    ('canon','exodus',2,14,'canon','acts',7,27,'free',
     E'*But he that did his neighbour wrong thrust him away, saying, Who made thee a ruler and a judge over us?* (Acts 7:27). Stephen quotes the very words of Exodus 2:14 — *Who made thee a prince and a judge over us?* — as the pattern of Israel''s repeated thrusting-away of the one sent to deliver them.'),
    ('canon','exodus',2,14,'canon','john',1,11,'free',
     E'*He came unto his own, and his own received him not* (John 1:11). The rejection *Who made thee a prince and a judge over us?* (Exodus 2:14) is the first-coming type that John names of Messiah — the deliverer who comes to his own brethren and is refused at the first, as Joseph was before him.'),
    ('canon','exodus',2,14,'jubilees','jubilees',47,11,'extras',
     E'*And on the second day you did find two of the children of Yashar''el (Israel) striving together, and you did say to him who was doing the wrong: "Why do you smite your brother?" And he was angry and indignant, and said "Who made you a prince and a judge over us? Thinkest you to kill me as you killedst the Egyptian yesterday?" And you did fear and flee on account of these words* (Jubilees 47:11). Jubilees carries *Who made thee a prince and a judge over us?* and the flight of Exodus 2:14-15 — the rejected deliverer driven out.'),
    ('canon','exodus',2,15,'canon','acts',7,29,'free',
     E'*Then fled Moses at this saying, and was a stranger in the land of Madian, where he begat two sons* (Acts 7:29). *Moses fled from the face of Pharaoh, and dwelt in the land of Midian* (Exodus 2:15) — the refused deliverer goes into exile among strangers before he is sent back to redeem.'),

    -- THREAD 3: a stranger in a strange land (vv.16-22)
    ('canon','exodus',2,22,'canon','hebrews',11,13,'free',
     E'*These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). Moses naming his son Gershom — *I have been a stranger in a strange land* (Exodus 2:22) — joins the fathers'' confession that they were *strangers and pilgrims*, sojourners awaiting the covenant land.'),
    ('canon','exodus',2,22,'canon','psalms',39,12,'free',
     E'*Hear my prayer, O Yahuah (LORD), and give ear unto my cry; hold not thy peace at my tears: for I am a stranger with thee, and a sojourner, as all my fathers were* (Psalm 39:12). The cry *I have been a stranger in a strange land* (Exodus 2:22) is the same sojourner''s confession the psalmist makes — *a stranger... and a sojourner, as all my fathers were.*'),

    -- THREAD 4: Elohim remembered his covenant with Abraham (vv.23-25)
    ('canon','exodus',2,23,'canon','exodus',6,5,'free',
     E'*And I have also heard the groaning of the children of Yashar''el (Israel), whom the Egyptians keep in bondage; and I have remembered my covenant* (Exodus 6:5). When *their cry came up unto Elohim by reason of the bondage* (Exodus 2:23), Yahuah answers in his own voice in the next chapter of the deliverance — *I have heard... and I have remembered my covenant.*'),
    ('canon','exodus',2,23,'canon','luke',1,72,'free',
     E'*To perform the mercy promised to our fathers, and to remember his holy covenant; the oath which he sware to our father Abraham* (Luke 1:72-73). The cry that *came up unto Elohim* (Exodus 2:23) is heard as the covenant-mercy is — Zacharias sings the same remembering: *to remember his holy covenant; the oath which he sware to our father Abraham.*'),
    ('canon','exodus',2,24,'canon','genesis',15,13,'free',
     E'*And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years; and also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:13-14). When *Elohim remembered his covenant with Abraham, with Isaac, and with Jacob* (Exodus 2:24), he is keeping the very word cut with Abraham — the bondage foretold, the nation to be judged, the coming-out assured.'),
    ('canon','exodus',2,24,'canon','genesis',15,14,'free',
     E'*And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14). The covenant *remembered... with Abraham, with Isaac, and with Jacob* (Exodus 2:24) carries this promise of judgment-on-Egypt and exodus-with-substance — the Exodus is the keeping of Genesis 15.'),
    ('canon','exodus',2,24,'canon','psalms',105,8,'free',
     E'*He hath remembered his covenant for ever, the word which he commanded to a thousand generations. Which covenant he made with Abraham, and his oath unto Isaac; and confirmed the same unto Jacob for a law, and to Yashar''el (Israel) for an everlasting covenant* (Psalm 105:8-10). The psalm sings exactly what Exodus 2:24 records — that *Elohim remembered his covenant with Abraham, with Isaac, and with Jacob*, an *everlasting covenant* to the seed.'),
    ('canon','exodus',2,25,'canon','psalms',105,42,'free',
     E'*For he remembered his holy promise, and Abraham his servant* (Psalm 105:42). That *Elohim looked upon the children of Yashar''el, and Elohim had respect unto them* (Exodus 2:25) is the psalm''s refrain of the Exodus — the deliverance flowed not from Israel''s merit but because *he remembered his holy promise, and Abraham his servant.*')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-2-an-ark-of-bulrushes-drawn-out-of-the-water',
       E'An Ark of Bulrushes, Drawn Out of the Water',
       E'Pharaoh''s decree drowns the Hebrew sons in the river, and into that very water the deliverer is committed — but committed in an *ark*. *And when she could not longer hide him, she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child therein; and she laid it in the flags by the river''s brink* (Exodus 2:3). The word here is **tebah** — the same word as Noah''s ark: a vessel of pitch-sealed wood bearing the seed of promise safely through the waters of judgment. The hiding is read as faith: *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment* (Hebrews 11:23). Stephen tells it the same: *In which time Moses was born, and was exceeding fair, and nourished up in his father''s house three months: and when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son* (Acts 7:20-21). The restored witnesses retell it in full — *And she made an ark for you, and covered it with pitch and asphalt, and placed it in the flags on the bank of the river* (Jubilees 47:4), and Jasher echoes Exodus almost word for word: *she took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child in it, and she laid it in the flags by the river''s brink* (Jasher 68:13). The chapter names the whole pattern when Pharaoh''s daughter draws him up: *And she called his name Moses: and she said, Because I drew him out of the water* (Exodus 2:10). This is the type of preservation-through-judgment — the deliverer carried alive through the very flood meant to destroy him.',
       sv.verse_id, ev.verse_id, 'extras', 29025
  FROM _s305_ex02_lookup sv, _s305_ex02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-2-the-deliverer-rejected-by-his-brethren-at-the-first',
       E'The Deliverer Rejected by His Brethren at the First',
       E'When Moses is grown he goes down to the bondsmen and casts his lot with them: *And it came to pass in those days, when Moses was grown, that he went out unto his brethren, and looked on their burdens: and he spied an Egyptian smiting an Hebrew, one of his brethren* (Exodus 2:11). Hebrews reads this as the great refusal — *By faith Moses, when he was come to years, refused to be called the son of Pharaoh''s daughter; choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season; esteeming the reproach of Messiah (Christ) greater riches than the treasures in Egypt* (Hebrews 11:24-26). The reproach of the Anointed already rests on him. Yet his own do not know him. Stephen names the wound: *For he supposed his brethren would have understood how that Elohim (God) by his hand would deliver them: but they understood not* (Acts 7:25), and they thrust him away with the very words Exodus records — *But he that did his neighbour wrong thrust him away, saying, Who made thee a ruler and a judge over us?* (Acts 7:27; Exodus 2:14). This is the first-rejection type that runs through the whole canon: as Joseph was sold by his brothers before he saved them, so the deliverer comes to his own and is refused at the first — *He came unto his own, and his own received him not* (John 1:11). The restored witness carries it too: *Who made you a prince and a judge over us?... And you did fear and flee on account of these words* (Jubilees 47:11). So *Moses fled from the face of Pharaoh, and dwelt in the land of Midian* (Exodus 2:15) — the rejected deliverer goes into exile, to be sent back in Yahuah''s time to redeem the very people who refused him.',
       sv.verse_id, ev.verse_id, 'extras', 29028
  FROM _s305_ex02_lookup sv, _s305_ex02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-2-a-stranger-in-a-strange-land',
       E'A Stranger in a Strange Land',
       E'In Midian Moses marries Zipporah and names his firstborn out of his own exile: *And she bare him a son, and he called his name Gershom: for he said, I have been a stranger in a strange land* (Exodus 2:22). The name is the confession of every covenant sojourner — that this present land is not yet the inheritance. The psalmist prays it in the same words: *Hear my prayer, O Yahuah (LORD), and give ear unto my cry; hold not thy peace at my tears: for I am a stranger with thee, and a sojourner, as all my fathers were* (Psalm 39:12). And Hebrews gathers the whole line of the fathers into it: *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). Moses the exile in Midian stands in that company — a stranger in a strange land, holding to the covenant promise from afar.',
       sv.verse_id, ev.verse_id, 'free', 29031
  FROM _s305_ex02_lookup sv, _s305_ex02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=2 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-2-elohim-remembered-his-covenant-with-abraham',
       E'Elohim Remembered His Covenant with Abraham',
       E'The chapter ends not with Moses but with Yahuah — and the engine of the whole Exodus is named in three verses: *And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage. And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob. And Elohim (God) looked upon the children of Yashar''el (Israel), and Elohim (God) had respect unto them* (Exodus 2:23-25). The deliverance is not earned by Israel''s righteousness; it is driven by Yahuah''s covenant-faithfulness to the fathers. It is the keeping of the word cut with Abraham long before: *Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years; and also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:13-14). Yahuah says it again in his own voice in the next chapter of the redemption: *I have also heard the groaning of the children of Yashar''el (Israel), whom the Egyptians keep in bondage; and I have remembered my covenant* (Exodus 6:5). The Psalter sings it as the ground of the whole history: *He hath remembered his covenant for ever, the word which he commanded to a thousand generations. Which covenant he made with Abraham, and his oath unto Isaac; and confirmed the same unto Jacob for a law, and to Yashar''el (Israel) for an everlasting covenant* (Psalm 105:8-10), *for he remembered his holy promise, and Abraham his servant* (Psalm 105:42). And the song of Zacharias at the dawn of the greater redemption is the very same remembering: *To perform the mercy promised to our fathers, and to remember his holy covenant; the oath which he sware to our father Abraham* (Luke 1:72-73). The covenant remembered is the spine of the canon — Yahuah keeps his oath to the seed.',
       sv.verse_id, ev.verse_id, 'free', 29034
  FROM _s305_ex02_lookup sv, _s305_ex02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=2 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=2 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',2,2,'canon','hebrews',11,23,1,E'*By faith Moses, when he was born, was hid three months of his parents... and they were not afraid of the king''s commandment* (Hebrews 11:23) — the hiding of the *goodly child* (Exodus 2:2) is faith defying the death-decree.'),
    ('exodus',2,2,'canon','acts',7,20,2,E'*Moses was born, and was exceeding fair, and nourished up in his father''s house three months* (Acts 7:20) — Stephen on the *goodly child* whom *she hid... three months* (Exodus 2:2).'),
    ('exodus',2,3,'canon','acts',7,21,3,E'*And when he was cast out, Pharaoh''s daughter took him up, and nourished him for her own son* (Acts 7:21) — the child set in the *ark of bulrushes* (Exodus 2:3), cast out yet drawn up.'),
    ('exodus',2,3,'jubilees','jubilees',47,4,4,E'*And she made an ark for you, and covered it with pitch and asphalt, and placed it in the flags on the bank of the river* (Jubilees 47:4) — the same *ark... daubed... with slime and with pitch* in *the flags* (Exodus 2:3).'),
    ('exodus',2,3,'jasher','jasher',68,13,5,E'*She took for him an ark of bulrushes, and daubed it with slime and with pitch, and put the child in it, and she laid it in the flags by the river''s brink* (Jasher 68:13) — a near word-for-word second witness to Exodus 2:3 (the tebah, Noah''s very word).'),
    ('exodus',2,10,'jubilees','jubilees',47,6,6,E'*And she took you out of the ark, and she had compassion on you* (Jubilees 47:6) — mirrors *Because I drew him out of the water* (Exodus 2:10).')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-2-an-ark-of-bulrushes-drawn-out-of-the-water'
  JOIN _s305_ex02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',2,11,'canon','hebrews',11,24,1,E'*By faith Moses... refused to be called the son of Pharaoh''s daughter; choosing rather to suffer affliction with the people of Elohim* (Hebrews 11:24-25) — going out *unto his brethren* (Exodus 2:11) was the refusal of Egypt.'),
    ('exodus',2,11,'canon','hebrews',11,26,2,E'*Esteeming the reproach of Messiah (Christ) greater riches than the treasures in Egypt* (Hebrews 11:26) — the reproach of the Anointed already on Moses among *his brethren* (Exodus 2:11).'),
    ('exodus',2,11,'canon','acts',7,23,3,E'*It came into his heart to visit his brethren the children of Yashar''el* (Acts 7:23) — the deliverer''s first visit to his own (Exodus 2:11).'),
    ('exodus',2,12,'jubilees','jubilees',47,10,4,E'*You did see an Egyptian smiting your friend... and you did slay him and hide him in the sand* (Jubilees 47:10) — retelling *he slew the Egyptian, and hid him in the sand* (Exodus 2:12).'),
    ('exodus',2,14,'canon','acts',7,25,5,E'*He supposed his brethren would have understood how that Elohim by his hand would deliver them: but they understood not* (Acts 7:25) — the rejection behind *Who made thee a prince and a judge?* (Exodus 2:14).'),
    ('exodus',2,14,'canon','acts',7,27,6,E'*But he that did his neighbour wrong thrust him away, saying, Who made thee a ruler and a judge over us?* (Acts 7:27) — Stephen quotes Exodus 2:14 as the pattern of thrusting-away.'),
    ('exodus',2,14,'canon','john',1,11,7,E'*He came unto his own, and his own received him not* (John 1:11) — the first-rejection type of *Who made thee a prince and a judge over us?* (Exodus 2:14).'),
    ('exodus',2,14,'jubilees','jubilees',47,11,8,E'*Who made you a prince and a judge over us?... And you did fear and flee on account of these words* (Jubilees 47:11) — the rejected deliverer driven out (Exodus 2:14-15).'),
    ('exodus',2,15,'canon','acts',7,29,9,E'*Then fled Moses at this saying, and was a stranger in the land of Madian* (Acts 7:29) — the refused deliverer goes into exile (Exodus 2:15).')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-2-the-deliverer-rejected-by-his-brethren-at-the-first'
  JOIN _s305_ex02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',2,22,'canon','hebrews',11,13,1,E'*Strangers and pilgrims on the earth* (Hebrews 11:13) — the fathers'' confession that Gershom''s name echoes: *I have been a stranger in a strange land* (Exodus 2:22).'),
    ('exodus',2,22,'canon','psalms',39,12,2,E'*For I am a stranger with thee, and a sojourner, as all my fathers were* (Psalm 39:12) — the same sojourner''s confession as *a stranger in a strange land* (Exodus 2:22).')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-2-a-stranger-in-a-strange-land'
  JOIN _s305_ex02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',2,23,'canon','exodus',6,5,1,E'*I have also heard the groaning of the children of Yashar''el... and I have remembered my covenant* (Exodus 6:5) — Yahuah''s answer to the cry that *came up unto Elohim* (Exodus 2:23).'),
    ('exodus',2,23,'canon','luke',1,72,2,E'*To remember his holy covenant; the oath which he sware to our father Abraham* (Luke 1:72-73) — the same covenant-remembering the cry of Exodus 2:23 sets in motion.'),
    ('exodus',2,24,'canon','genesis',15,13,3,E'*Thy seed shall be a stranger in a land that is not theirs... and afterward shall they come out with great substance* (Genesis 15:13-14) — the word cut with Abraham that Exodus 2:24''s remembered covenant keeps.'),
    ('exodus',2,24,'canon','genesis',15,14,4,E'*That nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14) — the judgment-and-exodus promised, carried in the covenant *remembered* (Exodus 2:24).'),
    ('exodus',2,24,'canon','psalms',105,8,5,E'*He hath remembered his covenant for ever... which covenant he made with Abraham, and his oath unto Isaac; and confirmed the same unto Jacob* (Psalm 105:8-10) — the psalm singing Exodus 2:24''s covenant with Abraham, Isaac, and Jacob.'),
    ('exodus',2,25,'canon','psalms',105,42,6,E'*For he remembered his holy promise, and Abraham his servant* (Psalm 105:42) — the ground of *Elohim had respect unto them* (Exodus 2:25): not merit but the oath to the fathers.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-2-elohim-remembered-his-covenant-with-abraham'
  JOIN _s305_ex02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
