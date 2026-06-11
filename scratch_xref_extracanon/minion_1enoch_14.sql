-- ----- fragment: minion_1enoch_14.sql (session250 1-enoch 14) -----
-- Source anchor: enoch/1-enoch ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en14 (view _session250_en14_lookup). Sort band base 50325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-14-throne-house-of-heaven
  ('enoch', '1-enoch', 14, 15, 'canon', 'ezekiel', 1, 26, 'free', E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* Ezekiel sees the same sapphire throne reaching above the firmament that Enoch sees at the summit of the middle mountain in 14:15.'),
  ('enoch', '1-enoch', 14, 16, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne of fiery flame is the flaming fire Enoch sees blazing before the throne of Yahuah in 14:16.'),
  ('enoch', '1-enoch', 14, 16, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The fiery stream from the Head of Days'' throne is the same river of heavenly fire Enoch beholds beyond the throne in 14:16-17.'),
  ('enoch', '1-enoch', 14, 15, 'canon', 'revelation', 4, 2, 'free', E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John is carried up in the spirit to the same enthroned glory Enoch is carried up to see in 14:15, the one throne that stands from his vision to John''s.'),
  -- thread: 1-enoch-14-waste-and-horrible-place
  ('enoch', '1-enoch', 14, 18, 'canon', 'genesis', 1, 2, 'free', E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* The ''waste and horrible place'' with no firmament and no founded earth is the tohu-and-bohu of creation''s first verse — the un-ordered ground that lies outside the Creator''s order in 14:18.'),
  ('enoch', '1-enoch', 14, 18, 'canon', 'jeremiah', 4, 23, 'free', E'Jeremiah 4:23 — *I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light.* Jeremiah sees creation rolled back to formlessness under judgement — the same waste place with no firmament above that Enoch is shown in 14:18.'),
  ('enoch', '1-enoch', 14, 18, 'canon', 'jeremiah', 4, 25, 'free', E'Jeremiah 4:25 — *I beheld, and, lo, there was no man, and all the birds of the heavens were fled.* The fled birds match Enoch''s place where ''there was no water upon it, and no birds'' (14:18) — the desolation that mirrors the place of imprisonment.'),
  -- thread: 1-enoch-14-prison-of-the-stars-host-of-heaven
  ('enoch', '1-enoch', 14, 19, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah''s ''host of the high ones'' is the very ''host of heaven'' Enoch sees imprisoned at the end of heaven and earth in 14:19.'),
  ('enoch', '1-enoch', 14, 21, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The shutting-up in prison until a later visitation is exactly Enoch''s binding of the stars ''till the time when their guilt should be consummated'' in 14:21.'),
  ('enoch', '1-enoch', 14, 19, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' reserved in darkness are Enoch''s transgressing stars shut up in the prison at the end of heaven and earth in 14:19-21.'),
  ('enoch', '1-enoch', 14, 21, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the prisoners as the rebel angels reserved in chains until the judgment — the same binding ''till the time when their guilt should be consummated'' Enoch records in 14:21.'),
  ('enoch', '1-enoch', 14, 21, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter''s angels in chains of darkness reserved unto judgment are Enoch''s stars bound till their guilt is consummated in 14:21 — the canon''s own witness to the bound Watchers of Genesis 6.'),
  ('enoch', '1-enoch', 14, 19, 'enoch', '1-enoch', 21, 11, 'extras', E'1 Enoch 21:11 — *And he said unto me: ''This place is the prison of the angels, and here they will be imprisoned for ever.''* Enoch''s own book, revisiting this same place, names the prison of the stars plainly as the prison of the angels — confirming the ''stars and the host of heaven'' of 14:19 are the fallen Watchers.'),
  -- thread: 1-enoch-14-stars-transgressed-appointed-times
  ('enoch', '1-enoch', 14, 20, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The lights were set under a commandment to keep their appointed seasons; Enoch''s stars ''transgressed the commandment'' by not coming forth at their appointed times (14:20).'),
  ('enoch', '1-enoch', 14, 20, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The stars the Creator made to rule their courses are the very stars that transgressed His commandment in the beginning of their rising in 14:20.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-14-throne-house-of-heaven',
       E'The throne in the house of heaven — sapphire and flaming fire',
       E'Enoch is carried up and sees the throne-room of the Creator: *And I saw the foundations of the house of heaven, and the pillars of fire, and the pillars of light, and the pillars of ice, and the pillars of snow, and the pillars of hail.* (1 Enoch 14:8), and the middle mountain that *reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* (1 Enoch 14:15), beyond which he sees *a flaming fire* (1 Enoch 14:16). It ain''t new — the prophets saw the same throne. Ezekiel beheld *the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* (Ezekiel 1:26) — the very sapphire of Enoch''s vision. Daniel saw the Head of Days enthroned: *his throne was like the fiery flame, and his wheels as burning fire. A fiery stream issued and came forth from before him* (Daniel 7:9-10), the same flaming fire that pours from Enoch''s throne. And John''s Revelation closes the circle: *a throne was set in heaven, and one sat on the throne... and out of the throne proceeded lightnings and thunderings and voices* (Revelation 4:2,5). One throne, one Creator, one order that stands — not a new vision but the one true vision handed down.',
       sv.verse_id, ev.verse_id, 'extras', 50325
  FROM _session250_en14_lookup sv, _session250_en14_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=14 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-14-waste-and-horrible-place',
       E'The waste and horrible place — formless, void, no birds',
       E'Beyond the abyss Enoch is shown the undoing of creation itself: *And beyond that abyss I saw a place which had no firmament of the heaven above, and no firmly founded earth beneath it: there was no water upon it, and no birds, but it was a waste and horrible place.* (1 Enoch 14:18). It ain''t new — this is the tohu-va-bohu of the first verses of Torah, the un-creation behind the work of the six days: *And the earth was without form, and void; and darkness was upon the face of the deep.* (Genesis 1:2). And it is precisely the picture Jeremiah is given of the land under judgement, creation rolled back: *I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light... I beheld, and, lo, there was no man, and all the birds of the heavens were fled.* (Jeremiah 4:23,25) — the very ''no birds'' of Enoch''s waste place. The Creator who ordered the deep can leave a place outside His order; that emptiness is the prison-ground for what rebelled against the order. Not new — the oldest warning in the Book.',
       sv.verse_id, ev.verse_id, 'extras', 50328
  FROM _session250_en14_lookup sv, _session250_en14_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-14-prison-of-the-stars-host-of-heaven',
       E'A prison for the stars and the host of heaven — the bound Watchers',
       E'Enoch sees the prison prepared for the rebels: *I saw there seven stars like great burning mountains, and to me, when I inquired regarding them, the angel said: ''This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* (1 Enoch 14:19), *And He was wroth with them, and bound them till the time when their guilt should be consummated (even) for ten thousand years.''* (1 Enoch 14:21). These ''stars'' are the fallen Watchers of Genesis 6 — Enoch''s own book names this same prison the prison of the angels (1 Enoch 21:11). It ain''t new: Isaiah saw it — *Yahuah (LORD) shall punish the host of the high ones that are on high... And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:21-22). Jude carries it into the Gospel age, calling the Watchers *wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:13), and naming their crime: *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). Peter says it plainly: *Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The Watchers'' sin is rebellion against the Creator''s order, and their binding waits a fixed day of judgement — Torah''s order stands, and what broke it is held. The seed-war began here.',
       sv.verse_id, ev.verse_id, 'extras', 50331
  FROM _session250_en14_lookup sv, _session250_en14_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=19
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=14 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-14-stars-transgressed-appointed-times',
       E'Stars that came not at their appointed times — breaking the order of the lights',
       E'The charge against the imprisoned stars is that they broke the Creator''s appointed order: *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* (1 Enoch 14:20). It ain''t new — the very fourth-day decree of Torah set the lights in their courses with a command: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14), and *he made the stars also.* (Genesis 1:16). The lights were given a commandment — for signs and seasons (moedim), to keep their times. The transgressing stars are those who would not keep the appointed times the Creator set; their sin, like the Watchers'', is rebellion against His ordered law. The order of the heavens stands as surely as Torah stands; the rebel is bound, not the law.',
       sv.verse_id, ev.verse_id, 'extras', 50334
  FROM _session250_en14_lookup sv, _session250_en14_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=20
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-14-throne-house-of-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* Ezekiel sees the same sapphire throne reaching above the firmament that Enoch sees at the summit of the middle mountain in 14:15.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-throne-house-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne of fiery flame is the flaming fire Enoch sees blazing before the throne of Yahuah in 14:16.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-throne-house-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The fiery stream from the Head of Days'' throne is the same river of heavenly fire Enoch beholds beyond the throne in 14:16-17.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-throne-house-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John is carried up in the spirit to the same enthroned glory Enoch is carried up to see in 14:15, the one throne that stands from his vision to John''s.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-throne-house-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-14-waste-and-horrible-place
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* The ''waste and horrible place'' with no firmament and no founded earth is the tohu-and-bohu of creation''s first verse — the un-ordered ground that lies outside the Creator''s order in 14:18.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-waste-and-horrible-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 4:23 — *I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light.* Jeremiah sees creation rolled back to formlessness under judgement — the same waste place with no firmament above that Enoch is shown in 14:18.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-waste-and-horrible-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 4:25 — *I beheld, and, lo, there was no man, and all the birds of the heavens were fled.* The fled birds match Enoch''s place where ''there was no water upon it, and no birds'' (14:18) — the desolation that mirrors the place of imprisonment.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-waste-and-horrible-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-14-prison-of-the-stars-host-of-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah''s ''host of the high ones'' is the very ''host of heaven'' Enoch sees imprisoned at the end of heaven and earth in 14:19.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The shutting-up in prison until a later visitation is exactly Enoch''s binding of the stars ''till the time when their guilt should be consummated'' in 14:21.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' reserved in darkness are Enoch''s transgressing stars shut up in the prison at the end of heaven and earth in 14:19-21.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the prisoners as the rebel angels reserved in chains until the judgment — the same binding ''till the time when their guilt should be consummated'' Enoch records in 14:21.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter''s angels in chains of darkness reserved unto judgment are Enoch''s stars bound till their guilt is consummated in 14:21 — the canon''s own witness to the bound Watchers of Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 21:11 — *And he said unto me: ''This place is the prison of the angels, and here they will be imprisoned for ever.''* Enoch''s own book, revisiting this same place, names the prison of the stars plainly as the prison of the angels — confirming the ''stars and the host of heaven'' of 14:19 are the fallen Watchers.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-prison-of-the-stars-host-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-14-stars-transgressed-appointed-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The lights were set under a commandment to keep their appointed seasons; Enoch''s stars ''transgressed the commandment'' by not coming forth at their appointed times (14:20).'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-stars-transgressed-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The stars the Creator made to rule their courses are the very stars that transgressed His commandment in the beginning of their rising in 14:20.'
  FROM cross_reference_threads t, cross_references x, _session250_en14_lookup sv, _session250_en14_lookup tv
 WHERE t.slug='1-enoch-14-stars-transgressed-appointed-times'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

