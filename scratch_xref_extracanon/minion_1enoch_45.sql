-- ----- fragment: minion_1enoch_45.sql (session250 1-enoch 45) -----
-- Source anchor: enoch/1-enoch ch45. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en45 (view _session250_en45_lookup). Sort band base 51100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en45_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-45-elect-one-throne-of-glory
  ('enoch', '1-enoch', 45, 3, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha takes up Enoch''s exact image — the Son of Adam seated on the throne of glory to judge — which 1 Enoch 45:3 sets at the head of the Second Parable.'),
  ('enoch', '1-enoch', 45, 3, 'canon', 'matthew', 19, 28, 'free', E'Matthew 19:28 — *And Yahusha (Jesus) said unto them, Verily I say unto you, That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* The throne of glory that tries works in 1 Enoch 45:3 is the same seat from which the Son of Adam judges the regathered twelve tribes.'),
  ('enoch', '1-enoch', 45, 3, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one *like* the Son of Adam (the kaph; he resembles mortal-man because he took flesh) while 1 Enoch 45:3 names that same enthroned Elect One — both land on Yahusha.'),
  ('enoch', '1-enoch', 45, 3, 'enoch', '1-enoch', 62, 1, 'extras', E'1 Enoch 62:1 — *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* The Father seats and names the Elect One to weigh deeds — the same throne-of-glory judgement Enoch 45:3 announces.'),
  ('enoch', '1-enoch', 45, 3, 'enoch', '1-enoch', 51, 3, 'extras', E'1 Enoch 51:3 — *And the Elect One shall in those days sit on My throne, And his mouth shall pour forth all the secrets of wisdom and counsel: For Yahuah (God) of Spirits hath given (them) to him and hath glorified him.* The Father''s own throne is given to the Formed Son — Enoch 45:3''s Elect One enthroned to try works, glorified by the Head of Days.'),
  -- thread: 1-enoch-45-new-heavens-new-earth-for-the-elect
  ('enoch', '1-enoch', 45, 4, 'canon', 'isaiah', 65, 17, 'free', E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* The Father''s promise to create new heavens and a new earth is the very change Enoch 45:4 records Him speaking over the day of the Elect One.'),
  ('enoch', '1-enoch', 45, 4, 'canon', 'isaiah', 66, 22, 'free', E'Isaiah 66:22 — *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain.* The enduring new heavens and earth guarantee the elect''s enduring name — the dwelling Enoch 45:4 prepares for the Elect One among His people.'),
  ('enoch', '1-enoch', 45, 4, 'canon', 'revelation', 21, 3, 'free', E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* John sees consummated what Enoch 45:4 foretells: the Elect One caused to dwell among His people on the renewed earth.'),
  ('enoch', '1-enoch', 45, 4, 'canon', 'revelation', 21, 1, 'free', E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* The passing of the first heaven and earth is the very changing of heaven and earth Yahuah (God) of Spirits declares in 1 Enoch 45:4.'),
  ('enoch', '1-enoch', 45, 4, 'jubilees', 'jubilees', 1, 29, 'extras', E'Jubilees 1:29 — *...from the day of the new creation when the heavens and the earth shall be renewed and all their creation according to the powers of the heaven, and according to all the creation of the earth, until the sanctuary of Yahuah (God) shall be made in Jerusalem on Mount Zion, and all the luminaries be renewed for healing and for peace and for blessing for all the elect of Yashar''el (Israel)...* Jubilees ties the renewed heaven and earth to the elect of Israel — the same renewal Enoch 45:4 makes for the elect to dwell.'),
  -- thread: 1-enoch-45-election-named-and-chosen
  ('enoch', '1-enoch', 45, 12, 'enoch', '1-enoch', 48, 3, 'extras', E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* The Elect One who chooses the righteous in 1 Enoch 45:12 was Himself named before creation — election rooted before the worlds.'),
  ('enoch', '1-enoch', 45, 12, 'enoch', '1-enoch', 48, 6, 'extras', E'1 Enoch 48:6 — *And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* The Son chosen and hidden before the creation of the world is the One who chooses the righteous in Enoch 45:12 — the Lamb foreknown before the foundation of the world.'),
  ('enoch', '1-enoch', 45, 12, 'enoch', '1-enoch', 47, 3, 'extras', E'1 Enoch 47:3 — *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* The books of the living hold the named righteous whom Enoch 45:12 says He shall choose to be saved.'),
  ('enoch', '1-enoch', 45, 12, 'canon', 'isaiah', 42, 1, 'free', E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* The Father''s own "mine elect" Servant is the Elect One of Enoch who chooses the righteous in 45:12 to bring forth judgement.'),
  -- thread: 1-enoch-45-sinners-as-straw-furnace-of-fire
  ('enoch', '1-enoch', 45, 6, 'canon', 'matthew', 13, 42, 'free', E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* Yahusha''s furnace of fire for the wicked is the very furnace into which Enoch 45:6 casts the sinners.'),
  ('enoch', '1-enoch', 45, 6, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The righteous shining as the sun matches Enoch 45:9, the bright counterpart to the sinners-as-straw of 45:5-6.'),
  ('enoch', '1-enoch', 45, 5, 'canon', 'malachi', 4, 1, 'free', E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The wicked as stubble in the burning day is Enoch 45:5''s sinners as straw in the unquenchable fire.'),
  ('enoch', '1-enoch', 45, 5, 'apocrypha', 'the-wisdom-of-solomon', 3, 7, 'extras', E'Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The righteous flaming over the stubble is the bright reverse of Enoch 45:5, where the sinners themselves become the straw that burns.'),
  -- thread: 1-enoch-45-kings-and-mighty-cast-from-thrones
  ('enoch', '1-enoch', 45, 7, 'enoch', '1-enoch', 46, 4, 'extras', E'1 Enoch 46:4 — *And this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The named Son of Adam casts the kings and mighty from their thrones — the very judgement Enoch 45:7 enacts on the rulers who possess the earth.'),
  ('enoch', '1-enoch', 45, 7, 'canon', 'revelation', 6, 15, 'free', E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* John''s kings and mighty fleeing the throne are Enoch 45:7''s kings cast down from their thrones in shame.'),
  ('enoch', '1-enoch', 45, 7, 'canon', 'revelation', 6, 17, 'free', E'Revelation 6:17 — *For the great day of his wrath is come; and who shall be able to stand?* The great day from which no king can stand is Enoch 45:7''s day when the mighty are cast from their thrones into the fire.'),
  ('enoch', '1-enoch', 45, 7, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Branch who slays the wicked with the breath of his lips is the Elect One who casts the mighty down in Enoch 45:7.'),
  ('enoch', '1-enoch', 45, 7, 'canon', 'psalms', 2, 9, 'free', E'Psalm 2:9 — *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* The enthroned Son shattering the rulers'' kingdoms is Enoch 45:7''s casting of the kings and mighty from their thrones.'),
  -- thread: 1-enoch-45-resurrection-earth-and-sheol-give-back
  ('enoch', '1-enoch', 45, 11, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The sleepers in the dust waking to two ends is the resurrection Enoch 45:11 frames as the earth and Sheol giving back their dead.'),
  ('enoch', '1-enoch', 45, 11, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The hour when the graves hear the Son''s voice is Enoch 45:11''s day when the earth gives back what was entrusted to it.'),
  ('enoch', '1-enoch', 45, 11, 'canon', 'isaiah', 26, 19, 'free', E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* The earth casting out its dead is the very giving-back Enoch 45:11 records of the earth and Sheol.'),
  ('enoch', '1-enoch', 45, 11, 'enoch', '1-enoch', 51, 1, 'extras', E'1 Enoch 51:1 — *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. 5a. For in those days the Elect One shall arise,* Enoch''s own near-verbatim parallel names the Elect One who arises when the earth gives back its dead — the resurrection of 45:11.'),
  ('enoch', '1-enoch', 45, 11, 'apocrypha', '2-esdras', 7, 32, 'extras', E'2 Esdras 7:32 — *And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* The earth restoring its sleepers is Enoch 45:11''s earth and Sheol giving back what was entrusted to them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en45_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en45_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-45-elect-one-throne-of-glory',
       E'The Elect One on the throne of glory tries their works',
       E'The Second Parable opens with judgement seated: *On that day Mine Elect One shall sit on the throne of glory and shall try their works, and their place shall be nothing and their dwelling shall be with the faithless.* (1 Enoch 45:3). The Elect One is the Formed Son ordered under the Head of Days (the formless Father) — the same figure Enoch later *names*: *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* (1 Enoch 62:1), and again *And the Elect One shall in those days sit on My throne, And his mouth shall pour forth all the secrets of wisdom and counsel: For Yahuah (God) of Spirits hath given (them) to him and hath glorified him.* (1 Enoch 51:3). When Yahusha says *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* (Matthew 25:31), and *in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* (Matthew 19:28), the Gospel is not coining a phrase — it is taking up Enoch''s own. Daniel sees the figure under the kaph-comparative — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13) — *like* mortal-man because he took flesh while remaining the Formed cloud-rider; Enoch NAMES that same One enthroned. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51100
  FROM _session250_en45_lookup sv, _session250_en45_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=45 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-45-new-heavens-new-earth-for-the-elect',
       E'Heaven and earth changed for the elect to dwell',
       E'Judgement is not the end but a renewal: *And on that day I will cause Mine Elect One to dwell among them, and I will change the heaven and the earth and the light and the darkness, and I will make the earth a thing of light and the darkness a thing of darkness.* (1 Enoch 45:4). This is the Tanakh''s own promise: *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* (Isaiah 65:17), and *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain.* (Isaiah 66:22). John sees it consummated — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* (Revelation 21:1), *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* (Revelation 21:2), *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* (Revelation 21:3) — the Elect One dwelling among His people on a renewed earth, exactly Enoch''s word. Jubilees binds the renewed creation to the elect of Israel: *from the day of the new creation when the heavens and the earth shall be renewed... and all the luminaries be renewed... for all the elect of Yashar''el (Israel)* (Jubilees 1:29). The renewed creation is for the elect to dwell — not a church replacing Israel, but the covenant people restored. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51103
  FROM _session250_en45_lookup sv, _session250_en45_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=45 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-45-election-named-and-chosen',
       E'The chosen righteous, named and gathered',
       E'The chapter both opens against those who *deny the name of Yahuah (God) of Spirits* (1 Enoch 45:1-2) and closes with election by name: *And He shall choose the righteous and holy from among them: for the day has drawn nigh that they should be saved.* (1 Enoch 45:12). Election precedes confession — and Enoch grounds it before the worlds. The Elect One Himself was named before creation: *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* (1 Enoch 48:2), *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* (1 Enoch 48:3), *And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* (1 Enoch 48:6) — the Logos named before time, the same One John opens with and Revelation calls the Lamb slain from the foundation of the world. The names of the righteous are likewise on record: *And the books of the living were opened before Him* (1 Enoch 47:3). And the Tanakh''s Servant carries the same election language: *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* (Isaiah 42:1). The elect are a chosen people, named before they ever heard. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51106
  FROM _session250_en45_lookup sv, _session250_en45_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=45 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-45-sinners-as-straw-furnace-of-fire',
       E'The sinners as straw in the fire',
       E'Against the renewed dwelling of the elect stands the sinners'' lot: *And I will make the sinners to be as straw in the fire, and they shall burn before the face of the holy, and they shall not be quenched.* (1 Enoch 45:5), *And the righteous shall be victorious in the name of Yahuah (God) of Spirits, and the sinners shall be cast into the furnace of fire.* (1 Enoch 45:6). The judgement is for breaking covenant — the wicked as stubble is Malachi''s own day: *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* (Malachi 4:1). Yahusha speaks Enoch''s very furnace and contrasts it with the shining righteous: *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* (Matthew 13:42), *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* (Matthew 13:43). The Wisdom of Solomon paints the same two ends — the righteous flame out over the stubble: *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* (Wisdom of Solomon 3:7), *They shall judge the nations, and have dominion over the people, and their Elohim (God) shall reign for ever.* (Wisdom of Solomon 3:8). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51109
  FROM _session250_en45_lookup sv, _session250_en45_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=45 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-45-kings-and-mighty-cast-from-thrones',
       E'The kings and the mighty cast down from their thrones',
       E'The day reaches the high seats of the earth: *And in those days the kings and the mighty who possess the earth shall be cast down from their thrones, and they shall be cast into the furnace of fire, and their faces shall be covered with shame.* (1 Enoch 45:7). This is the Son of Adam''s named office within the Parables: *And this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* (1 Enoch 46:4), *[And he shall put down the kings from their thrones and kingdoms] Because they do not extol and praise Him, Nor humbly acknowledge whence the kingdom was bestowed upon them.* (1 Enoch 46:5). John sees the same terror seize earth''s rulers: *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* (Revelation 6:15), and the day from which none stand — *For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). The Tanakh''s righteous Branch judges with the same rod: *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* (Isaiah 11:4), and the enthroned Son shatters the proud thrones — *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* (Psalm 2:9). The systems of the proud are dismantled; the meek are vindicated. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51112
  FROM _session250_en45_lookup sv, _session250_en45_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=45 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-45-resurrection-earth-and-sheol-give-back',
       E'The earth and Sheol give back the dead',
       E'At the chapter''s height the dead return: *And in those days the earth shall give back that which has been entrusted to it, and Sheol also shall give back that which it has received, and hell shall give back that which it owes.* (1 Enoch 45:11). Enoch repeats it almost word for word and names the One who raises them: *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. 5a. For in those days the Elect One shall arise,* (1 Enoch 51:1). This is the canon''s whole resurrection-chorus: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2), *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19), and Yahusha''s own voice over the graves: *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* (John 5:28), *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* (John 5:29). 2 Esdras joins the same witness: *And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* (2 Esdras 7:32). The earth gives back what was entrusted, and the Elect One arises. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51115
  FROM _session250_en45_lookup sv, _session250_en45_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=45 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-45-elect-one-throne-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha takes up Enoch''s exact image — the Son of Adam seated on the throne of glory to judge — which 1 Enoch 45:3 sets at the head of the Second Parable.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 19:28 — *And Yahusha (Jesus) said unto them, Verily I say unto you, That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* The throne of glory that tries works in 1 Enoch 45:3 is the same seat from which the Son of Adam judges the regathered twelve tribes.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one *like* the Son of Adam (the kaph; he resembles mortal-man because he took flesh) while 1 Enoch 45:3 names that same enthroned Elect One — both land on Yahusha.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 62:1 — *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* The Father seats and names the Elect One to weigh deeds — the same throne-of-glory judgement Enoch 45:3 announces.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 51:3 — *And the Elect One shall in those days sit on My throne, And his mouth shall pour forth all the secrets of wisdom and counsel: For Yahuah (God) of Spirits hath given (them) to him and hath glorified him.* The Father''s own throne is given to the Formed Son — Enoch 45:3''s Elect One enthroned to try works, glorified by the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-45-new-heavens-new-earth-for-the-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* The Father''s promise to create new heavens and a new earth is the very change Enoch 45:4 records Him speaking over the day of the Elect One.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-new-heavens-new-earth-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:22 — *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain.* The enduring new heavens and earth guarantee the elect''s enduring name — the dwelling Enoch 45:4 prepares for the Elect One among His people.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-new-heavens-new-earth-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* John sees consummated what Enoch 45:4 foretells: the Elect One caused to dwell among His people on the renewed earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-new-heavens-new-earth-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* The passing of the first heaven and earth is the very changing of heaven and earth Yahuah (God) of Spirits declares in 1 Enoch 45:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-new-heavens-new-earth-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 1:29 — *...from the day of the new creation when the heavens and the earth shall be renewed and all their creation according to the powers of the heaven, and according to all the creation of the earth, until the sanctuary of Yahuah (God) shall be made in Jerusalem on Mount Zion, and all the luminaries be renewed for healing and for peace and for blessing for all the elect of Yashar''el (Israel)...* Jubilees ties the renewed heaven and earth to the elect of Israel — the same renewal Enoch 45:4 makes for the elect to dwell.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-new-heavens-new-earth-for-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-45-election-named-and-chosen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* The Elect One who chooses the righteous in 1 Enoch 45:12 was Himself named before creation — election rooted before the worlds.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-election-named-and-chosen'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 48:6 — *And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* The Son chosen and hidden before the creation of the world is the One who chooses the righteous in Enoch 45:12 — the Lamb foreknown before the foundation of the world.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-election-named-and-chosen'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 47:3 — *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* The books of the living hold the named righteous whom Enoch 45:12 says He shall choose to be saved.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-election-named-and-chosen'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* The Father''s own "mine elect" Servant is the Elect One of Enoch who chooses the righteous in 45:12 to bring forth judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-election-named-and-chosen'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-45-sinners-as-straw-furnace-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* Yahusha''s furnace of fire for the wicked is the very furnace into which Enoch 45:6 casts the sinners.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-sinners-as-straw-furnace-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The righteous shining as the sun matches Enoch 45:9, the bright counterpart to the sinners-as-straw of 45:5-6.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-sinners-as-straw-furnace-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The wicked as stubble in the burning day is Enoch 45:5''s sinners as straw in the unquenchable fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-sinners-as-straw-furnace-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The righteous flaming over the stubble is the bright reverse of Enoch 45:5, where the sinners themselves become the straw that burns.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-sinners-as-straw-furnace-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-45-kings-and-mighty-cast-from-thrones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 46:4 — *And this Son of Adam whom thou hast seen shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The named Son of Adam casts the kings and mighty from their thrones — the very judgement Enoch 45:7 enacts on the rulers who possess the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-kings-and-mighty-cast-from-thrones'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* John''s kings and mighty fleeing the throne are Enoch 45:7''s kings cast down from their thrones in shame.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-kings-and-mighty-cast-from-thrones'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:17 — *For the great day of his wrath is come; and who shall be able to stand?* The great day from which no king can stand is Enoch 45:7''s day when the mighty are cast from their thrones into the fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-kings-and-mighty-cast-from-thrones'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Branch who slays the wicked with the breath of his lips is the Elect One who casts the mighty down in Enoch 45:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-kings-and-mighty-cast-from-thrones'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 2:9 — *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* The enthroned Son shattering the rulers'' kingdoms is Enoch 45:7''s casting of the kings and mighty from their thrones.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-kings-and-mighty-cast-from-thrones'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-45-resurrection-earth-and-sheol-give-back
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The sleepers in the dust waking to two ends is the resurrection Enoch 45:11 frames as the earth and Sheol giving back their dead.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-resurrection-earth-and-sheol-give-back'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The hour when the graves hear the Son''s voice is Enoch 45:11''s day when the earth gives back what was entrusted to it.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-resurrection-earth-and-sheol-give-back'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* The earth casting out its dead is the very giving-back Enoch 45:11 records of the earth and Sheol.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-resurrection-earth-and-sheol-give-back'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 51:1 — *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. 5a. For in those days the Elect One shall arise,* Enoch''s own near-verbatim parallel names the Elect One who arises when the earth gives back its dead — the resurrection of 45:11.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-resurrection-earth-and-sheol-give-back'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 7:32 — *And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* The earth restoring its sleepers is Enoch 45:11''s earth and Sheol giving back what was entrusted to them.'
  FROM cross_reference_threads t, cross_references x, _session250_en45_lookup sv, _session250_en45_lookup tv
 WHERE t.slug='1-enoch-45-resurrection-earth-and-sheol-give-back'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

