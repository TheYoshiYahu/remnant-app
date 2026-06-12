-- =====================================================================
-- Session 253 — Judith FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_judith_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — Judith cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_judith_02.sql (session253 judith 2) -----
-- Source anchor: apocrypha/judith ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt2 (view _session253_jdt2_lookup). Sort band base 60025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-2-one-mouth-all-flesh
  ('apocrypha', 'judith', 2, 3, 'canon', 'daniel', 3, 4, 'free', E'Daniel 3:4 — *Then an herald cried aloud, To you it is commanded, O people, nations, and languages,* the same Babylonian decree binding all peoples to one man''s mouth that Judith 2:3 frames as the command none may disobey.'),
  ('apocrypha', 'judith', 2, 3, 'canon', 'daniel', 3, 6, 'free', E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace,* death for disobedience exactly as Judith 2:3 decrees the destruction of all flesh that obeys not the king''s mouth.'),
  ('apocrypha', 'judith', 2, 2, 'canon', 'revelation', 13, 7, 'free', E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations,* the beast''s universal dominion that Nabuchodonosor''s afflicting of the whole earth in Judith 2:2 foreshadows.'),
  ('apocrypha', 'judith', 2, 3, 'canon', 'revelation', 13, 8, 'free', E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world,* the demand for total compliance that Judith 2:3 issues as a decree against all flesh.'),
  -- thread: judith-2-lord-of-whole-earth
  ('apocrypha', 'judith', 2, 5, 'canon', 'isaiah', 10, 13, 'free', E'Isaiah 10:13 — *For he saith, By the strength of my hand I have done it, and by my wisdom; for I am prudent: and I have removed the bounds of the people, and have robbed their treasures, and I have put down the inhabitants like a valiant man:* the Assyrian''s self-crediting boast matching the ''great king, the lord of the whole earth'' of Judith 2:5.'),
  ('apocrypha', 'judith', 2, 12, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* the self-exalting heart whose oath ''as I live, and by the power of my kingdom'' Nabuchodonosor swears in Judith 2:12.'),
  ('apocrypha', 'judith', 2, 12, 'canon', 'isaiah', 14, 14, 'free', E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* the ambition to seize the place of Yahuah behind the king''s claim in Judith 2:12 to do all by his own hand.'),
  ('apocrypha', 'judith', 2, 5, 'canon', 'psalms', 2, 2, 'free', E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* the gathering of earthly power against heaven that the ''lord of the whole earth'' of Judith 2:5 embodies.'),
  -- thread: judith-2-rod-of-anger
  ('apocrypha', 'judith', 2, 6, 'canon', 'isaiah', 10, 5, 'free', E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* the conqueror unmasked as a mere rod in Yahuah''s hand, the truth behind Holofernes'' campaign against the west in Judith 2:6.'),
  ('apocrypha', 'judith', 2, 8, 'canon', 'isaiah', 10, 15, 'free', E'Isaiah 10:15 — *Shall the axe boast itself against him that heweth therewith? or shall the saw magnify itself against him that shaketh it? as if the rod should shake itself against them that lift it up, or as if the staff should lift up itself, as if it were no wood.* the rebuke of the boasting instrument that exposes the pride of the army filling valleys with the slain in Judith 2:8.'),
  ('apocrypha', 'judith', 2, 9, 'canon', 'habakkuk', 1, 6, 'free', E'Habakkuk 1:6 — *For, lo, I raise up the Chaldeans, that bitter and hasty nation, which shall march through the breadth of the land, to possess the dwellingplaces that are not theirs.* the raised-up conqueror seizing lands not his own, mirroring the captivity to the utmost parts of the earth threatened in Judith 2:9.'),
  -- thread: judith-2-locusts-without-number
  ('apocrypha', 'judith', 2, 20, 'canon', 'joel', 2, 3, 'free', E'Joel 2:3 — *A fire devoureth before them; and behind them a flame burneth: the land is as the garden of Eden before them, and behind them a desolate wilderness; yea, and nothing shall escape them.* the all-consuming locust-army of the day of Yahuah, image of the multitude ''like locusts'' that comes with Holofernes in Judith 2:20.'),
  ('apocrypha', 'judith', 2, 19, 'canon', 'joel', 2, 4, 'free', E'Joel 2:4 — *The appearance of them is as the appearance of horses; and as horsemen, so shall they run.* the horse-host overspreading the land, matching the chariots and horsemen Holofernes leads to cover the face of the earth in Judith 2:19.'),
  ('apocrypha', 'judith', 2, 20, 'canon', 'habakkuk', 1, 8, 'free', E'Habakkuk 1:8 — *Their horses also are swifter than the leopards, and are more fierce than the evening wolves: and their horsemen shall spread themselves, and their horsemen shall come from far; they shall fly as the eagle that hasteth to eat.* the swift, far-spreading horsemen that picture the innumerable host gathered to Holofernes in Judith 2:20.'),
  -- thread: judith-2-fear-and-dread
  ('apocrypha', 'judith', 2, 28, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* the verdict already pronounced over the dread Holofernes spreads through the sea coasts in Judith 2:28.'),
  ('apocrypha', 'judith', 2, 27, 'canon', 'daniel', 4, 30, 'free', E'Daniel 4:30 — *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* the very boast of conquering majesty that precedes humiliation, the spirit driving the devastation Holofernes works in Judith 2:27.'),
  ('apocrypha', 'judith', 2, 28, 'canon', 'daniel', 4, 32, 'free', E'Daniel 4:32 — *And they shall drive thee from men, and thy dwelling shall be with the beasts of the field: they shall make thee to eat grass as oxen, and seven times shall pass over thee, until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will.* the humbling that awaits the tyrant whose fear and dread fall on all the coasts in Judith 2:28.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-2-one-mouth-all-flesh',
       E'The decree of one mouth over all flesh',
       E'Nabuchodonosor takes counsel to bend the whole earth to a single will: *So he called to him all his officers, and all his nobles, and communicated with them his secret counsel, and concluded the afflicting of the whole earth out of his own mouth* (Judith 2:2), *Then they decreed to destroy all flesh, that did not obey the commandment of his mouth* (Judith 2:3). It is the kingdom-of-man pattern: the throne of one man arrogating the worship and obedience owed only to Yahuah. On the plain of Dura the same tyranny is made law — *Then an herald cried aloud, To you it is commanded, O people, nations, and languages* (Daniel 3:4), *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace* (Daniel 3:6) — and John sees its end in the beast — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations* (Revelation 13:7). One mouth demanding universal submission; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60025
  FROM _session253_jdt2_lookup sv, _session253_jdt2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-2-lord-of-whole-earth',
       E'Lord of the whole earth — the stolen title',
       E'Holofernes is sent with the king''s own boast in his mouth: *Thus says the great king, the lord of the whole earth, Behold, you shall go forth from my presence* (Judith 2:5), and the king seals it with a self-deifying oath — *For as I live, and by the power of my kingdom, whatsoever I have spoken, that will I do by my hand* (Judith 2:12). ''Lord of the whole earth'' and ''as I live'' are titles and oaths that belong to Yahuah alone, seized by a man. Isaiah heard the same swollen heart in Assyria — *For he saith, By the strength of my hand I have done it, and by my wisdom; for I am prudent* (Isaiah 10:13) — and traces it back to the fall that birthed it — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)* (Isaiah 14:13), *I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* (Isaiah 14:14). The kings of the earth still take counsel against the Anointed — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* (Psalm 2:2).',
       sv.verse_id, ev.verse_id, 'extras', 60028
  FROM _session253_jdt2_lookup sv, _session253_jdt2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-2-rod-of-anger',
       E'The rod in Yahuah''s hand',
       E'The king dispatches his captain to drown the west in blood: *And you shall go against all the west country, because they disobeyed my commandment* (Judith 2:6), *So that their slain shall fill their valleys and brooks and the river shall be filled with their dead, till it overflow* (Judith 2:8). Holofernes imagines himself the master of this slaughter, but Isaiah names what such a conqueror really is — only an instrument in another''s hand — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation* (Isaiah 10:5), and the rod that exalts itself is rebuked — *Shall the axe boast itself against him that heweth therewith? or shall the saw magnify itself against him that shaketh it?* (Isaiah 10:15). Habakkuk watched the same bitter horsemen sweep through — *For, lo, I raise up the Chaldeans, that bitter and hasty nation, which shall march through the breadth of the land, to possess the dwellingplaces that are not theirs* (Habakkuk 1:6). The tyrant is permitted, never sovereign.',
       sv.verse_id, ev.verse_id, 'extras', 60031
  FROM _session253_jdt2_lookup sv, _session253_jdt2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-2-locusts-without-number',
       E'Like locusts, like the sand — the innumerable host',
       E'The army that goes out to cover the earth is past counting: *A great number also sundry countries came with them like locusts, and like the sand of the earth: for the multitude was without number* (Judith 2:20), and they go *to cover all the face of the earth westward with their chariots, and horsemen, and their chosen footmen* (Judith 2:19). Joel saw such a host march, a people great and strong like a devouring fire — *A fire devoureth before them; and behind them a flame burneth: the land is as the garden of Eden before them, and behind them a desolate wilderness; yea, and nothing shall escape them* (Joel 2:3), *The appearance of them is as the appearance of horses; and as horsemen, so shall they run* (Joel 2:4). Habakkuk too watched the swift horsemen come from far — *Their horses also are swifter than the leopards, and are more fierce than the evening wolves: and their horsemen shall spread themselves, and their horsemen shall come from far; they shall fly as the eagle that hasteth to eat* (Habakkuk 1:8). The numberless multitude is the kingdom of man''s terror; the deliverance to come will be by one woman''s hand.',
       sv.verse_id, ev.verse_id, 'extras', 60034
  FROM _session253_jdt2_lookup sv, _session253_jdt2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-2-fear-and-dread',
       E'Pride before the fall — the fear that goes before',
       E'Holofernes leaves a wasteland and the nations melt with terror: *and utterly wasted their countries, and struck all their young men with the edge of the sword* (Judith 2:27), *Therefore the fear and dread of him fell upon all the inhabitants of the sea coasts... and they that dwelt in Azotus and Ascalon feared him greatly* (Judith 2:28). The dread is real, but the proverb has already pronounced his doom — *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18) — and Babylon''s own greatest king learned it from a voice out of heaven, swallowed mid-boast — *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* (Daniel 4:30), *until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will* (Daniel 4:32). The terror Holofernes spreads will recoil; the haughty is humbled, and Yahuah rules the kingdom of men.',
       sv.verse_id, ev.verse_id, 'extras', 60037
  FROM _session253_jdt2_lookup sv, _session253_jdt2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=2 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-2-one-mouth-all-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:4 — *Then an herald cried aloud, To you it is commanded, O people, nations, and languages,* the same Babylonian decree binding all peoples to one man''s mouth that Judith 2:3 frames as the command none may disobey.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-one-mouth-all-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace,* death for disobedience exactly as Judith 2:3 decrees the destruction of all flesh that obeys not the king''s mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-one-mouth-all-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations,* the beast''s universal dominion that Nabuchodonosor''s afflicting of the whole earth in Judith 2:2 foreshadows.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-one-mouth-all-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world,* the demand for total compliance that Judith 2:3 issues as a decree against all flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-one-mouth-all-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-2-lord-of-whole-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 10:13 — *For he saith, By the strength of my hand I have done it, and by my wisdom; for I am prudent: and I have removed the bounds of the people, and have robbed their treasures, and I have put down the inhabitants like a valiant man:* the Assyrian''s self-crediting boast matching the ''great king, the lord of the whole earth'' of Judith 2:5.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-lord-of-whole-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* the self-exalting heart whose oath ''as I live, and by the power of my kingdom'' Nabuchodonosor swears in Judith 2:12.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-lord-of-whole-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* the ambition to seize the place of Yahuah behind the king''s claim in Judith 2:12 to do all by his own hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-lord-of-whole-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* the gathering of earthly power against heaven that the ''lord of the whole earth'' of Judith 2:5 embodies.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-lord-of-whole-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-2-rod-of-anger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* the conqueror unmasked as a mere rod in Yahuah''s hand, the truth behind Holofernes'' campaign against the west in Judith 2:6.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-rod-of-anger'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 10:15 — *Shall the axe boast itself against him that heweth therewith? or shall the saw magnify itself against him that shaketh it? as if the rod should shake itself against them that lift it up, or as if the staff should lift up itself, as if it were no wood.* the rebuke of the boasting instrument that exposes the pride of the army filling valleys with the slain in Judith 2:8.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-rod-of-anger'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Habakkuk 1:6 — *For, lo, I raise up the Chaldeans, that bitter and hasty nation, which shall march through the breadth of the land, to possess the dwellingplaces that are not theirs.* the raised-up conqueror seizing lands not his own, mirroring the captivity to the utmost parts of the earth threatened in Judith 2:9.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-rod-of-anger'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-2-locusts-without-number
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:3 — *A fire devoureth before them; and behind them a flame burneth: the land is as the garden of Eden before them, and behind them a desolate wilderness; yea, and nothing shall escape them.* the all-consuming locust-army of the day of Yahuah, image of the multitude ''like locusts'' that comes with Holofernes in Judith 2:20.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-locusts-without-number'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:4 — *The appearance of them is as the appearance of horses; and as horsemen, so shall they run.* the horse-host overspreading the land, matching the chariots and horsemen Holofernes leads to cover the face of the earth in Judith 2:19.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-locusts-without-number'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Habakkuk 1:8 — *Their horses also are swifter than the leopards, and are more fierce than the evening wolves: and their horsemen shall spread themselves, and their horsemen shall come from far; they shall fly as the eagle that hasteth to eat.* the swift, far-spreading horsemen that picture the innumerable host gathered to Holofernes in Judith 2:20.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-locusts-without-number'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-2-fear-and-dread
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* the verdict already pronounced over the dread Holofernes spreads through the sea coasts in Judith 2:28.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-fear-and-dread'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:30 — *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* the very boast of conquering majesty that precedes humiliation, the spirit driving the devastation Holofernes works in Judith 2:27.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-fear-and-dread'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:32 — *And they shall drive thee from men, and thy dwelling shall be with the beasts of the field: they shall make thee to eat grass as oxen, and seven times shall pass over thee, until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will.* the humbling that awaits the tyrant whose fear and dread fall on all the coasts in Judith 2:28.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt2_lookup sv, _session253_jdt2_lookup tv
 WHERE t.slug='judith-2-fear-and-dread'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_03.sql (session253 judith 3) -----
-- Source anchor: apocrypha/judith ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt3 (view _session253_jdt3_lookup). Sort band base 60050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-3-call-upon-him-as-god
  ('apocrypha', 'judith', 3, 8, 'canon', 'daniel', 3, 5, 'free', E'Daniel 3:5 — *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up:* The same Babylonian king who fills Judith with the demand for worship is the one who set up the golden image in Daniel.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'daniel', 3, 6, 'free', E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* The decree that all tongues call upon Nebuchadnezzar as god (Judith 3:8) carries the same death-penalty for refusal that Daniel records.'),
  ('apocrypha', 'judith', 3, 8, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Holofernes'' decree that Nebuchadnezzar alone be called god is the antichrist exalting himself above all that is called Elohim.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'revelation', 13, 8, 'free', E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* The aim that all nations worship Nabuchodonosor only (Judith 3:8) is the beast''s universal worship that John foresaw.'),
  -- thread: judith-3-i-will-be-like-the-most-high
  ('apocrypha', 'judith', 3, 8, 'canon', 'isaiah', 14, 14, 'free', E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The claim that the king alone be called upon as god (Judith 3:8) is Lucifer''s ambition to be like the Most High.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'exodus', 5, 2, 'free', E'Exodus 5:2 — *And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go.* Holofernes'' decree to destroy all the gods of the land (Judith 3:8) mirrors Pharaoh''s defiant ignorance of the only true God.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'isaiah', 10, 13, 'free', E'Isaiah 10:13 — *For he saith, By the strength of my hand I have done it, and by my wisdom; for I am prudent: and I have removed the bounds of the people, and have robbed their treasures, and I have put down the inhabitants like a valiant man:* The Assyrian''s self-exalting boast is the same pride driving Nebuchadnezzar''s host to demand worship in Judith 3:8.'),
  -- thread: judith-3-nations-submit
  ('apocrypha', 'judith', 3, 2, 'canon', 'psalms', 2, 2, 'free', E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* The nations crying ''we are thy servants'' to Nabuchodonosor (Judith 3:2) are the kings of the earth taking their stand against Yahuah and His anointed.'),
  ('apocrypha', 'judith', 3, 4, 'canon', 'revelation', 13, 7, 'free', E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The surrender of cities and inhabitants to the conqueror (Judith 3:4) is the beast''s granted power over every kindred, tongue and nation.'),
  ('apocrypha', 'judith', 3, 1, 'canon', 'psalms', 2, 3, 'free', E'Psalm 2:3 — *Let us break their bands asunder, and cast away their cords from us.* The ambassadors suing for peace and offering total submission (Judith 3:1) belong to the heathen who would cast off Yahuah''s cords for an earthly king.'),
  -- thread: judith-3-cut-down-their-groves
  ('apocrypha', 'judith', 3, 8, 'canon', 'daniel', 6, 7, 'free', E'Daniel 6:7 — *All the presidents of the kingdom, the governors, and the princes, the counsellors, and the captains, have consulted together to establish a royal statute, and to make a firm decree, that whosoever shall ask a petition of any Elohim (God) or man for thirty days, save of thee, O king, he shall be cast into the den of lions.* Holofernes'' decree that worship go to Nebuchadnezzar only (Judith 3:8) is the same statute that forbade petition to any but the king.'),
  ('apocrypha', 'judith', 3, 8, 'canon', 'revelation', 14, 9, 'free', E'Revelation 14:9 — *And the third angel followed them, saying with a loud voice, If any man worship the beast and his image, and receive his mark in his forehead, or in his hand,* The coerced worship of Nabuchodonosor in Judith 3:8 ends at the same threshold John names: worship of the beast and its image.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-3-call-upon-him-as-god',
       E'That all tongues should call upon him as god',
       E'Holofernes tears down the sanctuaries so that the king of Babylon alone may be worshipped: *Yet he did cast down their frontiers, and cut down their groves: for he had decreed to destroy all the gods of the land, that all nations should worship Nabuchodonosor only, and that all tongues and tribes should call upon him as god* (Judith 3:8). This is the antichrist pattern in seed — the kingdom of man demanding the worship owed to Yahuah alone. The same Nebuchadnezzar raised an image and decreed *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up* (Daniel 3:5), with the threat: *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace* (Daniel 3:6). Paul saw the end of the pattern in the man of sin, *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4), and John saw all the earth bow: *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world* (Revelation 13:8). The tyrant''s claim to deity is never new; it is the serpent''s old lie wearing a crown.',
       sv.verse_id, ev.verse_id, 'extras', 60050
  FROM _session253_jdt3_lookup sv, _session253_jdt3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-3-i-will-be-like-the-most-high',
       E'I know not Yahuah — the self-deifying tyrant',
       E'The decree to *destroy all the gods of the land, that all nations should worship Nabuchodonosor only* (Judith 3:8) repeats the oldest boast of the kingdom of man — the creature claiming the throne of the Creator. It is Lucifer''s heart laid bare: *I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* (Isaiah 14:14). It is Pharaoh''s contempt: *And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go* (Exodus 5:2). And it is Assyria''s swagger, the rod that forgets the hand that wields it: *For he saith, By the strength of my hand I have done it, and by my wisdom; for I am prudent: and I have removed the bounds of the people, and have robbed their treasures* (Isaiah 10:13). Babylon, Egypt, Assyria, Holofernes — one spirit, one lie, and one God who shares His glory with no man.',
       sv.verse_id, ev.verse_id, 'extras', 60053
  FROM _session253_jdt3_lookup sv, _session253_jdt3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-3-nations-submit',
       E'Behold, we the servants — the kings of the earth bow to the beast',
       E'The coastland nations lay everything at the tyrant''s feet: *Behold, we the servants of Nabuchodonosor the great king lie before you; use us as shall be good in your sight* (Judith 3:2), surrendering houses, fields, flocks, cities and people alike: *Behold, even our cities and the inhabitants thereof are your servants; come and deal with them as seemeth good to you* (Judith 3:4). They receive the conqueror *with garlands, with dances, and with timbrels* (Judith 3:7) — the world rejoicing under the boot rather than under Yahuah. The Spirit asks why: *Why do the heathen rage, and the people imagine a vain thing?* and answers, *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:1-2). John saw the same submission consummated in the beast, *and power was given him over all kindreds, and tongues, and nations* (Revelation 13:7). The nations that worship the kingdom of man have only changed masters; deliverance belongs to Yahuah and to His elect.',
       sv.verse_id, ev.verse_id, 'extras', 60056
  FROM _session253_jdt3_lookup sv, _session253_jdt3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-3-cut-down-their-groves',
       E'He cut down their groves — the decree against the holy',
       E'*Yet he did cast down their frontiers, and cut down their groves: for he had decreed to destroy all the gods of the land* (Judith 3:8). The tyrant legislates against worship itself, the very pattern Darius was tricked into: a *firm decree, that whosoever shall ask a petition of any Elohim (God) or man for thirty days, save of thee, O king, he shall be cast into the den of lions* (Daniel 6:7). It is the system to be dismantled — the demand that all reverence be channelled to the man on the throne. And John shows where it ends, for the angel warns *If any man worship the beast and his image, and receive his mark in his forehead, or in his hand* (Revelation 14:9), the cup of wrath awaits. To bow to Nebuchadnezzar, to Holofernes, to the beast, is one act; to refuse, with Daniel and the three, is the faith of the saints.',
       sv.verse_id, ev.verse_id, 'extras', 60059
  FROM _session253_jdt3_lookup sv, _session253_jdt3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-3-call-upon-him-as-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:5 — *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up:* The same Babylonian king who fills Judith with the demand for worship is the one who set up the golden image in Daniel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-call-upon-him-as-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* The decree that all tongues call upon Nebuchadnezzar as god (Judith 3:8) carries the same death-penalty for refusal that Daniel records.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-call-upon-him-as-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Holofernes'' decree that Nebuchadnezzar alone be called god is the antichrist exalting himself above all that is called Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-call-upon-him-as-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* The aim that all nations worship Nabuchodonosor only (Judith 3:8) is the beast''s universal worship that John foresaw.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-call-upon-him-as-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-3-i-will-be-like-the-most-high
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The claim that the king alone be called upon as god (Judith 3:8) is Lucifer''s ambition to be like the Most High.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-i-will-be-like-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 5:2 — *And Pharaoh said, Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go.* Holofernes'' decree to destroy all the gods of the land (Judith 3:8) mirrors Pharaoh''s defiant ignorance of the only true God.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-i-will-be-like-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 10:13 — *For he saith, By the strength of my hand I have done it, and by my wisdom; for I am prudent: and I have removed the bounds of the people, and have robbed their treasures, and I have put down the inhabitants like a valiant man:* The Assyrian''s self-exalting boast is the same pride driving Nebuchadnezzar''s host to demand worship in Judith 3:8.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-i-will-be-like-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-3-nations-submit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* The nations crying ''we are thy servants'' to Nabuchodonosor (Judith 3:2) are the kings of the earth taking their stand against Yahuah and His anointed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-nations-submit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The surrender of cities and inhabitants to the conqueror (Judith 3:4) is the beast''s granted power over every kindred, tongue and nation.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-nations-submit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 2:3 — *Let us break their bands asunder, and cast away their cords from us.* The ambassadors suing for peace and offering total submission (Judith 3:1) belong to the heathen who would cast off Yahuah''s cords for an earthly king.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-nations-submit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-3-cut-down-their-groves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 6:7 — *All the presidents of the kingdom, the governors, and the princes, the counsellors, and the captains, have consulted together to establish a royal statute, and to make a firm decree, that whosoever shall ask a petition of any Elohim (God) or man for thirty days, save of thee, O king, he shall be cast into the den of lions.* Holofernes'' decree that worship go to Nebuchadnezzar only (Judith 3:8) is the same statute that forbade petition to any but the king.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-cut-down-their-groves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 14:9 — *And the third angel followed them, saying with a loud voice, If any man worship the beast and his image, and receive his mark in his forehead, or in his hand,* The coerced worship of Nabuchodonosor in Judith 3:8 ends at the same threshold John names: worship of the beast and its image.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt3_lookup sv, _session253_jdt3_lookup tv
 WHERE t.slug='judith-3-cut-down-their-groves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_04.sql (session253 judith 4) -----
-- Source anchor: apocrypha/judith ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt4 (view _session253_jdt4_lookup). Sort band base 60075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-4-newly-returned-sanctuary
  ('apocrypha', 'judith', 4, 3, 'canon', 'ezra', 6, 16, 'free', E'Ezra 6:16 — *And the children of Yashar''el (Israel), the priests, and the Levites, and the rest of the children of the captivity, kept the dedication of this house of Elohim (God) with joy,* the same return-and-rededication that Judith 4:3 names as ''sanctified after the profanation.'''),
  ('apocrypha', 'judith', 4, 1, 'apocrypha', '1-maccabees', 1, 54, 'extras', E'1 Maccabees 1:54 — *Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side;* the recurring profanation that Holofernes'' threat in Judith 4:1 prefigures.'),
  ('apocrypha', 'judith', 4, 2, 'apocrypha', '1-maccabees', 1, 63, 'extras', E'1 Maccabees 1:63 — *Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* the Torah-faithfulness unto death behind Judith 4:2''s fear ''for Jerusalem, and for the temple.'''),
  -- thread: judith-4-keep-the-passes
  ('apocrypha', 'judith', 4, 7, 'canon', 'daniel', 11, 30, 'free', E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* the same tyrant-against-the-covenant pattern Judith 4:7 braces for at the passes into Judea.'),
  ('apocrypha', 'judith', 4, 5, 'canon', 'exodus', 19, 5, 'free', E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* the election that makes the fortified remnant of Judith 4:5 Yahuah''s own to defend.'),
  -- thread: judith-4-cried-to-yahuah-fasting
  ('apocrypha', 'judith', 4, 9, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* the prophetic call that Judith 4:9 enacts as every man cries to Yahuah and humbles his soul.'),
  ('apocrypha', 'judith', 4, 9, 'canon', '2-chronicles', 20, 3, 'free', E'2 Chronicles 20:3 — *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah).* the identical response to an overwhelming invader that Judith 4:9 records of all Israel.'),
  ('apocrypha', 'judith', 4, 11, 'canon', 'jonah', 3, 5, 'free', E'Jonah 3:5 — *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them.* the same fast-and-sackcloth from greatest to least that Judith 4:11 spreads before the temple.'),
  -- thread: judith-4-give-not-thine-heritage
  ('apocrypha', 'judith', 4, 12, 'canon', 'joel', 2, 17, 'free', E'Joel 2:17 — *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them: wherefore should they say among the people, Where is their Elohim (God)?* nearly the word-for-word plea Judith 4:12 raises that Yahuah not give His inheritance to reproach and the nations'' rejoicing.'),
  ('apocrypha', 'judith', 4, 12, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* the covenant-memory ground on which Judith 4:12 dares to plead for children, wives, cities, and sanctuary.'),
  -- thread: judith-4-yahuah-heard-fasted
  ('apocrypha', 'judith', 4, 13, 'canon', '2-chronicles', 20, 17, 'free', E'2 Chronicles 20:17 — *Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you, O Yahudah (Judah) and Jerusalem: fear not, nor be dismayed; to morrow go out against them: for Yahuah (LORD) will be with you.* the assurance that follows the fast in Judith 4:13 — the deliverance is Yahuah''s, not the wall''s.'),
  ('apocrypha', 'judith', 4, 13, 'canon', 'jonah', 3, 10, 'free', E'Jonah 3:10 — *And Elohim (God) saw their works, that they turned from their evil way; and Elohim (God) repented of the evil, that he had said that he would do unto them; and he did it not.* the same Yahuah who sees and answers a humbled people, as He hears Judith 4:13.'),
  ('apocrypha', 'judith', 4, 13, 'canon', 'psalms', 102, 13, 'free', E'Psalm 102:13 — *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come.* the appointed mercy on Zion that Judith 4:13''s heard prayer sets in motion.'),
  -- thread: judith-4-priests-daily-offering-sackcloth
  ('apocrypha', 'judith', 4, 14, 'canon', 'numbers', 28, 3, 'free', E'Numbers 28:3 — *And thou shalt say unto them, This is the offering made by fire which ye shall offer unto Yahuah (LORD); two lambs of the first year without spot day by day, for a continual burnt offering.* the Torah''s continual burnt offering that the priests keep even amid the sackcloth of Judith 4:14 — the law stands.'),
  ('apocrypha', 'judith', 4, 14, 'canon', 'joel', 1, 13, 'free', E'Joel 1:13 — *Gird yourselves, and lament, ye priests: howl, ye ministers of the altar: come, lie all night in sackcloth, ye ministers of my Elohim (God): for the meat offering and the drink offering is withholden from the house of your Elohim (God).* the prophetic summons to the very mourning ministry Judith 4:14 shows, loins girt with sackcloth at the altar.'),
  ('apocrypha', 'judith', 4, 14, 'canon', 'hebrews', 5, 1, 'free', E'Hebrews 5:1 — *For every high priest taken from among men is ordained for men in things pertaining to Elohim (God), that he may offer both gifts and sacrifices for sins:* the office Joacim fills in Judith 4:14, gifts and free offerings before Yahuah, foreshadowing the true Intercessor.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-newly-returned-sanctuary',
       E'Newly returned from captivity, the sanctuary sanctified after the profanation',
       E'Judith opens its crisis in the long shadow of exile and rededication: *For they were newly returned from the captivity, and all the people of Judea were lately gathered together: and the vessels, and the altar, and the house, were sanctified after the profanation.* (Judith 4:3) The remnant has just come home and re-hallowed the house — and now a kingdom-of-man tyrant threatens to profane it again. This is the very joy Ezra records of the second house: *And the children of Yashar''el (Israel), the priests, and the Levites, and the rest of the children of the captivity, kept the dedication of this house of Elohim (God) with joy* (Ezra 6:16). The same enemy returns in every age — Antiochus *set up the abomination of desolation upon the altar* and the faithful *chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant* (1 Maccabees 1:54; 1 Maccabees 1:63). Judith 4 is the standing pattern: the altar restored, the System rising again to defile it, and a covenant people who will not bow.',
       sv.verse_id, ev.verse_id, 'extras', 60075
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-keep-the-passes',
       E'Possessing the high mountains, keeping the passes against the tyrant',
       E'Before they pray, the people act in faith — fortifying the narrow ways: *And possessed themselves beforehand of all the tops of the high mountains, and fortified the villages that were in them, and laid up victuals for the provision of war: for their fields were of late reaped.* (Judith 4:5) Holofernes, captain of Nebuchadnezzar, is the kingdom-of-man system marching against the elect, and the strait pass is where the weak will confound the mighty. The Maccabean profile names the same enemy and the same defiance of the holy covenant: *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant* (Daniel 11:30). The hope is never in the wall but in the One who chose this people — the deliverance will be Yahuah''s, by election, through a hand none expected.',
       sv.verse_id, ev.verse_id, 'extras', 60078
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-cried-to-yahuah-fasting',
       E'Every man of Israel cried to Yahuah with fasting and sackcloth',
       E'The heart of the chapter is a national turning: *Then every man of Yashar''el (Israel) cried to Yahuah (God) with great fervency, and with great vehemency did they humble their souls:* (Judith 4:9) This is the prophet''s own summons answered in the act — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12). When Jehoshaphat faced the same overwhelming multitude, *Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah)* (2 Chronicles 20:3). Even Nineveh knew the posture: *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5). The covenant people in the day of trouble do not first reach for the sword — they reach for the One who alone can save.',
       sv.verse_id, ev.verse_id, 'extras', 60081
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-give-not-thine-heritage',
       E'Cried with one consent: give not thy heritage to reproach',
       E'Their cry has the exact shape of the priestly intercession Joel commands: *And cried to Yahuah (God) of Yashar''el (Israel) all with one consent earnestly, that he would not give their children for a prey, and their wives for a spoil, and the cities of their inheritance to destruction, and the sanctuary to profanation and reproach, and for the nations to rejoice at.* (Judith 4:12) Joel sets the very words in the mouths of the ministers: *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them* (Joel 2:17). The plea rests on Yahuah''s covenant memory, the same that broke Egypt''s grip: *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob* (Exodus 2:24). They ask not to be spared for their strength but for His name''s sake — that the nations not rejoice over His inheritance.',
       sv.verse_id, ev.verse_id, 'extras', 60084
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-yahuah-heard-fasted',
       E'So Yahuah heard their prayers and looked upon their afflictions',
       E'The narrator answers the cry before the deliverer ever appears: *So Yahuah (God) heard their prayers, and looked upon their afflictions: for the people fasted many days in all Judea and Jerusalem before the sanctuary of Yahuah (God) Almighty.* (Judith 4:13) Jehoshaphat''s fast met the same verdict — *Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you* (2 Chronicles 20:17). Nineveh''s fast met it too: *And Elohim (God) saw their works, that they turned from their evil way; and Elohim (God) repented of the evil, that he had said that he would do unto them; and he did it not* (Jonah 3:10). And the set time for Zion is always Yahuah''s to give: *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come* (Psalm 102:13). The victory is decided in the hearing, not the army; the weak who cry are confounding the mighty already.',
       sv.verse_id, ev.verse_id, 'extras', 60087
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-priests-daily-offering-sackcloth',
       E'The priests, loins girt with sackcloth, offered the daily burnt offering',
       E'The high priest leads the whole house in lamenting intercession while the Torah''s continual offering goes up: *And Joacim the high priest, and all the priests that stood before Yahuah (God), and they which ministered to Yahuah (God), had their loins girt with sackcloth, and offered the daily burnt offerings, with the vows and free gifts of the people* (Judith 4:14). The daily offering is the standing Torah ordinance kept even in crisis: *And thou shalt say unto them, This is the offering made by fire which ye shall offer unto Yahuah (LORD); two lambs of the first year without spot day by day, for a continual burnt offering* (Numbers 28:3). Joel had summoned exactly these ministers to mourn: *Gird yourselves, and lament, ye priests: howl, ye ministers of the altar: come, lie all night in sackcloth, ye ministers of my Elohim (God)* (Joel 1:13). And every such high priest stands as a type of the true Intercessor: *For every high priest taken from among men is ordained for men in things pertaining to Elohim (God), that he may offer both gifts and sacrifices for sins* (Hebrews 5:1). The cry closes pleading not for the strong but for the whole house — that Yahuah look upon all the house of Israel graciously (Judith 4:15).',
       sv.verse_id, ev.verse_id, 'extras', 60090
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-4-newly-returned-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:16 — *And the children of Yashar''el (Israel), the priests, and the Levites, and the rest of the children of the captivity, kept the dedication of this house of Elohim (God) with joy,* the same return-and-rededication that Judith 4:3 names as ''sanctified after the profanation.'''
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-newly-returned-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 1:54 — *Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side;* the recurring profanation that Holofernes'' threat in Judith 4:1 prefigures.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-newly-returned-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 1:63 — *Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* the Torah-faithfulness unto death behind Judith 4:2''s fear ''for Jerusalem, and for the temple.'''
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-newly-returned-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=63
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-keep-the-passes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* the same tyrant-against-the-covenant pattern Judith 4:7 braces for at the passes into Judea.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-keep-the-passes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* the election that makes the fortified remnant of Judith 4:5 Yahuah''s own to defend.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-keep-the-passes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-cried-to-yahuah-fasting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* the prophetic call that Judith 4:9 enacts as every man cries to Yahuah and humbles his soul.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-cried-to-yahuah-fasting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:3 — *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah).* the identical response to an overwhelming invader that Judith 4:9 records of all Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-cried-to-yahuah-fasting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jonah 3:5 — *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them.* the same fast-and-sackcloth from greatest to least that Judith 4:11 spreads before the temple.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-cried-to-yahuah-fasting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-give-not-thine-heritage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:17 — *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them: wherefore should they say among the people, Where is their Elohim (God)?* nearly the word-for-word plea Judith 4:12 raises that Yahuah not give His inheritance to reproach and the nations'' rejoicing.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-give-not-thine-heritage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* the covenant-memory ground on which Judith 4:12 dares to plead for children, wives, cities, and sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-give-not-thine-heritage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-yahuah-heard-fasted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:17 — *Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you, O Yahudah (Judah) and Jerusalem: fear not, nor be dismayed; to morrow go out against them: for Yahuah (LORD) will be with you.* the assurance that follows the fast in Judith 4:13 — the deliverance is Yahuah''s, not the wall''s.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-yahuah-heard-fasted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jonah 3:10 — *And Elohim (God) saw their works, that they turned from their evil way; and Elohim (God) repented of the evil, that he had said that he would do unto them; and he did it not.* the same Yahuah who sees and answers a humbled people, as He hears Judith 4:13.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-yahuah-heard-fasted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 102:13 — *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come.* the appointed mercy on Zion that Judith 4:13''s heard prayer sets in motion.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-yahuah-heard-fasted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-priests-daily-offering-sackcloth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 28:3 — *And thou shalt say unto them, This is the offering made by fire which ye shall offer unto Yahuah (LORD); two lambs of the first year without spot day by day, for a continual burnt offering.* the Torah''s continual burnt offering that the priests keep even amid the sackcloth of Judith 4:14 — the law stands.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-priests-daily-offering-sackcloth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 1:13 — *Gird yourselves, and lament, ye priests: howl, ye ministers of the altar: come, lie all night in sackcloth, ye ministers of my Elohim (God): for the meat offering and the drink offering is withholden from the house of your Elohim (God).* the prophetic summons to the very mourning ministry Judith 4:14 shows, loins girt with sackcloth at the altar.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-priests-daily-offering-sackcloth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 5:1 — *For every high priest taken from among men is ordained for men in things pertaining to Elohim (God), that he may offer both gifts and sacrifices for sins:* the office Joacim fills in Judith 4:14, gifts and free offerings before Yahuah, foreshadowing the true Intercessor.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-priests-daily-offering-sackcloth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_05.sql (session253 judith 5) -----
-- Source anchor: apocrypha/judith ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt5 (view _session253_jdt5_lookup). Sort band base 60100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-5-seed-of-the-chaldees
  ('apocrypha', 'judith', 5, 7, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Achior''s Chaldea-and-idols opening is the very credo Joshua sets before the tribes.'),
  ('apocrypha', 'judith', 5, 8, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* The God whom they knew drew them out of Chaldea exactly as Joshua says He took Abraham from beyond the river.'),
  ('apocrypha', 'judith', 5, 9, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* the command to depart for Canaan that Achior reports is the founding call of Abram.'),
  -- thread: judith-5-bondage-and-the-red-sea
  ('apocrypha', 'judith', 5, 11, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* Achior''s brought low with labouring in brick names the same Egyptian bondage.'),
  ('apocrypha', 'judith', 5, 12, 'canon', 'deuteronomy', 26, 7, 'free', E'Deuteronomy 26:7 — *And when we cried unto Yahuah Elohim (the LORD God) of our fathers, Yahuah (LORD) heard our voice, and looked on our affliction, and our labour, and our oppression:* the cry that brings the plagues in Judith is the credo''s own cry of the afflicted.'),
  ('apocrypha', 'judith', 5, 13, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* When Achior says God dried the Red sea before them, he confesses the war was Yahuah''s, not Israel''s.'),
  ('apocrypha', 'judith', 5, 13, 'canon', 'deuteronomy', 26, 8, 'free', E'Deuteronomy 26:8 — *And Yahuah (LORD) brought us forth out of Egypt with a mighty hand, and with an outstretched arm, and with great terribleness, and with signs, and with wonders:* the mighty-hand deliverance that the drying of the sea seals.'),
  -- thread: judith-5-land-not-by-their-sword
  ('apocrypha', 'judith', 5, 16, 'canon', 'joshua', 24, 13, 'free', E'Joshua 24:13 — *And I have given you a land for which ye did not labour, and cities which ye built not, and ye dwell in them; of the vineyards and oliveyards which ye planted not do ye eat.* The hill country Achior says they possessed was given, not earned.'),
  ('apocrypha', 'judith', 5, 15, 'canon', 'psalms', 44, 3, 'free', E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* Where Achior credits their strength, the fathers'' psalm credits Yahuah''s right hand alone.'),
  ('apocrypha', 'judith', 5, 14, 'canon', 'deuteronomy', 26, 9, 'free', E'Deuteronomy 26:9 — *And he hath brought us into this place, and hath given us this land, even a land that floweth with milk and honey.* The wilderness-to-inheritance arc Achior traces is the credo''s confession of a given land.'),
  -- thread: judith-5-the-shield-that-sin-breaks
  ('apocrypha', 'judith', 5, 17, 'canon', 'deuteronomy', 28, 7, 'free', E'Deuteronomy 28:7 — *Yahuah (LORD) shall cause thine enemies that rise up against thee to be smitten before thy face: they shall come out against thee one way, and flee before thee seven ways.* While they sinned not they prospered — exactly the blessing on the obedient covenant people.'),
  ('apocrypha', 'judith', 5, 18, 'canon', 'deuteronomy', 28, 15, 'free', E'Deuteronomy 28:15 — *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* the captivity and the cast-down temple Achior reports are the covenant curse for departing the way.'),
  ('apocrypha', 'judith', 5, 20, 'canon', 'joshua', 24, 20, 'free', E'Joshua 24:20 — *If ye forsake Yahuah (LORD), and serve strange gods, then he will turn and do you hurt, and consume you, after that he hath done you good.* Achior''s if they sin against their Elohim, this shall be their ruin is Joshua''s own warning to the tribes.'),
  ('apocrypha', 'judith', 5, 21, 'canon', 'deuteronomy', 28, 1, 'free', E'Deuteronomy 28:1 — *And it shall come to pass, if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments which I command thee this day, that Yahuah Elohayka (the LORD thy God) will set thee on high above all nations of the earth:* if there be no iniquity, their God will defend them — the blessing side of the same covenant condition.'),
  -- thread: judith-5-the-weak-confound-the-mighty
  ('apocrypha', 'judith', 5, 23, 'canon', 'psalms', 44, 6, 'free', E'Psalm 44:6 — *For I will not trust in my bow, neither shall my sword save me.* The court trusts in Holofernes'' army, but the fathers'' psalm renounces exactly that confidence in sword and bow.'),
  ('apocrypha', 'judith', 5, 24, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* The army that means to devour Israel will fall as Sisera did, by a woman''s hand — the pattern Judith fulfils.'),
  ('apocrypha', 'judith', 5, 24, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The proud army''s boast meets the oldest promise: the serpent''s head is bruised by the seed of the woman, the weak confounding the mighty.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-seed-of-the-chaldees',
       E'The seed that would not follow idols',
       E'Achior rehearses Israel''s beginning to the tyrant: *This people are descended of the Chaldeans: And they sojourned heretofore in Mesopotamia, because they would not follow the gods of their fathers, which were in the land of Chaldea. For they left the way of their ancestors, and worshipped Yahuah (God) of heaven, Yahuah (God) whom they knew... Then their Elohim (God) commanded them to depart from the place where they sojourned, and to go into the land of Chanaan* (Judith 5:6-9). This is the credo every Israelite confessed at Shechem — that the fathers were idolaters across the river, and Yahuah took one man out of that house: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods. And I took your father Abraham from the other side of the flood* (Joshua 24:2-3). It is the call of Genesis 12: *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). Election, not pedigree — a people made by a God who calls.',
       sv.verse_id, ev.verse_id, 'extras', 60100
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-bondage-and-the-red-sea',
       E'Brought low in Egypt, dried the sea before them',
       E'Achior carries the history down into the iron furnace: *Therefore the king of Egypt rose up against them, and dealt subtilly with them, and brought them low with labouring in brick, and made them slaves. Then they cried to their Elohim (God), and he struck all the land of Egypt with incurable plagues... And Yahuah (God) dried the Red sea before them* (Judith 5:11-13). This is the wandering-Aramean confession itself: *A Syrian ready to perish was my father, and he went down into Egypt... And the Egyptians evil entreated us, and afflicted us, and laid upon us hard bondage... And Yahuah (LORD) brought us forth out of Egypt with a mighty hand* (Deuteronomy 26:5-8). The brick-labour is Exodus 1: *they did set over them taskmasters to afflict them with their burdens* (Exodus 1:11). And the sea was no feat of theirs — it was His war: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). Holofernes is told plainly: this people has a God who fights.',
       sv.verse_id, ev.verse_id, 'extras', 60103
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-land-not-by-their-sword',
       E'The land given, not won by their own arm',
       E'Achior tells how the wilderness gave way to inheritance: *So they dwelt in the land of the Amorites, and they destroyed by their strength all them of Esebon, and passing over Jordan they possessed all the hill country. And they cast forth before them the Chanaanite, the Pherezite, the Jebusite* (Judith 5:15-16). Yet the deeper witness corrects even Achior''s their strength — the conquest was a gift: *And I have given you a land for which ye did not labour, and cities which ye built not, and ye dwell in them; of the vineyards and oliveyards which ye planted not do ye eat* (Joshua 24:13). The psalm of the fathers makes it the song of every generation: *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them* (Psalm 44:3). The land flows from the sworn promise: *he hath brought us into this place, and hath given us this land* (Deuteronomy 26:9).',
       sv.verse_id, ev.verse_id, 'extras', 60106
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-the-shield-that-sin-breaks',
       E'Their God defends them — unless they sin',
       E'Here is the hinge of Achior''s whole speech, and the law Holofernes cannot outflank: *And while they sinned not before their Elohim (God), they prospered, because Yahuah (God) that hates iniquity was with them. But when they departed from the way which he appointed them, they were destroyed in many battles very sore, and were led captives... if there be any error against this people, and they sin against their Elohim (God), let us consider that this shall be their ruin... But if there be no iniquity in their nation, let my lord now pass by, lest their Elohim (God) defend them* (Judith 5:17-21). This is the two-tablet covenant of Deuteronomy 28 spoken to a pagan general: *if thou shalt hearken diligently unto the voice of Yahuah Elohayka... Yahuah (LORD) shall cause thine enemies that rise up against thee to be smitten before thy face* (Deuteronomy 28:1,7) — *But it shall come to pass, if thou wilt not hearken... that all these curses shall come upon thee* (Deuteronomy 28:15). Joshua warned the same: *If ye forsake Yahuah (LORD), and serve strange gods, then he will turn and do you hurt* (Joshua 24:20). The shield is Torah-faithfulness; sin, not the enemy''s sword, is the only thing that can defeat Israel.',
       sv.verse_id, ev.verse_id, 'extras', 60109
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-5-the-weak-confound-the-mighty',
       E'A people of no strength — and the war is God''s',
       E'The tyrant''s court despises the warning: *we will not be afraid of the face of the children of Yashar''el (Israel): for, lo, it is a people that have no strength nor power for a strong battle. Now therefore, lord Holofernes, we will go up, and they shall be a prey to be devoured of all your army* (Judith 5:23-24). They reckon by chariots and numbers, as Sisera once did — and the book of Judith answers them as Yahuah always has: by a woman''s hand. The fathers confessed it: *For I will not trust in my bow, neither shall my sword save me* (Psalm 44:6). And the pattern was set when Deborah told Barak the captain would fall not to an army but to a woman: *for Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9) — the very victory toward which Judith bends. Behind it all stands the first promise, the woman''s seed who crushes the head of the serpent: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The kingdom-of-man that demands Nebuchadnezzar be feared as God will be undone — not by sword or bow, but by the weak whom Yahuah lifts to confound the mighty.',
       sv.verse_id, ev.verse_id, 'extras', 60112
  FROM _session253_jdt5_lookup sv, _session253_jdt5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=5 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-5-seed-of-the-chaldees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Achior''s Chaldea-and-idols opening is the very credo Joshua sets before the tribes.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-seed-of-the-chaldees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* The God whom they knew drew them out of Chaldea exactly as Joshua says He took Abraham from beyond the river.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-seed-of-the-chaldees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* the command to depart for Canaan that Achior reports is the founding call of Abram.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-seed-of-the-chaldees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-5-bondage-and-the-red-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* Achior''s brought low with labouring in brick names the same Egyptian bondage.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-bondage-and-the-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 26:7 — *And when we cried unto Yahuah Elohim (the LORD God) of our fathers, Yahuah (LORD) heard our voice, and looked on our affliction, and our labour, and our oppression:* the cry that brings the plagues in Judith is the credo''s own cry of the afflicted.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-bondage-and-the-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* When Achior says God dried the Red sea before them, he confesses the war was Yahuah''s, not Israel''s.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-bondage-and-the-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 26:8 — *And Yahuah (LORD) brought us forth out of Egypt with a mighty hand, and with an outstretched arm, and with great terribleness, and with signs, and with wonders:* the mighty-hand deliverance that the drying of the sea seals.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-bondage-and-the-red-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-5-land-not-by-their-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:13 — *And I have given you a land for which ye did not labour, and cities which ye built not, and ye dwell in them; of the vineyards and oliveyards which ye planted not do ye eat.* The hill country Achior says they possessed was given, not earned.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-land-not-by-their-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* Where Achior credits their strength, the fathers'' psalm credits Yahuah''s right hand alone.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-land-not-by-their-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 26:9 — *And he hath brought us into this place, and hath given us this land, even a land that floweth with milk and honey.* The wilderness-to-inheritance arc Achior traces is the credo''s confession of a given land.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-land-not-by-their-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-5-the-shield-that-sin-breaks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 28:7 — *Yahuah (LORD) shall cause thine enemies that rise up against thee to be smitten before thy face: they shall come out against thee one way, and flee before thee seven ways.* While they sinned not they prospered — exactly the blessing on the obedient covenant people.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-shield-that-sin-breaks'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:15 — *But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee:* the captivity and the cast-down temple Achior reports are the covenant curse for departing the way.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-shield-that-sin-breaks'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 24:20 — *If ye forsake Yahuah (LORD), and serve strange gods, then he will turn and do you hurt, and consume you, after that he hath done you good.* Achior''s if they sin against their Elohim, this shall be their ruin is Joshua''s own warning to the tribes.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-shield-that-sin-breaks'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 28:1 — *And it shall come to pass, if thou shalt hearken diligently unto the voice of Yahuah Elohayka (the LORD thy God), to observe and to do all his commandments which I command thee this day, that Yahuah Elohayka (the LORD thy God) will set thee on high above all nations of the earth:* if there be no iniquity, their God will defend them — the blessing side of the same covenant condition.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-shield-that-sin-breaks'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-5-the-weak-confound-the-mighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:6 — *For I will not trust in my bow, neither shall my sword save me.* The court trusts in Holofernes'' army, but the fathers'' psalm renounces exactly that confidence in sword and bow.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* The army that means to devour Israel will fall as Sisera did, by a woman''s hand — the pattern Judith fulfils.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The proud army''s boast meets the oldest promise: the serpent''s head is bruised by the seed of the woman, the weak confounding the mighty.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt5_lookup sv, _session253_jdt5_lookup tv
 WHERE t.slug='judith-5-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=5 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_06.sql (session253 judith 6) -----
-- Source anchor: apocrypha/judith ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt6 (view _session253_jdt6_lookup). Sort band base 60125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-6-who-is-yahuah-but-the-king
  ('apocrypha', 'judith', 6, 2, 'canon', 'ezekiel', 28, 2, 'free', E'Ezekiel 28:2 — *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God):* Holofernes'' boast that Nabuchodonosor alone is Yahuah is the prince of Tyrus'' lifted-up heart wearing an Assyrian crown.'),
  ('apocrypha', 'judith', 6, 2, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* the question "who is Yahuah but Nabuchodonosor?" is the morning-star''s secret ambition spoken aloud before the nations.'),
  ('apocrypha', 'judith', 6, 4, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* "Lord of all the earth" whose words shall not be in vain is the same man-of-sin pattern that runs to its last revealing.'),
  -- thread: judith-6-the-witness-cast-out
  ('apocrypha', 'judith', 6, 5, 'canon', 'jeremiah', 26, 11, 'free', E'Jeremiah 26:11 — *Then spake the priests and the prophets unto the princes and to all the people, saying, This man is worthy to die; for he hath prophesied against this city, as ye have heard with your ears.* Achior, doomed for prophesying against the camp of Assur, stands where Yirmeyahu stood when the powers judged the true witness worthy to die.'),
  ('apocrypha', 'judith', 6, 5, 'canon', 'jeremiah', 26, 15, 'free', E'Jeremiah 26:15 — *But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves, and upon this city, and upon the inhabitants thereof: for of a truth Yahuah (LORD) hath sent me unto you to speak all these words in your ears.* The witness Holofernes condemns carries innocent blood; the tyrant who silences him answers for it as surely as Yahudah''s princes would.'),
  ('apocrypha', 'judith', 6, 13, 'canon', 'matthew', 5, 10, 'free', E'Matthew 5:10 — *Blessed are they which are persecuted for righteousness'' sake: for theirs is the kingdom of heaven.* Achior bound and cast down at the foot of the hill for telling the truth is the persecuted-for-righteousness the kingdom of heaven calls blessed.'),
  ('apocrypha', 'judith', 6, 5, 'canon', 'psalms', 34, 19, 'free', E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* The sentence of death on the righteous witness is real, but it is not the last word — the deliverance of the afflicted righteous is.'),
  -- thread: judith-6-the-remnant-receives-the-witness
  ('apocrypha', 'judith', 6, 18, 'canon', '2-kings', 19, 15, 'free', E'2 Kings 19:15 — *And Hezekiah prayed before Yahuah (LORD), and said, O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth.* Bethulia''s people falling down before Yahuah against the king who claimed to be Yahuah is Hizqiyahu answering Assyria''s blasphemy with "thou alone."'),
  ('apocrypha', 'judith', 6, 19, 'canon', 'psalms', 9, 9, 'free', E'Psalm 9:9 — *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble.* The prayer pitying "the low estate of our nation" appeals to the One who is by nature the refuge of the oppressed in their hour of trouble.'),
  ('apocrypha', 'judith', 6, 20, 'canon', 'matthew', 5, 11, 'free', E'Matthew 5:11 — *Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake.* The reviled witness, comforted and greatly praised by the people who received him, is shown to be among the blessed and not the cursed.'),
  -- thread: judith-6-the-weak-confound-the-mighty
  ('apocrypha', 'judith', 6, 3, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Holofernes trusts the power of his horses against a nation "that came out of Egypt" — the very nation whose song is that Yahuah threw horse and rider into the sea.'),
  ('apocrypha', 'judith', 6, 4, 'canon', 'luke', 1, 51, 'free', E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The boast "none of my words shall be in vain" is exactly the imagination of the proud that Yahuah''s arm scatters — and Miryam''s song is daughter to Judith''s own.'),
  ('apocrypha', 'judith', 6, 3, 'canon', 'daniel', 3, 17, 'free', E'Daniel 3:17 — *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* Against the same Nebuchadnezzar who asks "who is Yahuah but the king?", the three Hebrews give the remnant''s answer — our Elohim is able to deliver us out of thine hand.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-6-who-is-yahuah-but-the-king',
       E'Who is Yahuah but the king? — the tyrant who makes himself Elohim',
       E'Holofernes flings the kingdom-of-man''s whole blasphemy in a single line: *And who are you, Achior, and the hirelings of Ephraim, that you have prophesied against us as to day, and have said, that we should not make war with the people of Yashar''el (Israel), because their Elohim (God) will defend them? and who is Yahuah (God) but Nabuchodonosor?* (Judith 6:2). The man on the throne does not merely defy the Most High; he proposes to *replace* Him — *says king Nabuchodonosor, lord of all the earth: for he said, None of my words shall be in vain* (Judith 6:4). It Ain''t New. This is the oldest sin in the seat of power. The prince of Tyrus wore it first: *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God)... yet thou art a man, and not Elohim (God)* (Ezekiel 28:2). The morning-star said it in his heart: *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)... I will be like the El Elyon (most High)* (Isaiah 14:13). And Sha''ul shows the pattern run to its end in the last man of sin: *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). Nebuchadnezzar is not an exception in Judith; he is the SYSTEM — the empire that demands to be worshipped as deity. The dismantling is of the throne, not merely the man.',
       sv.verse_id, ev.verse_id, 'extras', 60125
  FROM _session253_jdt6_lookup sv, _session253_jdt6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-6-the-witness-cast-out',
       E'The true witness threatened — Achior cast out for his testimony',
       E'Achior told the council the truth — that Yahuah defends His people — and for it Holofernes condemns him to share Yashar''el''s destruction: *And you, Achior, an hireling of Ammon, which have spoken these words in the day of your iniquity, shall see my face no more from this day, until I take vengeance of this nation that came out of Egypt* (Judith 6:5). The truth-teller is bound and cast down at the foot of the hill (Judith 6:13). It Ain''t New: the despised witness who speaks Yahuah''s word against the powers is always threatened with death. Yirmeyahu stood in the very same place: *Then spake the priests and the prophets unto the princes and to all the people, saying, This man is worthy to die; for he hath prophesied against this city, as ye have heard with your ears* (Jeremiah 26:11). And the prophet answered as Achior''s testimony answers — placing himself wholly in their hands while warning that innocent blood is no light thing: *As for me, behold, I am in your hand: do with me as seemeth good and meet unto you* (Jeremiah 26:14); *But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves* (Jeremiah 26:15). The Master sealed the line on the mount: *Blessed are they which are persecuted for righteousness'' sake: for theirs is the kingdom of heaven* (Matthew 5:10). The afflicted witness is not abandoned: *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19).',
       sv.verse_id, ev.verse_id, 'extras', 60128
  FROM _session253_jdt6_lookup sv, _session253_jdt6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-6-the-remnant-receives-the-witness',
       E'The remnant receives the despised truth-teller',
       E'What the empire casts out, the faithful remnant takes up. The Israelites come down, loose the bound man, and bring him in: *But the Israelites descended from their city, and came to him, and loosed him, and brought him to Bethulia, and presented him to the governors of the city* (Judith 6:14). And hearing his report of the tyrant''s pride, they do the one thing Holofernes forbade — they fall down and worship the true Yahuah, not the king who claimed His name: *Then the people fell down and worshipped Yahuah (God), and cried to Yahuah (God). saying* (Judith 6:18); *O Yahuah (God) of heaven, behold their pride, and pity the low estate of our nation, and look upon the face of those that are sanctified to you this day* (Judith 6:19). It Ain''t New. This is Hizqiyahu spreading Sennacherib''s blasphemous letter before the throne: *And Hezekiah prayed before Yahuah (LORD), and said, O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth* (2 Kings 19:15) — answering the empire''s "who is Yahuah but the king?" with "thou alone." The cry of the low estate is the cry He has always heard: *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble* (Psalm 9:9). And the receiving of the cast-out witness, comforted and praised by the people he came to (Judith 6:20), is the welcome the remnant always gives those persecuted for the word: *Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake* (Matthew 5:11).',
       sv.verse_id, ev.verse_id, 'extras', 60131
  FROM _session253_jdt6_lookup sv, _session253_jdt6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=6 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-6-the-weak-confound-the-mighty',
       E'The horse and his rider — the mighty confounded by election',
       E'Holofernes'' confidence rests wholly on cavalry and numbers: *For with them we will tread them under foot, and their mountains shall be drunken with their blood... for they shall utterly perish* (Judith 6:4); *they are not able to sustain the power of our horses* (Judith 6:3). The whole drama of Judith answers this boast — that Yahuah delivers Yashar''el not by horses but by His own arm and election, often through the weak. It Ain''t New. The song at the sea already buried the horse: *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1). The proud are scattered not by stronger armies but by His arm: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts* (Luke 1:51) — Miryam''s Magnificat, which itself echoes Judith''s own song. And when the same Nebuchadnezzar threatened the furnace, three Hebrews gave the only answer the tyrant-as-god ever earns: *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king* (Daniel 3:17). The power of the horses is real and it is nothing.',
       sv.verse_id, ev.verse_id, 'extras', 60134
  FROM _session253_jdt6_lookup sv, _session253_jdt6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-6-who-is-yahuah-but-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 28:2 — *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God):* Holofernes'' boast that Nabuchodonosor alone is Yahuah is the prince of Tyrus'' lifted-up heart wearing an Assyrian crown.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-who-is-yahuah-but-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* the question "who is Yahuah but Nabuchodonosor?" is the morning-star''s secret ambition spoken aloud before the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-who-is-yahuah-but-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* "Lord of all the earth" whose words shall not be in vain is the same man-of-sin pattern that runs to its last revealing.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-who-is-yahuah-but-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-6-the-witness-cast-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 26:11 — *Then spake the priests and the prophets unto the princes and to all the people, saying, This man is worthy to die; for he hath prophesied against this city, as ye have heard with your ears.* Achior, doomed for prophesying against the camp of Assur, stands where Yirmeyahu stood when the powers judged the true witness worthy to die.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-witness-cast-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 26:15 — *But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves, and upon this city, and upon the inhabitants thereof: for of a truth Yahuah (LORD) hath sent me unto you to speak all these words in your ears.* The witness Holofernes condemns carries innocent blood; the tyrant who silences him answers for it as surely as Yahudah''s princes would.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-witness-cast-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=26 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:10 — *Blessed are they which are persecuted for righteousness'' sake: for theirs is the kingdom of heaven.* Achior bound and cast down at the foot of the hill for telling the truth is the persecuted-for-righteousness the kingdom of heaven calls blessed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-witness-cast-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* The sentence of death on the righteous witness is real, but it is not the last word — the deliverance of the afflicted righteous is.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-witness-cast-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-6-the-remnant-receives-the-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:15 — *And Hezekiah prayed before Yahuah (LORD), and said, O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth.* Bethulia''s people falling down before Yahuah against the king who claimed to be Yahuah is Hizqiyahu answering Assyria''s blasphemy with "thou alone."'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-remnant-receives-the-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 9:9 — *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble.* The prayer pitying "the low estate of our nation" appeals to the One who is by nature the refuge of the oppressed in their hour of trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-remnant-receives-the-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:11 — *Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake.* The reviled witness, comforted and greatly praised by the people who received him, is shown to be among the blessed and not the cursed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-remnant-receives-the-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-6-the-weak-confound-the-mighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Holofernes trusts the power of his horses against a nation "that came out of Egypt" — the very nation whose song is that Yahuah threw horse and rider into the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The boast "none of my words shall be in vain" is exactly the imagination of the proud that Yahuah''s arm scatters — and Miryam''s song is daughter to Judith''s own.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:17 — *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* Against the same Nebuchadnezzar who asks "who is Yahuah but the king?", the three Hebrews give the remnant''s answer — our Elohim is able to deliver us out of thine hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_07.sql (session253 judith 7) -----
-- Source anchor: apocrypha/judith ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt7 (view _session253_jdt7_lookup). Sort band base 60150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-7-licks-up-the-earth
  ('apocrypha', 'judith', 7, 11, 'canon', 'isaiah', 41, 11, 'free', E'Isaiah 41:11 — *Behold, all they that were incensed against thee shall be ashamed and confounded: they shall be as nothing; and they that strive with thee shall perish.* Holofernes'' counsellors promise that not one of his host shall perish (Judith 7:11), but the word over Israel hands that perishing back to the besieger.'),
  ('apocrypha', 'judith', 7, 4, 'canon', 'isaiah', 41, 12, 'free', E'Isaiah 41:12 — *Thou shalt seek them, and shalt not find them, even them that contended with thee: they that war against thee shall be as nothing, and as a thing of nought.* The multitude that seems able to lick up the face of the earth in Judith 7:4 is, before Yahuah, a thing of nought.'),
  ('apocrypha', 'judith', 7, 2, 'canon', '1-samuel', 2, 7, 'free', E'1 Samuel 2:7 — *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up.* Hannah''s song answers the hundred and seventy thousand of Judith 7:2: the count of footmen and horsemen decides nothing, for the bringing low is His.'),
  -- thread: judith-7-water-cut-off
  ('apocrypha', 'judith', 7, 13, 'canon', 'lamentations', 4, 4, 'free', E'Lamentations 4:4 — *The tongue of the sucking child cleaveth to the roof of his mouth for thirst: the young children ask bread, and no man breaketh it unto them.* Jeremiah''s siege-grief is the very horror Holofernes'' counsel intends in Judith 7:13, that thirst should kill the children of Bethulia.'),
  -- thread: judith-7-faint-and-murmur
  ('apocrypha', 'judith', 7, 22, 'canon', 'exodus', 17, 3, 'free', E'Exodus 17:3 — *And the people thirsted there for water; and the people murmured against Moses, and said, Wherefore is this that thou hast brought us up out of Egypt, to kill us and our children and our cattle with thirst?* Bethulia''s fainting and murmuring for thirst in Judith 7:22 re-runs Rephidim, the same fear for the children dying of thirst.'),
  ('apocrypha', 'judith', 7, 27, 'canon', 'numbers', 21, 5, 'free', E'Numbers 21:5 — *And the people spake against Elohim (God), and against Moses, Wherefore have ye brought us up out of Egypt to die in the wilderness? for there is no bread, neither is there any water; and our soul loatheth this light bread.* The cry that surrender is better than death by thirst (Judith 7:27) is the wilderness murmur — preferring Egypt to the proving.'),
  -- thread: judith-7-sold-and-proven
  ('apocrypha', 'judith', 7, 28, 'canon', 'deuteronomy', 8, 2, 'free', E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* Bethulia''s confession of being chastened for fathers'' sins (Judith 7:28) is the Deuteronomic proving — the siege is meant to search the heart.'),
  ('apocrypha', 'judith', 7, 25, 'canon', 'deuteronomy', 8, 3, 'free', E'Deuteronomy 8:3 — *And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live.* The cry that Yahuah has sold them to thirst (Judith 7:25) misreads the hunger and thirst that are meant to teach dependence on Him.'),
  -- thread: judith-7-wait-five-days
  ('apocrypha', 'judith', 7, 30, 'canon', 'psalms', 27, 14, 'free', E'Psalm 27:14 — *Wait on Yahuah (LORD): be of good courage, and he shall strengthen thine heart: wait, I say, on Yahuah (LORD).* Ozias'' plea to endure five days for Yahuah''s mercy (Judith 7:30) is precisely this waiting and good courage that strengthens the heart.'),
  ('apocrypha', 'judith', 7, 25, 'canon', '2-chronicles', 20, 12, 'free', E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Bethulia''s confession that they have no helper (Judith 7:25) finds its right answer in Jehoshaphat''s turning of helplessness toward Yahuah.'),
  ('apocrypha', 'judith', 7, 30, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* The five-day stay of Judith 7:30 waits on exactly this — that the deliverance belongs to Yahuah and not to Bethulia''s spears.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-licks-up-the-earth',
       E'The host that would lick up the earth',
       E'Holofernes the captain of Nebuchadnezzar — the kingdom-of-man tyrant who claims the worship owed to Yahuah alone — moves his measureless host against little Bethulia: *Then their strong men removed their camps in that day, and the army of the men of war was an hundred and seventy thousand footmen, and twelve thousand horsemen, beside the baggage, and other men that were afoot among them, a very great multitude* (Judith 7:2), until *the children of Yashar''el (Israel), when they saw the multitude of them, were greatly troubled, and said every one to his neighbour, Now will these men lick up the face of the earth* (Judith 7:4). It is the old boast of the proud against the seed Yahuah has chosen — and the old promise stands against it: *Behold, all they that were incensed against thee shall be ashamed and confounded: they shall be as nothing; and they that strive with thee shall perish* (Isaiah 41:11); *Thou shalt seek them, and shalt not find them, even them that contended with thee: they that war against thee shall be as nothing, and as a thing of nought* (Isaiah 41:12). For it is His way to bring the towering low: *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7). The system that covers the face of the whole land is itself the thing of nought.',
       sv.verse_id, ev.verse_id, 'extras', 60150
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-water-cut-off',
       E'The water cut off',
       E'The Edomites and Moabites counsel the tyrant to spare his sword and let thirst do the killing: *Remain in your camp, and keep all the men of your army, and let your servants get into their hands the fountain of water, which issues forth of the foot of the mountain* (Judith 7:12); *For all the inhabitants of Bethulia have their water thence; so shall thirst kill them, and they shall give up their city* (Judith 7:13). So the host seizes the springs: *they pitched in the valley, and took the waters, and the fountains of the waters of the children of Yashar''el (Israel)* (Judith 7:17), and the cisterns run dry. The picture of a besieged people perishing for thirst is Jeremiah''s lament over Zion: *The tongue of the sucking child cleaveth to the roof of his mouth for thirst: the young children ask bread, and no man breaketh it unto them* (Lamentations 4:4). The kingdom of man fights by famine and drought — but the well it cannot reach is Yahuah''s mercy.',
       sv.verse_id, ev.verse_id, 'extras', 60153
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-faint-and-murmur',
       E'The people faint and murmur for water',
       E'When the vessels of water fail, the people sink: *Therefore their young children were out of heart, and their women and young men fainted for thirst, and fell down in the streets of the city, and by the passages of the gates, and there was no longer any strength in them* (Judith 7:22); and they turn on their rulers — *Now therefore call them to you, and deliver the whole city for a spoil to the people of Holofernes... For it is better for us to be made a spoil to them, than to die for thirst* (Judith 7:26-27). It is the wilderness murmur all over again, the test of faith under thirst that Israel has failed before: *And the people thirsted there for water; and the people murmured against Moses, and said, Wherefore is this that thou hast brought us up out of Egypt, to kill us and our children and our cattle with thirst?* (Exodus 17:3); *And the people spake against Elohim (God), and against Moses, Wherefore have ye brought us up out of Egypt to die in the wilderness? for there is no bread, neither is there any water; and our soul loatheth this light bread* (Numbers 21:5). The proving is the same — would they rather be slaves and spoil than wait on Yahuah?',
       sv.verse_id, ev.verse_id, 'extras', 60156
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-sold-and-proven',
       E'Sold into their hands — the proving',
       E'The people read their distress as abandonment: *For now we have no helper: but Yahuah (God) has sold us into their hands, that we should be thrown down before them with thirst and great destruction* (Judith 7:25); and yet even in the complaint they confess the covenant logic — *our Elohim (God) and Yahuah (God) of our fathers, which punishes us according to our sins and the sins of our fathers* (Judith 7:28). This is the wilderness school of Deuteronomy: the want of water and bread is not Yahuah forsaking but Yahuah humbling and proving. *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2); *And he humbled thee, and suffered thee to hunger, and fed thee with manna... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). The thirst is the test, not the verdict.',
       sv.verse_id, ev.verse_id, 'extras', 60159
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-wait-five-days',
       E'Endure five days — wait on Yahuah',
       E'Against the clamour to surrender, Ozias begs a holy stay of judgment: *Brothers, be of good courage, let us yet endure five days, in the which space Yahuah (God), our Elohim (God) may turn his mercy toward us; for he will not forsake us utterly* (Judith 7:30). It is the very posture the Psalmist commands and Jehoshaphat embodied — to stand still and let Yahuah be the deliverer of His chosen, the battle being not Israel''s might but His. *Wait on Yahuah (LORD): be of good courage, and he shall strengthen thine heart: wait, I say, on Yahuah (LORD)* (Psalm 27:14). When another great multitude came against Judah, the king laid the whole helplessness before Him — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee* (2 Chronicles 20:12) — and the answer came: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15). Ozias'' five days set the stage for the woman''s hand by which the weak will confound the mighty.',
       sv.verse_id, ev.verse_id, 'extras', 60162
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-7-licks-up-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 41:11 — *Behold, all they that were incensed against thee shall be ashamed and confounded: they shall be as nothing; and they that strive with thee shall perish.* Holofernes'' counsellors promise that not one of his host shall perish (Judith 7:11), but the word over Israel hands that perishing back to the besieger.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-licks-up-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:12 — *Thou shalt seek them, and shalt not find them, even them that contended with thee: they that war against thee shall be as nothing, and as a thing of nought.* The multitude that seems able to lick up the face of the earth in Judith 7:4 is, before Yahuah, a thing of nought.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-licks-up-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:7 — *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up.* Hannah''s song answers the hundred and seventy thousand of Judith 7:2: the count of footmen and horsemen decides nothing, for the bringing low is His.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-licks-up-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-7-water-cut-off
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 4:4 — *The tongue of the sucking child cleaveth to the roof of his mouth for thirst: the young children ask bread, and no man breaketh it unto them.* Jeremiah''s siege-grief is the very horror Holofernes'' counsel intends in Judith 7:13, that thirst should kill the children of Bethulia.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-water-cut-off'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-7-faint-and-murmur
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 17:3 — *And the people thirsted there for water; and the people murmured against Moses, and said, Wherefore is this that thou hast brought us up out of Egypt, to kill us and our children and our cattle with thirst?* Bethulia''s fainting and murmuring for thirst in Judith 7:22 re-runs Rephidim, the same fear for the children dying of thirst.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-faint-and-murmur'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:5 — *And the people spake against Elohim (God), and against Moses, Wherefore have ye brought us up out of Egypt to die in the wilderness? for there is no bread, neither is there any water; and our soul loatheth this light bread.* The cry that surrender is better than death by thirst (Judith 7:27) is the wilderness murmur — preferring Egypt to the proving.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-faint-and-murmur'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-7-sold-and-proven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* Bethulia''s confession of being chastened for fathers'' sins (Judith 7:28) is the Deuteronomic proving — the siege is meant to search the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-sold-and-proven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:3 — *And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live.* The cry that Yahuah has sold them to thirst (Judith 7:25) misreads the hunger and thirst that are meant to teach dependence on Him.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-sold-and-proven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-7-wait-five-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 27:14 — *Wait on Yahuah (LORD): be of good courage, and he shall strengthen thine heart: wait, I say, on Yahuah (LORD).* Ozias'' plea to endure five days for Yahuah''s mercy (Judith 7:30) is precisely this waiting and good courage that strengthens the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-wait-five-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Bethulia''s confession that they have no helper (Judith 7:25) finds its right answer in Jehoshaphat''s turning of helplessness toward Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-wait-five-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* The five-day stay of Judith 7:30 waits on exactly this — that the deliverance belongs to Yahuah and not to Bethulia''s spears.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-wait-five-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_08.sql (session253 judith 8) -----
-- Source anchor: apocrypha/judith ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt8 (view _session253_jdt8_lookup). Sort band base 60175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-8-the-fasting-widow
  ('apocrypha', 'judith', 8, 6, 'canon', 'luke', 2, 37, 'free', E'Luke 2:37 — *And she was a widow of about fourscore and four years, which departed not from the temple, but served Elohim (God) with fastings and prayers night and day.* Anna the prophetess is Judith''s very portrait — the widow whose long fasting and prayer is her ministry to Israel.'),
  ('apocrypha', 'judith', 8, 8, 'canon', '1-timothy', 5, 5, 'free', E'1 Timothy 5:5 — *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day.* Paul''s widow indeed who trusts and prays continually is exactly the Judith of 8:8, who feared Yahuah greatly and gave none an ill word.'),
  -- thread: judith-8-tempt-not-yahuah
  ('apocrypha', 'judith', 8, 12, 'canon', 'deuteronomy', 8, 2, 'free', E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* Israel is the proved, not the prover; Judith''s rebuke in 8:12 turns the elders'' testing of God back into God''s testing of them.'),
  ('apocrypha', 'judith', 8, 16, 'canon', 'numbers', 23, 19, 'free', E'Numbers 23:19 — *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* Judith 8:16 echoes Balaam''s oracle almost word for word — Yahuah is not as man to be threatened nor the son of Adam to waver.'),
  -- thread: judith-8-he-trieth-us-as-our-fathers
  ('apocrypha', 'judith', 8, 26, 'canon', 'genesis', 22, 1, 'free', E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* Judith 8:26 names the binding of Isaac as the very pattern of how Yahuah trieth His own — Abraham proved, and the son spared.'),
  ('apocrypha', 'judith', 8, 25, 'canon', 'deuteronomy', 8, 5, 'free', E'Deuteronomy 8:5 — *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee.* Judith''s "which trieth us, even as he did our fathers" reads the siege as a Father chastening sons, not a God forsaking them.'),
  ('apocrypha', 'judith', 8, 27, 'canon', 'romans', 5, 3, 'free', E'Romans 5:3 — *And not only so, but we glory in tribulations also: knowing that tribulation worketh patience.* Judith 8:27 sees the lighter trial as admonition rather than vengeance, the same fruitful reading of suffering Paul gives — tribulation working patience.'),
  -- thread: judith-8-trust-though-he-try
  ('apocrypha', 'judith', 8, 17, 'canon', 'job', 13, 15, 'free', E'Job 13:15 — *Though he slay me, yet will I trust in him: but I will maintain mine own ways before him.* Judith 8:17''s resolve to wait on Yahuah whatever the outcome is Job''s unbargaining trust — He may slay, yet He is trusted still.'),
  ('apocrypha', 'judith', 8, 20, 'canon', 'deuteronomy', 8, 19, 'free', E'Deuteronomy 8:19 — *And it shall be, if thou do at all forget Yahuah Elohayka (the LORD thy God), and walk after other gods, and serve them, and worship them, I testify against you this day that ye shall surely perish.* Judith''s "we know none other god" in 8:20 is the obverse of Moses'' warning — the generation that serves Yahuah alone is the seed kept, against the worship of gods made with hands.'),
  -- thread: judith-8-yahuah-visit-by-my-hand
  ('apocrypha', 'judith', 8, 33, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith''s "by my hand" in 8:33 stands squarely in the line of Deborah and Jael — Yahuah selling the oppressor into the hand of a woman.'),
  ('apocrypha', 'judith', 8, 33, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise that the serpent''s head is crushed through the woman frames Judith''s hand in 8:33 — the head of the tyrant (Holofernes) falls by a woman''s hand.'),
  ('apocrypha', 'judith', 8, 32, 'canon', '1-corinthians', 1, 27, 'free', E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* Judith''s deed that shall go throughout all generations (8:32) is the weak confounding the mighty — the kingdom of man dismantled so that no flesh should glory.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-the-fasting-widow',
       E'The widow who fasted and feared Yahuah greatly',
       E'Before she is a deliverer Judith is a widow at prayer: *So Judith was a widow in her house three years and four months* (Judith 8:4), and *she fasted all the days of her widowhood, save the eves of the sabbaths, and the sabbaths, and the eves of the new moons, and the new moons and the feasts and solemn days of the house of Yashar''el (Israel)* (Judith 8:6) — *And there was none that gave her an ill word; as she feared Yahuah (God) greatly* (Judith 8:8). It ain''t new: this is Anna''s portrait centuries before Anna. *And she was a widow of about fourscore and four years, which departed not from the temple, but served Elohim (God) with fastings and prayers night and day* (Luke 2:37). Paul measures the widow indeed by the same rule: *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day* (1 Timothy 5:5). And notice she fasts *save* the feasts and new moons and sabbaths — she keeps the appointed times of the house of Israel even in her mourning; the woman whose hand will deliver the nation is first a woman who keeps Torah and reckons the moedim.',
       sv.verse_id, ev.verse_id, 'extras', 60175
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-tempt-not-yahuah',
       E'Who are you to put Yahuah to the test?',
       E'The elders had bargained with Yahuah — surrender the city in five days if no rain comes — and Judith rebukes the bargain as a testing of Elohim: *And now who are you that have tempted Yahuah (God) this day, and stand instead of Yahuah (God) among the children of men?* (Judith 8:12) — *No, my brothers, provoke not Yahuah (God), our Elohim (God) to anger* (Judith 8:14). Faith does not set Yahuah a deadline. *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2) — it is He who proves us, not we who put Him on trial. And His unchanging nature is the ground: *Do not bind the counsels of Yahuah (God), our Elohim (God): for Yahuah (God) is not as man, that he may be threatened; neither is he as the son of Adam, that he should be wavering* (Judith 8:16), the very confession Balaam was made to speak — *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent* (Numbers 23:19).',
       sv.verse_id, ev.verse_id, 'extras', 60178
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-he-trieth-us-as-our-fathers',
       E'He trieth us, even as He did our fathers',
       E'Judith reframes the siege not as abandonment but as the testing of sons: *Moreover let us give thanks to Yahuah (God), our Elohim (God), which trieth us, even as he did our fathers* (Judith 8:25) — *Remember what things he did to Abraham, and how he tried Isaac, and what happened to Jacob in Mesopotamia of Syria* (Judith 8:26). The proving of Abraham is the pattern she names: *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am* (Genesis 22:1). And the testing is fatherly chastening, not wrath: *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5). Paul names the same chain — that trial itself is the seedbed of hope: *And not only so, but we glory in tribulations also: knowing that tribulation worketh patience* (Romans 5:3). This is faith that does not bargain: it receives the fire as a Father''s hand.',
       sv.verse_id, ev.verse_id, 'extras', 60181
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-trust-though-he-try',
       E'Though He try us, yet will we trust Him',
       E'Against the elders'' five-day ultimatum Judith sets a faith with no clause: *For if he will not help us within these five days, he has power to defend us when he will, even every day, or to destroy us before our enemies* (Judith 8:15) — and *Therefore let us wait for salvation of him, and call upon him to help us, and he will hear our voice, if it please him* (Judith 8:17). She will not make her trust conditional on the outcome. This is Job''s defiant confidence: *Though he slay me, yet will I trust in him: but I will maintain mine own ways before him* (Job 13:15). And it is Israel''s only ground of hope — *But we know none other god, therefore we trust that he will not despise us, nor any of our nation* (Judith 8:20), the same singular allegiance Moses pressed: *And it shall be, if thou do at all forget Yahuah Elohayka (the LORD thy God), and walk after other gods, and serve them, and worship them, I testify against you this day that ye shall surely perish* (Deuteronomy 8:19). Faith that does not bargain with God — it trusts though He slay, and serves no other.',
       sv.verse_id, ev.verse_id, 'extras', 60184
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-8-yahuah-visit-by-my-hand',
       E'Yahuah will visit Israel by my hand',
       E'Judith announces the deliverance and hides its means: *You shall stand this night in the gate, and I will go forth with my waitingwoman: and within the days that you have promised to deliver the city to our enemies Yahuah (God) will visit Yashar''el (Israel) by my hand* (Judith 8:33). The salvation is Yahuah''s; the instrument is a woman''s hand — and the Scriptures love this scandal. Deborah named it before Barak: *and she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9), and Jael drove the nail. It ain''t new — the bruising of the serpent''s head was always promised through the woman and her seed: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). This is the law of the kingdom of Elohim against the kingdom of man (Holofernes the tyrant who demanded the worship due to God alone): *But Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). The mighty host is dismantled not by an army but by the hand of a fasting widow — that no flesh should glory.',
       sv.verse_id, ev.verse_id, 'extras', 60187
  FROM _session253_jdt8_lookup sv, _session253_jdt8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=8 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-8-the-fasting-widow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 2:37 — *And she was a widow of about fourscore and four years, which departed not from the temple, but served Elohim (God) with fastings and prayers night and day.* Anna the prophetess is Judith''s very portrait — the widow whose long fasting and prayer is her ministry to Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-the-fasting-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 5:5 — *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day.* Paul''s widow indeed who trusts and prays continually is exactly the Judith of 8:8, who feared Yahuah greatly and gave none an ill word.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-the-fasting-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-8-tempt-not-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* Israel is the proved, not the prover; Judith''s rebuke in 8:12 turns the elders'' testing of God back into God''s testing of them.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-tempt-not-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 23:19 — *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* Judith 8:16 echoes Balaam''s oracle almost word for word — Yahuah is not as man to be threatened nor the son of Adam to waver.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-tempt-not-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-8-he-trieth-us-as-our-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* Judith 8:26 names the binding of Isaac as the very pattern of how Yahuah trieth His own — Abraham proved, and the son spared.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-he-trieth-us-as-our-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:5 — *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee.* Judith''s "which trieth us, even as he did our fathers" reads the siege as a Father chastening sons, not a God forsaking them.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-he-trieth-us-as-our-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:3 — *And not only so, but we glory in tribulations also: knowing that tribulation worketh patience.* Judith 8:27 sees the lighter trial as admonition rather than vengeance, the same fruitful reading of suffering Paul gives — tribulation working patience.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-he-trieth-us-as-our-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-8-trust-though-he-try
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 13:15 — *Though he slay me, yet will I trust in him: but I will maintain mine own ways before him.* Judith 8:17''s resolve to wait on Yahuah whatever the outcome is Job''s unbargaining trust — He may slay, yet He is trusted still.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-trust-though-he-try'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:19 — *And it shall be, if thou do at all forget Yahuah Elohayka (the LORD thy God), and walk after other gods, and serve them, and worship them, I testify against you this day that ye shall surely perish.* Judith''s "we know none other god" in 8:20 is the obverse of Moses'' warning — the generation that serves Yahuah alone is the seed kept, against the worship of gods made with hands.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-trust-though-he-try'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-8-yahuah-visit-by-my-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith''s "by my hand" in 8:33 stands squarely in the line of Deborah and Jael — Yahuah selling the oppressor into the hand of a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-yahuah-visit-by-my-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise that the serpent''s head is crushed through the woman frames Judith''s hand in 8:33 — the head of the tyrant (Holofernes) falls by a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-yahuah-visit-by-my-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* Judith''s deed that shall go throughout all generations (8:32) is the weak confounding the mighty — the kingdom of man dismantled so that no flesh should glory.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt8_lookup sv, _session253_jdt8_lookup tv
 WHERE t.slug='judith-8-yahuah-visit-by-my-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_09.sql (session253 judith 9) -----
-- Source anchor: apocrypha/judith ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt9 (view _session253_jdt9_lookup). Sort band base 60200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-9-simeon-zeal
  ('apocrypha', 'judith', 9, 2, 'canon', 'genesis', 34, 25, 'free', E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* This is the very sword of Simeon Judith 9:2 invokes, drawn to avenge the defiling of a maid.'),
  ('apocrypha', 'judith', 9, 3, 'canon', 'genesis', 34, 27, 'free', E'Genesis 34:27 — *The sons of Jacob came upon the slain, and spoiled the city, because they had defiled their sister.* Judith 9:3''s slain rulers dyed in blood is the spoiling of Shechem, the covenant zeal that abhorred the pollution of the seed.'),
  -- thread: judith-9-foreknowledge
  ('apocrypha', 'judith', 9, 6, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The very king whose general Holofernes besieges Israel confesses the foreknown judgment Judith 9:6 trusts.'),
  ('apocrypha', 'judith', 9, 5, 'canon', 'isaiah', 37, 36, 'free', E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Yahuah determined the Assyrian''s fall beforehand, as Judith 9:5 confesses of the things which ensued after.'),
  -- thread: judith-9-breaketh-battles
  ('apocrypha', 'judith', 9, 7, 'canon', 'exodus', 15, 3, 'free', E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* Judith 9:7 names Him the One that breaketh the battles, the same warrior-name Yashar''el sang at the Red Sea.'),
  ('apocrypha', 'judith', 9, 7, 'canon', 'isaiah', 31, 1, 'free', E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The Assyrians'' trust in horse and spear of Judith 9:7 is the same condemned reliance on flesh over the Holy One.'),
  ('apocrypha', 'judith', 9, 7, 'canon', 'isaiah', 31, 3, 'free', E'Isaiah 31:3 — *Now the Egyptians are men, and not Elohim (God); and their horses flesh, and not spirit. When Yahuah (LORD) shall stretch out his hand, both he that helpeth shall fall, and he that is holpen shall fall down, and they all shall fail together.* When Yahuah breaks the battle of Judith 9:7, the host of horse and man fails together as mere flesh.'),
  -- thread: judith-9-defile-the-sanctuary
  ('apocrypha', 'judith', 9, 8, 'canon', 'isaiah', 37, 23, 'free', E'Isaiah 37:23 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* The Assyrian purpose to defile the sanctuary in Judith 9:8 is the same blasphemy lifted against the Holy One.'),
  ('apocrypha', 'judith', 9, 9, 'canon', 'daniel', 4, 30, 'free', E'Daniel 4:30 — *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* The pride Judith 9:9 asks Yahuah to behold is the kingdom-of-man''s boast in its own might, the very arrogance Yahuah abased in Nebuchadnezzar.'),
  -- thread: judith-9-hand-of-a-woman
  ('apocrypha', 'judith', 9, 10, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith 9:10''s plea to break the proud by the hand of a woman stands in the line of the first enmity, the head of the serpent bruised through the woman.'),
  ('apocrypha', 'judith', 9, 10, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith 9:10 asks for the same victory Yahuah granted by selling the captain into a woman''s hand.'),
  ('apocrypha', 'judith', 9, 10, 'canon', 'judges', 4, 21, 'free', E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* Jael''s hammer on a sleeping captain prefigures the stateliness broken by the hand of a woman Judith 9:10 prays for.'),
  ('apocrypha', 'judith', 9, 10, 'apocrypha', 'judith', 13, 8, 'extras', E'Judith 13:8 — *And she struck twice upon his neck with all her might, and she took away his head from him.* Judith''s own hand fulfils the petition of Judith 9:10, breaking the tyrant''s stateliness exactly as she prayed.'),
  -- thread: judith-9-saviour-of-the-weak
  ('apocrypha', 'judith', 9, 11, 'canon', '1-samuel', 14, 6, 'free', E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Judith 9:11''s God whose power stands not in multitude is the same who saves by many or by few.'),
  ('apocrypha', 'judith', 9, 11, 'canon', 'psalms', 33, 16, 'free', E'Psalms 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The psalm states plainly the truth Judith 9:11 prays from, that strength of men cannot deliver.'),
  ('apocrypha', 'judith', 9, 11, 'canon', '1-samuel', 2, 4, 'free', E'1 Samuel 2:4 — *The bows of the mighty men are broken, and they that stumbled are girded with strength.* Hannah''s song that the mighty are broken and the weak girded is the same reversal Judith 9:11 trusts in the helper of the oppressed.'),
  ('apocrypha', 'judith', 9, 11, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Mary''s Magnificat is Judith 9:11 sung again, the strong cast down and the forlorn upheld by Yahuah.'),
  -- thread: judith-9-elohim-of-israel-only
  ('apocrypha', 'judith', 9, 14, 'canon', 'isaiah', 37, 23, 'free', E'Isaiah 37:23 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* Judith 9:14 prays that every nation acknowledge the One the Assyrian blasphemed, the sole protector of Yashar''el.'),
  ('apocrypha', 'judith', 9, 14, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* Judith 9:14''s plea that every nation own Yahuah is answered when even the proud king of the kingdom-of-man is brought to confess Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-simeon-zeal',
       E'The sword of Simeon — zeal for the seed kept undefiled',
       E'Judith opens her prayer by invoking her forefather Simeon''s covenant zeal: *O Yahuah (God) of my father Simeon, to whom you gavest a sword to take vengeance of the strangers, who loosened the girdle of a maid to defile her, and discovered the thigh to her shame, and polluted her virginity to her reproach; for you saidst, It shall not be so; and yet they did so:* (Judith 9:2). She remembers how *you gavest their rulers to be slain, so that they dyed their bed in blood, being deceived, and smotest the servants with their lords, and the lords upon their thrones;* (Judith 9:3). This is the deed of Dinah avenged: *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* (Genesis 34:25), *The sons of Jacob came upon the slain, and spoiled the city, because they had defiled their sister.* (Genesis 34:27). It ain''t new: the same zeal that guarded the seed from defilement in Shechem now arms a widow against Assyria.',
       sv.verse_id, ev.verse_id, 'extras', 60200
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-foreknowledge',
       E'Yahuah''s ways prepared — His judgments are in His foreknowledge',
       E'Judith confesses that the deliverance is settled before the hand ever moves: *For you have wrought not only those things, but also the things which fell out before, and which ensued after; you have thought upon the things which are now, and which are to come.* (Judith 9:5), *Yea, what things you did determine were ready at hand, and said, Lo, we are here: for all your ways are prepared, and your judgments are in your foreknowledge.* (Judith 9:6). This is election, not chance — Yahuah humbles the proud king by His own counsel: *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* (Daniel 4:37). The kingdom-of-man tyrant, Holofernes as Nebuchadnezzar''s arm, is dismantled by a foreknown decree.',
       sv.verse_id, ev.verse_id, 'extras', 60203
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-breaketh-battles',
       E'Yahuah breaketh the battles — not horse and spear',
       E'Judith strips the Assyrians of their boast in arms: *For, behold, the Assyrians are multiplied in their power; they are exalted with horse and man; they glory in the strength of their footmen; they trust in shield, and spear, and bow, and sling; and know not that you are Yahuah (God) that breakest the battles: Yahuah (God) is your name.* (Judith 9:7). The name is the same one sung at the Sea: *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* (Exodus 15:3). And the prophet pronounces woe on every such trust: *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* (Isaiah 31:1). It ain''t new: the kingdom of man trusts the chariot; Yahuah breaks the battle.',
       sv.verse_id, ev.verse_id, 'extras', 60206
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-defile-the-sanctuary',
       E'The pride that purposed to defile the sanctuary',
       E'Judith names the tyrant''s true crime — blasphemy against the holy house: *Throw down their strength in your power, and bring down their force in your wrath: for they have purposed to defile your sanctuary, and to pollute the tabernacle where your glorious name resteth and to cast down with sword the horn of your altar.* (Judith 9:8), *Behold their pride, and send your wrath upon their heads...* (Judith 9:9). This is the Assyrian boast Sennacherib made before, and the answer the prophet gave: *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* (Isaiah 37:23). It is Babylon''s proud word over again: *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* (Daniel 4:30). The kingdom-of-man system that demands worship and pollutes the sanctuary is the antichrist pattern Yahuah throws down.',
       sv.verse_id, ev.verse_id, 'extras', 60209
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-hand-of-a-woman',
       E'Break their stateliness by the hand of a woman',
       E'Here is the heart of the prayer — and the enmity first spoken in Eden: *Smite by the deceit of my lips the servant with the prince, and the prince with the servant: break down their stateliness by the hand of a woman.* (Judith 9:10). It echoes the first promise: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). It is Jael''s nail again, sold into a woman''s hand: *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* (Judges 4:9), *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* (Judges 4:21). Judith''s own hand will answer the prayer: *And she struck twice upon his neck with all her might, and she took away his head from him.* (Judith 13:8). It ain''t new: the proud head is bruised by the hand of a woman.',
       sv.verse_id, ev.verse_id, 'extras', 60212
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-saviour-of-the-weak',
       E'Not in multitude — a saviour of them without hope',
       E'Judith confesses the whole logic of Yahuah''s deliverance: *For your power stands not in multitude nor your might in strong men: for you are a Yahuah (God) of the afflicted, an helper of the oppressed, an upholder of the weak, a protector of the forlorn, a saviour of them that are without hope.* (Judith 9:11). This is the war-cry of faith: *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* (1 Samuel 14:6), and the psalm''s verdict: *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* (Psalms 33:16). Hannah sang it before Mary did: *The bows of the mighty men are broken, and they that stumbled are girded with strength.* (1 Samuel 2:4). And the Magnificat seals it: *He hath put down the mighty from their seats, and exalted them of low degree.* (Luke 1:52). It ain''t new: Yahuah saves not by many, the weak confound the mighty, the humble are exalted.',
       sv.verse_id, ev.verse_id, 'extras', 60215
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-elohim-of-israel-only',
       E'That every nation know there is none other that protecteth Yashar''el',
       E'Judith closes pleading the covenant name over the whole earth: *I pray you, I pray you, O Yahuah (God) of my father, and Yahuah (God) of the inheritance of Yashar''el (Israel), Yahuah (God) of the heavens and earth, Creator of the waters, king of every creature, hear you my prayer:* (Judith 9:12), that the deceit fall *who have purposed cruel things against your covenant, and your hallowed house, and against the top of Sion, and against the house of the possession of your children.* (Judith 9:13), *And make every nation and tribe to acknowledge that you are Yahuah (God) of all power and might, and that there is none other that protecteth the people of Yashar''el (Israel) but you.* (Judith 9:14). This is Hezekiah''s prayer answered, that the nations know the LORD alone: *Whom hast thou reproached and blasphemed?... even against the Holy One of Yashar''el (Israel).* (Isaiah 37:23). And the proud king himself is brought to confess it: *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* (Daniel 4:37). The election of Yashar''el is vindicated before every nation and tribe.',
       sv.verse_id, ev.verse_id, 'extras', 60218
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-9-simeon-zeal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* This is the very sword of Simeon Judith 9:2 invokes, drawn to avenge the defiling of a maid.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-simeon-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:27 — *The sons of Jacob came upon the slain, and spoiled the city, because they had defiled their sister.* Judith 9:3''s slain rulers dyed in blood is the spoiling of Shechem, the covenant zeal that abhorred the pollution of the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-simeon-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-foreknowledge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The very king whose general Holofernes besieges Israel confesses the foreknown judgment Judith 9:6 trusts.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-foreknowledge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Yahuah determined the Assyrian''s fall beforehand, as Judith 9:5 confesses of the things which ensued after.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-foreknowledge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-breaketh-battles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* Judith 9:7 names Him the One that breaketh the battles, the same warrior-name Yashar''el sang at the Red Sea.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-breaketh-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The Assyrians'' trust in horse and spear of Judith 9:7 is the same condemned reliance on flesh over the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-breaketh-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 31:3 — *Now the Egyptians are men, and not Elohim (God); and their horses flesh, and not spirit. When Yahuah (LORD) shall stretch out his hand, both he that helpeth shall fall, and he that is holpen shall fall down, and they all shall fail together.* When Yahuah breaks the battle of Judith 9:7, the host of horse and man fails together as mere flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-breaketh-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-defile-the-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 37:23 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* The Assyrian purpose to defile the sanctuary in Judith 9:8 is the same blasphemy lifted against the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-defile-the-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:30 — *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* The pride Judith 9:9 asks Yahuah to behold is the kingdom-of-man''s boast in its own might, the very arrogance Yahuah abased in Nebuchadnezzar.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-defile-the-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-hand-of-a-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith 9:10''s plea to break the proud by the hand of a woman stands in the line of the first enmity, the head of the serpent bruised through the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith 9:10 asks for the same victory Yahuah granted by selling the captain into a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* Jael''s hammer on a sleeping captain prefigures the stateliness broken by the hand of a woman Judith 9:10 prays for.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Judith 13:8 — *And she struck twice upon his neck with all her might, and she took away his head from him.* Judith''s own hand fulfils the petition of Judith 9:10, breaking the tyrant''s stateliness exactly as she prayed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-saviour-of-the-weak
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Judith 9:11''s God whose power stands not in multitude is the same who saves by many or by few.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-saviour-of-the-weak'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The psalm states plainly the truth Judith 9:11 prays from, that strength of men cannot deliver.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-saviour-of-the-weak'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:4 — *The bows of the mighty men are broken, and they that stumbled are girded with strength.* Hannah''s song that the mighty are broken and the weak girded is the same reversal Judith 9:11 trusts in the helper of the oppressed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-saviour-of-the-weak'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Mary''s Magnificat is Judith 9:11 sung again, the strong cast down and the forlorn upheld by Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-saviour-of-the-weak'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-elohim-of-israel-only
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 37:23 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* Judith 9:14 prays that every nation acknowledge the One the Assyrian blasphemed, the sole protector of Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-elohim-of-israel-only'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* Judith 9:14''s plea that every nation own Yahuah is answered when even the proud king of the kingdom-of-man is brought to confess Him.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-elohim-of-israel-only'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_10.sql (session253 judith 10) -----
-- Source anchor: apocrypha/judith ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt10 (view _session253_jdt10_lookup). Sort band base 60225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-10-arrayed-for-the-king
  ('apocrypha', 'judith', 10, 3, 'canon', 'esther', 5, 1, 'free', E'Esther 5:1 — *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king’s house, over against the king’s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* As Esther put off mourning and put on royal apparel to stand at peril in the tyrant''s court, so Judith puts off her widow''s sackcloth and arrays herself in gladness to go down into Holofernes'' camp.'),
  ('apocrypha', 'judith', 10, 4, 'canon', 'esther', 5, 2, 'free', E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The favour Esther obtained in the king''s sight is the very favour Judith decks herself to win, that the eyes of the proud might be turned toward Yahuah''s sent vessel.'),
  -- thread: judith-10-beauty-and-the-fear-of-yahuah
  ('apocrypha', 'judith', 10, 7, 'canon', 'proverbs', 31, 30, 'free', E'Proverbs 31:30 — *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* The men of the city wonder greatly at Judith''s beauty, but the praise that holds is for the woman beneath the array who feareth Yahuah and goes at His bidding.'),
  ('apocrypha', 'judith', 10, 8, 'canon', 'proverbs', 31, 25, 'free', E'Proverbs 31:25 — *Strength and honour are her clothing; and she shall rejoice in time to come.* Beneath the garments of gladness Judith goes out clothed in strength and honour, that her enterprise may end to the glory of Israel and the exaltation of Jerusalem.'),
  -- thread: judith-10-into-the-enemys-tent
  ('apocrypha', 'judith', 10, 23, 'canon', 'psalms', 23, 5, 'free', E'Psalm 23:5 — *Thou preparest a table before me in the presence of mine enemies: thou anointest my head with oil; my cup runneth over.* As Judith is brought into Holofernes'' tent and set in safety before him, Yahuah spreads His servant''s table in the very presence of the enemies who mean her death.'),
  ('apocrypha', 'judith', 10, 22, 'canon', 'judges', 4, 18, 'free', E'Judges 4:18 — *And Jael went out to meet Sisera, and said unto him, Turn in, my lord, turn in to me; fear not. And when he had turned in unto her into the tent, she covered him with a mantle.* As Jael drew the enemy captain into her tent to his undoing, Holofernes comes out and draws Judith in — the proud commander welcoming the very hand that will fell him.'),
  -- thread: judith-10-the-proud-cast-down
  ('apocrypha', 'judith', 10, 19, 'canon', 'luke', 1, 51, 'free', E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The Assyrians marvel at the people that have such women among them, never seeing that this is Yahuah scattering the proud by the lowly, as Mary later sings.'),
  ('apocrypha', 'judith', 10, 19, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The mighty Holofernes, who thinks no man of Israel should be left alive, is the very one Yahuah will put down from his seat by the hand of a low-estate widow.'),
  ('apocrypha', 'judith', 10, 19, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The woman set in the enemy''s tent to crush the head of the proud captain is one more echo of the first promise — the serpent''s head bruised by the woman and her seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-10-arrayed-for-the-king',
       E'Arrayed in gladness — the woman goes in at peril',
       E'Judith strips the sackcloth of her widowhood and arrays herself to walk straight into the camp of the tyrant: *And pulled off the sackcloth which she had on, and put off the garments of her widowhood, and washed her body all over with water, and anointed herself with precious ointment, and braided the hair of her head, and put on a tire upon it, and put on her garments of gladness, with which she was clad during the life of Manasses her husband.* (Judith 10:3) She is the deliverer who, of her own will, goes down into the enemy''s reach to undo him. So Esther before her put off mourning and put on the royal apparel to stand in the king''s court where the unbidden are slain: *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king''s house, over against the king''s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* (Esther 5:1) And the favour the queen obtained is the favour Judith goes seeking — the LORD turning the heart of the proud toward His sent vessel: *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* (Esther 5:2) It ain''t new — the weak woman set against the kingdom-of-man is Yahuah''s chosen instrument, going in willingly where the strong cannot.',
       sv.verse_id, ev.verse_id, 'extras', 60225
  FROM _session253_jdt10_lookup sv, _session253_jdt10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-10-beauty-and-the-fear-of-yahuah',
       E'Her beauty and the favour of Yahuah',
       E'The elders behold her transformed and send her forth with a blessing that names where the victory really lies: *Yahuah (God), Yahuah (God) of our fathers give you favour, and accomplish your enterprizes to the glory of the children of Yashar''el (Israel), and to the exaltation of Jerusalem. Then they worshipped Yahuah (God).* (Judith 10:8) Her beauty is the bait; the deliverance is Yahuah''s. So Proverbs weighs beauty against the fear of the LORD and finds the fear the lasting thing: *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* (Proverbs 31:30) Judith''s worth is not the tire upon her head but the woman beneath it who feareth Yahuah — clothed, like the virtuous woman, with strength: *Strength and honour are her clothing; and she shall rejoice in time to come.* (Proverbs 31:25) The camp marvels at her face; heaven marks her fear.',
       sv.verse_id, ev.verse_id, 'extras', 60228
  FROM _session253_jdt10_lookup sv, _session253_jdt10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-10-into-the-enemys-tent',
       E'Brought to the tent — a table among enemies',
       E'The deliverer is led, escorted by an hundred men, straight to the canopied bed of the tyrant: *Then they chose out of them an hundred men to accompany her and her maid; and they brought her to the tent of Holofernes.* (Judith 10:17) She comes before him spread in purple and gold and is set, unharmed, in the very heart of the enemy''s power: *Now Holofernes rested upon his bed under a canopy, which was woven with purple, and gold, and emeralds, and precious stones.* (Judith 10:21) This is the shepherd''s table laid out in the open camp — Yahuah seating His servant in safety in the presence of those who mean her death: *Thou preparest a table before me in the presence of mine enemies: thou anointest my head with oil; my cup runneth over.* (Psalm 23:5) And it is Jael''s tent over again, where the captain of the proud army is welcomed in only to fall by a woman''s hand: *And Jael went out to meet Sisera, and said unto him, Turn in, my lord, turn in to me; fear not. And when he had turned in unto her into the tent, she covered him with a mantle.* (Judges 4:18) The instrument of Yahuah walks in among the proud, and the tent that should be her grave becomes the seat of their undoing.',
       sv.verse_id, ev.verse_id, 'extras', 60231
  FROM _session253_jdt10_lookup sv, _session253_jdt10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=10 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-10-the-proud-cast-down',
       E'Who would despise this people — the proud confounded by the weak',
       E'The Assyrian camp gapes at her and at the people that bred her, and even the enemy confesses Israel''s strange greatness: *And they wondered at her beauty, and admired the children of Yashar''el (Israel) because of her, and every one said to his neighbour, Who would despise this people, that have among them such women? surely it is not good that one man of them be left who being let go might deceive the whole earth.* (Judith 10:19) The tyrant Holofernes, like Nebuchadnezzar who sent him, demands the whole earth bow — the kingdom-of-man pattern that Yahuah dismantles not by armies but by the despised. So Mary sings the rule of the King who topples the proud and lifts the lowly: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* (Luke 1:51) The mighty are unseated and the low estate is exalted: *He hath put down the mighty from their seats, and exalted them of low degree.* (Luke 1:52) And the oldest promise is the same — the bruising of the serpent''s head comes through the woman and her seed: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) The camp marvels at the woman in their midst, not knowing she is the LORD''s appointed bruise upon the head of the proud.',
       sv.verse_id, ev.verse_id, 'extras', 60234
  FROM _session253_jdt10_lookup sv, _session253_jdt10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=10 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-10-arrayed-for-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 5:1 — *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king’s house, over against the king’s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* As Esther put off mourning and put on royal apparel to stand at peril in the tyrant''s court, so Judith puts off her widow''s sackcloth and arrays herself in gladness to go down into Holofernes'' camp.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-arrayed-for-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The favour Esther obtained in the king''s sight is the very favour Judith decks herself to win, that the eyes of the proud might be turned toward Yahuah''s sent vessel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-arrayed-for-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-10-beauty-and-the-fear-of-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 31:30 — *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised.* The men of the city wonder greatly at Judith''s beauty, but the praise that holds is for the woman beneath the array who feareth Yahuah and goes at His bidding.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-beauty-and-the-fear-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 31:25 — *Strength and honour are her clothing; and she shall rejoice in time to come.* Beneath the garments of gladness Judith goes out clothed in strength and honour, that her enterprise may end to the glory of Israel and the exaltation of Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-beauty-and-the-fear-of-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-10-into-the-enemys-tent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 23:5 — *Thou preparest a table before me in the presence of mine enemies: thou anointest my head with oil; my cup runneth over.* As Judith is brought into Holofernes'' tent and set in safety before him, Yahuah spreads His servant''s table in the very presence of the enemies who mean her death.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-into-the-enemys-tent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:18 — *And Jael went out to meet Sisera, and said unto him, Turn in, my lord, turn in to me; fear not. And when he had turned in unto her into the tent, she covered him with a mantle.* As Jael drew the enemy captain into her tent to his undoing, Holofernes comes out and draws Judith in — the proud commander welcoming the very hand that will fell him.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-into-the-enemys-tent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-10-the-proud-cast-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The Assyrians marvel at the people that have such women among them, never seeing that this is Yahuah scattering the proud by the lowly, as Mary later sings.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-the-proud-cast-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The mighty Holofernes, who thinks no man of Israel should be left alive, is the very one Yahuah will put down from his seat by the hand of a low-estate widow.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-the-proud-cast-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The woman set in the enemy''s tent to crush the head of the proud captain is one more echo of the first promise — the serpent''s head bruised by the woman and her seed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt10_lookup sv, _session253_jdt10_lookup tv
 WHERE t.slug='judith-10-the-proud-cast-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_11.sql (session253 judith 11) -----
-- Source anchor: apocrypha/judith ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt11 (view _session253_jdt11_lookup). Sort band base 60250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-11-sin-the-only-breach
  ('apocrypha', 'judith', 11, 10, 'canon', '2-chronicles', 15, 2, 'free', E'2 Chronicles 15:2 — *And he went out to meet Asa, and said unto him, Hear ye me, Asa, and all Yahudah (Judah) and Benjamin; Yahuah (LORD) is with you, while ye be with him; and if ye seek him, he will be found of you; but if ye forsake him, he will forsake you.* Judith''s words that the sword cannot prevail except they sin (11:10) are simply Azariah''s covenant law — protection while they hold to Yahuah, abandonment only if they forsake him.'),
  ('apocrypha', 'judith', 11, 10, 'canon', 'deuteronomy', 28, 25, 'free', E'Deuteronomy 28:25 — *Yahuah (LORD) shall cause thee to be smitten before thine enemies: thou shalt go out one way against them, and flee seven ways before them: and shalt be removed into all the kingdoms of the earth.* The defeat Judith dangles before Holofernes — that it comes only by Israel''s sin (11:10) — is this Deuteronomic sentence, where being smitten before the enemy is the wage of forsaking the voice of Yahuah.'),
  ('apocrypha', 'judith', 11, 11, 'canon', 'leviticus', 26, 36, 'free', E'Leviticus 26:36 — *And upon them that are left alive of you I will send a faintness into their hearts in the lands of their enemies; and the sound of a shaken leaf shall chase them; and they shall flee, as fleeing from a sword; and they shall fall when none pursueth.* When Judith says their sin would provoke their Elohim to anger and bring death upon them (11:11), she invokes the very faintness-of-heart curse Moses promised the covenant-breaker.'),
  ('apocrypha', 'judith', 11, 12, 'canon', 'deuteronomy', 32, 30, 'free', E'Deuteronomy 32:30 — *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* Judith''s claim that Bethulia could only fall by transgressing the food-laws Yahuah forbade (11:12) rests on this: a nation is never overrun by enemy strength but only when its Rock sells it for its sin.'),
  -- thread: judith-11-king-of-all-the-earth
  ('apocrypha', 'judith', 11, 1, 'canon', 'daniel', 3, 5, 'free', E'Daniel 3:5 — *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up:* The Nebuchadnezzar whose servant Holofernes calls king of all the earth (11:1) is the same world-king who commands all peoples to fall down and worship his image.'),
  ('apocrypha', 'judith', 11, 7, 'canon', 'daniel', 3, 6, 'free', E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* Judith''s flattery that even the beasts and fowls live by Nebuchadnezzar''s power (11:7) exposes the tyrant''s claim on all flesh, enforced in Daniel by the furnace that awaits any who refuse him worship.'),
  ('apocrypha', 'judith', 11, 7, 'canon', 'daniel', 3, 18, 'free', E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* Against the boast that all things serve Nebuchadnezzar (11:7), the three Hebrews give the covenant answer that breaks the system — they will not serve the king''s gods even unto the fire.'),
  -- thread: judith-11-handmaid-who-serves-yahuah
  ('apocrypha', 'judith', 11, 5, 'canon', 'luke', 1, 38, 'free', E'Luke 1:38 — *And Mary said, Behold the handmaid of Yahuah (Lord); be it unto me according to thy word. And the angel departed from her.* Judith calling herself handmaid before Holofernes (11:5) joins the line of lowly women who name themselves Yahuah''s handmaid and become the vessel of his deliverance.'),
  ('apocrypha', 'judith', 11, 17, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith''s vow to serve Yahuah and bring back word of the enemy''s fall (11:17) re-treads Deborah''s word that Yahuah would sell the enemy captain into a woman''s hand.'),
  -- thread: judith-11-snare-of-his-own-confidence
  ('apocrypha', 'judith', 11, 22, 'canon', 'proverbs', 11, 8, 'free', E'Proverbs 11:8 — *The righteous is delivered out of trouble, and the wicked cometh in his stead.* Holofernes'' confidence that Judith''s counsel brings destruction on his enemies (11:22) is the snare reversed — the righteous goes free and the wicked man steps into the trouble he meant for her.'),
  ('apocrypha', 'judith', 11, 19, 'canon', '1-samuel', 17, 47, 'free', E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* Holofernes plans to march his army to Jerusalem behind Judith (11:19), but the outcome belongs to David''s truth — the battle is Yahuah''s, not won by sword and spear.'),
  ('apocrypha', 'judith', 11, 22, 'canon', '1-corinthians', 1, 27, 'free', E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* The mighty general who marvels at a widow''s wisdom (11:22) is about to be confounded by the weak thing Elohim chose, exactly as Paul describes.'),
  -- thread: judith-11-by-a-womans-hand
  ('apocrypha', 'judith', 11, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith''s promise that Yahuah will bring the thing perfectly to pass by her hand (11:6) echoes the first promise that the head of the enemy is bruised through the woman.'),
  ('apocrypha', 'judith', 11, 16, 'canon', 'judges', 4, 21, 'free', E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* The deed at which all the earth shall be astonished (11:16) mirrors Jael''s hand felling the enemy commander in his sleep — Yahuah''s victory carried by a woman.'),
  ('apocrypha', 'judith', 11, 16, 'canon', 'luke', 1, 51, 'free', E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* Judith sent to work a wonder before all the earth (11:16) belongs to the Magnificat''s pattern, where Yahuah''s arm scatters the proud and lifts the lowly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-sin-the-only-breach',
       E'No Sword Can Prevail Except They Sin',
       E'Judith bends low before Holofernes and yet, in the very act of seeming to betray her people, she preaches Moses to him: *for our nation shall not be punished, neither can sword prevail against them, except they sin against their Elohim (God)* (Judith 11:10). This is the whole Torah condition spoken into the enemy''s tent — Israel is unconquerable while she keeps covenant, and only sin opens the gate. Azariah laid the same law on Asa: *Hear ye me, Asa, and all Yahudah (Judah) and Benjamin; Yahuah (LORD) is with you, while ye be with him; and if ye seek him, he will be found of you; but if ye forsake him, he will forsake you* (2 Chronicles 15:2). The blessings-and-curses of Deuteronomy turn on the same hinge — only when the people forsake the voice of their Elohim does the enemy prevail: *Yahuah (LORD) shall cause thee to be smitten before thine enemies: thou shalt go out one way against them, and flee seven ways before them* (Deuteronomy 28:25). And the curse names exactly the panic Judith warns of, when they would *provoke their Elohim (God) to anger*: *the sound of a shaken leaf shall chase them; and they shall flee, as fleeing from a sword; and they shall fall when none pursueth* (Leviticus 26:36). The Song of Moses settles who actually hands a nation over: *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* (Deuteronomy 32:30). It ain''t new — the only weapon that can touch Israel is her own transgression.',
       sv.verse_id, ev.verse_id, 'extras', 60250
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-king-of-all-the-earth',
       E'The King of All the Earth Demands Worship',
       E'The whole speech is steeped in the boast of the kingdom of man: Holofernes opens by naming his master *Nabuchodonosor, the king of all the earth* (Judith 11:1), and Judith plays it back as a hymn — *not only men shall serve him by you, but also the beasts of the field, and the cattle, and the fowls of the air, shall live by your power under Nabuchodonosor and all his house* (Judith 11:7). This is the antichrist pattern, the tyrant who claims the worship and the very breath of all flesh that belong to Yahuah alone. Daniel met the same Nebuchadnezzar with the same demand: *at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up* (Daniel 3:5), backed by the furnace — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace* (Daniel 3:6). And the three Hebrews give the only faithful answer to every world-king who would be worshipped: *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:18). The system that demands universal homage is dismantled not by a bigger army but by a covenant people who will not bow.',
       sv.verse_id, ev.verse_id, 'extras', 60253
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-handmaid-who-serves-yahuah',
       E'Thy Handmaid That Serveth Yahuah Day and Night',
       E'Beneath the cunning, Judith names her true allegiance: *Receive the words of your servant, and suffer yours handmaid to speak in your presence* (Judith 11:5), and *your servant is religious, and serveth Yahuah (God) of heaven day and night... I will pray to Yahuah (God), and he will tell me when they have committed their sins* (Judith 11:17). The lowly handmaid who serves Yahuah night and day is the figure the Most High lifts up to confound the proud. Miriam answered Gabriel in exactly this posture: *And Mary said, Behold the handmaid of Yahuah (Lord); be it unto me according to thy word. And the angel departed from her* (Luke 1:38) — the willing servant through whom the deliverance comes. And the deliverance Judith carries belongs to a settled pattern, declared to Barak before another enemy general fell: *for Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9). The Elohim of Israel hides his victory in a handmaid''s hand.',
       sv.verse_id, ev.verse_id, 'extras', 60256
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-snare-of-his-own-confidence',
       E'The Wicked Cometh in His Stead',
       E'Holofernes swallows the bait whole, marvelling at her wisdom and pledging that her counsel will put *strength... in our hands and destruction upon them that lightly regard my lord* (Judith 11:22) — and his confidence becomes the very snare that takes him. Judith promises to *lead you through the midst of Judea, until you come before Jerusalem* (Judith 11:19), and the general who trusts the trap will find the trap turned. Solomon names the reversal exactly: *The righteous is delivered out of trouble, and the wicked cometh in his stead* (Proverbs 11:8). The battle was never decided by the spear he would lift — David told another giant, *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47). This is how the Elohim of Israel works: *Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27).',
       sv.verse_id, ev.verse_id, 'extras', 60259
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-by-a-womans-hand',
       E'By the Hand of a Woman',
       E'Judith stakes everything on Yahuah accomplishing the work through her: *if you will follow the words of yours handmaid, Yahuah (God) will bring the thing perfectly to pass by you* (Judith 11:6), and *Yahuah (God) has sent me to work things with you, whereat all the earth shall be astonished* (Judith 11:16). The astonishing thing is the oldest promise — that the seed of the woman crushes the head of the enemy: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). Jael had already prefigured it, the woman''s hand driving the spike into the sleeping general''s skull: *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground* (Judges 4:21). And Miriam sings the meaning of every such victory — the proud cast down by the arm of Yahuah through the lowly: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts* (Luke 1:51). The weak-confound-the-mighty pattern runs straight from Eden to the Magnificat; Judith stands in that line without being made the Messiah of it.',
       sv.verse_id, ev.verse_id, 'extras', 60262
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-11-sin-the-only-breach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 15:2 — *And he went out to meet Asa, and said unto him, Hear ye me, Asa, and all Yahudah (Judah) and Benjamin; Yahuah (LORD) is with you, while ye be with him; and if ye seek him, he will be found of you; but if ye forsake him, he will forsake you.* Judith''s words that the sword cannot prevail except they sin (11:10) are simply Azariah''s covenant law — protection while they hold to Yahuah, abandonment only if they forsake him.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-sin-the-only-breach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:25 — *Yahuah (LORD) shall cause thee to be smitten before thine enemies: thou shalt go out one way against them, and flee seven ways before them: and shalt be removed into all the kingdoms of the earth.* The defeat Judith dangles before Holofernes — that it comes only by Israel''s sin (11:10) — is this Deuteronomic sentence, where being smitten before the enemy is the wage of forsaking the voice of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-sin-the-only-breach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:36 — *And upon them that are left alive of you I will send a faintness into their hearts in the lands of their enemies; and the sound of a shaken leaf shall chase them; and they shall flee, as fleeing from a sword; and they shall fall when none pursueth.* When Judith says their sin would provoke their Elohim to anger and bring death upon them (11:11), she invokes the very faintness-of-heart curse Moses promised the covenant-breaker.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-sin-the-only-breach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 32:30 — *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* Judith''s claim that Bethulia could only fall by transgressing the food-laws Yahuah forbade (11:12) rests on this: a nation is never overrun by enemy strength but only when its Rock sells it for its sin.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-sin-the-only-breach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-11-king-of-all-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:5 — *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up:* The Nebuchadnezzar whose servant Holofernes calls king of all the earth (11:1) is the same world-king who commands all peoples to fall down and worship his image.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-king-of-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* Judith''s flattery that even the beasts and fowls live by Nebuchadnezzar''s power (11:7) exposes the tyrant''s claim on all flesh, enforced in Daniel by the furnace that awaits any who refuse him worship.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-king-of-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* Against the boast that all things serve Nebuchadnezzar (11:7), the three Hebrews give the covenant answer that breaks the system — they will not serve the king''s gods even unto the fire.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-king-of-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-11-handmaid-who-serves-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:38 — *And Mary said, Behold the handmaid of Yahuah (Lord); be it unto me according to thy word. And the angel departed from her.* Judith calling herself handmaid before Holofernes (11:5) joins the line of lowly women who name themselves Yahuah''s handmaid and become the vessel of his deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-handmaid-who-serves-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith''s vow to serve Yahuah and bring back word of the enemy''s fall (11:17) re-treads Deborah''s word that Yahuah would sell the enemy captain into a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-handmaid-who-serves-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-11-snare-of-his-own-confidence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:8 — *The righteous is delivered out of trouble, and the wicked cometh in his stead.* Holofernes'' confidence that Judith''s counsel brings destruction on his enemies (11:22) is the snare reversed — the righteous goes free and the wicked man steps into the trouble he meant for her.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-snare-of-his-own-confidence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* Holofernes plans to march his army to Jerusalem behind Judith (11:19), but the outcome belongs to David''s truth — the battle is Yahuah''s, not won by sword and spear.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-snare-of-his-own-confidence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* The mighty general who marvels at a widow''s wisdom (11:22) is about to be confounded by the weak thing Elohim chose, exactly as Paul describes.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-snare-of-his-own-confidence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-11-by-a-womans-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith''s promise that Yahuah will bring the thing perfectly to pass by her hand (11:6) echoes the first promise that the head of the enemy is bruised through the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-by-a-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* The deed at which all the earth shall be astonished (11:16) mirrors Jael''s hand felling the enemy commander in his sleep — Yahuah''s victory carried by a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-by-a-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* Judith sent to work a wonder before all the earth (11:16) belongs to the Magnificat''s pattern, where Yahuah''s arm scatters the proud and lifts the lowly.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-by-a-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_12.sql (session253 judith 12) -----
-- Source anchor: apocrypha/judith ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt12 (view _session253_jdt12_lookup). Sort band base 60275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-12-kept-her-own-meat
  ('apocrypha', 'judith', 12, 2, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Daniel in Babylon and Judith in the Assyrian camp make the identical refusal — the captive keeps the food laws at the tyrant''s own table.'),
  ('apocrypha', 'judith', 12, 2, 'canon', 'leviticus', 11, 47, 'free', E'Leviticus 11:47 — *To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten.* Judith''s "lest there be an offence" is this very distinction carried into exile-conditions, the clean and unclean still binding among the nations.'),
  ('apocrypha', 'judith', 12, 2, 'canon', 'leviticus', 11, 45, 'free', E'Leviticus 11:45 — *For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy.* The reason Judith eats only her own provision — set-apartness, not menu-preference, is the covenant ground of her refusal.'),
  -- thread: judith-12-clean-and-the-morning-prayer
  ('apocrypha', 'judith', 12, 6, 'canon', 'psalms', 5, 3, 'free', E'Psalm 5:3 — *My voice shalt thou hear in the morning, O Yahuah (LORD); in the morning will I direct my prayer unto thee, and will look up.* Judith''s daily going-out to pray at the morning watch is David''s morning-watch prayer, the same "direct my way" she begs of Yahuah.'),
  ('apocrypha', 'judith', 12, 8, 'canon', 'psalms', 5, 7, 'free', E'Psalm 5:7 — *But as for me, I will come into thy house in the multitude of thy mercy: and in thy fear will I worship toward thy holy temple.* She washes and "came in clean" to seek Yahuah — the worshipper''s clean approach in fear, kept even in the Assyrian camp where no temple stands.'),
  ('apocrypha', 'judith', 12, 8, 'canon', 'exodus', 23, 25, 'free', E'Exodus 23:25 — *And ye shall serve Yahuah Elohaychem (the LORD your God), and he shall bless thy bread, and thy water; and I will take sickness away from the midst of thee.* Judith serves the Elohim of Yashar''el alone and pleads for the "raising up" of her people — the covenant service that brings deliverance, not the worship of Nabuchodonosor.'),
  -- thread: judith-12-by-my-hand
  ('apocrypha', 'judith', 12, 4, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Deborah''s word "into the hand of a woman" is Judith''s "by my hand" — the tyrant given over to be undone by the weaker vessel.'),
  ('apocrypha', 'judith', 12, 4, 'canon', '1-corinthians', 1, 27, 'free', E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* Judith''s confidence that Yahuah will work "by my hand" is exactly this — the weak chosen to confound the mighty Assyrian host.'),
  ('apocrypha', 'judith', 12, 4, 'apocrypha', 'judith', 13, 7, 'extras', E'Judith 13:7 — *And approached to his bed, and took hold of the hair of his head, and said, Strengthen me, O Yahuah (God) of Yashar''el (Israel), this day.* What she announces in 12:4 — that Yahuah works "by my hand" — comes to pass the next night when she takes Holofernes by the hair and asks for strength.'),
  -- thread: judith-12-daughters-of-the-assyrians
  ('apocrypha', 'judith', 12, 13, 'canon', 'psalms', 9, 7, 'free', E'Psalm 9:7 — *But Yahuah (LORD) shall endure for ever: he hath prepared his throne for judgment.* Against the house of Nabuchodonosor that claims all should serve it, the enduring throne of Yahuah is the one prepared for judgment — the tyrant-system''s days are numbered.'),
  ('apocrypha', 'judith', 12, 13, 'canon', 'psalms', 9, 8, 'free', E'Psalm 9:8 — *And he shall judge the world in righteousness, he shall minister judgment to the people in uprightness.* The Assyrian invitation to "be merry with us" sits under this verdict — the One who judges the world in righteousness will undo the camp that mocks His people.'),
  ('apocrypha', 'judith', 12, 16, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Holofernes'' heart is "ravished" and he "waited a time to deceive her" — the haughty spirit of the war-king, ripe for the fall that comes the very next chapter.'),
  -- thread: judith-12-my-life-magnified
  ('apocrypha', 'judith', 12, 18, 'canon', 'luke', 1, 48, 'free', E'Luke 1:48 — *For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed.* Judith the "handmaid" whose "life is magnified" foreshadows Miriam''s song of the regarded handmaiden — both the lowly vessel through whom Yahuah works deliverance.'),
  ('apocrypha', 'judith', 12, 18, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Judith''s magnified life at the tyrant''s feast is the Magnificat''s reversal in the making — the mighty Holofernes put down, the low handmaid exalted by Yahuah''s hand.'),
  ('apocrypha', 'judith', 12, 18, 'apocrypha', 'judith', 13, 18, 'extras', E'Judith 13:18 — *Then said Ozias to her, O daughter, blessed art you of the most high Yahuah (God) above all the women upon the earth; and blessed be Yahuah (God), which has created the heavens and the earth, which has directed you to the cutting off of the head of the chief of our enemies.* Her "my life is magnified this day" is answered when Yashar''el blesses her "above all the women upon the earth" — the lowly handmaid called blessed by all.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-12-kept-her-own-meat',
       E'She would not defile herself with the tyrant''s meat',
       E'Set down at the conqueror''s own table, Judith will not touch his food: *And Judith said, I will not eat thereof, lest there be an offence: but provision shall be made for me of the things that I have brought.* (Judith 12:2). She has carried her own clean provision into the enemy camp, refusing to be made *as one of the daughters of the Assyrians, which serve in the house of Nabuchodonosor* (Judith 12:13) — the Torah kept among the nations, holiness uncompromised in the tyrant''s tent. It ain''t new: Daniel sat at another world-king''s table and made the same stand — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank* (Daniel 1:8). Behind both stands the law of the clean and the unclean given at Sinai — *To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47) — for *ye shall therefore be holy, for I am holy* (Leviticus 11:45). The kingdom of man feeds you to absorb you; the remnant eats from Yahuah''s table and stays a peculiar people.',
       sv.verse_id, ev.verse_id, 'extras', 60275
  FROM _session253_jdt12_lookup sv, _session253_jdt12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-12-clean-and-the-morning-prayer',
       E'She went out to pray in the morning watch and came in clean',
       E'Holiness in the tyrant''s tent is not only diet but devotion. Judith rises before dawn — *and she arose when it was toward the morning watch* (Judith 12:5) — and asks leave to go out to prayer: *And when she came out, she besought Yahuah (God) of Yashar''el (Israel) to direct her way to the raising up of the children of her people* (Judith 12:8), then *So she came in clean, and remained in the tent* (Judith 12:9). It ain''t new: David fixed the same hour for his prayer — *My voice shalt thou hear in the morning, O Yahuah (LORD); in the morning will I direct my prayer unto thee, and will look up* (Psalm 5:3) — the very "direct my way / direct my prayer" of the morning watch. And her washing-and-coming-in-clean is the worshipper''s approach: *But as for me, I will come into thy house in the multitude of thy mercy: and in thy fear will I worship toward thy holy temple* (Psalm 5:7). She lives by the sunset-to-sunset reckoning too, eating *at evening* (Judith 12:9) — the appointed times kept even behind enemy lines.',
       sv.verse_id, ev.verse_id, 'extras', 60278
  FROM _session253_jdt12_lookup sv, _session253_jdt12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-12-by-my-hand',
       E'Yahuah will work by my hand — the weak confound the mighty',
       E'From the start Judith names the engine of the whole book: *Then said Judith to him As your soul lives, my lord, yours handmaid shall not spend those things that I have, before Yahuah (God) work by my hand the things that he has determined* (Judith 12:4). The deliverance will be Yahuah''s, *by my hand* — a woman''s hand against the Assyrian war-machine. It ain''t new: this is how Yahuah fights. *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27), *yea, and things which are not, to bring to nought things that are* (1 Corinthians 1:28). The pattern is ancient: Deborah foretold the very shape of it — *Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9) — and Jael drove home the tent-nail (Judges 4:21), the camp-tent prefiguring Holofernes'' own tent where the head falls (Judith 13:8). The kingdom of man trusts its mighty men; Yahuah elects the weak vessel and brings the system to nought.',
       sv.verse_id, ev.verse_id, 'extras', 60281
  FROM _session253_jdt12_lookup sv, _session253_jdt12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-12-daughters-of-the-assyrians',
       E'Made as one of the daughters of the Assyrians — the system that absorbs',
       E'Bagoas comes to draw her in: *Let not this fair damsel fear to come to my lord, and to be honoured in his presence, and drink wine, and be merry with us and be made this day as one of the daughters of the Assyrians, which serve in the house of Nabuchodonosor* (Judith 12:13). Here is the kingdom-of-man''s true offer — be honoured in the tyrant''s house, serve Nabuchodonosor, be made one of his. It is the antichrist pattern: the war-king who would have all nations *serve in the house of Nabuchodonosor* demands worship and assimilation. But Yahuah lays the proud low. *For Yahuah (LORD) shall endure for ever: he hath prepared his throne for judgment* (Psalm 9:7); *And he shall judge the world in righteousness, he shall minister judgment to the people in uprightness* (Psalm 9:8). Holofernes "waited a time to deceive her" (Judith 12:16) — and the deceiver is himself overthrown. The remnant does not bow to be made a daughter of Assyria; the system that exalts itself is brought to judgment.',
       sv.verse_id, ev.verse_id, 'extras', 60284
  FROM _session253_jdt12_lookup sv, _session253_jdt12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=12 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-12-my-life-magnified',
       E'My life is magnified in me this day — the lowly handmaid exalted',
       E'At the feast Judith answers Holofernes with words that ring far beyond his table: *I will drink now, my lord, because my life is magnified in me this day more than all the days since I was born* (Judith 12:18). The Assyrian hears flattery; the reader hears the song of the lowly handmaid whom Yahuah is about to use to topple the mighty. It ain''t new — Miriam''s daughter Judith speaks the Magnificat before the Magnificat. *For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed* (Luke 1:48); *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). The drunken war-lord "drank more wine than he had drunk at any time in one day since he was born" (Judith 12:20) — the mighty about to be put down from his seat by the hand of a handmaid of low degree, magnified by Yahuah alone.',
       sv.verse_id, ev.verse_id, 'extras', 60287
  FROM _session253_jdt12_lookup sv, _session253_jdt12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=12 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-12-kept-her-own-meat
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Daniel in Babylon and Judith in the Assyrian camp make the identical refusal — the captive keeps the food laws at the tyrant''s own table.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-kept-her-own-meat'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:47 — *To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten.* Judith''s "lest there be an offence" is this very distinction carried into exile-conditions, the clean and unclean still binding among the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-kept-her-own-meat'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 11:45 — *For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy.* The reason Judith eats only her own provision — set-apartness, not menu-preference, is the covenant ground of her refusal.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-kept-her-own-meat'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-12-clean-and-the-morning-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 5:3 — *My voice shalt thou hear in the morning, O Yahuah (LORD); in the morning will I direct my prayer unto thee, and will look up.* Judith''s daily going-out to pray at the morning watch is David''s morning-watch prayer, the same "direct my way" she begs of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-clean-and-the-morning-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 5:7 — *But as for me, I will come into thy house in the multitude of thy mercy: and in thy fear will I worship toward thy holy temple.* She washes and "came in clean" to seek Yahuah — the worshipper''s clean approach in fear, kept even in the Assyrian camp where no temple stands.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-clean-and-the-morning-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 23:25 — *And ye shall serve Yahuah Elohaychem (the LORD your God), and he shall bless thy bread, and thy water; and I will take sickness away from the midst of thee.* Judith serves the Elohim of Yashar''el alone and pleads for the "raising up" of her people — the covenant service that brings deliverance, not the worship of Nabuchodonosor.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-clean-and-the-morning-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-12-by-my-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Deborah''s word "into the hand of a woman" is Judith''s "by my hand" — the tyrant given over to be undone by the weaker vessel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-by-my-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* Judith''s confidence that Yahuah will work "by my hand" is exactly this — the weak chosen to confound the mighty Assyrian host.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-by-my-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judith 13:7 — *And approached to his bed, and took hold of the hair of his head, and said, Strengthen me, O Yahuah (God) of Yashar''el (Israel), this day.* What she announces in 12:4 — that Yahuah works "by my hand" — comes to pass the next night when she takes Holofernes by the hair and asks for strength.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-by-my-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-12-daughters-of-the-assyrians
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 9:7 — *But Yahuah (LORD) shall endure for ever: he hath prepared his throne for judgment.* Against the house of Nabuchodonosor that claims all should serve it, the enduring throne of Yahuah is the one prepared for judgment — the tyrant-system''s days are numbered.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-daughters-of-the-assyrians'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 9:8 — *And he shall judge the world in righteousness, he shall minister judgment to the people in uprightness.* The Assyrian invitation to "be merry with us" sits under this verdict — the One who judges the world in righteousness will undo the camp that mocks His people.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-daughters-of-the-assyrians'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Holofernes'' heart is "ravished" and he "waited a time to deceive her" — the haughty spirit of the war-king, ripe for the fall that comes the very next chapter.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-daughters-of-the-assyrians'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-12-my-life-magnified
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:48 — *For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed.* Judith the "handmaid" whose "life is magnified" foreshadows Miriam''s song of the regarded handmaiden — both the lowly vessel through whom Yahuah works deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-my-life-magnified'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Judith''s magnified life at the tyrant''s feast is the Magnificat''s reversal in the making — the mighty Holofernes put down, the low handmaid exalted by Yahuah''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-my-life-magnified'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judith 13:18 — *Then said Ozias to her, O daughter, blessed art you of the most high Yahuah (God) above all the women upon the earth; and blessed be Yahuah (God), which has created the heavens and the earth, which has directed you to the cutting off of the head of the chief of our enemies.* Her "my life is magnified this day" is answered when Yashar''el blesses her "above all the women upon the earth" — the lowly handmaid called blessed by all.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt12_lookup sv, _session253_jdt12_lookup tv
 WHERE t.slug='judith-12-my-life-magnified'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_13.sql (session253 judith 13) -----
-- Source anchor: apocrypha/judith ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt13 (view _session253_jdt13_lookup). Sort band base 60300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-13-head-of-the-enemy-struck-off
  ('apocrypha', 'judith', 13, 7, 'canon', 'judges', 4, 21, 'free', E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* As Jael struck the sleeping Sisera, so Judith approaches the wine-heavy Holofernes to do Yahuah''s deliverance by a woman''s hand.'),
  ('apocrypha', 'judith', 13, 8, 'canon', 'judges', 5, 26, 'free', E'Judges 5:26 — *She put her hand to the nail, and her right hand to the workmen''s hammer; and with the hammer she smote Sisera, she smote off his head, when she had pierced and stricken through his temples.* Deborah''s song already sings of a woman smiting off the oppressor''s head, the very stroke Judith makes twice upon Holofernes'' neck.'),
  ('apocrypha', 'judith', 13, 8, 'canon', '1-samuel', 17, 51, 'free', E'1 Samuel 17:51 — *Therefore David ran, and stood upon the Philistine, and took his sword, and drew it out of the sheath thereof, and slew him, and cut off his head therewith. And when the Philistines saw their champion was dead, they fled.* David cuts off Goliath''s head with the giant''s own sword as Judith takes Holofernes'' head with his own fauchion — the enemy undone by his own weapon.'),
  -- thread: judith-13-the-proud-head-and-the-womans-seed
  ('apocrypha', 'judith', 13, 15, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith''s striking of the enemy''s head *by the hand of a woman* sounds the first promise that the serpent''s head is bruised through the woman.'),
  ('apocrypha', 'judith', 13, 15, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The tyrant''s head struck off in Judith foreshadows the final crushing of the adversary under the feet of Yahuah''s people.'),
  -- thread: judith-13-blessed-above-women
  ('apocrypha', 'judith', 13, 18, 'canon', 'judges', 5, 24, 'free', E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Ozias'' word over Judith, *blessed art you... above all the women upon the earth*, repeats verbatim the blessing already spoken over Jael the deliverer.'),
  ('apocrypha', 'judith', 13, 18, 'canon', 'luke', 1, 42, 'free', E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* The same benediction over Judith is heard again over Miriam (Mary), gathering the deliverer-women into one blessed line.'),
  -- thread: judith-13-the-weak-confound-the-mighty
  ('apocrypha', 'judith', 13, 14, 'canon', 'psalms', 44, 3, 'free', E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* Judith disclaims her own strength, naming Yahuah who destroyed the enemy by her hand, exactly as the psalm credits not Israel''s sword but Yahuah''s right hand.'),
  ('apocrypha', 'judith', 13, 15, 'canon', '1-corinthians', 1, 27, 'free', E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* That Yahuah struck the great captain *by the hand of a woman* is the very pattern Paul names — the weak chosen to confound the mighty.'),
  -- thread: judith-13-strengthen-me-this-day
  ('apocrypha', 'judith', 13, 7, 'canon', '1-samuel', 17, 45, 'free', E'1 Samuel 17:45 — *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied.* Judith''s plea, *Strengthen me, O Yahuah... this day*, leans on the same name of Yahuah of hosts in which David met Goliath.'),
  ('apocrypha', 'judith', 13, 4, 'canon', '1-samuel', 17, 47, 'free', E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* Judith asks Yahuah of all power to look on *the works of my hands*, owning as David did that the battle and the deliverance belong to Yahuah, not the weapon.'),
  -- thread: judith-13-they-worshipped-and-praised
  ('apocrypha', 'judith', 13, 17, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* As Israel sang to Yahuah at the overthrow of Pharaoh, so the people worship Yahuah who has brought the enemies of His people to nought.'),
  ('apocrypha', 'judith', 13, 17, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The Magnificat names the very reversal the people praise — the mighty captain cast down and the lowly widow exalted as Yahuah''s instrument.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-head-of-the-enemy-struck-off',
       E'The head of the enemy struck off by a woman''s hand',
       E'Judith stands over the drunken tyrant and prays, *And approached to his bed, and took hold of the hair of his head, and said, Strengthen me, O Yahuah (God) of Yashar''el (Israel), this day* (Judith 13:7), *And she struck twice upon his neck with all her might, and she took away his head from him* (Judith 13:8). The deed is not new. When Sisera oppressed Israel, *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died* (Judges 4:21); and the song says she *smote off his head, when she had pierced and stricken through his temples* (Judges 5:26). So too the shepherd-boy over the giant: *Therefore David ran, and stood upon the Philistine, and took his sword, and drew it out of the sheath thereof, and slew him, and cut off his head therewith* (1 Samuel 17:51). The proud captain is felled by his own fauchion as the giant was felled by his own sword — the enemy''s strength turned against his own head.',
       sv.verse_id, ev.verse_id, 'extras', 60300
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-the-proud-head-and-the-womans-seed',
       E'The proud head crushed and the seed of the woman',
       E'Judith shows the trophy to the city: *So she took the head out of the bag, and shewed it, and said to them, behold the head of Holofernes, the chief captain of the army of Assur, and behold the canopy, in which he did lie in his drunkenness; and Yahuah (God) has struck him by the hand of a woman* (Judith 13:15). The pattern was set at the gate of Eden, where Yahuah told the serpent, *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The head of the enemy is the appointed place of the blow, and it is *by the hand of a woman* that the proud head falls. The apostle carries the same promise forward: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20) — every striking-down of the tyrant is an echo of the one promised bruising of the serpent''s head.',
       sv.verse_id, ev.verse_id, 'extras', 60303
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-blessed-above-women',
       E'Blessed art thou above all the women upon the earth',
       E'Ozias meets Judith at the gate: *Then said Ozias to her, O daughter, blessed art you of the most high Yahuah (God) above all the women upon the earth; and blessed be Yahuah (God), which has created the heavens and the earth, which has directed you to the cutting off of the head of the chief of our enemies* (Judith 13:18). This blessing is itself a quotation. Of Jael the song sang, *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent* (Judges 5:24). And the Spirit puts the same words on Elisabeth''s lips at the visitation: *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb* (Luke 1:42). The deliverer-woman, blessed above women, stands in a single line from Jael to Judith to the mother of the promised Seed.',
       sv.verse_id, ev.verse_id, 'extras', 60306
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-the-weak-confound-the-mighty',
       E'Yahuah strikes the mighty by the hand of the weak',
       E'Judith confesses where the victory came from: *Then she said to them with a loud voice, Praise, praise Yahuah (God), praise Yahuah (God), I say, for he has not taken away his mercy from the house of Yashar''el (Israel), but has destroyed our enemies by my hands this night* (Judith 13:14); the deed is *by the hand of a woman* (Judith 13:15). This is Yahuah''s settled way — He does not save by the strong arm of man but confounds the mighty by the weak. *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them* (Psalm 44:3). The apostle names the principle: *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). The kingdom-of-man captain, demanding the world bow to Nebuchadnezzar, is dismantled by a lone widow''s hand.',
       sv.verse_id, ev.verse_id, 'extras', 60309
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-strengthen-me-this-day',
       E'Strengthen me, O Yahuah, this day',
       E'Before the stroke Judith prays, *O Yahuah (God) of all power, look at this present upon the works of my hands for the exaltation of Jerusalem* (Judith 13:4), and at the bed, *Strengthen me, O Yahuah (God) of Yashar''el (Israel), this day* (Judith 13:7). The deliverer''s strength is borrowed, not native. So David answered the giant: *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied* (1 Samuel 17:45), *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47). The hand that strikes is a woman''s, but the power is Yahuah of hosts''.',
       sv.verse_id, ev.verse_id, 'extras', 60312
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-they-worshipped-and-praised',
       E'All the people worshipped Yahuah who brought the proud to nought',
       E'When the head is shown, the city falls down in worship: *Then all the people were wonderfully astonished, and bowed themselves and worshipped Yahuah (God), and said with one accord, Blessed be you, O our Elohim (God), which have this day brought to nought the enemies of your people* (Judith 13:17). This is Israel''s ancient response to deliverance from the kingdom-of-man tyrant. After the sea, *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1). And Miriam''s song over the proud says, *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). The drunken captain who would have all the earth worship Nebuchadnezzar is brought to nought, and the worship is given to Yahuah alone.',
       sv.verse_id, ev.verse_id, 'extras', 60315
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-13-head-of-the-enemy-struck-off
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* As Jael struck the sleeping Sisera, so Judith approaches the wine-heavy Holofernes to do Yahuah''s deliverance by a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-head-of-the-enemy-struck-off'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 5:26 — *She put her hand to the nail, and her right hand to the workmen''s hammer; and with the hammer she smote Sisera, she smote off his head, when she had pierced and stricken through his temples.* Deborah''s song already sings of a woman smiting off the oppressor''s head, the very stroke Judith makes twice upon Holofernes'' neck.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-head-of-the-enemy-struck-off'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 17:51 — *Therefore David ran, and stood upon the Philistine, and took his sword, and drew it out of the sheath thereof, and slew him, and cut off his head therewith. And when the Philistines saw their champion was dead, they fled.* David cuts off Goliath''s head with the giant''s own sword as Judith takes Holofernes'' head with his own fauchion — the enemy undone by his own weapon.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-head-of-the-enemy-struck-off'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-the-proud-head-and-the-womans-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith''s striking of the enemy''s head *by the hand of a woman* sounds the first promise that the serpent''s head is bruised through the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-the-proud-head-and-the-womans-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The tyrant''s head struck off in Judith foreshadows the final crushing of the adversary under the feet of Yahuah''s people.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-the-proud-head-and-the-womans-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-blessed-above-women
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Ozias'' word over Judith, *blessed art you... above all the women upon the earth*, repeats verbatim the blessing already spoken over Jael the deliverer.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-blessed-above-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* The same benediction over Judith is heard again over Miriam (Mary), gathering the deliverer-women into one blessed line.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-blessed-above-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-the-weak-confound-the-mighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* Judith disclaims her own strength, naming Yahuah who destroyed the enemy by her hand, exactly as the psalm credits not Israel''s sword but Yahuah''s right hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* That Yahuah struck the great captain *by the hand of a woman* is the very pattern Paul names — the weak chosen to confound the mighty.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-strengthen-me-this-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 17:45 — *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied.* Judith''s plea, *Strengthen me, O Yahuah... this day*, leans on the same name of Yahuah of hosts in which David met Goliath.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-strengthen-me-this-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* Judith asks Yahuah of all power to look on *the works of my hands*, owning as David did that the battle and the deliverance belong to Yahuah, not the weapon.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-strengthen-me-this-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-they-worshipped-and-praised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* As Israel sang to Yahuah at the overthrow of Pharaoh, so the people worship Yahuah who has brought the enemies of His people to nought.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-they-worshipped-and-praised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The Magnificat names the very reversal the people praise — the mighty captain cast down and the lowly widow exalted as Yahuah''s instrument.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-they-worshipped-and-praised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_14.sql (session253 judith 14) -----
-- Source anchor: apocrypha/judith ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt14 (view _session253_jdt14_lookup). Sort band base 60325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-14-stranger-joined
  ('apocrypha', 'judith', 14, 10, 'canon', 'exodus', 12, 48, 'free', E'Exodus 12:48 — *And when a stranger shall sojourn with thee, and will keep the passover to Yahuah (LORD), let all his males be circumcised, and then let him come near and keep it; and he shall be as one that is born in the land: for no uncircumcised person shall eat thereof.* Achior''s circumcision and joining to the house of Israel in Judith 14:10 is exactly the Torah''s door for the sojourner into the covenant.'),
  ('apocrypha', 'judith', 14, 10, 'canon', 'exodus', 12, 49, 'free', E'Exodus 12:49 — *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you.* The Ammonite joined to Israel in Judith 14:10 stands under the one law that knows no second tier for the grafted-in.'),
  ('apocrypha', 'judith', 14, 10, 'canon', 'isaiah', 56, 6, 'free', E'Isaiah 56:6 — *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD), to be his servants, every one that keepeth the sabbath from polluting it, and taketh hold of my covenant;* Achior believing greatly and joining the house of Israel in Judith 14:10 is the foreigner Isaiah says Yahuah will bring to His holy mountain.'),
  ('apocrypha', 'judith', 14, 10, 'canon', 'ruth', 1, 16, 'free', E'Ruth 1:16 — *And Ruth said, Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy Elohim (God) my Elohim (God):* As Ruth the Moabitess cast her lot with Israel''s people and Israel''s Elohim, so Achior in Judith 14:10 makes the stranger''s covenant confession his own.'),
  -- thread: judith-14-host-routed
  ('apocrypha', 'judith', 14, 3, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The Assyrians who run to the tent only to find death and flee in Judith 14:3 reprise Sennacherib''s host, struck and scattered by Yahuah''s hand alone.'),
  ('apocrypha', 'judith', 14, 3, 'canon', 'exodus', 14, 24, 'free', E'Exodus 14:24 — *And it came to pass, that in the morning watch Yahuah (LORD) looked unto the host of the Egyptians through the pillar of fire and of the cloud, and troubled the host of the Egyptians,* The morning panic that falls on the Assyrians in Judith 14:3 is the same morning-watch terror Yahuah loosed upon the host that pursued His people.'),
  ('apocrypha', 'judith', 14, 4, 'canon', 'exodus', 14, 25, 'free', E'Exodus 14:25 — *And took off their chariot wheels, that they drave them heavily: so that the Egyptians said, Let us flee from the face of Yashar''el (Israel); for Yahuah (LORD) fighteth for them against the Egyptians.* Israel pursuing and overthrowing the fleeing host in Judith 14:4 is Yahuah fighting for them, as the Egyptians confessed when they fled the face of Israel.'),
  -- thread: judith-14-womans-hand
  ('apocrypha', 'judith', 14, 18, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The headless tyrant shamed by one woman of the Hebrews in Judith 14:18 echoes the enmity by which the woman''s seed bruises the head of the serpent''s kingdom.'),
  ('apocrypha', 'judith', 14, 18, 'canon', 'judges', 4, 21, 'free', E'Judges 4:21 — *Then Jael Heber’s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* Holofernes lying headless on the ground in Judith 14:18 is Sisera in Jael''s tent, the enemy captain slain by a woman''s hand.'),
  ('apocrypha', 'judith', 14, 18, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* The shame brought on Nabuchodonosor''s house by one woman in Judith 14:18 fulfills the same word: Yahuah sells the proud captain into the hand of a woman.'),
  -- thread: judith-14-blessed-among-women
  ('apocrypha', 'judith', 14, 7, 'canon', 'luke', 1, 42, 'free', E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* Achior''s loud blessing of Judith in all the tabernacles of Juda in Judith 14:7 is the same benediction Elisabeth lifts over the lowly woman of Israel.'),
  ('apocrypha', 'judith', 14, 7, 'canon', 'luke', 1, 51, 'free', E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The astonishment of all nations at Judith''s name in Judith 14:7 belongs to the Magnificat''s theme: Yahuah scatters the proud and exalts His weak ones.'),
  ('apocrypha', 'judith', 14, 9, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The people''s joyful shout in their city in Judith 14:9 rejoices over the very reversal Mary sings — the mighty cast down, the lowly raised up.'),
  -- thread: judith-14-no-gods-deliver
  ('apocrypha', 'judith', 14, 5, 'canon', '2-kings', 19, 18, 'free', E'2 Kings 19:18 — *And have cast their gods into the fire: for they were no gods, but the work of men’s hands, wood and stone: therefore they have destroyed them.* Holofernes, who despised the house of Israel in Judith 14:5, is the same Assyrian conceit that counts Yahuah among the burned idols of conquered nations.'),
  ('apocrypha', 'judith', 14, 5, 'canon', '2-kings', 19, 19, 'free', E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* The deliverance from the tyrant who despised Israel in Judith 14:5 vindicates Hezekiah''s plea that Yahuah alone be known God over all the kingdoms of earth.'),
  ('apocrypha', 'judith', 14, 5, 'canon', '2-kings', 19, 21, 'free', E'2 Kings 19:21 — *This is the word that Yahuah (LORD) hath spoken concerning him; The virgin the daughter of Zion hath despised thee, and laughed thee to scorn; the daughter of Jerusalem hath shaken her head at thee.* The one who sent Achior to his death for despising Israel in Judith 14:5 is himself scorned, as Zion''s daughter laughs the Assyrian boaster to scorn.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-stranger-joined',
       E'Achior Believes and Is Joined to Israel',
       E'When Achior the Ammonite sees the head of Holofernes and hears all that Yahuah of Yashar''el had done, he believes and is brought into the covenant: *And when Achior had seen all that Yahuah (God) of Yashar''el (Israel) had done, he believed in Yahuah (God) greatly, and circumcised the flesh of his foreskin, and was joined to the house of Yashar''el (Israel) to this day.* (Judith 14:10). This is no church replacing Israel but a stranger grafted into the one covenant on the Torah''s own terms — *And when a stranger shall sojourn with thee, and will keep the passover to Yahuah (LORD), let all his males be circumcised, and then let him come near and keep it; and he shall be as one that is born in the land: for no uncircumcised person shall eat thereof.* (Exodus 12:48), under *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you.* (Exodus 12:49). It is the very thing the prophets foretold — *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD), to be his servants, every one that keepeth the sabbath from polluting it, and taketh hold of my covenant;* (Isaiah 56:6). Achior speaks Ruth''s confession with his life: *Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy Elohim (God) my Elohim (God):* (Ruth 1:16). It ain''t new: the foreigner who sees what Yahuah has done and joins himself is the same witness from Sinai to Zion.',
       sv.verse_id, ev.verse_id, 'extras', 60325
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-host-routed',
       E'The Assyrian Camp Routed When the Captain Is Found Dead',
       E'Judith bids the men hang the head on the wall and sally out, that the Assyrians may rush to rouse their lord and find him slain: *Then they shall take their armour, and shall go into their camp, and raise up the captains of the army of Assur, and shall run to the tent of Holofernes, but shall not find him: then fear shall fall upon them, and they shall flee before your face.* (Judith 14:3). This is the LORD''s own pattern of routing the Assyrian host in a night — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* (2 Kings 19:35). It is the Red Sea undoing of the pursuer — *And it came to pass, that in the morning watch Yahuah (LORD) looked unto the host of the Egyptians through the pillar of fire and of the cloud, and troubled the host of the Egyptians,* (Exodus 14:24), so that *the Egyptians said, Let us flee from the face of Yashar''el (Israel); for Yahuah (LORD) fighteth for them against the Egyptians.* (Exodus 14:25). The deliverance is Yahuah''s by election, not Israel''s by arms.',
       sv.verse_id, ev.verse_id, 'extras', 60328
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-womans-hand',
       E'Shame by the Hand of a Woman',
       E'Bagoas runs out and cries the disgrace of the kingdom of man: *These slaves have dealt treacherously; one woman of the Hebrews has brought shame upon the house of king Nabuchodonosor: for, behold, Holofernes lieth upon the ground without a head.* (Judith 14:18). The tyrant who demanded worship is undone not by an army but by a woman''s hand — the ancient sentence on the serpent — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). It is Jael over Sisera, the captain delivered into a woman''s hand — *Then Jael Heber’s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* (Judges 4:21) — for Deborah had said *Yahuah (LORD) shall sell Sisera into the hand of a woman.* (Judges 4:9). The weak confound the mighty; the bruised head is the kingdom-of-man''s, not the Messiah''s allegory forced onto Judith.',
       sv.verse_id, ev.verse_id, 'extras', 60331
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-blessed-among-women',
       E'Blessed Art Thou Among Women',
       E'Achior falls at Judith''s feet and blesses her: *Blessed art you in all the tabernacles of Juda, and in all nations, which hearing your name shall be astonished.* (Judith 14:7), and the people shout for joy: *And when she had left off speaking, the people shouted with a loud voice, and made a joyful noise in their city.* (Judith 14:9). The blessing of the lowly woman by whom the proud are cast down sings forward into the Magnificat — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* (Luke 1:42) — and into Mary''s song of the kingdom-of-man overturned: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* (Luke 1:51), *He hath put down the mighty from their seats, and exalted them of low degree.* (Luke 1:52). The pattern is one: the haughty tyrant brought low, the humble of Israel lifted up, and the name of the deliverer blessed among the nations.',
       sv.verse_id, ev.verse_id, 'extras', 60334
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-14-no-gods-deliver',
       E'The Tyrant Who Reproached the House of Israel',
       E'Judith names the offence that called for judgment: *call me Achior the Ammonite, that he may see and know him that despised the house of Yashar''el (Israel), and that sent him to us as it were to his death.* (Judith 14:5). Holofernes serving Nebuchadnezzar is the kingdom-of-man tyrant who reproaches the living Elohim and reckons Israel''s God no different from the idols he has burned — *And have cast their gods into the fire: for they were no gods, but the work of men’s hands, wood and stone: therefore they have destroyed them.* (2 Kings 19:18) — but Hezekiah''s prayer is Israel''s true weapon: *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* (2 Kings 19:19). The despiser of the house of Israel is answered as every Assyrian boast is answered — *The virgin the daughter of Zion hath despised thee, and laughed thee to scorn; the daughter of Jerusalem hath shaken her head at thee.* (2 Kings 19:21). Dismantle the system; the living Elohim alone reigns.',
       sv.verse_id, ev.verse_id, 'extras', 60337
  FROM _session253_jdt14_lookup sv, _session253_jdt14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=14 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-14-stranger-joined
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:48 — *And when a stranger shall sojourn with thee, and will keep the passover to Yahuah (LORD), let all his males be circumcised, and then let him come near and keep it; and he shall be as one that is born in the land: for no uncircumcised person shall eat thereof.* Achior''s circumcision and joining to the house of Israel in Judith 14:10 is exactly the Torah''s door for the sojourner into the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-stranger-joined'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:49 — *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you.* The Ammonite joined to Israel in Judith 14:10 stands under the one law that knows no second tier for the grafted-in.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-stranger-joined'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 56:6 — *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD), to be his servants, every one that keepeth the sabbath from polluting it, and taketh hold of my covenant;* Achior believing greatly and joining the house of Israel in Judith 14:10 is the foreigner Isaiah says Yahuah will bring to His holy mountain.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-stranger-joined'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ruth 1:16 — *And Ruth said, Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy Elohim (God) my Elohim (God):* As Ruth the Moabitess cast her lot with Israel''s people and Israel''s Elohim, so Achior in Judith 14:10 makes the stranger''s covenant confession his own.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-stranger-joined'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-14-host-routed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The Assyrians who run to the tent only to find death and flee in Judith 14:3 reprise Sennacherib''s host, struck and scattered by Yahuah''s hand alone.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-host-routed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:24 — *And it came to pass, that in the morning watch Yahuah (LORD) looked unto the host of the Egyptians through the pillar of fire and of the cloud, and troubled the host of the Egyptians,* The morning panic that falls on the Assyrians in Judith 14:3 is the same morning-watch terror Yahuah loosed upon the host that pursued His people.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-host-routed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:25 — *And took off their chariot wheels, that they drave them heavily: so that the Egyptians said, Let us flee from the face of Yashar''el (Israel); for Yahuah (LORD) fighteth for them against the Egyptians.* Israel pursuing and overthrowing the fleeing host in Judith 14:4 is Yahuah fighting for them, as the Egyptians confessed when they fled the face of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-host-routed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-14-womans-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The headless tyrant shamed by one woman of the Hebrews in Judith 14:18 echoes the enmity by which the woman''s seed bruises the head of the serpent''s kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:21 — *Then Jael Heber’s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* Holofernes lying headless on the ground in Judith 14:18 is Sisera in Jael''s tent, the enemy captain slain by a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* The shame brought on Nabuchodonosor''s house by one woman in Judith 14:18 fulfills the same word: Yahuah sells the proud captain into the hand of a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-14-blessed-among-women
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* Achior''s loud blessing of Judith in all the tabernacles of Juda in Judith 14:7 is the same benediction Elisabeth lifts over the lowly woman of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-blessed-among-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The astonishment of all nations at Judith''s name in Judith 14:7 belongs to the Magnificat''s theme: Yahuah scatters the proud and exalts His weak ones.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-blessed-among-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The people''s joyful shout in their city in Judith 14:9 rejoices over the very reversal Mary sings — the mighty cast down, the lowly raised up.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-blessed-among-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-14-no-gods-deliver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:18 — *And have cast their gods into the fire: for they were no gods, but the work of men’s hands, wood and stone: therefore they have destroyed them.* Holofernes, who despised the house of Israel in Judith 14:5, is the same Assyrian conceit that counts Yahuah among the burned idols of conquered nations.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-no-gods-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* The deliverance from the tyrant who despised Israel in Judith 14:5 vindicates Hezekiah''s plea that Yahuah alone be known God over all the kingdoms of earth.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-no-gods-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 19:21 — *This is the word that Yahuah (LORD) hath spoken concerning him; The virgin the daughter of Zion hath despised thee, and laughed thee to scorn; the daughter of Jerusalem hath shaken her head at thee.* The one who sent Achior to his death for despising Israel in Judith 14:5 is himself scorned, as Zion''s daughter laughs the Assyrian boaster to scorn.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt14_lookup sv, _session253_jdt14_lookup tv
 WHERE t.slug='judith-14-no-gods-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_15.sql (session253 judith 15) -----
-- Source anchor: apocrypha/judith ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt15 (view _session253_jdt15_lookup). Sort band base 60350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-15-the-enemy-flees
  ('apocrypha', 'judith', 15, 2, 'canon', 'exodus', 15, 16, 'free', E'Exodus 15:16 — *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD), till the people pass over, which thou hast purchased.* The same supernatural dread that paralyzed Egypt and Canaan now scatters Assur, so that no man durst abide in his neighbour''s sight (Judith 15:2).'),
  ('apocrypha', 'judith', 15, 1, 'canon', 'exodus', 14, 13, 'free', E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* The astonishment in the tents is Israel beholding a salvation it did not fight for, the enemy seen no more (Judith 15:1).'),
  -- thread: judith-15-israel-pursues-and-spoils
  ('apocrypha', 'judith', 15, 7, 'canon', 'exodus', 15, 9, 'free', E'Exodus 15:9 — *The enemy said, I will pursue, I will overtake, I will divide the spoil; my lust shall be satisfied upon them; I will draw my sword, my hand shall destroy them.* The tyrant who meant to spoil Israel is spoiled instead, the great multitude''s goods falling to the villages that had been besieged (Judith 15:7).'),
  ('apocrypha', 'judith', 15, 5, 'canon', 'judges', 4, 23, 'free', E'Judges 4:23 — *So Elohim (God) subdued on that day Jabin the king of Canaan before the children of Yashar''el (Israel).* As Yahuah subdued Canaan''s king after a woman drove the nail, so He breaks Assur before Israel after a woman takes the head (Judith 15:5).'),
  -- thread: judith-15-blessed-of-the-almighty
  ('apocrypha', 'judith', 15, 9, 'canon', 'luke', 1, 42, 'free', E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* Elisabeth''s cry over Mary unfolds the elders'' acclamation of Judith as Jerusalem''s exaltation and Israel''s glory (Judith 15:9).'),
  ('apocrypha', 'judith', 15, 10, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The Magnificat names the very reversal the elders bless in Judith, the Almighty pleased to overthrow the mighty by a lowly hand (Judith 15:10).'),
  ('apocrypha', 'judith', 15, 10, 'apocrypha', 'judith', 13, 18, 'extras', E'Judith 13:18 — *Then said Ozias to her, O daughter, blessed art you of the most high Yahuah (God) above all the women upon the earth; and blessed be Yahuah (God), which has created the heavens and the earth, which has directed you to the cutting off of the head of the chief of our enemies.* The blessing first spoken in the gate is now ratified by priest and people, blessed of the Almighty for evermore (Judith 15:10).'),
  -- thread: judith-15-the-women-dance
  ('apocrypha', 'judith', 15, 13, 'canon', 'exodus', 15, 20, 'free', E'Exodus 15:20 — *And Miriam the prophetess, the sister of Aaron, took a timbrel in her hand; and all the women went out after her with timbrels and with dances.* As Miriam led the women in dance after the Sea, so Judith leads the women of Israel in the dance after Assur is broken (Judith 15:13).'),
  ('apocrypha', 'judith', 15, 12, 'canon', '1-samuel', 18, 6, 'free', E'1 Samuel 18:6 — *And it came to pass as they came, when David was returned from the slaughter of the Philistine, that the women came out of all cities of Yashar''el (Israel), singing and dancing, to meet king Saul, with tabrets, with joy, and with instruments of musick.* The women running together with dance to honor the one who slew the enemy''s champion is the same answering-song that hails Judith (Judith 15:12).'),
  -- thread: judith-15-by-the-hand-of-a-woman
  ('apocrypha', 'judith', 15, 10, 'canon', 'judges', 5, 24, 'free', E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Deborah''s song over Jael, who felled the captain by her hand, is the very pattern of Israel blessing Judith for what her hand wrought (Judith 15:10).'),
  ('apocrypha', 'judith', 15, 10, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The ancient enmity in which the head of the enemy is bruised through the woman echoes in Israel''s praise of a deliverance wrought by a woman''s hand (Judith 15:10).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-the-enemy-flees',
       E'Fear fell upon them, and they fled',
       E'When the head of the tyrant was lifted up, the kingdom-of-man collapsed without a battle: *And fear and trembling fell upon them, so that there was no man that durst abide in the sight of his neighbour, but rushing out all together, they fled into every way of the plain, and of the hill country* (Judith 15:2). The host of Assur that had demanded Nebuchadnezzar be worshipped as god melts the instant Yahuah strikes its head — the proud system dismantled by His hand, not Israel''s sword. It ain''t new: the same dread fell at the Sea, *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD)* (Exodus 15:16), and Israel was told only to *stand still, and see the salvation of Yahuah (LORD)* (Exodus 14:13). The weak confound the mighty; the deliverance is His.',
       sv.verse_id, ev.verse_id, 'extras', 60350
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-israel-pursues-and-spoils',
       E'Israel pursued, and the spoil was very great',
       E'Once the head was struck, every warrior poured out: *Then the children of Yashar''el (Israel), every one that was a warrior among them, rushed out upon them* (Judith 15:3), chasing them *with a great slaughter, until they were past Damascus* (Judith 15:5), and *the villages and the cities... got many spoils: for the multitude was very great* (Judith 15:7). The pattern is the rout at the Sea, where the boasting enemy who said *I will pursue, I will overtake, I will divide the spoil* (Exodus 15:9) is himself overthrown, and the plundered are made the plunderers — the proud put down, the low estate enriched.',
       sv.verse_id, ev.verse_id, 'extras', 60353
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-blessed-of-the-almighty',
       E'Blessed be thou of the Almighty for evermore',
       E'The high priest and the elders came down from Jerusalem to bless her: *blessed be you of the Almighty Yahuah (God) for evermore. And all the people said, So be it* (Judith 15:10), naming her *the exaltation of Jerusalem... the great glory of Yashar''el (Israel)* (Judith 15:9). It ain''t new — the elders only echo the blessing already spoken over her in the gate: *blessed art you of the most high Yahuah (God) above all the women upon the earth* (Judith 13:18). And the words reach forward to another lowly woman who carried the Deliverer, greeted *Blessed art thou among women, and blessed is the fruit of thy womb* (Luke 1:42), whose song magnifies the One who *hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). The woman blessed, the tyrant cast down.',
       sv.verse_id, ev.verse_id, 'extras', 60356
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-the-women-dance',
       E'The women ran together and made a dance',
       E'The victory becomes a song led by a woman: *Then all the women of Yashar''el (Israel) ran together to see her, and blessed her, and made a dance among them for her: and she took branches in her hand* (Judith 15:12), and she *went before all the people in the dance, leading all the women* (Judith 15:13). This is the oldest shape of Israel''s deliverance-praise. After the Sea, *Miriam the prophetess, the sister of Aaron, took a timbrel in her hand; and all the women went out after her with timbrels and with dances* (Exodus 15:20); after the slaughter of the Philistine, *the women came out of all cities of Yashar''el (Israel), singing and dancing, to meet king Saul, with tabrets, with joy* (1 Samuel 18:6). The hand of Yahuah delivered, and the daughters of Israel sing it.',
       sv.verse_id, ev.verse_id, 'extras', 60359
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-by-the-hand-of-a-woman',
       E'Thou hast done all these things by thine hand',
       E'The elders trace the whole deliverance to a single hand: *You have done all these things by yours hand: you have done much good to Yashar''el (Israel), and Yahuah (God) is pleased with it* (Judith 15:10). Yet it is Yahuah''s hand that worked through hers, the weak confounding the mighty. It ain''t new: another woman in a tent took *a nail of the tent, and... an hammer in her hand* and smote the captain (Judges 4:21), so that the song could declare her *Blessed above women shall Jael the wife of Heber the Kenite be* (Judges 5:24). From Eden the promise stood that the bruising of the serpent''s head would come *between thy seed and her seed; it shall bruise thy head* (Genesis 3:15) — the woman''s hand against the head of the enemy, honestly foreshadowing, never replacing, the Seed Himself.',
       sv.verse_id, ev.verse_id, 'extras', 60362
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-15-the-enemy-flees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:16 — *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD), till the people pass over, which thou hast purchased.* The same supernatural dread that paralyzed Egypt and Canaan now scatters Assur, so that no man durst abide in his neighbour''s sight (Judith 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-the-enemy-flees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* The astonishment in the tents is Israel beholding a salvation it did not fight for, the enemy seen no more (Judith 15:1).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-the-enemy-flees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-15-israel-pursues-and-spoils
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:9 — *The enemy said, I will pursue, I will overtake, I will divide the spoil; my lust shall be satisfied upon them; I will draw my sword, my hand shall destroy them.* The tyrant who meant to spoil Israel is spoiled instead, the great multitude''s goods falling to the villages that had been besieged (Judith 15:7).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-israel-pursues-and-spoils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:23 — *So Elohim (God) subdued on that day Jabin the king of Canaan before the children of Yashar''el (Israel).* As Yahuah subdued Canaan''s king after a woman drove the nail, so He breaks Assur before Israel after a woman takes the head (Judith 15:5).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-israel-pursues-and-spoils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-15-blessed-of-the-almighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* Elisabeth''s cry over Mary unfolds the elders'' acclamation of Judith as Jerusalem''s exaltation and Israel''s glory (Judith 15:9).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-blessed-of-the-almighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The Magnificat names the very reversal the elders bless in Judith, the Almighty pleased to overthrow the mighty by a lowly hand (Judith 15:10).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-blessed-of-the-almighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judith 13:18 — *Then said Ozias to her, O daughter, blessed art you of the most high Yahuah (God) above all the women upon the earth; and blessed be Yahuah (God), which has created the heavens and the earth, which has directed you to the cutting off of the head of the chief of our enemies.* The blessing first spoken in the gate is now ratified by priest and people, blessed of the Almighty for evermore (Judith 15:10).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-blessed-of-the-almighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-15-the-women-dance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:20 — *And Miriam the prophetess, the sister of Aaron, took a timbrel in her hand; and all the women went out after her with timbrels and with dances.* As Miriam led the women in dance after the Sea, so Judith leads the women of Israel in the dance after Assur is broken (Judith 15:13).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-the-women-dance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 18:6 — *And it came to pass as they came, when David was returned from the slaughter of the Philistine, that the women came out of all cities of Yashar''el (Israel), singing and dancing, to meet king Saul, with tabrets, with joy, and with instruments of musick.* The women running together with dance to honor the one who slew the enemy''s champion is the same answering-song that hails Judith (Judith 15:12).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-the-women-dance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-15-by-the-hand-of-a-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Deborah''s song over Jael, who felled the captain by her hand, is the very pattern of Israel blessing Judith for what her hand wrought (Judith 15:10).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-by-the-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The ancient enmity in which the head of the enemy is bruised through the woman echoes in Israel''s praise of a deliverance wrought by a woman''s hand (Judith 15:10).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-by-the-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_judith_16.sql (session253 judith 16) -----
-- Source anchor: apocrypha/judith ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt16 (view _session253_jdt16_lookup). Sort band base 60375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-16-breaketh-the-battles
  ('apocrypha', 'judith', 16, 1, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Judith''s whole nation sings after her exactly as Israel sang after Moses at the Red Sea — the same redeemed-people chorus.'),
  ('apocrypha', 'judith', 16, 3, 'canon', 'exodus', 15, 3, 'free', E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* The One who ''breaks the battles'' in Judith 16:3 is the very Man of War who threw Pharaoh''s host into the sea.'),
  ('apocrypha', 'judith', 16, 1, 'canon', 'judges', 5, 1, 'free', E'Judges 5:1 — *Then sang Deborah and Barak the son of Abinoam on that day, saying,* Judith 16''s woman-led thanksgiving stands in the line of Deborah''s song after another tyrant''s army was undone.'),
  ('apocrypha', 'judith', 16, 3, 'canon', 'psalms', 46, 9, 'free', E'Psalm 46:9 — *He maketh wars to cease unto the end of the earth; he breaketh the bow, and cutteth the spear in sunder; he burneth the chariot in the fire.* The Psalm names the same Battle-Breaker Judith praises for delivering her out of the hand of the persecutor.'),
  -- thread: judith-16-assur-out-of-the-north
  ('apocrypha', 'judith', 16, 4, 'canon', 'isaiah', 10, 5, 'free', E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* Assur in Judith 16:4 is the same proud northern instrument that boasts as if it were not a mere rod in Yahuah''s hand.'),
  ('apocrypha', 'judith', 16, 5, 'canon', 'psalms', 137, 9, 'free', E'Psalm 137:9 — *Happy shall he be, that taketh and dasheth thy little ones against the stones.* Holofernes'' brag to dash the sucking children (Judith 16:5) is exactly the cruelty the Psalm pronounces back upon Babylon herself.'),
  -- thread: judith-16-hand-of-a-woman
  ('apocrypha', 'judith', 16, 6, 'canon', '1-corinthians', 1, 27, 'free', E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* Yahuah disappointing a vast army by the hand of one widow (Judith 16:6) is the very weak-confound-the-mighty principle Paul preaches.'),
  ('apocrypha', 'judith', 16, 7, 'canon', '1-samuel', 2, 4, 'free', E'1 Samuel 2:4 — *The bows of the mighty men are broken, and they that stumbled are girded with strength.* Hannah''s song already declared what Judith 16:7 enacts — the mighty one falls not by young warriors but by Yahuah''s reversal.'),
  ('apocrypha', 'judith', 16, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The tyrant felled ''by the hand of a woman'' (Judith 16:6) is an echo of Eden''s first promise that the head of the proud enemy is bruised through the woman.'),
  -- thread: judith-16-fauchion-through-the-neck
  ('apocrypha', 'judith', 16, 9, 'canon', 'judges', 5, 24, 'free', E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Jael smiting Sisera in the tent is the nearest kin to Judith 16:9, where the fauchion passes through the enemy''s neck by a woman''s hand.'),
  ('apocrypha', 'judith', 16, 11, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Judith''s afflicted shouting for joy while the boasters are overthrown (Judith 16:11) is the very reversal Mary sings in the Magnificat.'),
  ('apocrypha', 'judith', 16, 11, 'canon', 'luke', 1, 48, 'free', E'Luke 1:48 — *For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed.* The low and weak of Israel lifted up in Judith 16:11 foreshadow the low-estate handmaiden Yahuah regards in the Magnificat.'),
  -- thread: judith-16-let-all-creatures-serve
  ('apocrypha', 'judith', 16, 13, 'canon', 'psalms', 96, 1, 'free', E'Psalm 96:1 — *O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth.* Judith''s resolve to ''sing to Yahuah a new song'' (Judith 16:13) is the Psalter''s own summons to the whole earth to sing it.'),
  ('apocrypha', 'judith', 16, 14, 'canon', 'psalms', 148, 5, 'free', E'Psalm 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* Judith 16:14 (''you spakest, and they were made'') confesses the same creation-by-the-word for which Psalm 148 calls all creatures to praise.'),
  ('apocrypha', 'judith', 16, 17, 'canon', 'isaiah', 66, 24, 'free', E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* Judith''s ''fire and worms in their flesh'' for the nations that rise up (Judith 16:17) speaks Isaiah''s undying worm and unquenchable fire upon the transgressors.'),
  -- thread: judith-16-up-to-keep-the-feast
  ('apocrypha', 'judith', 16, 18, 'canon', 'deuteronomy', 16, 16, 'free', E'Deuteronomy 16:16 — *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty:* The people going up to worship at Jerusalem in Judith 16:18 keeps the very pilgrimage-feast Torah commands at the chosen place.'),
  ('apocrypha', 'judith', 16, 20, 'canon', 'deuteronomy', 16, 15, 'free', E'Deuteronomy 16:15 — *Seven days shalt thou keep a solemn feast unto Yahuah Elohayka (the LORD thy God) in the place which Yahuah (LORD) shall choose: because Yahuah Elohayka (the LORD thy God) shall bless thee in all thine increase, and in all the works of thine hands, therefore thou shalt surely rejoice.* The people''s joyful feasting before the sanctuary in Judith 16:20 is the appointed solemn feast of rejoicing Torah set at the chosen place.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-breaketh-the-battles',
       E'Yahuah breaketh the battles — the song of the delivered',
       E'Judith lifts the same victory-song her mothers and fathers sang at the sea and at Kishon: *And Judith said, Begin to my Elohim (God) with timbrels, sing to my Elohim (God) with cymbals: tune to him a new psalm: exalt him, and call upon his name. For Yahuah (God) breaks the battles: for among the camps in the midst of the people he has delivered me out of the hands of them that persecuted me.* (Judith 16:2-3) It ain''t new — it is Moses'' own song restored to a daughter''s mouth: *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD)... I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* (Exodus 15:1) The Warrior who breaks the battle is named there: *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* (Exodus 15:3) And it is Deborah''s song again, woman-led: *Then sang Deborah and Barak the son of Abinoam on that day, saying* (Judges 5:1). The deliverance is His, not the army''s: *He maketh wars to cease unto the end of the earth; he breaketh the bow, and cutteth the spear in sunder; he burneth the chariot in the fire.* (Psalm 46:9)',
       sv.verse_id, ev.verse_id, 'extras', 60375
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-assur-out-of-the-north',
       E'Assur out of the north — the kingdom-of-man tyrant',
       E'The boast of Holofernes is the boast of every empire that demands the earth bow to it: *Assur came out of the mountains from the north, he came with ten thousands of his army, the multitude of which stopped the torrents, and their horsemen have covered the hills. He bragged that he would burn up my borders, and kill my young men with the sword, and dash the sucking children against the ground, and make my infants as a prey, and my virgins as a spoil.* (Judith 16:4-5) This is the same northern menace the prophets indict — the rod that lifts itself against the One who wields it: *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* (Isaiah 10:5) Babylon makes the identical brag against the little ones, and the same vengeance answers: *Happy shall he be, that taketh and dasheth thy little ones against the stones.* (Psalm 137:9) The system that exalts itself is dismantled — the proud overthrown.',
       sv.verse_id, ev.verse_id, 'extras', 60378
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-hand-of-a-woman',
       E'By the hand of a woman — the weak confound the mighty',
       E'The decisive line of the whole book: *But the Almighty Yahuah (God) has disappointed them by the hand of a woman. For the mighty one did not fall by the young men, neither did the sons of the Titans smite him, nor high giants set upon him: but Judith the daughter of Merari weakened him with the beauty of her countenance.* (Judith 16:6-7) This is heaven''s settled pattern — not many mighty, but the weak chosen to shame the strong: *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* (1 Corinthians 1:27) Hannah sang it before her: *The bows of the mighty men are broken, and they that stumbled are girded with strength.* (1 Samuel 2:4) And the head taken by a woman''s hand reaches back to the first promise — the woman''s seed that bruises the head of the enemy: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) Honestly read: Judith is no Messiah, but her hand-of-a-woman victory echoes the Edenic word that the proud serpent-head falls.',
       sv.verse_id, ev.verse_id, 'extras', 60381
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-fauchion-through-the-neck',
       E'The fauchion through his neck — Jael and the Magnificat',
       E'The beauty that disarmed the giant and the blade that took his head: *Her sandals ravished his eyes, her beauty took his mind prisoner, and the fauchion passed through his neck.* (Judith 16:9) The afflicted are lifted while the boasters are cast down: *Then my afflicted shouted for joy, and my weak ones cried aloud; but they were astonished: these lifted up their voices, but they were overthrown.* (Judith 16:11) Jael is Judith''s elder sister in the song of the women — the captain undone in the tent by a woman''s hand: *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* (Judges 5:24) And the down-casting of the mighty is the very music Miryam (Mary) takes up, the Magnificat''s own ancestor: *He hath put down the mighty from their seats, and exalted them of low degree.* (Luke 1:52) The proud are scattered, the low estate regarded: *For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed.* (Luke 1:48)',
       sv.verse_id, ev.verse_id, 'extras', 60384
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-let-all-creatures-serve',
       E'Let all creatures serve thee — He spake, and they were made',
       E'The song turns to a new psalm of the whole creation''s obedience to its Maker: *I will sing to Yahuah (God) a new song: O Yahuah (God), you are great and glorious, wonderful in strength, and invincible. Let all creatures serve you: for you spakest, and they were made, you did send forth your spirit, and it created them, and there is none that can resist your voice.* (Judith 16:13-14) It ain''t new — it is the new song of the Psalter: *O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth.* (Psalm 96:1) And the creation-by-the-word the Psalm of praise declares: *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* (Psalm 148:5) Yet the same song carries the dread end of those who transgress — fire and the worm that dieth not: *Woe to the nations that rise up against my kindred! Yahuah (God) Almighty will take vengeance of them in the day of judgment, in putting fire and worms in their flesh; and they shall feel them, and weep for ever.* (Judith 16:17) — which Isaiah seals as the abhorring of all flesh: *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* (Isaiah 66:24)',
       sv.verse_id, ev.verse_id, 'extras', 60387
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-16-up-to-keep-the-feast',
       E'Up to Jerusalem to keep the feast — the appointed times',
       E'Victory ends not in conquest but in worship — the people go up to the sanctuary: *Now as soon as they entered into Jerusalem, they worshipped Yahuah (God); and as soon as the people were purified, they offered their burnt offerings, and their free offerings, and their gifts.* (Judith 16:18) *So the people continued feasting in Jerusalem before the sanctuary for the space of three months and Judith remained with them.* (Judith 16:20) This is Torah''s appointed rhythm — all Israel gathering at the chosen place to keep the feast: *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty:* (Deuteronomy 16:16) — and none come empty, as Judith herself dedicates the spoil and the canopy as a gift to Yahuah (Judith 16:19), keeping the solemn feast at the place He chose: *Seven days shalt thou keep a solemn feast unto Yahuah Elohayka (the LORD thy God) in the place which Yahuah (LORD) shall choose... therefore thou shalt surely rejoice.* (Deuteronomy 16:15)',
       sv.verse_id, ev.verse_id, 'extras', 60390
  FROM _session253_jdt16_lookup sv, _session253_jdt16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=16 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-16-breaketh-the-battles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Judith''s whole nation sings after her exactly as Israel sang after Moses at the Red Sea — the same redeemed-people chorus.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-breaketh-the-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* The One who ''breaks the battles'' in Judith 16:3 is the very Man of War who threw Pharaoh''s host into the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-breaketh-the-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 5:1 — *Then sang Deborah and Barak the son of Abinoam on that day, saying,* Judith 16''s woman-led thanksgiving stands in the line of Deborah''s song after another tyrant''s army was undone.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-breaketh-the-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 46:9 — *He maketh wars to cease unto the end of the earth; he breaketh the bow, and cutteth the spear in sunder; he burneth the chariot in the fire.* The Psalm names the same Battle-Breaker Judith praises for delivering her out of the hand of the persecutor.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-breaketh-the-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-assur-out-of-the-north
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* Assur in Judith 16:4 is the same proud northern instrument that boasts as if it were not a mere rod in Yahuah''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-assur-out-of-the-north'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 137:9 — *Happy shall he be, that taketh and dasheth thy little ones against the stones.* Holofernes'' brag to dash the sucking children (Judith 16:5) is exactly the cruelty the Psalm pronounces back upon Babylon herself.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-assur-out-of-the-north'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-hand-of-a-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* Yahuah disappointing a vast army by the hand of one widow (Judith 16:6) is the very weak-confound-the-mighty principle Paul preaches.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 2:4 — *The bows of the mighty men are broken, and they that stumbled are girded with strength.* Hannah''s song already declared what Judith 16:7 enacts — the mighty one falls not by young warriors but by Yahuah''s reversal.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The tyrant felled ''by the hand of a woman'' (Judith 16:6) is an echo of Eden''s first promise that the head of the proud enemy is bruised through the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-fauchion-through-the-neck
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Jael smiting Sisera in the tent is the nearest kin to Judith 16:9, where the fauchion passes through the enemy''s neck by a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-fauchion-through-the-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Judith''s afflicted shouting for joy while the boasters are overthrown (Judith 16:11) is the very reversal Mary sings in the Magnificat.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-fauchion-through-the-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:48 — *For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed.* The low and weak of Israel lifted up in Judith 16:11 foreshadow the low-estate handmaiden Yahuah regards in the Magnificat.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-fauchion-through-the-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-let-all-creatures-serve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 96:1 — *O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth.* Judith''s resolve to ''sing to Yahuah a new song'' (Judith 16:13) is the Psalter''s own summons to the whole earth to sing it.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-let-all-creatures-serve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* Judith 16:14 (''you spakest, and they were made'') confesses the same creation-by-the-word for which Psalm 148 calls all creatures to praise.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-let-all-creatures-serve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* Judith''s ''fire and worms in their flesh'' for the nations that rise up (Judith 16:17) speaks Isaiah''s undying worm and unquenchable fire upon the transgressors.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-let-all-creatures-serve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-16-up-to-keep-the-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 16:16 — *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty:* The people going up to worship at Jerusalem in Judith 16:18 keeps the very pilgrimage-feast Torah commands at the chosen place.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-up-to-keep-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 16:15 — *Seven days shalt thou keep a solemn feast unto Yahuah Elohayka (the LORD thy God) in the place which Yahuah (LORD) shall choose: because Yahuah Elohayka (the LORD thy God) shall bless thee in all thine increase, and in all the works of thine hands, therefore thou shalt surely rejoice.* The people''s joyful feasting before the sanctuary in Judith 16:20 is the appointed solemn feast of rejoicing Torah set at the chosen place.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt16_lookup sv, _session253_jdt16_lookup tv
 WHERE t.slug='judith-16-up-to-keep-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — Judith cross-references complete.'
