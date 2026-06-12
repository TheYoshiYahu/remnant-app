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

