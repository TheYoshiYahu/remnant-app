-- ----- fragment: minion_jasher_41.sql (session252 jasher 41) -----
-- Source anchor: jasher/jasher ch41. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja41 (view _session252_ja41_lookup). Sort band base 56000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja41_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-41-leah-death-machpelah
  ('jasher', 'jasher', 41, 3, 'canon', 'genesis', 49, 30, 'free', E'Genesis 49:30 — *In the cave that is in the field of Machpelah, which is before Mamre, in the land of Canaan, which Abraham bought with the field of Ephron the Hittite for a possession of a buryingplace.* Jacob from his deathbed names the very field Jasher 41:3 says he buried Leah in — Abraham''s purchase from the children of Heth.'),
  ('jasher', 'jasher', 41, 2, 'canon', 'genesis', 49, 31, 'free', E'Genesis 49:31 — *There they buried Abraham and Sarah his wife; there they buried Isaac and Rebekah his wife; and there I buried Leah.* The canon confirms Leah''s grave in Machpelah, exactly as Jasher 41:2 records her death at Hebron.'),
  ('jasher', 'jasher', 41, 3, 'jubilees', 'jubilees', 36, 21, 'extras', E'Jubilees 36:21 — *And Leah his wife died in the fourth year of the second week of the forty-fifth jubilee, and he buried her in the double cave near Rebecca his mother, to the left of the grave of Sarah, his father''s mother. And all her sons and his sons came to mourn over Leah his wife with him, and to comfort him regarding her, for he was lamenting her.* The Jubilees retelling carries the same death and the same double cave that Jasher 41:3 places in Machpelah.'),
  -- thread: jasher-41-coat-of-many-colors
  ('jasher', 'jasher', 41, 6, 'canon', 'genesis', 37, 3, 'free', E'Genesis 37:3 — *Now Yashar''el (Israel) loved Joseph more than all his children, because he was the son of his old age: and he made him a coat of many colours.* The canon source for Jasher 41:6 — the son of his old age, the coat of many colors.'),
  ('jasher', 'jasher', 41, 8, 'canon', 'genesis', 37, 4, 'free', E'Genesis 37:4 — *And when his brethren saw that their father loved him more than all his brethren, they hated him, and could not speak peaceably unto him.* The brethren''s hatred in Jasher 41:8 is the canon''s own — they could not speak peaceably to him.'),
  ('jasher', 'jasher', 41, 8, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen names the very envy Jasher 41:8 records, and the election that overruled it — God was with the rejected son.'),
  -- thread: jasher-41-dreams-of-dominion
  ('jasher', 'jasher', 41, 10, 'canon', 'genesis', 37, 7, 'free', E'Genesis 37:7 — *For, behold, we were binding sheaves in the field, and, lo, my sheaf arose, and also stood upright; and, behold, your sheaves stood round about, and made obeisance to my sheaf.* The canon''s sheaf-dream is Jasher 41:10 to the detail — the brethren''s sheaves bow to his.'),
  ('jasher', 'jasher', 41, 11, 'canon', 'genesis', 37, 8, 'free', E'Genesis 37:8 — *And his brethren said to him, Shalt thou indeed reign over us? or shalt thou indeed have dominion over us? And they hated him yet the more for his dreams, and for his words.* The brethren''s question in Jasher 41:11 — reign or rule over us — is the canon''s own.'),
  ('jasher', 'jasher', 41, 14, 'canon', 'genesis', 37, 9, 'free', E'Genesis 37:9 — *And he dreamed yet another dream, and told it his brethren, and said, Behold, I have dreamed a dream more; and, behold, the sun and the moon and the eleven stars made obeisance to me.* The sun, moon, and eleven stars of Jasher 41:14 stand in the canon unchanged — the second dream of dominion.'),
  -- thread: jasher-41-sent-to-shechem-dothan
  ('jasher', 'jasher', 41, 20, 'canon', 'genesis', 37, 14, 'free', E'Genesis 37:14 — *And he said to him, Go, I pray thee, see whether it be well with thy brethren, and well with the flocks; and bring me word again. So he sent him out of the vale of Hebron, and he came to Shechem.* The father''s commission in Jasher 41:20 — go and bring back word of their welfare — is the canon''s own errand from the vale of Hebron.'),
  ('jasher', 'jasher', 41, 23, 'jubilees', 'jubilees', 34, 10, 'extras', E'Jubilees 34:10 — *And in the seventh year of this week he sent Joseph to learn about the welfare of his brothers from his house to the land of Shechem, and he found them in the land of Dothan.* The Jubilees retelling carries the same sending to Shechem and finding at Dothan that Jasher 41:23 records.'),
  -- thread: jasher-41-cast-into-the-pit
  ('jasher', 'jasher', 41, 28, 'canon', 'genesis', 37, 24, 'free', E'Genesis 37:24 — *And they took him, and cast him into a pit: and the pit was empty, there was no water in it.* The waterless pit of Jasher 41:28 is the canon''s own — the empty pit in the wilderness.'),
  ('jasher', 'jasher', 41, 26, 'canon', 'genesis', 37, 22, 'free', E'Genesis 37:22 — *And Reuben said unto them, Shed no blood, but cast him into this pit that is in the wilderness, and lay no hand upon him; that he might rid him out of their hands, to deliver him to his father again.* Reuben''s plea in Jasher 41:26 — cast him in but spill no blood — is the canon''s own attempt to deliver him back to his father.'),
  ('jasher', 'jasher', 41, 25, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The plot to kill him in Jasher 41:25 is overruled by the same God who would make the pit the road to preserving a nation alive.'),
  ('jasher', 'jasher', 41, 29, 'canon', 'genesis', 45, 5, 'free', E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* Joseph''s cry of kinship from the pit in Jasher 41:29 ends in the canon as forgiveness — God sent him before them to preserve life.'),
  ('jasher', 'jasher', 41, 28, 'canon', 'psalms', 105, 19, 'free', E'Psalm 105:19 — *Until the time that his word came: the word of Yahuah (LORD) tried him.* The pit and its terror in Jasher 41:28 are read by the Psalmist as the testing of the righteous until his word came to pass.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja41_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja41_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-41-leah-death-machpelah',
       E'Leah dies; buried in the cave of Machpelah',
       E'Jasher opens the Joseph cycle with a death and a grave: *And it was in those days, in that year, being the hundred and sixth year of the life of Jacob, in the tenth year of Jacob''s coming from Padan-aram, that Leah the wife of Jacob died; she was fifty-one years old when she died in Hebron* (Jasher 41:2), and *Jacob and his sons buried her in the cave of the field of Machpelah, which is in Hebron, which Abraham had bought from the children of Heth, for the possession of a burial place* (Jasher 41:3). This is the canon''s own field, bought by Abraham — Jacob from his deathbed names it as Leah''s resting place: *In the cave that is in the field of Machpelah, which is before Mamre, in the land of Canaan, which Abraham bought with the field of Ephron the Hittite for a possession of a buryingplace* (Genesis 49:30), *There they buried Abraham and Sarah his wife; there they buried Isaac and Rebekah his wife; and there I buried Leah* (Genesis 49:31). It ain''t new. The Jubilees apparatus narrates the same death and the same double cave: *And Leah his wife died in the fourth year of the second week of the forty-fifth jubilee, and he buried her in the double cave near Rebecca his mother* (Jubilees 36:21). The covenant seed keeps its fathers'' ground.',
       sv.verse_id, ev.verse_id, 'extras', 56000
  FROM _session252_ja41_lookup sv, _session252_ja41_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=41 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-41-coat-of-many-colors',
       E'The son of his old age: the coat of many colors',
       E'Jasher gives the seed of the brothers'' hatred: *and Jacob, his father, also loved him more than any of his sons, for he was a son of his old age, and through his love toward him, he made him a coat of many colors* (Jasher 41:6), so that *the sons of Jacob seeing the whole of Joseph''s conduct toward them, and that their father loved him more than any of them, they hated him and could not speak peaceably to him all the days* (Jasher 41:8). This is Genesis word for word: *Now Yashar''el (Israel) loved Joseph more than all his children, because he was the son of his old age: and he made him a coat of many colours* (Genesis 37:3), *And when his brethren saw that their father loved him more than all his brethren, they hated him, and could not speak peaceably unto him* (Genesis 37:4). It ain''t new — the favored, rejected son begins here as a type of the One his brethren would not receive. Stephen reads the whole cycle as election and envy: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* (Acts 7:9).',
       sv.verse_id, ev.verse_id, 'extras', 56003
  FROM _session252_ja41_lookup sv, _session252_ja41_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=41 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-41-dreams-of-dominion',
       E'The sheaves and the stars: Joseph''s two dreams',
       E'Jasher relates both dreams: *I dreamed a dream, and behold we were all binding sheaves in the field, and my sheaf rose and placed itself upon the ground and your sheaves surrounded it and bowed down to it* (Jasher 41:10), and after, *Behold I have again dreamed a dream, and behold the sun and the moon and the eleven stars bowed down to me* (Jasher 41:14). The brethren hear the threat of rule — *dost you imagine in your heart to reign or rule over us?* (Jasher 41:11). Genesis carries each scene whole: *For, behold, we were binding sheaves in the field... and, behold, your sheaves stood round about, and made obeisance to my sheaf* (Genesis 37:7), *Shalt thou indeed reign over us? or shalt thou indeed have dominion over us?* (Genesis 37:8), and *behold, the sun and the moon and the eleven stars made obeisance to me* (Genesis 37:9). It ain''t new. The dreams forecast the exaltation of the rejected one — the brethren who would not have him reign would yet bow, the pattern that runs to Genesis 45 and beyond.',
       sv.verse_id, ev.verse_id, 'extras', 56006
  FROM _session252_ja41_lookup sv, _session252_ja41_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=41 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-41-sent-to-shechem-dothan',
       E'Sent from the vale of Hebron to seek his brethren',
       E'The father sends the beloved son to his brethren: *go now therefore and see where they are, and bring me word back concerning the welfare of your brethren and the welfare of the flock* (Jasher 41:20), and *Joseph came for his brothers to Shechem, and could not find them... and knew not which way he should go* (Jasher 41:21) until a man directs him on: *I saw your brethren feeding here, and I heard them say they would go to feed in Dothan* (Jasher 41:22). Genesis tells it the same: *Go, I pray thee, see whether it be well with thy brethren, and well with the flocks; and bring me word again. So he sent him out of the vale of Hebron, and he came to Shechem* (Genesis 37:14). Where Jasher makes the wilderness-guide *an angel of Yahuah (the Lord)*, the canon leaves him *a certain man* — the legendary detail anchored to the canon scene it expands, never a fulfillment the text won''t carry. The Jubilees apparatus runs the same errand: *And in the seventh year of this week he sent Joseph to learn about the welfare of his brothers from his house to the land of Shechem, and he found them in the land of Dothan* (Jubilees 34:10).',
       sv.verse_id, ev.verse_id, 'extras', 56009
  FROM _session252_ja41_lookup sv, _session252_ja41_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=20
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=41 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-41-cast-into-the-pit',
       E'Cast into the pit: the righteous one and the brethren''s hand',
       E'The hatred comes to its act: *Come and let us kill him and cast him in one of the pits that are in the wilderness* (Jasher 41:25), but Reuben pleads, *Cast him into this pit to die there, but stretch not forth a hand upon him to spill his blood* (Jasher 41:26), and so *they took him and cast him into a pit, and in the pit there was no water* (Jasher 41:28) — and there Joseph cries to his brethren, *am I not of your bones and flesh, and is not Jacob your father, my father?* (Jasher 41:29). Genesis carries the empty pit and Reuben''s rescue whole: *And they took him, and cast him into a pit: and the pit was empty, there was no water in it* (Genesis 37:24), *And Reuben said unto them, Shed no blood, but cast him into this pit that is in the wilderness, and lay no hand upon him; that he might rid him out of their hands, to deliver him to his father again* (Genesis 37:22). It ain''t new — and the cycle''s own resolution names the meaning of the pit: what the brethren meant for evil, the LORD meant for good, to preserve a nation alive. *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20); *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life* (Genesis 45:5). The Psalmist reads the pit and the iron as the testing of the righteous: *Until the time that his word came: the word of Yahuah (LORD) tried him* (Psalm 105:19). Joseph the rejected and afflicted, lifted up to save many — a type of the Messiah his brethren would not receive.',
       sv.verse_id, ev.verse_id, 'extras', 56012
  FROM _session252_ja41_lookup sv, _session252_ja41_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=41 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-41-leah-death-machpelah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:30 — *In the cave that is in the field of Machpelah, which is before Mamre, in the land of Canaan, which Abraham bought with the field of Ephron the Hittite for a possession of a buryingplace.* Jacob from his deathbed names the very field Jasher 41:3 says he buried Leah in — Abraham''s purchase from the children of Heth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-leah-death-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:31 — *There they buried Abraham and Sarah his wife; there they buried Isaac and Rebekah his wife; and there I buried Leah.* The canon confirms Leah''s grave in Machpelah, exactly as Jasher 41:2 records her death at Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-leah-death-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 36:21 — *And Leah his wife died in the fourth year of the second week of the forty-fifth jubilee, and he buried her in the double cave near Rebecca his mother, to the left of the grave of Sarah, his father''s mother. And all her sons and his sons came to mourn over Leah his wife with him, and to comfort him regarding her, for he was lamenting her.* The Jubilees retelling carries the same death and the same double cave that Jasher 41:3 places in Machpelah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-leah-death-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=36 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-41-coat-of-many-colors
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:3 — *Now Yashar''el (Israel) loved Joseph more than all his children, because he was the son of his old age: and he made him a coat of many colours.* The canon source for Jasher 41:6 — the son of his old age, the coat of many colors.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-coat-of-many-colors'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:4 — *And when his brethren saw that their father loved him more than all his brethren, they hated him, and could not speak peaceably unto him.* The brethren''s hatred in Jasher 41:8 is the canon''s own — they could not speak peaceably to him.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-coat-of-many-colors'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen names the very envy Jasher 41:8 records, and the election that overruled it — God was with the rejected son.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-coat-of-many-colors'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-41-dreams-of-dominion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:7 — *For, behold, we were binding sheaves in the field, and, lo, my sheaf arose, and also stood upright; and, behold, your sheaves stood round about, and made obeisance to my sheaf.* The canon''s sheaf-dream is Jasher 41:10 to the detail — the brethren''s sheaves bow to his.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-dreams-of-dominion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:8 — *And his brethren said to him, Shalt thou indeed reign over us? or shalt thou indeed have dominion over us? And they hated him yet the more for his dreams, and for his words.* The brethren''s question in Jasher 41:11 — reign or rule over us — is the canon''s own.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-dreams-of-dominion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 37:9 — *And he dreamed yet another dream, and told it his brethren, and said, Behold, I have dreamed a dream more; and, behold, the sun and the moon and the eleven stars made obeisance to me.* The sun, moon, and eleven stars of Jasher 41:14 stand in the canon unchanged — the second dream of dominion.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-dreams-of-dominion'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-41-sent-to-shechem-dothan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:14 — *And he said to him, Go, I pray thee, see whether it be well with thy brethren, and well with the flocks; and bring me word again. So he sent him out of the vale of Hebron, and he came to Shechem.* The father''s commission in Jasher 41:20 — go and bring back word of their welfare — is the canon''s own errand from the vale of Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-sent-to-shechem-dothan'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 34:10 — *And in the seventh year of this week he sent Joseph to learn about the welfare of his brothers from his house to the land of Shechem, and he found them in the land of Dothan.* The Jubilees retelling carries the same sending to Shechem and finding at Dothan that Jasher 41:23 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-sent-to-shechem-dothan'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=23
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-41-cast-into-the-pit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:24 — *And they took him, and cast him into a pit: and the pit was empty, there was no water in it.* The waterless pit of Jasher 41:28 is the canon''s own — the empty pit in the wilderness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-cast-into-the-pit'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:22 — *And Reuben said unto them, Shed no blood, but cast him into this pit that is in the wilderness, and lay no hand upon him; that he might rid him out of their hands, to deliver him to his father again.* Reuben''s plea in Jasher 41:26 — cast him in but spill no blood — is the canon''s own attempt to deliver him back to his father.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-cast-into-the-pit'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The plot to kill him in Jasher 41:25 is overruled by the same God who would make the pit the road to preserving a nation alive.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-cast-into-the-pit'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* Joseph''s cry of kinship from the pit in Jasher 41:29 ends in the canon as forgiveness — God sent him before them to preserve life.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-cast-into-the-pit'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 105:19 — *Until the time that his word came: the word of Yahuah (LORD) tried him.* The pit and its terror in Jasher 41:28 are read by the Psalmist as the testing of the righteous until his word came to pass.'
  FROM cross_reference_threads t, cross_references x, _session252_ja41_lookup sv, _session252_ja41_lookup tv
 WHERE t.slug='jasher-41-cast-into-the-pit'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=41 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

