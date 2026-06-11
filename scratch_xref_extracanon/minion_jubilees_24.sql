-- ----- fragment: minion_jubilees_24.sql (session251 jubilees 24) -----
-- Source anchor: jubilees/jubilees ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju24 (view _session251_ju24_lookup). Sort band base 53575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-24-esau-sold-birthright
  ('jubilees', 'jubilees', 24, 4, 'canon', 'genesis', 25, 32, 'free', E'Genesis 25:32 — *And Esau said, Behold, I am at the point to die: and what profit shall this birthright do to me?* Jubilees 24:4 carries Esau''s own words almost verbatim from its Genesis source.'),
  ('jubilees', 'jubilees', 24, 6, 'canon', 'genesis', 25, 34, 'free', E'Genesis 25:34 — *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright.* Jubilees 24:6 retells the same trade and the same verdict — Esau despised his birthright.'),
  ('jubilees', 'jubilees', 24, 6, 'canon', 'hebrews', 12, 16, 'free', E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The apostolic warning weighs the very scene Jubilees 24:6 narrates: profanity is trading the covenant for a meal.'),
  ('jubilees', 'jubilees', 24, 6, 'canon', 'hebrews', 12, 17, 'free', E'Hebrews 12:17 — *For ye know how that afterward, when he would have inherited the blessing, he was rejected: for he found no place of repentance, though he sought it carefully with tears.* Jubilees 24:6 says Esau was “brought down from his dignity” — the rejection Hebrews carries forward.'),
  ('jubilees', 'jubilees', 24, 6, 'canon', 'romans', 9, 12, 'free', E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* Jubilees 24:6 makes the election plain — “Jacob became the elder” — the seed kept by Yahuah''s choice, not by merit.'),
  -- thread: jubilees-24-famine-gerar-go-not-down
  ('jubilees', 'jubilees', 24, 2, 'canon', 'genesis', 26, 1, 'free', E'Genesis 26:1 — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar.* Jubilees 24:2,6 preserve the same famine “besides the first famine” and the same flight to Gerar.'),
  ('jubilees', 'jubilees', 24, 9, 'canon', 'genesis', 26, 2, 'free', E'Genesis 26:2 — *And Yahuah (LORD) appeared unto him, and said, Go not down into Egypt; dwell in the land which I shall tell thee of:* Jubilees 24:9 quotes the theophany almost word for word — the seed is held in the land of promise.'),
  -- thread: jubilees-24-oath-renewed-seed-as-stars
  ('jubilees', 'jubilees', 24, 10, 'canon', 'genesis', 26, 4, 'free', E'Genesis 26:4 — *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed;* Jubilees 24:10 renews the same star-seed oath to Isaac that Yahuah swore to Abraham.'),
  ('jubilees', 'jubilees', 24, 11, 'canon', 'genesis', 26, 5, 'free', E'Genesis 26:5 — *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* Jubilees 24:11 keeps the same ground — Abraham obeyed and kept the charge, commandments, laws, and covenant — the Torah honored before Sinai.'),
  ('jubilees', 'jubilees', 24, 10, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* The oath renewed in Jubilees 24:10 is the very oath sworn after the binding of Isaac.'),
  ('jubilees', 'jubilees', 24, 11, 'canon', 'galatians', 3, 8, 'free', E'Galatians 3:8 — *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed.* Jubilees 24:11''s “all the nations of the earth be blessed” is the gospel preached beforehand — it ain''t new.'),
  -- thread: jubilees-24-wells-re-dug-rehoboth
  ('jubilees', 'jubilees', 24, 18, 'canon', 'genesis', 26, 18, 'free', E'Genesis 26:18 — *And Isaac digged again the wells of water, which they had digged in the days of Abraham his father; for the Philistines had stopped them after the death of Abraham: and he called their names after the names by which his father had called them.* Jubilees 24:18 retells the re-digging and re-naming of Abraham''s wells exactly.'),
  ('jubilees', 'jubilees', 24, 19, 'canon', 'genesis', 26, 20, 'free', E'Genesis 26:20 — *And the herdmen of Gerar did strive with Isaac’s herdmen, saying, The water is ours: and he called the name of the well Esek; because they strove with him.* Jubilees 24:19 names the first contested well “Perversity” for the same strife of the Gerar shepherds.'),
  ('jubilees', 'jubilees', 24, 20, 'canon', 'genesis', 26, 22, 'free', E'Genesis 26:22 — *And he removed from thence, and digged another well; and for that they strove not: and he called the name of it Rehoboth; and he said, For now Yahuah (LORD) hath made room for us, and we shall be fruitful in the land.* Jubilees 24:20''s well “Room” — “Now Yahuah has made room for us” — is Genesis''s Rehoboth verbatim in sense.'),
  -- thread: jubilees-24-new-moon-theophany-altar
  ('jubilees', 'jubilees', 24, 21, 'canon', 'genesis', 26, 24, 'free', E'Genesis 26:24 — *And Yahuah (LORD) appeared unto him the same night, and said, I am the Elohim (God) of Abraham thy father: fear not, for I am with thee, and will bless thee, and multiply thy seed for my servant Abraham’s sake.* Jubilees 24:21 quotes the Beer-sheba theophany verbatim, adding only its new-moon dating.'),
  ('jubilees', 'jubilees', 24, 23, 'canon', 'genesis', 26, 25, 'free', E'Genesis 26:25 — *And he builded an altar there, and called upon the name of Yahuah (LORD), and pitched his tent there: and there Isaac’s servants digged a well.* Jubilees 24:23 retells the altar and the calling on the name — and notes the altar Abraham his father had first built.'),
  -- thread: jubilees-24-curse-philistines-heavenly-tables
  ('jubilees', 'jubilees', 24, 32, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Jubilees 24:32''s “written and engraved on the heavenly tables” is the same pre-written book of remembrance the canon names.'),
  ('jubilees', 'jubilees', 24, 32, 'canon', 'exodus', 32, 32, 'free', E'Exodus 32:32 — *Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* The heavenly tables of Jubilees 24:32, engraved for the day of judgment, are the very book Moses pleads over.'),
  ('jubilees', 'jubilees', 24, 26, 'jubilees', 'jubilees', 19, 17, 'extras', E'Jubilees 19:17 — *For I know that Yahuah (God) will choose him to be a people for possession to Himself, above all peoples that are upon the face of the earth.* The Philistine curse of Jubilees 24:26 stands to guard the chosen seed — the election of Jacob Abraham already foresaw.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-24-esau-sold-birthright',
       E'Esau despised the birthright — the red pottage',
       E'Jubilees retells the day the elder traded his place: *And Esau said in his heart: “I shall die; of what profit to me is this birthright?” And he said to Jacob: “I give it to you.”* (Jubilees 24:4), and *Jacob gave his brother Esau bread and pottage, and he ate till he was satisfied, and Esau despised his birthright; for this reason was Esau’s name called Edom, on account of the red pottage which Jacob gave him for his birthright. And Jacob became the elder, and Esau was brought down from his dignity.* (Jubilees 24:6). It ain''t new — it is Genesis word for word: *And Esau said, Behold, I am at the point to die: and what profit shall this birthright do to me?* (Genesis 25:32), *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright.* (Genesis 25:34). The whole canon weighs that despising: *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* (Hebrews 12:16). The election was never about merit; it was Yahuah''s choosing of the seed — *It was said unto her, The elder shall serve the younger.* (Romans 9:12).',
       sv.verse_id, ev.verse_id, 'extras', 53575
  FROM _session251_ju24_lookup sv, _session251_ju24_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=24 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-24-famine-gerar-go-not-down',
       E'The famine, Gerar, and “Go not down into Egypt”',
       E'A second famine drives Isaac toward Egypt, and Yahuah turns him back: *And the famine was over the land, and Isaac departed to go down into Egypt in the second year of this week, and went to the king of the Philistines to Gerar, to Abimelech.* (Jubilees 24:6), *And Yahuah (God) appeared to him and said to him: “Go not down into Egypt; dwell in the land that I shall tell you of, and sojourn in this land, and I shall be with you and bless you.* (Jubilees 24:9). The retelling tracks Genesis exactly: *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar.* (Genesis 26:1), *And Yahuah (LORD) appeared unto him, and said, Go not down into Egypt; dwell in the land which I shall tell thee of:* (Genesis 26:2). Jubilees even keeps the note that this famine was “besides the first famine, which had been in the days of Abraham” (Jubilees 24:2) — the Genesis seam preserved.',
       sv.verse_id, ev.verse_id, 'extras', 53578
  FROM _session251_ju24_lookup sv, _session251_ju24_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=24 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-24-oath-renewed-seed-as-stars',
       E'The oath renewed to Isaac — thy seed as the stars, for Abraham''s sake',
       E'The covenant sworn to Abraham passes to Isaac unbroken: *For to you and to your seed shall I give all this land, and I shall establish My oath which I sware to Abraham your father, and I shall multiply your seed as the stars of heaven, and shall give to your seed all this land.* (Jubilees 24:10), *And in your seed will all the nations of the earth be blessed, because your father obeyed My voice, and kept My charge and My commandments, and My laws, and My ordinances, and My covenant; and now obey My voice and dwell in this land.* (Jubilees 24:11). This is Genesis retold: *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed; Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* (Genesis 26:4-5). The oath itself reaches back to the Akedah: *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore...* (Genesis 22:17). And it ain''t new in the gospel either — Paul reads it as preached beforehand: *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed.* (Galatians 3:8). Note too the framework''s “it ain''t new” spine: Abraham kept Yahuah''s “commandments, laws, ordinances, and covenant” — the Torah honored by the father before Sinai, exactly as Jubilees 21 has Abraham keeping the law of offerings.',
       sv.verse_id, ev.verse_id, 'extras', 53581
  FROM _session251_ju24_lookup sv, _session251_ju24_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=24 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-24-wells-re-dug-rehoboth',
       E'The wells re-dug — strife, Enmity, and Room',
       E'The Philistines stop the wells, and Isaac re-digs them, naming the strife and the rest: *And they digged again the wells of water which the servants of Abraham, his father, had digged, and which the Philistines had closed after the death of Abraham his father, and he called their names as Abraham his father had named them.* (Jubilees 24:18), *And they dug a second well, and they strove for that also, and he called its name “Enmity.” And he arose from thence and they digged another well, and for that they strove not, and he called the name of it “Room,” and Isaac said: “Now Yahuah (God) has made room for us, and we have increased in the land.”* (Jubilees 24:20). Genesis tells it the same, name for name (Esek/Sitnah/Rehoboth): *And Isaac digged again the wells of water, which they had digged in the days of Abraham his father; for the Philistines had stopped them after the death of Abraham: and he called their names after the names by which his father had called them.* (Genesis 26:18), *And he removed from thence, and digged another well; and for that they strove not: and he called the name of it Rehoboth; and he said, For now Yahuah (LORD) hath made room for us, and we shall be fruitful in the land.* (Genesis 26:22). The famine, the envy, and the re-dug wells of the father are the Genesis narrative carried whole into the Book of Division.',
       sv.verse_id, ev.verse_id, 'extras', 53584
  FROM _session251_ju24_lookup sv, _session251_ju24_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=24 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-24-new-moon-theophany-altar',
       E'The new-moon theophany at the Well of the Oath',
       E'At Beer-sheba the covenant is sealed again, and Jubilees fixes it on the calendar — the new moon of the first month: *And he went up from thence to the Well of the Oath in the first year of the first week in the forty-fourth jubilee. And Yahuah (God) appeared to him that night, on the new moon of the first month, and said to him: “I am the Elohim (God) of Abraham your father; fear not, for I am with you, and shall bless you and shall surely multiply your seed as the sand of the earth, for the sake of Abraham my servant.”* (Jubilees 24:21), *And he built an altar there, which Abraham his father had first built, and he called upon the name of Yahuah (God), and he offered sacrifice to the Elohim (God) of Abraham his father.* (Jubilees 24:23). Genesis carries the same night and the same altar: *And Yahuah (LORD) appeared unto him the same night, and said, I am the Elohim (God) of Abraham thy father: fear not, for I am with thee, and will bless thee, and multiply thy seed for my servant Abraham’s sake.* (Genesis 26:24), *And he builded an altar there, and called upon the name of Yahuah (LORD)...* (Genesis 26:25). Jubilees adds its signature — the moed reckoning, the new moon of the first month — grounding even the theophany in the appointed-times frame. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53587
  FROM _session251_ju24_lookup sv, _session251_ju24_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=21
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=24 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-24-curse-philistines-heavenly-tables',
       E'The curse on the Philistines, engraved on the heavenly tables',
       E'Where Genesis simply makes peace, Jubilees turns the forced oath into a prophetic curse on the seed of the Philistines — and grounds it where Jubilees grounds everything, on the pre-written tablets: *And Isaac on that day cursed the Philistines and said: “Cursed be the Philistines to the day of wrath and indignation from the midst of all nations; may Elohim (God) make them a derision and a curse and an object of wrath and indignation in the hands of the sinners the nations and in the hands of the Kittim.* (Jubilees 24:26), and the close: *For into eternal malediction will he depart.” And thus is it written and engraved concerning him on the heavenly tables, to do to him on the day of judgment, so that he may be rooted out of the earth.* (Jubilees 24:32). This is the framework''s heavenly-tablets spine — judgement engraved before it unfolds, the same books language the canon carries: *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD)...* (Malachi 3:16), *...blot me, I pray thee, out of thy book which thou hast written.* (Exodus 32:32). And the election it defends — the seed kept, Jacob chosen over Esau the Edomite — is the verdict Jubilees itself records from Abraham''s blessing: *For I know that Yahuah (God) will choose him to be a people for possession to Himself, above all peoples that are upon the face of the earth.* (Jubilees 19:17).',
       sv.verse_id, ev.verse_id, 'extras', 53590
  FROM _session251_ju24_lookup sv, _session251_ju24_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=26
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=24 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-24-esau-sold-birthright
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:32 — *And Esau said, Behold, I am at the point to die: and what profit shall this birthright do to me?* Jubilees 24:4 carries Esau''s own words almost verbatim from its Genesis source.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-esau-sold-birthright'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:34 — *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright.* Jubilees 24:6 retells the same trade and the same verdict — Esau despised his birthright.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-esau-sold-birthright'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The apostolic warning weighs the very scene Jubilees 24:6 narrates: profanity is trading the covenant for a meal.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-esau-sold-birthright'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 12:17 — *For ye know how that afterward, when he would have inherited the blessing, he was rejected: for he found no place of repentance, though he sought it carefully with tears.* Jubilees 24:6 says Esau was “brought down from his dignity” — the rejection Hebrews carries forward.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-esau-sold-birthright'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* Jubilees 24:6 makes the election plain — “Jacob became the elder” — the seed kept by Yahuah''s choice, not by merit.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-esau-sold-birthright'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-24-famine-gerar-go-not-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 26:1 — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar.* Jubilees 24:2,6 preserve the same famine “besides the first famine” and the same flight to Gerar.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-famine-gerar-go-not-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:2 — *And Yahuah (LORD) appeared unto him, and said, Go not down into Egypt; dwell in the land which I shall tell thee of:* Jubilees 24:9 quotes the theophany almost word for word — the seed is held in the land of promise.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-famine-gerar-go-not-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-24-oath-renewed-seed-as-stars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 26:4 — *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed;* Jubilees 24:10 renews the same star-seed oath to Isaac that Yahuah swore to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-oath-renewed-seed-as-stars'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:5 — *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* Jubilees 24:11 keeps the same ground — Abraham obeyed and kept the charge, commandments, laws, and covenant — the Torah honored before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-oath-renewed-seed-as-stars'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* The oath renewed in Jubilees 24:10 is the very oath sworn after the binding of Isaac.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-oath-renewed-seed-as-stars'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:8 — *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed.* Jubilees 24:11''s “all the nations of the earth be blessed” is the gospel preached beforehand — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-oath-renewed-seed-as-stars'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-24-wells-re-dug-rehoboth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 26:18 — *And Isaac digged again the wells of water, which they had digged in the days of Abraham his father; for the Philistines had stopped them after the death of Abraham: and he called their names after the names by which his father had called them.* Jubilees 24:18 retells the re-digging and re-naming of Abraham''s wells exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-wells-re-dug-rehoboth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:20 — *And the herdmen of Gerar did strive with Isaac’s herdmen, saying, The water is ours: and he called the name of the well Esek; because they strove with him.* Jubilees 24:19 names the first contested well “Perversity” for the same strife of the Gerar shepherds.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-wells-re-dug-rehoboth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 26:22 — *And he removed from thence, and digged another well; and for that they strove not: and he called the name of it Rehoboth; and he said, For now Yahuah (LORD) hath made room for us, and we shall be fruitful in the land.* Jubilees 24:20''s well “Room” — “Now Yahuah has made room for us” — is Genesis''s Rehoboth verbatim in sense.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-wells-re-dug-rehoboth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-24-new-moon-theophany-altar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 26:24 — *And Yahuah (LORD) appeared unto him the same night, and said, I am the Elohim (God) of Abraham thy father: fear not, for I am with thee, and will bless thee, and multiply thy seed for my servant Abraham’s sake.* Jubilees 24:21 quotes the Beer-sheba theophany verbatim, adding only its new-moon dating.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-new-moon-theophany-altar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:25 — *And he builded an altar there, and called upon the name of Yahuah (LORD), and pitched his tent there: and there Isaac’s servants digged a well.* Jubilees 24:23 retells the altar and the calling on the name — and notes the altar Abraham his father had first built.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-new-moon-theophany-altar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-24-curse-philistines-heavenly-tables
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Jubilees 24:32''s “written and engraved on the heavenly tables” is the same pre-written book of remembrance the canon names.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-curse-philistines-heavenly-tables'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 32:32 — *Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* The heavenly tables of Jubilees 24:32, engraved for the day of judgment, are the very book Moses pleads over.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-curse-philistines-heavenly-tables'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 19:17 — *For I know that Yahuah (God) will choose him to be a people for possession to Himself, above all peoples that are upon the face of the earth.* The Philistine curse of Jubilees 24:26 stands to guard the chosen seed — the election of Jacob Abraham already foresaw.'
  FROM cross_reference_threads t, cross_references x, _session251_ju24_lookup sv, _session251_ju24_lookup tv
 WHERE t.slug='jubilees-24-curse-philistines-heavenly-tables'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=24 AND sv.verse_number=26
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

