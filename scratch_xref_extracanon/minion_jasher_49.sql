-- ----- fragment: minion_jasher_49.sql (session252 jasher 49) -----
-- Source anchor: jasher/jasher ch49. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja49 (view _session252_ja49_lookup). Sort band base 56200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja49_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-49-spirit-of-god-discreet-and-wise
  ('jasher', 'jasher', 49, 8, 'canon', 'genesis', 41, 38, 'free', E'Genesis 41:38 — *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* Pharaoh''s reasoning in Jasher 49:8, that Elohim has made all known to the Hebrew, is the canon''s own ground for the elevation.'),
  ('jasher', 'jasher', 49, 20, 'canon', 'genesis', 41, 39, 'free', E'Genesis 41:39 — *And Pharaoh said unto Joseph, Forasmuch as Elohim (God) hath shewed thee all this, there is none so discreet and wise as thou art:* the king''s words to Joseph in Jasher 49:20 echo Genesis verbatim, ''there is not throughout the land a discreet and wise man like to you.'''),
  ('jasher', 'jasher', 49, 8, 'jubilees', 'jubilees', 40, 5, 'extras', E'Jubilees 40:5 — *And Yahuah (God) gave Joseph favour and mercy in the eyes of Pharaoh, and Pharaoh said to his servants: “We shall not find such a wise and discreet man as this man, for the spirit of Yahuah (God) is with him.”* Jubilees narrates the identical Pharaoh-speech that opens Jasher 49:8.'),
  ('jasher', 'jasher', 49, 20, 'canon', 'acts', 7, 10, 'free', E'Acts 7:10 — *And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house.* Stephen reads Joseph''s elevation in Jasher 49 as Elohim''s own deliverance and gift of wisdom.'),
  -- thread: jasher-49-second-to-pharaoh-ring-and-chain
  ('jasher', 'jasher', 49, 23, 'canon', 'genesis', 41, 42, 'free', E'Genesis 41:42 — *And Pharaoh took off his ring from his hand, and put it upon Joseph’s hand, and arrayed him in vestures of fine linen, and put a gold chain about his neck;* the investiture of Jasher 49:23 (ring, princely garment, gold chain) is Genesis detail for detail.'),
  ('jasher', 'jasher', 49, 22, 'canon', 'genesis', 41, 40, 'free', E'Genesis 41:40 — *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou.* Pharaoh''s reservation in Jasher 49:22, ''only in my throne will I be greater than you,'' is the canon''s exact word.'),
  ('jasher', 'jasher', 49, 24, 'canon', 'genesis', 41, 43, 'free', E'Genesis 41:43 — *And he made him to ride in the second chariot which he had; and they cried before him, Bow the knee: and he made him ruler over all the land of Egypt.* The second chariot opposite the king''s in Jasher 49:24 retells Genesis'' very procession.'),
  ('jasher', 'jasher', 49, 22, 'jubilees', 'jubilees', 40, 8, 'extras', E'Jubilees 40:8 — *And Joseph ruled over all the land of Egypt, and all the princes of Pharaoh, and all his servants, and all who did the king’s business loved him, for he walked in uprightness, for he was without pride and arrogance, and he had no respect of persons, and did not accept gifts, but he judged in uprightness all the people of the land.* Jubilees gives the righteous character of the second-to-Pharaoh that Jasher 49:22 establishes.'),
  -- thread: jasher-49-zaphnath-paaneah-osnath-thirty-years
  ('jasher', 'jasher', 49, 21, 'canon', 'genesis', 41, 45, 'free', E'Genesis 41:45 — *And Pharaoh called Joseph’s name Zaphnath-paaneah; and he gave him to wife Asenath the daughter of Poti-pherah priest of On. And Joseph went out over all the land of Egypt.* The renaming of Jasher 49:21 and the marriage of 49:36 are Genesis'' own record (Zaphnath-paaneah; daughter of the priest of On).'),
  ('jasher', 'jasher', 49, 38, 'canon', 'genesis', 41, 46, 'free', E'Genesis 41:46 — *And Joseph was thirty years old when he stood before Pharaoh king of Egypt. And Joseph went out from the presence of Pharaoh, and went throughout all the land of Egypt.* Jasher 49:38 reckons the identical thirty years at Joseph''s standing before Pharaoh.'),
  ('jasher', 'jasher', 49, 21, 'jubilees', 'jubilees', 40, 10, 'extras', E'Jubilees 40:10 — *And the king called Joseph’s name Sĕphânṭîphâns, 2 and gave Joseph to wife the daughter of Potiphar, the daughter of the priest of Heliopolis, the chief cook. 3 11. And on the day that Joseph stood before Pharaoh he was thirty years old when he stood before Pharaoh.* Jubilees gives the same new name, the priest''s-daughter wife, and the thirty years that Jasher 49:21,36,38 record.'),
  -- thread: jasher-49-raised-from-the-dungeon-poor-from-the-dust
  ('jasher', 'jasher', 49, 30, 'canon', 'psalms', 105, 17, 'free', E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* Joseph''s praise in Jasher 49:30, that Yahuah raises the poor from the dust, sings the same providence Psalm 105 ascribes to the whole story.'),
  ('jasher', 'jasher', 49, 13, 'canon', 'psalms', 105, 18, 'free', E'Psalm 105:18 — *Whose feet they hurt with fetters: he was laid in iron:* the dungeon of Jasher 49:13, where Joseph lay the night before his exaltation, is the iron Psalm 105 remembers.'),
  ('jasher', 'jasher', 49, 30, 'canon', 'psalms', 105, 20, 'free', E'Psalm 105:20 — *The king sent and loosed him; even the ruler of the people, and let him go free.* The very day Jasher 49:30 celebrates, the king''s loosing of Joseph from the prison to the rule, is Psalm 105''s word.'),
  ('jasher', 'jasher', 49, 30, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* Stephen names the Elohim who was with Joseph from the pit, the same Yahuah Joseph praises in Jasher 49:30.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja49_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja49_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-49-spirit-of-god-discreet-and-wise',
       E'None So Discreet and Wise — the Spirit of Elohim in Joseph',
       E'Pharaoh sets the elevation in motion on the ground that Elohim has spoken through Joseph: *And the king said to all the officers: I have thought that since Elohim (God) has made known to the Hebrew man all that he has spoken, there is none so discreet and wise in the whole land as he is; if it seem good in your sight I will place him over the land, for he will save the land with his wisdom.* (Jasher 49:8). It ain''t new — this is the very word Genesis records: *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* (Genesis 41:38), and to Joseph himself, *Forasmuch as Elohim (God) hath shewed thee all this, there is none so discreet and wise as thou art* (Genesis 41:39). The book of Jubilees narrates the same scene with the same words: *And Yahuah (God) gave Joseph favour and mercy in the eyes of Pharaoh, and Pharaoh said to his servants: “We shall not find such a wise and discreet man as this man, for the spirit of Yahuah (God) is with him.”* (Jubilees 40:5). And Stephen reads the whole rise as Elohim''s own doing: *And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house.* (Acts 7:10). The wisdom is not Egypt''s discovery but the chosen seed kept and exalted by his Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 56200
  FROM _session252_ja49_lookup sv, _session252_ja49_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=49 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-49-second-to-pharaoh-ring-and-chain',
       E'Second to Pharaoh — the Ring, the Garment, the Gold Chain',
       E'Pharaoh invests Joseph with the marks of the second throne: *And the king took off his ring from his hand and put it upon the hand of Joseph, and the king dressed Joseph in a princely garment, and he put a golden crown upon his head, and he put a golden chain upon his neck.* (Jasher 49:23), and *only in my throne will I be greater than you* (Jasher 49:22). It ain''t new — every detail stands in Genesis: *And Pharaoh took off his ring from his hand, and put it upon Joseph’s hand, and arrayed him in vestures of fine linen, and put a gold chain about his neck;* (Genesis 41:42), with the same reserved word, *only in the throne will I be greater than thou* (Genesis 41:40). And the second chariot of Jasher 49:24 is Genesis'' own: *And he made him to ride in the second chariot which he had; and they cried before him, Bow the knee: and he made him ruler over all the land of Egypt.* (Genesis 41:43). Jubilees seals the rule with the same uprightness the chosen seed carries: *And Joseph ruled over all the land of Egypt, and all the princes of Pharaoh, and all his servants, and all who did the king’s business loved him, for he walked in uprightness, for he was without pride and arrogance, and he had no respect of persons, and did not accept gifts, but he judged in uprightness all the people of the land.* (Jubilees 40:8).',
       sv.verse_id, ev.verse_id, 'extras', 56203
  FROM _session252_ja49_lookup sv, _session252_ja49_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=21
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=49 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-49-zaphnath-paaneah-osnath-thirty-years',
       E'Zaphnath Paaneah — the New Name, the Wife, the Thirty Years',
       E'The king crowns the elevation with a new name: *And your name no more shall be called Joseph, but Zaphnath Paaneah shall be your name; you shall be second to me, and according to your word shall be all the affairs of my government, and at your word shall my people go out and come in.* (Jasher 49:21). Pharaoh then gives him a wife and the years are reckoned: *And the king sent to Potiphera, the son of Ahiram priest of On, and he took his young daughter Osnath and gave her to Joseph for a wife.* (Jasher 49:36), and *And Joseph was thirty years old when he stood before Pharaoh, and Joseph went out from before the king, and he became the king’s second in Egypt.* (Jasher 49:38). It ain''t new — Genesis records every part: *And Pharaoh called Joseph’s name Zaphnath-paaneah; and he gave him to wife Asenath the daughter of Poti-pherah priest of On. And Joseph went out over all the land of Egypt.* (Genesis 41:45), and *And Joseph was thirty years old when he stood before Pharaoh king of Egypt. And Joseph went out from the presence of Pharaoh, and went throughout all the land of Egypt.* (Genesis 41:46). Jubilees carries the same name and marriage: *And the king called Joseph’s name Sĕphânṭîphâns, 2 and gave Joseph to wife the daughter of Potiphar, the daughter of the priest of Heliopolis, the chief cook. 3 11. And on the day that Joseph stood before Pharaoh he was thirty years old when he stood before Pharaoh.* (Jubilees 40:10).',
       sv.verse_id, ev.verse_id, 'extras', 56206
  FROM _session252_ja49_lookup sv, _session252_ja49_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=21
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=49 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-49-raised-from-the-dungeon-poor-from-the-dust',
       E'He Raises the Poor from the Dust — from the Dungeon to the Throne',
       E'On the day of his exaltation Joseph lifts his eyes to heaven and ascribes the whole rise to Yahuah: *And Joseph upon his horse lifted up his eyes to heaven, and called out and said, He raises the poor man from the dust, He lifts up the needy from the dunghill. O Yahuah (O Lord) of Hosts, happy is the man who trusts in you.* (Jasher 49:30). The night before, Joseph had still been in the prison: *behold Joseph was lying in the bed at night in his master’s house in the dungeon, for his master had put him back into the dungeon on account of his wife.* (Jasher 49:13). It ain''t new — Psalm 105 sings this exact arc, prison to rule: *He sent a man before them, even Joseph, who was sold for a servant:* (Psalm 105:17), *Whose feet they hurt with fetters: he was laid in iron:* (Psalm 105:18), *The king sent and loosed him; even the ruler of the people, and let him go free.* (Psalm 105:20), *He made him lord of his house, and ruler of all his substance:* (Psalm 105:21). And the apostolic record names the same Elohim who was with him from the selling to the rule: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* (Acts 7:9). The chosen seed is kept through the pit and raised from the dust.',
       sv.verse_id, ev.verse_id, 'extras', 56209
  FROM _session252_ja49_lookup sv, _session252_ja49_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=49 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-49-spirit-of-god-discreet-and-wise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:38 — *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* Pharaoh''s reasoning in Jasher 49:8, that Elohim has made all known to the Hebrew, is the canon''s own ground for the elevation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-spirit-of-god-discreet-and-wise'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:39 — *And Pharaoh said unto Joseph, Forasmuch as Elohim (God) hath shewed thee all this, there is none so discreet and wise as thou art:* the king''s words to Joseph in Jasher 49:20 echo Genesis verbatim, ''there is not throughout the land a discreet and wise man like to you.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-spirit-of-god-discreet-and-wise'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 40:5 — *And Yahuah (God) gave Joseph favour and mercy in the eyes of Pharaoh, and Pharaoh said to his servants: “We shall not find such a wise and discreet man as this man, for the spirit of Yahuah (God) is with him.”* Jubilees narrates the identical Pharaoh-speech that opens Jasher 49:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-spirit-of-god-discreet-and-wise'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=40 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:10 — *And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house.* Stephen reads Joseph''s elevation in Jasher 49 as Elohim''s own deliverance and gift of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-spirit-of-god-discreet-and-wise'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-49-second-to-pharaoh-ring-and-chain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:42 — *And Pharaoh took off his ring from his hand, and put it upon Joseph’s hand, and arrayed him in vestures of fine linen, and put a gold chain about his neck;* the investiture of Jasher 49:23 (ring, princely garment, gold chain) is Genesis detail for detail.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-second-to-pharaoh-ring-and-chain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:40 — *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou.* Pharaoh''s reservation in Jasher 49:22, ''only in my throne will I be greater than you,'' is the canon''s exact word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-second-to-pharaoh-ring-and-chain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 41:43 — *And he made him to ride in the second chariot which he had; and they cried before him, Bow the knee: and he made him ruler over all the land of Egypt.* The second chariot opposite the king''s in Jasher 49:24 retells Genesis'' very procession.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-second-to-pharaoh-ring-and-chain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 40:8 — *And Joseph ruled over all the land of Egypt, and all the princes of Pharaoh, and all his servants, and all who did the king’s business loved him, for he walked in uprightness, for he was without pride and arrogance, and he had no respect of persons, and did not accept gifts, but he judged in uprightness all the people of the land.* Jubilees gives the righteous character of the second-to-Pharaoh that Jasher 49:22 establishes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-second-to-pharaoh-ring-and-chain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=22
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-49-zaphnath-paaneah-osnath-thirty-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:45 — *And Pharaoh called Joseph’s name Zaphnath-paaneah; and he gave him to wife Asenath the daughter of Poti-pherah priest of On. And Joseph went out over all the land of Egypt.* The renaming of Jasher 49:21 and the marriage of 49:36 are Genesis'' own record (Zaphnath-paaneah; daughter of the priest of On).'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-zaphnath-paaneah-osnath-thirty-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:46 — *And Joseph was thirty years old when he stood before Pharaoh king of Egypt. And Joseph went out from the presence of Pharaoh, and went throughout all the land of Egypt.* Jasher 49:38 reckons the identical thirty years at Joseph''s standing before Pharaoh.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-zaphnath-paaneah-osnath-thirty-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 40:10 — *And the king called Joseph’s name Sĕphânṭîphâns, 2 and gave Joseph to wife the daughter of Potiphar, the daughter of the priest of Heliopolis, the chief cook. 3 11. And on the day that Joseph stood before Pharaoh he was thirty years old when he stood before Pharaoh.* Jubilees gives the same new name, the priest''s-daughter wife, and the thirty years that Jasher 49:21,36,38 record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-zaphnath-paaneah-osnath-thirty-years'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=21
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=40 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-49-raised-from-the-dungeon-poor-from-the-dust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* Joseph''s praise in Jasher 49:30, that Yahuah raises the poor from the dust, sings the same providence Psalm 105 ascribes to the whole story.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-raised-from-the-dungeon-poor-from-the-dust'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 105:18 — *Whose feet they hurt with fetters: he was laid in iron:* the dungeon of Jasher 49:13, where Joseph lay the night before his exaltation, is the iron Psalm 105 remembers.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-raised-from-the-dungeon-poor-from-the-dust'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 105:20 — *The king sent and loosed him; even the ruler of the people, and let him go free.* The very day Jasher 49:30 celebrates, the king''s loosing of Joseph from the prison to the rule, is Psalm 105''s word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-raised-from-the-dungeon-poor-from-the-dust'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* Stephen names the Elohim who was with Joseph from the pit, the same Yahuah Joseph praises in Jasher 49:30.'
  FROM cross_reference_threads t, cross_references x, _session252_ja49_lookup sv, _session252_ja49_lookup tv
 WHERE t.slug='jasher-49-raised-from-the-dungeon-poor-from-the-dust'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=49 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

