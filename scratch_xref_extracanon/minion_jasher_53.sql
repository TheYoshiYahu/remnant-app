-- ----- fragment: minion_jasher_53.sql (session252 jasher 53) -----
-- Source anchor: jasher/jasher ch53. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja53 (view _session252_ja53_lookup). Sort band base 56300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja53_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-53-benjamin-brought-down
  ('jasher', 'jasher', 53, 1, 'canon', 'genesis', 43, 15, 'free', E'Genesis 43:15 — *And the men took that present, and they took double money in their hand, and Benjamin; and rose up, and went down to Egypt, and stood before Joseph.* The canon records the very descent Jasher 53:1 retells, Benjamin and the presents carried down to stand before Joseph.'),
  ('jasher', 'jasher', 53, 6, 'canon', 'genesis', 43, 26, 'free', E'Genesis 43:26 — *And when Joseph came home, they brought him the present which was in their hand into the house, and bowed themselves to him to the earth.* Judah leading Benjamin to bow before Joseph in Jasher 53:6 is the same obeisance the canon records, the dream fulfilled.'),
  ('jasher', 'jasher', 53, 1, 'jubilees', 'jubilees', 42, 21, 'extras', E'Jubilees 42:21 — *And they went and stood before Joseph, and he saw Benjamin his brother, and he knew him, and said to them: “Is this your youngest brother?” And they said to him: “It is he.” And he said: “Yahuah (God) be gracious to you, my son!”* Jubilees narrates the same arrival with Benjamin that Jasher 53:1 opens, the parallel patriarchal record.'),
  -- thread: jasher-53-joseph-weeps-over-benjamin
  ('jasher', 'jasher', 53, 9, 'canon', 'genesis', 43, 29, 'free', E'Genesis 43:29 — *And he lifted up his eyes, and saw his brother Benjamin, his mother’s son, and said, Is this your younger brother, of whom ye spake unto me? And he said, Elohim (God) be gracious unto thee, my son.* Joseph''s blessing over Benjamin in Jasher 53:9 is the canon''s own line restored.'),
  ('jasher', 'jasher', 53, 10, 'canon', 'genesis', 43, 30, 'free', E'Genesis 43:30 — *And Joseph made haste; for his bowels did yearn upon his brother: and he sought where to weep; and he entered into his chamber, and wept there.* Jasher 53:10''s entering the chamber to weep over Benjamin matches Genesis exactly.'),
  ('jasher', 'jasher', 53, 10, 'canon', 'genesis', 43, 31, 'free', E'Genesis 43:31 — *And he washed his face, and went out, and refrained himself, and said, Set on bread.* The washing of the face and refraining from weeping in Jasher 53:10 is the canon''s same gesture before the meal.'),
  -- thread: jasher-53-the-feast-benjamin-portion
  ('jasher', 'jasher', 53, 12, 'canon', 'genesis', 43, 33, 'free', E'Genesis 43:33 — *And they sat before him, the firstborn according to his birthright, and the youngest according to his youth: and the men marvelled one at another.* Joseph seating the brethren by their births in Jasher 53:12 is the canon''s own astonishing arrangement.'),
  ('jasher', 'jasher', 53, 14, 'canon', 'genesis', 43, 34, 'free', E'Genesis 43:34 — *And he took and sent messes unto them from before him: but Benjamin’s mess was five times so much as any of theirs. And they drank, and were merry with him.* Benjamin''s heaped gifts in Jasher 53:14 echo the canon''s fivefold portion at the same feast.'),
  ('jasher', 'jasher', 53, 14, 'jubilees', 'jubilees', 42, 23, 'extras', E'Jubilees 42:23 — *And they ate before him and he gave them all a portion, but the portion of Benjamin was seven times larger than that of any of theirs.* Jubilees, like Jasher 53:14, marks Benjamin''s portion as far greater than his brothers'' at Joseph''s table.'),
  -- thread: jasher-53-silver-cup-hidden
  ('jasher', 'jasher', 53, 23, 'canon', 'genesis', 44, 1, 'free', E'Genesis 44:1 — *And he commanded the steward of his house, saying, Fill the men’s sacks with food, as much as they can carry, and put every man’s money in his sack’s mouth.* Joseph''s command to fill the sacks and return the money in Jasher 53:23 is the canon''s same order to his steward.'),
  ('jasher', 'jasher', 53, 23, 'canon', 'genesis', 44, 2, 'free', E'Genesis 44:2 — *And put my cup, the silver cup, in the sack’s mouth of the youngest, and his corn money. And he did according to the word that Joseph had spoken.* The hiding of the cup in Benjamin''s sack in Jasher 53:23 is the canon''s silver-cup test verbatim.'),
  ('jasher', 'jasher', 53, 27, 'canon', 'genesis', 44, 12, 'free', E'Genesis 44:12 — *And he searched, and began at the eldest, and left at the youngest: and the cup was found in Benjamin’s sack.* The cup found in Benjamin''s bag in Jasher 53:27 is the canon''s own discovery, eldest to youngest.'),
  ('jasher', 'jasher', 53, 23, 'jubilees', 'jubilees', 43, 1, 'extras', E'Jubilees 43:1 — *And he did as Joseph had told him, and filled all their sacks for them with food and put their money in their sacks, and put the cup in Benjamin’s sack.* Jubilees narrates the same hidden cup that Jasher 53:23 sets in Benjamin''s sack.'),
  -- thread: jasher-53-judah-confession
  ('jasher', 'jasher', 53, 31, 'canon', 'genesis', 44, 16, 'free', E'Genesis 44:16 — *And Yahudah (Judah) said, What shall we say unto my lord? what shall we speak? or how shall we clear ourselves? Elohim (God) hath found out the iniquity of thy servants: behold, we are my lord’s servants, both we, and he also with whom the cup is found.* Judah''s confession in Jasher 53:31 is the canon''s own word, Elohim finding out the iniquity of the servants.'),
  ('jasher', 'jasher', 53, 29, 'canon', 'genesis', 44, 14, 'free', E'Genesis 44:14 — *And Yahudah (Judah) and his brethren came to Joseph’s house; for he was yet there: and they fell before him on the ground.* The brethren coming to Joseph''s house and standing before his throne in Jasher 53:29 is the canon''s same return after the cup was found.'),
  ('jasher', 'jasher', 53, 31, 'canon', 'genesis', 49, 10, 'free', E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* Judah stepping forward to speak and stand surety for his brethren in Jasher 53:31 foreshadows the sceptre-bearing tribe whose line runs to Shiloh the Messiah.'),
  ('jasher', 'jasher', 53, 31, 'jubilees', 'jubilees', 43, 13, 'extras', E'Jubilees 43:13 — *Now rather let me, your servant, abide instead of the boy as a bondsman to my lord, and let the lad go with his brethren, for I became surety for him at the hand of your servant our father, and if I do not bring him back, your servant will bear the blame to our father for ever.* Jubilees keeps Judah''s surety-plea that Jasher 53:31 begins, the same intercession before Joseph.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja53_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja53_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-53-benjamin-brought-down',
       E'The brethren come down with Benjamin and stand before Joseph',
       E'Jasher opens not with legendary war but with the heart of the Joseph story: *And the sons of Jacob rose up and took Benjamin and the whole of the presents, and they went and came to Egypt and they stood before Joseph* (Jasher 53:1). This is Genesis told again. The canon records the same descent — *And the men took that present, and they took double money in their hand, and Benjamin; and rose up, and went down to Egypt, and stood before Joseph* (Genesis 43:15) — and the same bowing of the brethren foretold in Joseph''s dreams — *And when Joseph came home, they brought him the present which was in their hand into the house, and bowed themselves to him to the earth* (Genesis 43:26). Jubilees carries the identical scene, naming Benjamin and Joseph''s blessing over him — *And they went and stood before Joseph, and he saw Benjamin his brother, and he knew him, and said to them: “Is this your youngest brother?” And they said to him: “It is he.” And he said: “Yahuah (God) be gracious to you, my son!”* (Jubilees 42:21). The seed-line of Israel is kept and carried down into Egypt; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56300
  FROM _session252_ja53_lookup sv, _session252_ja53_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=53 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-53-joseph-weeps-over-benjamin',
       E'Joseph beholds Benjamin and weeps in the inner chamber',
       E'Jasher lingers on the brother''s bowels yearning: *And he lifted up his eyes and beheld his brother Benjamin, and he said, Is this your brother of whom you spoke to me? And Benjamin approached Joseph, and Joseph placed his hand upon his head and he said to him, May Elohim (God) be gracious to you my son* (Jasher 53:9), and then *And when Joseph saw his brother, the son of his mother, he again wished to weep, and he entered the chamber, and he wept there, and he washed his face, and went out and refrained from weeping, and he said, Prepare food* (Jasher 53:10). Genesis tells it word for word: *And he lifted up his eyes, and saw his brother Benjamin, his mother’s son, and said, Is this your younger brother, of whom ye spake unto me? And he said, Elohim (God) be gracious unto thee, my son* (Genesis 43:29), and *And Joseph made haste; for his bowels did yearn upon his brother: and he sought where to weep; and he entered into his chamber, and wept there* (Genesis 43:30), and *And he washed his face, and went out, and refrained himself, and said, Set on bread* (Genesis 43:31). The retelling adds nothing the canon withholds — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56303
  FROM _session252_ja53_lookup sv, _session252_ja53_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=53 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-53-the-feast-benjamin-portion',
       E'The brethren seated by birth, Benjamin''s portion the greatest',
       E'At the meal Joseph seats his brothers as the canon does, and singles out Benjamin: *And he also placed the others according to their births, and he said, I know that this your youngest brother has no brother, and I, like him, have no brother, he shall therefore sit down to eat with me* (Jasher 53:13). Genesis sets the same table — *And they sat before him, the firstborn according to his birthright, and the youngest according to his youth: and the men marvelled one at another* (Genesis 43:33) — and gives Benjamin the larger share — *And he took and sent messes unto them from before him: but Benjamin’s mess was five times so much as any of theirs. And they drank, and were merry with him* (Genesis 43:34). Jubilees keeps the same favored portion — *And they ate before him and he gave them all a portion, but the portion of Benjamin was seven times larger than that of any of theirs* (Jubilees 42:23). The same scene carried by three witnesses; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56306
  FROM _session252_ja53_lookup sv, _session252_ja53_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=53 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-53-silver-cup-hidden',
       E'The silver cup hidden in Benjamin''s sack',
       E'Joseph''s test is set exactly as Genesis frames it: *At that time Joseph commanded his officer to fill their sacks with food, and to put each man’s money into his sack, and to put the cup in the sack of Benjamin, and to give them provision for the road, and they did so to them* (Jasher 53:23), and on pursuit *they looked in their bags and the cup was found in Benjamin’s bag* (Jasher 53:27). The canon commands the same — *And he commanded the steward of his house, saying, Fill the men’s sacks with food, as much as they can carry, and put every man’s money in his sack’s mouth* (Genesis 44:1), and *And put my cup, the silver cup, in the sack’s mouth of the youngest, and his corn money. And he did according to the word that Joseph had spoken* (Genesis 44:2), and the cup is found — *And he searched, and began at the eldest, and left at the youngest: and the cup was found in Benjamin’s sack* (Genesis 44:12). Jubilees carries the identical instruction — *And he did as Joseph had told him, and filled all their sacks for them with food and put their money in their sacks, and put the cup in Benjamin’s sack* (Jubilees 43:1). One scene, three records; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56309
  FROM _session252_ja53_lookup sv, _session252_ja53_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=53 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-53-judah-confession',
       E'Judah confesses before Joseph; Elohim has found the iniquity',
       E'Brought back to the house, Judah speaks for them all: *And Judah said, What shall we say to our Lord, what shall we speak and how shall we justify ourselves, Elohim has this day found the iniquity of all your servants, therefore has he done this thing to us this day* (Jasher 53:31). Genesis gives the same confession on Judah''s lips — *And Yahudah (Judah) said, What shall we say unto my lord? what shall we speak? or how shall we clear ourselves? Elohim (God) hath found out the iniquity of thy servants: behold, we are my lord’s servants, both we, and he also with whom the cup is found* (Genesis 44:16), preceded by the brethren falling before him — *And Yahudah (Judah) and his brethren came to Joseph’s house; for he was yet there: and they fell before him on the ground* (Genesis 44:14). It is Judah — the sceptre-bearing tribe (Genesis 49:10) — who steps forward as surety and pleads, and Jubilees keeps that same surety-pledge — *Now rather let me, your servant, abide instead of the boy as a bondsman to my lord, and let the lad go with his brethren, for I became surety for him at the hand of your servant our father, and if I do not bring him back, your servant will bear the blame to our father for ever.* (Jubilees 43:13). Judah''s intercession runs straight to the Lion of the tribe of Judah; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56312
  FROM _session252_ja53_lookup sv, _session252_ja53_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=53 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-53-benjamin-brought-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 43:15 — *And the men took that present, and they took double money in their hand, and Benjamin; and rose up, and went down to Egypt, and stood before Joseph.* The canon records the very descent Jasher 53:1 retells, Benjamin and the presents carried down to stand before Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-benjamin-brought-down'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 43:26 — *And when Joseph came home, they brought him the present which was in their hand into the house, and bowed themselves to him to the earth.* Judah leading Benjamin to bow before Joseph in Jasher 53:6 is the same obeisance the canon records, the dream fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-benjamin-brought-down'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 42:21 — *And they went and stood before Joseph, and he saw Benjamin his brother, and he knew him, and said to them: “Is this your youngest brother?” And they said to him: “It is he.” And he said: “Yahuah (God) be gracious to you, my son!”* Jubilees narrates the same arrival with Benjamin that Jasher 53:1 opens, the parallel patriarchal record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-benjamin-brought-down'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=42 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-53-joseph-weeps-over-benjamin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 43:29 — *And he lifted up his eyes, and saw his brother Benjamin, his mother’s son, and said, Is this your younger brother, of whom ye spake unto me? And he said, Elohim (God) be gracious unto thee, my son.* Joseph''s blessing over Benjamin in Jasher 53:9 is the canon''s own line restored.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-joseph-weeps-over-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 43:30 — *And Joseph made haste; for his bowels did yearn upon his brother: and he sought where to weep; and he entered into his chamber, and wept there.* Jasher 53:10''s entering the chamber to weep over Benjamin matches Genesis exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-joseph-weeps-over-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 43:31 — *And he washed his face, and went out, and refrained himself, and said, Set on bread.* The washing of the face and refraining from weeping in Jasher 53:10 is the canon''s same gesture before the meal.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-joseph-weeps-over-benjamin'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-53-the-feast-benjamin-portion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 43:33 — *And they sat before him, the firstborn according to his birthright, and the youngest according to his youth: and the men marvelled one at another.* Joseph seating the brethren by their births in Jasher 53:12 is the canon''s own astonishing arrangement.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-the-feast-benjamin-portion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 43:34 — *And he took and sent messes unto them from before him: but Benjamin’s mess was five times so much as any of theirs. And they drank, and were merry with him.* Benjamin''s heaped gifts in Jasher 53:14 echo the canon''s fivefold portion at the same feast.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-the-feast-benjamin-portion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=43 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 42:23 — *And they ate before him and he gave them all a portion, but the portion of Benjamin was seven times larger than that of any of theirs.* Jubilees, like Jasher 53:14, marks Benjamin''s portion as far greater than his brothers'' at Joseph''s table.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-the-feast-benjamin-portion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=42 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-53-silver-cup-hidden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 44:1 — *And he commanded the steward of his house, saying, Fill the men’s sacks with food, as much as they can carry, and put every man’s money in his sack’s mouth.* Joseph''s command to fill the sacks and return the money in Jasher 53:23 is the canon''s same order to his steward.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-silver-cup-hidden'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 44:2 — *And put my cup, the silver cup, in the sack’s mouth of the youngest, and his corn money. And he did according to the word that Joseph had spoken.* The hiding of the cup in Benjamin''s sack in Jasher 53:23 is the canon''s silver-cup test verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-silver-cup-hidden'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 44:12 — *And he searched, and began at the eldest, and left at the youngest: and the cup was found in Benjamin’s sack.* The cup found in Benjamin''s bag in Jasher 53:27 is the canon''s own discovery, eldest to youngest.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-silver-cup-hidden'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 43:1 — *And he did as Joseph had told him, and filled all their sacks for them with food and put their money in their sacks, and put the cup in Benjamin’s sack.* Jubilees narrates the same hidden cup that Jasher 53:23 sets in Benjamin''s sack.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-silver-cup-hidden'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=23
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=43 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-53-judah-confession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 44:16 — *And Yahudah (Judah) said, What shall we say unto my lord? what shall we speak? or how shall we clear ourselves? Elohim (God) hath found out the iniquity of thy servants: behold, we are my lord’s servants, both we, and he also with whom the cup is found.* Judah''s confession in Jasher 53:31 is the canon''s own word, Elohim finding out the iniquity of the servants.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-judah-confession'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 44:14 — *And Yahudah (Judah) and his brethren came to Joseph’s house; for he was yet there: and they fell before him on the ground.* The brethren coming to Joseph''s house and standing before his throne in Jasher 53:29 is the canon''s same return after the cup was found.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-judah-confession'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=44 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* Judah stepping forward to speak and stand surety for his brethren in Jasher 53:31 foreshadows the sceptre-bearing tribe whose line runs to Shiloh the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-judah-confession'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 43:13 — *Now rather let me, your servant, abide instead of the boy as a bondsman to my lord, and let the lad go with his brethren, for I became surety for him at the hand of your servant our father, and if I do not bring him back, your servant will bear the blame to our father for ever.* Jubilees keeps Judah''s surety-plea that Jasher 53:31 begins, the same intercession before Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja53_lookup sv, _session252_ja53_lookup tv
 WHERE t.slug='jasher-53-judah-confession'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=53 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=43 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

