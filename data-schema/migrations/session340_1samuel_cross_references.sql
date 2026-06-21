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


COMMIT;
\echo 'session340 — 1 Samuel cross-references complete.'
