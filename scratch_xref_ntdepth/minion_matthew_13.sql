-- ----- fragment: minion_matthew_13.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 13 — full-library cross-reference threads (NT DEPTH pass)
-- The parables of the kingdom: sower, tares, mustard seed, leaven, treasure,
-- pearl, net; why parables; the scribe's new-and-old; a prophet without honour.
-- 6 threads, band 11360 step +3.
-- ============================================================================

-- 3a. Temp view -------------------------------------------------------------
CREATE TEMP VIEW _mt13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows -------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: the sower / why parables / seeing they see not (anchor 13:3-23)
  ('canon','matthew',13,14,'canon','isaiah',6,9, 'free', E'*And he said, Go, and tell this people, Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9). Yahusha (Jesus) does not invent a riddle to keep men out — he names the old wound. The very words Yahuah gave Isaiah at his commissioning are the words now *fulfilled* (13:14): the parable is a mirror that shows each heart what it already is.'),
  ('canon','matthew',13,15,'canon','isaiah',6,10, 'free', E'*Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they see with their eyes, and hear with their ears, and understand with their heart, and convert, and be healed* (Isaiah 6:10). Matthew quotes it almost verbatim — *should be converted, and I should heal them* (13:15). The good ground is the heart that lets the word in; the way-side, the stony, the thorny are the same gross heart Isaiah saw.'),
  ('canon','matthew',13,3,'canon','isaiah',55,10, 'free', E'*For as the rain cometh down, and the snow from heaven, and returneth not thither, but watereth the earth, and maketh it bring forth and bud, that it may give seed to the sower, and bread to the eater* (Isaiah 55:10). The sower of 13:3 sows that same word: heaven''s rain that does not return void but accomplishes what Yahuah pleases (55:11). The seed is never barren — only the soil refuses.'),
  ('canon','matthew',13,7,'canon','jeremiah',4,3, 'free', E'*For thus saith Yahuah (LORD) to the men of Yahudah (Judah) and Jerusalem, Break up your fallow ground, and sow not among thorns* (Jeremiah 4:3). The thorny ground of 13:7, where *the care of this world, and the deceitfulness of riches, choke the word* (13:22), is Jeremiah''s un-broken fallow heart. The word stands; the soil must be ploughed.'),
  ('canon','matthew',13,13,'canon','ezekiel',12,2, 'free', E'*Son of Adam, thou dwellest in the midst of a rebellious house, which have eyes to see, and see not; they have ears to hear, and hear not: for they are a rebellious house* (Ezekiel 12:2). The same diagnosis Yahusha gives in 13:13 — *because they seeing see not; and hearing they hear not* — spoken to Ezekiel of the very same people. The rebellion is ancient and the remedy is the same: a heart that turns.'),
  ('canon','matthew',13,14,'canon','mark',4,11, 'free', E'*And he said unto them, Unto you it is given to know the mystery of the kingdom of Elohim (God): but unto them that are without, all these things are done in parables* (Mark 4:11). Mark carries the same teaching given to the twelve — *Because it is given unto you to know the mysteries of the kingdom of heaven* (13:11) — confirming the two libraries speak with one voice.'),
  ('canon','matthew',13,14,'canon','john',12,40, 'free', E'*He hath blinded their eyes, and hardened their heart; that they should not see with their eyes, nor understand with their heart, and be converted, and I should heal them* (John 12:40). Yochanan (John) anchors the same Isaiah 6 word to the same rejection. One Scripture, woven through Tanakh and Gospel alike.'),
  ('canon','matthew',13,14,'canon','acts',28,26, 'free', E'*Saying, Go unto this people, and say, Hearing ye shall hear, and shall not understand; and seeing ye shall see, and not perceive* (Acts 28:26). Sha''ul (Paul) closes the book of Acts with the very verse Yahusha opens the parables with — Isaiah 6 framing both ends of the gospel proclamation. The word goes out; the heart decides.'),

  -- THREAD 2: the tares / harvest = the end of the age (anchor 13:24-43)
  ('canon','matthew',13,43,'canon','daniel',12,3, 'free', E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). When Yahusha says *Then shall the righteous shine forth as the sun in the kingdom of their Father* (13:43), he is reading from Daniel''s vision of the resurrection-harvest. The shining is no new promise — it is the old one ripening.'),
  ('canon','matthew',13,40,'canon','malachi',4,1, 'free', E'*For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch* (Malachi 4:1). The tares *bound in bundles to burn them* (13:30) and cast into *a furnace of fire* (13:42) are Malachi''s burning day. The judgment Yahusha pictures is the prophets'' own.'),
  ('canon','matthew',13,30,'canon','malachi',3,18, 'free', E'*Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18). The wheat and the tares grow *together until the harvest* (13:30) precisely because the sorting belongs to that day — Malachi''s discerning between the two services. Men cannot pull the tares; the reapers will.'),
  ('canon','matthew',13,39,'canon','joel',3,13, 'free', E'*Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full, the fats overflow; for their wickedness is great* (Joel 3:13). *The harvest is the end of the world; and the reapers are the angels* (13:39). Yahusha takes Joel''s sickle-command and tells us whose hand swings it.'),
  ('canon','matthew',13,41,'canon','zephaniah',1,3, 'free', E'*I will consume man and beast; I will consume the fowls of the heaven, and the fishes of the sea, and the stumblingblocks with the wicked; and I will cut off man from off the land, saith Yahuah (LORD)* (Zephaniah 1:3). *The Son of Adam shall send forth his angels, and they shall gather out of his kingdom all things that offend* (13:41) — Zephaniah''s *stumblingblocks* gathered out. The same purging, the same word.'),
  ('canon','matthew',13,38,'apocrypha','2-esdras',4,30, 'extras', E'*For the grain of evil seed has been sown in the heart of Adam from the beginning, and how much ungodliness has it brought up to this time? and how much shall it yet bring forth until the time of threshing come?* (2 Esdras 4:30). The same generation that received the parables had this picture already: an enemy''s evil seed sown in the heart, growing alongside the good until *the time of threshing*. Yahusha names the sower — *the enemy that sowed them is the devil* (13:39) — and the floor that the ears shall fill (2 Esdras 4:32).'),

  -- THREAD 3: the mustard seed / the leaven — the kingdom''s hidden growth (anchor 13:31-33)
  ('canon','matthew',13,32,'canon','ezekiel',17,23, 'free', E'*In the mountain of the height of Yashar''el (Israel) will I plant it: and it shall bring forth boughs, and bear fruit, and be a goodly cedar: and under it shall dwell all fowl of every wing; in the shadow of the branches thereof shall they dwell* (Ezekiel 17:23). The mustard seed that *becometh a tree, so that the birds of the air come and lodge in the branches thereof* (13:32) is Ezekiel''s tender twig grown into the goodly cedar — the kingdom Yahuah plants on Israel''s mountain, sheltering every wing.'),
  ('canon','matthew',13,32,'canon','daniel',4,12, 'free', E'*The leaves thereof were fair, and the fruit thereof much, and in it was meat for all: the beasts of the field had shadow under it, and the fowls of the heaven dwelt in the boughs thereof, and all flesh was fed of it* (Daniel 4:12). A great tree whose branches house *the fowls of the heaven* and feed all flesh — the very image of a kingdom that begins least and grows greatest among herbs (13:32).'),
  ('canon','matthew',13,32,'canon','daniel',4,21, 'free', E'*Whose leaves were fair, and the fruit thereof much, and in it was meat for all; under which the beasts of the field dwelt, and upon whose branches the fowls of the heaven had their habitation* (Daniel 4:21). Daniel repeats the tree in his interpretation, fixing the picture: greatness that gives shelter and food. So the kingdom of heaven grows from the least of all seeds.'),
  ('canon','matthew',13,32,'canon','psalms',104,12, 'free', E'*By them shall the fowls of the heaven have their habitation, which sing among the branches* (Psalm 104:12). The birds lodging and singing in the branches (13:32) are an old psalm-picture of Yahuah''s provision — the kingdom''s spreading boughs giving every creature a home.'),

  -- THREAD 4: I will open my mouth in parables — kept secret from the foundation (anchor 13:34-35)
  ('canon','matthew',13,35,'canon','psalms',78,2, 'free', E'*I will open my mouth in a parable: I will utter dark sayings of old* (Psalm 78:2). Matthew tells us plainly that *without a parable spake he not unto them* (13:34) so that *it might be fulfilled which was spoken by the prophet, saying, I will open my mouth in parables* (13:35). Asaph''s psalm is the very script — the parable is the appointed manner of teaching Israel her own story.'),
  ('canon','matthew',13,35,'canon','psalms',49,4, 'free', E'*I will incline mine ear to a parable: I will open my dark saying upon the harp* (Psalm 49:4). The parable as the vessel of hidden wisdom — *things which have been kept secret from the foundation of the world* (13:35) — is a thread that runs through the Psalter. The dark saying is not concealment but invitation: lean in and hear.'),

  -- THREAD 5: the hidden treasure / the pearl / the net — the kingdom worth all (anchor 13:44-50)
  ('canon','matthew',13,44,'canon','proverbs',2,4, 'free', E'*If thou seekest her as silver, and searchest for her as for hid treasures* (Proverbs 2:4) — *then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* (Proverbs 2:5). The man who finds *treasure hid in a field* (13:44) and sells all to buy it is the seeker Proverbs describes: the kingdom is wisdom''s hid treasure, found only by those who dig for it.'),
  ('canon','matthew',13,46,'canon','proverbs',3,14, 'free', E'*For the merchandise of it is better than the merchandise of silver, and the gain thereof than fine gold* (Proverbs 3:14) — *she is more precious than rubies: and all the things thou canst desire are not to be compared unto her* (Proverbs 3:15). The merchant who *sold all that he had, and bought* one pearl of great price (13:46) has simply weighed the scales as Proverbs weighs them: nothing you desire compares to her.'),
  ('canon','matthew',13,49,'canon','malachi',3,17, 'free', E'*And they shall be mine, saith Yahuah Tseva''ot (LORD of hosts), in that day when I make up my jewels; and I will spare them, as a man spareth his own son that serveth him* (Malachi 3:17). The net *gathered of every kind* and the good drawn *into vessels* (13:48) is Malachi''s gathering of the jewels — Yahuah''s own, sifted out and spared in the day of severing.'),
  ('canon','matthew',13,47,'canon','habakkuk',1,14, 'free', E'*And makest men as the fishes of the sea, as the creeping things, that have no ruler over them?* (Habakkuk 1:14) — *they take up all of them with the angle, they catch them in their net, and gather them in their drag* (Habakkuk 1:15). The net cast into the sea that *gathered of every kind* (13:47) speaks Habakkuk''s tongue: men as fishes drawn up in the drag, the great ingathering before the sorting.'),
  ('canon','matthew',13,44,'apocrypha','ecclesiasticus',51,25, 'extras', E'*I opened my mouth, and said, Buy her for yourselves without money* (Sirach 51:25) — *put your neck under the yoke, and let your soul receive instruction: she is hard at hand to find* (Sirach 51:26). Ben Sira already taught Israel that the treasure beyond price is bought *without money* yet costs everything — exactly the paradox of the man who joyfully *selleth all that he hath, and buyeth that field* (13:44). Wisdom is near at hand to find, for the one who will bend his neck to seek her.'),

  -- THREAD 6: the scribe brings new and old / a prophet without honour (anchor 13:51-58)
  ('canon','matthew',13,52,'canon','jeremiah',6,16, 'free', E'*Thus saith Yahuah (LORD), Stand ye in the ways, and see, and ask for the old paths, where is the good way, and walk therein, and ye shall find rest for your souls. But they said, We will not walk therein* (Jeremiah 6:16). The scribe *instructed unto the kingdom of heaven* who *bringeth forth out of his treasure things new and old* (13:52) is no innovator discarding the past — he keeps the old paths and adds the kingdom''s opening. The new does not cancel the old; it crowns it. And the men of his own country who *will not walk therein* are the very ones who, offended, give the prophet no honour at home (13:57).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads ---------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55',
       E'The sower — by hearing ye shall hear and shall not understand (Isaiah 6; Isaiah 55; Ezekiel 12)',
       E'When the disciples ask *Why speakest thou unto them in parables?* (13:10), Yahusha (Jesus) answers not with a new mystery but with an old wound. *And in them is fulfilled the prophecy of Esaias, which saith, By hearing ye shall hear, and shall not understand; and seeing ye shall see, and shall not perceive* (13:14) — the very commissioning Yahuah gave Isaiah: *Go, and tell this people, Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9), *Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they... should understand with their heart, and convert, and be healed* (Isaiah 6:10). The parable is a mirror that shows each heart what it already is. Ezekiel heard the same diagnosis: *which have eyes to see, and see not; they have ears to hear, and hear not* (Ezekiel 12:2). Yet the seed itself is never barren. The sower of 13:3 sows the word that comes down like rain — *it shall not return unto me void, but it shall accomplish that which I please* (Isaiah 55:11); only the soil refuses, the thorny ground that Jeremiah commanded be broken: *Break up your fallow ground, and sow not among thorns* (Jeremiah 4:3). The same Isaiah 6 word frames the whole proclamation: Yochanan quotes it (John 12:40), and Sha''ul (Paul) closes Acts with it (Acts 28:26). The good ground is simply the heart that lets the word in.',
       sv.verse_id, ev.verse_id, 'free', 11360
  FROM _mt13_lookup sv, _mt13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=13 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4',
       E'The tares — the harvest is the end of the world (Daniel 12; Malachi 4; Joel 3; 2 Esdras 4)',
       E'The wheat and the tares grow *together until the harvest* (13:30), and Yahusha (Jesus) tells us plainly what the harvest is: *the harvest is the end of the world; and the reapers are the angels* (13:39). Every line of this parable is the prophets'' own picture of that day. *Then shall the righteous shine forth as the sun in the kingdom of their Father* (13:43) reads straight from Daniel: *they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). The tares *bound in bundles to burn them* and cast into *a furnace of fire* (13:30, 42) are Malachi''s burning oven: *the day cometh, that shall burn as an oven... that it shall leave them neither root nor branch* (Malachi 4:1). And the sorting waits for that day because the discerning belongs to Yahuah — *then shall ye return, and discern between the righteous and the wicked* (Malachi 3:18); men cannot pull the tares without uprooting the wheat (13:29). Whose hand swings the sickle? Joel told us: *Put ye in the sickle, for the harvest is ripe* (Joel 3:13). And what is gathered out? Zephaniah''s *stumblingblocks* — *I will consume... the stumblingblocks with the wicked* (Zephaniah 1:3); so *they shall gather out of his kingdom all things that offend* (13:41). The men who first heard this already knew the picture: *the grain of evil seed has been sown in the heart of Adam from the beginning... until the time of threshing come* (2 Esdras 4:30). Yahusha only names the sower — *the enemy... is the devil* (13:39) — and tells them the floor shall be filled.',
       sv.verse_id, ev.verse_id, 'extras', 11363
  FROM _mt13_lookup sv, _mt13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=13 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4',
       E'The mustard seed and the leaven — the birds lodge in the branches (Ezekiel 17; Daniel 4; Psalm 104)',
       E'*The kingdom of heaven is like to a grain of mustard seed... which indeed is the least of all seeds: but when it is grown, it is the greatest among herbs, and becometh a tree, so that the birds of the air come and lodge in the branches thereof* (13:31-32). This is no chance picture — it is Ezekiel''s prophecy of the kingdom Yahuah plants: *In the mountain of the height of Yashar''el (Israel) will I plant it: and it shall bring forth boughs, and bear fruit, and be a goodly cedar: and under it shall dwell all fowl of every wing; in the shadow of the branches thereof shall they dwell* (Ezekiel 17:23). The least twig becomes the sheltering cedar. Daniel saw the same great tree: *the fowls of the heaven dwelt in the boughs thereof, and all flesh was fed of it* (Daniel 4:12), and again *upon whose branches the fowls of the heaven had their habitation* (Daniel 4:21). And the old psalm sang it first: *By them shall the fowls of the heaven have their habitation, which sing among the branches* (Psalm 104:12). So too the leaven *hid in three measures of meal, till the whole was leavened* (13:33): the kingdom''s growth is hidden and quiet, but nothing escapes its working. From the least of seeds to the cedar that shelters every wing — that is how Yahuah grows His reign.',
       sv.verse_id, ev.verse_id, 'free', 11366
  FROM _mt13_lookup sv, _mt13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=13 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-13-i-will-open-my-mouth-in-parables-kept-secret-psalm-78-psalm-49',
       E'I will open my mouth in parables — things kept secret from the foundation (Psalm 78; Psalm 49)',
       E'Matthew tells us plainly that *without a parable spake he not unto them* (13:34), and why: *That it might be fulfilled which was spoken by the prophet, saying, I will open my mouth in parables; I will utter things which have been kept secret from the foundation of the world* (13:35). The script is Asaph''s psalm: *I will open my mouth in a parable: I will utter dark sayings of old* (Psalm 78:2) — the very manner appointed for teaching Israel her own story. The parable is not a wall to keep men out; it is the old vessel of hidden wisdom. The sons of Korah sang the same: *I will incline mine ear to a parable: I will open my dark saying upon the harp* (Psalm 49:4). The *dark saying* is an invitation, not a concealment — lean in, incline the ear, and the things kept secret from the foundation of the world are opened to the one who will hear.',
       sv.verse_id, ev.verse_id, 'free', 11369
  FROM _mt13_lookup sv, _mt13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=13 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51',
       E'The treasure, the pearl, the net — the kingdom worth all (Proverbs 2-3; Malachi 3; Habakkuk 1; Sirach 51)',
       E'*The kingdom of heaven is like unto treasure hid in a field; the which when a man hath found, he hideth, and for joy thereof goeth and selleth all that he hath, and buyeth that field* (13:44) — and like a merchant who, *when he had found one pearl of great price, went and sold all that he had, and bought it* (13:46). This is the seeker Proverbs describes: *if thou seekest her as silver, and searchest for her as for hid treasures, then shalt thou understand the fear of Yahuah (LORD)* (Proverbs 2:4-5); for *the merchandise of it is better than the merchandise of silver... she is more precious than rubies: and all the things thou canst desire are not to be compared unto her* (Proverbs 3:14-15). Ben Sira knew the paradox the parable turns on — the treasure beyond price is bought *without money* yet costs everything: *I opened my mouth, and said, Buy her for yourselves without money. Put your neck under the yoke, and let your soul receive instruction: she is hard at hand to find* (Sirach 51:25-26). Then the net: *the kingdom of heaven is like unto a net, that was cast into the sea, and gathered of every kind* (13:47), the great ingathering Habakkuk pictured — *they catch them in their net, and gather them in their drag* (Habakkuk 1:15) — before the angels *sever the wicked from among the just* (13:49). And in that severing the good are drawn into vessels, *for they shall be mine, saith Yahuah Tseva''ot (LORD of hosts), in that day when I make up my jewels* (Malachi 3:17). The kingdom is the one thing worth selling all to hold.',
       sv.verse_id, ev.verse_id, 'extras', 11372
  FROM _mt13_lookup sv, _mt13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=44
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=13 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-13-the-scribe-brings-things-new-and-old-a-prophet-without-honour-jeremiah-6',
       E'The scribe brings forth things new and old — a prophet without honour (Jeremiah 6:16)',
       E'When Yahusha (Jesus) asks *Have ye understood all these things?* and they answer *Yea, Yahuah (Lord)* (13:51), he gives the seal of the whole discourse: *Therefore every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old* (13:52). The kingdom''s scribe is no innovator who throws away the past. He keeps the old paths and adds the kingdom''s opening — *new AND old* together, the new crowning the old, never cancelling it. This is Jeremiah''s charge: *Stand ye in the ways, and see, and ask for the old paths, where is the good way, and walk therein, and ye shall find rest for your souls* (Jeremiah 6:16). But Jeremiah''s lament follows hard after — *But they said, We will not walk therein* — and so it goes in Yahusha''s own country: astonished at his wisdom yet *offended in him* (13:57), the men of his house *will not walk therein*. *A prophet is not without honour, save in his own country, and in his own house* (13:57); and where they would not, *he did not many mighty works there because of their unbelief* (13:58). The treasure was set before them, new and old; the soil refused it.',
       sv.verse_id, ev.verse_id, 'free', 11375
  FROM _mt13_lookup sv, _mt13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=51
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=13 AND ev.verse_number=58
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members --------------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:9 — *Go, and tell this people, Hear ye indeed, but understand not* — the commissioning word Matthew 13:14 says is fulfilled.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:10 — *Make the heart of this people fat... lest they... should understand with their heart, and convert, and be healed* — quoted almost verbatim in Matthew 13:15.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:10 — *the rain... maketh the earth bring forth and bud, that it may give seed to the sower* — the word that does not return void (55:11) is the seed of Matthew 13:3.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 4:3 — *Break up your fallow ground, and sow not among thorns* — the thorny soil of Matthew 13:7,22.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 12:2 — *which have eyes to see, and see not; they have ears to hear, and hear not* — the same diagnosis as Matthew 13:13.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Mark 4:11 — *Unto you it is given to know the mystery of the kingdom of Elohim (God)* — the parallel to Matthew 13:11.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'John 12:40 — *He hath blinded their eyes, and hardened their heart* — Isaiah 6 anchored to the same rejection.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Acts 28:26 — *Hearing ye shall hear, and shall not understand* — Sha''ul closes Acts with the same Isaiah 6 word.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-sower-why-parables-seeing-they-see-not-isaiah-6-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=28 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *they that be wise shall shine as the brightness of the firmament* — the source of *the righteous shine forth as the sun* (Matthew 13:43).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 4:1 — *the day cometh, that shall burn as an oven... it shall leave them neither root nor branch* — the burning of the tares (Matthew 13:30,42).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:18 — *discern between the righteous and the wicked* — why the sorting waits for the harvest (Matthew 13:30).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joel 3:13 — *Put ye in the sickle, for the harvest is ripe* — the harvest Yahusha says the angels reap (Matthew 13:39).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Zephaniah 1:3 — *I will consume... the stumblingblocks with the wicked* — gathered out of the kingdom (Matthew 13:41).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 4:30 — *the grain of evil seed has been sown in the heart of Adam from the beginning... until the time of threshing come* — the second-Temple picture of the enemy''s seed growing to the harvest (Matthew 13:38-39).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-tares-the-harvest-is-the-end-of-the-world-daniel-12-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=38
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 17:23 — *a goodly cedar: and under it shall dwell all fowl of every wing* — the kingdom Yahuah plants on Israel''s mountain (Matthew 13:32).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=17 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:12 — *the fowls of the heaven dwelt in the boughs thereof, and all flesh was fed of it* — the great tree, an image of the kingdom (Matthew 13:32).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:21 — *upon whose branches the fowls of the heaven had their habitation* — Daniel repeats the tree, fixing the picture.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 104:12 — *the fowls of the heaven have their habitation, which sing among the branches* — the old psalm of the sheltering boughs (Matthew 13:32).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 78:2 — *I will open my mouth in a parable: I will utter dark sayings of old* — Asaph''s psalm, the script Matthew 13:35 says is fulfilled.'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-i-will-open-my-mouth-in-parables-kept-secret-psalm-78-psalm-49'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 49:4 — *I will incline mine ear to a parable: I will open my dark saying upon the harp* — the parable as the vessel of hidden wisdom (Matthew 13:35).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-i-will-open-my-mouth-in-parables-kept-secret-psalm-78-psalm-49'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 2:4-5 — *if thou seekest her as silver, and searchest for her as for hid treasures, then shalt thou understand the fear of Yahuah* — the seeker who finds the treasure (Matthew 13:44).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 3:14-15 — *she is more precious than rubies: and all the things thou canst desire are not to be compared unto her* — the pearl worth selling all (Matthew 13:46).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 51:25-26 — *Buy her for yourselves without money. Put your neck under the yoke* — the treasure bought without money yet costing all (Matthew 13:44).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=44
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=51 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Habakkuk 1:14-15 — *they catch them in their net, and gather them in their drag* — men as fishes, the great ingathering of the net (Matthew 13:47).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 3:17 — *they shall be mine... in that day when I make up my jewels* — the good gathered into vessels at the severing (Matthew 13:48-49).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-treasure-the-pearl-the-net-proverbs-2-malachi-3-sirach-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 6:16 — *ask for the old paths, where is the good way, and walk therein... But they said, We will not walk therein* — the scribe keeps the old paths and adds the new (13:52); his own country *will not walk therein* (13:57).'
  FROM cross_reference_threads t, cross_references x, _mt13_lookup sv, _mt13_lookup tv
 WHERE t.slug='matthew-13-the-scribe-brings-things-new-and-old-a-prophet-without-honour-jeremiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
