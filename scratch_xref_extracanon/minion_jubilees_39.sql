-- ----- fragment: minion_jubilees_39.sql (session251 jubilees 39) -----
-- Source anchor: jubilees/jubilees ch39. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju39 (view _session251_ju39_lookup). Sort band base 53950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-39-sold-into-egypt-potiphar
  ('jubilees', 'jubilees', 39, 2, 'canon', 'genesis', 39, 1, 'free', E'Genesis 39:1 — *And Joseph was brought down to Egypt; and Potiphar, an officer of Pharaoh, captain of the guard, an Egyptian, bought him of the hands of the Ishmeelites, which had brought him down thither.* The Genesis source Jubilees is retelling, naming the same Potiphar who buys Joseph.'),
  ('jubilees', 'jubilees', 39, 2, 'canon', 'psalms', 105, 17, 'free', E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* The sale to Egypt read as Yahuah sending a deliverer ahead, the frame Jubilees 39:2 assumes.'),
  ('jubilees', 'jubilees', 39, 3, 'canon', 'genesis', 39, 2, 'free', E'Genesis 39:2 — *And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian.* The same declaration Jubilees 39:3 makes — Yahuah with Joseph in the Egyptian''s house, prospering him.'),
  -- thread: jubilees-39-yahuah-with-him-set-over-the-house
  ('jubilees', 'jubilees', 39, 3, 'canon', 'genesis', 39, 3, 'free', E'Genesis 39:3 — *And his master saw that Yahuah (LORD) was with him, and that Yahuah (LORD) made all that he did to prosper in his hand.* The Genesis refrain Jubilees 39:3 echoes — the Egyptian sees Yahuah is with Joseph and prospering all he does.'),
  ('jubilees', 'jubilees', 39, 3, 'canon', 'genesis', 39, 5, 'free', E'Genesis 39:5 — *And it came to pass from the time that he had made him overseer in his house, and over all that he had, that Yahuah (LORD) blessed the Egyptian''s house for Joseph''s sake; and the blessing of Yahuah (LORD) was upon all that he had in the house, and in the field.* The blessing-on-the-Egyptian''s-house that Jubilees 39:3 names, traced over field and household.'),
  ('jubilees', 'jubilees', 39, 4, 'canon', 'genesis', 39, 4, 'free', E'Genesis 39:4 — *And Joseph found grace in his sight, and he served him: and he made him overseer over his house, and all that he had he put into his hand.* The commission Jubilees 39:4 records — everything committed into Joseph''s hands because Yahuah was with him.'),
  -- thread: jubilees-39-temptation-refused-sin-against-elohim
  ('jubilees', 'jubilees', 39, 5, 'canon', 'genesis', 39, 7, 'free', E'Genesis 39:7 — *And it came to pass after these things, that his master''s wife cast her eyes upon Joseph; and she said, Lie with me.* The Genesis source of the temptation Jubilees 39:5 narrates — the master''s wife lifting her eyes to Joseph.'),
  ('jubilees', 'jubilees', 39, 6, 'canon', 'genesis', 39, 9, 'free', E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim (God)?* The refusal Jubilees 39:6 expands — Genesis names it sin against Elohim, Jubilees grounds it in the heavenly books.'),
  ('jubilees', 'jubilees', 39, 6, 'canon', 'exodus', 20, 14, 'free', E'Exodus 20:14 — *Thou shalt not commit adultery.* The Sinai word that Jubilees 39:6 says was already ordained in the heavens and read by Jacob from Abraham''s words — it ain''t new.'),
  ('jubilees', 'jubilees', 39, 6, 'canon', 'leviticus', 20, 10, 'free', E'Leviticus 20:10 — *And the man that committeth adultery with another man''s wife, even he that committeth adultery with his neighbour''s wife, the adulterer and the adulteress shall surely be put to death.* The ''punishment of death ordained in the heavens'' that Jubilees 39:6 says Joseph remembered, written into Torah at Sinai.'),
  -- thread: jubilees-39-flight-garment-false-accusation-prison
  ('jubilees', 'jubilees', 39, 9, 'canon', 'genesis', 39, 12, 'free', E'Genesis 39:12 — *And she caught him by his garment, saying, Lie with me: and he left his garment in her hand, and fled, and got him out.* The Genesis source of the flight Jubilees 39:9 narrates — the garment left, the door broken, Joseph fled.'),
  ('jubilees', 'jubilees', 39, 10, 'canon', 'genesis', 39, 14, 'free', E'Genesis 39:14 — *That she called unto the men of her house, and spake unto them, saying, See, he hath brought in an Hebrew unto us to mock us; he came in unto me to lie with me, and I cried with a loud voice:* The false accusation Jubilees 39:10 calls calumny — the wife slandering ''your Hebrew servant.'''),
  ('jubilees', 'jubilees', 39, 11, 'canon', 'genesis', 39, 20, 'free', E'Genesis 39:20 — *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison.* The imprisonment Jubilees 39:11 records — the place where the king''s prisoners were kept.'),
  ('jubilees', 'jubilees', 39, 9, 'canon', '1-corinthians', 6, 18, 'free', E'1 Corinthians 6:18 — *Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body.* Paul makes Joseph''s literal flight in Jubilees 39:9 the command for every believer — flee, do not reason with it.'),
  -- thread: jubilees-39-yahuah-with-him-in-the-prison
  ('jubilees', 'jubilees', 39, 11, 'canon', 'genesis', 39, 21, 'free', E'Genesis 39:21 — *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison.* The very favour-in-prison Jubilees 39:11 records — Yahuah with Joseph before the chief of the prison guards.'),
  ('jubilees', 'jubilees', 39, 13, 'canon', 'genesis', 39, 23, 'free', E'Genesis 39:23 — *The keeper of the prison looked not to any thing that was under his hand; because Yahuah (LORD) was with him, and that which he did, Yahuah (LORD) made it to prosper.* The all-committed-to-his-hand of Jubilees 39:13 — Yahuah perfecting everything Joseph did in the prison.'),
  ('jubilees', 'jubilees', 39, 11, 'canon', 'psalms', 105, 18, 'free', E'Psalm 105:18 — *Whose feet they hurt with fetters: he was laid in iron:* The cost of the imprisonment Jubilees 39:11 narrates — Yahuah with the righteous one even laid in iron.'),
  -- thread: jubilees-39-dreams-interpreted-butler-baker
  ('jubilees', 'jubilees', 39, 16, 'canon', 'genesis', 40, 8, 'free', E'Genesis 40:8 — *And they said unto him, We have dreamed a dream, and there is no interpreter of it. And Joseph said unto them, Do not interpretations belong to Elohim (God)? tell me them, I pray you.* The dreams of butler and baker Jubilees 39:16 records, with Joseph crediting interpretation to Elohim.'),
  ('jubilees', 'jubilees', 39, 17, 'canon', 'genesis', 40, 22, 'free', E'Genesis 40:22 — *But he hanged the chief baker: as Joseph had interpreted to them.* The exact outcome Jubilees 39:17 names — the baker slain just as Joseph interpreted.'),
  ('jubilees', 'jubilees', 39, 18, 'canon', 'genesis', 40, 23, 'free', E'Genesis 40:23 — *Yet did not the chief butler remember Joseph, but forgat him.* The forgetting Jubilees 39:18 laments — the restored butler failing to remember the righteous interpreter.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-39-sold-into-egypt-potiphar',
       E'Joseph sold down to Egypt — Potiphar buys him',
       E'Jubilees opens the Egypt chapter with Joseph carried into bondage: *And Joseph was seventeen years old when they took him down into the land of Egypt, and Potiphar, an eunuch of Pharaoh, the chief cook bought him.* (Jubilees 39:2). It is Genesis 37–39 retold — *And Joseph was brought down to Egypt; and Potiphar, an officer of Pharaoh, captain of the guard, an Egyptian, bought him of the hands of the Ishmeelites, which had brought him down thither.* (Genesis 39:1). The psalmist sets the same sale inside Yahuah''s saving plan — *He sent a man before them, even Joseph, who was sold for a servant:* (Psalm 105:17). The pit and the auction-block are not the end of the righteous seed; they are the road by which Yahuah sends a deliverer ahead. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53950
  FROM _session251_ju39_lookup sv, _session251_ju39_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=39 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-39-yahuah-with-him-set-over-the-house',
       E'Yahuah with Joseph — set over all the house',
       E'Jubilees presses the refrain that the canon presses: *And he set Joseph over all his house, and the blessing of Yahuah (God) came upon the house of the Egyptian on account of Joseph, and Yahuah (God) prospered him in all that he did.* (Jubilees 39:3). Genesis says it the same way — *And his master saw that Yahuah (LORD) was with him, and that Yahuah (LORD) made all that he did to prosper in his hand.* (Genesis 39:3) — and traces the blessing outward onto the master''s whole estate: *that Yahuah (LORD) blessed the Egyptian''s house for Joseph''s sake; and the blessing of Yahuah (LORD) was upon all that he had in the house, and in the field.* (Genesis 39:5). The afflicted righteous one carries Yahuah''s blessing into the house of his captor; the seed kept holy blesses even the nations around it.',
       sv.verse_id, ev.verse_id, 'extras', 53953
  FROM _session251_ju39_lookup sv, _session251_ju39_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=3
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=39 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-39-temptation-refused-sin-against-elohim',
       E'Potiphar''s wife — the sin recorded in the heavens',
       E'Here Jubilees does what only Jubilees does: it grounds Joseph''s refusal in Torah written on the heavenly tablets before Sinai. He remembers *the words which Jacob, his father, used to read from amongst the words of Abraham, that no man should commit fornication with a woman who has a husband; that for him the punishment of death has been ordained in the heavens before the El Elyon (Most High) Elohim (God), and the sin will be recorded against him in the eternal books continually before Yahuah (God)* (Jubilees 39:6). Genesis frames the very same refusal as sin against Elohim — *how then can I do this great wickedness, and sin against Elohim (God)?* (Genesis 39:9). The death-penalty ordinance Joseph ''remembers'' is precisely the law later engraved at Sinai: *Thou shalt not commit adultery.* (Exodus 20:14) and *the adulterer and the adulteress shall surely be put to death.* (Leviticus 20:10). It ain''t new — the law against the deed was on the tablets and in Abraham''s words long before the wife lifted up her eyes.',
       sv.verse_id, ev.verse_id, 'extras', 53956
  FROM _session251_ju39_lookup sv, _session251_ju39_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=39 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-39-flight-garment-false-accusation-prison',
       E'He left his garment and fled — false accusation and prison',
       E'Jubilees keeps the garment and the flight intact: *he left his garment in her hands and broke through the door and fled without from her presence* (Jubilees 39:9), and the woman *calumniated him in the presence of his lord* (Jubilees 39:10), so the Egyptian *cast Joseph into prison into the place where the prisoners were kept whom the king imprisoned* (Jubilees 39:11). Genesis tells it word for word — *And she caught him by his garment, saying, Lie with me: and he left his garment in her hand, and fled, and got him out.* (Genesis 39:12); *See, he hath brought in an Hebrew unto us to mock us; he came in unto me to lie with me, and I cried with a loud voice:* (Genesis 39:14); *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound:* (Genesis 39:20). Paul makes Joseph''s bolt for the door the believer''s posture — *Flee fornication.* (1 Corinthians 6:18). The righteous one would rather lose his coat and his freedom than his purity; the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 53959
  FROM _session251_ju39_lookup sv, _session251_ju39_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=39 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-39-yahuah-with-him-in-the-prison',
       E'Yahuah with Joseph in the prison — favour in chains',
       E'The refrain follows Joseph down into the dungeon: *Yahuah (God) gave Joseph favour in the sight of the chief of the prison guards and compassion before him, for he saw that Yahuah (God) was with him, and that Yahuah (God) made all that he did to prosper* (Jubilees 39:11), and *he committed all things into his hands... for Joseph did everything, and Yahuah (God) perfected it* (Jubilees 39:13). Genesis says it identically — *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison.* (Genesis 39:21); *because Yahuah (LORD) was with him, and that which he did, Yahuah (LORD) made it to prosper.* (Genesis 39:23). The psalm marks the cost of that faithfulness — *Whose feet they hurt with fetters: he was laid in iron:* (Psalm 105:18). Yahuah is with the afflicted righteous in the iron itself; the exalted-from-the-pit one is first proven in the pit.',
       sv.verse_id, ev.verse_id, 'extras', 53962
  FROM _session251_ju39_lookup sv, _session251_ju39_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=39 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-39-dreams-interpreted-butler-baker',
       E'The butler and the baker — dreams interpreted, Joseph forgotten',
       E'Jubilees carries straight on into Genesis 40: Pharaoh imprisons *the chief butler and... the chief baker* (Jubilees 39:13), *they both dreamed a dream... and they told it to Joseph* (Jubilees 39:16), *and as he interpreted to them so it befell them, and Pharaoh restored the chief butler to his office, and the (chief) baker he slew* (Jubilees 39:17) — yet *the chief butler forgot Joseph in the prison* (Jubilees 39:18). Genesis is the source: Joseph answers the dreamers, *Do not interpretations belong to Elohim (God)?* (Genesis 40:8); the outcome falls exactly — *he hanged the chief baker: as Joseph had interpreted to them.* (Genesis 40:22); and the ingratitude lands — *Yet did not the chief butler remember Joseph, but forgat him.* (Genesis 40:23). The interpreter-of-dreams raised from the prison to save many is a Messiah-type: the rejected, forgotten righteous one whom Yahuah will yet exalt over Egypt.',
       sv.verse_id, ev.verse_id, 'extras', 53965
  FROM _session251_ju39_lookup sv, _session251_ju39_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=39 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-39-sold-into-egypt-potiphar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:1 — *And Joseph was brought down to Egypt; and Potiphar, an officer of Pharaoh, captain of the guard, an Egyptian, bought him of the hands of the Ishmeelites, which had brought him down thither.* The Genesis source Jubilees is retelling, naming the same Potiphar who buys Joseph.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-sold-into-egypt-potiphar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* The sale to Egypt read as Yahuah sending a deliverer ahead, the frame Jubilees 39:2 assumes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-sold-into-egypt-potiphar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 39:2 — *And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian.* The same declaration Jubilees 39:3 makes — Yahuah with Joseph in the Egyptian''s house, prospering him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-sold-into-egypt-potiphar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-39-yahuah-with-him-set-over-the-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:3 — *And his master saw that Yahuah (LORD) was with him, and that Yahuah (LORD) made all that he did to prosper in his hand.* The Genesis refrain Jubilees 39:3 echoes — the Egyptian sees Yahuah is with Joseph and prospering all he does.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-yahuah-with-him-set-over-the-house'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:5 — *And it came to pass from the time that he had made him overseer in his house, and over all that he had, that Yahuah (LORD) blessed the Egyptian''s house for Joseph''s sake; and the blessing of Yahuah (LORD) was upon all that he had in the house, and in the field.* The blessing-on-the-Egyptian''s-house that Jubilees 39:3 names, traced over field and household.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-yahuah-with-him-set-over-the-house'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 39:4 — *And Joseph found grace in his sight, and he served him: and he made him overseer over his house, and all that he had he put into his hand.* The commission Jubilees 39:4 records — everything committed into Joseph''s hands because Yahuah was with him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-yahuah-with-him-set-over-the-house'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-39-temptation-refused-sin-against-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:7 — *And it came to pass after these things, that his master''s wife cast her eyes upon Joseph; and she said, Lie with me.* The Genesis source of the temptation Jubilees 39:5 narrates — the master''s wife lifting her eyes to Joseph.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-temptation-refused-sin-against-elohim'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim (God)?* The refusal Jubilees 39:6 expands — Genesis names it sin against Elohim, Jubilees grounds it in the heavenly books.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-temptation-refused-sin-against-elohim'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:14 — *Thou shalt not commit adultery.* The Sinai word that Jubilees 39:6 says was already ordained in the heavens and read by Jacob from Abraham''s words — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-temptation-refused-sin-against-elohim'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 20:10 — *And the man that committeth adultery with another man''s wife, even he that committeth adultery with his neighbour''s wife, the adulterer and the adulteress shall surely be put to death.* The ''punishment of death ordained in the heavens'' that Jubilees 39:6 says Joseph remembered, written into Torah at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-temptation-refused-sin-against-elohim'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-39-flight-garment-false-accusation-prison
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:12 — *And she caught him by his garment, saying, Lie with me: and he left his garment in her hand, and fled, and got him out.* The Genesis source of the flight Jubilees 39:9 narrates — the garment left, the door broken, Joseph fled.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-flight-garment-false-accusation-prison'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:14 — *That she called unto the men of her house, and spake unto them, saying, See, he hath brought in an Hebrew unto us to mock us; he came in unto me to lie with me, and I cried with a loud voice:* The false accusation Jubilees 39:10 calls calumny — the wife slandering ''your Hebrew servant.'''
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-flight-garment-false-accusation-prison'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 39:20 — *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison.* The imprisonment Jubilees 39:11 records — the place where the king''s prisoners were kept.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-flight-garment-false-accusation-prison'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 6:18 — *Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body.* Paul makes Joseph''s literal flight in Jubilees 39:9 the command for every believer — flee, do not reason with it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-flight-garment-false-accusation-prison'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-39-yahuah-with-him-in-the-prison
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:21 — *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison.* The very favour-in-prison Jubilees 39:11 records — Yahuah with Joseph before the chief of the prison guards.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-yahuah-with-him-in-the-prison'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:23 — *The keeper of the prison looked not to any thing that was under his hand; because Yahuah (LORD) was with him, and that which he did, Yahuah (LORD) made it to prosper.* The all-committed-to-his-hand of Jubilees 39:13 — Yahuah perfecting everything Joseph did in the prison.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-yahuah-with-him-in-the-prison'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 105:18 — *Whose feet they hurt with fetters: he was laid in iron:* The cost of the imprisonment Jubilees 39:11 narrates — Yahuah with the righteous one even laid in iron.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-yahuah-with-him-in-the-prison'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-39-dreams-interpreted-butler-baker
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 40:8 — *And they said unto him, We have dreamed a dream, and there is no interpreter of it. And Joseph said unto them, Do not interpretations belong to Elohim (God)? tell me them, I pray you.* The dreams of butler and baker Jubilees 39:16 records, with Joseph crediting interpretation to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-dreams-interpreted-butler-baker'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 40:22 — *But he hanged the chief baker: as Joseph had interpreted to them.* The exact outcome Jubilees 39:17 names — the baker slain just as Joseph interpreted.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-dreams-interpreted-butler-baker'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 40:23 — *Yet did not the chief butler remember Joseph, but forgat him.* The forgetting Jubilees 39:18 laments — the restored butler failing to remember the righteous interpreter.'
  FROM cross_reference_threads t, cross_references x, _session251_ju39_lookup sv, _session251_ju39_lookup tv
 WHERE t.slug='jubilees-39-dreams-interpreted-butler-baker'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=39 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=40 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

