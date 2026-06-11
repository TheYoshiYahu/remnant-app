-- S227 enrichment — Revelation 22: the river of life, seeing his face & the name, no night, Alpha & Omega / root of David, the tree-of-life commandments, the Spirit and the bride
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- the pure river of water of life (has Ezek 47, Zech 14:8, Gen 2:10): add Joel 3:18, Psalm 46:4 (prophetic)
  ('canon','revelation',22,1,'canon','joel',3,18,'free', E'*...and all the rivers of Yahudah (Judah) shall flow with waters, and a fountain shall come forth of the house of Yahuah (LORD), and shall water the valley of Shittim.* (Joel 3:18). The angel shows *a pure river of water of life... proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). Joel saw the fountain that issues *of the house of Yahuah (LORD)* — the temple-spring watering the dry valley. The river from the throne is that fountain of the house of Yahuah (LORD), the living waters the prophet promised flowing from the sanctuary.'),
  ('canon','revelation',22,1,'canon','psalms',46,4,'free', E'*There is a river, the streams whereof shall make glad the city of Elohim (God), the holy place of the tabernacles of the El Elyon (most High).* (Psalm 46:4). The river of life flows *in the midst of the street of it* (Revelation 22:1-2). The psalm sang of the river whose streams gladden *the city of Elohim (God)* — the holy city watered by streams of life. The river of water of life running through the New Jerusalem is that gladdening river of the city of God come to its fullness.'),

  -- they shall see his face, his name in their foreheads (P=0; has Exod 33:20, Ps 17:15, Num 6:25): add Isaiah 33:17, Numbers 6:27, Psalm 42:2
  ('canon','revelation',22,4,'canon','isaiah',33,17,'free', E'*Thine eyes shall see the king in his beauty: they shall behold the land that is very far off.* (Isaiah 33:17). *And they shall see his face; and his name shall be in their foreheads* (Revelation 22:4). What no man could do — *there shall no man see me, and live* — is granted at the last: Isaiah promised the eyes that *shall see the king in his beauty.* The face-to-face sight of God, denied to Moses, is the servants'' portion in the city, the vision the prophet foretold.'),
  ('canon','revelation',22,4,'canon','numbers',6,27,'free', E'*And they shall put my name upon the children of Yashar''el (Israel); and I will bless them.* (Numbers 6:27). The servants *shall see his face; and his name shall be in their foreheads* (Revelation 22:4). The priestly blessing set the divine Name upon Israel — *they shall put my name upon the children of Yashar''el (Israel).* The Name in the foreheads is that blessing made indelible: the sealed servants bear the very Name the priests pronounced over the people, the true seal against the mark.'),
  ('canon','revelation',22,4,'canon','psalms',42,2,'free', E'*My soul thirsteth for Elohim (God), for the living Elohim (God): when shall I come and appear before Elohim (God)?* (Psalm 42:2). In the city the servants *shall see his face* (Revelation 22:4). The psalmist''s thirst — *when shall I come and appear before Elohim (God)?* — is answered at the river of life: the longed-for appearing before the living God is granted, his servants serving him and beholding his face.'),

  -- no night, no sun, they reign for ever (has Isaiah 60, Daniel 7:18/27): add Zechariah 14:7 (prophetic)
  ('canon','revelation',22,5,'canon','zechariah',14,7,'free', E'*But it shall be one day which shall be known to Yahuah (LORD), not day, nor night: but it shall come to pass, that at evening time it shall be light.* (Zechariah 14:7). *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light* (Revelation 22:5). Zechariah knew the day that is no day and no night, lit without sun. The endless light of the city, where the servants reign for ever and ever, is that single Yahuah-day the prophet foresaw.'),

  -- Alpha & Omega, the root and offspring of David (has Isaiah 44:6, 11:1/10, Num 24:17): add Isaiah 48:12, Jeremiah 23:5
  ('canon','revelation',22,13,'canon','isaiah',48,12,'free', E'*Hearken unto me, O Jacob and Yashar''el (Israel), my called; I am he; I am the first, I also am the last.* (Isaiah 48:12). *I am Alpha and Omega, the beginning and the end, the first and the last* (Revelation 22:13). The title belongs to Yahuah (LORD) alone, spoken to Jacob — *I am the first, I also am the last.* The Formed who is the root and offspring of David takes the very name of the One who called Israel: Alpha and Omega is Isaiah''s first-and-last come in flesh.'),
  ('canon','revelation',22,16,'canon','jeremiah',23,5,'free', E'*...I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth.* (Jeremiah 23:5). *I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16). Jeremiah named him the *righteous Branch* raised unto David, the King who reigns and does justice in the earth. The offspring of David who is the morning star is that Branch — Davidic king and bright star together, reigning upon the earth as the prophet promised.'),

  -- blessed are they that do his commandments, the tree of life (has Deut 30:16, Mal 4:4, Ps 1:2, Gen 3:24, 2 Esdras 8:52): add Proverbs 3:18
  ('canon','revelation',22,14,'canon','proverbs',3,18,'free', E'*She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* (Proverbs 3:18). *Blessed are they that do his commandments, that they may have right to the tree of life* (Revelation 22:14). Wisdom — which is the keeping of Yahuah''s (LORD''s) instruction — is *a tree of life to them that lay hold upon her.* The right to the tree of life belongs to the doers of the commandments: those who lay hold of Torah-wisdom are the blessed who eat of the tree.'),

  -- the Spirit and the bride say Come; the warning not to add (has Isaiah 55:1, Deut 4:2/12:32, Prov 30:6): add Isaiah 55:3, Proverbs 30:5
  ('canon','revelation',22,17,'canon','isaiah',55,3,'free', E'*Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David.* (Isaiah 55:3). *And let him that is athirst come. And whosoever will, let him take the water of life freely* (Revelation 22:17). Isaiah''s call to the thirsty is the Spirit and the bride''s *Come* — *come unto me: hear, and your soul shall live.* The freely-given water of life is the everlasting covenant of the sure mercies of David, offered to whosoever will.'),
  ('canon','revelation',22,18,'canon','proverbs',30,5,'free', E'*Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him.* (Proverbs 30:5). The warning seals the book: *If any man shall add unto these things... and if any man shall take away* (Revelation 22:18-19). The proverb that forbids adding to the word first declares why — *every word of Elohim (God) is pure*: nothing may be added to or taken from what is already perfect, the same charge as *ye shall not add unto the word.* The pure word is to be kept whole, neither augmented nor diminished.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- the pure river of water of life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Joel 3:18 — *a fountain shall come forth of the house of Yahuah (LORD)* the temple-spring watering the dry valley, the river of life proceeding out of the throne (Revelation 22:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-the-pure-river-of-water-of-life-from-the-throne-ezekiel-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 46:4 — *There is a river, the streams whereof shall make glad the city of Elohim (God)* the river that gladdens the holy city, the water of life through the New Jerusalem (Revelation 22:1-2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-the-pure-river-of-water-of-life-from-the-throne-ezekiel-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- they shall see his face, his name in their foreheads
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 33:17 — *Thine eyes shall see the king in his beauty* the face-to-face sight denied to Moses, granted the servants who see his face (Revelation 22:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-they-shall-see-his-face-his-name-in-their-foreheads-exodus-33'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=33 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Numbers 6:27 — *they shall put my name upon the children of Yashar''el (Israel); and I will bless them* the priestly blessing setting the Name on Israel, the Name in the foreheads of the servants (Revelation 22:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-they-shall-see-his-face-his-name-in-their-foreheads-exodus-33'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Psalm 42:2 — *when shall I come and appear before Elohim (God)?* the psalmist''s thirst to appear before the living God, answered as his servants see his face (Revelation 22:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-they-shall-see-his-face-his-name-in-their-foreheads-exodus-33'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=42 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- no night, no sun, they reign for ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 14:7 — *not day, nor night: but... at evening time it shall be light* the one Yahuah-day lit without sun, the city with no night where the servants reign for ever (Revelation 22:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-no-night-no-sun-yahuah-giveth-them-light-and-they-reign-isaiah-60'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Alpha & Omega, the root and offspring of David
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 48:12 — *I am he; I am the first, I also am the last* the title of Yahuah (LORD) spoken to Jacob, taken by the root of David — Alpha and Omega (Revelation 22:13).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-i-am-alpha-and-omega-the-root-and-offspring-of-david-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 23:5 — *I will raise unto David a righteous Branch, and a King shall reign... in the earth* the Davidic Branch who reigns on the earth, the root and offspring of David, the morning star (Revelation 22:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-i-am-alpha-and-omega-the-root-and-offspring-of-david-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- blessed are they that do his commandments, the tree of life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her* Torah-wisdom as the tree of life, the right to the tree given the doers of the commandments (Revelation 22:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-blessed-are-they-that-do-his-commandments-the-tree-of-life-crown-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the Spirit and the bride say Come; the warning not to add
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 55:3 — *Incline your ear, and come unto me: hear, and your soul shall live* the call to the thirsty, the Spirit and the bride''s *Come*, the water of life freely given (Revelation 22:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-the-spirit-and-the-bride-say-come-and-the-warning-not-to-add-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Proverbs 30:5 — *Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him* the pure word that may not be added to, the warning not to add or take away (Revelation 22:18-19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-22-the-spirit-and-the-bride-say-come-and-the-warning-not-to-add-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=22 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
