-- ----- fragment: minion_1enoch_89.sql (session250 1-enoch 89) -----
-- Source anchor: enoch/1-enoch ch89. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en89 (view _session250_en89_lookup). Sort band base 52200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en89_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-89-ark-and-the-flood
  ('enoch', '1-enoch', 89, 3, 'canon', 'genesis', 7, 11, 'free', E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* Enoch''s opened fountains and torrents from the high roof (89:2-3) are Genesis'' great-deep and windows-of-heaven.'),
  ('enoch', '1-enoch', 89, 4, 'canon', 'genesis', 7, 17, 'free', E'Genesis 7:17 — *And the flood was forty days upon the earth; and the waters increased, and bare up the ark, and it was lift up above the earth.* The flood rising above the enclosure while the vessel floats (89:4-6) is the ark borne up above the earth.'),
  ('enoch', '1-enoch', 89, 5, 'canon', 'genesis', 7, 23, 'free', E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* The cattle of the enclosure sinking and perishing (89:5-6) is the destruction of all flesh, only Noah remaining.'),
  ('enoch', '1-enoch', 89, 3, 'jubilees', 'jubilees', 5, 23, 'extras', E'Jubilees 5:23 — *And Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number. And the flood-gates began to pour down water from the heaven forty days and forty nights... Fifteen cubits did the waters rise above all the high mountains, And the ark was lift up above the earth.* Jubilees'' seven flood-gates match Enoch''s seven water torrents on the high roof (89:2).'),
  ('enoch', '1-enoch', 89, 1, 'apocrypha', 'ecclesiasticus', 44, 17, 'extras', E'Ecclesiasticus 44:17 — *Noah was found perfect and righteous; in the time of wrath he was taken in exchange for the world; therefore was he left as a remnant to the earth, when the flood came.* Sirach names the white bull (89:1) the righteous remnant carried through the wrath.'),
  -- thread: 1-enoch-89-sheep-from-jacob-and-egypt-the-wolves
  ('enoch', '1-enoch', 89, 14, 'canon', 'exodus', 1, 13, 'free', E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour:* The twelve sheep given over to the wolves (89:15) is Israel made to serve Egypt with rigour.'),
  ('enoch', '1-enoch', 89, 15, 'canon', 'exodus', 1, 22, 'free', E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* The wolves'' violence against the sheep (89:15,18) is Pharaoh''s order to drown the sons.'),
  ('enoch', '1-enoch', 89, 15, 'canon', 'exodus', 3, 7, 'free', E'Exodus 3:7 — *And Yahuah (LORD) said, I have surely seen the affliction of my people which are in Egypt, and have heard their cry by reason of their taskmasters; for I know their sorrows;* The Lord of the sheep who hears the sheep''s cry (89:16,19) is Yahuah hearing Israel''s cry in Egypt.'),
  ('enoch', '1-enoch', 89, 16, 'canon', 'exodus', 3, 8, 'free', E'Exodus 3:8 — *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey...* The Lord of the sheep coming down to deliver from the wolves (89:19) is Yahuah come down to deliver Israel.'),
  -- thread: 1-enoch-89-moses-the-deliverer-and-the-sea
  ('enoch', '1-enoch', 89, 18, 'canon', 'exodus', 14, 21, 'free', E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The wolves pursuing the fleeing sheep (89:18) is Pharaoh''s pursuit broken at the divided sea.'),
  ('enoch', '1-enoch', 89, 19, 'canon', 'exodus', 14, 28, 'free', E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The Lord of the sheep delivering it from the wolves (89:19) is the host of Pharaoh drowned in the returning sea.'),
  ('enoch', '1-enoch', 89, 19, 'canon', 'exodus', 14, 30, 'free', E'Exodus 14:30 — *Thus Yahuah (LORD) saved Yashar''el (Israel) that day out of the hand of the Egyptians; and Yashar''el (Israel) saw the Egyptians dead upon the sea shore.* The Lord of the sheep heard its cry and delivered it from the wolves (89:19) — Yahuah Himself saved Israel out of Egypt''s hand.'),
  ('enoch', '1-enoch', 89, 16, 'canon', 'exodus', 19, 4, 'free', E'Exodus 19:4 — *Ye have seen what I did unto the Egyptians, and how I bare you on eagles'' wings, and brought you unto myself.* The Lord bringing the saved sheep out from among the wolves to Himself (89:16,19) is Yahuah bearing Israel on eagles'' wings to Himself.'),
  -- thread: 1-enoch-89-sinai-and-the-house
  ('enoch', '1-enoch', 89, 23, 'canon', 'exodus', 19, 18, 'free', E'Exodus 19:18 — *And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly.* The eyes of all the sheep opened to glorify the Lord of the sheep (89:23) is the flock at Sinai where Yahuah descended in fire.'),
  ('enoch', '1-enoch', 89, 21, 'canon', 'exodus', 19, 6, 'free', E'Exodus 19:6 — *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* The sheep placed in the great house built for the Lord of the sheep (89:21) is Israel made a kingdom of priests and holy nation at the covenant.'),
  ('enoch', '1-enoch', 89, 23, 'canon', 'exodus', 24, 8, 'free', E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The sheep speaking together and glorifying Yahuah (God) of Spirits (89:23) is the people sealed under the blood of the covenant.'),
  ('enoch', '1-enoch', 89, 21, 'canon', '1-kings', 6, 1, 'free', E'1 Kings 6:1 — *And it came to pass in the four hundred and eightieth year after the children of Yashar''el (Israel) were come out of the land of Egypt, in the fourth year of Solomon''s reign over Yashar''el (Israel)... that he began to build the house of Yahuah (LORD).* The great house built for the Lord of the sheep (89:21) is fulfilled in the house of Yahuah, the temple.'),
  -- thread: 1-enoch-89-sheep-blinded-scattered-given-to-beasts
  ('enoch', '1-enoch', 89, 35, 'canon', '2-kings', 17, 6, 'free', E'2 Kings 17:6 — *In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes.* The sheep devoured and scattered (89:35) is the northern house carried away into Assyria.'),
  ('enoch', '1-enoch', 89, 35, 'canon', '2-kings', 17, 23, 'free', E'2 Kings 17:23 — *Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day.* The Lord of the sheep going silent while the sheep are scattered (89:35) is Yahuah removing Israel out of His sight for breaking the covenant.'),
  ('enoch', '1-enoch', 89, 34, 'canon', 'ezekiel', 34, 5, 'free', E'Ezekiel 34:5 — *And they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered.* The beasts and birds devouring the sheep (89:34) is Ezekiel''s flock made meat to the beasts of the field.'),
  ('enoch', '1-enoch', 89, 35, 'canon', 'psalms', 80, 1, 'free', E'Psalm 80:1 — *Give ear, O Shepherd of Yashar''el (Israel), thou that leadest Joseph like a flock; thou that dwellest between the cherubims, shine forth.* The Lord of the sheep silent while the flock is scattered (89:35) is the cry to the Shepherd of Israel to shine forth on Joseph''s scattered flock.'),
  -- thread: 1-enoch-89-seventy-shepherds-the-false-shepherds
  ('enoch', '1-enoch', 89, 45, 'canon', 'ezekiel', 34, 2, 'free', E'Ezekiel 34:2 — *Son of Adam, prophesy against the shepherds of Yashar''el (Israel)... Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* The shepherds who had not fed the sheep (89:45) are Ezekiel''s self-feeding shepherds of Israel.'),
  ('enoch', '1-enoch', 89, 45, 'canon', 'ezekiel', 34, 10, 'free', E'Ezekiel 34:10 — *Behold, I am against the shepherds; and I will require my flock at their hand, and cause them to cease from feeding the flock... for I will deliver my flock from their mouth, that they may not be meat for them.* The judgment of the shepherds and their casting into the abyss (89:45) is Yahuah requiring His flock at the false shepherds'' hand.'),
  ('enoch', '1-enoch', 89, 45, 'canon', 'jeremiah', 23, 1, 'free', E'Jeremiah 23:1 — *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD).* The shepherds judged for not feeding the sheep (89:45) are Jeremiah''s pastors who destroy and scatter the flock.'),
  ('enoch', '1-enoch', 89, 45, 'canon', 'zechariah', 11, 17, 'free', E'Zechariah 11:17 — *Woe to the idol shepherd that leaveth the flock! the sword shall be upon his arm, and upon his right eye: his arm shall be clean dried up, and his right eye shall be utterly darkened.* The shepherds cast into the fiery abyss (89:45) are Zechariah''s worthless idol shepherd who abandons the flock of slaughter.'),
  -- thread: 1-enoch-89-books-opened-new-house-white-bull-messiah
  ('enoch', '1-enoch', 89, 41, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The Lord of the sheep opening the books of the living and of the sinners (89:41) is Daniel''s judgment set and the books opened.'),
  ('enoch', '1-enoch', 89, 41, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The books of the living and of the sinners opened (89:41) is the white-throne judgment with the books opened.'),
  ('enoch', '1-enoch', 89, 46, 'canon', 'ezekiel', 37, 22, 'free', E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* The new house gathering all the sheep (89:46) is the two houses made one nation under one king, the regathering.'),
  ('enoch', '1-enoch', 89, 46, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The Lord bringing all the sheep into the new house (89:46) is the assembling of the outcasts of Israel and dispersed of Judah.'),
  ('enoch', '1-enoch', 89, 46, 'canon', 'revelation', 21, 2, 'free', E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The new house greater and loftier than the first (89:46) is the New Jerusalem coming down from heaven.'),
  ('enoch', '1-enoch', 89, 49, 'canon', 'ezekiel', 34, 23, 'free', E'Ezekiel 34:23 — *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* The white bull born with great horns whom all the beasts fear (89:49) is the one Shepherd, the Messiah, set over the regathered flock.'),
  ('enoch', '1-enoch', 89, 49, 'canon', 'john', 10, 16, 'free', E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The white bull before whom all are transformed into white bulls (89:49-50) is the one Shepherd gathering the scattered into one fold.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en89_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en89_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-89-ark-and-the-flood',
       E'The white bull becomes a man, the vessel, and the flood',
       E'The Animal Apocalypse opens with Noah: *And one of those four went to the white bull and instructed him in a secret, without his being terrified: he was born a bull and became a man, and built for himself a great vessel and dwelt thereon; and three bulls dwelt with him in that vessel and they were covered in.* (1 Enoch 89:1) The torrents and fountains break open and swallow the cattle: *And I saw again and behold fountains were opened on the earth, in that great enclosure, and that water began to swell and rise upon the earth* (1 Enoch 89:3). This is Genesis told in colour: *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* (Genesis 7:11), and *the waters increased, and bare up the ark, and it was lift up above the earth.* (Genesis 7:17), while *every living substance was destroyed which was upon the face of the ground* (Genesis 7:23). Jubilees keeps the very count: *And Yahuah (God) opened seven flood-gates of heaven... Fifteen cubits did the waters rise above all the high mountains, And the ark was lift up above the earth* (Jubilees 5:23). And Sirach names Noah the remnant-seed of the righteous line: *Noah was found perfect and righteous; in the time of wrath he was taken in exchange for the world; therefore was he left as a remnant to the earth, when the flood came.* (Ecclesiasticus 44:17) The white bull is the righteous seed-line carried through the waters; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 52200
  FROM _session250_en89_lookup sv, _session250_en89_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=89 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-89-sheep-from-jacob-and-egypt-the-wolves',
       E'The sheep born of Jacob and the wolves of Egypt',
       E'The seed narrows from bull to sheep: *But that bull which was born from him begat a black wild boar and a white sheep; and the former begat many boars, but that sheep begat twelve sheep.* (1 Enoch 89:14) — Jacob and the twelve tribes. Then the bondage: *And when those twelve sheep had grown, they gave up one of them to the asses, and those asses again gave up that sheep to the wolves, and that sheep grew up among the wolves.* (1 Enoch 89:15) The wolves are Egypt: *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour* (Exodus 1:13), and *Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river* (Exodus 1:22). But the Lord of the sheep hears: *I have surely seen the affliction of my people which are in Egypt, and have heard their cry by reason of their taskmasters; for I know their sorrows* (Exodus 3:7), and comes down *to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey* (Exodus 3:8). The twelve sheep are the covenant people Israel — never displaced, never replaced; the wolves are the oppressor-nations, not a permanent home.',
       sv.verse_id, ev.verse_id, 'extras', 52203
  FROM _session250_en89_lookup sv, _session250_en89_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=89 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-89-moses-the-deliverer-and-the-sea',
       E'The sheep that became a man, the exodus, and the sea',
       E'The deliverer is raised from among the oppressed: *And the Lord of the sheep brought it up among the wolves, and it grew up with them, and the Lord of the sheep brought it out from among the wolves, and it began to open its eyes and to see.* (1 Enoch 89:16) — Moses, raised in Pharaoh''s house. He is sent: *And the Lord of the sheep sent it to the sheep* (1 Enoch 89:17), and the wolves pursue: *And that sheep which had been saved from the wolves escaped and fled away from the wolves, and the wolves began to pursue it with great violence.* (1 Enoch 89:18) Then the deliverance at the sea: *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* (Exodus 14:21), and *the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground* (Exodus 14:22), while *the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh* (Exodus 14:28), so that *Yahuah (LORD) saved Yashar''el (Israel) that day out of the hand of the Egyptians* (Exodus 14:30). The sheep made a man (89:21) is Moses; the deliverance is wholly Yahuah''s, the Lord of the sheep coming Himself.',
       sv.verse_id, ev.verse_id, 'extras', 52206
  FROM _session250_en89_lookup sv, _session250_en89_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=16
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=89 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-89-sinai-and-the-house',
       E'Sinai, the covenant, and the house built for the Lord of the sheep',
       E'The saved sheep becomes a man and builds the house: *And that sheep which had been saved became a man, and built a great house for the Lord of the sheep, and placed all the sheep in that house.* (1 Enoch 89:21) — the tabernacle/temple where the flock dwells under their Shepherd. This follows Sinai, where the covenant is cut: *And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire... and the whole mount quaked greatly.* (Exodus 19:18) There the flock is constituted a peculiar people: *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people... ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:5-6) — Torah stands, the covenant the very ground of their being a flock. The blood of the covenant seals it: *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* (Exodus 24:8) And the house itself: *it came to pass in the four hundred and eightieth year after the children of Yashar''el (Israel) were come out of the land of Egypt... that he began to build the house of Yahuah (LORD).* (1 Kings 6:1) The eyes of all the sheep opened to glorify the Lord (89:23) is the flock seeing their God at the mountain and the house.',
       sv.verse_id, ev.verse_id, 'extras', 52209
  FROM _session250_en89_lookup sv, _session250_en89_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=21
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=89 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-89-sheep-blinded-scattered-given-to-beasts',
       E'The sheep go astray, are forsaken, and given to the wild beasts',
       E'After the kings and the house, the flock turns and is abandoned to the nations: *And after that those beasts and birds began to attack the sheep, and to devour them, and to tear them in pieces. And the Lord of the sheep was silent, and the beasts and birds devoured the sheep, and the sheep were scattered.* (1 Enoch 89:34-35) This is the two-house scattering — Israel blinded, removed, carried off: *In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes.* (2 Kings 17:6) The cause is covenant-breaking, not the law: *the children of Yashar''el (Israel) had sinned against Yahuah (LORD) their Elohim (God)... and had feared other gods* (2 Kings 17:7), until *Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets* (2 Kings 17:23). Ezekiel names exactly this scattering of the flock: *they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered* (Ezekiel 34:5), *My sheep wandered through all the mountains... yea, my flock was scattered upon all the face of the earth, and none did search or seek after them* (Ezekiel 34:6). And the Shepherd of Israel is invoked: *Give ear, O Shepherd of Yashar''el (Israel), thou that leadest Joseph like a flock... shine forth.* (Psalm 80:1) The beasts are the nations; the scattering is the exile of the houses — awaiting regathering, never a replacement.',
       sv.verse_id, ev.verse_id, 'extras', 52212
  FROM _session250_en89_lookup sv, _session250_en89_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=34
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=89 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-89-seventy-shepherds-the-false-shepherds',
       E'The shepherds who did not feed the sheep are judged',
       E'The exile is administered by overseers who fail their charge, and they answer for it: *And the shepherds who had not fed the sheep were judged, and cast into the same fiery abyss with the beasts.* (1 Enoch 89:45) These are the seventy shepherds of the Animal Apocalypse — the appointed, faithless overseers who destroyed more than commanded. The prophets name them as the false shepherds who feed themselves: *Son of Adam, prophesy against the shepherds of Yashar''el (Israel)... Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2), and *the diseased have ye not strengthened, neither have ye healed that which was sick... neither have ye sought that which was lost; but with force and with cruelty have ye ruled them* (Ezekiel 34:4). Yahuah turns against them: *Behold, I am against the shepherds; and I will require my flock at their hand* (Ezekiel 34:10). Jeremiah pronounces the woe: *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD).* (Jeremiah 23:1) And Zechariah''s worthless shepherd: *Woe to the idol shepherd that leaveth the flock! the sword shall be upon his arm, and upon his right eye* (Zechariah 11:17). The judged shepherds of Enoch are these false shepherds, not the Lord of the sheep.',
       sv.verse_id, ev.verse_id, 'extras', 52215
  FROM _session250_en89_lookup sv, _session250_en89_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=45
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=89 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-89-books-opened-new-house-white-bull-messiah',
       E'The books opened, the new house, and the white bull born',
       E'The vision closes in judgment and restoration. The books are opened: *And after that I saw in the vision that the Lord of the sheep opened the books of the living, and the books of the sinners were opened.* (1 Enoch 89:41), and the fallen stars are bound: *And the stars which had transgressed were bound and cast into the same abyss* (1 Enoch 89:44). This is Daniel''s throne-room: *the judgment was set, and the books were opened* (Daniel 7:10), and John''s white throne: *the books were opened... and the dead were judged out of those things which were written in the books* (Revelation 20:12). Then the regathering and the new house: *And a new house was built greater and loftier than the first, and the Lord of the sheep brought all the sheep into that new house.* (1 Enoch 89:46) — the regathering of the scattered tribes: *Behold, I will take the children of Yashar''el (Israel) from among the heathen... and will make them one nation in the land... and they shall be no more two nations* (Ezekiel 37:21-22); *he shall... assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The new house is the New Jerusalem: *I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven* (Revelation 21:2), where *the tabernacle of Elohim (God) is with men* (Revelation 21:3). And the white bull born with great horns: *And I saw till a white bull was born, with large horns, and all the beasts of the field and all the birds of the air feared him... and they all became white bulls* (1 Enoch 89:49-50) — the Messiah, the Formed Son, the one Shepherd: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11), *other sheep I have, which are not of this fold... and there shall be one fold, and one shepherd* (John 10:16); *And David my servant shall be king over them; and they all shall have one shepherd* (Ezekiel 34:23). The transformation of all into white bulls is the regathered people made righteous under their one Shepherd — never a church replacing Israel.',
       sv.verse_id, ev.verse_id, 'extras', 52218
  FROM _session250_en89_lookup sv, _session250_en89_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=41
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=89 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-89-ark-and-the-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* Enoch''s opened fountains and torrents from the high roof (89:2-3) are Genesis'' great-deep and windows-of-heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-ark-and-the-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:17 — *And the flood was forty days upon the earth; and the waters increased, and bare up the ark, and it was lift up above the earth.* The flood rising above the enclosure while the vessel floats (89:4-6) is the ark borne up above the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-ark-and-the-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* The cattle of the enclosure sinking and perishing (89:5-6) is the destruction of all flesh, only Noah remaining.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-ark-and-the-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:23 — *And Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number. And the flood-gates began to pour down water from the heaven forty days and forty nights... Fifteen cubits did the waters rise above all the high mountains, And the ark was lift up above the earth.* Jubilees'' seven flood-gates match Enoch''s seven water torrents on the high roof (89:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-ark-and-the-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 44:17 — *Noah was found perfect and righteous; in the time of wrath he was taken in exchange for the world; therefore was he left as a remnant to the earth, when the flood came.* Sirach names the white bull (89:1) the righteous remnant carried through the wrath.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-ark-and-the-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-89-sheep-from-jacob-and-egypt-the-wolves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour:* The twelve sheep given over to the wolves (89:15) is Israel made to serve Egypt with rigour.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sheep-from-jacob-and-egypt-the-wolves'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* The wolves'' violence against the sheep (89:15,18) is Pharaoh''s order to drown the sons.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sheep-from-jacob-and-egypt-the-wolves'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 3:7 — *And Yahuah (LORD) said, I have surely seen the affliction of my people which are in Egypt, and have heard their cry by reason of their taskmasters; for I know their sorrows;* The Lord of the sheep who hears the sheep''s cry (89:16,19) is Yahuah hearing Israel''s cry in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sheep-from-jacob-and-egypt-the-wolves'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 3:8 — *And I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey...* The Lord of the sheep coming down to deliver from the wolves (89:19) is Yahuah come down to deliver Israel.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sheep-from-jacob-and-egypt-the-wolves'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-89-moses-the-deliverer-and-the-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The wolves pursuing the fleeing sheep (89:18) is Pharaoh''s pursuit broken at the divided sea.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-moses-the-deliverer-and-the-sea'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The Lord of the sheep delivering it from the wolves (89:19) is the host of Pharaoh drowned in the returning sea.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-moses-the-deliverer-and-the-sea'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:30 — *Thus Yahuah (LORD) saved Yashar''el (Israel) that day out of the hand of the Egyptians; and Yashar''el (Israel) saw the Egyptians dead upon the sea shore.* The Lord of the sheep heard its cry and delivered it from the wolves (89:19) — Yahuah Himself saved Israel out of Egypt''s hand.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-moses-the-deliverer-and-the-sea'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 19:4 — *Ye have seen what I did unto the Egyptians, and how I bare you on eagles'' wings, and brought you unto myself.* The Lord bringing the saved sheep out from among the wolves to Himself (89:16,19) is Yahuah bearing Israel on eagles'' wings to Himself.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-moses-the-deliverer-and-the-sea'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-89-sinai-and-the-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:18 — *And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly.* The eyes of all the sheep opened to glorify the Lord of the sheep (89:23) is the flock at Sinai where Yahuah descended in fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sinai-and-the-house'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:6 — *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* The sheep placed in the great house built for the Lord of the sheep (89:21) is Israel made a kingdom of priests and holy nation at the covenant.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sinai-and-the-house'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The sheep speaking together and glorifying Yahuah (God) of Spirits (89:23) is the people sealed under the blood of the covenant.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sinai-and-the-house'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 6:1 — *And it came to pass in the four hundred and eightieth year after the children of Yashar''el (Israel) were come out of the land of Egypt, in the fourth year of Solomon''s reign over Yashar''el (Israel)... that he began to build the house of Yahuah (LORD).* The great house built for the Lord of the sheep (89:21) is fulfilled in the house of Yahuah, the temple.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sinai-and-the-house'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-89-sheep-blinded-scattered-given-to-beasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 17:6 — *In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes.* The sheep devoured and scattered (89:35) is the northern house carried away into Assyria.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sheep-blinded-scattered-given-to-beasts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 17:23 — *Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day.* The Lord of the sheep going silent while the sheep are scattered (89:35) is Yahuah removing Israel out of His sight for breaking the covenant.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sheep-blinded-scattered-given-to-beasts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 34:5 — *And they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered.* The beasts and birds devouring the sheep (89:34) is Ezekiel''s flock made meat to the beasts of the field.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sheep-blinded-scattered-given-to-beasts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 80:1 — *Give ear, O Shepherd of Yashar''el (Israel), thou that leadest Joseph like a flock; thou that dwellest between the cherubims, shine forth.* The Lord of the sheep silent while the flock is scattered (89:35) is the cry to the Shepherd of Israel to shine forth on Joseph''s scattered flock.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-sheep-blinded-scattered-given-to-beasts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-89-seventy-shepherds-the-false-shepherds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:2 — *Son of Adam, prophesy against the shepherds of Yashar''el (Israel)... Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* The shepherds who had not fed the sheep (89:45) are Ezekiel''s self-feeding shepherds of Israel.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-seventy-shepherds-the-false-shepherds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 34:10 — *Behold, I am against the shepherds; and I will require my flock at their hand, and cause them to cease from feeding the flock... for I will deliver my flock from their mouth, that they may not be meat for them.* The judgment of the shepherds and their casting into the abyss (89:45) is Yahuah requiring His flock at the false shepherds'' hand.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-seventy-shepherds-the-false-shepherds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 23:1 — *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD).* The shepherds judged for not feeding the sheep (89:45) are Jeremiah''s pastors who destroy and scatter the flock.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-seventy-shepherds-the-false-shepherds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 11:17 — *Woe to the idol shepherd that leaveth the flock! the sword shall be upon his arm, and upon his right eye: his arm shall be clean dried up, and his right eye shall be utterly darkened.* The shepherds cast into the fiery abyss (89:45) are Zechariah''s worthless idol shepherd who abandons the flock of slaughter.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-seventy-shepherds-the-false-shepherds'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-89-books-opened-new-house-white-bull-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The Lord of the sheep opening the books of the living and of the sinners (89:41) is Daniel''s judgment set and the books opened.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-books-opened-new-house-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The books of the living and of the sinners opened (89:41) is the white-throne judgment with the books opened.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-books-opened-new-house-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* The new house gathering all the sheep (89:46) is the two houses made one nation under one king, the regathering.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-books-opened-new-house-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The Lord bringing all the sheep into the new house (89:46) is the assembling of the outcasts of Israel and dispersed of Judah.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-books-opened-new-house-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The new house greater and loftier than the first (89:46) is the New Jerusalem coming down from heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-books-opened-new-house-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ezekiel 34:23 — *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd.* The white bull born with great horns whom all the beasts fear (89:49) is the one Shepherd, the Messiah, set over the regathered flock.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-books-opened-new-house-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The white bull before whom all are transformed into white bulls (89:49-50) is the one Shepherd gathering the scattered into one fold.'
  FROM cross_reference_threads t, cross_references x, _session250_en89_lookup sv, _session250_en89_lookup tv
 WHERE t.slug='1-enoch-89-books-opened-new-house-white-bull-messiah'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=89 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

