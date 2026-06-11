-- ----- fragment: minion_1enoch_57.sql (session250 1-enoch 57) -----
-- Source anchor: enoch/1-enoch ch57. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en57 (view _session250_en57_lookup). Sort band base 51400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en57_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-57-gathered-from-east-and-west
  ('enoch', '1-enoch', 57, 1, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* Enoch''s incoming host is Yahuah''s promised SECOND recovery of the scattered remnant, gathered from every land of exile.'),
  ('enoch', '1-enoch', 57, 1, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The host of 57:1 is the two-house gathering by name — outcast Yashar''el and dispersed Yahudah, not a people replacing Israel.'),
  ('enoch', '1-enoch', 57, 1, 'canon', 'isaiah', 43, 5, 'free', E'Isaiah 43:5 — *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* Enoch''s host ''coming on the winds from the east, and from the west'' is the very seed Yahuah pledged to bring from east and west.'),
  ('enoch', '1-enoch', 57, 1, 'canon', 'isaiah', 43, 6, 'free', E'Isaiah 43:6 — *I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* the host pressing on ''to the south'' completes the four-quarter sweep by which Yahuah summons His sons and daughters home.'),
  ('enoch', '1-enoch', 57, 1, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* it is Yahuah who takes the riders in Enoch''s host from among the heathen and brings them home, the same two-stick regathering Ezekiel sees.'),
  -- thread: 1-enoch-57-wagons-on-the-wind
  ('enoch', '1-enoch', 57, 1, 'canon', 'isaiah', 66, 15, 'free', E'Isaiah 66:15 — *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire.* Enoch''s wagons ''coming on the winds'' are of a piece with Yahuah''s whirlwind chariots in the day He arrives to judge and gather.'),
  ('enoch', '1-enoch', 57, 1, 'canon', 'isaiah', 66, 20, 'free', E'Isaiah 66:20 — *And they shall bring all your brethren for an offering unto Yahuah (LORD) out of all nations upon horses, and in chariots, and in litters, and upon mules, and upon swift beasts, to my holy mountain Jerusalem, saith Yahuah (LORD), as the children of Yashar''el (Israel) bring an offering in a clean vessel into the house of Yahuah (LORD).* The chariots of 57:1 carry the brethren out of all nations home to the holy mountain, exactly Isaiah''s homecoming train.'),
  ('enoch', '1-enoch', 57, 2, 'canon', 'matthew', 24, 31, 'free', E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The sound heard ''from the one end of heaven to the other, in one day'' is the Son of Adam''s trumpet-ingathering of the elect from the four winds.'),
  -- thread: 1-enoch-57-great-trumpet-and-worship
  ('enoch', '1-enoch', 57, 3, 'canon', 'isaiah', 27, 13, 'free', E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The great trumpet gathers the outcasts to worship — the same end as Enoch''s host, which falls down to worship Yahuah of Spirits.'),
  ('enoch', '1-enoch', 57, 3, 'canon', 'isaiah', 49, 22, 'free', E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* The returning host is Yahuah''s own children borne home in arms and on shoulders, gathered to bow before Him.'),
  ('enoch', '1-enoch', 57, 3, 'enoch', '1-enoch', 61, 5, 'extras', E'1 Enoch 61:5 — *And these measures shall reveal all the secrets of the depths of the earth, And those who have been destroyed by the desert, And those who have been devoured by the beasts, And those who have been devoured by the fish of the sea, That they may return and stay themselves On the day of the Elect One; For none shall be destroyed before Yahuah (God) of Spirits, And none can be destroyed.* Enoch''s own vision-cycle already promised the return of even the lost and perished on the day of the Elect One — the regathering 57:3 brings to worship.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en57_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en57_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-57-gathered-from-east-and-west',
       E'The host gathered from the east and from the west — the scattered seed regathered',
       E'The second Parable closes with the return of the dispersion: *And it came to pass after this that I saw another host of wagons, and men riding thereon, and coming on the winds from the east, and from the west to the south.* (1 Enoch 57:1). This is no church gathered out of the nations to replace Israel — it is the twelve tribes regathered to the land, exactly as the prophets foretold. Yahuah promised a SECOND ingathering of the very seed He had scattered: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* (Isaiah 11:11), and He names the two houses plainly — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12). Enoch''s host comes ''from the east, and from the west,'' which is the very compass of Yahuah''s word: *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* (Isaiah 43:5), *I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* (Isaiah 43:6). And it is the Creator Himself, not human empire, who takes them up: *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21). The dispersed seed comes home.',
       sv.verse_id, ev.verse_id, 'extras', 51400
  FROM _session250_en57_lookup sv, _session250_en57_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=57 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-57-wagons-on-the-wind',
       E'Wagons borne on the wind, and the noise heard from end to end of heaven',
       E'The returning host rides not by its own strength but is carried: *I saw another host of wagons, and men riding thereon, and coming on the winds from the east* (1 Enoch 57:1), and *the noise of their wagons was heard ... and the sound thereof was heard from the one end of heaven to the other, in one day.* (1 Enoch 57:2). The wagons-on-the-wind are Yahuah''s own conveyance of His people: *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire.* (Isaiah 66:15), and by that same train He delivers the exiles to His mountain — *And they shall bring all your brethren for an offering unto Yahuah (LORD) out of all nations upon horses, and in chariots, and in litters, and upon mules, and upon swift beasts, to my holy mountain Jerusalem, saith Yahuah (LORD), as the children of Yashar''el (Israel) bring an offering in a clean vessel into the house of Yahuah (LORD).* (Isaiah 66:20). And the sound that fills heaven ''from the one end to the other, in one day'' is the Son of Adam''s own ingathering: *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* (Matthew 24:31) — the elect gathered on the winds, end of heaven to end of heaven, the words Enoch wrote ages before.',
       sv.verse_id, ev.verse_id, 'extras', 51403
  FROM _session250_en57_lookup sv, _session250_en57_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=57 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-57-great-trumpet-and-worship',
       E'The great trumpet, the outcasts gathered to worship Yahuah of Spirits',
       E'The Parable ends not in conquest but in worship: *And they shall all fall down and worship Yahuah (God) of Spirits. And this is the end of the second Parable.* (1 Enoch 57:3). The trumpet that sounds across heaven and brings the perishing home to bow is Isaiah''s great trumpet: *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* (Isaiah 27:13) — the outcasts brought in to WORSHIP, the very posture of Enoch''s regathered host. Even those long given up for dead are kept for this day, as Enoch himself had already declared in this same vision-cycle: *And these measures shall reveal all the secrets of the depths of the earth, And those who have been destroyed by the desert, And those who have been devoured by the beasts, And those who have been devoured by the fish of the sea, That they may return and stay themselves On the day of the Elect One; For none shall be destroyed before Yahuah (God) of Spirits, And none can be destroyed.* (1 Enoch 61:5). The scattered seed — even the lost and the perished — returns to fall down before Yahuah of Spirits.',
       sv.verse_id, ev.verse_id, 'extras', 51406
  FROM _session250_en57_lookup sv, _session250_en57_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=57 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-57-gathered-from-east-and-west
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* Enoch''s incoming host is Yahuah''s promised SECOND recovery of the scattered remnant, gathered from every land of exile.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-gathered-from-east-and-west'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* The host of 57:1 is the two-house gathering by name — outcast Yashar''el and dispersed Yahudah, not a people replacing Israel.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-gathered-from-east-and-west'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 43:5 — *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* Enoch''s host ''coming on the winds from the east, and from the west'' is the very seed Yahuah pledged to bring from east and west.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-gathered-from-east-and-west'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 43:6 — *I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* the host pressing on ''to the south'' completes the four-quarter sweep by which Yahuah summons His sons and daughters home.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-gathered-from-east-and-west'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* it is Yahuah who takes the riders in Enoch''s host from among the heathen and brings them home, the same two-stick regathering Ezekiel sees.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-gathered-from-east-and-west'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-57-wagons-on-the-wind
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:15 — *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire.* Enoch''s wagons ''coming on the winds'' are of a piece with Yahuah''s whirlwind chariots in the day He arrives to judge and gather.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-wagons-on-the-wind'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:20 — *And they shall bring all your brethren for an offering unto Yahuah (LORD) out of all nations upon horses, and in chariots, and in litters, and upon mules, and upon swift beasts, to my holy mountain Jerusalem, saith Yahuah (LORD), as the children of Yashar''el (Israel) bring an offering in a clean vessel into the house of Yahuah (LORD).* The chariots of 57:1 carry the brethren out of all nations home to the holy mountain, exactly Isaiah''s homecoming train.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-wagons-on-the-wind'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The sound heard ''from the one end of heaven to the other, in one day'' is the Son of Adam''s trumpet-ingathering of the elect from the four winds.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-wagons-on-the-wind'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-57-great-trumpet-and-worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The great trumpet gathers the outcasts to worship — the same end as Enoch''s host, which falls down to worship Yahuah of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-great-trumpet-and-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* The returning host is Yahuah''s own children borne home in arms and on shoulders, gathered to bow before Him.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-great-trumpet-and-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 61:5 — *And these measures shall reveal all the secrets of the depths of the earth, And those who have been destroyed by the desert, And those who have been devoured by the beasts, And those who have been devoured by the fish of the sea, That they may return and stay themselves On the day of the Elect One; For none shall be destroyed before Yahuah (God) of Spirits, And none can be destroyed.* Enoch''s own vision-cycle already promised the return of even the lost and perished on the day of the Elect One — the regathering 57:3 brings to worship.'
  FROM cross_reference_threads t, cross_references x, _session250_en57_lookup sv, _session250_en57_lookup tv
 WHERE t.slug='1-enoch-57-great-trumpet-and-worship'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=57 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=61 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

