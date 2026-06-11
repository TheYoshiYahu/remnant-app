-- ----- fragment: minion_jasher_57.sql (session252 jasher 57) -----
-- Source anchor: jasher/jasher ch57. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja57 (view _session252_ja57_lookup). Sort band base 56400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja57_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-57-esau-wars-jacob
  ('jasher', 'jasher', 57, 1, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Esau lying dead and his sons smitten at Hebron in Jasher 57:1 is the brother-violence Obadiah indicts against Edom.'),
  ('jasher', 'jasher', 57, 2, 'canon', 'obadiah', 1, 18, 'free', E'Obadiah 1:18 — *And the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble, and they shall kindle in them, and devour them; and there shall not be any remaining of the house of Esau; for Yahuah (LORD) hath spoken it.* Joseph''s hand prevailing over all the people of Esau in Jasher 57:2 is the flame of Joseph that devours Esau for stubble.'),
  ('jasher', 'jasher', 57, 2, 'jubilees', 'jubilees', 38, 8, 'extras', E'Jubilees 38:8 — *And Simeon and Benjamin and Enoch, Reuben’s son, went forth on the west side of the tower, and fifty (men) with them, and they slew of Edom and of the Horites four hundred men, stout warriors; and six hundred fled, and four of the sons of Esau fled with them, and left their father lying slain, as he had fallen on the hill which is in ’Adûrâm.* The Jubilees apparatus records the very same battle and the slaying of the sons of Esau that Jasher 57:2 retells.'),
  ('jasher', 'jasher', 57, 1, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* The Esau-against-Jacob war of Jasher 57:1 stands inside the election divide Malachi names — the two brothers, the two heritages.'),
  -- thread: jasher-57-esau-buried-seir-edom
  ('jasher', 'jasher', 57, 4, 'canon', 'genesis', 36, 8, 'free', E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* Jasher 57:4 buries Esau in the very mount Seir that Genesis assigns to him as Edom.'),
  ('jasher', 'jasher', 57, 3, 'canon', 'malachi', 1, 3, 'free', E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* The flight of Esau''s sons to the mountains of Seir with their father''s body in Jasher 57:3 leads to the wasted heritage Malachi pronounces on Esau.'),
  ('jasher', 'jasher', 57, 4, 'canon', 'malachi', 1, 4, 'free', E'Malachi 1:4 — *Whereas Edom saith, We are impoverished, but we will return and build the desolate places; thus saith Yahuah Tseva''ot (LORD of hosts), They shall build, but I will throw down; and they shall call them, The border of wickedness, and, The people against whom Yahuah (LORD) hath indignation for ever.* Esau settled and buried in Seir (Jasher 57:4) is the Edom on whom Yahuah''s lasting indignation rests.'),
  -- thread: jasher-57-esau-dispossess-horites
  ('jasher', 'jasher', 57, 36, 'canon', 'genesis', 36, 20, 'free', E'Genesis 36:20 — *These are the sons of Seir the Horite, who inhabited the land; Lotan, and Shobal, and Zibeon, and Anah,* The children of Seir whom Esau dispossesses in Jasher 57:36 are the Horite house Genesis names as the land''s first inhabitants.'),
  ('jasher', 'jasher', 57, 37, 'canon', 'genesis', 36, 21, 'free', E'Genesis 36:21 — *And Dishon, and Ezer, and Dishan: these are the dukes of the Horites, the children of Seir in the land of Edom.* Jasher 57:37 has Esau seizing all that belonged to these very children of Seir the Horite in the land of Edom.'),
  ('jasher', 'jasher', 57, 36, 'canon', 'deuteronomy', 2, 12, 'free', E'Deuteronomy 2:12 — *The Horims also dwelt in Seir beforetime; but the children of Esau succeeded them, when they had destroyed them from before them, and dwelt in their stead; as Yashar''el (Israel) did unto the land of his possession, which Yahuah (LORD) gave unto them.* Moses records the exact dispossession Jasher 57:36 narrates — Esau destroying the Horim and dwelling in their stead in Seir.'),
  ('jasher', 'jasher', 57, 37, 'canon', 'deuteronomy', 2, 22, 'free', E'Deuteronomy 2:22 — *As he did to the children of Esau, which dwelt in Seir, when he destroyed the Horims from before them; and they succeeded them, and dwelt in their stead even unto this day:* The canon''s ''even unto this day'' matches Jasher 57:37''s ''to this day'' — Esau possessing Seir in the Horites'' stead.'),
  ('jasher', 'jasher', 57, 35, 'jubilees', 'jubilees', 38, 10, 'extras', E'Jubilees 38:10 — *And the sons of Jacob pressed hard upon the sons of Esau in the mountains of Seir, and bowed their necks so that they became servants of the sons of Jacob.* The Jubilees apparatus binds the same Seir conflict that Jasher 57:35 carries into the slaughter and resettling of the Horite land.'),
  -- thread: jasher-57-bela-son-of-beor-edom-king
  ('jasher', 'jasher', 57, 41, 'canon', 'genesis', 36, 32, 'free', E'Genesis 36:32 — *And Bela the son of Beor reigned in Edom: and the name of his city was Dinhabah.* Jasher 57:41 names the same first king of Edom, Bela son of Beor, even fixing his city as Dinhabah exactly as Genesis does.'),
  ('jasher', 'jasher', 57, 42, 'canon', 'genesis', 36, 31, 'free', E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* The crowning of Bela in Jasher 57:42 begins the very Edomite kingship Genesis dates before Israel ever had a king.'),
  ('jasher', 'jasher', 57, 42, 'jubilees', 'jubilees', 38, 16, 'extras', E'Jubilees 38:16 — *And Bâlâq, the son of Beor, reigned in Edom, and the name of his city was Danâbâ.* The Jubilees apparatus opens the Edom king-list with the same son of Beor and the same city that Jasher 57:42 crowns over Esau.'),
  ('jasher', 'jasher', 57, 40, 'jubilees', 'jubilees', 38, 14, 'extras', E'Jubilees 38:14 — *And the sons of Edom have not got quit of the yoke of servitude which the twelve sons of Jacob had imposed on them until this day. And these are the kings that reigned in Edom before there reigned any king over the children of Yashar’el (Israel) until this day in the land of Edom.* Jasher 57:40''s vow to take a king ''from a strange land to this day'' frames the same Edomite king-list Jubilees opens here.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja57_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja57_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-57-esau-wars-jacob',
       E'The sons of Esau war with the sons of Jacob — Joseph a flame, Esau stubble',
       E'*And it was after this that the sons of Esau waged war with the sons of Jacob, and the sons of Esau fought with the sons of Jacob in Hebron, and Esau was still lying dead, and not buried* (Jasher 57:1) — and *the sons of Jacob slew of the sons of Esau eighty men, and not one died of the people of the sons of Jacob; and the hand of Joseph prevailed over all the people of the sons of Esau* (Jasher 57:2). This is the brother-war the prophets name: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10), and the very picture of Joseph''s prevailing hand — *And the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble, and they shall kindle in them, and devour them; and there shall not be any remaining of the house of Esau; for Yahuah (LORD) hath spoken it* (Obadiah 1:18). The Jubilees apparatus narrates the same battle and the same slaughter: *And Simeon and Benjamin and Enoch, Reuben’s son, went forth on the west side of the tower, and fifty (men) with them, and they slew of Edom and of the Horites four hundred men, stout warriors; and six hundred fled, and four of the sons of Esau fled with them, and left their father lying slain, as he had fallen on the hill which is in ’Adûrâm* (Jubilees 38:8). It ain''t new: the elder serving the younger, the heritage of Esau and the heritage of Jacob set apart — *Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob* (Malachi 1:2).',
       sv.verse_id, ev.verse_id, 'extras', 56400
  FROM _session252_ja57_lookup sv, _session252_ja57_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=57 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-57-esau-buried-seir-edom',
       E'Esau buried in Seir — thus dwelt Esau in mount Seir, he is Edom',
       E'*And it came to pass when the sons of Esau had fled from before the sons of Jacob... they all fled with Eliphaz the son of Esau and his people, with Esau’s body, and they went on their road to Mount Seir* (drawn from Jasher 57:3), *And they came to Mount Seir and they buried Esau in Seir, but they had not brought his head with them to Seir, for it was buried in that place where the battle had been in Hebron* (Jasher 57:4). Genesis fixes Esau in that same land and seals his name: *Thus dwelt Esau in mount Seir: Esau is Edom* (Genesis 36:8). And the seed-line is divided there once for all — not a church replacing a people but the elder set outside the chosen seed: *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* (Malachi 1:3). *Whereas Edom saith, We are impoverished, but we will return and build the desolate places; thus saith Yahuah Tseva''ot (LORD of hosts), They shall build, but I will throw down; and they shall call them, The border of wickedness, and, The people against whom Yahuah (LORD) hath indignation for ever* (Malachi 1:4). It ain''t new — Jasher buries Esau in the very Seir the canon assigns him.',
       sv.verse_id, ev.verse_id, 'extras', 56403
  FROM _session252_ja57_lookup sv, _session252_ja57_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=57 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-57-esau-dispossess-horites',
       E'The children of Esau dispossess the Horites and dwell in Seir in their stead',
       E'*And the children of Esau dwelt in Seir in the place of the children of Seir, and they inherited their land and took possession of it* (Jasher 57:36), and *the children of Esau took all belonging in the land to the children of Seir... and the children of Esau dwelt in Seir in the place of the children of Seir to this day* (Jasher 57:37). The canon names that displaced people exactly — *These are the sons of Seir the Horite, who inhabited the land; Lotan, and Shobal, and Zibeon, and Anah* (Genesis 36:20), *And Dishon, and Ezer, and Dishan: these are the dukes of the Horites, the children of Seir in the land of Edom* (Genesis 36:21). And Moses preaches the very dispossession Jasher narrates: *The Horims also dwelt in Seir beforetime; but the children of Esau succeeded them, when they had destroyed them from before them, and dwelt in their stead; as Yashar''el (Israel) did unto the land of his possession, which Yahuah (LORD) gave unto them* (Deuteronomy 2:12), *As he did to the children of Esau, which dwelt in Seir, when he destroyed the Horims from before them; and they succeeded them, and dwelt in their stead even unto this day* (Deuteronomy 2:22). Jubilees keeps the same yoke: *And the sons of Jacob pressed hard upon the sons of Esau in the mountains of Seir, and bowed their necks so that they became servants of the sons of Jacob* (Jubilees 38:10). It ain''t new — Deuteronomy itself testifies that Esau took the Horites'' land and dwelt in their stead.',
       sv.verse_id, ev.verse_id, 'extras', 56406
  FROM _session252_ja57_lookup sv, _session252_ja57_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=35
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=57 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-57-bela-son-of-beor-edom-king',
       E'Bela the son of Beor crowned first king of Edom in Dinhabah',
       E'Embittered against their own brethren, *the sons of Esau swore, saying, From that day forward they would not choose a king from their brethren, but one from a strange land to this day* (Jasher 57:40); so *And all the children of Esau took him and anointed him and they crowned him for a king, and they bowed down to him, and they said to him, May the king live, may the king live* (Jasher 57:42) — the man being *Bela the son of Beor, who was a very valiant man* of the people of Angeas king of Dinhabah (drawn from Jasher 57:41). This is precisely the canon''s Edomite king-list, named before Israel ever had a king: *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel)* (Genesis 36:31), *And Bela the son of Beor reigned in Edom: and the name of his city was Dinhabah* (Genesis 36:32). Jubilees carries the identical roll: *And the sons of Edom have not got quit of the yoke of servitude which the twelve sons of Jacob had imposed on them until this day. And these are the kings that reigned in Edom before there reigned any king over the children of Yashar’el (Israel) until this day in the land of Edom* (Jubilees 38:14), *And Bâlâq, the son of Beor, reigned in Edom, and the name of his city was Danâbâ* (Jubilees 38:16). It ain''t new — Jasher even fixes the same city Dinhabah that Genesis records.',
       sv.verse_id, ev.verse_id, 'extras', 56409
  FROM _session252_ja57_lookup sv, _session252_ja57_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=40
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=57 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-57-esau-wars-jacob
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Esau lying dead and his sons smitten at Hebron in Jasher 57:1 is the brother-violence Obadiah indicts against Edom.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-wars-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Obadiah 1:18 — *And the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble, and they shall kindle in them, and devour them; and there shall not be any remaining of the house of Esau; for Yahuah (LORD) hath spoken it.* Joseph''s hand prevailing over all the people of Esau in Jasher 57:2 is the flame of Joseph that devours Esau for stubble.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-wars-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 38:8 — *And Simeon and Benjamin and Enoch, Reuben’s son, went forth on the west side of the tower, and fifty (men) with them, and they slew of Edom and of the Horites four hundred men, stout warriors; and six hundred fled, and four of the sons of Esau fled with them, and left their father lying slain, as he had fallen on the hill which is in ’Adûrâm.* The Jubilees apparatus records the very same battle and the slaying of the sons of Esau that Jasher 57:2 retells.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-wars-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=38 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* The Esau-against-Jacob war of Jasher 57:1 stands inside the election divide Malachi names — the two brothers, the two heritages.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-wars-jacob'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-57-esau-buried-seir-edom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* Jasher 57:4 buries Esau in the very mount Seir that Genesis assigns to him as Edom.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-buried-seir-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* The flight of Esau''s sons to the mountains of Seir with their father''s body in Jasher 57:3 leads to the wasted heritage Malachi pronounces on Esau.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-buried-seir-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 1:4 — *Whereas Edom saith, We are impoverished, but we will return and build the desolate places; thus saith Yahuah Tseva''ot (LORD of hosts), They shall build, but I will throw down; and they shall call them, The border of wickedness, and, The people against whom Yahuah (LORD) hath indignation for ever.* Esau settled and buried in Seir (Jasher 57:4) is the Edom on whom Yahuah''s lasting indignation rests.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-buried-seir-edom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-57-esau-dispossess-horites
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:20 — *These are the sons of Seir the Horite, who inhabited the land; Lotan, and Shobal, and Zibeon, and Anah,* The children of Seir whom Esau dispossesses in Jasher 57:36 are the Horite house Genesis names as the land''s first inhabitants.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-dispossess-horites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:21 — *And Dishon, and Ezer, and Dishan: these are the dukes of the Horites, the children of Seir in the land of Edom.* Jasher 57:37 has Esau seizing all that belonged to these very children of Seir the Horite in the land of Edom.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-dispossess-horites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 2:12 — *The Horims also dwelt in Seir beforetime; but the children of Esau succeeded them, when they had destroyed them from before them, and dwelt in their stead; as Yashar''el (Israel) did unto the land of his possession, which Yahuah (LORD) gave unto them.* Moses records the exact dispossession Jasher 57:36 narrates — Esau destroying the Horim and dwelling in their stead in Seir.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-dispossess-horites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 2:22 — *As he did to the children of Esau, which dwelt in Seir, when he destroyed the Horims from before them; and they succeeded them, and dwelt in their stead even unto this day:* The canon''s ''even unto this day'' matches Jasher 57:37''s ''to this day'' — Esau possessing Seir in the Horites'' stead.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-dispossess-horites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 38:10 — *And the sons of Jacob pressed hard upon the sons of Esau in the mountains of Seir, and bowed their necks so that they became servants of the sons of Jacob.* The Jubilees apparatus binds the same Seir conflict that Jasher 57:35 carries into the slaughter and resettling of the Horite land.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-esau-dispossess-horites'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=35
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=38 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-57-bela-son-of-beor-edom-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 36:32 — *And Bela the son of Beor reigned in Edom: and the name of his city was Dinhabah.* Jasher 57:41 names the same first king of Edom, Bela son of Beor, even fixing his city as Dinhabah exactly as Genesis does.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-bela-son-of-beor-edom-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 36:31 — *And these are the kings that reigned in the land of Edom, before there reigned any king over the children of Yashar''el (Israel).* The crowning of Bela in Jasher 57:42 begins the very Edomite kingship Genesis dates before Israel ever had a king.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-bela-son-of-beor-edom-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 38:16 — *And Bâlâq, the son of Beor, reigned in Edom, and the name of his city was Danâbâ.* The Jubilees apparatus opens the Edom king-list with the same son of Beor and the same city that Jasher 57:42 crowns over Esau.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-bela-son-of-beor-edom-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=42
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=38 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 38:14 — *And the sons of Edom have not got quit of the yoke of servitude which the twelve sons of Jacob had imposed on them until this day. And these are the kings that reigned in Edom before there reigned any king over the children of Yashar’el (Israel) until this day in the land of Edom.* Jasher 57:40''s vow to take a king ''from a strange land to this day'' frames the same Edomite king-list Jubilees opens here.'
  FROM cross_reference_threads t, cross_references x, _session252_ja57_lookup sv, _session252_ja57_lookup tv
 WHERE t.slug='jasher-57-bela-son-of-beor-edom-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=57 AND sv.verse_number=40
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=38 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

