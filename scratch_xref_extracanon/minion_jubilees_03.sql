-- ----- fragment: minion_jubilees_03.sql (session251 jubilees 3) -----
-- Source anchor: jubilees/jubilees ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju03 (view _session251_ju03_lookup). Sort band base 53050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-3-adam-names-the-creatures
  ('jubilees', 'jubilees', 3, 1, 'canon', 'genesis', 1, 25, 'free', E'Genesis 1:25 — *And Elohim (God) made the beast of the earth after his kind, and cattle after their kind, and every thing that creepeth upon the earth after his kind: and Elohim (God) saw that it was good.* The very creatures Jubilees 3:1 says were brought to Adam "according to their kinds" are the kinds the Creator made.'),
  ('jubilees', 'jubilees', 3, 2, 'canon', 'genesis', 2, 19, 'free', E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Jubilees 3:2 retells this scene word for theme: as Adam called them, so was their name.'),
  ('jubilees', 'jubilees', 3, 3, 'canon', 'genesis', 2, 20, 'free', E'Genesis 2:20 — *And Adam gave names to all cattle, and to the fowl of the air, and to every beast of the field; but for Adam there was not found an help meet for him.* Jubilees 3:3 echoes the same ache exactly — Adam saw every kind "but he was alone and found no helpmeet for him."'),
  -- thread: jubilees-3-woman-from-the-rib-one-flesh
  ('jubilees', 'jubilees', 3, 4, 'canon', 'genesis', 2, 18, 'free', E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* Jubilees 3:4 quotes the same divine resolve: "It is not good that the man should be alone: let us make a helpmeet for him."'),
  ('jubilees', 'jubilees', 3, 5, 'canon', 'genesis', 2, 21, 'free', E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* This is the very deep sleep and the rib Jubilees 3:5 says became "the origin of the woman from amongst his ribs."'),
  ('jubilees', 'jubilees', 3, 6, 'canon', 'genesis', 2, 23, 'free', E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Adam''s words in Jubilees 3:6 are this confession; the one-flesh ordinance is woven straight from it.'),
  ('jubilees', 'jubilees', 3, 6, 'canon', 'matthew', 19, 5, 'free', E'Matthew 19:5 — *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* Yahusha appeals to the same creation ordinance Jubilees 3:6 records as given from the second week — "man and wife be one."'),
  -- thread: jubilees-3-law-of-purification-grounded-in-eve
  ('jubilees', 'jubilees', 3, 8, 'canon', 'leviticus', 12, 2, 'free', E'Leviticus 12:2 — *Speak unto the children of Yashar''el (Israel), saying, If a woman have conceived seed, and born a man child: then she shall be unclean seven days; according to the days of the separation for her infirmity shall she be unclean.* Jubilees 3:8 anchors this seven-day purification for a male in Eve and the creation weeks themselves.'),
  ('jubilees', 'jubilees', 3, 10, 'canon', 'leviticus', 12, 4, 'free', E'Leviticus 12:4 — *And she shall then continue in the blood of her purifying three and thirty days; she shall touch no hallowed thing, nor come into the sanctuary, until the days of her purifying be fulfilled.* Jubilees 3:10 quotes this same thirty-three days and sanctuary restriction as written "on the heavenly tables."'),
  ('jubilees', 'jubilees', 3, 11, 'canon', 'leviticus', 12, 5, 'free', E'Leviticus 12:5 — *But if she bear a maid child, then she shall be unclean two weeks, as in her separation: and she shall continue in the blood of her purifying threescore and six days.* The two weeks and sixty-six days of Jubilees 3:11 match the statute exactly, pre-engraved in Eve.'),
  ('jubilees', 'jubilees', 3, 13, 'canon', 'leviticus', 12, 7, 'free', E'Leviticus 12:7 — *Who shall offer it before Yahuah (LORD), and make an atonement for her; and she shall be cleansed from the issue of her blood. This is the law for her that hath born a male or a female.* Jubilees 3:13 gives the same single statute "regarding her who bears a male or a female child."'),
  -- thread: jubilees-3-eden-the-first-sanctuary
  ('jubilees', 'jubilees', 3, 9, 'canon', 'genesis', 2, 15, 'free', E'Genesis 2:15 — *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it.* Jubilees 3:9 retells this priestly charge — Adam brought in "to till and keep" the holy garden.'),
  ('jubilees', 'jubilees', 3, 11, 'canon', 'genesis', 2, 8, 'free', E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The garden Jubilees 3:11 calls "holier than all the earth besides" is this planted Eden of Genesis.'),
  -- thread: jubilees-3-the-serpent-and-the-fall
  ('jubilees', 'jubilees', 3, 16, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Jubilees 3:16 quotes the serpent''s opening question almost word for word.'),
  ('jubilees', 'jubilees', 3, 19, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The lie of Jubilees 3:19 — "You shall not surely die" — is the identical deception.'),
  ('jubilees', 'jubilees', 3, 19, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Jubilees 3:19 carries the same promise that "your eyes will be opened, and you will be as gods."'),
  ('jubilees', 'jubilees', 3, 20, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Jubilees 3:20-21 retells the seeing, the taking, the eating, and the giving to Adam.'),
  -- thread: jubilees-3-curse-and-expulsion
  ('jubilees', 'jubilees', 3, 24, 'canon', 'genesis', 3, 16, 'free', E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* Jubilees 3:24 quotes this judgment on the woman almost verbatim.'),
  ('jubilees', 'jubilees', 3, 25, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* This is the sentence Jubilees 3:25 retells: "Because you have hearkened to the voice of your wife... cursed be the ground for your sake."'),
  ('jubilees', 'jubilees', 3, 25, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sweat, the bread, and the return to earth of Jubilees 3:25 are this verse.'),
  ('jubilees', 'jubilees', 3, 26, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* Jubilees 3:26 retells the coats of skin and the sending forth from the garden.'),
  -- thread: jubilees-3-adam-the-priest-offers-incense
  ('jubilees', 'jubilees', 3, 27, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Adam''s offering "in the morning with the rising of the sun" (Jubilees 3:27) keeps the appointed-time reckoning the lights were set for — the moedim engraved from creation.'),
  ('jubilees', 'jubilees', 3, 30, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The covering Jubilees 3:30 prescribes "on the heavenly tables" — that they not uncover themselves as the nations do — flows from this first God-given covering.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-adam-names-the-creatures',
       E'Adam names every creature — the second week of creation',
       E'Jubilees opens chapter three by retelling the naming of the animals, dating it to the second week and binding it tight to the creation order of Genesis: *"And Adam named them all by their respective names, and as he called them, so was their name"* (Jubilees 3:2). This is no new myth — it is the Genesis account quoted back from the heavenly remembrance. The angel narrating to Moses says Yahuah brought *"all the beasts, and all the cattle, and all the birds"* to Adam by their kinds, exactly the creatures the Creator had ordered: *"And Elohim (God) made the beast of the earth after his kind, and cattle after their kind, and every thing that creepeth upon the earth after his kind"* (Genesis 1:25). And the naming itself is the very scene of Eden: *"and whatsoever Adam called every living creature, that was the name thereof"* (Genesis 2:19). It ain''t new — Jubilees is reading Genesis back to us.',
       sv.verse_id, ev.verse_id, 'extras', 53050
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-woman-from-the-rib-one-flesh',
       E'The woman built from his side — and one flesh forever',
       E'Jubilees grounds marriage in the creation week itself: *"And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs... and built the woman"* (Jubilees 3:5). It is the Eden text retold: *"And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof"* (Genesis 2:21). When she is brought to him Adam''s cry is the same in both books — *"This is now bone of my bones and flesh of my flesh"* (Jubilees 3:6 / Genesis 2:23) — and the one-flesh ordinance follows. This is the law Yahusha Himself appeals back to as the unbreakable beginning: *"For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?"* (Matthew 19:5). The covenant of marriage was engraved from the first week; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53053
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-law-of-purification-grounded-in-eve',
       E'The days of purifying — written on the heavenly tables in Eve',
       E'Here is Jubilees'' signature move: it roots the Torah''s law of purification after childbirth in Eve herself and in the days of her entering the garden — *"for this reason the commandment was given to keep in their defilement, for a male seven days, and for a female twice seven days"* (Jubilees 3:8). The author then quotes the statute as already standing *"on the heavenly tables"*: *"if she bears a male, she shall remain in her uncleanness seven days... and thirty and three days shall she remain in the blood of her purifying"* (Jubilees 3:10), and for a female "two weeks... and sixty-six days" (Jubilees 3:11). This is the law of Leviticus, pre-engraved before Sinai: *"then she shall be unclean seven days... And she shall then continue in the blood of her purifying three and thirty days"* (Leviticus 12:2-4), and for a maid child "two weeks... threescore and six days" (Leviticus 12:5). Jubilees declares it plainly the eternal testimony: *"This is the law and testimony which was written down for Yashar''el (Israel), in order that they should observe (it) all the days"* (Jubilees 3:14). The feasts, the Sabbath, and the purity statutes are not Jewish latecomers — they were engraved on the heavenly tablets from the beginning. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53056
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-eden-the-first-sanctuary',
       E'Eden the holy place — the garden as sanctuary',
       E'Jubilees reads the Garden of Eden as the first sanctuary on earth, holier than all the world: *"we brought her into the Garden of Eden, for it is holier than all the earth besides, and every tree that is planted in it is holy"* (Jubilees 3:11). This is why the purifying mother who may not "enter into the sanctuary" (Jubilees 3:13) is delayed from entering Eden — the garden IS the temple. And Adam''s charge there is priestly service: *"we brought him into the Garden of Eden to till and keep it"* (Jubilees 3:9), the very commission of Genesis: *"And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it"* (Genesis 2:15). The same verbs the Torah later uses for the Levites'' guarding of the tabernacle. Adam is the first priest in the first holy place.',
       sv.verse_id, ev.verse_id, 'extras', 53059
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-the-serpent-and-the-fall',
       E'The serpent, the tree, and the eyes opened',
       E'Jubilees dates the fall to the second month, the seventeenth day, and retells Genesis 3 almost verse for verse: *"the serpent said to the woman, Has Elohim (God) commanded you, saying, You shall not eat of every tree of the garden?"* (Jubilees 3:16). It is the Eden temptation: *"Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?"* (Genesis 3:1). The serpent''s lie is the same — *"You shall not surely die"* (Jubilees 3:19) / *"Ye shall not surely die"* (Genesis 3:4) — and the woman''s seeing and taking is the same: *"the woman saw the tree that it was agreeable and pleasant to the eye, and that its fruit was good for food, and she took thereof and ate"* (Jubilees 3:20), retelling *"And when the woman saw that the tree was good for food... she took of the fruit thereof, and did eat"* (Genesis 3:6). The deception that breaks the first man is the oldest story in the world — and the oldest war. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53062
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-curse-and-expulsion',
       E'Sorrow, thorns, dust, and the coats of skin',
       E'The judgment in Jubilees is the judgment of Genesis 3, quoted back: to the woman, *"I shall greatly multiply your sorrow and your pains in sorrow you shall bring forth children"* (Jubilees 3:24), retelling *"I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children"* (Genesis 3:16); to the man, *"cursed be the ground for your sake: thorns and thistles shall it bring forth to you... for earth you are, and to earth shall you return"* (Jubilees 3:25), the very sentence of *"cursed is the ground for thy sake... for dust thou art, and unto dust shalt thou return"* (Genesis 3:17-19). Then the mercy: *"And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden"* (Jubilees 3:26), the covering of *"Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them"* (Genesis 3:21). The expulsion and the covering are the same in both — and the covering is already the shadow of an offering.',
       sv.verse_id, ev.verse_id, 'extras', 53065
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-adam-the-priest-offers-incense',
       E'Adam''s morning offering — the first incense outside Eden',
       E'Jubilees adds a detail Genesis only implies: on the day he left the garden, Adam offered worship like a priest. *"And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun"* (Jubilees 3:27). Frankincense, galbanum, and stacte are the very holy incense the Torah will later prescribe for the sanctuary — Adam is keeping the heavenly pattern before there is a tabernacle. And the law that follows is grounded in the heavenly tables again: *"it is prescribed on the heavenly tables... that they should cover their shame, and should not uncover themselves as the nations uncover themselves"* (Jubilees 3:30) — the seed kept holy and separate from the nations, even in the matter of shame. The covering Yahuah gave in skins (Genesis 3:21) becomes a standing testimony that Yahuah''s people are not like the nations. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53068
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-3-adam-names-the-creatures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:25 — *And Elohim (God) made the beast of the earth after his kind, and cattle after their kind, and every thing that creepeth upon the earth after his kind: and Elohim (God) saw that it was good.* The very creatures Jubilees 3:1 says were brought to Adam "according to their kinds" are the kinds the Creator made.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-names-the-creatures'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Jubilees 3:2 retells this scene word for theme: as Adam called them, so was their name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-names-the-creatures'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:20 — *And Adam gave names to all cattle, and to the fowl of the air, and to every beast of the field; but for Adam there was not found an help meet for him.* Jubilees 3:3 echoes the same ache exactly — Adam saw every kind "but he was alone and found no helpmeet for him."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-names-the-creatures'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-woman-from-the-rib-one-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* Jubilees 3:4 quotes the same divine resolve: "It is not good that the man should be alone: let us make a helpmeet for him."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-woman-from-the-rib-one-flesh'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* This is the very deep sleep and the rib Jubilees 3:5 says became "the origin of the woman from amongst his ribs."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-woman-from-the-rib-one-flesh'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Adam''s words in Jubilees 3:6 are this confession; the one-flesh ordinance is woven straight from it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-woman-from-the-rib-one-flesh'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 19:5 — *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* Yahusha appeals to the same creation ordinance Jubilees 3:6 records as given from the second week — "man and wife be one."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-woman-from-the-rib-one-flesh'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-law-of-purification-grounded-in-eve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 12:2 — *Speak unto the children of Yashar''el (Israel), saying, If a woman have conceived seed, and born a man child: then she shall be unclean seven days; according to the days of the separation for her infirmity shall she be unclean.* Jubilees 3:8 anchors this seven-day purification for a male in Eve and the creation weeks themselves.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-law-of-purification-grounded-in-eve'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 12:4 — *And she shall then continue in the blood of her purifying three and thirty days; she shall touch no hallowed thing, nor come into the sanctuary, until the days of her purifying be fulfilled.* Jubilees 3:10 quotes this same thirty-three days and sanctuary restriction as written "on the heavenly tables."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-law-of-purification-grounded-in-eve'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 12:5 — *But if she bear a maid child, then she shall be unclean two weeks, as in her separation: and she shall continue in the blood of her purifying threescore and six days.* The two weeks and sixty-six days of Jubilees 3:11 match the statute exactly, pre-engraved in Eve.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-law-of-purification-grounded-in-eve'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 12:7 — *Who shall offer it before Yahuah (LORD), and make an atonement for her; and she shall be cleansed from the issue of her blood. This is the law for her that hath born a male or a female.* Jubilees 3:13 gives the same single statute "regarding her who bears a male or a female child."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-law-of-purification-grounded-in-eve'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-eden-the-first-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:15 — *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it.* Jubilees 3:9 retells this priestly charge — Adam brought in "to till and keep" the holy garden.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-eden-the-first-sanctuary'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The garden Jubilees 3:11 calls "holier than all the earth besides" is this planted Eden of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-eden-the-first-sanctuary'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-the-serpent-and-the-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Jubilees 3:16 quotes the serpent''s opening question almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-the-serpent-and-the-fall'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The lie of Jubilees 3:19 — "You shall not surely die" — is the identical deception.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-the-serpent-and-the-fall'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Jubilees 3:19 carries the same promise that "your eyes will be opened, and you will be as gods."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-the-serpent-and-the-fall'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Jubilees 3:20-21 retells the seeing, the taking, the eating, and the giving to Adam.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-the-serpent-and-the-fall'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-curse-and-expulsion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* Jubilees 3:24 quotes this judgment on the woman almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-curse-and-expulsion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* This is the sentence Jubilees 3:25 retells: "Because you have hearkened to the voice of your wife... cursed be the ground for your sake."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-curse-and-expulsion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sweat, the bread, and the return to earth of Jubilees 3:25 are this verse.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-curse-and-expulsion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* Jubilees 3:26 retells the coats of skin and the sending forth from the garden.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-curse-and-expulsion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-adam-the-priest-offers-incense
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Adam''s offering "in the morning with the rising of the sun" (Jubilees 3:27) keeps the appointed-time reckoning the lights were set for — the moedim engraved from creation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-the-priest-offers-incense'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The covering Jubilees 3:30 prescribes "on the heavenly tables" — that they not uncover themselves as the nations do — flows from this first God-given covering.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-the-priest-offers-incense'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

