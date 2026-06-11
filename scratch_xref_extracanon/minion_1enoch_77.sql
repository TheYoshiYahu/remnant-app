-- ----- fragment: minion_1enoch_77.sql (session250 1-enoch 77) -----
-- Source anchor: enoch/1-enoch ch77. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en77 (view _session250_en77_lookup). Sort band base 51900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en77_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-77-four-quarters-of-the-earth
  ('enoch', '1-enoch', 77, 3, 'canon', 'genesis', 2, 8, 'free', E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* Enoch''s "garden of righteousness" set in a quarter of the earth is the same Edenic garden of the Torah''s creation account.'),
  ('enoch', '1-enoch', 77, 1, 'canon', 'revelation', 7, 1, 'free', E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* John sees the same four-quartered earth Enoch maps, the Creator''s fixed frame held by His angels.'),
  -- thread: 1-enoch-77-tree-of-wisdom-paradise
  ('enoch', '1-enoch', 77, 7, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* Enoch''s "tree of wisdom" in the paradise of righteousness is the Torah''s tree set in the midst of the garden.'),
  ('enoch', '1-enoch', 77, 7, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Enoch''s words "his eyes are opened" repeat Eden''s account of the fruit that opened the eyes of Adam and his wife.'),
  ('enoch', '1-enoch', 77, 8, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The fruitful tree of the paradise of righteousness stands restored in the New Jerusalem.'),
  ('enoch', '1-enoch', 77, 8, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s tree by the river from the sanctuary matches Enoch''s beautiful, far-fragrant tree of the garden.'),
  -- thread: 1-enoch-77-prison-stars-transgressed-times
  ('enoch', '1-enoch', 77, 11, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The stars Enoch sees imprisoned failed the very task creation gave the lights — to mark the appointed times (the moedim); the stars that "did not come forth at their appointed times" broke this order.'),
  ('enoch', '1-enoch', 77, 11, 'enoch', '1-enoch', 21, 6, 'extras', E'1 Enoch 21:6 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* The Astronomical Book repeats word for word the earlier vision of the prison of the transgressing stars.'),
  ('enoch', '1-enoch', 77, 10, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter carries forward the same host bound in a prison and reserved for judgement that Enoch sees in the waste place.'),
  ('enoch', '1-enoch', 77, 11, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude names the lawless as "wandering stars" reserved for darkness — the very imagery of Enoch''s stars that strayed from their appointed times.'),
  ('enoch', '1-enoch', 77, 11, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The host of heaven men are forbidden to worship is the same host Enoch sees judged — creatures set under the Creator''s order, never gods.'),
  ('enoch', '1-enoch', 77, 11, 'jubilees', 'jubilees', 6, 32, 'extras', E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts. But if they do neglect and do not observe them according to His commandment, then they will disturb all their seasons, and the years will be dislodged from this (order), and they will disturb the seasons and the years will be dislodged and they will neglect their ordinances.* Jubilees commands the 364-day solar reckoning whose neglect disturbs every feast — the human counterpart to Enoch''s stars that abandoned their appointed times.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en77_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en77_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-77-four-quarters-of-the-earth',
       E'The four quarters of the earth and the garden in the north',
       E'Enoch surveys the whole frame of creation by its directions: *And the first quarter is called the east, because it is the first: and the second, the south, because the Most High descends there, yea, there in quite a special sense He who is blessed for ever comes down.* (1 Enoch 77:1), and *the fourth quarter, called the north, is divided into three parts: one of them is for the habitation of men, the second for the great seas, with the valleys and forests and rivers, and darkness and clouds; and the third part with the garden of righteousness.* (1 Enoch 77:3). This is the canon''s own ordered cosmos. The garden was set in the east of Eden — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* (Genesis 2:8) — and the same four-fold earth stands when judgement is marshalled: *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* (Revelation 7:1). The Creator''s order is one order from Genesis to Revelation: not invented by men, but laid into the world He made.',
       sv.verse_id, ev.verse_id, 'extras', 51900
  FROM _session250_en77_lookup sv, _session250_en77_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=77 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-77-tree-of-wisdom-paradise',
       E'The tree of wisdom in the paradise of righteousness',
       E'In the north quarter Enoch comes to the garden: *And I saw the paradise of righteousness, and the tree of wisdom, of whose fruit if one eats he becomes wise, and his eyes are opened.* (1 Enoch 77:7), *And this tree is in the north, and its fruit is like clusters of the vine, very beautiful: and the fragrance of the tree penetrates far beyond the tree.* (1 Enoch 77:8). This is Eden''s own tree — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* (Genesis 2:9) — and Enoch''s very phrase "his eyes are opened" echoes the fall: *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* (Genesis 3:7). Yet the garden of righteousness is not lost forever; the tree of life stands again in the restored city — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* (Revelation 22:2) — and Ezekiel saw it lining the river from the sanctuary: *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* (Ezekiel 47:12). It ain''t new: Enoch''s paradise is the canon''s Eden, lost and restored.',
       sv.verse_id, ev.verse_id, 'extras', 51903
  FROM _session250_en77_lookup sv, _session250_en77_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=77 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-77-prison-stars-transgressed-times',
       E'The prison of the stars that did not come forth at their appointed times',
       E'Opposite the garden Enoch sees a waste place that is a prison for the host of heaven: *And I saw seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: ''This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 77:10), and the charge against them is precise — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) of Spirits in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 77:11). Their sin is a calendar sin: they broke the moedim, the appointed times set into the lights at creation — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14). The Astronomical Book speaks the same warning twice before: *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 21:6). The New Testament carries the very same bound-and-reserved hosts forward: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4), and Jude names them as the lawless lights — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* (Jude 1:13). And the same lights that men are warned never to worship as gods are the host that Enoch sees judged: *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* (Deuteronomy 4:19). The reckoning is the Creator''s covenant — Jubilees commands the very 364-day order whose neglect disturbs every feast: *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts...* (Jubilees 6:32). The transgressing stars are the cosmic emblem of a perverted calendar; the right reckoning is fidelity, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51906
  FROM _session250_en77_lookup sv, _session250_en77_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=77 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-77-four-quarters-of-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* Enoch''s "garden of righteousness" set in a quarter of the earth is the same Edenic garden of the Torah''s creation account.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-four-quarters-of-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* John sees the same four-quartered earth Enoch maps, the Creator''s fixed frame held by His angels.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-four-quarters-of-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-77-tree-of-wisdom-paradise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* Enoch''s "tree of wisdom" in the paradise of righteousness is the Torah''s tree set in the midst of the garden.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-tree-of-wisdom-paradise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* Enoch''s words "his eyes are opened" repeat Eden''s account of the fruit that opened the eyes of Adam and his wife.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-tree-of-wisdom-paradise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The fruitful tree of the paradise of righteousness stands restored in the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-tree-of-wisdom-paradise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* Ezekiel''s tree by the river from the sanctuary matches Enoch''s beautiful, far-fragrant tree of the garden.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-tree-of-wisdom-paradise'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-77-prison-stars-transgressed-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The stars Enoch sees imprisoned failed the very task creation gave the lights — to mark the appointed times (the moedim); the stars that "did not come forth at their appointed times" broke this order.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-prison-stars-transgressed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 21:6 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* The Astronomical Book repeats word for word the earlier vision of the prison of the transgressing stars.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-prison-stars-transgressed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter carries forward the same host bound in a prison and reserved for judgement that Enoch sees in the waste place.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-prison-stars-transgressed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude names the lawless as "wandering stars" reserved for darkness — the very imagery of Enoch''s stars that strayed from their appointed times.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-prison-stars-transgressed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The host of heaven men are forbidden to worship is the same host Enoch sees judged — creatures set under the Creator''s order, never gods.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-prison-stars-transgressed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts; for everything will fall out in them according to their testimony, and they will not leave out any day nor disturb any feasts. But if they do neglect and do not observe them according to His commandment, then they will disturb all their seasons, and the years will be dislodged from this (order), and they will disturb the seasons and the years will be dislodged and they will neglect their ordinances.* Jubilees commands the 364-day solar reckoning whose neglect disturbs every feast — the human counterpart to Enoch''s stars that abandoned their appointed times.'
  FROM cross_reference_threads t, cross_references x, _session250_en77_lookup sv, _session250_en77_lookup tv
 WHERE t.slug='1-enoch-77-prison-stars-transgressed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=77 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

