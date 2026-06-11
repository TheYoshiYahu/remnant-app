-- ----- fragment: minion_jasher_11.sql (session252 jasher 11) -----
-- Source anchor: jasher/jasher ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja11 (view _session252_ja11_lookup). Sort band base 55250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-11-nimrod-babel-cities
  ('jasher', 'jasher', 11, 1, 'canon', 'genesis', 10, 8, 'free', E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* Jasher''s Nimrod reigning and building in Shinar is the same mighty one Genesis names — the kingdom-of-man founder.'),
  ('jasher', 'jasher', 11, 3, 'canon', 'genesis', 10, 10, 'free', E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Jasher names the same four cities (Babel, Erech, Eched, Calnah) after the tower''s fall, expanding the canon''s bare list.'),
  ('jasher', 'jasher', 11, 3, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Jasher names Babel for this confounding and dispersing — the cities are monuments to the judgment Genesis records.'),
  ('jasher', 'jasher', 11, 7, 'canon', 'romans', 1, 22, 'free', E'Romans 1:22 — *Professing themselves to be wise, they became fools,* — Nimrod teaching wickedness to the sons of men is Paul''s whole-earth idolatry diagnosis, the kingdom of man rebelling against its Maker.'),
  -- thread: jasher-11-war-of-kings
  ('jasher', 'jasher', 11, 11, 'canon', 'genesis', 14, 4, 'free', E'Genesis 14:4 — *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled.* Jasher''s twelve-year tax to Chedorlaomer is the exact servitude Genesis names, the seed of the war of kings that Abram will enter.'),
  -- thread: jasher-11-abram-elect-out-of-idolatry
  ('jasher', 'jasher', 11, 15, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Jasher''s Terah serving strange gods is the very idolatry Joshua names — the house Abram is called out of.'),
  ('jasher', 'jasher', 11, 14, 'canon', 'isaiah', 51, 2, 'free', E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* Abram knowing Yahuah amid idols is the elect seed Isaiah names — called alone, not a church, the covenant line kept and chosen.'),
  ('jasher', 'jasher', 11, 13, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* Stephen places Abram''s call in idolatrous Mesopotamia — exactly where Jasher has him come forth knowing Yahuah.'),
  ('jasher', 'jasher', 11, 14, 'jubilees', 'jubilees', 12, 17, 'extras', E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God).* Jubilees has the same Abram turning from the host of heaven to the Maker, the elect heart that Jasher shows knowing Yahuah.'),
  -- thread: jasher-11-idols-cannot-speak
  ('jasher', 'jasher', 11, 32, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* Abram''s cry that the idols have mouths without speech and eyes without sight is the Psalmist''s idol-polemic exactly.'),
  ('jasher', 'jasher', 11, 32, 'canon', 'psalms', 115, 6, 'free', E'Psalm 115:6 — *They have ears, but they hear not: noses have they, but they smell not:* Jasher''s ears without hearing and idols that can neither smell carries the same line of the Psalm''s rebuke.'),
  ('jasher', 'jasher', 11, 26, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The gods that cannot stretch a hand to eat are Isaiah''s blind, profitless graven images.'),
  ('jasher', 'jasher', 11, 32, 'canon', 'jeremiah', 10, 3, 'free', E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Abram''s idols of wood, like them are those that made them, is Jeremiah''s tree cut and shaped by the workman''s axe.'),
  -- thread: jasher-11-abram-breaks-the-idols
  ('jasher', 'jasher', 11, 43, 'canon', 'habakkuk', 2, 18, 'free', E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Abram asking what power is in idols that cannot deliver is Habakkuk''s exact charge against the dumb, profitless image.'),
  ('jasher', 'jasher', 11, 33, 'canon', 'jeremiah', 10, 14, 'free', E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* Abram breaking the breathless idols confounds the founder exactly as Jeremiah says — there is no breath in them.'),
  ('jasher', 'jasher', 11, 43, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Abram mocks idols that cannot hear prayer or deliver — the very cry Isaiah shows the maker raising to dead wood.'),
  ('jasher', 'jasher', 11, 33, 'jubilees', 'jubilees', 12, 12, 'extras', E'Jubilees 12:12 — *Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it.* Jubilees tells the same deed Jasher tells with the hatchet — the called seed destroying his father''s gods, a second witness to the legend.'),
  -- thread: jasher-11-abram-before-nimrod
  ('jasher', 'jasher', 11, 58, 'canon', 'genesis', 7, 23, 'free', E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* Abram warns Nimrod by the flood that destroyed the whole earth — the very judgment Genesis records standing against the kingdom of man.'),
  ('jasher', 'jasher', 11, 61, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Abram''s closing word that Yahuah sees and judges the wicked is the same judgment that scattered Nimrod''s Babel.'),
  ('jasher', 'jasher', 11, 53, 'jubilees', 'jubilees', 12, 7, 'extras', E'Jubilees 12:7 — *And if I tell them the truth, they will slay me; for their soul cleaves to them to worship them and honour them. Keep silent, my son, lest they slay you.* Jubilees gives the fearful father where Jasher gives the fearless son before Nimrod — the same idol-people who would slay the witness of truth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-nimrod-babel-cities',
       E'Nimrod rebuilds in Shinar — the kingdom of man after Babel',
       E'Jasher 11 opens with the tyrant rebuilding: *And Nimrod son of Cush was still in the land of Shinar, and he reigned over it and dwelt there, and he built cities in the land of Shinar* (Jasher 11:1), and *Nimrod dwelt in Babel, and he there renewed his reign over the rest of his subjects, and he reigned securely* (Jasher 11:6). This is the Genesis Nimrod expanded: *And Cush begat Nimrod: he began to be a mighty one in the earth* (Genesis 10:8), whose kingdom is named: *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10) — the very Babel that Jasher names *Because Yahuah (the Lord) there confounded the language of the whole earth* (Jasher 11:3), retelling *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8). Jasher reads the man''s heart honestly: *Nimrod did not return to Yahuah (the Lord), and he continued in wickedness and teaching wickedness to the sons of men* (Jasher 11:7) — the kingdom of man rebuilt on the same rebellion, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55250
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-war-of-kings',
       E'Chedorlaomer subdues the cities of the plain',
       E'Jasher sets the stage for Genesis 14 in advance: *And Chedorlaomer, king of Elam, went away from the families of the children of Ham, and he fought with them and he subdued them, and he went to the five cities of the plain and he fought against them and he subdued them, and they were under his control* (Jasher 11:10), and *they served him twelve years, and they gave him a yearly tax* (Jasher 11:11). This is the very servitude Genesis records as the trigger of the war Abram will later fight: *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled* (Genesis 14:4). Jasher carries the canon''s narrative spine — the kingdoms of men warring among themselves while the chosen seed is being raised up unseen — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55253
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-abram-elect-out-of-idolatry',
       E'Abram comes forth knowing Yahuah — the seed called out of his father''s house',
       E'Against Terah''s idol-temple Jasher sets the called seed: *And Abram knew Yahuah (the Lord), and he went in his ways and instructions, and Yahuah his Elohim (the Lord his God) was with him* (Jasher 11:14), while *Terah his father was in those days, still captain of the host of king Nimrod, and he still followed strange gods* (Jasher 11:15), with *twelve gods standing there in their temples* (Jasher 11:16). The canon names this same house of idols: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). Abram is the elect drawn out, not a convert who chose first: *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him* (Isaiah 51:2), and Stephen tells it the same way: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2). Election precedes confession — Yahuah called him alone out of the idolatrous world, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55256
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-idols-cannot-speak',
       E'The idol-polemic — wood and stone that cannot eat, hear, or speak',
       E'Abram lays the offering before the gods and they do nothing: *Abram saw on the day when he was sitting amongst them, that they had no voice, no hearing, no motion, and not one of them could stretch forth his hand to eat* (Jasher 11:26), and clothed with the Spirit he cries: *who serve these idols of wood and stone which can neither eat, smell, hear nor speak, who have mouths without speech, eyes without sight, ears without hearing, hands without feeling, and legs which cannot move; like them are those that made them and that trust in them* (Jasher 11:32). This is the prophets'' own idol-polemic, word for word in pattern: *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5), *They have ears, but they hear not: noses have they, but they smell not* (Psalm 115:6). Isaiah mocks the same dead craft: *They that make a graven image are all of them vanity... they see not, nor know; that they may be ashamed* (Isaiah 44:9), and Jeremiah: *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe* (Jeremiah 10:3). Jasher''s young Abram preaches the Tanakh''s idol-rebuke before it was written — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55259
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-abram-breaks-the-idols',
       E'Abram takes the hatchet and breaks his father''s gods',
       E'The legend''s heart: *he hastened and took a hatchet in his hand, and came to the chamber of the gods, and he broke all his father''s gods* (Jasher 11:33), then *placed the hatchet in the hand of the great god which was there before them* (Jasher 11:34). Confronted, he presses the polemic home: *And how can you then serve these idols in whom there is no power to do any thing? Can those idols in which you trust deliver you? can they hear your prayers when you call upon them?* (Jasher 11:43). This breaking is Habakkuk''s verdict enacted: *What profiteth the graven image that the maker thereof hath graven it... to make dumb idols?* (Habakkuk 2:18), and Jeremiah''s: *every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them* (Jeremiah 10:14). Isaiah names the absurd cry the broken god cannot answer: *Deliver me; for thou art my god* (Isaiah 44:17). And Jubilees tells the same deed: *Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it* (Jubilees 12:12) — two witnesses to the seed who shatters the false gods, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55262
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=33
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-abram-before-nimrod',
       E'Abram before Nimrod — the flood-warning to the tyrant-king',
       E'Terah hands his son to the tyrant: *the king sent three men of his servants, and they went and brought Abram before the king. And Nimrod and all his princes and servants were that day sitting before him* (Jasher 11:52). Abram preaches to Nimrod''s face, warning by the flood: *Dost you not know... that this evil which you do, our ancestors sinned in it in days of old, and the eternal Elohim brought the waters of the flood upon them and destroyed them all, and also destroyed the whole earth on their account?* (Jasher 11:58). This is Genesis'' flood set as the standing witness against the kingdom of man: *And every living substance was destroyed which was upon the face of the ground... and Noah only remained alive, and they that were with him in the ark* (Genesis 7:23). Abram closes lifting his eyes: *Yahuah (the Lord) sees all the wicked, and he will judge them* (Jasher 11:61) — the same Yahuah who scattered Babel and drowned the old world. Jubilees gives the parallel of the father who dares not speak truth to the idol-people: *if I tell them the truth, they will slay me* (Jubilees 12:7). The chosen seed stands witness before the kingdom of man — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55265
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=52
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=61
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-11-nimrod-babel-cities
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* Jasher''s Nimrod reigning and building in Shinar is the same mighty one Genesis names — the kingdom-of-man founder.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-nimrod-babel-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Jasher names the same four cities (Babel, Erech, Eched, Calnah) after the tower''s fall, expanding the canon''s bare list.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-nimrod-babel-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Jasher names Babel for this confounding and dispersing — the cities are monuments to the judgment Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-nimrod-babel-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 1:22 — *Professing themselves to be wise, they became fools,* — Nimrod teaching wickedness to the sons of men is Paul''s whole-earth idolatry diagnosis, the kingdom of man rebelling against its Maker.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-nimrod-babel-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-war-of-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:4 — *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled.* Jasher''s twelve-year tax to Chedorlaomer is the exact servitude Genesis names, the seed of the war of kings that Abram will enter.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-war-of-kings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-abram-elect-out-of-idolatry
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Jasher''s Terah serving strange gods is the very idolatry Joshua names — the house Abram is called out of.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-elect-out-of-idolatry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* Abram knowing Yahuah amid idols is the elect seed Isaiah names — called alone, not a church, the covenant line kept and chosen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-elect-out-of-idolatry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* Stephen places Abram''s call in idolatrous Mesopotamia — exactly where Jasher has him come forth knowing Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-elect-out-of-idolatry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God).* Jubilees has the same Abram turning from the host of heaven to the Maker, the elect heart that Jasher shows knowing Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-elect-out-of-idolatry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-idols-cannot-speak
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* Abram''s cry that the idols have mouths without speech and eyes without sight is the Psalmist''s idol-polemic exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-idols-cannot-speak'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:6 — *They have ears, but they hear not: noses have they, but they smell not:* Jasher''s ears without hearing and idols that can neither smell carries the same line of the Psalm''s rebuke.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-idols-cannot-speak'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The gods that cannot stretch a hand to eat are Isaiah''s blind, profitless graven images.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-idols-cannot-speak'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Abram''s idols of wood, like them are those that made them, is Jeremiah''s tree cut and shaped by the workman''s axe.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-idols-cannot-speak'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-abram-breaks-the-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Abram asking what power is in idols that cannot deliver is Habakkuk''s exact charge against the dumb, profitless image.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-breaks-the-idols'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* Abram breaking the breathless idols confounds the founder exactly as Jeremiah says — there is no breath in them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-breaks-the-idols'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Abram mocks idols that cannot hear prayer or deliver — the very cry Isaiah shows the maker raising to dead wood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-breaks-the-idols'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 12:12 — *Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it.* Jubilees tells the same deed Jasher tells with the hatchet — the called seed destroying his father''s gods, a second witness to the legend.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-breaks-the-idols'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=33
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-abram-before-nimrod
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* Abram warns Nimrod by the flood that destroyed the whole earth — the very judgment Genesis records standing against the kingdom of man.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-before-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Abram''s closing word that Yahuah sees and judges the wicked is the same judgment that scattered Nimrod''s Babel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-before-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=61
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 12:7 — *And if I tell them the truth, they will slay me; for their soul cleaves to them to worship them and honour them. Keep silent, my son, lest they slay you.* Jubilees gives the fearful father where Jasher gives the fearless son before Nimrod — the same idol-people who would slay the witness of truth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-before-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=53
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

