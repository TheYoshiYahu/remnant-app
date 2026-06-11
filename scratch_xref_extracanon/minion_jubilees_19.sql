-- ----- fragment: minion_jubilees_19.sql (session251 jubilees 19) -----
-- Source anchor: jubilees/jubilees ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju19 (view _session251_ju19_lookup). Sort band base 53450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-19-sarah-machpelah
  ('jubilees', 'jubilees', 19, 2, 'canon', 'genesis', 23, 1, 'free', E'Genesis 23:1 — *And Sarah was an hundred and seven and twenty years old: these were the years of the life of Sarah.* Jubilees 19:6 keeps the same count to the year — one hundred and twenty-seven years of Sarah''s life.'),
  ('jubilees', 'jubilees', 19, 2, 'canon', 'genesis', 23, 2, 'free', E'Genesis 23:2 — *And Sarah died in Kirjath-arba; the same is Hebron in the land of Canaan: and Abraham came to mourn for Sarah, and to weep for her.* This is the source Jubilees 19:2 is retelling — Sarah dies in Hebron and Abraham comes to mourn her.'),
  ('jubilees', 'jubilees', 19, 5, 'canon', 'genesis', 23, 15, 'free', E'Genesis 23:15 — *My lord, hearken unto me: the land is worth four hundred shekels of silver; what is that betwixt me and thee? bury therefore thy dead.* Jubilees 19:5 names the identical price — four hundred pieces of silver for the cave at Hebron.'),
  ('jubilees', 'jubilees', 19, 6, 'canon', 'genesis', 23, 20, 'free', E'Genesis 23:20 — *And the field, and the cave that is therein, were made sure unto Abraham for a possession of a buryingplace by the sons of Heth.* Jubilees 19:6 makes the same point: Abraham would take nothing for nothing but paid in full and bought the double cave outright.'),
  -- thread: jubilees-19-tenth-trial-friend-of-god
  ('jubilees', 'jubilees', 19, 8, 'canon', 'james', 2, 21, 'free', E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* Jubilees 19:8 calls the patient burial of Sarah the tenth trial in which Abraham was found faithful — faith proven by deed.'),
  ('jubilees', 'jubilees', 19, 9, 'canon', 'james', 2, 23, 'free', E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* Jubilees 19:9 records the very same title on the heavenly tables — Abraham the friend of Elohim.'),
  ('jubilees', 'jubilees', 19, 9, 'canon', 'isaiah', 41, 8, 'free', E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The prophet keeps the name Jubilees 19:9 inscribes: Abraham the friend, his seed chosen.'),
  ('jubilees', 'jubilees', 19, 8, 'jubilees', 'jubilees', 18, 12, 'extras', E'Jubilees 18:12 — *And the prince of the Mastêmâ was put to shame; and Abraham lifted up his eyes and looked, and, behold, a single ram caught … by his horns.* The tenth trial of 19:8 stands in line with the Akedah of the chapter before — Abraham tested and found faithful, the satan shamed.'),
  -- thread: jubilees-19-rebekah-keturah-line
  ('jubilees', 'jubilees', 19, 9, 'canon', 'genesis', 24, 15, 'free', E'Genesis 24:15 — *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham''s brother, with her pitcher upon her shoulder.* Jubilees 19:9 names her by the same lineage — Rebecca daughter of Bethuel, son of Nahor, brother of Abraham.'),
  ('jubilees', 'jubilees', 19, 9, 'canon', 'genesis', 24, 67, 'free', E'Genesis 24:67 — *And Isaac brought her into his mother Sarah''s tent, and took Rebekah, and she became his wife; and he loved her: and Isaac was comforted after his mother''s death.* This is the marriage Jubilees 19:9 records — Abraham takes a wife for his son Isaac.'),
  ('jubilees', 'jubilees', 19, 11, 'canon', 'genesis', 25, 1, 'free', E'Genesis 25:1 — *Then again Abraham took a wife, and her name was Keturah.* Jubilees 19:11 matches: Abraham takes a third wife Keturah after Hagar had died before Sarah.'),
  ('jubilees', 'jubilees', 19, 11, 'canon', 'genesis', 25, 2, 'free', E'Genesis 25:2 — *And she bare him Zimran, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah.* Jubilees 19:11 lists the identical six sons of Keturah, Zimram through Shuah.'),
  -- thread: jubilees-19-jacob-esau-born
  ('jubilees', 'jubilees', 19, 13, 'canon', 'genesis', 25, 27, 'free', E'Genesis 25:27 — *And the boys grew: and Esau was a cunning hunter, a man of the field; and Jacob was a plain man, dwelling in tents.* Jubilees 19:13 draws the same two natures — Jacob smooth and dwelling in tents, Esau a fierce man of the field.'),
  ('jubilees', 'jubilees', 19, 13, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The two sons of Jubilees 19:13 are the two nations divided from the womb.'),
  ('jubilees', 'jubilees', 19, 14, 'canon', 'genesis', 25, 28, 'free', E'Genesis 25:28 — *And Isaac loved Esau, because he did eat of his venison: but Rebekah loved Jacob.* Jubilees 19:14 carries the same divided love — Abraham loved Jacob, Isaac loved Esau.'),
  -- thread: jubilees-19-jacob-chosen-seed
  ('jubilees', 'jubilees', 19, 17, 'canon', 'romans', 9, 11, 'free', E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Paul grounds election in this very Rebekah-womb that Jubilees 19:16-17 describes — Jacob chosen for a people of possession.'),
  ('jubilees', 'jubilees', 19, 16, 'canon', 'romans', 9, 13, 'free', E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* Jubilees 19:16 says it in narrative: in Jacob the name and seed would be called, not in Esau.'),
  ('jubilees', 'jubilees', 19, 16, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* The prophet keeps the choice Abraham foresees in Jubilees 19:16 — Jacob over Esau.'),
  ('jubilees', 'jubilees', 19, 19, 'canon', 'genesis', 13, 16, 'free', E'Genesis 13:16 — *And I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered.* Abraham''s blessing on Jacob in Jubilees 19:19 — seed numberless as the sand — is the very promise spoken to Abraham himself.'),
  -- thread: jubilees-19-mastema-firstborn-son
  ('jubilees', 'jubilees', 19, 29, 'canon', 'exodus', 4, 22, 'free', E'Exodus 4:22 — *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn:* Abraham''s blessing in Jubilees 19:29 — Yahuah a father, Jacob the first-born son — is the very sonship Yahuah claims over Israel at the Exodus.'),
  ('jubilees', 'jubilees', 19, 28, 'jubilees', 'jubilees', 18, 12, 'extras', E'Jubilees 18:12 — *And the prince of the Mastêmâ was put to shame; and Abraham lifted up his eyes and looked, and, behold, a single ram caught … by his horns.* The Mastema who shall not rule over Jacob''s seed in 19:28 is the same accuser shamed at the altar one chapter back.'),
  ('jubilees', 'jubilees', 19, 28, 'canon', 'romans', 9, 4, 'free', E'Romans 9:4 — *Who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises;* The fatherhood and firstborn-sonship Abraham blesses onto Jacob in Jubilees 19:29 is the adoption Paul says still pertains to Israel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-19-sarah-machpelah',
       E'Sarah dies at Hebron; the cave of Machpelah bought in full',
       E'Jubilees retells Genesis 23 nearly clause for clause: *And in the first year of the third week of this jubilee the days of the life of Sarah were accomplished, and she died in Hebron* (Jubilees 19:2), and Abraham goes *to mourn over her and bury her* (Jubilees 19:3). Genesis names the same place — *And Sarah died in Kirjath-arba; the same is Hebron in the land of Canaan: and Abraham came to mourn for Sarah, and to weep for her* (Genesis 23:2). Jubilees keeps the exact accounting of her years (one hundred and twenty-seven) and the exact price, *for four hundred pieces of silver* (Jubilees 19:5), matching *the land is worth four hundred shekels of silver* (Genesis 23:15). And Abraham refuses the gift and pays in full — *he would not take it from their hands for nothing, for he gave the price of the place, the money in full* (Jubilees 19:6) — exactly as Genesis records the deed *made sure unto Abraham for a possession of a buryingplace by the sons of Heth* (Genesis 23:20). It ain''t new: the patriarch''s title to the land of promise was bought, weighed, and witnessed.',
       sv.verse_id, ev.verse_id, 'extras', 53450
  FROM _session251_ju19_lookup sv, _session251_ju19_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=19 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-19-tenth-trial-friend-of-god',
       E'The tenth trial — Abraham found faithful, the friend of Elohim',
       E'Jubilees frames Sarah''s burial as a test: *And Abraham went to mourn over her and bury her, and we tried him to see if his spirit were patient... and he was found patient in this, and was not disturbed* (Jubilees 19:3). It calls it plainly — *This is the tenth trial wherewith Abraham was tried, and he was found faithful, patient in spirit* (Jubilees 19:8) — and records the verdict on the tablets: *he was found faithful, and was recorded on the heavenly tables as the friend of Elohim (God)* (Jubilees 19:9). This is the same Abraham whose great trial Jubilees told one chapter back, when *the prince of the Mastêmâ was put to shame* at the binding of Isaac (Jubilees 18:12). The canon ratifies both the works and the title: *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* (James 2:21), and the very phrase Jubilees engraves — *the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God)* (James 2:23). The prophets keep the name: *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend* (Isaiah 41:8). Faith and works are one cloth, and the heavenly tablets already carry the verdict.',
       sv.verse_id, ev.verse_id, 'extras', 53453
  FROM _session251_ju19_lookup sv, _session251_ju19_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=3
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=19 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-19-rebekah-keturah-line',
       E'Rebekah taken for Isaac; Keturah and the sons sent east',
       E'Jubilees compresses two Genesis chapters into a line: *And in the fourth year thereof he took a wife for his son Isaac and her name was Rebecca the daughter of Bethuel, the son of Nahor, the brother of Abraham* (Jubilees 19:10). Genesis tells it in full — the servant sworn by oath, the well, the answered prayer — and names her the same way: *behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham''s brother* (Genesis 24:15), and ends *And Isaac brought her into his mother Sarah''s tent, and took Rebekah, and she became his wife; and he loved her* (Genesis 24:67). Then Jubilees gathers Abraham''s last household: *And Abraham took to himself a third wife, and her name was Keturah... And she bare him six sons, Zimram, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah* (Jubilees 19:11) — the very roster of *Then again Abraham took a wife, and her name was Keturah. And she bare him Zimran, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah* (Genesis 25:1-2). The promised line narrows to Isaac; the rest are sent away. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53456
  FROM _session251_ju19_lookup sv, _session251_ju19_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=19 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-19-jacob-esau-born',
       E'Jacob and Esau born — the smooth man and the man of the field',
       E'Jubilees retells the birth of the twins and their two natures: *Rebecca bare to Isaac two sons, Jacob and Esau, and Jacob was a smooth and upright man, and Esau was fierce, a man of the field, and hairy, and Jacob dwelt in tents* (Jubilees 19:13). Genesis frames them the same way — *And the boys grew: and Esau was a cunning hunter, a man of the field; and Jacob was a plain man, dwelling in tents* (Genesis 25:27). And it sets the divided love that drives the whole patriarchal struggle: *And Abraham loved Jacob, but Isaac loved Esau* (Jubilees 19:14), echoing *And Isaac loved Esau, because he did eat of his venison: but Rebekah loved Jacob* (Genesis 25:28). Even before they were born the oracle had divided them — *Two nations are in thy womb... and the elder shall serve the younger* (Genesis 25:23). The election is set in the cradle.',
       sv.verse_id, ev.verse_id, 'extras', 53459
  FROM _session251_ju19_lookup sv, _session251_ju19_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=19 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-19-jacob-chosen-seed',
       E'Jacob chosen — the seed numberless, the blessing of the fathers',
       E'Abraham, seeing the deeds of Esau, knows where the line runs: *he knew that in Jacob should his name and seed be called* (Jubilees 19:16), and charges Rebekah, *For I know that Yahuah (God) will choose him to be a people for possession to Himself, above all peoples that are upon the face of the earth* (Jubilees 19:17). Paul reads the same election back into this very womb: *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;) It was said unto her, The elder shall serve the younger* (Romans 9:11-12), sealing it — *Jacob have I loved, but Esau have I hated* (Romans 9:13), the word the prophet keeps: *yet I loved Jacob, And I hated Esau* (Malachi 1:2-3). Abraham''s promise to Jacob — *His seed will fill the whole earth. If a man can number the sand of the earth, His seed also will be numbered* (Jubilees 19:19) — is the old covenant word spoken to Abraham himself: *I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16). And the name is blessed through Shem, Noah, Enoch, back to Adam (Jubilees 19:24) — the seed kept, the election running through the chosen line. This is the framework''s seed-kept-separate, election before confession; the same election Jubilees presses into law against intermarriage in ch20 and ch22. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53462
  FROM _session251_ju19_lookup sv, _session251_ju19_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=19 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-19-mastema-firstborn-son',
       E'Mastema shall not rule; Jacob the firstborn son to Yahuah',
       E'Abraham''s blessing over Jacob turns the satan back: *And the spirits of Mastêmâ shall not rule over you or over your seed to turn you from Yahuah (God), who is your Elohim (God) from henceforth for ever* (Jubilees 19:28) — the same Mastema Jubilees 18 showed *put to shame* at the binding of Isaac (Jubilees 18:12), the accuser who provokes but cannot prevail over the kept seed. Then the patriarch names the relationship that the whole framework rests on: *And may Yahuah Elohim (the LORD God) be a father to you and you the first-born son, and to the people alway* (Jubilees 19:29). That sonship-firstborn word is exactly how Yahuah names Israel before Pharaoh: *Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22). Election is adoption — Yahuah a father, Israel the firstborn son. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53465
  FROM _session251_ju19_lookup sv, _session251_ju19_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=28
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=19 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-19-sarah-machpelah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 23:1 — *And Sarah was an hundred and seven and twenty years old: these were the years of the life of Sarah.* Jubilees 19:6 keeps the same count to the year — one hundred and twenty-seven years of Sarah''s life.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-sarah-machpelah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 23:2 — *And Sarah died in Kirjath-arba; the same is Hebron in the land of Canaan: and Abraham came to mourn for Sarah, and to weep for her.* This is the source Jubilees 19:2 is retelling — Sarah dies in Hebron and Abraham comes to mourn her.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-sarah-machpelah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 23:15 — *My lord, hearken unto me: the land is worth four hundred shekels of silver; what is that betwixt me and thee? bury therefore thy dead.* Jubilees 19:5 names the identical price — four hundred pieces of silver for the cave at Hebron.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-sarah-machpelah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 23:20 — *And the field, and the cave that is therein, were made sure unto Abraham for a possession of a buryingplace by the sons of Heth.* Jubilees 19:6 makes the same point: Abraham would take nothing for nothing but paid in full and bought the double cave outright.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-sarah-machpelah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-19-tenth-trial-friend-of-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* Jubilees 19:8 calls the patient burial of Sarah the tenth trial in which Abraham was found faithful — faith proven by deed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-tenth-trial-friend-of-god'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* Jubilees 19:9 records the very same title on the heavenly tables — Abraham the friend of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-tenth-trial-friend-of-god'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The prophet keeps the name Jubilees 19:9 inscribes: Abraham the friend, his seed chosen.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-tenth-trial-friend-of-god'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 18:12 — *And the prince of the Mastêmâ was put to shame; and Abraham lifted up his eyes and looked, and, behold, a single ram caught … by his horns.* The tenth trial of 19:8 stands in line with the Akedah of the chapter before — Abraham tested and found faithful, the satan shamed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-tenth-trial-friend-of-god'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-19-rebekah-keturah-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:15 — *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham''s brother, with her pitcher upon her shoulder.* Jubilees 19:9 names her by the same lineage — Rebecca daughter of Bethuel, son of Nahor, brother of Abraham.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-rebekah-keturah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:67 — *And Isaac brought her into his mother Sarah''s tent, and took Rebekah, and she became his wife; and he loved her: and Isaac was comforted after his mother''s death.* This is the marriage Jubilees 19:9 records — Abraham takes a wife for his son Isaac.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-rebekah-keturah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=67
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 25:1 — *Then again Abraham took a wife, and her name was Keturah.* Jubilees 19:11 matches: Abraham takes a third wife Keturah after Hagar had died before Sarah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-rebekah-keturah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 25:2 — *And she bare him Zimran, and Jokshan, and Medan, and Midian, and Ishbak, and Shuah.* Jubilees 19:11 lists the identical six sons of Keturah, Zimram through Shuah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-rebekah-keturah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-19-jacob-esau-born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:27 — *And the boys grew: and Esau was a cunning hunter, a man of the field; and Jacob was a plain man, dwelling in tents.* Jubilees 19:13 draws the same two natures — Jacob smooth and dwelling in tents, Esau a fierce man of the field.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-jacob-esau-born'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The two sons of Jubilees 19:13 are the two nations divided from the womb.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-jacob-esau-born'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 25:28 — *And Isaac loved Esau, because he did eat of his venison: but Rebekah loved Jacob.* Jubilees 19:14 carries the same divided love — Abraham loved Jacob, Isaac loved Esau.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-jacob-esau-born'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-19-jacob-chosen-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* Paul grounds election in this very Rebekah-womb that Jubilees 19:16-17 describes — Jacob chosen for a people of possession.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-jacob-chosen-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* Jubilees 19:16 says it in narrative: in Jacob the name and seed would be called, not in Esau.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-jacob-chosen-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob,* The prophet keeps the choice Abraham foresees in Jubilees 19:16 — Jacob over Esau.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-jacob-chosen-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 13:16 — *And I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered.* Abraham''s blessing on Jacob in Jubilees 19:19 — seed numberless as the sand — is the very promise spoken to Abraham himself.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-jacob-chosen-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-19-mastema-firstborn-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:22 — *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn:* Abraham''s blessing in Jubilees 19:29 — Yahuah a father, Jacob the first-born son — is the very sonship Yahuah claims over Israel at the Exodus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-mastema-firstborn-son'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 18:12 — *And the prince of the Mastêmâ was put to shame; and Abraham lifted up his eyes and looked, and, behold, a single ram caught … by his horns.* The Mastema who shall not rule over Jacob''s seed in 19:28 is the same accuser shamed at the altar one chapter back.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-mastema-firstborn-son'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=28
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:4 — *Who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises;* The fatherhood and firstborn-sonship Abraham blesses onto Jacob in Jubilees 19:29 is the adoption Paul says still pertains to Israel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju19_lookup sv, _session251_ju19_lookup tv
 WHERE t.slug='jubilees-19-mastema-firstborn-son'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=19 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

