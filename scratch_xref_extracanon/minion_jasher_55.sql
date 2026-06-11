-- ----- fragment: minion_jasher_55.sql (session252 jasher 55) -----
-- Source anchor: jasher/jasher ch55. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja55 (view _session252_ja55_lookup). Sort band base 56350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja55_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-55-go-down-into-egypt
  ('jasher', 'jasher', 55, 2, 'canon', 'genesis', 46, 3, 'free', E'Genesis 46:3 — *And he said, I am Elohim (God), the Elohim (God) of thy father: fear not to go down into Egypt; for I will there make of thee a great nation:* The very word Jasher 55:2 puts on Yahuah''s lips — fear not, go down, be made a great nation.'),
  ('jasher', 'jasher', 55, 2, 'canon', 'genesis', 46, 4, 'free', E'Genesis 46:4 — *I will go down with thee into Egypt; and I will also surely bring thee up again: and Joseph shall put his hand upon thine eyes.* The descent of Jasher 55:2 carries the promise of the bringing-up — the visitation already pledged.'),
  ('jasher', 'jasher', 55, 5, 'jubilees', 'jubilees', 45, 1, 'extras', E'Jubilees 45:1 — *And Yashar''el (Israel) went into the country of Egypt, 2172 A M. into the land of Goshen, on the new moon of the fourth month, in the second year of the third week of the forty-fifth jubilee.* Jubilees dates the same going-out-from-Canaan that Jasher 55:5 narrates from Beersheba into Goshen.'),
  -- thread: jasher-55-judah-sent-and-joseph-meets-jacob
  ('jasher', 'jasher', 55, 6, 'canon', 'genesis', 46, 28, 'free', E'Genesis 46:28 — *And he sent Yahudah (Judah) before him unto Joseph, to direct his face unto Goshen; and they came into the land of Goshen.* Genesis names the same sceptre-tribe Jasher 55:6 sends ahead to ready Goshen.'),
  ('jasher', 'jasher', 55, 15, 'canon', 'genesis', 46, 29, 'free', E'Genesis 46:29 — *And Joseph made ready his chariot, and went up to meet Yashar''el (Israel) his father, to Goshen, and presented himself unto him; and he fell on his neck, and wept on his neck a good while.* The fall-upon-the-neck embrace of Jasher 55:15 is Genesis verbatim in substance.'),
  ('jasher', 'jasher', 55, 16, 'canon', 'genesis', 46, 30, 'free', E'Genesis 46:30 — *And Yashar''el (Israel) said unto Joseph, Now let me die, since I have seen thy face, because thou art yet alive.* Jacob''s now-let-me-die in Jasher 55:16 is the same word — the father content having seen his living son.'),
  -- thread: jasher-55-before-pharaoh-settled-in-goshen
  ('jasher', 'jasher', 55, 19, 'canon', 'genesis', 47, 1, 'free', E'Genesis 47:1 — *Then Joseph came and told Pharaoh, and said, My father and my brethren, and their flocks, and their herds, and all that they have, are come out of the land of Canaan; and, behold, they are in the land of Goshen.* The report Jasher 55:19 has Joseph plan is Genesis word for word.'),
  ('jasher', 'jasher', 55, 22, 'canon', 'genesis', 47, 6, 'free', E'Genesis 47:6 — *The land of Egypt is before thee; in the best of the land make thy father and brethren to dwell; in the land of Goshen let them dwell: and if thou knowest any men of activity among them, then make them rulers over my cattle.* Pharaoh''s best-of-the-land grant in Jasher 55:22 is the same decree.'),
  ('jasher', 'jasher', 55, 25, 'canon', 'genesis', 47, 7, 'free', E'Genesis 47:7 — *And Joseph brought in Jacob his father, and set him before Pharaoh: and Jacob blessed Pharaoh.* Jacob blessing Pharaoh in Jasher 55:25 — the patriarch''s blessing over the king of Egypt — stands in Genesis verbatim.'),
  ('jasher', 'jasher', 55, 26, 'jubilees', 'jubilees', 45, 6, 'extras', E'Jubilees 45:6 — *And Joseph had given to his father and to his brothers as a gift the right of dwelling in the land of Goshen and in Rameses and all the region round about, which he ruled over before Pharaoh. And Yashar''el (Israel) and his sons dwelt in the land of Goshen, the best part of the land of Egypt; and Yashar''el (Israel) was one hundred and thirty years old when he came into Egypt, And Joseph nourished his father and his brethren and also their possessions with bread as much as sufficed them for the seven years of the famine.* Jubilees carries the same Goshen grant and the same hundred-and-thirtieth year Jasher 55:26 records.'),
  -- thread: jasher-55-joseph-gathers-the-silver-and-gold
  ('jasher', 'jasher', 55, 30, 'canon', 'genesis', 47, 26, 'free', E'Genesis 47:26 — *And Joseph made it a law over the land of Egypt unto this day, that Pharaoh should have the fifth part; except the land of the priests only, which became not Pharaoh''s.* The famine purchase Jasher 55:30 narrates is the same Genesis transaction that ends in Pharaoh''s fifth.'),
  ('jasher', 'jasher', 55, 30, 'jubilees', 'jubilees', 45, 11, 'extras', E'Jubilees 45:11 — *And this was the first year of the fourth week of the forty-fifth jubilee. And Joseph took of the corn of the harvest the fifth part for the king and left four parts for them for food and for seed, and Joseph made it an ordinance for the land of Egypt until this day.* Jubilees keeps the same fifth-part ordinance behind Joseph''s gathering in Jasher 55:30.'),
  -- thread: jasher-55-fruitful-and-multiplied-bondage-foretold
  ('jasher', 'jasher', 55, 36, 'canon', 'exodus', 1, 7, 'free', E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The fruitful-and-multiplied of Jasher 55:36 is the exact verse that opens Exodus and the bondage.'),
  ('jasher', 'jasher', 55, 36, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The Goshen settlement of Jasher 55:36 is the seed becoming the stranger Abraham was forewarned of.'),
  ('jasher', 'jasher', 55, 36, 'canon', 'acts', 7, 6, 'free', E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen reads the same sojourn-and-bondage that begins as Jasher 55:36 settles the seed in Egypt.'),
  ('jasher', 'jasher', 55, 36, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* The multiplying of Jasher 55:36 is the very growth that draws the taskmasters once Joseph''s generation passes.'),
  ('jasher', 'jasher', 55, 35, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* While Jasher 55:35 has the seed learning Yahuah''s law, the bitter bondage of Exodus is the affliction the elect line is about to enter.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja55_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja55_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-55-go-down-into-egypt',
       E'Fear not to go down to Egypt — Yahuah commands the descent',
       E'Jasher sets Jacob at the threshold: *And Jacob said within himself, I will go and see my son whether the fear of his Elohim is yet in his heart amidst all the inhabitants of Egypt* (Jasher 55:3), and *Behold the word of Yahuah (the Lord) came to him, saying, Go down to Egypt with all your household and remain there, fear not to go down to Egypt for I will there make you a great nation* (Jasher 55:2). It ain''t new — this is Genesis at Beersheba: *And he said, I am Elohim (God), the Elohim (God) of thy father: fear not to go down into Egypt; for I will there make of thee a great nation* (Genesis 46:3), with the promise of return, *I will go down with thee into Egypt; and I will also surely bring thee up again: and Joseph shall put his hand upon thine eyes* (Genesis 46:4). Jubilees fixes the same descent on the calendar: *And Yashar''el (Israel) went into the country of Egypt, 2172 A M. into the land of Goshen, on the new moon of the fourth month, in the second year of the third week of the forty-fifth jubilee* (Jubilees 45:1). The elect seed goes down by the word of Yahuah, kept and chosen, to be made a great nation.',
       sv.verse_id, ev.verse_id, 'extras', 56350
  FROM _session252_ja55_lookup sv, _session252_ja55_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=55 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-55-judah-sent-and-joseph-meets-jacob',
       E'Judah sent before to Goshen — Joseph falls on his father''s neck',
       E'Jasher: *And it came to pass when they came near Egypt, Jacob sent Judah before him to Joseph that he might show him a situation in Egypt, and Judah did according to the word of his father... and they assigned for them a place in the land of Goshen* (Jasher 55:6). Yahudah the sceptre-tribe runs ahead to prepare the way — and Genesis says it the same way: *And he sent Yahudah (Judah) before him unto Joseph, to direct his face unto Goshen; and they came into the land of Goshen* (Genesis 46:28). Then the reunion: *And behold Jacob ran and hastened to his son Joseph and fell upon his neck and kissed him, and they wept* (Jasher 55:15), and *Jacob said to Joseph, Now I will die cheerfully after I have seen your face, that you are still living and with glory* (Jasher 55:16) — exactly Genesis: *And Joseph made ready his chariot, and went up to meet Yashar''el (Israel) his father, to Goshen, and presented himself unto him; and he fell on his neck, and wept on his neck a good while* (Genesis 46:29), *And Yashar''el (Israel) said unto Joseph, Now let me die, since I have seen thy face, because thou art yet alive* (Genesis 46:30). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56353
  FROM _session252_ja55_lookup sv, _session252_ja55_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=55 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-55-before-pharaoh-settled-in-goshen',
       E'Before Pharaoh — the best of the land, dwelling in Goshen',
       E'Joseph stations the household and presents them: *And Joseph said to his father and to his brethren, I will go up and tell Pharaoh, saying, My brethren and my father''s household... have come to me, and behold they are in the land of Goshen* (Jasher 55:19), and Pharaoh answers, *Place your father and brethren in the best part of the land, withhold not from them all that is good, and cause them to eat of the fat of the land* (Jasher 55:22). Then the patriarch blesses the king: *And Jacob came and bowed down to Pharaoh, and Jacob blessed Pharaoh, and he then went out; and Jacob and all his sons, and all his household dwelt in the land of Goshen* (Jasher 55:25). It ain''t new — Genesis: *Then Joseph came and told Pharaoh, and said, My father and my brethren... are come out of the land of Canaan; and, behold, they are in the land of Goshen* (Genesis 47:1); *The land of Egypt is before thee; in the best of the land make thy father and brethren to dwell; in the land of Goshen let them dwell* (Genesis 47:6); *And Joseph brought in Jacob his father, and set him before Pharaoh: and Jacob blessed Pharaoh* (Genesis 47:7). Jubilees keeps the same grant: *And Joseph had given to his father and to his brothers as a gift the right of dwelling in the land of Goshen and in Rameses... the best part of the land of Egypt; and Yashar''el (Israel) was one hundred and thirty years old when he came into Egypt* (Jubilees 45:6).',
       sv.verse_id, ev.verse_id, 'extras', 56356
  FROM _session252_ja55_lookup sv, _session252_ja55_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=55 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-55-joseph-gathers-the-silver-and-gold',
       E'Joseph gathers all Egypt''s silver and gold for Pharaoh',
       E'Jasher tells the famine economy: *And Joseph purchased all the lands and fields of Egypt for bread on the account of Pharaoh, and Joseph supplied all Egypt with bread all the days of the famine, and Joseph collected all the silver and gold that came to him for the corn which they bought throughout the land* (Jasher 55:30). Where Jasher then adds its own legendary detail — *Joseph went and concealed them in four parts... near the Red sea... by the river Perath... opposite to the wilderness of Persia and Media* (Jasher 55:31) — Genesis keeps the genuine kernel: the land made over to Pharaoh and the fixed fifth: *And Joseph made it a law over the land of Egypt unto this day, that Pharaoh should have the fifth part; except the land of the priests only, which became not Pharaoh''s* (Genesis 47:26). Jubilees records the same ordinance of the fifth: *And Joseph took of the corn of the harvest the fifth part for the king and left four parts for them for food and for seed, and Joseph made it an ordinance for the land of Egypt until this day* (Jubilees 45:11). The hidden treasure is Jasher''s expansion; anchor only the true Genesis parallel beneath it.',
       sv.verse_id, ev.verse_id, 'extras', 56359
  FROM _session252_ja55_lookup sv, _session252_ja55_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=55 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-55-fruitful-and-multiplied-bondage-foretold',
       E'Fruitful and multiplied in Goshen — the bondage foretold to Abraham',
       E'The chapter closes on the seed: *And Jacob and his sons dwelt in the land of Egypt in the land of Goshen, and they took possession in it, and they were fruitful and multiplied in it* (Jasher 55:36) — and the sons of Joseph kept in the way: *his two sons, Ephraim and Manasseh, remained constantly in the house of Jacob... to learn the ways of Yahuah (the Lord) and his law* (Jasher 55:35). Torah-before-Sinai, the seed kept and taught. It ain''t new — Exodus opens on this very increase: *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them* (Exodus 1:7). But the increase in Goshen is the increase already foretold to Abraham, and the bondage with it: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13); Stephen says it again, *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6). The taskmasters come after Joseph: *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses* (Exodus 1:11), *And they made their lives bitter with hard bondage, in morter, and in brick* (Exodus 1:14). Election precedes the affliction; the seed multiplies on the threshold of the promised bondage and the promised visitation.',
       sv.verse_id, ev.verse_id, 'extras', 56362
  FROM _session252_ja55_lookup sv, _session252_ja55_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=35
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=55 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-55-go-down-into-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:3 — *And he said, I am Elohim (God), the Elohim (God) of thy father: fear not to go down into Egypt; for I will there make of thee a great nation:* The very word Jasher 55:2 puts on Yahuah''s lips — fear not, go down, be made a great nation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-go-down-into-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 46:4 — *I will go down with thee into Egypt; and I will also surely bring thee up again: and Joseph shall put his hand upon thine eyes.* The descent of Jasher 55:2 carries the promise of the bringing-up — the visitation already pledged.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-go-down-into-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 45:1 — *And Yashar''el (Israel) went into the country of Egypt, 2172 A M. into the land of Goshen, on the new moon of the fourth month, in the second year of the third week of the forty-fifth jubilee.* Jubilees dates the same going-out-from-Canaan that Jasher 55:5 narrates from Beersheba into Goshen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-go-down-into-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=45 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-55-judah-sent-and-joseph-meets-jacob
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:28 — *And he sent Yahudah (Judah) before him unto Joseph, to direct his face unto Goshen; and they came into the land of Goshen.* Genesis names the same sceptre-tribe Jasher 55:6 sends ahead to ready Goshen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-judah-sent-and-joseph-meets-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 46:29 — *And Joseph made ready his chariot, and went up to meet Yashar''el (Israel) his father, to Goshen, and presented himself unto him; and he fell on his neck, and wept on his neck a good while.* The fall-upon-the-neck embrace of Jasher 55:15 is Genesis verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-judah-sent-and-joseph-meets-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 46:30 — *And Yashar''el (Israel) said unto Joseph, Now let me die, since I have seen thy face, because thou art yet alive.* Jacob''s now-let-me-die in Jasher 55:16 is the same word — the father content having seen his living son.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-judah-sent-and-joseph-meets-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-55-before-pharaoh-settled-in-goshen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 47:1 — *Then Joseph came and told Pharaoh, and said, My father and my brethren, and their flocks, and their herds, and all that they have, are come out of the land of Canaan; and, behold, they are in the land of Goshen.* The report Jasher 55:19 has Joseph plan is Genesis word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-before-pharaoh-settled-in-goshen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 47:6 — *The land of Egypt is before thee; in the best of the land make thy father and brethren to dwell; in the land of Goshen let them dwell: and if thou knowest any men of activity among them, then make them rulers over my cattle.* Pharaoh''s best-of-the-land grant in Jasher 55:22 is the same decree.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-before-pharaoh-settled-in-goshen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 47:7 — *And Joseph brought in Jacob his father, and set him before Pharaoh: and Jacob blessed Pharaoh.* Jacob blessing Pharaoh in Jasher 55:25 — the patriarch''s blessing over the king of Egypt — stands in Genesis verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-before-pharaoh-settled-in-goshen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 45:6 — *And Joseph had given to his father and to his brothers as a gift the right of dwelling in the land of Goshen and in Rameses and all the region round about, which he ruled over before Pharaoh. And Yashar''el (Israel) and his sons dwelt in the land of Goshen, the best part of the land of Egypt; and Yashar''el (Israel) was one hundred and thirty years old when he came into Egypt, And Joseph nourished his father and his brethren and also their possessions with bread as much as sufficed them for the seven years of the famine.* Jubilees carries the same Goshen grant and the same hundred-and-thirtieth year Jasher 55:26 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-before-pharaoh-settled-in-goshen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=26
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=45 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-55-joseph-gathers-the-silver-and-gold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 47:26 — *And Joseph made it a law over the land of Egypt unto this day, that Pharaoh should have the fifth part; except the land of the priests only, which became not Pharaoh''s.* The famine purchase Jasher 55:30 narrates is the same Genesis transaction that ends in Pharaoh''s fifth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-joseph-gathers-the-silver-and-gold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 45:11 — *And this was the first year of the fourth week of the forty-fifth jubilee. And Joseph took of the corn of the harvest the fifth part for the king and left four parts for them for food and for seed, and Joseph made it an ordinance for the land of Egypt until this day.* Jubilees keeps the same fifth-part ordinance behind Joseph''s gathering in Jasher 55:30.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-joseph-gathers-the-silver-and-gold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=30
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=45 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-55-fruitful-and-multiplied-bondage-foretold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:7 — *And the children of Yashar''el (Israel) were fruitful, and increased abundantly, and multiplied, and waxed exceeding mighty; and the land was filled with them.* The fruitful-and-multiplied of Jasher 55:36 is the exact verse that opens Exodus and the bondage.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-fruitful-and-multiplied-bondage-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The Goshen settlement of Jasher 55:36 is the seed becoming the stranger Abraham was forewarned of.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-fruitful-and-multiplied-bondage-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen reads the same sojourn-and-bondage that begins as Jasher 55:36 settles the seed in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-fruitful-and-multiplied-bondage-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses.* The multiplying of Jasher 55:36 is the very growth that draws the taskmasters once Joseph''s generation passes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-fruitful-and-multiplied-bondage-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* While Jasher 55:35 has the seed learning Yahuah''s law, the bitter bondage of Exodus is the affliction the elect line is about to enter.'
  FROM cross_reference_threads t, cross_references x, _session252_ja55_lookup sv, _session252_ja55_lookup tv
 WHERE t.slug='jasher-55-fruitful-and-multiplied-bondage-foretold'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=55 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

