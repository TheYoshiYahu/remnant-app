-- ----- fragment: minion_1enoch_44.sql (session250 1-enoch 44) -----
-- Source anchor: enoch/1-enoch ch44. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en44 (view _session250_en44_lookup). Sort band base 51075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en44_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-44-chambers-of-the-luminaries
  ('enoch', '1-enoch', 44, 1, 'canon', 'job', 38, 35, 'free', E'Job 38:35 — *Canst thou send lightnings, that they may go, and say unto thee, Here we are?* Yahuah''s challenge to Job names the same secret of lightning and thunder Enoch is shown in the storehouses of 44:1.'),
  ('enoch', '1-enoch', 44, 2, 'enoch', '1-enoch', 41, 5, 'extras', E'1 Enoch 41:5 — *And I saw the chambers of the sun and moon, whence they proceed and whither they come again, and their glorious return, and how one is superior to the other, and their stately orbit* — this edition''s near-twin of 44, marking the closed chambers of 44:2 as a recurring vision of the same fixed order.'),
  ('enoch', '1-enoch', 44, 1, 'enoch', '1-enoch', 72, 1, 'extras', E'1 Enoch 72:1 — *The book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons... which Uriel, the holy angel who was with me, who was their leader, showed me* — the Luminaries book unfolds in detail the chambers Enoch only glimpses in 44:1.'),
  -- thread: 1-enoch-44-the-oath-the-lights-keep
  ('enoch', '1-enoch', 44, 3, 'canon', 'jeremiah', 33, 25, 'free', E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* — the sworn ordinance that holds day and night in place is the same oath by which Enoch''s lights set and rise in 44:3.'),
  ('enoch', '1-enoch', 44, 3, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* — the lights were appointed as a fixed reckoning from creation, the orbit Enoch sees them never leaving in 44:3.'),
  ('enoch', '1-enoch', 44, 4, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* — the lights that praise and rest not before Yahuah of Spirits in 44:4 are the same unceasing witness the Psalm hears in the firmament.'),
  ('enoch', '1-enoch', 44, 4, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years* — the monthly revolution of 44:4 is the very clockwork by which the moedim are appointed.'),
  -- thread: 1-enoch-44-light-divided-from-darkness
  ('enoch', '1-enoch', 44, 5, 'canon', 'genesis', 1, 4, 'free', E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness* — the first division of creation is the pattern Enoch extends in 44:5 to the dividing of the spirits of men.'),
  ('enoch', '1-enoch', 44, 5, 'canon', 'genesis', 1, 18, 'free', E'Genesis 1:18 — *And to rule over the day and over the night, and to divide the light from the darkness: and Elohim (God) saw that it was good* — the luminaries themselves are the agents of the division Enoch names in 44:5, light to the righteous and darkness to the sinners.'),
  -- thread: 1-enoch-44-no-angel-can-intercede
  ('enoch', '1-enoch', 44, 6, 'canon', '1-timothy', 2, 5, 'free', E'1 Timothy 2:5 — *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* — Enoch''s denial that any angel can intercede in 44:6 leaves the single Mediator to be the Formed Son in flesh, not a created angel.'),
  ('enoch', '1-enoch', 44, 6, 'canon', 'hebrews', 7, 25, 'free', E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* — where 44:6 says no angel can hear the prayer of man, the living Son alone makes intercession that prevails.'),
  ('enoch', '1-enoch', 44, 7, 'canon', 'genesis', 18, 25, 'free', E'Genesis 18:25 — *Shall not the Judge of all the earth do right?* — Abraham appeals to the very Judge of all whom Enoch confesses in 44:7, who judges every man according to his deeds.'),
  ('enoch', '1-enoch', 44, 7, 'canon', 'psalms', 50, 6, 'free', E'Psalm 50:6 — *And the heavens shall declare his righteousness: for Elohim (God) is judge himself. Selah.* — the same heavens whose lights Enoch has just surveyed proclaim that Elohim alone, not any angel, is judge (44:7).'),
  -- thread: 1-enoch-44-furnace-of-fire
  ('enoch', '1-enoch', 44, 8, 'canon', 'matthew', 13, 42, 'free', E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth* — Yahusha''s furnace of fire (the Son of Adam''s harvest of v.41) is the identical sentence Enoch pronounces on the sinners in 44:8.'),
  ('enoch', '1-enoch', 44, 8, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the parting of the victorious righteous from the doomed sinners in 44:8 is Daniel''s two awakenings.'),
  ('enoch', '1-enoch', 44, 8, 'canon', 'revelation', 20, 15, 'free', E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire* — John''s final assize seals the furnace-of-fire verdict Enoch announces over the sinners in 44:8.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en44_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en44_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-44-chambers-of-the-luminaries',
       E'The closed chambers — where the lights, winds, and waters proceed',
       E'Enoch is shown the hidden storehouses of creation: *Also another phenomenon I saw in regard to the secrets of lightning and thunder, and the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* (1 Enoch 44:1) and *And there I saw closed chambers out of which the winds are divided, the chamber of the hail and winds, the chamber of the mist, and of the clouds* (1 Enoch 44:2). It ain''t new — this is the very catechism Yahuah puts to Job out of the whirlwind: *Canst thou send lightnings, that they may go, and say unto thee, Here we are?* (Job 38:35), the Maker alone knowing the way to the dwelling of the light, the treasures of the hail and the chambers of the wind. This same edition gave the chamber-vision once already — *And I saw the chambers of the sun and moon, whence they proceed and whither they come again* (1 Enoch 41:5) — and the whole Book of the Luminaries opens on it: *The book of the courses of the luminaries of the heaven... which Uriel, the holy angel who was with me, who was their leader, showed me* (1 Enoch 72:1). The point is not science but sovereignty: the One who keeps the lightning on a leash is the One who judges men.',
       sv.verse_id, ev.verse_id, 'extras', 51075
  FROM _session250_en44_lookup sv, _session250_en44_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=44 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-44-the-oath-the-lights-keep',
       E'In accordance with an oath they set and rise — the unbroken ordinance of heaven',
       E'The sun and moon hold their station by covenant, not chance: *they do not leave their orbit, and they add nothing to their orbit and they do not take away from it, and they keep faith one with another: and in accordance with an oath they set and they rise.* (1 Enoch 44:3), and the moon *accomplishes the monthly revolution by day and by night—the one holding a position opposite to the other before Yahuah (God) of Spirits. And they give thanks and praise and rest not* (1 Enoch 44:4). It ain''t new — Yahuah binds His faithfulness to this very ordinance: *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25). The lights were set as a sworn timepiece from the start — *let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) — and their silent obedience is itself testimony: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1). Jubilees reads the same decree as the appointing of the feasts: *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years* (Jubilees 2:9). The luminaries keep their oath; so the appointed times stand.',
       sv.verse_id, ev.verse_id, 'extras', 51078
  FROM _session250_en44_lookup sv, _session250_en44_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=44 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-44-light-divided-from-darkness',
       E'He made a division between the light and the darkness — and between the spirits',
       E'The same word that splits day from night also separates the righteous from the sinner: *the course of the path of the moon is light to the righteous and darkness to the sinners in the name of Yahuah (God), who made a division between the light and the darkness, and divided the spirits of men, and strengthened the spirits of the righteous in the name of His righteousness.* (1 Enoch 44:5). It ain''t new — this is creation''s first separation: *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness* (Genesis 1:4), and the lights themselves were given *to divide the light from the darkness: and Elohim (God) saw that it was good* (Genesis 1:18). Enoch reads the cosmic division morally — election before confession: the Maker who parted light from dark also *divided the spirits of men, and strengthened the spirits of the righteous in the name of His righteousness*. The righteous are a people set apart by His division, not a class that selects itself; the same hand that fixed the luminaries fixes the line between light-people and dark.',
       sv.verse_id, ev.verse_id, 'extras', 51081
  FROM _session250_en44_lookup sv, _session250_en44_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=44 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-44-no-angel-can-intercede',
       E'No angel can intercede — He Himself is judge of all',
       E'Against every notion of a mediating angel, Enoch is blunt: *And no angel here has power to intercede for man, nor yet is any angel able to hear the prayer of man.* (1 Enoch 44:6) — *But He Himself is the judge of all, and He judges all according to their deeds.* (1 Enoch 44:7). It ain''t new — Scripture lets no angel stand in that gap: *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5); the one Mediator is no created angel but the Formed Son in flesh, who *is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). And the Judge that no angel can move is the One Abraham appealed to: *Shall not the Judge of all the earth do right?* (Genesis 18:25), of whom the Psalm sings, *the heavens shall declare his righteousness: for Elohim (God) is judge himself* (Psalm 50:6). Enoch shuts the door on angel-intercession precisely to leave one door open — judgement is the Father''s, and the only intercession is the Son He sends.',
       sv.verse_id, ev.verse_id, 'extras', 51084
  FROM _session250_en44_lookup sv, _session250_en44_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=44 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-44-furnace-of-fire',
       E'The sinners cast into the furnace of fire',
       E'The chapter ends at the judgement it has been building toward: *And in those days the sinners shall be driven from the face of the righteous, and the righteous shall be victorious in the name of Yahuah (God) of Spirits, and the sinners shall be cast into the furnace of fire.* (1 Enoch 44:8). It ain''t new — Yahusha speaks the same sentence in the same image, and even by the same title: *The Son of Adam shall send forth his angels, and they shall gather out of his kingdom all things that offend... And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth* (Matthew 13:41-42), after which *the righteous shine forth as the sun in the kingdom of their Father* — the very vindication Enoch promises. Daniel sets the two destinies side by side: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2), and John seals it: *And whosoever was not found written in the book of life was cast into the lake of fire* (Revelation 20:15). One verdict, one furnace, from Enoch''s days to the last day.',
       sv.verse_id, ev.verse_id, 'extras', 51087
  FROM _session250_en44_lookup sv, _session250_en44_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=44 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-44-chambers-of-the-luminaries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:35 — *Canst thou send lightnings, that they may go, and say unto thee, Here we are?* Yahuah''s challenge to Job names the same secret of lightning and thunder Enoch is shown in the storehouses of 44:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-chambers-of-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 41:5 — *And I saw the chambers of the sun and moon, whence they proceed and whither they come again, and their glorious return, and how one is superior to the other, and their stately orbit* — this edition''s near-twin of 44, marking the closed chambers of 44:2 as a recurring vision of the same fixed order.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-chambers-of-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=41 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 72:1 — *The book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons... which Uriel, the holy angel who was with me, who was their leader, showed me* — the Luminaries book unfolds in detail the chambers Enoch only glimpses in 44:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-chambers-of-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-44-the-oath-the-lights-keep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* — the sworn ordinance that holds day and night in place is the same oath by which Enoch''s lights set and rise in 44:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-the-oath-the-lights-keep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* — the lights were appointed as a fixed reckoning from creation, the orbit Enoch sees them never leaving in 44:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-the-oath-the-lights-keep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* — the lights that praise and rest not before Yahuah of Spirits in 44:4 are the same unceasing witness the Psalm hears in the firmament.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-the-oath-the-lights-keep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years* — the monthly revolution of 44:4 is the very clockwork by which the moedim are appointed.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-the-oath-the-lights-keep'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-44-light-divided-from-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness* — the first division of creation is the pattern Enoch extends in 44:5 to the dividing of the spirits of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-light-divided-from-darkness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:18 — *And to rule over the day and over the night, and to divide the light from the darkness: and Elohim (God) saw that it was good* — the luminaries themselves are the agents of the division Enoch names in 44:5, light to the righteous and darkness to the sinners.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-light-divided-from-darkness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-44-no-angel-can-intercede
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Timothy 2:5 — *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* — Enoch''s denial that any angel can intercede in 44:6 leaves the single Mediator to be the Formed Son in flesh, not a created angel.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-no-angel-can-intercede'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* — where 44:6 says no angel can hear the prayer of man, the living Son alone makes intercession that prevails.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-no-angel-can-intercede'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 18:25 — *Shall not the Judge of all the earth do right?* — Abraham appeals to the very Judge of all whom Enoch confesses in 44:7, who judges every man according to his deeds.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-no-angel-can-intercede'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 50:6 — *And the heavens shall declare his righteousness: for Elohim (God) is judge himself. Selah.* — the same heavens whose lights Enoch has just surveyed proclaim that Elohim alone, not any angel, is judge (44:7).'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-no-angel-can-intercede'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-44-furnace-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth* — Yahusha''s furnace of fire (the Son of Adam''s harvest of v.41) is the identical sentence Enoch pronounces on the sinners in 44:8.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-furnace-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the parting of the victorious righteous from the doomed sinners in 44:8 is Daniel''s two awakenings.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-furnace-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire* — John''s final assize seals the furnace-of-fire verdict Enoch announces over the sinners in 44:8.'
  FROM cross_reference_threads t, cross_references x, _session250_en44_lookup sv, _session250_en44_lookup tv
 WHERE t.slug='1-enoch-44-furnace-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=44 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

