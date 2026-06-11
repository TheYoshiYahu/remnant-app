-- ----- fragment: minion_jasher_43.sql (session252 jasher 43) -----
-- Source anchor: jasher/jasher ch43. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja43 (view _session252_ja43_lookup). Sort band base 56050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja43_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-43-reuben-empty-pit
  ('jasher', 'jasher', 43, 2, 'canon', 'genesis', 37, 29, 'free', E'Genesis 37:29 — *And Reuben returned unto the pit; and, behold, Joseph was not in the pit; and he rent his clothes.* Jasher 43:2 dramatizes the same return to the pit and the same dread silence the canon reports in one line.'),
  ('jasher', 'jasher', 43, 4, 'canon', 'genesis', 37, 22, 'free', E'Genesis 37:22 — *And Reuben said unto them, Shed no blood, but cast him into this pit that is in the wilderness, and lay no hand upon him; that he might rid him out of their hands, to deliver him to his father again.* Jasher 43:4 carries Reuben''s hidden intent to restore Joseph to his father, the very plan Genesis records.'),
  ('jasher', 'jasher', 43, 4, 'canon', 'genesis', 42, 22, 'free', E'Genesis 42:22 — *And Reuben answered them, saying, Spake I not unto you, saying, Do not sin against the child; and ye would not hear? therefore, behold, also his blood is required.* Reuben''s distress at the empty pit in Jasher 43:4 ripens into the reproach he speaks years later in Egypt.'),
  -- thread: jasher-43-bloodied-coat-kid
  ('jasher', 'jasher', 43, 13, 'canon', 'genesis', 37, 31, 'free', E'Genesis 37:31 — *And they took Joseph''s coat, and killed a kid of the goats, and dipped the coat in the blood.* Jasher 43:13 expands the identical act — the torn coat, the slain kid, the dipped blood.'),
  ('jasher', 'jasher', 43, 13, 'jubilees', 'jubilees', 34, 11, 'extras', E'Jubilees 34:11 — *And they dealt treacherously with him, and formed a plot against him to slay him, but changing their minds, they sold him to Ishmaelite merchants, and they brought him down into Egypt, and they sold him to Potiphar, the eunuch of Pharaoh, the chief of the cooks, priest of the city of ''Êlêw. And the sons of Jacob slaughtered a kid, and dipped the coat of Joseph in the blood, and sent (it) to Jacob their father on the tenth of the seventh month.* The live Jubilees apparatus narrates the same kid-and-coat deceit as Jasher 43:13.'),
  ('jasher', 'jasher', 43, 13, 'jubilees', 'jubilees', 34, 18, 'extras', E'Jubilees 34:18 — *For this reason it is ordained for the children of Yashar''el (Israel) that they should afflict themselves on the tenth of the seventh month–on the day that the news which made him weep for Joseph came to Jacob his father–that they should make atonement for themselves thereon with a young goat on the tenth of the seventh month, once a year, for their sins; for they had grieved the affection of their father regarding Joseph his son.* Jubilees binds the kid''s blood of Jasher 43:13 to the Day of Atonement — Torah and the appointed times stand, it ain''t new.'),
  -- thread: jasher-43-jacob-mourning
  ('jasher', 'jasher', 43, 20, 'canon', 'genesis', 37, 33, 'free', E'Genesis 37:33 — *And he knew it, and said, It is my son''s coat; an evil beast hath devoured him; Joseph is without doubt rent in pieces.* Jacob''s cry in Jasher 43:20 is the canon''s own verdict over the bloodied coat.'),
  ('jasher', 'jasher', 43, 22, 'canon', 'genesis', 37, 34, 'free', E'Genesis 37:34 — *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days.* Jasher 43:22 expands the torn garments and the sackcloth-girded loins exactly.'),
  ('jasher', 'jasher', 43, 34, 'canon', 'genesis', 37, 35, 'free', E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* Jasher 43:34 shows the household rising round Jacob while he refuses comfort, the canon''s same scene.'),
  ('jasher', 'jasher', 43, 20, 'jubilees', 'jubilees', 34, 13, 'extras', E'Jubilees 34:13 — *And he mourned all that night, for they had brought it to him in the evening, and he became feverish with mourning for his death, and he said: "An evil beast has devoured Joseph"; and all the members of his house mourned with him that day, and they were grieving and mourning with him all that day.* The live Jubilees layer keeps the identical "evil beast" cry of Jasher 43:20.'),
  ('jasher', 'jasher', 43, 34, 'jubilees', 'jubilees', 34, 14, 'extras', E'Jubilees 34:14 — *And his sons and his daughter rose up to comfort him, but he refused to be comforted for his son.* Jubilees mirrors the refused comfort of Jasher 43:34.'),
  -- thread: jasher-43-judah-lifts-father
  ('jasher', 'jasher', 43, 32, 'canon', 'genesis', 49, 8, 'free', E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee.* Jasher 43:32 lifts up Yahudah to bear the father''s head — the brother the blessing will exalt.'),
  ('jasher', 'jasher', 43, 32, 'canon', 'genesis', 49, 10, 'free', E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Shiloh-Messianic sceptre rests on the very Yahudah who comforts his father in Jasher 43:32.'),
  ('jasher', 'jasher', 43, 32, 'canon', 'hebrews', 11, 21, 'free', E'Hebrews 11:21 — *By faith Jacob, when he was a dying, blessed both the sons of Joseph; and worshipped, leaning upon the top of his staff.* The father whose head Yahudah lifts in Jasher 43:32 will yet bless the seed in faith.'),
  -- thread: jasher-43-joseph-persecuted-righteous
  ('jasher', 'jasher', 43, 42, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen names the envy behind the crime Jasher 43:42 grieves — Joseph the innocent kept by Elohim.'),
  ('jasher', 'jasher', 43, 42, 'canon', 'genesis', 45, 5, 'free', E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* The persecuted son of Jasher 43:42 becomes the deliverer who reads the crime as Elohim''s sending.'),
  ('jasher', 'jasher', 43, 42, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The innocent blood required in Jasher 43:42 is the evil Elohim turns to good to save much people alive.'),
  ('jasher', 'jasher', 43, 42, 'canon', 'romans', 8, 28, 'free', E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* The persecuted-righteous pattern of Jasher 43:42 is the gospel''s own promise of all things working for good.'),
  -- thread: jasher-43-mourning-many-days-visitation
  ('jasher', 'jasher', 43, 48, 'canon', 'genesis', 50, 24, 'free', E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* The son mourned as lost in Jasher 43:48 will live to pledge the visitation and the sworn inheritance.'),
  ('jasher', 'jasher', 43, 48, 'canon', 'hebrews', 11, 22, 'free', E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The long mourning of Jasher 43:48 gives way to Joseph''s faith in the coming departure of Yashar''el.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja43_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja43_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-43-reuben-empty-pit',
       E'Reuben returns to the empty pit',
       E'*And Reuben returned to the pit in which Joseph had been put, in order to lift him out, and restore him to his father, and Reuben stood by the pit, and he heard not a word, and he called out Joseph! Joseph! and no one answered or uttered a word* (Jasher 43:2). It ain''t new — Jasher only unfolds what Genesis states in a single breath: *And Reuben returned unto the pit; and, behold, Joseph was not in the pit; and he rent his clothes* (Genesis 37:29). Reuben''s purpose is the canon''s own: he had schemed to spare the lad, *And Reuben said unto them, Shed no blood, but cast him into this pit that is in the wilderness, and lay no hand upon him; that he might rid him out of their hands, to deliver him to his father again* (Genesis 37:22). And the empty pit haunts him to the end, for years later in Egypt he cries, *And Reuben answered them, saying, Spake I not unto you, saying, Do not sin against the child; and ye would not hear? therefore, behold, also his blood is required* (Genesis 42:22).',
       sv.verse_id, ev.verse_id, 'extras', 56050
  FROM _session252_ja43_lookup sv, _session252_ja43_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=43 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-43-bloodied-coat-kid',
       E'The kid of the goats and the bloodied coat',
       E'*And Issachar said to them, Here is an advice for you if it seem good in your eyes to do this thing, take the coat which belongs to Joseph and tear it, and kill a kid of the goats and dip it in its blood* (Jasher 43:10). The brothers do it: *And they hastened and took Joseph''s coat and tore it, and they killed a kid of the goats and dipped the coat in the blood of the kid, and then trampled it in the dust* (Jasher 43:13). This is Genesis word for word: *And they took Joseph''s coat, and killed a kid of the goats, and dipped the coat in the blood* (Genesis 37:31). The Jubilees apparatus tells the very same scene and even dates it: *And the sons of Jacob slaughtered a kid, and dipped the coat of Joseph in the blood, and sent (it) to Jacob their father on the tenth of the seventh month* (Jubilees 34:11) — and Jubilees binds that tenth day to a standing ordinance: *For this reason it is ordained for the children of Yashar''el (Israel) that they should afflict themselves on the tenth of the seventh month* (Jubilees 34:18). The deceit with the kid''s blood becomes the day of atonement — Torah and the feasts stand, not new.',
       sv.verse_id, ev.verse_id, 'extras', 56053
  FROM _session252_ja43_lookup sv, _session252_ja43_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=43 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-43-jacob-mourning',
       E'Jacob mourns; an evil beast has devoured him',
       E'*And Jacob heard the words of his sons and he cried out with a loud voice, and he said, It is the coat of my son, an evil beast has devoured him; Joseph is rent in pieces* (Jasher 43:20). The canon gives the same cry: *And he knew it, and said, It is my son''s coat; an evil beast hath devoured him; Joseph is without doubt rent in pieces* (Genesis 37:33). The grieving father''s acts are the canon''s acts: *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days* (Genesis 37:34); and *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him* (Genesis 37:35). Jubilees keeps the very words — *and he said: "An evil beast has devoured Joseph"* (Jubilees 34:13) — and the same refusal — *And his sons and his daughter rose up to comfort him, but he refused to be comforted for his son* (Jubilees 34:14). Three witnesses, one grief; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56056
  FROM _session252_ja43_lookup sv, _session252_ja43_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=43 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-43-judah-lifts-father',
       E'Judah lifts the father''s head — the sceptre line',
       E'*And Judah rose up and lifted his father''s head from the ground, and placed it upon his lap, and he wiped his father''s tears from his cheeks, and Judah wept an exceeding great weeping, whilst his father''s head was reclining upon his lap, still as a stone* (Jasher 43:32). Jasher singles out Yahudah to bear up the stricken father — the seed-line the canon will crown: *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee* (Genesis 49:8), and *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). That dying father will yet bless the sons by faith — *By faith Jacob, when he was a dying, blessed both the sons of Joseph; and worshipped, leaning upon the top of his staff* (Hebrews 11:21). The Shiloh-Messianic line is honored even in the house of mourning.',
       sv.verse_id, ev.verse_id, 'extras', 56059
  FROM _session252_ja43_lookup sv, _session252_ja43_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=32
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=43 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-43-joseph-persecuted-righteous',
       E'The persecuted righteous one — God meant it for good',
       E'*And you did devour my son for naught, because he committed no violence, and did thereby render me culpable on his account, therefore Elohim will require him that is persecuted* (Jasher 43:42). Jacob names Joseph what he is — the innocent persecuted one, blood required at the persecutor''s hand. The NT reads this scene as Messianic: *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* (Acts 7:9). And Joseph himself will turn the crime to deliverance — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life* (Genesis 45:5); *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). The whole pattern is the gospel''s promise: *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28). The one cast into the pit, rejected by his brethren, is the righteous one exalted to save many — a Messiah type, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 56062
  FROM _session252_ja43_lookup sv, _session252_ja43_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=42
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=43 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-43-mourning-many-days-visitation',
       E'He mourned many days — toward the promised visitation',
       E'*And Jacob was still crying aloud and weeping for Joseph day after day, and he mourned for his son many days* (Jasher 43:48). The mourning seems endless, yet the same Joseph who is wept as dead will live to speak the covenant''s forward promise from his own deathbed: *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob* (Genesis 50:24). Hebrews counts that faith: *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22). The grief of Jasher 43:48 is not the end of the line — the visitation and the inheritance are sworn, election kept.',
       sv.verse_id, ev.verse_id, 'extras', 56065
  FROM _session252_ja43_lookup sv, _session252_ja43_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=48
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=43 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-43-reuben-empty-pit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:29 — *And Reuben returned unto the pit; and, behold, Joseph was not in the pit; and he rent his clothes.* Jasher 43:2 dramatizes the same return to the pit and the same dread silence the canon reports in one line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-reuben-empty-pit'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:22 — *And Reuben said unto them, Shed no blood, but cast him into this pit that is in the wilderness, and lay no hand upon him; that he might rid him out of their hands, to deliver him to his father again.* Jasher 43:4 carries Reuben''s hidden intent to restore Joseph to his father, the very plan Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-reuben-empty-pit'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 42:22 — *And Reuben answered them, saying, Spake I not unto you, saying, Do not sin against the child; and ye would not hear? therefore, behold, also his blood is required.* Reuben''s distress at the empty pit in Jasher 43:4 ripens into the reproach he speaks years later in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-reuben-empty-pit'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=42 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-43-bloodied-coat-kid
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:31 — *And they took Joseph''s coat, and killed a kid of the goats, and dipped the coat in the blood.* Jasher 43:13 expands the identical act — the torn coat, the slain kid, the dipped blood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-bloodied-coat-kid'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 34:11 — *And they dealt treacherously with him, and formed a plot against him to slay him, but changing their minds, they sold him to Ishmaelite merchants, and they brought him down into Egypt, and they sold him to Potiphar, the eunuch of Pharaoh, the chief of the cooks, priest of the city of ''Êlêw. And the sons of Jacob slaughtered a kid, and dipped the coat of Joseph in the blood, and sent (it) to Jacob their father on the tenth of the seventh month.* The live Jubilees apparatus narrates the same kid-and-coat deceit as Jasher 43:13.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-bloodied-coat-kid'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 34:18 — *For this reason it is ordained for the children of Yashar''el (Israel) that they should afflict themselves on the tenth of the seventh month–on the day that the news which made him weep for Joseph came to Jacob his father–that they should make atonement for themselves thereon with a young goat on the tenth of the seventh month, once a year, for their sins; for they had grieved the affection of their father regarding Joseph his son.* Jubilees binds the kid''s blood of Jasher 43:13 to the Day of Atonement — Torah and the appointed times stand, it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-bloodied-coat-kid'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-43-jacob-mourning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:33 — *And he knew it, and said, It is my son''s coat; an evil beast hath devoured him; Joseph is without doubt rent in pieces.* Jacob''s cry in Jasher 43:20 is the canon''s own verdict over the bloodied coat.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-jacob-mourning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:34 — *And Jacob rent his clothes, and put sackcloth upon his loins, and mourned for his son many days.* Jasher 43:22 expands the torn garments and the sackcloth-girded loins exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-jacob-mourning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* Jasher 43:34 shows the household rising round Jacob while he refuses comfort, the canon''s same scene.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-jacob-mourning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 34:13 — *And he mourned all that night, for they had brought it to him in the evening, and he became feverish with mourning for his death, and he said: "An evil beast has devoured Joseph"; and all the members of his house mourned with him that day, and they were grieving and mourning with him all that day.* The live Jubilees layer keeps the identical "evil beast" cry of Jasher 43:20.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-jacob-mourning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 34:14 — *And his sons and his daughter rose up to comfort him, but he refused to be comforted for his son.* Jubilees mirrors the refused comfort of Jasher 43:34.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-jacob-mourning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=34
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-43-judah-lifts-father
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee.* Jasher 43:32 lifts up Yahudah to bear the father''s head — the brother the blessing will exalt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-judah-lifts-father'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Shiloh-Messianic sceptre rests on the very Yahudah who comforts his father in Jasher 43:32.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-judah-lifts-father'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:21 — *By faith Jacob, when he was a dying, blessed both the sons of Joseph; and worshipped, leaning upon the top of his staff.* The father whose head Yahudah lifts in Jasher 43:32 will yet bless the seed in faith.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-judah-lifts-father'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-43-joseph-persecuted-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen names the envy behind the crime Jasher 43:42 grieves — Joseph the innocent kept by Elohim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-joseph-persecuted-righteous'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 45:5 — *Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* The persecuted son of Jasher 43:42 becomes the deliverer who reads the crime as Elohim''s sending.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-joseph-persecuted-righteous'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The innocent blood required in Jasher 43:42 is the evil Elohim turns to good to save much people alive.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-joseph-persecuted-righteous'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* The persecuted-righteous pattern of Jasher 43:42 is the gospel''s own promise of all things working for good.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-joseph-persecuted-righteous'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-43-mourning-many-days-visitation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:24 — *And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* The son mourned as lost in Jasher 43:48 will live to pledge the visitation and the sworn inheritance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-mourning-many-days-visitation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:22 — *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones.* The long mourning of Jasher 43:48 gives way to Joseph''s faith in the coming departure of Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session252_ja43_lookup sv, _session252_ja43_lookup tv
 WHERE t.slug='jasher-43-mourning-many-days-visitation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=43 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

