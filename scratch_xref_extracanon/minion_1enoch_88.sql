-- ----- fragment: minion_1enoch_88.sql (session250 1-enoch 88) -----
-- Source anchor: enoch/1-enoch ch88. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en88 (view _session250_en88_lookup). Sort band base 52175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en88_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-88-fallen-star-bound-in-the-abyss
  ('enoch', '1-enoch', 88, 1, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Enoch''s vision replays in animal figures the very binding command given the archangels earlier in his own book — the first fallen star is Azâzêl, bound hand and foot and cast into the abyss.'),
  ('enoch', '1-enoch', 88, 1, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s reserved-in-chains-until-judgment is Enoch''s star bound in the narrow, horrible, dark abyss.'),
  ('enoch', '1-enoch', 88, 3, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* — Peter''s chains of darkness for the sinning angels are the binding of all the great stars hand and foot, cast into the abyss of the earth.'),
  ('enoch', '1-enoch', 88, 1, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s host-of-the-high-ones shut in the pit until a later visitation is Enoch''s star sealed in the deep abyss until the day of judgement.'),
  ('enoch', '1-enoch', 88, 3, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* John''s binding of the dragon in the sealed pit reuses Enoch''s exact gesture — seized, bound, cast down, shut into the deep.'),
  -- thread: 1-enoch-88-giants-slay-one-another-by-the-sword
  ('enoch', '1-enoch', 88, 2, 'enoch', '1-enoch', 10, 9, 'extras', E'1 Enoch 10:9 — *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men [and cause them to go forth]: send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The sword given the elephants, camels and asses to smite one another is Enoch''s own decree against the giants — sent each against the other to destroy each other in battle.'),
  ('enoch', '1-enoch', 88, 2, 'jubilees', 'jubilees', 5, 9, 'extras', E'Jubilees 5:9 — *And He sent His sword into their midst that each should slay his neighbour, and they began to slay each other till they all fell by the sword and were destroyed from the earth.* Jubilees records the identical judgement on the giants — the sword set in their midst so they slay one another — that the Animal Apocalypse shows as beasts smiting each other.'),
  ('enoch', '1-enoch', 88, 2, 'canon', 'genesis', 6, 13, 'free', E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* The whole earth quaking because of the giants is Genesis'' earth filled with violence — the corruption that brings the verdict on all flesh.'),
  -- thread: 1-enoch-88-white-bull-noah-builds-the-vessel
  ('enoch', '1-enoch', 88, 4, 'canon', 'genesis', 6, 14, 'free', E'Genesis 6:14 — *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* The white bull building for himself a great vessel and dwelling thereon is Noah commanded to make the ark.'),
  ('enoch', '1-enoch', 88, 4, 'canon', 'genesis', 6, 17, 'free', E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* This flood of waters is the very secret the archangel instructs the white bull in, without his being terrified.'),
  ('enoch', '1-enoch', 88, 4, 'canon', '1-peter', 3, 20, 'free', E'1 Peter 3:20 — *Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.* Peter''s eight souls in the ark match Enoch''s white bull and the three bulls (with their wives) covered in within the vessel.'),
  ('enoch', '1-enoch', 88, 4, 'jasher', 'jasher', 6, 15, 'extras', E'Jasher 6:15 — *And Noah and his household, and all the living creatures that were with him, came into the ark on account of the waters of the flood, and Yahuah (the Lord) shut him in.* Jasher''s household sealed into the ark is Enoch''s white bull and three bulls dwelling in the vessel and covered in.'),
  -- thread: 1-enoch-88-the-flood-the-vessel-floats-the-earth-dries
  ('enoch', '1-enoch', 88, 6, 'canon', 'genesis', 7, 11, 'free', E'Genesis 7:11 — *In the six hundredth year of Noah’s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* Enoch''s seven torrents from the lofty roof and the fountains opened on the earth are Genesis'' windows of heaven and fountains of the great deep.'),
  ('enoch', '1-enoch', 88, 8, 'canon', 'genesis', 7, 21, 'free', E'Genesis 7:21 — *And all flesh died that moved upon the earth, both of fowl, and of cattle, and of beast, and of every creeping thing that creepeth upon the earth, and every man* — the cattle of the enclosure swallowed up and perished in the water is Genesis'' all flesh dying in the Flood.'),
  ('enoch', '1-enoch', 88, 12, 'canon', 'genesis', 8, 13, 'free', E'Genesis 8:13 — *And it came to pass in the six hundredth and first year, in the first month, the first day of the month, the waters were dried up from off the earth: and Noah removed the covering of the ark, and looked, and, behold, the face of the ground was dry.* The water withdrawn and the dry earth covered with verdure is Genesis'' face of the ground made dry.'),
  ('enoch', '1-enoch', 88, 5, 'jasher', 'jasher', 6, 14, 'extras', E'Jasher 6:14 — *And all the fountains of the deep were broken up, and the windows of heaven were opened, and the rain was upon the earth forty days and forty nights.* Jasher''s fountains and windows of heaven are Enoch''s seven torrents and opened fountains pouring into the enclosure.'),
  ('enoch', '1-enoch', 88, 12, 'jubilees', 'jubilees', 5, 31, 'extras', E'Jubilees 5:31 — *And the waters disappeared from above the earth in the fifth week in the seventh year thereof, and on the seventeenth day in the second month the earth was dry.* Jubilees dates the drying that Enoch sees as the water withdrawn and the earth covered with verdure.'),
  ('enoch', '1-enoch', 88, 9, 'canon', 'matthew', 24, 39, 'free', E'Matthew 24:39 — *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be.* Yahusha makes the Flood — the herd swept off while the vessel floats safe — the type of the coming of the Son of Adam, the elect kept while judgement takes the rest.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en88_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en88_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-88-fallen-star-bound-in-the-abyss',
       E'The fallen star bound hand and foot, cast into the deep abyss',
       E'The Animal Apocalypse turns the Watchers'' judgement into a single, stark image: *And I saw one of those four who had come forth first, and he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss: now that abyss was narrow and deep, and horrible and dark.* (1 Enoch 88:1), and again *one of those four who had come forth stoned (them) from heaven, and gathered and took all the great stars whose privy members were like those of horses, and bound them all hand and foot, and cast them in an abyss of the earth* (1 Enoch 88:3). This is Enoch''s own earlier scene retold in figures — the same binding command the four archangels received: *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4). The canon carries the very same sentence forward: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The Watchers'' rebellion against the Creator''s order — not Torah, but its breaking — earns the chains. Isaiah sees the same double court above and below: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* (Isaiah 24:21), *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22). And John, at the end, reuses Enoch''s exact gesture upon the dragon: *And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand.* (Revelation 20:1), *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* (Revelation 20:3). It ain''t new — the bound star of Enoch is the chained Watcher of Jude, the prisoner of the pit of Isaiah, the sealed dragon of Revelation.',
       sv.verse_id, ev.verse_id, 'extras', 52175
  FROM _session250_en88_lookup sv, _session250_en88_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=88 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-88-giants-slay-one-another-by-the-sword',
       E'The sword given the giants — they smite each other and the earth quakes',
       E'*And one of them drew a sword, and gave it to those elephants and camels and asses: then they began to smite each other, and the whole earth quaked because of them.* (1 Enoch 88:2). The elephants, camels, and asses are the giants — the monstrous offspring of the Watchers and the daughters of men — and their end is mutual slaughter at heaven''s own appointment. This is Enoch''s earlier decree dramatized: *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men [and cause them to go forth]: send them one against the other that they may destroy each other in battle: for length of days shall they not have.* (1 Enoch 10:9). Jubilees tells it the same way: *And He sent His sword into their midst that each should slay his neighbour, and they began to slay each other till they all fell by the sword and were destroyed from the earth.* (Jubilees 5:9). This is the canon''s seed-war — the line of corruption sown among men, the tares woven into the field — and its first great purge is the giants turning the sword on themselves before ever the Flood comes. The earth itself quakes at the violence; *the earth is filled with violence through them* (Genesis 6:13) is the same indictment, and the sword is the appointed answer to it.',
       sv.verse_id, ev.verse_id, 'extras', 52178
  FROM _session250_en88_lookup sv, _session250_en88_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=88 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-88-white-bull-noah-builds-the-vessel',
       E'The white bull instructed in a secret — born a bull, became a man, built the vessel',
       E'Out of the white seed-line a deliverer is raised: *And one of those four went to that white bull and instructed him in a secret, without his being terrified: he was born a bull and became a man, and built for himself a great vessel and dwelt thereon; and three bulls dwelt with him in that vessel and they were covered in.* (1 Enoch 88:4). The white bull is Noah — of the righteous line that runs from the white bull Adam — taught the secret of the coming Flood by an archangel and told to build the ark; the three bulls dwelling with him are Shem, Ham, and Japheth. This is Genesis told in colours: *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* (Genesis 6:14), and *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* (Genesis 6:17) — the very secret Noah is instructed in. Peter counts the same household: *Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.* (1 Peter 3:20). The Book of Jasher remembers Noah''s hundred-and-twenty-year warning and the sealing-in: *And Noah and his household, and all the living creatures that were with him, came into the ark on account of the waters of the flood, and Yahuah (the Lord) shut him in.* (Jasher 6:15). Election precedes the rescue — the white bull is chosen out of the herd before the waters rise; he is not self-saved but instructed, covered in, and kept.',
       sv.verse_id, ev.verse_id, 'extras', 52181
  FROM _session250_en88_lookup sv, _session250_en88_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=88 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-88-the-flood-the-vessel-floats-the-earth-dries',
       E'The torrents and fountains — the cattle perish, the vessel floats, the earth dries',
       E'The Flood comes from above and below at once: *And again I raised mine eyes toward heaven and saw a lofty roof, with seven water torrents thereon, and those torrents flow with much water into an enclosure.* (1 Enoch 88:5), *And I saw again and behold fountains were opened on the earth, in that great enclosure, and that water began to swell and rise upon the earth* (1 Enoch 88:6). That is Genesis exactly: *the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* (Genesis 7:11). The whole herd of the corrupted earth is swept away — *And all the cattle of that enclosure were gathered together until I saw how they sank and were swallowed up and perished in that water.* (1 Enoch 88:8) — as the canon records: *And all flesh died that moved upon the earth, both of fowl, and of cattle, and of beast, and of every creeping thing that creepeth upon the earth, and every man* (Genesis 7:21). Only the vessel rides safe: *But that vessel floated on the water, while all the oxen and elephants and camels and asses sank to the bottom with all the animals* (1 Enoch 88:9). The Book of Jasher remembers the same fountains and the terror: *And all the fountains of the deep were broken up, and the windows of heaven were opened, and the rain was upon the earth forty days and forty nights.* (Jasher 6:14). Then the waters recede and the earth is renewed: *But the water was withdrawn, and the earth became dry, and the earth was covered with verdure.* (1 Enoch 88:12), as in Genesis: *the waters were dried up from off the earth: and Noah removed the covering of the ark, and looked, and, behold, the face of the ground was dry.* (Genesis 8:13), and as Jubilees dates it: *And the waters disappeared from above the earth in the fifth week in the seventh year thereof, and on the seventeenth day in the second month the earth was dry.* (Jubilees 5:31). Yahusha set the Flood as the type of His own coming: *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be.* (Matthew 24:39) — the cattle swallowed up, the elect kept in the vessel, the dry earth covered with new verdure: it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 52184
  FROM _session250_en88_lookup sv, _session250_en88_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=88 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-88-fallen-star-bound-in-the-abyss
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Enoch''s vision replays in animal figures the very binding command given the archangels earlier in his own book — the first fallen star is Azâzêl, bound hand and foot and cast into the abyss.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-fallen-star-bound-in-the-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s reserved-in-chains-until-judgment is Enoch''s star bound in the narrow, horrible, dark abyss.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-fallen-star-bound-in-the-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* — Peter''s chains of darkness for the sinning angels are the binding of all the great stars hand and foot, cast into the abyss of the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-fallen-star-bound-in-the-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s host-of-the-high-ones shut in the pit until a later visitation is Enoch''s star sealed in the deep abyss until the day of judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-fallen-star-bound-in-the-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* John''s binding of the dragon in the sealed pit reuses Enoch''s exact gesture — seized, bound, cast down, shut into the deep.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-fallen-star-bound-in-the-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-88-giants-slay-one-another-by-the-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:9 — *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men [and cause them to go forth]: send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The sword given the elephants, camels and asses to smite one another is Enoch''s own decree against the giants — sent each against the other to destroy each other in battle.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-giants-slay-one-another-by-the-sword'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 5:9 — *And He sent His sword into their midst that each should slay his neighbour, and they began to slay each other till they all fell by the sword and were destroyed from the earth.* Jubilees records the identical judgement on the giants — the sword set in their midst so they slay one another — that the Animal Apocalypse shows as beasts smiting each other.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-giants-slay-one-another-by-the-sword'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* The whole earth quaking because of the giants is Genesis'' earth filled with violence — the corruption that brings the verdict on all flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-giants-slay-one-another-by-the-sword'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-88-white-bull-noah-builds-the-vessel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:14 — *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* The white bull building for himself a great vessel and dwelling thereon is Noah commanded to make the ark.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-white-bull-noah-builds-the-vessel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* This flood of waters is the very secret the archangel instructs the white bull in, without his being terrified.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-white-bull-noah-builds-the-vessel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 3:20 — *Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.* Peter''s eight souls in the ark match Enoch''s white bull and the three bulls (with their wives) covered in within the vessel.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-white-bull-noah-builds-the-vessel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 6:15 — *And Noah and his household, and all the living creatures that were with him, came into the ark on account of the waters of the flood, and Yahuah (the Lord) shut him in.* Jasher''s household sealed into the ark is Enoch''s white bull and three bulls dwelling in the vessel and covered in.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-white-bull-noah-builds-the-vessel'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=4
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-88-the-flood-the-vessel-floats-the-earth-dries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:11 — *In the six hundredth year of Noah’s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* Enoch''s seven torrents from the lofty roof and the fountains opened on the earth are Genesis'' windows of heaven and fountains of the great deep.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-the-flood-the-vessel-floats-the-earth-dries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:21 — *And all flesh died that moved upon the earth, both of fowl, and of cattle, and of beast, and of every creeping thing that creepeth upon the earth, and every man* — the cattle of the enclosure swallowed up and perished in the water is Genesis'' all flesh dying in the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-the-flood-the-vessel-floats-the-earth-dries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:13 — *And it came to pass in the six hundredth and first year, in the first month, the first day of the month, the waters were dried up from off the earth: and Noah removed the covering of the ark, and looked, and, behold, the face of the ground was dry.* The water withdrawn and the dry earth covered with verdure is Genesis'' face of the ground made dry.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-the-flood-the-vessel-floats-the-earth-dries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 6:14 — *And all the fountains of the deep were broken up, and the windows of heaven were opened, and the rain was upon the earth forty days and forty nights.* Jasher''s fountains and windows of heaven are Enoch''s seven torrents and opened fountains pouring into the enclosure.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-the-flood-the-vessel-floats-the-earth-dries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=5
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:31 — *And the waters disappeared from above the earth in the fifth week in the seventh year thereof, and on the seventeenth day in the second month the earth was dry.* Jubilees dates the drying that Enoch sees as the water withdrawn and the earth covered with verdure.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-the-flood-the-vessel-floats-the-earth-dries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 24:39 — *And knew not until the flood came, and took them all away; so shall also the coming of the Son of Adam be.* Yahusha makes the Flood — the herd swept off while the vessel floats safe — the type of the coming of the Son of Adam, the elect kept while judgement takes the rest.'
  FROM cross_reference_threads t, cross_references x, _session250_en88_lookup sv, _session250_en88_lookup tv
 WHERE t.slug='1-enoch-88-the-flood-the-vessel-floats-the-earth-dries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=88 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

