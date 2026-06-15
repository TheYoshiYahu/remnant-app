-- ----- fragment: minion_psalms_110.sql (Psalm 110) -----
-- Chapter: Psalm 110 — THE PRIEST-KING PSALM, the most-quoted Tanakh chapter in the New Testament: "Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool" (v.1, the Father speaking to the Formed Son enthroned); "Yahuah shall send the rod of thy strength out of Zion" (v.2); the willing people in the day of his power and the dew of his youth (v.3); "Yahuah hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)" (v.4, the sworn, unchangeable priesthood); and the day of wrath — Yahuah at thy right hand striking through kings, judging the heathen, lifting up the head (v.5-7).
-- Tag: ps110   Temp view: _s302_ps110_lookup
-- Sort band: base 24725, step 3 -> threads at 24725, 24728, 24731, 24734, 24737, 24740, 24743 (7 threads)
-- Source of EVERY row: 'canon','psalms',110,v
--
-- Psalm 110 coverage:
--   ★★ v.1 (Yahuah said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool)
--        NT:     Matthew 22:44 + Matthew 22:45 (Yahusha's own question — if David call him Lord, how is he his son?); Mark 12:36; Luke 20:42-43; Acts 2:34-35 (Kepha/Peter at Pentecost); Hebrews 1:13 — THREAD 1 (load-bearing: the Father speaks to the Formed Son enthroned)
--        Extras: 1 Enoch 61:8 (the Head of Days placed the Elect One on the throne of His glory); 1 Enoch 62:7 (This is the Son of Adam who is born unto righteousness) — THREAD 1 (the Elect One / Son of Adam seated on the throne of glory to judge)
--        Tanakh: Psalm 2:6 (Yet have I set my king upon my holy hill of Zion) carried to THREAD 2; the right-hand enthronement is the NT weight of THREAD 1
--   ★★★ v.4 (Yahuah hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek))
--        NT:     Hebrews 5:6; Hebrews 5:10; Hebrews 6:20; Hebrews 7:17; Hebrews 7:21 (the whole sworn, unchangeable Melchizedek priesthood) — THREAD 4 (priest) + THREAD 5 (the oath / unchangeable priesthood)
--        Extras: none warranted clean (2 Enoch Melchizedek-birth narrative is in the flagged pseudepigrapha-charles-vol2 parse and dump_canon returns NOT FOUND / apparatus-uncertain for the relevant chapter — NOT forced, per brief)
--        Tanakh: ★ Genesis 14:18 (Melek Tsadiq king of Salem brought forth bread and wine: and he was the priest of the El Elyon) — THREAD 4 (the root order of the priest-king who blessed Abraham)
--   ★ v.2 (Yahuah shall send the rod of thy strength out of Zion: rule thou in the midst of thine enemies)
--        NT:     none warranted distinct (the rule-in-Zion is carried by THREAD 1's enthronement and THREAD 7's day-of-wrath; not forced)
--        Extras: none warranted
--        Tanakh: ★ Psalm 2:6 (Yet have I set my king upon my holy hill of Zion); Psalm 2:9 (Thou shalt break them with a rod of iron) — THREAD 2 (the rod out of Zion = the enthroned rule)
--   v.3 (Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning: thou hast the dew of thy youth)
--        NT:     none warranted distinct (the willing people forward-weave is held to THREAD 3 prose)
--        Extras: none warranted
--        Tanakh: ★ Judges 5:2 (when the people willingly offered themselves) — THREAD 3 (the willing people in the day of his power; the gathered willing army of Yahuah)
--   ★★ v.5-7 (Yahuah at thy right hand shall strike through kings in the day of his wrath. He shall judge among the heathen... He shall drink of the brook in the way: therefore shall he lift up the head)
--        NT:     1 Corinthians 15:25 (For he must reign, till he hath put all enemies under his feet) — THREAD 6 (the reign that subdues every enemy — the footstool of v.1 completed); Revelation 19 day-of-wrath candidate held to THREAD 7 prose only (clean Revelation text out of assigned target set, not forced as a member)
--        Extras: none warranted clean
--        Tanakh: ★ Psalm 2:1-2 (the heathen rage... the kings of the earth set themselves) — THREAD 7 (the judgment of the kings and the heathen in the day of wrath; the lifted-up head = the seed-war victory)
--
-- Threads (slug — target libraries):
--   1. psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool — NT (Matthew, Mark, Luke, Acts, Hebrews) + Extras (1 Enoch) [extras] (★★ the Father speaks to the Formed Son enthroned; Yahusha's own question)
--   2. psalm-110-the-rod-of-thy-strength-out-of-zion-rule-in-the-midst-of-thine-enemies — Tanakh (Psalm 2) [free] (★ the rod out of Zion = the enthroned rule)
--   3. psalm-110-thy-people-shall-be-willing-in-the-day-of-thy-power — Tanakh (Judges 5) [free] (the gathered willing people)
--   4. psalm-110-a-priest-for-ever-after-the-order-of-melek-tsadiq — NT (Hebrews 5, 6, 7) + Tanakh (Genesis 14) [free] (★★★ the priest-king; the order of the one who blessed Abraham)
--   5. psalm-110-yahuah-hath-sworn-and-will-not-repent-the-oath-and-the-unchangeable-priesthood — NT (Hebrews 7) [free] (★★ the sworn, unchangeable priesthood, never abrogated)
--   6. psalm-110-he-must-reign-till-he-hath-put-all-enemies-under-his-feet — NT (1 Corinthians 15) [free] (★★ the reign that completes the footstool of v.1)
--   7. psalm-110-the-day-of-his-wrath-he-shall-judge-among-the-heathen-and-lift-up-the-head — Tanakh (Psalm 2) [free] (★★ the judgment of the kings and the heathen; the lifted-up head = the seed-war victory)
--
-- Framing notes:
--   ★★ THE FORMED AND THE FORMLESS — v.1 (THREAD 1): *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (110:1). Read strictly through Red Line #4: the Father (Yahuah, the formless Source) speaks TO the Formed Son — David's *Lord*, who is also David's son after the flesh — and seats Him at His right hand. The two are NAMED DISTINCTLY in the one verse: *Yahuah* and *my Lord*. Yahusha presses exactly this in His own question: *If David then call him Yahuah (Lord), how is he his son?* (Matthew 22:45) — the Messiah is David's son after the flesh AND David's Lord enthroned at Yahuah's right hand. NO co-equal-persons trinitarian abstraction (the verse gives a speaker and a One spoken to, not one essence in three persons); NO modalist collapse (they are not the same one talking to Himself). The verse itself gives the Father and the Formed Son. Kepha (Peter) preaches it at Pentecost (Acts 2:34-35); Hebrews sets it over the angels (Hebrews 1:13).
--   ★★★ THE PRIEST-KING — v.4 (THREADS 4-5): *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (110:4). The Formed Son enthroned as king (v.1-3) is ALSO the eternal priest (v.4) — both offices in one person, after the order of the one who met Abraham: *Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18). Hebrews builds the whole argument on this psalm: a priesthood sworn by Yahuah's own oath (*Yahuah (Lord) sware and will not repent* — Hebrews 7:21), unchangeable (*this man, because he continueth ever, hath an unchangeable priesthood* — Hebrews 7:24), not after Aaron. This is NOT the Levitical order replaced by lawlessness — it is the older, sworn, royal priesthood the Aaronic always pointed toward; the priesthood that never ends because the Priest never dies.
--   ★★ THE FOOTSTOOL COMPLETED — v.5-7 (THREADS 6-7): *Yahuah (Lord) at thy right hand shall strike through kings in the day of his wrath. He shall judge among the heathen... therefore shall he lift up the head* (110:5-7). Sha''ul (Paul) names the reign that fulfils the footstool of v.1: *For he must reign, till he hath put all enemies under his feet* (1 Corinthians 15:25) — the *until I make thine enemies thy footstool* worked out to the end, the last enemy death destroyed. The day of wrath and the judgment of the heathen echo *Why do the heathen rage... the kings of the earth set themselves... against Yahuah, and against his anointed* (Psalm 2:1-2) — the same kings, the same anointed, the lifted-up head the seed-war victory of Genesis 3:15.
--   EXTRAS: 1 Enoch carries the enthronement of the Elect One / Son of Adam: *the Head of Days placed the Elect One on the throne of His glory; and he shall judge all the works of the holy in heaven above* (1 Enoch 61:8) and *This is the Son of Adam who is born unto righteousness* (1 Enoch 62:7) — the same right-hand-enthroned, judging figure of Psalm 110:1, woven into THREAD 1 (edition 'enoch', book '1-enoch'; verses 61:8 and 62:7 are clean parse — 62:5 carries an editorial "(Note:...)" and is deliberately NOT used). 2 Enoch's Melchizedek-birth narrative was weighed for v.4 but is in the flagged pseudepigrapha-charles-vol2 parse and dump_canon returns NOT FOUND for the relevant chapter — recorded "none warranted", NOT forced, per the brief's apparatus-noise rule.
--   VERSES WITH FRAMING-ONLY / HELD-IN-PROSE: Revelation 19 (the wrath of the Almighty) weighed for v.5-7 but the clean Revelation text is outside the assigned target set — held in THREAD 7's prose, not forced as a member. v.3's *beauties of holiness from the womb of the morning... the dew of thy youth* kept with the willing-people weight (THREAD 3) rather than split into a separate obscure-image thread.

CREATE TEMP VIEW _s302_ps110_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Sit thou at my right hand — the Father speaks to the Formed Son enthroned
    ('canon','psalms',110,1,'canon','matthew',22,44,'free',
      E'*Yahuah (LORD) said unto my Lord, Sit thou on my right hand, till I make thine enemies thy footstool?* (Matthew 22:44). Yahusha (Jesus) quotes this very verse against the scribes and turns it into the question that silences them: *What think ye of Messiah (Christ)? whose son is he?* (Matthew 22:42). The psalm names two distinctly — *Yahuah (LORD)* and *my Lord* (Psalm 110:1) — the Father speaking to the One He seats at His right hand. Read through the Formed and the Formless: the Father (Yahuah, the formless Source) speaks to the Formed Son, David''s Lord enthroned, who is also David''s son after the flesh.'),
    ('canon','psalms',110,1,'canon','matthew',22,45,'free',
      E'*If David then call him Yahuah (Lord), how is he his son?* (Matthew 22:45). This is Yahusha''s (Jesus'') own reading of *Yahuah (LORD) said unto my Lord* (Psalm 110:1): the Messiah is at once David''s son after the flesh AND David''s *Lord* enthroned at Yahuah''s right hand. The riddle is only answered by the Formed Son — born of David''s line, yet the One the Father seats beside Himself; no flat son-of-David, no co-equal-persons abstraction, but the Son drawn from the Formless given the throne.'),
    ('canon','psalms',110,1,'canon','mark',12,36,'free',
      E'*For David himself said by the Ruach HaKodesh (Holy Spirit), Yahuah (LORD) said to my Lord, Sit thou on my right hand, till I make thine enemies thy footstool* (Mark 12:36). Mark keeps the same scene: David, moved by the Ruach HaKodesh (Holy Spirit), speaks *Yahuah (LORD) said to my Lord* (Psalm 110:1) — and so calls his own descendant *Lord*. The Father seats the Formed Son at His right hand; the enemies are made the footstool by the One who speaks, not by the One enthroned.'),
    ('canon','psalms',110,1,'canon','luke',20,42,'free',
      E'*And David himself saith in the book of Psalms, Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Luke 20:42). Luke names the source outright — *the book of Psalms* — and lets David''s own word stand: *Yahuah (LORD) said unto my Lord* (Psalm 110:1). The Father addresses the Son He enthrones; the very grammar of the verse holds the Formed and the Formless apart while seating them in one rule.'),
    ('canon','psalms',110,1,'canon','luke',20,43,'free',
      E'*Till I make thine enemies thy footstool* (Luke 20:43). The completing line of the enthronement word — *until I make thine enemies thy footstool* (Psalm 110:1) — is the Father''s pledge to the Son He has seated: the rule is granted, the subduing of the enemies is the Father''s own act on the Son''s behalf, *till I make*. The Formed Son reigns; the Father puts all foes beneath His feet.'),
    ('canon','psalms',110,1,'canon','acts',2,34,'free',
      E'*For David is not ascended into the heavens: but he saith himself, Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Acts 2:34). Kepha (Peter) preaches this psalm at Pentecost: David did not ascend, so the *my Lord* of *Yahuah (LORD) said unto my Lord* (Psalm 110:1) is not David but his greater Son — *Therefore being by the right hand of Elohim (God) exalted* (Acts 2:33). The Formed Son raised and seated at the Father''s right hand is the proof that He is *both Lord and Messiah* (Acts 2:36).'),
    ('canon','psalms',110,1,'canon','acts',2,35,'free',
      E'*Until I make thy foes thy footstool* (Acts 2:35). Kepha (Peter) carries the whole enthronement word — *Sit thou on my right hand, until I make thy foes thy footstool* (Acts 2:34-35) — straight from *until I make thine enemies thy footstool* (Psalm 110:1). The exalted Son waits at the right hand while the Father subdues every foe; the footstool is the Father''s pledge, the right hand the Son''s seat.'),
    ('canon','psalms',110,1,'canon','hebrews',1,13,'free',
      E'*But to which of the angels said he at any time, Sit on my right hand, until I make thine enemies thy footstool?* (Hebrews 1:13). The letter sets the Formed Son over every angel by this very verse: to no angel was it ever said *Sit on my right hand* — that word is spoken only to the Son of *Yahuah (LORD) said unto my Lord, Sit thou at my right hand* (Psalm 110:1). The enthroned One is not a ministering spirit but the Heir, seated where the Father seats Him alone.'),
    ('canon','psalms',110,1,'enoch','1-enoch',61,8,'extras',
      E'*And the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance* (1 Enoch 61:8). The restored witness shows the same enthronement as *Sit thou at my right hand* (Psalm 110:1): the Head of Days (the Father) sets the Elect One on the throne of glory to judge — the chosen One seated by the Most High''s own act, the Formed One given the seat of rule and judgement.'),
    ('canon','psalms',110,1,'enoch','1-enoch',62,7,'extras',
      E'*And Yahuah (God) of Spirits said: "This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not."* (1 Enoch 62:7). The restored witness names the enthroned One the *Son of Adam* — David''s son after the flesh in the seed-of-Adam line — yet seated to judge by Yahuah (God) of Spirits, the very paradox of *Yahuah (LORD) said unto my Lord* (Psalm 110:1): the One of Adam''s seed who is also the Lord enthroned at the right hand.'),

    -- THREAD 2 (★): The rod of thy strength out of Zion — rule in the midst of thine enemies
    ('canon','psalms',110,2,'canon','psalms',2,6,'free',
      E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). The rod sent *out of Zion* — *Yahuah (LORD) shall send the rod of thy strength out of Zion: rule thou in the midst of thine enemies* (Psalm 110:2) — is the same enthroned king Yahuah sets *upon my holy hill of Zion*. The seat of the rule is Zion; from the holy hill the king reigns, and his strength goes out from the place Yahuah has chosen for His anointed.'),
    ('canon','psalms',110,2,'canon','psalms',2,9,'free',
      E'*Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9). The *rod of thy strength* of *rule thou in the midst of thine enemies* (Psalm 110:2) is the same rod given the anointed king — *a rod of iron* to break the raging nations. The rule out of Zion is no gentle suggestion among friends but a sceptre that subdues the enemies in whose very midst the king is enthroned.'),

    -- THREAD 3: Thy people shall be willing in the day of thy power
    ('canon','psalms',110,3,'canon','judges',5,2,'free',
      E'*Praise ye Yahuah (LORD) for the avenging of Yashar''el (Israel), when the people willingly offered themselves* (Judges 5:2). The willing host of *Thy people shall be willing in the day of thy power* (Psalm 110:3) sings in Deborah''s song: *when the people willingly offered themselves*. The day of the king''s power is the day his people offer themselves freely — the gathered willing army of Yahuah, not a pressed levy but a people glad to follow the enthroned One into the battle.'),

    -- THREAD 4 (★★★): A priest for ever after the order of Melek Tsadiq (the priest-king)
    ('canon','psalms',110,4,'canon','genesis',14,18,'free',
      E'*And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18). The order named in *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4) reaches back to the one who met Abraham — at once *king of Salem* and *the priest of the El Elyon*. The Formed Son enthroned as king (110:1-3) is priest after this older order: king and priest in one, like the one who blessed Abraham and received his tithes.'),
    ('canon','psalms',110,4,'canon','hebrews',5,6,'free',
      E'*As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6). The letter quotes the psalm word-for-word: the Messiah did not glorify Himself to be high priest but was named one by the Father — *Thou art a priest for ever after the order of Melek Tsadiq* (Psalm 110:4). The priesthood is conferred, not seized; the same Father who said *Sit thou at my right hand* names the Son an everlasting priest.'),
    ('canon','psalms',110,4,'canon','hebrews',5,10,'free',
      E'*Called of Elohim (God) an high priest after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:10). The Son is *called of Elohim* to the office of *Thou art a priest for ever after the order of Melek Tsadiq* (Psalm 110:4) — high priest not after Aaron but after the order of the priest-king who blessed Abraham. The calling is the Father''s; the order is the older, royal one of Salem.'),
    ('canon','psalms',110,4,'canon','hebrews',6,20,'free',
      E'*Whither the forerunner is for us entered, even Yahusha (Jesus), made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). Yahusha (Jesus) enters within the veil as *an high priest for ever after the order of Melek Tsadiq* — the very title of *Thou art a priest for ever after the order of Melek Tsadiq* (Psalm 110:4). The enthroned king is the forerunner-priest who has gone before His people into the holy place, an anchor sure and stedfast.'),
    ('canon','psalms',110,4,'canon','hebrews',7,17,'free',
      E'*For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17). The whole argument rests on this testimony — *Thou art a priest for ever after the order of Melek Tsadiq* (Psalm 110:4) — that another priest should arise *not after the law of a carnal commandment, but after the power of an endless life* (Hebrews 7:16). The Aaronic priests died and were replaced; this Priest *abideth a priest continually* (Hebrews 7:3), for ever, after the order of the one *without beginning of days, nor end of life*.'),

    -- THREAD 5 (★★): Yahuah hath sworn and will not repent — the oath and the unchangeable priesthood
    ('canon','psalms',110,4,'canon','hebrews',7,21,'free',
      E'*(For those priests were made without an oath; but this with an oath by him that said unto him, Yahuah (Lord) sware and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek):)* (Hebrews 7:21). The letter seizes on the sworn word of the psalm — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever* (Psalm 110:4). The Levitical priests were made without an oath; this priest is made *with an oath*, and an oath Yahuah will not repent of binds the priesthood for ever, never to be abrogated.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps110_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps110_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 6 (★★): He must reign till he hath put all enemies under his feet
    ('canon','psalms',110,1,'canon','1-corinthians',15,25,'free',
      E'*For he must reign, till he hath put all enemies under his feet* (1 Corinthians 15:25). Sha''ul (Paul) names the reign that works out the footstool of the psalm — *until I make thine enemies thy footstool* (Psalm 110:1) becomes *he must reign, till he hath put all enemies under his feet*. The enthroned Son rules until every foe is subdued, *the last enemy that shall be destroyed is death* (1 Corinthians 15:26); the right-hand seat is no idle throne but a reign that ends in total victory, the footstool complete.'),

    -- THREAD 7 (★★): The day of his wrath — he shall judge among the heathen, and lift up the head
    ('canon','psalms',110,5,'canon','psalms',2,1,'free',
      E'*Why do the heathen rage, and the people imagine a vain thing?* (Psalm 2:1). The raging heathen judged in *He shall judge among the heathen, he shall fill the places with the dead bodies* (Psalm 110:6) are the very nations of *Why do the heathen rage* — the kings who set themselves against Yahuah''s anointed. The day of wrath of *Yahuah (Lord) at thy right hand shall strike through kings in the day of his wrath* (Psalm 110:5) answers the raging of the kings: the enthroned One judges those who imagined the vain thing.'),
    ('canon','psalms',110,5,'canon','psalms',2,2,'free',
      E'*The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:2). The kings struck through in *shall strike through kings in the day of his wrath* (Psalm 110:5) are the *kings of the earth* who *set themselves... against Yahuah, and against his anointed*. The wrath of the priest-king falls on the rulers who took counsel against the anointed One — and the lifted-up head of *therefore shall he lift up the head* (Psalm 110:7) is His triumph over them, the seed-war victory of the One enthroned at the right hand.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps110_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps110_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool',
       E'Sit thou at my right hand — the Father speaks to the Formed Son enthroned',
       E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1) — the single most-quoted line of the Tanakh in all the New Testament, and one of the deepest. Two are named distinctly in the one verse: *Yahuah (LORD)* who speaks, and *my Lord* who is seated. Read through the Formed and the Formless: the Father (Yahuah, the formless Source) addresses the Formed Son — David''s *Lord*, who is also David''s son after the flesh — and seats Him at His own right hand. Yahusha (Jesus) makes this verse the riddle that silences the scribes: *What think ye of Messiah (Christ)? whose son is he? They say unto him, The Son of David. He saith unto them, How then doth David in spirit call him Yahuah (Lord)... If David then call him Yahuah (Lord), how is he his son?* (Matthew 22:42-45). The answer is the Formed Son alone: born of David''s line, yet the One the Father enthrones beside Himself — no flat son-of-David, no co-equal-persons abstraction collapsing speaker and spoken-to, no modalist one-talking-to-himself; a Father who speaks and a Son who is seated. Mark keeps it: *David himself said by the Ruach HaKodesh (Holy Spirit), Yahuah (LORD) said to my Lord, Sit thou on my right hand* (Mark 12:36); Luke names the book: *David himself saith in the book of Psalms* (Luke 20:42). Kepha (Peter) preaches it at Pentecost: David never ascended, so the *my Lord* is the risen Son — *being by the right hand of Elohim (God) exalted... Yahuah (LORD) said unto my Lord, Sit thou on my right hand, until I make thy foes thy footstool* (Acts 2:33-35). And the letter sets Him over every angel: *to which of the angels said he at any time, Sit on my right hand, until I make thine enemies thy footstool?* (Hebrews 1:13). The restored witness shows the same enthronement — *the Head of Days placed the Elect One on the throne of His glory* (1 Enoch 61:8) — and names the One enthroned: *This is the Son of Adam who is born unto righteousness* (1 Enoch 62:7), the One of Adam''s seed who is also the Lord seated to judge. The footstool of the enemies is the Father''s own pledge: *until I make* — the One enthroned reigns while the Father puts all foes beneath His feet.',
       sv.verse_id, ev.verse_id, 'extras', 24725
  FROM _s302_ps110_lookup sv, _s302_ps110_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=110 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-110-the-rod-of-thy-strength-out-of-zion-rule-in-the-midst-of-thine-enemies',
       E'The rod of thy strength out of Zion — rule in the midst of thine enemies',
       E'*Yahuah (LORD) shall send the rod of thy strength out of Zion: rule thou in the midst of thine enemies* (Psalm 110:2). The enthroned king of verse 1 now wields a sceptre, and it goes out from a chosen place — Zion. This is the same king and the same hill of the companion royal psalm: *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). From the holy hill the rule goes out; the seat of the throne is the seat of the sceptre. And the rod is no gentle staff: *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9) — the *rod of thy strength* that subdues the raging nations *in the midst of thine enemies*. The king does not wait for the enemies to be cleared before He reigns; He reigns in their very midst, ruling from Zion while His strength goes forth to break the rebellious.',
       sv.verse_id, ev.verse_id, 'free', 24728
  FROM _s302_ps110_lookup sv, _s302_ps110_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=110 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-110-thy-people-shall-be-willing-in-the-day-of-thy-power',
       E'Thy people shall be willing in the day of thy power',
       E'*Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning: thou hast the dew of thy youth* (Psalm 110:3). The enthroned priest-king is not a lonely figure; He has a people, and in the day of His power they come to Him willingly — not a pressed levy but a host glad to follow. The same willing-offering rings in Deborah''s ancient song of the day Yahuah delivered His people: *Praise ye Yahuah (LORD) for the avenging of Yashar''el (Israel), when the people willingly offered themselves* (Judges 5:2). The day of the king''s power is the day his people offer themselves freely, *in the beauties of holiness* — arrayed not in armour but in holiness, fresh as the *dew* of the morning, a gathered willing people streaming to the One Yahuah has enthroned.',
       sv.verse_id, ev.verse_id, 'free', 24731
  FROM _s302_ps110_lookup sv, _s302_ps110_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=110 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-110-a-priest-for-ever-after-the-order-of-melek-tsadiq',
       E'A priest for ever after the order of Melek Tsadiq (Melchizedek) — the priest-king',
       E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). The One enthroned as king in verses 1-3 is now declared priest — and both offices rest in the one person. The order named reaches back to the only figure in the Tanakh who was at once king and priest: *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18), the one who met Abraham returning from the slaughter of the kings, blessed him, and received his tithes. The Formed Son is priest-king after THIS order — not after Aaron, but after the older, royal priesthood of Salem. The letter to the Hebrews builds its whole argument on this single verse: *So also Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee. As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq* (Hebrews 5:5-6); *Called of Elohim (God) an high priest after the order of Melek Tsadiq* (Hebrews 5:10); *the forerunner is for us entered, even Yahusha (Jesus), made an high priest for ever after the order of Melek Tsadiq* (Hebrews 6:20); *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq* (Hebrews 7:17). Melek Tsadiq abides *a priest continually* (Hebrews 7:3), and so the One after his order is priest not by a fleshly succession that death cuts off but *after the power of an endless life* (Hebrews 7:16). The enthroned king at the right hand is also the eternal intercessor — king and priest in one, after the order of the one who blessed Abraham.',
       sv.verse_id, ev.verse_id, 'free', 24734
  FROM _s302_ps110_lookup sv, _s302_ps110_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=110 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-110-yahuah-hath-sworn-and-will-not-repent-the-oath-and-the-unchangeable-priesthood',
       E'Yahuah hath sworn, and will not repent — the oath and the unchangeable priesthood',
       E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). One word in this verse the letter to the Hebrews will not let pass: *sworn*. The Levitical priesthood was given without an oath, but this priesthood Yahuah binds by His own sworn word, and He *will not repent* of it. The letter seizes the distinction: *And inasmuch as not without an oath he was made priest: (For those priests were made without an oath; but this with an oath by him that said unto him, Yahuah (Lord) sware and will not repent, Thou art a priest for ever after the order of Melek Tsadiq:)* (Hebrews 7:20-21). An oath Yahuah cannot repent of binds the office for ever — and what is sworn for ever cannot be abrogated. So *this man, because he continueth ever, hath an unchangeable priesthood* (Hebrews 7:24), able *to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). This is not the Aaronic order cancelled into lawlessness; it is the older, royal, sworn priesthood the Aaronic always pointed toward — the priesthood that never ends because the Priest never dies, sealed by an oath Yahuah will never take back.',
       sv.verse_id, ev.verse_id, 'free', 24737
  FROM _s302_ps110_lookup sv, _s302_ps110_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=110 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-110-he-must-reign-till-he-hath-put-all-enemies-under-his-feet',
       E'He must reign till he hath put all enemies under his feet — the footstool completed',
       E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). The enthronement word carries a promise yet to be worked out — *until I make thine enemies thy footstool* — and Sha''ul (Paul) names exactly the reign that completes it: *For he must reign, till he hath put all enemies under his feet* (1 Corinthians 15:25). The right-hand seat is no idle throne; the Son *must reign* until every foe is subdued. And the last of them is named: *The last enemy that shall be destroyed is death* (1 Corinthians 15:26). The footstool of Psalm 110:1 is filled out to its end — when all things are put under His feet, even death swallowed up in victory, *then shall the Son also himself be subject unto him that put all things under him, that Elohim (God) may be all in all* (1 Corinthians 15:28). The Formed Son reigns at the Father''s right hand until the Father has made every enemy His footstool, and then renders the kingdom up — the right hand, the reign, and the footstool all of one piece.',
       sv.verse_id, ev.verse_id, 'free', 24740
  FROM _s302_ps110_lookup sv, _s302_ps110_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=110 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-110-the-day-of-his-wrath-he-shall-judge-among-the-heathen-and-lift-up-the-head',
       E'The day of his wrath — he shall judge among the heathen, and lift up the head',
       E'*Yahuah (Lord) at thy right hand shall strike through kings in the day of his wrath. He shall judge among the heathen, he shall fill the places with the dead bodies; he shall wound the heads over many countries. He shall drink of the brook in the way: therefore shall he lift up the head* (Psalm 110:5-7). The psalm closes in the day of wrath: the enthroned One strikes through kings, judges the raging nations, and lifts up His head in triumph. The kings and the heathen are the same the companion royal psalm shows in revolt: *Why do the heathen rage, and the people imagine a vain thing? The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:1-2). The wrath of Psalm 110:5 is the answer to that raging — the kings who set themselves against the anointed are struck through in the day of His wrath, *the places filled with the dead bodies*, the proud heads wounded *over many countries*. And the last line is victory: *therefore shall he lift up the head* — the head bowed in the toil of the way (*He shall drink of the brook in the way*) raised in triumph. This is the seed-war turned to conquest, the enmity of the serpent and the seed (Genesis 3:15) ended in the lifted-up head of the One enthroned at the right hand: He who waited while the Father made His enemies His footstool now treads them down Himself.',
       sv.verse_id, ev.verse_id, 'free', 24743
  FROM _s302_ps110_lookup sv, _s302_ps110_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=110 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) said unto my Lord, Sit thou on my right hand, till I make thine enemies thy footstool?* (Matthew 22:44) — Yahusha quotes 110:1 to silence the scribes; the Father speaks to the Formed Son enthroned.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *If David then call him Yahuah (Lord), how is he his son?* (Matthew 22:45) — Yahusha''s own riddle on 110:1: David''s son after the flesh AND David''s Lord enthroned; answered only by the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*David himself said by the Ruach HaKodesh (Holy Spirit), Yahuah (LORD) said to my Lord, Sit thou on my right hand* (Mark 12:36) — David, by the Spirit, calls his own descendant Lord (110:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*David himself saith in the book of Psalms, Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Luke 20:42) — Luke names the source: David''s own word seats the Son at the right hand (110:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=20 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Till I make thine enemies thy footstool* (Luke 20:43) — the Father''s pledge of 110:1: the enemies made the footstool by the One who speaks, on the Son''s behalf.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=20 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*David is not ascended into the heavens: but he saith himself, Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Acts 2:34) — Kepha (Peter) at Pentecost: the *my Lord* of 110:1 is the risen, exalted Son, not David.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Until I make thy foes thy footstool* (Acts 2:35) — Kepha carries the whole enthronement word of 110:1; the exalted Son waits while the Father subdues every foe.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*to which of the angels said he at any time, Sit on my right hand, until I make thine enemies thy footstool?* (Hebrews 1:13) — the word of 110:1 spoken to no angel, only to the Son: the Heir over every ministering spirit.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above* (1 Enoch 61:8) — the same enthronement as 110:1; the Father sets the Elect One on the throne of glory to judge.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=61 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*This is the Son of Adam who is born unto righteousness, And righteousness abides over him* (1 Enoch 62:7) — the enthroned One named the Son of Adam: of Adam''s seed yet seated to judge, the paradox of 110:1.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-sit-thou-at-my-right-hand-until-i-make-thine-enemies-thy-footstool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6) — the king on Zion; the rod of 110:2 goes out *out of Zion*, from the holy hill where Yahuah sets His anointed.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=2
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-the-rod-of-thy-strength-out-of-zion-rule-in-the-midst-of-thine-enemies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt break them with a rod of iron* (Psalm 2:9) — the *rod of thy strength* of 110:2 is the rod of iron that subdues the raging nations *in the midst of thine enemies*.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=2
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-the-rod-of-thy-strength-out-of-zion-rule-in-the-midst-of-thine-enemies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Praise ye Yahuah (LORD)... when the people willingly offered themselves* (Judges 5:2) — the willing host of 110:3 in Deborah''s song; the day of the king''s power is the day his people offer themselves freely.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=3
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-thy-people-shall-be-willing-in-the-day-of-thy-power'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18) — the Tanakh root of the order of 110:4: the one king-and-priest who blessed Abraham.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=4
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-a-priest-for-ever-after-the-order-of-melek-tsadiq'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6) — the psalm quoted whole: the Messiah named priest by the Father, not self-glorified (110:4).'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=4
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-a-priest-for-ever-after-the-order-of-melek-tsadiq'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Called of Elohim (God) an high priest after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:10) — high priest after the order of 110:4, not after Aaron; the calling is the Father''s.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=4
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-a-priest-for-ever-after-the-order-of-melek-tsadiq'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahusha (Jesus), made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20) — the forerunner entered within the veil as the priest-for-ever of 110:4, an anchor sure and stedfast.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=4
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-a-priest-for-ever-after-the-order-of-melek-tsadiq'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17) — the testimony 110:4 supplies: a priest *after the power of an endless life*, not a fleshly succession death cuts off.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=4
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-a-priest-for-ever-after-the-order-of-melek-tsadiq'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *those priests were made without an oath; but this with an oath by him that said... Yahuah (Lord) sware and will not repent, Thou art a priest for ever* (Hebrews 7:21) — the *sworn* of 110:4 seized: an oath Yahuah will not repent of binds the priesthood for ever, unabrogated.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=4
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-yahuah-hath-sworn-and-will-not-repent-the-oath-and-the-unchangeable-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *For he must reign, till he hath put all enemies under his feet* (1 Corinthians 15:25) — the footstool of 110:1 worked out: the enthroned Son reigns until every foe is subdued, the last enemy death destroyed.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=1
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-he-must-reign-till-he-hath-put-all-enemies-under-his-feet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Why do the heathen rage, and the people imagine a vain thing?* (Psalm 2:1) — the raging heathen judged in 110:6 are the nations of Psalm 2; the day of wrath answers their raging.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=5
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-the-day-of-his-wrath-he-shall-judge-among-the-heathen-and-lift-up-the-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The kings of the earth set themselves... against Yahuah (LORD), and against his anointed* (Psalm 2:2) — the kings struck through in 110:5 are those who set themselves against the anointed; the lifted-up head (110:7) is His triumph over them.'
  FROM cross_reference_threads t
  JOIN _s302_ps110_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=110 AND sv.verse_number=5
  JOIN _s302_ps110_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-110-the-day-of-his-wrath-he-shall-judge-among-the-heathen-and-lift-up-the-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
