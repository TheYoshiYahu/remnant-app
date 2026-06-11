-- S227 enrichment — Revelation 20: the dragon bound, the thrones & first resurrection, priests who reign, Gog, the fire, the white throne, the second death
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- dragon bound (has 1 Enoch 10:12/13): add Azazel-bound + bound-till-judgment (extras)
  ('canon','revelation',20,2,'enoch','1-enoch',10,4,'extras', E'*And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness...* (1 Enoch 10:4). The angel *laid hold on the dragon... and bound him a thousand years, And cast him into the bottomless pit* (Revelation 20:2-3). Enoch saw the binding first — the chief of the watchers seized, bound hand and foot, and cast into darkness in a pit opened in the desert. The dragon shut in the pit is the bound adversary of the watcher-vision, held fast until the appointed judgment.'),
  ('canon','revelation',20,3,'enoch','1-enoch',18,14,'extras', E'*And He was wroth with them, and bound them till the time when their guilt should be consummated...* (1 Enoch 18:14). The dragon is bound and shut up *that he should deceive the nations no more, till the thousand years should be fulfilled* (Revelation 20:3). Enoch saw the rebels bound *till the time when their guilt should be consummated* — a fixed term, not endless, after which they are loosed to the final fire. The symbolic thousand years is that appointed term of binding the Hebrew library already knew.'),

  -- thrones & first resurrection (has 2 Esdras 7:32): add Daniel 12:13 (prophetic), 1 Enoch 51:1 (extra)
  ('canon','revelation',20,4,'canon','daniel',12,13,'free', E'*But go thou thy way till the end be: for thou shalt rest, and stand in thy lot at the end of the days.* (Daniel 12:13). They *lived and reigned with Messiah... This is the first resurrection* (Revelation 20:4-5). Daniel was promised the same — to rest, then *stand in thy lot at the end of the days*: to rise and take his portion in the kingdom. The first resurrection is the prophet''s own standing-up at the end, the righteous raised to reign.'),
  ('canon','revelation',20,5,'enoch','1-enoch',51,1,'extras', E'*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes.* (1 Enoch 51:1). *This is the first resurrection* (Revelation 20:5). Enoch named the rising — the earth and Sheol and hell rendering back the dead they held — *for in those days the Elect One shall arise* and choose the righteous and holy. The resurrection of the apocalypse is the giving-back the Hebrew library foresaw at the rising of the Elect One.'),

  -- priests of Elohim who reign (has Isaiah 61:6): add Daniel 7:18, 7:27 (prophetic)
  ('canon','revelation',20,6,'canon','daniel',7,18,'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* (Daniel 7:18). The blessed and holy *shall be priests of Elohim (God) and of Messiah, and shall reign with him a thousand years* (Revelation 20:6). Daniel saw the same — the saints taking and possessing the kingdom for ever. The priestly reign of the apocalypse is the kingdom Daniel promised would be given to the saints of the Most High, the reign of the refined remnant.'),
  ('canon','revelation',20,6,'canon','daniel',7,27,'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High)...* (Daniel 7:27). They *shall reign with him a thousand years* (Revelation 20:6). The dominion under the whole heaven given to the saints is this reign — *under the whole heaven*, upon the earth, with the holy people, not a disembodied estate; the kingdom of priests is Daniel''s everlasting kingdom of the saints come to its possession.'),

  -- Gog & Magog (has Ezekiel + Genesis 22:17): add Zechariah 12:3, 14:2 (prophetic)
  ('canon','revelation',20,8,'canon','zechariah',12,3,'free', E'*And in that day will I make Jerusalem a burdensome stone for all people: all that burden themselves with it shall be cut in pieces, though all the people of the earth be gathered together against it.* (Zechariah 12:3). Gog and Magog go up *on the breadth of the earth, and compassed the camp of the saints about, and the beloved city* (Revelation 20:8-9). Zechariah saw the same final muster — all the people of the earth gathered together against Jerusalem, only to be cut in pieces. The siege of the beloved city is the prophet''s burdensome stone, and the gathered nations break upon it.'),
  ('canon','revelation',20,8,'canon','zechariah',14,2,'free', E'*For I will gather all nations against Jerusalem to battle...* (Zechariah 14:2). The deceived nations are gathered *to battle: the number of whom is as the sand of the sea* (Revelation 20:8). Zechariah names the gathering plainly — *I will gather all nations against Jerusalem to battle* — the last assault the seer sees compassing the camp of the saints, before fire comes down and devours them.'),

  -- fire came down and devoured (has Ezek 38:22,39:6, 2 Kings 1:10, Gen 19:24): add Psalm 11:6 (prophetic)
  ('canon','revelation',20,9,'canon','psalms',11,6,'free', E'*Upon the wicked he shall rain snares, fire and brimstone, and an horrible tempest: this shall be the portion of their cup.* (Psalm 11:6). *And fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The psalm decreed the portion of the wicked — fire and brimstone rained down from heaven; the fire that devours the gathered nations around the camp is that very rain, the portion of their cup poured out at the last.'),

  -- the great white throne (S226 refined, P-only): add 2 Esdras 7:33 (extra)
  ('canon','revelation',20,11,'apocrypha','2-esdras',7,33,'extras', E'*And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end:* (2 Esdras 7:33). *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away* (Revelation 20:11). The restored library saw the same one judgment — the Most High appearing *upon the seat of judgment*, when long-suffering ends and only judgment remains. The white throne is that seat of judgment, the single great assize of the souls of the dead, not a separate later event.'),

  -- death & hell into the lake, the second death (has Hosea 13:14, Isaiah 25:8): add Daniel 12:2, Psalm 49:15 (prophetic)
  ('canon','revelation',20,14,'canon','daniel',12,2,'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Death and hell give up their dead, and *whosoever was not found written in the book of life was cast into the lake of fire. This is the second death* (Revelation 20:14-15). Daniel set the two awakenings side by side — some to everlasting life, some to shame and everlasting contempt. The second death is that everlasting contempt, the portion of the raised who are not found in the book.'),
  ('canon','revelation',20,14,'canon','psalms',49,15,'free', E'*But Elohim (God) will redeem my soul from the power of the grave: for he shall receive me. Selah.* (Psalm 49:15). *And death and hell were cast into the lake of fire* (Revelation 20:14). The psalmist''s confidence is the undoing the apocalypse seals — the grave that holds the redeemed shall not keep them; death and hell themselves are abolished, cast into the lake, and the One who redeems the soul from the grave receives his own.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- dragon bound
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 10:4 — *Bind Azâzêl hand and foot, and cast him into the darkness* the binding of the chief watcher in a pit, the dragon bound and cast into the bottomless pit (Revelation 20:2-3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 18:14 — *He was wroth with them, and bound them till the time when their guilt should be consummated* a fixed term of binding, the dragon shut up till the thousand years be fulfilled (Revelation 20:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-dragon-bound-a-thousand-years-the-old-serpent-shut-in-the-pit-isaiah-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thrones & first resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 12:13 — *thou shalt rest, and stand in thy lot at the end of the days* the prophet''s own standing-up at the end, the first resurrection of the righteous who reign (Revelation 20:4-5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 51:1 — *the earth also give back that which has been entrusted to it, And Sheol also shall give back* the earth and Sheol rendering back the dead at the rising of the Elect One, the first resurrection (Revelation 20:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-thrones-of-judgment-and-the-first-resurrection-daniel-7-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- priests who reign
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:18 — *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* the saints'' everlasting kingdom, the blessed and holy who reign as priests (Revelation 20:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 7:27 — *the kingdom and dominion... under the whole heaven, shall be given to the people of the saints* the dominion under the whole heaven, the priestly reign upon the earth with the holy people (Revelation 20:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-priests-of-elohim-the-blessed-and-holy-who-reign-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Gog & Magog
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 12:3 — *I make Jerusalem a burdensome stone for all people... though all the people of the earth be gathered together against it* the final muster against Jerusalem, Gog compassing the camp of the saints (Revelation 20:8-9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Zechariah 14:2 — *I will gather all nations against Jerusalem to battle* the prophet''s last assault on the city, the nations gathered as the sand of the sea (Revelation 20:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-gog-and-magog-gathered-the-number-as-the-sand-of-the-sea-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- fire came down and devoured them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 11:6 — *Upon the wicked he shall rain snares, fire and brimstone... this shall be the portion of their cup* the fire and brimstone rained on the wicked, the fire that devours the gathered nations (Revelation 20:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-fire-came-down-from-elohim-out-of-heaven-and-devoured-them-ezekiel-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the great white throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 7:33 — *the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end* the one great assize of the souls of the dead, the white throne whence earth and heaven flee (Revelation 20:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- death & hell into the lake, the second death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 12:2 — *many of them that sleep in the dust... shall awake, some to everlasting life, and some to shame and everlasting contempt* the two awakenings; the second death is Daniel''s everlasting contempt for those not in the book (Revelation 20:14-15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 49:15 — *Elohim (God) will redeem my soul from the power of the grave: for he shall receive me* the grave undone for the redeemed, death and hell themselves cast into the lake of fire (Revelation 20:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-20-death-and-hell-cast-into-the-lake-of-fire-the-second-death-hosea-13'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
