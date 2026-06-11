-- ----- fragment: minion_jasher_42.sql (session252 jasher 42) -----
-- Source anchor: jasher/jasher ch42. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja42 (view _session252_ja42_lookup). Sort band base 56025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja42_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-42-judah-counsel-sell-not-slay
  ('jasher', 'jasher', 42, 3, 'canon', 'genesis', 37, 26, 'free', E'Genesis 37:26 — *And Yahudah (Judah) said unto his brethren, What profit is it if we slay our brother, and conceal his blood?* The canon''s terse line that Jasher 42:3 expands into Judah''s full speech against shedding a brother''s blood.'),
  ('jasher', 'jasher', 42, 4, 'canon', 'genesis', 37, 27, 'free', E'Genesis 37:27 — *Come, and let us sell him to the Ishmeelites, and let not our hand be upon him; for he is our brother and our flesh. And his brethren were content.* The very ''let not our hand be upon him'' counsel that Jasher 42:4 records the brethren accepting at Judah''s word.'),
  ('jasher', 'jasher', 42, 3, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* Stephen reads the sale Jasher 42:3 narrates as the brethren''s envy overruled by the God who stayed with the rejected one.'),
  ('jasher', 'jasher', 42, 4, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The brethren''s disposal of Joseph in Jasher 42:4 is later named the means by which much people were kept alive — the Messiah-type who saves those who sold him.'),
  -- thread: jasher-42-drawn-from-pit-twenty-silver
  ('jasher', 'jasher', 42, 24, 'canon', 'genesis', 37, 28, 'free', E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* The single canon verse Jasher 42:5-24 unfolds into the whole Midianite-then-Ishmaelite resale for the same twenty pieces of silver.'),
  ('jasher', 'jasher', 42, 6, 'canon', 'psalms', 105, 17, 'free', E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* The pit-cry of Jasher 42:6 read as Yahuah sending Joseph ahead — the affliction is the errand.'),
  ('jasher', 'jasher', 42, 24, 'canon', 'matthew', 26, 15, 'free', E'Matthew 26:15 — *And said unto them, What will ye give me, and I will deliver him unto you? And they covenanted with him for thirty pieces of silver.* The brother bartered for silver in Jasher 42:24 prefigures the greater Joseph delivered up for thirty — the Messiah-type sold by his own.'),
  -- thread: jasher-42-yahuah-with-the-afflicted
  ('jasher', 'jasher', 42, 28, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* The ''but Elohim was with him'' that Jasher 42:28 dramatizes as Yahuah withering the hands of Joseph''s smiters.'),
  ('jasher', 'jasher', 42, 44, 'canon', 'psalms', 105, 18, 'free', E'Psalm 105:18 — *Whose feet they hurt with fetters: he was laid in iron:* The road-affliction of Jasher 42:44 — smitten and terrified — answered by the Psalm that holds Joseph''s suffering and God''s presence together.'),
  -- thread: jasher-42-rachel-grave-yahuah-with-you
  ('jasher', 'jasher', 42, 30, 'canon', 'genesis', 35, 19, 'free', E'Genesis 35:19 — *And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem.* The grave ''in the way'' that Jasher 42:30 has Joseph run to as the Ishmaelites pass along the road of Ephrath.'),
  ('jasher', 'jasher', 42, 39, 'canon', 'psalms', 105, 17, 'free', E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* The grave-voice of Jasher 42:39 (''hope to Yahuah... he will deliver you'') reads the slave-road as Yahuah sending Joseph ahead to deliver.'),
  -- thread: jasher-42-meant-for-good-deliverer-type
  ('jasher', 'jasher', 42, 17, 'canon', 'genesis', 45, 5, 'free', E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* Joseph''s own verdict on the sale that Jasher 42:17 already names Yahuah''s doing ''that the sons of Jacob should not slay their brother.'''),
  ('jasher', 'jasher', 42, 17, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The God who was ''pleased to do this'' in Jasher 42:17 is the God who meant the brethren''s evil for good — the deliverer-type.'),
  ('jasher', 'jasher', 42, 17, 'canon', 'romans', 8, 28, 'free', E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* The providence Jasher 42:17 names over the sale is the gospel''s whole confidence — all things working for good to the called.'),
  -- thread: jasher-42-jubilees-sale-self-link
  ('jasher', 'jasher', 42, 19, 'jubilees', 'jubilees', 34, 11, 'extras', E'Jubilees 34:11 — *And they dealt treacherously with him, and formed a plot against him to slay him, but changing their minds, they sold him to Ishmaelite merchants, and they brought him down into Egypt, and they sold him to Potiphar, the eunuch of Pharaoh, the chief of the cooks, priest of the city of ''Êlêw. And the sons of Jacob slaughtered a kid, and dipped the coat of Joseph in the blood, and sent (it) to Jacob their father on the tenth of the seventh month.* The same patriarchal sale Jasher 42:19 records — plot, change of mind, sold to the Ishmaelites down into Egypt.'),
  ('jasher', 'jasher', 42, 24, 'canon', 'genesis', 37, 28, 'free', E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* The canon source standing beside both Jasher 42:24 and Jubilees 34:11 — one event, three witnesses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja42_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja42_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-42-judah-counsel-sell-not-slay',
       E'Yahudah''s counsel — sell him, lay not our hand upon him',
       E'Jasher gives Yahudah''s plea its fuller shape: *And Judah said to them, What gain will it be to us if we slay our brother? peradventure Elohim (God) will require him from us; this then is the counsel proposed concerning him, which you shall do to him: Behold this company of Ishmaelites going down to Egypt,* (Jasher 42:3) and *Now therefore, come let us dispose of him to them, and let not our hand be upon him, and they will lead him along with them, and he will be lost amongst the people of the land, and we will not put him to death with our own hands. And the proposal pleased his brethren and they did according to the word of Judah.* (Jasher 42:4). It ain''t new — this is the same counsel Genesis records: *And Yahudah (Judah) said unto his brethren, What profit is it if we slay our brother, and conceal his blood?* (Genesis 37:26) and *Come, and let us sell him to the Ishmeelites, and let not our hand be upon him; for he is our brother and our flesh. And his brethren were content.* (Genesis 37:27). Stephen names the act and its hidden mercy at once: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* (Acts 7:9) — the rejected brother handed off becomes a Messiah-type, for *Elohim (God) meant it unto good* (Genesis 50:20).',
       sv.verse_id, ev.verse_id, 'extras', 56025
  FROM _session252_ja42_lookup sv, _session252_ja42_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=42 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-42-drawn-from-pit-twenty-silver',
       E'Drawn up out of the pit — sold for twenty pieces of silver',
       E'Jasher lingers over the rescue-that-becomes-a-sale: *And these Midianites ran to the pit to drink water, for they thought that it contained water, and on coming before the pit they heard the voice of Joseph crying and weeping in the pit, and they looked down into the pit, and they saw and behold there was a youth of comely appearance and well favored.* (Jasher 42:6), until at last *And they did so, and they reached the Ishmaelites, and the Midianites sold Joseph to the Ishmaelites for twenty pieces of silver which they had given for him to his brethren.* (Jasher 42:24). It ain''t new — Genesis compresses the same drawing-up and price: *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* (Genesis 37:28). The Psalmist sings the providence under it: *He sent a man before them, even Joseph, who was sold for a servant:* (Psalm 105:17). And the silver-for-a-brother pattern returns at the betrayal of the greater Joseph: *And said unto them, What will ye give me, and I will deliver him unto you? And they covenanted with him for thirty pieces of silver.* (Matthew 26:15).',
       sv.verse_id, ev.verse_id, 'extras', 56028
  FROM _session252_ja42_lookup sv, _session252_ja42_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=42 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-42-yahuah-with-the-afflicted',
       E'Yahuah with the afflicted — the smiters withered',
       E'Where the canon only hints, Jasher shows Yahuah guarding the sold one on the road: *And Yahuah (the Lord) saw the ambition of Joseph and his trouble, and Yahuah (the Lord) brought down upon those men darkness and confusion, and the hand of every one that smote him became withered.* (Jasher 42:28), and again *And Yahuah (the Lord) saw Joseph''s affliction, and Yahuah (the Lord) again smote these men, and chastised them, and Yahuah (the Lord) caused darkness to envelope them upon the earth, and the lightning flashed and the thunder roared, and the earth shook at the voice of the thunder and of the mighty wind, and the men were terrified and knew not where they should go.* (Jasher 42:44). It ain''t new — Stephen''s verdict on the whole descent is the same: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* (Acts 7:9). The Psalmist keeps the cost in view even as God is present: *Whose feet they hurt with fetters: he was laid in iron:* (Psalm 105:18). The righteous afflicted one is never abandoned by the One who sent him ahead.',
       sv.verse_id, ev.verse_id, 'extras', 56031
  FROM _session252_ja42_lookup sv, _session252_ja42_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=42 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-42-rachel-grave-yahuah-with-you',
       E'At Rachel''s grave — ''hope to Yahuah, for he is with you''',
       E'Jasher''s tenderest scene has Joseph fall on his mother''s grave on the road to Egypt: *And Joseph reached his mother''s grave, and Joseph hastened and ran to his mother''s grave, and fell upon the grave and wept.* (Jasher 42:30), and a voice answers him to send him on in hope: *Now therefore my son, Joseph my son, hope to Yahuah (the Lord), and wait for him and do not fear, for Yahuah (the Lord) is with you, he will deliver you from all trouble.* (Jasher 42:39). It ain''t new — the grave Joseph runs to is the one Genesis records on that very road: *And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem.* (Genesis 35:19). And the comfort spoken — Yahuah with the afflicted, who delivers from all trouble — is the same providence the canon confesses over Joseph''s whole descent: *He sent a man before them, even Joseph, who was sold for a servant:* (Psalm 105:17).',
       sv.verse_id, ev.verse_id, 'extras', 56034
  FROM _session252_ja42_lookup sv, _session252_ja42_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=42 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-42-meant-for-good-deliverer-type',
       E'Yahuah pleased to spare him — the deliverer meant for good',
       E'Jasher discloses the hidden hand even in the bargaining: *Now therefore sell him to us, and we will give you all that you require for him; and Yahuah (the Lord) was pleased to do this in order that the sons of Jacob should not slay their brother.* (Jasher 42:17). The very transaction that looks like betrayal is Yahuah keeping the brother alive. It ain''t new — this is Joseph''s own later reading of the sale: *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* (Genesis 45:5), and *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* (Genesis 50:20). The pattern is the gospel''s own confidence: *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* (Romans 8:28) — the rejected, sold brother is the deliverer God meant for good.',
       sv.verse_id, ev.verse_id, 'extras', 56037
  FROM _session252_ja42_lookup sv, _session252_ja42_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=17
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=42 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-42-jubilees-sale-self-link',
       E'The same sale in Jubilees — the kid, the coat, the Ishmaelites',
       E'Jasher narrates the brethren selling Joseph for twenty pieces of silver: *And the sons of Jacob hearkened to the Midianites and they sold their brother Joseph to them for twenty pieces of silver, and Reuben their brother was not with them, and the Midianites took Joseph and continued their journey to Gilead.* (Jasher 42:19). The Jubilees apparatus already carries the same event from the same patriarchal source: *And they dealt treacherously with him, and formed a plot against him to slay him, but changing their minds, they sold him to Ishmaelite merchants, and they brought him down into Egypt, and they sold him to Potiphar, the eunuch of Pharaoh, the chief of the cooks, priest of the city of ''Êlêw. And the sons of Jacob slaughtered a kid, and dipped the coat of Joseph in the blood, and sent (it) to Jacob their father on the tenth of the seventh month.* (Jubilees 34:11). It ain''t new across the witnesses — and the canon holds the same drawing-up and price: *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* (Genesis 37:28).',
       sv.verse_id, ev.verse_id, 'extras', 56040
  FROM _session252_ja42_lookup sv, _session252_ja42_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=42 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-42-judah-counsel-sell-not-slay
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:26 — *And Yahudah (Judah) said unto his brethren, What profit is it if we slay our brother, and conceal his blood?* The canon''s terse line that Jasher 42:3 expands into Judah''s full speech against shedding a brother''s blood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-judah-counsel-sell-not-slay'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:27 — *Come, and let us sell him to the Ishmeelites, and let not our hand be upon him; for he is our brother and our flesh. And his brethren were content.* The very ''let not our hand be upon him'' counsel that Jasher 42:4 records the brethren accepting at Judah''s word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-judah-counsel-sell-not-slay'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* Stephen reads the sale Jasher 42:3 narrates as the brethren''s envy overruled by the God who stayed with the rejected one.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-judah-counsel-sell-not-slay'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The brethren''s disposal of Joseph in Jasher 42:4 is later named the means by which much people were kept alive — the Messiah-type who saves those who sold him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-judah-counsel-sell-not-slay'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-42-drawn-from-pit-twenty-silver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* The single canon verse Jasher 42:5-24 unfolds into the whole Midianite-then-Ishmaelite resale for the same twenty pieces of silver.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-drawn-from-pit-twenty-silver'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* The pit-cry of Jasher 42:6 read as Yahuah sending Joseph ahead — the affliction is the errand.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-drawn-from-pit-twenty-silver'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 26:15 — *And said unto them, What will ye give me, and I will deliver him unto you? And they covenanted with him for thirty pieces of silver.* The brother bartered for silver in Jasher 42:24 prefigures the greater Joseph delivered up for thirty — the Messiah-type sold by his own.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-drawn-from-pit-twenty-silver'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-42-yahuah-with-the-afflicted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him,* The ''but Elohim was with him'' that Jasher 42:28 dramatizes as Yahuah withering the hands of Joseph''s smiters.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-yahuah-with-the-afflicted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 105:18 — *Whose feet they hurt with fetters: he was laid in iron:* The road-affliction of Jasher 42:44 — smitten and terrified — answered by the Psalm that holds Joseph''s suffering and God''s presence together.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-yahuah-with-the-afflicted'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-42-rachel-grave-yahuah-with-you
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:19 — *And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem.* The grave ''in the way'' that Jasher 42:30 has Joseph run to as the Ishmaelites pass along the road of Ephrath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-rachel-grave-yahuah-with-you'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant:* The grave-voice of Jasher 42:39 (''hope to Yahuah... he will deliver you'') reads the slave-road as Yahuah sending Joseph ahead to deliver.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-rachel-grave-yahuah-with-you'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-42-meant-for-good-deliverer-type
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* Joseph''s own verdict on the sale that Jasher 42:17 already names Yahuah''s doing ''that the sons of Jacob should not slay their brother.'''
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-meant-for-good-deliverer-type'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The God who was ''pleased to do this'' in Jasher 42:17 is the God who meant the brethren''s evil for good — the deliverer-type.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-meant-for-good-deliverer-type'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* The providence Jasher 42:17 names over the sale is the gospel''s whole confidence — all things working for good to the called.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-meant-for-good-deliverer-type'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-42-jubilees-sale-self-link
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 34:11 — *And they dealt treacherously with him, and formed a plot against him to slay him, but changing their minds, they sold him to Ishmaelite merchants, and they brought him down into Egypt, and they sold him to Potiphar, the eunuch of Pharaoh, the chief of the cooks, priest of the city of ''Êlêw. And the sons of Jacob slaughtered a kid, and dipped the coat of Joseph in the blood, and sent (it) to Jacob their father on the tenth of the seventh month.* The same patriarchal sale Jasher 42:19 records — plot, change of mind, sold to the Ishmaelites down into Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-jubilees-sale-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* The canon source standing beside both Jasher 42:24 and Jubilees 34:11 — one event, three witnesses.'
  FROM cross_reference_threads t, cross_references x, _session252_ja42_lookup sv, _session252_ja42_lookup tv
 WHERE t.slug='jasher-42-jubilees-sale-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=42 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

