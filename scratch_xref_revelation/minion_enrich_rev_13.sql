-- S227 enrichment — Revelation 13: the two beasts & the mark (Daniel beasts, the worship, the seal counterfeited)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the-beast-from-the-sea — add Daniel 7:24 (ten horns = ten kings) + 2 Esdras 11:39 (the last of the four beasts)
  ('canon','revelation',13,1,'canon','daniel',7,24,'free', E'*And the ten horns out of this kingdom are ten kings that shall arise: and another shall rise after them; and he shall be diverse from the first, and he shall subdue three kings.* (Daniel 7:24). The beast rises *having seven heads and ten horns, and upon his horns ten crowns* (Revelation 13:1), and Daniel told what the ten horns are: *ten kings that shall arise* out of the fourth kingdom. The crowned horns of John''s beast are the crowned kings of Daniel''s fourth kingdom — the same diadems, the same dominion divided among the kings of the last empire, gathered upon the one composite beast.'),
  ('canon','revelation',13,1,'apocrypha','2-esdras',11,39,'extras', E'*Art not you it that remainest of the four beasts, whom I made to reign in my world, that the end of their times might come through them?* (2 Esdras 11:39). The voice rebukes Ezra''s eagle as the last of *the four beasts* whom the Most High *made to reign in my world* — Daniel''s four kingdoms again, the eagle the surviving fourth. So John''s beast *rise[s] up out of the sea, having seven heads and ten horns* (Revelation 13:1): the one composite is the remnant of the four beasts, the last reign before the appointed end of their times comes upon them. The library names the same succession of empires brought to its head and its end.'),

  -- thread: the-dragon-gave-him-his-power-all-the-world-worshipped — add Daniel 3:4 (the herald to all peoples, nations, languages)
  ('canon','revelation',13,3,'canon','daniel',3,4,'free', E'*Then an herald cried aloud, To you it is commanded, O people, nations, and languages,* (Daniel 3:4). On the plain of Dura a herald commanded *people, nations, and languages* to worship the golden image; and *all the world wondered after the beast* (Revelation 13:3). The same summons that went out to every people and nation and tongue before the image is the worship now drawn after the beast over the whole earth. The herald''s reach was one province; the beast''s is the world — but the demand is one demand, the compelled worship of the image lifted to fill all the earth.'),

  -- thread: a-mouth-speaking-great-things-and-blasphemies — add Daniel 7:11 (the beast slain for the great words of the horn)
  ('canon','revelation',13,5,'canon','daniel',7,11,'free', E'*I beheld then because of the voice of the great words which the horn spake: I beheld even till the beast was slain, and his body destroyed, and given to the burning flame.* (Daniel 7:11). The beast is given *a mouth speaking great things and blasphemies* for *forty and two months* (Revelation 13:5) — but Daniel watched the end of that loud mouth: *because of the voice of the great words which the horn spake,* he beheld *till the beast was slain... and given to the burning flame.* The boasting mouth is the very thing that seals the beast''s doom; the great words sound only for the appointed season, and then the body is destroyed and given to the fire.'),

  -- thread: names-not-written-in-the-book-of-life — add 1 Enoch 47:3 (the books of the living opened) + 108:3 (names blotted out of the book of life)
  ('canon','revelation',13,8,'enoch','1-enoch',47,3,'extras', E'*In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* (1 Enoch 47:3). The book John names — *the book of life of the Lamb slain* (Revelation 13:8) — is the *books of the living* the restored library saw *opened before* the Head of Days upon the throne of his glory. The register of the living is no new thing of the last day; it is opened in heaven before the throne, the names long written there, and the worshippers of the beast are those not found in it.'),
  ('canon','revelation',13,8,'enoch','1-enoch',108,3,'extras', E'*Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever* (1 Enoch 108:3). The library knows the book of life and the dreadful blotting-out: *their names shall be blotted out of the book of life.* John sees the same book — those *whose names are not written in the book of life of the Lamb slain* (Revelation 13:8) worship the beast. The framework''s order holds across the library: names are blotted out, never added; to belong to the Lamb is to have a name kept in the book from the foundation, and the patience of the saints rests on that writing.'),

  -- thread: the-mark-in-the-hand-and-forehead — add Exodus 13:9 (the sign on the hand, the Torah in the mouth)
  ('canon','revelation',13,16,'canon','exodus',13,9,'free', E'*And it shall be for a sign unto thee upon thine hand, and for a memorial between thine eyes, that the LORD''S law may be in thy mouth: for with a strong hand hath Yahuah (LORD) brought thee out of Egypt.* (Exodus 13:9). The true sign on hand and brow is the sign of the Torah: *a sign unto thee upon thine hand, and... a memorial between thine eyes, that the LORD''S law may be in thy mouth.* The beast''s mark *in their right hand, or in their foreheads* (Revelation 13:16) is the counterfeit of exactly this — the law of Yahuah (LORD) on the hand and between the eyes, the token of the redeemed brought out of Egypt, parodied by the brand of the beast on the same hand and brow. The mark is the anti-Torah inversion of the sign that the LORD''S law is in his people''s mouth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:24 — *the ten horns out of this kingdom are ten kings that shall arise* the crowned horns of the beast are the kings of Daniel''s fourth kingdom, *ten horns... ten crowns* (Revelation 13:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 11:39 — *Art not you it that remainest of the four beasts, whom I made to reign in my world* the eagle named the last of Daniel''s four beasts; the composite beast is that surviving fourth reign (Revelation 13:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-the-beast-from-the-sea-the-four-beasts-of-daniel-gathered-into-one'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=11 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 3:4 — *an herald cried aloud, To you it is commanded, O people, nations, and languages* the herald''s summons to every people to worship the image, lifted to fill the earth, *all the world wondered after the beast* (Revelation 13:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-the-dragon-gave-him-his-power-all-the-world-wondered-and-worshipped'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:11 — *because of the voice of the great words which the horn spake... till the beast was slain... and given to the burning flame* the boasting mouth seals the beast''s doom; the great words sound only for the appointed season (Revelation 13:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-a-mouth-speaking-great-things-and-blasphemies-forty-and-two-months'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- names-not-written-in-the-book-of-life-of-the-lamb-slain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 47:3 — *the Head of Days... seated Himself upon the throne of His glory, And the books of the living were opened before Him* the register of the living opened in heaven before the throne; the names written there before the beast rose (Revelation 13:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 108:3 — *their names shall be blotted out of the book of life, And out of the books of the holy ones* the book of life and the blotting-out; names are blotted out, never added — the beast''s worshippers are not found written there (Revelation 13:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-names-not-written-in-the-book-of-life-of-the-lamb-slain'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Exodus 13:9 — *a sign unto thee upon thine hand, and for a memorial between thine eyes, that the LORD''S law may be in thy mouth* the Torah-sign on hand and brow that the beast''s mark counterfeits; the law of Yahuah (LORD), not the beast''s name (Revelation 13:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-13-the-mark-in-the-hand-and-forehead-counterfeit-of-the-seal'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
