-- =====================================================================
-- Session 340 — 1 Samuel FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/former-prophets-wt/data-schema/migrations/session340_1samuel_cross_references.sql
-- =====================================================================

\echo 'session340 — 1 Samuel cross-references starting...'
BEGIN;

-- ----- fragment: minion_1-samuel_1.sql (1 Samuel 1) -----
-- Chapter: 1 Samuel 1 — Hannah barren and provoked; her vow at Shiloh; Samuel "asked of Yahuah" and lent back to Him; the no-razor (Nazarite) vow.
-- Tag: 1sa01    Session: s340    Sort band: 36400, step 3 (36400, 36403, 36406)
-- Edition view: _s340_1sa01_lookup
--
-- COVERAGE CHECKLIST (all three libraries weighed per verse-block):
--   v.1-4  (Elkanah, two wives, yearly worship at Shiloh, the priests)
--          NT: none warranted   Extras: none warranted   Tanakh: none warranted (narrative setup)
--   v.5-7  (Yahuah had shut up Hannah's womb; her adversary provoked her)
--          NT:  Luke 1:7 (Elisabeth barren)  Extras: none warranted
--          Tanakh: Gen 21:1-2 / Gen 25:21 / Gen 30:22 / Judges 13:2-3 / Ps 113:9  -> THREAD 1 (barren-womb-opened)
--   v.8    (Elkanah's tender word)  NT/Extras/Tanakh: none warranted
--   v.9-16 (Hannah prays, vows, pours out her soul; Eli's rebuke; daughter of Belial)
--          NT:  Luke 1:13 (thy prayer is heard)  Extras: none warranted
--          Tanakh: Ps 62:8 (pour out your heart) / Ps 113:9  -> THREAD 3 (poured-out-soul / answered prayer)
--          the vow + no-razor -> THREAD 2 (asked-of-Yahuah / dedicated son)
--   v.11   (the vow: give him unto Yahuah all his days; no razor on his head)
--          NT:  Luke 1:15 (John drinks no wine, filled from the womb)
--          Extras: none warranted
--          Tanakh: Num 6:5 (Nazarite no-razor) / Judges 13:5 (Samson Nazarite from womb)  -> THREAD 2
--   v.17-18 (Eli: the Elohim of Yashar'el grant thy petition; Go in peace)  NT: Luke 1:13  -> THREAD 3
--   v.19-20 (Yahuah remembered her; she bare a son, Samuel = asked of Yahuah)
--          NT:  none warranted   Extras: none warranted
--          Tanakh: Gen 30:22-24 (Elohim remembered Rachel, opened her womb)  -> THREAD 1
--   v.21-26 (weaning, bringing the child up to Shiloh)  none warranted (narrative)
--   v.27-28 (For this child I prayed... I have lent him to Yahuah)
--          NT:  Luke 1:13-15 (the asked-for, dedicated child)  -> THREAD 2/3
--          Extras: none warranted   Tanakh: Num 6 (the consecrated son)  -> THREAD 2
--
-- THREADS (3):
--   1-samuel-1-the-barren-womb-opened-by-yahuah-the-seed-of-promise  (free)
--        Tanakh: Genesis, Psalms, Judges + NT: Luke  -> barren-womb-opened pattern; seed given by Yahuah not flesh
--   1-samuel-1-asked-of-yahuah-the-dedicated-son-lent-back           (free)
--        Tanakh: Numbers, Judges + NT: Luke  -> the vow, the no-razor Nazarite son, given/lent back to Yahuah
--   1-samuel-1-poured-out-my-soul-before-yahuah-the-answered-prayer  (free)
--        Tanakh: Psalms + NT: Luke  -> pouring out the soul / trust / the prayer heard and answered
--
-- Contested-verse framing: none of these touch a Torah-abolition flashpoint. The lens carried throughout
-- is that the seed of promise is given BY YAHUAH (he opens / shuts the womb), never secured by flesh —
-- the same paternal-blood-AND-covenant-word pattern from the matriarchs forward, fulfilled when Yahuah
-- visits the barren a final time in Luke 1 to give the forerunner and (through Mary) the Formed Son.

CREATE TEMP VIEW _s340_1sa01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ================= cross_references =================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: the barren womb opened by Yahuah (seed of promise)
  ('canon','1-samuel',1,5,  'canon','genesis',21,1,  'free',
    E'*And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken. For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* (Genesis 21:1-2). When 1 Samuel says *Yahuah (LORD) had shut up her womb*, it names the same hand that visited Sarah — the seed of promise is opened and closed by Yahuah, never won by flesh; barren Sarah is the first witness that the child comes at the set time He spoke.'),
  ('canon','1-samuel',1,5,  'canon','genesis',25,21,  'free',
    E'*And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived.* (Genesis 25:21). As with Hannah whose womb *Yahuah (LORD) had shut up*, the covenant line passes through a barren matriarch whom Yahuah alone opens when He is entreated — the same pattern of asked-for seed.'),
  ('canon','1-samuel',1,5,  'canon','judges',13,2,  'free',
    E'*And there was a certain man of Zorah, of the family of the Danites, whose name was Manoah; and his wife was barren, and bare not.* (Judges 13:2). The mother of Samson stands beside Hannah whose womb *Yahuah (LORD) had shut up* — barren, then visited, then given a son set apart from the womb; the next chapter of the barren-womb pattern that runs through the whole canon.'),
  ('canon','1-samuel',1,5,  'canon','psalms',113,9,  'free',
    E'*He maketh the barren woman to keep house, and to be a joyful mother of children. Praise ye Yahuah (LORD).* (Psalm 113:9). The Psalm sings exactly what 1 Samuel 1 narrates: the One who *had shut up her womb* is the One who makes the barren a joyful mother — Hannah is the living proof, and her praise will become her own song.'),
  ('canon','1-samuel',1,5,  'canon','luke',1,7,  'free',
    E'*And they had no child, because that Elisabeth was barren, and they both were now well stricken in years.* (Luke 1:7). The pattern reaches its last and greatest turn: barren Elisabeth, like Hannah whose womb *Yahuah (LORD) had shut up*, is visited so that the forerunner may be given — the seed of promise still opened by Yahuah, never by flesh.'),
  ('canon','1-samuel',1,19,  'canon','genesis',30,22,  'free',
    E'*And Elohim (God) remembered Rachel, and Elohim (God) hearkened to her, and opened her womb.* (Genesis 30:22). The very word over Hannah — *and Yahuah (LORD) remembered her* — is the word over Rachel: Elohim remembers the barren and opens the womb. Joseph, like Samuel, is the remembered-and-given son who carries the promise forward.'),
  ('canon','1-samuel',1,20,  'canon','genesis',21,2,  'free',
    E'*For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* (Genesis 21:2). Hannah *bare a son, and called his name Samuel, saying, Because I have asked him of Yahuah (LORD)* — the asked-for, set-time son joins Isaac the laughter-son in the line of births that flesh could not produce.'),

  -- THREAD 2: asked of Yahuah — the dedicated son, no razor, lent back
  ('canon','1-samuel',1,11,  'canon','numbers',6,5,  'free',
    E'*All the days of the vow of his separation there shall no razor come upon his head: until the days be fulfilled, in the which he separateth himself unto Yahuah (LORD), he shall be holy, and shall let the locks of the hair of his head grow.* (Numbers 6:5). Hannah''s vow — *there shall no razor come upon his head* — is the Torah''s own law of the Nazarite: she dedicates the asked-for son to Yahuah by the very ordinance Yahuah gave at Sinai, the covenant instruction shaping her prayer.'),
  ('canon','1-samuel',1,11,  'canon','judges',13,5,  'free',
    E'*For, lo, thou shalt conceive, and bear a son; and no razor shall come on his head: for the child shall be a Nazarite unto Elohim (God) from the womb: and he shall begin to deliver Yashar''el (Israel) out of the hand of the Philistines.* (Judges 13:5). The angel''s word to Samson''s mother and Hannah''s own vow speak the same separation — *no razor* — the consecrated deliverer given from the womb; Samuel like Samson is set apart to Yahuah before he is born.'),
  ('canon','1-samuel',1,11,  'canon','luke',1,15,  'free',
    E'*For he shall be great in the sight of Yahuah (Lord), and shall drink neither wine nor strong drink; and he shall be filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb.* (Luke 1:15). John, like the son Hannah vowed — *I will give him unto Yahuah (LORD) all the days of his life, and there shall no razor come upon his head* — is the Nazarite-like child set apart from the womb; the dedicated-son pattern reaching the forerunner.'),
  ('canon','1-samuel',1,28,  'canon','luke',1,13,  'free',
    E'*But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John.* (Luke 1:13). Hannah''s *I have lent him to Yahuah (LORD); as long as he liveth he shall be lent to Yahuah (LORD)* is answered down the canon: the prayed-for, named, set-apart son given by Yahuah and given back to Him — Samuel, then John.'),

  -- THREAD 3: poured out my soul before Yahuah — the answered prayer
  ('canon','1-samuel',1,15,  'canon','psalms',62,8,  'free',
    E'*Trust in him at all times; ye people, pour out your heart before him: Elohim (God) is a refuge for us. Selah.* (Psalm 62:8). Hannah does precisely what the Psalm commands — *I am a woman of a sorrowful spirit... but have poured out my soul before Yahuah (LORD)* — the bitter soul emptied out in trust before the only refuge, not the drunkenness Eli supposed.'),
  ('canon','1-samuel',1,10,  'canon','psalms',62,8,  'free',
    E'*Trust in him at all times; ye people, pour out your heart before him: Elohim (God) is a refuge for us. Selah.* (Psalm 62:8). *And she was in bitterness of soul, and prayed unto Yahuah (LORD), and wept sore* — Hannah is the picture of the poured-out heart the Psalm calls for, carrying her grief straight to Yahuah her refuge.'),
  ('canon','1-samuel',1,27,  'canon','luke',1,13,  'free',
    E'*But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son.* (Luke 1:13). Hannah''s testimony — *For this child I prayed; and Yahuah (LORD) hath given me my petition which I asked of him* — is the same mercy spoken to Zacharias: the prayer of the barren heard, and the asked-for son given.'),
  ('canon','1-samuel',1,17,  'canon','luke',1,13,  'free',
    E'*But the angel said unto him, Fear not, Zacharias: for thy prayer is heard.* (Luke 1:13). Eli''s blessing — *the Elohim (God) of Yashar''el (Israel) grant thee thy petition that thou hast asked of him* — is granted; the same God of Yashar''el who answers Hannah''s petition answers Zacharias''s prayer with the forerunner.')
  ) AS i(src_edition,src_slug,src_ch,src_v, tgt_edition,tgt_slug,tgt_ch,tgt_v, tier, note)
  JOIN _s340_1sa01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ================= threads =================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-1-the-barren-womb-opened-by-yahuah-the-seed-of-promise',
       E'The barren womb opened by Yahuah — the seed of promise',
       E'Twice the chapter says it plainly: *but Yahuah (LORD) had shut up her womb* (1 Samuel 1:5), and again *because Yahuah (LORD) had shut up her womb* (1:6). The promise does not run on flesh; the womb is opened and closed by Yahuah. So Hannah stands in a long line. *And Yahuah (LORD) visited Sarah as he had said... For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him* (Genesis 21:1-2). *And Isaac intreated Yahuah (LORD) for his wife, because she was barren: and Yahuah (LORD) was intreated of him, and Rebekah his wife conceived* (Genesis 25:21). *And Elohim (God) remembered Rachel, and Elohim (God) hearkened to her, and opened her womb* (Genesis 30:22) — the same word that falls on Hannah: *and Yahuah (LORD) remembered her* (1:19). Even outside the patriarchs the pattern holds: *And there was a certain man of Zorah... and his wife was barren, and bare not* (Judges 13:2), the mother of Samson. The Psalm sings the whole pattern: *He maketh the barren woman to keep house, and to be a joyful mother of children. Praise ye Yahuah (LORD)* (Psalm 113:9). And the pattern reaches its last great turn in *they had no child, because that Elisabeth was barren* (Luke 1:7) — Yahuah visiting the barren one final time to give the forerunner. Hannah''s asked-for son, *Samuel, saying, Because I have asked him of Yahuah (LORD)* (1:20), belongs to that line of births flesh could not produce: the seed of promise, given by Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 36400
  FROM _s340_1sa01_lookup sv, _s340_1sa01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-1-asked-of-yahuah-the-dedicated-son-lent-back',
       E'Asked of Yahuah — the dedicated son lent back',
       E'Hannah''s vow is shaped by the Torah she keeps: *then I will give him unto Yahuah (LORD) all the days of his life, and there shall no razor come upon his head* (1 Samuel 1:11). That last clause is the law of the Nazarite given at Sinai: *All the days of the vow of his separation there shall no razor come upon his head: until the days be fulfilled, in the which he separateth himself unto Yahuah (LORD), he shall be holy* (Numbers 6:5). She is consecrating the asked-for son by Yahuah''s own ordinance. The angel speaks the same separation over Samson: *no razor shall come on his head: for the child shall be a Nazarite unto Elohim (God) from the womb* (Judges 13:5) — the deliverer set apart before birth, as Samuel is. The whole arc is sealed at the chapter''s end: *Therefore also I have lent him to Yahuah (LORD); as long as he liveth he shall be lent to Yahuah (LORD)* (1:28) — the prayed-for child given by Yahuah and given back to Him. It reaches forward to the forerunner, who is the Nazarite-like child filled from the womb: *he shall drink neither wine nor strong drink; and he shall be filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb* (Luke 1:15), the answer to a barren mother and a father whose *prayer is heard* (Luke 1:13).',
       sv.verse_id, ev.verse_id, 'free', 36403
  FROM _s340_1sa01_lookup sv, _s340_1sa01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=1 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-1-poured-out-my-soul-before-yahuah-the-answered-prayer',
       E'Poured out my soul before Yahuah — the answered prayer',
       E'Eli watched Hannah''s lips move and thought her drunken, but she answered: *No, my lord, I am a woman of a sorrowful spirit: I have drunk neither wine nor strong drink, but have poured out my soul before Yahuah (LORD)* (1 Samuel 1:15). She was, from the start, *in bitterness of soul, and prayed unto Yahuah (LORD), and wept sore* (1:10). This is precisely what the Psalm commands of the afflicted: *Trust in him at all times; ye people, pour out your heart before him: Elohim (God) is a refuge for us. Selah* (Psalm 62:8). The bitter soul is emptied out in trust before the only refuge — and it is heard. *For this child I prayed; and Yahuah (LORD) hath given me my petition which I asked of him* (1:27), exactly as Eli had blessed: *the Elohim (God) of Yashar''el (Israel) grant thee thy petition that thou hast asked of him* (1:17). The same mercy returns to another barren house: *Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son* (Luke 1:13). The poured-out heart of the barren is the prayer Yahuah answers.',
       sv.verse_id, ev.verse_id, 'free', 36406
  FROM _s340_1sa01_lookup sv, _s340_1sa01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=1 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ================= thread_members =================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (1,5,'canon','genesis',21,1,  1, E'Genesis 21:1-2 — *Yahuah (LORD) visited Sarah as he had said... at the set time of which Elohim (God) had spoken*: the first barren matriarch opened at the appointed time.'),
    (1,5,'canon','genesis',25,21, 2, E'Genesis 25:21 — *Isaac intreated Yahuah (LORD) for his wife, because she was barren... and Rebekah his wife conceived*: the covenant line passes through a womb only Yahuah opens.'),
    (1,5,'canon','judges',13,2,   3, E'Judges 13:2 — *his wife was barren, and bare not*: Samson''s mother joins the pattern, soon visited and given a son set apart from the womb.'),
    (1,5,'canon','psalms',113,9,  4, E'Psalm 113:9 — *He maketh the barren woman... a joyful mother of children*: the Psalm sings what Hannah lives.'),
    (1,5,'canon','luke',1,7,      5, E'Luke 1:7 — *Elisabeth was barren*: the pattern''s last great turn, the forerunner given to a barren house.'),
    (1,19,'canon','genesis',30,22, 6, E'Genesis 30:22 — *Elohim (God) remembered Rachel... and opened her womb*: the same word — remembered — that falls on Hannah in 1:19.'),
    (1,20,'canon','genesis',21,2,  7, E'Genesis 21:2 — *Sarah conceived, and bare Abraham a son... at the set time*: the asked-for, set-time son line that Samuel joins.')
  ) AS m(srcv_a,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-1-the-barren-womb-opened-by-yahuah-the-seed-of-promise'
  JOIN _s340_1sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=1 AND sv.verse_number=m.srcv
  JOIN _s340_1sa01_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (1,11,'canon','numbers',6,5,  1, E'Numbers 6:5 — *there shall no razor come upon his head... he shall be holy*: the Torah''s Nazarite law that shapes Hannah''s vow.'),
    (1,11,'canon','judges',13,5,  2, E'Judges 13:5 — *no razor shall come on his head: for the child shall be a Nazarite unto Elohim (God) from the womb*: the consecrated deliverer set apart before birth, as Samuel.'),
    (1,11,'canon','luke',1,15,    3, E'Luke 1:15 — *shall drink neither wine nor strong drink; and he shall be filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb*: the Nazarite-like forerunner.'),
    (1,28,'canon','luke',1,13,    4, E'Luke 1:13 — *thy prayer is heard; and thy wife Elisabeth shall bear thee a son*: the prayed-for, dedicated son given and given back, as Hannah lent Samuel.')
  ) AS m(srcv_a,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-1-asked-of-yahuah-the-dedicated-son-lent-back'
  JOIN _s340_1sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=1 AND sv.verse_number=m.srcv
  JOIN _s340_1sa01_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (1,10,'canon','psalms',62,8,  1, E'Psalm 62:8 — *pour out your heart before him: Elohim (God) is a refuge for us*: Hannah in bitterness of soul does exactly this.'),
    (1,15,'canon','psalms',62,8,  2, E'Psalm 62:8 — *Trust in him at all times; pour out your heart before him*: her own words, *poured out my soul before Yahuah (LORD)*, are the Psalm enacted.'),
    (1,17,'canon','luke',1,13,    3, E'Luke 1:13 — *thy prayer is heard*: the petition Eli blessed (*grant thee thy petition*) granted in the same God of Yashar''el.'),
    (1,27,'canon','luke',1,13,    4, E'Luke 1:13 — *Fear not, Zacharias: for thy prayer is heard*: the same mercy to a barren house, answering *Yahuah hath given me my petition which I asked of him*.')
  ) AS m(srcv_a,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-1-poured-out-my-soul-before-yahuah-the-answered-prayer'
  JOIN _s340_1sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=1 AND sv.verse_number=m.srcv
  JOIN _s340_1sa01_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_2.sql (1 Samuel 2) -----
-- Chapter: 1 Samuel 2 — Hannah's Song (KEYSTONE) + the man of Elohim's oracle on the faithful priest
-- Tag: 1sa02   Session: s340   Temp view: _s340_1sa02_lookup
-- Sort band: base 36425, step 3 -> 36425, 36428, 36431, 36434, 36437, 36440
--
-- 1 Samuel 2 coverage:
--   v.1   (mine horn is exalted / my mouth enlarged over enemies / I rejoice in thy salvation)
--         NT:     Luke 1:46-47 (Magnificat opening), Luke 1:69 (horn of salvation)
--         Extras: none warranted (NT seedbed link carries it)
--         Tanakh: Psalm 113:1-9 (the praise-psalm of reversal) — woven in song thread
--   v.2   (none holy as Yahuah / none beside thee / any rock like our Elohim)
--         NT:     1 Corinthians 10:4 (that Rock was Messiah)
--         Extras: none warranted
--         Tanakh: Deuteronomy 32:4 (He is the Rock), 32:31 (their rock is not as our Rock)
--   v.3   (Yahuah a Elohim of knowledge, by him actions are weighed)
--         NT:     none warranted (folded under v.2 holiness/judgment)
--         Extras: none warranted
--         Tanakh: Psalm 75:4-7 (lift not up the horn; Elohim is the judge) — woven in reversal thread
--   v.4-8 (bows of mighty broken / full hire for bread / barren bears seven / killeth+maketh alive
--          / poor+rich / brings low+lifts up / raiseth poor from dust to princes)
--         NT:     Luke 1:51-53 (proud scattered, mighty put down, hungry filled, rich sent empty)
--         Extras: Wisdom of Solomon 16:13 (power of life and death — woven in v.6 resurrection thread)
--         Tanakh: Psalm 113:7-9 (raiseth poor from dust, barren a joyful mother), Psalm 75:7,10
--                 (putteth down one and setteth up another; horns of wicked cut, righteous exalted)
--   v.6   (Yahuah killeth and maketh alive; bringeth down to grave and bringeth up)
--         NT:     John 5:21 (the Son quickeneth whom he will)
--         Extras: Wisdom of Solomon 16:13 (you have power of life and death; bringest up again)
--         Tanakh: Deuteronomy 32:39 (I kill and I make alive), 2 Kings 5:7 (Elohim to kill and make
--                 alive), Daniel 12:2 (many that sleep in dust shall awake) — resurrection thread
--   v.9   (keep the feet of his saints; wicked silent; by strength no man prevail)
--         NT:     none warranted (folded under reversal/anointed-king)
--         Extras: none warranted
--         Tanakh: folded
--   v.10  (adversaries broken / thunder from heaven / judge the ends of the earth /
--          give strength unto his king, exalt the horn of his anointed) — FIRST canonical Messiah-King
--         NT:     Luke 1:69 (raised up an horn of salvation in the house of David)
--         Extras: none warranted
--         Tanakh: Psalm 2:2,6 (against his anointed; my king upon my holy hill) — anointed-king thread
--   v.11-17 (Eli's sons / sons of Belial / abhorred the offering of Yahuah)
--         NT:     none warranted (judgment-narrative; framework carried by oracle thread at v.35)
--         Extras: none warranted
--         Tanakh: folded into the oracle/faithful-priest thread
--   v.18-26 (Samuel ministers, girded with linen ephod / grew in favour with Yahuah and men)
--         NT:     none warranted (cf. Luke 2:52 of Yahusha — left as narrative parallel, not threaded)
--         Extras: none warranted
--         Tanakh: none warranted
--   v.27-34 (man of Elohim's oracle; cut off the arm; Hophni and Phinehas die in one day)
--         NT:     none warranted (judgment that clears the way for the faithful priest at v.35)
--         Extras: none warranted
--         Tanakh: folded into faithful-priest thread
--   v.35  (I will raise me up a faithful priest... build him a sure house; walk before mine anointed)
--         NT:     Hebrews 7:17,24-25 (a priest for ever after the order of Melek Tsadiq, unchangeable)
--         Extras: none warranted
--         Tanakh: 2 Samuel 7:13,16 (the sure house = the Davidic covenant) — faithful-priest thread
--   v.36  (every one left shall crouch for a piece of silver) — folded into faithful-priest judgment
--
-- THREADS (6):
--   1-samuel-2-hannahs-song-the-seedbed-of-the-magnificat        [canon: Luke, Psalms]
--   1-samuel-2-none-holy-as-yahuah-neither-any-rock-like-our-elohim  [canon: Deuteronomy, 1 Corinthians]
--   1-samuel-2-yahuah-killeth-and-maketh-alive-the-grave-and-up   [extras: Deut, 2 Kings, John, Daniel, Wisdom of Solomon]
--   1-samuel-2-the-proud-scattered-the-hungry-filled-the-mighty-brought-low  [canon: Luke, Psalms]
--   1-samuel-2-he-shall-exalt-the-horn-of-his-anointed           [canon: Psalms, Luke]
--   1-samuel-2-a-faithful-priest-and-a-sure-house                [canon: Hebrews, 2 Samuel]
--
-- FRAMING NOTES:
--   * 2:10 "exalt the horn of his anointed" is the FIRST canonical mention of Yahuah's Anointed /
--     Messiah-King — sung by Hannah before there is any king in Yashar'el (Israel). It opens the
--     Davidic-king line (Psalm 2's "his anointed" / "my king upon my holy hill of Zion") and is
--     answered in Luke 1:69 "raised up an horn of salvation in the house of his servant David."
--     The horn is the FORMED Son's royal strength given BY the Father — "he shall give strength
--     unto his king" — the Father exalts, the anointed receives; never co-equal-persons.
--   * 2:35 "a faithful priest... a sure house... walk before mine anointed for ever": the immediate
--     fulfilment is Zadok displacing the house of Eli, but the oracle reaches past him to the
--     Priest after the order of Melek Tsadiq (Hebrews 7) who walks before the anointed for ever,
--     and the "sure house" is the everlasting Davidic covenant (2 Samuel 7:16). The Levitical
--     office failing here is judgment for covenant-breaking (Eli's sons), never the Torah failing.

CREATE TEMP VIEW _s340_1sa02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Hannah's Song — seedbed of the Magnificat
    ('canon','1-samuel',2,1,'canon','luke',1,46,
     E'*And Mary said, My soul doth magnify Yahuah (Lord), And my spirit hath rejoiced in Elohim (God) my Saviour* (Luke 1:46-47). Hannah''s opening — *My heart rejoiceth in Yahuah (LORD)... because I rejoice in thy salvation* (1 Samuel 2:1) — is the seedbed Mary draws from. The barren-woman-vindicated sings first; the virgin sings the same song magnified.','free'),
    ('canon','1-samuel',2,1,'canon','luke',1,47,
     E'*And my spirit hath rejoiced in Elohim (God) my Saviour* (Luke 1:47). Hannah''s *because I rejoice in thy salvation* (1 Samuel 2:1) is taken up almost word for word — the rejoicing is not in the child given but in the Saviour who gives.','free'),
    ('canon','1-samuel',2,1,'canon','psalms',113,7,
     E'*He raiseth up the poor out of the dust, and lifteth the needy out of the dunghill* (Psalm 113:7). Hannah''s song and this Hallel psalm sing one reversal — the *mine horn is exalted in Yahuah (LORD)* (1 Samuel 2:1) of the lowly lifted up; Psalm 113:9 even names *the barren woman... a joyful mother of children*, Hannah''s own case.','free'),
    -- THREAD 2: none holy as Yahuah, neither any rock like our Elohim
    ('canon','1-samuel',2,2,'canon','deuteronomy',32,4,
     E'*He is the Rock, his work is perfect: for all his ways are judgment: a Elohim (God) of truth and without iniquity, just and right is he* (Deuteronomy 32:4). Hannah''s *neither is there any rock like our Elohim (God)* (1 Samuel 2:2) reaches back to the Song of Moses, where the Rock is first named — the unshakable covenant-keeper.','free'),
    ('canon','1-samuel',2,2,'canon','deuteronomy',32,31,
     E'*For their rock is not as our Rock, even our enemies themselves being judges* (Deuteronomy 32:31). Hannah''s *there is none beside thee: neither is there any rock like our Elohim (God)* (1 Samuel 2:2) makes the same exclusive claim — the gods of the proud are no Rock at all.','free'),
    ('canon','1-samuel',2,2,'canon','1-corinthians',10,4,
     E'*And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4). The Rock Hannah confesses — *neither is there any rock like our Elohim (God)* (1 Samuel 2:2) — is the Formed Son, the One who went with Yashar''el (Israel) in the wilderness; Yahuah, and having a Father.','free'),
    -- THREAD 3: Yahuah killeth and maketh alive — resurrection
    ('canon','1-samuel',2,6,'canon','deuteronomy',32,39,
     E'*See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand* (Deuteronomy 32:39). Hannah''s *Yahuah (LORD) killeth, and maketh alive: he bringeth down to the grave, and bringeth up* (1 Samuel 2:6) is the Song of Moses confessed — the One who holds death holds also resurrection.','free'),
    ('canon','1-samuel',2,6,'canon','2-kings',5,7,
     E'*Am I Elohim (God), to kill and to make alive, that this man doth send unto me to recover a man of his leprosy?* (2 Kings 5:7). The king of Yashar''el (Israel) names the very power Hannah ascribes to Yahuah alone — *Yahuah (LORD) killeth, and maketh alive* (1 Samuel 2:6) — a prerogative no king or man can claim.','free'),
    ('canon','1-samuel',2,6,'canon','daniel',12,2,
     E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Hannah''s *he bringeth down to the grave, and bringeth up* (1 Samuel 2:6) opens toward the resurrection Daniel sees plainly — the grave is not the end where Yahuah brings up.','free'),
    ('canon','1-samuel',2,6,'canon','john',5,21,
     E'*For as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will* (John 5:21). Hannah''s *maketh alive... and bringeth up* (1 Samuel 2:6) is the work the Father gives the Formed Son to do — *the Son can do nothing of himself, but what he seeth the Father do* (John 5:19); the Son raises, the Father has given.','free'),
    ('canon','1-samuel',2,6,'apocrypha','the-wisdom-of-solomon',16,13,
     E'*For you have power of life and death: you leadest to the gates of hell, and bringest up again* (Wisdom of Solomon 16:13). The restored wisdom library confesses Hannah''s creed exactly — *Yahuah (LORD) killeth, and maketh alive: he bringeth down to the grave, and bringeth up* (1 Samuel 2:6) — life and death held in one hand.','extras'),
    -- THREAD 4: the proud scattered, hungry filled, mighty brought low
    ('canon','1-samuel',2,4,'canon','luke',1,51,
     E'*He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts* (Luke 1:51). Hannah''s *The bows of the mighty men are broken* (1 Samuel 2:4) is the same overturning Mary sings — the strong undone by Yahuah''s arm.','free'),
    ('canon','1-samuel',2,5,'canon','luke',1,53,
     E'*He hath filled the hungry with good things; and the rich he hath sent empty away* (Luke 1:53). Hannah''s *They that were full have hired out themselves for bread; and they that were hungry ceased: so that the barren hath born seven* (1 Samuel 2:5) is taken up nearly verbatim — the full emptied, the hungry filled.','free'),
    ('canon','1-samuel',2,7,'canon','luke',1,52,
     E'*He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). Hannah''s *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7) is the throne-overturning the Magnificat sings back — the same Yahuah who reverses high and low.','free'),
    ('canon','1-samuel',2,8,'canon','psalms',113,7,
     E'*He raiseth up the poor out of the dust, and lifteth the needy out of the dunghill; That he may set him with princes, even with the princes of his people* (Psalm 113:7-8). Hannah''s *He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes* (1 Samuel 2:8) is the same line — the psalm and the song share the very words.','free'),
    ('canon','1-samuel',2,7,'canon','psalms',75,7,
     E'*But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7). Hannah''s *he bringeth low, and lifteth up* (1 Samuel 2:7) is the same judge''s hand; Psalm 75:10 even ends *the horns of the wicked... will I cut off; but the horns of the righteous shall be exalted* — Hannah''s horn-language exactly.','free'),
    -- THREAD 5: he shall exalt the horn of his anointed — the Messiah-King
    ('canon','1-samuel',2,10,'canon','psalms',2,2,
     E'*The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:2). Hannah''s *he shall give strength unto his king, and exalt the horn of his anointed* (1 Samuel 2:10) is the FIRST canon mention of Yahuah''s Anointed; Psalm 2 unfolds it — the nations rage, but the anointed is set as king.','free'),
    ('canon','1-samuel',2,10,'canon','psalms',2,6,
     E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). Hannah''s *he shall give strength unto his king* (1 Samuel 2:10) sings before any king reigns in Yashar''el (Israel); the Father sets and strengthens the king — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7) — the Formed Son who has a Father.','free'),
    ('canon','1-samuel',2,10,'canon','luke',1,69,
     E'*And hath raised up an horn of salvation for us in the house of his servant David* (Luke 1:69). Zacharias names what Hannah first sang — *exalt the horn of his anointed* (1 Samuel 2:10) — now the horn of salvation raised up in David''s house, the anointed-king come.','free'),
    -- THREAD 6: a faithful priest and a sure house
    ('canon','1-samuel',2,35,'canon','hebrews',7,17,
     E'*For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17). Yahuah''s oracle — *I will raise me up a faithful priest, that shall do according to that which is in mine heart... and he shall walk before mine anointed for ever* (1 Samuel 2:35) — reaches past Zadok to the priest for ever, the One who *continueth ever, hath an unchangeable priesthood* (Hebrews 7:24).','free'),
    ('canon','1-samuel',2,35,'canon','hebrews',7,25,
     E'*Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). The *faithful priest* who *shall walk before mine anointed for ever* (1 Samuel 2:35) is the ever-living intercessor — the failing house of Eli is judgment on covenant-breakers, never the priesthood-pattern itself undone.','free'),
    ('canon','1-samuel',2,35,'canon','2-samuel',7,16,
     E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). The *sure house* Yahuah builds the faithful priest (1 Samuel 2:35), set to *walk before mine anointed for ever*, is bound to the everlasting Davidic covenant — *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13).','free')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,note,tier)
  JOIN _s340_1sa02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-2-hannahs-song-the-seedbed-of-the-magnificat',
       E'Hannah''s Song — the seedbed of the Magnificat',
       E'Hannah, the once-barren wife given a son, sings the first great song of reversal: *My heart rejoiceth in Yahuah (LORD), mine horn is exalted in Yahuah (LORD): my mouth is enlarged over mine enemies; because I rejoice in thy salvation* (1 Samuel 2:1). Generations later the virgin sings it again, magnified: *My soul doth magnify Yahuah (Lord), And my spirit hath rejoiced in Elohim (God) my Saviour* (Luke 1:46-47). The rejoicing in both is not in the child given but in the Saviour who gives. The Hallel psalm sings the same hand at work: *He raiseth up the poor out of the dust, and lifteth the needy out of the dunghill... He maketh the barren woman to keep house, and to be a joyful mother of children* (Psalm 113:7,9) — Hannah''s own case set to music.',
       sv.verse_id, ev.verse_id, 'free', 36425
  FROM _s340_1sa02_lookup sv, _s340_1sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=2 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-2-none-holy-as-yahuah-neither-any-rock-like-our-elohim',
       E'None holy as Yahuah — neither any rock like our Elohim',
       E'Hannah''s confession at the heart of the song is exclusive: *There is none holy as Yahuah (LORD): for there is none beside thee: neither is there any rock like our Elohim (God)* (1 Samuel 2:2). The Rock she names is first sung in the Song of Moses: *He is the Rock, his work is perfect: for all his ways are judgment* (Deuteronomy 32:4), and *their rock is not as our Rock, even our enemies themselves being judges* (Deuteronomy 32:31) — the gods of the proud are no Rock at all. That Rock went with Yashar''el (Israel) through the wilderness and is named at last: *they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4) — the Formed Son, who is Yahuah and has a Father.',
       sv.verse_id, ev.verse_id, 'free', 36428
  FROM _s340_1sa02_lookup sv, _s340_1sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-2-yahuah-killeth-and-maketh-alive-the-grave-and-up',
       E'Yahuah killeth and maketh alive — he bringeth down to the grave and bringeth up',
       E'Hannah confesses the resurrection in seed-form: *Yahuah (LORD) killeth, and maketh alive: he bringeth down to the grave, and bringeth up* (1 Samuel 2:6). It is the Song of Moses already heard: *I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand* (Deuteronomy 32:39); a power the king of Yashar''el (Israel) knows is Yahuah''s alone — *Am I Elohim (God), to kill and to make alive?* (2 Kings 5:7). The restored wisdom library says the same: *you have power of life and death: you leadest to the gates of hell, and bringest up again* (Wisdom of Solomon 16:13). It opens forward to Daniel''s plain sight — *many of them that sleep in the dust of the earth shall awake, some to everlasting life* (Daniel 12:2) — and to the work the Father gives the Formed Son: *as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will* (John 5:21).',
       sv.verse_id, ev.verse_id, 'extras', 36431
  FROM _s340_1sa02_lookup sv, _s340_1sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-2-the-proud-scattered-the-hungry-filled-the-mighty-brought-low',
       E'The proud scattered, the hungry filled, the mighty brought low',
       E'The body of Hannah''s song is the great reversal Yahuah works: *The bows of the mighty men are broken, and they that stumbled are girded with strength. They that were full have hired out themselves for bread; and they that were hungry ceased... Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up. He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes* (1 Samuel 2:4-8). The Magnificat sings it back almost line for line: *He hath shewed strength with his arm; he hath scattered the proud... He hath put down the mighty from their seats, and exalted them of low degree. He hath filled the hungry with good things; and the rich he hath sent empty away* (Luke 1:51-53). The psalms confess the same judge: *Elohim (God) is the judge: he putteth down one, and setteth up another... the horns of the wicked also will I cut off; but the horns of the righteous shall be exalted* (Psalm 75:7,10), and *He raiseth up the poor out of the dust... That he may set him with princes* (Psalm 113:7-8).',
       sv.verse_id, ev.verse_id, 'free', 36434
  FROM _s340_1sa02_lookup sv, _s340_1sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-2-he-shall-exalt-the-horn-of-his-anointed',
       E'He shall exalt the horn of his anointed — the first word of the Messiah-King',
       E'Hannah''s song ends on the Anointed — and it is the FIRST mention of Yahuah''s Messiah-King in the whole canon, sung by a woman before there is any king in Yashar''el (Israel): *Yahuah (LORD) shall judge the ends of the earth; and he shall give strength unto his king, and exalt the horn of his anointed* (1 Samuel 2:10). The Father gives strength; the anointed receives and is exalted — never co-equal-persons, the Formed Son who has a Father. Psalm 2 unfolds the same anointed-king: the rulers take counsel *against Yahuah (LORD), and against his anointed* (Psalm 2:2), but *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6), and *Thou art my Son; this day have I begotten thee* (Psalm 2:7). Zacharias names what Hannah first sang: *hath raised up an horn of salvation for us in the house of his servant David* (Luke 1:69) — the horn of the anointed lifted up at last.',
       sv.verse_id, ev.verse_id, 'free', 36437
  FROM _s340_1sa02_lookup sv, _s340_1sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-2-a-faithful-priest-and-a-sure-house',
       E'A faithful priest and a sure house — before mine anointed for ever',
       E'The man of Elohim brings the oracle that judges the house of Eli — whose sons were *sons of Belial* who *knew not Yahuah (LORD)* (1 Samuel 2:12) — and points past them: *I will raise me up a faithful priest, that shall do according to that which is in mine heart and in my mind: and I will build him a sure house; and he shall walk before mine anointed for ever* (1 Samuel 2:35). The nearer fulfilment is Zadok displacing Eli''s line, but the oracle reaches to the priest for ever: *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17), the One who *continueth ever, hath an unchangeable priesthood... able also to save them to the uttermost* (Hebrews 7:24-25). The *sure house* set to walk before the anointed for ever is bound to the everlasting Davidic covenant: *thy throne shall be established for ever* (2 Samuel 7:16). The failing of Eli''s house is judgment on covenant-breakers, never the Torah''s priesthood-pattern undone.',
       sv.verse_id, ev.verse_id, 'free', 36440
  FROM _s340_1sa02_lookup sv, _s340_1sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=2 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mn
  FROM (VALUES
    (1,'luke',1,46,1,E'Luke 1:46 — *My soul doth magnify Yahuah (Lord)*: the Magnificat opens with Hannah''s rejoicing.'),
    (1,'luke',1,47,2,E'Luke 1:47 — *my spirit hath rejoiced in Elohim (God) my Saviour*: Hannah''s *I rejoice in thy salvation* taken up.'),
    (1,'psalms',113,7,3,E'Psalm 113:7 — *He raiseth up the poor out of the dust*: the Hallel psalm sings Hannah''s reversal, naming the barren made a joyful mother (v.9).')
  ) AS m(slot,tgt_slug,tgt_ch,tgt_v,so,mn)
  JOIN cross_reference_threads t ON t.slug='1-samuel-2-hannahs-song-the-seedbed-of-the-magnificat'
  JOIN _s340_1sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s340_1sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mn
  FROM (VALUES
    ('deuteronomy',32,4,1,E'Deuteronomy 32:4 — *He is the Rock, his work is perfect*: the Song of Moses where the Rock is first named.'),
    ('deuteronomy',32,31,2,E'Deuteronomy 32:31 — *their rock is not as our Rock*: the exclusive claim Hannah echoes.'),
    ('1-corinthians',10,4,3,E'1 Corinthians 10:4 — *that Rock was Messiah (Christ)*: the Formed Son is the Rock confessed, Yahuah and having a Father.')
  ) AS m(tgt_slug,tgt_ch,tgt_v,so,mn)
  JOIN cross_reference_threads t ON t.slug='1-samuel-2-none-holy-as-yahuah-neither-any-rock-like-our-elohim'
  JOIN _s340_1sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s340_1sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 (mixed editions: 4 canon + 1 extras)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mn
  FROM (VALUES
    ('canon','deuteronomy',32,39,1,E'Deuteronomy 32:39 — *I kill, and I make alive; I wound, and I heal*: the Song of Moses confessed in Hannah''s creed.'),
    ('canon','2-kings',5,7,2,E'2 Kings 5:7 — *Am I Elohim (God), to kill and to make alive?*: a power no king or man can claim.'),
    ('apocrypha','the-wisdom-of-solomon',16,13,3,E'Wisdom of Solomon 16:13 — *you have power of life and death... bringest up again*: the wisdom library confesses Hannah''s very words.'),
    ('canon','daniel',12,2,4,E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake*: the resurrection toward which "bringeth up" opens.'),
    ('canon','john',5,21,5,E'John 5:21 — *the Son quickeneth whom he will*: the Father gives the raising-work to the Formed Son.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v,so,mn)
  JOIN cross_reference_threads t ON t.slug='1-samuel-2-yahuah-killeth-and-maketh-alive-the-grave-and-up'
  JOIN _s340_1sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s340_1sa02_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 (multiple source verses 4-8)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mn
  FROM (VALUES
    (4,'luke',1,51,1,E'Luke 1:51 — *he hath scattered the proud*: Hannah''s broken bows of the mighty (2:4).'),
    (5,'luke',1,53,2,E'Luke 1:53 — *filled the hungry... the rich he hath sent empty away*: Hannah''s full-emptied, hungry-filled (2:5).'),
    (7,'luke',1,52,3,E'Luke 1:52 — *put down the mighty... exalted them of low degree*: Hannah''s bringeth-low and lifteth-up (2:7).'),
    (8,'psalms',113,7,4,E'Psalm 113:7-8 — *raiseth up the poor out of the dust... set him with princes*: the psalm shares Hannah''s very words (2:8).'),
    (7,'psalms',75,7,5,E'Psalm 75:7 — *Elohim is the judge: he putteth down one, and setteth up another*: the same judge''s hand, with horn-language (75:10).')
  ) AS m(srcv,tgt_slug,tgt_ch,tgt_v,so,mn)
  JOIN cross_reference_threads t ON t.slug='1-samuel-2-the-proud-scattered-the-hungry-filled-the-mighty-brought-low'
  JOIN _s340_1sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=m.srcv
  JOIN _s340_1sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mn
  FROM (VALUES
    ('psalms',2,2,1,E'Psalm 2:2 — *against Yahuah (LORD), and against his anointed*: Psalm 2 unfolds Hannah''s first word of the Anointed.'),
    ('psalms',2,6,2,E'Psalm 2:6 — *I set my king upon my holy hill of Zion*: the Father sets and strengthens the king; the Son who has a Father (2:7).'),
    ('luke',1,69,3,E'Luke 1:69 — *raised up an horn of salvation... in the house of his servant David*: Hannah''s exalted horn of the anointed answered.')
  ) AS m(tgt_slug,tgt_ch,tgt_v,so,mn)
  JOIN cross_reference_threads t ON t.slug='1-samuel-2-he-shall-exalt-the-horn-of-his-anointed'
  JOIN _s340_1sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s340_1sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mn
  FROM (VALUES
    ('hebrews',7,17,1,E'Hebrews 7:17 — *a priest for ever after the order of Melek Tsadiq (Melchizedek)*: the faithful priest reaches past Zadok to the priest for ever.'),
    ('hebrews',7,25,2,E'Hebrews 7:25 — *able also to save them to the uttermost... ever liveth to make intercession*: the ever-living priest who walks before the anointed.'),
    ('2-samuel',7,16,3,E'2 Samuel 7:16 — *thy throne shall be established for ever*: the "sure house" bound to the everlasting Davidic covenant.')
  ) AS m(tgt_slug,tgt_ch,tgt_v,so,mn)
  JOIN cross_reference_threads t ON t.slug='1-samuel-2-a-faithful-priest-and-a-sure-house'
  JOIN _s340_1sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=2 AND sv.verse_number=35
  JOIN _s340_1sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_3.sql (1 Samuel 3) -----
-- Chapter: 1 Samuel 3 — THE CALLING OF SAMUEL AT SHILOH.
-- The boy Samuel ministers before Eli, and *the word of Yahuah (LORD) was precious in those days;
-- there was no open vision* (3:1) — the dearth of revelation that Amos names the famine of hearing
-- (Amos 8:11-12). In the night Yahuah calls the child by name three times; Samuel, not yet knowing
-- Yahuah, runs to Eli, until Eli perceives it is Yahuah and teaches him the answer: *Speak, Yahuah
-- (LORD); for thy servant heareth* (3:9). *And Yahuah (LORD) came, and stood, and called as at other
-- times, Samuel, Samuel* (3:10) — the Formed Son who calls His own by name, the Shepherd whose sheep
-- hear His voice (John 10:3, 27), the answering servant of Isaiah 6:8. The first word given to the
-- prophet is judgment on Eli's house: *the iniquity of Eli's house shall not be purged with sacrifice
-- nor offering for ever* (3:14) — the iniquity no offering can cleanse (Isaiah 22:14; Hebrews 10:4,11),
-- answering the earlier oracle of the faithful priest raised up (1 Samuel 2:35). And Samuel grows: *did
-- let none of his words fall to the ground* (3:19) — the prophet whose every word stands (Joshua 21:45;
-- 1 Kings 8:56), established *from Dan even to Beer-sheba* (3:20), the first of the prophets from whom
-- the line runs (Acts 3:24; Ecclesiasticus 46:13-15), Yahuah revealing Himself again at Shiloh by His
-- word (3:21).
-- Tag: 1sa03   Temp view: _s340_1sa03_lookup
-- Sort band: base 36450, step 3 -> threads at 36450, 36453, 36456, 36459 (4 threads)
-- Source of EVERY row: 'canon','1-samuel',3,v
--
-- 1 Samuel 3 coverage:
--   ★ v.1 (the word of Yahuah was precious in those days; there was no open vision)
--        NT:     none warranted distinct (the famine carried by the Tanakh witness; held in prose)
--        Extras: ★ Ecclesiasticus 46:15 (by his word he was known to be faithful in vision) — THREAD 1
--        Tanakh: ★★ Amos 8:11 (a famine... of hearing the words of Yahuah), ★ Amos 8:12 (they shall
--                run to and fro to seek the word of Yahuah, and shall not find it) — THREAD 1
--   v.2-3 (Eli's eyes wax dim; the lamp of Elohim; the ark; Samuel laid down to sleep)
--        NT/Extras/Tanakh: framing/setting; woven into THREAD 2 prose; no separate add
--   ★★★ v.4-10 (Yahuah called Samuel... Here am I... Speak, Yahuah; for thy servant heareth... Yahuah
--          came, and stood, and called as at other times, Samuel, Samuel)
--        NT:     ★★★ John 10:3 (the sheep hear his voice: and he calleth his own sheep by name),
--                ★★★ John 10:27 (My sheep hear my voice, and I know them, and they follow me) — THREAD 2
--        Extras: none warranted distinct (the calling-by-name carried by John + Isaiah)
--        Tanakh: ★★ Isaiah 6:8 (Whom shall I send... Then said I, Here am I; send me) — THREAD 2
--   ★★★ v.11-14 (I will judge his house for ever... the iniquity of Eli's house shall not be purged
--          with sacrifice nor offering for ever)
--        NT:     ★★ Hebrews 10:4 (it is not possible that the blood of bulls and of goats should take
--                away sins), ★ Hebrews 10:11 (every priest... offering oftentimes the same sacrifices,
--                which can never take away sins) — THREAD 3
--        Extras: none warranted (the un-purgeable iniquity carried by Tanakh + Hebrews)
--        Tanakh: ★★ Isaiah 22:14 (Surely this iniquity shall not be purged from you till ye die),
--                ★★ 1 Samuel 2:35 (I will raise me up a faithful priest... and he shall walk before
--                mine anointed for ever) — THREAD 3
--   v.15-18 (Samuel opened the doors... told Eli every whit... It is Yahuah: let him do what seemeth
--          him good)
--        NT/Extras/Tanakh: framing; Eli's submission woven into THREAD 3 prose; no separate add
--   ★ v.19-21 (did let none of his words fall to the ground... all Yashar'el from Dan even to
--          Beer-sheba knew that Samuel was established to be a prophet... Yahuah appeared again in
--          Shiloh... revealed himself to Samuel in Shiloh by the word of Yahuah)
--        NT:     ★★ Acts 3:24 (all the prophets from Samuel and those that follow after... have
--                likewise foretold of these days) — THREAD 4
--        Extras: ★ Ecclesiasticus 46:13 (Samuel, the prophet of Yahuah... established a kingdom),
--                ★ Ecclesiasticus 46:15 (by his faithfulness he was found a true prophet, and by his
--                word he was known to be faithful in vision) — THREAD 4 (and 46:15 on THREAD 1)
--        Tanakh: ★★ Joshua 21:45 (There failed not ought of any good thing which Yahuah had spoken),
--                ★ Joshua 23:14 (not one thing hath failed of all the good things... all are come to
--                pass), ★ 1 Kings 8:56 (there hath not failed one word of all his good promise) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. 1-samuel-3-the-word-of-yahuah-was-precious-there-was-no-open-vision — Tanakh (Amos 8) + Extras
--      (Ecclesiasticus 46) [extras] (★ the famine of hearing; the precious, rare word; Samuel found
--      faithful in vision against the dearth)
--   2. 1-samuel-3-speak-yahuah-for-thy-servant-heareth-he-calleth-his-own-by-name — NT (John 10) +
--      Tanakh (Isaiah 6) [free] (★★★ the Formed Son calls His own by name in the night; the sheep hear
--      His voice; the answering servant — Here am I)
--   3. 1-samuel-3-the-iniquity-not-purged-with-sacrifice-nor-offering — NT (Hebrews 10) + Tanakh (Isaiah
--      22, 1 Samuel 2) [free] (★★★ the iniquity no offering can purge; the failed priesthood judged;
--      the faithful priest raised up)
--   4. 1-samuel-3-let-none-of-his-words-fall-samuel-established-a-prophet — NT (Acts 3) + Extras
--      (Ecclesiasticus 46) + Tanakh (Joshua 21, Joshua 23, 1 Kings 8) [extras] (★ the prophet whose
--      every word stands; established from Dan to Beer-sheba; the first of the prophet-line; Yahuah
--      revealed by His word at Shiloh)
--
-- Framing notes:
--   ★ THE PRECIOUS WORD / NO OPEN VISION (THREAD 1): *the word of Yahuah (LORD) was precious in those
--      days; there was no open vision* (3:1) is the dearth Amos names — *not a famine of bread, nor a
--      thirst for water, but of hearing the words of Yahuah* (Amos 8:11), men running *to seek the word
--      of Yahuah, and shall not find it* (Amos 8:12). Into that famine Yahuah speaks afresh to a child;
--      the restored witness remembers Samuel as the one *by his word... known to be faithful in vision*
--      (Ecclesiasticus 46:15) — the open vision restored in him.
--   ★★★ HE CALLETH HIS OWN BY NAME (THREAD 2): *Yahuah (LORD) came, and stood, and called as at other
--      times, Samuel, Samuel* (3:10). This is the Formed Son — Yahuah who *came, and stood*, the visible
--      One who speaks — calling His own by name, exactly as He names it forward: *he calleth his own
--      sheep by name, and leadeth them out... and the sheep follow him: for they know his voice* (John
--      10:3-4), *My sheep hear my voice, and I know them, and they follow me* (John 10:27). Samuel, not
--      yet knowing Yahuah (3:7), is taught the servant's answer — *Speak, Yahuah (LORD); for thy servant
--      heareth* (3:9) — the same Here-am-I of the prophet sent: *Whom shall I send... Then said I, Here
--      am I; send me* (Isaiah 6:8). The Shepherd calls; the sheep hears and answers.
--   ★★★ THE INIQUITY NOT PURGED BY SACRIFICE (THREAD 3): the first word to the new prophet is judgment —
--      *the iniquity of Eli's house shall not be purged with sacrifice nor offering for ever* (3:14).
--      This is the heart of the sacrificial Torah honoured, not denied: presumptuous, unrepented
--      iniquity was never covered by the offerings — *Surely this iniquity shall not be purged from you
--      till ye die* (Isaiah 22:14) — and the blood of bulls and goats was always a shadow that *can never
--      take away sins* (Hebrews 10:4, 11). The failed house is set against the promise already given:
--      *I will raise me up a faithful priest, that shall do according to that which is in mine heart...
--      and he shall walk before mine anointed for ever* (1 Samuel 2:35). The priesthood that despised the
--      offering is judged; the faithful priest is raised up.
--   ★ NONE OF HIS WORDS FALL — A PROPHET ESTABLISHED (THREAD 4): *Samuel grew, and Yahuah (LORD) was with
--      him, and did let none of his words fall to the ground* (3:19) — the mark of the true prophet, that
--      every word stands, *There failed not ought of any good thing which Yahuah (LORD) had spoken*
--      (Joshua 21:45), *not one thing hath failed... all are come to pass* (Joshua 23:14), *there hath not
--      failed one word of all his good promise* (1 Kings 8:56). All Yashar'el *from Dan even to Beer-sheba*
--      (3:20) knows him established; he is the first of the prophet-line — *all the prophets from Samuel
--      and those that follow after... have likewise foretold of these days* (Acts 3:24) — and the restored
--      witness remembers *Samuel, the prophet of Yahuah... by his faithfulness he was found a true prophet*
--      (Ecclesiasticus 46:13, 15). And *Yahuah (LORD) appeared again in Shiloh: for Yahuah (LORD) revealed
--      himself to Samuel in Shiloh by the word of Yahuah (LORD)* (3:21) — the open vision of v.1 restored.
--   EXTRAS: Ecclesiasticus 46:13-15 (Samuel the prophet of Yahuah, found a true prophet, faithful in
--      vision) — clean witness, parse verified; 46:15 placed on THREAD 1, 46:13 + 46:15 on THREAD 4.
--   VERSES WITH NO SEPARATE ADD: v.2-3 (Eli's dim eyes, the lamp, the ark, Samuel asleep — setting,
--      woven into THREAD 2), v.15-18 (Samuel opens the doors, tells Eli, Eli's submission *It is Yahuah*
--      — woven into THREAD 3). All recorded, none silently skipped.

CREATE TEMP VIEW _s340_1sa03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The word of Yahuah was precious — there was no open vision (the famine of hearing)
    ('canon','1-samuel',3,1,'canon','amos',8,11,'free',
      E'*Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD)* (Amos 8:11). *The word of Yahuah (LORD) was precious in those days; there was no open vision* (1 Samuel 3:1) describes the same dearth Amos names a famine — not of bread but *of hearing the words of Yahuah*. Revelation had grown rare and costly; into that silence Yahuah speaks afresh to a child.'),
    ('canon','1-samuel',3,1,'canon','amos',8,12,'free',
      E'*And they shall wander from sea to sea, and from the north even to the east, they shall run to and fro to seek the word of Yahuah (LORD), and shall not find it* (Amos 8:12). The word being *precious* and the open vision absent (1 Samuel 3:1) is the famine in which men *run to and fro to seek the word of Yahuah, and shall not find it*. The preciousness of the word is its scarcity — and the wonder of the chapter is that Yahuah breaks the silence to call Samuel by name.'),
    ('canon','1-samuel',3,1,'apocrypha','ecclesiasticus',46,15,'extras',
      E'*By his faithfulness he was found a true prophet, and by his word he was known to be faithful in vision* (Ecclesiasticus 46:15). When *there was no open vision* (1 Samuel 3:1), the open vision is restored in Samuel — *by his word he was known to be faithful in vision*. The restored witness remembers him as the very man through whom the dearth of seeing was answered: a true prophet, faithful in vision, when vision had failed.'),

    -- THREAD 2 (★★★): Speak, Yahuah; for thy servant heareth — He calleth His own by name
    ('canon','1-samuel',3,4,'canon','john',10,3,'free',
      E'*To him the porter openeth; and the sheep hear his voice: and he calleth his own sheep by name, and leadeth them out* (John 10:3). When *Yahuah (LORD) called Samuel: and he answered, Here am I* (1 Samuel 3:4), the Formed Son is calling His own by name in the night — *he calleth his own sheep by name, and leadeth them out*. The child does not yet know whose voice it is, but it is the Shepherd''s voice, and Samuel answers.'),
    ('canon','1-samuel',3,10,'canon','john',10,27,'free',
      E'*My sheep hear my voice, and I know them, and they follow me* (John 10:27). *And Yahuah (LORD) came, and stood, and called as at other times, Samuel, Samuel. Then Samuel answered, Speak; for thy servant heareth* (1 Samuel 3:10) is this very thing: the sheep hears the Shepherd''s voice and answers. The Formed Son who *came, and stood, and called* is the One who says *My sheep hear my voice... and they follow me* — Samuel hears, and is His for life.'),
    ('canon','1-samuel',3,10,'canon','isaiah',6,8,'free',
      E'*Also I heard the voice of Yahuah (Lord), saying, Whom shall I send, and who will go for us? Then said I, Here am I; send me* (Isaiah 6:8). The servant''s answer Eli teaches Samuel — *Speak; for thy servant heareth* (1 Samuel 3:10) — is the same ready answer of the prophet sent: *Here am I; send me*. Both are called by the voice of Yahuah; both answer *Here am I*; both are made prophets to a people who will not hear.'),

    -- THREAD 3 (★★★): The iniquity of Eli's house shall not be purged with sacrifice nor offering
    ('canon','1-samuel',3,14,'canon','isaiah',22,14,'free',
      E'*And it was revealed in mine ears by Yahuah Tseva''ot (LORD of hosts), Surely this iniquity shall not be purged from you till ye die, saith Adonai Yahuah (the Lord GOD) of hosts* (Isaiah 22:14). The oath against Eli — *the iniquity of Eli''s house shall not be purged with sacrifice nor offering for ever* (1 Samuel 3:14) — is the same sentence Isaiah hears: *this iniquity shall not be purged from you till ye die*. Presumptuous, unrepented sin was never covered by the offerings; the Torah''s sacrifices did not absolve the man who despised them.'),
    ('canon','1-samuel',3,14,'canon','hebrews',10,4,'free',
      E'*For it is not possible that the blood of bulls and of goats should take away sins* (Hebrews 10:4). *The iniquity of Eli''s house shall not be purged with sacrifice nor offering for ever* (1 Samuel 3:14) rests on the truth Hebrews makes plain: *it is not possible that the blood of bulls and of goats should take away sins*. The offerings were a shadow, never the substance; the iniquity of a priesthood that despised them could not be purged by them at all.'),
    ('canon','1-samuel',3,14,'canon','hebrews',10,11,'free',
      E'*And every priest standeth daily ministering and offering oftentimes the same sacrifices, which can never take away sins* (Hebrews 10:11). The judgment that no *sacrifice nor offering* could purge Eli''s house (1 Samuel 3:14) is the very limit of the priestly offerings — they *can never take away sins*. Hophni and Phinehas, who *made themselves vile* (3:13), stood at the altar offering what could not cleanse even themselves.'),
    ('canon','1-samuel',3,14,'canon','1-samuel',2,35,'free',
      E'*And I will raise me up a faithful priest, that shall do according to that which is in mine heart and in my mind: and I will build him a sure house; and he shall walk before mine anointed for ever* (1 Samuel 2:35). The un-purgeable iniquity of Eli''s house (1 Samuel 3:14) is set against the promise already spoken by the man of Elohim: a *faithful priest... that shall do according to... mine heart* whom Yahuah will *build... a sure house*. The failed priesthood is cut off; the faithful priest, walking before the anointed for ever, is raised up in its place.'),

    -- THREAD 4 (★): Let none of his words fall — Samuel established a prophet (the open vision restored)
    ('canon','1-samuel',3,19,'canon','joshua',21,45,'free',
      E'*There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (Joshua 21:45). *Samuel grew, and Yahuah (LORD) was with him, and did let none of his words fall to the ground* (1 Samuel 3:19) is the mark of the true prophet — the same faithfulness of Yahuah''s own word, of which *there failed not ought... all came to pass*. The word that falls to the ground is the false word; not one of Samuel''s did.'),
    ('canon','1-samuel',3,19,'canon','joshua',23,14,'free',
      E'*And, behold, this day I am going the way of all the earth: and ye know in all your hearts and in all your souls, that not one thing hath failed of all the good things which Yahuah Elohaychem (the LORD your God) spake concerning you; all are come to pass unto you, and not one thing hath failed thereof* (Joshua 23:14). That Yahuah *did let none of his words fall to the ground* through Samuel (1 Samuel 3:19) echoes Joshua''s dying testimony: *not one thing hath failed of all the good things... all are come to pass*. The word of Yahuah, spoken through His servants, never falls.'),
    ('canon','1-samuel',3,19,'canon','1-kings',8,56,'free',
      E'*Blessed be Yahuah (LORD), that hath given rest unto his people Yashar''el (Israel), according to all that he promised: there hath not failed one word of all his good promise, which he promised by the hand of Moses his servant* (1 Kings 8:56). *Did let none of his words fall to the ground* (1 Samuel 3:19) is the same unfailing word Solomon blesses at the temple''s dedication: *there hath not failed one word of all his good promise*. Through Samuel as through Moses, the word of Yahuah stands and comes to pass.'),
    ('canon','1-samuel',3,20,'canon','acts',3,24,'free',
      E'*Yea, and all the prophets from Samuel and those that follow after, as many as have spoken, have likewise foretold of these days* (Acts 3:24). *And all Yashar''el (Israel) from Dan even to Beer-sheba knew that Samuel was established to be a prophet of Yahuah (LORD)* (1 Samuel 3:20). Peter names Samuel the head of the prophetic line — *all the prophets from Samuel and those that follow after... have likewise foretold of these days* — so that the child called at Shiloh is the first witness of the whole chorus that testifies of the Messiah.'),
    ('canon','1-samuel',3,20,'apocrypha','ecclesiasticus',46,13,'extras',
      E'*Samuel, the prophet of Yahuah (God), beloved of his Elohim (God), established a kingdom, and anointed princes over his people* (Ecclesiasticus 46:13). That *all Yashar''el (Israel) from Dan even to Beer-sheba knew that Samuel was established to be a prophet of Yahuah (LORD)* (1 Samuel 3:20) is remembered by the restored witness: *Samuel, the prophet of Yahuah... established a kingdom, and anointed princes over his people*. The child called in the night becomes the prophet who anoints Israel''s kings.'),
    ('canon','1-samuel',3,21,'apocrypha','ecclesiasticus',46,15,'extras',
      E'*By his faithfulness he was found a true prophet, and by his word he was known to be faithful in vision* (Ecclesiasticus 46:15). *And Yahuah (LORD) appeared again in Shiloh: for Yahuah (LORD) revealed himself to Samuel in Shiloh by the word of Yahuah (LORD)* (1 Samuel 3:21) — the open vision restored — is what the witness names: *by his word he was known to be faithful in vision*. Where there had been *no open vision* (3:1), Yahuah now reveals Himself by His word through a true and faithful prophet.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-3-the-word-of-yahuah-was-precious-there-was-no-open-vision',
       E'The word of Yahuah was precious — there was no open vision',
       E'The chapter opens on a dearth: *And the child Samuel ministered unto Yahuah (LORD) before Eli. And the word of Yahuah (LORD) was precious in those days; there was no open vision* (1 Samuel 3:1). The word is *precious* because it is scarce — revelation had grown rare and costly, the open vision withdrawn. This is the very famine Amos names, not of bread but of hearing: *Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD)* (Amos 8:11), in which men *shall run to and fro to seek the word of Yahuah, and shall not find it* (Amos 8:12). Into that silence Yahuah breaks His own famine and speaks afresh — to a child. And the restored witness remembers the man through whom the open vision is restored: *by his word he was known to be faithful in vision* (Ecclesiasticus 46:15). The precious, rare word becomes, in Samuel, the open vision again.',
       sv.verse_id, ev.verse_id, 'extras', 36450
  FROM _s340_1sa03_lookup sv, _s340_1sa03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-3-speak-yahuah-for-thy-servant-heareth-he-calleth-his-own-by-name',
       E'Speak, Yahuah; for thy servant heareth — He calleth His own by name',
       E'In the night, while Samuel sleeps near the ark, *Yahuah (LORD) called Samuel: and he answered, Here am I* (1 Samuel 3:4). Three times the child runs to Eli — *Now Samuel did not yet know Yahuah (LORD), neither was the word of Yahuah (LORD) yet revealed unto him* (3:7) — until Eli perceives it is Yahuah and teaches him the answer: *if he call thee, that thou shalt say, Speak, Yahuah (LORD); for thy servant heareth* (3:9). Then comes the fourth call, and it is a Person who calls: *And Yahuah (LORD) came, and stood, and called as at other times, Samuel, Samuel. Then Samuel answered, Speak; for thy servant heareth* (3:10). This is the Formed Son — Yahuah who *came, and stood*, the visible One who speaks — calling His own by name, exactly as He names it forward: *he calleth his own sheep by name, and leadeth them out... and the sheep follow him: for they know his voice* (John 10:3-4); *My sheep hear my voice, and I know them, and they follow me* (John 10:27). And the servant''s ready *Here am I* is the same answer of the prophet sent: *Whom shall I send, and who will go for us? Then said I, Here am I; send me* (Isaiah 6:8). The Shepherd calls a child by name in the dark; the sheep hears, and answers, and is His.',
       sv.verse_id, ev.verse_id, 'free', 36453
  FROM _s340_1sa03_lookup sv, _s340_1sa03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-3-the-iniquity-not-purged-with-sacrifice-nor-offering',
       E'The iniquity of Eli''s house shall not be purged with sacrifice nor offering',
       E'The first word given to the new prophet is judgment: *Behold, I will do a thing in Yashar''el (Israel), at which both the ears of every one that heareth it shall tingle* (1 Samuel 3:11). Yahuah will judge Eli''s house *for ever for the iniquity which he knoweth; because his sons made themselves vile, and he restrained them not* (3:13), and the sentence is sealed by oath: *the iniquity of Eli''s house shall not be purged with sacrifice nor offering for ever* (3:14). This is not the Torah denied but the Torah honoured — presumptuous, unrepented iniquity was never covered by the offerings. Isaiah hears the same verdict: *Surely this iniquity shall not be purged from you till ye die, saith Adonai Yahuah (the Lord GOD) of hosts* (Isaiah 22:14); and Hebrews makes the limit plain — *it is not possible that the blood of bulls and of goats should take away sins* (Hebrews 10:4), *every priest standeth daily... offering oftentimes the same sacrifices, which can never take away sins* (Hebrews 10:11). The very priests who despised the offering stood at the altar offering what could not cleanse even themselves. And the failed house is set against the promise already given: *I will raise me up a faithful priest, that shall do according to that which is in mine heart and in my mind: and I will build him a sure house; and he shall walk before mine anointed for ever* (1 Samuel 2:35). When Eli hears it, he bows: *It is Yahuah (LORD): let him do what seemeth him good* (3:18). The despised priesthood is cut off; the faithful priest is raised up.',
       sv.verse_id, ev.verse_id, 'free', 36456
  FROM _s340_1sa03_lookup sv, _s340_1sa03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-3-let-none-of-his-words-fall-samuel-established-a-prophet',
       E'Let none of his words fall to the ground — Samuel established a prophet',
       E'*And Samuel grew, and Yahuah (LORD) was with him, and did let none of his words fall to the ground* (1 Samuel 3:19). This is the very mark of the true prophet — that every word stands and comes to pass — the same unfailing faithfulness of Yahuah''s own word: *There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (Joshua 21:45); *not one thing hath failed of all the good things... all are come to pass unto you, and not one thing hath failed thereof* (Joshua 23:14); *there hath not failed one word of all his good promise, which he promised by the hand of Moses his servant* (1 Kings 8:56). So *all Yashar''el (Israel) from Dan even to Beer-sheba knew that Samuel was established to be a prophet of Yahuah (LORD)* (3:20) — the whole land, north and south, acknowledges him. He is the head of the prophetic line: *all the prophets from Samuel and those that follow after, as many as have spoken, have likewise foretold of these days* (Acts 3:24) — so the child called at Shiloh is the first witness of the whole chorus that testifies of the Messiah. The restored witness remembers him: *Samuel, the prophet of Yahuah (God)... established a kingdom, and anointed princes over his people* (Ecclesiasticus 46:13), *by his faithfulness he was found a true prophet, and by his word he was known to be faithful in vision* (Ecclesiasticus 46:15). And the chapter closes where it began, the silence broken: *And Yahuah (LORD) appeared again in Shiloh: for Yahuah (LORD) revealed himself to Samuel in Shiloh by the word of Yahuah (LORD)* (3:21). The open vision that was absent in verse 1 is restored in the faithful prophet.',
       sv.verse_id, ev.verse_id, 'extras', 36459
  FROM _s340_1sa03_lookup sv, _s340_1sa03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *a famine in the land... of hearing the words of Yahuah (LORD)* (Amos 8:11) — *the word of Yahuah was precious... no open vision* (1 Samuel 3:1) is that very famine of hearing.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-the-word-of-yahuah-was-precious-there-was-no-open-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they shall run to and fro to seek the word of Yahuah, and shall not find it* (Amos 8:12) — the preciousness of the word (1 Samuel 3:1) is its scarcity.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-the-word-of-yahuah-was-precious-there-was-no-open-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *by his word he was known to be faithful in vision* (Ecclesiasticus 46:15) — where there was *no open vision* (1 Samuel 3:1), the open vision is restored in Samuel.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=46 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-the-word-of-yahuah-was-precious-there-was-no-open-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *he calleth his own sheep by name, and leadeth them out* (John 10:3) — *Yahuah called Samuel: and he answered, Here am I* (1 Samuel 3:4); the Shepherd calls His own by name in the night.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-speak-yahuah-for-thy-servant-heareth-he-calleth-his-own-by-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *My sheep hear my voice, and I know them, and they follow me* (John 10:27) — *Speak; for thy servant heareth* (1 Samuel 3:10); the sheep hears the Formed Son who *came, and stood, and called*.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-speak-yahuah-for-thy-servant-heareth-he-calleth-his-own-by-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Here am I; send me* (Isaiah 6:8) — the servant''s answer *Speak; for thy servant heareth* (1 Samuel 3:10) is the same ready Here-am-I of the prophet sent.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-speak-yahuah-for-thy-servant-heareth-he-calleth-his-own-by-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Surely this iniquity shall not be purged from you till ye die* (Isaiah 22:14) — the same sentence as *the iniquity of Eli''s house shall not be purged with sacrifice nor offering* (1 Samuel 3:14).'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=22 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-the-iniquity-not-purged-with-sacrifice-nor-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *it is not possible that the blood of bulls and of goats should take away sins* (Hebrews 10:4) — no *sacrifice nor offering* could purge Eli''s house (1 Samuel 3:14); the offerings were shadow, not substance.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-the-iniquity-not-purged-with-sacrifice-nor-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *which can never take away sins* (Hebrews 10:11) — the offerings'' limit; the priests who *made themselves vile* (3:13) offered what could not cleanse even themselves (1 Samuel 3:14).'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-the-iniquity-not-purged-with-sacrifice-nor-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will raise me up a faithful priest... and he shall walk before mine anointed for ever* (1 Samuel 2:35) — the failed house (3:14) set against the faithful priest already promised.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-the-iniquity-not-purged-with-sacrifice-nor-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *There failed not ought of any good thing which Yahuah had spoken... all came to pass* (Joshua 21:45) — the unfailing word; *did let none of his words fall to the ground* (1 Samuel 3:19).'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-let-none-of-his-words-fall-samuel-established-a-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *not one thing hath failed of all the good things... all are come to pass* (Joshua 23:14) — the word of Yahuah, spoken through His servants, never falls (1 Samuel 3:19).'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-let-none-of-his-words-fall-samuel-established-a-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *there hath not failed one word of all his good promise* (1 Kings 8:56) — through Samuel as through Moses, the word stands; *none of his words fall to the ground* (1 Samuel 3:19).'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-let-none-of-his-words-fall-samuel-established-a-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *all the prophets from Samuel and those that follow after... have likewise foretold of these days* (Acts 3:24) — *established to be a prophet... from Dan even to Beer-sheba* (1 Samuel 3:20); Samuel heads the prophetic line.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=3 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-let-none-of-his-words-fall-samuel-established-a-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Samuel, the prophet of Yahuah... established a kingdom, and anointed princes over his people* (Ecclesiasticus 46:13) — the child established a prophet (1 Samuel 3:20) becomes the anointer of Israel''s kings.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=46 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-let-none-of-his-words-fall-samuel-established-a-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *by his word he was known to be faithful in vision* (Ecclesiasticus 46:15) — *Yahuah revealed himself to Samuel in Shiloh by the word of Yahuah* (1 Samuel 3:21); the open vision of v.1 restored.'
  FROM cross_reference_threads t
  JOIN _s340_1sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=3 AND sv.verse_number=21
  JOIN _s340_1sa03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=46 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-3-let-none-of-his-words-fall-samuel-established-a-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_4.sql (1 Samuel 4) -----
-- Chapter: 1 Samuel 4 — Yashar'el defeated; the ark carried out as a talisman and CAPTURED;
--   Hophni and Phinehas slain (the 2:34 oracle fulfilled); Eli falls and dies; Ichabod —
--   "The glory is departed from Yashar'el: for the ark of Elohim is taken" (4:21-22).
-- Tag: 1sa04   View: _s340_1sa04_lookup   Sort band: base 36475, step 3 → 36475,36478,36481,36484
--
-- 1 Samuel 4 coverage:
--   v.3-5  (fetch the ark that it may save us / the great shout)
--          NT:     none warranted
--          Extras: none warranted (clean witness avoided)
--          Tanakh: Numbers 14:42-44 (presumed to go up though Yahuah not among them — ark no charm);
--                  Jeremiah 7:4 (Trust ye not in lying words, The temple of Yahuah) — THREAD 2
--   v.10-11 (Yashar'el smitten; the ark of Elohim taken; Hophni & Phinehas slain)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Samuel 2:34 (sign on thy two sons, in one day they shall die) — THREAD 4;
--                  Psalm 78:60-61 / Jeremiah 7:12-14 / Jeremiah 26:6 (He forsook Shiloh) — THREAD 3
--   v.17    (the messenger: thy two sons are dead, the ark is taken)
--          NT/Extras/Tanakh: folded into THREADS 3 & 4
--   v.21-22 (Ichabod — the glory is departed from Yashar'el: for the ark of Elohim is taken)
--          NT:     Romans 9:4 (to whom pertaineth the adoption, and the glory) — THREAD 1
--          Extras: none warranted
--          Tanakh: Ezekiel 10:18-19; Ezekiel 11:23 (the glory of Yahuah departed / went up);
--                  Psalm 78:60-61 (forsook Shiloh, his glory into the enemy's hand) — THREAD 1
--
-- THREADS:
--   1-samuel-4-the-glory-is-departed-the-ark-is-taken (1-samuel; ezekiel; psalms; romans) — free
--        Ichabod: the visible Glory (the Presence of the Formed Son who HAS a Father) withdrawn
--        for covenant-breaking; Ezek 10/11 the same Glory departs the temple by the east gate;
--        Ps 78 forsook Shiloh, glory into the enemy's hand; Rom 9:4 the glory was Israel's.
--   1-samuel-4-the-ark-is-no-talisman-yahuah-is-not-manipulated (1-samuel; numbers; jeremiah) — free
--        Num 14 presumed to battle though He was not among them; Jer 7:4 the temple-as-charm lie.
--   1-samuel-4-he-forsook-the-tabernacle-of-shiloh (1-samuel; psalms; jeremiah) — free
--        Ps 78:60-61 forsook Shiloh; Jer 7:12-14 "go ye now unto my place which was in Shiloh";
--        Jer 26:6 "I will make this house like Shiloh."
--   1-samuel-4-in-one-day-they-shall-die-both-the-oracle-fulfilled (1-samuel) — free
--        The 1 Sam 2:34 sign on Hophni and Phinehas fulfilled to the letter — Yahuah's word stands.

CREATE TEMP VIEW _s340_1sa04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: the glory is departed — the ark is taken
  ('canon','1-samuel',4,21,'canon','ezekiel',10,18,'free',
   E'*Then the glory of Yahuah (LORD) departed from off the threshold of the house, and stood over the cherubims.* (Ezekiel 10:18). Phinehas'' widow names her son I-chabod, *The glory is departed from Yashar''el (Israel)* (1 Samuel 4:21) — and centuries later Ezekiel watches the very same Presence lift off the temple. The Glory is no abstraction: it is the visible Presence of the Formed Son who has a Father, withdrawing Himself when His people break covenant, never manipulated and never bound to a building.'),
  ('canon','1-samuel',4,22,'canon','ezekiel',10,19,'free',
   E'*And the cherubims lifted up their wings, and mounted up from the earth in my sight: when they went out, the wheels also were beside them, and every one stood at the door of the east gate of the LORD''S house; and the glory of the Elohim (God) of Yashar''el (Israel) was over them above.* (Ezekiel 10:19). *The glory is departed from Yashar''el (Israel): for the ark of Elohim (God) is taken* (1 Samuel 4:22) is the first of these departures — the same Glory that rode the cherubim over the ark now seen leaving by the east gate. He does not vanish; He goes, and He will return by that same gate.'),
  ('canon','1-samuel',4,22,'canon','ezekiel',11,23,'free',
   E'*And the glory of Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side of the city.* (Ezekiel 11:23). When the ark was taken at Aphek the cry was *the glory is departed* (1 Samuel 4:22); here the same Glory ascends and stands on the Mount of Olives east of Jerusalem — the Formed Son withdrawing His Presence from a defiled house, the pattern set at Shiloh now repeated at the temple.'),
  ('canon','1-samuel',4,21,'canon','psalms',78,61,'free',
   E'*And delivered his strength into captivity, and his glory into the enemy''s hand.* (Psalm 78:61). The Psalm sings the very day of 1 Samuel 4: when the ark of Elohim was taken, *the glory is departed from Yashar''el (Israel)* (1 Samuel 4:21) — Yahuah''s own strength and glory handed into Philistine hands. He gave it up; the enemy did not seize it.'),
  ('canon','1-samuel',4,22,'canon','romans',9,4,'free',
   E'*Who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises;* (Romans 9:4). *The glory is departed from Yashar''el (Israel)* (1 Samuel 4:22) — the glory that departed at Aphek is the very glory Paul says still *pertaineth* to Israel: covenant, Torah, and the Presence are theirs by promise. Departed for a season for covenant-breaking, never transferred to another people.'),
  -- THREAD 2: the ark is no talisman — Yahuah is not manipulated
  ('canon','1-samuel',4,3,'canon','numbers',14,44,'free',
   E'*But they presumed to go up unto the hill top: nevertheless the ark of the covenant of Yahuah (LORD), and Moses, departed not out of the camp.* (Numbers 14:44). The elders say *Let us fetch the ark... that, when it cometh among us, it may save us* (1 Samuel 4:3) — the same presumption as at Hormah, where Yahuah warned *go not up, for Yahuah (LORD) is not among you* (Numbers 14:42) yet they marched and were smitten. The ark carries no power apart from the One who dwells between the cherubim; carried as a charm it cannot save.'),
  ('canon','1-samuel',4,3,'canon','numbers',14,42,'free',
   E'*Go not up, for Yahuah (LORD) is not among you; that ye be not smitten before your enemies.* (Numbers 14:42). Israel''s plan to *fetch the ark... that it may save us out of the hand of our enemies* (1 Samuel 4:3) repeats the wilderness error exactly: trusting the symbol while the covenant heart is unmended, going to battle as if the box itself, not Yahuah''s favour, decides the field.'),
  ('canon','1-samuel',4,5,'canon','jeremiah',7,4,'free',
   E'*Trust ye not in lying words, saying, The temple of Yahuah (LORD), The temple of Yahuah (LORD), The temple of Yahuah (LORD), are these.* (Jeremiah 7:4). The *great shout, so that the earth rang again* (1 Samuel 4:5) when the ark entered the camp is the same false confidence Jeremiah rebukes — chanting the temple, parading the ark, as though Yahuah were obligated to the relic while the people walk after other gods. The form without the obedience saves no one.'),
  -- THREAD 3: He forsook the tabernacle of Shiloh
  ('canon','1-samuel',4,11,'canon','psalms',78,60,'free',
   E'*So that he forsook the tabernacle of Shiloh, the tent which he placed among men;* (Psalm 78:60). When *the ark of Elohim (God) was taken* (1 Samuel 4:11) the long Shiloh sanctuary fell — and the Psalm names the cause: Yahuah Himself forsook the tent at Shiloh because His people kept not His covenant. The house was His to leave; He was not driven out by the Philistines.'),
  ('canon','1-samuel',4,12,'canon','jeremiah',7,12,'free',
   E'*But go ye now unto my place which was in Shiloh, where I set my name at the first, and see what I did to it for the wickedness of my people Yashar''el (Israel).* (Jeremiah 7:12). The man of Benjamin *came to Shiloh the same day with his clothes rent* (1 Samuel 4:12); generations later Yahuah points Yahudah back to that ruin as a standing warning — what He did to Shiloh for wickedness He will do to the temple, for the Presence is bound to obedience, not to a site.'),
  ('canon','1-samuel',4,11,'canon','jeremiah',7,14,'free',
   E'*Therefore will I do unto this house, which is called by my name, wherein ye trust, and unto the place which I gave to you and to your fathers, as I have done to Shiloh.* (Jeremiah 7:14). The fall of Shiloh, sealed when *the ark of Elohim (God) was taken* (1 Samuel 4:11), becomes the very measure of judgment on Jerusalem — *as I have done to Shiloh.* No name on a house, no ark within it, shields a covenant-breaking people.'),
  ('canon','1-samuel',4,11,'canon','jeremiah',26,6,'free',
   E'*Then will I make this house like Shiloh, and will make this city a curse to all the nations of the earth.* (Jeremiah 26:6). The catastrophe of 1 Samuel 4 — *the ark of Elohim (God) was taken* (1 Samuel 4:11) — became proverbial: to be *like Shiloh* is to be the place Yahuah abandoned. The threat so enraged the priests they sought Jeremiah''s life, yet the precedent stood as written.'),
  -- THREAD 4: in one day they shall die both — the 2:34 oracle fulfilled
  ('canon','1-samuel',4,11,'canon','1-samuel',2,34,'free',
   E'*And this shall be a sign unto thee, that shall come upon thy two sons, on Hophni and Phinehas; in one day they shall die both of them.* (1 Samuel 2:34). *The two sons of Eli, Hophni and Phinehas, were slain* (1 Samuel 4:11) on the very day the ark fell — the man of Elohim''s sign to Eli kept to the letter. Yahuah''s word against a corrupt priesthood does not fail.'),
  ('canon','1-samuel',4,17,'canon','1-samuel',2,34,'free',
   E'*And this shall be a sign unto thee, that shall come upon thy two sons, on Hophni and Phinehas; in one day they shall die both of them.* (1 Samuel 2:34). The messenger''s report — *thy two sons also, Hophni and Phinehas, are dead, and the ark of Elohim (God) is taken* (1 Samuel 4:17) — announces the oracle fulfilled exactly: both sons, in one day, as the man of Elohim foretold.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-4-the-glory-is-departed-the-ark-is-taken',
  E'The glory is departed — the ark is taken',
  E'Phinehas'' widow, dying in childbirth, names her son and her age: *And she named the child I-chabod, saying, The glory is departed from Yashar''el (Israel): because the ark of Elohim (God) was taken* (1 Samuel 4:21); *The glory is departed from Yashar''el (Israel): for the ark of Elohim (God) is taken* (1 Samuel 4:22). The Glory is the visible Presence of the Formed Son — the One enthroned *between the cherubims* over the ark — who has a Father and is never co-equal collapse nor a created angel. He does not lose a battle; He withdraws. The Psalm sings the very day: *And delivered his strength into captivity, and his glory into the enemy''s hand* (Psalm 78:61) — handed over, not seized. Ezekiel watches the same departure at the temple: *Then the glory of Yahuah (LORD) departed from off the threshold of the house* (Ezekiel 10:18), the cherubim mounting up *and every one stood at the door of the east gate of the LORD''S house* (Ezekiel 10:19), until *the glory of Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side of the city* (Ezekiel 11:23). The pattern set at Shiloh is repeated at Jerusalem: the Presence leaves a defiled house by the east, and will return by it. And the glory was never transferred to a new people — Paul still binds it to Israel: *Who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law* (Romans 9:4). Departed for a season for covenant-breaking; theirs still by promise.',
  sv.verse_id, ev.verse_id, 'free', 36475
  FROM _s340_1sa04_lookup sv, _s340_1sa04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=4 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-4-the-ark-is-no-talisman-yahuah-is-not-manipulated',
  E'The ark is no talisman — Yahuah is not manipulated',
  E'Smitten before the Philistines, the elders reach for a charm rather than repentance: *Let us fetch the ark of the covenant of Yahuah (LORD) out of Shiloh unto us, that, when it cometh among us, it may save us out of the hand of our enemies* (1 Samuel 4:3). They greet it with *a great shout, so that the earth rang again* (1 Samuel 4:5) — confidence in the box, not the One who dwells between the cherubim. It is the wilderness error exactly: *Go not up, for Yahuah (LORD) is not among you; that ye be not smitten before your enemies* (Numbers 14:42), yet *they presumed to go up unto the hill top: nevertheless the ark of the covenant of Yahuah (LORD), and Moses, departed not out of the camp* (Numbers 14:44) — and they were smitten to Hormah. The same false trust Jeremiah will indict centuries later: *Trust ye not in lying words, saying, The temple of Yahuah (LORD), The temple of Yahuah (LORD), The temple of Yahuah (LORD), are these* (Jeremiah 7:4). The relic, the temple, the shout — none of them obligate Yahuah. He is not manipulated by His own symbols; He is honoured by obedience or He withdraws. The ark went out and was taken, because the heart had not turned.',
  sv.verse_id, ev.verse_id, 'free', 36478
  FROM _s340_1sa04_lookup sv, _s340_1sa04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-4-he-forsook-the-tabernacle-of-shiloh',
  E'He forsook the tabernacle of Shiloh',
  E'When *the ark of Elohim (God) was taken* (1 Samuel 4:11) and the runner *came to Shiloh the same day with his clothes rent* (1 Samuel 4:12), the long sanctuary at Shiloh fell. The Psalm names the true cause — not Philistine strength but Yahuah''s own departure: *So that he forsook the tabernacle of Shiloh, the tent which he placed among men* (Psalm 78:60). He was not driven out; He left a covenant-breaking people. And He turned that ruin into a permanent witness. To Yahudah, trusting in their temple, Jeremiah is sent: *But go ye now unto my place which was in Shiloh, where I set my name at the first, and see what I did to it for the wickedness of my people Yashar''el (Israel)* (Jeremiah 7:12) — *Therefore will I do unto this house, which is called by my name, wherein ye trust... as I have done to Shiloh* (Jeremiah 7:14). The word so enraged the priests they sought the prophet''s life when he repeated it: *Then will I make this house like Shiloh, and will make this city a curse to all the nations of the earth* (Jeremiah 26:6). The Name on a house, the ark within it, shields no one whose heart has departed; the Presence is bound to obedience, never to a site.',
  sv.verse_id, ev.verse_id, 'free', 36481
  FROM _s340_1sa04_lookup sv, _s340_1sa04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-4-in-one-day-they-shall-die-both-the-oracle-fulfilled',
  E'In one day they shall die both — the oracle fulfilled',
  E'The man of Elohim had warned Eli of a sign against his corrupt sons: *And this shall be a sign unto thee, that shall come upon thy two sons, on Hophni and Phinehas; in one day they shall die both of them* (1 Samuel 2:34). At Aphek it lands to the letter: *And the ark of Elohim (God) was taken; and the two sons of Eli, Hophni and Phinehas, were slain* (1 Samuel 4:11), and the messenger confirms it — *thy two sons also, Hophni and Phinehas, are dead, and the ark of Elohim (God) is taken* (1 Samuel 4:17). Both sons, in one day, exactly as foretold. Yahuah''s word against a priesthood that *kick ye at my sacrifice* and made themselves *fat with the chiefest of all the offerings* does not fall to the ground. The judgment was spoken before it was seen, and the seeing matched the speaking.',
  sv.verse_id, ev.verse_id, 'free', 36484
  FROM _s340_1sa04_lookup sv, _s340_1sa04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Then the glory of Yahuah (LORD) departed from off the threshold of the house* (Ezekiel 10:18) — the same Presence that left Shiloh leaves the temple.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-the-glory-is-departed-the-ark-is-taken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...every one stood at the door of the east gate of the LORD''S house* (Ezekiel 10:19) — the Glory departs by the east, the way it will return.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-the-glory-is-departed-the-ark-is-taken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...and stood upon the mountain which is on the east side of the city* (Ezekiel 11:23) — the Formed Son withdraws to Olivet, the pattern of Shiloh repeated.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=11 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-the-glory-is-departed-the-ark-is-taken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*...and his glory into the enemy''s hand* (Psalm 78:61) — the Psalm sings the very day of Aphek; the Glory was handed over, not seized.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=61
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-the-glory-is-departed-the-ark-is-taken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*...to whom pertaineth the adoption, and the glory* (Romans 9:4) — the departed glory still belongs to Israel by promise, never transferred away.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-the-glory-is-departed-the-ark-is-taken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Go not up, for Yahuah (LORD) is not among you...* (Numbers 14:42) — the wilderness warning the elders forget when they fetch the ark.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-the-ark-is-no-talisman-yahuah-is-not-manipulated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*But they presumed to go up... nevertheless the ark... departed not out of the camp* (Numbers 14:44) — carrying the ark as a charm cannot save the disobedient.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-the-ark-is-no-talisman-yahuah-is-not-manipulated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Trust ye not in lying words... The temple of Yahuah...* (Jeremiah 7:4) — the same false confidence as the great shout over the ark.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-the-ark-is-no-talisman-yahuah-is-not-manipulated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*So that he forsook the tabernacle of Shiloh* (Psalm 78:60) — Yahuah left; the Philistines did not drive Him out.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=60
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-he-forsook-the-tabernacle-of-shiloh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*But go ye now unto my place which was in Shiloh... and see what I did to it* (Jeremiah 7:12) — the ruin made a standing warning to Yahudah.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-he-forsook-the-tabernacle-of-shiloh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...as I have done to Shiloh* (Jeremiah 7:14) — Shiloh''s fall becomes the measure of judgment on the temple.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-he-forsook-the-tabernacle-of-shiloh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Then will I make this house like Shiloh...* (Jeremiah 26:6) — to be "like Shiloh" is to be the place Yahuah abandoned.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=26 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-he-forsook-the-tabernacle-of-shiloh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...in one day they shall die both of them* (1 Samuel 2:34) — the sign given to Eli, fulfilled when the ark fell and both sons were slain.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-in-one-day-they-shall-die-both-the-oracle-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...thy two sons... are dead, and the ark of Elohim (God) is taken* (1 Samuel 2:34 echoed in 4:17) — the messenger confirms the oracle to the letter.'
  FROM cross_reference_threads t
  JOIN _s340_1sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s340_1sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-4-in-one-day-they-shall-die-both-the-oracle-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_5.sql (1 Samuel 5) -----
-- Chapter: 1 Samuel 5 — the ark of Elohim (God) carried captive into the house of Dagon at Ashdod,
-- and the Presence of the Formed vindicating itself with no hand lifted by Yashar'el (Israel):
-- *Dagon was fallen upon his face to the earth before the ark of Yahuah (LORD)* (5:3); set up again,
-- he falls a second time and *the head of Dagon and both the palms of his hands were cut off upon the
-- threshold; only the stump of Dagon was left to him* (5:4) — the idol cannot stand before the ark of
-- the living God. Then *the hand of Yahuah (LORD) was heavy upon them of Ashdod* (5:6), against the
-- city, then Gath, then Ekron, with tumours and a deadly destruction, *the cry of the city went up to
-- heaven* (5:12). The false god of the nations falls before the true; the captive ark is no captive.
-- Tag: 1sa05   Temp view: _s340_1sa05_lookup
-- Sort band: base 36500, step 3 -> threads at 36500, 36503, 36506 (3 threads)
-- Source of EVERY row: 'canon','1-samuel',5,v
--
-- 1 Samuel 5 coverage:
--   v.1 (the Philistines took the ark from Eben-ezer unto Ashdod) — preface, woven into THREAD 1 prose
--        NT: none warranted   Extras: none warranted   Tanakh: held in prose (the captivity-setting)
--   ★★★ v.2-5 (the ark set by Dagon; Dagon fallen on his face before the ark, twice; head and hands
--          cut off on the threshold)
--        NT:     none warranted (the Tanakh + prophets carry the idol-falls-before-the-Presence weave)
--        Extras: none warranted (clean Tanakh witnesses preferred)
--        Tanakh: ★★★ Isaiah 46:1-2 (Bel boweth down, Nebo stoopeth... themselves are gone into captivity),
--                ★★ Psalm 115:4-8 (their idols... have hands, but they handle not... so is every one that
--                trusteth in them), ★★ Psalm 97:7 (Confounded be all they that serve graven images...
--                worship him, all ye gods) — THREAD 1
--   ★★★ v.6-12 (the hand of Yahuah heavy on Ashdod, Gath, Ekron; emerods; the cry went up to heaven)
--        NT:     none warranted (the plague-on-the-gods weave is Torah + Psalms)
--        Extras: none warranted
--        Tanakh: ★★★ Exodus 12:12 (against all the gods of Egypt I will execute judgment: I am Yahuah),
--                ★★ Exodus 8:19 (This is the finger of Elohim (God)), ★★ Psalm 96:4-5 (he is to be feared
--                above all gods. For all the gods of the nations are idols) — THREAD 2
--   ★★ v.7 / v.11 (the ark of the Elohim of Yashar'el shall not abide with us... let it go again to his
--          own place; his hand is sore upon us, and upon Dagon our god)
--        NT:     ★★ 1 Corinthians 10:20-21 (the things which the Gentiles sacrifice, they sacrifice to
--                devils... ye cannot be partakers of Yahuah's table, and of the table of devils)
--        Extras: none warranted
--        Tanakh: ★★ Psalm 96:10 (Say among the heathen that Yahuah (LORD) reigneth), ★ Psalm 115:1 (Not
--                unto us, O Yahuah (LORD)... but unto thy name give glory) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. 1-samuel-5-dagon-fallen-on-his-face-before-the-ark — Tanakh (Isaiah 46, Psalm 115, Psalm 97) [free]
--      (★★★ the idol cannot stand before the Presence of the Formed; head and hands broken on the threshold)
--   2. 1-samuel-5-the-hand-of-yahuah-against-the-gods-of-the-nations — Tanakh (Exodus 12, Exodus 8, Psalm 96) [free]
--      (★★★ the heavy hand / the finger of God, against the gods of the nations as against the gods of Egypt)
--   3. 1-samuel-5-the-captive-ark-vindicates-itself-among-the-heathen — NT (1 Corinthians 10) + Tanakh (Psalm 96, Psalm 115) [free]
--      (★★ even in captivity the Presence needs no defence; the nations confess his hand; the table of devils cannot stand)
--
-- Framing notes:
--   ★★★ DAGON FALLS BEFORE THE ARK (THREAD 1): the Formed-Son's Presence over the mercy-seat needs no
--      army to vindicate it. *Dagon was fallen upon his face to the earth before the ark of Yahuah (LORD)*
--      (5:3); propped up again, he falls and is dismembered — *the head of Dagon and both the palms of his
--      hands were cut off upon the threshold* (5:4). Isaiah sees the same collapse of the nations' gods:
--      *Bel boweth down, Nebo stoopeth... themselves are gone into captivity* (Isaiah 46:1-2). The Psalm
--      names the idol's helplessness: *They have hands, but they handle not* (Psalm 115:7) — Dagon's hands
--      are cut off, the dead thing that cannot handle, cannot save. And the verdict: *Confounded be all
--      they that serve graven images... worship him, all ye gods* (Psalm 97:7).
--   ★★★ THE HAND AGAINST THE GODS OF THE NATIONS (THREAD 2): *the hand of Yahuah (LORD) was heavy upon
--      them of Ashdod* (5:6), city by city. This is the same judgment fallen on Egypt: *against all the
--      gods of Egypt I will execute judgment: I am Yahuah (LORD)* (Exodus 12:12); the very *finger of
--      Elohim (God)* the magicians confessed (Exodus 8:19). The Psalm states the principle: *he is to be
--      feared above all gods. For all the gods of the nations are idols* (Psalm 96:4-5).
--   ★★ THE CAPTIVE ARK VINDICATES ITSELF (THREAD 3): the Philistines themselves confess it — *his hand is
--      sore upon us, and upon Dagon our god* (5:7); *let it go again to his own place, that it slay us not*
--      (5:11). The nations preach Yahuah's reign against their will: *Say among the heathen that Yahuah
--      (LORD) reigneth* (Psalm 96:10). Paul names what the idol really is — *the things which the Gentiles
--      sacrifice, they sacrifice to devils... ye cannot be partakers of Yahuah's (Lord's) table, and of
--      the table of devils* (1 Corinthians 10:20-21): Dagon's table and the ark cannot share a house. And
--      the glory is the Name's alone: *Not unto us, O Yahuah (LORD)... but unto thy name give glory* (Psalm
--      115:1).
--   VERSES WITH NO SEPARATE ADD: v.1 (the ark brought to Ashdod — preface to THREAD 1); v.5 (the priests
--      tread not on the threshold — held in THREAD 1 prose); v.8-10 (the ark carried to Gath, then Ekron —
--      the spreading plague, held in THREAD 2 prose); v.12 (the cry went up to heaven — held in THREAD 2/3
--      prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s340_1sa05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Dagon fallen on his face before the ark
    ('canon','1-samuel',5,3,'canon','isaiah',46,1,'free',
      E'*Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast* (Isaiah 46:1). What Ashdod awakes to see — *Dagon was fallen upon his face to the earth before the ark of Yahuah (LORD)* (1 Samuel 5:3) — Isaiah sees of the gods of Babylon: Bel and Nebo *bow down* and *stoop*. The idol that cannot stand before the Presence is the whole testimony: the gods of the nations fall before the One they were set against.'),
    ('canon','1-samuel',5,4,'canon','isaiah',46,2,'free',
      E'*They stoop, they bow down together; they could not deliver the burden, but themselves are gone into captivity* (Isaiah 46:2). Dagon, set up a second time, is found with *the head of Dagon and both the palms of his hands... cut off upon the threshold; only the stump of Dagon was left to him* (1 Samuel 5:4) — the god *could not deliver* even itself, and the carried thing *gone into captivity*. The ark men thought they had captured is no captive; the captor''s god is the one broken and bound.'),
    ('canon','1-samuel',5,4,'canon','psalms',115,7,'free',
      E'*They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat* (Psalm 115:7). The Psalm''s mockery of the idol made of *silver and gold, the work of men''s hands* (Psalm 115:4) is enacted on the threshold: *both the palms of his hands were cut off* (1 Samuel 5:4). The god with hands that *handle not* loses the very hands; the dead thing that cannot save cannot even hold itself up before the ark.'),
    ('canon','1-samuel',5,3,'canon','psalms',115,8,'free',
      E'*They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). When *Dagon was fallen upon his face to the earth before the ark of Yahuah (LORD)* (1 Samuel 5:3), the Philistines find their trust face-down in the dust. The idol bows where its makers should have bowed; those who *trust in them* are *like unto them* — fallen, helpless, broken on the threshold.'),
    ('canon','1-samuel',5,4,'canon','psalms',97,7,'free',
      E'*Confounded be all they that serve graven images, that boast themselves of idols: worship him, all ye gods* (Psalm 97:7). The Psalm''s command is fulfilled in the temple of Dagon: the *graven image* is confounded, fallen, dismembered before the ark — *the head of Dagon and both the palms of his hands were cut off* (1 Samuel 5:4). Even the false gods are summoned to *worship him*; Dagon, face to the ground, gives the forced homage every idol owes the living God.')
,
    -- THREAD 2 (★★★): The hand of Yahuah heavy, against the gods of the nations
    ('canon','1-samuel',5,6,'canon','exodus',12,12,'free',
      E'*For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD)* (Exodus 12:12). The same hand that judged *all the gods of Egypt* now lies heavy on the cities of the Philistines: *the hand of Yahuah (LORD) was heavy upon them of Ashdod, and he destroyed them* (1 Samuel 5:6). Captivity changes nothing — the God of the ark executes judgment against the gods of the nations wherever His Presence is brought.'),
    ('canon','1-samuel',5,6,'canon','exodus',8,19,'free',
      E'*Then the magicians said unto Pharaoh, This is the finger of Elohim (God): and Pharaoh''s heart was hardened* (Exodus 8:19). What Egypt''s own magicians confessed under the plague, the Philistines confess under theirs — *the hand of Yahuah (LORD) was heavy upon them* (1 Samuel 5:6). The finger of Elohim that broke Egypt is the heavy hand that breaks Ashdod, Gath, and Ekron city by city; the nations'' wise men name the power they cannot match.'),
    ('canon','1-samuel',5,7,'canon','psalms',96,5,'free',
      E'*For all the gods of the nations are idols: but Yahuah (LORD) made the heavens* (Psalm 96:5). When the men of Ashdod say *his hand is sore upon us, and upon Dagon our god* (1 Samuel 5:7), they admit the very thing the Psalm declares: *Dagon our god* is an idol, one of *the gods of the nations*, while the One in the ark *made the heavens*. The Maker''s hand is sore upon the made thing.'),
    ('canon','1-samuel',5,9,'canon','psalms',96,4,'free',
      E'*For Yahuah (LORD) is great, and greatly to be praised: he is to be feared above all gods* (Psalm 96:4). As the ark moves to Gath, *the hand of Yahuah (LORD) was against the city with a very great destruction* (1 Samuel 5:9) — the One *to be feared above all gods* makes Himself feared above Dagon in every city the ark enters. The plague city by city is the fear of Yahuah falling on the nations.')
,
    -- THREAD 3 (★★): The captive ark vindicates itself among the heathen
    ('canon','1-samuel',5,7,'canon','psalms',96,10,'free',
      E'*Say among the heathen that Yahuah (LORD) reigneth: the world also shall be established that it shall not be moved: he shall judge the people righteously* (Psalm 96:10). The Philistines themselves are made to *say among the heathen* the reign of Yahuah — *The ark of the Elohim (God) of Yashar''el (Israel) shall not abide with us: for his hand is sore upon us* (1 Samuel 5:7). The nations preach His reign against their will; the captive ark proclaims that Yahuah reigns even in the house of His enemies.'),
    ('canon','1-samuel',5,11,'canon','1-corinthians',10,21,'free',
      E'*Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Corinthians 10:21). Dagon''s house cannot hold both the idol and the ark — the Philistines learn it and beg, *Send away the ark of the Elohim (God) of Yashar''el (Israel)... that it slay us not* (1 Samuel 5:11). Paul names what stands behind the idol: the table of devils (10:20) cannot abide the table of Yahuah; the two presences cannot share one threshold.'),
    ('canon','1-samuel',5,11,'canon','psalms',115,1,'free',
      E'*Not unto us, O Yahuah (LORD), not unto us, but unto thy name give glory, for thy mercy, and for thy truth''s sake* (Psalm 115:1). No man of Yashar''el (Israel) lifts a hand in this chapter — the glory of the ark''s vindication is the Name''s alone. When *there was a deadly destruction throughout all the city; the hand of Elohim (God) was very heavy there* (1 Samuel 5:11), the verdict belongs *not unto us, but unto thy name*: Yahuah defends His own honour, needing no army to do it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-5-dagon-fallen-on-his-face-before-the-ark',
       E'Dagon fallen on his face before the ark — the idol cannot stand before the Presence',
       E'The ark of the Formed-Son''s Presence is carried captive into the temple of the Philistine god, and the Presence vindicates itself with no hand lifted by Yashar''el (Israel): *And when they of Ashdod arose early on the morrow, behold, Dagon was fallen upon his face to the earth before the ark of Yahuah (LORD). And they took Dagon, and set him in his place again* (1 Samuel 5:3). Propped back up, he falls a second time and is broken: *behold, Dagon was fallen upon his face to the ground before the ark of Yahuah (LORD); and the head of Dagon and both the palms of his hands were cut off upon the threshold; only the stump of Dagon was left to him* (5:4). Isaiah sees the same collapse of the nations'' gods before Yahuah: *Bel boweth down, Nebo stoopeth... They stoop, they bow down together; they could not deliver the burden, but themselves are gone into captivity* (Isaiah 46:1-2) — the carried idol cannot deliver even itself. The Psalm has already mocked the dead thing: the idols are *the work of men''s hands... They have hands, but they handle not* (Psalm 115:4,7) — and Dagon''s hands are *cut off upon the threshold*, the god who cannot handle losing the very hands; *they that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8), the trust now face-down in the dust. And the great command is enacted: *Confounded be all they that serve graven images, that boast themselves of idols: worship him, all ye gods* (Psalm 97:7) — even the false god, prostrate before the ark, renders the homage every idol owes the living God. The threshold where the head and hands lay broken became a holy line the priests of Dagon would not tread *unto this day* (5:5): a monument, in the heart of the enemy''s temple, that nothing can stand before the Presence.',
       sv.verse_id, ev.verse_id, 'free', 36500
  FROM _s340_1sa05_lookup sv, _s340_1sa05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-5-the-hand-of-yahuah-against-the-gods-of-the-nations',
       E'The hand of Yahuah heavy against the gods of the nations — as upon Egypt, so upon Philistia',
       E'After Dagon falls, the judgment spreads to the people who served him: *But the hand of Yahuah (LORD) was heavy upon them of Ashdod, and he destroyed them, and smote them with emerods, even Ashdod and the coasts thereof* (1 Samuel 5:6); then Gath — *the hand of Yahuah (LORD) was against the city with a very great destruction: and he smote the men of the city, both small and great* (5:9); then Ekron, with *a deadly destruction throughout all the city; the hand of Elohim (God) was very heavy there* (5:11). This is the same hand that fell on Egypt''s gods: *against all the gods of Egypt I will execute judgment: I am Yahuah (LORD)* (Exodus 12:12). It is the *finger of Elohim (God)* that even Pharaoh''s magicians confessed when their enchantments failed (Exodus 8:19) — and now Ashdod''s men confess it the same way: *his hand is sore upon us, and upon Dagon our god* (5:7). The Psalm states the principle the plague enacts: *Yahuah (LORD) is great, and greatly to be praised: he is to be feared above all gods. For all the gods of the nations are idols: but Yahuah (LORD) made the heavens* (Psalm 96:4-5). The Maker''s heavy hand falls on the made thing and on those who trust it; the God of the ark executes judgment against the gods of the nations wherever His Presence is carried, captive or not.',
       sv.verse_id, ev.verse_id, 'free', 36503
  FROM _s340_1sa05_lookup sv, _s340_1sa05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-5-the-captive-ark-vindicates-itself-among-the-heathen',
       E'The captive ark vindicates itself among the heathen — the table of devils cannot stand',
       E'No man of Yashar''el (Israel) lifts a hand in this whole chapter; the ark, alone in the enemy''s land, makes the nations confess Yahuah against their will. *And when the men of Ashdod saw that it was so, they said, The ark of the Elohim (God) of Yashar''el (Israel) shall not abide with us: for his hand is sore upon us, and upon Dagon our god* (1 Samuel 5:7); and at Ekron, *Send away the ark of the Elohim (God) of Yashar''el (Israel), and let it go again to his own place, that it slay us not, and our people* (5:11). The heathen are made to *Say among the heathen that Yahuah (LORD) reigneth* (Psalm 96:10) — the captive ark proclaims His reign in the house of His enemies. Paul names what stood behind the fallen idol: *the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God)... Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Corinthians 10:20-21). Dagon''s house cannot hold both presences; the table of devils cannot share one threshold with the ark of Yahuah. And the glory of the vindication belongs to no army and to no man — *Not unto us, O Yahuah (LORD), not unto us, but unto thy name give glory, for thy mercy, and for thy truth''s sake* (Psalm 115:1). Yahuah defends His own honour, and *the cry of the city went up to heaven* (5:12) — the enemy''s own confession that the God they thought they had captured reigns.',
       sv.verse_id, ev.verse_id, 'free', 36506
  FROM _s340_1sa05_lookup sv, _s340_1sa05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Bel boweth down, Nebo stoopeth... they are a burden to the weary beast* (Isaiah 46:1) — what Ashdod sees of Dagon *fallen upon his face* (1 Samuel 5:3), Isaiah sees of Babylon''s gods: the idols bow before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-dagon-fallen-on-his-face-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *they could not deliver the burden, but themselves are gone into captivity* (Isaiah 46:2) — Dagon, *head and... palms of his hands... cut off upon the threshold* (1 Samuel 5:4), cannot deliver even himself; the captor''s god is the captive.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-dagon-fallen-on-his-face-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *They have hands, but they handle not* (Psalm 115:7) — the god whose hands *handle not* loses the very hands: *both the palms of his hands were cut off* (1 Samuel 5:4); the dead idol cannot even hold itself up.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-dagon-fallen-on-his-face-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8) — *Dagon... fallen upon his face to the earth* (1 Samuel 5:3) leaves his trusters face-down; the idol bows where its makers should have bowed.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-dagon-fallen-on-his-face-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Confounded be all they that serve graven images... worship him, all ye gods* (Psalm 97:7) — the command enacted in Dagon''s temple: the *graven image* confounded and dismembered (1 Samuel 5:4), the false god forced to its face before the ark.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=97 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-dagon-fallen-on-his-face-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *against all the gods of Egypt I will execute judgment: I am Yahuah (LORD)* (Exodus 12:12) — the same hand that judged Egypt''s gods now lies *heavy upon them of Ashdod* (1 Samuel 5:6); captivity changes nothing.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-the-hand-of-yahuah-against-the-gods-of-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *This is the finger of Elohim (God)* (Exodus 8:19) — Egypt''s magicians confessed the power under the plague; the Philistines confess the same heavy hand of Yahuah upon their cities (1 Samuel 5:6).'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-the-hand-of-yahuah-against-the-gods-of-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *all the gods of the nations are idols: but Yahuah (LORD) made the heavens* (Psalm 96:5) — Ashdod''s own confession, *his hand is sore upon us, and upon Dagon our god* (1 Samuel 5:7), admits Dagon an idol; the Maker''s hand is sore upon the made thing.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-the-hand-of-yahuah-against-the-gods-of-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he is to be feared above all gods* (Psalm 96:4) — as the ark moves to Gath, *the hand of Yahuah (LORD) was against the city with a very great destruction* (1 Samuel 5:9): the fear of Yahuah falling on the nations city by city.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=9
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-the-hand-of-yahuah-against-the-gods-of-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Say among the heathen that Yahuah (LORD) reigneth* (Psalm 96:10) — the Philistines are made to say it: *The ark of the Elohim (God) of Yashar''el (Israel) shall not abide with us: for his hand is sore upon us* (1 Samuel 5:7); the captive ark proclaims His reign in the enemy''s house.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-the-captive-ark-vindicates-itself-among-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Corinthians 10:21) — Dagon''s house cannot hold both: *Send away the ark... that it slay us not* (1 Samuel 5:11); the table of devils cannot share one threshold with the ark.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-the-captive-ark-vindicates-itself-among-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Not unto us, O Yahuah (LORD)... but unto thy name give glory* (Psalm 115:1) — no man of Yashar''el lifts a hand; when *the hand of Elohim (God) was very heavy there* (1 Samuel 5:11), the glory belongs to the Name alone.'
  FROM cross_reference_threads t
  JOIN _s340_1sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s340_1sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-5-the-captive-ark-vindicates-itself-among-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_6.sql (1 Samuel 6) -----
--
-- Book/chapter: 1 Samuel 6  (the Philistines return the ark on a new cart drawn by two
--   milch kine with the golden trespass offering; the kine go straight to Beth-shemesh lowing,
--   Yahuah vindicating Himself; the men of Beth-shemesh smitten for looking INTO the ark;
--   "Who is able to stand before this holy Yahuah Elohim?")
-- Tag: 1sa06    View: _s340_1sa06_lookup    Sort band: 36525 step 3 (36525,36528,36531,36534,36537)
--
-- 1 Samuel 6 coverage checklist:
--   v.3-5,8,17 (trespass offering returns glory to Yahuah):
--        NT:     none warranted (covered by Lev typology; NT atonement woven elsewhere)
--        Extras: none warranted
--        Tanakh: Leviticus 5 (the trespass/guilt offering — asham) — THREAD 1
--   v.6 (harden not your hearts as the Egyptians and Pharaoh):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exodus 8:15, Exodus 8:32 (Pharaoh hardened his heart) — THREAD 2
--   v.7,8,11 (new cart, two milch kine bear the ark — irregular handling):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Samuel 6:3,6,7 (Uzzah's new cart and breach); 1 Chronicles 13:7,9,10;
--                Numbers 4:15 (the Kohathites BEAR it, not touch) — THREAD 3
--   v.13-15 (Beth-shemesh rejoice, burnt offerings, Levites take down the ark):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: folded into THREAD 3 / THREAD 4 (the reverence frame)
--   v.19 (smitten for looking INTO the ark of Yahuah):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 4:15,20 (touch not / see not the holy things, lest they die);
--                Exodus 19:21 (lest they break through to gaze and perish) — THREAD 4
--   v.20 (Who is able to stand before this holy Yahuah Elohim?):
--        NT:     Hebrews 12:28-29 (serve with reverence; our Elohim is a consuming fire)
--        Extras: none warranted
--        Tanakh: Psalm 24:3 (who shall stand in his holy place?); Psalm 130:3 (who shall stand?) — THREAD 5
--   v.21 (sent to Kirjath-jearim to fetch up the ark): folded into THREAD 3 frame.
--
-- Threads (slug — target libraries — framing):
--   1. 1-samuel-6-the-trespass-offering-that-returns-glory-to-yahuah
--        [Tanakh: Leviticus] — the Philistines, healed only by an asham (trespass/guilt
--        offering), instinctively return GLORY to the Elohim of Yashar'el; Torah's own
--        guilt-offering law (Lev 5) is what they grope toward. Torah affirmed, not abolished.
--   2. 1-samuel-6-harden-not-your-hearts-as-pharaoh
--        [Tanakh: Exodus] — even Philistine diviners cite the lesson of Pharaoh; the hardened
--        heart that fights Yahuah and is broken anyway.
--   3. 1-samuel-6-the-new-cart-and-the-ark-of-his-presence
--        [Tanakh: 2 Samuel, 1 Chronicles, Numbers] — the new-cart shortcut returns again under
--        David and kills Uzzah; Torah set the ark to be BORNE on the shoulders of the Kohathites,
--        never carted. The Presence is not handled on man's terms.
--   4. 1-samuel-6-they-looked-into-the-ark-and-were-smitten
--        [Tanakh: Numbers, Exodus] — the holiness of the Presence; the Kohathites forbidden to
--        touch or even SEE the holy things uncovered (Num 4); the bounds at Sinai lest any gaze
--        and perish (Exod 19). The Formed Glory between the cherubim is not common.
--   5. 1-samuel-6-who-is-able-to-stand-before-this-holy-yahuah-elohim
--        [Tanakh: Psalms; NT: Hebrews] — the cry of Beth-shemesh joins Psalm 24's "who shall
--        stand in his holy place?" and Psalm 130's "who shall stand?"; answered forward in
--        Hebrews 12 — serve with reverence, for our Elohim is a consuming fire. The Formed Son
--        who dwelt between the cherubim is Yahuah and has a Father.
--
-- Contested/load-bearing framing notes:
--   * Trespass offering (asham): the Philistines grope toward Torah's own remedy (Lev 5);
--     read as Torah AFFIRMED — guilt requires restitution + atonement — not "old-covenant ritual."
--   * v.19 slaughter: NOT ethnic/arbitrary cruelty but the consistent holiness of the Presence
--     already legislated in Torah (Num 4); victims-not-enemies frame — the men were warned by Torah.
--   * Christology: the ark-Glory "that dwelleth between the cherubims" is the Formed Son, the
--     visible Presence who is Yahuah and HAS a Father — Heb 12 names him the Mediator who speaks
--     from heaven; no co-equal-persons grammar imposed.

CREATE TEMP VIEW _s340_1sa06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the trespass offering that returns glory to Yahuah
    ('canon','1-samuel',6,3,'canon','leviticus',5,6,
      E'*And he shall bring his trespass offering unto Yahuah (LORD) for his sin which he hath sinned, a female from the flock, a lamb or a kid of the goats, for a sin offering; and the priest shall make an atonement for him concerning his sin.* (Leviticus 5:6). The Philistine priests counsel, *in any wise return him a trespass offering: then ye shall be healed* (1 Samuel 6:3) — even the heathen grope toward Torah''s own remedy, the asham: guilt is not waved away but answered with restitution and atonement. Torah is affirmed, not foreign.',
      'free'),
    ('canon','1-samuel',6,5,'canon','leviticus',5,15,
      E'*If a soul commit a trespass, and sin through ignorance, in the holy things of Yahuah (LORD); then he shall bring for his trespass unto Yahuah (LORD) a ram without blemish out of the flocks ... for a trespass offering* (Leviticus 5:15). The trespass against the *holy things* is exactly the Philistine crime — they seized the ark. Their counsel to *give glory unto the Elohim (God) of Yashar''el (Israel)* (1 Samuel 6:5) is the trespass-offering instinct: glory restored to its Owner.',
      'free'),
    ('canon','1-samuel',6,16,'canon','leviticus',5,16,
      E'*And he shall make amends for the harm that he hath done in the holy thing, and shall add the fifth part thereto, and give it unto the priest: and the priest shall make an atonement for him with the ram of the trespass offering, and it shall be forgiven him.* (Leviticus 5:16). Torah''s asham adds a fifth in restitution; the five lords with their *five golden emerods, and five golden mice* (1 Samuel 6:4) pay a fivefold reparation back to Yahuah before they turn home — the law''s pattern enacted by Philistia.',
      'free'),

    -- THREAD 2: harden not your hearts as Pharaoh
    ('canon','1-samuel',6,6,'canon','exodus',8,15,
      E'*But when Pharaoh saw that there was respite, he hardened his heart, and hearkened not unto them; as Yahuah (LORD) had said.* (Exodus 8:15). The Philistine diviners themselves preach the Exodus sermon: *Wherefore then do ye harden your hearts, as the Egyptians and Pharaoh hardened their hearts?* (1 Samuel 6:6) — the relented respite that only re-hardens is the very sin they warn against.',
      'free'),
    ('canon','1-samuel',6,6,'canon','exodus',8,32,
      E'*And Pharaoh hardened his heart at this time also, neither would he let the people go.* (Exodus 8:32). Plague after plague, Pharaoh''s heart sets harder against Yahuah and is shattered anyway; *did they not let the people go, and they departed?* (1 Samuel 6:6) — the Philistines fear to repeat the contest they know Egypt lost.',
      'free'),

    -- THREAD 3: the new cart and the ark of his Presence
    ('canon','1-samuel',6,7,'canon','2-samuel',6,3,
      E'*And they set the ark of Elohim (God) upon a new cart, and brought it out of the house of Abinadab that was in Gibeah: and Uzzah and Ahio, the sons of Abinadab, drave the new cart.* (2 Samuel 6:3). Israel later copies the Philistine method — *Now therefore make a new cart* (1 Samuel 6:7) — but what the heathen may be excused for, the covenant people are not: Torah set the ark to be BORNE, not carted.',
      'free'),
    ('canon','1-samuel',6,7,'canon','2-samuel',6,7,
      E'*And the anger of Yahuah (LORD) was kindled against Uzzah; and Elohim (God) smote him there for his error; and there he died by the ark of Elohim (God).* (2 Samuel 6:7). The new-cart shortcut that brought the ark home from Philistia (1 Samuel 6:7) returns under David and kills a man of Israel — the Presence is not handled on man''s convenient terms.',
      'free'),
    ('canon','1-samuel',6,11,'canon','1-chronicles',13,10,
      E'*And the anger of Yahuah (LORD) was kindled against Uzza, and he smote him, because he put his hand to the ark: and there he died before Elohim (God).* (1 Chronicles 13:10). They *laid the ark of Yahuah (LORD) upon the cart* (1 Samuel 6:11) — and the Chronicler records the same fatal cart, the hand stretched to a thing too holy to steady by human touch.',
      'free'),
    ('canon','1-samuel',6,15,'canon','numbers',4,15,
      E'*And when Aaron and his sons have made an end of covering the sanctuary, and all the vessels of the sanctuary ... after that, the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die.* (Numbers 4:15). Here at Beth-shemesh *the Levites took down the ark of Yahuah (LORD)* (1 Samuel 6:15) — the BEARING that Torah ordained, set against the cart: the ark belongs on the shoulders of the Kohathites.',
      'free'),

    -- THREAD 4: they looked into the ark and were smitten
    ('canon','1-samuel',6,19,'canon','numbers',4,15,
      E'*... after that, the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die.* (Numbers 4:15). The men of Beth-shemesh *had looked into the ark of Yahuah (LORD)* (1 Samuel 6:19) and were smitten — Torah had already warned that even the appointed bearers die if they touch the most holy things. Holiness is not cruelty; it is the law they were given.',
      'free'),
    ('canon','1-samuel',6,19,'canon','numbers',4,20,
      E'*But they shall not go in to see when the holy things are covered, lest they die.* (Numbers 4:20). Even the Kohathites were forbidden to SEE the holy things uncovered; the men of Beth-shemesh *looked into the ark* (1 Samuel 6:19) and fell under the same word — the gaze that presumes upon the Presence is fatal.',
      'free'),
    ('canon','1-samuel',6,19,'canon','exodus',19,21,
      E'*And Yahuah (LORD) said unto Moses, Go down, charge the people, lest they break through unto Yahuah (LORD) to gaze, and many of them perish.* (Exodus 19:21). At Sinai the bounds were set lest the people *gaze* and perish; at Beth-shemesh the bounds are crossed by eyes that *looked into the ark* (1 Samuel 6:19) — the Glory between the cherubim is the same consuming holiness.',
      'free'),

    -- THREAD 5: who is able to stand before this holy Yahuah Elohim
    ('canon','1-samuel',6,20,'canon','psalms',24,3,
      E'*Who shall ascend into the hill of Yahuah (LORD)? or who shall stand in his holy place?* (Psalm 24:3). Beth-shemesh''s cry — *Who is able to stand before this holy Yahuah Elohim (LORD God)?* (1 Samuel 6:20) — is the ark-psalm''s own question; and the answer follows: *He that hath clean hands, and a pure heart* (Psalm 24:4), not the presumptuous eye.',
      'free'),
    ('canon','1-samuel',6,20,'canon','psalms',130,3,
      E'*If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand?* (Psalm 130:3). None can stand on his own before the holy Presence — *Who is able to stand before this holy Yahuah Elohim?* (1 Samuel 6:20); yet the psalm answers, *But there is forgiveness with thee, that thou mayest be feared* (Psalm 130:4): reverence, not despair.',
      'free'),
    ('canon','1-samuel',6,20,'canon','hebrews',12,29,
      E'*For our Elohim (God) is a consuming fire.* (Hebrews 12:29). The terror of Beth-shemesh — *Who is able to stand before this holy Yahuah Elohim?* (1 Samuel 6:20) — is carried forward: *let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28). The same holy Presence between the cherubim is the Formed Son, the Mediator who speaks from heaven, who is Yahuah and HAS a Father.',
      'free')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,note,tier)
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-6-the-trespass-offering-that-returns-glory-to-yahuah',
       E'The Trespass Offering That Returns Glory to Yahuah',
       E'Held seven months under the plague, the Philistine priests counsel: *send it not empty; but in any wise return him a trespass offering: then ye shall be healed* (1 Samuel 6:3), and *ye shall give glory unto the Elohim (God) of Yashar''el (Israel)* (1 Samuel 6:5). Even the heathen grope toward Torah''s own remedy. The law of the asham (guilt offering) is precisely this: *And he shall bring his trespass offering unto Yahuah (LORD) for his sin which he hath sinned ... and the priest shall make an atonement for him concerning his sin* (Leviticus 5:6); and where the sin is *in the holy things of Yahuah* — exactly the Philistine crime of seizing the ark — *then he shall bring for his trespass unto Yahuah (LORD) a ram without blemish ... for a trespass offering* (Leviticus 5:15). Torah even fixes the restitution: *he shall make amends for the harm that he hath done in the holy thing, and shall add the fifth part thereto* (Leviticus 5:16) — and the five lords pay a fivefold reparation, *Five golden emerods, and five golden mice* (1 Samuel 6:4), back to its Owner. The glory stolen is returned; guilt is not waved away but answered. Torah is affirmed, not abolished — its pattern is so deep that pagans stumble into it.',
       sv.verse_id, ev.verse_id, 'free', 36525
  FROM _s340_1sa06_lookup sv, _s340_1sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-6-harden-not-your-hearts-as-pharaoh',
       E'Harden Not Your Hearts as Pharaoh',
       E'The Philistine diviners preach an Exodus sermon to their own lords: *Wherefore then do ye harden your hearts, as the Egyptians and Pharaoh hardened their hearts? when he had wrought wonderfully among them, did they not let the people go, and they departed?* (1 Samuel 6:6). They remember the contest Egypt lost. Plague by plague Pharaoh''s heart set harder: *when Pharaoh saw that there was respite, he hardened his heart, and hearkened not unto them; as Yahuah (LORD) had said* (Exodus 8:15) — and again, *Pharaoh hardened his heart at this time also, neither would he let the people go* (Exodus 8:32). The respite that only re-hardens is the surest road to ruin. Yahuah is vindicated against the hard heart whether at the Nile or in Philistia; the wise course is to let His ark go up, and not fight the One who already shattered Egypt.',
       sv.verse_id, ev.verse_id, 'free', 36528
  FROM _s340_1sa06_lookup sv, _s340_1sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=6 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-6-the-new-cart-and-the-ark-of-his-presence',
       E'The New Cart and the Ark of His Presence',
       E'The Philistines build *a new cart* and yoke *two milch kine, on which there hath come no yoke* (1 Samuel 6:7), lay the ark upon it (1 Samuel 6:11), and the lowing kine go straight to Beth-shemesh — Yahuah vindicating Himself, needing no Israelite hand. But what the heathen may be excused, the covenant people are not. Years later David copies the very method: *they set the ark of Elohim (God) upon a new cart ... and Uzzah and Ahio ... drave the new cart* (2 Samuel 6:3), and when Uzzah steadies it the cart kills him — *the anger of Yahuah (LORD) was kindled against Uzzah; and Elohim (God) smote him there for his error* (2 Samuel 6:7); the Chronicler records the same: *he smote him, because he put his hand to the ark: and there he died before Elohim (God)* (1 Chronicles 13:10). The cart was never the way. At Beth-shemesh *the Levites took down the ark of Yahuah (LORD)* (1 Samuel 6:15) — the bearing Torah ordained, *the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die* (Numbers 4:15). The Presence between the cherubim is the Formed Glory of Yahuah; He is carried on consecrated shoulders, never handled on man''s convenient terms.',
       sv.verse_id, ev.verse_id, 'free', 36531
  FROM _s340_1sa06_lookup sv, _s340_1sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-6-they-looked-into-the-ark-and-were-smitten',
       E'They Looked Into the Ark and Were Smitten',
       E'*And he smote the men of Beth-shemesh, because they had looked into the ark of Yahuah (LORD)* (1 Samuel 6:19). This is not arbitrary cruelty but the consistent holiness of the Presence, already legislated in Torah. The Kohathites — the very bearers — were charged: *they shall not touch any holy thing, lest they die* (Numbers 4:15), and more, *they shall not go in to see when the holy things are covered, lest they die* (Numbers 4:20). Even the gaze of the appointed is forbidden. At Sinai the bounds carried the same warning: *charge the people, lest they break through unto Yahuah (LORD) to gaze, and many of them perish* (Exodus 19:21). The men of Beth-shemesh, warned by the Torah they possessed, presumed to look INTO the ark — and fell under the word they already had. The fire between the cherubim is the Formed Presence of Yahuah; reverence, not the prying eye, is its only safe posture.',
       sv.verse_id, ev.verse_id, 'free', 36534
  FROM _s340_1sa06_lookup sv, _s340_1sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=6 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-6-who-is-able-to-stand-before-this-holy-yahuah-elohim',
       E'Who Is Able to Stand Before This Holy Yahuah Elohim',
       E'Reeling from the slaughter, Beth-shemesh cries, *Who is able to stand before this holy Yahuah Elohim (LORD God)?* (1 Samuel 6:20). It is the ark-psalm''s own question: *Who shall ascend into the hill of Yahuah (LORD)? or who shall stand in his holy place?* (Psalm 24:3) — answered, *He that hath clean hands, and a pure heart* (Psalm 24:4), not the presumptuous eye. And again the cry of the depths: *If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand?* (Psalm 130:3) — yet *there is forgiveness with thee, that thou mayest be feared* (Psalm 130:4): reverence, not despair, is the door. The whole arc carries forward to the assembly that comes not to a mountain that burned but to the heavenly Jerusalem: *let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear: For our Elohim (God) is a consuming fire* (Hebrews 12:28-29). The holy Presence between the cherubim — the One who smote Beth-shemesh — is the Formed Son, the Mediator who speaks from heaven; He is Yahuah, and He has a Father.',
       sv.verse_id, ev.verse_id, 'free', 36537
  FROM _s340_1sa06_lookup sv, _s340_1sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ===================== thread_members =====================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 5:6 — *he shall bring his trespass offering unto Yahuah (LORD) ... and the priest shall make an atonement for him* — Torah''s asham, the very remedy the Philistines grope toward.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-the-trespass-offering-that-returns-glory-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 5:15 — trespass *in the holy things of Yahuah* requires *a ram without blemish ... for a trespass offering*: the Philistine sin against the ark is exactly this category.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=5 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-the-trespass-offering-that-returns-glory-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 5:16 — *add the fifth part thereto* in restitution; the fivefold golden reparation of the five lords enacts the asham''s added-fifth.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=5 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-the-trespass-offering-that-returns-glory-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 8:15 — *when Pharaoh saw that there was respite, he hardened his heart*: the relented respite that only re-hardens, the exact sin Philistia is warned against.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-harden-not-your-hearts-as-pharaoh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 8:32 — *Pharaoh hardened his heart at this time also*: the heart that fights Yahuah and is broken anyway; the contest Philistia fears to repeat.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-harden-not-your-hearts-as-pharaoh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 6:3 — David *set the ark ... upon a new cart*: Israel copies the Philistine method that Torah never sanctioned.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-the-new-cart-and-the-ark-of-his-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 6:7 — *Elohim (God) smote him there for his error*: the new-cart shortcut kills Uzzah; the Presence is not handled on man''s terms.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-the-new-cart-and-the-ark-of-his-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Chronicles 13:10 — *because he put his hand to the ark ... he died*: the Chronicler''s witness to the same fatal cart.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=11
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=13 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-the-new-cart-and-the-ark-of-his-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Numbers 4:15 — *the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die*: the ark belongs on consecrated shoulders, as the Levites take it down here.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-the-new-cart-and-the-ark-of-his-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 4:15 — *they shall not touch any holy thing, lest they die*: Torah''s warning the men of Beth-shemesh already possessed.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=19
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-they-looked-into-the-ark-and-were-smitten'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 4:20 — *they shall not go in to see when the holy things are covered, lest they die*: even the gaze is forbidden; Beth-shemesh looked INTO the ark.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=19
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-they-looked-into-the-ark-and-were-smitten'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 19:21 — *lest they break through unto Yahuah (LORD) to gaze, and many of them perish*: the Sinai bounds, the same consuming holiness crossed by the prying eye.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=19
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-they-looked-into-the-ark-and-were-smitten'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 24:3 — *who shall stand in his holy place?*: the ark-psalm''s own question, echoed by Beth-shemesh; answered by clean hands and a pure heart.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=24 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-who-is-able-to-stand-before-this-holy-yahuah-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 130:3 — *who shall stand?*: none on his own merit; yet *there is forgiveness with thee, that thou mayest be feared* — reverence, not despair.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-who-is-able-to-stand-before-this-holy-yahuah-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 12:29 — *For our Elohim (God) is a consuming fire*: the holiness of the Presence carried forward; serve with reverence — the Formed Mediator who speaks from heaven, Yahuah who has a Father.'
  FROM cross_reference_threads t
  JOIN _s340_1sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s340_1sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-6-who-is-able-to-stand-before-this-holy-yahuah-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_7.sql (1 Samuel 7) -----
-- Chapter: 1 Samuel 7 — national repentance at Mizpeh. Samuel calls the whole house to
--   return with all their hearts, put away the strange gods and Ashtaroth, and serve Yahuah
--   only (7:3-4); Yashar'el gathers, draws and pours out water, fasts, confesses "We have
--   sinned" (7:5-6); the Philistines come up and Yahuah thunders and routs them while Samuel
--   offers the lamb and cries (7:8-11); Samuel raises the stone Eben-ezer — "Hitherto hath
--   Yahuah helped us" (7:12); the prophet-judge-intercessor judges Yashar'el all his days
--   and builds an altar at Ramah (7:15-17).
-- Tag: 1sa07   View: _s340_1sa07_lookup   Sort band: base 36550, step 3 → 36550,36553,36556,36559,36562
--
-- 1 Samuel 7 coverage:
--   v.3-4  (return with all your hearts; put away the strange gods and Ashtaroth; serve him only)
--          NT:     none warranted (covenant-renewal pattern; Mediator weave goes to THREAD 4)
--          Extras: none warranted
--          Tanakh: Deuteronomy 30:2-3 (return... and gather thee from all the nations);
--                  Deuteronomy 6:13-14 (fear Yahuah, serve him, go not after other gods);
--                  Joshua 24:14,23 (put away the strange gods... serve him); Judges 10:15-16
--                  (put away the strange gods, served Yahuah) — THREAD 1
--   v.5-6  (gather to Mizpeh; drew water and poured it out; fasted; We have sinned against Yahuah)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Judges 10:10 (We have sinned... forsaken... served Baalim); 1 Samuel 12:10
--                  (We have sinned... served Baalim and Ashtaroth: but now deliver us) — THREAD 2
--   v.8-11 (Cease not to cry unto Yahuah our God; Samuel offers the lamb and cries; Yahuah
--           thundered and discomfited the Philistines)
--          NT:     none warranted (Samuel-as-intercessor folds to THREAD 4)
--          Extras: none warranted
--          Tanakh: 1 Samuel 12:17-18 (Samuel called; Yahuah sent thunder) — THREAD 3 (deliverance)
--   v.12   (Eben-ezer — the stone: Hitherto hath Yahuah helped us)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Joshua 24:26-27 (Joshua took a great stone... this stone shall be a witness);
--                  1 Samuel 12:11 (Yahuah sent... and delivered you) — THREAD 3
--   v.8-10, 9, 5  (Samuel the prophet-judge-intercessor who stands in the breach)
--          NT:     Hebrews 7:25 (he ever liveth to make intercession); 1 Timothy 2:5 (one
--                  mediator between Elohim and men, the man HaMashiach Yahusha) — THREAD 4
--          Extras: none warranted
--          Tanakh: Psalm 99:6 (Samuel among them that call upon his name; he answered them);
--                  Jeremiah 15:1 (Though Moses and Samuel stood before me); 1 Samuel 12:23
--                  (I should sin against Yahuah in ceasing to pray for you) — THREAD 4
--   v.15-17 (Samuel judged Yashar'el all the days of his life; circuit; altar at Ramah)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Samuel 12:1-5 (the judge's clean hands — witness against me);
--                  Judges 10:1-3 (the judges who arose to defend Yashar'el) — THREAD 5
--
-- THREADS:
--   1-samuel-7-return-with-all-your-hearts-and-put-away-the-strange-gods (1-samuel; deuteronomy; joshua; judges) — free
--        The covenant-renewal call: return with the whole heart, put away the strange gods and
--        Ashtaroth, serve Yahuah only — Deut 30 turn-and-be-gathered, Deut 6 serve him only,
--        Josh 24 and Judg 10 the same putting-away. Torah is the inheritance, never the curse.
--   1-samuel-7-we-have-sinned-the-confession-at-mizpeh (1-samuel; judges) — free
--        Drew water, poured it out, fasted, "We have sinned against Yahuah" — the same confession
--        as Judg 10:10 and 1 Sam 12:10; true return is owned guilt, not a manipulated relic.
--   1-samuel-7-eben-ezer-hitherto-hath-yahuah-helped-us (1-samuel; joshua) — free
--        Yahuah thunders and routs the Philistines; Samuel raises the witness-stone Eben-ezer —
--        as Joshua raised the witness-stone at Shechem; the help is Yahuah's, the stone testifies.
--   1-samuel-7-cease-not-to-cry-the-prophet-who-stands-in-the-breach (1-samuel; psalms; jeremiah; hebrews; 1-timothy) — free
--        Samuel the intercessor — cry unto Yahuah our God for us; Ps 99:6 and Jer 15:1 name him
--        with Moses as the one who stands before Yahuah; the Moses-pattern mediator who foreshadows
--        the One who EVER liveth to make intercession (Heb 7:25), the one Mediator (1 Tim 2:5,
--        a MAN with a Father, not a co-equal person).
--   1-samuel-7-samuel-judged-yasharel-all-his-days-the-faithful-judge (1-samuel; judges) — free
--        The prophet-judge in circuit all his life, an altar at Ramah; the clean-handed judge of
--        ch12 ("whose ox have I taken?"), the line of judges raised to defend Yashar'el (Judg 10).

CREATE TEMP VIEW _s340_1sa07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: return with all your hearts and put away the strange gods
  ('canon','1-samuel',7,3,'canon','deuteronomy',30,2,'free',
   E'*And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul;* (Deuteronomy 30:2). Samuel''s call — *If ye do return unto Yahuah (LORD) with all your hearts... and prepare your hearts unto Yahuah (LORD), and serve him only* (1 Samuel 7:3) — is Moses'' covenant promise enacted. The return is with the WHOLE heart, the Torah obeyed not abolished; this is the road back, never a curse but the inheritance owned again.'),
  ('canon','1-samuel',7,3,'canon','deuteronomy',30,3,'free',
   E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* (Deuteronomy 30:3). When Yashar''el returns with the whole heart, Yahuah will *deliver you out of the hand of the Philistines* (1 Samuel 7:3) — the local deliverance is the firstfruit of the great promise: He who scatters the two houses will turn and gather them when they turn to Him.'),
  ('canon','1-samuel',7,3,'canon','deuteronomy',6,13,'free',
   E'*Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him, and shalt swear by his name.* (Deuteronomy 6:13). Samuel''s *serve him only* (1 Samuel 7:3) is the Shema''s charge pressed home: undivided service to the one Yahuah. The strange gods cannot share the heart that is His alone.'),
  ('canon','1-samuel',7,4,'canon','deuteronomy',6,14,'free',
   E'*Ye shall not go after other gods, of the gods of the people which are round about you;* (Deuteronomy 6:14). *Then the children of Yashar''el (Israel) did put away Baalim and Ashtaroth, and served Yahuah (LORD) only* (1 Samuel 7:4) is exact obedience to the command — turning from the gods of the surrounding peoples to Yahuah alone.'),
  ('canon','1-samuel',7,3,'canon','joshua',24,14,'free',
   E'*Now therefore fear Yahuah (LORD), and serve him in sincerity and in truth: and put away the gods which your fathers served on the other side of the flood, and in Egypt; and serve ye Yahuah (LORD).* (Joshua 24:14). Joshua''s charge at Shechem and Samuel''s at Mizpeh are one covenant-renewal: *put away the strange gods and Ashtaroth from among you... and serve him only* (1 Samuel 7:3). The same prophet-leader summons, the same demand — sincere, whole-hearted service of Yahuah alone.'),
  ('canon','1-samuel',7,4,'canon','joshua',24,23,'free',
   E'*Now therefore put away, said he, the strange gods which are among you, and incline your heart unto Yahuah Elohim (the LORD God) of Yashar''el (Israel).* (Joshua 24:23). *Then the children of Yashar''el (Israel) did put away Baalim and Ashtaroth* (1 Samuel 7:4) answers Joshua''s very words — the heart inclined to Yahuah, the foreign idols put out from the midst.'),
  ('canon','1-samuel',7,4,'canon','judges',10,16,'free',
   E'*And they put away the strange gods from among them, and served Yahuah (LORD): and his soul was grieved for the misery of Yashar''el (Israel).* (Judges 10:16). The judges-era pattern is renewed under Samuel: *did put away Baalim and Ashtaroth, and served Yahuah (LORD) only* (1 Samuel 7:4). The putting-away is the proof of the turned heart, and Yahuah''s grieving compassion meets it.'),
  -- THREAD 2: We have sinned — the confession at Mizpeh
  ('canon','1-samuel',7,6,'canon','judges',10,10,'free',
   E'*And the children of Yashar''el (Israel) cried unto Yahuah (LORD), saying, We have sinned against thee, both because we have forsaken our Elohim (God), and also served Baalim.* (Judges 10:10). At Mizpeh they gathered *and said there, We have sinned against Yahuah (LORD)* (1 Samuel 7:6) — the same owned confession, naming the sin of forsaking Yahuah for the Baalim. Repentance begins in spoken guilt, not in a managed ritual.'),
  ('canon','1-samuel',7,6,'canon','1-samuel',12,10,'free',
   E'*And they cried unto Yahuah (LORD), and said, We have sinned, because we have forsaken Yahuah (LORD), and have served Baalim and Ashtaroth: but now deliver us out of the hand of our enemies, and we will serve thee.* (1 Samuel 12:10). Samuel later rehearses this very confession as the pattern of every deliverance; at Mizpeh it is freshly made — *We have sinned against Yahuah (LORD)* (1 Samuel 7:6) — fasting, pouring out water, the whole house owning its guilt before the routing of the Philistines.'),
  -- THREAD 3: Eben-ezer — Hitherto hath Yahuah helped us
  ('canon','1-samuel',7,12,'canon','joshua',24,26,'free',
   E'*And Joshua wrote these words in the book of the law of Elohim (God), and took a great stone, and set it up there under an oak, that was by the sanctuary of Yahuah (LORD).* (Joshua 24:26). As Joshua raised a witness-stone to seal the covenant at Shechem, Samuel *took a stone, and set it between Mizpeh and Shen, and called the name of it Eben-ezer* (1 Samuel 7:12). The standing stone is memory made visible — a marker that the help came from Yahuah and the covenant was renewed here.'),
  ('canon','1-samuel',7,12,'canon','joshua',24,27,'free',
   E'*And Joshua said unto all the people, Behold, this stone shall be a witness unto us; for it hath heard all the words of Yahuah (LORD) which he spake unto us: it shall be therefore a witness unto you, lest ye deny your Elohim (God).* (Joshua 24:27). Eben-ezer, *saying, Hitherto hath Yahuah (LORD) helped us* (1 Samuel 7:12), is such a witness-stone — set so that no generation can deny the deliverance Yahuah wrought, the thunder that scattered the Philistines remembered in stone.'),
  ('canon','1-samuel',7,12,'canon','1-samuel',12,11,'free',
   E'*And Yahuah (LORD) sent Jerubbaal, and Bedan, and Jephthah, and Samuel, and delivered you out of the hand of your enemies on every side, and ye dwelled safe.* (1 Samuel 12:11). The Eben-ezer stone — *Hitherto hath Yahuah (LORD) helped us* (1 Samuel 7:12) — is one chapter in the long record Samuel names: Yahuah Himself raising deliverers and delivering His people. The help was His doing through Samuel, never Samuel''s own arm.'),
  -- THREAD 4: Cease not to cry — the prophet who stands in the breach (the Mediator foreshadowed)
  ('canon','1-samuel',7,8,'canon','psalms',99,6,'free',
   E'*Moses and Aaron among his priests, and Samuel among them that call upon his name; they called upon Yahuah (LORD), and he answered them.* (Psalm 99:6). The people beg *Cease not to cry unto Yahuah Eloheinu (the LORD our God) for us* (1 Samuel 7:8), and the Psalm enthrones Samuel beside Moses and Aaron as one who calls and is answered — the prophet-intercessor whose cry Yahuah hears for the whole house.'),
  ('canon','1-samuel',7,9,'canon','jeremiah',15,1,'free',
   E'*Then said Yahuah (LORD) unto me, Though Moses and Samuel stood before me, yet my mind could not be toward this people: cast them out of my sight, and let them go forth.* (Jeremiah 15:1). When *Samuel cried unto Yahuah (LORD) for Yashar''el (Israel); and Yahuah (LORD) heard him* (1 Samuel 7:9), he became the proverb of effectual intercession — Yahuah names Moses and Samuel as the two whose standing-before-Him most surely turns His hand, the Moses-pattern mediator standing in the breach.'),
  ('canon','1-samuel',7,8,'canon','1-samuel',12,23,'free',
   E'*Moreover as for me, Elohim (God) forbid that I should sin against Yahuah (LORD) in ceasing to pray for you: but I will teach you the good and the right way:* (1 Samuel 12:23). Samuel takes the people''s plea — *Cease not to cry unto Yahuah Eloheinu (the LORD our God) for us* (1 Samuel 7:8) — as a binding charge: to stop interceding would itself be sin. The faithful mediator joins ceaseless prayer to teaching the right way of Yahuah.'),
  ('canon','1-samuel',7,9,'canon','hebrews',7,25,'free',
   E'*Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* (Hebrews 7:25). *Samuel cried unto Yahuah (LORD) for Yashar''el (Israel); and Yahuah (LORD) heard him* (1 Samuel 7:9) — the prophet who stands in the breach foreshadows the Formed Son who never ceases to intercede. Samuel must die and pass his circuit on; the One after the order of Melek Tsadiq (Melchizedek) *ever liveth*, the intercession that never lifts.'),
  ('canon','1-samuel',7,9,'canon','1-timothy',2,5,'free',
   E'*For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus);* (1 Timothy 2:5). Samuel offering the lamb and crying for Yashar''el (1 Samuel 7:9) is the shadow; the substance is the one Mediator — and Paul names Him *the man*, the Formed Son who has a Father, who stands between Elohim and men. Not a co-equal person of a triad and no created angel, but the One drawn from the Formless who took flesh to mediate.'),
  ('canon','1-samuel',7,15,'canon','judges',10,1,'free',
   E'*And after Abimelech there arose to defend Yashar''el (Israel) Tola the son of Puah, the son of Dodo, a man of Issachar; and he dwelt in Shamir in mount Ephraim* (Judges 10:1); *And he judged Yashar''el (Israel) twenty and three years* (Judges 10:2). Samuel *judged Yashar''el (Israel) all the days of his life* (1 Samuel 7:15) — the faithful capstone of the line of judges Yahuah (LORD) raised up to defend and deliver His people.'),
  ('canon','1-samuel',7,15,'canon','1-samuel',12,3,'free',
   E'*Behold, here I am: witness against me before Yahuah (LORD), and before his anointed: whose ox have I taken? or whose ass have I taken? or whom have I defrauded? whom have I oppressed?* (1 Samuel 12:3). The judge who *judged Yashar''el (Israel) all the days of his life* (1 Samuel 7:15) ends with clean hands — the proof of a faithful prophet-judge, taking nothing, oppressing none.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-7-return-with-all-your-hearts-and-put-away-the-strange-gods',
  E'Return with all your hearts — and put away the strange gods',
  E'After twenty years of mourning, Samuel calls the whole house back: *If ye do return unto Yahuah (LORD) with all your hearts, then put away the strange gods and Ashtaroth from among you, and prepare your hearts unto Yahuah (LORD), and serve him only: and he will deliver you out of the hand of the Philistines* (1 Samuel 7:3), and they obey — *did put away Baalim and Ashtaroth, and served Yahuah (LORD) only* (1 Samuel 7:4). This is Moses'' covenant promise enacted: *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice... with all thine heart, and with all thy soul* (Deuteronomy 30:2), with the assurance that follows — *he will... return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). The local rescue from the Philistines is the firstfruit of the great two-house ingathering: the One who scatters will gather the heart that turns to Him. *Serve him only* is the Shema''s own charge — *Thou shalt fear Yahuah Elohayka (the LORD thy God), and serve him* (Deuteronomy 6:13), *Ye shall not go after other gods* (Deuteronomy 6:14). And it is the very renewal Joshua led at Shechem — *put away the gods which your fathers served... and serve ye Yahuah (LORD)* (Joshua 24:14), *incline your heart unto Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 24:23) — and that the judges saw again and again: *And they put away the strange gods from among them, and served Yahuah (LORD)* (Judges 10:16). The Torah here is no curse but the inheritance owned again; the road back is always the whole heart turned and the idols put out.',
  sv.verse_id, ev.verse_id, 'free', 36550
  FROM _s340_1sa07_lookup sv, _s340_1sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=7 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-7-we-have-sinned-the-confession-at-mizpeh',
  E'We have sinned — the confession at Mizpeh',
  E'The returning house gathers and humbles itself: *And they gathered together to Mizpeh, and drew water, and poured it out before Yahuah (LORD), and fasted on that day, and said there, We have sinned against Yahuah (LORD)* (1 Samuel 7:6). The poured-out water and the fast are the body''s confession; the spoken *We have sinned* is the heart''s. It is the same owned guilt the judges'' generation made — *We have sinned against thee, both because we have forsaken our Elohim (God), and also served Baalim* (Judges 10:10) — and the same Samuel himself will hold up as the pattern of every deliverance: *We have sinned, because we have forsaken Yahuah (LORD), and have served Baalim and Ashtaroth: but now deliver us out of the hand of our enemies, and we will serve thee* (1 Samuel 12:10). True return is not a managed relic or a magic shout (as the ark had been mishandled at Aphek), but named, spoken, owned sin, and the resolve to serve Yahuah alone. Yahuah answers the broken heart, not the manipulated symbol.',
  sv.verse_id, ev.verse_id, 'free', 36553
  FROM _s340_1sa07_lookup sv, _s340_1sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-7-eben-ezer-hitherto-hath-yahuah-helped-us',
  E'Eben-ezer — Hitherto hath Yahuah helped us',
  E'As Samuel offers the lamb and cries, *Yahuah (LORD) thundered with a great thunder on that day upon the Philistines, and discomfited them; and they were smitten before Yashar''el (Israel)* (1 Samuel 7:10) — Yahuah Himself, not Israel''s arm, wins the field. To seal the memory Samuel *took a stone, and set it between Mizpeh and Shen, and called the name of it Eben-ezer, saying, Hitherto hath Yahuah (LORD) helped us* (1 Samuel 7:12). It is the witness-stone of covenant renewal, exactly as Joshua had raised one at Shechem: *took a great stone, and set it up there under an oak, that was by the sanctuary of Yahuah (LORD)* (Joshua 24:26), declaring *Behold, this stone shall be a witness unto us; for it hath heard all the words of Yahuah (LORD)... lest ye deny your Elohim (God)* (Joshua 24:27). The standing stone is memory made unforgettable — set so no later generation can deny what Yahuah did here. And the help named in stone is one chapter of the long record Samuel rehearses: *And Yahuah (LORD) sent Jerubbaal, and Bedan, and Jephthah, and Samuel, and delivered you out of the hand of your enemies on every side* (1 Samuel 12:11). The credit is Yahuah''s; the prophet only raises the marker that says so.',
  sv.verse_id, ev.verse_id, 'free', 36556
  FROM _s340_1sa07_lookup sv, _s340_1sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-7-cease-not-to-cry-the-prophet-who-stands-in-the-breach',
  E'Cease not to cry — the prophet who stands in the breach',
  E'Afraid of the Philistines, the people throw themselves on Samuel''s intercession: *Cease not to cry unto Yahuah Eloheinu (the LORD our God) for us, that he will save us out of the hand of the Philistines* (1 Samuel 7:8), and he does — *Samuel cried unto Yahuah (LORD) for Yashar''el (Israel); and Yahuah (LORD) heard him* (1 Samuel 7:9). Samuel becomes the very emblem of effectual intercession. The Psalm enthrones him with the great mediators: *Moses and Aaron among his priests, and Samuel among them that call upon his name; they called upon Yahuah (LORD), and he answered them* (Psalm 99:6). And Yahuah names him with Moses as the standing-before-Him most able to turn His hand: *Though Moses and Samuel stood before me, yet my mind could not be toward this people* (Jeremiah 15:1) — only such pleading could so move Him. Samuel held this office as a sacred duty: *Elohim (God) forbid that I should sin against Yahuah (LORD) in ceasing to pray for you* (1 Samuel 12:23). All of it is the shadow of the One it foreshadows — the Moses-pattern mediator who stands in the breach is filled by the Formed Son who *ever liveth to make intercession for them* (Hebrews 7:25), the priest after the order of Melek Tsadiq (Melchizedek) whose cry never lifts. He is *one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5) — *the man*, the One drawn from the Formless who has a Father and took flesh to stand between, not a co-equal of a triad nor a created angel. Samuel must die and hand on his circuit; the true Intercessor never ceases.',
  sv.verse_id, ev.verse_id, 'free', 36559
  FROM _s340_1sa07_lookup sv, _s340_1sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-7-samuel-judged-yasharel-all-his-days-the-faithful-judge',
  E'Samuel judged Yashar''el all his days — the faithful judge',
  E'The chapter closes on a settled, lifelong faithfulness: *And Samuel judged Yashar''el (Israel) all the days of his life. And he went from year to year in circuit to Beth-el, and Gilgal, and Mizpeh, and judged Yashar''el (Israel) in all those places. And his return was to Ramah; for there was his house; and there he judged Yashar''el (Israel); and there he built an altar unto Yahuah (LORD)* (1 Samuel 7:15-17). Samuel stands in the line of the judges Yahuah raised to defend His people — *And after Abimelech there arose to defend Yashar''el (Israel) Tola... and he judged Yashar''el (Israel) twenty and three years* (Judges 10:1-2) — but he is the faithful capstone of that line, a prophet-judge whose hands are clean. At the end of his circuit he will dare the whole nation to accuse him: *whose ox have I taken? or whose ass have I taken? or whom have I defrauded? whom have I oppressed?* (1 Samuel 12:3), and they answer *Thou hast not defrauded us, nor oppressed us* (1 Samuel 12:4). The shepherd-judge who builds an altar at his own door, who oppresses no one and intercedes for all, is the Moses-pattern leader Yashar''el needed — and the pattern the true Shepherd-King will fulfil without flaw.',
  sv.verse_id, ev.verse_id, 'free', 36562
  FROM _s340_1sa07_lookup sv, _s340_1sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And shalt return unto Yahuah Elohayka... with all thine heart, and with all thy soul* (Deuteronomy 30:2) — Moses'' covenant promise that Samuel''s call enacts.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-return-with-all-your-hearts-and-put-away-the-strange-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...will return and gather thee from all the nations, whither... hath scattered thee* (Deuteronomy 30:3) — the local rescue is firstfruit of the two-house ingathering.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-return-with-all-your-hearts-and-put-away-the-strange-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt fear Yahuah Elohayka... and serve him* (Deuteronomy 6:13) — the Shema''s charge behind Samuel''s "serve him only."'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-return-with-all-your-hearts-and-put-away-the-strange-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Ye shall not go after other gods* (Deuteronomy 6:14) — exactly what Yashar''el obeys in putting away Baalim and Ashtaroth.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-return-with-all-your-hearts-and-put-away-the-strange-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*...put away the gods which your fathers served... and serve ye Yahuah* (Joshua 24:14) — Joshua''s Shechem renewal, one covenant with Samuel''s Mizpeh.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-return-with-all-your-hearts-and-put-away-the-strange-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*...put away... the strange gods... and incline your heart unto Yahuah Elohim of Yashar''el* (Joshua 24:23) — the very words Yashar''el answers in putting away the idols.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-return-with-all-your-hearts-and-put-away-the-strange-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*And they put away the strange gods... and served Yahuah: and his soul was grieved for the misery of Yashar''el* (Judges 10:16) — the judges-era pattern renewed, met by Yahuah''s compassion.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-return-with-all-your-hearts-and-put-away-the-strange-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*We have sinned against thee... we have forsaken our Elohim, and also served Baalim* (Judges 10:10) — the same owned confession the house makes at Mizpeh.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=10 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-we-have-sinned-the-confession-at-mizpeh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*We have sinned... served Baalim and Ashtaroth: but now deliver us... and we will serve thee* (1 Samuel 12:10) — Samuel later names this very pattern of confession-then-deliverance.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-we-have-sinned-the-confession-at-mizpeh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...took a great stone, and set it up there... by the sanctuary of Yahuah* (Joshua 24:26) — Joshua''s witness-stone, the pattern of Samuel''s Eben-ezer.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-eben-ezer-hitherto-hath-yahuah-helped-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Behold, this stone shall be a witness unto us... lest ye deny your Elohim* (Joshua 24:27) — the standing stone set so no generation can deny what Yahuah did.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-eben-ezer-hitherto-hath-yahuah-helped-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Yahuah sent... and delivered you out of the hand of your enemies on every side* (1 Samuel 12:11) — Eben-ezer is one chapter in Yahuah''s long record of help.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-eben-ezer-hitherto-hath-yahuah-helped-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...Samuel among them that call upon his name; they called upon Yahuah, and he answered them* (Psalm 99:6) — Samuel enthroned with Moses and Aaron as effectual intercessor.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=99 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-cease-not-to-cry-the-prophet-who-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Though Moses and Samuel stood before me...* (Jeremiah 15:1) — Yahuah names Samuel with Moses as the standing-before-Him most able to turn His hand.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-cease-not-to-cry-the-prophet-who-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...Elohim forbid that I should sin against Yahuah in ceasing to pray for you* (1 Samuel 12:23) — Samuel holds the people''s "cease not to cry" as a binding charge.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-cease-not-to-cry-the-prophet-who-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*...he ever liveth to make intercession for them* (Hebrews 7:25) — Samuel''s cry foreshadows the Formed Son whose intercession never lifts.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-cease-not-to-cry-the-prophet-who-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*...one mediator between Elohim and men, the man HaMashiach Yahusha* (1 Timothy 2:5) — *the man*, the Formed Son with a Father, the substance of Samuel''s shadow.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-cease-not-to-cry-the-prophet-who-stands-in-the-breach'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...there arose to defend Yashar''el Tola... and he judged Yashar''el twenty and three years* (Judges 10:1-2) — the line of judges Yahuah raised, of which Samuel is the faithful capstone.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=15
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-samuel-judged-yasharel-all-his-days-the-faithful-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...whose ox have I taken?... whom have I defrauded? whom have I oppressed?* (1 Samuel 12:3) — the clean-handed judge''s challenge, the proof of a faithful prophet-judge.'
  FROM cross_reference_threads t
  JOIN _s340_1sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=7 AND sv.verse_number=15
  JOIN _s340_1sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-7-samuel-judged-yasharel-all-his-days-the-faithful-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_8.sql (1 Samuel 8) -----
-- Chapter: 1 Samuel 8 — Yashar'el demands a king like all the nations; the rejection of Yahuah's own kingship.
-- Tag: 1sa08   Session: s340   View: _s340_1sa08_lookup
-- Sort band: base 36575, step 3  (36575, 36578, 36581)
--
-- 1 Samuel 8 coverage:
--   v.5,20 (a king like all the nations):
--        NT:     Acts 13:21 (they desired a king; Elohim gave them Saul) — lateral recap
--        Extras: none warranted
--        Tanakh: Deuteronomy 17:14-15 (the king-law: a brother, Yahuah's choice); Judges 8:23 (Gideon refused: Yahuah shall rule over you)
--   v.7 (they have not rejected thee but me, that I should not reign over them):
--        NT:     John 19:15 (We have no king but Caesar — the ultimate rejection of the King)
--        Extras: none warranted
--        Tanakh: 1 Samuel 10:19 (ye have this day rejected your Elohim); 1 Samuel 12:12 (Yahuah Elohaychem was your king); Hosea 13:10-11 (I gave thee a king in mine anger)
--   v.8 (forsaken me, served other gods since Egypt): Tanakh 1 Samuel 10:19 / 12:12 covered above; none new warranted
--   v.11-18 (the manner of the king who will TAKE — sons, daughters, fields, tenth, servants):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deuteronomy 17:16-17 (the king-law: not multiply horses/wives/silver — the very burdens foretold); 1 Samuel 12:17-19 (your wickedness is great in asking a king)
--   v.18 (ye shall cry out... Yahuah will not hear): folded into the manner-of-the-king thread
--
-- Threads (3):
--   1-samuel-8-they-have-not-rejected-thee-but-they-have-rejected-me        [free]  Tanakh(1Sam10,12; Hosea13) + NT(John19)
--   1-samuel-8-make-us-a-king-like-all-the-nations                         [free]  Tanakh(Deut17; Judges8) + NT(Acts13)
--   1-samuel-8-the-manner-of-the-king-that-shall-reign-the-king-who-takes  [free]  Tanakh(Deut17; 1Sam12)
--
-- Christology note: the King they reject in 8:7 is Yahuah the Formed Son — Yashar'el's true reigning King
--   (1 Sam 12:12 Yahuah Elohaychem WAS your king; Judges 8:23 Yahuah shall rule over you) — who HAS a Father,
--   not a co-equal-trinity person, not Arian. John 19:15 is the same rejection consummated in the flesh.

CREATE TEMP VIEW _s340_1sa08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: they have rejected ME (8:7) — the rejection of Yahuah's own kingship
    ('canon','1-samuel',8,7,'canon','1-samuel',10,19,'free',
      E'*And ye have this day rejected your Elohim (God), who himself saved you out of all your adversities and your tribulations; and ye have said unto him, Nay, but set a king over us...* (1 Samuel 10:19). At Mizpeh Samuel names the demand for what Yahuah called it at *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7) — the King set aside is Yahuah Himself, the One who *saved you out of all your adversities*.'),
    ('canon','1-samuel',8,7,'canon','1-samuel',12,12,'free',
      E'*And when ye saw that Nahash the king of the children of Ammon came against you, ye said unto me, Nay; but a king shall reign over us: when Yahuah Elohaychem (the LORD your God) was your king* (1 Samuel 12:12). Samuel says plainly what 8:7 declared — *they have rejected me, that I should not reign over them*: Yahuah, the Formed Son who led Yashar''el (Israel), WAS already their reigning King, and they traded Him for a man.'),
    ('canon','1-samuel',8,7,'canon','hosea',13,10,'free',
      E'*I will be thy king: where is any other that may save thee in all thy cities? and thy judges of whom thou saidst, Give me a king and princes?* (Hosea 13:10). Generations later Yahuah throws the same demand back at the northern house — the very words of 8:7, *they have rejected me, that I should not reign over them* — for He alone is King and saviour.'),
    ('canon','1-samuel',8,7,'canon','hosea',13,11,'free',
      E'*I gave thee a king in mine anger, and took him away in my wrath* (Hosea 13:11). The granting of 8:7 was never blessing but judgment — *Hearken unto the voice of the people... for they have rejected me* — the king given in anger and removed in wrath.'),
    ('canon','1-samuel',8,7,'canon','john',19,15,'free',
      E'*But they cried out, Away with him, away with him, crucify him. Pilate saith unto them, Shall I crucify your King? The chief priests answered, We have no king but Caesar* (John 19:15). The rejection of 8:7 — *they have rejected me, that I should not reign over them* — reaches its end when the Formed Son stands among His people in the flesh and they choose Caesar over Yahuah their King.'),

    -- Thread 2: a king like all the nations (8:5,20) vs the king-law (Deut 17) and Gideon's refusal
    ('canon','1-samuel',8,5,'canon','deuteronomy',17,14,'free',
      E'*When thou art come unto the land which Yahuah Elohayka (the LORD thy God) giveth thee... and shalt say, I will set a king over me, like as all the nations that are about me* (Deuteronomy 17:14). The elders'' demand — *make us a king to judge us like all the nations* (1 Samuel 8:5) — quotes the Torah word for word; the sin is not the office but the heart, wanting a king *like all the nations* rather than the King Yahuah would choose.'),
    ('canon','1-samuel',8,5,'canon','deuteronomy',17,15,'free',
      E'*Thou shalt in any wise set him king over thee, whom Yahuah Elohayka (the LORD thy God) shall choose: one from among thy brethren shalt thou set king over thee: thou mayest not set a stranger over thee, which is not thy brother* (Deuteronomy 17:15). The Torah''s king is Yahuah''s choice and a brother — the opposite of *like all the nations* (1 Samuel 8:5), a king demanded by the people for themselves.'),
    ('canon','1-samuel',8,5,'canon','judges',8,23,'free',
      E'*And Gideon said unto them, I will not rule over you, neither shall my son rule over you: Yahuah (LORD) shall rule over you* (Judges 8:23). A generation before, offered a dynasty, Gideon names the truth the elders forget at *make us a king to judge us like all the nations* (1 Samuel 8:5): Yahuah Himself is Yashar''el''s (Israel''s) King.'),
    ('canon','1-samuel',8,20,'canon','acts',13,21,'free',
      E'*And afterward they desired a king: and Elohim (God) gave unto them Saul the son of Cis, a man of the tribe of Benjamin, by the space of forty years* (Acts 13:21). Paul rehearses the demand of *that we also may be like all the nations; and that our king may judge us, and go out before us, and fight our battles* (1 Samuel 8:20) — the people''s desire, granted as Yahuah foretold.'),

    -- Thread 3: the manner of the king who will TAKE (8:11-18) vs the king-law's limits
    ('canon','1-samuel',8,11,'canon','deuteronomy',17,16,'free',
      E'*But he shall not multiply horses to himself, nor cause the people to return to Egypt, to the end that he should multiply horses...* (Deuteronomy 17:16). The very burdens Samuel foretells — *He will take your sons... for his chariots, and to be his horsemen* (1 Samuel 8:11) — are what the Torah''s king-law forbade; the king *like all the nations* breaks every limit Yahuah set.'),
    ('canon','1-samuel',8,17,'canon','deuteronomy',17,17,'free',
      E'*Neither shall he multiply wives to himself, that his heart turn not away: neither shall he greatly multiply to himself silver and gold* (Deuteronomy 17:17). Against this the demanded king *will take the tenth of your sheep: and ye shall be his servants* (1 Samuel 8:17) — the taking, multiplying king the Torah expressly warned against.'),
    ('canon','1-samuel',8,18,'canon','1-samuel',12,17,'free',
      E'*Is it not wheat harvest to day? I will call unto Yahuah (LORD), and he shall send thunder and rain; that ye may perceive and see that your wickedness is great, which ye have done in the sight of Yahuah (LORD), in asking you a king* (1 Samuel 12:17). The cry foretold in *ye shall cry out in that day because of your king which ye shall have chosen you; and Yahuah (LORD) will not hear you* (1 Samuel 8:18) begins at the coronation, where Samuel calls down thunder to expose the great wickedness of the demand.'),
    ('canon','1-samuel',8,18,'canon','1-samuel',12,19,'free',
      E'*And all the people said unto Samuel... we have added unto all our sins this evil, to ask us a king* (1 Samuel 12:19). The dread of *ye shall cry out in that day because of your king* (1 Samuel 8:18) breaks upon the people at last — they confess the asking of a king as evil added to all their sins.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-8-they-have-not-rejected-thee-but-they-have-rejected-me',
       E'They have not rejected thee, but they have rejected me',
       E'When Yashar''el (Israel) demands a king, Yahuah answers Samuel: *Hearken unto the voice of the people in all that they say unto thee: for they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). The King set aside is Yahuah Himself — the Formed Son who led Yashar''el out of Egypt — not Samuel. Samuel says it twice more: *ye have this day rejected your Elohim (God), who himself saved you out of all your adversities... and ye have said unto him, Nay, but set a king over us* (1 Samuel 10:19), and *ye said unto me, Nay; but a king shall reign over us: when Yahuah Elohaychem (the LORD your God) was your king* (1 Samuel 12:12). The granting was judgment, not gift: to the northern house Yahuah later says *I will be thy king: where is any other that may save thee?* (Hosea 13:10) and *I gave thee a king in mine anger, and took him away in my wrath* (Hosea 13:11). The rejection runs its full course when the Formed Son stands among His own in the flesh and the chief priests answer Pilate, *We have no king but Caesar* (John 19:15) — the same King set aside, the same words made final.',
       sv.verse_id, ev.verse_id, 'free', 36575
  FROM _s340_1sa08_lookup sv, _s340_1sa08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-8-make-us-a-king-like-all-the-nations',
       E'Make us a king like all the nations',
       E'The elders frame their demand in the Torah''s own words: *make us a king to judge us like all the nations* (1 Samuel 8:5), echoed at *that we also may be like all the nations; and that our king may judge us, and go out before us, and fight our battles* (1 Samuel 8:20). The king-law had anticipated this very moment — *I will set a king over me, like as all the nations that are about me* (Deuteronomy 17:14) — yet bound it: *Thou shalt in any wise set him king over thee, whom Yahuah Elohayka (the LORD thy God) shall choose: one from among thy brethren shalt thou set king over thee* (Deuteronomy 17:15). The Torah''s king is Yahuah''s choice and a brother; the elders want a king *like all the nations* of their own demanding. Gideon had already named the truth they forget, refusing a dynasty: *I will not rule over you, neither shall my son rule over you: Yahuah (LORD) shall rule over you* (Judges 8:23). Paul rehearses the whole episode: *they desired a king: and Elohim (God) gave unto them Saul the son of Cis, a man of the tribe of Benjamin* (Acts 13:21).',
       sv.verse_id, ev.verse_id, 'free', 36578
  FROM _s340_1sa08_lookup sv, _s340_1sa08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=8 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-8-the-manner-of-the-king-that-shall-reign-the-king-who-takes',
       E'The manner of the king — the king who takes',
       E'Samuel sets the cost before them: *This will be the manner of the king that shall reign over you: He will take your sons... for his chariots, and to be his horsemen* (1 Samuel 8:11), down to *He will take the tenth of your sheep: and ye shall be his servants* (1 Samuel 8:17). The verb is *take* — sons, daughters, fields, vineyards, the tenth, the servants. These are precisely the excesses the king-law forbade: *he shall not multiply horses to himself, nor cause the people to return to Egypt* (Deuteronomy 17:16), and *neither shall he multiply wives to himself... neither shall he greatly multiply to himself silver and gold* (Deuteronomy 17:17). The king *like all the nations* breaks every limit Yahuah set. And Samuel foretells the cry: *ye shall cry out in that day because of your king which ye shall have chosen you; and Yahuah (LORD) will not hear you in that day* (1 Samuel 8:18) — a cry that begins at the very coronation, when Samuel calls down thunder *that ye may perceive and see that your wickedness is great... in asking you a king* (1 Samuel 12:17), and the people confess, *we have added unto all our sins this evil, to ask us a king* (1 Samuel 12:19).',
       sv.verse_id, ev.verse_id, 'free', 36581
  FROM _s340_1sa08_lookup sv, _s340_1sa08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=8 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: they have rejected me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (8,7,'canon','1-samuel',10,19,1,E'*ye have this day rejected your Elohim (God)... and ye have said unto him, Nay, but set a king over us* (1 Samuel 10:19) — Samuel names the demand for what 8:7 called it.'),
    (8,7,'canon','1-samuel',12,12,2,E'*a king shall reign over us: when Yahuah Elohaychem (the LORD your God) was your king* (1 Samuel 12:12) — Yahuah, the Formed Son, was already their reigning King.'),
    (8,7,'canon','hosea',13,10,3,E'*I will be thy king: where is any other that may save thee?* (Hosea 13:10) — the same charge thrown back at the northern house.'),
    (8,7,'canon','hosea',13,11,4,E'*I gave thee a king in mine anger, and took him away in my wrath* (Hosea 13:11) — the granting was judgment, not blessing.'),
    (8,7,'canon','john',19,15,5,E'*We have no king but Caesar* (John 19:15) — the rejection of 8:7 consummated when the King stands in the flesh.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-8-they-have-not-rejected-thee-but-they-have-rejected-me'
  JOIN _s340_1sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s340_1sa08_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: a king like all the nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (8,5,'canon','deuteronomy',17,14,1,E'*I will set a king over me, like as all the nations that are about me* (Deuteronomy 17:14) — the elders quote the king-law word for word.'),
    (8,5,'canon','deuteronomy',17,15,2,E'*whom Yahuah Elohayka (the LORD thy God) shall choose: one from among thy brethren* (Deuteronomy 17:15) — Yahuah''s choice, a brother, not a king *like all the nations*.'),
    (8,5,'canon','judges',8,23,3,E'*I will not rule over you... Yahuah (LORD) shall rule over you* (Judges 8:23) — Gideon names the King the elders forget.'),
    (8,20,'canon','acts',13,21,4,E'*they desired a king: and Elohim (God) gave unto them Saul* (Acts 13:21) — Paul rehearses the demand of 8:20.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-8-make-us-a-king-like-all-the-nations'
  JOIN _s340_1sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s340_1sa08_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the manner of the king who takes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (8,11,'canon','deuteronomy',17,16,1,E'*he shall not multiply horses to himself, nor cause the people to return to Egypt* (Deuteronomy 17:16) — the chariots-and-horsemen the king will take, forbidden by the Torah.'),
    (8,17,'canon','deuteronomy',17,17,2,E'*neither shall he greatly multiply to himself silver and gold* (Deuteronomy 17:17) — against the taking, multiplying king.'),
    (8,18,'canon','1-samuel',12,17,3,E'*your wickedness is great... in asking you a king* (1 Samuel 12:17) — the foretold cry begins at the coronation under thunder.'),
    (8,18,'canon','1-samuel',12,19,4,E'*we have added unto all our sins this evil, to ask us a king* (1 Samuel 12:19) — the people confess at last.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-8-the-manner-of-the-king-that-shall-reign-the-king-who-takes'
  JOIN _s340_1sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s340_1sa08_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_9.sql (1 Samuel 9) -----
-- 1 Samuel 9 — Saul son of Kish sought, found, and set in the chief place; the seer Samuel;
-- Yahuah's hidden providence ordering the lost asses unto the kingdom.
-- TAG: 1sa09   VIEW: _s340_1sa09_lookup   SORT BAND: 36600, step 3 (36600,36603,36606)
--
-- 1 Samuel 9 coverage:
--   v.1   NT: none warranted | Extras: none warranted | Tanakh: none warranted (genealogy of Kish)
--   v.2   (Saul a choice young man, from his shoulders and upward higher than any of the people)
--         NT:     none warranted
--         Extras: none warranted (Jasher weighed — no clean non-noise witness for this beat)
--         Tanakh: 1Sam 10:23-24 (higher than any, See whom Yahuah hath chosen); 1Sam 16:7
--                 (Yahuah looketh on the heart); 1Sam 8:5,7 (a king like the nations = rejected me)
--                 -> THREAD 1
--   v.3-5 NT: none warranted | Extras: none warranted | Tanakh: feeds THREAD 3 (the lost asses)
--   v.6   (a man of Elohim; all that he saith cometh surely to pass)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: Deut 18:22 (the prophet's word that comes to pass) -> THREAD 2
--   v.9   (the Seer / he that is now called a Prophet was beforetime called a Seer)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: Deut 18:18 (a Prophet... I will put my words in his mouth) -> THREAD 2
--   v.11-14 NT: none | Extras: none | Tanakh: none warranted (the maidens, the high place)
--   v.15  (Yahuah had told Samuel in his ear a day before Saul came)
--   v.16  (I will send thee a man... thou shalt anoint him to be captain over my people)
--   v.17  (Behold the man whom I spake to thee of! this same shall reign over my people)
--   v.20  (the lost asses are found; on whom is all the desire of Yashar'el?)
--         NT:     Acts 13:21 (Elohim gave unto them Saul the son of Cis, of the tribe of Benjamin)
--         Extras: none warranted
--         Tanakh: Prov 16:9 (a man's heart deviseth his way, but Yahuah directeth his steps);
--                 Prov 16:33 (the lot is cast, but the whole disposing is of Yahuah);
--                 Gen 24:27 (I being in the way, Yahuah led me) -> THREAD 3
--   v.21  (Am not I a Benjamite, of the smallest of the tribes?) -> folds into THREAD 1
--   v.22-27 NT: none | Extras: none | Tanakh: none warranted (the parlour, the shoulder, the word of Elohim)
--
-- THREADS:
--   1 1-samuel-9-saul-higher-from-his-shoulders-the-king-the-people-saw   [Tanakh; free]
--   2 1-samuel-9-the-seer-the-man-of-elohim-whose-word-comes-to-pass       [Tanakh; free]
--   3 1-samuel-9-told-in-his-ear-the-hidden-hand-that-ordered-the-lost-asses [Tanakh + NT; free]
-- All members canon -> every thread tier_required 'free'.

CREATE TEMP VIEW _s340_1sa09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — the king the people chose by sight
    ('canon','1-samuel',9,2,'canon','1-samuel',10,23,'free',
     E'*And they ran and fetched him thence: and when he stood among the people, he was higher than any of the people from his shoulders and upward* (1 Samuel 10:23). The very mark that named Saul in 9:2 — *from his shoulders and upward he was higher than any of the people* — is the mark the crowd will gaze on at his presentation. The king is measured to the eye before ever a word of his heart is heard.'),
    ('canon','1-samuel',9,2,'canon','1-samuel',10,24,'free',
     E'*And Samuel said to all the people, See ye him whom Yahuah (LORD) hath chosen, that there is none like him among all the people? And all the people shouted, and said, Elohim (God) save the king* (1 Samuel 10:24). The *goodlier person than he* of 9:2 is set before all Yashar''el (Israel) and they shout for the man they can see. This is the king the people demanded — chosen to their sight, granted to their cry.'),
    ('canon','1-samuel',9,2,'canon','1-samuel',16,7,'free',
     E'*But Yahuah (LORD) said unto Samuel, Look not on his countenance, or on the height of his stature; because I have refused him: for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart* (1 Samuel 16:7). Here is the deliberate contrast the whole book draws: Saul is *higher than any of the people* (9:2), and at the next anointing Yahuah refuses the tall son Eliab and warns Samuel off *the height of his stature*. The people''s eye fastens on the shoulders; Yahuah weighs the heart.'),
    ('canon','1-samuel',9,2,'canon','1-samuel',8,5,'free',
     E'*And said unto him, Behold, thou art old, and thy sons walk not in thy ways: now make us a king to judge us like all the nations* (1 Samuel 8:5). Saul the *choice young man* of 9:2 is the answer to this demand — a king *like all the nations*, sought and measured the way the nations measure, by stature and bearing. The reader meets the man the people asked for.'),
    ('canon','1-samuel',9,2,'canon','1-samuel',8,7,'free',
     E'*And Yahuah (LORD) said unto Samuel, Hearken unto the voice of the people in all that they say unto thee: for they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). Behind the tall *goodly* young man of 9:2 stands this verdict: in demanding a king to the eye, Yashar''el (Israel) had rejected the reign of Yahuah himself. Saul''s very height is the shape of that rejection granted.'),

    -- THREAD 2 — the seer, the man of Elohim whose word comes to pass
    ('canon','1-samuel',9,6,'canon','deuteronomy',18,22,'free',
     E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him* (Deuteronomy 18:22). The servant''s testimony of the man of Elohim (God) — *all that he saith cometh surely to pass* (9:6) — is Torah''s own test of the true prophet sounded back: his word stands because it follows. Samuel is no diviner of the nations but the trustworthy mouth Moses promised.'),
    ('canon','1-samuel',9,9,'canon','deuteronomy',18,18,'free',
     E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). When 9:9 pauses to explain — *he that is now called a Prophet was beforetime called a Seer* — it names the very office Yahuah pledged through Moses: a brother who speaks the words put in his mouth. The Formed Word that spoke at Horeb is the same that *told Samuel in his ear* (9:15) and now speaks through the seer.'),

    -- THREAD 3 — Yahuah told Samuel in his ear: the hidden hand ordering the lost asses
    ('canon','1-samuel',9,15,'canon','proverbs',16,9,'free',
     E'*A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* (Proverbs 16:9). Saul set out only to find his father''s strayed asses, yet *Yahuah (LORD) had told Samuel in his ear a day before Saul came* (9:15). The young man devised a search for cattle; Yahuah directed every step of it toward a throne. The lost asses were the leash of providence.'),
    ('canon','1-samuel',9,20,'canon','proverbs',16,33,'free',
     E'*The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD)* (Proverbs 16:33). *As for thine asses that were lost three days ago, set not thy mind on them; for they are found* (9:20) — the small mishap that drove Saul to the seer was no chance. What looked like a wandering of beasts was the whole disposing of Yahuah, who had already named the man in Samuel''s ear.'),
    ('canon','1-samuel',9,17,'canon','genesis',24,27,'free',
     E'*And he said, Blessed be Yahuah Elohim (the LORD God) of my master Abraham, who hath not left destitute my master of his mercy and his truth: I being in the way, Yahuah (LORD) led me to the house of my master''s brethren* (Genesis 24:27). As Abraham''s servant, *being in the way*, was led unawares to the appointed woman at the well, so Saul *in the way* of the lost asses is brought to the very gate where *Yahuah (LORD) said unto him, Behold the man whom I spake to thee of! this same shall reign over my people* (9:17). The same hidden hand leads the servant to Rebekah and the seeker to the seer.'),
    ('canon','1-samuel',9,16,'canon','acts',13,21,'free',
     E'*And afterward they desired a king: and Elohim (God) gave unto them Saul the son of Cis, a man of the tribe of Benjamin, by the space of forty years* (Acts 13:21). Paul, retelling the history in the synagogue, fixes 9:16 — *I will send thee a man out of the land of Benjamin, and thou shalt anoint him to be captain over my people* — as the moment Elohim (God) *gave* the king the people desired. The man of Benjamin sent to Samuel''s door is the kingship granted in answer to their cry, before *he had removed him* and raised up David (Acts 13:22).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-9-saul-higher-from-his-shoulders-the-king-the-people-saw',
       E'Saul higher from his shoulders — the king the people saw',
       E'Yashar''el (Israel) had asked for *a king to judge us like all the nations* (1 Samuel 8:5), and the man the narrative now sets before us is measured to the eye: *a choice young man, and a goodly: and there was not among the children of Yashar''el (Israel) a goodlier person than he: from his shoulders and upward he was higher than any of the people* (1 Samuel 9:2). That same height becomes the public sign at his coronation — *when he stood among the people, he was higher than any of the people from his shoulders and upward* (1 Samuel 10:23) — and Samuel points to it: *See ye him whom Yahuah (LORD) hath chosen, that there is none like him among all the people?* (1 Samuel 10:24), and the people shout. This is the king chosen to their sight. The book itself answers it at the next anointing: *Look not on his countenance, or on the height of his stature... for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart* (1 Samuel 16:7). And under the whole demand lay Yahuah''s verdict — *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). Saul''s very shoulders are the shape of a kingship granted to the people''s eye.',
       sv.verse_id, ev.verse_id, 'free', 36600
  FROM _s340_1sa09_lookup sv, _s340_1sa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-9-the-seer-the-man-of-elohim-whose-word-comes-to-pass',
       E'The seer — the man of Elohim whose word comes to pass',
       E'Saul''s servant knows where to turn: *there is in this city a man of Elohim (God), and he is an honourable man; all that he saith cometh surely to pass* (1 Samuel 9:6). That single phrase is the Torah''s own test of a true prophet: *When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken... thou shalt not be afraid of him* (Deuteronomy 18:22). Samuel''s word stands because it follows — he is not a diviner of the nations but the trustworthy mouth Moses promised. The narrator even pauses to mark the office: *he that is now called a Prophet was beforetime called a Seer* (1 Samuel 9:9) — the very office Yahuah pledged: *I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The same Formed Word that put words in the seer''s mouth is the One who *told Samuel in his ear a day before Saul came* (1 Samuel 9:15).',
       sv.verse_id, ev.verse_id, 'free', 36603
  FROM _s340_1sa09_lookup sv, _s340_1sa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-9-told-in-his-ear-the-hidden-hand-that-ordered-the-lost-asses',
       E'Told in his ear — the hidden hand that ordered the lost asses',
       E'Saul left home only to recover his father''s strayed beasts. But the search was a leash: *Now Yahuah (LORD) had told Samuel in his ear a day before Saul came* (1 Samuel 9:15), and at the gate *Yahuah (LORD) said unto him, Behold the man whom I spake to thee of! this same shall reign over my people* (1 Samuel 9:17). What looked like the wandering of asses was the whole disposing of Yahuah: *A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* (Proverbs 16:9); *The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD)* (Proverbs 16:33). So Samuel can wave the lost cattle aside — *as for thine asses that were lost three days ago, set not thy mind on them; for they are found* (1 Samuel 9:20) — because they had already done their hidden work. It is the same pattern as Abraham''s servant, who could say, *I being in the way, Yahuah (LORD) led me to the house of my master''s brethren* (Genesis 24:27): the seeker is led unawares to the appointed place. And Paul names the outcome plainly — *they desired a king: and Elohim (God) gave unto them Saul the son of Cis, a man of the tribe of Benjamin* (Acts 13:21) — the man of Benjamin sent to the seer''s door (1 Samuel 9:16) is the kingship granted in answer to their cry.',
       sv.verse_id, ev.verse_id, 'free', 36606
  FROM _s340_1sa09_lookup sv, _s340_1sa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=9 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 10:23 — *higher than any of the people from his shoulders and upward*: the mark of 9:2 becomes the coronation sign.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=10 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-saul-higher-from-his-shoulders-the-king-the-people-saw'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 10:24 — *See ye him whom Yahuah hath chosen... and all the people shouted*: the king granted to the people''s eye.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=10 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-saul-higher-from-his-shoulders-the-king-the-people-saw'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 16:7 — *Yahuah looketh on the heart*: the deliberate contrast — refused for his height, the next king chosen by the heart.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-saul-higher-from-his-shoulders-the-king-the-people-saw'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Samuel 8:5 — *make us a king... like all the nations*: Saul is the answer to a demand measured the nations'' way.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-saul-higher-from-his-shoulders-the-king-the-people-saw'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Samuel 8:7 — *they have rejected me, that I should not reign over them*: the verdict beneath the tall king''s height.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-saul-higher-from-his-shoulders-the-king-the-people-saw'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 18:22 — *if the thing follow not, nor come to pass*: Torah''s test; the man of Elohim whose word *cometh surely to pass* (9:6) passes it.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-the-seer-the-man-of-elohim-whose-word-comes-to-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 18:18 — *a Prophet... I will put my words in his mouth*: the Seer/Prophet office of 9:9, the mouth Yahuah pledged through Moses.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-the-seer-the-man-of-elohim-whose-word-comes-to-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Proverbs 16:9 — *Yahuah directeth his steps*: Saul devised a hunt for asses; Yahuah, who *told Samuel in his ear* (9:15), aimed every step.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-told-in-his-ear-the-hidden-hand-that-ordered-the-lost-asses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Proverbs 16:33 — *the whole disposing thereof is of Yahuah*: the strayed asses of 9:20, no chance, but the appointed leash.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=20
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-told-in-his-ear-the-hidden-hand-that-ordered-the-lost-asses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 24:27 — *I being in the way, Yahuah led me*: Abraham''s servant led to Rebekah, as Saul *in the way* is led to *the man whom I spake to thee of* (9:17).'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-told-in-his-ear-the-hidden-hand-that-ordered-the-lost-asses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 13:21 — *Elohim gave unto them Saul the son of Cis, of the tribe of Benjamin*: the man sent from Benjamin (9:16) is the kingship granted to their cry.'
  FROM cross_reference_threads t
  JOIN _s340_1sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s340_1sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-9-told-in-his-ear-the-hidden-hand-that-ordered-the-lost-asses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_10.sql (1 Samuel 10) -----
-- Chapter: 1 Samuel 10 — Samuel anoints Saul, the first king of Yashar'el (Israel), with the vial of
-- oil: *Then Samuel took a vial of oil, and poured it upon his head, and kissed him, and said, Is it
-- not because Yahuah (LORD) hath anointed thee to be captain over his inheritance?* (10:1). The signs
-- are given (10:2-8); ★ *the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with
-- them, and shalt be turned into another man* (10:6), and *Elohim (God) gave him another heart* (10:9),
-- *and the Spirit of Elohim (God) came upon him, and he prophesied* (10:10). The people marvel: *Is Saul
-- also among the prophets?* (10:11-12). At Mizpeh Samuel rehearses the rejection — *ye have this day
-- rejected your Elohim (God)... and ye have said... set a king over us* (10:18-19); Saul is taken by lot
-- but *hath hid himself among the stuff* (10:22); set before the people, *all the people shouted, and
-- said, Elohim (God) save the king* (10:24); but *the children of Belial said, How shall this man save
-- us? And they despised him* (10:27). The anointing + the Spirit-upon-the-anointed weave FORWARD to the
-- true Anointed (Isaiah 11; Acts 13:21-22), the Spirit-empowered Son who is NOT a separate divine
-- person but the Ruach of Yahuah resting on the chosen.
-- Tag: 1sa10   Temp view: _s340_1sa10_lookup
-- Sort band: base 36625, step 3 -> threads at 36625, 36628, 36631, 36634 (4 threads)
-- Source of EVERY row: 'canon','1-samuel',10,v
--
-- 1 Samuel 10 coverage:
--   ★★ v.1 (Samuel anoints Saul with the vial of oil; captain over his inheritance)
--        NT:     ★★ Acts 13:21 (Elohim gave unto them Saul the son of Cis... a man of the tribe of Benjamin)
--        Extras: none warranted
--        Tanakh: ★★ 1 Samuel 9:16-17 (thou shalt anoint him to be captain over my people), ★★ 1 Samuel
--                16:13 (Samuel took the horn of oil, and anointed him... the Spirit of Yahuah came upon David),
--                ★★ Isaiah 11:1-2 (a Branch... the spirit of Yahuah shall rest upon him) — THREAD 1
--   ★★★ v.6, v.9-10 (the Spirit of Yahuah comes upon Saul; turned into another man; another heart;
--          prophesied among the prophets)
--        NT:     ★ Acts 2:17 (I will pour out of my Spirit upon all flesh... your sons and your daughters
--                shall prophesy)
--        Extras: none warranted
--        Tanakh: ★★ Judges 14:6 (the Spirit of Yahuah came mightily upon Samson), ★★ 1 Samuel 16:13 (the
--                Spirit of Yahuah came upon David from that day forward), ★★ Numbers 11:25 (the spirit
--                rested upon them, they prophesied), ★★ Numbers 11:29 (would Elohim that all the LORD'S
--                people were prophets, and that Yahuah would put his spirit upon them) — THREAD 2
--   ★ v.11-12 (Is Saul also among the prophets? — became a proverb)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★★ 1 Samuel 19:23-24 (the Spirit of Elohim was upon him also... Wherefore they say, Is Saul
--                also among the prophets?) — THREAD 3
--   ★★ v.18-19, v.24, v.27 (rejected your Elohim, set a king over us; Elohim save the king; sons of
--          Belial despised him)
--        NT:     ★ Acts 13:21 (afterward they desired a king: and Elohim gave unto them Saul)
--        Extras: none warranted
--        Tanakh: ★★★ 1 Samuel 8:7 (they have not rejected thee, but they have rejected me, that I should
--                not reign over them) — THREAD 4
--   v.2-5, v.7-8 (the three signs; Gilgal) — held in THREAD 1/2 prose (the confirming signs of the call)
--        NT: none warranted   Extras: none warranted   Tanakh: held in prose
--   v.13-17, v.20-23, v.25-26 (the proverb closes; Mizpeh; the lot; hidden among the stuff; the manner of
--          the kingdom written in a book) — held in THREAD 3/4 prose
--        NT: none warranted   Extras: none warranted   Tanakh: held in prose
--
-- Threads (slug — target libraries):
--   1. 1-samuel-10-anointed-to-be-captain-over-his-inheritance — NT (Acts 13) + Tanakh (1 Samuel 9, 1 Samuel 16, Isaiah 11) [free]
--      (★★ the vial of oil poured on the head; the anointed captain; forward to David and to the true Anointed)
--   2. 1-samuel-10-the-spirit-of-yahuah-came-upon-him-turned-into-another-man — NT (Acts 2) + Tanakh (Judges 14, 1 Samuel 16, Numbers 11) [free]
--      (★★★ the Spirit of Yahuah upon the chosen — NOT a separate divine person but the Ruach resting on the anointed)
--   3. 1-samuel-10-is-saul-also-among-the-prophets — Tanakh (1 Samuel 19) [free]
--      (★ the proverb born, and confirmed when the Spirit takes Saul again at Naioth)
--   4. 1-samuel-10-they-have-rejected-me-that-i-should-not-reign-set-a-king-over-us — NT (Acts 13) + Tanakh (1 Samuel 8) [free]
--      (★★ the king demanded is the rejection of Yahuah's kingship; Elohim save the king; the sons of Belial despise him)
--
-- Framing notes:
--   ★★ THE ANOINTED CAPTAIN (THREAD 1): the vial of oil poured on the head sets apart the first king of
--      Yashar'el — *Is it not because Yahuah (LORD) hath anointed thee to be captain over his inheritance?*
--      (10:1) — fulfilling the word given in Samuel's ear, *thou shalt anoint him to be captain over my
--      people Yashar'el (Israel)* (9:16). The same horn anoints David (16:13), and Paul recaps the whole
--      arc — *Elohim (God) gave unto them Saul the son of Cis* (Acts 13:21). The anointing reaches its
--      term in the Branch of Jesse on whom *the spirit of Yahuah (LORD) shall rest* (Isaiah 11:1-2): the
--      true Anointed of whom Saul is the first, failing shadow.
--   ★★★ THE SPIRIT UPON THE CHRIST-OLOGY (THREAD 2): *the Spirit of Yahuah (LORD) will come upon thee...
--      and shalt be turned into another man* (10:6); *Elohim (God) gave him another heart* (10:9); *the
--      Spirit of Elohim (God) came upon him, and he prophesied* (10:10). This is the Ruach of Yahuah — the
--      SAME Spirit that came mightily upon Samson (Judges 14:6), upon David (1 Samuel 16:13), upon the
--      seventy elders (Numbers 11:25) — resting on the chosen vessel, NOT a separate co-equal divine
--      person. Moses' longing — *would Elohim (God) that all the LORD'S people were prophets, and that
--      Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29) — is the trajectory the NT names at
--      Shavuot: *I will pour out of my Spirit upon all flesh* (Acts 2:17). The Father's one Spirit on the
--      anointed, never a second God.
--   ★ THE PROVERB (THREAD 3): *Is Saul also among the prophets?* (10:11-12) becomes a proverb in Yashar'el,
--      and is confirmed at the chapter's far echo when the Spirit takes Saul again at Naioth and *they say,
--      Is Saul also among the prophets?* (1 Samuel 19:24) — the Spirit's sovereignty over even the rejected
--      king.
--   ★★ THE KING DEMANDED = YAHUAH REJECTED (THREAD 4): Samuel names it plainly — *ye have this day rejected
--      your Elohim (God), who himself saved you... and ye have said unto him, Nay, but set a king over us*
--      (10:18-19), the same charge of chapter 8: *they have not rejected thee, but they have rejected me,
--      that I should not reign over them* (8:7). Yet Yahuah grants the king and the people shout *Elohim
--      (God) save the king* (10:24); only *the children of Belial* despise him (10:27). Paul records it as
--      the people's own desire — *they desired a king: and Elohim (God) gave unto them Saul* (Acts 13:21).
--   VERSES WITH NO SEPARATE ADD: v.2-5,7-8 (the confirming signs; Gilgal — held in THREAD 1/2 prose);
--      v.13-17,20-23,25-26 (the proverb's close; Mizpeh; the lot; hidden among the stuff; the kingdom
--      written in a book — held in THREAD 3/4 prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s340_1sa10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): anointed to be captain over his inheritance
    ('canon','1-samuel',10,1,'canon','1-samuel',9,16,'free',
      E'*To morrow about this time I will send thee a man out of the land of Benjamin, and thou shalt anoint him to be captain over my people Yashar''el (Israel), that he may save my people out of the hand of the Philistines: for I have looked upon my people, because their cry is come unto me* (1 Samuel 9:16). The vial poured on Saul''s head — *Is it not because Yahuah (LORD) hath anointed thee to be captain over his inheritance?* (1 Samuel 10:1) — performs the very word Yahuah spoke in Samuel''s ear the day before. The anointing is no man''s choosing: Yahuah names the captain over His own inheritance.'),
    ('canon','1-samuel',10,1,'canon','1-samuel',16,13,'free',
      E'*Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). The same prophet, the same oil, the same Spirit-upon-the-anointed — *Then Samuel took a vial of oil, and poured it upon his head* (1 Samuel 10:1). Saul is the first anointed king and David the second; the oil that sets Saul apart for the throne is the pattern fulfilled in the man after Yahuah''s own heart, the seed from whom the true Anointed comes.'),
    ('canon','1-samuel',10,1,'canon','isaiah',11,2,'free',
      E'*And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD)* (Isaiah 11:2). Saul anointed *captain over his inheritance* (1 Samuel 10:1) is the first, failing shadow of the Branch out of the stem of Jesse on whom the Spirit *shall rest* without measure. The kingship begun here in oil and Spirit reaches its term in the true Anointed who will not be turned aside.'),
    ('canon','1-samuel',10,1,'canon','acts',13,21,'free',
      E'*And afterward they desired a king: and Elohim (God) gave unto them Saul the son of Cis, a man of the tribe of Benjamin, by the space of forty years* (Acts 13:21). Paul, recapping Yashar''el (Israel)''s history in the synagogue at Antioch, names the very moment of 1 Samuel 10 — Saul *the son of Kish*, of *the border of Benjamin* (10:2), given the kingdom. The anointing of *captain over his inheritance* (10:1) is the head of the line Paul traces straight to David and to *Yahusha (Jesus)... a Saviour* (Acts 13:23).')
,
    -- THREAD 2 (★★★): the Spirit of Yahuah came upon him, turned into another man
    ('canon','1-samuel',10,6,'canon','judges',14,6,'free',
      E'*And the Spirit of Yahuah (LORD) came mightily upon him, and he rent him as he would have rent a kid, and he had nothing in his hand* (Judges 14:6). The Spirit that empowers Samson against the lion is the same Ruach promised to Saul — *the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man* (1 Samuel 10:6). One Spirit of Yahuah, coming upon the chosen vessel for the work appointed: never a second God, but the Father''s own Spirit resting on the man He raises up.'),
    ('canon','1-samuel',10,6,'canon','1-samuel',16,13,'free',
      E'*And the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). The very words spoken over Saul — *the Spirit of Yahuah (LORD) will come upon thee... and shalt be turned into another man* (1 Samuel 10:6) — fall on David at his anointing. The Spirit of Yahuah is one and the same, given to whom Yahuah chooses; what comes upon Saul and departs (16:14) rests on David *from that day forward*.'),
    ('canon','1-samuel',10,9,'canon','numbers',11,25,'free',
      E'*And Yahuah (LORD) came down in a cloud, and spake unto him, and took of the spirit that was upon him, and gave it unto the seventy elders: and it came to pass, that, when the spirit rested upon them, they prophesied, and did not cease* (Numbers 11:25). As the seventy *prophesied* when the spirit rested on them, so *Elohim (God) gave* Saul *another heart* (1 Samuel 10:9) and the Spirit made him prophesy. It is the one Spirit of Yahuah, taken and given, resting where He wills — the Father''s Ruach upon men, not a separate divine person beside Him.'),
    ('canon','1-samuel',10,10,'canon','numbers',11,29,'free',
      E'*And Moses said unto him, Enviest thou for my sake? would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29). Moses'' longing — that Yahuah would *put his spirit* upon all His people — is glimpsed in Saul: *the Spirit of Elohim (God) came upon him, and he prophesied among them* (1 Samuel 10:10). The Spirit poured on one anointed head points to the day the Father pours His Spirit on all flesh.'),
    ('canon','1-samuel',10,10,'canon','acts',2,17,'free',
      E'*And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams* (Acts 2:17). The Spirit that comes upon Saul so that *he prophesied among them* (1 Samuel 10:10) is the same Spirit of Yahuah poured out at Shavuot upon all flesh. Moses'' wish (Numbers 11:29) and Saul''s prophesying are the seed of the Father''s one Spirit given to His whole people — never a rival deity, but Yahuah putting His Ruach where He wills.')
,
    -- THREAD 3 (★): Is Saul also among the prophets?
    ('canon','1-samuel',10,11,'canon','1-samuel',19,24,'free',
      E'*And he stripped off his clothes also, and prophesied before Samuel in like manner, and lay down naked all that day and all that night. Wherefore they say, Is Saul also among the prophets?* (1 Samuel 19:24). The proverb born here — *Is Saul also among the prophets?* (1 Samuel 10:11) — is sealed at the chapter''s far echo, when Saul, hunting David, is himself overtaken by the Spirit of Elohim (God) at Naioth. The Spirit of Yahuah is sovereign even over the king He has rejected; the same wonder is repeated and the proverb fixed in Yashar''el (Israel).')
,
    -- THREAD 4 (★★): they have rejected me; set a king over us
    ('canon','1-samuel',10,19,'canon','1-samuel',8,7,'free',
      E'*And Yahuah (LORD) said unto Samuel, Hearken unto the voice of the people in all that they say unto thee: for they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). At Mizpeh Samuel names the people''s sin in Yahuah''s own words — *ye have this day rejected your Elohim (God), who himself saved you out of all your adversities... and ye have said unto him, Nay, but set a king over us* (1 Samuel 10:19). The demand for a king *like all the nations* is the rejection of Yahuah''s own kingship; the throne Saul receives is the measure of how far the people have turned.'),
    ('canon','1-samuel',10,24,'canon','acts',13,21,'free',
      E'*And afterward they desired a king: and Elohim (God) gave unto them Saul the son of Cis, a man of the tribe of Benjamin, by the space of forty years* (Acts 13:21). When *all the people shouted, and said, Elohim (God) save the king* (1 Samuel 10:24), they hail the king they themselves *desired*. Paul names it as the people''s own asking and Yahuah''s granting; the *forty years* of Saul are the gift withheld in mercy and given in judgment, the line Paul traces on to David and to the promised Saviour (Acts 13:22-23).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-10-anointed-to-be-captain-over-his-inheritance',
       E'Anointed to be captain over his inheritance — the vial of oil and the line of the Anointed',
       E'Samuel pours the vial of oil on the head of the first king of Yashar''el (Israel) and kisses him: *Then Samuel took a vial of oil, and poured it upon his head, and kissed him, and said, Is it not because Yahuah (LORD) hath anointed thee to be captain over his inheritance?* (1 Samuel 10:1). The anointing is no man''s choosing — it performs the word Yahuah had already spoken in Samuel''s ear: *thou shalt anoint him to be captain over my people Yashar''el (Israel), that he may save my people out of the hand of the Philistines* (9:16). The same prophet, the same oil, will soon anoint David — *Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (16:13) — and the kingship begun here in oil and Spirit reaches its term in the Branch out of the stem of Jesse on whom *the spirit of Yahuah (LORD) shall rest, the spirit of wisdom and understanding, the spirit of counsel and might* (Isaiah 11:2). Paul, rehearsing the history in the synagogue at Antioch, names this very moment — *they desired a king: and Elohim (God) gave unto them Saul the son of Cis, a man of the tribe of Benjamin* (Acts 13:21) — the head of the line he traces straight on to David and to *Yahusha (Jesus)... a Saviour* (Acts 13:23). Saul, anointed captain over Yahuah''s inheritance, is the first and failing shadow of the true Anointed.',
       sv.verse_id, ev.verse_id, 'free', 36625
  FROM _s340_1sa10_lookup sv, _s340_1sa10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-10-the-spirit-of-yahuah-came-upon-him-turned-into-another-man',
       E'The Spirit of Yahuah came upon him, turned into another man — the one Ruach upon the chosen',
       E'The sign that seals the call is the Spirit: *And the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man* (1 Samuel 10:6); and so it came — *Elohim (God) gave him another heart* (10:9), *and the Spirit of Elohim (God) came upon him, and he prophesied among them* (10:10). This is the Ruach of Yahuah, the SAME Spirit that came *mightily* upon Samson against the lion (Judges 14:6), that *came upon David from that day forward* (1 Samuel 16:13), that Yahuah *took of the spirit that was upon* Moses and *gave it unto the seventy elders... and they prophesied* (Numbers 11:25). It is the Father''s one Spirit, taken and given and resting where He wills upon the vessel He raises up — never a separate, co-equal divine person standing beside Him. Moses had longed for the day it would fall on all: *would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29) — and the apostles name that day at Shavuot: *I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy* (Acts 2:17). The Spirit poured on Saul''s one anointed head, turning him into another man, is the seed of the Father''s Ruach poured out on all His people; the Spirit and the chosen are joined, but the Spirit is Yahuah''s own, not a second God.',
       sv.verse_id, ev.verse_id, 'free', 36628
  FROM _s340_1sa10_lookup sv, _s340_1sa10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-10-is-saul-also-among-the-prophets',
       E'Is Saul also among the prophets? — the proverb born and sealed',
       E'The townsfolk who knew Saul before are astonished to see him caught up among the prophets: *when all that knew him beforetime saw that, behold, he prophesied among the prophets, then the people said one to another, What is this that is come unto the son of Kish? Is Saul also among the prophets?* (1 Samuel 10:11); *Therefore it became a proverb, Is Saul also among the prophets?* (10:12). The proverb is sealed at the chapter''s far echo, when Saul, now the rejected king hunting David to kill him, is himself overtaken by the Spirit at Naioth: *And the Spirit of Elohim (God) was upon him also, and he went on, and prophesied... And he stripped off his clothes also, and prophesied before Samuel in like manner, and lay down naked all that day and all that night. Wherefore they say, Is Saul also among the prophets?* (1 Samuel 19:23-24). The Spirit of Yahuah is sovereign even over the king He has set aside — the same wonder repeated, the proverb fixed in Yashar''el (Israel).',
       sv.verse_id, ev.verse_id, 'free', 36631
  FROM _s340_1sa10_lookup sv, _s340_1sa10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-10-they-have-rejected-me-that-i-should-not-reign-set-a-king-over-us',
       E'They have rejected me, set a king over us — Yahuah''s kingship refused, the king granted',
       E'At Mizpeh Samuel gathers the tribes and lays the charge in Yahuah''s own words: *I brought up Yashar''el (Israel) out of Egypt, and delivered you out of the hand of the Egyptians... And ye have this day rejected your Elohim (God), who himself saved you out of all your adversities and your tribulations; and ye have said unto him, Nay, but set a king over us* (1 Samuel 10:18-19). This is the verdict already spoken when the people first demanded a king *like all the nations*: *they have not rejected thee, but they have rejected me, that I should not reign over them* (8:7). The demand for a throne is the rejection of Yahuah''s own kingship. Yet Yahuah grants it — Saul is taken by lot, found where *he hath hid himself among the stuff* (10:22), set before the people a head taller than any, and *all the people shouted, and said, Elohim (God) save the king* (10:24). Only *the children of Belial said, How shall this man save us? And they despised him, and brought him no presents* (10:27). Paul records the whole transaction as the people''s own desire and Yahuah''s granting: *afterward they desired a king: and Elohim (God) gave unto them Saul the son of Cis... by the space of forty years* (Acts 13:21) — the king given in mercy and in judgment, before the LORD raised up David, the man after His own heart (Acts 13:22).',
       sv.verse_id, ev.verse_id, 'free', 36634
  FROM _s340_1sa10_lookup sv, _s340_1sa10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=10 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt anoint him to be captain over my people Yashar''el (Israel)* (1 Samuel 9:16) — the vial poured on Saul''s head (1 Samuel 10:1) performs the word Yahuah spoke in Samuel''s ear; the captain is Yahuah''s naming.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=9 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-anointed-to-be-captain-over-his-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Samuel took the horn of oil, and anointed him... and the Spirit of Yahuah (LORD) came upon David* (1 Samuel 16:13) — the same prophet, oil, and Spirit-upon-the-anointed as Saul''s vial (1 Samuel 10:1); Saul first, David the man after Yahuah''s heart.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-anointed-to-be-captain-over-his-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the spirit of Yahuah (LORD) shall rest upon him* (Isaiah 11:2) — Saul anointed *captain over his inheritance* (1 Samuel 10:1) is the failing shadow of the Branch of Jesse, the true Anointed on whom the Spirit rests without measure.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-anointed-to-be-captain-over-his-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *they desired a king: and Elohim (God) gave unto them Saul the son of Cis, a man of the tribe of Benjamin* (Acts 13:21) — Paul names this very anointing (1 Samuel 10:1) as the head of the line he traces on to David and to Yahusha (Jesus) the Saviour.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-anointed-to-be-captain-over-his-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the Spirit of Yahuah (LORD) came mightily upon him* (Judges 14:6) — the same Ruach that empowers Samson is promised to Saul: *the Spirit of Yahuah (LORD) will come upon thee... and shalt be turned into another man* (1 Samuel 10:6); one Spirit on the chosen vessel.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-the-spirit-of-yahuah-came-upon-him-turned-into-another-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13) — the very words spoken over Saul (1 Samuel 10:6) fall on David; one and the same Spirit of Yahuah, given to whom He chooses.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-the-spirit-of-yahuah-came-upon-him-turned-into-another-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the spirit rested upon them, they prophesied* (Numbers 11:25) — as the seventy prophesied, so *Elohim (God) gave* Saul *another heart* (1 Samuel 10:9); the one Spirit of Yahuah taken and given, resting where He wills.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=9
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-the-spirit-of-yahuah-came-upon-him-turned-into-another-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29) — Moses'' longing glimpsed in Saul prophesying (1 Samuel 10:10); the Spirit on one head points to the Spirit on all flesh.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-the-spirit-of-yahuah-came-upon-him-turned-into-another-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I will pour out of my Spirit upon all flesh... your sons and your daughters shall prophesy* (Acts 2:17) — the Spirit that made Saul prophesy (1 Samuel 10:10) poured out at Shavuot on all flesh; the Father''s one Ruach, never a rival deity.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-the-spirit-of-yahuah-came-upon-him-turned-into-another-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *prophesied before Samuel... Wherefore they say, Is Saul also among the prophets?* (1 Samuel 19:24) — the proverb born here (1 Samuel 10:11) is sealed when the Spirit overtakes the rejected king again at Naioth; the Spirit sovereign even over the king set aside.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=19 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-is-saul-also-among-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7) — Samuel''s Mizpeh charge (1 Samuel 10:19) speaks Yahuah''s own verdict: the demand for a king is the rejection of Yahuah''s kingship.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=19
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-they-have-rejected-me-that-i-should-not-reign-set-a-king-over-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they desired a king: and Elohim (God) gave unto them Saul... by the space of forty years* (Acts 13:21) — when the people shout *Elohim (God) save the king* (1 Samuel 10:24), Paul names it their own desire and Yahuah''s granting, before David is raised up.'
  FROM cross_reference_threads t
  JOIN _s340_1sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=10 AND sv.verse_number=24
  JOIN _s340_1sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-10-they-have-rejected-me-that-i-should-not-reign-set-a-king-over-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session340 — 1 Samuel cross-references complete.'
