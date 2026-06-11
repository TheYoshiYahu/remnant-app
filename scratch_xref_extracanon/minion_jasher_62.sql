-- ----- fragment: minion_jasher_62.sql (session252 jasher 62) -----
-- Source anchor: jasher/jasher ch62. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja62 (view _session252_ja62_lookup). Sort band base 56525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja62_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-62-sons-die-coffins-egypt
  ('jasher', 'jasher', 62, 1, 'canon', 'exodus', 1, 6, 'free', E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Jasher 62 unfolds this single verse into a year-by-year roll-call of the brothers'' deaths in Egypt.'),
  ('jasher', 'jasher', 62, 1, 'canon', 'genesis', 50, 26, 'free', E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* Joseph''s coffin in Egypt is the exact image Jasher repeats over each brother — embalmed, coffined, not yet carried home.'),
  ('jasher', 'jasher', 62, 23, 'canon', 'genesis', 49, 33, 'free', E'Genesis 49:33 — *And when Jacob had made an end of commanding his sons, he gathered up his feet into the bed, and yielded up the ghost, and was gathered unto his people.* As Jacob was gathered to his people, so Judah and his brethren in Jasher 62 die into the hands of their children, the seed-line kept across the deaths.'),
  ('jasher', 'jasher', 62, 1, 'canon', 'acts', 7, 15, 'free', E'Acts 7:15 — *So Jacob went down into Egypt, and died, he, and our fathers,* Stephen names the same Egypt-deaths of the fathers that Jasher 62 records year by year.'),
  ('jasher', 'jasher', 62, 23, 'jubilees', 'jubilees', 46, 8, 'extras', E'Jubilees 46:8 — *And Joseph died in the forty-sixth jubilee, in the sixth week, in the second year, and they buried him in the land of Egypt, and his brethren died after him.* The Jubilees apparatus tells the same passing — Joseph buried, then his brethren dying after — that Jasher 62 spreads across its dated obituaries.'),
  -- thread: jasher-62-hadad-bedad-smote-midian-moab
  ('jasher', 'jasher', 62, 6, 'canon', 'genesis', 36, 35, 'free', E'Genesis 36:35 — *And Husham died, and Hadad the son of Bedad, who smote Midian in the field of Moab, reigned in his stead: and the name of his city was Avith.* Jasher 62 expands this one verse into the full campaign — Hadad son of Bedad smiting Midian in the field of Moab, exactly as Genesis records it.'),
  ('jasher', 'jasher', 62, 3, 'canon', 'genesis', 36, 34, 'free', E'Genesis 36:34 — *And Jobab died, and Husham of the land of Temani reigned in his stead.* Jasher''s Chusham king of Edom, dying just before Hadad reigns, is the Husham of Genesis'' Edomite king-list.'),
  ('jasher', 'jasher', 62, 3, 'canon', 'genesis', 36, 31, 'free', E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* Jasher 62''s Edomite kings warring while Israel sits in Egypt is this verse in motion — Edom crowned before Israel was.'),
  -- thread: jasher-62-esau-edom-set-apart-seed-multiplies
  ('jasher', 'jasher', 62, 25, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* Jasher 62 sets the children of Esau (Zepho, Hadad) over against the sons of Jacob in Egypt — the very election Malachi names.'),
  ('jasher', 'jasher', 62, 25, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* The endless Edomite warring of Jasher 62 is the violence Obadiah lays against Edom''s account.'),
  ('jasher', 'jasher', 62, 1, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The years Jasher counts — the seventy-ninth and onward of the going-down to Egypt — are the four hundred years foretold to Abram running their course.'),
  ('jasher', 'jasher', 62, 1, 'jubilees', 'jubilees', 46, 1, 'extras', E'Jubilees 46:1 — *And it came to pass that after Jacob died the children of Yashar''el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* The Jubilees apparatus marks the same season Jasher 62 counts through — the fathers dying, the seed multiplying toward the bondage.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja62_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja62_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-62-sons-die-coffins-egypt',
       E'The sons of Jacob die in Egypt — into coffins, one generation passing',
       E'Jasher counts off the deaths of Jacob''s sons year by year in Egypt: *In that year, being the seventy-ninth year of the Israelites going down to Egypt, died Reuben the son of Jacob, in the land of Egypt; Reuben was a hundred and twenty-five years old when he died, and they put him into a coffin, and he was given into the hands of his children.* (Jasher 62:1) — and so Dan, Issachar, Asher, Gad, Judah, and Naphtali follow, each *put into a coffin in Egypt, and given into the hands of his children* (Jasher 62:3, 23). This is the canon''s own closing of the patriarchal age, only slowed to a roll-call. Exodus seals the whole generation in a single breath: *And Joseph died, and all his brethren, and all that generation.* (Exodus 1:6) Stephen tells it the same way before the council: *So Jacob went down into Egypt, and died, he, and our fathers,* (Acts 7:15). Jasher''s repeated coffin is Joseph''s own ending carried back onto every brother: *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* (Genesis 50:26) — the embalmed body, the coffin, the land not yet left. And the fathers do not die as men cut off but *gathered unto their people*, the way Jacob did: *And when Jacob had made an end of commanding his sons, he gathered up his feet into the bed, and yielded up the ghost, and was gathered unto his people.* (Genesis 49:33) The Jubilees apparatus narrates the very same passing: *And Joseph died in the forty-sixth jubilee, in the sixth week, in the second year, and they buried him in the land of Egypt, and his brethren died after him.* (Jubilees 46:8) It ain''t new — Jasher only names, one by one, the brethren Scripture buries together.',
       sv.verse_id, ev.verse_id, 'extras', 56525
  FROM _session252_ja62_lookup sv, _session252_ja62_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=62 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-62-hadad-bedad-smote-midian-moab',
       E'Hadad son of Bedad, who smote Midian in the field of Moab — Genesis 36 expanded',
       E'Jasher names the kings of Edom and the war they fought: *And in that year died Chusham king of Edom, and after him reigned Hadad the son of Bedad, for thirty-five years* (Jasher 62:3), and then *Hadad assembled all the children of Esau... and he directed his way to the land of Moab, and he went to fight with Moab* (Jasher 62:6) — a campaign Jasher draws out for fifteen verses of Edom against Moab and Midian. This is no invention floating free of the canon: it is the unfolding of one of the briefest lines in Genesis'' king-list of Edom. *And Husham died, and Hadad the son of Bedad, who smote Midian in the field of Moab, reigned in his stead: and the name of his city was Avith.* (Genesis 36:35) — Chusham/Husham, Hadad son of Bedad, and the smiting of Midian in the field of Moab, all three sit verbatim in Genesis, and Jasher simply tells the battle the verse only mentions. The king-list itself belongs to the line set outside the covenant promise: *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* (Genesis 36:31) — Edom had its crowns and its conquests before Israel ever had a king. It ain''t new: Jasher''s whole Edomite war is Genesis 36:35 read slowly.',
       sv.verse_id, ev.verse_id, 'extras', 56528
  FROM _session252_ja62_lookup sv, _session252_ja62_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=62 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-62-esau-edom-set-apart-seed-multiplies',
       E'Esau set apart, the bondage clock running, the seed multiplying',
       E'Jasher keeps a running count by the years of *the Israelites going down to Egypt* (Jasher 62:1) — the seventy-ninth, the eightieth, the ninety-first — and across the same years it traces Edom''s wars and the rise of Zepho and the children of Esau. The two houses are held apart on the page exactly as the prophets hold them apart. Esau is the brother loved and the brother passed over: *Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob, And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* (Malachi 1:2-3) Edom''s violence against the brother is named for judgment: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* (Obadiah 1:10) Election precedes everything here — the seed is set apart before any deed. And the very clock Jasher counts by is the clock Yahuah set to Abram: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* (Genesis 15:13) The Jubilees apparatus marks the same turning — the fathers dead, the nation swelling under the affliction to come: *And it came to pass that after Jacob died the children of Yashar''el (Israel) multiplied in the land of Egypt, and they became a great nation* (Jubilees 46:1). It ain''t new — Jasher''s obituaries and wars are the years of Abraham''s promised four hundred running out.',
       sv.verse_id, ev.verse_id, 'extras', 56531
  FROM _session252_ja62_lookup sv, _session252_ja62_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=62 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-62-sons-die-coffins-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:6 — *And Joseph died, and all his brethren, and all that generation.* Jasher 62 unfolds this single verse into a year-by-year roll-call of the brothers'' deaths in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-sons-die-coffins-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:26 — *So Joseph died, being an hundred and ten years old: and they embalmed him, and he was put in a coffin in Egypt.* Joseph''s coffin in Egypt is the exact image Jasher repeats over each brother — embalmed, coffined, not yet carried home.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-sons-die-coffins-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:33 — *And when Jacob had made an end of commanding his sons, he gathered up his feet into the bed, and yielded up the ghost, and was gathered unto his people.* As Jacob was gathered to his people, so Judah and his brethren in Jasher 62 die into the hands of their children, the seed-line kept across the deaths.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-sons-die-coffins-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:15 — *So Jacob went down into Egypt, and died, he, and our fathers,* Stephen names the same Egypt-deaths of the fathers that Jasher 62 records year by year.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-sons-die-coffins-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 46:8 — *And Joseph died in the forty-sixth jubilee, in the sixth week, in the second year, and they buried him in the land of Egypt, and his brethren died after him.* The Jubilees apparatus tells the same passing — Joseph buried, then his brethren dying after — that Jasher 62 spreads across its dated obituaries.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-sons-die-coffins-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=23
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-62-hadad-bedad-smote-midian-moab
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:35 — *And Husham died, and Hadad the son of Bedad, who smote Midian in the field of Moab, reigned in his stead: and the name of his city was Avith.* Jasher 62 expands this one verse into the full campaign — Hadad son of Bedad smiting Midian in the field of Moab, exactly as Genesis records it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-hadad-bedad-smote-midian-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:34 — *And Jobab died, and Husham of the land of Temani reigned in his stead.* Jasher''s Chusham king of Edom, dying just before Hadad reigns, is the Husham of Genesis'' Edomite king-list.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-hadad-bedad-smote-midian-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* Jasher 62''s Edomite kings warring while Israel sits in Egypt is this verse in motion — Edom crowned before Israel was.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-hadad-bedad-smote-midian-moab'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-62-esau-edom-set-apart-seed-multiplies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* Jasher 62 sets the children of Esau (Zepho, Hadad) over against the sons of Jacob in Egypt — the very election Malachi names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-esau-edom-set-apart-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* The endless Edomite warring of Jasher 62 is the violence Obadiah lays against Edom''s account.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-esau-edom-set-apart-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The years Jasher counts — the seventy-ninth and onward of the going-down to Egypt — are the four hundred years foretold to Abram running their course.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-esau-edom-set-apart-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 46:1 — *And it came to pass that after Jacob died the children of Yashar''el (Israel) multiplied in the land of Egypt, and they became a great nation, and they were of one accord in heart, so that brother loved brother and every man helped his brother, and they increased abundantly and multiplied exceedingly, ten weeks of years, all the days of the life of Joseph.* The Jubilees apparatus marks the same season Jasher 62 counts through — the fathers dying, the seed multiplying toward the bondage.'
  FROM cross_reference_threads t, cross_references x, _session252_ja62_lookup sv, _session252_ja62_lookup tv
 WHERE t.slug='jasher-62-esau-edom-set-apart-seed-multiplies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

