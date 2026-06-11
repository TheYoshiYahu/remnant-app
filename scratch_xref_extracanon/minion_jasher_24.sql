-- ----- fragment: minion_jasher_24.sql (session252 jasher 24) -----
-- Source anchor: jasher/jasher ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja24 (view _session252_ja24_lookup). Sort band base 55575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-24-sarah-machpelah
  ('jasher', 'jasher', 24, 1, 'canon', 'genesis', 23, 1, 'free', E'Genesis 23:1 — *And Sarah was an hundred and seven and twenty years old: these were the years of the life of Sarah.* The same hundred-and-twenty-seven-year span that opens Jasher 24:1 — the layer is Genesis 23 retold.'),
  ('jasher', 'jasher', 24, 6, 'canon', 'genesis', 23, 16, 'free', E'Genesis 23:16 — *And Abraham hearkened unto Ephron; and Abraham weighed to Ephron the silver, which he had named in the audience of the sons of Heth, four hundred shekels of silver, current money with the merchant.* Jasher 24:6-7''s insistence on buying at full value, four hundred shekels weighed out, is the canon''s own account.'),
  ('jasher', 'jasher', 24, 11, 'canon', 'genesis', 23, 20, 'free', E'Genesis 23:20 — *And the field, and the cave that is therein, were made sure unto Abraham for a possession of a buryingplace by the sons of Heth.* Jasher 24:11''s field and cave made sure to Abraham and his seed for ever is Genesis 23:20 verbatim.'),
  ('jasher', 'jasher', 24, 11, 'canon', 'genesis', 49, 31, 'free', E'Genesis 49:31 — *There they buried Abraham and Sarah his wife; there they buried Isaac and Rebekah his wife; and there I buried Leah.* Machpelah, bought in Jasher 24:11, becomes the burial of the whole chosen seed-line — Jacob''s dying charge points back to this purchase.'),
  ('jasher', 'jasher', 24, 1, 'jubilees', 'jubilees', 19, 8, 'extras', E'Jubilees 19:8 — *This is the tenth trial wherewith Abraham was tried, and he was found faithful, patient in spirit.* The Jubilees apparatus narrates the same death of Sarah (Jasher 24:1) and reads Abraham''s burying of his dead as a tenth trial faithfully endured.'),
  -- thread: jasher-24-strangers-sojourners
  ('jasher', 'jasher', 24, 2, 'canon', 'genesis', 23, 4, 'free', E'Genesis 23:4 — *I am a stranger and a sojourner with you: give me a possession of a buryingplace with you, that I may bury my dead out of my sight.* Jasher 24:2 carries Abraham''s stranger-and-sojourner confession straight from the canon.'),
  ('jasher', 'jasher', 24, 2, 'canon', 'hebrews', 11, 9, 'free', E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise.* Abraham''s confessed sojourning in Jasher 24:2 is the faith Hebrews names — heir of a land he holds only as a stranger.'),
  ('jasher', 'jasher', 24, 2, 'canon', 'hebrews', 11, 13, 'free', E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* Sarah dies and Abraham buries her as a stranger in the land (Jasher 24:2) — the fathers die in faith, owning only a tomb in the promise.'),
  ('jasher', 'jasher', 24, 12, 'canon', 'acts', 7, 5, 'free', E'Acts 7:5 — *And he gave him none inheritance in it, no, not so much as to set his foot on: yet he promised that he would give it to him for a possession, and to his seed after him, when as yet he had no child.* The only ground Abraham holds in Jasher 24:12 is Sarah''s grave — Stephen reads the whole land as still promise, not yet possession.'),
  -- thread: jasher-24-isaac-shem-eber
  ('jasher', 'jasher', 24, 17, 'jubilees', 'jubilees', 19, 17, 'extras', E'Jubilees 19:17 — *For he shall be in my stead on the earth, And for a blessing in the midst of the children of men, And for the glory of the whole seed of Shem.* Isaac is sent to Shem''s house to learn the ways of Yahuah (Jasher 24:17); Jubilees names the same Shem-line as the glory through which the chosen seed is blessed.'),
  ('jasher', 'jasher', 24, 14, 'jubilees', 'jubilees', 19, 2, 'extras', E'Jubilees 19:2 — *And in the first year of the third week of this jubilee the days of the life of Sarah were accomplished, and she died in Hebron.* The same death of Sarah whose bier (Jasher 24:14) gathers Shem and Eber — the Jubilees apparatus dates it to the third week of the jubilee in Hebron.'),
  -- thread: jasher-24-lot-moab-benami
  ('jasher', 'jasher', 24, 23, 'canon', 'genesis', 19, 37, 'free', E'Genesis 19:37 — *And the firstborn bare a son, and called his name Moab: the same is the father of the Moabites unto this day.* Jasher 24:23''s Moab, firstborn of Lot''s daughters, is the Moab the canon names in Genesis 19 — the layer simply carries it forward to Lot''s death.'),
  -- thread: jasher-24-eliezer-oath-rebecca
  ('jasher', 'jasher', 24, 30, 'canon', 'genesis', 24, 3, 'free', E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell.* Abraham''s oath in Jasher 24:30 against a Canaanite wife is Genesis 24:3 word for word — the seed guarded from the land''s daughters.'),
  ('jasher', 'jasher', 24, 36, 'canon', 'genesis', 24, 12, 'free', E'Genesis 24:12 — *And he said, O Yahuah Elohim (LORD God) of my master Abraham, I pray thee, send me good speed this day, and shew kindness unto my master Abraham.* Eliezer''s well-side prayer in Jasher 24:36 is the canon''s prayer of Abraham''s servant.'),
  ('jasher', 'jasher', 24, 37, 'canon', 'genesis', 24, 24, 'free', E'Genesis 24:24 — *And she said unto him, I am the daughter of Bethuel the son of Milcah, which she bare unto Nahor.* Jasher 24:37 brings Eliezer to the daughter of Bethuel son of Milcah, wife of Nahor — the same lineage Genesis 24 confirms at the well.'),
  ('jasher', 'jasher', 24, 45, 'canon', 'genesis', 25, 20, 'free', E'Genesis 25:20 — *And Isaac was forty years old when he took Rebekah to wife, the daughter of Bethuel the Syrian of Padan-aram, the sister to Laban the Syrian.* Jasher 24:45''s Isaac forty years old at his marriage matches the canon''s own reckoning to the year.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-24-sarah-machpelah',
       E'Sarah''s death and the cave of Machpelah bought for ever',
       E'Jasher opens, *"And the life of Sarah was one hundred and twenty-seven years, and Sarah died; and Abraham rose up from before his dead to seek a burial place to bury his wife Sarah"* (Jasher 24:1), and tells how Abraham would not take the cave for nothing but bought it at full value — *"Only at full value will I buy it from your hand... and from the hand of your seed for ever"* (Jasher 24:6) — and the field of Machpelah before Mamre in Hebron was *"made sure to Abraham and to his seed after him"* (Jasher 24:11). It ain''t new: this is Genesis 23 retold word for word. *"And Sarah was an hundred and seven and twenty years old: these were the years of the life of Sarah"* (Genesis 23:1); *"And Abraham stood up from before his dead, and spake unto the sons of Heth"* (Genesis 23:3); *"And Abraham hearkened unto Ephron; and Abraham weighed to Ephron the silver... four hundred shekels of silver"* (Genesis 23:16); *"And the field, and the cave that is therein, were made sure unto Abraham for a possession of a buryingplace by the sons of Heth"* (Genesis 23:20). That deed of perpetual possession is the seed-line''s first foothold in the promised land — the very cave Jacob charges his sons toward: *"In the cave that is in the field of Machpelah, which is before Mamre, in the land of Canaan, which Abraham bought with the field of Ephron the Hittite for a possession of a buryingplace"* (Genesis 49:30), *"There they buried Abraham and Sarah his wife; there they buried Isaac and Rebekah his wife; and there I buried Leah"* (Genesis 49:31). The Jubilees apparatus narrates the same death and purchase and counts it a trial endured: *"And in the first year of the third week of this jubilee the days of the life of Sarah were accomplished, and she died in Hebron"* (Jubilees 19:2); *"This is the tenth trial wherewith Abraham was tried, and he was found faithful, patient in spirit"* (Jubilees 19:8).',
       sv.verse_id, ev.verse_id, 'extras', 55575
  FROM _session252_ja24_lookup sv, _session252_ja24_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=24 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-24-strangers-sojourners',
       E'A stranger and a sojourner seeking a buryingplace',
       E'Before he buys, Abraham confesses his standing in the land: *"I am a stranger and a sojourner with you in your land; give me a possession of a burial place in your land, that I may bury my dead from before me"* (Jasher 24:2), and the children of Heth answer, *"behold the land is before you, in the choice of our sepulchers bury your dead"* (Jasher 24:3). It ain''t new — Genesis sets the same words in his mouth: *"I am a stranger and a sojourner with you: give me a possession of a buryingplace with you, that I may bury my dead out of my sight"* (Genesis 23:4). The New Testament gathers up that single confession into the whole patriarchal hope: *"By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise"* (Hebrews 11:9); *"These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth"* (Hebrews 11:13). Even the deed to Machpelah is a down-payment on a land not yet possessed — as Stephen testifies, *"And he gave him none inheritance in it, no, not so much as to set his foot on: yet he promised that he would give it to him for a possession, and to his seed after him, when as yet he had no child"* (Acts 7:5). The called seed sojourns now and inherits later; the burial plot is the pledge.',
       sv.verse_id, ev.verse_id, 'extras', 55578
  FROM _session252_ja24_lookup sv, _session252_ja24_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=24 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-24-isaac-shem-eber',
       E'Isaac sent to Shem and Eber to learn the ways of Yahuah',
       E'Jasher adds what the canon leaves unsaid: at Sarah''s bier stood *"Shem, his sons Eber and Abimelech"* (Jasher 24:14), and when the mourning passed *"Abraham sent away his son Isaac, and he went to the house of Shem and Eber, to learn the ways of Yahuah (the Lord) and his instructions"* (Jasher 24:17). This is the seed-line keeping the way before Sinai — Torah-before-Sinai, the chosen line discipled in the instructions of Yahuah generation by generation. It ain''t new that the elect are kept and chosen: the chosen seed runs Shem to Abraham to Isaac, and the legendary detail of Isaac at Shem''s house only dramatizes the canon''s own genealogy of the kept line. The Jubilees apparatus tells the same election of the next generation in the same hour — Abraham gathers Jacob and charges the seed: *"For I know that Yahuah (God) will choose him to be a people for possession to Himself, above all peoples that are upon the face of the earth"* (Jubilees 19:17), the very name and seed called through the line of Shem: *"For he shall be in my stead on the earth, And for a blessing in the midst of the children of men, And for the glory of the whole seed of Shem"* (Jubilees 19:17). The way Isaac is sent to learn is the way the fathers walked, calling on the Name — election precedes the confession.',
       sv.verse_id, ev.verse_id, 'extras', 55581
  FROM _session252_ja24_lookup sv, _session252_ja24_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=24 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-24-lot-moab-benami',
       E'The death of Lot and the children of his daughters',
       E'Jasher closes Lot''s story: *"And Lot the son of Haran also died in those days, in the thirty-ninth year of the life of Isaac"* (Jasher 24:22), and names *"the children of Lot, that were born to him by his daughters, the name of the first born was Moab, and the name of the second was Benami"* (Jasher 24:23). It ain''t new — Genesis already recorded that birth out of Sodom''s aftermath: *"And the firstborn bare a son, and called his name Moab: the same is the father of the Moabites unto this day"* (Genesis 19:37). These are the nations sprung from Lot beside the chosen seed — Moab and Ammon (Benami) — the families that *"went and built themselves cities in the land where they dwelt, and they called the names of the cities which they built after their own names"* (Jasher 24:26), the kingdom-of-man pattern of city-building set off against the sojourning seed that owns only a grave. The seed-line is kept distinct: Lot''s line peoples its own cities while Isaac is sent to learn the ways of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 55584
  FROM _session252_ja24_lookup sv, _session252_ja24_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=22
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=24 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-24-eliezer-oath-rebecca',
       E'The oath of Eliezer and a wife for Isaac from the kindred',
       E'Abraham binds his head servant by oath before he dies: *"Behold I am old, I do not know the day of my death... do not take a wife for my son from this place and from this land, from the daughters of the Canaanites amongst whom we dwell"* (Jasher 24:30), but *"go to my land and to my birthplace, and take from there a wife for my son"* (Jasher 24:31). Eliezer prays at the well — *"O Elohim (God) of Abraham my master; send me I pray you good speed this day and show kindness to my master"* (Jasher 24:36) — and Yahuah brings him to Rebecca, daughter of Bethuel, given for a wife to Isaac (Jasher 24:39). It ain''t new: this is Genesis 24 retold. *"And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell"* (Genesis 24:3); *"And he said, O Yahuah Elohim (LORD God) of my master Abraham, I pray thee, send me good speed this day, and shew kindness unto my master Abraham"* (Genesis 24:12); *"And she said unto him, I am the daughter of Bethuel the son of Milcah, which she bare unto Nahor"* (Genesis 24:24). Jasher seals the scene as Genesis does — *"And Isaac was forty years old when he took Rebecca, the daughter of his uncle Bethuel, for a wife"* (Jasher 24:45), matching *"And Isaac was forty years old when he took Rebekah to wife, the daughter of Bethuel the Syrian of Padan-aram, the sister to Laban the Syrian"* (Genesis 25:20). The Jubilees apparatus records the same marriage: *"And in the fourth year thereof he took a wife for his son Isaac and her name was Rebecca the daughter of Bethuel, the son of Nahor, the brother of Abraham"* (Jubilees 19:10). The wife for the son of promise is kept from the chosen kindred, not the Canaanite — the seed-line guarded.',
       sv.verse_id, ev.verse_id, 'extras', 55587
  FROM _session252_ja24_lookup sv, _session252_ja24_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=24 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-24-sarah-machpelah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 23:1 — *And Sarah was an hundred and seven and twenty years old: these were the years of the life of Sarah.* The same hundred-and-twenty-seven-year span that opens Jasher 24:1 — the layer is Genesis 23 retold.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-sarah-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 23:16 — *And Abraham hearkened unto Ephron; and Abraham weighed to Ephron the silver, which he had named in the audience of the sons of Heth, four hundred shekels of silver, current money with the merchant.* Jasher 24:6-7''s insistence on buying at full value, four hundred shekels weighed out, is the canon''s own account.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-sarah-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 23:20 — *And the field, and the cave that is therein, were made sure unto Abraham for a possession of a buryingplace by the sons of Heth.* Jasher 24:11''s field and cave made sure to Abraham and his seed for ever is Genesis 23:20 verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-sarah-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 49:31 — *There they buried Abraham and Sarah his wife; there they buried Isaac and Rebekah his wife; and there I buried Leah.* Machpelah, bought in Jasher 24:11, becomes the burial of the whole chosen seed-line — Jacob''s dying charge points back to this purchase.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-sarah-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 19:8 — *This is the tenth trial wherewith Abraham was tried, and he was found faithful, patient in spirit.* The Jubilees apparatus narrates the same death of Sarah (Jasher 24:1) and reads Abraham''s burying of his dead as a tenth trial faithfully endured.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-sarah-machpelah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-24-strangers-sojourners
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 23:4 — *I am a stranger and a sojourner with you: give me a possession of a buryingplace with you, that I may bury my dead out of my sight.* Jasher 24:2 carries Abraham''s stranger-and-sojourner confession straight from the canon.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-strangers-sojourners'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise.* Abraham''s confessed sojourning in Jasher 24:2 is the faith Hebrews names — heir of a land he holds only as a stranger.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-strangers-sojourners'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* Sarah dies and Abraham buries her as a stranger in the land (Jasher 24:2) — the fathers die in faith, owning only a tomb in the promise.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-strangers-sojourners'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:5 — *And he gave him none inheritance in it, no, not so much as to set his foot on: yet he promised that he would give it to him for a possession, and to his seed after him, when as yet he had no child.* The only ground Abraham holds in Jasher 24:12 is Sarah''s grave — Stephen reads the whole land as still promise, not yet possession.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-strangers-sojourners'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-24-isaac-shem-eber
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 19:17 — *For he shall be in my stead on the earth, And for a blessing in the midst of the children of men, And for the glory of the whole seed of Shem.* Isaac is sent to Shem''s house to learn the ways of Yahuah (Jasher 24:17); Jubilees names the same Shem-line as the glory through which the chosen seed is blessed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-isaac-shem-eber'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=17
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 19:2 — *And in the first year of the third week of this jubilee the days of the life of Sarah were accomplished, and she died in Hebron.* The same death of Sarah whose bier (Jasher 24:14) gathers Shem and Eber — the Jubilees apparatus dates it to the third week of the jubilee in Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-isaac-shem-eber'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-24-lot-moab-benami
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:37 — *And the firstborn bare a son, and called his name Moab: the same is the father of the Moabites unto this day.* Jasher 24:23''s Moab, firstborn of Lot''s daughters, is the Moab the canon names in Genesis 19 — the layer simply carries it forward to Lot''s death.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-lot-moab-benami'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-24-eliezer-oath-rebecca
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell.* Abraham''s oath in Jasher 24:30 against a Canaanite wife is Genesis 24:3 word for word — the seed guarded from the land''s daughters.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-eliezer-oath-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:12 — *And he said, O Yahuah Elohim (LORD God) of my master Abraham, I pray thee, send me good speed this day, and shew kindness unto my master Abraham.* Eliezer''s well-side prayer in Jasher 24:36 is the canon''s prayer of Abraham''s servant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-eliezer-oath-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 24:24 — *And she said unto him, I am the daughter of Bethuel the son of Milcah, which she bare unto Nahor.* Jasher 24:37 brings Eliezer to the daughter of Bethuel son of Milcah, wife of Nahor — the same lineage Genesis 24 confirms at the well.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-eliezer-oath-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 25:20 — *And Isaac was forty years old when he took Rebekah to wife, the daughter of Bethuel the Syrian of Padan-aram, the sister to Laban the Syrian.* Jasher 24:45''s Isaac forty years old at his marriage matches the canon''s own reckoning to the year.'
  FROM cross_reference_threads t, cross_references x, _session252_ja24_lookup sv, _session252_ja24_lookup tv
 WHERE t.slug='jasher-24-eliezer-oath-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=24 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

