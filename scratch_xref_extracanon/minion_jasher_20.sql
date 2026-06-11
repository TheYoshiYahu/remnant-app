-- ----- fragment: minion_jasher_20.sql (session252 jasher 20) -----
-- Source anchor: jasher/jasher ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja20 (view _session252_ja20_lookup). Sort band base 55475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-20-journey-to-gerar
  ('jasher', 'jasher', 20, 1, 'canon', 'genesis', 20, 1, 'free', E'Genesis 20:1 — *And Abraham journeyed from thence toward the south country, and dwelled between Kadesh and Shur, and sojourned in Gerar.* The canon source Jasher 20:1 retells: Abraham settling at Gerar in the Philistines'' land.'),
  ('jasher', 'jasher', 20, 1, 'jubilees', 'jubilees', 16, 9, 'extras', E'Jubilees 16:9 — *And in this month Abraham moved from Hebron, and departed and dwelt between Kadesh and Shur in the mountains of Gerar.* The Jubilees apparatus records the same move to Gerar that opens Jasher 20:1.'),
  -- thread: jasher-20-she-is-my-sister
  ('jasher', 'jasher', 20, 2, 'canon', 'genesis', 20, 2, 'free', E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The canon scene Jasher 20:2 retells: the sister-word and Abimelech''s taking of Sarah.'),
  ('jasher', 'jasher', 20, 2, 'canon', 'genesis', 12, 13, 'free', E'Genesis 12:13 — *Say, I pray thee, thou art my sister: that it may be well with me for thy sake; and my soul shall live because of thee.* The earlier Egypt instance of the same sister-word Abraham repeats in Jasher 20:2.'),
  ('jasher', 'jasher', 20, 2, 'canon', 'genesis', 26, 7, 'free', E'Genesis 26:7 — *And the men of the place asked him of his wife; and he said, She is my sister: for he feared to say, She is my wife; lest, said he, the men of the place should kill me for Rebekah; because she was fair to look upon.* Isaac repeats the same word in the same Gerar — the seed-line carrying its father''s pattern beyond Jasher 20:2.'),
  -- thread: jasher-20-abimelech-takes-sarah
  ('jasher', 'jasher', 20, 5, 'canon', 'genesis', 20, 2, 'free', E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The canon''s bare statement that Jasher 20:5 expands into the servants praising Sarah and the king''s officers bringing her.'),
  ('jasher', 'jasher', 20, 6, 'canon', 'genesis', 20, 6, 'free', E'Genesis 20:6 — *And Elohim (God) said unto him in a dream, Yea, I know that thou didst this in the integrity of thy heart; for I also withheld thee from sinning against me: therefore suffered I thee not to touch her.* Elohim withholds the king who, in Jasher 20:6, saw that Sarah pleased him exceedingly — the promised seed''s mother kept.'),
  -- thread: jasher-20-dream-angel-drawn-sword
  ('jasher', 'jasher', 20, 12, 'canon', 'genesis', 20, 3, 'free', E'Genesis 20:3 — *But Elohim (God) came to Abimelech in a dream by night, and said to him, Behold, thou art but a dead man, for the woman which thou hast taken; for she is a man’s wife.* The dream by night Jasher 20:12 sets up as the deep sleep falls on the king.'),
  ('jasher', 'jasher', 20, 13, 'canon', 'genesis', 20, 7, 'free', E'Genesis 20:7 — *Now therefore restore the man his wife; for he is a prophet, and he shall pray for thee, and thou shalt live: and if thou restore her not, know thou that thou shalt surely die, thou, and all that are thine.* The canon''s warning behind the angel of Jasher 20:13 who would slay the king lest he restore the wife.'),
  -- thread: jasher-20-pharaoh-precedent-and-healing
  ('jasher', 'jasher', 20, 13, 'canon', 'genesis', 12, 17, 'free', E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram’s wife.* The Egypt precedent the servants recall within Jasher 20:13''s record to urge the king to restore Sarah.'),
  ('jasher', 'jasher', 20, 13, 'canon', 'genesis', 12, 18, 'free', E'Genesis 12:18 — *And Pharaoh called Abram, and said, What is this that thou hast done unto me? why didst thou not tell me that she was thy wife?* Pharaoh''s rebuke, mirrored when Abimelech likewise calls Abraham to account within Jasher 20:13''s record.'),
  ('jasher', 'jasher', 20, 13, 'canon', 'genesis', 20, 17, 'free', E'Genesis 20:17 — *So Abraham prayed unto Elohim (God): and Elohim (God) healed Abimelech, and his wife, and his maidservants; and they bare children.* The healing intercession that closes Jasher 20''s record — the prophet''s prayer lifts the plague from the land.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-20-journey-to-gerar',
       E'Abraham journeys to Gerar (between Kadesh and Shur)',
       E'Jasher opens the Gerar episode: *And at that time Abraham journeyed from the plain of Mamre, and he went to the land of the Philistines, and he dwelt in Gerar; it was in the twenty-fifth year of Abraham’s being in the land of Canaan, and the hundredth year of the life of Abraham, that he came to Gerar in the land of the Philistines.* (Jasher 20:1). This is no new tale — it carries the canon''s own account: *And Abraham journeyed from thence toward the south country, and dwelled between Kadesh and Shur, and sojourned in Gerar.* (Genesis 20:1). The same patriarchal event stands engraven in the Jubilees apparatus: *And in this month Abraham moved from Hebron, and departed and dwelt between Kadesh and Shur in the mountains of Gerar.* (Jubilees 16:9). The sojourner in the kingdom of man''s land is the called seed kept and passing through.',
       sv.verse_id, ev.verse_id, 'extras', 55475
  FROM _session252_ja20_lookup sv, _session252_ja20_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-20-she-is-my-sister',
       E'“Say you are my sister” — the recurring word at Gerar',
       E'Entering the land, Abraham instructs Sarah: *And when they entered the land he said to Sarah his wife, Say you are my sister, to any one that shall ask you, in order that we may escape the evil of the inhabitants of the land.* (Jasher 20:2). The canon gives the same word: *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* (Genesis 20:2). This is the second time the patriarch speaks it — he had said it first in Egypt: *Say, I pray thee, thou art my sister: that it may be well with me for thy sake; and my soul shall live because of thee.* (Genesis 12:13). And the same word would pass to the chosen seed after him, when Isaac dwelt in the same Gerar: *And the men of the place asked him of his wife; and he said, She is my sister: for he feared to say, She is my wife; lest, said he, the men of the place should kill me for Rebekah; because she was fair to look upon.* (Genesis 26:7). The seed-line is traced through the very pattern of its fathers — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55478
  FROM _session252_ja20_lookup sv, _session252_ja20_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=20 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-20-abimelech-takes-sarah',
       E'Abimelech sends and takes Sarah to the king''s house',
       E'The king of the Philistines, hearing of her beauty, sends for her: *And Abimelech heard the words of his servants who praised Sarah to him, and Abimelech sent his officers, and they brought Sarah to the king.* (Jasher 20:5), and *And Sarah came to the house of Abimelech, and the king saw that Sarah was beautiful, and she pleased him exceedingly.* (Jasher 20:6). The canon names the same taking: *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* (Genesis 20:2). Yet the canon adds what Jasher''s narrative confirms — the king never came near her, for Elohim withheld him: *And Elohim (God) said unto him in a dream, Yea, I know that thou didst this in the integrity of thy heart; for I also withheld thee from sinning against me: therefore suffered I thee not to touch her.* (Genesis 20:6). The mother of the promised seed is kept by Yahuah''s own hand.',
       sv.verse_id, ev.verse_id, 'extras', 55481
  FROM _session252_ja20_lookup sv, _session252_ja20_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-20-dream-angel-drawn-sword',
       E'The dream by night — the angel with the drawn sword',
       E'Jasher tells of the deep sleep that fell on the king and the dream of judgment: *As at evening time, before men lie down to rest, the king was sitting upon his throne, and a deep sleep fell upon him, and he lay upon the throne and slept till morning.* (Jasher 20:12), and *And he dreamed that an angel of Yahuah (the Lord) came to him with a drawn sword in his hand, and the angel stood over Abimelech, and wished to slay him with the sword...* (Jasher 20:13). The canon carries the same dream of death: *But Elohim (God) came to Abimelech in a dream by night, and said to him, Behold, thou art but a dead man, for the woman which thou hast taken; for she is a man’s wife.* (Genesis 20:3). And the canon gives the remedy the dream demands — the patriarch is a prophet whose prayer is heard: *Now therefore restore the man his wife; for he is a prophet, and he shall pray for thee, and thou shalt live: and if thou restore her not, know thou that thou shalt surely die, thou, and all that are thine.* (Genesis 20:7). The word of warning by night is no later invention; it stands in Torah.',
       sv.verse_id, ev.verse_id, 'extras', 55484
  FROM _session252_ja20_lookup sv, _session252_ja20_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=20 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-20-pharaoh-precedent-and-healing',
       E'The Pharaoh precedent recalled, and Abraham''s prayer heals the land',
       E'Within this same record Jasher''s servants recall the earlier deliverance in Egypt and urge restoration — *for the like happened to the king of Egypt when this man came to Egypt... and Yahuah (the Lord) brought upon him grievous plagues until he returned the woman to her husband* — and the chapter closes with Abraham interceding so the land is healed (Jasher 20:13''s record, vv. 19–30 inline). The canon furnishes the Egypt precedent verbatim: *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram’s wife.* (Genesis 12:17), and Pharaoh''s rebuke, *And Pharaoh called Abram, and said, What is this that thou hast done unto me? why didst thou not tell me that she was thy wife?* (Genesis 12:18). And the canon gives the healing of Gerar that crowns the chapter: *So Abraham prayed unto Elohim (God): and Elohim (God) healed Abimelech, and his wife, and his maidservants; and they bare children.* (Genesis 20:17). The prophet''s intercession turns away the plague — Torah-before-Sinai, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55487
  FROM _session252_ja20_lookup sv, _session252_ja20_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=20 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-20-journey-to-gerar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 20:1 — *And Abraham journeyed from thence toward the south country, and dwelled between Kadesh and Shur, and sojourned in Gerar.* The canon source Jasher 20:1 retells: Abraham settling at Gerar in the Philistines'' land.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-journey-to-gerar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 16:9 — *And in this month Abraham moved from Hebron, and departed and dwelt between Kadesh and Shur in the mountains of Gerar.* The Jubilees apparatus records the same move to Gerar that opens Jasher 20:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-journey-to-gerar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-20-she-is-my-sister
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The canon scene Jasher 20:2 retells: the sister-word and Abimelech''s taking of Sarah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:13 — *Say, I pray thee, thou art my sister: that it may be well with me for thy sake; and my soul shall live because of thee.* The earlier Egypt instance of the same sister-word Abraham repeats in Jasher 20:2.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 26:7 — *And the men of the place asked him of his wife; and he said, She is my sister: for he feared to say, She is my wife; lest, said he, the men of the place should kill me for Rebekah; because she was fair to look upon.* Isaac repeats the same word in the same Gerar — the seed-line carrying its father''s pattern beyond Jasher 20:2.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-20-abimelech-takes-sarah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The canon''s bare statement that Jasher 20:5 expands into the servants praising Sarah and the king''s officers bringing her.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-abimelech-takes-sarah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 20:6 — *And Elohim (God) said unto him in a dream, Yea, I know that thou didst this in the integrity of thy heart; for I also withheld thee from sinning against me: therefore suffered I thee not to touch her.* Elohim withholds the king who, in Jasher 20:6, saw that Sarah pleased him exceedingly — the promised seed''s mother kept.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-abimelech-takes-sarah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-20-dream-angel-drawn-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 20:3 — *But Elohim (God) came to Abimelech in a dream by night, and said to him, Behold, thou art but a dead man, for the woman which thou hast taken; for she is a man’s wife.* The dream by night Jasher 20:12 sets up as the deep sleep falls on the king.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-dream-angel-drawn-sword'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 20:7 — *Now therefore restore the man his wife; for he is a prophet, and he shall pray for thee, and thou shalt live: and if thou restore her not, know thou that thou shalt surely die, thou, and all that are thine.* The canon''s warning behind the angel of Jasher 20:13 who would slay the king lest he restore the wife.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-dream-angel-drawn-sword'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-20-pharaoh-precedent-and-healing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram’s wife.* The Egypt precedent the servants recall within Jasher 20:13''s record to urge the king to restore Sarah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-pharaoh-precedent-and-healing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:18 — *And Pharaoh called Abram, and said, What is this that thou hast done unto me? why didst thou not tell me that she was thy wife?* Pharaoh''s rebuke, mirrored when Abimelech likewise calls Abraham to account within Jasher 20:13''s record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-pharaoh-precedent-and-healing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 20:17 — *So Abraham prayed unto Elohim (God): and Elohim (God) healed Abimelech, and his wife, and his maidservants; and they bare children.* The healing intercession that closes Jasher 20''s record — the prophet''s prayer lifts the plague from the land.'
  FROM cross_reference_threads t, cross_references x, _session252_ja20_lookup sv, _session252_ja20_lookup tv
 WHERE t.slug='jasher-20-pharaoh-precedent-and-healing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=20 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

