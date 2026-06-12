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

