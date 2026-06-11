-- ----- fragment: minion_jasher_39.sql (session252 jasher 39) -----
-- Source anchor: jasher/jasher ch39. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja39 (view _session252_ja39_lookup). Sort band base 55950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-39-amorite-portion-sword-and-bow
  ('jasher', 'jasher', 39, 13, 'canon', 'genesis', 48, 22, 'free', E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* Jacob''s lone canonical line about taking land from the Amorite is the whole campaign Jasher 39 narrates city by city.'),
  ('jasher', 'jasher', 39, 15, 'canon', 'genesis', 15, 16, 'free', E'Genesis 15:16 — *But in the fourth generation they shall come hither again: for the iniquity of the Amorites is not yet full.* The Amorites of Gaash whom the sons of Jacob smite are the same people whose iniquity Yahuah told Abram would one day be full.'),
  -- thread: jasher-39-jubilees-seven-kings-of-the-amorites
  ('jasher', 'jasher', 39, 14, 'jubilees', 'jubilees', 34, 2, 'extras', E'Jubilees 34:2 — *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey.* Jubilees compresses into one verse the gathering of the Amorite cities that Jasher 39 unfolds at Tapnach, Arbelan and Gaash.'),
  ('jasher', 'jasher', 39, 15, 'jubilees', 'jubilees', 34, 4, 'extras', E'Jubilees 34:4 — *And there came the kings of Tâphû, and the kings of ’Arêsa, and the kings of Sêragân, and the kings of Sêlô, and the kings of Gâ’as, and the king of Bêthôrôn, and the king of Ma’anîsâkîr, and all those who dwell in these mountains (and) who dwell in the woods in the land of Canaan.* Tâphû, Gâ’as and Sêlô are Jasher''s Tapnach, Gaash and Shiloh — the same Amorite kings, named in both books.'),
  ('jasher', 'jasher', 39, 16, 'jubilees', 'jubilees', 34, 8, 'extras', E'Jubilees 34:8 — *And he prevailed over them, and imposed tribute on them that they should pay him tribute, five fruit products of their land, and he built Rôbêl and Tamnâtârês.* The victory and tribute Jubilees records is the same conquest Jasher 39 wins city by fortified city.'),
  -- thread: jasher-39-judah-the-lion-on-the-wall
  ('jasher', 'jasher', 39, 19, 'canon', 'genesis', 49, 9, 'free', E'Genesis 49:9 — *Yahudah (Judah) is a lion’s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* Judah''s roar that topples men from the wall of Gaash is the lion''s whelp Jacob''s blessing names.'),
  ('jasher', 'jasher', 39, 34, 'canon', 'genesis', 49, 8, 'free', E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father’s children shall bow down before thee.* Judah seizing the fallen swords and slaying twenty upon the wall is the hand-on-the-enemies''-neck the blessing foretells.'),
  -- thread: jasher-39-simeon-levi-instruments-of-war
  ('jasher', 'jasher', 39, 63, 'canon', 'genesis', 49, 5, 'free', E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* The two brothers whose swords together cleave the mighty man of Gaash are the sword-brothers Jacob names as one pair.'),
  ('jasher', 'jasher', 39, 59, 'canon', 'genesis', 49, 6, 'free', E'Genesis 49:6 — *O my soul, come not thou into their secret; unto their assembly, mine honour, be not thou united: for in their anger they slew a man, and in their selfwill they digged down a wall.* Simeon and Levi felling the powerful man with the sword is the very anger and wall-breaking Jacob''s blessing recalls.'),
  ('jasher', 'jasher', 39, 49, 'canon', 'genesis', 34, 25, 'free', E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The zeal that took Shechem at the start is the same Simeon-and-Levi fury that scales and storms the cities of Jasher 39.'),
  -- thread: jasher-39-cry-to-yahuah-saved-by-his-arm
  ('jasher', 'jasher', 39, 10, 'canon', 'psalms', 44, 3, 'free', E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* The sons of Jacob nearly perish until they cry to Yahuah and gain strength — not their own arm, but His, exactly as the psalm confesses.'),
  ('jasher', 'jasher', 39, 32, 'canon', 'psalms', 44, 6, 'free', E'Psalm 44:6 — *For I will not trust in my bow, neither shall my sword save me.* Judah''s drawn sword falls from his hand on the wall and he cries to Yahuah to deliver — the bow does not save, the Name does.'),
  ('jasher', 'jasher', 39, 36, 'canon', '2-samuel', 1, 18, 'free', E'2 Samuel 1:18 — *(Also he bade them teach the children of Yahudah (Judah) the use of the bow: behold, it is written in the book of Jasher.)* The very bow Jacob and his sons draw from beneath the wall of Gaash is the bow-craft the canon points to this book to record.'),
  -- thread: jasher-39-dan-and-naphtali-mount-the-wall
  ('jasher', 'jasher', 39, 41, 'canon', 'genesis', 49, 16, 'free', E'Genesis 49:16 — *Dan shall judge his people, as one of the tribes of Yashar''el (Israel).* Dan rising in wrath to mount the wall and defend Judah is the tribe that judges and contends for its people.'),
  ('jasher', 'jasher', 39, 48, 'canon', 'genesis', 49, 21, 'free', E'Genesis 49:21 — *Naphtali is a hind let loose: he giveth goodly words.* Naphtali leaping from the first wall to the second to reach his brothers is the swift hind set loose that Jacob''s blessing names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-39-amorite-portion-sword-and-bow',
       E'The land taken out of the hand of the Amorite — with sword and with bow',
       E'Jasher 39 is the long war of Jacob''s sons against the Amorite cities — Tapnach, Arbelan, and the triple-walled Gaash: *"And the sons of Jacob did to Machnaymah as they had done to Tapnach, to Chazar and to Shiloh, and they turned from there and went away"* (Jasher 39:13). The canon does not tell the campaign in full, but it carries the deed in a single line Jacob speaks to Joseph on his deathbed — *"Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow"* (Genesis 48:22). That one verse is the seed; Jasher is the field it grew into. The taking was not theft but the covenant clock running out on a people: *"But in the fourth generation they shall come hither again: for the iniquity of the Amorites is not yet full"* (Genesis 15:16). It ain''t new — the patriarchs already wielded the sword and bow Jacob would name.',
       sv.verse_id, ev.verse_id, 'extras', 55950
  FROM _session252_ja39_lookup sv, _session252_ja39_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=39 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-39-jubilees-seven-kings-of-the-amorites',
       E'The seven kings of the Amorites — Jubilees tells the same war',
       E'Jasher''s roll of besieged cities is no invention: Jubilees narrates the identical event, the assembling of the Amorite kings against Jacob''s house — *"And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey"* (Jubilees 34:2). The very city-names match across the two books — *"And there came the kings of Tâphû, and the kings of ’Arêsa, and the kings of Sêragân, and the kings of Sêlô, and the kings of Gâ’as, and the king of Bêthôrôn..."* (Jubilees 34:4): Tâphû is Jasher''s Tapnach, Gâ’as is Gaash, Sêlô is Shiloh, Bêthôrôn is Bethchorin (Jasher 39:51). And the outcome Jubilees gives is exactly Jasher''s spoil and conquest — *"And he prevailed over them, and imposed tribute on them that they should pay him tribute, five fruit products of their land"* (Jubilees 34:8). Two witnesses, one war — the canon''s hidden campaign, kept.',
       sv.verse_id, ev.verse_id, 'extras', 55953
  FROM _session252_ja39_lookup sv, _session252_ja39_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=39 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-39-judah-the-lion-on-the-wall',
       E'Judah''s shriek and the lion''s whelp',
       E'When Gaash held the gate and reviled Israel''s Elohim, Judah leaped the wall alone: *"And he ran at a distance with all his might, with his drawn sword in his hand, and he sprang from the earth and by dint of his strength, mounted the wall, and his sword fell from his hand"* (Jasher 39:29), and at his cry men fell from the wall — for the men of Gaash *"were terrified at the voice of Judah’s cry"* (Jasher 39:19). This is the lion the canon names: *"Yahudah (Judah) is a lion’s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?"* (Genesis 49:9), the brother whose hand is on the neck of his enemies — *"Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father’s children shall bow down before thee"* (Genesis 49:8). And it was zeal, not bravado: *"Judah was jealous of his Elohim (God) in this matter, and he called out and said, O Yahuah (O Lord), help, send help to us and our brothers"* (Jasher 39:28). The favored royal seed already walks here — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55956
  FROM _session252_ja39_lookup sv, _session252_ja39_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=39 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-39-simeon-levi-instruments-of-war',
       E'Simeon and Levi — the swords that divide a man in two',
       E'Through the whole siege the brothers fight in pairs, and twice it is Simeon and Levi whose two swords meet inside the body of a mighty man: *"And Simeon and Levi ran upon the powerful man with their swords and struck at him forcibly with their swords, and the two swords entered the body of the powerful man and divided it in two, length-wise"* (Jasher 39:63). The canon already knew these two as the brothers of the sword — Jacob''s blessing turns elegy into prophecy: *"Simeon and Levi are brethren; instruments of cruelty are in their habitations"* (Genesis 49:5), *"for in their anger they slew a man, and in their selfwill they digged down a wall"* (Genesis 49:6). The wall they digged down at Shechem in Genesis 34 is the same fierce zeal that mounts and breaches walls all through Jasher 39 — *"And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males"* (Genesis 34:25).',
       sv.verse_id, ev.verse_id, 'extras', 55959
  FROM _session252_ja39_lookup sv, _session252_ja39_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=59
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=39 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-39-cry-to-yahuah-saved-by-his-arm',
       E'They cried to Yahuah and gained strength — not their own bow',
       E'At Arbelan the brothers nearly perished until they turned to heaven: *"And the sons of Jacob could not prevail over them, and the sons of Jacob had almost perished in that battle, and the sons of Jacob cried to Yahuah (the Lord) and greatly gained strength toward evening"* (Jasher 39:10); and on the wall of Gaash Judah cried, *"O Yahuah (O Lord) help us, O Yahuah (O Lord) deliver us"* (Jasher 39:32), and Yahuah Himself fought — *"Yahuah (the Lord) impressed the fear of Judah in their hearts, that they were unable to approach him"* (Jasher 39:35). The psalmist will sing this exact theology of the conquest centuries on: *"For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them"* (Psalm 44:3), *"For I will not trust in my bow, neither shall my sword save me"* (Psalm 44:6). And the bow Jacob and his sons draw from under the wall (Jasher 39:32, 36) is the very thing the canon says is taught from this book — *"(Also he bade them teach the children of Yahudah (Judah) the use of the bow: behold, it is written in the book of Jasher.)"* (2 Samuel 1:18).',
       sv.verse_id, ev.verse_id, 'extras', 55962
  FROM _session252_ja39_lookup sv, _session252_ja39_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=39 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-39-dan-and-naphtali-mount-the-wall',
       E'Dan and Naphtali scale the wall — the tribes in their blessing',
       E'When Judah is beaten and bleeding on the wall, his brothers come up one by one in their own strength: *"And Dan came upon the wall near to Judah"* (Jasher 39:42) with *"his wrath-excited strength"* (Jasher 39:41), and then *"Naphtali leaped from the first wall to the second, and came to assist his brothers"* (Jasher 39:48). Each acts as the blessing of Jacob frames his tribe — Dan the judge who comes to defend — *"Dan shall judge his people, as one of the tribes of Yashar''el (Israel)"* (Genesis 49:16) — and Naphtali the swift hind, let loose to bound between the walls — *"Naphtali is a hind let loose: he giveth goodly words"* (Genesis 49:21). The twelve-tribe people is already forming and fighting as one body here, each son carrying the inheritance Jacob will speak over him.',
       sv.verse_id, ev.verse_id, 'extras', 55965
  FROM _session252_ja39_lookup sv, _session252_ja39_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=41
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=39 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-39-amorite-portion-sword-and-bow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* Jacob''s lone canonical line about taking land from the Amorite is the whole campaign Jasher 39 narrates city by city.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-amorite-portion-sword-and-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:16 — *But in the fourth generation they shall come hither again: for the iniquity of the Amorites is not yet full.* The Amorites of Gaash whom the sons of Jacob smite are the same people whose iniquity Yahuah told Abram would one day be full.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-amorite-portion-sword-and-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-39-jubilees-seven-kings-of-the-amorites
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 34:2 — *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey.* Jubilees compresses into one verse the gathering of the Amorite cities that Jasher 39 unfolds at Tapnach, Arbelan and Gaash.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-jubilees-seven-kings-of-the-amorites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 34:4 — *And there came the kings of Tâphû, and the kings of ’Arêsa, and the kings of Sêragân, and the kings of Sêlô, and the kings of Gâ’as, and the king of Bêthôrôn, and the king of Ma’anîsâkîr, and all those who dwell in these mountains (and) who dwell in the woods in the land of Canaan.* Tâphû, Gâ’as and Sêlô are Jasher''s Tapnach, Gaash and Shiloh — the same Amorite kings, named in both books.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-jubilees-seven-kings-of-the-amorites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 34:8 — *And he prevailed over them, and imposed tribute on them that they should pay him tribute, five fruit products of their land, and he built Rôbêl and Tamnâtârês.* The victory and tribute Jubilees records is the same conquest Jasher 39 wins city by fortified city.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-jubilees-seven-kings-of-the-amorites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-39-judah-the-lion-on-the-wall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:9 — *Yahudah (Judah) is a lion’s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* Judah''s roar that topples men from the wall of Gaash is the lion''s whelp Jacob''s blessing names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-judah-the-lion-on-the-wall'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father’s children shall bow down before thee.* Judah seizing the fallen swords and slaying twenty upon the wall is the hand-on-the-enemies''-neck the blessing foretells.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-judah-the-lion-on-the-wall'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-39-simeon-levi-instruments-of-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* The two brothers whose swords together cleave the mighty man of Gaash are the sword-brothers Jacob names as one pair.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-simeon-levi-instruments-of-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=63
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:6 — *O my soul, come not thou into their secret; unto their assembly, mine honour, be not thou united: for in their anger they slew a man, and in their selfwill they digged down a wall.* Simeon and Levi felling the powerful man with the sword is the very anger and wall-breaking Jacob''s blessing recalls.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-simeon-levi-instruments-of-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The zeal that took Shechem at the start is the same Simeon-and-Levi fury that scales and storms the cities of Jasher 39.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-simeon-levi-instruments-of-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-39-cry-to-yahuah-saved-by-his-arm
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* The sons of Jacob nearly perish until they cry to Yahuah and gain strength — not their own arm, but His, exactly as the psalm confesses.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-cry-to-yahuah-saved-by-his-arm'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 44:6 — *For I will not trust in my bow, neither shall my sword save me.* Judah''s drawn sword falls from his hand on the wall and he cries to Yahuah to deliver — the bow does not save, the Name does.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-cry-to-yahuah-saved-by-his-arm'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Samuel 1:18 — *(Also he bade them teach the children of Yahudah (Judah) the use of the bow: behold, it is written in the book of Jasher.)* The very bow Jacob and his sons draw from beneath the wall of Gaash is the bow-craft the canon points to this book to record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-cry-to-yahuah-saved-by-his-arm'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-39-dan-and-naphtali-mount-the-wall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:16 — *Dan shall judge his people, as one of the tribes of Yashar''el (Israel).* Dan rising in wrath to mount the wall and defend Judah is the tribe that judges and contends for its people.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-dan-and-naphtali-mount-the-wall'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:21 — *Naphtali is a hind let loose: he giveth goodly words.* Naphtali leaping from the first wall to the second to reach his brothers is the swift hind set loose that Jacob''s blessing names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja39_lookup sv, _session252_ja39_lookup tv
 WHERE t.slug='jasher-39-dan-and-naphtali-mount-the-wall'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=39 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

