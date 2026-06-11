-- ----- fragment: minion_jasher_22.sql (session252 jasher 22) -----
-- Source anchor: jasher/jasher ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja22 (view _session252_ja22_lookup). Sort band base 55525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-22-beersheba-covenant
  ('jasher', 'jasher', 22, 6, 'canon', 'genesis', 21, 22, 'free', E'Genesis 21:22 — *And it came to pass at that time, that Abimelech and Phichol the chief captain of his host spake unto Abraham, saying, Elohim (God) is with thee in all that thou doest:* The same Abimelech and Phicol that Jasher names come to Abraham in the canon scene.'),
  ('jasher', 'jasher', 22, 8, 'canon', 'genesis', 21, 30, 'free', E'Genesis 21:30 — *And he said, For these seven ewe lambs shalt thou take of my hand, that they may be a witness unto me, that I have digged this well.* Jasher''s seven ewe lambs given as a testimony for the well is Genesis word for word.'),
  ('jasher', 'jasher', 22, 9, 'canon', 'genesis', 21, 31, 'free', E'Genesis 21:31 — *Wherefore he called that place Beer-sheba; because there they sware both of them.* Both texts name Beersheba from the oath sworn there over the well.'),
  ('jasher', 'jasher', 22, 9, 'jubilees', 'jubilees', 16, 11, 'extras', E'Jubilees 16:11 — *And in the middle of the fifth month he moved from thence, and dwelt at the Well of the Oath.* The same patriarchal event in the live Jubilees apparatus keeps Beersheba as the Well of the Oath.'),
  -- thread: jasher-22-open-house-the-name
  ('jasher', 'jasher', 22, 11, 'canon', 'genesis', 21, 33, 'free', E'Genesis 21:33 — *And Abraham planted a grove in Beer-sheba, and called there on the name of Yahuah (LORD), El Olam (the everlasting God).* Jasher''s large grove with four gates at Beersheba is the canon''s grove where Abraham called on the Name.'),
  ('jasher', 'jasher', 22, 13, 'canon', 'genesis', 18, 18, 'free', E'Genesis 18:18 — *Seeing that Abraham shall surely become a great and mighty nation, and all the nations of the earth shall be blessed in him?* The father who made the Name known to all the children of the earth is the one through whom all nations are blessed.'),
  -- thread: jasher-22-nahor-twelve-rebecca
  ('jasher', 'jasher', 22, 16, 'canon', 'genesis', 11, 29, 'free', E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram’s wife was Sarai; and the name of Nahor’s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* Jasher''s Milca daughter of Haran bearing Nahor''s sons is the canon''s Milcah, Nahor''s wife.'),
  ('jasher', 'jasher', 22, 26, 'canon', 'genesis', 24, 15, 'free', E'Genesis 24:15 — *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham’s brother, with her pitcher upon her shoulder.* Jasher''s Rebecca daughter of Bethuel is the very bride the canon brings for Isaac, keeping the seed-line.'),
  -- thread: jasher-22-isaac-the-way-the-boast
  ('jasher', 'jasher', 22, 44, 'canon', 'genesis', 22, 2, 'free', E'Genesis 22:2 — *And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of.* Isaac''s vow in Jasher quotes the very offering the canon commands at the Akedah.'),
  ('jasher', 'jasher', 22, 44, 'canon', 'james', 2, 21, 'free', E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* Isaac''s willingness in Jasher foreshadows the offering by which faith was made perfect in works.'),
  ('jasher', 'jasher', 22, 44, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* The trial Jasher sets up is the faith-test the apostle names: the only-begotten seed offered up.'),
  -- thread: jasher-22-satan-before-yahuah
  ('jasher', 'jasher', 22, 46, 'canon', 'job', 1, 6, 'free', E'Job 1:6 — *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them.* Jasher''s court of the sons of Elohim with Satan among them is Job''s heavenly scene retold.'),
  ('jasher', 'jasher', 22, 47, 'canon', 'job', 1, 7, 'free', E'Job 1:7 — *And Yahuah (LORD) said unto Satan, Whence comest thou? Then Satan answered Yahuah (LORD), and said, From going to and fro in the earth, and from walking up and down in it.* The exchange in Jasher is Job 1:7 almost word for word.'),
  ('jasher', 'jasher', 22, 54, 'canon', 'job', 1, 8, 'free', E'Job 1:8 — *And Yahuah (LORD) said unto Satan, Hast thou considered my servant Job, that there is none like him in the earth, a perfect and an upright man, one that feareth Elohim (God), and escheweth evil?* Yahuah''s praise of Abraham as a perfect and upright man none like him echoes the verdict on Job.'),
  ('jasher', 'jasher', 22, 45, 'jubilees', 'jubilees', 17, 17, 'extras', E'Jubilees 17:17 — *And Yahuah (God) knew that Abraham was faithful in all his afflictions; for He had tried him through his country and with famine, and had tried him with the wealth of kings, and had tried him again through his wife, when she was torn (from him), and with circumcision, and had tried him through Ishmael and Hagar, his maid-servant, when he sent them away.* The live Jubilees apparatus tells the same prepared test of Abraham, naming the adversary Prince Mastema.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-22-beersheba-covenant',
       E'The well and the oath at Beersheba',
       E'Jasher tells how the strife over the wells ended in a sworn covenant: *And Abimelech took the seven ewe lambs which Abraham had given to him, for he had also given him cattle and herds in abundance, and Abimelech swore to Abraham concerning the well, therefore he called that well Beersheba, for there they both swore concerning it* (Jasher 22:9). It is the Genesis scene retold almost word for word — *And he said, For these seven ewe lambs shalt thou take of my hand, that they may be a witness unto me, that I have digged this well* (Genesis 21:30) — *Wherefore he called that place Beer-sheba; because there they sware both of them* (Genesis 21:31). The same names stand: *And it came to pass at that time, that Abimelech and Phichol the chief captain of his host spake unto Abraham, saying, Elohim (God) is with thee in all that thou doest* (Genesis 21:22). It ain''t new: the Jubilees record keeps the same place — *And in the middle of the fifth month he moved from thence, and dwelt at the Well of the Oath* (Jubilees 16:11).',
       sv.verse_id, ev.verse_id, 'extras', 55525
  FROM _session252_ja22_lookup sv, _session252_ja22_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=22 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-22-open-house-the-name',
       E'The open house and the Name proclaimed',
       E'Jasher fills in Abraham''s hospitality: *And any man who had hunger and came to Abraham’s house, Abraham would give him bread that he might eat and drink and be satisfied, and any one that came naked to his house he would clothe with garments as he might choose, and give him silver and gold and make known to him Yahuah (the Lord) who had created him in the earth; this did Abraham all his life* (Jasher 22:13). This is Torah-before-Sinai, the chosen father teaching the way and calling on the Name — the very grove Genesis records: *And Abraham planted a grove in Beer-sheba, and called there on the name of Yahuah (LORD), El Olam (the everlasting God)* (Genesis 21:33). It is why Yahuah chose him, said the canon: *Seeing that Abraham shall surely become a great and mighty nation, and all the nations of the earth shall be blessed in him?* (Genesis 18:18). The blessing of the nations runs through this open-gated house.',
       sv.verse_id, ev.verse_id, 'extras', 55528
  FROM _session252_ja22_lookup sv, _session252_ja22_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=22 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-22-nahor-twelve-rebecca',
       E'Nahor''s twelve sons and the seed of Rebecca',
       E'Jasher traces the brother-line kept in Haran: *These are the families of the children of Nahor, that were born to them in Haran* (Jasher 22:27), counting *the children that were born to Nahor were twelve sons besides his daughters* (Jasher 22:19) — and naming the daughter that matters most: *And the children of Bethuel were Sechar, Laban and their sister Rebecca* (Jasher 22:26). The canon already set Milcah and Bethuel in place: *And Abram and Nahor took them wives: the name of Abram’s wife was Sarai; and the name of Nahor’s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah* (Genesis 11:29). And the bride for the promised seed comes from exactly this line: *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham’s brother, with her pitcher upon her shoulder* (Genesis 24:15). The election is kept generation by generation.',
       sv.verse_id, ev.verse_id, 'extras', 55531
  FROM _session252_ja22_lookup sv, _session252_ja22_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=22 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-22-isaac-the-way-the-boast',
       E'Isaac raised in the way and the answered boast',
       E'Jasher shows the promised seed kept and taught: *And Isaac the son of Abraham was growing up in those days, and Abraham his father taught him the way of Yahuah (the Lord) to know Yahuah (the Lord), and Yahuah (the Lord) was with him* (Jasher 22:40). When Ishmael boasts of his circumcision, Isaac answers with a vow that becomes the Akedah: *As Yahuah (the Lord) lives, the Elohim (God) of my father Abraham, if Yahuah (the Lord) should say to my father, Take now your son Isaac and bring him up an offering before me, I would not refrain but I would joyfully accede to it* (Jasher 22:44). The canon will carry that very command — *And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering* (Genesis 22:2) — and the apostolic word reads it as faith proved by works: *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* (James 2:21). It is the seed of promise, the only-begotten son: *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* (Hebrews 11:17).',
       sv.verse_id, ev.verse_id, 'extras', 55534
  FROM _session252_ja22_lookup sv, _session252_ja22_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=40
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=22 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-22-satan-before-yahuah',
       E'Satan before Yahuah and the test prepared',
       E'Jasher frames the Akedah with a heavenly scene that mirrors Job: *And the day arrived when the sons of Elohim came and placed themselves before Yahuah (the Lord), and Satan also came with the sons of Elohim before Yahuah (the Lord)* (Jasher 22:46) — *And Yahuah (the Lord) said to Satan, Whence come you? and Satan answered Yahuah (the Lord) and said, From going to and fro in the earth, and from walking up and down in it* (Jasher 22:47). Job''s opening is nearly word for word: *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them* (Job 1:6) — *And Yahuah (LORD) said unto Satan, Whence comest thou? Then Satan answered Yahuah (LORD), and said, From going to and fro in the earth, and from walking up and down in it* (Job 1:7). When Yahuah commends His servant — *for there is none like him upon earth, a perfect and an upright man before me* (Jasher 22:54) — the words are Job''s own: *Hast thou considered my servant Job, that there is none like him in the earth, a perfect and an upright man, one that feareth Elohim (God), and escheweth evil?* (Job 1:8). It ain''t new: the live Jubilees apparatus tells the same test under the name of the adversary, Prince Mastema, the trial Abraham was found faithful in — *And Yahuah (God) knew that Abraham was faithful in all his afflictions; for He had tried him through his country and with famine, and had tried him with the wealth of kings, and had tried him again through his wife, when she was torn (from him), and with circumcision, and had tried him through Ishmael and Hagar, his maid-servant, when he sent them away.* (Jubilees 17:17).',
       sv.verse_id, ev.verse_id, 'extras', 55537
  FROM _session252_ja22_lookup sv, _session252_ja22_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=45
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=22 AND ev.verse_number=55
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-22-beersheba-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:22 — *And it came to pass at that time, that Abimelech and Phichol the chief captain of his host spake unto Abraham, saying, Elohim (God) is with thee in all that thou doest:* The same Abimelech and Phicol that Jasher names come to Abraham in the canon scene.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-beersheba-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 21:30 — *And he said, For these seven ewe lambs shalt thou take of my hand, that they may be a witness unto me, that I have digged this well.* Jasher''s seven ewe lambs given as a testimony for the well is Genesis word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-beersheba-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 21:31 — *Wherefore he called that place Beer-sheba; because there they sware both of them.* Both texts name Beersheba from the oath sworn there over the well.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-beersheba-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 16:11 — *And in the middle of the fifth month he moved from thence, and dwelt at the Well of the Oath.* The same patriarchal event in the live Jubilees apparatus keeps Beersheba as the Well of the Oath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-beersheba-covenant'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-22-open-house-the-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:33 — *And Abraham planted a grove in Beer-sheba, and called there on the name of Yahuah (LORD), El Olam (the everlasting God).* Jasher''s large grove with four gates at Beersheba is the canon''s grove where Abraham called on the Name.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-open-house-the-name'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:18 — *Seeing that Abraham shall surely become a great and mighty nation, and all the nations of the earth shall be blessed in him?* The father who made the Name known to all the children of the earth is the one through whom all nations are blessed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-open-house-the-name'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-22-nahor-twelve-rebecca
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram’s wife was Sarai; and the name of Nahor’s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* Jasher''s Milca daughter of Haran bearing Nahor''s sons is the canon''s Milcah, Nahor''s wife.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-nahor-twelve-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:15 — *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham’s brother, with her pitcher upon her shoulder.* Jasher''s Rebecca daughter of Bethuel is the very bride the canon brings for Isaac, keeping the seed-line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-nahor-twelve-rebecca'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-22-isaac-the-way-the-boast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:2 — *And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of.* Isaac''s vow in Jasher quotes the very offering the canon commands at the Akedah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-isaac-the-way-the-boast'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* Isaac''s willingness in Jasher foreshadows the offering by which faith was made perfect in works.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-isaac-the-way-the-boast'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* The trial Jasher sets up is the faith-test the apostle names: the only-begotten seed offered up.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-isaac-the-way-the-boast'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-22-satan-before-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 1:6 — *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them.* Jasher''s court of the sons of Elohim with Satan among them is Job''s heavenly scene retold.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-satan-before-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 1:7 — *And Yahuah (LORD) said unto Satan, Whence comest thou? Then Satan answered Yahuah (LORD), and said, From going to and fro in the earth, and from walking up and down in it.* The exchange in Jasher is Job 1:7 almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-satan-before-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 1:8 — *And Yahuah (LORD) said unto Satan, Hast thou considered my servant Job, that there is none like him in the earth, a perfect and an upright man, one that feareth Elohim (God), and escheweth evil?* Yahuah''s praise of Abraham as a perfect and upright man none like him echoes the verdict on Job.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-satan-before-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 17:17 — *And Yahuah (God) knew that Abraham was faithful in all his afflictions; for He had tried him through his country and with famine, and had tried him with the wealth of kings, and had tried him again through his wife, when she was torn (from him), and with circumcision, and had tried him through Ishmael and Hagar, his maid-servant, when he sent them away.* The live Jubilees apparatus tells the same prepared test of Abraham, naming the adversary Prince Mastema.'
  FROM cross_reference_threads t, cross_references x, _session252_ja22_lookup sv, _session252_ja22_lookup tv
 WHERE t.slug='jasher-22-satan-before-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=22 AND sv.verse_number=45
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

