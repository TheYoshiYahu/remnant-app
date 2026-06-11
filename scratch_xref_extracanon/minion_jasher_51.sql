-- ----- fragment: minion_jasher_51.sql (session252 jasher 51) -----
-- Source anchor: jasher/jasher ch51. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja51 (view _session252_ja51_lookup). Sort band base 56250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja51_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-51-down-to-egypt-for-corn
  ('jasher', 'jasher', 51, 1, 'canon', 'genesis', 42, 1, 'free', E'Genesis 42:1 — *Now when Jacob saw that there was corn in Egypt, Jacob said unto his sons, Why do ye look one upon another?* The same famine that opens Jasher 51:1 sends Jacob''s sons down in the canon''s own account.'),
  ('jasher', 'jasher', 51, 3, 'canon', 'genesis', 42, 3, 'free', E'Genesis 42:3 — *And Joseph’s ten brethren went down to buy corn in Egypt.* Jasher 51:3-5 numbers the same ten brethren going down to buy corn in Egypt.'),
  ('jasher', 'jasher', 51, 5, 'canon', 'genesis', 42, 4, 'free', E'Genesis 42:4 — *But Benjamin, Joseph’s brother, Jacob sent not with his brethren; for he said, Lest peradventure mischief befall him.* Jacob''s fear in Jasher 51:5 that Benjamin meet the road-mischief of his brother is the very reason Genesis gives for keeping him home.'),
  ('jasher', 'jasher', 51, 1, 'jubilees', 'jubilees', 42, 4, 'extras', E'Jubilees 42:4 — *(Now the famine was very sore in the land of Canaan), and Jacob heard that there was food in Egypt, and he sent his ten sons that they should procure food for him in Egypt; but Benjamin he did not send.* The live Jubilees apparatus carries the identical descent of the ten in famine, Benjamin withheld.'),
  -- thread: jasher-51-joseph-knew-them-spies
  ('jasher', 'jasher', 51, 20, 'canon', 'genesis', 42, 8, 'free', E'Genesis 42:8 — *And Joseph knew his brethren, but they knew not him.* Word for word the recognition of Jasher 51:20 — the brother they sold stands ruling, unrecognized.'),
  ('jasher', 'jasher', 51, 24, 'canon', 'genesis', 42, 9, 'free', E'Genesis 42:9 — *And Joseph remembered the dreams which he dreamed of them, and said unto them, Ye are spies; to see the nakedness of the land ye are come.* Joseph''s spy-charge and "nakedness of the land" in Jasher 51:24 is the canon''s own accusation.'),
  ('jasher', 'jasher', 51, 33, 'canon', 'genesis', 42, 15, 'free', E'Genesis 42:15 — *Hereby ye shall be proved: By the life of Pharaoh ye shall not go forth hence, except your youngest brother come hither.* The demand that the youngest be brought as proof, sworn by Pharaoh''s life, matches Joseph''s test in Jasher 51:33.'),
  ('jasher', 'jasher', 51, 20, 'jubilees', 'jubilees', 42, 5, 'extras', E'Jubilees 42:5 — *And Joseph recognized them, but they did not recognize him, and he spake to them and questioned them, and he said to them: “Are you not spies, and have you not come to explore the approaches of the land?” And he put them in ward.* The live Jubilees layer carries the same recognition and spy-charge as Jasher 51:20-24.'),
  -- thread: jasher-51-guilty-concerning-our-brother
  ('jasher', 'jasher', 51, 51, 'canon', 'genesis', 42, 21, 'free', E'Genesis 42:21 — *And they said one to another, We are verily guilty concerning our brother, in that we saw the anguish of his soul, when he besought us, and we would not hear; therefore is this distress come upon us.* Judah''s confession in Jasher 51:51 of guilt for selling their own flesh is the canon''s own road-side reckoning.'),
  ('jasher', 'jasher', 51, 52, 'canon', 'genesis', 42, 22, 'free', E'Genesis 42:22 — *And Reuben answered them, saying, Spake I not unto you, saying, Do not sin against the child; and ye would not hear? therefore, behold, also his blood is required.* Reuben''s "said I not... do not sin against the lad" in Jasher 51:52 is verbatim the canon''s Reuben.'),
  ('jasher', 'jasher', 51, 51, 'canon', 'genesis', 37, 26, 'free', E'Genesis 37:26 — *And Yahudah (Judah) said unto his brethren, What profit is it if we slay our brother, and conceal his blood?* The sin Judah confesses in Jasher 51:51 was his own earlier counsel to sell rather than slay Joseph.'),
  ('jasher', 'jasher', 51, 51, 'canon', 'genesis', 37, 28, 'free', E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* "Having sold our brother" (Jasher 51:51) points back to this selling into Egypt that now stands ruling over them.'),
  -- thread: jasher-51-simeon-bound-joseph-wept
  ('jasher', 'jasher', 51, 37, 'canon', 'genesis', 42, 24, 'free', E'Genesis 42:24 — *And he turned himself about from them, and wept; and returned to them again, and communed with them, and took from them Simeon, and bound him before their eyes.* Joseph''s chamber-weeping and the taking of Simeon in Jasher 51:37 is the canon''s own turning-aside to weep.'),
  ('jasher', 'jasher', 51, 39, 'canon', 'genesis', 42, 19, 'free', E'Genesis 42:19 — *If ye be true men, let one of your brethren be bound in the house of your prison: go ye, carry corn for the famine of your houses.* The order to confine one brother in prison while the rest carry corn home (Jasher 51:39, 46) is Joseph''s third-day verdict in Genesis.'),
  ('jasher', 'jasher', 51, 37, 'jubilees', 'jubilees', 42, 6, 'extras', E'Jubilees 42:6 — *And after that he set them free again, and detained Simeon alone and sent off his nine brothers. And he filled their sacks with corn, and he put their gold in their sacks, and they did not know.* The live Jubilees layer keeps Simeon detained and the gold secretly restored, as Jasher 51:37-45.'),
  -- thread: jasher-51-smiting-of-shechem
  ('jasher', 'jasher', 51, 32, 'canon', 'genesis', 34, 25, 'free', E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The "two of your brethren smote Shechem... on account of your sister" that Joseph cites in Jasher 51:32 is this Genesis deed.'),
  ('jasher', 'jasher', 51, 32, 'canon', 'genesis', 34, 24, 'free', E'Genesis 34:24 — *And unto Hamor and unto Shechem his son hearkened all that went out of the gate of his city; and every male was circumcised, all that went out of the gate of his city.* The circumcision that left Shechem''s men "sore" sets up the very smiting Joseph recalls in Jasher 51:32.'),
  -- thread: jasher-51-money-restored-hand-of-god
  ('jasher', 'jasher', 51, 49, 'canon', 'genesis', 42, 28, 'free', E'Genesis 42:28 — *And he said unto his brethren, My money is restored; and, lo, it is even in my sack: and their heart failed them, and they were afraid, saying one to another, What is this that Elohim (God) hath done unto us?* The restored silver and the very cry of Jasher 51:49 are the canon''s own inn-scene, word for word.'),
  ('jasher', 'jasher', 51, 50, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The brothers'' fearful "what has Elohim done to us?" (Jasher 51:49-50) is the providence Joseph will later name as good for the saving of the covenant seed.'),
  ('jasher', 'jasher', 51, 50, 'canon', 'genesis', 50, 24, 'free', E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* The kindness with Abraham, Isaac and Jacob the brothers fear is lost (Jasher 51:50) is the very covenant Joseph confesses Elohim will keep by the visitation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja51_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja51_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-51-down-to-egypt-for-corn',
       E'The ten go down to buy corn',
       E'Jasher opens exactly where Genesis 42 opens — the famine drives Jacob to send his sons down to Egypt: *And Jacob afterward heard that there was corn in Egypt, and he called to his sons to go to Egypt to buy corn, for upon them also did the famine prevail* (Jasher 51:1), and ten go while Benjamin is kept back lest *an accident might befall him on the road like his brother* (Jasher 51:5). It ain''t new — this is the canon''s own scene, retold. Genesis sets it down first: *Now when Jacob saw that there was corn in Egypt, Jacob said unto his sons, Why do ye look one upon another?* (Genesis 42:1), and again *And Joseph’s ten brethren went down to buy corn in Egypt* (Genesis 42:3), with *But Benjamin, Joseph’s brother, Jacob sent not with his brethren; for he said, Lest peradventure mischief befall him* (Genesis 42:4). Jubilees narrates the same descent of the covenant seed in famine: *(Now the famine was very sore in the land of Canaan), and Jacob heard that there was food in Egypt, and he sent his ten sons that they should procure food for him in Egypt; but Benjamin he did not send* (Jubilees 42:4).',
       sv.verse_id, ev.verse_id, 'extras', 56250
  FROM _session252_ja51_lookup sv, _session252_ja51_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=51 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-51-joseph-knew-them-spies',
       E'Joseph knew them; they knew him not — "ye are spies"',
       E'Brought before the throne, the brothers bow and Joseph recognizes them while they remain blind to him: *And Joseph saw his brethren, and he knew them, but they knew him not, for Joseph was very great in their eyes, therefore they knew him not* (Jasher 51:20). He presses the same charge the canon records — *That is the thing which I spoke to you, you have come to spy through the land... you have come to see the nakedness of the land* (Jasher 51:24) — and demands the youngest be fetched as proof: *if you will send home one from amongst you to fetch your youngest brother from your father, and to bring him here to me... I will know that you are right* (Jasher 51:33). This is Genesis 42 unfolded. The source: *And Joseph saw his brethren, and he knew them, but made himself strange unto them, and spake roughly unto them* (Genesis 42:7); *And Joseph knew his brethren, but they knew not him* (Genesis 42:8); *And Joseph remembered the dreams which he dreamed of them, and said unto them, Ye are spies; to see the nakedness of the land ye are come* (Genesis 42:9); *Hereby ye shall be proved: By the life of Pharaoh ye shall not go forth hence, except your youngest brother come hither* (Genesis 42:15). Jubilees keeps the same testing: *“Are you not spies, and have you not come to explore the approaches of the land?” And he put them in ward* (Jubilees 42:5).',
       sv.verse_id, ev.verse_id, 'extras', 56253
  FROM _session252_ja51_lookup sv, _session252_ja51_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=20
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=51 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-51-guilty-concerning-our-brother',
       E'The brothers'' guilt: "we sold our brother, our own flesh"',
       E'On the road the conscience of Genesis 37 returns upon them. Judah and Reuben name the old sin outright: *Surely we are guilty sinners before Yahuah our Elohim (the Lord our God) in having sold our brother, our own flesh* (Jasher 51:51), and Reuben answers, *Said I not to you, do not sin against the lad, and you would not listen to me? now Elohim requires him from us* (Jasher 51:52). The canon places the very same confession at this moment: *And they said one to another, We are verily guilty concerning our brother, in that we saw the anguish of his soul, when he besought us, and we would not hear; therefore is this distress come upon us* (Genesis 42:21), and Reuben''s rebuke — *Spake I not unto you, saying, Do not sin against the child; and ye would not hear? therefore, behold, also his blood is required* (Genesis 42:22). The sin they confess was Judah''s own counsel back in Genesis: *And Yahudah (Judah) said unto his brethren, What profit is it if we slay our brother, and conceal his blood?* (Genesis 37:26), the selling itself — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt* (Genesis 37:28). It ain''t new: the seed is chastened but kept, the guilt confessed before the throne it could not see.',
       sv.verse_id, ev.verse_id, 'extras', 56256
  FROM _session252_ja51_lookup sv, _session252_ja51_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=49
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=51 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-51-simeon-bound-joseph-wept',
       E'Simeon bound; Joseph turns aside and weeps',
       E'Joseph keeps one brother behind and slips away to weep before binding Simeon: *And Joseph went out from them and came into the chamber, and wept a great weeping, for his pity was excited for them, and he washed his face, and returned to them again, and he took Simeon from them and ordered him to be bound* (Jasher 51:37); *Seize this man and confine him in prison until his brethren come to him* (Jasher 51:39). Genesis records the same tears and the same detained brother: *And he turned himself about from them, and wept; and returned to them again, and communed with them, and took from them Simeon, and bound him before their eyes* (Genesis 42:24), the third-day verdict being *If ye be true men, let one of your brethren be bound in the house of your prison: go ye, carry corn for the famine of your houses* (Genesis 42:19). Jasher adds its own legendary color — Simeon too strong to bind until Manasseh subdues him, and Simeon''s word *None of you must say that this is the smiting of an Egyptian, but it is the smiting of the house of my father* (Jasher 51:44) — but anchored to the canon''s true scene. Jubilees keeps the same detention: *And after that he set them free again, and detained Simeon alone and sent off his nine brothers* (Jubilees 42:6).',
       sv.verse_id, ev.verse_id, 'extras', 56259
  FROM _session252_ja51_lookup sv, _session252_ja51_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=37
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=51 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-51-smiting-of-shechem',
       E'"Two of your brethren smote Shechem" — Simeon and Levi remembered',
       E'Joseph throws their own history at them as ground for the spy-charge: *for we heard that two of your brethren smote all the inhabitants of Shechem, in the land of Canaan, on account of your sister, and you now come to do the like in Egypt on account of your brother* (Jasher 51:32). The deed he names is fixed in Genesis: *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males* (Genesis 34:25), after *every male was circumcised, all that went out of the gate of his city* (Genesis 34:24). Jasher''s expansion is honest memory of the canon''s own Dinah-vengeance, woven here to sharpen Joseph''s pressure on the brothers — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56262
  FROM _session252_ja51_lookup sv, _session252_ja51_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=31
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=51 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-51-money-restored-hand-of-god',
       E'The money restored — "What is this that Elohim has done to us?"',
       E'At the inn the silver is found back in the sack, and the brothers read the hand of Elohim in it: *My money is restored, and lo, it is even in my sack... What is this that Elohim (God) has done to us?* (Jasher 51:49), and they ask *where is Yahuah (the Lord)’s kindness with our fathers, with Abraham, Isaac, and Jacob* (Jasher 51:50). Genesis records the identical discovery and the identical confession of the divine hand: *And he said unto his brethren, My money is restored; and, lo, it is even in my sack: and their heart failed them, and they were afraid, saying one to another, What is this that Elohim (God) hath done unto us?* (Genesis 42:28). The whole testing is the providence Joseph himself later names — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). The covenant seed is preserved through famine toward the visitation Joseph will promise: *I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob* (Genesis 50:24). Election kept; the kindness with the fathers does not fail.',
       sv.verse_id, ev.verse_id, 'extras', 56265
  FROM _session252_ja51_lookup sv, _session252_ja51_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=48
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=51 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-51-down-to-egypt-for-corn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:1 — *Now when Jacob saw that there was corn in Egypt, Jacob said unto his sons, Why do ye look one upon another?* The same famine that opens Jasher 51:1 sends Jacob''s sons down in the canon''s own account.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-down-to-egypt-for-corn'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:3 — *And Joseph’s ten brethren went down to buy corn in Egypt.* Jasher 51:3-5 numbers the same ten brethren going down to buy corn in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-down-to-egypt-for-corn'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:4 — *But Benjamin, Joseph’s brother, Jacob sent not with his brethren; for he said, Lest peradventure mischief befall him.* Jacob''s fear in Jasher 51:5 that Benjamin meet the road-mischief of his brother is the very reason Genesis gives for keeping him home.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-down-to-egypt-for-corn'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 42:4 — *(Now the famine was very sore in the land of Canaan), and Jacob heard that there was food in Egypt, and he sent his ten sons that they should procure food for him in Egypt; but Benjamin he did not send.* The live Jubilees apparatus carries the identical descent of the ten in famine, Benjamin withheld.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-down-to-egypt-for-corn'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=42 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-51-joseph-knew-them-spies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:8 — *And Joseph knew his brethren, but they knew not him.* Word for word the recognition of Jasher 51:20 — the brother they sold stands ruling, unrecognized.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-joseph-knew-them-spies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:9 — *And Joseph remembered the dreams which he dreamed of them, and said unto them, Ye are spies; to see the nakedness of the land ye are come.* Joseph''s spy-charge and "nakedness of the land" in Jasher 51:24 is the canon''s own accusation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-joseph-knew-them-spies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:15 — *Hereby ye shall be proved: By the life of Pharaoh ye shall not go forth hence, except your youngest brother come hither.* The demand that the youngest be brought as proof, sworn by Pharaoh''s life, matches Joseph''s test in Jasher 51:33.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-joseph-knew-them-spies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 42:5 — *And Joseph recognized them, but they did not recognize him, and he spake to them and questioned them, and he said to them: “Are you not spies, and have you not come to explore the approaches of the land?” And he put them in ward.* The live Jubilees layer carries the same recognition and spy-charge as Jasher 51:20-24.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-joseph-knew-them-spies'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=42 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-51-guilty-concerning-our-brother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:21 — *And they said one to another, We are verily guilty concerning our brother, in that we saw the anguish of his soul, when he besought us, and we would not hear; therefore is this distress come upon us.* Judah''s confession in Jasher 51:51 of guilt for selling their own flesh is the canon''s own road-side reckoning.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-guilty-concerning-our-brother'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:22 — *And Reuben answered them, saying, Spake I not unto you, saying, Do not sin against the child; and ye would not hear? therefore, behold, also his blood is required.* Reuben''s "said I not... do not sin against the lad" in Jasher 51:52 is verbatim the canon''s Reuben.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-guilty-concerning-our-brother'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 37:26 — *And Yahudah (Judah) said unto his brethren, What profit is it if we slay our brother, and conceal his blood?* The sin Judah confesses in Jasher 51:51 was his own earlier counsel to sell rather than slay Joseph.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-guilty-concerning-our-brother'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* "Having sold our brother" (Jasher 51:51) points back to this selling into Egypt that now stands ruling over them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-guilty-concerning-our-brother'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-51-simeon-bound-joseph-wept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:24 — *And he turned himself about from them, and wept; and returned to them again, and communed with them, and took from them Simeon, and bound him before their eyes.* Joseph''s chamber-weeping and the taking of Simeon in Jasher 51:37 is the canon''s own turning-aside to weep.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-simeon-bound-joseph-wept'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 42:19 — *If ye be true men, let one of your brethren be bound in the house of your prison: go ye, carry corn for the famine of your houses.* The order to confine one brother in prison while the rest carry corn home (Jasher 51:39, 46) is Joseph''s third-day verdict in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-simeon-bound-joseph-wept'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 42:6 — *And after that he set them free again, and detained Simeon alone and sent off his nine brothers. And he filled their sacks with corn, and he put their gold in their sacks, and they did not know.* The live Jubilees layer keeps Simeon detained and the gold secretly restored, as Jasher 51:37-45.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-simeon-bound-joseph-wept'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=37
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=42 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-51-smiting-of-shechem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The "two of your brethren smote Shechem... on account of your sister" that Joseph cites in Jasher 51:32 is this Genesis deed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-smiting-of-shechem'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:24 — *And unto Hamor and unto Shechem his son hearkened all that went out of the gate of his city; and every male was circumcised, all that went out of the gate of his city.* The circumcision that left Shechem''s men "sore" sets up the very smiting Joseph recalls in Jasher 51:32.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-smiting-of-shechem'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-51-money-restored-hand-of-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 42:28 — *And he said unto his brethren, My money is restored; and, lo, it is even in my sack: and their heart failed them, and they were afraid, saying one to another, What is this that Elohim (God) hath done unto us?* The restored silver and the very cry of Jasher 51:49 are the canon''s own inn-scene, word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-money-restored-hand-of-god'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The brothers'' fearful "what has Elohim done to us?" (Jasher 51:49-50) is the providence Joseph will later name as good for the saving of the covenant seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-money-restored-hand-of-god'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* The kindness with Abraham, Isaac and Jacob the brothers fear is lost (Jasher 51:50) is the very covenant Joseph confesses Elohim will keep by the visitation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja51_lookup sv, _session252_ja51_lookup tv
 WHERE t.slug='jasher-51-money-restored-hand-of-god'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=51 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

