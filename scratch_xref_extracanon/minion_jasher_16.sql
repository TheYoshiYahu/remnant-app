-- ----- fragment: minion_jasher_16.sql (session252 jasher 16) -----
-- Source anchor: jasher/jasher ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja16 (view _session252_ja16_lookup). Sort band base 55375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-16-war-of-kings-lot-rescued
  ('jasher', 'jasher', 16, 3, 'canon', 'genesis', 14, 2, 'free', E'Genesis 14:2 — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar.* The canon names the very five kings of Sodom Jasher 16:3 gathers in the valley of Siddim.'),
  ('jasher', 'jasher', 16, 6, 'canon', 'genesis', 14, 12, 'free', E'Genesis 14:12 — *And they took Lot, Abram’s brother’s son, who dwelt in Sodom, and his goods, and departed.* This is the captivity of Lot that Jasher 16:6 reports through Unic, Abram''s servant who saw the battle.'),
  ('jasher', 'jasher', 16, 7, 'canon', 'genesis', 14, 14, 'free', E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* The same three hundred and eighteen men of Abram''s household that Jasher 16:7 musters for the night pursuit.'),
  ('jasher', 'jasher', 16, 6, 'jubilees', 'jubilees', 13, 23, 'extras', E'Jubilees 13:23 — *And they took captive Sodom and Adam and Zeboim, and they took captive Lot also, the son of Abram’s brother, and all his possessions, and they went to Dan.* Jubilees retells the identical capture of Lot, confirming Jasher 16:6 across the patriarchal record.'),
  -- thread: jasher-16-melchizedek-shem-tithe
  ('jasher', 'jasher', 16, 11, 'canon', 'genesis', 14, 18, 'free', E'Genesis 14:18 — *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God).* The same priest-king with bread and wine whom Jasher 16:11 identifies as Shem, king of Jerusalem.'),
  ('jasher', 'jasher', 16, 12, 'canon', 'hebrews', 7, 3, 'free', E'Hebrews 7:3 — *Without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually.* The priesthood before Elohim that Jasher 16:12 honors is read as the abiding order foreshadowing the Messiah.'),
  ('jasher', 'jasher', 16, 12, 'canon', 'psalms', 110, 4, 'free', E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* The tithe Abram pays this priest in Jasher 16:12 is the order the Messiah will hold for ever.'),
  -- thread: jasher-16-not-a-thread-no-spoil
  ('jasher', 'jasher', 16, 16, 'canon', 'genesis', 14, 23, 'free', E'Genesis 14:23 — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich.* The very oath Abram swears in Jasher 16:16, refusing a thread or shoetie of Sodom''s spoil.'),
  ('jasher', 'jasher', 16, 16, 'canon', 'genesis', 14, 24, 'free', E'Genesis 14:24 — *Save only that which the young men have eaten, and the portion of the men which went with me, Aner, Eshcol, and Mamre; let them take their portion.* The same exception Jasher 16:16 makes for the food and for Anar, Ashcol, and Mamre.'),
  ('jasher', 'jasher', 16, 16, 'jubilees', 'jubilees', 13, 29, 'extras', E'Jubilees 13:29 — *I lift up my hands to the El Elyon (Most High) Elohim (God), that from a thread to a shoe-latchet I shall not take aught that is your, lest you should say I have made Abram rich; save only what the young men have eaten, and the portion of the men who went with me–Aner, Eschol, and Mamre.* Jubilees renders Abram''s refusal in Jasher 16:16 with the same thread-to-shoe-latchet oath.'),
  -- thread: jasher-16-seed-as-stars-covenant-land
  ('jasher', 'jasher', 16, 20, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The star-promise that cannot be measured nor numbered, exactly as Jasher 16:20 renews it in Hebron.'),
  ('jasher', 'jasher', 16, 21, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates.* The covenant of the land for an inheritance forever that Jasher 16:21 promises to Abram''s seed.'),
  ('jasher', 'jasher', 16, 20, 'canon', 'romans', 4, 3, 'free', E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* The faith that receives the star-promise of Jasher 16:20 is election counted as righteousness, not works.'),
  ('jasher', 'jasher', 16, 20, 'jubilees', 'jubilees', 14, 5, 'extras', E'Jubilees 14:5 — *And he looked toward heaven, and beheld the stars. And He said to him: “So shall your seed be.”* Jubilees carries the same seed-as-stars vision that Jasher 16:20 sets in Hebron.'),
  -- thread: jasher-16-hagar-ishmael
  ('jasher', 'jasher', 16, 26, 'canon', 'genesis', 16, 2, 'free', E'Genesis 16:2 — *And Sarai said unto Abram, Behold now, Yahuah (LORD) hath restrained me from bearing: I pray thee, go in unto my maid; it may be that I may obtain children by her. And Abram hearkened to the voice of Sarai.* The canon''s form of Sarai''s proposal that Jasher 16:26 records, to obtain children through Hagar.'),
  ('jasher', 'jasher', 16, 34, 'canon', 'genesis', 16, 9, 'free', E'Genesis 16:9 — *And the angel of Yahuah (LORD) said unto her, Return to thy mistress, and submit thyself under her hands.* The angel''s same charge to the fleeing Hagar that Jasher 16:34 gives at the well.'),
  ('jasher', 'jasher', 16, 34, 'canon', 'genesis', 16, 11, 'free', E'Genesis 16:11 — *And the angel of Yahuah (LORD) said unto her, Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction.* The naming of Ishmael the angel announces in Jasher 16:34, the son of the affliction heard.'),
  ('jasher', 'jasher', 16, 24, 'canon', 'galatians', 4, 22, 'free', E'Galatians 4:22 — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.* Paul''s reading of the bondwoman''s son begun in Jasher 16:24, where Hagar is given to Abram for a wife.'),
  ('jasher', 'jasher', 16, 36, 'jubilees', 'jubilees', 14, 24, 'extras', E'Jubilees 14:24 — *And he went in to her, and she conceived and bare him a son, and he called his name Ishmael, in the fifth year of this week; and this was the eighty-sixth year in the life of Abram.* Jubilees gives the same birth and the same eighty-sixth year of Abram''s life that Jasher 16:36 records.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-war-of-kings-lot-rescued',
       E'The war of the four kings and the rescue of Lot',
       E'Jasher opens this chapter on the war of the kings — *And these four kings went up with all their camps, about eight hundred thousand men, and they went as they were, and smote every man they found in their road* (Jasher 16:2) — and when Lot is carried off, Abram arms his own household and pursues: *And Abram heard this, and he rose up with about three hundred and eighteen men that were with him, and he that night pursued these kings and smote them, and they all fell before Abram and his men* (Jasher 16:7). This is Genesis 14 told over again. The canon names the same coalition — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar* (Genesis 14:2) — the same captive — *And they took Lot, Abram’s brother’s son, who dwelt in Sodom, and his goods, and departed* (Genesis 14:12) — and the same numbered band: *he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan* (Genesis 14:14). Jubilees carries the identical scene, naming Chedorlaomer and the rest and Lot taken to Dan (Jubilees 13:23). It ain''t new: the called seed does not flee the kingdom of man — he goes out by night against eight hundred thousand for the sake of one captive, and wins.',
       sv.verse_id, ev.verse_id, 'extras', 55375
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-melchizedek-shem-tithe',
       E'Adonizedek the same was Shem — the priest who blessed Abram',
       E'Returning from the slaughter, Abram is met by the priest-king of Salem: *And Adonizedek king of Jerusalem, the same was Shem, went out with his men to meet Abram and his people, with bread and wine, and they remained together in the valley of Melech* (Jasher 16:11), *And Adonizedek blessed Abram, and Abram gave him a tenth from all that he had brought from the spoil of his enemies, for Adonizedek was a priest before Elohim (God)* (Jasher 16:12). Genesis names him Melchizedek and shows the same bread, wine, blessing and tithe — *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18). Jasher''s gloss "the same was Shem" places this priesthood in the chosen seed-line itself — Shem the father of the elect line still living and serving as priest. The Spirit reads this priest as the very pattern of the Messiah''s eternal order: *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4), and Hebrews unfolds him — *Without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually* (Hebrews 7:3). The tithe to the priest is Torah-before-Sinai; Jubilees seals it as an everlasting ordinance (Jubilees 13:25). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55378
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-not-a-thread-no-spoil',
       E'Not a thread nor a shoetie — Abram refuses the spoil of Sodom',
       E'When the kings of Sodom press him to keep the recovered goods, Abram swears by the Name and takes nothing: *And now therefore behold, here is all belonging to you, take it and go; as Yahuah (the Lord) lives I will not take from you from a living soul down to a shoetie or thread, excepting the expense of the food of those who went out with me to battle, as also the portions of the men who went with me, Anar, Ashcol, and Mamre* (Jasher 16:16). His reason is stated in the verse before — *For Yahuah my Elohim (the Lord my God) in whom I trust said to me, You shall lack nothing, for I will bless you in all the works of your hands* (Jasher 16:15). Genesis preserves the same oath nearly word for word — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich: Save only that which the young men have eaten, and the portion of the men which went with me, Aner, Eshcol, and Mamre; let them take their portion* (Genesis 14:23-24). Jubilees carries it too (Jubilees 13:29). The called seed will not be enriched by the kingdom of man''s plunder; his blessing comes from Yahuah, not from Sodom. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55381
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-seed-as-stars-covenant-land',
       E'Thy seed like the stars — the covenant of the land',
       E'After the war Yahuah appears again and renews the promise of seed and land: *At that time Yahuah (the Lord) again appeared to Abram in Hebron, and he said to him, Do not fear, your reward is very great before me, for I will not leave you, until I shall have multiplied you, and blessed you and made your seed like the stars in heaven, which cannot be measured nor numbered* (Jasher 16:20), *And I will give to your seed all these lands that you see with your eyes, to them will I give them for an inheritance forever, only be strong and do not fear, walk before me and be perfect* (Jasher 16:21). This is the vision of Genesis 15. The canon''s word and the star-promise stand on the page — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5) — and the land-grant — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). The seed is election kept, not earned — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3). Jubilees holds the same star-vision and reckoning (Jubilees 14:5). The chosen line is multiplied and the land given for an inheritance forever; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55384
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-hagar-ishmael',
       E'Sarai gives Hagar — the bondwoman and Ishmael',
       E'Sarai being barren, she gives her handmaid to Abram: *And Sarai said to Abram, Behold here is my handmaid Hagar, go to her that she may bring forth upon my knees, that I may also obtain children through her* (Jasher 16:26), and at the well the angel turns the fleeing Hagar back — *And an angel of Yahuah (the Lord) found her in the place where she had fled, by a well, and he said to her, Do not fear, for I will multiply your seed, for you shall bear a son and you shall call his name Ishmael; now then return to Sarai your mistress, and submit thyself under her hands* (Jasher 16:34). This is Genesis 16. The canon gives Sarai''s same proposal — *And Sarai said unto Abram, Behold now, Yahuah (LORD) hath restrained me from bearing: I pray thee, go in unto my maid; it may be that I may obtain children by her. And Abram hearkened to the voice of Sarai* (Genesis 16:2) — and the angel''s same word at the well — *And the angel of Yahuah (LORD) said unto her, Return to thy mistress, and submit thyself under her hands* (Genesis 16:9) — naming the son for the affliction heard — *and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction* (Genesis 16:11). Paul reads the two sons as the figure of bondage and freedom — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman* (Galatians 4:22). Jubilees keeps the same handmaid and the same naming (Jubilees 14:24). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55387
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-16-war-of-kings-lot-rescued
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:2 — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar.* The canon names the very five kings of Sodom Jasher 16:3 gathers in the valley of Siddim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:12 — *And they took Lot, Abram’s brother’s son, who dwelt in Sodom, and his goods, and departed.* This is the captivity of Lot that Jasher 16:6 reports through Unic, Abram''s servant who saw the battle.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* The same three hundred and eighteen men of Abram''s household that Jasher 16:7 musters for the night pursuit.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:23 — *And they took captive Sodom and Adam and Zeboim, and they took captive Lot also, the son of Abram’s brother, and all his possessions, and they went to Dan.* Jubilees retells the identical capture of Lot, confirming Jasher 16:6 across the patriarchal record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-16-melchizedek-shem-tithe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:18 — *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God).* The same priest-king with bread and wine whom Jasher 16:11 identifies as Shem, king of Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-melchizedek-shem-tithe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 7:3 — *Without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually.* The priesthood before Elohim that Jasher 16:12 honors is read as the abiding order foreshadowing the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-melchizedek-shem-tithe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* The tithe Abram pays this priest in Jasher 16:12 is the order the Messiah will hold for ever.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-melchizedek-shem-tithe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-16-not-a-thread-no-spoil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:23 — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich.* The very oath Abram swears in Jasher 16:16, refusing a thread or shoetie of Sodom''s spoil.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-not-a-thread-no-spoil'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:24 — *Save only that which the young men have eaten, and the portion of the men which went with me, Aner, Eshcol, and Mamre; let them take their portion.* The same exception Jasher 16:16 makes for the food and for Anar, Ashcol, and Mamre.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-not-a-thread-no-spoil'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 13:29 — *I lift up my hands to the El Elyon (Most High) Elohim (God), that from a thread to a shoe-latchet I shall not take aught that is your, lest you should say I have made Abram rich; save only what the young men have eaten, and the portion of the men who went with me–Aner, Eschol, and Mamre.* Jubilees renders Abram''s refusal in Jasher 16:16 with the same thread-to-shoe-latchet oath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-not-a-thread-no-spoil'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-16-seed-as-stars-covenant-land
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The star-promise that cannot be measured nor numbered, exactly as Jasher 16:20 renews it in Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-seed-as-stars-covenant-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates.* The covenant of the land for an inheritance forever that Jasher 16:21 promises to Abram''s seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-seed-as-stars-covenant-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* The faith that receives the star-promise of Jasher 16:20 is election counted as righteousness, not works.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-seed-as-stars-covenant-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 14:5 — *And he looked toward heaven, and beheld the stars. And He said to him: “So shall your seed be.”* Jubilees carries the same seed-as-stars vision that Jasher 16:20 sets in Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-seed-as-stars-covenant-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-16-hagar-ishmael
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 16:2 — *And Sarai said unto Abram, Behold now, Yahuah (LORD) hath restrained me from bearing: I pray thee, go in unto my maid; it may be that I may obtain children by her. And Abram hearkened to the voice of Sarai.* The canon''s form of Sarai''s proposal that Jasher 16:26 records, to obtain children through Hagar.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 16:9 — *And the angel of Yahuah (LORD) said unto her, Return to thy mistress, and submit thyself under her hands.* The angel''s same charge to the fleeing Hagar that Jasher 16:34 gives at the well.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 16:11 — *And the angel of Yahuah (LORD) said unto her, Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction.* The naming of Ishmael the angel announces in Jasher 16:34, the son of the affliction heard.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 4:22 — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.* Paul''s reading of the bondwoman''s son begun in Jasher 16:24, where Hagar is given to Abram for a wife.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 14:24 — *And he went in to her, and she conceived and bare him a son, and he called his name Ishmael, in the fifth year of this week; and this was the eighty-sixth year in the life of Abram.* Jubilees gives the same birth and the same eighty-sixth year of Abram''s life that Jasher 16:36 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=36
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

