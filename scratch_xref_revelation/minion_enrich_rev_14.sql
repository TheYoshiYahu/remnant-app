-- S227 enrichment — Revelation 14: 144,000 on Zion, everlasting gospel, Babylon, the commandment-keepers
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the-lamb-on-mount-sion-the-144000 — add Ezekiel 37:22 (one nation, no more two) + 2 Esdras 2 (the sealed company on Sion)
  ('canon','revelation',14,1,'canon','ezekiel',37,22,'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). The 144,000 *of all the tribes of the children of Yashar''el (Israel)* stand with the Lamb on mount Sion (Revelation 14:1; cf. 7:4) — and this is the very end the prophet was shown when he joined the two sticks: *I will make them one nation... they shall be no more two nations.* The two-house seed, Judah and Ephraim/Joseph, are not two kingdoms any longer but one people under one king, gathered home upon the mountains of Yashar''el (Israel). The number on Zion is the reunited house made whole, not a people that erases the tribes.'),
  ('canon','revelation',14,1,'apocrypha','2-esdras',2,42,'extras', E'*I Esdras saw upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs.* (2 Esdras 2:42). The restored library set the same company on the same mountain: *upon the mount Sion a great people, whom I could not number,* praising Elohim (God) *with songs* — the very scene John beholds when *a Lamb stood on the mount Sion, and with him an hundred forty and four thousand* (Revelation 14:1), who *sung as it were a new song before the throne* (Revelation 14:3). The gathered on Zion, beyond numbering, lifting the song of the redeemed: one vision across the library of the people brought home to the holy hill.'),
  ('canon','revelation',14,3,'apocrypha','2-esdras',2,45,'extras', E'*He answered and said to me, These be they that have put off the mortal clothing, and put on the immortal, and have confessed the name of Yahuah (God): now are they crowned, and receive palms.* (2 Esdras 2:45). The company on Sion are *they that... have confessed the name of Yahuah (God)* and *now are... crowned, and receive palms* — the redeemed who bear *his Father''s name written in their foreheads* (Revelation 14:1) and sing the new song none could learn *but the hundred and forty and four thousand, which were redeemed from the earth* (Revelation 14:3). The crowned palm-bearers of the restored library and the sealed firstfruits of John are one gathered multitude, marked by the Name and brought through to praise.'),

  -- thread: the-everlasting-gospel-worship-him-that-made — add Psalm 96:5, Psalm 96:13, Isaiah 40:26, 1 Enoch 5:1
  ('canon','revelation',14,7,'canon','psalms',96,5,'free', E'*For all the gods of the nations are idols: but Yahuah (LORD) made the heavens.* (Psalm 96:5). The everlasting gospel sends every nation back from its idols to the Maker: *worship him that made heaven, and earth, and the sea, and the fountains of waters* (Revelation 14:7). The psalm draws the same line — *all the gods of the nations are idols: but Yahuah (LORD) made the heavens.* Over against the beast and his image, the gospel proclaims the One who made the heavens; worship belongs not to the works of men''s hands but to the Creator of all.'),
  ('canon','revelation',14,7,'canon','psalms',96,13,'free', E'*Before Yahuah (LORD): for he cometh, for he cometh to judge the earth: he shall judge the world with righteousness, and the people with his truth.* (Psalm 96:13). The angel cries *Fear Elohim (God), and give glory to him; for the hour of his judgment is come* (Revelation 14:7) — the very hour the psalm sang in advance: *he cometh to judge the earth... he shall judge the world with righteousness.* The summons to worship the Maker and the announcement that the hour of judgment is come are one word, for the Creator is the Judge; the gospel calls the nations to fear and glorify him before he comes to judge the world in righteousness.'),
  ('canon','revelation',14,7,'canon','isaiah',40,26,'free', E'*Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number: he calleth them all by names by the greatness of his might, for that he is strong in power; not one faileth.* (Isaiah 40:26). To *worship him that made heaven* (Revelation 14:7) is to lift the eyes to the One Isaiah names — *behold who hath created these things, that bringeth out their host by number.* The Maker of the starry host, who calls them all by name and lets not one fail, is the One the everlasting gospel summons all flesh to fear and to glorify; the heavens themselves preach the Creator the gospel names.'),
  ('canon','revelation',14,7,'enoch','1-enoch',5,1,'extras', E'*Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* (1 Enoch 5:1). The everlasting gospel''s call — *worship him that made heaven, and earth, and the sea* (Revelation 14:7) — is the call the restored library raises from the works of creation: *give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The seasons and the trees and the host of heaven all testify of the Maker; the gospel and the library alike send the heart from the made things to the One who liveth for ever and made them.'),

  -- thread: babylon-is-fallen-is-fallen — add Jeremiah 51:7 (the golden cup) + Daniel 4:30 (the pride of Babylon)
  ('canon','revelation',14,8,'canon','jeremiah',51,7,'free', E'*Babylon hath been a golden cup in the LORD''S hand, that made all the earth drunken: the nations have drunken of her wine; therefore the nations are mad.* (Jeremiah 51:7). The angel''s charge — *she made all nations drink of the wine of the wrath of her fornication* (Revelation 14:8) — is Jeremiah''s golden cup: *a golden cup in the LORD''S hand, that made all the earth drunken: the nations have drunken of her wine.* The cup that intoxicated the nations and the cup of her fornication are one cup; the great city of the last days pours the same wine the prophet saw Babylon pour, and falls under the same word.'),
  ('canon','revelation',14,8,'canon','daniel',4,30,'free', E'*The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* (Daniel 4:30). *Babylon is fallen, is fallen, that great city* (Revelation 14:8) — and Daniel showed the pride that goes before that fall: *Is not this great Babylon, that I have built... for the honour of my majesty?* In the boast of *great Babylon* the king was abased that very hour; so the great city, drunk with her own glory and her fornication, is fallen. The pride of Babylon is the seed of her ruin, announced before it falls as a sure word.'),

  -- thread: here-are-they-that-keep-the-commandments — add Daniel 7:25 (the saints worn by the beast) + 2 Esdras 2:40 (those who fulfilled the law)
  ('canon','revelation',14,12,'canon','daniel',7,25,'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). *Here is the patience of the saints: here are they that keep the commandments of Elohim (God)* (Revelation 14:12) — and Daniel named the trial that patience endures: the beast-power that *wear[s] out the saints* and *think[s] to change times and laws.* The saints are worn but not overcome, given into his hand only *until a time and times and the dividing of time.* Their patience is the holding-fast of the commandment-keepers through the very season the beast wars on the law; the appointed end is fixed, and the saints keep the times and laws he would change.'),
  ('canon','revelation',14,12,'apocrypha','2-esdras',2,40,'extras', E'*Take your number, O Sion, and shut up those of yours that are clothed in white, which have fulfilled the law of Yahuah (God).* (2 Esdras 2:40). The saints of the book are *they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus)* (Revelation 14:12) — and the restored library marks the gathered of Sion by the same sign: *those... clothed in white, which have fulfilled the law of Yahuah (God).* The law-keepers clothed in white and the commandment-keepers holding the faith are one company; the patience of the saints is the patience of those who fulfilled the law, numbered and kept on Zion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- the-lamb-on-mount-sion-the-144000-sealed-the-regathering-joel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 37:22 — *I will make them one nation... they shall be no more two nations, neither shall they be divided into two kingdoms any more* the climax of the two sticks; the 144,000 are the reunited house made one under one king (Revelation 14:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-lamb-on-mount-sion-the-144000-sealed-the-regathering-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 2:42 — *upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs* the restored library''s company on Sion, beyond number, singing the song of the redeemed (Revelation 14:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-lamb-on-mount-sion-the-144000-sealed-the-regathering-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'2 Esdras 2:45 — *they that... have confessed the name of Yahuah (God): now are they crowned, and receive palms* the crowned palm-bearers who bear the Name; the sealed with the Father''s name in their foreheads (Revelation 14:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-lamb-on-mount-sion-the-144000-sealed-the-regathering-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 96:5 — *all the gods of the nations are idols: but Yahuah (LORD) made the heavens* the gospel turns the nations from idols to the Maker of the heavens; worship him that made heaven and earth (Revelation 14:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 96:13 — *he cometh to judge the earth: he shall judge the world with righteousness* the hour of judgment the angel proclaims; the Maker is the Judge who comes in righteousness (Revelation 14:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Isaiah 40:26 — *behold who hath created these things, that bringeth out their host by number... not one faileth* the Maker of the starry host the gospel names; lift the eyes to the Creator and worship him (Revelation 14:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'1 Enoch 5:1 — *give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so* the restored library''s call from the made things to the eternal Maker; the everlasting gospel''s very summons (Revelation 14:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-the-everlasting-gospel-worship-him-that-made-heaven-and-earth-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- babylon-is-fallen-is-fallen-isaiah-21-jeremiah-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 51:7 — *Babylon hath been a golden cup in the LORD''S hand, that made all the earth drunken: the nations have drunken of her wine* the golden cup that intoxicated the nations; the wine of her fornication is the same cup (Revelation 14:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-babylon-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 4:30 — *Is not this great Babylon, that I have built... for the honour of my majesty?* the pride of great Babylon, abased that very hour; the seed of her fall (Revelation 14:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-babylon-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- here-are-they-that-keep-the-commandments-of-elohim-malachi-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:25 — *shall wear out the saints of the El Elyon (most High)... until a time and times and the dividing of time* the trial the saints'' patience endures; worn but not overcome, the commandment-keepers held to the appointed end (Revelation 14:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-here-are-they-that-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 2:40 — *those of yours that are clothed in white, which have fulfilled the law of Yahuah (God)* the law-keepers of Sion clothed in white; the same sign as they that keep the commandments and the faith of Yahusha (Jesus) (Revelation 14:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-14-here-are-they-that-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
