-- ----- fragment: minion_jasher_28.sql (session252 jasher 28) -----
-- Source anchor: jasher/jasher ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja28 (view _session252_ja28_lookup). Sort band base 55675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-28-isaac-gerar-famine
  ('jasher', 'jasher', 28, 1, 'canon', 'genesis', 26, 1, 'free', E'Genesis 26:1 — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar.* The same second famine that opens Jasher 28:1, sending Isaac down the road his father walked.'),
  ('jasher', 'jasher', 28, 2, 'canon', 'genesis', 26, 2, 'free', E'Genesis 26:2 — *And Yahuah (LORD) appeared unto him, and said, Go not down into Egypt; dwell in the land which I shall tell thee of:* The same night-word turning Isaac aside from Egypt to Gerar that Jasher 28:2 records verbatim in spirit.'),
  ('jasher', 'jasher', 28, 7, 'canon', 'genesis', 26, 8, 'free', E'Genesis 26:8 — *And it came to pass, when he had been there a long time, that Abimelech king of the Philistines looked out at a window, and saw, and, behold, Isaac was sporting with Rebekah his wife.* The very window-scene Jasher 28:7 retells, Abimelech discovering Rebecca was no sister.'),
  ('jasher', 'jasher', 28, 11, 'canon', 'genesis', 26, 11, 'free', E'Genesis 26:11 — *And Abimelech charged all his people, saying, He that toucheth this man or his wife shall surely be put to death.* The king''s protective decree that Jasher 28:11 expands into a proclamation through the streets.'),
  ('jasher', 'jasher', 28, 1, 'jubilees', 'jubilees', 24, 2, 'extras', E'Jubilees 24:2 — *And in the first year of the fourth week a famine began in the land, besides the first famine, which had been in the days of Abraham.* Jubilees narrates the identical post-Abraham famine, a genuine self-link to Jasher 28:1 in the patriarchal record.'),
  -- thread: jasher-28-hundredfold-blessing
  ('jasher', 'jasher', 28, 14, 'canon', 'genesis', 26, 12, 'free', E'Genesis 26:12 — *Then Isaac sowed in that land, and received in the same year an hundredfold: and Yahuah (LORD) blessed him.* The exact hundredfold harvest of Jasher 28:14, the blessing outrunning the famine.'),
  ('jasher', 'jasher', 28, 15, 'canon', 'genesis', 26, 14, 'free', E'Genesis 26:14 — *For he had possession of flocks, and possession of herds, and great store of servants: and the Philistines envied him.* The same flocks, herds, and store of servants Jasher 28:15 lists as Isaac waxes great.'),
  ('jasher', 'jasher', 28, 14, 'jubilees', 'jubilees', 24, 15, 'extras', E'Jubilees 24:15 — *And he sowed in the land of the Philistines and brought in a hundred-fold, and Isaac became exceedingly great, and the Philistines envied him.* Jubilees records the same hundredfold sowing as Jasher 28:14, the parallel patriarchal witness.'),
  -- thread: jasher-28-jacob-shem-eber-election
  ('jasher', 'jasher', 28, 18, 'canon', 'genesis', 11, 14, 'free', E'Genesis 11:14 — *And Salah lived thirty years, and begat Eber:* The seed-line of Shem→Arphaxad→Salah→Eber that Jasher names as Jacob''s teaching-house, the very Eber to whom he is sent in Jasher 28:18.'),
  ('jasher', 'jasher', 28, 18, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The election already spoken in the womb, why the younger Jacob — not Esau — is sent to learn the way in Jasher 28:18.'),
  ('jasher', 'jasher', 28, 18, 'canon', 'romans', 9, 11, 'free', E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* The election precedes confession — the same choosing of Jacob that Jasher 28:18 shows in the sending.'),
  ('jasher', 'jasher', 28, 18, 'canon', 'romans', 9, 12, 'free', E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* The covenant verdict on Esau and Jacob that frames why only Jacob seeks the instructions of Yahuah in Jasher 28:18.'),
  ('jasher', 'jasher', 28, 18, 'canon', 'hebrews', 11, 9, 'free', E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise:* Jacob named heir of the same promise, the faith-line he is schooled in while in the house of Shem and Eber in Jasher 28:18.'),
  -- thread: jasher-28-esau-hunter-hittite-wife
  ('jasher', 'jasher', 28, 20, 'canon', 'genesis', 25, 27, 'free', E'Genesis 25:27 — *And the boys grew: and Esau was a cunning hunter, a man of the field; and Jacob was a plain man, dwelling in tents.* The canon''s own portrait of Esau the cunning hunter and man of the field that Jasher 28:20 amplifies into the deceitful inveigler.'),
  ('jasher', 'jasher', 28, 23, 'canon', 'genesis', 26, 34, 'free', E'Genesis 26:34 — *And Esau was forty years old when he took to wife Judith the daughter of Beeri the Hittite, and Bashemath the daughter of Elon the Hittite:* The forty-year-old Esau wedding Judith the Hittite, the exact marriage Jasher 28:22-23 recounts.'),
  ('jasher', 'jasher', 28, 23, 'canon', 'genesis', 26, 35, 'free', E'Genesis 26:35 — *Which were a grief of mind unto Isaac and to Rebekah.* The bitterness of Esau''s out-of-covenant marriage in Jasher 28:23, the despised line grieving the chosen house.'),
  -- thread: jasher-28-shem-dies-leah-rachel-born
  ('jasher', 'jasher', 28, 24, 'canon', 'genesis', 11, 10, 'free', E'Genesis 11:10 — *These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood:* The Shem of the seed-line whose long life Jasher 28:24 closes at six hundred years, the teacher in whose house Jacob learned.'),
  ('jasher', 'jasher', 28, 28, 'canon', 'genesis', 29, 16, 'free', E'Genesis 29:16 — *And Laban had two daughters: the name of the elder was Leah, and the name of the younger was Rachel.* The same two daughters of Laban, elder Leah and younger Rachel, whose birth Jasher 28:28 records — Jacob''s wives-to-be and the mothers of the tribes.'),
  ('jasher', 'jasher', 28, 28, 'canon', 'genesis', 29, 17, 'free', E'Genesis 29:17 — *Leah was tender eyed; but Rachel was beautiful and well favoured.* The two sisters of Jasher 28:28 as the canon describes them, the line through which the twelve tribes will be gathered.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-28-isaac-gerar-famine',
       E'The famine drives Isaac to Gerar — She is my sister',
       E'Jasher opens the next generation exactly where Genesis sets it: *And in those days, after the death of Abraham, in that year Yahuah (the Lord) brought a heavy famine in the land, and whilst the famine was raging in the land of Canaan, Isaac rose up to go down to Egypt on account of the famine, as his father Abraham had done* (Jasher 28:1). Yahuah turns him aside — *And Yahuah (the Lord) appeared that night to Isaac and he said to him, Do not go down to Egypt but rise and go to Gerar, to Abimelech king of the Philistines, and remain there till the famine shall cease* (Jasher 28:2). It ain''t new: this is Genesis 26 told over again — the second famine, the same diversion, the same wife-as-sister fear, the same Abimelech at the window. Jubilees carries the very same scene, naming it the death-of-Abraham aftermath. The covenant seed is kept alive through the famine, Yahuah Himself steering the chosen line.',
       sv.verse_id, ev.verse_id, 'extras', 55675
  FROM _session252_ja28_lookup sv, _session252_ja28_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=28 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-28-hundredfold-blessing',
       E'Isaac sows a hundredfold — Yahuah blessed him',
       E'The famine cannot starve the blessed seed: *And Isaac sowed in that land, and received a hundred-fold in the same year, and Yahuah (the Lord) blessed him. And the man waxed great, and he had possession of flocks and possession of herds and great store of servants* (Jasher 28:14-15). Then the word sends him home — *And when the days of the famine had passed away Yahuah (the Lord) appeared to Isaac and said to him, Rise up, go forth from this place and return to your land, to the land of Canaan* (Jasher 28:16). It ain''t new — Genesis 26 measures the same hundredfold harvest and the same waxing-great, and Jubilees counts the same increase. The Abrahamic blessing flows unbroken into Isaac; the covenant prospers in famine and is summoned back to the land of promise.',
       sv.verse_id, ev.verse_id, 'extras', 55678
  FROM _session252_ja28_lookup sv, _session252_ja28_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=28 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-28-jacob-shem-eber-election',
       E'Jacob sent to Shem and Eber — the elder serve the younger',
       E'Now the election shows its hand: *At that time Isaac sent his younger son Jacob to the house of Shem and Eber, and he learned the instructions of Yahuah (the Lord), and Jacob remained in the house of Shem and Eber for thirty-two years, and Esau his brother did not go, for he was not willing to go, and he remained in his father''s house in the land of Canaan* (Jasher 28:18). The younger son is sent to the seed-line''s living teachers — Shem and Eber, the very names Genesis 11 carries from Shem down through Arphaxad and Salah to Eber. Jacob seeks the instructions of Yahuah; Esau will not go. This is Torah-before-Sinai kept in the chosen house, and it is the choice the canon already declared in the womb — *the elder shall serve the younger* — and which the apostle reads as election standing before either child had done good or evil. It ain''t new: Jacob is the chosen seed, schooled in the way.',
       sv.verse_id, ev.verse_id, 'extras', 55681
  FROM _session252_ja28_lookup sv, _session252_ja28_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=17
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=28 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-28-esau-hunter-hittite-wife',
       E'Esau the deceitful hunter takes a Canaanite wife',
       E'Against Jacob set Esau, and the contrast is sharp: *And Esau was a designing and deceitful man, one who hunted after the hearts of men and inveigled them, and Esau was a valiant man in the field, and in the course of time went as usual to hunt; and he came as far as the field of Seir, the same is Edom* (Jasher 28:20). He marries out of the covenant — *And Esau took her for a wife, and he came to her; forty years old was Esau when he took her, and he brought her to Hebron, the land of his father''s dwelling place, and he dwelt there* (Jasher 28:23). It ain''t new: Genesis already names Esau the cunning hunter and the man of the field, and Genesis already records the forty-year-old Esau marrying the Hittite Judith — a grief of mind to Isaac and Rebekah. While Jacob is sent to Shem and Eber, Esau goes to Seir and weds Canaan; the seed-line and the despised line part ways in the very same chapter.',
       sv.verse_id, ev.verse_id, 'extras', 55684
  FROM _session252_ja28_lookup sv, _session252_ja28_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=28 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-28-shem-dies-leah-rachel-born',
       E'Shem dies; Laban''s twins Leah and Rachel are born',
       E'The seed-line passes a marker and prepares its next chapter: *And it came to pass in those days, in the hundred and tenth year of the life of Isaac, that is in the fiftieth year of the life of Jacob, in that year died Shem the son of Noah; Shem was six hundred years old at his death* (Jasher 28:24). Then in Haran a barrenness is opened — *And Yahuah (the Lord) afterward remembered Adinah the wife of Laban, and she conceived and bare twin daughters, and Laban called the names of his daughters, the name of the elder Leah, and the name of the younger Rachel* (Jasher 28:28). It ain''t new: Genesis names these same two daughters of Laban, the elder Leah and the younger Rachel — the mothers through whom the twelve tribes will come. The chapter that schooled Jacob in the house of Shem ends by stirring the womb that will bear his wives; the gathering of the twelve tribes is already being set in motion.',
       sv.verse_id, ev.verse_id, 'extras', 55687
  FROM _session252_ja28_lookup sv, _session252_ja28_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=28 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-28-isaac-gerar-famine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 26:1 — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar.* The same second famine that opens Jasher 28:1, sending Isaac down the road his father walked.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-isaac-gerar-famine'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:2 — *And Yahuah (LORD) appeared unto him, and said, Go not down into Egypt; dwell in the land which I shall tell thee of:* The same night-word turning Isaac aside from Egypt to Gerar that Jasher 28:2 records verbatim in spirit.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-isaac-gerar-famine'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 26:8 — *And it came to pass, when he had been there a long time, that Abimelech king of the Philistines looked out at a window, and saw, and, behold, Isaac was sporting with Rebekah his wife.* The very window-scene Jasher 28:7 retells, Abimelech discovering Rebecca was no sister.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-isaac-gerar-famine'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 26:11 — *And Abimelech charged all his people, saying, He that toucheth this man or his wife shall surely be put to death.* The king''s protective decree that Jasher 28:11 expands into a proclamation through the streets.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-isaac-gerar-famine'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 24:2 — *And in the first year of the fourth week a famine began in the land, besides the first famine, which had been in the days of Abraham.* Jubilees narrates the identical post-Abraham famine, a genuine self-link to Jasher 28:1 in the patriarchal record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-isaac-gerar-famine'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-28-hundredfold-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 26:12 — *Then Isaac sowed in that land, and received in the same year an hundredfold: and Yahuah (LORD) blessed him.* The exact hundredfold harvest of Jasher 28:14, the blessing outrunning the famine.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-hundredfold-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:14 — *For he had possession of flocks, and possession of herds, and great store of servants: and the Philistines envied him.* The same flocks, herds, and store of servants Jasher 28:15 lists as Isaac waxes great.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-hundredfold-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 24:15 — *And he sowed in the land of the Philistines and brought in a hundred-fold, and Isaac became exceedingly great, and the Philistines envied him.* Jubilees records the same hundredfold sowing as Jasher 28:14, the parallel patriarchal witness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-hundredfold-blessing'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-28-jacob-shem-eber-election
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:14 — *And Salah lived thirty years, and begat Eber:* The seed-line of Shem→Arphaxad→Salah→Eber that Jasher names as Jacob''s teaching-house, the very Eber to whom he is sent in Jasher 28:18.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-jacob-shem-eber-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The election already spoken in the womb, why the younger Jacob — not Esau — is sent to learn the way in Jasher 28:18.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-jacob-shem-eber-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* The election precedes confession — the same choosing of Jacob that Jasher 28:18 shows in the sending.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-jacob-shem-eber-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* The covenant verdict on Esau and Jacob that frames why only Jacob seeks the instructions of Yahuah in Jasher 28:18.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-jacob-shem-eber-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise:* Jacob named heir of the same promise, the faith-line he is schooled in while in the house of Shem and Eber in Jasher 28:18.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-jacob-shem-eber-election'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-28-esau-hunter-hittite-wife
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:27 — *And the boys grew: and Esau was a cunning hunter, a man of the field; and Jacob was a plain man, dwelling in tents.* The canon''s own portrait of Esau the cunning hunter and man of the field that Jasher 28:20 amplifies into the deceitful inveigler.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-esau-hunter-hittite-wife'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:34 — *And Esau was forty years old when he took to wife Judith the daughter of Beeri the Hittite, and Bashemath the daughter of Elon the Hittite:* The forty-year-old Esau wedding Judith the Hittite, the exact marriage Jasher 28:22-23 recounts.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-esau-hunter-hittite-wife'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 26:35 — *Which were a grief of mind unto Isaac and to Rebekah.* The bitterness of Esau''s out-of-covenant marriage in Jasher 28:23, the despised line grieving the chosen house.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-esau-hunter-hittite-wife'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-28-shem-dies-leah-rachel-born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:10 — *These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood:* The Shem of the seed-line whose long life Jasher 28:24 closes at six hundred years, the teacher in whose house Jacob learned.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-shem-dies-leah-rachel-born'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 29:16 — *And Laban had two daughters: the name of the elder was Leah, and the name of the younger was Rachel.* The same two daughters of Laban, elder Leah and younger Rachel, whose birth Jasher 28:28 records — Jacob''s wives-to-be and the mothers of the tribes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-shem-dies-leah-rachel-born'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 29:17 — *Leah was tender eyed; but Rachel was beautiful and well favoured.* The two sisters of Jasher 28:28 as the canon describes them, the line through which the twelve tribes will be gathered.'
  FROM cross_reference_threads t, cross_references x, _session252_ja28_lookup sv, _session252_ja28_lookup tv
 WHERE t.slug='jasher-28-shem-dies-leah-rachel-born'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=28 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

