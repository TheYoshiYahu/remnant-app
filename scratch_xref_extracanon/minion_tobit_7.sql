-- ----- fragment: minion_tobit_07.sql (session253 tobit 7) -----
-- Source anchor: apocrypha/tobit ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob7 (view _session253_tob7_lookup). Sort band base 59750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-7-kinsman-recognized
  ('apocrypha', 'tobit', 7, 6, 'canon', 'genesis', 29, 13, 'free', E'Genesis 29:13 — *And it came to pass, when Laban heard the tidings of Jacob his sister’s son, that he ran to meet him, and embraced him, and kissed him, and brought him to his house. And he told Laban all these things.* Raguel leaping up to kiss and weep over Tobit''s son re-enacts Laban running to embrace his sister''s son Jacob.'),
  ('apocrypha', 'tobit', 7, 7, 'canon', 'genesis', 29, 14, 'free', E'Genesis 29:14 — *And Laban said to him, Surely thou art my bone and my flesh. And he abode with him the space of a month.* Raguel''s blessing — *You are the son of an honest and good man* — names the same bone-and-flesh kinship that binds Tobias into Raguel''s house.'),
  ('apocrypha', 'tobit', 7, 4, 'canon', 'genesis', 29, 5, 'free', E'Genesis 29:5 — *And he said unto them, Know ye Laban the son of Nahor? And they said, We know him.* Raguel''s *Do you know Tobit our kinsman? And they said, We know him* repeats Jacob''s well-side recognition of the kindred verbatim in pattern.'),
  -- thread: tobit-7-wife-of-thine-own-kindred
  ('apocrypha', 'tobit', 7, 12, 'canon', 'genesis', 24, 4, 'free', E'Genesis 24:4 — *But thou shalt go unto my country, and to my kindred, and take a wife unto my son Isaac.* Raguel granting Sara because *you are her cousin* keeps Abraham''s charge to seek the bride from his own kindred, not the nations.'),
  ('apocrypha', 'tobit', 7, 10, 'canon', 'numbers', 36, 6, 'free', E'Numbers 36:6 — *This is the thing which Yahuah (LORD) doth command concerning the daughters of Zelophehad, saying, Let them marry to whom they think best; only to the family of the tribe of their father shall they marry.* Raguel''s *it is meet that you should marry my daughter* obeys the same statute binding an heiress to a man of her father''s tribe.'),
  ('apocrypha', 'tobit', 7, 10, 'canon', 'numbers', 36, 8, 'free', E'Numbers 36:8 — *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* Sara, the only daughter, is given to her cousin so the inheritance of Nephthalim is not removed from the tribe.'),
  ('apocrypha', 'tobit', 7, 9, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The marriage made within the kindred is the obverse of the marriage forbidden with the nations — Tobias seeks Sara precisely because she is of the covenant seed.'),
  -- thread: tobit-7-written-sealed-covenant
  ('apocrypha', 'tobit', 7, 13, 'canon', 'genesis', 24, 51, 'free', E'Genesis 24:51 — *Behold, Rebekah is before thee, take her, and go, and let her be thy master’s son’s wife, as Yahuah (LORD) hath spoken.* Raguel taking Sara by the hand and saying *take her after the law of Moses, and lead her away to your father* echoes Bethuel and Laban giving Rebekah to be Isaac''s wife.'),
  ('apocrypha', 'tobit', 7, 12, 'canon', 'genesis', 24, 50, 'free', E'Genesis 24:50 — *Then Laban and Bethuel answered and said, The thing proceedeth from Yahuah (LORD): we cannot speak unto thee bad or good.* Raguel''s *the merciful Yahuah (God) give you good success in all things* reads the betrothal, like Rebekah''s, as proceeding from Yahuah Himself.'),
  ('apocrypha', 'tobit', 7, 14, 'canon', 'ruth', 4, 10, 'free', E'Ruth 4:10 — *Moreover Ruth the Moabitess, the wife of Mahlon, have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off from among his brethren, and from the gate of his place: ye are witnesses this day.* The sealed instrument of covenants in Tobit is the same witnessed marriage-deed by which Boaz, the kinsman, secures the bride and the inheritance.'),
  ('apocrypha', 'tobit', 7, 13, 'canon', 'mark', 10, 7, 'free', E'Mark 10:7 — *For this cause shall a man leave his father and mother, and cleave to his wife;* the bride led away to the bridegroom''s father after the law of Moses is the leaving-and-cleaving the Messiah grounds in the creation order.'),
  -- thread: tobit-7-the-wedding-feast
  ('apocrypha', 'tobit', 7, 15, 'canon', 'genesis', 29, 22, 'free', E'Genesis 29:22 — *And Laban gathered together all the men of the place, and made a feast.* Raguel''s table after the sealed covenant — *Then they began to eat* — is the kinsman''s wedding feast that Laban makes for Jacob and Rachel.'),
  ('apocrypha', 'tobit', 7, 9, 'canon', 'genesis', 24, 54, 'free', E'Genesis 24:54 — *And they did eat and drink, he and the men that were with him, and tarried all night; and they rose up in the morning, and he said, Send me away unto my master.* Raguel''s *Eat and drink, and make merry* matches the betrothal meal at Bethuel''s house before the bride is led home.'),
  -- thread: tobit-7-blessing-of-the-bride
  ('apocrypha', 'tobit', 7, 18, 'canon', 'genesis', 24, 60, 'free', E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* Edna''s *Yahuah (God) of heaven and earth give you joy* sends Sara out under the same household blessing pronounced over Rebekah as she leaves for Isaac.'),
  ('apocrypha', 'tobit', 7, 18, 'canon', 'ruth', 4, 11, 'free', E'Ruth 4:11 — *And all the people that were in the gate, and the elders, said, We are witnesses. Yahuah (LORD) make the woman that is come into thine house like Rachel and like Leah, which two did build the house of Yashar''el (Israel): and do thou worthily in Ephratah, and be famous in Beth-lehem:* the blessing turning Sara''s sorrow to joy is the same bridal benediction the gate pronounces over Ruth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-kinsman-recognized',
       E'He ran to meet his kinsman: the welcome at the well-house',
       E'Tobias arrives a stranger and is known by his face: *Then said Raguel to Edna his wife, How like is this young man to Tobit my cousin!* (Tobit 7:2), and when the line is confirmed, *Then Raguel leaped up, and kissed him, and wept* (Tobit 7:6). It ain''t new — this is the patriarchs'' own welcome of the kinsman come from afar. When Jacob comes east to the house of his mother''s brother, *And it came to pass, when Laban heard the tidings of Jacob his sister''s son, that he ran to meet him, and embraced him, and kissed him, and brought him to his house* (Genesis 29:13), and the bond is named, *Surely thou art my bone and my flesh* (Genesis 29:14). The mutual recognition at the well — *And he said unto them, Know ye Laban the son of Nahor? And they said, We know him* (Genesis 29:5) — is the very shape of Raguel''s question after Tobit. The scattered house of Yashar''el, captive in Nineveh, still knows its own across the exile.',
       sv.verse_id, ev.verse_id, 'extras', 59750
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-wife-of-thine-own-kindred',
       E'A wife of thine own kindred: the seed kept within the tribe',
       E'Raguel gives Sara because the right is Tobias''s own: *For it is meet that you should marry my daughter* (Tobit 7:10), *for you are her cousin, and she is yours* (Tobit 7:12). It ain''t new — this is the Torah''s own guarding of the inheritance within the tribe. Abraham binds his servant by oath, *thou shalt not take a wife unto my son of the daughters of the Canaanites... But thou shalt go unto my country, and to my kindred, and take a wife unto my son Isaac* (Genesis 24:3-4); the daughters of Zelophehad are commanded, *only to the family of the tribe of their father shall they marry* (Numbers 36:6), *that the children of Yashar''el may enjoy every man the inheritance of his fathers* (Numbers 36:8). The exile has not loosed the covenant of the seed-line; in Nineveh the law of Moses still orders the marriage.',
       sv.verse_id, ev.verse_id, 'extras', 59753
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-written-sealed-covenant',
       E'Took her after the law of Moses: the written and sealed covenant',
       E'The marriage is no mere feeling but a sworn, written deed: Tobias will not eat *till we agree and swear one to another* (Tobit 7:11); Raguel takes Sara by the hand and gives her, *Behold, take her after the law of Moses, and lead her away to your father* (Tobit 7:13); then *took paper, and did write an instrument of covenants, and sealed it* (Tobit 7:14). It ain''t new — this is how Israel binds a marriage covenant. When the bride is asked for, the kindred answer, *The thing proceedeth from Yahuah (LORD)... Behold, Rebekah is before thee, take her, and go* (Genesis 24:50-51). At the gate Boaz makes the kinsman-covenant before witnesses, *to raise up the name of the dead upon his inheritance... ye are witnesses this day* (Ruth 4:10). And the Messiah Himself anchors marriage in the law of Moses and the creation order, *For this cause shall a man leave his father and mother, and cleave to his wife* (Mark 10:7).',
       sv.verse_id, ev.verse_id, 'extras', 59756
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-the-wedding-feast',
       E'Then they began to eat: the kinsman''s wedding feast',
       E'Covenant struck, the table is spread: *And the merciful Yahuah (God) give you good success in all things* (Tobit 7:12), and after the deed is sealed, *Then they began to eat* (Tobit 7:15). It ain''t new — when Jacob''s seven years are fulfilled, *Laban gathered together all the men of the place, and made a feast* (Genesis 29:22); and at the betrothal of Rebekah the kindred *did eat and drink, he and the men that were with him, and tarried all night* (Genesis 24:54). The covenant of the seed is sealed and then celebrated at meat, the same pattern that ripens into the marriage-supper of the Lamb.',
       sv.verse_id, ev.verse_id, 'extras', 59759
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-7-blessing-of-the-bride',
       E'Be of good comfort, my daughter: the blessing sent with the bride',
       E'Edna sends Sara out under a blessing, not a curse: *Be of good comfort, my daughter; Yahuah (God) of heaven and earth give you joy for this your sorrow* (Tobit 7:18), even as she *received the tears of her daughter* (Tobit 7:17). It ain''t new — this is the mother''s house blessing the bride as she goes. Rebekah is sent with the same word, *Thou art our sister, be thou the mother of thousands of millions* (Genesis 24:60); and at Ruth''s marriage the people pray, *Yahuah (LORD) make the woman that is come into thine house like Rachel and like Leah, which two did build the house of Yashar''el* (Ruth 4:11). The daughter of the scattered house goes out to her husband carrying the blessing of the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 59762
  FROM _session253_tob7_lookup sv, _session253_tob7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-7-kinsman-recognized
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:13 — *And it came to pass, when Laban heard the tidings of Jacob his sister’s son, that he ran to meet him, and embraced him, and kissed him, and brought him to his house. And he told Laban all these things.* Raguel leaping up to kiss and weep over Tobit''s son re-enacts Laban running to embrace his sister''s son Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-kinsman-recognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 29:14 — *And Laban said to him, Surely thou art my bone and my flesh. And he abode with him the space of a month.* Raguel''s blessing — *You are the son of an honest and good man* — names the same bone-and-flesh kinship that binds Tobias into Raguel''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-kinsman-recognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 29:5 — *And he said unto them, Know ye Laban the son of Nahor? And they said, We know him.* Raguel''s *Do you know Tobit our kinsman? And they said, We know him* repeats Jacob''s well-side recognition of the kindred verbatim in pattern.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-kinsman-recognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-7-wife-of-thine-own-kindred
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:4 — *But thou shalt go unto my country, and to my kindred, and take a wife unto my son Isaac.* Raguel granting Sara because *you are her cousin* keeps Abraham''s charge to seek the bride from his own kindred, not the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-wife-of-thine-own-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 36:6 — *This is the thing which Yahuah (LORD) doth command concerning the daughters of Zelophehad, saying, Let them marry to whom they think best; only to the family of the tribe of their father shall they marry.* Raguel''s *it is meet that you should marry my daughter* obeys the same statute binding an heiress to a man of her father''s tribe.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-wife-of-thine-own-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=36 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 36:8 — *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* Sara, the only daughter, is given to her cousin so the inheritance of Nephthalim is not removed from the tribe.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-wife-of-thine-own-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The marriage made within the kindred is the obverse of the marriage forbidden with the nations — Tobias seeks Sara precisely because she is of the covenant seed.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-wife-of-thine-own-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-7-written-sealed-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:51 — *Behold, Rebekah is before thee, take her, and go, and let her be thy master’s son’s wife, as Yahuah (LORD) hath spoken.* Raguel taking Sara by the hand and saying *take her after the law of Moses, and lead her away to your father* echoes Bethuel and Laban giving Rebekah to be Isaac''s wife.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-written-sealed-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:50 — *Then Laban and Bethuel answered and said, The thing proceedeth from Yahuah (LORD): we cannot speak unto thee bad or good.* Raguel''s *the merciful Yahuah (God) give you good success in all things* reads the betrothal, like Rebekah''s, as proceeding from Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-written-sealed-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ruth 4:10 — *Moreover Ruth the Moabitess, the wife of Mahlon, have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off from among his brethren, and from the gate of his place: ye are witnesses this day.* The sealed instrument of covenants in Tobit is the same witnessed marriage-deed by which Boaz, the kinsman, secures the bride and the inheritance.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-written-sealed-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 10:7 — *For this cause shall a man leave his father and mother, and cleave to his wife;* the bride led away to the bridegroom''s father after the law of Moses is the leaving-and-cleaving the Messiah grounds in the creation order.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-written-sealed-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-7-the-wedding-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:22 — *And Laban gathered together all the men of the place, and made a feast.* Raguel''s table after the sealed covenant — *Then they began to eat* — is the kinsman''s wedding feast that Laban makes for Jacob and Rachel.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-the-wedding-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:54 — *And they did eat and drink, he and the men that were with him, and tarried all night; and they rose up in the morning, and he said, Send me away unto my master.* Raguel''s *Eat and drink, and make merry* matches the betrothal meal at Bethuel''s house before the bride is led home.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-the-wedding-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-7-blessing-of-the-bride
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:60 — *And they blessed Rebekah, and said unto her, Thou art our sister, be thou the mother of thousands of millions, and let thy seed possess the gate of those which hate them.* Edna''s *Yahuah (God) of heaven and earth give you joy* sends Sara out under the same household blessing pronounced over Rebekah as she leaves for Isaac.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-blessing-of-the-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ruth 4:11 — *And all the people that were in the gate, and the elders, said, We are witnesses. Yahuah (LORD) make the woman that is come into thine house like Rachel and like Leah, which two did build the house of Yashar''el (Israel): and do thou worthily in Ephratah, and be famous in Beth-lehem:* the blessing turning Sara''s sorrow to joy is the same bridal benediction the gate pronounces over Ruth.'
  FROM cross_reference_threads t, cross_references x, _session253_tob7_lookup sv, _session253_tob7_lookup tv
 WHERE t.slug='tobit-7-blessing-of-the-bride'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

