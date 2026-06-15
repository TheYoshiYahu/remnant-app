-- ----- fragment: minion_exodus_10.sql (Exodus 10) -----
-- Exodus 10 — the plague of locusts and the thick darkness over Egypt.
-- Tag: ex10   Session: s305   Sort band: 29225 (step 3: 29225, 29228, 29231)
--
-- Exodus 10 coverage:
--   v.1-2  (I have hardened his heart... that thou mayest tell in the ears of thy son... that ye may know how that I am Yahuah)
--          NT:     none warranted (mandate sung/restated within the Tanakh itself)
--          Extras: none warranted
--          Tanakh: Psalm 78:4, Psalm 78:6 (shew to the generation to come); Deuteronomy 6:20-21 (the son's question answered with the Exodus) → THREAD 1
--   v.3    (let my people go that they may serve me) — covered laterally inside thread 1's frame
--          NT/Extras/Tanakh: none warranted as separate thread
--   v.4-6  (the locusts shall cover the face of the earth... eat every tree)
--          NT:     Revelation 9:3 (locusts upon the earth out of the smoke) → THREAD 2
--          Extras: none warranted
--          Tanakh: Joel 1:4, Joel 2:1-2 (the locust army = the day of Yahuah); Psalm 78:46, Psalm 105:34 (he sang the plague) → THREAD 2
--   v.7-11 (Pharaoh's servants, who shall go, hold a feast unto Yahuah) — narrative; none warranted
--   v.12-15 (Moses stretched out the rod... the locusts... the land was darkened... no green thing) — joins THREAD 2
--   v.16-20 (Pharaoh's confession, the west wind, the heart hardened) — narrative; none warranted
--   v.21-23 ★ (darkness which may be felt... they saw not one another... but all the children of Yashar'el had light in their dwellings)
--          NT:     Revelation 16:10 (his kingdom was full of darkness) → THREAD 3
--          Extras: Wisdom of Solomon 17:20, 18:1, 18:4 (Egyptians in darkness, thy saints a very great light) → THREAD 3
--          Tanakh: Psalm 105:28 (he sent darkness); Isaiah 60:1-2 (darkness covers the earth but Yahuah shall arise upon thee) → THREAD 3
--   v.24-29 (negotiation, not an hoof left behind, see my face no more) — narrative; none warranted
--
-- THREADS:
--   1. exodus-10-tell-it-in-the-ears-of-thy-son  [free; canon Tanakh] — the plagues as the story retold to the generations (Ps 78, Deut 6)
--   2. exodus-10-the-locusts-and-the-day-of-yahuah  [free; canon Tanakh + NT] — the locust plague as the prophetic type of the Day of Yahuah's judgment-army (Joel 1-2, Ps 78/105, Rev 9)
--   3. exodus-10-the-thick-darkness-and-the-light-in-their-dwellings  [extras; canon Tanakh + NT + apocrypha] — the light/darkness division on the two peoples (Ps 105, Isa 60, Rev 16, Wisdom of Solomon 17-18)

CREATE TEMP VIEW _s305_ex10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: tell it in the ears of thy son
    ('canon','exodus',10,2,'canon','psalms',78,4,'free',
     E'*We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done.* (Psalm 78:4) Asaph sings what Yahuah commands at the locust-plague: *that thou mayest tell in the ears of thy son, and of thy son''s son, what things I have wrought in Egypt* (Exodus 10:2). The signs upon Egypt were never for that hour only — they are the wonderful works handed down the generations so the children might know Yahuah.'),
    ('canon','exodus',10,2,'canon','psalms',78,6,'free',
     E'*That the generation to come might know them, even the children which should be born; who should arise and declare them to their children:* (Psalm 78:6) The very purpose Yahuah names at the plague — *that ye may know how that I am Yahuah (LORD)* (Exodus 10:2) — is the purpose Asaph carries forward: the wonders are taught so each generation yet unborn declares them again to its own.'),
    ('canon','exodus',10,2,'canon','deuteronomy',6,20,'free',
     E'*And when thy son asketh thee in time to come, saying, What mean the testimonies, and the statutes, and the judgments, which Yahuah Eloheinu (the LORD our God) hath commanded you?* (Deuteronomy 6:20) Moses builds the son''s question into the covenant itself — the same *thy son, and of thy son''s son* (Exodus 10:2) who must be told. The remembrance is not optional memory; it is Torah-bound catechesis.'),
    ('canon','exodus',10,2,'canon','deuteronomy',6,21,'free',
     E'*Then thou shalt say unto thy son, We were Pharaoh''s bondmen in Egypt; and Yahuah (LORD) brought us out of Egypt with a mighty hand:* (Deuteronomy 6:21) The answer to the son''s question is the Exodus — exactly *what things I have wrought in Egypt, and my signs which I have done among them* (Exodus 10:2). The deliverance is the family story Yashar''el (Israel) is bound to retell.'),

    -- THREAD 2: the locusts and the day of Yahuah
    ('canon','exodus',10,4,'canon','joel',1,4,'free',
     E'*That which the palmerworm hath left hath the locust eaten; and that which the locust hath left hath the cankerworm eaten; and that which the cankerworm hath left hath the caterpiller eaten.* (Joel 1:4) Yahuah''s threat to Pharaoh — *to morrow will I bring the locusts into thy coast* (Exodus 10:4) — becomes Joel''s pattern for the day of Yahuah: wave upon devouring wave, the consuming army that strips the land bare.'),
    ('canon','exodus',10,5,'canon','joel',2,1,'free',
     E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* (Joel 2:1) The Egyptian locust that *shall cover the face of the earth, that one cannot be able to see the earth* (Exodus 10:5) is the figure Joel lifts into prophecy — the locust-army announcing the day of Yahuah is at hand.'),
    ('canon','exodus',10,15,'canon','joel',2,2,'free',
     E'*A day of darkness and of gloominess, a day of clouds and of thick darkness, as the morning spread upon the mountains: a great people and a strong; there hath not been ever the like, neither shall be any more after it, even to the years of many generations.* (Joel 2:2) Moses says of the Egyptian swarm *before them there were no such locusts as they, neither after them shall be such* — and the land *was darkened* (Exodus 10:14-15). Joel''s judgment-host is the same unmatched locust-darkness raised to the eschaton.'),
    ('canon','exodus',10,15,'canon','psalms',78,46,'free',
     E'*He gave also their increase unto the caterpiller, and their labour unto the locust.* (Psalm 78:46) Asaph numbers the locust among the plague-signs he is handing to the children: the swarm that *did eat every herb of the land, and all the fruit of the trees* (Exodus 10:15) is sung as Yahuah''s own act of judgment upon Egypt.'),
    ('canon','exodus',10,15,'canon','psalms',105,34,'free',
     E'*He spake, and the locusts came, and caterpillers, and that without number,* (Psalm 105:34) The psalmist retells the very plague: at Yahuah''s word the locusts come without number, *and there remained not any green thing in the trees, or in the herbs of the field* (Exodus 10:15). The history is sung as covenant memory.'),
    ('canon','exodus',10,4,'canon','revelation',9,3,'free',
     E'*And there came out of the smoke locusts upon the earth: and unto them was given power, as the scorpions of the earth have power.* (Revelation 9:3) The plague Yahuah brought *into thy coast* (Exodus 10:4) returns at the trumpet-judgment — the locust out of the bottomless pit, the Egyptian sign carried forward to the day of Yahuah against the unsealed.'),

    -- THREAD 3: the thick darkness and the light in their dwellings
    ('canon','exodus',10,21,'canon','psalms',105,28,'free',
     E'*He sent darkness, and made it dark; and they rebelled not against his word.* (Psalm 105:28) The psalmist sings the ninth plague plainly: Yahuah said *Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt* (Exodus 10:21), and he sent it and made it dark.'),
    ('canon','exodus',10,23,'canon','isaiah',60,2,'free',
     E'*For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* (Isaiah 60:2) The plague drew the line — *they saw not one another... but all the children of Yashar''el (Israel) had light in their dwellings* (Exodus 10:23). Isaiah prophesies that same set-apart division at the end: darkness over the nations, but Yahuah''s light risen upon his covenant people.'),
    ('canon','exodus',10,23,'canon','isaiah',60,1,'free',
     E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1) While Egypt sat in darkness that could be felt, *all the children of Yashar''el (Israel) had light in their dwellings* (Exodus 10:23). Isaiah calls that same people to arise and shine — the light kept in their dwellings becomes the covenant glory that is risen upon them.'),
    ('canon','exodus',10,21,'canon','revelation',16,10,'free',
     E'*And the fifth angel poured out his vial upon the seat of the beast; and his kingdom was full of darkness; and they gnawed their tongues for pain,* (Revelation 16:10) The *darkness which may be felt* (Exodus 10:21) over Pharaoh''s throne returns upon the throne of the beast — his kingdom full of darkness, the Egyptian plague-sign poured out at the end on the kingdom that will not let Yahuah''s people go.'),
    ('canon','exodus',10,23,'apocrypha','the-wisdom-of-solomon',17,20,'extras',
     E'*For the whole world shined with clear light, and none were hindered in their labour:* (Wisdom of Solomon 17:20) Wisdom retells the ninth plague at length — while the Egyptians lay bound in a long night, the whole world for Yashar''el (Israel) shined with clear light, the very distinction of Exodus 10:23: *all the children of Yashar''el (Israel) had light in their dwellings.*'),
    ('canon','exodus',10,23,'apocrypha','the-wisdom-of-solomon',18,1,'extras',
     E'*Nevertheless your saints had a very great light, whose voice they hearing, and not seeing their shape, because they also had not suffered the same things, they counted them happy.* (Wisdom of Solomon 18:1) The set-apart people kept their light when Egypt could not see — *but all the children of Yashar''el (Israel) had light in their dwellings* (Exodus 10:23). Wisdom names them Yahuah''s saints who had a very great light in the same hour of darkness.'),
    ('canon','exodus',10,23,'apocrypha','the-wisdom-of-solomon',18,4,'extras',
     E'*For they were worthy to be deprived of light and imprisoned in darkness, who had kept your sons shut up, by whom the uncorrupt light of the law was to be given to the world.* (Wisdom of Solomon 18:4) Wisdom reads the plague as covenant justice: those who imprisoned Yahuah''s sons are themselves imprisoned in darkness, while the people who carry *the uncorrupt light of the law* keep their light — the same light in the dwellings of Exodus 10:23.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-10-tell-it-in-the-ears-of-thy-son',
       E'Tell It in the Ears of Thy Son: the Plagues Handed to the Generations',
       E'At the locust-plague Yahuah (LORD) gives the reason the signs are wrought: *And that thou mayest tell in the ears of thy son, and of thy son''s son, what things I have wrought in Egypt, and my signs which I have done among them; that ye may know how that I am Yahuah (LORD).* (Exodus 10:2) The wonders upon Egypt were never spectacle for one hour — they are covenant memory to be retold. Asaph sings exactly this mandate: *We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done.* (Psalm 78:4) — *That the generation to come might know them, even the children which should be born; who should arise and declare them to their children:* (Psalm 78:6) And Moses writes the son''s question into the Torah itself: *And when thy son asketh thee in time to come, saying, What mean the testimonies, and the statutes, and the judgments, which Yahuah Eloheinu (the LORD our God) hath commanded you?* (Deuteronomy 6:20) The answer is the Exodus: *Then thou shalt say unto thy son, We were Pharaoh''s bondmen in Egypt; and Yahuah (LORD) brought us out of Egypt with a mighty hand:* (Deuteronomy 6:21) The deliverance is the family story Yashar''el (Israel) is bound to keep telling.',
       sv.verse_id, ev.verse_id, 'free', 29225
  FROM _s305_ex10_lookup sv, _s305_ex10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=10 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-10-the-locusts-and-the-day-of-yahuah',
       E'The Locusts: the Devouring Army and the Day of Yahuah',
       E'Yahuah (LORD) threatens Pharaoh: *to morrow will I bring the locusts into thy coast: And they shall cover the face of the earth, that one cannot be able to see the earth... and shall eat every tree which groweth for you out of the field* (Exodus 10:4-5), and so it came — *the locusts went up over all the land of Egypt... before them there were no such locusts as they, neither after them shall be such* (Exodus 10:14), until *the land was darkened... and there remained not any green thing* (Exodus 10:15). Asaph and the psalmist hand the plague to the children as covenant memory: *He gave also their increase unto the caterpiller, and their labour unto the locust.* (Psalm 78:46) — *He spake, and the locusts came, and caterpillers, and that without number,* (Psalm 105:34) Then Joel lifts the swarm into prophecy: *That which the palmerworm hath left hath the locust eaten; and that which the locust hath left hath the cankerworm eaten...* (Joel 1:4) — *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh* (Joel 2:1) — *A day of darkness and of gloominess... a great people and a strong; there hath not been ever the like, neither shall be any more after it* (Joel 2:2). The unmatched Egyptian locust becomes the unmatched judgment-army of the day of Yahuah. And it returns at the last trumpet: *And there came out of the smoke locusts upon the earth: and unto them was given power, as the scorpions of the earth have power.* (Revelation 9:3) The plague-sign upon Egypt is the prophetic type of Yahuah''s judgment-host upon the unsealed.',
       sv.verse_id, ev.verse_id, 'free', 29228
  FROM _s305_ex10_lookup sv, _s305_ex10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=10 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-10-the-thick-darkness-and-the-light-in-their-dwellings',
       E'The Thick Darkness and the Light in Their Dwellings: the Division on Two Peoples',
       E'The ninth plague draws the line through the land: *Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt.* (Exodus 10:21) — *and there was a thick darkness in all the land of Egypt three days: They saw not one another, neither rose any from his place for three days: but all the children of Yashar''el (Israel) had light in their dwellings.* (Exodus 10:22-23) The psalmist sings it: *He sent darkness, and made it dark; and they rebelled not against his word.* (Psalm 105:28) Isaiah prophesies the same set-apart division at the end of days: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1) — *For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* (Isaiah 60:2) The felt-darkness over Pharaoh returns upon the throne of the beast: *the fifth angel poured out his vial upon the seat of the beast; and his kingdom was full of darkness* (Revelation 16:10). And the restored library retells the plague at length — *For the whole world shined with clear light, and none were hindered in their labour:* (Wisdom of Solomon 17:20) — *Nevertheless your saints had a very great light* (Wisdom of Solomon 18:1) — naming the reason in covenant terms: *who had kept your sons shut up, by whom the uncorrupt light of the law was to be given to the world.* (Wisdom of Solomon 18:4) The light kept in the dwellings of Yashar''el (Israel) is the light of the covenant people, divided by Yahuah from the darkness of those who will not let them go.',
       sv.verse_id, ev.verse_id, 'extras', 29231
  FROM _s305_ex10_lookup sv, _s305_ex10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=10 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=10 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1: tell it in the ears of thy son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (2,'canon','psalms',78,4,1,E'Psalm 78:4 — *shewing to the generation to come the praises of Yahuah (LORD)*; the plague-signs handed down so the children may know.'),
    (2,'canon','psalms',78,6,2,E'Psalm 78:6 — *that the generation to come might know them, even the children which should be born*; Yahuah''s named purpose, that ye may know I am Yahuah, carried forward.'),
    (2,'canon','deuteronomy',6,20,3,E'Deuteronomy 6:20 — *when thy son asketh thee in time to come*; the son''s question built into the Torah, the same son who must be told.'),
    (2,'canon','deuteronomy',6,21,4,E'Deuteronomy 6:21 — *We were Pharaoh''s bondmen in Egypt; and Yahuah (LORD) brought us out*; the answer is the Exodus itself.')
  ) AS m(src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s305_ex10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=10 AND sv.verse_number=m.src_v
  JOIN _s305_ex10_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='exodus-10-tell-it-in-the-ears-of-thy-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the locusts and the day of Yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (4,'canon','joel',1,4,1,E'Joel 1:4 — *that which the locust hath left hath the cankerworm eaten*; the devouring wave-on-wave pattern drawn from the Egyptian swarm.'),
    (5,'canon','joel',2,1,2,E'Joel 2:1 — *the day of Yahuah (LORD) cometh, for it is nigh at hand*; the locust covering the earth becomes the alarm of the day of Yahuah.'),
    (15,'canon','joel',2,2,3,E'Joel 2:2 — *a great people and a strong; there hath not been ever the like*; the unmatched Egyptian locust raised to the eschatological judgment-host.'),
    (15,'canon','psalms',78,46,4,E'Psalm 78:46 — *he gave their labour unto the locust*; the swarm sung as Yahuah''s plague-sign upon Egypt.'),
    (15,'canon','psalms',105,34,5,E'Psalm 105:34 — *the locusts came, and caterpillers, and that without number*; the plague retold as covenant memory.'),
    (4,'canon','revelation',9,3,6,E'Revelation 9:3 — *there came out of the smoke locusts upon the earth*; the plague-sign returns at the trumpet-judgment against the unsealed.')
  ) AS m(src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s305_ex10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=10 AND sv.verse_number=m.src_v
  JOIN _s305_ex10_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='exodus-10-the-locusts-and-the-day-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: the thick darkness and the light in their dwellings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (21,'canon','psalms',105,28,1,E'Psalm 105:28 — *He sent darkness, and made it dark*; the psalmist sings the ninth plague plainly.'),
    (23,'canon','isaiah',60,1,2,E'Isaiah 60:1 — *Arise, shine; for thy light is come*; the light kept in the dwellings becomes the covenant glory risen upon the people.'),
    (23,'canon','isaiah',60,2,3,E'Isaiah 60:2 — *darkness shall cover the earth... but Yahuah (LORD) shall arise upon thee*; the same set-apart light/darkness division at the end of days.'),
    (21,'canon','revelation',16,10,4,E'Revelation 16:10 — *his kingdom was full of darkness*; the felt-darkness over Pharaoh returns upon the throne of the beast.'),
    (23,'apocrypha','the-wisdom-of-solomon',17,20,5,E'Wisdom of Solomon 17:20 — *the whole world shined with clear light*; the restored library retells the plague-distinction of Yashar''el (Israel).'),
    (23,'apocrypha','the-wisdom-of-solomon',18,1,6,E'Wisdom of Solomon 18:1 — *your saints had a very great light*; the set-apart people keep their light while Egypt cannot see.'),
    (23,'apocrypha','the-wisdom-of-solomon',18,4,7,E'Wisdom of Solomon 18:4 — *the uncorrupt light of the law was to be given to the world*; the plague read as covenant justice on those who imprisoned Yahuah''s sons.')
  ) AS m(src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s305_ex10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=10 AND sv.verse_number=m.src_v
  JOIN _s305_ex10_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='exodus-10-the-thick-darkness-and-the-light-in-their-dwellings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
