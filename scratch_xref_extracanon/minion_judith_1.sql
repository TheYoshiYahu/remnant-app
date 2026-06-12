-- ----- fragment: minion_judith_01.sql (session253 judith 1) -----
-- Source anchor: apocrypha/judith ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt1 (view _session253_jdt1_lookup). Sort band base 60000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-1-king-of-the-assyrians
  ('apocrypha', 'judith', 1, 7, 'canon', 'isaiah', 10, 5, 'free', E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* Judith 1:7''s "king of the Assyrians" gathering the nations is the rod-kingdom Yahuah Himself wields as the staff of His indignation.'),
  ('apocrypha', 'judith', 1, 7, 'canon', 'isaiah', 10, 6, 'free', E'Isaiah 10:6 — *I will send him against an hypocritical nation, and against the people of my wrath will I give him a charge, to take the spoil, and to take the prey, and to tread them down like the mire of the streets.* The far-flung summons of Judith 1:7 is the Assyrian sent against the nations to take the spoil.'),
  ('apocrypha', 'judith', 1, 11, 'canon', 'isaiah', 10, 7, 'free', E'Isaiah 10:7 — *Howbeit he meaneth not so, neither doth his heart think so; but it is in his heart to destroy and cut off nations not a few.* When the western lands "made light of the commandment" (Judith 1:11), the king''s heart turns to destroy — the rod overreaching its charge.'),
  -- thread: judith-1-babel-the-kingdom-of-man
  ('apocrypha', 'judith', 1, 2, 'canon', 'genesis', 11, 4, 'free', E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The hewn-stone walls and hundred-cubit towers of Judith 1:2-3 are Babel''s ambition rebuilt — the city raised to make a name.'),
  ('apocrypha', 'judith', 1, 4, 'canon', 'genesis', 11, 9, 'free', E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* The mighty gates and armies of Judith 1:4 share Babel''s end — the kingdom of man scattered and brought to nought.'),
  ('apocrypha', 'judith', 1, 3, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The hundred-cubit towers of Judith 1:3 stand only to be spoiled (1:14) — the haughty height that goes before a fall.'),
  -- thread: judith-1-pride-of-the-world-king
  ('apocrypha', 'judith', 1, 7, 'canon', 'daniel', 4, 30, 'free', E'Daniel 4:30 — *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* The all-summoning Nebuchadnezzar of Judith 1:7 is the same proud world-king Daniel saw humbled for boasting in his own might.'),
  ('apocrypha', 'judith', 1, 12, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* When Nabuchodonosor "sware by his throne and kingdom" (Judith 1:12), he echoes the throne-exalting boast Yahuah brings down.'),
  ('apocrypha', 'judith', 1, 11, 'canon', 'obadiah', 1, 4, 'free', E'Obadiah 1:4 — *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD).* The king who is "made light of" by the nations (Judith 1:11) is the high one Yahuah promises to bring down.'),
  ('apocrypha', 'judith', 1, 12, 'canon', 'psalms', 2, 4, 'free', E'Psalm 2:4 — *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision.* Against the throne-sworn rage of Judith 1:12, the enthroned Yahuah simply laughs — the raging king is in derision.'),
  -- thread: judith-1-decree-to-slay-all
  ('apocrypha', 'judith', 1, 12, 'canon', 'esther', 3, 13, 'free', E'Esther 3:13 — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* The king''s oath to "slay with the sword all... all Judea" (Judith 1:12) is Haman''s extermination-decree — the tyrant''s edict against the covenant people.'),
  ('apocrypha', 'judith', 1, 12, 'canon', 'revelation', 13, 7, 'free', E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The vow to be avenged on all nations and slay all Judea (Judith 1:12) is the beast''s war on the saints — the same kingdom-of-man system unmasked.'),
  ('apocrypha', 'judith', 1, 12, 'canon', 'psalms', 33, 10, 'free', E'Psalm 33:10 — *Yahuah (LORD) bringeth the counsel of the heathen to nought: he maketh the devices of the people of none effect.* The throne-sworn slaughter of Judith 1:12 is exactly the heathen counsel Yahuah brings to nought — the deliverance will be His.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-1-king-of-the-assyrians',
       E'The king of the Assyrians — the rod of wrath',
       E'Judith opens with a great-king at war, and Scripture names the type before it names the man: *Then Nabuchodonosor king of the Assyrians sent to all that dwelt in Persia, and to all that dwelt westward, and to those that dwelt in Cilicia, and Damascus, and Libanus, and Antilibanus, and to all that dwelt upon the sea coast* (Judith 1:7). The book calls Nebuchadnezzar an *Assyrian* — not careless history but covenant typology: the rod-kingdom of man stretched against the whole earth. So Yahuah named Assyria of old — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation* (Isaiah 10:5), the conqueror sent against the nations: *I will send him against an hypocritical nation, and against the people of my wrath will I give him a charge, to take the spoil, and to take the prey, and to tread them down like the mire of the streets* (Isaiah 10:6). Yet the rod oversteps its commission — *Howbeit he meaneth not so, neither doth his heart think so; but it is in his heart to destroy and cut off nations not a few* (Isaiah 10:7). It ain''t new: the tyrant who would master all the earth is the same kingdom-of-man God has always raised up and then broken.',
       sv.verse_id, ev.verse_id, 'extras', 60000
  FROM _session253_jdt1_lookup sv, _session253_jdt1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-1-babel-the-kingdom-of-man',
       E'The walls of Ecbatane — Babel, the kingdom of man',
       E'Before the war comes the building: *And built in Ecbatane walls round about of stones hewn three cubits broad and six cubits long, and made the height of the wall seventy cubits, and the breadth thereof fifty cubits* (Judith 1:2), with *the towers thereof upon the gates of it an hundred cubits high* (Judith 1:3). The towering, self-glorifying city is the oldest sign of the kingdom of man — Babel: *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4). And as Babel was scattered — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth* (Genesis 11:9) — so this rival fortress is overthrown by chapter''s end, its beauty turned into shame. The proud builders are always brought down: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18).',
       sv.verse_id, ev.verse_id, 'extras', 60003
  FROM _session253_jdt1_lookup sv, _session253_jdt1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-1-pride-of-the-world-king',
       E'The pride of the world-king who would master the earth',
       E'The tyrant''s reach is total — *Then Nabuchodonosor king of the Assyrians sent to all that dwelt in Persia... and to all that dwelt upon the sea coast* (Judith 1:7), demanding the whole earth bend. This is the boast of the world-king in every age. So Nebuchadnezzar himself stood and bragged: *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* (Daniel 4:30) — and was made a beast for it. So the morning-star king said in his heart, *I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north* (Isaiah 14:13). Against every such throne Yahuah speaks: *The pride of thine heart hath deceived thee... that saith in his heart, Who shall bring me down to the ground? ...thence will I bring thee down, saith Yahuah (LORD)* (Obadiah 1:3-4). The kings rage, and *He that sitteth in the heavens shall laugh* (Psalm 2:4). Dismantle the system; the world-king''s majesty is borrowed and brief.',
       sv.verse_id, ev.verse_id, 'extras', 60006
  FROM _session253_jdt1_lookup sv, _session253_jdt1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-1-decree-to-slay-all',
       E'The decree to slay all — the counsel brought to nought',
       E'The wounded pride of the tyrant becomes a death-decree: *Therefore Nabuchodonosor was very angry with all this country, and sware by his throne and kingdom, that he would surely be avenged upon all those coasts of Cilicia, and Damascus, and Syria, and that he would slay with the sword all the inhabitants of the land of Moab, and the children of Ammon, and all Judea, and all that were in Egypt, till you come to the borders of the two seas* (Judith 1:12). It is the antichrist pattern — worship me or die — sworn against whole nations. So Haman wrote *to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day* (Esther 3:13); so the beast is given *to make war with the saints, and to overcome them* (Revelation 13:7). But the sworn oath of the world-king is empty before Yahuah, who *bringeth the counsel of the heathen to nought: he maketh the devices of the people of none effect* (Psalm 33:10). The decree is loud; the deliverance is His.',
       sv.verse_id, ev.verse_id, 'extras', 60009
  FROM _session253_jdt1_lookup sv, _session253_jdt1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-1-king-of-the-assyrians
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* Judith 1:7''s "king of the Assyrians" gathering the nations is the rod-kingdom Yahuah Himself wields as the staff of His indignation.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-king-of-the-assyrians'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 10:6 — *I will send him against an hypocritical nation, and against the people of my wrath will I give him a charge, to take the spoil, and to take the prey, and to tread them down like the mire of the streets.* The far-flung summons of Judith 1:7 is the Assyrian sent against the nations to take the spoil.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-king-of-the-assyrians'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 10:7 — *Howbeit he meaneth not so, neither doth his heart think so; but it is in his heart to destroy and cut off nations not a few.* When the western lands "made light of the commandment" (Judith 1:11), the king''s heart turns to destroy — the rod overreaching its charge.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-king-of-the-assyrians'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-1-babel-the-kingdom-of-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The hewn-stone walls and hundred-cubit towers of Judith 1:2-3 are Babel''s ambition rebuilt — the city raised to make a name.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-babel-the-kingdom-of-man'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* The mighty gates and armies of Judith 1:4 share Babel''s end — the kingdom of man scattered and brought to nought.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-babel-the-kingdom-of-man'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The hundred-cubit towers of Judith 1:3 stand only to be spoiled (1:14) — the haughty height that goes before a fall.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-babel-the-kingdom-of-man'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-1-pride-of-the-world-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 4:30 — *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* The all-summoning Nebuchadnezzar of Judith 1:7 is the same proud world-king Daniel saw humbled for boasting in his own might.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-pride-of-the-world-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* When Nabuchodonosor "sware by his throne and kingdom" (Judith 1:12), he echoes the throne-exalting boast Yahuah brings down.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-pride-of-the-world-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Obadiah 1:4 — *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD).* The king who is "made light of" by the nations (Judith 1:11) is the high one Yahuah promises to bring down.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-pride-of-the-world-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 2:4 — *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision.* Against the throne-sworn rage of Judith 1:12, the enthroned Yahuah simply laughs — the raging king is in derision.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-pride-of-the-world-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-1-decree-to-slay-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 3:13 — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* The king''s oath to "slay with the sword all... all Judea" (Judith 1:12) is Haman''s extermination-decree — the tyrant''s edict against the covenant people.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-decree-to-slay-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The vow to be avenged on all nations and slay all Judea (Judith 1:12) is the beast''s war on the saints — the same kingdom-of-man system unmasked.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-decree-to-slay-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:10 — *Yahuah (LORD) bringeth the counsel of the heathen to nought: he maketh the devices of the people of none effect.* The throne-sworn slaughter of Judith 1:12 is exactly the heathen counsel Yahuah brings to nought — the deliverance will be His.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt1_lookup sv, _session253_jdt1_lookup tv
 WHERE t.slug='judith-1-decree-to-slay-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

